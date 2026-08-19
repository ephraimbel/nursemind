import SwiftUI

/// Editorial section listing the Library entries cross-linked to the current
/// entry, grouped under relation eyebrows (REVERSAL & ANTIDOTE, MONITORING
/// LABS, …). Renders nothing when the EntryLinkRegistry has no edges for the
/// entry — most pages stay clean.
public struct RelatedEntriesSection: View {
    private let entryID: String
    @State private var router = AppRouter.shared

    /// `entryID` is the full LibraryEntry id, e.g. "drug:vancomycin".
    public init(entryID: String) {
        self.entryID = entryID
    }

    public var body: some View {
        let groups = EntryLinkRegistry.shared.groups(for: entryID)
        if groups.isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: NMSpace.xl) {
                ForEach(groups, id: \.label) { group in
                    VStack(alignment: .leading, spacing: NMSpace.lg) {
                        EyebrowLabel(group.label, sparkle: true)
                        VStack(spacing: 0) {
                            ForEach(Array(group.targets.enumerated()), id: \.element) { idx, target in
                                if let entry = ContentRegistry.shared.entry(byID: target.entryID) {
                                    Button {
                                        router.openLibraryEntry(entry.id)
                                    } label: {
                                        ToolLinkRow(
                                            eyebrow: entry.category.singularName.uppercased(),
                                            title: entry.title,
                                            subtitle: target.note ?? entry.subtitle ?? ""
                                        )
                                    }
                                    .buttonStyle(.plain)
                                    if idx < group.targets.count - 1 {
                                        Hairline(color: NMColor.borderSubtle)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.top, NMSpace.xxl)
        }
    }
}
