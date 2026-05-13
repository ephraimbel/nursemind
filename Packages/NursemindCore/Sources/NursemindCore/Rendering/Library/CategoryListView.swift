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

        ScrollViewReader { proxy in
            ZStack(alignment: .trailing) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        header(count: entries.count)
                        Hairline().padding(.vertical, NMSpace.xxl)
                        ForEach(letters, id: \.self) { letter in
                            LetterSection(letter: letter, entries: grouped[letter] ?? [])
                                .id(letter)
                        }
                    }
                    .padding(.horizontal, NMSpace.lg)
                    .padding(.top, NMSpace.xxl)
                    .padding(.bottom, NMSpace.huge)
                }
                if letters.count >= 4 {
                    LetterScrubber(letters: letters) { letter in
                        withAnimation(.easeOut(duration: 0.2)) {
                            proxy.scrollTo(letter, anchor: .top)
                        }
                    }
                }
            }
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

private struct LetterScrubber: View {
    let letters: [String]
    let onSelect: (String) -> Void

    var body: some View {
        VStack(spacing: 2) {
            ForEach(letters, id: \.self) { letter in
                Text(letter)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(NMColor.textTertiary)
                    .frame(width: 20, height: 18)
                    .contentShape(Rectangle())
                    .onTapGesture { onSelect(letter) }
            }
        }
        .padding(.trailing, 6)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("A to Z section scrubber")
    }
}
