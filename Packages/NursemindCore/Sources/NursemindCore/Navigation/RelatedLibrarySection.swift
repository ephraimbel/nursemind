import SwiftUI

/// Editorial section listing the Library entries relevant to the current
/// calculator. Renders nothing when the CrossReferenceRegistry has no curated
/// links — calculators like BMI or the unit converters get no clutter.
public struct RelatedLibrarySection: View {
    private let calculatorID: String
    @State private var router = AppRouter.shared

    public init(calculatorID: String) {
        self.calculatorID = calculatorID
    }

    public var body: some View {
        let destinations = CrossReferenceRegistry.libraryEntriesFor(calculatorID: calculatorID)
        if destinations.isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: 0) {
                Hairline().padding(.bottom, NMSpace.xl)
                EyebrowLabel("FROM THE LIBRARY", sparkle: true)
                    .padding(.bottom, NMSpace.md)
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
            .padding(.top, NMSpace.lg)
        }
    }

    @ViewBuilder
    private func row(for destination: CrossLinkDestination) -> some View {
        switch destination {
        case .libraryEntry(let id, let displayCategory):
            if let entry = ContentRegistry.shared.entry(byID: id) {
                ToolLinkRow(eyebrow: displayCategory.uppercased(),
                            title: entry.title,
                            subtitle: entry.subtitle ?? "")
            }
        case .calculator(let id):
            if let entry = CalculatorRegistry.entry(byID: id) {
                ToolLinkRow(eyebrow: "CALCULATOR",
                            title: entry.title,
                            subtitle: entry.subtitle)
            }
        }
    }
}
