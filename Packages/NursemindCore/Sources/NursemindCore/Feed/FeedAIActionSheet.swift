import SwiftUI

/// Bottom sheet with four AI quick-actions a nurse can take from a Feed
/// reading view. Mirrors the Library entry pattern (`EntryAIActionSheet`)
/// so the AI surface feels consistent across the app.
///
/// Three actions are pre-formed questions that auto-send on tap. The fourth
/// is the Sonnet-authored contextual question — also auto-send. A fifth
/// "Ask your own" row drops the user into Ask with the headline prefilled
/// and the cursor ready.
struct FeedAIActionSheet: View {
    let item: FeedItem
    @Environment(\.dismiss) private var dismiss
    @State private var router = AppRouter.shared

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            Hairline().padding(.vertical, NMSpace.lg)
            actions
            Spacer(minLength: 0)
        }
        .padding(.horizontal, NMSpace.lg)
        .padding(.top, NMSpace.xl)
        .padding(.bottom, NMSpace.xl)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(NMColor.bgElevated)
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
        .presentationBackground(NMColor.bgElevated)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            EyebrowLabel("ASK NURSEMIND")
            Text(item.headline)
                .font(NMFont.displayMD)
                .tracking(-0.4)
                .foregroundStyle(NMColor.textPrimary)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private var actions: some View {
        VStack(spacing: 0) {
            ActionRow(
                icon: "list.bullet",
                title: "Quick summary",
                subtitle: "3-bullet recap of this update"
            ) {
                router.switchToAskAndPrefill(
                    "Give me a 3-bullet summary of this clinical update:\n\n\(item.headline)\n\n\(item.whyNursesCare)",
                    autoSend: true
                )
                dismiss()
            }
            Hairline(color: NMColor.borderSubtle)
            ActionRow(
                icon: "stethoscope",
                title: "Nursing takeaways",
                subtitle: "What this means for my practice"
            ) {
                router.switchToAskAndPrefill(
                    "What are the practical takeaways for a nurse from this update? Focus on assessment, monitoring, and red flags.\n\n\(item.headline) — \(item.whyNursesCare)",
                    autoSend: true
                )
                dismiss()
            }
            Hairline(color: NMColor.borderSubtle)
            ActionRow(
                icon: "sparkle",
                title: "Suggested question",
                subtitle: item.askFollowupPrompt
            ) {
                router.switchToAskAndPrefill(item.askFollowupPrompt, autoSend: true)
                dismiss()
            }
            Hairline(color: NMColor.borderSubtle)
            ActionRow(
                icon: "pencil.line",
                title: "Ask your own",
                subtitle: "Open Ask with this update in context"
            ) {
                router.switchToAskAndPrefill(
                    "About \"\(item.headline)\": ",
                    autoSend: false
                )
                dismiss()
            }
        }
    }
}

private struct ActionRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(alignment: .center, spacing: NMSpace.base) {
                Image(systemName: icon)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(NMColor.textSecondary)
                    .frame(width: 24, alignment: .center)
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(NMFont.title)
                        .foregroundStyle(NMColor.textPrimary)
                    Text(subtitle)
                        .font(NMFont.displayItalicSM)
                        .foregroundStyle(NMColor.textSecondary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer(minLength: 0)
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(NMColor.textTertiary)
            }
            .padding(.vertical, NMSpace.base + 2)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}
