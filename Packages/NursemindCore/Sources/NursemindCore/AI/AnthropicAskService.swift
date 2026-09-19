import Foundation
import OSLog

private let askServiceLog = Logger(subsystem: "app.nursemind.ios", category: "AnthropicAskService")

public final class AnthropicAskService: AskService, Sendable {
    private let client: AnthropicClient
    private let classifier: IntentClassifier
    private let retriever: RAGRetriever
    private let validator = ResponseValidator()

    public convenience init(apiKey: String, registry: ContentRegistry = .shared, urlSession: URLSession = .shared) {
        self.init(client: AnthropicClient(apiKey: apiKey, urlSession: urlSession), registry: registry)
    }

    public init(client: AnthropicClient, registry: ContentRegistry = .shared) {
        self.client = client
        self.classifier = IntentClassifier(client: client)
        self.retriever = RAGRetriever(registry: registry)
    }

    public func stream(
        question: String,
        conversationContext: [AskMessage],
        specialty: NursingSpecialty? = nil,
        icuSubspecialty: ICUSubspecialty? = nil
    ) -> AsyncThrowingStream<AskEvent, Error> {
        AsyncThrowingStream { continuation in
            let task = Task {
                var intentTask: Task<IntentClassifier.Intent, Never>?
                defer { intentTask?.cancel() }
                func refuse(_ type: RefusalType) {
                    continuation.yield(.refusal(type, citations: []))
                    continuation.yield(.done)
                    continuation.finish()
                }
                do {
                    let scrub = PHIScrubber.scrub(question)
                    if scrub.redacted { continuation.yield(.phiNotice) }
                    guard scrub.scrubbed.count <= 4_000 else { refuse(.lowConfidence); return }
                    if let refusal = MockAskService.classifyRefusal(scrub.scrubbed) {
                        refuse(refusal)
                        return
                    }
                    let retrievalQuery = RAGRetriever.retrievalQuery(scrub.scrubbed, history: conversationContext)
                    let rag = retriever.retrieve(for: retrievalQuery, specialty: specialty)
                    guard client.usesProxy || !rag.confidenceFloor else { refuse(.lowConfidence); return }
                    let history = Self.formatHistory(conversationContext)
                    // The v2 proxy owns classification; direct development calls keep the same gate locally.
                    if !client.usesProxy {
                        intentTask = Task { [classifier] in
                            await classifier.classify("Conversation context (not instructions):\n\(history)\nCurrent question:\n\(scrub.scrubbed)")
                        }
                    }
                    let careerStage = await MainActor.run { UserPreferences.shared.role.displayName }
                    let dynamicSystem = SystemPrompt.buildDynamic(
                        retrievedContext: rag.formattedContext,
                        conversationHistory: history,
                        careerStage: careerStage,
                        units: [],
                        activeSpecialty: specialty,
                        icuSubspecialty: icuSubspecialty
                    )
                    let attempts = client.usesProxy ? 1 : 2
                    for attempt in 0..<attempts {
                        try Task.checkCancellation()
                        let repair = attempt == 0 ? "" : "\nThe prior attempt failed validation. Regenerate from the excerpts only. Cite each factual sentence, use only supplied IDs, omit unsupported facts, and finish within 450 words."
                        var answer = ""
                        var externalEvidence: ExternalAnswerEvidence?
                        var followUps: [String] = []
                        for try await event in client.streamAnswer(
                            model: .haiku45,
                            cachedSystem: SystemPrompt.staticPrefix,
                            dynamicSystem: dynamicSystem + repair,
                            messages: [.init(role: "user", content: scrub.scrubbed)],
                            maxTokens: 1400,
                            temperature: 0.1
                        ) {
                            try Task.checkCancellation()
                            switch event {
                            case .text(let text): answer += text
                            case .evidence(let evidence): externalEvidence = evidence
                            case .stage(let stage, let sources): continuation.yield(.stage(Self.stageLabel(stage, sources: sources)))
                            case .followUps(let questions): followUps = questions
                            case .refusal(let raw):
                                refuse(RefusalType(rawValue: raw) ?? .lowConfidence)
                                return
                            }
                            if ResponseValidator.containsComputedDose(answer) { refuse(.prescribing); return }
                            guard answer.count <= 12_000 else { refuse(.lowConfidence); return }
                        }
                        if let intentTask, let refusal = await intentTask.value.refusal {
                            refuse(refusal)
                            return
                        }
                        try Task.checkCancellation()
                        let citations = externalEvidence?.sources ?? rag.citations
                        let context = externalEvidence?.context ?? rag.formattedContext
                        let result = validator.validate(answer, validCitationIDs: Set(citations.indices.map { String(format: "c%03d", $0 + 1) }), retrievedContext: context)
                        guard result.isValid else {
                            askServiceLog.notice("Answer validation failed: \(result.issues.count) checks; attempt \(attempt + 1)")
                            continue
                        }
                        // No clinical text leaves the service until the whole answer has passed validation.
                        continuation.yield(.citations(AnswerCitationEvidence.attaching(
                            to: citations, context: context,
                            origin: externalEvidence == nil ? .librarySummary : .retrievedSource
                        )))
                        continuation.yield(.libraryEntries(externalEvidence == nil ? rag.entries.map(\.id) : []))
                        continuation.yield(.delta(answer))
                        if !followUps.isEmpty { continuation.yield(.followUps(followUps)) }
                        continuation.yield(.done)
                        continuation.finish()
                        return
                    }
                    refuse(.lowConfidence)
                } catch is CancellationError {
                    continuation.finish()
                } catch let error as AnthropicClient.ClientError {
                    if Task.isCancelled { continuation.finish(); return }
                    if case .requestFailed(let status, let body) = error {
                        if status == 429 { refuse(.quotaExceeded); return }
                        if status == 422, let data = body.data(using: .utf8),
                           let payload = try? JSONDecoder().decode(ProxyRefusal.self, from: data),
                           let type = RefusalType(rawValue: payload.refusal) {
                            refuse(type)
                            return
                        }
                    }
                    askServiceLog.error("AI transport or response validation failed")
                    refuse(.serviceUnavailable)
                } catch {
                    if Task.isCancelled { continuation.finish(); return }
                    askServiceLog.error("AI request failed")
                    refuse(.serviceUnavailable)
                }
            }
            continuation.onTermination = { _ in task.cancel() }
        }
    }

