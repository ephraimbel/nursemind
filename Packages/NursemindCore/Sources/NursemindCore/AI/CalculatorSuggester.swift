import Foundation

/// Detects when a user's question maps cleanly to one of the bundled calculators.
/// Returns a single calculator id (or nil). Used to surface a "Calculate this"
/// affordance pinned above the AI answer — bundles the AI surface with the tools
/// surface, which is core to the NurseMind moat.
public protocol CalculatorSuggester: Sendable {
    func suggest(for question: String) async -> String?
}

public struct AnthropicCalculatorSuggester: CalculatorSuggester {
    private let client: AnthropicClient
    private let catalog: String

    public init(client: AnthropicClient) {
        self.client = client
        self.catalog = Self.buildCatalog()
    }

    public func suggest(for question: String) async -> String? {
        let system = """
        You decide whether a nurse's question maps to one of the calculators below. Output STRICT JSON: {"id": "<calculator-id>"} or {"id": null}. No prose, no markdown.

        Choose an id ONLY if the user is clearly asking to compute or estimate that specific value (e.g., "what's the MAP for BP 110/60?", "calculate GFR for this patient", "how do I compute anion gap?"). Do NOT match for prose questions that merely mention the metric ("when do I escalate by MAP?", "what are MAP targets in sepsis?" — both should return null).

        AVAILABLE CALCULATORS:
        \(catalog)
        """

        do {
            let raw = try await client.completeMessage(
                model: .haiku45,
                system: system,
                messages: [AnthropicClient.Message(role: "user", content: question)],
                maxTokens: 32,
                temperature: 0.0
            )
            return parse(raw)
        } catch {
            return nil
        }
    }

    private func parse(_ raw: String) -> String? {
        let trimmed = raw
            .replacingOccurrences(of: "```json", with: "")
            .replacingOccurrences(of: "```", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        struct Payload: Decodable { let id: String? }
        guard let data = trimmed.data(using: .utf8),
              let decoded = try? JSONDecoder().decode(Payload.self, from: data),
              let id = decoded.id?.trimmingCharacters(in: .whitespacesAndNewlines),
              !id.isEmpty,
              CalculatorRegistry.entry(byID: id) != nil else {
            return nil
        }
        return id
    }

    /// Build a compact catalog string from the registry: `id — title (subtitle)`.
    /// Keeps the prompt small enough that Haiku can match without burning tokens.
    private static func buildCatalog() -> String {
        CalculatorRegistry.all
            .map { "- \($0.id) — \($0.title) (\($0.subtitle))" }
            .joined(separator: "\n")
    }
}

/// Local keyword fallback when no API key is configured. Covers the most common
/// nurse-asked calculators with simple substring matching.
public struct MockCalculatorSuggester: CalculatorSuggester {
    public init() {}

    public func suggest(for question: String) async -> String? {
        let q = question.lowercased()
        let keywords: [(id: String, terms: [String])] = [
            ("map",        ["calculate map", "what's the map", "what is the map", "compute map", "mean arterial pressure for"]),
            ("gfr",        ["calculate gfr", "estimate gfr", "egfr for", "compute gfr"]),
            ("anion-gap",  ["calculate anion gap", "compute anion gap", "what's the anion gap"]),
            ("bmi",        ["calculate bmi", "what's the bmi", "compute bmi"]),
            ("bsa",        ["calculate bsa", "body surface area for", "compute bsa"]),
            ("ibw",        ["ideal body weight for", "calculate ibw"]),
            ("pf-ratio",   ["calculate p/f", "what's the p/f ratio", "pao2/fio2 for"]),
            ("corrected-na", ["correct sodium for", "corrected sodium for"]),
            ("corrected-ca", ["correct calcium for", "corrected calcium for"])
        ]
        for entry in keywords {
            if entry.terms.contains(where: { q.contains($0) }),
               CalculatorRegistry.entry(byID: entry.id) != nil {
                return entry.id
            }
        }
        return nil
    }
}
