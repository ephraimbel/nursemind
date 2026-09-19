import SwiftUI

/// Phase 2 onboarding showcase: swipeable pages, each a real screen of the
/// product laid out at phone width and shrunk into a frame, so the preview
/// is the product rather than a drawing of it. Ask runs the real answer
/// renderer over an answer composed from a library entry with its own
/// citations; Library draws the real category directory with live counts;
/// Feed sets the brief with the latest published items when they are
/// available. Skip top-right at any time.
struct ShowcaseFlow: View {
    let onComplete: () -> Void
    let onSkip: () -> Void

    @State private var currentPage: Int = 0

    init(onComplete: @escaping () -> Void, onSkip: @escaping () -> Void) {
        self.onComplete = onComplete
        self.onSkip = onSkip
        #if DEBUG
        // Dev-only: open on a given page for screenshots.
        //   SIMCTL_CHILD_NM_SHOWCASE_PAGE=2 simctl launch …
        if let raw = ProcessInfo.processInfo.environment["NM_SHOWCASE_PAGE"], let page = Int(raw) {
            _currentPage = State(initialValue: page)
        }
        #endif
    }

    private let pages: [DemoPage] = {
        var pages = [
            DemoPage(
                id: 0,
                eyebrow: "ASK",
                title: "Cited answers,\nin seconds.",
                description: "Evidence-based, scoped to nursing practice."
            ),
            DemoPage(
                id: 1,
                eyebrow: "LIBRARY",
                title: "A reference,\nrefined.",
                description: "Drugs, drips, labs, procedures — all cited."
            )
        ]
        if ToolsAvailability.calculatorsEnabled {
            pages.append(DemoPage(
                id: 2,
                eyebrow: "TOOLS",
                title: "Calculators\nthat work.",
                description: "MAP, GFR, MEWS — scores and indexes, instantly."
            ))
        }
        pages.append(DemoPage(
            id: 3,
            eyebrow: "FEED",
            title: "What changed\nthis week.",
            description: "FDA, CDC and the journals — cited, matched to your unit."
        ))
        return pages
    }()

    var body: some View {
        VStack(spacing: 0) {
            pageView
            Spacer(minLength: NMSpace.lg)
            pageDots
            Spacer().frame(height: NMSpace.lg)
            actionButton
            skipButton
        }
        .background(NMColor.bgPrimary.ignoresSafeArea())
    }

    // MARK: - Page view

