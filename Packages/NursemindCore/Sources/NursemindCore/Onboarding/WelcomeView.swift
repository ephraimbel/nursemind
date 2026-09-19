import SwiftUI

/// First impression after the splash. Paper, not photography: the cream
/// ground the rest of the app is built on, the wordmark, the Ask home
/// itself shrunk into a frame with the living mark sitting in its header,
/// then the headline, one supporting line, the library's real counts and
/// the way in. The first screen a nurse sees is the product.
struct WelcomeView: View {
    let onContinue: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var visible: [Bool] = Array(repeating: false, count: 4)
    @State private var counts: LibraryFacts.Counts = .none

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                NursemindLogo(size: 24)
                    .frame(maxWidth: .infinity)
                    .padding(.top, NMSpace.sm)
                    .opacity(visible[0] ? 1 : 0)
                    .offset(y: visible[0] ? 0 : 10)

                PhoneFrame { AskHomeMiniature() }
                    .padding(.horizontal, NMSpace.lg)
                    .padding(.top, NMSpace.lg)
                    .opacity(visible[1] ? 1 : 0)
                    .offset(y: visible[1] ? 0 : 10)

                Spacer(minLength: NMSpace.lg)

                hero
                subtitle
                    .padding(.top, NMSpace.md)
                LibraryCountsLine(counts: counts, delay: 0.7)
                    .padding(.top, NMSpace.md)
                    .opacity(visible[2] ? 1 : 0)
                    .offset(y: visible[2] ? 0 : 10)

                Spacer().frame(height: NMSpace.xl)

                PrimaryCTAButton(title: "Get started", action: onContinue)
                    .opacity(visible[3] ? 1 : 0)
                    .offset(y: visible[3] ? 0 : 10)
            }
            .padding(.horizontal, NMSpace.lg)
            // The CTA sat 24pt off the bottom, close enough to the home
            // indicator to read as clipped on a 6.9" screen. Every other
            // bottom-anchored surface in the app gives itself more room.
            .padding(.bottom, NMSpace.xxxl)
        }
        .task { await stagger() }
        .task { counts = await LibraryFacts.shared.counts() }
    }

    // MARK: - Hero

    /// Two-line serif headline with the italic accent "trust." landing last.
    private var hero: some View {
        let serifRegular = Font.custom("InstrumentSerif-Regular", size: 44, relativeTo: .largeTitle)
        let serifItalic  = Font.custom("InstrumentSerif-Italic",  size: 44, relativeTo: .largeTitle)

        return RevealHeadline(
            words: [
                .init("A", font: serifRegular, color: NMColor.textPrimary),
                .init("nursing", font: serifRegular, color: NMColor.textPrimary),
                .init("companion", font: serifRegular, color: NMColor.textPrimary),
                .init("you", font: serifRegular, color: NMColor.textPrimary, breakBefore: true),
                .init("can", font: serifRegular, color: NMColor.textPrimary),
                .init(segments: [
                    .init(text: "trust", font: serifItalic, color: NMColor.accent),
                    .init(text: ".", font: serifRegular, color: NMColor.textPrimary),
                ]),
            ],
            wordSpacing: 11,
            lineSpacing: -4,
            delay: 0.2
        )
        .opacity(visible[2] ? 1 : 0)
    }

    // MARK: - Subtitle

    /// One line, not three: a single sentence reads as a product willing to
    /// be held to a claim, and keeps the eye moving to the counts and CTA.
    private var subtitle: some View {
        Text("Cited at every claim. Ask, and understand why.")
            .font(NMFont.displayItalicMD)
            .foregroundStyle(NMColor.textSecondary)
            .fixedSize(horizontal: false, vertical: true)
            .opacity(visible[2] ? 1 : 0)
            .offset(y: visible[2] ? 0 : 10)
    }

    // MARK: - Stagger

    /// Wordmark → phone → headline block → CTA, 110 ms apart.
    private func stagger() async {
        guard !reduceMotion else {
            visible = Array(repeating: true, count: visible.count)
            return
        }
        for i in 0..<visible.count {
            withAnimation(.easeOut(duration: 0.5)) {
                visible[i] = true
            }
            try? await Task.sleep(nanoseconds: OnboardingMotion.elementStagger)
        }
    }
}

/// Reusable accent-green CTA used across onboarding. Keeps button styling
/// consistent so every primary action on every screen reads identically.
/// Includes light haptic on tap and a subtle press-state scale for tactile
/// feedback.
struct PrimaryCTAButton: View {
    let title: String
    let action: () -> Void
    var isEnabled: Bool = true

    var body: some View {
        Button {
            Haptic.light()
            action()
        } label: {
            Text(title)
                .font(NMFont.bodyLG)
                .fontWeight(.semibold)
                .foregroundStyle(isEnabled ? NMColor.onAccent : NMColor.textTertiary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, NMSpace.lg - 2)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isEnabled ? NMColor.accent : Color.clear)
                )
                // Not yet: the same shape drawn as a hairline, so the button
                // waits quietly instead of sitting there as a grey slab.
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(NMColor.border, lineWidth: 1)
                        .opacity(isEnabled ? 0 : 1)
                )
                .animation(.easeOut(duration: OnboardingMotion.quick), value: isEnabled)
        }
        .buttonStyle(PressableButtonStyle())
        .disabled(!isEnabled)
    }
}

/// Subtle press-state for primary buttons. Slight scale-down + opacity
/// dim on press, easing back on release. Echoes native iOS controls
/// without being flashy.
struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.88 : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}

#Preview {
    WelcomeView(onContinue: {})
}
