import Foundation
import OSLog
import Supabase
import SwiftData

private let savedSyncLog = Logger(subsystem: "app.nursemind.ios", category: "SavedAnswerSync")

/// Bidirectional sync between local SwiftData `SavedAnswer` records and the
/// Postgres `public.saved_answers` table. Push-on-mutation + pull-and-merge-
/// on-launch — server is treated as source of truth at launch, client pushes
/// immediately on any local mutation.
///
/// This is sufficient for v1: the iOS user is on a single device most of the
/// time, mutations happen at typing speed (no concurrent-mutation pressure),
/// and reinstall recovery is the dominant value driver. Real-time multi-device
/// propagation (Supabase Realtime channel subscription) is a follow-up.
///
/// Lifecycle:
///   1. `attach(container:)` is called once from `NursemindApp.init()` so the
///      service can build its own `ModelContext` for fetches/inserts/deletes.
///   2. Observes `SupabaseService.state`. On the first transition to
///      `.signedIn(userID)` it runs the initial reconciliation:
///         - PULL all server rows for this user.
///         - For server rows missing locally → INSERT into SwiftData.
///         - For server rows present locally → UPDATE local fields (server wins).
///         - For local rows missing on server → push as INSERT.
///   3. Mutation hooks (`didInsert`, `didUpdate`, `didDelete`) are called
///      explicitly from `ConversationView.toggleSaved`,
///      `SavedAnswerEntryView` rename / delete confirmations, etc. Each runs
///      a single network call to upsert or delete.
@MainActor
@Observable
public final class SavedAnswerSyncService {
    public static let shared = SavedAnswerSyncService()

    public enum Status: Equatable, Sendable {
        case idle
        case syncing
        case synced(at: Date)
        case error(String)
    }

    public private(set) var status: Status = .idle

    private let supabase: SupabaseService
    private var container: ModelContainer?
    private var initialSyncedForUserID: UUID?

    private init(supabase: SupabaseService = .shared) {
        self.supabase = supabase
    }

    /// Wire up the SwiftData container + auth-state observer. Idempotent.
    public func attach(container: ModelContainer) {
        if self.container == nil {
            self.container = container
        }
        observeAuthState()
    }

    // MARK: - Auth state observation

    private func observeAuthState() {
        withObservationTracking { [weak self] in
            _ = self?.supabase.state
        } onChange: { [weak self] in
            Task { @MainActor in
                self?.observeAuthState()
                self?.handleAuthStateChange()
            }
        }
        handleAuthStateChange()
    }

    private func handleAuthStateChange() {
        guard case .signedIn(let userID) = supabase.state else { return }
        guard initialSyncedForUserID != userID else { return }
        initialSyncedForUserID = userID
        Task { await self.performInitialSync(userID: userID) }
    }

    /// Reset per-user-id tracking after account deletion.
    public func resetForFreshAccount() {
        initialSyncedForUserID = nil
        status = .idle
    }

    // MARK: - Initial sync (pull-and-merge)

    private func performInitialSync(userID: UUID) async {
        guard let client = supabase.client, let container else { return }
        status = .syncing
        do {
            let serverRows = try await fetchAll(client: client, userID: userID)
            let context = ModelContext(container)
            let localFetch = FetchDescriptor<SavedAnswer>()
            let localRows = (try? context.fetch(localFetch)) ?? []

            let localByID = Dictionary(uniqueKeysWithValues: localRows.map { ($0.id, $0) })
            let serverByID = Dictionary(uniqueKeysWithValues: serverRows.map { ($0.id, $0) })

            var inserted = 0
            var updated = 0
            var pushed = 0

            // Server → Local: insert new, update existing.
            for record in serverRows {
                if let local = localByID[record.id] {
                    if record.updatedAt > local.savedAt {
                        applyRecord(record, to: local)
                        updated += 1
                    }
                } else {
                    context.insert(SavedAnswer.from(record))
                    inserted += 1
                }
            }
            try? context.save()

            // Local → Server: push records the server doesn't have. Captures
            // the migration case where existing local records pre-date sync.
            for local in localRows where serverByID[local.id] == nil {
                let upsert = SavedAnswerUpsert(
                    id: local.id,
                    userID: userID,
                    question: local.question,
                    answerMarkdown: local.answerMarkdown,
                    customTitle: local.customTitle,
                    citationsData: local.citations,
                    sourceMessageID: local.sourceMessageID,
                    savedAt: local.savedAt
                )
                try await pushUpsert(client: client, upsert: upsert)
                pushed += 1
            }

            status = .synced(at: Date())
            savedSyncLog.info("Initial sync complete: inserted=\(inserted) updated=\(updated) pushedLocal=\(pushed)")
        } catch {
            savedSyncLog.error("Initial sync failed: \(error.localizedDescription, privacy: .public)")
            status = .error(error.localizedDescription)
        }
    }

