import SwiftUI

/// Floating card that appears when the user taps an inline citation chip.
/// Matches OpenEvidence's popover style: "Reference" header, "See All (N)" affordance,
/// numbered citation with title in accent, publisher/author line, type badge.
public struct CitationCardView: View {
    let number: Int
    let source: CitationSource
    let totalCount: Int
    let onSeeAll: () -> Void
    let onOpen: () -> Void

    @Environment(\.dismiss) private var dismiss

    public init(
        number: Int,
        source: CitationSource,
        totalCount: Int,
        onSeeAll: @escaping () -> Void = {},
        onOpen: @escaping () -> Void = {}
    ) {
        self.number = number
        self.source = source
        self.totalCount = totalCount
        self.onSeeAll = onSeeAll
        self.onOpen = onOpen
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            header
            citationBody
            Spacer(minLength: 0)
        }
        .padding(NMSpace.lg)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(NMColor.bgElevated)
        // On iPhone (compact width): renders as a constrained sheet from the
        // bottom — consistent regardless of scroll position. The previous
        // `.presentationCompactAdaptation(.popover)` tried to anchor to the
        // tapped pill, which broke when the pill had scrolled out of stable
        // position. On iPad (regular width): renders as a true popover with
        // arrow tail.
        .presentationDetents([.fraction(0.4), .medium])
        .presentationDragIndicator(.visible)
        .presentationBackground(NMColor.bgElevated)
    }

    private var header: some View {
        HStack {
            Text("Reference")
                .font(NMFont.displayItalicSM)
                .foregroundStyle(NMColor.textSecondary)
            Spacer()
            Button {
                onSeeAll()
                dismiss()
            } label: {
                Text("See All (\(totalCount))")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(NMColor.link)
            }
            .buttonStyle(.plain)
        }
    }

    private var citationBody: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            Button {
                onOpen()
                if let url = URL(string: source.url) {
                    UIApplication.shared.open(url)
                }
                dismiss()
            } label: {
                HStack(alignment: .top, spacing: 4) {
                    Text("\(number).")
                        .font(NMFont.bodyLG)
                        .foregroundStyle(source.pillIconColor)
                    (Text(source.shortName + " ")
                        .font(NMFont.bodyLG)
                        .foregroundColor(NMColor.link)
                     + Text(Image(systemName: "arrow.up.right"))
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(NMColor.link))
                        .multilineTextAlignment(.leading)
                }
            }
            .buttonStyle(.plain)

            if let line = source.referenceFormattedLine {
                HStack(alignment: .top, spacing: 4) {
                    iconDot
                    Text(line)
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textSecondary)
                        .lineSpacing(2)
                }
            }

            HStack(spacing: NMSpace.xs + 2) {
                if let tag = source.typeBadgeLabel {
                    Text(tag)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(source.pillIconColor)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Capsule().fill(source.pillIconColor.opacity(0.12)))
                }
                Text(source.licenseDisplayName)
                    .font(.system(size: 11))
                    .foregroundStyle(NMColor.textTertiary)
                Spacer(minLength: 0)
            }
            .padding(.top, 2)
        }
    }

    private var iconDot: some View {
        ZStack {
            Circle().fill(source.pillIconColor).frame(width: 14, height: 14)
            Image(systemName: source.pillIconSymbol)
                .font(.system(size: 8, weight: .bold))
                .foregroundStyle(.white)
        }
        .padding(.top, 2)
    }
}
