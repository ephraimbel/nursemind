import Foundation
import StoreKit
import Testing
@testable import NursemindCore

@Suite("SKAN subscription attribution")
@MainActor
struct SKANAttributionTests {
    @Test func disabledConfigurationDoesNotUpdateAttribution() {
        let recorder = Recorder()
        let service = recorder.service(enabled: false)
        service.applicationDidBecomeActive()
        recorder.purchase(with: service, isTrial: false)
        #expect(recorder.updates.isEmpty)
        #expect(recorder.saved == nil)
        #expect(!service.needsSubscriptionRefresh)
    }

    @Test func trialConversionIsReportedInSecondWindowAndNotReplayedAsARenewal() {
        let recorder = Recorder()
        let service = recorder.service()
        service.applicationDidBecomeActive()
        let trial = recorder.purchase(with: service, isTrial: true)
        #expect(service.needsSubscriptionRefresh)
        #expect(recorder.updates == [.init(fine: 1, coarse: "low"), .init(fine: 2, coarse: "medium")])

        recorder.now = recorder.start.addingTimeInterval(3 * 86_400)
        service.applicationDidBecomeActive()
        var paid = trial
        paid.isTrial = false
        paid.paidAmount = 99.99
        paid.purchaseDate = recorder.now
        service.observe(paid)
        service.observe(paid)
        #expect(recorder.updates.suffix(2) == [.init(fine: 1, coarse: "low"), .init(fine: 3, coarse: "high")])
        #expect(!service.needsSubscriptionRefresh)

        recorder.now = recorder.start.addingTimeInterval(8 * 86_400)
        service.applicationDidBecomeActive()
        paid.purchaseDate = recorder.now
        service.observe(paid)
        #expect(recorder.updates.last == .init(fine: 1, coarse: "low"))
        #expect(recorder.updates.filter { $0.fine == 3 }.count == 1)
    }

    @Test func directPaidPurchaseDoesNotBecomeATrialOrDowngradeOnForeground() {
        let recorder = Recorder()
        let service = recorder.service()
        recorder.purchase(with: service, isTrial: false)
        service.applicationDidBecomeActive()
        #expect(recorder.updates == [.init(fine: 3, coarse: "high")])
        #expect(!service.needsSubscriptionRefresh)
    }

    @Test func restoredAndUnpaidSubscriptionsDoNotProducePurchaseConversions() {
        let recorder = Recorder()
        let service = recorder.service()
        var subscription = recorder.subscription(isTrial: false)
        service.observe(subscription)
        #expect(recorder.updates.isEmpty)

        subscription.originalPurchaseDate = recorder.start.addingTimeInterval(-86_400)
        service.recordPurchase(subscription, transactionDate: recorder.now, requestStartedAt: recorder.now)
        #expect(recorder.updates.isEmpty)

        subscription = recorder.subscription(isTrial: false)
        subscription.paidAmount = 0
        service.recordPurchase(subscription, transactionDate: recorder.now, requestStartedAt: recorder.now)
        subscription.paidAmount = nil
        service.recordPurchase(subscription, transactionDate: recorder.now, requestStartedAt: recorder.now)
        subscription.paidAmount = 14.99
        subscription.eligible = false
        service.recordPurchase(subscription, transactionDate: recorder.now, requestStartedAt: recorder.now)
        subscription.eligible = true
        service.recordPurchase(subscription, transactionDate: recorder.now.addingTimeInterval(-60), requestStartedAt: recorder.now)
        #expect(recorder.updates.isEmpty)
    }

    @Test func pendingPurchaseSurvivesFailureAndRelaunchWithoutConcurrentUpdates() {
        let recorder = Recorder()
        recorder.completeImmediately = false
        var service = recorder.service()
        service.applicationDidBecomeActive()
        recorder.purchase(with: service, isTrial: false)
        #expect(recorder.updates.count == 1)
        recorder.complete(false)

        service = recorder.service()
        service.applicationDidBecomeActive()
        #expect(recorder.updates.last == .init(fine: 3, coarse: "high"))
        recorder.complete(true)
        service.applicationDidBecomeActive()
        #expect(recorder.updates.count == 2)
    }

