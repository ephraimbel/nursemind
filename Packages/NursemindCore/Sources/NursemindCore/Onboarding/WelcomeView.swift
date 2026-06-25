import SwiftUI

/// First impression after the splash. A full-bleed editorial photograph of
/// nurses fills the screen. The wordmark sits quietly at the top; a compact,
/// centered text block — serif hero, italic subtitle, CTA — is anchored at
/// the bottom over a gradient scrim, leaving the middle of the frame to the
/// photograph. Copy fades up on appear. No motion gimmicks. Reduce Motion
/// respected.
struct WelcomeView: View {
    let onContinue: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var visible: [Bool] = Array(repeating: false, count: 4)

    var body: some View {
        ZStack {
            backgroundLayer
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .task { await stagger() }
    }

    // MARK: - Background photograph

    /// Full-bleed photo filling the entire background. Ignores the safe area
    /// so the image bleeds edge-to-edge; the content layer above keeps its
    /// own safe-area insets so the CTA never sits under the home indicator.
    private var backgroundLayer: some View {
        // Plain full-bleed fill rather than a GeometryReader — the latter can
        // briefly report a zero/changing size on first layout, which flickered
        // the photo as the page slid in. scaledToFill + clipped fills the
        // screen and crops overflow without that first-pass jump.
        Color.clear
            .overlay(
                Image("WelcomeBackground", bundle: .module)
                    .resizable()
                    .scaledToFill()
            )
            .clipped()
            .overlay(scrim)
            .ignoresSafeArea()
            .accessibilityHidden(true)
    }

    // MARK: - Scrim

    /// A soft cap at the top so the white wordmark reads against the warm
    /// ceiling, a clear window through the middle for the subject, and a
    /// strong bottom wash that seats the headline / subtitle / CTA.
    private var scrim: some View {
        LinearGradient(
            stops: [
                .init(color: .black.opacity(0.42), location: 0.0),
                .init(color: .black.opacity(0.0),  location: 0.24),
                .init(color: .black.opacity(0.0),  location: 0.46),
                .init(color: .black.opacity(0.45), location: 0.66),
                .init(color: .black.opacity(0.92), location: 1.0)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    // MARK: - Content

    private var content: some View {
        VStack(alignment: .center, spacing: 0) {
            logo
                .padding(.top, NMSpace.sm)
            Spacer(minLength: NMSpace.xl)
            hero
            Spacer().frame(height: NMSpace.md)
            subtitle
            Spacer().frame(height: NMSpace.xl)
            actions
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, NMSpace.lg)
        .padding(.bottom, NMSpace.xl)
    }

    // MARK: - Logo

    private var logo: some View {
        NursemindLogo(size: 30, color: .white)
            .shadow(color: .black.opacity(0.4), radius: 12, y: 2)
            .opacity(visible[0] ? 1 : 0)
            .offset(y: visible[0] ? 0 : 10)
    }

    // MARK: - Hero

    /// Two-line centered serif headline (44pt Instrument Serif), with the
    /// italic green "trust." carrying the accent. Kept compact so it sits in
    /// the lower band of the frame rather than over the subject's face.
    private var hero: some View {
        let serifRegular = Font.custom("InstrumentSerif-Regular", size: 44, relativeTo: .largeTitle)
        let serifItalic  = Font.custom("InstrumentSerif-Italic",  size: 44, relativeTo: .largeTitle)

        return VStack(spacing: -4) {
            Text("A nursing companion")
                .font(serifRegular)
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text("you can ")
                    .font(serifRegular)
                    .foregroundStyle(.white)
                Text("trust")
                    .font(serifItalic)
                    .foregroundStyle(NMColor.accent)
                Text(".")
                    .font(serifRegular)
                    .foregroundStyle(.white)
            }
            .lineLimit(1)
            .minimumScaleFactor(0.7)
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .shadow(color: .black.opacity(0.5), radius: 16, y: 3)
        .opacity(visible[1] ? 1 : 0)
        .offset(y: visible[1] ? 0 : 10)
    }

    // MARK: - Subtitle

    /// Three short editorial statements, centered under the hero. Trust
    /// (cited), audience (curious nurses), and the ask-to-learn promise.
    private var subtitle: some View {
        VStack(spacing: NMSpace.xs) {
            Text("Cited at every claim.")
            Text("Built for curious nurses.")
            Text("Ask, and understand why.")
        }
        .font(NMFont.displayItalicMD)
        .foregroundStyle(.white.opacity(0.92))
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .shadow(color: .black.opacity(0.45), radius: 10, y: 2)
        .opacity(visible[2] ? 1 : 0)
        .offset(y: visible[2] ? 0 : 10)
    }

    // MARK: - Actions

    private var actions: some View {
        PrimaryCTAButton(title: "Get started", action: onContinue)
            .opacity(visible[3] ? 1 : 0)
            .offset(y: visible[3] ? 0 : 10)
    }

    // MARK: - Stagger

    /// Staggered fade-up: each element comes in 110ms after the previous,
    /// each animating over 500ms.
    private func stagger() async {
        guard !reduceMotion else {
            visible = Array(repeating: true, count: visible.count)
            return
        }
        let stepDelay: UInt64 = 110_000_000
        for i in 0..<visible.count {
            withAnimation(.easeOut(duration: 0.5)) {
                visible[i] = true
            }
            try? await Task.sleep(nanoseconds: stepDelay)
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
                .foregroundStyle(NMColor.onAccent)
                .frame(maxWidth: .infinity)
                .padding(.vertical, NMSpace.lg - 2)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isEnabled ? NMColor.accent : NMColor.textQuaternary)
                )
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
