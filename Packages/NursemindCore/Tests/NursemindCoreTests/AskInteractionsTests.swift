import Foundation
import Testing
@testable import NursemindCore

private func source(_ n: Int, retrieved: String = "2026-05-03") -> CitationSource {
    CitationSource(id: "s\(n)", shortName: "Open RN \(n)", license: .ccBy4, url: "https://example.org/\(n)", lastRetrieved: retrieved)
}

@Suite("Bedside trio block")
struct BedsideBlockTests {
    @Test func rowsUnderTheFixedHeadingBecomeTheBedsideBlock() {
        let content = "Lead [c001].\n\n## At the bedside\n| Assess now | Check the rhythm strip [c001] |\n| Watch for | Peaked T waves [c001] |\n| Escalate when | QRS widens [c002] |\n\n## Reference values\n| Normal | 3.5 – 5.0 mEq/L [c001] |\n| Low | < 3.5 mEq/L [c001] |"
        let blocks = ContentBlockParser.parse(content: content, citations: [source(1), source(2)])
        guard case .bedside(let rows)? = blocks.dropFirst().first else { Issue.record("expected bedside after the lede: \(blocks)"); return }
        #expect(rows.map(\.key) == ["Assess now", "Watch for", "Escalate when"])
        #expect(rows[2].citation?.0.id == "s2")
        #expect(!blocks.contains { if case .header(let t) = $0 { return t == "At the bedside" } else { return false } })
        guard case .table? = blocks.last else { Issue.record("a later table stays a table"); return }
    }
}

@Suite("Source peek")
struct SourcePeekTests {
    @Test func claimIsTheSentenceThePillEnds() {
        #expect(MessageBodyView.claim(before: "Normal is 3.5–5.0 mEq/L. Critical high is above 6.5 mEq/L ") == "Critical high is above 6.5 mEq/L")
        #expect(MessageBodyView.claim(before: "**Potassium** is measured in serum ") == "Potassium is measured in serum")
        #expect(MessageBodyView.claim(before: "Check the pH (7.35 to 7.45) and ") == "Check the pH (7.35 to 7.45) and")
        #expect(MessageBodyView.claim(before: "   ") == "")
    }

    @Test func passagesRankByNumbersThenWords() {
        let passages = ["Hold potassium supplements if hyperkalemic.", "Reference range: > 6.5 mEq/L — Critical high", "Watch for coexisting hypomagnesemia."]
        let ranked = CitationCardView.rankedPassages(passages, for: "Critical high is above 6.5 mEq/L")
        #expect(ranked.first?.text == passages[1])
        #expect(ranked.first?.score ?? 0 > 0)
        #expect(CitationCardView.rankedPassages(passages, for: nil).map(\.text) == passages)
        #expect(CitationCardView.rankedPassages(passages, for: nil).allSatisfy { $0.score == 0 })
    }

