import SwiftUI
import Testing
@testable import NursemindCore

@Suite("Onboarding motion")
struct OnboardingMotionTests {
    @Test func headlineWordsHonourAuthoredLineBreaks() {
        let words = RevealHeadline.words("What should\nwe call you?", font: NMFont.displayLG, color: NMColor.textPrimary)
        #expect(words.map { $0.segments.map(\.text).joined() } == ["What", "should", "we", "call", "you?"])
        #expect(words.map(\.breakBefore) == [false, false, true, false, false])
    }

    @Test func plainHeadlineHasNoBreaks() {
        let words = RevealHeadline.words("You're all set.", font: NMFont.displayXL, color: NMColor.textPrimary)
        #expect(words.count == 3)
        #expect(!words.contains { $0.breakBefore })
    }

    @Test func progressRuleStartsAfterWelcomeAndFillsOnSuccess() {
        #expect(OnboardingFlow.Step.splash.progress == 0)
        #expect(OnboardingFlow.Step.welcome.progress == 0)
        #expect(OnboardingFlow.Step.auth.progress > 0)
        #expect(OnboardingFlow.Step.auth.progress < OnboardingFlow.Step.paywall.progress)
        #expect(OnboardingFlow.Step.success.progress == 1)
    }
}
