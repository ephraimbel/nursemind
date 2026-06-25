import SwiftUI
import SwiftData

public struct AskHomeView: View {
    @State private var viewModel: AskViewModel
    @FocusState private var inputFocused: Bool
    @State private var router = AppRouter.shared
    @State private var prefs = UserPreferences.shared
    @State private var historyPresented: Bool = false
    @State private var paywallPresented: Bool = false
    @State private var proLimitAlertShown: Bool = false
    @State private var voiceListening: Bool = false
    /// Per-section entrance flags for the empty-state stagger-in.
    @State private var sectionsVisible: [Bool] = Array(repeating: false, count: 3)
    /// Window offset into the suggestion pool; the "Shuffle" control advances it.
    @State private var suggestionOffset: Int = 0
    /// Which greeting subtitle to show. Randomized once when the view's state
    /// is first created — i.e. once per app launch — so the line is fresh each
    /// time the user opens the app but stable within a session.
    @State private var greetingVariant: Int = Int.random(in: 0..<AskHomeView.greetingSubtitles.count)
    /// Which greeting *title* to show, randomized once per launch. Modulo'd
    /// against the (context-dependent) title pool size at render time.
    @State private var titleVariant: Int = Int.random(in: 0..<10_000)
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.modelContext) private var modelContext
    /// SwiftUI wrapper around `SKStoreReviewController.requestReview()`.
    /// Triggered exactly once per user, after their first successful AI
    /// answer — see the `viewModel.isStreaming` onChange handler below. Apple
    /// rate-limits to 3 prompts / 365 days regardless of how often we call
    /// this; the client-side flag (`prefs.hasRequestedReview`) keeps us to a
    /// single ask per user lifetime so we never repeat-ask within a session.
    @Environment(\.requestReview) private var requestReview

    @Query(sort: \SavedAnswer.savedAt, order: .reverse)
    private var savedAnswers: [SavedAnswer]

    @Query(sort: \StoredConversation.lastUpdatedAt, order: .reverse)
    private var storedConversations: [StoredConversation]

    public init(
        service: AskService = MockAskService(),
        enrichmentService: AnswerEnrichmentService = MockAnswerEnrichmentService()
    ) {
        _viewModel = State(initialValue: AskViewModel(
            service: service,
            enrichmentService: enrichmentService
        ))
    }

    /// Dev-only auto-trigger. Reads `NM_TEST_QUERY` from the environment if present
    /// and auto-sends it on first appear. Used for capturing AI screenshots during
    /// development; harmless in production (env var won't be set).
    public static var testAutoQuery: String? {
        ProcessInfo.processInfo.environment["NM_TEST_QUERY"]
    }

    public var body: some View {
        NavigationStack {
            ZStack {
                GrainBackground()
                // The top glow belongs to the greeting only. It fades out as
                // soon as a chat begins (the conversation gains a message and
                // the AI starts thinking) and fades back in on a fresh chat.
                topGlow
                    .opacity(viewModel.conversation.messages.isEmpty ? 1 : 0)
                    .animation(.easeInOut(duration: 0.45), value: viewModel.conversation.messages.isEmpty)
                if viewModel.conversation.messages.isEmpty {
                    emptyState
                } else {
                    ConversationView(viewModel: viewModel)
                }
            }
            .safeAreaInset(edge: .bottom, spacing: 0) { inputBar }
            .onAppear {
                if let q = Self.testAutoQuery, viewModel.conversation.messages.isEmpty {
                    viewModel.inputText = q
                    viewModel.send()
                }
            }
            .onChange(of: viewModel.focusRequestToken) {
                inputFocused = true
            }
            .onChange(of: router.pendingAskQuery) {
                // Global-search "Ask NurseMind" CTA prefills the input field
                // here. We consume the value and clear it so it doesn't fire
                // twice if the user comes back to the tab. When `autoSend` is
                // set (entry-AI quick actions), submit immediately instead of
                // focusing for editing.
                if let q = router.pendingAskQuery, !q.isEmpty {
                    viewModel.inputText = q
                    let shouldAutoSend = router.pendingAskAutoSend
                    router.pendingAskQuery = nil
                    router.pendingAskAutoSend = false
                    if shouldAutoSend {
                        viewModel.send()
                    } else {
                        inputFocused = true
                    }
                }
            }
            // Auto-save the live conversation whenever streaming finishes
            // (or any other update that changes lastUpdatedAt). Upserts by
            // conversation id so resumed-and-extended threads update in place.
            .onChange(of: viewModel.conversation.lastUpdatedAt) {
                persistConversationIfNeeded()
            }
            // First-answer App Store review prompt. Fires the native iOS
            // rating sheet after the user gets their first successful AI
            // answer — the moment they've just experienced app value, which
            // is what Apple's review-prompt guidance asks for. Tightly gated:
            //   • Once per user (prefs.hasRequestedReview)
            //   • Only on stream completion (isStreaming transition true→false)
            //   • Only on a real answer (last message is assistant, non-empty,
            //     no refusal)
            //   • 1.5s delay so the user reads the answer before the sheet
            //     interrupts. Apple's RequestReviewAction is itself rate-
            //     limited to 3 prompts / 365 days, but we self-limit to one
            //     ask ever — a clearly invitational moment, not a pestering
            //     pattern.
            .onChange(of: viewModel.isStreaming) { _, isStreaming in
                guard !isStreaming else { return }
                guard !prefs.hasRequestedReview else { return }
                guard let last = viewModel.conversation.messages.last,
                      last.role == .assistant,
                      last.refusal == nil,
                      !last.content.isEmpty else { return }
                Task { @MainActor in
                    try? await Task.sleep(for: .seconds(1.5))
                    // Re-check inside the task — the user could have started
                    // a new conversation or hit a quota wall during the wait.
                    guard !prefs.hasRequestedReview else { return }
                    requestReview()
                    prefs.hasRequestedReview = true
                    AnalyticsService.shared.capture("review_prompt_shown")
                }
            }
            // Daily quota gate. ViewModel rejects send() and bumps the token;
            // we surface the right UI based on tier.
            .onChange(of: viewModel.quotaBlockedToken) {
                Haptic.light()
                if prefs.subscriptionTier.isPro {
                    proLimitAlertShown = true
                } else {
                    paywallPresented = true
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .overlay(alignment: .topTrailing) {
                HStack(spacing: NMSpace.sm) {
                    FloatingIconButton(
                        systemName: "clock.arrow.circlepath",
                        accessibilityLabel: "Conversation history",
                        dimmed: storedConversations.isEmpty && viewModel.conversation.messages.isEmpty
                    ) {
                        Haptic.light()
                        historyPresented = true
                    }
                    if !viewModel.conversation.messages.isEmpty {
                        FloatingIconButton(
                            systemName: "plus",
                            accessibilityLabel: "New conversation"
                        ) {
                            Haptic.light()
                            persistConversationIfNeeded()
                            viewModel.startNewConversation()
                        }
                        .transition(.opacity.combined(with: .scale))
                    }
                }
                .padding(.trailing, NMSpace.lg)
                .padding(.top, NMSpace.sm)
            }
            .sheet(isPresented: $historyPresented) {
                ConversationHistoryView { restored in
                    persistConversationIfNeeded()       // archive current first
                    viewModel.conversation = restored   // resume target
                }
            }
            .fullScreenCover(isPresented: $paywallPresented) {
                let pkgs = RevenueCatService.shared.paywallPackages
                PaywallView(
                    monthlyPackage: pkgs.monthly,
                    annualPackage: pkgs.annual,
                    analyticsSource: "ask_quota_hit"
                )
            }
            .sheet(isPresented: $proLimitAlertShown) {
                ProQuotaResetSheet(
                    limit: prefs.askDailyLimit,
                    resetTime: nextMidnightDescription()
                ) {
                    proLimitAlertShown = false
                }
                .presentationDetents([.height(340)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(28)
            }
        }
    }

    /// Local-time description of when today's quota resets (midnight today,
    /// formatted as e.g. "in 4h 32m"). Used in the Pro daily-limit sheet so
    /// the user knows exactly when they can ask again without doing math.
    private func nextMidnightDescription() -> String {
        let now = Date()
        let nextMidnight = Calendar.current.startOfDay(for: now.addingTimeInterval(24 * 3600))
        let interval = nextMidnight.timeIntervalSince(now)
        let hours = Int(interval) / 3600
        let minutes = (Int(interval) % 3600) / 60
        if hours == 0 { return "in \(minutes)m" }
        if minutes == 0 { return "in \(hours)h" }
        return "in \(hours)h \(minutes)m"
    }

    /// Upserts the live conversation into SwiftData. Only persists once a
    /// real exchange exists (≥ 1 user message + ≥ 1 completed assistant
    /// message) — partial drafts stay ephemeral.
    private func persistConversationIfNeeded() {
        let convo = viewModel.conversation
        let hasUser = convo.messages.contains { $0.role == .user }
        let hasCompletedAssistant = convo.messages.contains {
            $0.role == .assistant && !$0.isStreaming && !$0.content.isEmpty
        }
        guard hasUser, hasCompletedAssistant else { return }

        let id = convo.id
        let descriptor = FetchDescriptor<StoredConversation>(
            predicate: #Predicate<StoredConversation> { $0.id == id }
        )
        if let existing = try? modelContext.fetch(descriptor).first {
            existing.update(from: convo)
        } else {
            modelContext.insert(StoredConversation(from: convo))
        }
        try? modelContext.save()
    }

    // MARK: - Empty state

    /// A soft green glow falling from the top edge of the Ask page, fading
    /// out around the greeting. Radial from the top so it reads as light
    /// spilling in rather than a hard band; kept low-opacity and behind all
    /// content. Non-interactive.
    private var topGlow: some View {
        // Light mode needs a bit more presence over the cream background;
        // dark mode reads the glow at a lower opacity.
        let peak = colorScheme == .dark ? 0.18 : 0.30
        return RadialGradient(
            gradient: Gradient(colors: [
                NMColor.accent.opacity(peak),
                NMColor.accent.opacity(0.0)
            ]),
            center: .top,
            startRadius: 0,
            endRadius: 360
        )
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }

    private var emptyState: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Sit the greeting a bit above the vertical center rather
                    // than hugging the top. Proportional so it reads right on
                    // any screen size; the page still scrolls if content runs long.
                    Spacer(minLength: 0).frame(height: geo.size.height * 0.18)
                    header
                        .padding(.bottom, NMSpace.sm)
                        .opacity(sectionsVisible[0] ? 1 : 0)
                        .offset(y: sectionsVisible[0] ? 0 : 10)
                    if let recent = savedAnswers.first {
                        Hairline().padding(.vertical, NMSpace.xxl)
                        continueSection(recent: recent)
                            .opacity(sectionsVisible[1] ? 1 : 0)
                            .offset(y: sectionsVisible[1] ? 0 : 10)
                    }
                    Hairline().padding(.vertical, NMSpace.xxl)
                    suggestedSection
                        .opacity(sectionsVisible[2] ? 1 : 0)
                        .offset(y: sectionsVisible[2] ? 0 : 10)
                }
                .padding(.horizontal, NMSpace.lg)
                .frame(maxWidth: 460)
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .scrollDismissesKeyboard(.interactively)
            .task { await staggerInSections() }
        }
    }

    /// Empty-state entrance: header → continue → suggestions fade up 80ms
    /// apart. Plays once per appearance; skipped under Reduce Motion. This is
    /// the page's only motion now that the auto-scrolling capability marquee
    /// is gone — life comes from response, not from chrome moving on its own.
    private func staggerInSections() async {
        guard !reduceMotion else {
            sectionsVisible = Array(repeating: true, count: sectionsVisible.count)
            return
        }
        guard sectionsVisible.contains(false) else { return }
        for i in sectionsVisible.indices {
            withAnimation(.easeOut(duration: 0.45)) { sectionsVisible[i] = true }
            try? await Task.sleep(nanoseconds: 80_000_000)
        }
    }

    /// Surfaces the most-recent saved answer above the suggestion list so the
    /// nurse can resume where they left off in one tap. Hidden when there are
    /// no saves — the empty state stays clean for first-time users.
    @ViewBuilder
    private func continueSection(recent: SavedAnswer) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("CONTINUE", sparkle: false)
            Button {
                router.openSavedAnswer(recent.id)
            } label: {
                HStack(alignment: .center, spacing: NMSpace.base) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(recent.displayTitle)
                            .font(NMFont.displaySM)
                            .foregroundStyle(NMColor.textPrimary)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        Text(continueSubtitle(for: recent))
                            .font(NMFont.bodySM)
                            .foregroundStyle(NMColor.textTertiary)
                    }
                    Spacer(minLength: 0)
                    Image(systemName: "arrow.up.right")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(NMColor.textTertiary)
                }
                .padding(.vertical, NMSpace.base)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
        }
    }

    private func continueSubtitle(for answer: SavedAnswer) -> String {
        let f = RelativeDateTimeFormatter()
        f.unitsStyle = .abbreviated
        return "Saved \(f.localizedString(for: answer.savedAt, relativeTo: Date()))"
    }

    /// Centered greeting — the calm focal point of the empty state. A green
    /// sparkle (the AI signature, mirroring the send button), a time-of-day
    /// greeting personalized with the user's first name, and a learning-framed
    /// invitation underneath. Time wording only — never workplace framing.
    private var header: some View {
        VStack(spacing: NMSpace.md) {
            // Same SF Symbol the Ask tab uses in the bottom bar, so the AI
            // mark reads as one consistent identity across the app.
            Image(systemName: "sparkle")
                .font(.system(size: 27, weight: .regular))
                .foregroundStyle(NMColor.accent)
            VStack(spacing: NMSpace.sm) {
                Text(greetingTitle)
                    .font(NMFont.displayLG)
                    .tracking(-0.8)
                    .foregroundStyle(NMColor.textPrimary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.7)
                Text(greetingSubtitle)
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
                    .multilineTextAlignment(.center)
            }
            if shouldShowQuotaLine {
                quotaLine
                    .padding(.top, NMSpace.xs)
            }
        }
        .frame(maxWidth: .infinity)
    }

    /// A clever, human greeting — time/day-aware and brand-flavored — drawn
    /// from a contextual pool and rotated per launch (see `titleVariant`).
    private var greetingTitle: String {
        let pool = greetingTitlePool
        return pool[titleVariant % pool.count]
    }

    /// The user's first name, or "" when unset.
    private var firstName: String {
        prefs.displayName.split(separator: " ").first.map(String.init) ?? ""
    }

    /// Candidate greetings for right now. Always includes the time-correct
    /// "Good morning/afternoon/evening" line and any day-special line, plus a
    /// rotation of warm, nursing-flavored brand lines (a coffee break with
    /// NurseMind, a quick study break, etc.). Study/clarity framed — never a
    /// shift, floor, or bedside.
    private var greetingTitlePool: [String] {
        let first = firstName
        let n = first.isEmpty ? "" : ", \(first)"        // ", Ephraim"
        let cal = Calendar.current
        let now = Date()
        let hour = cal.component(.hour, from: now)
        let weekday = cal.component(.weekday, from: now)  // 1=Sun … 7=Sat

        var pool: [String] = []

        // Time-correct greeting — always a candidate.
        switch hour {
        case 5..<12:  pool.append("Good morning\(n).")
        case 12..<17: pool.append("Good afternoon\(n).")
        case 17..<22: pool.append("Good evening\(n).")
        default:      pool.append(first.isEmpty ? "Up late?" : "Up late, \(first)?")
        }

        // Day-special flourishes.
        switch weekday {
        case 6:    pool.append("Happy Friday\(n).")
        case 1, 7: pool.append("Happy \(cal.weekdaySymbols[weekday - 1])\(n).")
        case 2:    pool.append(first.isEmpty ? "New week, fresh start." : "New week, \(first).")
        default:   break
        }

        // Warm, brand-flavored, nursing-study lines.
        pool += [
            "A coffee break with NurseMind?",
            first.isEmpty ? "Coffee and NurseMind?"        : "Coffee break, \(first)?",
            "Tea and NurseMind?",
            "Nursing, made clearer.",
            "Let's make nursing make sense.",
            first.isEmpty ? "Let's decode some nursing."   : "Let's decode some nursing, \(first).",
            first.isEmpty ? "Ready when you are."          : "Ready when you are, \(first).",
            first.isEmpty ? "Let's dig in."                : "Let's dig in, \(first).",
            first.isEmpty ? "Where should we start?"       : "Where should we start, \(first)?",
            first.isEmpty ? "What's the question?"         : "What's the question, \(first)?",
            first.isEmpty ? "What's puzzling you?"         : "What's puzzling you, \(first)?",
            first.isEmpty ? "Let's untangle something."    : "Let's untangle something, \(first).",
            first.isEmpty ? "Let's make it click."         : "Let's make it click, \(first).",
            first.isEmpty ? "Stuck on something?"          : "Stuck on something, \(first)?",
            first.isEmpty ? "Got a minute?"                : "Got a minute, \(first)?",
            first.isEmpty ? "One question at a time."      : "One question at a time, \(first).",
            first.isEmpty ? "Ask away."                    : "Ask away, \(first).",
            first.isEmpty ? "Quiz time?"                   : "Quiz time, \(first)?",
            first.isEmpty ? "Study break?"                 : "Study break, \(first)?"
        ]

        return pool
    }

    /// Nursing/learning-framed invitation under the greeting, drawn from a
    /// curated pool and rotated once per app launch (see `greetingVariant`).
    /// Every line is study/clarity-framed — never a shift, floor, or bedside.
    private var greetingSubtitle: String {
        Self.greetingSubtitles[greetingVariant % Self.greetingSubtitles.count]
    }

    /// Subtle, aesthetic invitations under the greeting. Kept calm and
    /// learning-oriented so they read as a premium reference companion, not a
    /// chirpy chatbot. Order is irrelevant — one is picked at random per launch.
    static let greetingSubtitles: [String] = [
        "Ask anything about nursing.",
        "Ask anything — I'll cite it.",
        "Ask me anything in nursing.",
        "What would you like to understand?",
        "What should we make sense of today?",
        "Where would you like to begin?",
        "What are you curious about?",
        "What can I help you learn?",
        "What would you like to review?",
        "What's worth understanding today?",
        "What's on your mind today?",
        "What concept is fuzzy right now?",
        "What would you like to nail down?",
        "What should we work through?",
        "Pharm, labs, drips — ask away.",
        "No question too small.",
        "Every answer comes cited.",
        "Let's make it make sense.",
        "Let's turn confusion into clarity.",
        "Let's untangle something together.",
        "Here to help you think it through.",
        "Bring me a question.",
        "Cited answers, whenever you need them."
    ]

    /// Free tier always sees the count (1/day is the entire daily allowance,
    /// so it has to be visible). Pro tier only sees it inside the last 20 —
    /// no real Pro user hits 50 in a day, so showing it earlier is
    /// anxiety-inducing for no reason.
    private var shouldShowQuotaLine: Bool {
        if !prefs.subscriptionTier.isPro { return true }
        return prefs.askQuotaRemaining <= 20
    }

    @ViewBuilder
    private var quotaLine: some View {
        let remaining = prefs.askQuotaRemaining
        let total = prefs.askDailyLimit
        let isPro = prefs.subscriptionTier.isPro
        if remaining == 0 {
            HStack(spacing: NMSpace.xs) {
                Text(zeroQuotaCopy(total: total, isPro: isPro))
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textSecondary)
                if !isPro {
                    Button {
                        Haptic.light()
                        paywallPresented = true
                    } label: {
                        Text("Upgrade")
                            .font(NMFont.bodySM.weight(.semibold))
                            .foregroundStyle(NMColor.accent)
                    }
                    .buttonStyle(.plain)
                }
            }
        } else if !isPro {
            // Free tier — small lifetime trial cap (3 by default). Dot meter
            // reads at-a-glance: each dot = one remaining lifetime question.
            // Suffix label is "free" because the count never resets — this
            // is a one-time trial, not a daily allowance.
            QuotaMeter(remaining: remaining, total: total, suffix: "free")
        } else {
            Text(remainingCopy(remaining: remaining, total: total))
                .font(NMFont.displayItalicSM)
                .foregroundStyle(NMColor.textTertiary)
        }
    }

    /// Zero-state copy. Free uses lifetime framing ("free questions"), Pro
    /// uses today framing ("questions today") so the reset-at-midnight
    /// expectation is implicit.
    private func zeroQuotaCopy(total: Int, isPro: Bool) -> String {
        if isPro {
            return total == 1 ? "You've used today's question." : "You've used today's \(total) questions."
        } else {
            return total == 1 ? "You've used your free question." : "You've used all \(total) free questions."
        }
    }

    /// Pro-tier daily remaining copy. Free tier doesn't hit this path — it
    /// uses the visual `QuotaMeter` above.
    private func remainingCopy(remaining: Int, total: Int) -> String {
        if remaining == 1 { return "1 of \(total) questions left today" }
        return "\(remaining) of \(total) questions left today"
    }

    /// The hero of the empty state: a small set of personalized questions the
    /// nurse can tap to ask. Editorial rows (serif question + accent arrow),
    /// hairline-separated, with a quiet "Shuffle" control that rotates the
    /// window through a larger pool — variety without auto-motion.
    private var suggestedSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            HStack {
                EyebrowLabel("SUGGESTED", sparkle: false)
                Spacer(minLength: 0)
                if suggestionPool.count > displayedSuggestionCount {
                    Button {
                        Haptic.selection()
                        withAnimation(.easeInOut(duration: 0.28)) {
                            suggestionOffset += displayedSuggestionCount
                        }
                    } label: {
                        HStack(spacing: NMSpace.xs) {
                            Image(systemName: "shuffle")
                                .font(.system(size: 11, weight: .medium))
                            Text("SHUFFLE")
                                .font(NMFont.label)
                                .tracking(1.2)
                        }
                        .foregroundStyle(NMColor.textTertiary)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                }
            }
            VStack(spacing: 0) {
                ForEach(Array(displayedSuggestions.enumerated()), id: \.offset) { idx, suggestion in
                    SuggestionRow(text: suggestion) {
                        // Selection click mirrors the FollowUpRows vocabulary —
                        // picking one of the offered questions, same hardware
                        // feedback iOS pickers use.
                        Haptic.selection()
                        viewModel.inputText = suggestion
                        inputFocused = true
                    }
                    if idx < displayedSuggestions.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
            .id(suggestionOffset)
            .transition(.opacity)
        }
    }

    /// How many suggestions show at once.
    private let displayedSuggestionCount = 5

    /// A larger personalized pool, drawn from the curated role/unit-aware set
    /// with a calendar-day-stable shuffle (deterministic per prefs+day, so it
    /// stays put across navigations and refreshes daily / on profile changes).
    private var suggestionPool: [String] {
        SuggestedQuestionsProvider.questions(
            role: prefs.role,
            unit: prefs.unit,
            icuSubspecialty: prefs.icuSubspecialty,
            count: 20
        )
    }

    /// The current rotating window into `suggestionPool`. "Shuffle" advances
    /// `suggestionOffset` by a full window; the modulo wraps it around.
    private var displayedSuggestions: [String] {
        let pool = suggestionPool
        guard !pool.isEmpty else { return [] }
        let n = min(displayedSuggestionCount, pool.count)
        return (0..<n).map { pool[(suggestionOffset + $0) % pool.count] }
    }

    // MARK: - Input bar

    private var inputBar: some View {
        VStack(spacing: 0) {
            Hairline()
            HStack(spacing: NMSpace.md) {
                TextField("Ask anything about nursing", text: $viewModel.inputText, axis: .vertical)
                    .font(NMFont.bodyLG)
                    .foregroundStyle(NMColor.textPrimary)
                    .focused($inputFocused)
                    .lineLimit(1...4)
                    .submitLabel(.send)
                    .onSubmit { send() }

                if showVoiceButton {
                    VoiceInputButton(
                        isListening: $voiceListening,
                        contextualPhrases: Self.voiceContextualPhrases,
                        isDisabled: viewModel.isStreaming,
                        onWillStart: { inputFocused = false },
                        onTranscript: { text in
                            viewModel.inputText = text
                        }
                    )
                    .transition(.opacity.combined(with: .scale(scale: 0.85)))
                }
                Button {
                    if viewModel.isStreaming {
                        // Stop is a "soft" interrupt — light tap, the way you'd
                        // pull a thread off the loom mid-pattern.
                        Haptic.light()
                        viewModel.cancel()
                    } else {
                        // Send is committal — medium impact mirrors the weight
                        // of "ask the model a question," matching the haptic
                        // grammar Linear and Mercury use on primary submits.
                        Haptic.medium()
                        send()
                    }
                } label: {
                    Image(systemName: viewModel.isStreaming ? "stop.fill" : "arrow.up")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(NMColor.onAccent)
                        // SF Symbol replace effect — the arrow morphs into the
                        // stop square (and back) with a quick crossfade rather
                        // than a jarring swap. Native iOS 17+ API; the icon
                        // change becomes a state transition the eye reads as
                        // "the same button just shifted modes," not "a
                        // different button appeared in the same place."
                        .contentTransition(.symbolEffect(.replace))
                        .frame(width: 32, height: 32)
                        .background(
                            Circle().fill(canSend ? NMColor.accent : NMColor.textQuaternary)
                        )
                }
                .disabled(!canSend && !viewModel.isStreaming)
                .accessibilityLabel(viewModel.isStreaming ? "Stop" : "Send")
            }
            .animation(.easeOut(duration: 0.18), value: showVoiceButton)
            .padding(.leading, NMSpace.base)
            .padding(.trailing, 4)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(NMColor.bgElevated)
                    // The input is the page's single elevated element. On
                    // focus it lifts with one soft shadow — everything else
                    // stays flat hairlines, so this is the one depth cue.
                    .shadow(
                        color: .black.opacity(inputFocused ? 0.10 : 0),
                        radius: inputFocused ? 14 : 0,
                        y: inputFocused ? 5 : 0
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .strokeBorder(
                        inputFocused ? NMColor.accent.opacity(0.55) : NMColor.borderSubtle,
                        lineWidth: inputFocused ? 1.5 : 1
                    )
            )
            .animation(.easeOut(duration: 0.2), value: inputFocused)
            .padding(.horizontal, NMSpace.lg)
            .padding(.vertical, NMSpace.md)
            .background(NMColor.bgPrimary)
            footer
        }
    }

    private var canSend: Bool {
        !viewModel.inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    /// Mic shows when (a) the field is empty so the user has a voice
    /// alternative to typing, or (b) recording is active so the user can tap
    /// stop. Without (b), once the partial transcript fills the field the
    /// emptiness check would flip false and the mic would disappear mid-
    /// utterance, stranding the user without a stop control.
    private var showVoiceButton: Bool {
        voiceListening || viewModel.inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    /// Hand-picked nursing terms passed to the speech recognizer as
    /// `contextualStrings` so common drugs/labs/protocols transcribe correctly
    /// from the first utterance. Kept short — Apple weights all phrases equally
    /// and a long list dilutes each one's prior. The list focuses on terms
    /// most likely to be misrecognized as everyday English ("vancomycin" →
    /// "van so mason", "norepinephrine" → "norepi efferon").
    static let voiceContextualPhrases: [String] = [
        "norepinephrine", "epinephrine", "vasopressin", "phenylephrine",
        "vancomycin", "piperacillin tazobactam", "ceftriaxone", "meropenem",
        "heparin", "enoxaparin", "warfarin", "apixaban",
        "furosemide", "amiodarone", "metoprolol", "labetalol",
        "lactate", "creatinine", "troponin", "BNP", "potassium", "magnesium",
        "MAP", "GFR", "PaO2", "FiO2",
        "BiPAP", "HFNC", "PEEP", "tidal volume",
        "SBAR", "sepsis", "DKA", "ARDS", "CABG", "PCI",
        "Parkland formula", "Surviving Sepsis"
    ]

    private var footer: some View {
        HStack(spacing: NMSpace.xs) {
            Text("Reference only")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
            Text("·")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
            Text("Verify with provider")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
            Text("·")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
            Text("No PHI")
                .font(NMFont.displayItalicSM)
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.horizontal, NMSpace.lg)
        .padding(.bottom, NMSpace.sm)
        .padding(.top, 2)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(NMColor.bgPrimary)
    }

    private func send() {
        // If voice is still capturing, stop it first so the recognizer can't
        // refill the field after we clear it. Toggling the binding asks the
        // VoiceInputButton to tear down its session cleanly.
        if voiceListening {
            voiceListening = false
        }
        AnalyticsService.shared.capture(
            "question_asked",
            properties: [
                "tier": prefs.subscriptionTier.isPro ? "pro" : "free",
                "char_count": viewModel.inputText.count,
                "voice": voiceListening
            ]
        )
        viewModel.send()
        inputFocused = false
    }
}

// MARK: - Suggestion row

private struct SuggestionRow: View {
    let text: String
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(alignment: .center, spacing: NMSpace.base) {
                Text(text)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(NMColor.accent)
            }
            .padding(.vertical, NMSpace.base)
            .contentShape(Rectangle())
        }
        // Same press treatment as FollowUpRows / Welcome CTAs — 0.97 scale +
        // 0.88 opacity dip — so the rows feel tangible rather than passive
        // text. Combined with the selection haptic at the call site, the
        // suggested list feels like a real picker, not a static list.
        .buttonStyle(PressableButtonStyle())
    }
}

