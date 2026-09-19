import SwiftUI
import UIKit
import RevenueCat

public struct PaywallView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var selectedPlan: PaywallPlan = .yearly
    @State private var isWorking = false
    @State private var errorMessage: String?

    private let monthlyPackage: Package?
    private let annualPackage: Package?
    private let onComplete: (() -> Void)?
    private let analyticsSource: String
    /// In onboarding the flow's living mark lands on the AI feature row in
    /// place of its sparkle; the quota wall draws the plain icon.
    private let onboardingMark: Bool

    public init(
        monthlyPackage: Package? = nil,
        annualPackage: Package? = nil,
        onComplete: (() -> Void)? = nil,
        analyticsSource: String = "unknown",
        onboardingMark: Bool = false
    ) {
        self.monthlyPackage = monthlyPackage
        self.annualPackage = annualPackage
        self.onComplete = onComplete
        self.analyticsSource = analyticsSource
        self.onboardingMark = onboardingMark
    }

    private func exit() {
        if let onComplete {
            onComplete()
        } else {
            dismiss()
        }
    }

    public var body: some View {
        ZStack {
            GrainBackground().ignoresSafeArea()
            VStack(spacing: 0) {
                navigationHeader
                GeometryReader { geometry in
                    let compact = geometry.size.height < 460
                    ScrollView {
                        VStack(spacing: 0) {
                            header(compact: compact)
                            featureChecklist(compact: compact)
                                .padding(.top, compact ? NMSpace.lg : NMSpace.xl)
                            Spacer(minLength: compact ? NMSpace.base : NMSpace.xl)
                                .frame(maxHeight: compact ? NMSpace.xl : NMSpace.xxxl)
                            planSection(compact: compact)
                        }
                        .padding(.top, compact ? NMSpace.sm : NMSpace.base)
                        .padding(.bottom, NMSpace.base)
                        .frame(maxWidth: 480)
                        .frame(minHeight: geometry.size.height, alignment: .top)
                        .padding(.horizontal, NMSpace.xl)
                        .frame(maxWidth: .infinity)
                    }
                    .scrollBounceBehavior(.basedOnSize)
                    .scrollIndicators(.hidden)
                }
                purchaseFooter
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            AnalyticsService.shared.capture(
                "paywall_viewed",
                properties: ["source": analyticsSource]
            )
            TikTokAnalyticsService.shared.trackPaywallView()
            MetaAnalyticsService.shared.trackPaywallView()
        }
    }

    private var navigationHeader: some View {
        NursemindLogo(size: 28)
            .frame(maxWidth: .infinity)
            .overlay(alignment: .trailing) {
                Button {
                    Haptic.light()
                    exit()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(NMColor.textSecondary)
                        .frame(width: 44, height: 44)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .disabled(isWorking)
                .accessibilityLabel(onComplete == nil ? "Close paywall" : "Continue with free")
                .accessibilityIdentifier("paywall.close")
            }
            .frame(maxWidth: 480)
            .padding(.horizontal, NMSpace.md)
            .padding(.vertical, NMSpace.xs)
            .frame(maxWidth: .infinity)
    }

    private func header(compact: Bool) -> some View {
        VStack(spacing: NMSpace.sm) {
            Text("Everything, unlocked.")
                .font(compact ? Font.custom("InstrumentSerif-Regular", size: 32, relativeTo: .title) : NMFont.displayLG)
                .tracking(-0.9)
                .foregroundStyle(NMColor.textPrimary)
                .accessibilityAddTraits(.isHeader)
            Text("Your nursing essentials, in one place.")
                .font(compact ? NMFont.displayItalicSM : NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
        }
        .multilineTextAlignment(.center)
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity)
    }

    private func featureChecklist(compact: Bool) -> some View {
        VStack(spacing: compact ? NMSpace.sm : NMSpace.base) {
            ForEach(Array(features.enumerated()), id: \.offset) { _, feature in
                PaywallFeatureRow(feature: feature, compact: compact, markSlot: onboardingMark && feature.icon == "sparkle")
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
                icon: "books.vertical",
                title: "The full reference library",
                body: "Drugs · drips · labs · scenarios"
            ),
            ToolsAvailability.calculatorsEnabled
                ? PaywallFeature(
                    icon: "function",
                    title: "Every nursing calculator",
                    body: "MAP, GFR, sepsis scores, NIHSS, PESI"
                )
                : PaywallFeature(
                    icon: "text.book.closed",
                    title: "Every scenario walkthrough",
                    body: "Case-based clinical judgment, cited"
                ),
            PaywallFeature(
                icon: "bookmark",
                title: "Save, search, resume",
                body: "Synced across every signed-in device"
            )
        ]
    }

    private func planSection(compact: Bool) -> some View {
        VStack(spacing: NMSpace.md) {
            EyebrowLabel("CHOOSE YOUR PLAN", sparkle: false)
            VStack(spacing: NMSpace.sm) {
                ForEach(PaywallPlan.allCases, id: \.self) { plan in
                    PaywallPlanRow(
                        plan: plan,
                        priceText: priceText(for: plan),
                        secondaryLine: secondaryLine(for: plan),
                        savings: plan == .yearly && savingsPercent > 0 ? "Save \(savingsPercent)%" : nil,
                        compact: compact,
                        selected: selectedPlan == plan
                    ) {
                        guard selectedPlan != plan else { return }
                        UISelectionFeedbackGenerator().selectionChanged()
                        withAnimation(reduceMotion ? nil : .easeInOut(duration: 0.18)) {
                            selectedPlan = plan
                            errorMessage = nil
                        }
                    }
                    .disabled(isWorking)
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
            return "Equivalent to \(perMonth)/month"
        case .monthly:
            return "Flexible monthly billing"
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

    private var purchaseFooter: some View {
        VStack(spacing: 0) {
            VStack(spacing: NMSpace.sm) {
                if let errorMessage, !errorMessage.isEmpty {
                    Text(errorMessage)
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.alertHigh)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .accessibilityIdentifier("paywall.error")
                }
                continueButton
                Text(continueSubcopy)
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textSecondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(2)
                    .fixedSize(horizontal: false, vertical: true)
                legalFooter
            }
            .frame(maxWidth: 480)
            .padding(.horizontal, NMSpace.xl)
            .padding(.top, NMSpace.base)
            .padding(.bottom, NMSpace.xs)
            .frame(maxWidth: .infinity)
        }
        .background(NMColor.bgPrimary)
    }

    private var continueButton: some View {
        Button {
            Haptic.medium()
            Task { await beginPurchase() }
        } label: {
            HStack(spacing: NMSpace.sm) {
                if isWorking {
                    ProgressView()
                        .tint(NMColor.onAccent)
                    Text("Please wait…")
                } else {
                    Text(continueCopy)
                }
            }
            .font(NMFont.bodyLG.weight(.semibold))
            .multilineTextAlignment(.center)
            .padding(.horizontal, NMSpace.base)
            .padding(.vertical, NMSpace.base)
            .frame(maxWidth: .infinity, minHeight: 56)
            .foregroundStyle(NMColor.onAccent)
            .background(NMColor.accent, in: RoundedRectangle(cornerRadius: 14))
        }
        .buttonStyle(PaywallPressStyle())
        .disabled(isWorking)
        .accessibilityIdentifier("paywall.continue")
    }

    private var continueCopy: String {
        switch selectedPlan {
        case .yearly: return "Start 3-day free trial"
        case .monthly: return "Continue with monthly"
        }
    }

    private var continueSubcopy: String {
        switch selectedPlan {
        case .yearly:
            return "3 days free, then \(priceText(for: .yearly))/year.\nAuto-renews. Cancel anytime in Settings."
        case .monthly:
            return "\(priceText(for: .monthly))/month. No annual commitment.\nAuto-renews. Cancel anytime in Settings."
        }
    }

    private func beginPurchase() async {
        guard !isWorking else { return }
        errorMessage = nil
        if let package = packageFor(selectedPlan) {
            isWorking = true
            MetaAnalyticsService.shared.trackCheckoutStarted()
            TikTokAnalyticsService.shared.trackCheckoutStarted()
            do {
                let outcome = try await RevenueCatService.shared.purchase(package)
                isWorking = false
                if outcome == .completed {
                    Haptic.success()
                    exit()
                }
            } catch {
                isWorking = false
                errorMessage = friendly(error)
                Haptic.medium()
                AnalyticsService.shared.capture(
                    "purchase_error",
                    properties: [
                        "source": analyticsSource,
                        "plan": selectedPlan.rawValue,
                        "error": String(describing: error)
                    ]
                )
            }
        } else {
            // No live offering — common in dev/preview. Surface a soft message
            // rather than firing into a nil package.
            errorMessage = "Subscriptions are still loading. Please try again in a moment."
            AnalyticsService.shared.capture(
                "purchase_error",
                properties: [
                    "source": analyticsSource,
                    "plan": selectedPlan.rawValue,
                    "error": "no_live_offering"
                ]
            )
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

    private var legalFooter: some View {
        HStack(spacing: NMSpace.base) {
            LegalLink(label: "Restore purchases") {
                Haptic.light()
                Task { await restore() }
            }
            .disabled(isWorking)
            LegalLink(label: "Terms") {
                Haptic.light()
                UIApplication.shared.open(LegalLinks.termsOfUse)
            }
            LegalLink(label: "Privacy") {
                Haptic.light()
                UIApplication.shared.open(LegalLinks.privacyPolicy)
            }
        }
        .frame(maxWidth: .infinity)
    }

    private func restore() async {
        guard !isWorking else { return }
        isWorking = true
        errorMessage = nil
        AnalyticsService.shared.capture(
            "purchase_restore_attempted",
            properties: ["source": analyticsSource]
        )
        do {
            try await RevenueCatService.shared.restorePurchases()
            isWorking = false
            if RevenueCatService.shared.isPro {
                Haptic.success()
                AnalyticsService.shared.capture(
                    "purchase_restored",
                    properties: ["source": analyticsSource]
                )
                exit()
            } else {
                errorMessage = "No previous purchase found on this Apple ID."
                AnalyticsService.shared.capture(
                    "purchase_restore_empty",
                    properties: ["source": analyticsSource]
                )
            }
        } catch {
            isWorking = false
            errorMessage = friendly(error)
            AnalyticsService.shared.capture(
                "purchase_restore_failed",
                properties: [
                    "source": analyticsSource,
                    "error": String(describing: error)
                ]
            )
        }
    }
}

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

private struct PaywallFeature {
    let icon: String
    let title: String
    let body: String
}

private struct PaywallFeatureRow: View {
    let feature: PaywallFeature
    let compact: Bool
    var markSlot: Bool = false

    var body: some View {
        VStack(spacing: NMSpace.xs) {
            HStack(spacing: NMSpace.sm) {
                if markSlot {
                    OnboardingMarkSlot(home: "paywall", size: 16)
                        .frame(width: 20)
                } else {
                    Image(systemName: feature.icon)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(NMColor.textSecondary)
                        .frame(width: 20)
                        .accessibilityHidden(true)
                }
                Text(feature.title)
                    .font(NMFont.body.weight(.semibold))
                    .foregroundStyle(NMColor.textPrimary)
            }
            .frame(minHeight: compact ? 24 : 20)
            if !compact {
                Text(feature.body)
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textSecondary)
            }
        }
        .multilineTextAlignment(.center)
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity)
        .accessibilityElement(children: .combine)
    }
}

private struct PaywallPlanRow: View {
    let plan: PaywallPlan
    let priceText: String
    let secondaryLine: String
    let savings: String?
    let compact: Bool
    let selected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: NMSpace.md) {
                radio
                VStack(alignment: .leading, spacing: NMSpace.xs) {
                    ViewThatFits(in: .horizontal) {
                        HStack(alignment: .firstTextBaseline, spacing: NMSpace.sm) {
                            planTitle
                            Spacer(minLength: NMSpace.sm)
                            priceBlock
                        }
                        VStack(alignment: .leading, spacing: NMSpace.xs) {
                            planTitle
                            priceBlock
                        }
                    }
                    Text(secondaryLine)
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(.horizontal, NMSpace.md)
            .padding(.vertical, compact ? NMSpace.md : NMSpace.base)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                selected ? NMColor.accent.opacity(0.10) : NMColor.bgElevated,
                in: RoundedRectangle(cornerRadius: 14)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 14)
                    .strokeBorder(selected ? NMColor.accent : NMColor.border, lineWidth: selected ? 1.5 : 1)
            }
            .contentShape(RoundedRectangle(cornerRadius: 14))
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(plan.displayName), \(priceText)\(plan.period), \(secondaryLine)\(savings.map { ", \($0)" } ?? "")")
        .accessibilityAddTraits(.isButton)
        .accessibilityAddTraits(selected ? .isSelected : [])
        .accessibilityHint("Select the \(plan.displayName.lowercased()) plan")
        .accessibilityIdentifier("paywall.plan.\(plan.rawValue)")
    }

    private var planTitle: some View {
        HStack(spacing: NMSpace.sm) {
            Text(plan.displayName)
                .font(NMFont.body.weight(.semibold))
                .foregroundStyle(NMColor.textPrimary)
            if let savings {
                Text(savings)
                    .font(NMFont.label)
                    .foregroundStyle(NMColor.textSecondary)
            }
        }
        .fixedSize()
    }

    private var radio: some View {
        ZStack {
            Circle()
                .strokeBorder(selected ? NMColor.accent : NMColor.textTertiary, lineWidth: 1.25)
            if selected {
                Circle().fill(NMColor.accent)
                Image(systemName: "checkmark")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundStyle(NMColor.onAccent)
            }
        }
        .frame(width: 20, height: 20)
    }

    private var priceBlock: some View {
        HStack(alignment: .firstTextBaseline, spacing: 2) {
            Text(priceText)
                .font(NMFont.monoXL)
                .foregroundStyle(NMColor.textPrimary)
            Text(plan.period)
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textSecondary)
        }
        .fixedSize()
    }
}

private struct PaywallPressStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        configuration.label.opacity(configuration.isPressed ? 0.82 : 1)
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
                .padding(.horizontal, NMSpace.xs)
                .frame(minHeight: 44)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview("Paywall · fallback prices") {
    PaywallView()
}
