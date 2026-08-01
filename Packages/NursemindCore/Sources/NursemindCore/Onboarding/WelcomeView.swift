import SwiftUI

/// First impression after the splash. Paper, not photography: the cream ground
/// the rest of the app is built on, a soft bloom of the brand green sitting in
/// it like light rather than like a graphic, and type doing the work.
///
/// The composition deliberately echoes the Ask home screen — mark, serif
/// headline, italic supporting lines — so the first screen a nurse sees is a
/// truthful preview of the app's actual voice rather than a marketing cover.
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

    // MARK: - Background

    /// Full-bleed product shot, 941x1672. Wider than any iPhone aspect, so
    /// `scaledToFill` centre-crops the sides — which put the phone right of
    /// centre with its edge clipped. The offset slides the visible window
    /// right so the phone sits centred and whole.
    ///
    /// The shift is clamped to whatever horizontal overflow that device
    /// actually has. An SE is 0.562 against the image's 0.563 and so has
    /// almost none — scaling up to manufacture room would zoom the phone and
    /// crop it worse, so on that canvas the image simply stays centred.
    private var backgroundLayer: some View {
        GeometryReader { geo in
            let fill = max(geo.size.width / 941, geo.size.height / 1672)
            let overflow = max(0, (941 * fill - geo.size.width) / 2)
            Image("WelcomeBackground", bundle: .module)
                .resizable()
                .interpolation(.high)
                .scaledToFill()
                .offset(x: -min(26, overflow))
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
        }
        .overlay(scrim)
        .ignoresSafeArea()
        .accessibilityHidden(true)
    }

    /// Light cap at the top so the wordmark reads, a clear window through the
    /// middle for the phone in frame, and a deep bottom wash that seats the
    /// headline, subtitle and CTA.
    private var scrim: some View {
        LinearGradient(
            stops: [
                .init(color: .black.opacity(0.30), location: 0.00),
                .init(color: .black.opacity(0.0),  location: 0.14),
                .init(color: .black.opacity(0.0),  location: 0.36),
                .init(color: .black.opacity(0.72), location: 0.62),
                .init(color: .black.opacity(0.96), location: 0.80),
                .init(color: .black.opacity(0.98), location: 1.00)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    // MARK: - Content

    private var content: some View {
        VStack(alignment: .center, spacing: 0) {
            // Three flexible gaps of equal weight — above the mark, between the
            // mark and the headline, and below the subtitle — so the surplus
            // splits evenly instead of pooling into one dead band above the
            // CTA. Only the headline-to-subtitle gap is fixed, because those
            // two belong to each other.
            logo
                .padding(.top, NMSpace.sm)
            Spacer(minLength: NMSpace.xxl)
            hero
            Spacer().frame(height: NMSpace.base)
            subtitle
            Spacer().frame(height: NMSpace.xxl)
            actions
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, NMSpace.lg)
        // The CTA sat 24pt off the bottom, close enough to the home indicator
        // to read as clipped on a 6.9" screen. Every other bottom-anchored
        // surface in the app gives itself more room than that.
        .padding(.bottom, NMSpace.xxxl)
    }

    // MARK: - Logo

    private var logo: some View {
        NursemindLogo(size: 34, color: .white)
            .shadow(color: .black.opacity(0.45), radius: 12, y: 2)
            .opacity(visible[0] ? 1 : 0)
            .offset(y: visible[0] ? 0 : 10)
    }

    // MARK: - Eyebrow

    /// Names what the app is before the headline claims anything about it —
    /// the same eyebrow-then-headline order the paywall and every entry view
    /// use. "Reference" first, deliberately: this is a clinical reference for
    /// nurses, not an exam-prep app.
    private var eyebrow: some View {
        EyebrowLabel("THE NURSING REFERENCE")
            .opacity(visible[1] ? 1 : 0)
            .offset(y: visible[1] ? 0 : 10)
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
        .shadow(color: .black.opacity(0.55), radius: 16, y: 3)
        .opacity(visible[1] ? 1 : 0)
        .offset(y: visible[1] ? 0 : 10)
    }

    // MARK: - Subtitle

    /// One line, not three. Stacked italic statements read as a poem; a single
    /// sentence reads as a product willing to be held to a claim — and it
    /// keeps the eye moving to the CTA rather than pausing three times.
    private var subtitle: some View {
        Text("Cited at every claim. Ask, and understand why.")
        .font(NMFont.displayItalicMD)
        .foregroundStyle(.white.opacity(0.92))
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .shadow(color: .black.opacity(0.5), radius: 10, y: 2)
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
