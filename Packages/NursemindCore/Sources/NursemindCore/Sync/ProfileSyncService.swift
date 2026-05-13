import Foundation
import OSLog
import Supabase

private let syncLog = Logger(subsystem: "app.nursemind.ios", category: "ProfileSync")

/// Bidirectional sync between local `UserPreferences` and the Postgres
/// `public.profiles` table. v1 strategy: last-write-wins keyed on Postgres'
/// trigger-managed `updated_at`.
///
/// Lifecycle:
///   1. `attach()` is called once from the app entry point (RootView.init).
///   2. The service observes `SupabaseService.state` via `@Observable` tracking.
///      When it transitions to `.signedIn(userID)` the first time, the
///      initial sync runs (PULL → reconcile → maybe PUSH).
///   3. Any local mutation posts `nmUserPreferencesDidChange`. The service
///      debounces 1s and UPSERTs the full profile. Setters bumped during a
///      sync-driven `applyFromSync` block don't fire the notification, so
///      pulls never echo back as redundant pushes.
///   4. On offline failure, the push is dropped — but the next local change
///      schedules a fresh push, and the next launch's PULL/timestamp logic
///      ensures no data loss as long as the device's local copy survives.
@MainActor
@Observable
public final class ProfileSyncService {
    public static let shared = ProfileSyncService()

    public enum Status: Equatable, Sendable {
        case idle
        case syncing
        case synced(at: Date)
        case error(String)
    }

    public private(set) var status: Status = .idle

    private let prefs: UserPreferences
    private let supabase: SupabaseService

    private var changeObserver: NSObjectProtocol?
    private var pushDebounceTask: Task<Void, Never>?
    private var initialSyncedForUserID: UUID?

    private let lastPushedAtKey = "nm.sync.profile.lastPushedAt"
    private let pushDebounce: Duration = .seconds(1)

    private init(
        prefs: UserPreferences = .shared,
        supabase: SupabaseService = .shared
    ) {
        self.prefs = prefs
        self.supabase = supabase
    }

    /// Wire up observers. Idempotent — safe to call from `RootView.init`
    /// even though SwiftUI may rebuild the root.
    public func attach() {
        if changeObserver == nil {
            changeObserver = NotificationCenter.default.addObserver(
                forName: .nmUserPreferencesDidChange,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                Task { @MainActor in self?.scheduleDebouncedPush() }
            }
        }
        observeAuthState()
    }

    // MARK: - Auth state observation

    /// `@Observable` doesn't have a built-in "stream of changes" — instead the
    /// runtime calls back once per transition through `withObservationTracking`.
    /// We re-register inside the callback so we keep getting notified for
    /// every subsequent change.
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

    /// Reset per-user-id tracking after `AccountDeletionService` wipes
    /// everything. Next `.signedIn(...)` transition (e.g., anon auth on the
    /// fresh-install path that follows deletion) will trigger an initial
    /// sync rather than short-circuiting because of cached state.
    public func resetForFreshAccount() {
        initialSyncedForUserID = nil
        status = .idle
    }

    // MARK: - Initial sync

    /// Runs once per (user, app launch). Pulls the server row; decides whether
    /// to apply server values or push local based on `updated_at` vs the
    /// last-pushed-at timestamp in UserDefaults. If no row exists yet, INSERTs.
    private func performInitialSync(userID: UUID) async {
        guard let client = supabase.client else { return }
        status = .syncing
        do {
            let server: ProfileRecord? = try await fetchProfile(client: client, userID: userID)
            if let server {
                let lastPushed = lastPushedAt
                if server.updatedAt > lastPushed {
                    // Server is newer → adopt its values locally.
                    applyToLocal(server)
                    syncLog.info("Initial sync: pulled server profile (updated_at \(server.updatedAt, privacy: .public))")
                } else {
                    // Local is newer (or identical) → push.
                    try await push(client: client, userID: userID)
                    syncLog.info("Initial sync: pushed local profile (was newer than server)")
                }
            } else {
                // No row yet → INSERT current local state. The trigger sets
                // `updated_at = now()`, which becomes our new `lastPushedAt`.
                try await push(client: client, userID: userID)
                syncLog.info("Initial sync: inserted first profile row for user")
            }
            status = .synced(at: Date())
        } catch {
            syncLog.error("Initial sync failed: \(error.localizedDescription, privacy: .public)")
            status = .error(error.localizedDescription)
        }
    }

    // MARK: - Debounced push

    /// Local mutation arrived → restart the debounce window. Multiple rapid
    /// mutations (e.g., dragging across a list of pins) collapse into one
    /// network call.
    private func scheduleDebouncedPush() {
        pushDebounceTask?.cancel()
        pushDebounceTask = Task { [weak self] in
            try? await Task.sleep(for: self?.pushDebounce ?? .seconds(1))
            guard !Task.isCancelled else { return }
            await self?.pushNow()
        }
    }

    private func pushNow() async {
        guard let client = supabase.client,
              let userID = supabase.currentUserID else { return }
        status = .syncing
        do {
            try await push(client: client, userID: userID)
            status = .synced(at: Date())
            syncLog.info("Push success")
        } catch {
            syncLog.error("Push failed: \(error.localizedDescription, privacy: .public)")
            status = .error(error.localizedDescription)
        }
    }