    @Test func evidenceKeepsTheEntryTitleAndDecodesWithoutIt() throws {
        let context = "[c001] (entry: Potassium (K⁺); source: Open RN (retrieved 2026-05-03)) Reference range: 3.5 – 5.0 mEq/L — Normal\n[c001] (entry: Potassium (K⁺); source: Open RN) Watch for hypomagnesemia."
        let attached = AnswerCitationEvidence.attaching(to: [source(1)], context: context, origin: .librarySummary)
        #expect(attached[0].answerEvidence?.entryTitles == ["Potassium (K⁺)"])
        #expect(attached[0].answerEvidence?.passages.count == 2)
        let legacy = try JSONDecoder().decode(AnswerCitationEvidence.self, from: Data(#"{"origin":"librarySummary","passages":["a"]}"#.utf8))
        #expect(legacy.entryTitles.isEmpty)
    }
}

@Suite("Provenance strip")
struct ProvenanceStripTests {
    @Test func summarizesEntriesSourcesAndTheNewestRetrievalMonth() {
        var message = AskMessage(role: .assistant, content: "x", citations: [source(1, retrieved: "2026-05-03"), source(2, retrieved: "2026-07-13")])
        message.libraryEntryIDs = ["lab:potassium", "drug:potassium-chloride"]
        #expect(ProvenanceStrip.summary(for: message) == "2 library entries · 2 sources")
        #expect(ProvenanceStrip.retrievedText(for: message.citations) == "retrieved July 2026")
        let single = AskMessage(role: .assistant, content: "x", citations: [source(1, retrieved: "not a date")])
        #expect(ProvenanceStrip.summary(for: single) == "1 source")
        #expect(ProvenanceStrip.retrievedText(for: single.citations) == nil)
        var external = source(3)
        external.answerEvidence = .init(origin: .retrievedSource, passages: ["p"])
        #expect(ProvenanceStrip.summary(for: AskMessage(role: .assistant, content: "x", citations: [external])) == "1 retrieved source")
    }
}

@Suite("Block reveal and stages")
struct BlockRevealTests {
    @Test func unitsAreWholeLinesWithTheirBlankLines() {
        let buffer = "Lede [c001].\n\n## Title\n| a | b [c001] |\n| c | d"
        let first = AskViewModel.nextRevealUnit(in: buffer, streamEnded: false)
        #expect(first?.unit == "Lede [c001].\n\n")
        let second = AskViewModel.nextRevealUnit(in: first!.rest, streamEnded: false)
        #expect(second?.unit == "## Title\n")
        let third = AskViewModel.nextRevealUnit(in: second!.rest, streamEnded: false)
        #expect(third?.unit == "| a | b [c001] |\n")
        #expect(AskViewModel.nextRevealUnit(in: third!.rest, streamEnded: false) == nil)
        #expect(AskViewModel.nextRevealUnit(in: third!.rest, streamEnded: true)?.unit == "| c | d")
        #expect(AskViewModel.nextRevealUnit(in: "", streamEnded: true) == nil)
    }

    @Test func stageLabelsReadAsPlainProgress() {
        #expect(AnthropicAskService.stageLabel("reading", sources: 0) == "Searching for sources…")
        #expect(AnthropicAskService.stageLabel("reading", sources: 1) == "Reading 1 source…")
        #expect(AnthropicAskService.stageLabel("reading", sources: 9) == "Reading 9 sources…")
        #expect(AnthropicAskService.stageLabel("checking", sources: nil) == "Checking against the sources…")
        #expect(AnthropicAskService.stageLabel("unknown", sources: nil) == "Finding a supported answer…")
    }

    @Test func streamParserSurfacesStagesFollowUpsAndStreamedRefusals() throws {
        var parser = MessageStreamParser()
        _ = try parser.consume(#"data: {"type":"stage","stage":"reading","sources":3}"#)
        _ = try parser.consume(#"data: {"type":"follow_ups","questions":["What next?"]}"#)
        let events = parser.drainPending()
        #expect(events.count == 2)
        if case .stage(let stage, let sources) = events[0] { #expect(stage == "reading" && sources == 3) } else { Issue.record("stage") }
        if case .followUps(let questions) = events[1] { #expect(questions == ["What next?"]) } else { Issue.record("follow-ups") }
        #expect(parser.drainPending().isEmpty)
        #expect(!parser.isComplete)
        _ = try parser.consume(#"data: {"type":"refusal","refusal":"prescribing"}"#)
        if case .refusal(let raw) = parser.drainPending().first { #expect(raw == "prescribing") } else { Issue.record("refusal") }
        #expect(parser.isComplete)
        #expect(throws: (any Error).self) { _ = try parser.consume(#"data: {"type":"content_block_delta","delta":{"type":"text_delta","text":"late"}}"#) }
        var after = MessageStreamParser()
        _ = try after.consume(#"data: {"type":"content_block_delta","delta":{"type":"text_delta","text":"hi"}}"#)
        #expect(throws: (any Error).self) { _ = try after.consume(#"data: {"type":"stage","stage":"writing"}"#) }
    }
}
