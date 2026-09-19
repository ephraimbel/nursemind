import SwiftUI

/// The Ask home's empty state as the app draws it: the fade under the
/// clock, the mark, the greeting and its invitation, the free-question
/// meter, then today's suggested questions and the input bar. Built from
/// the same components, copy and provider as the real screen, without the
/// services behind it, so Welcome shows the product rather than a
/// photograph of an older one. The living mark sits where the screen's
/// own sparkle does.
struct AskHomeMiniature: View {
    private let suggestions = SuggestedQuestionsProvider.questions(role: .rn, unit: .medSurg, count: 4)

    var body: some View {
        ScreenMiniature {
            ZStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 0) {
                    Spacer().frame(height: 128)
                    header
                    Hairline().padding(.vertical, NMSpace.xxl)
                    suggested
                    Spacer(minLength: NMSpace.lg)
                    inputBar
                    footer
                }
                .padding(.horizontal, NMSpace.lg)
                topFade
            }
        }
    }

    private var topFade: some View {
        LinearGradient(
            stops: [
                .init(color: NMColor.bgPrimary, location: 0),
                .init(color: NMColor.bgPrimary.opacity(0.85), location: 0.55),
                .init(color: NMColor.bgPrimary.opacity(0), location: 1),
            ],
            startPoint: .top, endPoint: .bottom
        )
        .frame(height: 112)
    }

    private var header: some View {
        VStack(spacing: NMSpace.md) {
            OnboardingMarkSlot(home: "welcome", size: 27)
            VStack(spacing: NMSpace.sm) {
                Text("Ask away.")
                    .font(NMFont.displayLG)
                    .tracking(-0.8)
                    .foregroundStyle(NMColor.textPrimary)
                Text("Bring me a question.")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
            }
            QuotaMeter(remaining: 3, total: 3, suffix: "free")
                .padding(.top, NMSpace.xs)
        }
        .frame(maxWidth: .infinity)
    }

    private var suggested: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            HStack {
                EyebrowLabel("SUGGESTED", sparkle: false)
                Spacer(minLength: 0)
                HStack(spacing: NMSpace.xs) {
                    Image(systemName: "shuffle")
                        .font(.system(size: 11, weight: .medium))
                    Text("SHUFFLE")
                        .font(NMFont.label)
                        .tracking(1.2)
                }
                .foregroundStyle(NMColor.textTertiary)
            }
            VStack(spacing: 0) {
                ForEach(Array(suggestions.enumerated()), id: \.offset) { idx, question in
                    HStack(alignment: .center, spacing: NMSpace.base) {
                        Text(question)
                            .font(NMFont.displaySM)
                            .foregroundStyle(NMColor.textPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        Image(systemName: "arrow.up.right")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(NMColor.accent)
                    }
                    .padding(.vertical, NMSpace.base)
                    if idx < suggestions.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    private var inputBar: some View {
        VStack(spacing: 0) {
            Hairline()
            HStack(spacing: NMSpace.md) {
                Text("Ask anything about nursing")
                    .font(NMFont.bodyLG)
                    .foregroundStyle(NMColor.textTertiary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "mic")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(NMColor.textSecondary)
                    .frame(width: 32, height: 32)
                Image(systemName: "arrow.up")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(NMColor.onAccent)
                    .frame(width: 32, height: 32)
                    .background(Circle().fill(NMColor.textQuaternary))
            }
            .padding(.leading, NMSpace.base)
            .padding(.trailing, 4)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(NMColor.bgElevated)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .strokeBorder(NMColor.border, lineWidth: 1)
            )
            .padding(.top, NMSpace.md)
        }
    }

    private var footer: some View {
        HStack(spacing: NMSpace.xs) {
            Text("Reference only")
            Text("·")
            Text("Verify with provider")
            Text("·")
            Text("No PHI")
                .font(NMFont.displayItalicSM)
        }
        .font(NMFont.bodySM)
        .foregroundStyle(NMColor.textTertiary)
        .padding(.top, NMSpace.sm)
        .padding(.bottom, NMSpace.lg)
    }
}
