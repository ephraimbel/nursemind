import SwiftUI

struct CitationsList: View {
    let citations: [CitationSource]

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            ForEach(Array(citations.enumerated()), id: \.element.id) { index, source in
                CitationRow(number: index + 1, source: source)
            }
        }
    }
}

private struct CitationRow: View {
    let number: Int
    let source: CitationSource

    @Environment(\.openURL) private var openURL

    var body: some View {
        Button {
            if let url = URL(string: source.url) {
                openURL(url)
            }
        } label: {
            VStack(alignment: .leading, spacing: NMSpace.xs) {
                HStack(alignment: .firstTextBaseline, spacing: NMSpace.sm) {
                    Text("\(number).")
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textTertiary)
                        .frame(width: 24, alignment: .leading)
                    Text(source.shortName)
                        .font(NMFont.displayItalicSM)
                        .foregroundStyle(NMColor.textPrimary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "arrow.up.right")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(NMColor.textTertiary)
                }
                if let detail = source.detail {
                    Text(detail)
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textSecondary)
                        .padding(.leading, 32)
                }
                HStack(spacing: NMSpace.sm) {
                    Text("•")
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textTertiary)
                    Text(source.licenseDisplayName)
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textTertiary)
                    Text("•")
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textTertiary)
                    Text("retrieved \(source.lastRetrieved)")
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textTertiary)
                }
                .padding(.leading, 32)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Citation \(number): \(source.shortName)")
        .accessibilityHint("Opens source in browser")
    }
}
