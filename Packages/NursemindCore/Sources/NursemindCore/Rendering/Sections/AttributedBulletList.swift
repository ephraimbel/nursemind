import SwiftUI

struct AttributedBulletList: View {
    let bullets: [AttributedBullet]
    let citationIndex: [String: Int]

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md + 2) {
            ForEach(Array(bullets.enumerated()), id: \.offset) { _, bullet in
                HStack(alignment: .top, spacing: NMSpace.md) {
                    Text("•")
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.textTertiary)
                        .frame(width: 8, alignment: .leading)
                    Text(formatted(bullet))
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.textPrimary)
                        .lineSpacing(4)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }

    private func formatted(_ bullet: AttributedBullet) -> String {
        let supers = bullet.citationIDs
            .compactMap { citationIndex[$0] }
            .map(superscriptDigits)
            .joined(separator: "·")
        return supers.isEmpty ? bullet.text : "\(bullet.text)\(supers)"
    }
}
