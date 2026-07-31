import Foundation
import Testing
@testable import NursemindCore

// Retrieval quality harness. `ContentRegistry.search` is the single retrieval
// path for BOTH the Search sheet and the AI co-pilot (`RAGRetriever` feeds its
// top-5 straight into the prompt), so a miss here is simultaneously an empty
// search screen and an ungrounded answer.
//
// The probe set is grouped so a headline number can't hide a regression in one
// class of query. `control` is what already worked before the fuzzy layer;
// `typo` is the class it was built for.

struct SearchProbe {
    let query: String
    /// Bare (un-namespaced) entry ids. A hit is any of these in the top-K.
    let accept: [String]
    let group: String
}

enum SearchProbes {

    /// Correctly-spelled lookups. These must never regress.
    static let control: [SearchProbe] = [
        SearchProbe(query: "vancomycin",        accept: ["vancomycin"],                          group: "control"),
        SearchProbe(query: "norepinephrine",    accept: ["norepinephrine"],                      group: "control"),
        SearchProbe(query: "potassium",         accept: ["potassium"],                           group: "control"),
        SearchProbe(query: "troponin",          accept: ["troponin"],                            group: "control"),
        SearchProbe(query: "sepsis",            accept: ["sepsis"],                              group: "control"),
        SearchProbe(query: "amiodarone",        accept: ["amiodarone"],                          group: "control"),
        SearchProbe(query: "heparin",           accept: ["heparin"],                             group: "control"),
        SearchProbe(query: "hyperkalemia",      accept: ["hyperkalemia"],                        group: "control"),
        SearchProbe(query: "furosemide",        accept: ["furosemide"],                          group: "control"),
        SearchProbe(query: "warfarin",          accept: ["warfarin"],                            group: "control"),
        SearchProbe(query: "digoxin",           accept: ["digoxin"],                             group: "control"),
        SearchProbe(query: "metoprolol",        accept: ["metoprolol"],                          group: "control"),
        SearchProbe(query: "lactate",           accept: ["lactate"],                             group: "control"),
        SearchProbe(query: "labetalol",         accept: ["labetalol"],                           group: "control"),
        SearchProbe(query: "phenytoin",         accept: ["phenytoin"],                           group: "control"),
        SearchProbe(query: "cefepime",          accept: ["cefepime"],                            group: "control"),
        SearchProbe(query: "levofloxacin",      accept: ["levofloxacin"],                        group: "control"),
        SearchProbe(query: "ondansetron",       accept: ["ondansetron"],                         group: "control"),
        SearchProbe(query: "epinephrine",       accept: ["epinephrine"],                         group: "control"),
        SearchProbe(query: "magnesium",         accept: ["magnesium"],                           group: "control"),
    ]

    /// Real misspellings — transpositions, doubled letters, dropped letters,
    /// and the phonetic spellings nurses actually type at 3 AM.
    static let typo: [SearchProbe] = [
        SearchProbe(query: "vancomyicn",        accept: ["vancomycin"],                          group: "typo"),
        SearchProbe(query: "vancomicin",        accept: ["vancomycin"],                          group: "typo"),
        SearchProbe(query: "norepinepherine",   accept: ["norepinephrine"],                      group: "typo"),
        SearchProbe(query: "metropolol",        accept: ["metoprolol"],                          group: "typo"),
        SearchProbe(query: "acetominophen",     accept: ["acetaminophen"],                       group: "typo"),
        SearchProbe(query: "amiodorone",        accept: ["amiodarone"],                          group: "typo"),
        SearchProbe(query: "digoxine",          accept: ["digoxin"],                             group: "typo"),
        SearchProbe(query: "warfarine",         accept: ["warfarin"],                            group: "typo"),
        SearchProbe(query: "heparine",          accept: ["heparin"],                             group: "typo"),
        SearchProbe(query: "troponine",         accept: ["troponin"],                            group: "typo"),
        SearchProbe(query: "magnesim",          accept: ["magnesium"],                           group: "typo"),
        SearchProbe(query: "hyperkalemai",      accept: ["hyperkalemia"],                        group: "typo"),
        SearchProbe(query: "potasium",          accept: ["potassium"],                           group: "typo"),
        SearchProbe(query: "vasopresin",        accept: ["vasopressin-drip"],                    group: "typo"),
        SearchProbe(query: "ondansatron",       accept: ["ondansetron"],                         group: "typo"),
        SearchProbe(query: "epinepherine",      accept: ["epinephrine"],                         group: "typo"),
        SearchProbe(query: "diltiazam",         accept: ["diltiazem-drip", "diltiazem-po"],      group: "typo"),
        SearchProbe(query: "labetelol",         accept: ["labetalol"],                           group: "typo"),
        SearchProbe(query: "phenytonin",        accept: ["phenytoin"],                           group: "typo"),
        SearchProbe(query: "cefapime",          accept: ["cefepime"],                            group: "typo"),
        SearchProbe(query: "levofloxicin",      accept: ["levofloxacin"],                        group: "typo"),
        SearchProbe(query: "furosemude",        accept: ["furosemide"],                          group: "typo"),
        SearchProbe(query: "amiodarne",         accept: ["amiodarone"],                          group: "typo"),
        SearchProbe(query: "hepirin",           accept: ["heparin"],                             group: "typo"),
        SearchProbe(query: "sepsus",            accept: ["sepsis"],                              group: "typo"),
    ]

