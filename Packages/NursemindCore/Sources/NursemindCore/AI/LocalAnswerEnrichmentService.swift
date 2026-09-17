import Foundation

/// Follow-up navigation does not need another model call or another copy of the conversation.
public struct LocalAnswerEnrichmentService: AnswerEnrichmentService {
    private let registry: ContentRegistry

    public init(registry: ContentRegistry = .shared) { self.registry = registry }

    public func enrich(question: String, answer: String) async -> AnswerEnrichment {
        guard let entry = registry.search(question, limit: 1).first else { return .empty }
        let topic = entry.title
        guard topic.count <= 55 else { return .empty }
        let followUps: [String]
        switch entry.category {
        case .drug, .drip:
            followUps = ["What monitoring does \(topic) require?", "Which \(topic) adverse effects warrant escalation?", "What teaching matters with \(topic)?"]
        case .lab:
            followUps = ["What can affect a \(topic) result?", "Which \(topic) findings warrant escalation?", "What assessments help interpret \(topic)?"]
        case .procedure:
            followUps = ["What preparation does \(topic) require?", "What complications accompany \(topic)?", "What documentation does \(topic) require?"]
        default:
            followUps = ["What assessments matter with \(topic)?", "Which \(topic) findings warrant escalation?", "What should I document about \(topic)?"]
        }
        let calculator = ToolsAvailability.calculatorsEnabled ? await MockCalculatorSuggester().suggest(for: question) : nil
        return AnswerEnrichment(followUps: followUps.filter { $0.caseInsensitiveCompare(question) != .orderedSame }, calculatorID: calculator)
    }
}
