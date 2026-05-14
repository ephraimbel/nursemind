import Foundation
import OSLog
import Supabase
import SwiftUI

private let viewLog = Logger(subsystem: "app.nursemind.ios", category: "LibraryViews")

/// Append-only behavioral logger for library entry views. Pre-staged in v1
/// so historical view data accrues from day one — the v1.5 dynamic suggested
/// feed (BUILD_SPEC §15) needs this data to personalize on launch. Without
/// pre-staging we'd ship §15 to a cold-start population with no signal.
///
/// Design:
///   - Refcounts onAppear / onDisappear pairs per slug so SwiftUI lifecycle
///     quirks (e.g., NavigationStack push to a related-citation sheet inside
///     the same entry, then pop) collapse into a single session row instead
///     of fragmenting into many partial rows.
///   - Fires one insert per session on the FINAL onDisappear, with the
///     computed duration in seconds. If the app is force-quit mid-session
///     the view is lost — accepted trade-off; over-engineering crash recovery
///     isn't worth the complexity at v1.5.
///   - On network failure, queues the insert in `UserDefaults`. Flushes on
///     auth-state transition to `.signedIn` AND on `attach()` (app launch).
///     Queue capped at 1,000 entries; oldest dropped on overflow.
///   - Anonymous users (per `20260507_0001_profiles.sql` — they get a real
///     `auth.users.id` via `signInAnonymously`) DO log. The personalization
///     follows them through the eventual upgrade to Apple Sign In since
///     Supabase preserves the user id on `linkIdentity`.
///
/// Privacy: only the entry slug + duration is logged. Never any patient
/// context, AI question text, search terms, or any value derived from the
/// AI conversation. The recommender consuming this data must enforce the
/// same constraint when it ships in v1.5.
@MainActor
@Observable
public final class LibraryViewLogger {
    public static let shared = LibraryViewLogger()

    private let supabase: SupabaseService

    /// Live view sessions, keyed by entry slug. Refcounted so nested
    /// onAppear / onDisappear (e.g., user navigates from a drug entry into
    /// a citation deep-link sheet and back) don't terminate the parent
    /// session. Only when refcount reaches zero do we fire the insert.
    private var pendingViews: [String: PendingView] = [:]

    /// Failed inserts waiting for retry. Persisted to `UserDefaults` so
    /// they survive app termination.
    private var offlineQueue: [QueuedView] = []

    private let queueKey = "nm.libraryViews.offlineQueue"
    private let maxQueueSize = 1000

    private struct PendingView {
        let startTime: Date
        var depth: Int
    }

    public struct QueuedView: Codable, Sendable {
        public let entrySlug: String
        public let durationSec: Int?
        public let viewedAt: Date
    }

    private init(supabase: SupabaseService = .shared) {
        self.supabase = supabase
        loadOfflineQueue()
    }

    // MARK: - Lifecycle

    /// Wire up auth-state observer. Idempotent — call once from
    /// `RootView.init`. Also opportunistically flushes any queue carried
    /// over from a previous session.
    public func attach() {
        observeAuthState()
        Task { [weak self] in await self?.flushOfflineQueue() }
    }

    /// `@Observable` doesn't expose a continuous stream; re-register on
    /// every change to keep getting notified. Same pattern as
    /// `ProfileSyncService` and `SavedAnswerSyncService`.
    private func observeAuthState() {
        withObservationTracking { [weak self] in
            _ = self?.supabase.state
        } onChange: { [weak self] in
            Task { @MainActor in
                self?.observeAuthState()
                self?.handleAuthStateChange()
            }
        }
    }

    private func handleAuthStateChange() {
        guard case .signedIn = supabase.state else { return }
        Task { [weak self] in await self?.flushOfflineQueue() }
    }

    // MARK: - Public API

    /// Call when an entry detail screen appears. Multiple calls for the same
    /// slug coalesce via refcount — first call records the start time, later
    /// calls just bump the depth.
    public func logViewStart(entrySlug slug: String) {
        if var pending = pendingViews[slug] {
            pending.depth += 1
            pendingViews[slug] = pending
        } else {
            pendingViews[slug] = PendingView(startTime: Date(), depth: 1)
        }
    }

    /// Call when an entry detail screen disappears. Decrements refcount; on
    /// reaching zero, fires the insert with the computed duration.
    public func logViewEnd(entrySlug slug: String) {
        guard var pending = pendingViews[slug] else { return }
        pending.depth -= 1
        if pending.depth <= 0 {
            let elapsed = Int(Date().timeIntervalSince(pending.startTime))
            let duration = elapsed > 0 ? elapsed : nil
            pendingViews.removeValue(forKey: slug)
            recordInsert(slug: slug, durationSec: duration, viewedAt: pending.startTime)
            // Mirror the same session into PostHog so retention analysis
            // can join library engagement to subscription conversion. Slug
            // only — never the entry body or any user-typed value.
            AnalyticsService.shared.capture(
                "library_entry_viewed",
                properties: [
                    "slug": slug,
                    "duration_sec": duration ?? 0
                ]
            )
        } else {
            pendingViews[slug] = pending
        }
    }

