import Foundation
import Testing
@testable import NursemindCore

@Suite("TikTok consent and verified purchases")
@MainActor
struct TikTokAnalyticsTests {
    @Test func sdkOwnershipAndPrivacyConfiguration() throws {
        let config = try #require(TikTokAnalyticsService.sdkConfiguration(appID: "123", tiktokAppID: "456", accessToken: "test"))
        #expect(!config.skAdNetworkSupportEnabled)
        #expect(config.paymentTrackingStatus.rawValue == 2)
        #expect(!config.autoEDPEventEnabled)
        #expect(!config.launchTrackingEnabled)
        #expect(!config.retentionTrackingEnabled)
        #expect(config.installTrackingEnabled)
        #if DEBUG
        #expect(config.debugModeEnabled)
        #else
        #expect(!config.debugModeEnabled)
        #endif
    }

    @Test func consentRequiredAndDeniedEventsNeverReplay() {
        let r = Recorder(), service = r.service()
        service.applicationDidBecomeActive()
        service.trackCheckoutStarted()
        service.trackOnboardingComplete()
        #expect(r.calls.isEmpty && r.events.isEmpty)
        r.authorized = true
        service.applicationDidBecomeActive()
        #expect(r.calls.filter { $0 == "initialize" }.count == 1)
        #expect(r.events.map(\.name) == ["LaunchAPP"])
        #expect(r.calls.contains("identify:user-a"))
    }

    @Test func revocationStopsTrackingAndClearsPendingConversion() {
        let r = Recorder(authorized: true), service = r.service()
        r.record(r.purchase(trial: true), service)
        #expect(service.needsSubscriptionRefresh)
        r.calls.removeAll(); r.events.removeAll(); r.authorized = false
        service.trackCheckoutStarted()
        #expect(r.calls == ["tracking:false", "logout"])
        #expect(!service.needsSubscriptionRefresh)
        r.authorized = true
        service.applicationDidBecomeActive()
        #expect(!r.events.contains { $0.name == "Checkout" || $0.name == "Purchase" })
    }

    @Test func failedInitializationRetriesWithoutLosingQueuedPurchase() {
        let r = Recorder(authorized: true), service = r.service()
        r.initializeImmediately = false
        r.record(r.purchase(), service)
        #expect(r.events.isEmpty)
        r.finishInitialization?(false)
        service.applicationDidBecomeActive()
        #expect(r.calls.filter { $0 == "initialize" }.count == 2)
        r.finishInitialization?(true)
        #expect(r.events.filter { $0.name == "Purchase" }.count == 1)
    }

    @Test func revocationDuringInitializationDropsQueue() {
        let r = Recorder(authorized: true), service = r.service()
        r.initializeImmediately = false
        service.trackCheckoutStarted()
        r.authorized = false
        r.finishInitialization?(true)
        #expect(r.events.isEmpty && !r.calls.contains("identify:user-a"))
    }

    @Test func accountSwitchAndLogoutClearIdentityAndQueuedPurchase() {
        let r = Recorder(authorized: true), service = r.service()
        r.initializeImmediately = false
        r.record(r.purchase(), service)
        r.userID = "user-b"
        r.finishInitialization?(true)
        #expect(r.events.isEmpty && r.calls.contains("identify:user-b"))
        #expect(!service.needsSubscriptionRefresh)
        r.calls.removeAll(); r.userID = nil
        service.synchronizeAttribution()
        #expect(r.calls.contains("logout"))
        #expect(!r.calls.contains { $0.hasPrefix("identify:") })
    }

    @Test func checkoutIsIntentAndPaywallContainsNoClinicalSource() {
        let r = Recorder(authorized: true), service = r.service()
        service.trackCheckoutStarted(); service.trackPaywallView()
        #expect(r.events.map(\.name) == ["Checkout", "ViewContent"])
        #expect(r.events.allSatisfy { $0.value == nil && !$0.isTransaction })
        #expect(r.events.last?.productID == "paywall")
    }

    @Test func actualRevenueAndStableTransactionDeduplicationSurviveRestart() {
        let r = Recorder(authorized: true), service = r.service()
        var purchase = r.purchase(); purchase.amount = 7.49; purchase.currency = "CAD"
        r.record(purchase, service)
        #expect(r.events == [.init(name: "Purchase", id: "appstore:tx-1:Purchase", productID: "annual", value: 7.49, currency: "CAD", isTransaction: true)])
        r.record(purchase, service); r.record(purchase, r.service())
        #expect(r.events.filter { $0.name == "Purchase" }.count == 1)
        #expect(!service.needsSubscriptionRefresh)
    }

    @Test func trialIsZeroAndThreeDayConversionIsOnePurchaseAfterRestart() {
        let r = Recorder(authorized: true), service = r.service()
        let trial = r.purchase(trial: true)
        r.record(trial, service)
        #expect(r.events.first?.name == "StartTrial" && r.events.first?.value == 0)
        r.now = r.now.addingTimeInterval(3 * 86_400)
        var paid = r.purchase(); paid.originalPurchaseDate = trial.originalPurchaseDate; paid.transactionID = "tx-2"
        let restarted = r.service()
        restarted.observe(paid); restarted.observe(paid)
        #expect(r.events.map(\.name) == ["StartTrial", "Purchase"])
        #expect(!restarted.needsSubscriptionRefresh)
    }

