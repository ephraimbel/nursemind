import Foundation
import Testing
@testable import NursemindCore

private final class AITransportFixture: @unchecked Sendable {
    static let shared = AITransportFixture()
    private let lock = NSLock()
    private var status = 200
    private var headers: [String: String] = [:]
    private var data = Data()
    private var count = 0

    func set(status: Int = 200, version: String? = AnthropicClient.contract, body: String) {
        lock.lock(); defer { lock.unlock() }
        self.status = status
        headers = version.map { ["x-nursemind-contract": $0] } ?? [:]
        data = Data(body.utf8)
        count = 0
    }

    func response() -> (Int, [String: String], Data) {
        lock.lock(); defer { lock.unlock() }
        count += 1
        return (status, headers, data)
    }

    var calls: Int { lock.lock(); defer { lock.unlock() }; return count }
}

private final class AIStubProtocol: URLProtocol, @unchecked Sendable {
    override class func canInit(with request: URLRequest) -> Bool { true }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest { request }
    override func startLoading() {
        let (status, headers, data) = AITransportFixture.shared.response()
        let response = HTTPURLResponse(url: request.url!, statusCode: status, httpVersion: "HTTP/1.1", headerFields: headers)!
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        client?.urlProtocol(self, didLoad: data)
        client?.urlProtocolDidFinishLoading(self)
    }
    override func stopLoading() {}
}

@Suite("Validated production transport", .serialized)
struct AITransportIntegrationTests {
    private func events(emptyLibrary: Bool = false) async throws -> [AskEvent] {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [AIStubProtocol.self]
        let session = URLSession(configuration: configuration)
        defer { session.invalidateAndCancel() }
        let source = CitationSource(id: "ref", shortName: "Reference", license: .publicDomain,
                                    url: "https://example.org", lastRetrieved: "2026-09-17")
        let entry = LibraryEntry.reference(ReferenceEntry(id: "monitoring", title: "Monitoring", eyebrow: "REFERENCE",
            sections: [.prose(title: "Assessment", .init("Monitoring reference information.", citationIDs: [source.id]))],
            citations: [source], lastSourceFidelityReview: "2026-09-17"))
        let client = AnthropicClient(proxyEndpoint: URL(string: "https://test.invalid/ai-chat")!, tokenProvider: { "test" }, urlSession: session)
        let service = AnthropicAskService(client: client, registry: ContentRegistry(entries: emptyLibrary ? [] : [entry]))
        var events: [AskEvent] = []
        for try await event in service.stream(question: "What monitoring matters?", conversationContext: []) { events.append(event) }
        return events
    }

    private func stream(_ text: String, finished: Bool = true) throws -> String {
        let event: [String: Any] = ["type": "content_block_delta", "delta": ["type": "text_delta", "text": text]]
        let data = try JSONSerialization.data(withJSONObject: event)
        var body = "data: \(String(decoding: data, as: UTF8.self))\n\n"
        if finished {
            body += "data: {\"type\":\"message_delta\",\"delta\":{\"stop_reason\":\"end_turn\"}}\n\ndata: {\"type\":\"message_stop\"}\n\n"
        }
        return body
    }

    @Test func releasesOnlyValidatedAnswerAndUsesOneClientRequest() async throws {
        let answer = "Monitoring is described in the reference [c001].\n\n" + SystemPrompt.referenceFooter
        AITransportFixture.shared.set(body: try stream(answer))
        let output = try await events()
        let text = output.compactMap { event -> String? in if case .delta(let text) = event { return text }; return nil }.joined()
        #expect(text == answer)
        #expect(AITransportFixture.shared.calls == 1)
    }

    @Test func citationFailureNeverLeaksPartialText() async throws {
        AITransportFixture.shared.set(body: try stream("Invented clinical detail [c099]."))
        let output = try await events()
        #expect(output.contains { if case .refusal(.lowConfidence, _) = $0 { return true }; return false })
        #expect(!output.contains { if case .delta = $0 { return true }; return false })
    }

