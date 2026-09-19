import SwiftUI

/// Final onboarding screen. Vertically-centered editorial composition:
/// brand sparkle, declarative "You're all set." headline, and a
/// two-line italic subtitle that personalizes by name (in accent green)
/// and confirms the user's specialty library is ready.
///
/// No logo on this screen — the success moment is about the user, not
/// brand reinforcement. They've seen the logo throughout onboarding.
struct OnboardingSuccessView: View {
    let onComplete: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var prefs = UserPreferences.shared

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            FitOrScrollLayout {
                VStack(alignment: .leading, spacing: 0) {
                    Spacer(minLength: NMSpace.xl)
                    heroBlock
                    Spacer(minLength: NMSpace.xl)
                    action
                }
                .padding(.horizontal, NMSpace.lg)
            }
        }
        .task { Haptic.success() }
    }

    // MARK: - Hero block

    /// Sparkle + headline + 2-line italic subtitle. One cohesive editorial
    /// composition that feels like a single statement, not three orphaned
    /// elements.
    private var heroBlock: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            // The mark that was born on the splash lands here, full size.
            OnboardingMarkSlot(home: "success", size: 36)

            RevealHeadline(words: RevealHeadline.words("You're all set.", font: NMFont.displayXL, color: NMColor.textPrimary), wordSpacing: 11, delay: 0.25)

            VStack(alignment: .leading, spacing: NMSpace.xs) {
                personalGreeting
                unitConfirmation
            }
        }
    }

    /// "Welcome, [Name]." — name italicized in accent green. Falls back to
    /// just "Welcome." if the user skipped the name field.
    @ViewBuilder
    private var personalGreeting: some View {
        let trimmed = prefs.displayName.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty {
            Text("Welcome.")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
        } else {
            (
                Text("Welcome, ")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
                +
                Text(trimmed)
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.accent)
                +
                Text(".")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
            )
        }
    }

    /// "Your [Unit] library is ready." — concrete confirmation that we
    /// registered the user's specialty during personalization.
    private var unitConfirmation: some View {
        Text("Your \(prefs.unit.displayName) library is ready.")
            .font(NMFont.displayItalicMD)
            .foregroundStyle(NMColor.textSecondary)
    }

    // MARK: - Action

    private var action: some View {
        PrimaryCTAButton(title: "Open NurseMind", action: onComplete)
            .padding(.bottom, NMSpace.xl)
    }

}

#Preview {
    OnboardingSuccessView(onComplete: {})
}
