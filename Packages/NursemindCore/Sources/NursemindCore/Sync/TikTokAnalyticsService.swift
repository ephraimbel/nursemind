import Foundation
import AppTrackingTransparency
import TikTokBusinessSDK

/// Thin wrapper around `TikTokBusiness` that mirrors the surface of
/// `AnalyticsService` so call sites stay symmetric: configure once at
/// app launch, then call typed event helpers. The wrapper exists so the
/// rest of the codebase never imports `TikTokBusinessSDK` directly — that
/// way we can swap the attribution vendor or scope down without churn.
///
/// Privacy: the Events-API access token is a server-to-server credential
/// that the SDK accepts client-side. It's still stored in `Secrets.swift`
/// (gitignored) and never logged. The SDK refuses to fire when any of the
/// three credentials is empty, so DEBUG builds and forks without keys are
/// inert by default.
///
/// ATT: the SDK never auto-prompts. `requestTrackingAuthorization()` is
/// called explicitly from `RootView` the first time the scene becomes
/// active — i.e. at the splash, before any IDFA-bearing tracking data is
/// collected. We call Apple's `ATTrackingManager` directly (rather than
/// TikTok's wrapper) so the prompt is independent of SDK-config state and
/// fires deterministically on a fresh install; the TikTok SDK reads the
/// resulting ATT status itself to gate IDFA. Firing during a view
/// transition (the old paywall-exit trigger) let iOS silently suppress the
/// prompt when the app wasn't cleanly `.active` — which is why App Review
/// 2026-05-30 couldn't locate it (Guideline 2.1).
@MainActor
public final class TikTokAnalyticsService {
    public static let shared = TikTokAnalyticsService()

    private var isConfigured = false

    /// Guard against re-firing Login + identify on every auth-state stream
    /// tick. Same pattern as `RevenueCatService.lastLinkedUserID`.
    private var lastIdentifiedUserID: UUID?

    /// Bound at `attach()` time and never released. Service is a singleton
    /// so the retain is intentional.
    private var supabase: SupabaseService { SupabaseService.shared }

    private init() {}

    /// Initialize the TikTok Business SDK with the three credentials from
    /// `Secrets.swift`. Idempotent — safe to call from `NursemindApp.init`
    /// even if SwiftUI tears down and rebuilds the root tree. Any empty
    /// credential short-circuits the call so dev/simulator builds without
    /// real TikTok IDs stay quiet.
    public func configure(appID: String, tiktokAppID: String, accessToken: String) {
        guard !isConfigured else { return }
        guard !appID.isEmpty, !tiktokAppID.isEmpty, !accessToken.isEmpty else { return }
        guard let config = TikTokConfig(
            accessToken: accessToken,
            appId: appID,
            tiktokAppId: tiktokAppID
        ) else {
            return
        }
        // Install + launch + retention tracking are on by default — that's
        // the whole point of the SDK. We leave them as-is.
        // The deprecated `appTrackingDialogSuppressed` is the new default;
        // we'll prompt ourselves after the paywall.
        TikTokBusiness.initializeSdk(config) { success, error in
            if let error, !success {
                // Stay quiet in release; this is best-effort attribution
                // and a logging side-channel would be its own privacy risk.
                #if DEBUG
                print("[TikTokAnalytics] init failed: \(error.localizedDescription)")
                #endif
            }
        }
        isConfigured = true
    }

    /// Present the iOS App Tracking Transparency prompt. Called from
    /// `RootView` on the first `.active` scene phase so the system sheet
    /// appears at the splash, before any IDFA is read.
    ///
    /// Deliberately NOT gated on `isConfigured`: the prompt must show even
    /// in builds without TikTok keys, and the system API only displays the
    /// sheet once ever (when status is `.notDetermined`) — every later call
    /// is a no-op — so the explicit `.notDetermined` guard just avoids the
    /// pointless re-entry. We call Apple's framework directly; the TikTok
    /// SDK reads ATT status on its own to decide whether it may use the
    /// IDFA, so no hand-off is required.
    public func requestTrackingAuthorization() {
        guard ATTrackingManager.trackingAuthorizationStatus == .notDetermined else { return }
        ATTrackingManager.requestTrackingAuthorization { _ in
            // The status is fine to ignore — TikTok reads it internally and
            // gates IDFA-bearing requests on it. Nothing else in the app
            // branches on ATT state today.
        }
    }

