import Foundation
import Testing
@testable import NursemindCore

@Suite("Ask evidence presentation")
struct AskPresentationTests {
    private let source = CitationSource(id: "original-slug", shortName: "Source", license: .publicDomain,
                                        url: "https://medlineplus.gov/lab-tests/", lastRetrieved: "2026-09-17")

    @Test func passagesFollowCitationMarkersAndPreserveProvenance() throws {
        let context = "[c001] (entry: Reference (adult); source: Source (retrieved 2026-09-17)) First passage.\n[c002] (entry: Other) Unrelated passage.\n[c001] (entry: Reference; source: Source) Second passage.\n[c001] (entry: Reference; source: Source) First passage."
        let attached = AnswerCitationEvidence.attaching(to: [source], context: context, origin: .librarySummary)
        #expect(attached[0].id == "original-slug")
        #expect(attached[0].answerEvidence?.passages == ["First passage.", "Second passage."])
        #expect(attached[0].answerEvidence?.origin == .librarySummary)
        let restored = try JSONDecoder().decode(CitationSource.self, from: JSONEncoder().encode(attached[0]))
        #expect(restored == attached[0])
    }

    @Test func missingOrMalformedEvidenceDoesNotInventAnExcerpt() throws {
        for context in ["", "[c002] (entry: Wrong source) Wrong passage.", "[c001] (entry: Broken metadata"] {
            #expect(AnswerCitationEvidence.attaching(to: [source], context: context, origin: .retrievedSource)[0].answerEvidence == nil)
        }
        let data = Data(#"{"id":"old","shortName":"Reference","license":"publicDomain","url":"https://example.org","lastRetrieved":"2026-09-17"}"#.utf8)
        #expect(try JSONDecoder().decode(CitationSource.self, from: data).answerEvidence == nil)
    }

    @Test func sharedPassageRemainsAttributedToEverySuppliedSource() {
        var second = source
        second.answerEvidence = nil
        let attached = AnswerCitationEvidence.attaching(to: [source, second], context: "[c001] [c002] (source: Joint passage; publisher: Public source; retrieved 2026-09-17) Shared passage.", origin: .retrievedSource)
        #expect(attached.allSatisfy { $0.answerEvidence?.passages == ["Shared passage."] })
    }

    @Test func partialAnswerKeepsCitationAndUnitChecks() {
        let context = "[c001] (entry: Reference) Published reference value: 15 mg/kg."
        let answer = "Published reference value: 15 mg/kg [c001].\n\nI don't have a high-confidence source for neonatal monitoring.\n\n" + SystemPrompt.referenceFooter
        #expect(ResponseValidator().validate(answer, validCitationIDs: ["c001"], retrievedContext: context).isValid)
        #expect(!ResponseValidator().validate(answer.replacingOccurrences(of: "15 mg/kg", with: "15 mg"), validCitationIDs: ["c001"], retrievedContext: context).isValid)
    }
}
