import Foundation

/// Generates 3 short follow-up questions a working nurse might ask after reading
/// an answer. Uses Claude Haiku — cheap, fast, fires once per completed answer.
public protocol FollowUpService: Sendable {
    func suggest(question: String, answer: String) async -> [String]
}

public struct AnthropicFollowUpService: FollowUpService {
    private let client: AnthropicClient

    public init(client: AnthropicClient) {
        self.client = client
    }

    public func suggest(question: String, answer: String) async -> [String] {
        let system = """
        You generate exactly 3 short follow-up questions a bedside nurse might ask after reading the answer below. Output strict JSON: {"followups":["...","...","..."]}. No prose, no markdown, no commentary.

        RULES:
        - Each question is 4–10 words. Concrete and clinical.
        - Each builds naturally from the answer (deeper detail, edge case, or related action) — do NOT repeat the original question.
        - Phrase as a nurse asking, not a student. Use clinical shorthand where it fits ("MAP", "vasopressor", "extravasation", "K+", "GCS").
        - Avoid generic ones like "Can you tell me more?" or "What else should I know?". Be specific.
        - Never propose questions that would cross into diagnosing or prescribing.
        """

        let payload = """
        Original question:
        \(question)

        Answer the nurse just read:
        \(answer)

        Return JSON with exactly 3 follow-ups.
        """

        do {
            let raw = try await client.completeMessage(
                model: .haiku45,
                system: system,
                messages: [AnthropicClient.Message(role: "user", content: payload)],
                maxTokens: 256,
                temperature: 0.4
            )
            return parse(raw)
        } catch {
            return []
        }
    }

    /// Parse `{"followups":["...","...","..."]}` and tolerate stray markdown
    /// fences if the model wraps the response despite the system prompt.
    private func parse(_ raw: String) -> [String] {
        let trimmed = raw
            .replacingOccurrences(of: "```json", with: "")
            .replacingOccurrences(of: "```", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        struct Payload: Decodable { let followups: [String] }
        guard let data = trimmed.data(using: .utf8),
              let decoded = try? JSONDecoder().decode(Payload.self, from: data) else {
            return []
        }

        let cleaned = decoded.followups
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        return Array(cleaned.prefix(3))
    }
}

/// Mock that returns a small set of plausible follow-ups based on simple keyword
/// detection in the answer. Used when Anthropic key isn't configured.
public struct MockFollowUpService: FollowUpService {
    public init() {}

    public func suggest(question: String, answer: String) async -> [String] {
        let lower = answer.lowercased()
        if lower.contains("norepinephrine") || lower.contains("vasopressor") {
            return [
                "When do I add a second vasopressor?",
                "Signs of norepi extravasation?",
                "MAP target in septic shock?"
            ]
        }
        if lower.contains("potassium") || lower.contains("k+") {
            return [
                "EKG changes with K+ > 6.5?",
                "How fast can I run IV potassium?",
                "What if it's hemolyzed?"
            ]
        }
        if lower.contains("bipap") || lower.contains("hfnc") {
            return [
                "Indications to switch BiPAP to intubation?",
                "How to wean HFNC safely?",
                "Watch-fors during BiPAP titration?"
            ]
        }
        return [
            "What should I monitor next?",
            "Common pitfalls to avoid?",
            "When do I escalate?"
        ]
    }
}
