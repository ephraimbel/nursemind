import SwiftUI

/// First impression after the splash. Editorial layout: small logo at top,
/// dramatic 4-line hero headline (72pt — much larger than displayXL), then
/// a 3-line italic subtitle that establishes trust + scope + setting.
/// Staggered fade-up on appear gives the page life. Reduce Motion respected.
struct WelcomeView: View {
    let onContinue: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var visible: [Bool] = Array(repeating: false, count: 4)

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                Spacer(minLength: NMSpace.lg)   // flex top — pushes everything down
                logo
                Spacer().frame(height: NMSpace.xxl)
                hero
                Spacer().frame(height: NMSpace.xxl)
                subtitle
                Spacer().frame(height: NMSpace.xl)
                sparkleDivider
                Spacer().frame(height: NMSpace.xl)
                actions
            }
            .padding(.horizontal, NMSpace.lg)
        }
        .task { await stagger() }
    }

    /// Editorial chapter-break divider — hairline · sparkle · hairline.
    /// Marks the transition from "what we are" (the editorial block above)
    /// to "begin" (the CTAs below). Fills the bottom gap with visual rhythm
    /// rather than empty space, in the spirit of magazine layout marks.
    private var sparkleDivider: some View {
        HStack(spacing: NMSpace.md) {
            Rectangle()
                .fill(NMColor.borderSubtle)
                .frame(height: 1)
            Image(systemName: "sparkle")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(NMColor.accent)
            Rectangle()
                .fill(NMColor.borderSubtle)
                .frame(height: 1)
        }
        .opacity(visible[2] ? 1 : 0)
    }

    // MARK: - Logo

    private var logo: some View {
        NursemindLogo(size: 48)
            .opacity(visible[0] ? 1 : 0)
            .offset(y: visible[0] ? 0 : 12)
    }

    // MARK: - Hero

    /// Big editorial display, 76pt Instrument Serif. Four lines with italic
    /// green "trust." dropped to its own line for dramatic emphasis — magazine
    /// pull-quote treatment. Per-line VStack gives explicit control over
    /// line breaks (avoids `\n` truncation issues with concatenated Text).
    private var hero: some View {
        // 76pt fills the 430pt Pro Max width beautifully, but on 375pt SE
        // "companion" is the widest word (~304pt at 76pt) and would clip.
        // `minimumScaleFactor(0.82)` lets each line shrink to ~62pt on
        // narrow widths — still editorial in scale, never truncated.
        // `lineLimit(1)` is safe because each Text holds a single word.
        let serifRegular = Font.custom("InstrumentSerif-Regular", size: 76, relativeTo: .largeTitle)
        let serifItalic  = Font.custom("InstrumentSerif-Italic",  size: 76, relativeTo: .largeTitle)

        return VStack(alignment: .leading, spacing: -16) {
            Text("A nursing")
                .font(serifRegular)
                .foregroundStyle(NMColor.textPrimary)
                .lineLimit(1)
                .minimumScaleFactor(0.82)
            Text("companion")
                .font(serifRegular)
                .foregroundStyle(NMColor.textPrimary)
                .lineLimit(1)
                .minimumScaleFactor(0.82)
            Text("you can")
                .font(serifRegular)
                .foregroundStyle(NMColor.textPrimary)
                .lineLimit(1)
                .minimumScaleFactor(0.82)
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text("trust")
                    .font(serifItalic)
                    .foregroundStyle(NMColor.accent)
                    .lineLimit(1)
                    .minimumScaleFactor(0.82)
                Text(".")
                    .font(serifRegular)
                    .foregroundStyle(NMColor.textPrimary)
            }
        }
        .opacity(visible[1] ? 1 : 0)
        .offset(y: visible[1] ? 0 : 12)
    }

    // MARK: - Subtitle

    /// Three short editorial statements stacked. Italic, textSecondary.
    /// Establishes trust (cited), scope (NCLEX), and setting (bedside).
    /// Replaces the capability list with quieter editorial rhythm.
    private var subtitle: some View {
        VStack(alignment: .leading, spacing: NMSpace.xs) {
            Text("Cited at every claim.")
            Text("Aligned to NCLEX-RN.")
            Text("Calm at every shift.")
        }
        .font(NMFont.displayItalicMD)
        .foregroundStyle(NMColor.textSecondary)
        .opacity(visible[2] ? 1 : 0)
        .offset(y: visible[2] ? 0 : 12)
    }

    // MARK: - Actions

    private var actions: some View {
        VStack(spacing: NMSpace.md) {
            PrimaryCTAButton(title: "Get started", action: onContinue)
        }
        .padding(.bottom, NMSpace.xl)
        .opacity(visible[3] ? 1 : 0)
        .offset(y: visible[3] ? 0 : 12)
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