    /// Hook the Supabase auth-state stream so we fire Login + identify
    /// exactly once per signed-in user. Idempotent — safe to call from
    /// RootView.init even when SwiftUI tears down and rebuilds.
    ///
    /// Called from `RootView.init` (after `SupabaseService.configure`)
    /// rather than `NursemindApp.init` because SupabaseService needs its
    /// URL + anon key set before its `state` stream is meaningful.
    public func attach() {
        observeAuthState()
    }

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
        guard isConfigured else { return }
        guard case .signedIn(let userID) = supabase.state else { return }
        guard lastIdentifiedUserID != userID else { return }
        lastIdentifiedUserID = userID
        // identify ties subsequent TikTok events to a stable cross-device
        // user key. We deliberately pass ONLY the Supabase UUID — never
        // email or phone — to keep the TikTok ad graph from learning
        // anything that could touch user PII.
        TikTokBusiness.identify(
            withExternalID: userID.uuidString.lowercased(),
            externalUserName: nil,
            phoneNumber: nil,
            email: nil
        )
        let event = TikTokBaseEvent(eventName: TTEventName.login.rawValue)
        TikTokBusiness.trackTTEvent(event)
    }

    /// Clear the identify guard so a fresh sign-in re-runs identify.
    /// Wired into the account-deletion path the same way RevenueCat is.
    public func resetForFreshAccount() {
        guard isConfigured else { return }
        lastIdentifiedUserID = nil
        TikTokBusiness.logout()
    }

    // MARK: - Event helpers

    /// User finished the onboarding flow (after the safety contract +
    /// paywall step). Maps to TikTok's standard Registration event so it
    /// lights up as a configurable optimization target in Ads Manager.
    public func trackOnboardingComplete() {
        guard isConfigured else { return }
        let event = TikTokBaseEvent(eventName: TTEventName.registration.rawValue)
        TikTokBusiness.trackTTEvent(event)
    }

    /// User finished the in-onboarding showcase flow (the feature tour
    /// between auth and personalization). TikTok's CompleteTutorial event
    /// fits this conceptually and is a useful mid-funnel signal between
    /// Login and Registration.
    public func trackTutorialComplete() {
        guard isConfigured else { return }
        let event = TikTokBaseEvent(eventName: TTEventName.completeTutorial.rawValue)
        TikTokBusiness.trackTTEvent(event)
    }

    /// User actively searched (debounced commit, not per-keystroke). We
    /// deliberately do not pass the query text — search terms in a
    /// clinical app can carry sensitive intent.
    public func trackSearch() {
        guard isConfigured else { return }
        let event = TikTokBaseEvent(eventName: TTEventName.search.rawValue)
        TikTokBusiness.trackTTEvent(event)
    }

    /// User selected a plan and tapped the paywall CTA — declared intent
    /// to purchase, before the StoreKit sheet appears. Mid-funnel signal
    /// between paywall view and StartTrial/Subscribe.
    public func trackAddPaymentInfo() {
        guard isConfigured else { return }
        let event = TikTokBaseEvent(eventName: TTEventName.addPaymentInfo.rawValue)
        TikTokBusiness.trackTTEvent(event)
    }

    /// Paywall surfaced — fired from `PaywallView.onAppear` for both the
    /// onboarding paywall step and the quota-exhaustion paywall. `source`
    /// matches the existing PostHog `paywall_viewed` source tag so the
    /// two analytics surfaces stay aligned.
    public func trackPaywallView(source: String) {
        guard isConfigured else { return }
        let event = TikTokViewContentEvent(eventId: UUID().uuidString)
        event.setContentType("paywall")
        event.setContentId(source)
        TikTokBusiness.trackTTEvent(event)
    }

    /// Trial started — fires only when StoreKit reports an intro-period
    /// activation. Revenue is intentionally zero (Apple won't bill until
    /// day 4); the `trial_converted` signal comes server-side via the
    /// RevenueCat webhook later.
    public func trackTrialStart(productID: String, currency: String) {
        guard isConfigured else { return }
        let event = TikTokBaseEvent(eventName: TTEventName.startTrial.rawValue)
        _ = event.addProperty(withKey: "content_id", value: productID)
        _ = event.addProperty(withKey: "currency", value: currency)
        TikTokBusiness.trackTTEvent(event)
    }

    /// Direct subscription purchase (no trial). Booked at the StoreKit
    /// price the user paid in the StoreKit-reported currency.
    public func trackSubscription(productID: String, price: Decimal, currency: String) {
        guard isConfigured else { return }
        let event = TikTokBaseEvent(eventName: TTEventName.subscribe.rawValue)
        _ = event.addProperty(withKey: "content_id", value: productID)
        _ = event.addProperty(withKey: "value", value: NSDecimalNumber(decimal: price))
        _ = event.addProperty(withKey: "currency", value: currency)
        TikTokBusiness.trackTTEvent(event)
    }
}
