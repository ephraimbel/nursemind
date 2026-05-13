import SwiftUI

/// Closing section of every calculator: shows the formula in mono, an
/// editorial explanation, and a citation chip linking the source.
/// Reuses CitationSource so the calculator hub plugs into the curator
/// model with the same attribution discipline as Library entries.
public struct CalculatorFormulaSection: View {
    private let formula: String
    private let notes: String?
    private let citations: [CitationSource]

    public init(
        formula: String,
        notes: String? = nil,
        citations: [CitationSource]
    ) {
        self.formula = formula
        self.notes = notes
        self.citations = citations
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Hairline().padding(.bottom, NMSpace.xl)
            EyebrowLabel("FORMULA", sparkle: false)
                .padding(.bottom, NMSpace.md)
            Text(formula)
                .font(NMFont.mono)
                .foregroundStyle(NMColor.textPrimary)
                .padding(.vertical, NMSpace.sm)
                .frame(maxWidth: .infinity, alignment: .leading)
            if let notes {
                Text(notes)
                    .font(NMFont.body)
                    .foregroundStyle(NMColor.textSecondary)
                    .lineSpacing(3)
                    .padding(.top, NMSpace.md)
            }
            ForEach(citations) { source in
                CitationChip(source: source)
                    .padding(.top, NMSpace.md)
            }
        }
        .padding(.top, NMSpace.lg)
    }
}

/// Compact citation row — italic publisher + license tag.
public struct CitationChip: View {
    let source: CitationSource

    public var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(source.shortName)
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textSecondary)
                .lineSpacing(2)
            HStack(spacing: NMSpace.sm) {
                if let publisher = source.publisher {
                    Text(publisher)
                        .font(NMFont.displayItalicSM)
                        .foregroundStyle(NMColor.textTertiary)
                }
                Text(source.licenseDisplayName)
                    .font(NMFont.labelSM)
                    .tracking(0.8)
                    .textCase(.uppercase)
                    .foregroundStyle(NMColor.textTertiary)
            }
        }
        .padding(.vertical, NMSpace.xs)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
