import Foundation
import OSLog

private let analyticsLog = Logger(subsystem: "app.nursemind.ios", category: "Analytics")

/// The one seam between product events and PostHog. Feature-level trackers
/// (`FeedAnalytics`, `SessionAnalytics`) send through here so tests can
/// swap in a recorder and assert exact event names and property keys
/// without a configured SDK.
///
/// Privacy contract for every event that passes through this sink:
/// properties carry identifiers, enums, counts and durations only. Never a
/// headline, entry body, search query, question text or any user-typed value.
public typealias AnalyticsSink = @MainActor (_ event: String, _ properties: [String: Any]) -> Void

@MainActor
public enum AnalyticsSinks {
    /// Mirrors every event to the unified log so a simulator run can be
    /// checked with `log stream --predicate 'category == "Analytics"'`
    /// even when PostHog is unconfigured (DEBUG builds).
    public static let postHog: AnalyticsSink = { event, properties in
        let summary = properties.keys.sorted().map { "\($0)=\(properties[$0] ?? "")" }.joined(separator: " ")
        analyticsLog.debug("\(event, privacy: .public) \(summary, privacy: .public)")
        AnalyticsService.shared.capture(event, properties: properties)
    }
}
