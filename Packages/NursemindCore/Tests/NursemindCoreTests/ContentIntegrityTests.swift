import Foundation
import Testing
@testable import NursemindCore

// Guardrails that graduated out of the diagnostic audit. Each pins a known
// state so the corpus can only get better: existing debt is listed explicitly
// and new instances fail.

@Suite("Content integrity")
struct ContentIntegrityTests {

    /// Two entries with the same title in the same category. A reader has no
    /// way to tell them apart in a list, search relevance splits between them,
    /// and nothing stops the two from disagreeing with each other.
    ///
    /// These are known debt, not accepted design — they need merging into one
    /// entry each. Listed so the count can only go down.
    static let knownSameCategoryDuplicates: Set<String> = [
        "acute lymphoblastic leukemia all",
        "acute otitis media aom",
        "acute pericarditis",
        "amyotrophic lateral sclerosis als",
        "arterial blood gas abg",
        "atopic dermatitis eczema",
        "cellulitis",
        "ferritin iron studies",
        "nih stroke scale nihss",
        "obstructive sleep apnea osa",
        "pain assessment scales",
        "patent ductus arteriosus pda",
        "pediatric foreign body aspiration",
        "premature rupture of membranes prom pprom",
        "timolol ophthalmic",
    ]

    /// A disease entry and a quick-reference card for the same condition. This
    /// pairing is deliberate — the prior duplicate-id audit renamed the
    /// reference ids specifically to keep both — but the identical titles mean
    /// the two render as indistinguishable rows. Worth differentiating in copy
    /// rather than merging.
    static let knownCrossCategoryPairs: Set<String> = [
        "atrial fibrillation",
        "blood transfusion administration",
        "croup laryngotracheobronchitis",
        "neonatal sepsis",
        "postpartum hemorrhage pph",
        "preeclampsia",
        "ventricular fibrillation vf",
        "ventricular tachycardia vt",
    ]

    private func normalizedTitle(_ entry: LibraryEntry) -> String {
        entry.title.lowercased()
            .replacingOccurrences(of: "[^a-z0-9 ]", with: "", options: .regularExpression)
            .split(separator: " ").joined(separator: " ")
    }

    @Test("No new duplicate titles")
    func noNewDuplicateTitles() {
        var byTitle: [String: [LibraryEntry]] = [:]
        for entry in ContentRegistry.shared.all {
            byTitle[normalizedTitle(entry), default: []].append(entry)
        }
        let known = Self.knownSameCategoryDuplicates.union(Self.knownCrossCategoryPairs)
        let unexpected = byTitle
            .filter { $0.value.count > 1 && !known.contains($0.key) }
            .map { "\($0.key) -> \($0.value.map(\.id).joined(separator: " | "))" }
            .sorted()

        for line in unexpected { print("NM-INTEGRITY NEW-DUPLICATE \(line)") }
        #expect(unexpected.isEmpty, "\(unexpected.count) new duplicate titles")
    }

    /// The known lists must shrink as entries are merged, never silently go
    /// stale. If a listed duplicate has been resolved, this fails so the entry
    /// comes off the list rather than sitting there implying debt that is gone.
    @Test("Known duplicate lists stay accurate")
    func knownDuplicateListsAreCurrent() {
        var byTitle: [String: [LibraryEntry]] = [:]
        for entry in ContentRegistry.shared.all {
            byTitle[normalizedTitle(entry), default: []].append(entry)
        }
        let stillDuplicated = Set(byTitle.filter { $0.value.count > 1 }.keys)
        let resolved = Self.knownSameCategoryDuplicates
            .union(Self.knownCrossCategoryPairs)
            .subtracting(stillDuplicated)

        for title in resolved.sorted() { print("NM-INTEGRITY RESOLVED \(title)") }
        #expect(resolved.isEmpty,
                "\(resolved.count) titles are no longer duplicated — remove them from the list")
    }

    /// Every entry carries at least one source. The curator model's floor.
    @Test("Every entry declares a source")
    func everyEntryHasCitations() {
        var uncited: [String] = []
        for entry in ContentRegistry.shared.all where declaredCitationCount(entry) == 0 {
            uncited.append(entry.id)
        }
        #expect(uncited.isEmpty, "uncited entries: \(uncited.prefix(10))")
    }

    /// Every entry carries a subtitle. Library rows and Spotlight results both
    /// use it as the "what is this" line; without it a result reads as a bare
    /// title with the category repeated underneath.
    @Test("Every entry has a subtitle")
    func everyEntryHasSubtitle() {
        let missing = ContentRegistry.shared.all
            .filter { ($0.subtitle ?? "").isEmpty }
            .map(\.id)
        #expect(missing.isEmpty, "entries without subtitle: \(missing.prefix(10))")
    }

    private func declaredCitationCount(_ entry: LibraryEntry) -> Int {
        switch entry {
        case .drug(let e), .drip(let e):                                return e.citations.count
        case .lab(let e):                                               return e.citations.count
        case .procedure(let e):                                         return e.citations.count
        case .diagnosis(let e):                                         return e.citations.count
        case .reference(let e), .communication(let e), .scenario(let e): return e.citations.count
        }
    }
}
