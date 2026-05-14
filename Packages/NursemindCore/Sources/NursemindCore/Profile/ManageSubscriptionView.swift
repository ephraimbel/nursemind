import SwiftUI
import RevenueCat
import RevenueCatUI

/// Subscription destination from the Profile tab. Routes the user to the
/// right surface based on their RevenueCat-resolved entitlement state:
///
/// - **Free user** → our editorial `PaywallView` (single page, brand-owned
///   carousel-free design, live RC pricing). Same paywall the Ask flow
///   surfaces when the daily quota is hit, so users see one consistent
///   upgrade surface across the app.
/// - **Pro user** → RevenueCat's `CustomerCenterView` which natively handles
///   plan switching, cancellation, restore purchases, and refund requests
///   (iOS hands the OS-level subscription sheet for actual cancels).
///
/// The destination flips automatically the moment a purchase completes —
/// `RevenueCatService.shared.isPro` is bound to RevenueCat's
/// `customerInfoStream`, so the view re-renders with no manual refresh.
public struct ManageSubscriptionView: View {
    @State private var revenueCat = RevenueCatService.shared

    public init() {}

    public var body: some View {
        Group {
            if revenueCat.isPro {
                proView
            } else {
                paywall
            }
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Free user → Paywall

    /// Our own editorial `PaywallView`, fed live RC packages so prices and
    /// the savings calc stay in sync with the dashboard. After a successful
    /// purchase, `RevenueCatService` updates `isPro` via the customer-info
    /// stream and this view automatically re-renders into the proView branch.
    @ViewBuilder
    private var paywall: some View {
        let pkgs = revenueCat.paywallPackages
        PaywallView(
            monthlyPackage: pkgs.monthly,
            annualPackage: pkgs.annual,
            analyticsSource: "profile_upgrade"
        )
    }

    // MARK: - Pro user → Customer Center

    @ViewBuilder
    private var proView: some View {
        RevenueCatUI.CustomerCenterView()
    }
}
