import Foundation
import SwiftUI

@MainActor
@Observable
public final class AskViewModel {
    public var conversation: AskConversation
    public var inputText: String = ""
    public var isStreaming: Bool = false
    /// What the server is doing right now, shown in the thinking indicator
    /// until the first block of the answer lands.
    public var stage: String?
    public var phiNoticeFlash: Bool = false   // briefly true when input was scrubbed
    public var focusRequestToken: Int = 0     // bump to ask the input bar to focus

    /// Bumps every time `send()` is rejected because the user has hit today's
    /// AI quota. View observes this with `.onChange` and decides what to show
    /// based on tier — paywall for free, "resets at midnight" alert for pro.
    public var quotaBlockedToken: Int = 0

    private let service: AskService
    private let enrichmentService: AnswerEnrichmentService?
    private var streamingTask: Task<Void, Never>?

    // MARK: Block reveal
    //
    // Deltas land in `revealBuffer` and a drain loop moves one whole unit at
    // a time into the visible message: everything through the next line
    // break, so the lede arrives complete, then each bullet or table row
    // settles into place on its own tick. Whole units keep the layout from
    // reflowing mid-sentence and let the renderer fade each block in.
    @ObservationIgnored private var revealBuffer: String = ""
    @ObservationIgnored private var revealTask: Task<Void, Never>?
    @ObservationIgnored private var streamEnded: Bool = false

    public init(
        conversation: AskConversation = AskConversation(),
        service: AskService,
        enrichmentService: AnswerEnrichmentService? = nil
    ) {
        self.conversation = conversation
        self.service = service
        self.enrichmentService = enrichmentService
    }

    public func send() {
        let raw = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !raw.isEmpty, !isStreaming else { return }

        // Immediate UI gate; the server independently enforces the subscription allowance.
        let prefs = UserPreferences.shared
        if prefs.askQuotaExceeded {
            quotaBlockedToken &+= 1
            return
        }

        inputText = ""

        let scrub = PHIScrubber.scrub(raw)

        let userMessage = AskMessage(
            role: .user,
            content: scrub.scrubbed,
            phiRedacted: scrub.redacted
        )
        conversation.append(userMessage)
        startAsk(question: scrub.scrubbed, phiRedacted: scrub.redacted)
    }

    /// Re-runs the question that produced a failed answer (service-unavailable
    /// card). Removes the failed assistant message and streams a fresh one —
    /// the user's message stays in place, so retrying reads as "the answer
    /// arrived late," not "I asked twice."
    public func retry(_ messageID: UUID) {
        guard !isStreaming,
              let idx = conversation.messages.firstIndex(where: { $0.id == messageID }),
              conversation.messages[idx].role == .assistant else { return }
        var question: String?
        for i in stride(from: idx - 1, through: 0, by: -1) where conversation.messages[i].role == .user {
            question = conversation.messages[i].content
            break
        }
        guard let question else { return }
        if UserPreferences.shared.askQuotaExceeded {
            quotaBlockedToken &+= 1
            return
        }
        conversation.messages.remove(at: idx)
        startAsk(question: question, phiRedacted: false)
    }

