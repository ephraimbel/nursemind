import SwiftUI
import UIKit

/// Scrollable Feed list. Each card is a NavigationLink pushing FeedReadingView.
/// Pull-to-refresh re-fetches items + saved set. Filter chips below the header
/// scope the visible items to a category or to the user's saved set.
struct FeedListView: View {
    @State private var store = FeedStore.shared
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
        }
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
        case .saved: return false
        case .thisWeek, .all, .category: return true
        }
    }

    @ViewBuilder
    private func itemsList(_ items: [FeedItem]) -> some View {
        if usesLeadLayout, let lead = leadFor(items) {
            let rest = items.filter { $0.id != lead.id }
            LazyVStack(spacing: 0) {
                NavigationLink(value: FeedDestination.item(lead.id)) {
                    FeedCard(item: lead, isSaved: store.isSaved(lead.id), isRead: store.isRead(lead.id), isLead: true)
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
                            NavigationLink(value: FeedDestination.item(item.id)) {
                                FeedCard(item: item, isSaved: store.isSaved(item.id), isRead: store.isRead(item.id))
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
                ForEach(items) { item in
                    NavigationLink(value: FeedDestination.item(item.id)) {
                        FeedCard(item: item, isSaved: store.isSaved(item.id), isRead: store.isRead(item.id))
                    }
                    .buttonStyle(.plain)
                    if item.id != items.last?.id {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
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
