import Foundation
import OSLog
import RevenueCat

private let revenueCatLog = Logger(subsystem: "app.nursemind.ios", category: "RevenueCat")

/// Single source of truth for the RevenueCat SDK and the bridge between
/// RevenueCat's `CustomerInfo` (instant, post-purchase) and the rest of the
/// app's subscription state.
///
/// Architecture:
///   - `Purchases.shared` is configured once at app launch via `configure(...)`.
///   - When `SupabaseService.state` flips to `.signedIn(userID)`, we call
///     `Purchases.logIn(userID.uuidString.lowercased())` so RevenueCat tags
///     every purchase with the same UUID Supabase Auth knows about. The
///     server-side `revenuecat-events` Edge Function uses that UUID to write
///     `profiles.subscription_tier` — closing the loop end-to-end.
///   - The `customerInfoStream` async sequence pushes any change in the
///     user's entitlement state (purchase, renewal, restore, cancel-effective)
///     into our `state`. We mirror it into `UserPreferences.subscriptionTier`
///     so the iOS UI updates instantly post-purchase, before the webhook
///     round-trip has a chance to refresh the server's view.
///
/// Pro entitlement: configure your RevenueCat project's Pro entitlement
/// identifier as `proEntitlementID` below. The SDK considers a user "Pro"
/// while `customerInfo.entitlements.active[proEntitlementID]` is non-nil.
@MainActor
@Observable
public final class RevenueCatService {
    public static let shared = RevenueCatService()

    /// Identifier of the "Pro" entitlement in your RevenueCat dashboard.
    /// Configure this once in Project → Entitlements; the iOS app reads it
    /// here. Keep in sync with your RevenueCat project setup.
    public static let proEntitlementID = "nursemind Pro"

    public enum State: Equatable, Sendable {
        case unconfigured
        case ready(isPro: Bool)
    }

    public private(set) var state: State = .unconfigured

    /// Active entitlements keyed by identifier — surfaced for UIs that want
    /// to show e.g. "renews on Jan 1" or differentiate Yearly vs Monthly.
    public private(set) var customerInfo: CustomerInfo?

    /// All available offerings (loaded async after `configure`). Populated
    /// once on launch and re-loaded after a successful purchase. The default
    /// offering is the one you've marked "current" in the RevenueCat dashboard.
    public private(set) var offerings: Offerings?

    private let supabase: SupabaseService
    private let prefs: UserPreferences
    private var observerTask: Task<Void, Never>?
    private var lastLinkedUserID: UUID?

    private init(
        supabase: SupabaseService = .shared,
        prefs: UserPreferences = .shared
    ) {
        self.supabase = supabase
        self.prefs = prefs
    }

    // MARK: - Configuration

    /// Call once from the app entry point with the RevenueCat SDK key.
    /// Idempotent — second calls are no-ops, which keeps SwiftUI's potential
    /// re-init of the `App` struct from re-configuring an SDK already wired.
    public func configure(apiKey: String) {
        guard !Purchases.isConfigured else { return }
        #if DEBUG
        Purchases.logLevel = .info
        #else
        Purchases.logLevel = .error
        #endif
        // Configure with no appUserID — purchases attributed to a RevenueCat-
        // generated anonymous ID until we call logIn(supabaseUUID) below.
        // After logIn, RevenueCat aliases the anonymous and the supabase
        // identities so any pre-login purchases follow the user.
        Purchases.configure(withAPIKey: apiKey)

        // Start observing customer info changes immediately. The first event
        // arrives after the cached customerInfo loads, then on every change.
        observerTask = Task { [weak self] in
            guard let self else { return }
            for await info in Purchases.shared.customerInfoStream {
                self.applyCustomerInfo(info)
            }
        }

        // Kick off offerings load — used by PaywallView and any custom
        // upgrade UI. Failures are non-fatal; the paywall will retry.
        Task { [weak self] in
            do {
                let offerings = try await Purchases.shared.offerings()
                self?.offerings = offerings
                revenueCatLog.info("Offerings loaded: current=\(offerings.current?.identifier ?? "nil", privacy: .public)")
            } catch {
                revenueCatLog.error("Offerings load failed: \(error.localizedDescription, privacy: .public)")
            }
        }

        // Bridge to Supabase auth: link RevenueCat's appUserID to the
        // Supabase user id once we have one.
        observeSupabaseState()
    }

    // MARK: - Supabase ↔ RevenueCat link

    private func observeSupabaseState() {
        withObservationTracking { [weak self] in
            _ = self?.supabase.state
        } onChange: { [weak self] in
            Task { @MainActor in
                self?.observeSupabaseState()
                await self?.linkIfNeeded()
            }
        }
        Task { await linkIfNeeded() }
    }

    /// Reset per-user-id tracking after account deletion. The SDK has
    /// already been told to logOut() by AccountDeletionService; we just
    /// clear the local "we already linked this user" guard so the next
    /// `.signedIn(...)` transition (post-fresh-account) re-runs linking.
    public func resetForFreshAccount() {
        lastLinkedUserID = nil
        customerInfo = nil
        state = .unconfigured
    }

