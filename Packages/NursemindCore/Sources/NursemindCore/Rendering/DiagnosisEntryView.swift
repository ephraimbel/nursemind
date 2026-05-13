import SwiftUI

public struct DiagnosisEntryView: View {
    private let entry: DiagnosisEntry
    private let citationIndex: [String: Int]

    public init(entry: DiagnosisEntry) {
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
                definition
                if entry.pathophysiology != nil { divider; pathophysiology }
                divider
                presentation
                if let crit = entry.diagnosticCriteria, !crit.isEmpty {
                    divider
                    diagnosticCriteria(crit)
                }
                if let assess = entry.priorityAssessments, !assess.isEmpty {
                    divider
                    priorityAssessments(assess)
                }
                if let interventions = entry.commonInterventions, !interventions.isEmpty {
                    divider
                    commonInterventions(interventions)
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
            EyebrowLabel("DIAGNOSIS")
            Text(entry.title).displayEntry()
            if let s = entry.subtitle {
                Text(s)
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
            }
        }
    }

    private var definition: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Definition")
            AttributedProseView(prose: entry.definition, citationIndex: citationIndex)
        }
    }

    @ViewBuilder
    private var pathophysiology: some View {
        if let p = entry.pathophysiology {
            VStack(alignment: .leading, spacing: 0) {
                SectionHeader("Pathophysiology")
                AttributedProseView(prose: p, citationIndex: citationIndex)
            }
        }
    }

    private var presentation: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Presentation")
            AttributedBulletList(bullets: entry.presentation, citationIndex: citationIndex)
        }
    }

    private func diagnosticCriteria(_ items: [AttributedBullet]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Diagnostic criteria")
            AttributedBulletList(bullets: items, citationIndex: citationIndex)
        }
    }

    private func priorityAssessments(_ items: [AttributedBullet]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Priority assessments")
            AttributedBulletList(bullets: items, citationIndex: citationIndex)
        }
    }

    private func commonInterventions(_ items: [AttributedBullet]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Common interventions")
            AttributedBulletList(bullets: items, citationIndex: citationIndex)
        }
    }

    private func watchFor(_ items: [AttributedBullet]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Watch for")
            AttributedBulletList(bullets: items, citationIndex: citationIndex)
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
}
