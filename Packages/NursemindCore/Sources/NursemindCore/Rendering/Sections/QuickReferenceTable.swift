import SwiftUI

struct QuickReferenceTable: View {
    let rows: [KeyValueRow]

    var body: some View {
        // Grid sizes the key column to its longest label instead of a fixed
        // width, so short keys ("Class", "Onset") don't strand the values
        // mid-screen and long keys don't truncate.
        Grid(alignment: .topLeading, horizontalSpacing: NMSpace.base, verticalSpacing: 0) {
            ForEach(rows, id: \.key) { row in
                GridRow {
                    Text(row.key)
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.textSecondary)
                        .gridColumnAlignment(.leading)
                        .padding(.vertical, NMSpace.md)
                    Text(row.value)
                        .font(NMFont.monoXL)
                        .foregroundStyle(NMColor.textPrimary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, NMSpace.md)
                }
            }
        }
    }
}