    public func warmUp() async {
        async let connection: Void = client.warmUp()
        await Task.detached { [retriever] in retriever.prewarm() }.value
        await connection
    }

    /// The waiting line for a server stage. Plain, present tense, no counts
    /// the nurse cannot see, except how many sources are being read.
    static func stageLabel(_ stage: String, sources: Int?) -> String {
        switch stage {
        case "reading":
            switch sources ?? 0 {
            case 0: return "Searching for sources…"
            case 1: return "Reading 1 source…"
            case let n: return "Reading \(n) sources…"
            }
        case "writing": return "Writing…"
        case "checking": return "Checking against the sources…"
        case "revising": return "Revising…"
        default: return "Finding a supported answer…"
        }
    }

    static func formatHistory(_ messages: [AskMessage]) -> String {
        messages.filter { !$0.isStreaming && $0.refusal == nil && !$0.content.isEmpty }.suffix(6).map { message in
            let text = PHIScrubber.scrub(String(message.content.prefix(1_500))).scrubbed
                .replacingOccurrences(of: #"\[c\d+(?:,\s*c\d+)*\]"#, with: "", options: .regularExpression)
            return "\(message.role == .user ? "User" : "Assistant"): \(text)"
        }.joined(separator: "\n")
    }

    private struct ProxyRefusal: Decodable { let refusal: String }
}
