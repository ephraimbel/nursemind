import SwiftUI
import SwiftData
import UIKit

public struct LibraryHomeView: View {
    private let registry: ContentRegistry
    @State private var router = AppRouter.shared
    @State private var prefs = UserPreferences.shared

    @Query(sort: \SavedAnswer.savedAt, order: .reverse)
    private var savedAnswers: [SavedAnswer]

    public init(registry: ContentRegistry = .shared) {
        self.registry = registry
    }

    public var body: some View {
        let pinned = prefs.resolvedPinned(in: registry)
        let recents = prefs.resolvedRecents(in: registry)
        let pinnedCalcs = prefs.resolvedPinnedCalculators()
        let recentCalcs = prefs.resolvedRecentCalculators()
        return NavigationStack(path: $router.libraryPath) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    header
                    SearchFieldButton(prompt: searchPrompt) { router.presentSearch() }
                        .padding(.top, NMSpace.lg)
                    LibrarySectionSwitcher(selection: $router.librarySection)
                        .padding(.top, NMSpace.lg)
                    Hairline().padding(.bottom, NMSpace.xl)
                    Group {
                        switch router.librarySection {
                        case .reference:
                            referenceContent(pinned: pinned, recents: recents)
                                .transition(sectionTransition(forward: false))
                        case .tools:
                            toolsContent(pinnedCalcs: pinnedCalcs, recentCalcs: recentCalcs)
                                .transition(sectionTransition(forward: true))
                        }
                    }
                }
                .padding(.horizontal, NMSpace.lg)
                .padding(.top, NMSpace.sm)
                .padding(.bottom, NMSpace.huge)
                // iPad in "Designed for iPhone" mode gives the app a window
                // wider than any iPhone. Cap the content column at iPhone-Pro-
                // Max width so type and spacing stay readable; the cream
                // GrainBackground around it fills the rest of the window.
                .frame(maxWidth: 460)
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .background(GrainBackground())
            .navigationDestination(for: LibraryDestination.self) { dest in
                switch dest {
                case .category(let category):
                    CategoryListView(category: category, registry: registry)
                case .entry(let id):
                    if let entry = registry.entry(byID: id) {
                        LibraryEntryView(entry)
                    } else {
                        Text("Entry not found").captionText()
                    }
                case .savedList:
                    SavedAnswersListView()
                case .savedEntry(let id):
                    if let answer = savedAnswers.first(where: { $0.id == id }) {
                        SavedAnswerEntryView(answer)
                    } else {
                        Text("Saved answer not found").captionText()
                    }
                case .nclexBrowse:
                    NCLEXBrowseView(registry: registry)
                case .nclexSubcategory(let sub):
                    NCLEXSubcategoryListView(subcategory: sub, registry: registry)
                case .calculator(let id):
                    CalculatorDetailRouter(calculatorID: id)
                case .calculatorCategory(let category):
                    CalculatorListView(category: category)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }

    /// Slide-in / slide-out transition between sections. `forward = true` slides
    /// in from the trailing edge (Tools), `false` from the leading edge (Library).
    private func sectionTransition(forward: Bool) -> AnyTransition {
        let edge: Edge = forward ? .trailing : .leading
        return .asymmetric(
            insertion: .move(edge: edge).combined(with: .opacity),
            removal: .move(edge: edge == .trailing ? .leading : .trailing).combined(with: .opacity)
        )
    }

    // MARK: - Section bodies

    @ViewBuilder
    private func referenceContent(pinned: [LibraryEntry], recents: [LibraryEntry]) -> some View {
        // Frequency-of-use order: the rows a returning user is most likely to
        // tap (pinned, recently viewed) come before the full browse directory.
        VStack(alignment: .leading, spacing: 0) {
            if !pinned.isEmpty {
                pinnedSection(entries: pinned)
                Hairline().padding(.vertical, NMSpace.xl)
            }
            if !recents.isEmpty {
                recentlyViewedSection(entries: recents)
                Hairline().padding(.vertical, NMSpace.xl)
            }
            if !savedAnswers.isEmpty {
                savedSection
                Hairline().padding(.vertical, NMSpace.xl)
            }
            browseSection
        }
    }

    @ViewBuilder
    private func toolsContent(pinnedCalcs: [CalculatorEntry], recentCalcs: [CalculatorEntry]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if !pinnedCalcs.isEmpty {
                pinnedCalculatorsSection(entries: pinnedCalcs)
                Hairline().padding(.vertical, NMSpace.xl)
            }
            if !recentCalcs.isEmpty {
                recentCalculatorsSection(entries: recentCalcs)
                Hairline().padding(.vertical, NMSpace.xl)
            }
            toolsSection
        }
    }

