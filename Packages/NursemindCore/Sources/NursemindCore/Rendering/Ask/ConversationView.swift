import SwiftUI
import SwiftData

struct ConversationView: View {
    @Bindable var viewModel: AskViewModel

    /// Auto-follow state. True while the view tracks the streaming bottom
    /// edge; broken the moment the user drags upward to reread something
    /// (their read position must never be yanked away by an arriving token),
    /// restored when they return to the bottom or tap the ↓ affordance.
    @State private var isFollowing = true
    @State private var viewportHeight: CGFloat = 0
    @State private var bottomDistance: CGFloat = 0

    var body: some View {
        ScrollViewReader { proxy in
            scrollBody(proxy)
                .scrollDismissesKeyboard(.interactively)
                .onChange(of: viewModel.conversation.messages.count) {
                    // A new user message always re-engages follow — sending is
                    // an explicit "take me to the conversation floor."
                    if viewModel.conversation.messages.last?.role == .user {
                        isFollowing = true
                    }
                }
                .onChange(of: viewModel.conversation.messages.last?.content) {
                    followStream(proxy)
                }
                .onChange(of: viewModel.isStreaming) { _, isStreaming in
                    if !isStreaming { settleAfterStream(proxy) }
                }
        }
    }

    private func scrollBody(_ proxy: ScrollViewProxy) -> some View {
        ScrollView {
            messageList
                .background(
                    GeometryReader { geo in
                        Color.clear.preference(
                            key: ContentBottomKey.self,
                            value: geo.frame(in: .named("conversation")).maxY
                        )
                    }
                )
        }
        .coordinateSpace(name: "conversation")
        .background(
            GeometryReader { geo in
                Color.clear
                    .onAppear { viewportHeight = geo.size.height }
                    .onChange(of: geo.size.height) { _, h in viewportHeight = h }
            }
        )
        .onPreferenceChange(ContentBottomKey.self) { maxY in
            bottomDistance = max(0, maxY - viewportHeight)
            // User (or the follow animation) reached the bottom again —
            // re-engage following so the stream resumes tracking.
            if bottomDistance < 60 { isFollowing = true }
        }
        .simultaneousGesture(
            DragGesture().onChanged { value in
                // A downward finger drag means "scroll back up" — the user is
                // rereading. Break follow; never fight them.
                if value.translation.height > 12 { isFollowing = false }
            }
        )
        .overlay(alignment: .bottom) {
            if !isFollowing {
                ScrollToBottomButton {
                    isFollowing = true
                    if let last = viewModel.conversation.messages.last {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.85)) {
                            proxy.scrollTo(last.id, anchor: .bottom)
                        }
                    }
                }
                .padding(.bottom, NMSpace.md)
                .transition(.opacity.combined(with: .scale(scale: 0.85)))
            }
        }
        .animation(.easeOut(duration: 0.2), value: isFollowing)
    }

    private var messageList: some View {
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

    private func followStream(_ proxy: ScrollViewProxy) {
        guard isFollowing, let last = viewModel.conversation.messages.last else { return }
        // While streaming: track the bottom edge so the cursor stays in view.
        // When done: snap to the top of the assistant response so the answer
        // is read top-down.
        let anchor: UnitPoint = last.isStreaming ? .bottom : .top
        withAnimation(.easeOut(duration: 0.15)) {
            proxy.scrollTo(last.id, anchor: anchor)
        }
    }

    private func settleAfterStream(_ proxy: ScrollViewProxy) {
        guard isFollowing, let last = viewModel.conversation.messages.last else { return }
        // Streaming complete — settle to the top of the answer with a gentle
        // spring rather than a mechanical ease. The streaming path (above)
        // intentionally stays on easeOut(0.15) because springs would jitter
        // under rapid scrolls; this branch fires exactly once per answer, so
        // the spring's 0.45s response cost is paid only at the "earned"
        // moment where the user transitions from watching to reading.
        withAnimation(.spring(response: 0.45, dampingFraction: 0.86)) {
            proxy.scrollTo(last.id, anchor: .top)
        }
    }
}

