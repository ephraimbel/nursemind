import Foundation
import SwiftUI

@MainActor
@Observable
public final class AskViewModel {
    public var conversation: AskConversation
    public var inputText: String = ""
    public var isStreaming: Bool = false
    public var phiNoticeFlash: Bool = false   // briefly true when input was scrubbed
    public var focusRequestToken: Int = 0     // bump to ask the input bar to focus

    /// Bumps every time `send()` is rejected because the user has hit today's
    /// AI quota. View observes this with `.onChange` and decides what to show
    /// based on tier — paywall for free, "resets at midnight" alert for pro.
    public var quotaBlockedToken: Int = 0

    private let service: AskService
    /// Single post-answer Anthropic call that produces both follow-up
    /// suggestions and the calculator handoff id. Replaces what used to be
    /// two separate helpers (`FollowUpService` + `CalculatorSuggester`) —
    /// merged to save ~$0.0012 per question (~10% of total AI cost). The
    /// `FollowUpService` and `CalculatorSuggester` protocols/mocks still
    /// exist for preview/test ergonomics but the live pipeline no longer
    /// invokes them.
    private let enrichmentService: AnswerEnrichmentService?
    private var streamingTask: Task<Void, Never>?

    // MARK: Smooth reveal
    //
    // Network deltas arrive in lurching chunks (SSE batches tokens
    // unevenly), and appending each one directly re-parsed and re-laid-out
    // the entire answer per delta — O(n²) over the stream and visually
    // choppy. Instead, deltas land in `revealBuffer` and a 30ms drain loop
    // moves an adaptive slice into the visible message: a floor of a few
    // characters per tick keeps short answers flowing, a backlog-
    // proportional rate keeps long answers from falling behind the network.
    // The result is an even typographic flow at ~30 render passes/second
    // regardless of how the network chunks arrive.
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