    // MARK: - Header

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel(headerEyebrow)
            Text(headerTitle).displayXL()
            Text(headerSubtitle)
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
        }
    }

    private var searchPrompt: String {
        switch router.librarySection {
        case .reference: return "Search drugs, labs, procedures…"
        case .tools:     return "Search calculators…"
        }
    }

    private var headerEyebrow: String {
        switch router.librarySection {
        case .reference: return "YOUR LIBRARY"
        case .tools:     return "YOUR TOOLS"
        }
    }

    private var headerTitle: String {
        switch router.librarySection {
        case .reference: return "Library"
        case .tools:     return "Tools"
        }
    }

    private var headerSubtitle: String {
        switch router.librarySection {
        case .reference:
            return "\(prefs.unit.displayName) · \(registry.all.count) entries"
        case .tools:
            return "\(CalculatorRegistry.all.count) calculators · \(CalculatorCategory.allCases.count) categories"
        }
    }

    // MARK: - Pinned

    private func pinnedSection(entries: [LibraryEntry]) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("PINNED", sparkle: false)
            VStack(spacing: 0) {
                ForEach(Array(entries.enumerated()), id: \.element.id) { idx, entry in
                    NavigationLink(value: LibraryDestination.entry(entry.id)) {
                        EntryRow(entry: entry)
                    }
                    .buttonStyle(.plain)
                    if idx < entries.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    // MARK: - Saved AI answers

    private var savedSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("SAVED", sparkle: false)
            VStack(spacing: 0) {
                NavigationLink(value: LibraryDestination.savedList) {
                    SavedSummaryRow(count: savedAnswers.count, mostRecent: savedAnswers.first)
                }
                .buttonStyle(.plain)
            }
        }
    }

    // MARK: - Browse by category

    /// 8 functional categories (Drugs, Drips, Labs, etc.) plus the NCLEX
    /// Test Plan as a peer browse target. Folding NCLEX in here keeps a
    /// single mental model — every way to browse the library lives in BROWSE.
    private var browseSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("BROWSE", sparkle: false)
            VStack(spacing: 0) {
                ForEach(registry.allCategories, id: \.self) { category in
                    NavigationLink(value: LibraryDestination.category(category)) {
                        CategoryRow(
                            name: category.displayName,
                            count: registry.count(in: category),
                            subtitle: Self.categoryDescriptor(for: category),
                            glyph: category.glyph,
                            glyphTint: category.glyphTint
                        )
                    }
                    .buttonStyle(.plain)
                    Hairline(color: NMColor.borderSubtle)
                }
                NavigationLink(value: LibraryDestination.nclexBrowse) {
                    CategoryRow(
                        name: "NCLEX-RN Test Plan",
                        count: TestPlanSubcategory.inCanonicalOrder.count,
                        subtitle: "Aligned to 2026 Test Plan",
                        glyph: "graduationcap"
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }

    /// Editorial descriptor for each browse category. Renders as italic
    /// textTertiary subtitle under the category title — gives each row real
    /// character so the BROWSE list reads like a curated table of contents
    /// rather than a generic directory.
    private static func categoryDescriptor(for category: EntryCategory) -> String {
        switch category {
        case .drug:          return "Doses · interactions · monitoring"
        case .drip:          return "Reference doses · titration"
        case .lab:           return "Ranges · critical thresholds"
        case .procedure:     return "Step-by-step nursing skills"
        case .diagnosis:     return "Pathophysiology · presentation"
        case .scenario:      return "Clinical case-based learning"
        case .communication: return "SBAR · handoffs · escalation"
        case .reference:     return "Isolation · immunization · pain"
        }
    }

    // MARK: - Tools (merged from defunct Tools tab)

    /// Calculator categories list — Cardiovascular, Respiratory, etc. — with
    /// counts and accent-green chevrons. Mirrors the BROWSE library section
    /// for visual consistency. Tapping pushes CalculatorListView.
    private var toolsSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("TOOLS", sparkle: false)
            VStack(spacing: 0) {
                let categories = CalculatorCategory.allCases.sorted { $0.browseOrder < $1.browseOrder }
                ForEach(Array(categories.enumerated()), id: \.element) { idx, category in
                    NavigationLink(value: LibraryDestination.calculatorCategory(category)) {
                        CategoryRow(
                            name: category.displayName,
                            count: CalculatorRegistry.count(in: category),
                            subtitle: Self.toolsCategoryDescriptor(for: category),
                            glyph: category.glyph
                        )
                    }
                    .buttonStyle(.plain)
                    if idx < categories.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    /// Italic descriptor under each calculator category. Same editorial
    /// pattern as library category descriptors above.
    private static func toolsCategoryDescriptor(for category: CalculatorCategory) -> String {
        switch category {
        case .cardiovascular: return "MAP · cardiac index · BP scores"
        case .respiratory:    return "P/F ratio · A-a gradient · vent"
        case .renalMetabolic: return "GFR · CrCl · anion gap"
        case .hepatic:        return "MELD · Child-Pugh · MELD-Na"
        case .hematology:     return "ANC · INR · transfusion"
        case .burns:          return "TBSA · fluid resuscitation"
        case .riskScores:     return "Sepsis · stroke · mortality"
        case .anthropometry:  return "BMI · BSA · ideal weight"
        case .conversions:    return "Units · drips · weights"
        }
    }

    // MARK: - Pinned calculators

    private func pinnedCalculatorsSection(entries: [CalculatorEntry]) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("PINNED TOOLS", sparkle: false)
            VStack(spacing: 0) {
                ForEach(Array(entries.enumerated()), id: \.element.id) { idx, entry in
                    NavigationLink(value: LibraryDestination.calculator(entry.id)) {
                        CalculatorHomeRow(entry: entry)
                    }
                    .buttonStyle(.plain)
                    if idx < entries.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    // MARK: - Recent calculators

    private func recentCalculatorsSection(entries: [CalculatorEntry]) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("RECENTLY USED TOOLS", sparkle: false)
            VStack(spacing: 0) {
                ForEach(Array(entries.enumerated()), id: \.element.id) { idx, entry in
                    NavigationLink(value: LibraryDestination.calculator(entry.id)) {
                        CalculatorHomeRow(entry: entry)
                    }
                    .buttonStyle(.plain)
                    if idx < entries.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    // MARK: - Recently viewed

    private func recentlyViewedSection(entries: [LibraryEntry]) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("RECENTLY VIEWED", sparkle: false)
            VStack(spacing: 0) {
                ForEach(Array(entries.enumerated()), id: \.element.id) { idx, entry in
                    NavigationLink(value: LibraryDestination.entry(entry.id)) {
                        EntryRow(entry: entry)
                    }
                    .buttonStyle(.plain)
                    if idx < entries.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }
}

// MARK: - Calculator + Bundle home rows (used in pinned/recent sections)

private struct CalculatorHomeRow: View {
    let entry: CalculatorEntry
    @State private var prefs = UserPreferences.shared

    private var locked: Bool {
        !prefs.subscriptionTier.isPro && !FreeTier.isFreeCalculator(entry.id)
    }

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
            CategoryGlyphCell(symbol: entry.category.glyph, tint: NMColor.textSecondary, size: 14)
            VStack(alignment: .leading, spacing: 2) {
                Text(entry.title)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                Text(entry.subtitle)
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textTertiary)
                    .lineLimit(1)
            }
            Spacer(minLength: 0)
            if locked {
                Image(systemName: "lock.fill")
                    .font(.system(size: 11, weight: .regular))
                    .foregroundStyle(NMColor.textTertiary)
                    .accessibilityLabel("Pro")
            }
            Image(systemName: "chevron.right")
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.vertical, NMSpace.md)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }
}


// MARK: - Entry row

struct EntryRow: View {
    let entry: LibraryEntry
    /// Inside a category list every row shares the category, so falling back
    /// to the category name as a subtitle is pure noise — pass `true` there.
    /// Mixed-context lists (search, pinned, recents) keep the fallback.
    var hidesCategoryFallback: Bool = false
    @State private var prefs = UserPreferences.shared

    private var locked: Bool {
        !prefs.subscriptionTier.isPro && !FreeTier.isFreeEntry(entry.id)
    }

    private var rowSubtitle: String? {
        if let subtitle = entry.subtitle, !subtitle.isEmpty {
            return subtitle
        }
        return hidesCategoryFallback ? nil : entry.category.singularName
    }

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
            CategoryGlyphCell(symbol: entry.category.glyph, tint: entry.category.glyphTint, size: 14)
            VStack(alignment: .leading, spacing: 2) {
                Text(entry.title)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                // High-alert lives on the metadata line, never inline with the
                // title — inline placement wraps badly on two-line drug names.
                if entry.isHighAlert || entry.isHighRisk || rowSubtitle != nil {
                    HStack(spacing: NMSpace.sm) {
                        if entry.isHighAlert {
                            SmallHighAlertChip()
                        } else if entry.isHighRisk {
                            SmallHighRiskChip()
                        }
                        if let rowSubtitle {
                            Text(rowSubtitle)
                                .font(NMFont.bodySM)
                                .foregroundStyle(NMColor.textTertiary)
                                .lineLimit(1)
                        }
                    }
                }
            }
            Spacer(minLength: 0)
            if locked {
                Image(systemName: "lock.fill")
                    .font(.system(size: 11, weight: .regular))
                    .foregroundStyle(NMColor.textTertiary)
                    .accessibilityLabel("Pro")
            }
            Image(systemName: "chevron.right")
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.vertical, NMSpace.md)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }
}

private struct SmallHighAlertChip: View {
    var body: some View {
        Text("HIGH-ALERT")
            .font(.system(size: 9, weight: .medium))
            .tracking(1.0)
            .foregroundStyle(NMColor.alertHigh)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(
                RoundedRectangle(cornerRadius: 3)
                    .fill(NMColor.alertHighBg)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(NMColor.alertHighBorder, lineWidth: 1)
                    )
            )
    }
}

private struct SmallHighRiskChip: View {
    var body: some View {
        Text("HIGH-RISK")
            .font(.system(size: 9, weight: .medium))
            .tracking(1.0)
            .foregroundStyle(NMColor.textTertiary)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(NMColor.border, lineWidth: 1)
            )
    }
}

// MARK: - Category row (Browse list)

private struct CategoryRow: View {
    let name: String
    let count: Int
    let subtitle: String?
    let glyph: String?
    let glyphTint: Color

    init(name: String, count: Int, subtitle: String? = nil, glyph: String? = nil, glyphTint: Color = NMColor.textSecondary) {
        self.name = name
        self.count = count
        self.subtitle = subtitle
        self.glyph = glyph
        self.glyphTint = glyphTint
    }

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
            if let glyph {
                CategoryGlyphCell(symbol: glyph, tint: glyphTint)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                if let subtitle {
                    Text(subtitle)
                        .font(NMFont.displayItalicSM)
                        .foregroundStyle(NMColor.textTertiary)
                }
            }
            Spacer(minLength: 0)
            Text("\(count)")
                .font(NMFont.mono)
                .foregroundStyle(NMColor.textTertiary)
            Image(systemName: "chevron.right")
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
                .padding(.leading, NMSpace.sm)
        }
        .padding(.vertical, NMSpace.md)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }
}