    private var pageView: some View {
        TabView(selection: $currentPage) {
            // Tag by position, not page id — the TOOLS page is conditionally
            // absent, and the Continue button advances by +1.
            ForEach(Array(pages.enumerated()), id: \.element.id) { idx, page in
                showcasePage(page, isActive: idx == currentPage)
                    .tag(idx)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(maxHeight: .infinity)
        // The mark holds its ground while pages swipe beneath it: one slot
        // over the pager at the eyebrow position, sized by a hidden copy of
        // the current eyebrow so its row height matches the page's.
        .overlay(alignment: .topLeading) {
            HStack(spacing: 6) {
                OnboardingMarkSlot(home: "showcase", size: 11)
                EyebrowLabel(pages[min(currentPage, pages.count - 1)].eyebrow, sparkle: false).hidden()
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.md)
            .allowsHitTesting(false)
        }
    }

    @ViewBuilder
    private func showcasePage(_ page: DemoPage, isActive: Bool) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                HStack(spacing: 6) {
                    OnboardingMarkSlot(home: "showcase", size: 11, active: false)
                    EyebrowLabel(page.eyebrow, sparkle: false)
                }
                Text(page.title)
                    .font(NMFont.displayLG)
                    .foregroundStyle(NMColor.textPrimary)
                    .lineSpacing(2)
                    .fixedSize(horizontal: false, vertical: true)
                Text(page.description)
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.md)
            .layoutPriority(1)

            Spacer(minLength: NMSpace.lg)

            PhoneFrame {
                demo(for: page.id, isActive: isActive)
            }
            .padding(.horizontal, NMSpace.lg)
        }
    }

    @ViewBuilder
    private func demo(for id: Int, isActive: Bool) -> some View {
        switch id {
        case 0: AskShowcaseDemo(isActive: isActive)
        case 1: LibraryShowcaseDemo(isActive: isActive)
        case 2: ToolsShowcaseDemo(isActive: isActive)
        case 3: FeedShowcaseDemo(isActive: isActive)
        default: EmptyView()
        }
    }

    // MARK: - Page dots

    private var pageDots: some View {
        HStack(spacing: 8) {
            ForEach(0..<pages.count, id: \.self) { i in
                Circle()
                    .fill(i == currentPage ? NMColor.textPrimary : NMColor.borderSubtle)
                    .frame(width: 7, height: 7)
                    .animation(.easeOut(duration: 0.2), value: currentPage)
            }
        }
    }

    // MARK: - Action button

    private var actionButton: some View {
        VStack(spacing: 0) {
            if currentPage < pages.count - 1 {
                PrimaryCTAButton(title: "Continue") {
                    Haptic.light()
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage += 1
                    }
                }
            } else {
                PrimaryCTAButton(title: "Get started") {
                    Haptic.light()
                    TikTokAnalyticsService.shared.trackTutorialComplete()
                    MetaAnalyticsService.shared.trackTutorialComplete()
                    onComplete()
                }
            }
        }
        .padding(.horizontal, NMSpace.lg)
    }

    // MARK: - Skip button

    private var skipButton: some View {
        Button {
            Haptic.light()
            onSkip()
        } label: {
            Text("Skip")
                .font(NMFont.body)
                .foregroundStyle(NMColor.textTertiary)
        }
        .buttonStyle(PressableButtonStyle())
        .padding(.top, NMSpace.md)
        .padding(.bottom, NMSpace.lg)
    }
}

// MARK: - Page model

private struct DemoPage {
    let id: Int
    let eyebrow: String
    let title: String
    let description: String
}

// MARK: - Screen miniature

/// A real screen, shrunk: the content is laid out at phone width with the
/// product's own type sizes and paddings, then scaled to the frame. Nothing
/// inside is interactive.
struct ScreenMiniature<Content: View>: View {
    static var canvasWidth: CGFloat { 393 }
    static var frameWidth: CGFloat { 260 }
    static var frameHeight: CGFloat { 540 }

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        let scale = Self.frameWidth / Self.canvasWidth
        content
            .frame(width: Self.canvasWidth, height: Self.frameHeight / scale, alignment: .top)
            .scaleEffect(scale, anchor: .topLeading)
            .frame(width: Self.frameWidth, height: Self.frameHeight, alignment: .topLeading)
            .allowsHitTesting(false)
            .accessibilityHidden(true)
    }
}

/// A hairline that draws itself in from the left.
private struct DrawnHairline: View {
    let drawn: Bool
    var color: Color = NMColor.borderSubtle

    var body: some View {
        GeometryReader { geo in
            Rectangle()
                .fill(color)
                .frame(width: drawn ? geo.size.width : 0, height: 1)
        }
        .frame(height: 1)
    }
}

// MARK: - Demo 1 · Ask, on the real renderer

/// The answer the Ask page shows. Composed from the library's own potassium
/// entry with that entry's citations, the way the mock service grounds every
/// answer, so the preview never states anything the product cannot cite. A
/// reference question keeps the answer to a lede and a cited table, which
/// fits the frame whole; the mock's bedside trio maps tier actions to rows
/// mechanically, so it is left to the real server.
struct AskShowcaseScript: Sendable {
    static let query = "Potassium reference values?"
    static let entryID = "lab:potassium"

    let query: String
    let content: String
    let citations: [CitationSource]
    let entryID: String

    nonisolated static func load(registry: ContentRegistry = .shared) -> AskShowcaseScript? {
        guard let entry = registry.entry(byID: entryID) else { return nil }
        let answer = MockAskService.composeAnswer(for: entry, query: query)
        return AskShowcaseScript(query: query, content: answer.text, citations: answer.citations, entryID: entry.id)
    }

    func message(content: String) -> AskMessage {
        var message = AskMessage(role: .assistant, content: content, citations: citations)
        message.libraryEntryIDs = [entryID]
        return message
    }
}

