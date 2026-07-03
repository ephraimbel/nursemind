import SwiftUI

/// Editorial filter tab — uppercase label with a sliding accent underline,
/// the same vocabulary as the Library/Tools section switcher. Replaces the
/// old filled capsules: quieter, more newspaper, and keeps the single-accent
/// rule (green marks the active position, it never floods a shape).
struct FeedFilterTab: View {
    let label: String
    let isActive: Bool
    let namespace: Namespace.ID
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 7) {
                Text(label)
                    .font(NMFont.label)
                    .tracking(1.2)
                    .foregroundStyle(isActive ? NMColor.textPrimary : NMColor.textTertiary)
                ZStack {
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 2)
                    if isActive {
                        Capsule()
                            .fill(NMColor.accent)
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "feedFilterUnderline", in: namespace)
                    }
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}
