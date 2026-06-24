import SwiftUI

/// Coordinator for the first-launch onboarding flow. Owns the step state
/// machine; each step view receives a callback and the coordinator decides
/// where to go next.
///
/// Phase 1A scope: splash → welcome → auth → safety contract → success.
/// Personalization (Phase 1B) and feature showcase (Phase 2) slot between
/// auth and safety in subsequent passes.
public struct OnboardingFlow: View {
    @State private var step: Step = .splash
    @State private var isForward: Bool = true
    @State private var prefs = UserPreferences.shared

    public init() {}

    public var body: some View {
        ZStack {
            stepView
                .transition(directionalTransition)
        }
        .animation(.easeInOut(duration: 0.42), value: step)
    }

    /// Asymmetric transition derived from current direction. Going forward,
    /// the new step slides in from the trailing edge while the old slides
    /// out to leading. Going back, it's mirrored.
    private var directionalTransition: AnyTransition {
        if isForward {
            return .asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .move(edge: .leading).combined(with: .opacity)
            )
        } else {
            return .asymmetric(
                insertion: .move(edge: .leading).combined(with: .opacity),
                removal: .move(edge: .trailing).combined(with: .opacity)
            )
        }
    }

    @ViewBuilder
    private var stepView: some View {
        switch step {
        case .splash:
            SplashView { navigate(to: .welcome) }
        case .welcome:
            WelcomeView(onContinue: { navigate(to: .auth) })
        case .auth:
            AuthView { navigate(to: .showcase) }
        case .showcase:
            ShowcaseFlow(
                onComplete: { navigate(to: .personalization) },
                onSkip: { navigate(to: .personalization) }
            )
        case .personalization:
            PersonalizationFlow(
                onComplete: { navigate(to: .notificationsConsent) },
                onBack: { navigate(to: .auth) }
            )
        case .notificationsConsent:
            NotificationsConsentView { navigate(to: .safetyContract) }
        case .safetyContract:
            SafetyContractView { navigate(to: .reviews) }
        case .reviews:
            ReviewsView { navigate(to: .paywall) }
        case .paywall:
            OnboardingPaywallStep { navigate(to: .success) }
        case .success:
            OnboardingSuccessView { commit() }
        }
    }

    /// Direction is automatically derived by comparing the step's order
    /// to the current step — going to a higher-rawValue step is forward,
    /// lower is back.
    private func navigate(to next: Step) {
        let from = step
        isForward = next.rawValue > step.rawValue
        step = next
        if isForward {
            AnalyticsService.shared.capture(
                "onboarding_step_completed",
                properties: ["step": from.eventName, "next": next.eventName]
            )
        }
    }

    /// Final commit. Setting `safetyContractAgreedAt` flips
    /// `prefs.hasCompletedOnboarding` to true, which RootView observes and
    /// swaps to the main TabView automatically.
    private func commit() {
        prefs.safetyContractAgreedAt = Date()
        AnalyticsService.shared.capture("onboarding_completed")
        TikTokAnalyticsService.shared.trackOnboardingComplete()
    }

    enum Step: Int {
        case splash
        case welcome
        case auth
        case showcase
        case personalization
        case notificationsConsent
        case safetyContract
        case reviews
        case paywall
        case success

        var eventName: String {
            switch self {
            case .splash:                return "splash"
            case .welcome:               return "welcome"
            case .auth:                  return "auth"
            case .showcase:              return "showcase"
            case .personalization:       return "personalization"
            case .notificationsConsent:  return "notifications_consent"
            case .safetyContract:        return "safety_contract"
            case .reviews:               return "reviews"
            case .paywall:               return "paywall"
            case .success:               return "success"
            }
        }
    }
}

/// Onboarding-only wrapper around `PaywallView`. Pulls live RC packages
/// from `RevenueCatService.paywallPackages` (which has been bootstrapping
/// since app launch, so by the time we reach this step the offerings are
/// almost always loaded), and wires the paywall's `onComplete` to advance
/// the flow regardless of whether the user purchased, restored, or
/// tapped "Maybe later". The same `PaywallView` design is reused so the
/// onboarding paywall and the quota-exhaustion paywall are visually
/// identical.
private struct OnboardingPaywallStep: View {
    let onContinue: () -> Void
    @State private var revenueCat = RevenueCatService.shared

    var body: some View {
        let pkgs = revenueCat.paywallPackages
        PaywallView(
            monthlyPackage: pkgs.monthly,
            annualPackage: pkgs.annual,
            onComplete: onContinue,
            analyticsSource: "onboarding"
        )
    }
}
