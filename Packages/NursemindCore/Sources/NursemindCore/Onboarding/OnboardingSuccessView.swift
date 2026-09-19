import SwiftUI

/// Final onboarding screen. The mark lands full size, the headline names
/// the nurse, the library count rolls in, and after a short hold the flow
/// commits on its own so the app is already moving when they arrive. The
/// button is there for anyone who would rather not wait.
///
/// No logo on this screen — the success moment is about the user, not
/// brand reinforcement. They've seen the logo throughout onboarding.
struct OnboardingSuccessView: View {
    let onComplete: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var prefs = UserPreferences.shared
    @State private var counts: LibraryFacts.Counts = .none
    @State private var committed = false

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
        .task {
            Haptic.success()
            counts = await LibraryFacts.shared.counts()
            // The figures settle at about a second and a half; one more
            // beat to read them, then the app rises in.
            try? await Task.sleep(for: .seconds(reduceMotion ? 1.8 : 3.0))
            guard !Task.isCancelled else { return }
            commit()
        }
    }

    // MARK: - Hero block

    /// Mark, headline, greeting, unit line and the counts: one editorial
    /// statement that reads top to bottom as the pieces land.
    private var heroBlock: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            // The mark that was born on the splash lands here, full size.
            OnboardingMarkSlot(home: "success", size: 36)

            RevealHeadline(words: RevealHeadline.words("You're all set.", font: NMFont.displayXL, color: NMColor.textPrimary), wordSpacing: 11, delay: 0.25)

            VStack(alignment: .leading, spacing: NMSpace.xs) {
                personalGreeting
                unitConfirmation
            }

            LibraryCountsLine(counts: counts, delay: 0.55)
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
        PrimaryCTAButton(title: "Open NurseMind", action: commit)
            .padding(.bottom, NMSpace.xl)
    }

    private func commit() {
        guard !committed else { return }
        committed = true
        onComplete()
    }
}

#Preview {
    OnboardingSuccessView(onComplete: {})
}