    private func startAsk(question: String, phiRedacted: Bool) {
        let prefs = UserPreferences.shared
        prefs.incrementAskQuota()
        let scrub = (scrubbed: question, redacted: phiRedacted)

        // Insert a streaming assistant placeholder so the chat re-renders immediately.
        let assistantMessage = AskMessage(role: .assistant, content: "", isStreaming: true)
        let assistantID = assistantMessage.id
        conversation.append(assistantMessage)

        isStreaming = true
        stage = nil
        streamEnded = false
        revealBuffer = ""
        let extractedValues = ClinicalValueExtractor.extract(from: scrub.scrubbed)
        if !extractedValues.isEmpty,
           let idx = conversation.messages.firstIndex(where: { $0.id == assistantID }) {
            conversation.messages[idx].calculatorPreset = extractedValues
        }
        // Specialty + sub-specialty are derived from the user's profile each
        // send — no per-message UI control. The Ask page front door stays
        // clean; nurses still steer mid-message ("on my Peds shift today…")
        // and the model honors that over the profile default.
        let activeSpecialty = prefs.unit.specialty
        let icuSubspecialty = (activeSpecialty == .icu) ? prefs.icuSubspecialty : nil
        streamingTask = Task { [weak self] in
            guard let self else { return }
            let started = ContinuousClock.now
            var firstAnswerMilliseconds: Int?
            do {
                let context = self.conversation.messages.dropLast(2).suffix(6)
                let stream = self.service.stream(
                    question: scrub.scrubbed,
                    conversationContext: Array(context),
                    specialty: activeSpecialty,
                    icuSubspecialty: icuSubspecialty
                )
                var refusal: RefusalType? = nil
                var pendingFollowUps: [String] = []

                for try await event in stream {
                    switch event {
                    case .phiNotice:
                        self.phiNoticeFlash = true
                    case .refusal(let type, let citations):
                        refusal = type
                        self.stopReveal()
                        // A question that produced no answer must not burn
                        // quota — a network blip costing a free user one of
                        // their 3 lifetime questions is indefensible. Content
                        // refusals (diagnostic, prescribing, …) still count:
                        // the user got a considered response.
                        if type == .serviceUnavailable || type == .quotaExceeded {
                            prefs.refundAskQuota()
                        }
                        if let idx = self.conversation.messages.firstIndex(where: { $0.id == assistantID }) {
                            self.conversation.messages[idx] = AskMessage(
                                id: assistantID,
                                role: .assistant,
                                content: "",
                                citations: citations,
                                refusal: type,
                                isStreaming: false
                            )
                        }
                    case .delta(let chunk):
                        guard refusal == nil else { continue }
                        if firstAnswerMilliseconds == nil {
                            firstAnswerMilliseconds = Self.milliseconds(started.duration(to: .now))
                        }
                        self.revealBuffer += chunk
                        self.scheduleReveal(for: assistantID)
                    case .citations(let cits):
                        if let idx = self.conversation.messages.firstIndex(where: { $0.id == assistantID }) {
                            var prev = self.conversation.messages[idx]
                            prev = AskMessage(
                                id: prev.id,
                                role: prev.role,
                                content: prev.content,
                                citations: cits,
                                refusal: prev.refusal,
                                phiRedacted: prev.phiRedacted,
                                timestamp: prev.timestamp,
                                isStreaming: prev.isStreaming,
                                rating: prev.rating
                            )
                            prev.followUps = self.conversation.messages[idx].followUps
                            prev.calculatorSuggestion = self.conversation.messages[idx].calculatorSuggestion
                            prev.calculatorPreset = self.conversation.messages[idx].calculatorPreset
                            prev.libraryEntryIDs = self.conversation.messages[idx].libraryEntryIDs
                            self.conversation.messages[idx] = prev
                        }
                    case .libraryEntries(let ids):
                        if let idx = self.conversation.messages.firstIndex(where: { $0.id == assistantID }) {
                            withAnimation(.easeOut(duration: 0.2)) {
                                self.conversation.messages[idx].libraryEntryIDs = ids
                            }
                        }
                    case .stage(let label):
                        self.stage = label
                    case .followUps(let questions):
                        pendingFollowUps = questions
                    case .done:
                        // Finalization happens after the reveal buffer drains
                        // (below) — flipping isStreaming here would drop the
                        // cursor while text is still flowing out.
                        break
                    }
                }
                guard !Task.isCancelled else { return }
                // Let the reveal loop drain what the network already
                // delivered, then finalize. The drain accelerates once the
                // stream is done, so this tail lasts a beat, not seconds.
                self.streamEnded = true
                if let drain = self.revealTask {
                    await drain.value
                }
                if refusal == nil,
                   let idx = self.conversation.messages.firstIndex(where: { $0.id == assistantID }) {
                    self.conversation.messages[idx].isStreaming = false
                    if !pendingFollowUps.isEmpty {
                        self.conversation.messages[idx].followUps = pendingFollowUps
                    }
                    // The answer has settled: one soft tap, the same weight
                    // as opening a citation.
                    Haptic.light()
                }
                self.stage = nil
                self.fetchEnrichment(for: assistantID, originalQuestion: scrub.scrubbed)
                let final = self.conversation.messages.first { $0.id == assistantID }
                AnalyticsService.shared.capture(
                    "question_completed",
                    properties: [
                        "refusal": final?.refusal?.rawValue ?? "none",
                        "citation_count": final?.citations.count ?? 0,
                        "answer_char_count": final?.content.count ?? 0,
                        "latency_ms": Self.milliseconds(started.duration(to: .now)),
                        "first_answer_ms": firstAnswerMilliseconds ?? -1,
                        "phi_redacted": scrub.redacted
                    ]
                )
            } catch is CancellationError {
                return
            } catch {
                guard !Task.isCancelled else { return }
                self.stopReveal()
                prefs.refundAskQuota()
                if let idx = self.conversation.messages.firstIndex(where: { $0.id == assistantID }) {
                    self.conversation.messages[idx] = AskMessage(
                        id: assistantID,
                        role: .assistant,
                        content: "",
                        refusal: .serviceUnavailable,
                        isStreaming: false
                    )
                }
                AnalyticsService.shared.capture(
                    "question_failed",
                    properties: ["error_type": "ask_transport_failure"]
                )
            }
            self.isStreaming = false
            _ = assistantMessage   // capture so the @MainActor task keeps the strong reference
        }
    }

