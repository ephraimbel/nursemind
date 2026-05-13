import SwiftUI

/// Scrollable Feed list. Each card is a NavigationLink pushing FeedReadingView.
/// Pull-to-refresh re-fetches items + saved set. Empty / loading / error
/// states swap in based on FeedStore.loadState and items.isEmpty.
struct FeedListView: View {
    @State private var store = FeedStore.shared

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                header
                    .padding(.top, NMSpace.sm)
                    .padding(.horizontal, NMSpace.lg)
                    .padding(.bottom, NMSpace.lg)

                Hairline()
                    .padding(.horizontal, NMSpace.lg)

                content
                    .padding(.horizontal, NMSpace.lg)
            }
            .padding(.bottom, NMSpace.xxl)
        }
        .background(GrainBackground())
        .refreshable {
            await store.refresh()
        }
        .task {
            // Hydrate on first appearance only — subsequent tab visits re-use
            // the in-memory list and the user can pull-to-refresh.
            if case .idle = store.loadState {
                await store.refresh()
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("FEED")
            Text("Today's News")
                .font(NMFont.displayXL)
                .tracking(-1.6)
                .foregroundStyle(NMColor.textPrimary)
            Text("Curated clinical updates from the FDA, CDC, and MMWR. Every claim cited.")
                .font(NMFont.displayItalicSM)
                .foregroundStyle(NMColor.textSecondary)
                .lineSpacing(2)
        }
    }

    @ViewBuilder
    private var content: some View {
        if store.items.isEmpty {
            switch store.loadState {
            case .idle, .loading:
                FeedEmptyState(kind: .loading, onRetry: refreshNow)
            case .failed(let detail) where isNetworkFailure(detail):
                FeedEmptyState(kind: .offline, onRetry: refreshNow)
            case .failed, .loaded:
                // Backend not yet returning items (no rows, or schema not yet
                // deployed, or 4xx auth that the user can't act on). Show the
                // editorial empty state rather than a raw error — the Feed is
                // a content surface, not a settings screen.
                FeedEmptyState(kind: .empty, onRetry: refreshNow)
            }
        } else {
            itemsList
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

    private var itemsList: some View {
        LazyVStack(spacing: 0) {
            ForEach(store.items) { item in
                NavigationLink(value: FeedDestination.item(item.id)) {
                    FeedCard(item: item, isSaved: store.isSaved(item.id))
                }
                .buttonStyle(.plain)
                if item.id != store.items.last?.id {
                    Hairline(color: NMColor.borderSubtle)
                }
            }
        }
    }

    private func refreshNow() {
        Task { await store.refresh() }
    }
}

/// Navigation destinations within the Feed tab. UUID-keyed so the iOS app can
/// push to a specific item without holding the whole FeedItem in the stack.
enum FeedDestination: Hashable {
    case item(UUID)
}
