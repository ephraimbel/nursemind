import SwiftUI

/// Phase 2 onboarding showcase. Four swipeable demo pages — Ask, Library,
/// Tools, NCLEX — each rendering a mini-demo of the real UI inside a clean
/// iPhone frame. Demonstrates what NurseMind is before asking for any user
/// info. Skip top-right at any time.
struct ShowcaseFlow: View {
    let onComplete: () -> Void
    let onSkip: () -> Void

    @State private var currentPage: Int = 0

    private let pages: [DemoPage] = [
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
        ),
        DemoPage(
            id: 2,
            eyebrow: "TOOLS",
            title: "Calculators\nthat work.",
            description: "MAP, GFR, MEWS — the math, done for you."
        ),
        DemoPage(
            id: 3,
            eyebrow: "NCLEX",
            title: "Aligned to\nthe test plan.",
            description: "2026 NCLEX-RN, 8 client needs categories."
        )
    ]

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
            ForEach(pages, id: \.id) { page in
                showcasePage(page)
                    .tag(page.id)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(maxHeight: .infinity)
    }

    @ViewBuilder
    private func showcasePage(_ page: DemoPage) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                EyebrowLabel(page.eyebrow, sparkle: false)
                Text(page.title)
                    .font(NMFont.displayLG)
                    .foregroundStyle(NMColor.textPrimary)
                    .lineSpacing(2)
                Text(page.description)
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.md)

            Spacer(minLength: NMSpace.lg)

            HStack {
                Spacer()
                PhoneFrame {
                    demo(for: page.id)
                }
                Spacer()
            }
        }
    }

    @ViewBuilder
    private func demo(for id: Int) -> some View {
        switch id {
        case 0: AskShowcaseDemo(isActive: currentPage == 0)
        case 1: LibraryShowcaseDemo()
        case 2: ToolsShowcaseDemo(isActive: currentPage == 2)
        case 3: NCLEXShowcaseDemo()
        default: EmptyView()
        }
    }

    // MARK: - Page dots

    private var pageDots: some View {
        HStack(spacing: 8) {
            ForEach(0..<pages.count, id: \.self) { i in
                Circle()
                    .fill(i == currentPage ? NMColor.accent : NMColor.borderSubtle)
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

// MARK: - Demo 1 · Ask streaming

/// Animated Ask demo — matches the real Ask page aesthetic. Query, then
/// `NURSEMIND ✦` eyebrow, then a multi-section response with **bold
/// subheaders** (`Target`, `Monitoring`, `Adjustments`) and inline citation
/// pills at the end of each section. References footer at the bottom.
/// Fills the entire phone frame top-to-bottom, no input bar chrome.
private struct AskShowcaseDemo: View {
    let isActive: Bool

    @State private var queryVisible: Bool = false
    @State private var eyebrowVisible: Bool = false
    @State private var sectionStates: [SectionState] = SectionState.initial
    @State private var referencesVisible: Bool = false

    private struct SectionState {
        var headerVisible: Bool = false
        var body: String = ""
        var pillVisible: Bool = false

        static let initial: [SectionState] = Array(repeating: SectionState(), count: 3)
    }

    private let targetQuery = "MAP target in septic shock?"

    private struct Section {
        let header: String
        let body: String
        let citationLabel: String
        let citationColor: Color
    }

    private var sections: [Section] {
        [
            Section(
                header: "Target",
                body: "Surviving Sepsis Campaign 2021 recommends an initial MAP target of ≥ 65 mmHg in septic shock. Titrate norepinephrine first-line; add vasopressin if higher doses are needed.",
                citationLabel: "SCCM 2021",
                citationColor: NMColor.sourceSociety
            ),
            Section(
                header: "Monitoring",
                body: "Track perfusion markers — lactate clearance, urine output ≥ 0.5 mL/kg/hr, mental status, and capillary refill. Reassess every 30–60 minutes during titration.",
                citationLabel: "Open RN",
                citationColor: NMColor.sourceTextbook
            ),
            Section(
                header: "Adjustments",
                body: "Hypertensive patients may benefit from a higher target (75–85 mmHg) to preserve organ perfusion. Trend MAP against baseline pressure when possible.",
                citationLabel: "SCCM 2021",
                citationColor: NMColor.sourceSociety
            )
        ]
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                // User query
                if queryVisible {
                    Text(targetQuery)
                        .font(.system(size: 14, weight: .regular, design: .serif))
                        .foregroundStyle(NMColor.textPrimary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .transition(.opacity)
                }

                // Assistant response block
                if eyebrowVisible {
                    VStack(alignment: .leading, spacing: 18) {
                        HStack(spacing: 4) {
                            Image(systemName: "sparkle")
                                .font(.system(size: 9, weight: .black))
                                .foregroundStyle(NMColor.accent)
                            Text("NURSEMIND")
                                .font(.system(size: 9, weight: .semibold))
                                .tracking(1.3)
                                .foregroundStyle(NMColor.textTertiary)
                        }

                        ForEach(Array(sections.enumerated()), id: \.offset) { idx, section in
                            sectionView(section: section, state: sectionStates[idx])
                        }

                        if referencesVisible {
                            referencesSection
                                .transition(.opacity)
                        }
                    }
                }
            }
            .padding(.horizontal, 14)
            .padding(.top, 22)
            .padding(.bottom, 22)
        }
        .task(id: isActive) {
            guard isActive else { return }
            await runStreamLoop()
        }
    }

    /// One response section: bold header → streaming body text → inline
    /// citation pill at the end (visually appended, like a footnote chip).
    @ViewBuilder
    private func sectionView(section: Section, state: SectionState) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            if state.headerVisible {
                Text(section.header)
                    .font(.system(size: 13, weight: .bold, design: .serif))
                    .foregroundStyle(NMColor.textPrimary)
                    .transition(.opacity)
            }
            if !state.body.isEmpty {
                if state.pillVisible {
                    // Body + pill on the same flow once pill is visible.
                    bodyWithPill(body: state.body, label: section.citationLabel, color: section.citationColor)
                } else {
                    Text(state.body)
                        .font(.system(size: 12, weight: .regular, design: .serif))
                        .foregroundStyle(NMColor.textPrimary)
                        .lineSpacing(3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }

    /// Body text + an inline citation pill chip at the end. Renders the
    /// chip on a new line with a small leading sparkle dot to evoke the
    /// real Ask page's source-tone citation styling.
    private func bodyWithPill(body: String, label: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(body)
                .font(.system(size: 12, weight: .regular, design: .serif))
                .foregroundStyle(NMColor.textPrimary)
                .lineSpacing(3)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 4) {
                citationPill(label: label, color: color)
                Spacer()
            }
        }
    }

    /// A small inline citation pill chip — colored dot + label, rounded
    /// outline. Matches the visual language of the real CitationPill in
    /// the Ask conversation rendering.
    private func citationPill(label: String, color: Color) -> some View {
        HStack(spacing: 4) {
            Circle()
                .fill(color)
                .frame(width: 8, height: 8)
            Text(label)
                .font(.system(size: 10, weight: .semibold))
                .foregroundStyle(NMColor.link)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 3)
        .background(
            Capsule()
                .fill(NMColor.linkBg)
                .overlay(
                    Capsule().stroke(NMColor.link, lineWidth: 0.75)
                )
        )
    }

    private var referencesSection: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 4) {
                Image(systemName: "list.number")
                    .font(.system(size: 9, weight: .medium))
                    .foregroundStyle(NMColor.textSecondary)
                Text("References")
                    .font(.system(size: 10, weight: .semibold, design: .serif))
                    .foregroundStyle(NMColor.textPrimary)
            }
            referenceRow(num: 1, label: "SCCM Surviving Sepsis 2021")
            referenceRow(num: 2, label: "Open RN Critical Care")
        }
        .padding(.top, 4)
    }

    private func referenceRow(num: Int, label: String) -> some View {
        HStack(alignment: .top, spacing: 5) {
            Text("\(num).")
                .font(.system(size: 10, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
            (
                Text(label)
                    .font(.system(size: 10, weight: .regular, design: .serif))
                    .foregroundStyle(NMColor.link)
                +
                Text(" ↗")
                    .font(.system(size: 8, weight: .medium))
                    .foregroundStyle(NMColor.link)
            )
            Spacer()
        }
    }

    /// Streaming choreography. Reset → query → eyebrow → for each section:
    /// header fades in → body streams word-by-word → pill fades in. Then
    /// references footer. Holds final state then loops.
    private func runStreamLoop() async {
        while !Task.isCancelled && isActive {
            // Reset
            queryVisible = false
            eyebrowVisible = false
            sectionStates = SectionState.initial
            referencesVisible = false
            try? await Task.sleep(for: .milliseconds(700))

            // Query
            withAnimation(.easeOut(duration: 0.25)) { queryVisible = true }
            try? await Task.sleep(for: .milliseconds(600))

            // Eyebrow
            withAnimation(.easeOut(duration: 0.25)) { eyebrowVisible = true }
            try? await Task.sleep(for: .milliseconds(350))

            // Stream each section: header → body words → pill
            for (idx, section) in sections.enumerated() {
                guard !Task.isCancelled, isActive else { return }

                // Section header fade in
                withAnimation(.easeOut(duration: 0.25)) {
                    sectionStates[idx].headerVisible = true
                }
                try? await Task.sleep(for: .milliseconds(250))

                // Stream body word by word
                let words = section.body.split(separator: " ", omittingEmptySubsequences: false)
                for (wIdx, word) in words.enumerated() {
                    guard !Task.isCancelled, isActive else { return }
                    if wIdx == 0 {
                        sectionStates[idx].body = String(word)
                    } else {
                        sectionStates[idx].body += " \(word)"
                    }
                    try? await Task.sleep(for: .milliseconds(55))
                }

                // Pill fade in
                try? await Task.sleep(for: .milliseconds(250))
                withAnimation(.easeOut(duration: 0.3)) {
                    sectionStates[idx].pillVisible = true
                }
                try? await Task.sleep(for: .milliseconds(400))
            }

            // References footer
            try? await Task.sleep(for: .milliseconds(300))
            withAnimation(.easeOut(duration: 0.4)) {
                referencesVisible = true
            }

            // Hold final state
            try? await Task.sleep(for: .seconds(3.5))
        }
    }
}

// MARK: - Demo 2 · Library

/// Static Library home demo — eyebrow + title + 9 browse rows with italic
/// descriptors matching the real Library design. Fills the full phone
/// vertically — no dead space.
private struct LibraryShowcaseDemo: View {
    private let rows: [(name: String, descriptor: String, count: String)] = [
        ("Drugs",          "Cited to FDA · Open RN",        "94"),
        ("Drips",          "Reference doses · titration",    "20"),
        ("Labs",           "Ranges · critical thresholds",   "45"),
        ("Procedures",     "Step-by-step from OpenStax",     "35"),
        ("Diagnoses",      "Pathophysiology · presentation", "103"),
        ("Scenarios",      "Clinical case-based learning",   "19"),
        ("Communication",  "SBAR · TeamSTEPPS",              "21"),
        ("Reference",      "Isolation · immunization",       "15"),
        ("NCLEX-RN",       "2026 Test Plan · 8 categories",  "8"),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 3) {
                Text("✦ YOUR LIBRARY")
                    .font(.system(size: 8, weight: .semibold))
                    .tracking(1.2)
                    .foregroundStyle(NMColor.textTertiary)
                Text("Library")
                    .font(.system(size: 28, weight: .regular, design: .serif))
                    .foregroundStyle(NMColor.textPrimary)
                Text("Med-Surg · 421 entries")
                    .font(.system(size: 10, weight: .regular, design: .serif))
                    .italic()
                    .foregroundStyle(NMColor.textSecondary)
            }
            .padding(.horizontal, 14)
            .padding(.top, 22)
            .padding(.bottom, 10)

            Rectangle().fill(NMColor.borderSubtle).frame(height: 0.5)

            Text("BROWSE")
                .font(.system(size: 8, weight: .semibold))
                .tracking(1.2)
                .foregroundStyle(NMColor.textTertiary)
                .padding(.horizontal, 14)
                .padding(.top, 10)
                .padding(.bottom, 4)

            VStack(spacing: 0) {
                ForEach(Array(rows.enumerated()), id: \.offset) { idx, row in
                    miniRow(row.name, descriptor: row.descriptor, count: row.count)
                    if idx < rows.count - 1 {
                        Rectangle().fill(NMColor.borderSubtle).frame(height: 0.5)
                    }
                }
            }
            .padding(.horizontal, 14)

            Spacer(minLength: 0)
        }
    }

    private func miniRow(_ name: String, descriptor: String, count: String) -> some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 1) {
                Text(name)
                    .font(.system(size: 12, weight: .regular, design: .serif))
                    .foregroundStyle(NMColor.textPrimary)
                Text(descriptor)
                    .font(.system(size: 8, weight: .regular, design: .serif))
                    .italic()
                    .foregroundStyle(NMColor.textTertiary)
            }
            Spacer(minLength: 0)
            Text(count)
                .font(.system(size: 11, weight: .regular, design: .monospaced))
                .foregroundStyle(NMColor.accent)
            Image(systemName: "chevron.right")
                .font(.system(size: 8, weight: .regular))
                .foregroundStyle(NMColor.accent)
                .padding(.leading, 3)
        }
        .padding(.vertical, 5)
    }
}

