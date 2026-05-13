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
    @State private var sparkleScale: CGFloat = 0.4   // starts small for burst entrance
    @State private var sparkleOpacity: Double = 0    // starts invisible for burst entrance

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                Spacer(minLength: 0)
                heroBlock
                Spacer(minLength: 0)
                action
            }
            .padding(.horizontal, NMSpace.lg)
        }
        .task {
            Haptic.success()
            await burstThenPulse()
        }
    }

    // MARK: - Hero block

    /// Sparkle + headline + 2-line italic subtitle. One cohesive editorial
    /// composition that feels like a single statement, not three orphaned
    /// elements.
    private var heroBlock: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            Image(systemName: "sparkle")
                .font(.system(size: 36, weight: .regular))
                .foregroundStyle(NMColor.accent)
                .scaleEffect(sparkleScale)
                .opacity(sparkleOpacity)

            Text("You're all set.")
                .font(NMFont.displayXL)
                .foregroundStyle(NMColor.textPrimary)

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

    // MARK: - Sparkle pulse

    /// Burst entrance + gentle pulse loop.
    ///
    /// Step 1 (burst, ~500ms): sparkle springs from scale 0.4 / opacity 0 to
    /// full size with a gentle overshoot — celebratory entrance synced with
    /// the success haptic.
    ///
    /// Step 2 (pulse, infinite): once the burst settles, transition into the
    /// gentle scale-and-opacity pulse loop indefinitely.
    ///
    /// Reduce Motion: skip the burst, hold at full scale/opacity, no pulse.
    private func burstThenPulse() async {
        guard !reduceMotion else {
            sparkleScale = 1.0
            sparkleOpacity = 1.0
            return
        }

        // Burst entrance — spring with overshoot
        withAnimation(.spring(response: 0.55, dampingFraction: 0.62)) {
            sparkleScale = 1.0
            sparkleOpacity = 1.0
        }
        try? await Task.sleep(for: .milliseconds(700))

        // Settle into the pulse loop
        while !Task.isCancelled {
            withAnimation(.easeInOut(duration: 1.6)) {
                sparkleScale = 1.15
                sparkleOpacity = 1.0
            }
            try? await Task.sleep(for: .seconds(1.6))
            withAnimation(.easeInOut(duration: 1.6)) {
                sparkleScale = 1.0
                sparkleOpacity = 0.6
            }
            try? await Task.sleep(for: .seconds(1.6))
        }
    }
}

#Preview {
    OnboardingSuccessView(onComplete: {})
}
