import SwiftUI

public struct CalculatorListView: View {
    let category: CalculatorCategory

    public init(category: CalculatorCategory) {
        self.category = category
    }

    public var body: some View {
        let entries = CalculatorRegistry.entries(in: category)
        return ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                EyebrowLabel(category.eyebrowName, sparkle: false)
                    .padding(.top, NMSpace.xxl)
                Text(category.displayName)
                    .displayXL()
                    .padding(.top, NMSpace.md)
                Text("\(entries.count) calculators")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
                    .padding(.top, NMSpace.xs)
                Hairline().padding(.vertical, NMSpace.xxl)
                VStack(spacing: 0) {
                    ForEach(Array(entries.enumerated()), id: \.element.id) { idx, entry in
                        NavigationLink(value: LibraryDestination.calculator(entry.id)) {
                            CalculatorRow(entry: entry)
                        }
                        .buttonStyle(.plain)
                        if idx < entries.count - 1 {
                            Hairline(color: NMColor.borderSubtle)
                        }
                    }
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct CalculatorRow: View {
    let entry: CalculatorEntry

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
            VStack(alignment: .leading, spacing: 2) {
                Text(entry.title)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                Text(entry.subtitle)
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textTertiary)
                    .lineLimit(2)
            }
            Spacer(minLength: 0)
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.vertical, NMSpace.base)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
