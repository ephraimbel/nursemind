import AppTrackingTransparency
import Foundation
import RevenueCat
import TikTokBusinessSDK
import UIKit

@MainActor
public final class TikTokAnalyticsService {
    public static let shared = TikTokAnalyticsService(dependencies: .live)

    struct Event: Equatable {
        var name: String
        var id: String = UUID().uuidString
        var productID: String?
        var value: Double?
        var currency: String?
        var isTransaction = false
    }

    @MainActor
    struct Dependencies {
        var authorized: () -> Bool
        var active: () -> Bool
        var userID: () -> String?
        var now: () -> Date
        var initialize: (String, String, String, @escaping @MainActor @Sendable (Bool) -> Void) -> Void
        var enableTracking: (Bool) -> Void
        var identify: (String) -> Void
        var logout: () -> Void
        var log: (Event) -> Void
        var load: () -> Data?
        var save: (Data) -> Void

        static var live: Self {
            Self(
                authorized: { ATTrackingManager.trackingAuthorizationStatus == .authorized },
                active: { UIApplication.shared.applicationState == .active },
                userID: {
                    guard case .signedIn(let id) = SupabaseService.shared.state else { return nil }
                    return id.uuidString.lowercased()
                },
                now: Date.init,
                initialize: { appID, tiktokAppID, token, completion in
                    guard let config = TikTokAnalyticsService.sdkConfiguration(
                        appID: appID, tiktokAppID: tiktokAppID, accessToken: token
                    ) else { completion(false); return }
                    TikTokBusiness.initializeSdk(config) { success, _ in
                        Task { @MainActor in completion(success) }
                    }
                },
                enableTracking: { TikTokBusiness.setTrackingEnabled($0) },
                identify: {
                    TikTokBusiness.identify(withExternalID: $0, externalUserName: nil, phoneNumber: nil, email: nil)
                },
                logout: { TikTokBusiness.logout() },
                log: { event in
                    let sdkEvent = TikTokBaseEvent(eventName: event.name, eventId: event.id)
                    if let productID = event.productID {
                        _ = sdkEvent.addProperty(withKey: "content_id", value: productID)
                    }
                    if let value = event.value {
                        _ = sdkEvent.addProperty(withKey: "value", value: NSNumber(value: value))
                    }
                    if let currency = event.currency {
                        _ = sdkEvent.addProperty(withKey: "currency", value: currency)
                    }
                    TikTokBusiness.trackTTEvent(sdkEvent)
                    TikTokBusiness.explicitlyFlush()
                },
                load: { UserDefaults.standard.data(forKey: "analytics.tiktok.purchases.v1") },
                save: { UserDefaults.standard.set($0, forKey: "analytics.tiktok.purchases.v1") }
            )
        }
    }

    struct Purchase: Codable {
        var userID: String
        var transactionID: String
        var productID: String
        var purchaseDate: Date
        var originalPurchaseDate: Date
        var isTrial: Bool
        var amount: Double?
        var currency: String?
        var eligible: Bool
    }

    private struct PurchaseState: Codable {
        var emittedIDs: [String] = []
        var pending: Purchase?
    }