    /// Question- and phrase-shaped queries — how the Ask surface hits retrieval.
    static let phrase: [SearchProbe] = [
        SearchProbe(query: "how do I read an abg",
                    accept: ["abg", "abg-algorithm", "abg-vbg-interpretation"],                  group: "phrase"),
        SearchProbe(query: "signs of sepsis",           accept: ["sepsis"],                      group: "phrase"),
        SearchProbe(query: "foley catheter care",
                    accept: ["foley-catheter-management", "foley-insertion", "foley-removal"],   group: "phrase"),
        SearchProbe(query: "chest tube emergency",
                    accept: ["chest-tube-emergency-scenario", "chest-tube-care",
                             "chest-tube-drainage", "chest-tube-insertion"],                     group: "phrase"),
        SearchProbe(query: "how to give a blood transfusion",
                    accept: ["blood-transfusion", "blood-transfusion-administration"],           group: "phrase"),
        SearchProbe(query: "when do I use restraints",
                    accept: ["restraints", "restraint-safety-scenario",
                             "behavioral-safety-restraint-alternatives"],                        group: "phrase"),
        SearchProbe(query: "insulin drip titration",    accept: ["insulin-drip"],                group: "phrase"),
        SearchProbe(query: "dka management",            accept: ["dka", "adult-dka", "dka-vs-hhs"], group: "phrase"),
        SearchProbe(query: "hand hygiene steps",
                    accept: ["hand-hygiene", "hand-hygiene-reference"],                          group: "phrase"),
        SearchProbe(query: "lasix",                     accept: ["furosemide"],                  group: "phrase"),
    ]

    static let all: [SearchProbe] = control + typo + phrase
}

/// Aggregate scores for one probe group.
struct SearchScore {
    var probes = 0
    var hitsAt1 = 0
    var hitsAt5 = 0
    var reciprocalRankSum = 0.0

    var recallAt1: Double { probes == 0 ? 0 : Double(hitsAt1) / Double(probes) }
    var recallAt5: Double { probes == 0 ? 0 : Double(hitsAt5) / Double(probes) }
    var mrr: Double       { probes == 0 ? 0 : reciprocalRankSum / Double(probes) }
}

enum SearchEvaluator {

    /// Runs every probe and returns per-group scores plus the list of misses.
    static func evaluate(
        _ probes: [SearchProbe],
        limit: Int = 5
    ) -> (scores: [String: SearchScore], misses: [(SearchProbe, [String])]) {
        var scores: [String: SearchScore] = [:]
        var misses: [(SearchProbe, [String])] = []

        for probe in probes {
            let results = ContentRegistry.shared.search(probe.query, limit: limit)
            let bareIDs = results.map { $0.id.split(separator: ":").last.map(String.init) ?? $0.id }

            var score = scores[probe.group] ?? SearchScore()
            score.probes += 1

            if let rank = bareIDs.firstIndex(where: { probe.accept.contains($0) }) {
                score.hitsAt5 += 1
                if rank == 0 { score.hitsAt1 += 1 }
                score.reciprocalRankSum += 1.0 / Double(rank + 1)
            } else {
                misses.append((probe, bareIDs))
            }
            scores[probe.group] = score
        }
        return (scores, misses)
    }

    static func report(_ label: String, probes: [SearchProbe]) -> [String: SearchScore] {
        let (scores, misses) = evaluate(probes)
        print("\n=== NM-SEARCH-EVAL \(label) ===")
        for group in ["control", "typo", "phrase"] {
            guard let s = scores[group] else { continue }
            print(String(
                format: "NM-SEARCH-EVAL %-8@ n=%2d  recall@1=%.2f  recall@5=%.2f  mrr=%.3f",
                group as NSString, s.probes, s.recallAt1, s.recallAt5, s.mrr
            ))
        }
        let total = scores.values.reduce(into: SearchScore()) { acc, s in
            acc.probes += s.probes
            acc.hitsAt1 += s.hitsAt1
            acc.hitsAt5 += s.hitsAt5
            acc.reciprocalRankSum += s.reciprocalRankSum
        }
        print(String(
            format: "NM-SEARCH-EVAL %-8@ n=%2d  recall@1=%.2f  recall@5=%.2f  mrr=%.3f",
            "TOTAL" as NSString, total.probes, total.recallAt1, total.recallAt5, total.mrr
        ))
        for (probe, got) in misses {
            print("NM-SEARCH-MISS [\(probe.group)] \"\(probe.query)\" want \(probe.accept) got \(got.prefix(3))")
        }
        return scores
    }
}

