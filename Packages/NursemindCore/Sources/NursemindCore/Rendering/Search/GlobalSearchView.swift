import SwiftUI
import SwiftData

/// Global search across Library, Tools, Saved AI answers, and NCLEX categories,
/// with a fall-through "Ask NurseMind" CTA. Presented as a full-height sheet
/// from any tab via `AppRouter.presentSearch()`. Tapping a result dismisses
/// the sheet and routes the underlying tab to the destination — see decisions
/// in the design discussion: search is a quick-lookup interrupt, not a
/// navigation destination, so we collapse the modal once the answer is found.
public struct GlobalSearchView: View {
    @State private var query: String = ""
    @State private var debouncedQuery: String = ""
    @FocusState private var isSearchFocused: Bool
    @State private var router = AppRouter.shared
    @State private var recents = RecentSearchesStore.shared

    @Query(sort: \SavedAnswer.savedAt, order: .reverse)
    private var allSavedAnswers: [SavedAnswer]

    public init() {}

    // MARK: - Computed result sets

    private var libraryResults: [LibraryEntry] {
        guard !debouncedQuery.isEmpty else { return [] }
        return ContentRegistry.shared.search(debouncedQuery, limit: 5)
    }

    private var calculatorResults: [CalculatorEntry] {
        guard !debouncedQuery.isEmpty else { return [] }
        return CalculatorRegistry.search(debouncedQuery, limit: 5)
    }

    private var savedResults: [SavedAnswer] {
        guard !debouncedQuery.isEmpty else { return [] }
        let q = debouncedQuery.lowercased()
        return allSavedAnswers.filter { answer in
            answer.question.lowercased().contains(q) ||
            answer.answerMarkdown.lowercased().contains(q) ||
            (answer.customTitle?.lowercased().contains(q) ?? false)
        }.prefix(5).map { $0 }
    }

    private var nclexResults: [TestPlanSubcategory] {
        guard !debouncedQuery.isEmpty else { return [] }
        let q = debouncedQuery.lowercased()
        return TestPlanSubcategory.inCanonicalOrder.filter { sub in
            sub.displayName.lowercased().contains(q) ||
            sub.parentCategory.displayName.lowercased().contains(q)
        }
    }

    private var hasAnyResults: Bool {
        !libraryResults.isEmpty
            || !calculatorResults.isEmpty
            || !savedResults.isEmpty
            || !nclexResults.isEmpty
    }

    // MARK: - Body

