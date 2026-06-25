import SwiftUI

public struct SearchView: View {
    let registry: ContentRegistry
    @State private var query: String = ""
    /// Cached results for the most recently completed search. Recomputed
    /// only when `query` changes (via `.task(id:)`), never on every body
    /// pass — so scrolling and unrelated re-renders don't re-run the scan.
    @State private var results: [LibraryEntry] = []
    /// The trimmed query the cached `results` correspond to. Used to tell a
    /// genuinely empty result ("Nothing matches") apart from the in-flight
    /// debounce window, so the no-results copy never flashes mid-type.
    @State private var searchedQuery: String = ""
    @FocusState private var inputFocused: Bool

    public init(registry: ContentRegistry) {
        self.registry = registry
    }

    private var trimmedQuery: String {
        query.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    public var body: some View {
        let groups = Dictionary(grouping: results) { $0.category }
        let groupOrder = registry.allCategories.filter { groups[$0] != nil }
        let isQuestion = ContentRegistry.looksLikeQuestion(query)
        let settledEmpty = results.isEmpty && searchedQuery == trimmedQuery

        VStack(spacing: 0) {
            searchField
                .padding(.horizontal, NMSpace.lg)
                .padding(.top, NMSpace.base)
                .padding(.bottom, NMSpace.lg)
            Hairline()
            ScrollView {
                if trimmedQuery.isEmpty {
                    emptyState
                } else if !results.isEmpty {
                    VStack(alignment: .leading, spacing: NMSpace.xxl) {
                        ForEach(groupOrder, id: \.self) { category in
                            if let categoryResults = groups[category] {
                                CategoryGroup(category: category, entries: categoryResults)
                            }
                        }
                        if isQuestion {
                            askNursemindCard
                        }
                    }
                    .padding(.horizontal, NMSpace.lg)
                    .padding(.top, NMSpace.xxl)
                    .padding(.bottom, NMSpace.huge)
                } else if settledEmpty {
                    noResults
                }
                // else: mid-debounce with no prior results — show nothing
                // briefly rather than flashing the no-results state.
            }
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { inputFocused = true }
        .task(id: query) { await runSearch() }
    }

    /// Debounced, off-main search. `.task(id: query)` cancels and restarts
    /// this on every keystroke, so the sleep collapses rapid typing into a
    /// single scan, and the heavy `registry.search` runs on a detached task
    /// to keep the main thread free for smooth text input.
    private func runSearch() async {
        let q = trimmedQuery
        guard !q.isEmpty else {
            results = []
            searchedQuery = ""
            return
        }
        try? await Task.sleep(for: .milliseconds(180))
        if Task.isCancelled { return }
        let found = await Task.detached(priority: .userInitiated) { [registry] in
            registry.search(q)
        }.value
        if Task.isCancelled { return }
        results = found
        searchedQuery = q
    }

    private var searchField: some View {
        HStack(spacing: NMSpace.sm) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(NMColor.textTertiary)
            TextField("Search drugs, labs, procedures…", text: $query)
                .focused($inputFocused)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textPrimary)
            if !query.isEmpty {
                Button {
                    query = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(NMColor.textTertiary)
                }
            }
        }
        .padding(.vertical, NMSpace.md)
        .padding(.horizontal, NMSpace.base)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(NMColor.bgElevated)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(NMColor.borderSubtle, lineWidth: 1)
                )
        )
    }

    private var emptyState: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            Text("Search the library.")
                .font(NMFont.displayItalicLG)
                .foregroundStyle(NMColor.textSecondary)
                .padding(.top, NMSpace.huge)
            Text("Drugs, labs, procedures, scenarios, and more — every entry sourced and cited.")
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textTertiary)
                .lineSpacing(4)
        }
        .padding(.horizontal, NMSpace.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var noResults: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            Text("Nothing matches \(Text("\"\(query)\"").italic()).")
                .font(NMFont.displayMD)
                .foregroundStyle(NMColor.textPrimary)
                .padding(.top, NMSpace.huge)
            Text("Try different words, or ask NurseMind.")
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.horizontal, NMSpace.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var askNursemindCard: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("ASK NURSEMIND")
            Text("\"\(query)\"")
                .font(NMFont.displayItalicLG)
                .foregroundStyle(NMColor.textPrimary)
                .lineSpacing(4)
            HStack(spacing: NMSpace.xs) {
                Text("Ask AI")
                    .font(NMFont.title)
                    .foregroundStyle(NMColor.accent)
                Image(systemName: "arrow.right")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(NMColor.accent)
            }
            .padding(.top, NMSpace.sm)
        }
        .padding(.top, NMSpace.lg)
        .padding(.bottom, NMSpace.lg)
    }
}

private struct CategoryGroup: View {
    let category: EntryCategory
    let entries: [LibraryEntry]

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("\(category.displayName.uppercased()) · \(entries.count)", sparkle: false)
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
