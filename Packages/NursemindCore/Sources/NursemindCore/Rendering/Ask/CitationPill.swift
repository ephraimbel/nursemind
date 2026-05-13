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
        .buttonStyle(.plain)
        .accessibilityLabel("Citation: \(source.shortName)")
        .accessibilityHint("Opens source")
    }
}
