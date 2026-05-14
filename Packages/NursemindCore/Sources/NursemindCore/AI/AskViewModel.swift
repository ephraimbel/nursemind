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
        prefs.incrementAskQuota()

        inputText = ""

        let scrub = PHIScrubber.scrub(raw)

        let userMessage = AskMessage(
            role: .user,
            content: scrub.scrubbed,
            phiRedacted: scrub.redacted
        )
        conversation.append(userMessage)

        // Insert a streaming assistant placeholder so the chat re-renders immediately.
        let assistantMessage = AskMessage(role: .assistant, content: "", isStreaming: true)
        let assistantID = assistantMessage.id
        conversation.append(assistantMessage)

        isStreaming = true
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
                        if let idx = self.conversation.messages.firstIndex(where: { $0.id == assistantID }) {
                            self.conversation.messages[idx].content += chunk
                        }
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
                        if let idx = self.conversation.messages.firstIndex(where: { $0.id == assistantID }) {
                            self.conversation.messages[idx].isStreaming = false
                        }
                    }
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
                if let idx = self.conversation.messages.firstIndex(where: { $0.id == assistantID }) {
                    self.conversation.messages[idx] = AskMessage(
                        id: assistantID,
                        role: .assistant,
                        content: "",
                        refusal: .lowConfidence,
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
        isStreaming = false
        if let last = conversation.messages.last, last.role == .assistant, last.isStreaming {
            conversation.messages.removeLast()
        }
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
