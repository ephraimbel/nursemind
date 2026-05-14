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
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
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

    private var emptyState: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                header
                Hairline().padding(.vertical, NMSpace.xxl)
                if let recent = savedAnswers.first {
                    continueSection(recent: recent)
                    Hairline().padding(.vertical, NMSpace.xxl)
                }
                scopeSection
                Hairline().padding(.vertical, NMSpace.xxl)
                suggestedSection
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.sm)
            .frame(maxWidth: 460)
            .frame(maxWidth: .infinity, alignment: .center)
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

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("NURSEMIND AI")
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text("Ask ")
                    .font(NMFont.displayXL).tracking(-1.6).foregroundStyle(NMColor.textPrimary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)
                Text("anything")
                    .font(NMFont.displayItalicLG)
                    .foregroundStyle(NMColor.textPrimary)
                    .baselineOffset(8)
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)
            }
            Text("Evidence-based, cited, scoped to nursing practice.")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
            if shouldShowQuotaLine {
                quotaLine
                    .padding(.top, NMSpace.xs)
            }
        }
    }

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

    /// "WHAT I KNOW" capabilities surfaced as a continuous marquee. Cards
    /// drift right-to-left at constant velocity, looping seamlessly via the
    /// classic two-copy pattern: the strip renders the items twice, animates
    /// from offset 0 to offset -setWidth, then `repeatForever` snaps back —
    /// because the second copy is identical to the first, the snap is
    /// invisible. Disabled under Reduce Motion.
    private var scopeSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("WHAT I KNOW", sparkle: false)
            ScopeMarquee(
                items: scopeItems,
                reduceMotion: reduceMotion,
                performAction: performScopeAction
            )
        }
    }

    private var scopeItems: [ScopeItemData] {
        [
            ScopeItemData(
                icon: "books.vertical",
                title: "Cited library",
                detail: "Drugs, drips, labs, procedures, diagnoses, scenarios, communication.",
                action: .openLibrary
            ),
            ScopeItemData(
                icon: "checkmark.seal",
                title: "2026 NCLEX-RN aligned",
                detail: "Tagged across 8 client needs categories.",
                action: .openLibrary
            ),
            ScopeItemData(
                icon: "person.2",
                title: "Specialty-aware",
                detail: "Adapts to ICU, ED, OB, Peds, NICU, Med-Surg.",
                action: nil
            ),
            ScopeItemData(
                icon: "function",
                title: "Calculator handoffs",
                detail: "Pre-fills MAP, GFR, BMI, anion gap from your question.",
                action: .openTools
            ),
            ScopeItemData(
                icon: "bookmark",
                title: "Save & search",
                detail: "Bookmark answers; find them in Library → Saved.",
                action: .openSavedList
            ),
            ScopeItemData(
                icon: "lock.shield",
                title: "Reference scope",
                detail: "Doesn't diagnose, prescribe, or accept PHI.",
                action: nil
            )
        ]
    }

    private func performScopeAction(_ action: ScopeItemData.Action) {
        switch action {
        case .openLibrary:
            router.libraryPath = NavigationPath()
            router.librarySection = .reference
            router.selectedTab = AppRouter.libraryTab
        case .openTools:
            router.openToolsHome()
        case .openSavedList:
            router.openSavedList()
        }
    }

    private var suggestedSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("SUGGESTED", sparkle: false)
            VStack(spacing: 0) {
                ForEach(Array(suggestions.enumerated()), id: \.offset) { idx, suggestion in
                    SuggestionRow(text: suggestion) {
                        // Selection click mirrors the FollowUpRows vocabulary —
                        // the user is picking one of three offered questions,
                        // same hardware feedback iOS pickers use.
                        Haptic.selection()
                        viewModel.inputText = suggestion
                        inputFocused = true
                    }
                    if idx < suggestions.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    /// Three personalized suggestions for this user, drawn from a curated
    /// unit/role-aware pool with a calendar-day-stable shuffle. Recomputes on
    /// every render, but the shuffle is deterministic per (prefs, day) so the
    /// list stays stable across navigations within a session and refreshes
    /// once daily — and immediately whenever the user changes their role,
    /// unit, or ICU subspecialty in Profile.
    private var suggestions: [String] {
        SuggestedQuestionsProvider.questions(
            role: prefs.role,
            unit: prefs.unit,
            icuSubspecialty: prefs.icuSubspecialty
        )
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
            )
            .overlay(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .strokeBorder(NMColor.borderSubtle, lineWidth: 1)
            )
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

// MARK: - Scope card carousel

struct ScopeItemData: Hashable {
    let icon: String
    let title: String
    let detail: String
    let action: Action?

    enum Action: Hashable {
        case openLibrary
        case openTools
        case openSavedList
    }
}

/// Interactive horizontal marquee. Drifts right-to-left at constant velocity
/// driven by a 60Hz timer, but yields to direct user input: a swipe pauses the
/// auto-drift, follows the finger, and resumes drift seamlessly on release.
///
/// Layout: the items are rendered twice in a single HStack with `.fixedSize()`
/// inside an overlay over a `Color.clear` placeholder. The placeholder owns
/// the parent-facing size (full width, 140pt tall) so the wider HStack can't
/// stretch siblings off-screen.
///
/// State model:
/// - `basePhase`: accumulated horizontal offset, wrapped to (-setWidth, 0]
/// - `dragOffset`: live finger delta during an in-flight drag, baked into
///   `basePhase` on release
/// - `lastTick`: last timer tick, used to compute frame-rate-independent dt
///
/// Drift is paused while `isDragging` is true. The wrap function keeps
/// `basePhase` always within one set-width of zero, so the duplicated content
/// always perfectly tiles the visible region in both scroll directions.
private struct ScopeMarquee: View {
    let items: [ScopeItemData]
    let reduceMotion: Bool
    let performAction: (ScopeItemData.Action) -> Void

    @State private var basePhase: CGFloat = 0
    @State private var dragOffset: CGFloat = 0
    @State private var isDragging: Bool = false
    @State private var lastTick: Date = Date()

    private let cardWidth: CGFloat = 220
    private let cardHeight: CGFloat = 140
    private let spacing: CGFloat = NMSpace.md
    private let pixelsPerSecond: CGFloat = 22

    private var setWidth: CGFloat {
        CGFloat(items.count) * (cardWidth + spacing)
    }

    private let timer = Timer.publish(every: 1.0 / 60.0, on: .main, in: .common).autoconnect()

    var body: some View {
        Color.clear
            .frame(height: cardHeight)
            .frame(maxWidth: .infinity)
            .overlay(alignment: .leading) {
                HStack(spacing: spacing) {
                    ForEach(0..<2, id: \.self) { copy in
                        ForEach(Array(items.enumerated()), id: \.offset) { idx, item in
                            cardView(for: item)
                                .id("\(copy)-\(idx)")
                        }
                    }
                }
                .fixedSize()
                .offset(x: wrap(basePhase + dragOffset))
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 8)
                    .onChanged { value in
                        if !isDragging { isDragging = true }
                        dragOffset = value.translation.width
                    }
                    .onEnded { value in
                        basePhase = wrap(basePhase + value.translation.width)
                        dragOffset = 0
                        isDragging = false
                        lastTick = Date()
                    }
            )
            .onAppear { lastTick = Date() }
            .onReceive(timer) { now in
                let dt = now.timeIntervalSince(lastTick)
                lastTick = now
                guard !isDragging, !reduceMotion else { return }
                basePhase = wrap(basePhase - CGFloat(dt) * pixelsPerSecond)
            }
    }

    /// Normalizes any phase into the half-open interval (-setWidth, 0]. With
    /// the items rendered twice, this range guarantees the visible viewport is
    /// always covered by at least one full copy regardless of drift direction.
    private func wrap(_ x: CGFloat) -> CGFloat {
        let m = setWidth
        guard m > 0 else { return x }
        var v = x.truncatingRemainder(dividingBy: m)
        if v > 0 { v -= m }
        return v
    }

    @ViewBuilder
    private func cardView(for item: ScopeItemData) -> some View {
        if let action = item.action {
            Button {
                guard !isDragging else { return }
                performAction(action)
            } label: {
                ScopeCard(item: item)
            }
            .buttonStyle(ScopeCardButtonStyle())
        } else {
            ScopeCard(item: item)
        }
    }
}

private struct ScopeCard: View {
    let item: ScopeItemData

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            HStack(alignment: .top) {
                Image(systemName: item.icon)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(NMColor.accent)
                Spacer(minLength: 0)
                if item.action != nil {
                    Image(systemName: "arrow.up.right")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(NMColor.accent)
                }
            }
            Text(item.title)
                .font(NMFont.title)
                .foregroundStyle(NMColor.textPrimary)
                .lineLimit(1)
            Text(item.detail)
                .font(NMFont.displayItalicSM)
                .foregroundStyle(NMColor.textSecondary)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            Spacer(minLength: 0)
        }
        .padding(NMSpace.base)
        .frame(width: 220, height: 140, alignment: .topLeading)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .stroke(NMColor.borderSubtle, lineWidth: 1)
        )
        .contentShape(RoundedRectangle(cornerRadius: 6))
    }
}

/// Subtle press animation for scope cards — gentle scale + opacity dim. Echoes
/// the press feel of native iOS controls without becoming flashy.
private struct ScopeCardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.85 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
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
