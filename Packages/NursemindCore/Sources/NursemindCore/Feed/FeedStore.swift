import Foundation
import OSLog
import Supabase

private let feedLog = Logger(subsystem: "app.nursemind.ios", category: "Feed")

/// Owns the published Feed list, per-user save state, and the read/save
/// mutators that write back to `feed_user_state`. Hydrates on demand
/// (`refresh()`); the FeedTabView calls it on first appearance and on
/// pull-to-refresh.
///
/// Save state is server-authoritative: tapping save upserts a row in
/// `feed_user_state` and updates the in-memory cache. On launch we re-pull
/// the saved set so cross-device save toggles stay consistent.
@MainActor
@Observable
public final class FeedStore {
    public static let shared = FeedStore()

    public enum LoadState: Equatable {
        case idle
        case loading
        case loaded
        case failed(String)
    }

    /// Engagement signals fed to `feed_engagement_bump`. Powers the ranked sort
    /// (feed_items_ranked) and post-launch success metrics. Aggregate only.
    public enum EngagementEvent: String {
        case view
        case read
        case save
        case ask
    }

    public private(set) var items: [FeedItem] = []
    public private(set) var loadState: LoadState = .idle
    public private(set) var savedIDs: Set<UUID> = []
    public private(set) var readIDs: Set<UUID> = []
    public private(set) var lastRefreshedAt: Date?

    private let pageSize = 50

    private init() {}

    // MARK: - Public API

    /// Pulls the latest published items plus the current user's save set.
    /// Safe to call repeatedly — concurrent calls coalesce on `loadState`.
    public func refresh() async {
        guard loadState != .loading else { return }
        loadState = .loading

        guard let client = SupabaseService.shared.client else {
            // Surface as failed so the UI can render a "syncing offline" hint;
            // we don't crash the tab when Supabase isn't configured yet.
            loadState = .failed("Sync not configured")
            return
        }

        do {
            // Items are essential — a failure here is what we surface to the UI.
            // The per-user state (saved + read sets) is non-essential (worst
            // case the cards just don't show their indicators), so its failure
            // is logged and swallowed independently. Run them concurrently.
            async let itemsTask = fetchItems(client: client)
            async let stateTask = tryUserState(client: client)

            let fetchedItems = try await itemsTask
            let fetchedState = await stateTask

            self.items = fetchedItems
            self.savedIDs = fetchedState.saved
            self.readIDs = fetchedState.read
            self.lastRefreshedAt = Date()
            self.loadState = .loaded
        } catch {
            feedLog.error("refresh failed: \(error.localizedDescription, privacy: .public)")
            self.loadState = .failed(error.localizedDescription)
        }
    }

    /// Wrapper that converts the user-state fetch from throwing → prior-value
    /// so a transient feed_user_state failure doesn't blank the feed. The
    /// trade-off is that stale sets may persist across a failed refresh; the
    /// next successful refresh corrects them.
    private func tryUserState(client: SupabaseClient) async -> (saved: Set<UUID>, read: Set<UUID>) {
        do {
            return try await fetchUserState(client: client)
        } catch {
            feedLog.warning("user state fetch failed (non-fatal): \(error.localizedDescription, privacy: .public)")
            return (savedIDs, readIDs)
        }
    }

    /// Toggle save state for an item. Writes to `feed_user_state` and updates
    /// the in-memory set on success. On failure, the in-memory set isn't
    /// touched and the UI re-renders the prior state.
    public func toggleSave(_ itemID: UUID) async {
        guard let client = SupabaseService.shared.client,
              let userID = SupabaseService.shared.currentUserID else { return }

        let wasSaved = savedIDs.contains(itemID)
        do {
            if wasSaved {
                try await client
                    .from("feed_user_state")
                    .delete()
                    .eq("user_id", value: userID.uuidString)
                    .eq("item_id", value: itemID.uuidString)
                    .execute()
                savedIDs.remove(itemID)
            } else {
                let row = FeedUserStateUpsert(
                    userID: userID,
                    itemID: itemID,
                    readAt: nil,
                    savedAt: Date()
                )
                try await client
                    .from("feed_user_state")
                    .upsert(row)
                    .execute()
                savedIDs.insert(itemID)
                bumpEngagement(itemID, .save)
            }
        } catch {
            feedLog.error("toggleSave failed: \(error.localizedDescription, privacy: .public)")
        }
    }

