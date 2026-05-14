import Foundation

/// Post-answer enrichment bundle. Holds the two pieces of metadata we surface
/// below a completed AI answer: follow-up question chips and an optional
/// calculator handoff suggestion. Replaces what used to be two separate
/// Anthropic calls (`FollowUpService` + `CalculatorSuggester`) with one
/// structured-output call — ~$0.0012 saved per user question, ~10% of total
/// AI cost per Ask.
public struct AnswerEnrichment: Sendable, Equatable {
    public let followUps: [String]
    public let calculatorID: String?

    public init(followUps: [String], calculatorID: String?) {
        self.followUps = followUps
        self.calculatorID = calculatorID
    }

    public static let empty = AnswerEnrichment(followUps: [], calculatorID: nil)
}

/// Produces an `AnswerEnrichment` for a (question, answer) pair. Called once
/// after the primary generation completes, by `AskViewModel.send()`. The
/// merge of follow-up suggestion and calculator detection into a single
/// Anthropic call is a deliberate cost-reduction — both inputs were already
/// "question + answer" (calculator can use the answer for higher-accuracy
/// matching too), the system prompts overlap on framing, and the outputs are
/// small enough to coexist in one JSON response.
public protocol AnswerEnrichmentService: Sendable {
    func enrich(question: String, answer: String) async -> AnswerEnrichment
}

/// Live implementation: one Haiku 4.5 call, structured JSON output.
public struct AnthropicAnswerEnrichmentService: AnswerEnrichmentService {
    private let client: AnthropicClient
    private let catalog: String

    public init(client: AnthropicClient) {
        self.client = client
        self.catalog = Self.buildCatalog()
    }

    public func enrich(question: String, answer: String) async -> AnswerEnrichment {
        let system = """
        You produce two pieces of post-answer metadata for a nurse who just read an AI reference response. Output STRICT JSON, no prose, no markdown:

        {"followups":["...","...","..."],"calculator":"<id-or-null>"}

        FOLLOWUPS — exactly 3 short follow-up questions a working nurse might ask after reading the answer:
        - Each is 4–10 words. Concrete and clinical.
        - Each builds naturally from the answer (deeper detail, edge case, or related action) — do NOT repeat the original question.
        - Phrase as a nurse asking, not a student. Use clinical shorthand where it fits ("MAP", "vasopressor", "extravasation", "K+", "GCS").
        - Avoid generic ones like "Can you tell me more?" or "What else should I know?". Be specific.
        - Never propose questions that would cross into diagnosing or prescribing.

        CALCULATOR — id of ONE calculator from the catalog below if the user's question or the AI's answer makes a concrete computation appropriate (e.g., "what's the MAP for BP 110/60?", or the answer says "calculate GFR…"). Otherwise null.
        - Match ONLY when computation is the actual ask. Prose questions that merely mention a metric ("when do I escalate by MAP?", "what are MAP targets in sepsis?") return null.
        - The id must exactly match an entry from the catalog. If unsure, return null.

        AVAILABLE CALCULATORS:
        \(catalog)
        """

        let payload = """
        Original question:
        \(question)

        Answer the nurse just read:
        \(answer)

        Return the JSON described above.
        """

        do {
            let raw = try await client.completeMessage(
                model: .haiku45,
                system: system,
                messages: [AnthropicClient.Message(role: "user", content: payload)],
                maxTokens: 300,
                temperature: 0.4
            )
            return parse(raw)
        } catch {
            return .empty
        }
    }

    /// Parse `{"followups":["...","...","..."],"calculator":"<id>"|null}`.
    /// Tolerant of stray markdown fences if the model wraps the response
    /// despite the system prompt's explicit instruction.
    private func parse(_ raw: String) -> AnswerEnrichment {
        let trimmed = raw
            .replacingOccurrences(of: "```json", with: "")
            .replacingOccurrences(of: "```", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        struct Payload: Decodable {
            let followups: [String]?
            let calculator: String?
        }

        guard let data = trimmed.data(using: .utf8),
              let decoded = try? JSONDecoder().decode(Payload.self, from: data) else {
            return .empty
        }

        let cleanedFollowUps = (decoded.followups ?? [])
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .prefix(3)

        let calculatorID: String? = {
            guard let candidate = decoded.calculator?
                .trimmingCharacters(in: .whitespacesAndNewlines),
                  !candidate.isEmpty,
                  candidate.lowercased() != "null",
                  CalculatorRegistry.entry(byID: candidate) != nil else {
                return nil
            }
            return candidate
        }()

        return AnswerEnrichment(
            followUps: Array(cleanedFollowUps),
            calculatorID: calculatorID
        )
    }

    /// Compact calculator catalog used inside the system prompt. Keeping it
    /// short matters here: every token in the system prompt costs on every
    /// call, and Haiku's structured-output reliability degrades when the
    /// catalog grows past a few hundred lines.
    private static func buildCatalog() -> String {
        CalculatorRegistry.all
            .map { "- \($0.id) — \($0.title) (\($0.subtitle))" }
            .joined(separator: "\n")
    }
}

/// Mock used when no Anthropic API key is configured (preview, dev without
/// key, offline). Delegates to the existing keyword-based mocks so the
/// preview/test surface continues to produce non-empty output.
public struct MockAnswerEnrichmentService: AnswerEnrichmentService {
    public init() {}

    public func enrich(question: String, answer: String) async -> AnswerEnrichment {
        let followUps = await MockFollowUpService().suggest(question: question, answer: answer)
        let calculator = await MockCalculatorSuggester().suggest(for: question)
        return AnswerEnrichment(followUps: followUps, calculatorID: calculator)
    }
}
