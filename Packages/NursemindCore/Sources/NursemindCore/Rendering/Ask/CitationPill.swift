import SwiftUI

/// Small inline pill that replaces `[c001]` markers within AI responses.
/// Looks like the OpenEvidence inline citation chips: tan rounded background,
/// publisher logo dot, truncated source name. Tappable → opens source URL.
public struct CitationPill: View {
    let source: CitationSource
    let extraCount: Int   // for "+ N" when multiple citations follow the same claim

    @Environment(\.openURL) private var openURL

    public init(source: CitationSource, extraCount: Int = 0) {
        self.source = source
        self.extraCount = extraCount
    }

    public var body: some View {
        Button {
            // Light tap acknowledges the pill — "yes, you tapped a citation."
            // Premium reference apps (Notion, Quill) put a haptic here so the
            // tiny pill feels like a real button, not a passive label.
            Haptic.light()
            if let url = URL(string: source.url) {
                openURL(url)
            }
        } label: {
            HStack(spacing: 4) {
                ZStack {
                    Circle()
                        .fill(source.pillIconColor)
                        .frame(width: 12, height: 12)
                    Image(systemName: source.pillIconSymbol)
                        .font(.system(size: 7, weight: .bold))
                        .foregroundStyle(.white)
                }
                Text(source.pillTitle)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(NMColor.link)
                    .lineLimit(1)
                if extraCount > 0 {
                    Text("+ \(extraCount)")
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundStyle(NMColor.link)
                }
            }
            .padding(.horizontal, 7)
            .padding(.vertical, 3)
            .background(
                Capsule()
                    .fill(NMColor.linkBg)
                    .overlay(
                        Capsule().stroke(NMColor.link, lineWidth: 1.0)
                    )
            )
        }
        // PressableButtonStyle gives a 0.97 scale + 0.88 opacity dip on press.
        // Subtle on a 60-ish-point-wide pill, but combined with the `.light()`
        // haptic on tap it eliminates the "is this thing clickable?" hesitation
        // users get with `.buttonStyle(.plain)`. Same style every other primary
        // pressable surface in the app uses, so the haptic vocabulary is
        // coherent end-to-end.
        .buttonStyle(PressableButtonStyle())
        .accessibilityLabel("Citation: \(source.shortName)")
        .accessibilityHint("Opens source")
    }
}
