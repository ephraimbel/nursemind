import Foundation
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
/// called explicitly from the app once the onboarding paywall closes,
/// keeping the system prompt out of the onboarding stack.
@MainActor
public final class TikTokAnalyticsService {
    public static let shared = TikTokAnalyticsService()

    private var isConfigured = false

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

    /// Request iOS ATT permission for IDFA tracking. Wired to fire when
    /// the onboarding paywall closes so the system prompt doesn't stack
    /// on top of notifications-consent or Sign-In-With-Apple.
    public func requestTrackingAuthorization() {
        guard isConfigured else { return }
        TikTokBusiness.requestTrackingAuthorization { _ in
            // The status is fine to ignore — TikTok stores it internally
            // and gates IDFA-bearing requests on it. Nothing else in the
            // app branches on ATT state today.
        }
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
