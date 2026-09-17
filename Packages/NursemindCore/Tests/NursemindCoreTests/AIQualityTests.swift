import Foundation
import Testing
@testable import NursemindCore

private let evidence = CitationSource(id: "source-a", shortName: "Reference A", license: .publicDomain,
                                      url: "https://example.org/a", lastRetrieved: "2026-09-17")
private let evidenceB = CitationSource(id: "source-b", shortName: "Reference B", license: .ccBy4,
                                       url: "https://example.org/b", lastRetrieved: "2026-09-17")
private func reference(_ sections: [ReferenceSection], sources: [CitationSource] = [evidence, evidenceB]) -> LibraryEntry {
    .reference(ReferenceEntry(id: "sample", title: "Norepinephrine reference", eyebrow: "REFERENCE",
                              sections: sections, citations: sources, lastSourceFidelityReview: "2026-09-17"))
}

@Suite("Evidence passage retrieval")
struct AIPassageTests {
    @Test func retrievesLaterSectionsAndPreservesAttribution() {
        var sections = (0..<5).map { ReferenceSection.prose(title: "Background \($0)", .init("General reference background.", citationIDs: [evidence.id])) }
        sections.append(.bullets(title: "Extravasation", [
            .init("Extravasation assessment is described here.", citationIDs: [evidenceB.id]),
            .init("Unrelated teaching is described here.", citationIDs: [evidence.id]),
        ]))
        let result = RAGRetriever(registry: ContentRegistry(entries: [reference(sections)])).retrieve(for: "extravasation assessment")
        #expect(!result.confidenceFloor)
        #expect(result.formattedContext.contains("Norepinephrine reference"))
        let line = result.formattedContext.split(separator: "\n").first { $0.contains("Extravasation assessment") }
        #expect(line?.contains("Reference B") == true)
        #expect(line?.contains("Reference A") == false)
        #expect(result.validCitationIDs == ResponseValidator.citationIDs(in: result.formattedContext))
    }

    @Test func excludesUncitedAndDisplayOnlyPassages() {
        let restricted = CitationSource(id: "restricted", shortName: "Display only", license: .ccBy4WithAIRestriction,
                                        url: "https://example.org", lastRetrieved: "2026-09-17")
        let entry = reference([
            .prose(title: "Monitoring", .init("Uncited monitoring text.", citationIDs: [])),
            .prose(title: "Monitoring", .init("Restricted monitoring text.", citationIDs: [restricted.id])),
        ], sources: [restricted])
        let result = RAGRetriever(registry: ContentRegistry(entries: [entry])).retrieve(for: "monitoring")
        #expect(result.confidenceFloor)
        #expect(result.citations.isEmpty)
        #expect(result.entries.isEmpty)
    }

    @Test func contextBudgetNeverCutsClaimsInHalf() {
        let sections = (0..<80).map { ReferenceSection.prose(title: "Monitoring \($0)", .init(String(repeating: "Monitoring reference details. ", count: 80) + "END", citationIDs: [evidence.id])) }
        let result = RAGRetriever(registry: ContentRegistry(entries: [reference(sections)])).retrieve(for: "monitoring")
        #expect(result.formattedContext.count <= RAGRetriever.contextCharacterLimit)
        #expect(result.formattedContext.hasSuffix("END"))
    }

    @Test func followUpsUseContextButNewTopicsDoNot() {
        let history = [AskMessage(role: .user, content: "What monitoring does heparin require?")]
        #expect(RAGRetriever.retrievalQuery("What about bleeding?", history: history).contains("heparin"))
        #expect(RAGRetriever.retrievalQuery("Explain chest tube assessment", history: history) == "Explain chest tube assessment")
    }

    @Test func preservesAllSourcesForAnIndividualClaim() {
        let result = RAGRetriever(registry: ContentRegistry(entries: [reference([
            .prose(title: "Monitoring", .init("Monitoring reference details.", citationIDs: [evidence.id, evidenceB.id]))
        ])])).retrieve(for: "monitoring")
        #expect(result.formattedContext.hasPrefix("[c001] [c002]"))
        #expect(result.citations.count == 2)
    }
}

