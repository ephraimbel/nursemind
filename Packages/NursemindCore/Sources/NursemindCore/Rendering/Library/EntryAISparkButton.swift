import SwiftUI

/// Toolbar button that opens a small sheet of AI quick-actions for the current
/// library entry. Visually a single sparkle inside a circle with a subtle
/// angular green gradient border — matches the Ask tab's icon and signals
/// "AI" as the only place outside primary CTAs that uses the accent green.
struct EntryAISparkButton: View {
    let entryTitle: String
    let entryCategory: String
    @State private var showSheet = false

    var body: some View {
        Button {
            showSheet = true
        } label: {
            ZStack {
                Circle()
                    .strokeBorder(
                        AngularGradient(
                            gradient: Gradient(colors: [
                                NMColor.accent.opacity(0.7),
                                NMColor.accent.opacity(0.25),
                                NMColor.accent.opacity(0.7),
                                NMColor.accent.opacity(0.35),
                                NMColor.accent.opacity(0.7)
                            ]),
                            center: .center
                        ),
                        lineWidth: 1.5
                    )
                    .frame(width: 30, height: 30)
                Image(systemName: "sparkle")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(NMColor.accent)
            }
        }
        .accessibilityLabel("Ask NurseMind about this entry")
        .sheet(isPresented: $showSheet) {
            EntryAIActionSheet(entryTitle: entryTitle, entryCategory: entryCategory)
        }
    }
}

/// Bottom sheet with the four AI quick-actions a nurse can take from a library
/// entry. Three actions are pre-formed questions that auto-send on tap; the
/// fourth opens Ask with the entry already in context so the nurse can type
/// their own follow-up.
private struct EntryAIActionSheet: View {
    let entryTitle: String
    let entryCategory: String
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
        .padding(.top, NMSpace.xl)        // extra top room so the eyebrow clears the drag indicator
        .padding(.bottom, NMSpace.xl)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(NMColor.bgElevated)
        .presentationDetents([.medium])    // .medium gives reliable height for header + 4 rows + breathing room
        .presentationDragIndicator(.visible)
        .presentationBackground(NMColor.bgElevated)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            EyebrowLabel("ASK NURSEMIND")
            Text(entryTitle)
                .font(NMFont.displayMD)
                .tracking(-0.4)
                .foregroundStyle(NMColor.textPrimary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private var actions: some View {
        VStack(spacing: 0) {
            ActionRow(
                icon: "list.bullet",
                title: "Quick summary",
                subtitle: "3-bullet overview"
            ) {
                router.switchToAskAndPrefill(
                    "Give me a 3-bullet summary of \(entryTitle).",
                    autoSend: true
                )
                dismiss()
            }
            Hairline(color: NMColor.borderSubtle)
            ActionRow(
                icon: "stethoscope",
                title: "Nursing priorities",
                subtitle: "Top assessments and watch-fors"
            ) {
                router.switchToAskAndPrefill(
                    "What are the top nursing priorities for \(entryTitle)? Focus on assessment, monitoring, and red flags.",
                    autoSend: true
                )
                dismiss()
            }
            Hairline(color: NMColor.borderSubtle)
            ActionRow(
                icon: "arrow.left.arrow.right",
                title: "Compare",
                subtitle: "How this compares to similar \(entryCategory.lowercased())s"
            ) {
                router.switchToAskAndPrefill(
                    "How does \(entryTitle) compare to other \(entryCategory.lowercased())s in its class? Highlight key differences a nurse should know.",
                    autoSend: true
                )
                dismiss()
            }
            Hairline(color: NMColor.borderSubtle)
            ActionRow(
                icon: "pencil.line",
                title: "Ask your own",
                subtitle: "Open Ask with this entry in context"
            ) {
                router.switchToAskAndPrefill(
                    "About \(entryTitle): ",
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
                        .lineLimit(1)
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