/// The Ask conversation, driven exactly as the product drives it: the
/// question under its eyebrow, the thinking line with server stages, then
/// the answer landing block by block through `MessageBodyView`, the
/// streaming cursor, and the provenance strip once it is complete.
private struct AskShowcaseDemo: View {
    let isActive: Bool

    @State private var script: AskShowcaseScript?
    @State private var messageID = UUID()
    @State private var queryVisible = false
    @State private var answering = false
    @State private var stage: String?
    @State private var revealed = ""
    @State private var streaming = true

    var body: some View {
        ScreenMiniature {
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: NMSpace.xl) {
                        if let script, queryVisible {
                            userRow(script)
                                .transition(.opacity.combined(with: .offset(y: OnboardingMotion.rise)))
                        }
                        if let script, answering {
                            assistantRow(script)
                                .transition(.opacity.combined(with: .offset(y: OnboardingMotion.rise)))
                        }
                        Color.clear.frame(height: 1).id("end")
                    }
                    .padding(.horizontal, NMSpace.lg)
                    .padding(.top, NMSpace.xl)
                    .padding(.bottom, NMSpace.xxl)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .animation(.easeOut(duration: OnboardingMotion.base), value: queryVisible)
                    .animation(.easeOut(duration: OnboardingMotion.base), value: answering)
                }
                .scrollDisabled(true)
                // The conversation follows the answer down as blocks land,
                // as the real one does.
                .onChange(of: revealed) { _, _ in
                    withAnimation(.easeOut(duration: OnboardingMotion.base)) { proxy.scrollTo("end", anchor: .bottom) }
                }
                .onChange(of: streaming) { _, _ in
                    withAnimation(.easeOut(duration: OnboardingMotion.base)) { proxy.scrollTo("end", anchor: .bottom) }
                }
            }
        }
        .task(id: isActive) {
            guard isActive else { return }
            if script == nil {
                script = await Task.detached(priority: .userInitiated) { AskShowcaseScript.load() }.value
            }
            await run()
        }
    }

    private func userRow(_ script: AskShowcaseScript) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            EyebrowLabel("YOU", sparkle: false)
            Text(script.query)
                .font(NMFont.displaySM)
                .foregroundStyle(NMColor.textPrimary)
                .lineSpacing(4)
        }
    }

    private func assistantRow(_ script: AskShowcaseScript) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.base) {
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                EyebrowLabel("NURSEMIND", animated: true)
                if !streaming {
                    ProvenanceStrip(message: script.message(content: revealed))
                        .transition(.opacity)
                }
            }
            if revealed.isEmpty {
                ThinkingIndicator(stage: stage)
            } else {
                VStack(alignment: .leading, spacing: NMSpace.base) {
                    MessageBodyView(content: revealed, citations: script.citations, cacheKey: messageID, libraryEntryIDs: [script.entryID])
                    if streaming {
                        StreamingCursor()
                            .padding(.top, 2)
                    }
                }
            }
        }
        .animation(.easeOut(duration: OnboardingMotion.quick), value: streaming)
        .animation(.easeOut(duration: OnboardingMotion.quick), value: revealed.isEmpty)
    }

    /// Question → thinking, with the stages the server reports → blocks
    /// landing one at a time → complete. Holds, then plays again.
    private func run() async {
        guard let script else { return }
        while !Task.isCancelled && isActive {
            queryVisible = false
            answering = false
            revealed = ""
            streaming = true
            stage = nil
            messageID = UUID()
            try? await Task.sleep(for: .milliseconds(600))

            queryVisible = true
            try? await Task.sleep(for: .milliseconds(750))

            answering = true
            stage = AnthropicAskService.stageLabel("reading", sources: script.citations.count)
            try? await Task.sleep(for: .milliseconds(950))
            stage = AnthropicAskService.stageLabel("writing", sources: nil)
            try? await Task.sleep(for: .milliseconds(550))

            var buffer = script.content
            while !Task.isCancelled, isActive,
                  let (unit, rest) = AskViewModel.nextRevealUnit(in: buffer, streamEnded: true) {
                buffer = rest
                revealed += unit
                try? await Task.sleep(for: .milliseconds(unit.count > 90 ? 560 : 340))
            }
            guard !Task.isCancelled, isActive else { return }
            streaming = false

            try? await Task.sleep(for: .seconds(4.5))
        }
    }
}

