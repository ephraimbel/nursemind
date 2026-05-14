import SwiftUI

/// Horizontal-scrolling filter chip used at the top of the Feed list.
/// Active state fills with the accent green (the one place outside primary CTAs
/// where we use the accent). Inactive sits on `bgElevated` with a subtle border.
struct FeedFilterChip: View {
    let label: String
    let isActive: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Text(label)
                .font(NMFont.label)
                .tracking(1.0)
                .foregroundStyle(isActive ? NMColor.onAccent : NMColor.textSecondary)
                .padding(.horizontal, NMSpace.md)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(isActive ? NMColor.accent : NMColor.bgElevated)
                )
                .overlay(
                    Capsule()
                        .stroke(isActive ? Color.clear : NMColor.border, lineWidth: 1)
                )
        }
        .buttonStyle(.plain)
        .animation(.easeOut(duration: 0.15), value: isActive)
    }
}
