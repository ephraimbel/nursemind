import SwiftUI

/// Root view for the Feed tab. Owns a NavigationStack rooted at FeedListView;
/// pushes FeedReadingView per item.id when a card is tapped.
public struct FeedTabView: View {
    @State private var path = NavigationPath()
    @State private var store = FeedStore.shared
    @State private var router = AppRouter.shared
    @State private var reportedThisVisit = false

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            FeedListView(path: $path)
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: FeedDestination.self) { dest in
                    switch dest {
                    case .item(let id):
                        if let item = store.items.first(where: { $0.id == id }) {
                            FeedReadingView(item: item)
                        } else {
                            // Item not in cache — shouldn't happen during a
                            // single session, but render an empty state instead
                            // of crashing on force-unwrap if it ever does.
                            FeedEmptyState(kind: .error("Item not available."), onRetry: {})
                        }
                    }
                }
        }
        // Tab selection is the one signal that fires exactly once per visit.
        // View lifecycle would also fire on pop back from a story and on
        // NavigationStack re-appearances while the store hydrates.
        .onChange(of: router.selectedTab, initial: true) { _, tab in
            // TabView can re-create this view on a switch, so the initial
            // pass and the change pass both fire; report one open per visit.
            guard tab == AppRouter.feedTab else { reportedThisVisit = false; return }
            guard !reportedThisVisit else { return }
            reportedThisVisit = true
            FeedAnalytics.shared.opened(
                itemCount: store.items.count,
                unreadThisWeek: store.unreadThisWeek,
                loadState: store.loadState.analyticsName
            )
        }
    }
}
