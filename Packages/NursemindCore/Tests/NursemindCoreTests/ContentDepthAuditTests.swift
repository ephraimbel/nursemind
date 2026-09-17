import Foundation
import Testing
@testable import NursemindCore

struct ContentDepthRecord: Encodable {
    let id: String
    let title: String
    let category: String
    let words: Int
    let sectionWords: [String: Int]
    let absentSections: [String]
    let uncitedBlocks: [String]
    let unresolvedCitationIDs: [String]
    let sourceURLs: [String]
    let sourceLocatorIssues: [String]
    let clinicalReviewSignals: [String]
    let topicIDs: [String]
    let sourceReview: String

    init(_ entry: LibraryEntry) {
        var text: [String: [String]] = [:]
        var absent: [String] = []
        var uncited: [String] = []
        var used: [String] = []
        var reviewSignals: [String] = []
        let sources: [CitationSource]

        func block(_ section: String, _ body: String, _ ids: [String]) {
            guard !body.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
            text[section, default: []].append(body)
            if body.range(of: #"(?i)\b(give|administer|infuse|titrate|transfuse)\b[^.\n]{0,80}\b(mg|mcg|units|mL)\b"#,
                          options: .regularExpression) != nil {
                reviewSignals.append("Numerical treatment wording: " + section)
            }
            used += ids
            if ids.isEmpty { uncited.append(section) }
        }
        func prose(_ section: String, _ value: AttributedProse?) {
            guard let value, !value.text.isEmpty else { absent.append(section); return }
            block(section, value.text, value.citationIDs)
        }
        func bullets(_ section: String, _ values: [AttributedBullet]?) {
            guard let values, !values.isEmpty else { absent.append(section); return }
            for value in values { block(section, value.text, value.citationIDs) }
        }

        switch entry {
        case .drug(let e), .drip(let e):
            sources = e.citations
            if e.isHighAlert { reviewSignals.append("High-alert medication") }
            if e.isHighRisk { reviewSignals.append("High-risk medication") }
            for row in e.quickReference { block("Quick reference", row.key + " " + row.value, []) }
            prose("Indications", e.indications)
            prose("Mechanism", e.mechanism)
            for dose in e.dosing { block("Dosing", dose.label + " " + dose.body, dose.citationIDs) }
            if e.dosing.isEmpty { absent.append("Dosing") }
            prose("Contraindications", e.contraindications)
            bullets("Warnings", e.warnings)
            prose("Adverse reactions", e.adverseReactions)
            bullets("Interactions", e.drugInteractions)
            bullets("Nursing considerations", e.nursingImplications)
            prose("Patient teaching", e.patientTeaching)
        case .lab(let e):
            sources = e.citations
            if e.referenceRanges.isEmpty { absent.append("Reference ranges") }
            for row in e.referenceRanges { block("Reference ranges", row.label + " " + row.value, row.citationIDs) }
            if e.interpretationTiers.isEmpty { absent.append("Interpretation") }
            for tier in e.interpretationTiers {
                block("Interpretation", ([tier.label, tier.summary] + tier.nursingActions).joined(separator: " "), tier.citationIDs)
            }
            if e.commonCauses.isEmpty { absent.append("Common causes") }
            for cause in e.commonCauses { block("Common causes", ([cause.title] + cause.causes).joined(separator: " "), cause.citationIDs) }
            bullets("Nursing considerations", e.nursingActions)
            bullets("Watch for", e.watchFor)
        case .diagnosis(let e):
            sources = e.citations
            prose("Definition", e.definition)
            prose("Pathophysiology", e.pathophysiology)
            bullets("Presentation", e.presentation)
            bullets("Diagnostic criteria", e.diagnosticCriteria)
            bullets("Priority assessment", e.priorityAssessments)
            bullets("Common interventions", e.commonInterventions)
            bullets("Watch for", e.watchFor)
        case .procedure(let e):
            sources = e.citations
            prose("Indications", e.indications)
            prose("Contraindications", e.contraindications)
            bullets("Equipment", e.equipment)
            bullets("Preparation", e.preProcedure)
            if e.steps.isEmpty { absent.append("Steps") }
            for step in e.steps { block("Steps", (step.title ?? "") + " " + step.body, step.citationIDs) }
            bullets("Aftercare", e.postProcedure)
            bullets("Documentation", e.documentation)
            bullets("Watch for", e.watchFor)
        case .reference(let e), .scenario(let e), .communication(let e):
            sources = e.citations
            if e.sections.isEmpty { absent.append("Body") }
            for section in e.sections {
                switch section {
                case .prose(let title, let value): prose(title, value)
                case .bullets(let title, let values): bullets(title, values)
                case .keyValueTable(let title, let rows):
                    if rows.isEmpty { absent.append(title) }
                    for row in rows { block(title, row.key + " " + row.value, []) }
                case .numberedSteps(let title, let steps, let ids):
                    if steps.isEmpty { absent.append(title) }
                    for step in steps { block(title, step, ids) }
                }
            }
        }
        id = entry.id
        title = entry.title
        category = entry.category.rawValue
        sectionWords = text.mapValues { $0.joined(separator: " ").split { $0.isWhitespace }.count }
        words = sectionWords.values.reduce(0, +)
        absentSections = absent.sorted()
        uncitedBlocks = uncited.sorted()
        unresolvedCitationIDs = Array(Set(used).subtracting(Set(sources.map(\.id)))).sorted()
        sourceURLs = sources.map(\.url)
        sourceLocatorIssues = sources.compactMap { source in
            guard let url = URLComponents(string: source.url) else {
                return source.id + ": malformed URL"
            }
            if url.queryItems?.contains(where: { ["s", "q", "query", "search"].contains($0.name) }) == true {
                return source.id + ": search URL (needs a specific supporting source)"
            }
            if url.path.isEmpty || url.path == "/" {
                return source.id + ": site root (needs claim-level source review)"
            }
            return nil
        }
        clinicalReviewSignals = Array(Set(reviewSignals)).sorted()
        topicIDs = LibraryTopic.all.filter { $0.entryIDs.contains(entry.id) }.map(\.id)
        sourceReview = entry.lastReviewed
    }
}

@Suite("Library depth audit", .serialized)
struct ContentDepthAuditTests {
    @Test func reportEveryEntryAndSection() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys, .withoutEscapingSlashes]
        for entry in ContentRegistry.shared.all {
            let record = ContentDepthRecord(entry)
            let data = try encoder.encode(record)
            print("NM-DEPTH " + String(decoding: data, as: UTF8.self))
        }
        print("NM-DEPTH-COUNT \(ContentRegistry.shared.all.count)")
    }

    @Test func allAttributedBlocksResolveToDeclaredSources() {
        for entry in ContentRegistry.shared.all {
            let record = ContentDepthRecord(entry)
            #expect(record.unresolvedCitationIDs.isEmpty,
                    "\(entry.id): unresolved citations \(record.unresolvedCitationIDs)")
        }
    }
}