// MARK: - Demo 2 · Library, on the real directory

/// The Library home as it is: eyebrow, serif title, italic count line, then
/// the category directory with live counts from the registry. Rows land
/// one after another and draw their hairlines in beneath them.
private struct LibraryShowcaseDemo: View {
    let isActive: Bool

    private struct Row: Identifiable, Sendable {
        let category: EntryCategory
        let count: Int
        let descriptor: String
        var id: EntryCategory { category }
    }

    @State private var rows: [Row] = []
    @State private var total = 0
    @State private var drawn = 0

    var body: some View {
        ScreenMiniature {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: NMSpace.md) {
                    EyebrowLabel("YOUR LIBRARY")
                    Text("Library").displayXL()
                    Text("\(total) entries · every one cited")
                        .font(NMFont.displayItalicMD)
                        .foregroundStyle(NMColor.textSecondary)
                        .opacity(total > 0 ? 1 : 0)
                }
                Hairline().padding(.vertical, NMSpace.xl)
                VStack(spacing: 0) {
                    ForEach(Array(rows.enumerated()), id: \.element.id) { idx, row in
                        CategoryRow(
                            name: row.category.displayName,
                            count: row.count,
                            subtitle: row.descriptor,
                            glyph: row.category.glyph,
                            glyphTint: row.category.glyphTint
                        )
                        .opacity(idx < drawn ? 1 : 0)
                        .offset(y: idx < drawn ? 0 : OnboardingMotion.rise)
                        DrawnHairline(drawn: idx < drawn)
                    }
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.xl)
        }
        .task(id: isActive) {
            guard isActive else { return }
            if rows.isEmpty {
                let loaded = await Task.detached(priority: .userInitiated) { Self.loadRows() }.value
                rows = loaded.rows
                total = loaded.total
            }
            drawn = 0
            for index in rows.indices {
                try? await Task.sleep(for: .milliseconds(index == 0 ? 400 : 90))
                guard !Task.isCancelled else { return }
                withAnimation(.easeOut(duration: OnboardingMotion.base)) { drawn = index + 1 }
            }
        }
    }

    nonisolated private static func loadRows() -> (rows: [Row], total: Int) {
        let registry = ContentRegistry.shared
        let rows = registry.allCategories.map { category in
            Row(category: category, count: registry.count(in: category), descriptor: LibraryHomeView.categoryDescriptor(for: category))
        }
        return (rows, registry.all.count)
    }
}

// MARK: - Demo 3 · Tools (calculator)

/// Animated Anion Gap calculator demo in the product's own type: three
/// inputs fill in with a typewriter effect, then the result lands.
private struct ToolsShowcaseDemo: View {
    let isActive: Bool

    @State private var na: String = ""
    @State private var cl: String = ""
    @State private var hco3: String = ""
    @State private var resultVisible: Bool = false
    @State private var focusIndex: Int = -1   // -1 = none, 0 = Na, 1 = Cl, 2 = HCO3