    /// Mark an item as read. Idempotent — called from FeedReadingView.onAppear.
    /// Fire-and-forget: a read-mark failure isn't worth surfacing to the user.
    /// The local set updates immediately so the list dims the headline the
    /// moment the user returns, without waiting on a refresh round-trip.
    public func markRead(_ itemID: UUID) async {
        readIDs.insert(itemID)
        guard let client = SupabaseService.shared.client,
              let userID = SupabaseService.shared.currentUserID else { return }

        let row = FeedUserStateUpsert(
            userID: userID,
            itemID: itemID,
            readAt: Date(),
            savedAt: nil
        )
        do {
            try await client
                .from("feed_user_state")
                .upsert(row, onConflict: "user_id,item_id")
                .execute()
        } catch {
            feedLog.warning("markRead failed: \(error.localizedDescription, privacy: .public)")
        }
    }

    public func isSaved(_ itemID: UUID) -> Bool {
        savedIDs.contains(itemID)
    }

    public func isRead(_ itemID: UUID) -> Bool {
        readIDs.contains(itemID)
    }

    /// Unread items in the rolling 7-day window — powers the THIS WEEK count
    /// in the filter row. Scoped to the week so a long-idle user returns to
    /// "· 4", not an accusatory backlog of fifty.
    public var unreadThisWeek: Int {
        let cutoff = Date().addingTimeInterval(-7 * 24 * 60 * 60)
        return items.filter { $0.displayDate >= cutoff && !readIDs.contains($0.id) }.count
    }

    // MARK: - Network primitives

    private func fetchItems(client: SupabaseClient) async throws -> [FeedItem] {
        // Order by rank_score (freshness-decay + 7-day engagement) so the feed
        // visibly moves day-to-day and week-to-week. source_published_at is the
        // tiebreaker for items with equal scores (e.g. all fresh, zero
        // engagement on cold start, where rank_score collapses to recency).
        // FeedItem ignores the extra rank_score column at decode time.
        // Rows decode lossily: a single malformed row is dropped (and logged)
        // instead of failing the array and blanking the feed.
        let rows: [LossyFeedItem] = try await client
            .from("feed_items_ranked")
            .select()
            .order("rank_score", ascending: false, nullsFirst: false)
            .order("source_published_at", ascending: false, nullsFirst: false)
            .limit(pageSize)
            .execute()
            .value
        let decoded = rows.compactMap(\.item)
        if decoded.count != rows.count {
            feedLog.error("dropped \(rows.count - decoded.count) undecodable feed rows")
        }
        return decoded
    }

    /// Fire-and-forget engagement signal. Drives the ranked sort and metrics.
    /// Failures are swallowed — a missed counter is never worth surfacing.
    /// Safe to over-call (e.g. card re-appears on scroll); counters are additive.
    public func bumpEngagement(_ itemID: UUID, _ event: EngagementEvent) {
        guard let client = SupabaseService.shared.client else { return }
        Task {
            do {
                try await client
                    .rpc("feed_engagement_bump", params: [
                        "p_item_id": itemID.uuidString,
                        "p_event":   event.rawValue,
                    ])
                    .execute()
            } catch {
                feedLog.debug("bumpEngagement(\(event.rawValue, privacy: .public)) failed: \(error.localizedDescription, privacy: .public)")
            }
        }
    }

    /// One round-trip for both per-user sets: rows with a `saved_at` feed the
    /// saved set, rows with a `read_at` feed the read set.
    private func fetchUserState(client: SupabaseClient) async throws -> (saved: Set<UUID>, read: Set<UUID>) {
        guard let userID = SupabaseService.shared.currentUserID else { return ([], []) }
        let rows: [FeedUserStateRecord] = try await client
            .from("feed_user_state")
            .select("item_id, saved_at, read_at")
            .eq("user_id", value: userID.uuidString)
            .execute()
            .value
        let saved = Set(rows.filter { $0.savedAt != nil }.map { $0.itemID })
        let read  = Set(rows.filter { $0.readAt  != nil }.map { $0.itemID })
        return (saved, read)
    }
}

// MARK: - Wire formats

private struct FeedUserStateRecord: Decodable {
    let itemID: UUID
    let savedAt: Date?
    let readAt: Date?

    enum CodingKeys: String, CodingKey {
        case itemID  = "item_id"
        case savedAt = "saved_at"
        case readAt  = "read_at"
    }
}

private struct FeedUserStateUpsert: Encodable {
    let userID: UUID
    let itemID: UUID
    let readAt: Date?
    let savedAt: Date?

    enum CodingKeys: String, CodingKey {
        case userID  = "user_id"
        case itemID  = "item_id"
        case readAt  = "read_at"
        case savedAt = "saved_at"
    }
}
