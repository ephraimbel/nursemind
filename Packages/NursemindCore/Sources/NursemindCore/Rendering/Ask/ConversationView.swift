import SwiftUI
import SwiftData

struct ConversationView: View {
    @Bindable var viewModel: AskViewModel

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(Array(viewModel.conversation.messages.enumerated()), id: \.element.id) { idx, message in
                        VStack(alignment: .leading, spacing: 0) {
                            if idx > 0 {
                                Hairline().padding(.vertical, NMSpace.xxl)
                            }
                            MessageRenderer(message: message, viewModel: viewModel)
                                .id(message.id)
                        }
                    }
                }
                .padding(.horizontal, NMSpace.lg)
                .padding(.top, NMSpace.lg)
            }
            .onChange(of: viewModel.conversation.messages.last?.content) {
                guard let last = viewModel.conversation.messages.last else { return }
                // While streaming: track the bottom edge so the cursor stays in view.
                // When done: snap to the top of the assistant response so the answer is read top-down.
                let anchor: UnitPoint = last.isStreaming ? .bottom : .top
                withAnimation(.easeOut(duration: 0.15)) {
                    proxy.scrollTo(last.id, anchor: anchor)
                }
            }
            .onChange(of: viewModel.isStreaming) { _, isStreaming in
                guard !isStreaming, let last = viewModel.conversation.messages.last else { return }
                withAnimation(.easeOut(duration: 0.2)) {
                    proxy.scrollTo(last.id, anchor: .top)
                }
            }
        }
    }
}

// MARK: - Per-message renderer

struct MessageRenderer: View {
    let message: AskMessage
    @Bindable var viewModel: AskViewModel
    @Environment(\.modelContext) private var modelContext
    @Query private var savedMatches: [SavedAnswer]
    @State private var savedFlash: Bool = false
    @AppStorage("ask.firstSaveNudgeShown") private var firstSaveNudgeShown: Bool = false
    @State private var showFirstSaveNudge: Bool = false
    @State private var showFlagAlert: Bool = false
    @State private var flagReason: String = ""
    @State private var flagFlash: Bool = false

    init(message: AskMessage, viewModel: AskViewModel) {
        self.message = message
        self._viewModel = Bindable(wrappedValue: viewModel)
        let messageID = message.id
        self._savedMatches = Query(
            filter: #Predicate<SavedAnswer> { $0.sourceMessageID == messageID }
        )
    }

    private var isSaved: Bool { !savedMatches.isEmpty }

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.base) {
            switch message.role {
            case .user:
                userMessage
            case .assistant:
                assistantMessage
            }
        }
    }

    private var userMessage: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            EyebrowLabel("YOU", sparkle: false)
            Text(message.content)
                .font(NMFont.displaySM)
                .foregroundStyle(NMColor.textPrimary)
                .lineSpacing(4)
            if message.phiRedacted {
                phiNoticeChip
            }
        }
    }

    private var phiNoticeChip: some View {
        HStack(spacing: 6) {
            Image(systemName: "lock.shield")
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(NMColor.alertHigh)
            Text("Patient details removed before sending.")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.alertHigh)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .stroke(NMColor.alertHigh, lineWidth: 1)
        )
    }

    @ViewBuilder
    private var assistantMessage: some View {
        VStack(alignment: .leading, spacing: NMSpace.base) {
            EyebrowLabel("NURSEMIND")
            if let refusal = message.refusal {
                RefusalCard(refusal: refusal)
            } else {
                bodyContent
                if !message.citations.isEmpty && !message.isStreaming {
                    Divider()
                        .padding(.vertical, NMSpace.sm)
                    ReferencesSection(citations: message.citations)
                }
                if !message.followUps.isEmpty && !message.isStreaming {
                    Divider()
                        .padding(.vertical, NMSpace.sm)
                    FollowUpRows(suggestions: message.followUps) { suggestion in
                        viewModel.prefillFollowUp(suggestion)
                    }
                    .transition(.opacity)
                }
                if !message.isStreaming {
                    actionRow
                }
            }
        }
        .alert("Flag this answer", isPresented: $showFlagAlert) {
            TextField("What's wrong? (optional)", text: $flagReason)
            Button("Cancel", role: .cancel) { flagReason = "" }
            Button("Submit") { submitFlag() }
        } message: {
            Text("This sends a snapshot of the answer to our review queue. The reviewers cross-check against the source and update the library if needed.")
        }
    }

    @ViewBuilder
    private var bodyContent: some View {
        if message.content.isEmpty && message.isStreaming {
            VStack(alignment: .leading, spacing: NMSpace.base) {
                handoffSection
                HStack(spacing: 6) {
                    StreamingCursor()
                }
            }
        } else {
            VStack(alignment: .leading, spacing: NMSpace.base) {
                handoffSection
                MessageBodyView(content: message.content, citations: message.citations)
                if message.isStreaming {
                    StreamingCursor()
                        .padding(.top, 2)
                }
            }
        }
    }

    @ViewBuilder
    private var handoffSection: some View {
        if let id = message.calculatorSuggestion {
            CalculatorHandoffRow(calculatorID: id, preset: message.calculatorPreset)
                .transition(.opacity)
        }
        if !message.libraryEntryIDs.isEmpty {
            LibraryEntriesHandoffRow(entryIDs: message.libraryEntryIDs)
                .transition(.opacity)
        }
    }
}

private extension MessageRenderer {

