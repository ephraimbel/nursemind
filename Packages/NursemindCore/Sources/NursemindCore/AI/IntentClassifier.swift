import Foundation

/// Classifies a nurse question before generation. Uses Claude Haiku — cheap and fast.
/// Goal: cut diagnostic/prescribing/non-clinical questions BEFORE we spend a Sonnet call.
public struct IntentClassifier: Sendable {
    public enum Intent: String, Sendable {
        case nursingClinical    = "nursing_clinical"
        case diagnosticRequest  = "diagnostic_request"
        case prescribingRequest = "prescribing_request"
        case patientFacing      = "patient_facing"
        case nonClinical        = "non_clinical"
        case lowClarity         = "low_clarity"

        public var refusal: RefusalType? {
            switch self {
            case .nursingClinical:    return nil
            case .diagnosticRequest:  return .diagnostic
            case .prescribingRequest: return .prescribing
            case .patientFacing:      return .patientFacing
            case .nonClinical:        return .nonClinical
            case .lowClarity:         return .lowConfidence
            }
        }
    }

    private let client: AnthropicClient

    public init(client: AnthropicClient) {
        self.client = client
    }

    public func classify(_ question: String) async -> Intent {
        // System prompt: ask for one-word output, nothing else.
        let system = """
        You classify nurse questions into one of six categories. Output ONLY the category name as a single word with no punctuation, no quotation marks, no explanation. The categories are:

        nursing_clinical — questions about drugs, drips, labs, procedures, scenarios, assessments, equipment, vital signs, normal ranges, or any nursing action. The DEFAULT for ~95% of cases. This includes broad questions like "what's the normal heart rate?", "what does a high lactate mean?", "how do I assess pain?" — these are valid clinical reference questions even without patient specifics.
        diagnostic_request — the user is asking what a SPECIFIC patient has, or whether the SPECIFIC patient has condition X. Generic "what causes hyperkalemia?" is nursing_clinical, NOT diagnostic.
        prescribing_request — the user is asking you to decide what medication or what dose to give to a specific patient. Generic "what's the typical dose of vancomycin?" is nursing_clinical, NOT prescribing.
        patient_facing — the user appears to be a patient or family member asking about themselves, not a nurse asking for reference.
        non_clinical — clearly off-topic, personal, or not related to nursing practice (weather, sports, the app itself).
        low_clarity — only use when the question is genuinely incoherent or empty. A short question like "normal heart rate?" is NOT low_clarity — it's nursing_clinical.

        When in doubt between nursing_clinical and any other category, choose nursing_clinical.

        Output exactly one of: nursing_clinical, diagnostic_request, prescribing_request, patient_facing, non_clinical, low_clarity.
        """
        let messages = [AnthropicClient.Message(role: "user", content: question)]

        do {
            let raw = try await client.completeMessage(
                model: .haiku45,
                system: system,
                messages: messages,
                maxTokens: 16,
                temperature: 0.0
            )
            let cleaned = raw
                .lowercased()
                .components(separatedBy: CharacterSet.whitespacesAndNewlines).joined()
                .components(separatedBy: ".").joined()
                .components(separatedBy: ",").joined()
            if let intent = Intent(rawValue: cleaned) {
                return intent
            }
            // Fall through to keyword classifier on parse failure
            return MockAskService.classifyRefusal(question).map(Self.intent(forMockRefusal:)) ?? .nursingClinical
        } catch {
            // Fail closed — but proceed with nursing_clinical because over-refusal also harms users.
            // Local keyword classifier catches obvious refusals.
            if let mock = MockAskService.classifyRefusal(question) {
                return Self.intent(forMockRefusal: mock)
            }
            return .nursingClinical
        }
    }

    private static func intent(forMockRefusal type: RefusalType) -> Intent {
        switch type {
        case .diagnostic:         return .diagnosticRequest
        case .prescribing:        return .prescribingRequest
        case .patientFacing:      return .patientFacing
        case .nonClinical:        return .nonClinical
        case .phiDetected:        return .nursingClinical   // PHI is handled separately
        case .lowConfidence:      return .lowClarity
        case .quotaExceeded:      return .nursingClinical   // server-only — never produced by client classifier
        case .serviceUnavailable: return .nursingClinical   // transport-only — never produced by client classifier
        }
    }
}