// MARK: - Demo 3 · Tools (calculator)

/// Animated Anion Gap calculator demo. Three numeric inputs (Na, Cl, HCO3)
/// fill in sequentially with a typewriter effect, then the result block
/// pops in with the calculation + interpretation.
private struct ToolsShowcaseDemo: View {
    let isActive: Bool

    @State private var na: String = ""
    @State private var cl: String = ""
    @State private var hco3: String = ""
    @State private var resultVisible: Bool = false
    @State private var focusIndex: Int = -1   // -1 = none, 0 = Na, 1 = Cl, 2 = HCO3

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text("✦ RENAL · METABOLIC")
                    .font(.system(size: 8, weight: .semibold))
                    .tracking(1.2)
                    .foregroundStyle(NMColor.textTertiary)
                Text("Anion Gap")
                    .font(.system(size: 28, weight: .regular, design: .serif))
                    .foregroundStyle(NMColor.textPrimary)
                Text("Acid-base assessment")
                    .font(.system(size: 11, weight: .regular, design: .serif))
                    .italic()
                    .foregroundStyle(NMColor.textSecondary)
            }
            .padding(.horizontal, 16)
            .padding(.top, 26)
            .padding(.bottom, 14)

            Rectangle().fill(NMColor.borderSubtle).frame(height: 0.5)

            // Animated input rows
            VStack(spacing: 0) {
                inputRow("Sodium (Na⁺)", value: na, unit: "mEq/L", isFocused: focusIndex == 0)
                Rectangle().fill(NMColor.borderSubtle).frame(height: 0.5)
                inputRow("Chloride (Cl⁻)", value: cl, unit: "mEq/L", isFocused: focusIndex == 1)
                Rectangle().fill(NMColor.borderSubtle).frame(height: 0.5)
                inputRow("Bicarbonate (HCO₃⁻)", value: hco3, unit: "mEq/L", isFocused: focusIndex == 2)
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)

            // Result block sits RIGHT BELOW inputs (not pushed to phone frame
            // bottom where the rounded corner would clip it). Flex spacer
            // below absorbs any remaining vertical space.
            if resultVisible {
                Rectangle().fill(NMColor.borderSubtle).frame(height: 0.5)
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                VStack(alignment: .leading, spacing: 4) {
                    Text("RESULT")
                        .font(.system(size: 8, weight: .semibold))
                        .tracking(1.2)
                        .foregroundStyle(NMColor.textTertiary)
                    HStack(alignment: .firstTextBaseline, spacing: 6) {
                        Text("14")
                            .font(.system(size: 44, weight: .regular, design: .serif))
                            .foregroundStyle(NMColor.accent)
                        Text("mEq/L")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(NMColor.textSecondary)
                    }
                    Text("Within normal range (8–16).")
                        .font(.system(size: 10, weight: .regular, design: .serif))
                        .italic()
                        .foregroundStyle(NMColor.textSecondary)
                }
                .padding(.horizontal, 16)
                .padding(.top, 14)
                .transition(.opacity.combined(with: .scale(scale: 0.95)))
            }

            Spacer(minLength: 0)
        }
        .task(id: isActive) {
            guard isActive else { return }
            await runFillLoop()
        }
    }

    private func inputRow(_ label: String, value: String, unit: String, isFocused: Bool) -> some View {
        HStack {
            Text(label)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(NMColor.textPrimary)
            Spacer()
            HStack(spacing: 4) {
                Text(value.isEmpty ? "—" : value)
                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                    .foregroundStyle(value.isEmpty ? NMColor.textTertiary : NMColor.textPrimary)
                if isFocused && !value.isEmpty {
                    Rectangle()
                        .fill(NMColor.accent)
                        .frame(width: 1.5, height: 14)
                        .opacity(0.85)
                }
                Text(unit)
                    .font(.system(size: 10, weight: .regular))
                    .foregroundStyle(NMColor.textTertiary)
            }
        }
        .padding(.vertical, 10)
    }

    private func runFillLoop() async {
        while !Task.isCancelled && isActive {
            // Reset
            na = ""
            cl = ""
            hco3 = ""
            resultVisible = false
            focusIndex = -1
            try? await Task.sleep(for: .milliseconds(700))

            // Type Na = "138"
            focusIndex = 0
            for ch in "138" {
                guard !Task.isCancelled else { return }
                na.append(ch)
                try? await Task.sleep(for: .milliseconds(140))
            }
            try? await Task.sleep(for: .milliseconds(450))

            // Type Cl = "102"
            focusIndex = 1
            for ch in "102" {
                guard !Task.isCancelled else { return }
                cl.append(ch)
                try? await Task.sleep(for: .milliseconds(140))
            }
            try? await Task.sleep(for: .milliseconds(450))

            // Type HCO3 = "22"
            focusIndex = 2
            for ch in "22" {
                guard !Task.isCancelled else { return }
                hco3.append(ch)
                try? await Task.sleep(for: .milliseconds(140))
            }
            try? await Task.sleep(for: .milliseconds(550))

            // Result fade + scale in
            focusIndex = -1
            withAnimation(.easeOut(duration: 0.4)) {
                resultVisible = true
            }

            // Hold
            try? await Task.sleep(for: .seconds(2.8))
        }
    }
}