@Suite("Retrieval quality")
struct SearchQualityTests {

    @Test("Retrieval quality across control, typo, and phrase probes")
    func retrievalQuality() {
        let scores = SearchEvaluator.report("current", probes: SearchProbes.all)

        // Correctly-spelled lookups are the floor the product already meets.
        // Any drop here means the fuzzy layer started outranking exact matches.
        let control = scores["control"] ?? SearchScore()
        #expect(control.recallAt5 >= 1.0, "control recall@5 regressed to \(control.recallAt5)")
        #expect(control.recallAt1 >= 0.95, "control recall@1 regressed to \(control.recallAt1)")

        // Misspellings — the gap the fuzzy layer exists to close.
        let typo = scores["typo"] ?? SearchScore()
        #expect(typo.recallAt5 >= 0.85, "typo recall@5 is \(typo.recallAt5)")

        // Phrase / question-shaped queries feed the AI co-pilot's context.
        let phrase = scores["phrase"] ?? SearchScore()
        #expect(phrase.recallAt5 >= 0.90, "phrase recall@5 is \(phrase.recallAt5)")
    }

    @Test("Search latency stays inside the typing budget")
    func searchLatency() {
        // Warm any lazy index so this measures steady-state typing, not first run.
        _ = ContentRegistry.shared.search("warmup")

        let queries = SearchProbes.all.map(\.query)
        let clock = ContinuousClock()
        let elapsed = clock.measure {
            for q in queries { _ = ContentRegistry.shared.search(q, limit: 5) }
        }
        let perQuery = elapsed / queries.count
        let ms = Double(perQuery.components.attoseconds) / 1e15
            + Double(perQuery.components.seconds) * 1000
        print(String(format: "NM-SEARCH-LATENCY per-query=%.1fms over %d queries", ms, queries.count))

        // Search runs after a 200ms debounce on a detached task. Anything over
        // ~50ms per keystroke starts being felt as lag on older devices.
        #expect(ms < 50.0, "search took \(ms)ms per query")
    }

    @Test("Byte-level specialty inference matches the string path exactly")
    func specialtyInferenceUnchanged() {
        // The index derives specialty tags from the entry's UTF-8 body alone,
        // where the original walked `title + " " + searchText` as a String. That
        // is only safe because `searchText` already leads with the title —
        // assert it across the whole corpus rather than trusting the reasoning.
        var mismatches: [String] = []
        for entry in ContentRegistry.shared.all {
            let viaString = SpecialtyHeuristic.infer(
                title: entry.title,
                searchText: entry.searchText,
                category: entry.category
            )
            let viaBytes = SpecialtyHeuristic.infer(haystack: Array(entry.searchText.utf8))
            if viaString != viaBytes {
                mismatches.append("\(entry.id): string=\(viaString) bytes=\(viaBytes)")
            }
        }
        for mismatch in mismatches.prefix(10) { print("NM-SPECIALTY-MISMATCH \(mismatch)") }
        #expect(mismatches.isEmpty, "\(mismatches.count) entries infer different specialties")
    }

    @Test("Index build is cheap enough to prewarm at launch")
    func indexBuildCost() {
        // A fresh registry so this measures a cold build, not the warm shared one.
        let registry = ContentRegistry(entries: ContentRegistry.bundledEntries())
        let clock = ContinuousClock()
        let elapsed = clock.measure { registry.prewarmIndex() }
        let ms = Double(elapsed.components.attoseconds) / 1e15
            + Double(elapsed.components.seconds) * 1000
        print(String(format: "NM-SEARCH-LATENCY cold-index-build=%.0fms", ms))

        // ~2s unoptimized on the simulator, materially less in Release on
        // device. It runs on a detached utility-priority task at launch and
        // blocks nothing, so the bar is only that it finishes well before a
        // user can plausibly reach Search or Ask. This guards against the
        // corpus growing the build back into user-visible territory.
        #expect(ms < 4000.0, "index build took \(ms)ms")
    }

    @Test("Index build cost is paid once, not per keystroke")
    func indexAmortized() {
        let clock = ContinuousClock()
        _ = ContentRegistry.shared.search("amortize-warmup")

        let warm = clock.measure {
            for _ in 0..<20 { _ = ContentRegistry.shared.search("vancomycin", limit: 5) }
        }
        let warmMs = (Double(warm.components.attoseconds) / 1e15
            + Double(warm.components.seconds) * 1000) / 20
        print(String(format: "NM-SEARCH-LATENCY warm-repeat=%.1fms", warmMs))
        #expect(warmMs < 50.0, "repeated identical search took \(warmMs)ms")
    }
}
