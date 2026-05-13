import SwiftUI

public struct ReferenceEntryView: View {
    private let entry: ReferenceEntry
    private let citationIndex: [String: Int]

    public init(entry: ReferenceEntry) {
        self.entry = entry
        var index: [String: Int] = [:]
        for (i, c) in entry.citations.enumerated() {
            index[c.id] = i + 1
        }
        self.citationIndex = index
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                header
                Hairline().padding(.vertical, NMSpace.xxl)
                ForEach(Array(entry.sections.enumerated()), id: \.offset) { idx, section in
                    sectionView(section)
                    if idx < entry.sections.count - 1 {
                        Hairline().padding(.vertical, NMSpace.xxl)
                    }
                }
                divider
                citations
                attributionFooter
                RelatedToolsSection(entryID: entry.id)
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.xxl)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
    }

    private var divider: some View { Hairline().padding(.vertical, NMSpace.xxl) }

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel(entry.eyebrow)
            Text(entry.title).displayEntry()
            if let s = entry.subtitle {
                Text(s)
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
            }
        }
    }

    @ViewBuilder
    private func sectionView(_ section: ReferenceSection) -> some View {
        switch section {
        case .prose(let title, let prose):
            VStack(alignment: .leading, spacing: 0) {
                SectionHeader(title)
                AttributedProseView(prose: prose, citationIndex: citationIndex)
            }
        case .bullets(let title, let bullets):
            VStack(alignment: .leading, spacing: 0) {
                SectionHeader(title)
                AttributedBulletList(bullets: bullets, citationIndex: citationIndex)
            }
        case .keyValueTable(let title, let rows):
            VStack(alignment: .leading, spacing: 0) {
                SectionHeader(title)
                QuickReferenceTable(rows: rows)
            }
        case .numberedSteps(let title, let steps, let citationIDs):
            VStack(alignment: .leading, spacing: NMSpace.lg) {
                SectionHeader(title)
                ForEach(Array(steps.enumerated()), id: \.offset) { idx, step in
                    HStack(alignment: .top, spacing: NMSpace.base) {
                        Text("\(idx + 1)")
                            .font(NMFont.monoXL)
                            .foregroundStyle(NMColor.textTertiary)
                            .frame(width: 28, alignment: .leading)
                        Text(step + superscript(citationIDs))
                            .font(NMFont.bodyLG)
                            .foregroundStyle(NMColor.textPrimary)
                            .lineSpacing(4)
                    }
                }
            }
        }
    }

    private var citations: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("CITATIONS", sparkle: false)
            CitationsList(citations: entry.citations)
        }
    }

    private var attributionFooter: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            Hairline().padding(.vertical, NMSpace.xxl)
            Text("Last source-fidelity review: \(entry.lastSourceFidelityReview)")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
            Text("Reference only · Always follow your facility's policies and verify with your provider.")
                .font(NMFont.displayItalicSM)
                .foregroundStyle(NMColor.textTertiary)
                .padding(.top, NMSpace.md)
        }
    }

    private func superscript(_ ids: [String]) -> String {
        ids.compactMap { citationIndex[$0] }.map(superscriptDigits).joined(separator: "·")
    }
}