        // Daily quota gate. Server-side enforcement comes when the AI proxy
        // edge function lands; for now this caps client-driven cost.
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
        streamEnded = false
        revealBuffer = ""
        let extractedValues = ClinicalValueExtractor.extract(from: scrub.scrubbed)
        if !extractedValues.isEmpty,
           let idx = conversation.messages.firstIndex(where: { $0.id == assistantID }) {
            conversation.messages[idx].calculatorPreset = extractedValues
        }
        // Calculator suggestion is now produced by the post-stream merged
        // `enrichmentService` call (see fetchEnrichment below), bundled with
        // follow-ups in a single Anthropic call. Local value extraction (the
        // calculatorPreset) still runs synchronously above — that's regex-only,
        // no API cost — so when the suggestion arrives, the preset is already
        // there waiting.
        // Specialty + sub-specialty are derived from the user's profile each
        // send — no per-message UI control. The Ask page front door stays
        // clean; nurses still steer mid-message ("on my Peds shift today…")
        // and the model honors that over the profile default.
        let activeSpecialty = prefs.unit.specialty
        let icuSubspecialty = (activeSpecialty == .icu) ? prefs.icuSubspecialty : nil
        streamingTask = Task { [weak self] in
            guard let self else { return }
            do {
                let context = self.conversation.messages.dropLast(2).suffix(6)
                let stream = self.service.stream(
                    question: scrub.scrubbed,
                    conversationContext: Array(context),
                    specialty: activeSpecialty,
                    icuSubspecialty: icuSubspecialty
                )
                var refusal: RefusalType? = nil

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
                    case .done:
                        // Finalization happens after the reveal buffer drains
                        // (below) — flipping isStreaming here would drop the
                        // cursor while text is still flowing out.
                        break
                    }
                }
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
                }
                self.fetchEnrichment(for: assistantID, originalQuestion: scrub.scrubbed)
                let final = self.conversation.messages.first { $0.id == assistantID }
                AnalyticsService.shared.capture(
                    "question_completed",
                    properties: [
                        "refusal": final?.refusal?.rawValue ?? "none",
                        "citation_count": final?.citations.count ?? 0,
                        "answer_char_count": final?.content.count ?? 0,
                        "phi_redacted": scrub.redacted
                    ]
                )
            } catch {
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
                    properties: ["error": String(describing: error)]
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
        if let last = conversation.messages.last, last.role == .assistant, last.isStreaming {
            conversation.messages.removeLast()
        }
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

    /// Starts the 30ms drain loop if it isn't already running. The loop ends
    /// itself once the stream has finished AND the buffer is empty.
    private func scheduleReveal(for messageID: UUID) {
        guard revealTask == nil else { return }
        revealTask = Task { [weak self] in
            guard let self else { return }
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 33_000_000)
                if Task.isCancelled { return }
                let emitted = self.emitRevealSlice(to: messageID)
                if !emitted && self.streamEnded { break }
            }
            self.revealTask = nil
        }
    }

    /// Moves one adaptive slice from the buffer into the visible message.
    /// Returns false when nothing could be emitted this tick.
    private func emitRevealSlice(to messageID: UUID) -> Bool {
        guard !revealBuffer.isEmpty else { return false }
        let chars = Array(revealBuffer)
        let total = chars.count
        // Floor keeps short answers moving (~90 chars/s minimum); the
        // backlog-proportional term catches up when the network runs ahead.
        // Post-stream the rate triples so the tail drains in a beat.
        var take = min(total, streamEnded ? max(12, total / 3) : max(3, total / 6))

        // Citation-marker holdback: never emit a partial "[c001, c0" — the
        // raw fragment would flash before the parser can turn it into a pill.
        // If the marker's close already arrived, extend the slice through it;
        // otherwise pull back to just before the "[" and wait a tick.
        if let openIdx = lastUnclosedMarkerStart(in: chars, upTo: take) {
            if let closeIdx = chars[take...].firstIndex(of: "]"), closeIdx - openIdx <= 24 {
                take = closeIdx + 1
            } else if total - openIdx <= 24 {
                take = openIdx
            }
        }
        guard take > 0 else { return false }

        let slice = String(chars[0..<take])
        revealBuffer = String(chars[take...])
        guard let idx = conversation.messages.firstIndex(where: { $0.id == messageID }) else {
            revealBuffer = ""
            return false
        }
        conversation.messages[idx].content += slice
        return true
    }

    /// Index of a "[" in `chars[0..<take]` that opens a plausible citation
    /// marker not yet closed within the slice; nil when the boundary is safe.
    private func lastUnclosedMarkerStart(in chars: [Character], upTo take: Int) -> Int? {
        var i = take - 1
        while i >= 0 && take - i <= 24 {
            let c = chars[i]
            if c == "]" { return nil }
            if c == "[" {
                let tail = chars[(i + 1)..<take]
                let plausible = tail.allSatisfy { $0 == "c" || $0.isNumber || $0 == "," || $0 == " " }
                return plausible ? i : nil
            }
            i -= 1
        }
        return nil
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

    /// Fires once after a successful stream. Makes a single Anthropic call
    /// that returns both follow-up suggestions and a calculator handoff id,
    /// then applies both to the message at the same animation tick. Replaces
    /// the prior two helpers (calculator suggester firing in parallel with
    /// the stream, follow-ups firing after) — collapsing them halves the
    /// post-answer helper cost and gives the calculator suggester access to
    /// the answer text, which improves match accuracy ("calculate the MAP"
    /// phrasing in the answer becomes a usable signal).
    ///
    /// Skips refusals entirely — no enrichment is meaningful on an apology.
    /// Does NOT gate on answer length: very short answers (e.g., "MAP = 76.7
    /// mmHg") still benefit from a calculator handoff even though follow-up
    /// quality drops, and the model returns empty followups gracefully when
    /// none make sense.
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
                    self.conversation.messages[i].followUps = enrichment.followUps
                    if let calc = enrichment.calculatorID {
                        self.conversation.messages[i].calculatorSuggestion = calc
                    }
                }
            }
        }
    }
}