    @Test func truncatedStreamNeverLeaksPartialText() async throws {
        AITransportFixture.shared.set(body: try stream("Monitoring reference [c001].", finished: false))
        let output = try await events()
        #expect(output.contains { if case .refusal(.serviceUnavailable, _) = $0 { return true }; return false })
        #expect(!output.contains { if case .delta = $0 { return true }; return false })
    }

    @Test func rejectsAnUnprotectedOldProxy() async throws {
        AITransportFixture.shared.set(version: nil, body: try stream("Monitoring reference [c001]."))
        let output = try await events()
        #expect(output.contains { if case .refusal(.serviceUnavailable, _) = $0 { return true }; return false })
        #expect(!output.contains { if case .delta = $0 { return true }; return false })
    }

    @Test func streamedStagesFollowUpsAndRefusalsReachTheView() async throws {
        let answer = "Monitoring is described in the reference [c001].\n\n" + SystemPrompt.referenceFooter
        let prelude = "event: stage\ndata: {\"type\":\"stage\",\"stage\":\"reading\",\"sources\":2}\n\nevent: stage\ndata: {\"type\":\"stage\",\"stage\":\"writing\"}\n\nevent: follow_ups\ndata: {\"type\":\"follow_ups\",\"questions\":[\"What monitoring matters next?\"]}\n\n"
        AITransportFixture.shared.set(body: prelude + (try stream(answer)))
        let output = try await events()
        let stages = output.compactMap { event -> String? in if case .stage(let label) = event { return label }; return nil }
        #expect(stages == ["Reading 2 sources…", "Writing…"])
        #expect(output.contains { if case .followUps(let questions) = $0 { return questions == ["What monitoring matters next?"] }; return false })
        #expect(output.contains { if case .delta(let text) = $0 { return text == answer }; return false })
        AITransportFixture.shared.set(body: "event: stage\ndata: {\"type\":\"stage\",\"stage\":\"reading\",\"sources\":1}\n\nevent: refusal\ndata: {\"type\":\"refusal\",\"refusal\":\"prescribing\"}\n\n")
        let refused = try await events()
        #expect(refused.contains { if case .refusal(.prescribing, _) = $0 { return true }; return false })
        #expect(!refused.contains { if case .delta = $0 { return true }; return false })
    }

    @Test func rendersServerSafetyRefusal() async throws {
        AITransportFixture.shared.set(status: 422, body: #"{"refusal":"prescribing"}"#)
        let output = try await events()
        #expect(output.contains { if case .refusal(.prescribing, _) = $0 { return true }; return false })
        #expect(!output.contains { if case .delta = $0 { return true }; return false })
    }
    @Test func emptyLibraryStillMakesRequestAndDisplaysExternalCitations() async throws {
        let evidence: [String: Any] = ["type": "evidence", "context": "[c001] pH 7.35–7.45; PaCO₂ 35–45 mm Hg; HCO₃ 22–26 mEq/L.",
            "sources": [["id": "c001", "shortName": "Arterial blood gas test", "publisher": "NLM", "license": "publicDomain", "url": "https://medlineplus.gov/lab-tests/arterial-blood-gas-abg-test/", "lastRetrieved": "2026-09-17"]]]
        let metadata = String(decoding: try JSONSerialization.data(withJSONObject: evidence), as: UTF8.self)
        let answer = "1. Check pH: 7.35–7.45 [c001].\n2. Check PaCO2: 35–45 mm Hg [c001].\n3. Check HCO3: 22–26 mEq/L [c001]."
        AITransportFixture.shared.set(body: "data: \(metadata)\n\n" + (try stream(answer)))
        let output = try await events(emptyLibrary: true)
        #expect(AITransportFixture.shared.calls == 1)
        #expect(output.contains { if case .delta(let text) = $0 { return text == answer }; return false })
        #expect(output.contains { if case .citations(let sources) = $0 { return sources.first?.publisher == "NLM" }; return false })
        #expect(output.contains { if case .libraryEntries(let ids) = $0 { return ids.isEmpty }; return false })
    }

}