    public func cancel() {
        streamingTask?.cancel()
        streamingTask = nil
        stopReveal()
        isStreaming = false
        stage = nil
        if let last = conversation.messages.last, last.role == .assistant, last.isStreaming {
            conversation.messages.removeLast()
        }
    }

    private static func milliseconds(_ duration: Duration) -> Int {
        Int(duration.components.seconds * 1_000 + duration.components.attoseconds / 1_000_000_000_000_000)
    }

    /// Pre-establishes the network path to the AI service (DNS, TLS, edge
    /// function warm start). Called when the Ask surface appears so the first
    /// question rides a warm connection.
    public func warmUpConnection() async {
        await service.warmUp()
    }

    // MARK: - Smooth reveal

    private func stopReveal() {
        revealTask?.cancel()
        revealTask = nil
        revealBuffer = ""
    }

    /// Starts the drain loop if it isn't already running. One unit lands
    /// per tick; the loop ends itself once the stream has finished AND the
    /// buffer is empty.
    private func scheduleReveal(for messageID: UUID) {
        guard revealTask == nil else { return }
        revealTask = Task { [weak self] in
            guard let self else { return }
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 90_000_000)
                if Task.isCancelled { return }
                let emitted = self.emitRevealSlice(to: messageID)
                if !emitted && self.streamEnded { break }
            }
            self.revealTask = nil
        }
    }

    /// Moves the next whole unit from the buffer into the visible message.
    /// Returns false when nothing could be emitted this tick.
    private func emitRevealSlice(to messageID: UUID) -> Bool {
        guard let (unit, rest) = Self.nextRevealUnit(in: revealBuffer, streamEnded: streamEnded) else { return false }
        revealBuffer = rest
        guard let idx = conversation.messages.firstIndex(where: { $0.id == messageID }) else {
            revealBuffer = ""
            return false
        }
        conversation.messages[idx].content += unit
        return true
    }

    /// The next unit: everything through the first line break plus any blank
    /// lines after it, so a paragraph, bullet, or table row lands complete.
    /// A partial line waits for the network; once the stream has ended the
    /// remainder flushes as one unit.
    nonisolated static func nextRevealUnit(in buffer: String, streamEnded: Bool) -> (unit: String, rest: String)? {
        guard !buffer.isEmpty else { return nil }
        if let newline = buffer.firstIndex(of: "\n") {
            var end = buffer.index(after: newline)
            while end < buffer.endIndex, buffer[end] == "\n" { end = buffer.index(after: end) }
            return (String(buffer[..<end]), String(buffer[end...]))
        }
        return streamEnded ? (buffer, "") : nil
    }

    public func startNewConversation() {
        cancel()
        conversation = AskConversation()
        inputText = ""
    }

    public func rate(_ messageID: UUID, as rating: AskMessage.Rating) {
        guard let idx = conversation.messages.firstIndex(where: { $0.id == messageID }) else { return }
        let previous = conversation.messages[idx].rating
        conversation.messages[idx].rating = rating
        let message = conversation.messages[idx]
        AnalyticsService.shared.capture(
            "answer_rated",
            properties: [
                "rating": String(describing: rating),
                "previous_rating": previous.map { String(describing: $0) } ?? "none",
                "refusal": message.refusal?.rawValue ?? "none",
                "citation_count": message.citations.count,
                "answer_char_count": message.content.count
            ]
        )
    }

    /// Sends the prefilled follow-up text to the input bar and bumps the focus
    /// token so the input bar focuses. Auto-sending was rejected — refinement
    /// matters at the bedside, even by a few words.
    public func prefillFollowUp(_ text: String) {
        inputText = text
        focusRequestToken &+= 1
    }

    /// Follow-ups are attached only to completed, validated answers.
    private func fetchEnrichment(for messageID: UUID, originalQuestion: String) {
        guard let service = enrichmentService,
              let idx = conversation.messages.firstIndex(where: { $0.id == messageID }) else { return }
        let message = conversation.messages[idx]
        guard message.refusal == nil, !message.content.isEmpty else { return }

        let answer = message.content
        Task { [weak self] in
            let enrichment = await service.enrich(question: originalQuestion, answer: answer)
            guard let self else { return }
            await MainActor.run {
                guard let i = self.conversation.messages.firstIndex(where: { $0.id == messageID }) else { return }
                withAnimation(.easeOut(duration: 0.25)) {
                    // Server-chosen follow-ups win; the local ones fill in
                    // for direct and mock services.
                    if self.conversation.messages[i].followUps.isEmpty {
                        self.conversation.messages[i].followUps = enrichment.followUps
                    }
                    if let calc = enrichment.calculatorID {
                        self.conversation.messages[i].calculatorSuggestion = calc
                    }
                }
            }
        }
    }
}
