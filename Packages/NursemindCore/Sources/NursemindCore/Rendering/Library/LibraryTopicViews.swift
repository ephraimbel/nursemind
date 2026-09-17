import SwiftUI

struct LibraryTopicGroupView: View {
    let group: LibraryTopicGroup
    let registry: ContentRegistry

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: NMSpace.sm) {
                    EyebrowLabel("\(group.topics.count) TOPICS", sparkle: false)
                    Text(group.title).displayLG()
                    Text(group.subtitle)
                        .font(NMFont.displayItalicMD)
                        .foregroundStyle(NMColor.textSecondary)
                }
                .padding(.bottom, NMSpace.xl)
                Hairline()
                ForEach(group.topics) { topic in
                    NavigationLink(value: LibraryDestination.topic(topic.id)) {
                        LibraryBrowseRow(glyph: topic.glyph, title: topic.title, subtitle: topic.subtitle,
                                         detail: "\(topic.entries(in: registry).count) entries")
                    }
                    .buttonStyle(.plain)
                    Hairline(color: NMColor.borderSubtle)
                }
                Text("Selected references from across the library. Browse A–Z or search Library for the full catalog.")
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textTertiary)
                    .padding(.top, NMSpace.xl)
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.md)
            .padding(.bottom, NMSpace.huge)
            .frame(maxWidth: 460)
            .frame(maxWidth: .infinity)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LibraryTopicView: View {
    let topic: LibraryTopic
    let registry: ContentRegistry
    @State private var filter = ""

    var body: some View {
        let entries = topic.entries(in: registry)
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                EyebrowLabel("\(entries.count) SELECTED REFERENCES", sparkle: false)
                Text(topic.title).displayLG()
                Text(topic.subtitle)
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.md)
            FilteredEntryList(entries: entries, filter: $filter, showsEntryCategory: true)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LibraryBrowseRow: View {
    let glyph: String
    let title: String
    let subtitle: String
    let detail: String

    var body: some View {
        HStack(spacing: NMSpace.base) {
            CategoryGlyphCell(symbol: glyph, tint: NMColor.textSecondary)
            VStack(alignment: .leading, spacing: NMSpace.xs) {
                Text(title)
                    .font(NMFont.displayMD)
                    .foregroundStyle(NMColor.textPrimary)
                Text(subtitle)
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textSecondary)
                Text(detail)
                    .font(NMFont.monoSM)
                    .foregroundStyle(NMColor.textTertiary)
            }
            .fixedSize(horizontal: false, vertical: true)
            Spacer(minLength: 0)
            Image(systemName: "chevron.right")
                .font(.system(size: 13))
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.vertical, NMSpace.base)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .accessibilityElement(children: .combine)
    }
}
