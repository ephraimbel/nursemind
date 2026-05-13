import SwiftUI

struct DosingBlockView: View {
    let blocks: [DosingBlock]
    let citationIndex: [String: Int]

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            ForEach(Array(blocks.enumerated()), id: \.offset) { _, block in
                VStack(alignment: .leading, spacing: NMSpace.xs) {
                    Text(block.label)
                        .font(NMFont.title)
                        .foregroundStyle(NMColor.textPrimary)
                    Text(formatted(block))
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.textPrimary)
                        .lineSpacing(4)
                }
            }
        }
    }

    private func formatted(_ block: DosingBlock) -> String {
        let supers = block.citationIDs
            .compactMap { citationIndex[$0] }
            .map(superscriptDigits)
            .joined(separator: "·")
        return supers.isEmpty ? block.body : "\(block.body)\(supers)"
    }
}
