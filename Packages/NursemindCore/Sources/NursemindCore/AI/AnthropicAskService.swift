import Foundation
import OSLog

private let askServiceLog = Logger(subsystem: "app.nursemind.ios", category: "AnthropicAskService")

/// Production AI co-pilot service. Implements the full pipeline:
///   PHI scrub → intent classify → RAG retrieve → generate → validate → stream.
///
/// On any reachability/auth/server failure, emits `.refusal(.serviceUnavailable)`
/// rather than falling back to canned mock content. The mock fallback was
/// removed because it silently substituted fixture answers for real ones in
/// the same UI treatment — a real safety risk for a clinical reference app.
/// Mock content is reserved for previews and tests; runtime failures show the
/// user an honest "can't reach the AI right now" card instead.
public final class AnthropicAskService: AskService, @unchecked Sendable {
    private let client: AnthropicClient
    private let classifier: IntentClassifier
    private let retriever: RAGRetriever
    private let validator: ResponseValidator

    public init(
        apiKey: String,
        registry: ContentRegistry = .shared,
        urlSession: URLSession = .shared
    ) {
        let client = AnthropicClient(apiKey: apiKey, urlSession: urlSession)
        self.client = client
        self.classifier = IntentClassifier(client: client)
        self.retriever = RAGRetriever(registry: registry)
        self.validator = ResponseValidator()
    }

    /// Production init — accepts a pre-configured `AnthropicClient` so the
    /// caller can decide between direct (DEBUG) and proxy (production) modes.
    public init(
        client: AnthropicClient,
        registry: ContentRegistry = .shared
    ) {
        self.client = client
        self.classifier = IntentClassifier(client: client)
        self.retriever = RAGRetriever(registry: registry)
        self.validator = ResponseValidator()
    }

    public func stream(
        question: String,
        conversationContext: [AskMessage],
        specialty: NursingSpecialty? = nil,
        icuSubspecialty: ICUSubspecialty? = nil
    ) -> AsyncThrowingStream<AskEvent, Error> {
        AsyncThrowingStream { continuation in
            Task {
                do {
                    // 1. Client-side PHI scrub (defense in depth — server-side scrubber is canonical)
                    let scrub = PHIScrubber.scrub(question)
                    if scrub.redacted {
                        continuation.yield(.phiNotice)
                    }

                    // 2. Intent classification (Haiku)
                    let intent = await classifier.classify(scrub.scrubbed)
                    if let refusal = intent.refusal {
                        continuation.yield(.refusal(refusal, citations: []))
                        continuation.yield(.done)
                        continuation.finish()
                        return
                    }

                    // 3. RAG retrieval — specialty (when active) re-ranks results
                    let rag = retriever.retrieve(for: scrub.scrubbed, limit: 5, specialty: specialty)
                    if rag.confidenceFloor || rag.entries.isEmpty {
                        continuation.yield(.refusal(.lowConfidence, citations: []))
                        continuation.yield(.done)
                        continuation.finish()
                        return
                    }

                    // 4. Build prompt — split into cached static prefix and
                    // dynamic suffix so Anthropic's prompt cache covers the
                    // ~1100-token rules block. The dynamic suffix carries
                    // USER CONTEXT, conversation history, and retrieved
                    // corpus, which all change per request.
                    //
                    // Read `careerStage` from UserPreferences on MainActor —
                    // tells the model whether to write at student vs. RN
                    // depth, per the prompt's "Adapt depth" directive.
                    let history = formatHistory(conversationContext)
                    let careerStage = await MainActor.run { UserPreferences.shared.role.displayName }
                    let dynamicSystem = SystemPrompt.buildDynamic(
                        retrievedContext: rag.formattedContext,
                        conversationHistory: history,
                        careerStage: careerStage,
                        units: [],
                        activeSpecialty: specialty,
                        icuSubspecialty: icuSubspecialty
                    )
                    let messages = [AnthropicClient.Message(role: "user", content: scrub.scrubbed)]

                    // 5. Emit citations FIRST so inline chips can resolve as the
                    // text streams in (chips show up immediately, not after stream ends).
                    continuation.yield(.citations(rag.citations))
                    let entryIDs = rag.entries.map { $0.id }
                    if !entryIDs.isEmpty {
                        continuation.yield(.libraryEntries(entryIDs))
                    }

                    // 6. Generate (streaming) with Haiku 4.5 + prompt caching
                    // on the static prefix. Haiku is ~3.3× cheaper than Sonnet
                    // per token and handles ~80% of NurseMind's traffic (drug
                    // lookups, lab values, single-protocol questions) with
                    // equivalent quality. The remaining ~20% (complex multi-
                    // step prioritization, long-context synthesis) is where
                    // Sonnet would win — flag reports + tier review surface
                    // those if they become a quality problem in production.
                    // Cache hits within the 5-minute TTL bill the prefix at
                    // ~10% of fresh input rates. Haiku's cache minimum is
                    // 2048 tokens (vs Sonnet's 1024); the static prefix is
                    // ~5K tokens so it clears.
                    var accumulated = ""
                    let stream = client.streamMessage(
                        model: .haiku45,
                        cachedSystem: SystemPrompt.staticPrefix,
                        dynamicSystem: dynamicSystem,
                        messages: messages,
                        maxTokens: 1024,
                        temperature: 0.2
                    )

                    for try await chunk in stream {
                        accumulated += chunk
                        continuation.yield(.delta(chunk))
                    }

                    // 7. Validate post-stream — log issues for the QA queue.
                    let validIDs = Set((1...rag.formattedContext.split(separator: "\n").count).map { String(format: "c%03d", $0) })
                    let result = validator.validate(accumulated, validCitationIDs: validIDs)
                    if !result.isValid {
                        for issue in result.issues {
                            askServiceLog.warning("Validation issue: \(issue, privacy: .public)")
                        }
                    }

                    continuation.yield(.done)
                    continuation.finish()
                } catch let clientError as AnthropicClient.ClientError {
                    // Typed Anthropic/proxy failures map to typed refusals so
                    // the UI shows the right card. Never fall back to canned
                    // mock content — that would render fixture answers in the
                    // same UI as a real response and could mislead a nurse.
                    if case let .requestFailed(status, _) = clientError, status == 429 {
                        continuation.yield(.refusal(.quotaExceeded, citations: []))
                    } else {
                        askServiceLog.error("API failure: \(clientError.localizedDescription, privacy: .public)")
                        continuation.yield(.refusal(.serviceUnavailable, citations: []))
                    }
                    continuation.yield(.done)
                    continuation.finish()
                } catch {
                    // Non-API error (cancelled task, decoding, etc.) — same
                    // refusal-not-mock treatment. The user gets an honest
                    // "can't reach AI" card; Library + Tools tabs still work.
                    askServiceLog.error("Pipeline failure: \(error.localizedDescription, privacy: .public)")
                    continuation.yield(.refusal(.serviceUnavailable, citations: []))
                    continuation.yield(.done)
                    continuation.finish()
                }
            }
        }
    }

    private func formatHistory(_ messages: [AskMessage]) -> String {
        if messages.isEmpty { return "(no prior turns)" }
        return messages.suffix(6).map { msg in
            let role = msg.role == .user ? "User" : "Assistant"
            return "\(role): \(msg.content)"
        }.joined(separator: "\n")
    }
}
