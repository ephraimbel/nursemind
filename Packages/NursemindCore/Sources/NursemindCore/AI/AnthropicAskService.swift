import Foundation
import OSLog

private let askServiceLog = Logger(subsystem: "app.nursemind.ios", category: "AnthropicAskService")

/// Production AI co-pilot service. Implements the full pipeline:
///   PHI scrub → local intent gate → RAG retrieve → generate (racing the
///   Haiku intent classifier in parallel) → validate → stream.
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
                // Haiku classifier races the generation stream instead of
                // gating it — see step 2 below. Held at function scope so
                // every exit path (success, refusal, throw) can cancel it.
                var classifierWatcher: Task<Void, Never>?
                defer { classifierWatcher?.cancel() }
                do {
                    // 1. Client-side PHI scrub (defense in depth — server-side scrubber is canonical)
                    let scrub = PHIScrubber.scrub(question)
                    if scrub.redacted {
                        continuation.yield(.phiNotice)
                    }

                    // 2. Intent classification. The Haiku classifier used to
                    // block here — a full proxy round trip (~1s) of dead air
                    // before generation could even start. Now: the local
                    // keyword classifier runs synchronously as the fast gate
                    // (catches the obvious refusals for free), and the Haiku
                    // call races the generation stream in parallel. If it
                    // comes back with a refusal, the stream is cancelled and
                    // the refusal card replaces whatever streamed in — the
                    // safety outcome is identical, the wait just isn't serial.
                    if let localRefusal = MockAskService.classifyRefusal(scrub.scrubbed) {
                        continuation.yield(.refusal(localRefusal, citations: []))
                        continuation.yield(.done)
                        continuation.finish()
                        return
                    }
                    let verdictBox = VerdictBox()
                    classifierWatcher = Task { [classifier] in
                        let intent = await classifier.classify(scrub.scrubbed)
                        verdictBox.resolve(refusal: intent.refusal)
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

                    // Deltas are held in `pending` until the classifier verdict
                    // lands. Generation still races the classifier (the request
                    // is in flight, tokens accumulate), but nothing renders
                    // until the question is confirmed answerable — a refused
                    // question must never flash a partial answer on screen.
                    var pending = ""
                    for try await chunk in stream {
                        // Classifier verdict landed mid-stream: stop generating,
                        // swap in the refusal. Dropping out of this loop
                        // releases the iterator, which cancels the underlying
                        // request via the stream's onTermination hook.
                        if let refusal = verdictBox.refusal {
                            continuation.yield(.refusal(refusal, citations: []))
                            continuation.yield(.done)
                            continuation.finish()
                            return
                        }
                        accumulated += chunk

                        // Output-side guard (Apple 1.4.2): if the model emits a
                        // computed dose/rate/volume despite the system prompt,
                        // kill the stream and refuse. Never renders — checked
                        // before the chunk is yielded.
                        if ResponseValidator.containsComputedDose(accumulated) {
                            askServiceLog.error("Output guard: computed-dose pattern in generation; refusing")
                            continuation.yield(.refusal(.prescribing, citations: []))
                            continuation.yield(.done)
                            continuation.finish()
                            return
                        }

                        if verdictBox.isResolved {
                            if !pending.isEmpty {
                                continuation.yield(.delta(pending))
                                pending = ""
                            }
                            continuation.yield(.delta(chunk))
                        } else {
                            pending += chunk
                        }
                    }

                    // Generation finished before the classifier did (rare —
                    // the classifier is a 16-token call and virtually always
                    // wins the race). Await its verdict so a refusal can never
                    // be skipped by a fast answer, then flush anything still held.
                    if let watcher = classifierWatcher {
                        await watcher.value
                        if let refusal = verdictBox.refusal {
                            continuation.yield(.refusal(refusal, citations: []))
                            continuation.yield(.done)
                            continuation.finish()
                            return
                        }
                    }
                    if !pending.isEmpty {
                        continuation.yield(.delta(pending))
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

    public func warmUp() async {
        await client.warmUp()
    }

    /// Lock-guarded cell the classifier watcher writes into and the generation
    /// loop polls per chunk. A one-shot write/read pair — plain lock beats an
    /// actor here because the read happens on every delta and must not suspend.
    /// `resolved` distinguishes "no verdict yet" (hold deltas) from "cleared to
    /// render" (verdict arrived, no refusal).
    private final class VerdictBox: @unchecked Sendable {
        private let lock = NSLock()
        private var storedRefusal: RefusalType?
        private var storedResolved = false
        var refusal: RefusalType? { lock.withLock { storedRefusal } }
        var isResolved: Bool { lock.withLock { storedResolved } }
        func resolve(refusal: RefusalType?) {
            lock.withLock {
                storedRefusal = refusal
                storedResolved = true
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
