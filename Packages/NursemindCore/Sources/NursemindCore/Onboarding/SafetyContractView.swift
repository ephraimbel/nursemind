import SwiftUI

/// Required onboarding gate per CLAUDE.md / docs/CONTENT_SOURCING.md.
/// Three checkmark bullets, one acknowledgment checkbox, Continue disabled
/// until checked. Setting `prefs.safetyContractAgreedAt` is deferred to the
/// Success screen so the flow has a deliberate completion moment.
struct SafetyContractView: View {
    let onContinue: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var acknowledged = false
    @State private var visible: [Bool] = Array(repeating: false, count: 5)

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            FitOrScrollLayout {
                VStack(alignment: .leading, spacing: 0) {
                    header
                    Spacer(minLength: NMSpace.xl)
                    bullets
                    Spacer(minLength: NMSpace.xl)
                    actions
                }
                .padding(.horizontal, NMSpace.lg)
            }
        }
        .task { await stagger() }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            HStack(spacing: 6) {
                OnboardingMarkSlot(home: "safety_contract", size: 11)
                EyebrowLabel("BEFORE WE BEGIN", sparkle: false)
            }
            RevealHeadline(words: RevealHeadline.words("Reference only.", font: NMFont.displayXL, color: NMColor.textPrimary), wordSpacing: 11, lineSpacing: -2)
            Text("NurseMind is a curated, cited reference — not a substitute for clinical judgment.")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
                .lineSpacing(3)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top, NMSpace.xxl)
        .opacity(visible[0] ? 1 : 0)
        .offset(y: visible[0] ? 0 : 12)
    }

    private var bullets: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            ContractBullet(
                title: "Every clinical claim is cited",
                detail: "Sources are listed on every entry and AI answer."
            )
            .opacity(visible[1] ? 1 : 0)
            .offset(y: visible[1] ? 0 : 8)

            ContractBullet(
                title: "Patient details are never sent",
                detail: "The AI is architecturally prevented from accepting PHI."
            )
            .opacity(visible[2] ? 1 : 0)
            .offset(y: visible[2] ? 0 : 8)

            ContractBullet(
                title: "Verify before acting",
                detail: "Confirm with your facility's protocols and the prescribing provider."
            )
            .opacity(visible[3] ? 1 : 0)
            .offset(y: visible[3] ? 0 : 8)
        }
    }

    /// Staggered fade-up: header → 3 bullets → actions, 90ms apart.
    /// Reduce Motion: instant.
    private func stagger() async {
        guard !reduceMotion else {
            visible = Array(repeating: true, count: visible.count)
            return
        }
        for i in 0..<visible.count {
            withAnimation(.easeOut(duration: 0.45)) {
                visible[i] = true
            }
            try? await Task.sleep(nanoseconds: 90_000_000)
        }
    }

    private var actions: some View {
        VStack(spacing: NMSpace.md) {
            Button {
                Haptic.selection()
                acknowledged.toggle()
            } label: {
                HStack(spacing: NMSpace.sm) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(
                                acknowledged ? NMColor.textPrimary : NMColor.border,
                                lineWidth: 1.5
                            )
                            .frame(width: 22, height: 22)
                        if acknowledged {
                            Image(systemName: "checkmark")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(NMColor.textPrimary)
                                .transition(.scale(scale: 0.5).combined(with: .opacity))
                        }
                    }
                    // Acknowledging draws a line under the words, the way a
                    // signature closes a form: ink, not accent.
                    Text("I understand")
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.textPrimary)
                        .padding(.bottom, 3)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(NMColor.textPrimary)
                                .frame(height: 1)
                                .scaleEffect(x: acknowledged ? 1 : 0, anchor: .leading)
                        }
                        .animation(reduceMotion ? nil : .easeInOut(duration: OnboardingMotion.base), value: acknowledged)
                    Spacer()
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(PressableButtonStyle())
            .padding(.bottom, NMSpace.sm)
            .animation(.easeOut(duration: 0.18), value: acknowledged)

            PrimaryCTAButton(
                title: "Continue",
                action: onContinue,
                isEnabled: acknowledged
            )
            LegalLinksFooter()
                .padding(.top, NMSpace.xs)
        }
        .padding(.bottom, NMSpace.xl)
        .opacity(visible[4] ? 1 : 0)
        .offset(y: visible[4] ? 0 : 12)
    }
}

private struct ContractBullet: View {
    let title: String
    let detail: String

    var body: some View {
        HStack(alignment: .top, spacing: NMSpace.base) {
            Image(systemName: "checkmark")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(NMColor.textSecondary)
                .frame(width: 22, alignment: .center)
                .padding(.top, 4)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(NMFont.bodyLG)
                    .fontWeight(.semibold)
                    .foregroundStyle(NMColor.textPrimary)
                Text(detail)
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textSecondary)
                    .lineSpacing(3)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#Preview {
    SafetyContractView(onContinue: {})
}
