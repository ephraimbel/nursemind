import SwiftUI

public struct CategoryListView: View {
    let category: EntryCategory
    let registry: ContentRegistry

    public init(category: EntryCategory, registry: ContentRegistry) {
        self.category = category
        self.registry = registry
    }

    public var body: some View {
        let entries = registry.entries(in: category)
        let grouped = Dictionary(grouping: entries) { entry in
            String(entry.title.prefix(1)).uppercased()
        }
        let letters = grouped.keys.sorted()

        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                header(count: entries.count)
                Hairline().padding(.vertical, NMSpace.xxl)
                ForEach(letters, id: \.self) { letter in
                    LetterSection(letter: letter, entries: grouped[letter] ?? [])
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.xxl)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }

    private func header(count: Int) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("\(count) \(count == 1 ? "ENTRY" : "ENTRIES")")
            Text(category.displayName).displayXL()
        }
    }
}

private struct LetterSection: View {
    let letter: String
    let entries: [LibraryEntry]

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            Text(letter)
                .font(NMFont.displayItalicLG)
                .foregroundStyle(NMColor.textTertiary)
                .padding(.top, NMSpace.lg)
            VStack(spacing: 0) {
                ForEach(Array(entries.enumerated()), id: \.element.id) { idx, entry in
                    NavigationLink(value: LibraryDestination.entry(entry.id)) {
                        EntryRow(entry: entry)
                    }
                    .buttonStyle(.plain)
                    if idx < entries.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
        .padding(.bottom, NMSpace.lg)
    }
}
