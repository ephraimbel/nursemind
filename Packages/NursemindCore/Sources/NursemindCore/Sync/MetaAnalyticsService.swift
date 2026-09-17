import AppTrackingTransparency
import AdSupport
import FBSDKCoreKit
import RevenueCat
import UIKit

@MainActor
public final class MetaAnalyticsService {
    public static let shared = MetaAnalyticsService(dependencies: .live)

    enum Event: String {
        case onboardingCompleted = "nm_onboarding_completed"
        case tutorialCompleted = "fb_mobile_tutorial_completion"
        case paywallViewed = "fb_mobile_content_view"
        case checkoutStarted = "fb_mobile_initiated_checkout"
    }

    @MainActor
    struct Dependencies {
        var authorized: () -> Bool
        var active: () -> Bool
        var purchasesConfigured: () -> Bool
        var initialize: (String, String) -> Void
        var enableIdentifiers: (Bool) -> Void
        var synchronizeIdentifiers: () -> Void
        var clearAnonymousID: () -> Void
        var activate: () -> Void
        var log: (Event) -> Void
        var flush: () -> Void

        static var live: Self {
            Self(
                authorized: { ATTrackingManager.trackingAuthorizationStatus == .authorized },
                active: { UIApplication.shared.applicationState == .active },
                purchasesConfigured: { Purchases.isConfigured },
                initialize: { appID, clientToken in
                    Settings.shared.appID = appID
                    Settings.shared.clientToken = clientToken
                    Settings.shared.displayName = "NurseMind"
                    // RevenueCat alone sends revenue; SKAN ownership is configured separately.
                    Settings.shared.isAutoLogAppEventsEnabled = false
                    Settings.shared.isSKAdNetworkReportEnabled = false
                    Settings.shared.isAdvertiserIDCollectionEnabled = true
                    AppEvents.shared.flushBehavior = .explicitOnly
                    ApplicationDelegate.shared.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
                },
                enableIdentifiers: { Settings.shared.isAdvertiserIDCollectionEnabled = $0 },
                synchronizeIdentifiers: {
                    Purchases.shared.attribution.collectDeviceIdentifiers()
                    Purchases.shared.attribution.setFBAnonymousID(AppEvents.shared.anonymousID)
                },
                clearAnonymousID: { Purchases.shared.attribution.setFBAnonymousID(nil) },
                activate: {
                    AppEvents.shared.activateApp()
                    // Meta queues the activation event on the main queue; flush after that work.
                    DispatchQueue.main.async {
                        guard ATTrackingManager.trackingAuthorizationStatus == .authorized else { return }
                        AppEvents.shared.flush()
                    }
                },
                log: { AppEvents.shared.logEvent(AppEvents.Name(rawValue: $0.rawValue)) },
                flush: { AppEvents.shared.flush() }
            )
        }
    }

    private let dependencies: Dependencies
    private var appID = ""
    private var clientToken = ""
    private var isInitialized = false
    private var hasActivatedThisSession = false

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    public func configure(appID: String, clientToken: String) {
        guard !isInitialized else { return }
        self.appID = appID
        self.clientToken = clientToken
    }

    public func applicationDidEnterBackground() {
        hasActivatedThisSession = false
    }

    public func applicationDidBecomeActive() {
        guard dependencies.active() else { return }
        synchronizeAttribution()
        guard isInitialized,
              dependencies.authorized(),
              !hasActivatedThisSession else { return }
        hasActivatedThisSession = true
        dependencies.activate()
    }

    public func trackOnboardingComplete() { track(.onboardingCompleted) }
    public func trackTutorialComplete() { track(.tutorialCompleted) }
    public func trackPaywallView() { track(.paywallViewed) }
    public func trackCheckoutStarted() { track(.checkoutStarted) }

    private func track(_ event: Event) {
        synchronizeAttribution()
        guard isInitialized, dependencies.authorized(), dependencies.active() else { return }
        // No arbitrary parameters: clinical context cannot enter the advertising funnel.
        dependencies.log(event)
        dependencies.flush()
    }

    public func synchronizeAttribution() {
        guard !appID.isEmpty, !clientToken.isEmpty, dependencies.purchasesConfigured() else { return }
        guard dependencies.authorized() else {
            if isInitialized {
                dependencies.enableIdentifiers(false)
            }
            hasActivatedThisSession = false
            dependencies.clearAnonymousID()
            return
        }

        if !isInitialized {
            dependencies.initialize(appID, clientToken)
            isInitialized = true
        }

        dependencies.enableIdentifiers(true)
        dependencies.synchronizeIdentifiers()
    }
}
