import SwiftUI
import UIKit
import RevenueCat

/// One-page editorial paywall, fully self-owned. The brand mark sits at
/// the top with a close button, then a confident hero, an auto-advancing
/// feature carousel that walks the user through what Pro unlocks, the
/// plan picker (yearly preselected with savings chip), the primary CTA,
/// and a small legal footer.
///
/// Real prices come from the live RevenueCat offering when one is loaded;
/// when offerings haven't synced yet (cold launch, no internet, dev),
/// fall back to the dashboard-locked display prices defined in
/// `PaywallPlan` so the layout is never empty.
///
/// Pricing strategy: $14.99/mo and $99.99/yr (44% savings vs. monthly,
/// 3-day free trial on yearly). Yearly is preselected because it converts
/// better and is the better deal for the user.
public struct PaywallView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedPlan: PaywallPlan = .yearly
    @State private var isWorking: Bool = false
    @State private var errorMessage: String?

    private let monthlyPackage: Package?
    private let annualPackage: Package?

    public init(
        monthlyPackage: Package? = nil,
        annualPackage: Package? = nil
    ) {
        self.monthlyPackage = monthlyPackage
        self.annualPackage = annualPackage
    }

    public var body: some View {
        ZStack(alignment: .topTrailing) {
            GrainBackground()
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer().frame(height: NMSpace.lg)
                brandMark
                header
                    .padding(.top, NMSpace.md)
                Spacer(minLength: NMSpace.lg)
                featureChecklist
                Spacer(minLength: NMSpace.lg)
                planSection
                continueButton
                    .padding(.top, NMSpace.md)
                if let sub = continueSubcopy {
                    Text(sub)
                        .font(NMFont.bodySM)
                        .italic()
                        .foregroundStyle(NMColor.textTertiary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.top, NMSpace.xs)
                }
                if let errorMessage, !errorMessage.isEmpty {
                    Text(errorMessage)
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.alertHigh)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.top, NMSpace.xs)
                }
                legalFooter
                    .padding(.top, NMSpace.sm)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, NMSpace.lg)

            FloatingIconButton(
                systemName: "xmark",
                accessibilityLabel: "Close"
            ) {
                Haptic.light()
                dismiss()
            }
            .padding(.trailing, NMSpace.lg)
            .padding(.top, NMSpace.sm)
        }
        // Hide nav bar + tab bar so the paywall always presents full-screen
        // regardless of whether it's surfaced as a fullScreenCover (Ask flow)
        // or pushed via NavigationLink (Profile → Subscription). Without
        // this, the Profile-tab presentation eats the top with a back button
        // and the bottom with the tab bar, clipping the wordmark and footer.
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar)
    }

    // MARK: - Brand mark

    private var brandMark: some View {
        NursemindLogo(size: 32)
    }

    // MARK: - Header

    private var header: some View {
        VStack(spacing: NMSpace.sm) {
            EyebrowLabel("NURSEMIND PRO")
            Text("Everything, unlocked.")
                .font(NMFont.displayMD)
                .foregroundStyle(NMColor.textPrimary)
                .multilineTextAlignment(.center)
                .tracking(-0.6)
            Text("Cited at every claim. Calm at every shift.")
                .font(NMFont.displayItalicSM)
                .foregroundStyle(NMColor.textSecondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - Feature checklist

    /// Compact 4-row checklist. Replaces the carousel so the whole paywall
    /// fits on a single screen — quicker for the user to scan, no
    /// auto-advance delay before they can decide. Each row: accent badge
    /// with icon → bold title → italic supporting line.
    private var featureChecklist: some View {
        VStack(spacing: NMSpace.lg) {
            ForEach(Array(features.enumerated()), id: \.offset) { _, feature in
                PaywallFeatureRow(feature: feature)
            }
        }
        .frame(maxWidth: .infinity)
    }

    private var features: [PaywallFeature] {
        [
            PaywallFeature(
                icon: "sparkle",
                title: "50 AI questions a day",
                body: "Cited, scoped to nursing"
            ),
            PaywallFeature(
                icon: "books.vertical.fill",
                title: "The full reference library",
                body: "Drugs · drips · labs · scenarios"
            ),
            PaywallFeature(
                icon: "function",
                title: "Every nursing calculator",
                body: "MAP, GFR, sepsis scores, NIHSS, PESI"
            ),
            PaywallFeature(
                icon: "bookmark.fill",
                title: "Save, search, resume",
                body: "Synced across every signed-in device"
            )
        ]
    }

    // MARK: - Plans

    private var planSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("CHOOSE YOUR PLAN", sparkle: false)
            VStack(spacing: NMSpace.md) {
                ForEach(PaywallPlan.allCases, id: \.self) { plan in
                    PaywallPlanRow(
                        plan: plan,
                        priceText: priceText(for: plan),
                        unitText: plan.period,
                        secondaryLine: secondaryLine(for: plan),
                        savings: "Save \(savingsPercent)%",
                        showSavings: plan == .yearly,
                        selected: selectedPlan == plan
                    ) {
                        guard selectedPlan != plan else { return }
                        UISelectionFeedbackGenerator().selectionChanged()
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                            selectedPlan = plan
                        }
                    }
                }
            }
        }
    }

    private func packageFor(_ plan: PaywallPlan) -> Package? {
        switch plan {
        case .yearly:  return annualPackage
        case .monthly: return monthlyPackage
        }
    }

    private func priceText(for plan: PaywallPlan) -> String {
        packageFor(plan)?.storeProduct.localizedPriceString ?? plan.fallbackPrice
    }

    private func secondaryLine(for plan: PaywallPlan) -> String {
        switch plan {
        case .yearly:
            let perMonth = perMonthYearlyText
            return "3-day free trial · then \(perMonth)/mo"
        case .monthly:
            return "Billed monthly · cancel anytime"
        }
    }

    /// Per-month price for the yearly plan, derived from the live RC
    /// package's annual price ÷ 12; falls back to "$8.33" matching the
    /// $99.99 fallback annual price.
    private var perMonthYearlyText: String {
        if let annual = annualPackage {
            let perMonthDecimal = (annual.storeProduct.price as NSDecimalNumber)
                .dividing(by: NSDecimalNumber(value: 12))
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = annual.storeProduct.priceFormatter?.locale ?? .current
            if let formatted = formatter.string(from: perMonthDecimal) {
                return formatted
            }
        }
        return "$8.33"
    }

    /// Savings percentage vs. paying monthly × 12. Derived from live
    /// pricing when both packages are available; falls back to 44%
    /// (matching the fallback display prices: $14.99 × 12 vs $99.99).
    private var savingsPercent: Int {
        if let monthly = monthlyPackage?.storeProduct.price as Decimal?,
           let annual = annualPackage?.storeProduct.price as Decimal? {
            let monthlyAnnualized = monthly * 12
            guard monthlyAnnualized > 0 else { return 44 }
            let savings = (monthlyAnnualized - annual) / monthlyAnnualized * 100
            return max(0, Int((savings as NSDecimalNumber).doubleValue.rounded()))
        }
        return 44
    }

    // MARK: - CTA

    private var continueButton: some View {
        Button {
            Haptic.medium()
            Task { await beginPurchase() }
        } label: {
            HStack(spacing: NMSpace.sm) {
                if isWorking {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(.white)
                } else {
                    Text(continueCopy)
                        .font(NMFont.bodyLG.weight(.semibold))
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(NMColor.accent)
            )
            .foregroundStyle(.white)
        }
        .buttonStyle(.plain)
        .disabled(isWorking)
    }

    private var continueCopy: String {
        switch selectedPlan {
        case .yearly:  return "Start 3-day free trial"
        case .monthly: return "Start monthly — \(priceText(for: .monthly))"
        }
    }

    /// One-line subcopy under the CTA so the user knows what happens after
    /// the free trial. Only shown when yearly is selected.
    private var continueSubcopy: String? {
        switch selectedPlan {
        case .yearly:  return "Then \(priceText(for: .yearly))/yr after 3 days. Cancel anytime."
        case .monthly: return nil
        }
    }

    private func beginPurchase() async {
        guard !isWorking else { return }
        errorMessage = nil
        if let package = packageFor(selectedPlan) {
            isWorking = true
            do {
                let outcome = try await RevenueCatService.shared.purchase(package)
                isWorking = false
                if outcome == .completed {
                    Haptic.success()
                    dismiss()
                }
            } catch {
                isWorking = false
                errorMessage = friendly(error)
                Haptic.medium()
            }
        } else {
            // No live offering — common in dev/preview. Surface a soft message
            // rather than firing into a nil package.
            errorMessage = "Subscriptions are still loading. Please try again in a moment."
        }
    }

    private func friendly(_ error: Error) -> String {
        let ns = error as NSError
        if let rcError = error as? RevenueCat.ErrorCode {
            switch rcError {
            case .purchaseCancelledError:
                return "" // Silent — handled by user-cancel path elsewhere if needed.
            case .networkError:
                return "Network error. Check your connection and try again."
            case .storeProblemError:
                return "The App Store is having trouble. Try again in a moment."
            default:
                return ns.localizedDescription
            }
        }
        return ns.localizedDescription
    }

    // MARK: - Legal footer

    private var legalFooter: some View {
        VStack(spacing: NMSpace.xs) {
            Text("Subscriptions auto-renew. Cancel anytime in iOS Settings.")
                .font(NMFont.bodySM)
                .italic()
                .foregroundStyle(NMColor.textTertiary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
            HStack(spacing: NMSpace.lg) {
                LegalLink(label: "Restore") {
                    Haptic.light()
                    Task { await restore() }
                }
                LegalLink(label: "Terms") {
                    Haptic.light()
                    UIApplication.shared.open(LegalLinks.termsOfUse)
                }
                LegalLink(label: "Privacy") {
                    Haptic.light()
                    UIApplication.shared.open(LegalLinks.privacyPolicy)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }

    private func restore() async {
        guard !isWorking else { return }
        isWorking = true
        errorMessage = nil
        do {
            try await RevenueCatService.shared.restorePurchases()
            isWorking = false
            if RevenueCatService.shared.isPro {
                Haptic.success()
                dismiss()
            } else {
                errorMessage = "No previous purchase found on this Apple ID."
            }
        } catch {
            isWorking = false
            errorMessage = friendly(error)
        }
    }
}

// MARK: - Plan model

public enum PaywallPlan: String, CaseIterable, Hashable {
    /// Yearly is first so it shows as the recommended default in the list —
    /// also matches `selectedPlan = .yearly` initial state.
    case yearly
    case monthly

    public var displayName: String {
        switch self {
        case .yearly:  return "Yearly"
        case .monthly: return "Monthly"
        }
    }

    /// Display price used when no live RC package is available (cold-launch,
    /// preview, dev without API key). Real pricing always comes from
    /// `Package.storeProduct.localizedPriceString` when live.
    public var fallbackPrice: String {
        switch self {
        case .yearly:  return "$99.99"
        case .monthly: return "$14.99"
        }
    }

    public var period: String {
        switch self {
        case .yearly:  return "/yr"
        case .monthly: return "/mo"
        }
    }
}

// MARK: - Subviews

private struct PaywallFeature {
    let icon: String
    let title: String
    let body: String
}

private struct PaywallFeatureRow: View {
    let feature: PaywallFeature

    var body: some View {
        HStack(spacing: NMSpace.base + 2) {
            ZStack {
                Circle()
                    .fill(NMColor.linkBg)
                    .frame(width: 40, height: 40)
                Image(systemName: feature.icon)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(NMColor.accent)
            }
            VStack(alignment: .leading, spacing: 1) {
                Text(feature.title)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                Text(feature.body)
                    .font(NMFont.body)
                    .italic()
                    .foregroundStyle(NMColor.textTertiary)
            }
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct PaywallPlanRow: View {
    let plan: PaywallPlan
    let priceText: String
    let unitText: String
    let secondaryLine: String
    let savings: String
    let showSavings: Bool
    let selected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(alignment: .center, spacing: NMSpace.base) {
                radio
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: NMSpace.sm) {
                        Text(plan.displayName)
                            .font(NMFont.displaySM)
                            .foregroundStyle(NMColor.textPrimary)
                        if showSavings {
                            savingsChip(savings)
                        }
                    }
                    Text(secondaryLine)
                        .font(NMFont.body)
                        .italic()
                        .foregroundStyle(NMColor.textTertiary)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .minimumScaleFactor(0.85)
                }
                Spacer(minLength: 0)
                priceBlock
            }
            .padding(.vertical, NMSpace.lg)
            .padding(.horizontal, NMSpace.base + 2)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(selected ? NMColor.linkBg : NMColor.bgElevated)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .strokeBorder(
                        selected ? NMColor.accent : NMColor.borderSubtle,
                        lineWidth: selected ? 1.5 : 1
                    )
            )
        }
        .buttonStyle(.plain)
    }

    private var radio: some View {
        ZStack {
            Circle()
                .strokeBorder(
                    selected ? NMColor.accent : NMColor.borderSubtle,
                    lineWidth: 1.5
                )
                .frame(width: 24, height: 24)
            if selected {
                Circle()
                    .fill(NMColor.accent)
                    .frame(width: 13, height: 13)
                    .transition(.scale.combined(with: .opacity))
            }
        }
    }

    private func savingsChip(_ text: String) -> some View {
        Text(text)
            .font(NMFont.labelSM)
            .tracking(0.8)
            .textCase(.uppercase)
            .foregroundStyle(NMColor.accent)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(NMColor.linkBg)
            )
    }

    private var priceBlock: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Text(priceText)
                .font(NMFont.monoXL)
                .foregroundStyle(NMColor.textPrimary)
            Text(unitText)
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
        }
    }
}

private struct LegalLink: View {
    let label: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textSecondary)
        }
        .buttonStyle(.plain)
    }
}

#Preview("Paywall · fallback prices") {
    PaywallView()
}
