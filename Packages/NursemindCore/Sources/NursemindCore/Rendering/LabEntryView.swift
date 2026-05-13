import SwiftUI

public struct LabEntryView: View {
    private let entry: LabEntry
    private let citationIndex: [String: Int]

    public init(entry: LabEntry) {
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
                referenceRanges
                divider
                interpretationTiers
                divider
                commonCauses
                if let actions = entry.nursingActions, !actions.isEmpty {
                    divider
                    nursingActions(actions)
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

    private var divider: some View {
        Hairline().padding(.vertical, NMSpace.xxl)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel(eyebrowText)
            Text(entry.title).displayEntry()
            if let s = entry.subtitle {
                Text(s)
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
            }
        }
    }

    private var eyebrowText: String {
        // Prefer the NCLEX priority concept as a short tag; fall back to LAB.
        if let concept = entry.nclexTags?.priorityConcept {
            switch concept {
            case .perfusion:               return "LAB · PERFUSION"
            case .gasExchange:             return "LAB · GAS EXCHANGE"
            case .acidBase:                return "LAB · ACID-BASE"
            case .fluidElectrolytes:       return "LAB · ELECTROLYTE"
            case .glucoseRegulation:       return "LAB · GLYCEMIC"
            case .clottingHemostasis:      return "LAB · COAGULATION"
            case .infection:               return "LAB · INFECTION"
            case .cellularRegulation:      return "LAB · HEMATOLOGY"
            default:                       return "LAB"
            }
        }
        return "LAB"
    }

    private var referenceRanges: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Reference range")
            VStack(spacing: 0) {
                ForEach(Array(entry.referenceRanges.enumerated()), id: \.offset) { _, row in
                    HStack(alignment: .top, spacing: NMSpace.base) {
                        Text(row.value)
                            .font(NMFont.monoXL)
                            .foregroundStyle(NMColor.textPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(row.label + superscriptCitations(row.citationIDs))
                            .font(NMFont.bodyLG)
                            .foregroundStyle(NMColor.textSecondary)
                            .frame(width: 140, alignment: .leading)
                    }
                    .padding(.vertical, NMSpace.md)
                }
            }
            Text("Reference intervals vary by laboratory, assay, and population. Always verify against your facility's reported reference range. Not for diagnostic decision-making.")
                .font(NMFont.displayItalicSM)
                .foregroundStyle(NMColor.textTertiary)
                .padding(.top, NMSpace.lg)
                .lineSpacing(2)
        }
    }

    private var interpretationTiers: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            SectionHeader("Interpretation")
            ForEach(Array(entry.interpretationTiers.enumerated()), id: \.offset) { _, tier in
                InterpretationTierCard(tier: tier, citationIndex: citationIndex)
            }
        }
    }

    private var commonCauses: some View {
        VStack(alignment: .leading, spacing: NMSpace.xxl) {
            SectionHeader("Common causes")
            ForEach(Array(entry.commonCauses.enumerated()), id: \.offset) { _, group in
                VStack(alignment: .leading, spacing: NMSpace.md) {
                    Text(group.title)
                        .font(NMFont.displayItalicMD)
                        .foregroundStyle(NMColor.textPrimary)
                    VStack(alignment: .leading, spacing: NMSpace.sm + 2) {
                        ForEach(group.causes, id: \.self) { cause in
                            HStack(alignment: .top, spacing: NMSpace.md) {
                                Text("•")
                                    .font(NMFont.bodyLG)
                                    .foregroundStyle(NMColor.textTertiary)
                                Text(cause + superscriptCitations(group.citationIDs))
                                    .font(NMFont.bodyLG)
                                    .foregroundStyle(NMColor.textPrimary)
                                    .lineSpacing(4)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
            }
        }
    }

    private func nursingActions(_ actions: [AttributedBullet]) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Nursing actions")
            AttributedBulletList(bullets: actions, citationIndex: citationIndex)
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

    private func superscriptCitations(_ ids: [String]) -> String {
        let nums = ids.compactMap { citationIndex[$0] }.map(superscriptDigits).joined(separator: "·")
        return nums
    }
}

private struct InterpretationTierCard: View {
    let tier: InterpretationTier
    let citationIndex: [String: Int]

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            HStack(spacing: NMSpace.sm) {
                Text(tier.label)
                    .font(NMFont.title)
                    .foregroundStyle(severityColor)
            }
            Text(tier.summary)
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textPrimary)
                .lineSpacing(4)
            if !tier.nursingActions.isEmpty {
                VStack(alignment: .leading, spacing: NMSpace.xs + 2) {
                    Text("Nursing actions")
                        .font(NMFont.label)
                        .tracking(1.6)
                        .textCase(.uppercase)
                        .foregroundStyle(NMColor.textTertiary)
                        .padding(.top, NMSpace.sm)
                    ForEach(Array(tier.nursingActions.enumerated()), id: \.offset) { _, action in
                        HStack(alignment: .top, spacing: NMSpace.md) {
                            Text("•")
                                .font(NMFont.bodyLG)
                                .foregroundStyle(NMColor.textTertiary)
                            Text(action)
                                .font(NMFont.bodyLG)
                                .foregroundStyle(NMColor.textPrimary)
                                .lineSpacing(4)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
        }
        .padding(NMSpace.lg)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(NMColor.bgSecondary)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(NMColor.borderSubtle, lineWidth: 1)
                )
        )
    }

    private var severityColor: Color {
        switch tier.severity {
        case .normal:    return NMColor.textPrimary
        case .low:       return NMColor.alertHigh
        case .high:      return NMColor.alertHigh
        case .critical:  return NMColor.alertHigh
        }
    }
}