    var body: some View {
        ScreenMiniature {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: NMSpace.md) {
                    EyebrowLabel("RENAL · METABOLIC", sparkle: false)
                    Text("Anion Gap")
                        .font(NMFont.displayLG)
                        .foregroundStyle(NMColor.textPrimary)
                    Text("Acid–base assessment")
                        .font(NMFont.displayItalicMD)
                        .foregroundStyle(NMColor.textSecondary)
                }
                Hairline().padding(.vertical, NMSpace.xl)

                VStack(spacing: 0) {
                    inputRow("Sodium (Na⁺)", value: na, unit: "mEq/L", isFocused: focusIndex == 0)
                    Hairline(color: NMColor.borderSubtle)
                    inputRow("Chloride (Cl⁻)", value: cl, unit: "mEq/L", isFocused: focusIndex == 1)
                    Hairline(color: NMColor.borderSubtle)
                    inputRow("Bicarbonate (HCO₃⁻)", value: hco3, unit: "mEq/L", isFocused: focusIndex == 2)
                }

                if resultVisible {
                    Hairline().padding(.vertical, NMSpace.xl)
                    VStack(alignment: .leading, spacing: NMSpace.sm) {
                        EyebrowLabel("RESULT", sparkle: false)
                        HStack(alignment: .firstTextBaseline, spacing: NMSpace.sm) {
                            Text("14")
                                .font(NMFont.heroNumber)
                                .foregroundStyle(NMColor.textPrimary)
                            Text("mEq/L")
                                .font(NMFont.bodySM)
                                .foregroundStyle(NMColor.textTertiary)
                        }
                        Text("Within normal range (8–16).")
                            .font(NMFont.displayItalicMD)
                            .foregroundStyle(NMColor.textTertiary)
                    }
                    .transition(.opacity.combined(with: .offset(y: OnboardingMotion.rise)))
                }

                Spacer(minLength: 0)
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.xl)
        }
        .task(id: isActive) {
            guard isActive else { return }
            await runFillLoop()
        }
    }

    private func inputRow(_ label: String, value: String, unit: String, isFocused: Bool) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: NMSpace.base) {
            Text(label)
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textPrimary)
            Spacer(minLength: NMSpace.base)
            HStack(spacing: 4) {
                Text(value.isEmpty ? "—" : value)
                    .font(NMFont.monoXL)
                    .foregroundStyle(value.isEmpty ? NMColor.textTertiary : NMColor.textPrimary)
                if isFocused && !value.isEmpty {
                    Rectangle()
                        .fill(NMColor.accent)
                        .frame(width: 1.5, height: 16)
                }
            }
            Text(unit)
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
                .frame(minWidth: 36, alignment: .leading)
        }
        .padding(.vertical, NMSpace.base)
    }

    private func runFillLoop() async {
        while !Task.isCancelled && isActive {
            na = ""
            cl = ""
            hco3 = ""
            resultVisible = false
            focusIndex = -1
            try? await Task.sleep(for: .milliseconds(700))

            focusIndex = 0
            for ch in "138" {
                guard !Task.isCancelled else { return }
                na.append(ch)
                try? await Task.sleep(for: .milliseconds(140))
            }
            try? await Task.sleep(for: .milliseconds(450))

            focusIndex = 1
            for ch in "102" {
                guard !Task.isCancelled else { return }
                cl.append(ch)
                try? await Task.sleep(for: .milliseconds(140))
            }
            try? await Task.sleep(for: .milliseconds(450))

            focusIndex = 2
            for ch in "22" {
                guard !Task.isCancelled else { return }
                hco3.append(ch)
                try? await Task.sleep(for: .milliseconds(140))
            }
            try? await Task.sleep(for: .milliseconds(550))

            focusIndex = -1
            withAnimation(.easeOut(duration: OnboardingMotion.base)) {
                resultVisible = true
            }

            try? await Task.sleep(for: .seconds(2.8))
        }
    }
}

// MARK: - Demo 4 · Feed, the brief

/// The Feed's brief as it is set in the app: the dated masthead, then the
/// latest published items, the first as the lead. Live items are used the
/// moment the store has them; until then, three real published items
/// bundled with the app stand in. The refresh doubles as a prefetch, so
/// the Feed tab is ready when the nurse gets there.
private struct FeedShowcaseDemo: View {
    let isActive: Bool

    @State private var store = FeedStore.shared
    @State private var visible = 0

    private var items: [FeedItem] {
        let live = Array(store.items.prefix(3))
        return live.isEmpty ? FeedShowcaseFixture.items : live
    }

