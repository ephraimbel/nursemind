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
            WelcomeView(
                onContinue: { navigate(to: .auth) },
                onSignIn: { navigate(to: .auth) }
            )
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
            SafetyContractView { navigate(to: .success) }
        case .success:
            OnboardingSuccessView { commit() }
        }
    }

    /// Direction is automatically derived by comparing the step's order
    /// to the current step — going to a higher-rawValue step is forward,
    /// lower is back.
    private func navigate(to next: Step) {
        isForward = next.rawValue > step.rawValue
        step = next
    }

    /// Final commit. Setting `safetyContractAgreedAt` flips
    /// `prefs.hasCompletedOnboarding` to true, which RootView observes and
    /// swaps to the main TabView automatically.
    private func commit() {
        prefs.safetyContractAgreedAt = Date()
    }

    enum Step: Int {
        case splash
        case welcome
        case auth
        case showcase
        case personalization
        case notificationsConsent
        case safetyContract
        case success
    }
}
