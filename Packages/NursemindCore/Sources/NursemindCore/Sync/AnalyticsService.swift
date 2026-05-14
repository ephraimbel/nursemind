import Foundation
import PostHog

/// Thin wrapper around `PostHogSDK.shared`. Centralizes setup, exposes a
/// small surface for the rest of the app to call (`capture`, `identify`,
/// `reset`), and gives us one place to add or strip events if we ever need
/// to disable analytics (e.g. EU users on first launch before consent).
///
/// Privacy: the PostHog phc_ token is a *capture-only* public key. The SDK
/// never sends the body of an AI question — we only emit event names plus
/// structured properties we hand in by hand. PHI is structurally impossible
/// to reach this service because the codebase never exposes patient fields
/// to begin with.
@MainActor
public final class AnalyticsService {
    public static let shared = AnalyticsService()

    private var isConfigured = false

    private init() {}

    /// Call once at app launch. Idempotent — safe if SwiftUI tears down and
    /// rebuilds the root view tree. A nil or empty token short-circuits the
    /// SDK setup entirely so DEBUG builds (and any future region/legal
    /// disable) cleanly opt out without scattering `#if`s through call sites.
    public func configure(projectToken: String?, host: String) {
        guard !isConfigured else { return }
        guard let projectToken, !projectToken.isEmpty else { return }
        let config = PostHogConfig(projectToken: projectToken, host: host)
        // Deliberate autocapture posture for a clinical-reference app:
        //   - Keep app lifecycle (App Opened, App Backgrounded) — free DAU
        //     and session boundaries, no user content involved.
        //   - Disable screen-view autocapture — SwiftUI view *names* can
        //     accidentally include user state (saved-answer titles in nav
        //     headers, search query in toolbar). All meaningful screen
        //     transitions are captured manually via `tab_switched`,
        //     `paywall_viewed`, `library_entry_viewed`, etc.
        //   - Session replay stays off (default). Would need legal review
        //     before enabling for a medical app.
        config.captureApplicationLifecycleEvents = true
        config.captureScreenViews = false
        config.sessionReplay = false
        PostHogSDK.shared.setup(config)
        isConfigured = true
    }


    /// Fire a funnel event. `properties` is optional structured metadata —
    /// keep keys snake_case to match PostHog conventions.
    public func capture(_ event: String, properties: [String: Any]? = nil) {
        guard isConfigured else { return }
        PostHogSDK.shared.capture(event, properties: properties)
    }

    /// Tie subsequent events to a stable user id. Call after Supabase auth
    /// resolves to `signedIn` so anonymous funnel events get stitched to
    /// the eventual paying user.
    public func identify(_ distinctId: String, properties: [String: Any]? = nil) {
        guard isConfigured else { return }
        PostHogSDK.shared.identify(distinctId, userProperties: properties)
    }

    /// Clear the identified user. Call on sign-out so the next session
    /// starts as a fresh anonymous id.
    public func reset() {
        guard isConfigured else { return }
        PostHogSDK.shared.reset()
    }
}
