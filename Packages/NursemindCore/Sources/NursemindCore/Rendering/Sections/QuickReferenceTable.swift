import SwiftUI

struct QuickReferenceTable: View {
    let rows: [KeyValueRow]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(rows, id: \.key) { row in
                HStack(alignment: .top, spacing: NMSpace.base) {
                    Text(row.key)
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.textSecondary)
                        .frame(width: 130, alignment: .leading)
                    Text(row.value)
                        .font(NMFont.monoXL)
                        .foregroundStyle(NMColor.textPrimary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, NMSpace.md)
            }
        }
    }
}
