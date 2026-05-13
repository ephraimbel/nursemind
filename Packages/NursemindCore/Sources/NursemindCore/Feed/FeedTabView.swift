import SwiftUI

/// Root view for the Feed tab. Owns a NavigationStack rooted at FeedListView;
/// pushes FeedReadingView per item.id when a card is tapped.
public struct FeedTabView: View {
    @State private var path = NavigationPath()
    @State private var store = FeedStore.shared

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            FeedListView()
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
    }
}
