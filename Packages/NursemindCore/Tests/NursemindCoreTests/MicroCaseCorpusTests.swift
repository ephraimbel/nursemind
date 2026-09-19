import Foundation
import Testing
@testable import NursemindCore

/// Invariants for the daily-case corpus (PLAN.md R4 acceptance).
@Suite("Micro-case corpus")
struct MicroCaseCorpusTests {
    let cases = MicroCaseCorpus.all

    @Test func idsAndPublishDatesAreUnique() {
        #expect(Set(cases.map(\.id)).count == cases.count)
        #expect(Set(cases.map(\.publishOn)).count == cases.count)
        let dateFormat = try! NSRegularExpression(pattern: "^\\d{4}-\\d{2}-\\d{2}$")
        for c in cases {
            #expect(dateFormat.firstMatch(in: c.publishOn, range: NSRange(c.publishOn.startIndex..., in: c.publishOn)) != nil, Comment(rawValue: c.id))
            #expect(c.id.hasPrefix("case-"), Comment(rawValue: c.id))
        }
    }

    @Test func scheduleIsAContiguousRunOfDays() throws {
        let sorted = cases.map(\.publishOn).sorted()
        let fmt = DateFormatter(); fmt.dateFormat = "yyyy-MM-dd"; fmt.timeZone = TimeZone(identifier: "UTC")
        let dates = try sorted.map { try #require(fmt.date(from: $0)) }
        for (a, b) in zip(dates, dates.dropFirst()) {
            #expect(b.timeIntervalSince(a) == 86_400, "gap between \(a) and \(b)")
        }
    }

    @Test func everyCaseHasTheRequiredShape() {
        for c in cases {
            #expect(c.options.count == 4, Comment(rawValue: c.id))
            #expect((0..<c.options.count).contains(c.bestOptionIndex), Comment(rawValue: c.id))
            #expect((3...5).contains(c.cues.count), "\(c.id) cues")
            #expect(c.stem.split(separator: " ").count <= 80, "\(c.id) stem is over 80 words")
            #expect(c.takeaway.split(separator: " ").count <= 8, "\(c.id) takeaway is over 8 words")
            #expect(!c.prompt.isEmpty && c.prompt.hasSuffix("?"), Comment(rawValue: c.id))
            #expect((1...3).contains(c.relatedEntryIDs.count), "\(c.id) related")
            #expect(!c.citations.isEmpty, Comment(rawValue: c.id))
        }
    }

    @Test func everyRationaleCitesASourceTheCaseCarries() {
        for c in cases {
            let carried = Set(c.citations.map(\.id))
            for (i, o) in c.options.enumerated() {
                #expect(!o.rationale.citationIDs.isEmpty, "\(c.id) option \(i) uncited")
                for id in o.rationale.citationIDs {
                    #expect(carried.contains(id), "\(c.id) option \(i) cites \(id) which the case does not carry")
                }
                #expect(!o.rationale.text.isEmpty, Comment(rawValue: c.id))
            }
            for source in c.citations {
                #expect([.publicDomain, .cc0, .ccBy4].contains(source.license), "\(c.id): \(source.id) licence")
            }
        }
    }

    @Test func relatedEntriesResolveInTheLibrary() {
        let registry = ContentRegistry.shared
        for c in cases {
            for id in c.relatedEntryIDs {
                #expect(registry.entry(byID: id) != nil, "\(c.id) → \(id) not in the library")
            }
        }
    }

    /// 1.4.2 and FDA CDS: options are nursing actions, never doses, and no
    /// text computes or states an amount to give.
    @Test func noCaseTeachesOrDirectsADose() {
        let forbidden: [(String, String)] = [
            (#"\b\d+(\.\d+)?\s?(mg|mcg|µg|g|ml|mL|units?|mEq|mmol)\b"#, "amount with unit"),
            (#"\bgive\s+\d"#, "give <number>"),
            (#"\b(administer|push|bolus)\s+\d"#, "directive amount"),
            (#"\bmg/kg\b|\bmcg/kg\b|\bunits/kg\b"#, "weight-based dose"),
            (#"\bml/hr\b|\bmL/h\b"#, "rate"),
            (#"\b(quiz|nclex|practice question|test plan|streak|leaderboard|points earned)\b"#, "exam framing"),
        ]
        var violations: [String] = []
        for c in cases {
            var text = [c.title, c.stem, c.prompt, c.takeaway] + c.cues
            text += c.options.map(\.text) + c.options.map(\.rationale.text)
            let joined = text.joined(separator: " ").lowercased()
            for (pattern, label) in forbidden {
                if joined.range(of: pattern, options: [.regularExpression, .caseInsensitive]) != nil {
                    violations.append("\(c.id) [\(label)]")
                }
            }
        }
        #expect(violations.isEmpty, Comment(rawValue: violations.joined(separator: "\n")))
    }

    @Test func registryPicksTheScheduledCaseThenRotates() throws {
        let registry = MicroCaseRegistry(cases: cases)
        let fmt = DateFormatter(); fmt.dateFormat = "yyyy-MM-dd"
        let first = try #require(cases.map(\.publishOn).sorted().first)
        let day = try #require(fmt.date(from: first))
        #expect(registry.case(on: day)?.publishOn == first)
        let farFuture = try #require(fmt.date(from: "2031-01-01"))
        #expect(registry.case(on: farFuture) != nil)
        #expect(registry.pastCases(before: day).isEmpty)
        #expect(registry.pastCases(before: farFuture).count == min(30, cases.count))
        #expect(registry.case(id: cases[0].id)?.id == cases[0].id)
    }

    @Test @MainActor func progressRecordsOnceAndPersists() {
        let suite = UserDefaults(suiteName: "nm.tests.microcase.\(UUID().uuidString)")!
        let store = MicroCaseProgress(defaults: suite)
        let c = cases[0]
        let first = store.record(c, chosenIndex: (c.bestOptionIndex + 1) % 4)
        #expect(first.correct == false)
        let second = store.record(c, chosenIndex: c.bestOptionIndex)
        #expect(second == first, "first answer wins")
        let reloaded = MicroCaseProgress(defaults: suite)
        #expect(reloaded.answer(for: c.id) == first)
        #expect(MicroCaseAnalytics.bucket(4) == "<10s")
        #expect(MicroCaseAnalytics.bucket(45) == "30-60s")
        #expect(MicroCaseAnalytics.bucket(600) == "60s+")
    }
}
