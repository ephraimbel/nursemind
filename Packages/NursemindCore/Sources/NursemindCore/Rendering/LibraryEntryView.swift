import SwiftUI

/// Polymorphic dispatch — picks the right per-category renderer, plus tracks viewing
/// (recents) and exposes a pin/unpin toolbar action.
public struct LibraryEntryView: View {
    private let entry: LibraryEntry
    @State private var prefs = UserPreferences.shared

    public init(_ entry: LibraryEntry) {
        self.entry = entry
    }

    public var body: some View {
        Group {
            switch entry {
            case .drug(let e):           DrugEntryView(entry: e)
            case .drip(let e):           DrugEntryView(entry: e)
            case .lab(let e):            LabEntryView(entry: e)
            case .procedure(let e):      ProcedureEntryView(entry: e)
            case .diagnosis(let e):      DiagnosisEntryView(entry: e)
            case .scenario(let e):       ReferenceEntryView(entry: e)
            case .communication(let e):  ReferenceEntryView(entry: e)
            case .reference(let e):      ReferenceEntryView(entry: e)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    prefs.togglePin(entry.id)
                } label: {
                    Image(systemName: prefs.isPinned(entry.id) ? "bookmark.fill" : "bookmark")
                        .foregroundStyle(prefs.isPinned(entry.id) ? NMColor.accent : NMColor.textPrimary)
                }
                .accessibilityLabel(prefs.isPinned(entry.id) ? "Remove from saved" : "Save entry")
            }
            ToolbarItem(placement: .topBarTrailing) {
                EntryAISparkButton(
                    entryTitle: entry.title,
                    entryCategory: entry.category.singularName
                )
            }
        }
        .onAppear {
            prefs.recordView(entry.id)
        }
        .logsLibraryView(slug: entry.id)
    }
}
