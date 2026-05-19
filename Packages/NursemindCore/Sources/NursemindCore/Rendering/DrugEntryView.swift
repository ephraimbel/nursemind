import SwiftUI

public struct DrugEntryView: View {
    private let entry: DrugEntry
    private let entryCategory: String
    private let citationIndex: [String: Int]
    @State private var prefs = UserPreferences.shared

    /// `entryCategory` separates analytics for drugs vs drips — both share
    /// this renderer (LibraryEntry's `.drug` and `.drip` both wrap
    /// `DrugEntry`), but they're two distinct browse surfaces and we want
    /// the conversion funnel split clean.
    public init(entry: DrugEntry, entryCategory: String = "drug") {
        self.entry = entry
        self.entryCategory = entryCategory
        var index: [String: Int] = [:]
        for (i, c) in entry.citations.enumerated() {
            index[c.id] = i + 1
        }
        self.citationIndex = index
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                if prefs.subscriptionTier.isPro {
                    fullContent
                } else {
                    previewContent
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.top, NMSpace.xxl)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
    }

    /// Free-tier preview: header + indications + one citation pill, then
    /// the paywall teaser block. Everything execution-relevant (dosing,
    /// monitoring, warnings, interactions, full citations) is behind Pro.
    @ViewBuilder
    private var previewContent: some View {
        header
        Hairline().padding(.vertical, NMSpace.xxl)
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Indications")
            AttributedProseView(prose: entry.indications, citationIndex: citationIndex)
        }
        if let firstCitation = entry.citations.first {
            CitationsList(citations: [firstCitation])
                .padding(.top, NMSpace.lg)
        }
        PaywallTeaserBlock(entryID: entry.id, entryCategory: entryCategory)
            .padding(.top, NMSpace.xxl)
    }

    @ViewBuilder
    private var fullContent: some View {
        header
        Hairline().padding(.vertical, NMSpace.xxl)
        quickReference
        divider
        indicationsAndMechanism
        divider
        dosing
        divider
        contraindications
        divider
        warnings
        divider
        adverseReactions
        divider
        drugInteractions
        if entry.nursingImplications != nil {
            divider
            nursingImplications
        }
        if entry.patientTeaching != nil {
            divider
            patientTeaching
        }
        divider
        citations
        attributionFooter
        RelatedToolsSection(entryID: entry.id)
    }

    private var divider: some View {
        Hairline().padding(.vertical, NMSpace.xxl)
    }

    // MARK: - Sections

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("DRUG · \(entry.category.uppercased())")
            Text(entry.title)
                .displayEntry()
            if let subtitle = entry.subtitle {
                Text(subtitle)
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
            }
            if entry.isHighAlert {
                HighAlertPill().padding(.top, NMSpace.sm)
            }
        }
    }

    private var quickReference: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Quick reference")
            QuickReferenceTable(rows: entry.quickReference)
        }
    }

    private var indicationsAndMechanism: some View {
        VStack(alignment: .leading, spacing: NMSpace.xxl) {
            VStack(alignment: .leading, spacing: 0) {
                SectionHeader("Indications")
                AttributedProseView(prose: entry.indications, citationIndex: citationIndex)
            }
            VStack(alignment: .leading, spacing: 0) {
                SectionHeader("Mechanism of action")
                AttributedProseView(prose: entry.mechanism, citationIndex: citationIndex)
            }
        }
    }

    private var dosing: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Dosing")
            DosingBlockView(blocks: entry.dosing, citationIndex: citationIndex)
        }
    }

    @ViewBuilder
    private var contraindications: some View {
        if let proseValue = entry.contraindications {
            VStack(alignment: .leading, spacing: 0) {
                SectionHeader("Contraindications")
                AttributedProseView(prose: proseValue, citationIndex: citationIndex)
            }
        }
    }

    private var warnings: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Warnings")
            AttributedBulletList(bullets: entry.warnings, citationIndex: citationIndex)
        }
    }

    private var adverseReactions: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Adverse reactions")
            AttributedProseView(prose: entry.adverseReactions, citationIndex: citationIndex)
        }
    }

    private var drugInteractions: some View {
        VStack(alignment: .leading, spacing: 0) {
            SectionHeader("Drug interactions")
            AttributedBulletList(bullets: entry.drugInteractions, citationIndex: citationIndex)
        }
    }

    @ViewBuilder
    private var nursingImplications: some View {
        if let bullets = entry.nursingImplications {
            VStack(alignment: .leading, spacing: 0) {
                SectionHeader("Nursing implications")
                AttributedBulletList(bullets: bullets, citationIndex: citationIndex)
            }
        }
    }

    @ViewBuilder
    private var patientTeaching: some View {
        if let proseValue = entry.patientTeaching {
            VStack(alignment: .leading, spacing: 0) {
                SectionHeader("Patient teaching")
                AttributedProseView(prose: proseValue, citationIndex: citationIndex)
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
            Text("This entry is a curated assembly of content from the sources above. No clinical claim has been originated by NurseMind — every section ties to a primary source.")
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

#Preview {
    DrugEntryView(entry: NorepinephrineSample.entry)
}
