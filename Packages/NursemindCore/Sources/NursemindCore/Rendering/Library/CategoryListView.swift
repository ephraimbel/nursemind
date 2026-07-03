import SwiftUI

/// One category's full entry list. Layout contract: the header and filter
/// field are fixed; only the list scrolls.
public struct CategoryListView: View {
    let category: EntryCategory
    let registry: ContentRegistry
    @State private var filter: String = ""

    public init(category: EntryCategory, registry: ContentRegistry) {
        self.category = category
        self.registry = registry
    }

    public var body: some View {
        let entries = registry.entries(in: category)
        VStack(alignment: .leading, spacing: 0) {
            header(total: entries.count)
                .padding(.horizontal, NMSpace.lg)
            FilteredEntryList(entries: entries, filter: $filter)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }

    private func header(total: Int) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            EyebrowLabel("\(total) \(total == 1 ? "ENTRY" : "ENTRIES")", sparkle: false)
            Text(category.displayName)
                .font(NMFont.displayLG)
                .tracking(-1.2)
                .foregroundStyle(NMColor.textPrimary)
        }
        .padding(.top, NMSpace.md)
    }
}