    // MARK: - Network primitives

    private func fetchProfile(client: SupabaseClient, userID: UUID) async throws -> ProfileRecord? {
        // PostgREST `.maybeSingle()` returns nil instead of throwing when zero
        // rows match — exactly the "first-launch, no row yet" case.
        let rows: [ProfileRecord] = try await client
            .from("profiles")
            .select()
            .eq("id", value: userID.uuidString)
            .limit(1)
            .execute()
            .value
        return rows.first
    }

    private func push(client: SupabaseClient, userID: UUID) async throws {
        let upsert = currentLocalUpsert(userID: userID)
        let response: [ProfileRecord] = try await client
            .from("profiles")
            .upsert(upsert, returning: .representation)
            .select()
            .execute()
            .value
        // Use the server's authoritative updated_at as our high-water mark.
        if let returned = response.first {
            self.lastPushedAt = returned.updatedAt
        } else {
            self.lastPushedAt = Date()
        }
    }

    // MARK: - Mapping

    /// Snapshot the current `UserPreferences` as a `ProfileUpsert` row.
    private func currentLocalUpsert(userID: UUID) -> ProfileUpsert {
        ProfileUpsert(
            id: userID,
            displayName: prefs.displayName,
            role: prefs.role.rawValue,
            unit: prefs.unit.rawValue,
            icuSubspecialty: prefs.icuSubspecialty?.rawValue,
            yearsExperience: prefs.yearsOfExperience,
            preferredAppearance: prefs.preferredAppearance.rawValue,
            notificationsEnabled: prefs.notificationsEnabled,
            weeklyTipEnabled: prefs.weeklyTipEnabled,
            safetyContractAgreedAt: prefs.safetyContractAgreedAt,
            pinnedEntryIDs: prefs.pinnedIDs,
            recentEntryIDs: prefs.recentIDs,
            pinnedCalculatorIDs: prefs.pinnedCalculatorIDs,
            recentCalculatorIDs: prefs.recentCalculatorIDs
        )
    }

    /// Apply a server record onto local `UserPreferences`. Wrapped in
    /// `applyFromSync` so setters don't fire the change notification — the
    /// pull-then-push echo loop is suppressed at the source.
    ///
    /// Enum strings that don't match a known case fall back to the existing
    /// local value rather than crashing — defensive against schema drift,
    /// even though the SQL CHECK constraints already gate writes.
    private func applyToLocal(_ record: ProfileRecord) {
        prefs.applyFromSync {
            prefs.displayName = record.displayName

            if let role = UserRole(rawValue: record.role) {
                prefs.role = role
            }
            if let unit = NursingUnit(rawValue: record.unit) {
                prefs.unit = unit
            }
            // ICU subspecialty: nil clears local; valid string sets; unknown
            // string preserves whatever's there. Per UserPreferences setter,
            // changing `unit` away from `.icu` already clears subspecialty,
            // so order matters — unit first, then subspecialty.
            if let raw = record.icuSubspecialty {
                if let sub = ICUSubspecialty(rawValue: raw) {
                    prefs.icuSubspecialty = sub
                }
            } else {
                prefs.icuSubspecialty = nil
            }
            prefs.yearsOfExperience = record.yearsExperience
            if let appearance = AppearanceTheme(rawValue: record.preferredAppearance) {
                prefs.preferredAppearance = appearance
            }
            prefs.notificationsEnabled = record.notificationsEnabled
            prefs.weeklyTipEnabled = record.weeklyTipEnabled
            prefs.safetyContractAgreedAt = record.safetyContractAgreedAt

            // Subscription tier: server is the source of truth (written
            // exclusively by the revenuecat-events Edge Function). Apply
            // server's value; never push client's. Unknown raw strings keep
            // the existing local value so a server-side enum drift can't
            // corrupt the client's UI.
            if let tier = SubscriptionTier(rawValue: record.subscriptionTier) {
                prefs.subscriptionTier = tier
            }

            // For library state we want to fully overwrite local with server,
            // including ordering. Direct assignment via the public mutation
            // entry points isn't possible (those toggle/dedupe), so we set the
            // backing arrays through a dedicated bulk-replace helper.
            prefs.replaceLibraryState(
                pinnedEntryIDs: record.pinnedEntryIDs,
                recentEntryIDs: record.recentEntryIDs,
                pinnedCalculatorIDs: record.pinnedCalculatorIDs,
                recentCalculatorIDs: record.recentCalculatorIDs
            )
        }
        // Server's updated_at becomes our new high-water mark — anything
        // older shouldn't trigger another pull.
        self.lastPushedAt = record.updatedAt
    }

    // MARK: - High-water mark persistence

    private var lastPushedAt: Date {
        get {
            (UserDefaults.standard.object(forKey: lastPushedAtKey) as? Date) ?? .distantPast
        }
        set {
            UserDefaults.standard.set(newValue, forKey: lastPushedAtKey)
        }
    }
}
