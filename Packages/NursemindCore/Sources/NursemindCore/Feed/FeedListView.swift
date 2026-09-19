import SwiftUI
import UIKit

/// Scrollable Feed list. Each card is a NavigationLink pushing FeedReadingView.
/// Pull-to-refresh re-fetches items + saved set. Filter chips below the header
/// scope the visible items to a category or to the user's saved set.
struct FeedListView: View {
    @Binding var path: NavigationPath
    @State private var store = FeedStore.shared
    @State private var prefs = UserPreferences.shared
    @State private var router = AppRouter.shared
    @State private var activeFilter: FeedFilter = .thisWeek
    @Namespace private var filterNS

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                header
                    .padding(.top, NMSpace.sm)
                    .padding(.horizontal, NMSpace.lg)
                    .padding(.bottom, NMSpace.lg)

                filterRow
                    .padding(.bottom, NMSpace.lg)

                Hairline()
                    .padding(.horizontal, NMSpace.lg)

                content
                    .padding(.horizontal, NMSpace.lg)
                    .animation(.easeInOut(duration: 0.2), value: activeFilter)
            }
            .padding(.bottom, NMSpace.xxl)
            .frame(maxWidth: 460)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .background(GrainBackground())
        .refreshable {
            await store.refresh()
            reconcileFilterAfterRefresh()
        }
        .task {
            // Hydrate on first appearance only — subsequent tab visits re-use
            // the in-memory list and the user can pull-to-refresh.
            if case .idle = store.loadState {
                await store.refresh()
                reconcileFilterAfterRefresh()
            }
        }
    }

    /// Newspaper masthead: the real date as the eyebrow, a stable editorial
    /// title, one confident line about sourcing. The date does the "today"
    /// work honestly — the old "Today's News" title promised freshness the
    /// stream couldn't always keep.
    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel(mastheadDate)
            Text("The Brief")
                .font(NMFont.displayXL)
                .tracking(-1.6)
                .foregroundStyle(NMColor.textPrimary)
            Text("Cited updates from the agencies and journals.")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
        }
    }

    private var mastheadDate: String {
        let fmt = DateFormatter()
        fmt.dateFormat = "EEEE, MMMM d"
        return fmt.string(from: Date()).uppercased()
    }

    private var filterRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: NMSpace.xl) {
                if watchlistAvailable {
                    FeedFilterTab(label: "MY UNIT", isActive: activeFilter == .watchlist, namespace: filterNS) {
                        select(.watchlist)
                    }
                }
                FeedFilterTab(label: thisWeekLabel, isActive: activeFilter == .thisWeek, namespace: filterNS) {
                    select(.thisWeek)
                }
                FeedFilterTab(label: "ALL", isActive: activeFilter == .all, namespace: filterNS) {
                    select(.all)
                }
                FeedFilterTab(label: "SAVED", isActive: activeFilter == .saved, namespace: filterNS) {
                    select(.saved)
                }
                ForEach(availableCategories) { cat in
                    FeedFilterTab(label: cat.chipLabel.uppercased(),
                                  isActive: activeFilter == .category(cat),
                                  namespace: filterNS) {
                        select(.category(cat))
                    }
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .animation(.easeInOut(duration: 0.2), value: availableCategories)
            .animation(.easeInOut(duration: 0.2), value: watchlistAvailable)
        }
    }

    // MARK: - MY UNIT

    private var unitSpecialties: Set<String> {
        FeedWatchlist.specialties(for: prefs.unit)
    }

    /// The chip exists only when it could ever show something: a saved
    /// entry, or a unit the classifier tags stories with.
    private var watchlistAvailable: Bool {
        FeedWatchlist.isAvailable(pinned: prefs.pinnedIDs, unitSpecialties: unitSpecialties)
    }

    private var watchlist: FeedWatchlist.Partition {
        FeedWatchlist.partition(
            items: store.items,
            related: { store.relatedEntryIDs(for: $0) },
            pinned: prefs.pinnedIDs,
            unitSpecialties: unitSpecialties
        )
    }

    /// Title of the most recently saved entry the story touches, for the
    /// AFFECTS eyebrow. Shown under every filter, not just MY UNIT.
    private func matchedTitle(for item: FeedItem) -> String? {
        FeedWatchlist
            .matchedPinnedIDs(related: store.relatedEntryIDs(for: item), pinned: prefs.pinnedIDs)
            .lazy
            .compactMap { ContentRegistry.shared.entry(byID: $0)?.title }
            .first
    }

    /// The editorial version of a tab badge: unread count appended to the
    /// default tab's label. Scoped to the 7-day window so it invites rather
    /// than accuses.
    private var thisWeekLabel: String {
        let n = store.unreadThisWeek
        return n > 0 ? "THIS WEEK · \(n)" : "THIS WEEK"
    }

    private func select(_ filter: FeedFilter) {
        guard filter != activeFilter else { return }
        UISelectionFeedbackGenerator().selectionChanged()
        FeedAnalytics.shared.filterChanged(from: activeFilter, to: filter)
        if filter == .watchlist {
            let partition = watchlist
            FeedAnalytics.shared.watchlistViewed(
                pinnedCount: prefs.pinnedIDs.count,
                matchedCount: partition.matched.count,
                unitCount: partition.unit.count
            )
        }
        withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
            activeFilter = filter
        }
    }

    /// Categories with at least one visible item, in canonical enum order so
    /// the chip row order is stable across refreshes. Categories with zero
    /// items are hidden — users only see chips that lead to content.
    private var availableCategories: [FeedItem.Category] {
        let present = Set(store.items.map { $0.category })
        return FeedItem.Category.allCases.filter { present.contains($0) }
    }

    /// If a pull-to-refresh ages out every item in the active category, the
    /// chip for that filter disappears and the user is stranded on a missing
    /// filter. Snap back to .all rather than leaving them on a dead end.
    private func reconcileFilterAfterRefresh() {
        if case .category(let cat) = activeFilter,
           !availableCategories.contains(cat) {
            activeFilter = .all
        }
        if activeFilter == .watchlist, !watchlistAvailable {
            activeFilter = .thisWeek
        }
    }

    @ViewBuilder
    private var content: some View {
        // Loading / network failure / cold backend take precedence over filter
        // state — show the same global empty state regardless of which chip
        // is selected.
        if store.items.isEmpty {
            switch store.loadState {
            case .idle, .loading:
                FeedEmptyState(kind: .loading, onRetry: refreshNow)
            case .failed(let detail) where isNetworkFailure(detail):
                FeedEmptyState(kind: .offline, onRetry: refreshNow)
            case .failed, .loaded:
                FeedEmptyState(kind: .empty, onRetry: refreshNow)
            }
        } else {
            let filtered = filteredItems
            if filtered.isEmpty {
                // Items exist but the active filter matches none of them.
                // Tailor the empty-state copy to the chip the user picked.
                switch activeFilter {
                case .watchlist:
                    FeedEmptyState(
                        kind: .noWatchlist(hasSaved: !prefs.pinnedIDs.isEmpty),
                        onRetry: refreshNow,
                        actionLabel: "Browse the Library",
                        onAction: { router.selectedTab = AppRouter.libraryTab }
                    )
                case .saved:
                    FeedEmptyState(kind: .noSaved, onRetry: refreshNow)
                case .category(let cat):
                    FeedEmptyState(kind: .noInCategory(cat.label), onRetry: refreshNow)
                case .thisWeek, .all:
                    // .thisWeek falls back to the full list when its window is
                    // empty, so this only renders when the whole feed is empty.
                    FeedEmptyState(kind: .empty, onRetry: refreshNow)
                }
            } else {
                itemsList(filtered)
            }
        }
    }

    /// Items visible under the current filter. `store.items` is server-ordered
    /// by rank_score desc, so filtering preserves the ranked order.
    private var filteredItems: [FeedItem] {
        switch activeFilter {
        case .watchlist:
            let partition = watchlist
            return partition.matched + partition.unit
        case .thisWeek:
            // Rolling 7-day window. Graceful fallback: if nothing landed in the
            // last week (sparse-publishing day, or a cold backend), show the
            // full ranked list rather than stranding the default tab on empty.
            let cutoff = Date().addingTimeInterval(-7 * 24 * 60 * 60)
            let recent = store.items.filter { $0.displayDate >= cutoff }
            return recent.isEmpty ? store.items : recent
        case .all:
            return store.items
        case .saved:
            return store.items.filter { store.isSaved($0.id) }
        case .category(let cat):
            return store.items.filter { $0.category == cat }
        }
    }

    /// Saved view is a flat compact list — no lead-card editorial treatment.
    /// "All" and category filters use the standard "lead + MORE TODAY + rest"
    /// pattern.
    private var usesLeadLayout: Bool {
        switch activeFilter {
        case .saved, .watchlist: return false
        case .thisWeek, .all, .category: return true
        }
    }

    @ViewBuilder
    private func itemsList(_ items: [FeedItem]) -> some View {
        if activeFilter == .watchlist {
            watchlistList(watchlist)
        } else if usesLeadLayout, let lead = leadFor(items) {
            let rest = items.filter { $0.id != lead.id }
            let positions = displayPositions(lead: lead, rest: rest)
            LazyVStack(spacing: 0) {
                Button {
                    open(lead, position: 0, isLead: true)
                } label: {
                    FeedCard(item: lead, isSaved: store.isSaved(lead.id), isRead: store.isRead(lead.id), isLead: true, matchedTitle: matchedTitle(for: lead))
                }
                .buttonStyle(.plain)

                // Print-newspaper sections by age. Older items sit under an
                // honest EARLIER header instead of impersonating today's news
                // — on sparse weeks the feed reads as an archive, not a lie.
                ForEach(AgeBucket.allCases, id: \.self) { bucket in
                    let group = rest.filter { ageBucket(for: $0) == bucket }
                    if !group.isEmpty {
                        sectionDivider(bucket.label)
                        ForEach(group) { item in
                            Button {
                                open(item, position: positions[item.id] ?? -1, isLead: false)
                            } label: {
                                FeedCard(item: item, isSaved: store.isSaved(item.id), isRead: store.isRead(item.id), matchedTitle: matchedTitle(for: item))
                            }
                            .buttonStyle(.plain)
                            if item.id != group.last?.id {
                                Hairline(color: NMColor.borderSubtle)
                            }
                        }
                    }
                }
            }
        } else {
            LazyVStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.element.id) { idx, item in
                    Button {
                        open(item, position: idx, isLead: false)
                    } label: {
                        FeedCard(item: item, isSaved: store.isSaved(item.id), isRead: store.isRead(item.id), matchedTitle: matchedTitle(for: item))
                    }
                    .buttonStyle(.plain)
                    if item.id != items.last?.id {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    private func open(_ item: FeedItem, position: Int, isLead: Bool) {
        FeedAnalytics.shared.itemOpened(
            item,
            filter: activeFilter,
            position: position,
            isLead: isLead,
            matchedPinned: matchedTitle(for: item) != nil
        )
        path.append(FeedDestination.item(item.id))
    }

    /// MY UNIT: stories touching saved entries first (newest first), then the
    /// unit's stories in ranked order. Flat cards, no lead treatment; the
    /// AFFECTS eyebrow does the pointing.
    @ViewBuilder
    private func watchlistList(_ partition: FeedWatchlist.Partition) -> some View {
        let unitLabel = "ALSO IN \(prefs.unit.displayName.uppercased())"
        LazyVStack(spacing: 0) {
            if !partition.matched.isEmpty {
                sectionDivider("YOUR SAVED ENTRIES")
                ForEach(Array(partition.matched.enumerated()), id: \.element.id) { idx, item in
                    Button {
                        open(item, position: idx, isLead: false)
                    } label: {
                        FeedCard(item: item, isSaved: store.isSaved(item.id), isRead: store.isRead(item.id), matchedTitle: matchedTitle(for: item))
                    }
                    .buttonStyle(.plain)
                    if item.id != partition.matched.last?.id {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
            if !partition.unit.isEmpty {
                sectionDivider(unitLabel)
                ForEach(Array(partition.unit.enumerated()), id: \.element.id) { idx, item in
                    Button {
                        open(item, position: partition.matched.count + idx, isLead: false)
                    } label: {
                        FeedCard(item: item, isSaved: store.isSaved(item.id), isRead: store.isRead(item.id), matchedTitle: matchedTitle(for: item))
                    }
                    .buttonStyle(.plain)
                    if item.id != partition.unit.last?.id {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    /// Zero-based on-screen index of every card in the lead layout: the lead
    /// is 0, then the age sections in display order.
    private func displayPositions(lead: FeedItem, rest: [FeedItem]) -> [UUID: Int] {
        var ordered = [lead]
        for bucket in AgeBucket.allCases {
            ordered += rest.filter { ageBucket(for: $0) == bucket }
        }
        return Dictionary(uniqueKeysWithValues: ordered.enumerated().map { ($1.id, $0) })
    }

    /// First urgent item if any exists in the visible set, otherwise the
    /// most-recent item from the visible set.
    private func leadFor(_ items: [FeedItem]) -> FeedItem? {
        if let firstUrgent = items.first(where: { $0.priority == .urgent }) {
            return firstUrgent
        }
        return items.first
    }

    /// Age sections for the post-lead stream, in display order. Ranked order
    /// from the server is preserved within each section.
    private enum AgeBucket: CaseIterable {
        case today, thisWeek, earlier

        var label: String {
            switch self {
            case .today:    return "MORE TODAY"
            case .thisWeek: return "THIS WEEK"
            case .earlier:  return "EARLIER"
            }
        }
    }

    private func ageBucket(for item: FeedItem) -> AgeBucket {
        if Calendar.current.isDateInToday(item.displayDate) { return .today }
        if item.displayDate >= Date().addingTimeInterval(-7 * 24 * 60 * 60) { return .thisWeek }
        return .earlier
    }

    private func sectionDivider(_ label: String) -> some View {
        VStack(spacing: 0) {
            Hairline()
            HStack {
                EyebrowLabel(label, sparkle: false)
                Spacer()
            }
            .padding(.top, NMSpace.lg)
            .padding(.bottom, NMSpace.sm)
        }
    }

    private func isNetworkFailure(_ detail: String) -> Bool {
        let s = detail.lowercased()
        return s.contains("offline")
            || s.contains("network connection")
            || s.contains("not connected to the internet")
            || s.contains("timed out")
            || s.contains("could not connect")
    }

    private func refreshNow() {
        Task { await store.refresh() }
    }
}

/// Top-of-list filter scope. Persisted only in-memory for the session —
/// every cold launch resets to .all so the user always sees the day's news.
enum FeedFilter: Hashable {
    case watchlist
    case thisWeek
    case all
    case saved
    case category(FeedItem.Category)
}

/// Navigation destinations within the Feed tab. UUID-keyed so the iOS app can
/// push to a specific item without holding the whole FeedItem in the stack.
enum FeedDestination: Hashable {
    case item(UUID)
}
