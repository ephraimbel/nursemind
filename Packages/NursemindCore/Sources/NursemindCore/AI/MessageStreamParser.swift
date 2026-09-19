import Foundation

struct MessageStreamParser {
    private var stopReason: String?
    private var receivedStop = false
    private(set) var evidence: ExternalAnswerEvidence?
    private var receivedText = false
    private var refused = false
    /// Events other than text that arrived with the last consumed line.
    private(set) var pending: [AnswerStreamEvent] = []
    var isComplete: Bool { refused || (receivedStop && stopReason == "end_turn") }

    mutating func drainPending() -> [AnswerStreamEvent] {
        defer { pending.removeAll() }
        return pending
    }

    mutating func consume(_ line: String) throws -> String? {
        guard line.hasPrefix("data:") else { return nil }
        let payload = line.dropFirst(5).trimmingCharacters(in: .whitespaces)
        guard payload != "[DONE]", let data = payload.data(using: .utf8) else { return nil }
        struct Event: Decodable {
            struct Delta: Decodable { let type: String?; let text: String?; let stop_reason: String? }
            let type: String
            let delta: Delta?
            let stage: String?
            let questions: [String]?
            let refusal: String?
        }
        // The evidence event also carries "sources" (an array), so the stage
        // count is decoded only for stage events.
        struct StageEvent: Decodable { let sources: Int? }
        let event = try JSONDecoder().decode(Event.self, from: data)
        guard !receivedStop, !refused else { throw AnthropicClient.ClientError.invalidResponse }
        switch event.type {
        case "stage":
            guard !receivedText, let stage = event.stage, stage.count <= 24 else { throw AnthropicClient.ClientError.invalidResponse }
            let sources = (try? JSONDecoder().decode(StageEvent.self, from: data))?.sources
            pending.append(.stage(stage, sources: sources))
        case "follow_ups":
            guard let questions = event.questions, questions.count <= 3,
                  questions.allSatisfy({ !$0.isEmpty && $0.count <= 90 }) else { throw AnthropicClient.ClientError.invalidResponse }
            pending.append(.followUps(questions))
        case "refusal":
            guard !receivedText, let refusal = event.refusal, refusal.count <= 32 else { throw AnthropicClient.ClientError.invalidResponse }
            refused = true
            pending.append(.refusal(refusal))
        case "evidence":
            guard evidence == nil, !receivedText else { throw AnthropicClient.ClientError.invalidResponse }
            let decoded = try JSONDecoder().decode(ExternalAnswerEvidence.self, from: data)
            guard decoded.isValid else { throw AnthropicClient.ClientError.invalidResponse }
            evidence = decoded
        case "error": throw AnthropicClient.ClientError.invalidResponse
        case "message_delta":
            stopReason = event.delta?.stop_reason
            if stopReason != nil && stopReason != "end_turn" { throw AnthropicClient.ClientError.invalidResponse }
        case "message_stop": receivedStop = true
        case "content_block_delta":
            if event.delta?.type == "text_delta" { receivedText = true; return event.delta?.text }
        default: break
        }
        return nil
    }
}