@Suite("Answer evidence gate")
struct AIValidationTests {
    @Test(arguments: [
        "The reference describes assessment [c099].",
        "The reference describes assessment [c1].",
        "The reference describes assessment [c001, c002].",
        "Monitor for adverse effects.",
        "A finding is described [c001].\nA different unsupported claim follows.",
        "A finding is described [c001]. An unrelated dose is 25 mg.",
        "Administer 25 mg [c001].",
        "For an 80 kg patient: 15 mg/kg × 80 kg = 1200 mg [c001].",
        "Call nurse@example.org for details [c001].",
        "",
    ])
    func blocksInvalidAnswers(_ answer: String) {
        #expect(!ResponseValidator().validate(answer, validCitationIDs: ["c001", "c002"]).isValid)
    }

    @Test func permitsConciseFullyCitedAnswers() {
        let answer = "The reference describes monitoring [c001].\n\n## Assessment\n- **Findings**: Assessment is described in the reference [c002].\n\n" + SystemPrompt.referenceFooter
        #expect(ResponseValidator().validate(answer, validCitationIDs: ["c001", "c002"]).isValid)
    }

    @Test func historyIsScrubbedAndOldCitationIDsAreRemoved() {
        let history = AnthropicAskService.formatHistory([
            AskMessage(role: .user, content: "MRN 123456, nurse@example.org asks about monitoring"),
            AskMessage(role: .assistant, content: "Old answer [c099]."),
            AskMessage(role: .assistant, content: "Unfinished", isStreaming: true),
        ])
        #expect(!history.contains("123456"))
        #expect(!history.contains("nurse@example.org"))
        #expect(!history.contains("c099"))
        #expect(!history.contains("Unfinished"))
    }
}

