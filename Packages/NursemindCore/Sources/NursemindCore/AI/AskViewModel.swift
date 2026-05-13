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
    private let followUpService: FollowUpService?
    private let calculatorSuggester: CalculatorSuggester?
    private var streamingTask: Task<Void, Never>?

    public init(
        conversation: AskConversation = AskConversation(),
        service: AskService,
        followUpService: FollowUpService? = nil,
        calculatorSuggester: CalculatorSuggester? = nil
    ) {
        self.conversation = conversation
        self.service = service
        self.followUpService = followUpService
        self.calculatorSuggester = calculatorSuggester
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
        fetchCalculatorSuggestion(for: assistantID, question: scrub.scrubbed)
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
                self.fetchFollowUps(for: assistantID, originalQuestion: scrub.scrubbed)
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
        conversation.messages[idx].rating = rating
    }

    /// Sends the prefilled follow-up text to the input bar and bumps the focus
    /// token so the input bar focuses. Auto-sending was rejected — refinement
    /// matters at the bedside, even by a few words.
    public func prefillFollowUp(_ text: String) {
        inputText = text
        focusRequestToken &+= 1
    }

    /// Fires immediately when the user sends a question — runs in parallel with
    /// the main stream so the calculator chip can appear at the top of the
    /// answer before the stream even completes.
    private func fetchCalculatorSuggestion(for messageID: UUID, question: String) {
        guard let suggester = calculatorSuggester else { return }
        Task { [weak self] in
            let suggestion = await suggester.suggest(for: question)
            guard let self, let suggestion else { return }
            await MainActor.run {
                if let i = self.conversation.messages.firstIndex(where: { $0.id == messageID }) {
                    withAnimation(.easeOut(duration: 0.2)) {
                        self.conversation.messages[i].calculatorSuggestion = suggestion
                    }
                }
            }
        }
    }

    /// Fires after a successful stream. Skips refusals and short answers
    /// (no value in suggesting follow-ups for a one-line response).
    private func fetchFollowUps(for messageID: UUID, originalQuestion: String) {
        guard let service = followUpService,
              let idx = conversation.messages.firstIndex(where: { $0.id == messageID }) else { return }
        let message = conversation.messages[idx]
        guard message.refusal == nil, message.content.count > 120 else { return }

        let answer = message.content
        Task { [weak self] in
            let suggestions = await service.suggest(question: originalQuestion, answer: answer)
            guard let self else { return }
            await MainActor.run {
                if let i = self.conversation.messages.firstIndex(where: { $0.id == messageID }) {
                    withAnimation(.easeOut(duration: 0.25)) {
                        self.conversation.messages[i].followUps = suggestions
                    }
                }
            }
        }
    }
}