private struct ContentBottomKey: PreferenceKey {
    static let defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

/// Quiet "return to the live edge" affordance shown while auto-follow is
/// broken. Deliberately not accent-colored — the accent is reserved for
/// primary CTAs; this is navigation, not action.
private struct ScrollToBottomButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.down")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(NMColor.textSecondary)
                .frame(width: 34, height: 34)
                .background(
                    Circle()
                        .fill(NMColor.bgPrimary)
                        .overlay(Circle().stroke(NMColor.borderSubtle, lineWidth: 1))
                        .shadow(color: .black.opacity(0.08), radius: 6, y: 2)
                )
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Scroll to latest")
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
            // `animated: true` — the ✦ glyph does a one-shot fade-up + scale
            // when this assistant message first appears, giving fresh answers
            // a subtle "the AI just took the floor" signal. The animation
            // fires once per message instance and stays static thereafter, so
            // scrolling back to an older message doesn't replay it.
            EyebrowLabel("NURSEMIND", animated: true)
            if let refusal = message.refusal {
                RefusalCard(refusal: refusal, onRetry: refusal == .serviceUnavailable ? {
                    viewModel.retry(message.id)
                } : nil)
                    .onAppear {
                        // One-shot warning haptic the instant a refusal surfaces.
                        // Distinct from `.success()` (subscription, save) and
                        // `.error()` (system failure) — the app deliberately
                        // declined what was asked, and the haptic mirrors that.
                        Haptic.warning()
                    }
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
            // Pre-first-delta: editorial thinking indicator (breathing
            // dot + cycling phase text). Replaces the bare blinking cursor
            // so the moment between "send tapped" and "first token" reads
            // like deliberate work rather than dead air.
            VStack(alignment: .leading, spacing: NMSpace.base) {
                handoffSection
                ThinkingIndicator(sourceNames: message.citations.map(\.shortName))
            }
        } else {
            VStack(alignment: .leading, spacing: NMSpace.base) {
                handoffSection
                MessageBodyView(content: message.content, citations: message.citations, cacheKey: message.id)
                if message.isStreaming {
                    StreamingCursor()
                        .padding(.top, 2)
                }
            }
            // Crossfade from the thinking state into the streamed body —
            // without this the answer can pop in jarringly the instant the
            // first delta lands. The animation is anchored to "content
            // became non-empty" rather than "isStreaming changed" so it
            // only fires on the thinking→streaming boundary, not on every
            // appended token.
            .transition(.opacity.animation(.easeOut(duration: 0.28)))
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
            AnalyticsService.shared.capture("saved_answer_removed")
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
        AnalyticsService.shared.capture(
            "saved_answer_added",
            properties: [
                "citation_count": message.citations.count,
                "char_count": message.content.count
            ]
        )
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

/// Thin breathing vertical bar that signals "more content is on the way."
/// Replaces the prior `Text("▍")` Unicode glyph — that character renders
/// inconsistently across iOS versions and reads as a binary blink rather
/// than a breath. A SwiftUI shape gives us pixel-perfect control over
/// width, color, corner rounding, and the easeInOut curve, and tints with
/// the brand accent so the cursor lives in the same visual vocabulary as
/// every other "the app is working" affordance (CTAs, ThinkingIndicator
/// dot, citation pill stroke).
struct StreamingCursor: View {
    @State private var breath: Double = 0.35

    var body: some View {
        RoundedRectangle(cornerRadius: 1)
            .fill(NMColor.accent)
            .frame(width: 2.5, height: 18)
            .opacity(breath)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: 0.85).repeatForever(autoreverses: true)
                ) {
                    breath = 1.0
                }
            }
            .accessibilityHidden(true)
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
    var onRetry: (() -> Void)? = nil

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
            if let onRetry {
                Button(action: onRetry) {
                    HStack(spacing: 6) {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size: 12, weight: .medium))
                        Text("Try again")
                            .font(NMFont.body)
                    }
                    .foregroundStyle(NMColor.textPrimary)
                    .padding(.horizontal, NMSpace.md)
                    .padding(.vertical, 7)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(NMColor.borderSubtle, lineWidth: 1)
                    )
                }
                .buttonStyle(.plain)
                .padding(.top, 2)
            }
        }
        .padding(NMSpace.lg)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(NMColor.bgSecondary)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(NMColor.borderSubtle, lineWidth: 1))
        )
    }
}