    // MARK: - Mutation hooks (called by view code after local SwiftData ops)

    /// Push a newly-inserted (or renamed) saved answer to the server.
    /// Caller passes the SavedAnswer right after `modelContext.insert(...)` /
    /// rename and `try? modelContext.save()`.
    public func didInsertOrUpdate(_ answer: SavedAnswer) {
        guard let client = supabase.client,
              let userID = supabase.currentUserID else { return }
        let upsert = SavedAnswerUpsert(
            id: answer.id,
            userID: userID,
            question: answer.question,
            answerMarkdown: answer.answerMarkdown,
            customTitle: answer.customTitle,
            citationsData: answer.citations,
            sourceMessageID: answer.sourceMessageID,
            savedAt: answer.savedAt
        )
        Task { [weak self] in
            do {
                try await self?.pushUpsert(client: client, upsert: upsert)
                savedSyncLog.info("Push success for \(answer.id, privacy: .public)")
            } catch {
                savedSyncLog.error("Push failed for \(answer.id, privacy: .public): \(error.localizedDescription, privacy: .public)")
            }
        }
    }

    /// Delete a saved answer on the server. Caller passes the id right after
    /// `modelContext.delete(...)` / save.
    public func didDelete(id: UUID) {
        guard let client = supabase.client,
              let userID = supabase.currentUserID else { return }
        Task { [weak self] in
            do {
                try await self?.deleteRow(client: client, id: id, userID: userID)
                savedSyncLog.info("Delete success for \(id, privacy: .public)")
            } catch {
                savedSyncLog.error("Delete failed for \(id, privacy: .public): \(error.localizedDescription, privacy: .public)")
            }
        }
    }

    // MARK: - Network primitives

    private func fetchAll(client: SupabaseClient, userID: UUID) async throws -> [SavedAnswerRecord] {
        try await client
            .from("saved_answers")
            .select()
            .eq("user_id", value: userID.uuidString)
            .execute()
            .value
    }

    private func pushUpsert(client: SupabaseClient, upsert: SavedAnswerUpsert) async throws {
        _ = try await client
            .from("saved_answers")
            .upsert(upsert)
            .execute()
    }

    private func deleteRow(client: SupabaseClient, id: UUID, userID: UUID) async throws {
        _ = try await client
            .from("saved_answers")
            .delete()
            .eq("id", value: id.uuidString)
            .eq("user_id", value: userID.uuidString)
            .execute()
    }

    // MARK: - Mapping

    private func applyRecord(_ record: SavedAnswerRecord, to local: SavedAnswer) {
        local.question = record.question
        local.answerMarkdown = record.answerMarkdown
        local.customTitle = record.customTitle
        local.setCitations(record.citationsData)
        local.savedAt = record.savedAt
    }
}

private extension SavedAnswer {
    /// Build a fresh SwiftData object from a server record. Caller is
    /// expected to insert into a `ModelContext` and save.
    static func from(_ record: SavedAnswerRecord) -> SavedAnswer {
        SavedAnswer(
            id: record.id,
            question: record.question,
            answerMarkdown: record.answerMarkdown,
            citations: record.citationsData,
            savedAt: record.savedAt,
            customTitle: record.customTitle,
            sourceMessageID: record.sourceMessageID
        )
    }
}
