import Foundation
import OSLog
import Supabase
import UIKit
import UserNotifications

private let pushLog = Logger(subsystem: "app.nursemind.ios", category: "Push")

/// Where a push or a `nursemind://` URL wants to land.
public enum PushDeepLink: Equatable, Sendable {
    case feed
    case feedWatchlist
    case feedItem(UUID)

    /// `nursemind://feed`, `nursemind://feed?filter=watchlist`, `nursemind://feed?item=<uuid>`.
    public static func parse(_ url: URL) -> PushDeepLink? {
        guard url.scheme?.lowercased() == "nursemind", url.host?.lowercased() == "feed" else { return nil }
        let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems ?? []
        if let raw = items.first(where: { $0.name == "item" })?.value, let id = UUID(uuidString: raw) {
            return .feedItem(id)
        }
        if items.first(where: { $0.name == "filter" })?.value == "watchlist" {
            return .feedWatchlist
        }
        return .feed
    }

    /// The APNs payload carries `deep_link`, `kind` and `log_id` next to `aps`.
    public static func parse(userInfo: [AnyHashable: Any]) -> (link: PushDeepLink, kind: String?, logID: String?)? {
        guard let raw = userInfo["deep_link"] as? String, let url = URL(string: raw), let link = parse(url) else { return nil }
        return (link, userInfo["kind"] as? String, userInfo["log_id"] as? String)
    }
}

/// Owns the APNs token lifecycle and notification taps (PLAN.md R3).
///
/// Registration happens only when the user opted in (`notificationsEnabled`)
/// and iOS reports authorization. The token is upserted on every launch so
/// `device_tokens.last_seen_at` stays fresh, and deleted when notifications
/// are turned off. Account deletion cascades server-side.
@MainActor
@Observable
public final class PushRegistrationService {
    public static let shared = PushRegistrationService()

    private let supabase = SupabaseService.shared
    private let prefs = UserPreferences.shared
    private var currentToken: String?
    private var upsertedToken: String?
    private var changeObserver: NSObjectProtocol?

    /// Sandbox for Xcode builds, production for TestFlight and App Store.
    static var apnsEnvironment: String {
        #if DEBUG
        "sandbox"
        #else
        "production"
        #endif
    }

    private init() {}

    public func attach() {
        observeAuthState()
        if changeObserver == nil {
            changeObserver = NotificationCenter.default.addObserver(
                forName: .nmUserPreferencesDidChange, object: nil, queue: .main
            ) { [weak self] _ in
                Task { @MainActor in self?.preferencesDidChange() }
            }
        }
        registerIfOptedIn()
    }

    /// Ask iOS for a token when the user opted in and authorization exists.
    /// Safe to call repeatedly; iOS coalesces.
    public func registerIfOptedIn() {
        guard prefs.notificationsEnabled else { return }
        Task { @MainActor in
            let settings = await UNUserNotificationCenter.current().notificationSettings()
            guard settings.authorizationStatus == .authorized || settings.authorizationStatus == .provisional else { return }
            UIApplication.shared.registerForRemoteNotifications()
        }
    }

    public func didRegister(deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02x", $0) }.joined()
        // iOS answers every registerForRemoteNotifications call, so the same
        // token can arrive several times per launch; count it once.
        if token == currentToken {
            Task { await upsertTokenIfPossible() }
            return
        }
        let rotated = currentToken != nil
        currentToken = token
        upsertedToken = nil
        AnalyticsSinks.postHog("push_registered", ["env": Self.apnsEnvironment, "rotated": rotated])
        Task { await upsertTokenIfPossible() }
    }

    public func didFailToRegister(_ error: Error) {
        pushLog.error("APNs registration failed: \(error.localizedDescription, privacy: .public)")
        AnalyticsSinks.postHog("push_registration_failed", [:])
    }

    // MARK: - Server rows

    private struct DeviceTokenRow: Encodable {
        let user_id: UUID
        let token: String
        let env: String
        let last_seen_at: Date
    }

    private func upsertTokenIfPossible() async {
        guard prefs.notificationsEnabled,
              let token = currentToken,
              upsertedToken != token,
              let client = supabase.client,
              let userID = supabase.currentUserID else { return }
        do {
            try await client
                .from("device_tokens")
                .upsert(DeviceTokenRow(user_id: userID, token: token, env: Self.apnsEnvironment, last_seen_at: Date()), onConflict: "token")
                .execute()
            upsertedToken = token
            pushLog.info("device token upserted (\(Self.apnsEnvironment, privacy: .public))")
        } catch {
            pushLog.error("device token upsert failed: \(error.localizedDescription, privacy: .public)")
        }
    }

    /// Notifications turned off: the server must forget this device.
    public func removeTokenFromServer() async {
        guard let token = currentToken, let client = supabase.client else { return }
        do {
            try await client.from("device_tokens").delete().eq("token", value: token).execute()
            upsertedToken = nil
            AnalyticsSinks.postHog("push_token_removed", [:])
        } catch {
            pushLog.error("device token delete failed: \(error.localizedDescription, privacy: .public)")
        }
    }

    private func preferencesDidChange() {
        if prefs.notificationsEnabled {
            registerIfOptedIn()
            Task { await upsertTokenIfPossible() }
        } else if upsertedToken != nil {
            Task { await removeTokenFromServer() }
        }
    }

    // MARK: - Taps and URLs

    public func handleNotificationTap(userInfo: [AnyHashable: Any]) {
        guard let parsed = PushDeepLink.parse(userInfo: userInfo) else { return }
        handleNotificationTap(link: parsed.link, kind: parsed.kind, logID: parsed.logID)
    }

    public func handleNotificationTap(link: PushDeepLink, kind: String?, logID: String?) {
        SessionAnalytics.shared.pendingNotificationKind = kind ?? "unknown"
        route(link)
        if let logID { Task { await markOpened(logID: logID) } }
    }

    public func handle(url: URL) {
        guard let link = PushDeepLink.parse(url) else { return }
        route(link)
    }

    private func route(_ link: PushDeepLink) {
        let router = AppRouter.shared
        switch link {
        case .feed:               router.openFeed()
        case .feedWatchlist:      router.openFeedWatchlist()
        case .feedItem(let id):   router.openFeedItem(id)
        }
    }

    private struct OpenedStamp: Encodable { let opened_at: Date }

    private func markOpened(logID: String) async {
        guard let client = supabase.client else { return }
        do {
            try await client
                .from("feed_notification_log")
                .update(OpenedStamp(opened_at: Date()))
                .eq("id", value: logID)
                .is("opened_at", value: nil)
                .execute()
        } catch {
            pushLog.warning("opened_at stamp failed: \(error.localizedDescription, privacy: .public)")
        }
    }

    // MARK: - Auth observation (same pattern as ProfileSyncService)

    private func observeAuthState() {
        withObservationTracking { [weak self] in
            _ = self?.supabase.state
        } onChange: { [weak self] in
            Task { @MainActor in
                self?.observeAuthState()
                if case .signedIn = self?.supabase.state {
                    await self?.upsertTokenIfPossible()
                }
            }
        }
    }
}