    var body: some View {
        ScreenMiniature {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: NMSpace.md) {
                    EyebrowLabel(Self.masthead(for: Date()))
                    Text("The Brief")
                        .font(NMFont.displayXL)
                        .tracking(-1.6)
                        .foregroundStyle(NMColor.textPrimary)
                    Text("Cited updates from the agencies and journals.")
                        .font(NMFont.displayItalicMD)
                        .foregroundStyle(NMColor.textSecondary)
                }
                Hairline().padding(.top, NMSpace.xl)
                VStack(spacing: 0) {
                    ForEach(Array(items.enumerated()), id: \.element.id) { idx, item in
                        FeedShowcaseCard(item: item, isLead: idx == 0)
                            .opacity(idx < visible ? 1 : 0)
                            .offset(y: idx < visible ? 0 : OnboardingMotion.rise)
                        DrawnHairline(drawn: idx < visible)
                    }
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.xl)
        }
        .task(id: isActive) {
            guard isActive else { return }
            if store.items.isEmpty, store.loadState == .idle {
                Task { await store.refresh() }
            }
            visible = 0
            for index in 0..<3 {
                try? await Task.sleep(for: .milliseconds(index == 0 ? 400 : 160))
                guard !Task.isCancelled else { return }
                withAnimation(.easeOut(duration: OnboardingMotion.base)) { visible = index + 1 }
            }
        }
    }

    nonisolated static func masthead(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter.string(from: date).uppercased()
    }
}

/// `FeedCard`'s face without its engagement side effect: the same eyebrow,
/// headline and dek, in lead and standard sizes.
private struct FeedShowcaseCard: View {
    let item: FeedItem
    let isLead: Bool

    var body: some View {
        HStack(spacing: NMSpace.xs) {
            if item.priority == .urgent {
                Rectangle()
                    .fill(NMColor.alertHigh)
                    .frame(width: isLead ? 4 : 3)
                    .frame(maxHeight: .infinity)
                    .padding(.trailing, NMSpace.xs)
            }
            VStack(alignment: .leading, spacing: isLead ? NMSpace.lg : NMSpace.md) {
                eyebrow
                Text(item.headline)
                    .font(isLead ? NMFont.displayLG : NMFont.displayMD)
                    .tracking(isLead ? -1.2 : -0.6)
                    .foregroundStyle(NMColor.textPrimary)
                    .lineLimit(isLead ? 4 : 3)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Text(item.whyNursesCare)
                    .font(isLead ? NMFont.displayItalicLG : NMFont.displayItalicSM)
                    .foregroundStyle(NMColor.textSecondary)
                    .lineLimit(isLead ? 4 : 3)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(isLead ? 4 : 2)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.vertical, isLead ? NMSpace.xxl : NMSpace.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var eyebrow: some View {
        HStack(spacing: NMSpace.xs) {
            if isLead && item.priority == .urgent {
                Text("URGENT")
                    .font(NMFont.label)
                    .tracking(1.6)
                    .foregroundStyle(NMColor.alertHigh)
                dot
            }
            Text(item.authorityLabel)
                .font(NMFont.label)
                .tracking(1.6)
                .foregroundStyle(item.authorityColor)
            dot
            Text(item.category.label.uppercased())
                .font(NMFont.label)
                .tracking(1.6)
                .foregroundStyle(NMColor.textTertiary)
                .lineLimit(1)
            dot
            Text(Self.age(of: item.displayDate))
                .font(NMFont.label)
                .tracking(1.2)
                .foregroundStyle(NMColor.textTertiary)
                .lineLimit(1)
            dot
            Text("\(item.readMinutes) MIN")
                .font(NMFont.label)
                .tracking(1.2)
                .foregroundStyle(NMColor.textTertiary)
                .lineLimit(1)
        }
    }

    private var dot: some View {
        Text("·")
            .font(NMFont.label)
            .foregroundStyle(NMColor.textQuaternary)
    }

    nonisolated static func age(of date: Date) -> String {
        let interval = Date().timeIntervalSince(date)
        let minutes = Int(interval / 60)
        let hours = minutes / 60
        let days = hours / 24
        switch (days, hours, minutes) {
        case (0, 0, 0..<2):  return "NEW"
        case (0, 0, let m):  return "\(m)M"
        case (0, let h, _):  return "\(h)H"
        case (1, _, _):      return "1D"
        case (2...6, _, _):  return "\(days)D"
        default:
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d"
            return formatter.string(from: date).uppercased()
        }
    }
}
