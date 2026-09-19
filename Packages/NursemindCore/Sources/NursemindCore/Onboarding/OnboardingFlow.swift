import SwiftUI

/// Coordinator for the first-launch onboarding flow. Owns the step state
/// machine; each step view receives a callback and the coordinator decides
/// where to go next.
///
/// Phase 1A scope: splash → welcome → safety contract → success.
/// Personalization (Phase 1B) and feature showcase (Phase 2) slot between
/// auth and safety in subsequent passes.
public struct OnboardingFlow: View {
    @State private var step: Step = .splash
    @State private var isForward: Bool = true
    @State private var prefs = UserPreferences.shared
    @State private var markTarget: OnboardingMarkTarget?
    /// How far through the current step's own pages or questions.
    @State private var subprogress: Double = 0
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    public init() {
        #if DEBUG
        // Dev-only jump to a named onboarding step (screenshots, review-fix
        // verification). `SIMCTL_CHILD_NM_ONBOARDING_STEP=reviews simctl launch …`
        if let name = ProcessInfo.processInfo.environment["NM_ONBOARDING_STEP"],
           let forced = Step.allCases.first(where: { $0.eventName == name }) {
            _step = State(initialValue: forced)
        }
        #endif
    }

    public var body: some View {
        ZStack {
            // The ground never moves: the cream paper every step is set on,
            // so steps can lift in and fade out over it instead of sliding
            // whole screens past each other.
            // Below every step, including one on its way out: a departing
            // view whose zIndex ties the ground's is drawn behind it, which
            // hid the splash the instant Welcome began.
            GrainBackground().ignoresSafeArea().zIndex(-1)
            // Each step carries its own transition so the one leaving keeps
            // its exit (a modifier outside the switch would hand the
            // departing step the arriving step's transition instead).
            stepView
                .zIndex(Double(step.rawValue))
        }
        .animation(.easeInOut(duration: reduceMotion ? 0.2 : OnboardingMotion.slow), value: step)
        .onPreferenceChange(OnboardingMarkKey.self) { targets in
            // Both the leaving and the arriving view report during a
            // transition, and a leaving view drifts as it fades. The newest
            // slot for the current home is the arriving one, so the mark
            // flies to where the step will rest instead of chasing the exit.
            if let target = targets.last(where: { $0.home == step.markHome }) ?? targets.last {
                markTarget = target
            }
        }
        .overlay {
            GeometryReader { geo in
                OnboardingMark(target: markTarget, origin: geo.frame(in: .global).origin)
            }
        }
        .onPreferenceChange(OnboardingSubprogressKey.self) { values in
            subprogress = values.last(where: { $0.step == step.eventName })?.fraction ?? 0
        }
        .onChange(of: step) { _, _ in subprogress = 0 }
        .overlay(alignment: .top) {
            // The rule begins once the nurse has chosen to get started: it
            // is absent on the splash and the Welcome photograph.
            OnboardingProgressRule(fraction: Self.ruleFraction(for: step, subprogress: subprogress))
                .opacity(step.progress > 0 ? 1 : 0)
                .animation(.easeInOut(duration: OnboardingMotion.base), value: step.progress > 0)
        }
        #if DEBUG
        .task { await autoplay() }
        #endif
    }

    #if DEBUG
    /// Dev-only walk through every step for reviewing motion:
    /// `SIMCTL_CHILD_NM_ONBOARDING_AUTOPLAY=2.5 simctl launch …` holds each
    /// step for that many seconds and stops on Success without committing.
    private func autoplay() async {
        guard let raw = ProcessInfo.processInfo.environment["NM_ONBOARDING_AUTOPLAY"], let hold = Double(raw), hold > 0 else { return }
        while let next = Step(rawValue: step.rawValue + 1) {
            let seconds: Double
            switch step {
            case .splash: seconds = 1.9
            case .personalization: seconds = hold * Double(PersonalizationFlow.Step.total)
            default: seconds = hold
            }
            try? await Task.sleep(for: .seconds(seconds))
            navigate(to: next)
        }
    }
    #endif

    /// The rule's fill: the step's share of the flow plus the share of the
    /// step its pages or questions have covered.
    nonisolated static func ruleFraction(for step: Step, subprogress: Double) -> Double {
        let span = Double(Step.success.rawValue - Step.welcome.rawValue)
        return min(1, step.progress + max(0, min(1, subprogress)) / span)
    }

    /// The splash holds whole beneath Welcome; every other step lifts in
    /// over the ground and fades away.
    private func transition(for step: Step) -> AnyTransition {
        switch step {
        case .splash: return OnboardingMotion.hold()
        default: return OnboardingMotion.lift(reduceMotion: reduceMotion)
        }
    }

    @ViewBuilder
    private var stepView: some View {
        switch step {
        case .splash:
            SplashView { navigate(to: .welcome) }
                .transition(transition(for: .splash))
        case .welcome:
            WelcomeView(onContinue: { navigate(to: .showcase) })
                .transition(transition(for: .welcome))
        case .showcase:
            ShowcaseFlow(
                onComplete: { navigate(to: .personalization) },
                onSkip: { navigate(to: .personalization) }
            )
            .transition(transition(for: .showcase))
        case .personalization:
            PersonalizationFlow(
                onComplete: { navigate(to: .notificationsConsent) },
                onBack: { navigate(to: .showcase) }
            )
            .transition(transition(for: .personalization))
        case .notificationsConsent:
            NotificationsConsentView { navigate(to: .safetyContract) }
                .transition(transition(for: .notificationsConsent))
        case .safetyContract:
            SafetyContractView { navigate(to: .reviews) }
                .transition(transition(for: .safetyContract))
        case .reviews:
            ReviewsView { navigate(to: .paywall) }
                .transition(transition(for: .reviews))
        case .paywall:
            OnboardingPaywallStep { navigate(to: .success) }
                .transition(transition(for: .paywall))
        case .success:
            OnboardingSuccessView { commit() }
                .transition(transition(for: .success))
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
        MetaAnalyticsService.shared.trackOnboardingComplete()
    }

    enum Step: Int, CaseIterable {
        case splash
        case welcome
        case showcase
        case personalization
        case notificationsConsent
        case safetyContract
        case reviews
        case paywall
        case success

        /// The slot the mark lives in on this step.
        var markHome: String { eventName }

        /// Share of the flow behind the nurse, for the hairline rule: zero
        /// through Welcome, full on Success.
        var progress: Double {
            let span = Double(Step.success.rawValue - Step.welcome.rawValue)
            return max(0, Double(rawValue - Step.welcome.rawValue)) / span
        }

        var eventName: String {
            switch self {
            case .splash:                return "splash"
            case .welcome:               return "welcome"
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
            analyticsSource: "onboarding",
            onboardingMark: true
        )
    }
}
