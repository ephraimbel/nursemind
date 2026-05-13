import SwiftUI

/// Editorial section listing the calculators relevant to the current Library
/// entry. Renders nothing if the registry has no curated links — keeps the
/// entry view clean for entries without natural cross-refs.
public struct RelatedToolsSection: View {
    private let entryID: String
    @State private var router = AppRouter.shared

    public init(entryID: String) {
        self.entryID = entryID
    }

    public var body: some View {
        let destinations = CrossReferenceRegistry.toolsFor(entryID: entryID)
        if destinations.isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: NMSpace.lg) {
                EyebrowLabel("RELATED TOOLS", sparkle: true)
                VStack(spacing: 0) {
                    ForEach(Array(destinations.enumerated()), id: \.offset) { idx, dest in
                        Button {
                            router.open(dest)
                        } label: {
                            row(for: dest)
                        }
                        .buttonStyle(.plain)
                        if idx < destinations.count - 1 {
                            Hairline(color: NMColor.borderSubtle)
                        }
                    }
                }
            }
            .padding(.top, NMSpace.xxl)
        }
    }

    @ViewBuilder
    private func row(for destination: CrossLinkDestination) -> some View {
        switch destination {
        case .calculator(let id):
            if let entry = CalculatorRegistry.entry(byID: id) {
                ToolLinkRow(eyebrow: "CALCULATOR",
                            title: entry.title,
                            subtitle: entry.subtitle)
            }
        case .libraryEntry(let id, let displayCategory):
            if let entry = ContentRegistry.shared.entry(byID: id) {
                ToolLinkRow(eyebrow: displayCategory.uppercased(),
                            title: entry.title,
                            subtitle: entry.subtitle ?? "")
            }
        }
    }
}

/// Compact row used by both Related Tools (in Library) and Related Library
/// Entries (in Tools). One visual contract for both directions.
struct ToolLinkRow: View {
    let eyebrow: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
            VStack(alignment: .leading, spacing: 2) {
                Text(eyebrow)
                    .font(NMFont.labelSM)
                    .tracking(1.0)
                    .foregroundStyle(NMColor.textTertiary)
                Text(title)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textTertiary)
                        .lineLimit(2)
                        .padding(.top, 2)
                }
            }
            Spacer(minLength: 0)
            Image(systemName: "arrow.up.right")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(NMColor.accent)
        }
        .padding(.vertical, NMSpace.base)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