// MARK: - Pro daily-limit sheet

/// Editorial-styled "you've hit today's limit" sheet for Pro users (free
/// users see the paywall instead). Matches the rest of the app's design
/// language — eyebrow, serif title, italic subtitle, hairline, single
/// dismiss CTA — instead of a bare iOS alert.
private struct ProQuotaResetSheet: View {
    let limit: Int
    let resetTime: String
    let onDismiss: () -> Void

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                EyebrowLabel("DAILY LIMIT", sparkle: false)
                    .padding(.top, NMSpace.xxl)
                Text("All used up.").displayLG()
                    .padding(.top, NMSpace.md)
                Text("You've used all \(limit) of today's NurseMind Pro questions. Your limit resets at midnight — \(resetTime).")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
                    .lineSpacing(3)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, NMSpace.md)
                Hairline()
                    .padding(.top, NMSpace.xxl)
                    .padding(.bottom, NMSpace.xl)
                Button {
                    Haptic.light()
                    onDismiss()
                } label: {
                    Text("Got it")
                        .font(NMFont.bodyLG.weight(.semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(NMColor.accent)
                        )
                        .foregroundStyle(.white)
                }
                .buttonStyle(.plain)
                Spacer(minLength: 0)
            }
            .padding(.horizontal, NMSpace.lg)
        }
    }
}
