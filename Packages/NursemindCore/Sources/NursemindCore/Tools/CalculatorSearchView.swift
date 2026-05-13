import SwiftUI

public struct CalculatorSearchView: View {
    @State private var query: String = ""
    @FocusState private var inputFocused: Bool

    public init() {}

    public var body: some View {
        let results = CalculatorRegistry.search(query)
        let groups = Dictionary(grouping: results) { $0.category }
        let groupOrder = CalculatorCategory.allCases
            .sorted { $0.browseOrder < $1.browseOrder }
            .filter { groups[$0] != nil }

        VStack(spacing: 0) {
            searchField
                .padding(.horizontal, NMSpace.lg)
                .padding(.top, NMSpace.base)
                .padding(.bottom, NMSpace.lg)
            Hairline()
            ScrollView {
                if query.isEmpty {
                    emptyState
                } else if results.isEmpty {
                    noResults
                } else {
                    VStack(alignment: .leading, spacing: NMSpace.xxl) {
                        ForEach(groupOrder, id: \.self) { category in
                            if let categoryResults = groups[category] {
                                CalculatorCategoryGroup(category: category, entries: categoryResults)
                            }
                        }
                    }
                    .padding(.horizontal, NMSpace.lg)
                    .padding(.top, NMSpace.xxl)
                    .padding(.bottom, NMSpace.huge)
                }
            }
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { inputFocused = true }
    }

    private var searchField: some View {
        HStack(spacing: NMSpace.sm) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(NMColor.textTertiary)
            TextField("Search calculators, scores, conversions…", text: $query)
                .focused($inputFocused)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textPrimary)
            if !query.isEmpty {
                Button {
                    query = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(NMColor.textTertiary)
                }
            }
        }
        .padding(.vertical, NMSpace.md)
        .padding(.horizontal, NMSpace.base)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(NMColor.bgElevated)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(NMColor.borderSubtle, lineWidth: 1)
                )
        )
    }

    private var emptyState: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            Text("Search the tools.")
                .font(NMFont.displayItalicLG)
                .foregroundStyle(NMColor.textSecondary)
                .padding(.top, NMSpace.huge)
            Text("Try \(Text("MAP").italic()), \(Text("sepsis").italic()), \(Text("QTc").italic()), \(Text("opioid withdrawal").italic()), \(Text("kg").italic()) — or browse the \(CalculatorRegistry.all.count) calculators by category.")
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textTertiary)
                .lineSpacing(4)
        }
        .padding(.horizontal, NMSpace.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var noResults: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            Text("Nothing matches \(Text("\"\(query)\"").italic()).")
                .font(NMFont.displayMD)
                .foregroundStyle(NMColor.textPrimary)
                .padding(.top, NMSpace.huge)
            Text("Try the formula name, the abbreviation, or the condition (e.g. \"sepsis\" finds qSOFA + SOFA + MEWS).")
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textTertiary)
                .lineSpacing(4)
        }
        .padding(.horizontal, NMSpace.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct CalculatorCategoryGroup: View {
    let category: CalculatorCategory
    let entries: [CalculatorEntry]

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("\(category.displayName.uppercased()) · \(entries.count)", sparkle: false)
            VStack(spacing: 0) {
                ForEach(Array(entries.enumerated()), id: \.element.id) { idx, entry in
                    NavigationLink(value: LibraryDestination.calculator(entry.id)) {
                        CalculatorSearchRow(entry: entry)
                    }
                    .buttonStyle(.plain)
                    if idx < entries.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }
}

private struct CalculatorSearchRow: View {
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
