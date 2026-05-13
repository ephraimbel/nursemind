import SwiftUI

/// Pinned at the top of an AI answer below the calculator handoff (when both
/// apply). Shows up to 3 library entries that grounded the answer, so the nurse
/// can deep-dive into the full curated entry without losing the AI conversation.
///
/// Tap presents the entry as a sheet wrapping `LibraryEntryView` — same surface
/// as if they had navigated through the Library tab, but reachable in one tap
/// from the answer that referenced it.
struct LibraryEntriesHandoffRow: View {
    let entryIDs: [String]
    private let registry: ContentRegistry

    @State private var presentedEntry: LibraryEntry?

    init(entryIDs: [String], registry: ContentRegistry = .shared) {
        self.entryIDs = entryIDs
        self.registry = registry
    }

    var body: some View {
        let entries = resolvedEntries
        if entries.isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                EyebrowLabel("READ MORE", sparkle: false)
                VStack(spacing: 0) {
                    Hairline(color: NMColor.borderSubtle)
                    ForEach(Array(entries.enumerated()), id: \.element.id) { idx, entry in
                        Button {
                            presentedEntry = entry
                        } label: {
                            EntryHandoffRow(entry: entry)
                        }
                        .buttonStyle(.plain)
                        if idx < entries.count - 1 {
                            Hairline(color: NMColor.borderSubtle)
                        }
                    }
                    Hairline(color: NMColor.borderSubtle)
                }
            }
            .sheet(item: $presentedEntry) { entry in
                NavigationStack {
                    LibraryEntryView(entry)
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button("Done") { presentedEntry = nil }
                                    .foregroundStyle(NMColor.accent)
                            }
                        }
                }
            }
        }
    }

    /// Up to 3 unique entries resolved from IDs. Order matches retrieval rank.
    private var resolvedEntries: [LibraryEntry] {
        var seen = Set<String>()
        var out: [LibraryEntry] = []
        for id in entryIDs {
            if seen.contains(id) { continue }
            if let entry = registry.entry(byID: id) {
                seen.insert(id)
                out.append(entry)
                if out.count == 3 { break }
            }
        }
        return out
    }
}

private struct EntryHandoffRow: View {
    let entry: LibraryEntry

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
            Image(systemName: glyph)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(iconTint)
                .frame(width: 18, alignment: .center)
            VStack(alignment: .leading, spacing: 1) {
                Text(entry.title)
                    .font(NMFont.title)
                    .foregroundStyle(NMColor.textPrimary)
                    .lineLimit(1)
                Text(entry.category.singularName)
                    .font(NMFont.displayItalicSM)
                    .foregroundStyle(NMColor.textTertiary)
            }
            Spacer(minLength: 0)
            Image(systemName: "arrow.up.right")
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.vertical, NMSpace.base)
        .contentShape(Rectangle())
    }

    private var glyph: String {
        switch entry.category {
        case .drug, .drip:     return "pills"
        case .lab:             return "drop"
        case .procedure:       return "list.bullet.clipboard"
        case .diagnosis:       return "stethoscope"
        case .scenario:        return "person.2"
        case .communication:   return "bubble.left.and.bubble.right"
        case .reference:       return "book"
        }
    }

    /// Quiet category-aware tint pulled from the source palette. Creates
    /// editorial rhythm in a 3-row list (drug navy, scenario plum, procedure
    /// umber) without competing with primary accents.
    private var iconTint: Color {
        switch entry.category {
        case .drug, .drip:    return NMColor.sourceFDA
        case .lab:            return NMColor.sourceJournal
        case .procedure:      return NMColor.sourceTextbook
        case .diagnosis:      return NMColor.sourceGuideline
        case .scenario:       return NMColor.sourceSociety
        case .communication:  return NMColor.sourceAgency
        case .reference:      return NMColor.textSecondary
        }
    }
}

