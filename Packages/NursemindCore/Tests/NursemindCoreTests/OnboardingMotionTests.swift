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

    @Test func meterCountsTheStepsAfterWelcome() {
        typealias Step = OnboardingFlow.Step
        #expect(Step.splash.meterPosition == nil)
        #expect(Step.welcome.meterPosition == nil)
        #expect(Step.showcase.meterPosition == OnboardingPosition(index: 0, count: 7))
        #expect(Step.paywall.meterPosition == OnboardingPosition(index: 5, count: 7))
        #expect(Step.success.meterPosition == OnboardingPosition(index: 6, count: 7))
    }
}

@Suite("Step meter")
struct OnboardingMeterTests {
    @Test func segmentsFillBehindPartlyOnCurrentAndNotAhead() {
        let position = OnboardingPosition(index: 2, count: 7)
        #expect(OnboardingStepMeter.fill(segment: 0, position: position, subprogress: 0) == 1)
        #expect(OnboardingStepMeter.fill(segment: 1, position: position, subprogress: 0.4) == 1)
        #expect(abs(OnboardingStepMeter.fill(segment: 2, position: position, subprogress: 0) - 0.3) < 1e-9)
        #expect(abs(OnboardingStepMeter.fill(segment: 2, position: position, subprogress: 0.5) - 0.65) < 1e-9)
        #expect(OnboardingStepMeter.fill(segment: 2, position: position, subprogress: 1) == 1)
        #expect(OnboardingStepMeter.fill(segment: 2, position: position, subprogress: 4) == 1)
        #expect(OnboardingStepMeter.fill(segment: 5, position: position, subprogress: 0.9) == 0)
    }
}
