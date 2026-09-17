import Foundation

struct MessageStreamParser {
    private var stopReason: String?
    private var receivedStop = false
    private(set) var evidence: ExternalAnswerEvidence?
    private var receivedText = false
    var isComplete: Bool { receivedStop && stopReason == "end_turn" }

    mutating func consume(_ line: String) throws -> String? {
        guard line.hasPrefix("data:") else { return nil }
        let payload = line.dropFirst(5).trimmingCharacters(in: .whitespaces)
        guard payload != "[DONE]", let data = payload.data(using: .utf8) else { return nil }
        struct Event: Decodable {
            struct Delta: Decodable { let type: String?; let text: String?; let stop_reason: String? }
            let type: String
            let delta: Delta?
        }
        let event = try JSONDecoder().decode(Event.self, from: data)
        guard !receivedStop else { throw AnthropicClient.ClientError.invalidResponse }
        switch event.type {
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
