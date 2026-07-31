import Foundation
import Testing
@testable import NursemindCore

// Diagnostic sweep over the shipped corpus. Prints findings rather than
// asserting them, so the numbers can be read before deciding which are defects
// and which are intentional. Assertions get added once a class of finding is
// understood — see ContentIntegrityTests for the ones that graduated.

@Suite("Content audit — diagnostic")
struct ContentAuditTests {

    @Test("Corpus report")
    func report() {
        let registry = ContentRegistry.shared
        let all = registry.all
        print("\nNM-AUDIT total-entries=\(all.count)")

        // Distribution by category.
        for category in registry.allCategories {
            print("NM-AUDIT category \(category.rawValue)=\(registry.count(in: category))")
        }

        // Duplicate and near-duplicate titles. A reference library with two
        // entries for one thing splits search relevance and lets the two
        // disagree with each other.
        var byNormalizedTitle: [String: [LibraryEntry]] = [:]
        for entry in all {
            let key = entry.title.lowercased()
                .replacingOccurrences(of: "[^a-z0-9 ]", with: "", options: .regularExpression)
                .split(separator: " ").joined(separator: " ")
            byNormalizedTitle[key, default: []].append(entry)
        }
        let duplicates = byNormalizedTitle.filter { $0.value.count > 1 }
        print("NM-AUDIT duplicate-titles=\(duplicates.count)")
        for (title, entries) in duplicates.sorted(by: { $0.key < $1.key }).prefix(25) {
            let ids = entries.map(\.id).joined(separator: " | ")
            print("NM-AUDIT DUP \"\(title)\" -> \(ids)")
        }

        // Missing subtitle: the library row and the Spotlight result both fall
        // back to the bare category, which reads as an unfinished entry.
        let noSubtitle = all.filter { $0.subtitle == nil || $0.subtitle?.isEmpty == true }
        print("NM-AUDIT missing-subtitle=\(noSubtitle.count)")
        for entry in noSubtitle.prefix(15) { print("NM-AUDIT NOSUB \(entry.id)") }

        // Entries carrying no citation source at all — the curator model's
        // floor is that every entry is traceable to something.
        let noCitations = all.filter { declaredCitations(in: $0).isEmpty }
        print("NM-AUDIT no-citations=\(noCitations.count)")
        for entry in noCitations.prefix(15) { print("NM-AUDIT NOCITE \(entry.id)") }

        // Declared-but-unreferenced sources: harmless to render, but they
        // inflate the references list with sources the text never used.
        var unusedTotal = 0
        for entry in all {
            let declared = Set(declaredCitations(in: entry).map(\.id))
            let used = Set(referencedCitationIDs(in: entry))
            let unused = declared.subtracting(used)
            if !unused.isEmpty { unusedTotal += 1 }
        }
        print("NM-AUDIT entries-with-unused-sources=\(unusedTotal)")

        // Split that number: an entry built only from key-value tables carries
        // no per-row citation ids, so its sources look unused when they are
        // legitimately backing the table. Those are artifacts of the data
        // model. Everything else is a source the text genuinely never cites.
        var artifact = 0
        var genuine: [(String, [String])] = []
        for entry in all {
            let declared = Set(declaredCitations(in: entry).map(\.id))
            let used = Set(referencedCitationIDs(in: entry))
            let unused = declared.subtracting(used)
            guard !unused.isEmpty else { continue }
            if used.isEmpty && hasOnlyTables(entry) {
                artifact += 1
            } else {
                genuine.append((entry.id, unused.sorted()))
            }
        }
        print("NM-AUDIT unused-sources-table-artifact=\(artifact)")
        print("NM-AUDIT unused-sources-genuine=\(genuine.count)")
        for (id, unused) in genuine.prefix(12) {
            print("NM-AUDIT UNUSED \(id) -> \(unused.joined(separator: ","))")
        }

        // Review dates. `lastSourceFidelityReview` is the only freshness signal
        // the corpus carries.
        var byReviewYear: [String: Int] = [:]
        for entry in all {
            byReviewYear[String(entry.lastReviewed.prefix(7)), default: 0] += 1
        }
        for (month, count) in byReviewYear.sorted(by: { $0.key < $1.key }) {
            print("NM-AUDIT reviewed \(month)=\(count)")
        }
    }

    /// True when every section is a key-value table, which carries no
    /// per-row citation ids by design.
    private func hasOnlyTables(_ entry: LibraryEntry) -> Bool {
        switch entry {
        case .reference(let r), .communication(let r), .scenario(let r):
            return r.sections.allSatisfy { if case .keyValueTable = $0 { return true }; return false }
        default:
            return false
        }
    }

    /// Sources declared in the entry's own citations array.
    private func declaredCitations(in entry: LibraryEntry) -> [CitationSource] {
        switch entry {
        case .drug(let e), .drip(let e):                        return e.citations
        case .lab(let e):                                       return e.citations
        case .procedure(let e):                                 return e.citations
        case .diagnosis(let e):                                 return e.citations
        case .reference(let e), .communication(let e), .scenario(let e): return e.citations
        }
    }

    /// Citation ids actually referenced by an entry's body.
    private func referencedCitationIDs(in entry: LibraryEntry) -> [String] {
        switch entry {
        case .drug(let d), .drip(let d):
            var ids = d.indications.citationIDs + d.mechanism.citationIDs
                + d.adverseReactions.citationIDs
            ids += d.dosing.flatMap(\.citationIDs)
            ids += d.warnings.flatMap(\.citationIDs)
            ids += d.drugInteractions.flatMap(\.citationIDs)
            ids += d.contraindications?.citationIDs ?? []
            ids += d.nursingImplications?.flatMap(\.citationIDs) ?? []
            ids += d.patientTeaching?.citationIDs ?? []
            return ids
        case .lab(let l):
            var ids = l.referenceRanges.flatMap(\.citationIDs)
            ids += l.interpretationTiers.flatMap(\.citationIDs)
            ids += l.commonCauses.flatMap(\.citationIDs)
            ids += l.nursingActions?.flatMap(\.citationIDs) ?? []
            return ids
        case .procedure(let p):
            var ids = p.indications.citationIDs
            ids += p.steps.flatMap(\.citationIDs)
            ids += p.watchFor?.flatMap(\.citationIDs) ?? []
            return ids
        case .diagnosis(let dx):
            var ids = dx.definition.citationIDs
            ids += dx.pathophysiology?.citationIDs ?? []
            ids += dx.presentation.flatMap(\.citationIDs)
            ids += dx.priorityAssessments?.flatMap(\.citationIDs) ?? []
            ids += dx.commonInterventions?.flatMap(\.citationIDs) ?? []
            return ids
        case .reference(let r), .communication(let r), .scenario(let r):
            return r.sections.flatMap { section -> [String] in
                switch section {
                case .prose(_, let prose):            return prose.citationIDs
                case .bullets(_, let bullets):        return bullets.flatMap(\.citationIDs)
                case .keyValueTable:                  return []
                case .numberedSteps(_, _, let ids):   return ids
                }
            }
        }
    }
}