    private var actionRow: some View {
        HStack(spacing: NMSpace.lg) {
            ActionButton(icon: message.rating == .thumbsUp ? "hand.thumbsup.fill" : "hand.thumbsup", isActive: message.rating == .thumbsUp) {
                viewModel.rate(message.id, as: .thumbsUp)
            }
            ActionButton(icon: message.rating == .thumbsDown ? "hand.thumbsdown.fill" : "hand.thumbsdown", isActive: message.rating == .thumbsDown) {
                viewModel.rate(message.id, as: .thumbsDown)
            }
            ActionButton(icon: "doc.on.doc") {
                UIPasteboard.general.string = plainText
            }
            ActionButton(icon: isSaved ? "bookmark.fill" : "bookmark", isActive: isSaved) {
                toggleSaved()
            }
            ActionButton(icon: "flag") {
                flagReason = ""
                showFlagAlert = true
            }
            Spacer()
            if flagFlash {
                Text("Flagged for review")
                    .font(NMFont.displayItalicSM)
                    .foregroundStyle(NMColor.textTertiary)
                    .transition(.opacity)
            } else if savedFlash {
                VStack(alignment: .trailing, spacing: 2) {
                    Text("Saved to library")
                        .font(NMFont.displayItalicSM)
                        .foregroundStyle(NMColor.textTertiary)
                    if showFirstSaveNudge {
                        Text("Find it in Library → Saved")
                            .font(NMFont.bodySM)
                            .foregroundStyle(NMColor.textTertiary)
                    }
                }
                .transition(.opacity)
            }
        }
        .padding(.top, NMSpace.base)
    }

    private func submitFlag() {
        let reason = flagReason.trimmingCharacters(in: .whitespacesAndNewlines)
        let question = previousUserQuestion()
        FlagReportService.shared.submit(
            question: question,
            answerMarkdown: message.content,
            citations: message.citations,
            sourceMessageID: message.id,
            reason: reason.isEmpty ? nil : reason
        )
        flagReason = ""
        UINotificationFeedbackGenerator().notificationOccurred(.success)
        withAnimation(.easeOut(duration: 0.2)) {
            flagFlash = true
        }
        Task {
            try? await Task.sleep(nanoseconds: 1_800_000_000)
            await MainActor.run {
                withAnimation(.easeOut(duration: 0.3)) {
                    flagFlash = false
                }
            }
        }
    }

    private func toggleSaved() {
        if let existing = savedMatches.first {
            let removedID = existing.id
            modelContext.delete(existing)
            try? modelContext.save()
            SavedAnswerSyncService.shared.didDelete(id: removedID)
            return
        }
        guard !message.content.isEmpty else { return }
        let question = previousUserQuestion()
        let saved = SavedAnswer(
            question: question,
            answerMarkdown: message.content,
            citations: message.citations,
            sourceMessageID: message.id
        )
        modelContext.insert(saved)
        try? modelContext.save()
        SavedAnswerSyncService.shared.didInsertOrUpdate(saved)
        UINotificationFeedbackGenerator().notificationOccurred(.success)
        let isFirstSave = !firstSaveNudgeShown
        withAnimation(.easeOut(duration: 0.2)) {
            savedFlash = true
            showFirstSaveNudge = isFirstSave
        }
        if isFirstSave { firstSaveNudgeShown = true }
        let durationNs: UInt64 = isFirstSave ? 4_500_000_000 : 1_800_000_000
        Task {
            try? await Task.sleep(nanoseconds: durationNs)
            await MainActor.run {
                withAnimation(.easeOut(duration: 0.3)) {
                    savedFlash = false
                    showFirstSaveNudge = false
                }
            }
        }
    }

    /// Walk back to the most recent user message preceding this assistant
    /// message so the saved entry has a meaningful title even if the user
    /// asked multi-turn follow-ups.
    private func previousUserQuestion() -> String {
        let messages = viewModel.conversation.messages
        guard let idx = messages.firstIndex(where: { $0.id == message.id }) else { return "Saved answer" }
        for i in stride(from: idx - 1, through: 0, by: -1) where messages[i].role == .user {
            return messages[i].content
        }
        return "Saved answer"
    }

    private var plainText: String {
        var text = message.content
        if !message.citations.isEmpty {
            text += "\n\nSources:\n"
            for (i, source) in message.citations.enumerated() {
                text += "\(i+1). \(source.shortName)\n   \(source.url)\n"
            }
        }
        return text
    }
}

// MARK: - Streaming cursor

struct StreamingCursor: View {
    @State private var visible = true

    var body: some View {
        Text("▍")
            .font(NMFont.bodyLG)
            .foregroundStyle(NMColor.textTertiary)
            .opacity(visible ? 1 : 0)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.6).repeatForever()) {
                    visible.toggle()
                }
            }
    }
}

// MARK: - Action button

private struct ActionButton: View {
    let icon: String
    var isActive: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(isActive ? NMColor.accent : NMColor.textTertiary)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Refusal card

struct RefusalCard: View {
    let refusal: RefusalType

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            HStack(spacing: NMSpace.sm) {
                Image(systemName: refusal.icon)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(NMColor.textSecondary)
                Text(refusal.headline)
                    .font(NMFont.title)
                    .foregroundStyle(NMColor.textPrimary)
            }
            Text(refusal.body)
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textPrimary)
                .lineSpacing(4)
        }
        .padding(NMSpace.lg)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(NMColor.bgSecondary)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(NMColor.borderSubtle, lineWidth: 1))
        )
    }
}