    public var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                searchField
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        if debouncedQuery.isEmpty {
                            emptyQueryContent
                        } else {
                            resultsContent
                        }
                    }
                    .padding(.horizontal, NMSpace.lg)
                    .padding(.bottom, NMSpace.huge)
                }
            }
            .background(GrainBackground())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") { router.dismissSearch() }
                        .foregroundStyle(NMColor.textPrimary)
                }
            }
            .onAppear {
                isSearchFocused = true
            }
            .task(id: query) {
                // Debounce: wait 200ms before committing the query to the
                // result-driving state. Cancellation makes consecutive
                // keystrokes coalesce naturally.
                try? await Task.sleep(nanoseconds: 200_000_000)
                if !Task.isCancelled {
                    debouncedQuery = query
                    if !query.isEmpty {
                        // Capture the *length* and result counts, never the
                        // query text — search terms can be sensitive
                        // ("could my patient have…") even though we never
                        // tie them to PHI in our own systems.
                        AnalyticsService.shared.capture(
                            "search_performed",
                            properties: [
                                "query_length": query.count,
                                "library_results": libraryResults.count,
                                "calculator_results": calculatorResults.count,
                                "saved_results": savedResults.count,
                                "nclex_results": nclexResults.count,
                                "has_any_results": hasAnyResults
                            ]
                        )
                        TikTokAnalyticsService.shared.trackSearch()
                    }
                }
            }
        }
    }

    // MARK: - Search field

    private var searchField: some View {
        HStack(spacing: NMSpace.sm) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
            TextField("Search drugs, calculators, saved answers", text: $query)
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textPrimary)
                .focused($isSearchFocused)
                .submitLabel(.search)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            if !query.isEmpty {
                Button {
                    query = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(NMColor.textTertiary)
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Clear search")
            }
        }
        .padding(.horizontal, NMSpace.md)
        .padding(.vertical, NMSpace.sm + 2)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(NMColor.bgElevated)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(NMColor.borderSubtle, lineWidth: 1)
                )
        )
        .padding(.horizontal, NMSpace.lg)
        .padding(.top, NMSpace.lg)
        .padding(.bottom, NMSpace.lg)
    }

    // MARK: - Empty-query state (recents or hint)

    @ViewBuilder
    private var emptyQueryContent: some View {
        if recents.queries.isEmpty {
            hintSection
        } else {
            recentsSection
        }
    }

    private var hintSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("TRY SEARCHING", sparkle: false)
            Text("Drug names · calculator names · saved answers · NCLEX categories.")
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textSecondary)
                .lineSpacing(3)
        }
        .padding(.top, NMSpace.md)
    }

    private var recentsSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            HStack {
                EyebrowLabel("RECENT", sparkle: false)
                Spacer()
                Button {
                    recents.clear()
                } label: {
                    Text("Clear")
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textTertiary)
                }
                .buttonStyle(.plain)
            }
            VStack(spacing: 0) {
                ForEach(Array(recents.queries.enumerated()), id: \.element) { idx, recent in
                    Button {
                        query = recent
                        debouncedQuery = recent
                    } label: {
                        HStack(spacing: NMSpace.sm) {
                            Image(systemName: "clock")
                                .font(.system(size: 13, weight: .regular))
                                .foregroundStyle(NMColor.textTertiary)
                            Text(recent)
                                .font(NMFont.bodyLG)
                                .foregroundStyle(NMColor.textPrimary)
                            Spacer()
                            Image(systemName: "arrow.up.left")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundStyle(NMColor.textTertiary)
                        }
                        .padding(.vertical, NMSpace.base)
                    }
                    .buttonStyle(.plain)
                    if idx < recents.queries.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
        .padding(.top, NMSpace.md)
    }

    // MARK: - Results

    @ViewBuilder
    private var resultsContent: some View {
        if !hasAnyResults {
            noMatchesState
        } else {
            VStack(alignment: .leading, spacing: 0) {
                if !libraryResults.isEmpty {
                    librarySection
                    sectionDivider
                }
                if !calculatorResults.isEmpty {
                    toolsSection
                    sectionDivider
                }
                if !savedResults.isEmpty {
                    savedSection
                    sectionDivider
                }
                if !nclexResults.isEmpty {
                    nclexSection
                    sectionDivider
                }
                askCTASection
            }
            .padding(.top, NMSpace.md)
        }
    }

    private var sectionDivider: some View {
        Hairline().padding(.vertical, NMSpace.xxl)
    }

    private var noMatchesState: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                EyebrowLabel("NO MATCHES", sparkle: false)
                Text("Nothing in your library matches that.")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
            }
            sectionDivider
            askCTASection
        }
        .padding(.top, NMSpace.md)
    }

    // MARK: - Library section

    private var librarySection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("LIBRARY", sparkle: false)
            VStack(spacing: 0) {
                ForEach(Array(libraryResults.enumerated()), id: \.element.id) { idx, entry in
                    Button {
                        handleLibraryTap(entry)
                    } label: {
                        EntryRow(entry: entry)
                    }
                    .buttonStyle(.plain)
                    if idx < libraryResults.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    // MARK: - Tools section

    private var toolsSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("TOOLS", sparkle: false)
            VStack(spacing: 0) {
                ForEach(Array(calculatorResults.enumerated()), id: \.element.id) { idx, entry in
                    Button {
                        handleCalculatorTap(entry)
                    } label: {
                        CalculatorResultRow(entry: entry)
                    }
                    .buttonStyle(.plain)
                    if idx < calculatorResults.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    // MARK: - Saved section

    private var savedSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("SAVED", sparkle: false)
            VStack(spacing: 0) {
                ForEach(Array(savedResults.enumerated()), id: \.element.id) { idx, answer in
                    Button {
                        handleSavedTap(answer)
                    } label: {
                        SavedAnswerResultRow(answer: answer)
                    }
                    .buttonStyle(.plain)
                    if idx < savedResults.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    // MARK: - NCLEX section

    private var nclexSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("STUDY", sparkle: false)
            VStack(spacing: 0) {
                ForEach(Array(nclexResults.enumerated()), id: \.element) { idx, sub in
                    Button {
                        handleNCLEXTap(sub)
                    } label: {
                        NCLEXResultRow(subcategory: sub)
                    }
                    .buttonStyle(.plain)
                    if idx < nclexResults.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    // MARK: - Ask CTA

    private var askCTASection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("ASK", sparkle: true)
            Button {
                handleAskCTA()
            } label: {
                HStack(alignment: .center, spacing: NMSpace.base) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Ask NurseMind about \u{201C}\(debouncedQuery)\u{201D}")
                            .font(NMFont.displaySM)
                            .foregroundStyle(NMColor.textPrimary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        Text("Cited, scoped to nursing practice")
                            .font(NMFont.bodySM)
                            .foregroundStyle(NMColor.textTertiary)
                    }
                    Spacer(minLength: 0)
                    Image(systemName: "arrow.up.right")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(NMColor.textTertiary)
                }
                .padding(.vertical, NMSpace.base)
            }
            .buttonStyle(.plain)
        }
    }

    // MARK: - Tap handlers

    private func handleLibraryTap(_ entry: LibraryEntry) {
        recents.record(debouncedQuery)
        router.openLibraryEntry(entry.id)
        router.dismissSearch()
    }

    private func handleCalculatorTap(_ entry: CalculatorEntry) {
        recents.record(debouncedQuery)
        router.openCalculator(entry.id)
        router.dismissSearch()
    }

    private func handleSavedTap(_ answer: SavedAnswer) {
        recents.record(debouncedQuery)
        router.openSavedAnswer(answer.id)
        router.dismissSearch()
    }

    private func handleNCLEXTap(_ subcategory: TestPlanSubcategory) {
        recents.record(debouncedQuery)
        router.openNCLEXSubcategory(subcategory)
        router.dismissSearch()
    }

    private func handleAskCTA() {
        let q = debouncedQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return }
        recents.record(q)
        router.switchToAskAndPrefill(q)
        router.dismissSearch()
    }
}

// MARK: - Result rows

private struct CalculatorResultRow: View {
    let entry: CalculatorEntry

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
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
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.vertical, NMSpace.base)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct SavedAnswerResultRow: View {
    let answer: SavedAnswer

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
            VStack(alignment: .leading, spacing: 2) {
                Text(answer.displayTitle)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text(relativeDate)
                    .font(NMFont.monoSM)
                    .foregroundStyle(NMColor.textTertiary)
            }
            Spacer(minLength: 0)
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.vertical, NMSpace.base)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var relativeDate: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: answer.savedAt, relativeTo: Date())
    }
}

private struct NCLEXResultRow: View {
    let subcategory: TestPlanSubcategory

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
            VStack(alignment: .leading, spacing: 2) {
                Text(subcategory.displayName)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                Text(subcategory.parentCategory.displayName)
                    .font(NMFont.displayItalicSM)
                    .foregroundStyle(NMColor.textTertiary)
            }
            Spacer(minLength: 0)
            Text(subcategory.percentLabel)
                .font(NMFont.monoXL)
                .foregroundStyle(NMColor.textTertiary)
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
                .padding(.leading, NMSpace.sm)
        }
        .padding(.vertical, NMSpace.base)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