    private let dependencies: Dependencies
    private var credentials: (appID: String, tiktokAppID: String, token: String)?
    private var initialized = false
    private var initializing = false
    private var attached = false
    private var launched = false
    private var lastUserID: String?
    private var queue: [Event] = []
    private var queuedUserID: String?
    private var purchaseState: PurchaseState

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        purchaseState = dependencies.load().flatMap { try? JSONDecoder().decode(PurchaseState.self, from: $0) }
            ?? PurchaseState()
    }

    static func sdkConfiguration(appID: String, tiktokAppID: String, accessToken: String) -> TikTokConfig? {
        guard !appID.isEmpty, !tiktokAppID.isEmpty, !accessToken.isEmpty,
              let config = TikTokConfig(accessToken: accessToken, appId: appID, tiktokAppId: tiktokAppID) else { return nil }
        // One owner per signal: the app owns SKAN and verified RevenueCat payments.
        config.disableSKAdNetworkSupport()
        config.disablePaymentTracking()
        config.disableAutoEnhancedDataPostbackEvent()
        // Automatic launches would otherwise be queued while consent is revoked.
        config.disableLaunchTracking()
        config.disableRetentionTracking()
        #if DEBUG
        config.enableDebugMode()
        #endif
        return config
    }

    public func configure(appID: String, tiktokAppID: String, accessToken: String) {
        guard credentials == nil, !appID.isEmpty, !tiktokAppID.isEmpty, !accessToken.isEmpty else { return }
        credentials = (appID, tiktokAppID, accessToken)
    }

    public func requestTrackingAuthorization(completion: @escaping @MainActor @Sendable () -> Void = {}) {
        guard ATTrackingManager.trackingAuthorizationStatus == .notDetermined else {
            applicationDidBecomeActive()
            completion()
            return
        }
        ATTrackingManager.requestTrackingAuthorization { _ in
            Task { @MainActor in
                self.applicationDidBecomeActive()
                completion()
            }
        }
    }

    public func attach() {
        guard !attached else { return }
        attached = true
        observeAuthState()
    }

    private func observeAuthState() {
        withObservationTracking { _ = SupabaseService.shared.state } onChange: { [weak self] in
            Task { @MainActor in self?.observeAuthState() }
        }
        synchronizeAttribution()
    }

    public func applicationDidEnterBackground() {
        launched = false
        if initialized { dependencies.enableTracking(false) }
    }

    public func applicationDidBecomeActive() {
        guard dependencies.active() else { return }
        synchronizeAttribution()
        guard credentials != nil, dependencies.authorized(), !launched else { return }
        launched = true
        track(Event(name: TTEventName.launchAPP.rawValue))
    }

    public func synchronizeAttribution() {
        guard dependencies.authorized() else {
            queue.removeAll()
            purchaseState.pending = nil
            persist()
            launched = false
            if initialized {
                dependencies.enableTracking(false)
                if lastUserID != nil { dependencies.logout() }
            }
            lastUserID = nil
            return
        }
        guard let credentials, dependencies.active() else { return }
        if initialized {
            synchronizeIdentity()
            dependencies.enableTracking(true)
            flushQueue()
        } else if !initializing {
            initializing = true
            dependencies.initialize(credentials.appID, credentials.tiktokAppID, credentials.token) { [weak self] success in
                guard let self else { return }
                self.initializing = false
                self.initialized = success
                if success {
                    self.dependencies.enableTracking(false)
                    self.dependencies.logout()
                    self.synchronizeAttribution()
                }
            }
        }
    }

    private func synchronizeIdentity() {
        let userID = dependencies.userID()
        guard userID != lastUserID else { return }
        if queuedUserID != userID { queue.removeAll() }
        if lastUserID != nil {
            dependencies.enableTracking(false)
            dependencies.logout()
        }
        if purchaseState.pending?.userID != userID { purchaseState.pending = nil; persist() }
        lastUserID = userID
        if let userID {
            dependencies.enableTracking(true)
            dependencies.identify(userID)
        }
    }

    public func resetForFreshAccount() {
        queue.removeAll()
        purchaseState.pending = nil
        persist()
        if initialized {
            dependencies.enableTracking(false)
            dependencies.logout()
        }
        lastUserID = nil
    }

    public func trackOnboardingComplete() { track(Event(name: TTEventName.registration.rawValue)) }
    public func trackTutorialComplete() { track(Event(name: TTEventName.completeTutorial.rawValue)) }
    public func trackCheckoutStarted() { track(Event(name: "Checkout")) }
    public func trackPaywallView() { track(Event(name: "ViewContent", productID: "paywall")) }

    private func track(_ event: Event) {
        synchronizeAttribution()
        guard credentials != nil, dependencies.authorized(), dependencies.active() else { return }
        guard !event.isTransaction || !purchaseState.emittedIDs.contains(event.id),
              !queue.contains(where: { $0.id == event.id }) else { return }
        if queue.isEmpty { queuedUserID = dependencies.userID() }
        queue.append(event)
        flushQueue()
    }

    private func flushQueue() {
        guard initialized, dependencies.authorized(), dependencies.active() else { return }
        let events = queue
        queue.removeAll()
        for event in events {
            dependencies.log(event)
            if event.isTransaction {
                purchaseState.emittedIDs.append(event.id)
                purchaseState.emittedIDs = Array(purchaseState.emittedIDs.suffix(256))
                if event.name == "Purchase" { purchaseState.pending = nil }
                persist()
            }
        }
    }

    public var needsSubscriptionRefresh: Bool {
        guard dependencies.authorized(), let pending = purchaseState.pending,
              pending.userID == dependencies.userID() else { return false }
        return dependencies.now().timeIntervalSince(pending.purchaseDate) < 35 * 86_400
    }

    func recordPurchase(_ purchase: Purchase, transactionID: String, transactionDate: Date, requestStartedAt: Date) {
        guard credentials != nil, dependencies.authorized(), purchase.eligible,
              purchase.userID == dependencies.userID(), !purchase.transactionID.isEmpty,
              purchase.transactionID == transactionID,
              transactionDate >= requestStartedAt.addingTimeInterval(-5),
              transactionDate <= dependencies.now(),
              abs(purchase.purchaseDate.timeIntervalSince(transactionDate)) <= 5 else { return }
        let eventName = purchase.isTrial ? TTEventName.startTrial.rawValue : "Purchase"
        guard !purchaseState.emittedIDs.contains("appstore:\(purchase.transactionID):\(eventName)") else { return }
        purchaseState.pending = purchase
        persist()
        emitPurchase(purchase)
    }

    func observe(_ purchase: Purchase) {
        guard dependencies.authorized(), let pending = purchaseState.pending,
              purchase.eligible, purchase.userID == dependencies.userID(),
              purchase.userID == pending.userID, purchase.productID == pending.productID,
              purchase.originalPurchaseDate == pending.originalPurchaseDate,
              purchase.purchaseDate >= pending.purchaseDate,
              purchase.purchaseDate <= dependencies.now(),
              dependencies.now().timeIntervalSince(purchase.purchaseDate) <= 86_400 else { return }
        emitPurchase(purchase)
    }

    private func emitPurchase(_ purchase: Purchase) {
        guard !purchase.transactionID.isEmpty,
              let currency = purchase.currency, currency.count == 3,
              currency.unicodeScalars.allSatisfy({ (65...90).contains(Int($0.value)) }) else { return }
        let value: Double
        if purchase.isTrial {
            value = 0
        } else {
            guard let amount = purchase.amount, amount.isFinite, amount > 0 else { return }
            value = amount
        }
        let name = purchase.isTrial ? TTEventName.startTrial.rawValue : "Purchase"
        track(Event(name: name, id: "appstore:\(purchase.transactionID):\(name)", productID: purchase.productID,
                    value: value, currency: currency, isTransaction: true))
    }

    func recordPurchase(customerInfo: CustomerInfo, transaction: StoreTransaction?, requestStartedAt: Date, purchasingUserID: String) {
        guard purchasingUserID == dependencies.userID(),
              let transaction, let purchase = purchase(from: customerInfo),
              transaction.productIdentifier == purchase.productID else { return }
        recordPurchase(purchase, transactionID: transaction.transactionIdentifier,
                       transactionDate: transaction.purchaseDate, requestStartedAt: requestStartedAt)
    }

    func observeCustomerInfo(_ info: CustomerInfo) {
        guard let purchase = purchase(from: info) else { return }
        observe(purchase)
    }

    private func purchase(from info: CustomerInfo) -> Purchase? {
        guard Purchases.isConfigured, let userID = dependencies.userID(),
              Purchases.shared.appUserID == userID,
              let entitlement = info.entitlements.active[RevenueCatService.proEntitlementID],
              let subscription = info.subscriptionsByProductIdentifier[entitlement.productIdentifier],
              let original = subscription.originalPurchaseDate,
              let transactionID = subscription.storeTransactionId else { return nil }
        #if DEBUG
        let environmentAllowed = true
        #else
        let environmentAllowed = !subscription.isSandbox
        #endif
        return Purchase(userID: userID, transactionID: transactionID, productID: subscription.productIdentifier,
                        purchaseDate: subscription.purchaseDate, originalPurchaseDate: original,
                        isTrial: subscription.periodType == .trial, amount: subscription.price?.amount,
                        currency: subscription.price?.currency,
                        eligible: environmentAllowed && subscription.store == .appStore && subscription.isActive
                            && subscription.ownershipType == .purchased && subscription.refundedAt == nil
                            && subscription.billingIssuesDetectedAt == nil)
    }

    private func persist() {
        if let data = try? JSONEncoder().encode(purchaseState) { dependencies.save(data) }
    }
}
