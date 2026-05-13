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

    public private(set) var items: [FeedItem] = []
    public private(set) var loadState: LoadState = .idle
    public private(set) var savedIDs: Set<UUID> = []
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
            async let itemsTask  = fetchItems(client: client)
            async let savedTask  = fetchSavedIDs(client: client)
            let fetchedItems = try await itemsTask
            let fetchedSaved = try await savedTask

            self.items = fetchedItems
            self.savedIDs = fetchedSaved
            self.lastRefreshedAt = Date()
            self.loadState = .loaded
        } catch {
            feedLog.error("refresh failed: \(error.localizedDescription, privacy: .public)")
            self.loadState = .failed(error.localizedDescription)
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
            }
        } catch {
            feedLog.error("toggleSave failed: \(error.localizedDescription, privacy: .public)")
        }
    }

    /// Mark an item as read. Idempotent — called from FeedReadingView.onAppear.
    /// Fire-and-forget: a read-mark failure isn't worth surfacing to the user.
    public func markRead(_ itemID: UUID) async {
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

    // MARK: - Network primitives

    private func fetchItems(client: SupabaseClient) async throws -> [FeedItem] {
        try await client
            .from("feed_items_visible")
            .select()
            .order("published_at", ascending: false)
            .limit(pageSize)
            .execute()
            .value
    }

    private func fetchSavedIDs(client: SupabaseClient) async throws -> Set<UUID> {
        guard let userID = SupabaseService.shared.currentUserID else { return [] }
        let rows: [FeedUserStateRecord] = try await client
            .from("feed_user_state")
            .select("item_id, saved_at")
            .eq("user_id", value: userID.uuidString)
            .not("saved_at", operator: .is, value: "null")
            .execute()
            .value
        return Set(rows.map { $0.itemID })
    }
}

// MARK: - Wire formats

private struct FeedUserStateRecord: Decodable {
    let itemID: UUID
    let savedAt: Date?

    enum CodingKeys: String, CodingKey {
        case itemID  = "item_id"
        case savedAt = "saved_at"
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