@Suite("AI transport completion")
struct AIStreamTests {
    @Test func requiresCompletedMessage() throws {
        var parser = MessageStreamParser()
        let text = try parser.consume(#"data: {"type":"content_block_delta","delta":{"type":"text_delta","text":"Partial"}}"#)
        #expect(text == "Partial")
        #expect(!parser.isComplete)
        _ = try parser.consume(#"data: {"type":"message_delta","delta":{"stop_reason":"end_turn"}}"#)
        #expect(!parser.isComplete)
        _ = try parser.consume(#"data: {"type":"message_stop"}"#)
        #expect(parser.isComplete)
    }

    @Test(arguments: [
        #"data: {"type":"error","error":{"type":"overloaded_error"}}"#,
        #"data: {"type":"message_delta","delta":{"stop_reason":"max_tokens"}}"#,
        #"data: {"type":"message_delta","delta":{"stop_reason":"refusal"}}"#,
        "data: {bad json",
    ])
    func rejectsFailedOrTruncatedStreams(_ line: String) {
        var parser = MessageStreamParser()
        #expect(throws: (any Error).self) { _ = try parser.consume(line) }
    }
}

@Suite("AI privacy input patterns")
struct AIPrivacyTests {
    @Test(arguments: ["MRN 123456", "mrn: 123456", "(312) 555-0199", "+1 312-555-0199", "nurse@example.org", "DOB: 2000-02-01", "room 123A", "John Smith reports dizziness"])
    func removesIdentifiers(_ input: String) {
        #expect(PHIScrubber.scrub(input).redacted)
        #expect(PHIScrubber.scrub(input).scrubbed != input)
    }

    @Test(arguments: ["MAP > 65", "1000 mL bolus", "normal sodium 135–145 mEq/L", "vancomycin monitoring"])
    func preservesClinicalQuestions(_ input: String) {
        #expect(!PHIScrubber.scrub(input).redacted)
    }
}

@Suite("Clinical retrieval evaluation")
struct AIClinicalRetrievalTests {
    @Test func bedsideQuestionCoverageAndContextBudget() {
        let retriever = RAGRetriever()
        let cases: [(String, String)] = [
            ("norepinephrine extravasation assessment", "norepinephrine"),
            ("heparin thrombocytopenia monitoring", "heparin"),
            ("digoxin toxicity nursing monitoring", "digoxin"),
            ("chest tube air leak assessment", "chest"),
            ("tracheostomy obstruction assessment", "tracheostomy"),
            ("vancomycin renal monitoring", "vancomycin"),
            ("blood transfusion reaction recognition", "transfusion"),
            ("DKA potassium monitoring", "potassium"),
            ("pressure injury prevention", "pressure"),
            ("vancomcin monitoring", "vancomycin"),
        ]
        let start = ContinuousClock.now
        for (question, expected) in cases {
            let result = retriever.retrieve(for: question)
            #expect(!result.confidenceFloor, "No evidence for \(question)")
            #expect(result.formattedContext.localizedCaseInsensitiveContains(expected), "Missing \(expected) for \(question)")
            #expect(result.formattedContext.count <= RAGRetriever.contextCharacterLimit)
            if question.contains("vancomcin") {
                #expect(result.entries.first?.title.localizedCaseInsensitiveContains("vancomycin") == true)
                #expect(!result.entries.contains { $0.id == "communication:cross-monitoring" })
            }
            print("AI_RETRIEVAL \(question) | \(result.formattedContext.count) characters | \(result.entries.map(\.id).joined(separator: ","))")
        }
        print("AI_RETRIEVAL_TOTAL \(start.duration(to: .now))")
    }
}

@Suite("Server evidence manifest export")
struct AIEvidenceManifestTests {
    @Test func exportCurrentLibraryFingerprints() throws {
        let fingerprints = RAGRetriever().evidenceFingerprints()
        #expect(fingerprints.count > 500)
        #expect(fingerprints.allSatisfy { $0.count == 64 })
        let exportDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        try FileManager.default.createDirectory(at: exportDirectory, withIntermediateDirectories: true)
        let url = exportDirectory.appendingPathComponent("nursemind-ai-evidence-sha256.json")
        try JSONEncoder().encode(fingerprints).write(to: url, options: .atomic)
        print("AI_EVIDENCE_MANIFEST \(url.path) | \(fingerprints.count) passages")
        for (name, question) in [("request", "norepinephrine extravasation assessment"), ("abg", "How do I read an ABG quickly?")] {
            let rag = RAGRetriever().retrieve(for: question)
            let request = AnthropicClient.CachedRequest(model: AnthropicClient.Model.haiku45.rawValue, max_tokens: 1400,
                temperature: 0.1, system: [.init(text: SystemPrompt.staticPrefix, cached: false),
                    .init(text: SystemPrompt.buildDynamic(retrievedContext: rag.formattedContext, conversationHistory: "", careerStage: nil, units: []), cached: false)],
                messages: [.init(role: "user", content: question)], stream: true)
            let fixture = exportDirectory.appendingPathComponent("nursemind-ai-\(name)-fixture.json")
            try JSONEncoder().encode(request).write(to: fixture, options: .atomic)
            print("AI_REQUEST_FIXTURE \(fixture.path)")
        }
    }
}

@Suite("Claim values match cited evidence")
struct AIClaimSupportTests {
    @Test func citationsDoNotLaunderNumbersOrUnits() {
        let context = "[c001] (entry: Reference; source: Label) Published value is 15 mg/kg.\n[c002] Another reference lists 25 mcg."
        for answer in ["Published value is 25 mg/kg [c001].", "Published value is 15 mg [c001].", "Published value is 25 mg [c002]."] {
            #expect(!ResponseValidator().validate(answer, validCitationIDs: ["c001", "c002"], retrievedContext: context).isValid)
        }
        #expect(ResponseValidator().validate("Published value is 15 mg/kg [c001].", validCitationIDs: ["c001"], retrievedContext: context).isValid)
    }
}

@Suite("Useful cited explanations")
struct AIExplanationTests {
    @Test func equivalentRangeAndDecimalFormatsRemainSupported() {
        let context = "[c001] PaCO2 35–45 mmHg; critical pH greater than 7.60."
        #expect(ResponseValidator().validate("The range extends from 35 mmHg to 45 mmHg [c001].\nThe critical pH exceeds 7.6 [c001].", validCitationIDs: ["c001"], retrievedContext: context).isValid)
        #expect(!ResponseValidator().validate("The lower endpoint is 35 mg [c001].", validCitationIDs: ["c001"], retrievedContext: context).isValid)
    }
    @Test func numberedABGExplanationUsesClinicalNumbersOnly() {
        let context = "[c001] pH 7.35–7.45; PaCO₂ 35–45 mm Hg; HCO₃ 22–26 mEq/L. Respiratory opposite, metabolic equal."
        let answer = "1. Check pH: 7.35–7.45 [c001].\n2. Check PaCO2: 35–45 mm Hg [c001].\n3. Check HCO3: 22–26 mEq/L [c001]."
        #expect(ResponseValidator().validate(answer, validCitationIDs: ["c001"], retrievedContext: context).isValid)
        #expect(ResponseValidator().validate("**Quick ABG check**\n" + answer.replacingOccurrences(of: "1. Check", with: "**1.** Check"), validCitationIDs: ["c001"], retrievedContext: context).isValid)
        #expect(!ResponseValidator().validate(answer.replacingOccurrences(of: "22–26", with: "12–26"), validCitationIDs: ["c001"], retrievedContext: context).isValid)
    }
}
