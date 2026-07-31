import Foundation
import Testing
@testable import NursemindCore

// Side-by-side dump of the same-category duplicate pairs, so each merge call
// can be made from content rather than from ids. Diagnostic only.

@Suite("Duplicate pair report")
struct DuplicatePairReportTests {

    @Test("Dump same-category duplicate pairs")
    func dumpPairs() {
        var byTitle: [String: [LibraryEntry]] = [:]
        for entry in ContentRegistry.shared.all {
            let key = entry.title.lowercased()
                .replacingOccurrences(of: "[^a-z0-9 ]", with: "", options: .regularExpression)
                .split(separator: " ").joined(separator: " ")
            byTitle[key, default: []].append(entry)
        }

        let pairs = byTitle
            .filter { $0.value.count > 1 }
            .filter { group in
                let categories = Set(group.value.map(\.category))
                return categories.count == 1
            }
            .sorted { $0.key < $1.key }

        print("\nNM-PAIRS count=\(pairs.count)")
        for (title, entries) in pairs {
            print("NM-PAIRS ### \(title)")
            for entry in entries.sorted(by: { $0.id < $1.id }) {
                let bodyChars = entry.searchText.count
                print("NM-PAIRS   id=\(entry.id)")
                print("NM-PAIRS     subtitle=\(entry.subtitle ?? "-")")
                print("NM-PAIRS     reviewed=\(entry.lastReviewed) sources=\(sourceIDs(entry).count) body=\(bodyChars) \(structure(entry))")
                print("NM-PAIRS     sourceIDs=\(sourceIDs(entry).joined(separator: ","))")
            }
        }
    }

    private func sourceIDs(_ entry: LibraryEntry) -> [String] {
        switch entry {
        case .drug(let e), .drip(let e):                                return e.citations.map(\.id)
        case .lab(let e):                                               return e.citations.map(\.id)
        case .procedure(let e):                                         return e.citations.map(\.id)
        case .diagnosis(let e):                                         return e.citations.map(\.id)
        case .reference(let e), .communication(let e), .scenario(let e): return e.citations.map(\.id)
        }
    }

    /// A short shape summary so "which one is fuller" is answerable at a glance.
    private func structure(_ entry: LibraryEntry) -> String {
        switch entry {
        case .drug(let d), .drip(let d):
            return "dosing=\(d.dosing.count) warnings=\(d.warnings.count) interactions=\(d.drugInteractions.count) nursing=\(d.nursingImplications?.count ?? 0) teaching=\(d.patientTeaching == nil ? 0 : 1)"
        case .lab(let l):
            return "ranges=\(l.referenceRanges.count) tiers=\(l.interpretationTiers.count) causes=\(l.commonCauses.count) actions=\(l.nursingActions?.count ?? 0)"
        case .procedure(let p):
            return "steps=\(p.steps.count) watchFor=\(p.watchFor?.count ?? 0)"
        case .diagnosis(let dx):
            return "presentation=\(dx.presentation.count) assessments=\(dx.priorityAssessments?.count ?? 0) interventions=\(dx.commonInterventions?.count ?? 0) patho=\(dx.pathophysiology == nil ? 0 : 1)"
        case .reference(let r), .communication(let r), .scenario(let r):
            return "sections=\(r.sections.count)"
        }
    }
}