// MARK: - Saved summary row

private struct SavedSummaryRow: View {
    let count: Int
    let mostRecent: SavedAnswer?

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Your saved answers")
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                Text(subtitle)
                    .font(NMFont.displayItalicSM)
                    .foregroundStyle(NMColor.textSecondary)
                    .lineLimit(1)
            }
            Spacer(minLength: 0)
            if count > 0 {
                Text("\(count)")
                    .font(NMFont.mono)
                    .foregroundStyle(NMColor.textTertiary)
            }
            Image(systemName: "chevron.right")
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
                .padding(.leading, NMSpace.sm)
        }
        .padding(.vertical, NMSpace.md)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }

    private var subtitle: String {
        if let recent = mostRecent {
            return recent.displayTitle
        }
        return "Bookmark any AI answer to save it here"
    }
}

// MARK: - Section switcher (Library / Tools)

/// Two-segment switcher at the top of LibraryHomeView. Editorial pattern: bare
/// text labels with an animated accent-green underline on the active segment.
/// Mental model is "tabs within a tab" — same Library bottom tab, two pages.
private struct LibrarySectionSwitcher: View {
    @Binding var selection: AppRouter.LibrarySection
    @Namespace private var underlineNS

    var body: some View {
        HStack(spacing: NMSpace.xxl) {
            ForEach(AppRouter.LibrarySection.allCases, id: \.self) { section in
                segment(section)
            }
            Spacer(minLength: 0)
        }
        .padding(.bottom, NMSpace.md)
    }

    private func segment(_ section: AppRouter.LibrarySection) -> some View {
        let isActive = selection == section
        return Button {
            guard !isActive else { return }
            UISelectionFeedbackGenerator().selectionChanged()
            withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                selection = section
            }
        } label: {
            VStack(spacing: 8) {
                Text(section.rawValue)
                    .font(NMFont.displaySM)
                    .foregroundStyle(isActive ? NMColor.textPrimary : NMColor.textTertiary)
                ZStack {
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 2)
                    if isActive {
                        Capsule()
                            .fill(NMColor.accent)
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "underline", in: underlineNS)
                    }
                }
            }
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Navigation destinations

public enum LibraryDestination: Hashable {
    case category(EntryCategory)
    case entry(String)   // resolved by ContentRegistry.entry(byID:)
    case savedList                    // user's saved AI answers
    case savedEntry(UUID)             // a single saved answer by id
    case nclexBrowse                  // 2026 NCLEX-RN Test Plan browse view
    case nclexSubcategory(TestPlanSubcategory)
    // MARK: - Tools (merged from defunct Tools tab)
    case calculator(String)                       // calculator id
    case calculatorCategory(CalculatorCategory)
}
