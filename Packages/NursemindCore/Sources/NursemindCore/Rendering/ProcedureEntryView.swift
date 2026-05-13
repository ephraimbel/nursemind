import SwiftUI

public struct ProcedureEntryView: View {
    private let entry: ProcedureEntry
    private let citationIndex: [String: Int]

    public init(entry: ProcedureEntry) {
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
                indications
                if entry.contraindications != nil { divider; contraindications }
                divider
                equipment
                divider
                preProcedure
                divider
                steps
                divider
                postProcedure
                if let docs = entry.documentation, !docs.isEmpty {
                    divider
                    documentation(docs)
                }
                if let watches = entry.watchFor, !watches.isEmpty {
                    divider
                    watchFor(watches)
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
            EyebrowLabel("PROCEDURE")
            Text(entry.title).displayEntry()
            if let s = entry.subtitle {
                Text(s)
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
            }
        }
    }

    private var indications: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Indications")
            AttributedProseView(prose: entry.indications, citationIndex: citationIndex)
        }
    }

    @ViewBuilder
    private var contraindications: some View {
        if let c = entry.contraindications {
            VStack(alignment: .leading, spacing: 0) {
                SectionHeader("Contraindications")
                AttributedProseView(prose: c, citationIndex: citationIndex)
            }
        }
    }

    private var equipment: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Equipment")
            AttributedBulletList(bullets: entry.equipment, citationIndex: citationIndex)
        }
    }

    private var preProcedure: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Before the procedure")
            AttributedBulletList(bullets: entry.preProcedure, citationIndex: citationIndex)
        }
    }

    private var steps: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            SectionHeader("Steps")
            ForEach(Array(entry.steps.enumerated()), id: \.offset) { _, step in
                HStack(alignment: .top, spacing: NMSpace.base) {
                    Text("\(step.number)")
                        .font(NMFont.monoXL)
                        .foregroundStyle(NMColor.textTertiary)
                        .frame(width: 28, alignment: .leading)
                        .padding(.top, 2)
                    VStack(alignment: .leading, spacing: NMSpace.xs + 2) {
                        if let title = step.title {
                            Text(title)
                                .font(NMFont.title)
                                .foregroundStyle(NMColor.textPrimary)
                        }
                        Text(step.body + superscript(step.citationIDs))
                            .font(NMFont.bodyLG)
                            .foregroundStyle(NMColor.textPrimary)
                            .lineSpacing(4)
                    }
                }
            }
        }
    }

    private var postProcedure: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("After the procedure")
            AttributedBulletList(bullets: entry.postProcedure, citationIndex: citationIndex)
        }
    }

    private func documentation(_ docs: [AttributedBullet]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Documentation")
            AttributedBulletList(bullets: docs, citationIndex: citationIndex)
        }
    }

    private func watchFor(_ watches: [AttributedBullet]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Watch for")
            AttributedBulletList(bullets: watches, citationIndex: citationIndex)
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
            Text("This entry is a curated assembly of content from the sources above. No clinical claim has been originated by NurseMind.")
                .font(NMFont.displayItalicSM)
                .foregroundStyle(NMColor.textSecondary)
                .lineSpacing(4)
            Text("Last source-fidelity review: \(entry.lastSourceFidelityReview)")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
                .padding(.top, NMSpace.sm)
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
