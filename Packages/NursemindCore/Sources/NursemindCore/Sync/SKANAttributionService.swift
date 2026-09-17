import Foundation
import RevenueCat
import StoreKit

@MainActor
public final class SKANAttributionService {
    public static let shared = SKANAttributionService(dependencies: .live)

    enum Event: Int, Codable {
        case appOpened = 1
        case trialStarted = 2
        case purchased = 3

        var coarse: SKAdNetwork.CoarseConversionValue {
            switch self {
            case .appOpened: .low
            case .trialStarted: .medium
            case .purchased: .high
            }
        }
    }

    struct Subscription: Codable {
        var productID: String
        var originalPurchaseDate: Date
        var purchaseDate: Date
        var isTrial: Bool
        var paidAmount: Double?
        var eligible: Bool
    }

    struct Window: Codable {
        var desired = 0
        var submitted = 0
    }

    struct State: Codable {
        var firstLaunch: Date
        var windows = [Window(), Window(), Window()]
        var trial: Subscription?
        var hasRecordedPurchase = false
    }

    struct Dependencies {
        var now: () -> Date
        var load: () -> Data?
        var save: (Data) -> Void
        var update: (Int, SKAdNetwork.CoarseConversionValue, @escaping @MainActor (Bool) -> Void) -> Void

        static var live: Self {
            let directory = URL.applicationSupportDirectory.appending(path: "SKAN", directoryHint: .isDirectory)
            let file = directory.appending(path: "conversion-state.json")
            return Self(
                now: Date.init,
                load: { try? Data(contentsOf: file) },
                save: { data in
                    do {
                        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
                        var excluded = directory
                        var values = URLResourceValues()
                        values.isExcludedFromBackup = true
                        try excluded.setResourceValues(values)
                        try data.write(to: file, options: [.atomic, .completeFileProtectionUntilFirstUserAuthentication])
                    } catch {
                        // Attribution must never interrupt access to the reference library.
                    }
                },
                update: { fine, coarse, completion in
                    SKAdNetwork.updatePostbackConversionValue(fine, coarseValue: coarse, lockWindow: false) { error in
                        let succeeded = error == nil
                        Task { @MainActor in completion(succeeded) }
                    }
                }
            )
        }
    }

    private let dependencies: Dependencies
    private var state: State?
    private var isUpdating = false

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    public func configure(enabled: Bool = true) {
        guard enabled, state == nil else { return }
        if let data = dependencies.load(),
           let saved = try? JSONDecoder().decode(State.self, from: data),
           saved.windows.count == 3 {
            state = saved
        } else {
            state = State(firstLaunch: dependencies.now())
        }
        persist()
    }

    public var needsSubscriptionRefresh: Bool {
        currentWindow != nil && state?.trial != nil && state?.hasRecordedPurchase == false
    }

    public func applicationDidBecomeActive() {
        record(.appOpened)
    }

    func recordPurchase(_ subscription: Subscription, transactionDate: Date, requestStartedAt: Date) {
        guard let state, currentWindow != nil, subscription.eligible,
              subscription.originalPurchaseDate >= state.firstLaunch,
              transactionDate >= requestStartedAt.addingTimeInterval(-5),
              transactionDate <= dependencies.now(),
              !state.hasRecordedPurchase else { return }
        if subscription.isTrial {
            self.state?.trial = subscription
            record(.trialStarted)
        } else if let amount = subscription.paidAmount, amount > 0 {
            self.state?.hasRecordedPurchase = true
            record(.purchased)
        }
    }

    func observe(_ subscription: Subscription) {
        guard currentWindow != nil, let state, let trial = state.trial,
              !state.hasRecordedPurchase, subscription.eligible,
              subscription.productID == trial.productID,
              subscription.originalPurchaseDate == trial.originalPurchaseDate,
              subscription.purchaseDate > trial.purchaseDate,
              subscription.purchaseDate <= dependencies.now(),
              !subscription.isTrial,
              let amount = subscription.paidAmount, amount > 0 else { return }
        self.state?.hasRecordedPurchase = true
        record(.purchased)
    }

    func observeCustomerInfo(_ info: CustomerInfo) {
        guard let subscription = subscription(from: info) else { return }
        observe(subscription)
    }

    func recordPurchase(customerInfo: CustomerInfo, transaction: StoreTransaction?, requestStartedAt: Date) {
        guard let transaction, let subscription = subscription(from: customerInfo),
              transaction.productIdentifier == subscription.productID else { return }
        recordPurchase(subscription, transactionDate: transaction.purchaseDate, requestStartedAt: requestStartedAt)
    }

    private func subscription(from info: CustomerInfo) -> Subscription? {
        guard let entitlement = info.entitlements.active[RevenueCatService.proEntitlementID],
              let subscription = info.subscriptionsByProductIdentifier[entitlement.productIdentifier],
              let original = subscription.originalPurchaseDate else { return nil }
        #if DEBUG
        let environmentAllowed = true
        #else
        let environmentAllowed = !subscription.isSandbox
        #endif
        return Subscription(
            productID: subscription.productIdentifier,
            originalPurchaseDate: original,
            purchaseDate: subscription.purchaseDate,
            isTrial: subscription.periodType == .trial,
            paidAmount: subscription.price?.amount,
            eligible: environmentAllowed && subscription.store == .appStore && subscription.isActive
                && subscription.ownershipType == .purchased && subscription.refundedAt == nil
                && subscription.billingIssuesDetectedAt == nil
        )
    }

    private var currentWindow: Int? {
        guard let state else { return nil }
        let elapsed = dependencies.now().timeIntervalSince(state.firstLaunch)
        switch elapsed {
        case 0..<(2 * 86_400): return 0
        case (2 * 86_400)..<(7 * 86_400): return 1
        case (7 * 86_400)..<(35 * 86_400): return 2
        default: return nil
        }
    }

    private func record(_ event: Event) {
        guard let window = currentWindow else { return }
        let previous = state?.windows[window].desired ?? 0
        state?.windows[window].desired = max(previous, event.rawValue)
        persist()
        submitPending()
    }

    private func submitPending() {
        guard !isUpdating, let window = currentWindow, let state,
              state.windows[window].desired > state.windows[window].submitted,
              let event = Event(rawValue: state.windows[window].desired) else { return }
        isUpdating = true
        dependencies.update(event.rawValue, event.coarse) { [weak self] succeeded in
            guard let self else { return }
            self.isUpdating = false
            guard succeeded else { return }
            self.state?.windows[window].submitted = event.rawValue
            self.persist()
            self.submitPending()
        }
    }

    private func persist() {
        guard let state, let data = try? JSONEncoder().encode(state) else { return }
        dependencies.save(data)
    }
}