// MARK: - Demo 4 · NCLEX

/// Static NCLEX Test Plan browse demo. All 8 subcategories with italic
/// parent-category subtitles. Fills the phone vertically — no dead space.
private struct NCLEXShowcaseDemo: View {
    private let rows: [(name: String, parent: String, pct: String)] = [
        ("Management of Care",      "Safe & Effective Care",     "18%"),
        ("Safety & Infection",      "Safe & Effective Care",     "13%"),
        ("Health Promotion",        "Health Promotion",           "9%"),
        ("Psychosocial Integrity",  "Psychosocial Integrity",     "9%"),
        ("Basic Care & Comfort",    "Physiological Integrity",    "9%"),
        ("Pharmacological",         "Physiological Integrity",   "16%"),
        ("Reduction of Risk",       "Physiological Integrity",   "12%"),
        ("Physiological Adapt.",    "Physiological Integrity",   "14%"),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 3) {
                Text("✦ STUDY BY NCLEX")
                    .font(.system(size: 8, weight: .semibold))
                    .tracking(1.2)
                    .foregroundStyle(NMColor.textTertiary)
                Text("Test Plan")
                    .font(.system(size: 28, weight: .regular, design: .serif))
                    .foregroundStyle(NMColor.textPrimary)
                Text("2026 · 8 client needs categories")
                    .font(.system(size: 10, weight: .regular, design: .serif))
                    .italic()
                    .foregroundStyle(NMColor.textSecondary)
            }
            .padding(.horizontal, 14)
            .padding(.top, 22)
            .padding(.bottom, 10)

            Rectangle().fill(NMColor.borderSubtle).frame(height: 0.5)

            VStack(spacing: 0) {
                ForEach(Array(rows.enumerated()), id: \.offset) { idx, row in
                    nclexRow(name: row.name, parent: row.parent, pct: row.pct)
                    if idx < rows.count - 1 {
                        Rectangle().fill(NMColor.borderSubtle).frame(height: 0.5)
                    }
                }
            }
            .padding(.horizontal, 14)
            .padding(.top, 4)

            Spacer(minLength: 0)
        }
    }

    private func nclexRow(name: String, parent: String, pct: String) -> some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 1) {
                Text(name)
                    .font(.system(size: 12, weight: .regular, design: .serif))
                    .foregroundStyle(NMColor.textPrimary)
                    .lineLimit(1)
                Text(parent)
                    .font(.system(size: 8, weight: .regular, design: .serif))
                    .italic()
                    .foregroundStyle(NMColor.textTertiary)
                    .lineLimit(1)
            }
            Spacer(minLength: 0)
            Text(pct)
                .font(.system(size: 12, weight: .regular, design: .monospaced))
                .foregroundStyle(NMColor.accent)
        }
        .padding(.vertical, 5)
    }
}
