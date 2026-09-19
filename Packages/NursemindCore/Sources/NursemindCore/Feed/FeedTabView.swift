import SwiftUI

/// Root view for the Feed tab. Owns a NavigationStack rooted at FeedListView;
/// pushes FeedReadingView per item.id when a card is tapped.
public struct FeedTabView: View {
    @State private var store = FeedStore.shared
    @State private var router = AppRouter.shared
    @State private var reportedThisVisit = false

    public init() {}

    public var body: some View {
        NavigationStack(path: $router.feedPath) {
            FeedListView(path: $router.feedPath)
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: FeedDestination.self) { dest in
                    switch dest {
                    case .item(let id):
                        FeedItemDestination(id: id)
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

/// Resolves a story id against the store, loading the feed first when a
/// deep link arrives before the list has hydrated (a notification tap on a
/// cold launch). Renders the reading view, a loading state, or an honest
/// "not available" when the story has aged out or was retracted.
private struct FeedItemDestination: View {
    let id: UUID
    @State private var store = FeedStore.shared

    var body: some View {
        if let item = store.items.first(where: { $0.id == id }) {
            FeedReadingView(item: item)
        } else {
            Group {
                switch store.loadState {
                case .idle, .loading:
                    FeedEmptyState(kind: .loading, onRetry: {})
                case .loaded, .failed:
                    FeedEmptyState(kind: .error("This story is no longer available."), onRetry: { Task { await store.refresh() } })
                }
            }
            .background(GrainBackground())
            .task {
                if case .idle = store.loadState { await store.refresh() }
            }
        }
    }
}