    private func linkIfNeeded() async {
        guard case .signedIn(let userID) = supabase.state else { return }
        guard lastLinkedUserID != userID else { return }
        lastLinkedUserID = userID
        do {
            // logIn aliases the current (anonymous) RevenueCat user to this
            // appUserID. `created` is true when a brand-new RevenueCat user
            // was created; false when an existing one was resolved.
            let (info, _) = try await Purchases.shared.logIn(userID.uuidString.lowercased())
            applyCustomerInfo(info)
            revenueCatLog.info("RevenueCat appUserID linked to Supabase user=\(userID, privacy: .public)")
        } catch {
            revenueCatLog.error("RevenueCat logIn failed: \(error.localizedDescription, privacy: .public)")
        }
    }

    // MARK: - Customer info bridge

    private func applyCustomerInfo(_ info: CustomerInfo) {
        self.customerInfo = info
        let isPro = info.entitlements.active[Self.proEntitlementID] != nil
        self.state = .ready(isPro: isPro)
        bridgeToUserPreferences(info: info, isPro: isPro)
    }

    /// Mirror RevenueCat's view of the user's subscription into the local
    /// `UserPreferences.subscriptionTier` so existing UI (Profile card, daily
    /// quota footer, paywall gating) updates instantly when a purchase
    /// completes. The Supabase webhook still propagates to the server-side
    /// `profiles.subscription_tier` ~1 second later — that's what `ai-chat`
    /// reads for quota enforcement, so client-only manipulation here can't
    /// raise the cap server-side.
    private func bridgeToUserPreferences(info: CustomerInfo, isPro: Bool) {
        let tier = resolveTier(from: info, isPro: isPro)
        if prefs.subscriptionTier != tier {
            prefs.subscriptionTier = tier
            revenueCatLog.info("Local subscriptionTier updated to \(tier.rawValue, privacy: .public) from RevenueCat")
        }
    }

    /// Map an active entitlement to one of the iOS `SubscriptionTier` cases
    /// (free / proMonthly / proYearly). Discriminates yearly vs monthly by
    /// inspecting the active product identifier — keeps the analytics +
    /// quota math accurate for users on each plan.
    private func resolveTier(from info: CustomerInfo, isPro: Bool) -> SubscriptionTier {
        guard isPro,
              let entitlement = info.entitlements.active[Self.proEntitlementID]
        else { return .free }

        let productID = entitlement.productIdentifier.lowercased()
        if productID.contains("year") || productID.contains("annual") {
            return .proYearly
        }
        return .proMonthly
    }

    // MARK: - Convenience

    public var isPro: Bool {
        if case .ready(let isPro) = state { return isPro }
        return false
    }

    /// The current default offering, suitable for `PaywallView(offering:)`.
    public var currentOffering: Offering? {
        offerings?.current
    }

    /// Monthly + annual packages from the current offering, exposed in a
    /// shape the custom paywall can read directly. Returns `nil` for either
    /// slot if the corresponding package isn't configured in the dashboard.
    public var paywallPackages: (monthly: Package?, annual: Package?) {
        let offering = offerings?.current
        return (monthly: offering?.monthly, annual: offering?.annual)
    }

    public enum PurchaseOutcome {
        case completed
        case userCancelled
    }

    /// Initiates a StoreKit 2 purchase for the given package. RevenueCat
    /// invokes the system payment sheet; on success, the customer-info
    /// stream we're already listening to fires and updates
    /// `subscriptionTier` automatically — the caller just needs to dismiss
    /// the paywall when this returns `.completed`.
    public func purchase(_ package: Package) async throws -> PurchaseOutcome {
        let result = try await Purchases.shared.purchase(package: package)
        if result.userCancelled {
            AnalyticsService.shared.capture(
                "purchase_cancelled",
                properties: ["product_id": package.storeProduct.productIdentifier]
            )
            return .userCancelled
        }
        // CustomerInfo is included in the result; piping it through our
        // existing apply method updates local state synchronously rather
        // than waiting for the async stream to catch up.
        applyCustomerInfo(result.customerInfo)
        // Split trial-start from immediate purchase. StoreKit reports an
        // intro-period activation as a `.trial` periodType on the active
        // entitlement; without splitting these the trial→paid conversion
        // ratio is unmeasurable.
        let entitlement = result.customerInfo.entitlements.active[RevenueCatService.proEntitlementID]
        let isTrial = entitlement?.periodType == .trial
        let event = isTrial ? "trial_started" : "subscription_purchased"
        // Trials shouldn't book revenue — Apple won't bill until day 4.
        // The `trial_converted` server-side event (RC webhook → PostHog,
        // wired later) is where actual revenue lands.
        let revenue = isTrial ? 0.0 : NSDecimalNumber(decimal: package.storeProduct.price as Decimal).doubleValue
        AnalyticsService.shared.capture(
            event,
            properties: [
                "product_id": package.storeProduct.productIdentifier,
                "package_type": package.packageType == .annual ? "annual" : "monthly",
                "price": package.storeProduct.price.description,
                "currency": package.storeProduct.currencyCode ?? "USD",
                "expires_at": entitlement?.expirationDate?.timeIntervalSince1970 ?? 0,
                // PostHog convention — fills the built-in MRR/LTV charts
                // without us building dashboards from raw events.
                "$revenue": revenue
            ]
        )
        return .completed
    }

    /// Restores prior purchases for this Apple ID. After a successful
    /// restore, `subscriptionTier` reflects whatever entitlement comes back.
    public func restorePurchases() async throws {
        let info = try await Purchases.shared.restorePurchases()
        applyCustomerInfo(info)
    }
}
