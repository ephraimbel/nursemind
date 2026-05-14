import SwiftUI

/// Three suggested follow-up questions, rendered as hairline-separated rows
/// that mirror the empty-state `SuggestionRow`. Tapping prefills the input bar
/// so the nurse can edit before sending — auto-send was rejected because at
/// the bedside, even a few words of refinement matter.
struct FollowUpRows: View {
    let suggestions: [String]
    let onTap: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.base) {
            EyebrowLabel("RELATED", sparkle: false)
            VStack(spacing: 0) {
                ForEach(Array(suggestions.enumerated()), id: \.offset) { idx, suggestion in
                    FollowUpRow(text: suggestion) { onTap(suggestion) }
                    if idx < suggestions.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }
}

private struct FollowUpRow: View {
    let text: String
    let onTap: () -> Void

    var body: some View {
        Button {
            // Selection click — the user is picking one of three suggested
            // continuations, the same hardware feedback pattern a Picker or
            // segmented control uses. Lighter than `.light()` impact so the
            // three-row list doesn't feel chunky on rapid taps.
            Haptic.selection()
            onTap()
        } label: {
            HStack(alignment: .center, spacing: NMSpace.base) {
                Text(text)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(NMColor.textTertiary)
            }
            .padding(.vertical, NMSpace.base)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}