    // MARK: - Network

    private func recordInsert(slug: String, durationSec: Int?, viewedAt: Date) {
        guard let client = supabase.client,
              let userID = supabase.currentUserID else {
            // Not signed in (or Supabase not configured): queue for later.
            // The auth-state observer will flush on first .signedIn transition.
            enqueueOffline(QueuedView(entrySlug: slug, durationSec: durationSec, viewedAt: viewedAt))
            return
        }

        let insert = LibraryViewInsert(
            userID: userID,
            entrySlug: slug,
            durationSec: durationSec,
            viewedAt: viewedAt
        )

        Task { [weak self] in
            do {
                _ = try await client
                    .from("library_views")
                    .insert(insert)
                    .execute()
                viewLog.info("Logged view: \(slug, privacy: .public) duration=\(durationSec ?? -1)")
            } catch {
                viewLog.error("Insert failed for \(slug, privacy: .public): \(error.localizedDescription, privacy: .public)")
                self?.enqueueOffline(QueuedView(entrySlug: slug, durationSec: durationSec, viewedAt: viewedAt))
            }
        }
    }

    // MARK: - Offline queue

    private func enqueueOffline(_ queued: QueuedView) {
        offlineQueue.append(queued)
        // Drop oldest entries if we've crossed the cap. Bounded growth
        // matters because UserDefaults is a small data store and a runaway
        // offline session shouldn't bloat it.
        if offlineQueue.count > maxQueueSize {
            offlineQueue.removeFirst(offlineQueue.count - maxQueueSize)
        }
        persistOfflineQueue()
    }

    private func flushOfflineQueue() async {
        guard !offlineQueue.isEmpty else { return }
        guard let client = supabase.client,
              let userID = supabase.currentUserID else { return }

        // Snapshot the queue so concurrent additions during the flush
        // don't get truncated by the post-success cleanup.
        let snapshot = offlineQueue
        let inserts = snapshot.map {
            LibraryViewInsert(
                userID: userID,
                entrySlug: $0.entrySlug,
                durationSec: $0.durationSec,
                viewedAt: $0.viewedAt
            )
        }

        do {
            _ = try await client
                .from("library_views")
                .insert(inserts)
                .execute()
            viewLog.info("Flushed offline queue: \(snapshot.count) entries")
            // Remove only what we successfully sent. Anything appended
            // during the flush stays for the next round.
            offlineQueue.removeFirst(snapshot.count)
            persistOfflineQueue()
        } catch {
            viewLog.error("Offline flush failed: \(error.localizedDescription, privacy: .public)")
            // Leave queue intact for the next attempt.
        }
    }

    private func loadOfflineQueue() {
        guard let data = UserDefaults.standard.data(forKey: queueKey),
              let decoded = try? JSONDecoder().decode([QueuedView].self, from: data) else {
            return
        }
        offlineQueue = decoded
    }

    private func persistOfflineQueue() {
        guard let data = try? JSONEncoder().encode(offlineQueue) else { return }
        UserDefaults.standard.set(data, forKey: queueKey)
    }
}

// MARK: - Wire format

/// Insert payload matching `public.library_views`. The `viewed_at` server
/// default is the fallback; we explicitly send the client's recorded time
/// because (a) for an offline-queued view, the upload happens minutes /
/// hours / days after the actual view, and (b) recommender quality depends
/// on accurate temporal ordering.
public struct LibraryViewInsert: Codable, Sendable {
    public let userID: UUID
    public let entrySlug: String
    public let durationSec: Int?
    public let viewedAt: Date

    enum CodingKeys: String, CodingKey {
        case userID       = "user_id"
        case entrySlug    = "entry_slug"
        case durationSec  = "duration_sec"
        case viewedAt     = "viewed_at"
    }
}

// MARK: - SwiftUI integration

/// View modifier — wraps `onAppear` / `onDisappear` to log a library
/// entry view session. Apply to any detail view that should contribute to
/// the user's view history. Safe to apply across nested navigation: the
/// underlying refcount collapses repeated lifecycle pairs into one row.
public struct LogsLibraryViewModifier: ViewModifier {
    let slug: String
    public func body(content: Content) -> some View {
        content
            .onAppear { LibraryViewLogger.shared.logViewStart(entrySlug: slug) }
            .onDisappear { LibraryViewLogger.shared.logViewEnd(entrySlug: slug) }
    }
}

public extension View {
    /// Track a view of the library entry with the given slug. Applies on
    /// the wrapped view's onAppear / onDisappear lifecycle. Refcounted
    /// internally — safe to apply across nested NavigationStack pushes
    /// without producing duplicate rows.
    func logsLibraryView(slug: String) -> some View {
        modifier(LogsLibraryViewModifier(slug: slug))
    }
}
