import Foundation

/// Emits one `session_started` per foreground, which is the retention
/// denominator for the Daily-return dashboard (PLAN.md R1). A session begins
/// on cold launch and every time the app returns from the background;
/// active → inactive → active (control centre, a system alert) is not a new
/// session.
///
/// `origin_tab` answers "what do people open the app to do"; the R3 push
/// work sets `pendingNotificationKind` from its deep-link handler before the
/// scene goes active so the same event attributes the open to a notification.
@MainActor
@Observable
public final class SessionAnalytics {
    public static let shared = SessionAnalytics()

    /// Set by a notification deep-link handler before the scene activates.
    /// Consumed (and cleared) by the next `session_started`.
    public var pendingNotificationKind: String?

    private let sink: AnalyticsSink
    private let originTab: () -> String
    private var awaitingForeground = true
    private var hasLaunched = false

    public convenience init() {
        self.init(sink: AnalyticsSinks.postHog, originTab: { AppRouter.shared.selectedTabName })
    }

    init(sink: @escaping AnalyticsSink, originTab: @escaping () -> String) {
        self.sink = sink
        self.originTab = originTab
    }

    public func applicationDidEnterBackground() {
        awaitingForeground = true
    }

    public func applicationDidBecomeActive() {
        guard awaitingForeground else { return }
        awaitingForeground = false
        let coldLaunch = !hasLaunched
        hasLaunched = true
        let kind = pendingNotificationKind
        pendingNotificationKind = nil
        var properties: [String: Any] = [
            "origin_tab": originTab(),
            "cold_launch": coldLaunch,
            "from_notification": kind != nil,
        ]
        if let kind { properties["notification_kind"] = kind }
        sink("session_started", properties)
    }
}