    @Test func restoreOldIneligibleZeroAndUnknownTransactionsDoNotBookRevenue() {
        let r = Recorder(authorized: true), service = r.service()
        service.observe(r.purchase())
        var old = r.purchase(); old.purchaseDate = r.now.addingTimeInterval(-600); r.record(old, service)
        var ineligible = r.purchase(); ineligible.eligible = false; r.record(ineligible, service)
        for amount: Double? in [nil, 0, -1, .nan, .infinity] {
            var purchase = r.purchase(); purchase.amount = amount; r.record(purchase, service)
        }
        for currency: String? in [nil, "", "usd", "ZZZZ"] {
            var purchase = r.purchase(); purchase.currency = currency; r.record(purchase, service)
        }
        service.recordPurchase(r.purchase(), transactionID: "different", transactionDate: r.now, requestStartedAt: r.now)
        #expect(r.events.isEmpty)
    }

    @Test func missingPriceRecoversFromVerifiedCustomerInfo() {
        let r = Recorder(authorized: true), service = r.service()
        var purchase = r.purchase(); purchase.amount = nil; r.record(purchase, service)
        #expect(r.events.isEmpty)
        service.observe(r.purchase())
        #expect(r.events.map(\.name) == ["Purchase"])
    }

    @Test func oldAndUnrelatedConversionsAreNotNewPurchases() {
        let r = Recorder(authorized: true), service = r.service()
        let trial = r.purchase(trial: true); r.record(trial, service); r.events.removeAll()
        r.now = r.now.addingTimeInterval(5 * 86_400)
        var paid = r.purchase(); paid.originalPurchaseDate = trial.originalPurchaseDate
        paid.purchaseDate = r.now.addingTimeInterval(-2 * 86_400); service.observe(paid)
        paid.purchaseDate = r.now; paid.originalPurchaseDate = r.now; service.observe(paid)
        paid.originalPurchaseDate = trial.originalPurchaseDate; paid.userID = "user-b"; service.observe(paid)
        #expect(r.events.isEmpty)
    }

    @Test func backgroundPausesTransmissionAndForegroundLaunchIsOncePerSession() {
        let r = Recorder(authorized: true), service = r.service()
        service.applicationDidBecomeActive()
        service.applicationDidBecomeActive()
        #expect(r.events.map(\.name) == ["LaunchAPP"])
        r.active = false
        service.applicationDidEnterBackground()
        service.trackCheckoutStarted()
        #expect(r.calls.last == "tracking:false")
        r.active = true
        service.applicationDidBecomeActive()
        #expect(r.events.map(\.name) == ["LaunchAPP", "LaunchAPP"])
    }

    @Test func expiredTrialStopsForcingNetworkRefreshes() {
        let r = Recorder(authorized: true), service = r.service()
        r.record(r.purchase(trial: true), service)
        #expect(service.needsSubscriptionRefresh)
        r.now = r.now.addingTimeInterval(36 * 86_400)
        #expect(!service.needsSubscriptionRefresh)
    }

    @MainActor private final class Recorder {
        var authorized: Bool
        var active = true
        var userID: String? = "user-a"
        var now = Date(timeIntervalSince1970: 1_800_000_000)
        var initializeImmediately = true
        var finishInitialization: (@MainActor @Sendable (Bool) -> Void)?
        var calls: [String] = []
        var events: [TikTokAnalyticsService.Event] = []
        var data: Data?
        init(authorized: Bool = false) { self.authorized = authorized }
        func service() -> TikTokAnalyticsService {
            let service = TikTokAnalyticsService(dependencies: .init(
                authorized: { self.authorized }, active: { self.active }, userID: { self.userID }, now: { self.now },
                initialize: { _, _, _, completion in
                    self.calls.append("initialize"); self.finishInitialization = completion
                    if self.initializeImmediately { completion(true) }
                },
                enableTracking: { self.calls.append("tracking:\($0)") }, identify: { self.calls.append("identify:\($0)") },
                logout: { self.calls.append("logout") }, log: { self.events.append($0) },
                load: { self.data }, save: { self.data = $0 }
            ))
            service.configure(appID: "123", tiktokAppID: "456", accessToken: "test")
            return service
        }
        func purchase(trial: Bool = false) -> TikTokAnalyticsService.Purchase {
            .init(userID: "user-a", transactionID: "tx-1", productID: "annual", purchaseDate: now, originalPurchaseDate: now,
                  isTrial: trial, amount: trial ? 0 : 99.99, currency: "USD", eligible: true)
        }
        func record(_ purchase: TikTokAnalyticsService.Purchase, _ service: TikTokAnalyticsService) {
            service.recordPurchase(purchase, transactionID: purchase.transactionID, transactionDate: purchase.purchaseDate, requestStartedAt: now)
        }
    }
}