    @Test func successfulInflightOpenIsFollowedByQueuedTrial() {
        let recorder = Recorder()
        recorder.completeImmediately = false
        let service = recorder.service()
        service.applicationDidBecomeActive()
        recorder.purchase(with: service, isTrial: true)
        recorder.complete(true)
        #expect(recorder.updates.map(\.fine) == [1, 2])
        recorder.complete(true)
        service.applicationDidBecomeActive()
        #expect(recorder.updates.count == 2)
    }

    @Test func windowsResetWithoutReplayingOlderEventsAndStopAtDay35() {
        let recorder = Recorder()
        let service = recorder.service()
        recorder.purchase(with: service, isTrial: true)
        recorder.now = recorder.start.addingTimeInterval(2 * 86_400 - 1)
        service.applicationDidBecomeActive()
        #expect(recorder.updates.count == 1)
        recorder.now = recorder.start.addingTimeInterval(2 * 86_400)
        service.applicationDidBecomeActive()
        recorder.now = recorder.start.addingTimeInterval(7 * 86_400)
        service.applicationDidBecomeActive()
        #expect(recorder.updates.map(\.fine) == [2, 1, 1])
        recorder.now = recorder.start.addingTimeInterval(35 * 86_400)
        service.applicationDidBecomeActive()
        #expect(recorder.updates.count == 3)
        #expect(!service.needsSubscriptionRefresh)
    }

    @Test func anotherAccountOrProductCannotConvertTheLocallyStartedTrial() {
        let recorder = Recorder()
        let service = recorder.service()
        var trial = recorder.purchase(with: service, isTrial: true)
        recorder.now = recorder.start.addingTimeInterval(3 * 86_400)
        trial.isTrial = false
        trial.paidAmount = 99.99
        trial.purchaseDate = recorder.now
        trial.originalPurchaseDate = recorder.start.addingTimeInterval(-1)
        service.observe(trial)
        trial.originalPurchaseDate = recorder.start
        trial.productID = "unrelated"
        service.observe(trial)
        #expect(recorder.updates.map(\.fine) == [2])
        #expect(service.needsSubscriptionRefresh)
    }

    private struct Update: Equatable {
        var fine: Int
        var coarse: String
    }

    @MainActor
    private final class Recorder {
        let start = Date(timeIntervalSince1970: 1_800_000_000)
        lazy var now = start
        var saved: Data?
        var updates: [Update] = []
        var completeImmediately = true
        var completions: [@MainActor (Bool) -> Void] = []

        func service(enabled: Bool = true) -> SKANAttributionService {
            let service = SKANAttributionService(dependencies: .init(
                now: { self.now },
                load: { self.saved },
                save: { self.saved = $0 },
                update: { fine, coarse, completion in
                    self.updates.append(Update(fine: fine, coarse: coarse.rawValue))
                    if self.completeImmediately { completion(true) }
                    else { self.completions.append(completion) }
                }
            ))
            if enabled {
                service.configure()
            } else {
                service.configure(enabled: false)
            }
            return service
        }

        func complete(_ succeeded: Bool) { completions.removeFirst()(succeeded) }

        func subscription(isTrial: Bool) -> SKANAttributionService.Subscription {
            .init(productID: "annual", originalPurchaseDate: start, purchaseDate: now,
                  isTrial: isTrial, paidAmount: isTrial ? 0 : 99.99, eligible: true)
        }

        @discardableResult
        func purchase(with service: SKANAttributionService, isTrial: Bool) -> SKANAttributionService.Subscription {
            let subscription = subscription(isTrial: isTrial)
            service.recordPurchase(subscription, transactionDate: now, requestStartedAt: now)
            return subscription
        }
    }
}
