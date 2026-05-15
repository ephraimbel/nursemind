import SwiftUI

/// Inline upsell block rendered at the end of a free-tier library entry
/// preview. Cuts the entry off after the "identification" content (header,
/// short indication, one citation pill) and offers Pro to read the rest.
///
/// Visual contract — NurseMind design language, no card chrome:
///   • Top hairline divider
///   • Eyebrow: NURSEMIND PRO ✦
///   • Italic serif headline: "Read the full entry."
///   • One-line body: what's behind the gate
///   • Accent-green CTA: "Read the full entry →" (soft, content-framed)
///   • Subcopy: "3-day free trial · $99.99/yr after · Cancel anytime"
///   • Bottom hairline
///
/// Two-step funnel by design — this block is the *invitation*; the actual
/// transactional "Start 3-day free trial" CTA lives inside the PaywallView
/// that presents on tap. Soft language on the teaser maximizes click-
/// through; the PaywallView closes the deal.
///
/// Fires `library_paywall_shown` on first appear for analytics. On the
/// user's first encounter of the day a subtle haptic plays — once only,
/// gated by `prefs.lastPaywallTeaserHapticDate`.
public struct PaywallTeaserBlock: View {
    private let entryID: String
    private let entryCategory: String

    @State private var isPresentingPaywall: Bool = false
    @State private var appearedAt: Date = Date()
    @State private var revenueCat = RevenueCatService.shared
    @State private var prefs = UserPreferences.shared

    public init(entryID: String, entryCategory: String) {
        self.entryID = entryID
        self.entryCategory = entryCategory
    }

    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Hairline()
                .padding(.bottom, NMSpace.xxl)

            EyebrowLabel("NURSEMIND PRO")

            Text("Read the full entry.")
                .font(NMFont.displayMD)
                .foregroundStyle(NMColor.textPrimary)
                .tracking(-0.4)
                .multilineTextAlignment(.center)
                .padding(.top, NMSpace.md)

            Text("Complete dosing, monitoring, and nursing considerations. Every claim cited.")
                .font(NMFont.displayItalicSM)
                .foregroundStyle(NMColor.textSecondary)
                .multilineTextAlignment(.center)
                .lineSpacing(2)
                .padding(.top, NMSpace.sm)
                .padding(.horizontal, NMSpace.md)

            ctaButton
                .padding(.top, NMSpace.xl)

            Text("3-day free trial · $99.99/yr after · Cancel anytime")
                .font(NMFont.bodySM)
                .italic()
                .foregroundStyle(NMColor.textTertiary)
                .multilineTextAlignment(.center)
                .padding(.top, NMSpace.sm)

            Hairline()
                .padding(.top, NMSpace.xxl)
        }
        .frame(maxWidth: .infinity)
        .onAppear { onAppear() }
        .fullScreenCover(isPresented: $isPresentingPaywall) {
            let pkgs = revenueCat.paywallPackages
            PaywallView(
                monthlyPackage: pkgs.monthly,
                annualPackage: pkgs.annual,
                onComplete: nil,
                analyticsSource: "library_entry:\(entryCategory):\(entryID)"
            )
        }
    }

    private var ctaButton: some View {
        Button {
            Haptic.light()
            AnalyticsService.shared.capture(
                "library_paywall_cta_tapped",
                properties: [
                    "entry_id": entryID,
                    "category": entryCategory
                ]
            )
            isPresentingPaywall = true
        } label: {
            HStack(spacing: NMSpace.sm) {
                Text("Read the full entry")
                    .font(NMFont.bodyLG)
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
                    .font(.system(size: 15, weight: .semibold))
            }
            .foregroundStyle(NMColor.onAccent)
            .padding(.horizontal, NMSpace.xl)
            .padding(.vertical, NMSpace.lg - 2)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(NMColor.accent)
            )
        }
        .buttonStyle(PaywallTeaserPressStyle())
    }

    private func onAppear() {
        appearedAt = Date()
        let isFirstToday = prefs.markPaywallTeaserShownAndCheckFirstToday()
        if isFirstToday {
            Haptic.light()
        }
        AnalyticsService.shared.capture(
            "library_paywall_shown",
            properties: [
                "entry_id": entryID,
                "category": entryCategory,
                "is_first_today": isFirstToday
            ]
        )
    }
}

/// Subtle press-state for the teaser CTA — slightly different from
/// PressableButtonStyle (used by PrimaryCTAButton) so we can tune it
/// for the inline-block context without affecting other CTAs.
private struct PaywallTeaserPressStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}
