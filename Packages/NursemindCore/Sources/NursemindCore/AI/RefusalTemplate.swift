import Foundation

/// The six refusal patterns from spec §4.11. The AI is required to use one of these
/// when a question crosses a scope boundary; the client renders them with a distinct
/// visual treatment so users instantly recognize "this is a refusal, not an answer."
public enum RefusalType: String, Codable, Sendable, CaseIterable {
    case diagnostic        // "what does the patient have"
    case prescribing       // "should I give X mg"
    case phiDetected       // input contained PHI
    case lowConfidence     // corpus didn't have a high-confidence answer
    case nonClinical       // off-topic / off-scope
    case patientFacing     // question from a patient or family member
    case quotaExceeded     // server-side daily limit reached for this user's tier
    case serviceUnavailable // AI/edge-function reachability failure — explicit refusal
                            // beats silent-fallback-to-canned-content, which would
                            // mislead clinicians into trusting fixture data.

    public var headline: String {
        switch self {
        case .diagnostic:         return "I can't suggest a diagnosis."
        case .prescribing:        return "The decision to give a medication is the provider's."
        case .phiDetected:        return "It looks like you may have entered patient information."
        case .lowConfidence:      return "I don't have high-confidence sources for that question."
        case .nonClinical:        return "I'm built for nursing reference questions."
        case .patientFacing:      return "NurseMind is a reference for licensed and student nurses, not patients."
        case .quotaExceeded:      return "You've hit your daily question limit."
        case .serviceUnavailable: return "I can't reach the AI right now."
        }
    }

    public var body: String {
        switch self {
        case .diagnostic:
            return "But I can help you think about what to assess and report. Diagnosis is the provider's call. Below is what would be useful to gather before calling."
        case .prescribing:
            return "I can help you understand the medication itself — its action, nursing implications, what to monitor, what to watch for. What would you like to know about it?"
        case .phiDetected:
            return "I removed it before processing. Reminder: NurseMind is a reference tool — please describe situations in general terms only."
        case .lowConfidence:
            return "I'd recommend consulting your facility's policy or protocol, your charge nurse or pharmacist, or the original source for drug specifics."
        case .nonClinical:
            return "Try asking me about a drug, drip, lab, scenario, or anything you'd typically look up at the bedside."
        case .patientFacing:
            return "Please direct medical questions to your healthcare provider."
        case .quotaExceeded:
            return "The Library and Tools tabs stay open — full reference content, all calculators, no limits. Ask resets at midnight, or upgrade to Pro for a higher daily ceiling."
        case .serviceUnavailable:
            return "Connectivity issue, an outage, or temporary configuration problem. Try again in a moment. The Library and Tools tabs work without a network."
        }
    }

    public var icon: String {
        switch self {
        case .diagnostic, .prescribing:        return "stethoscope"
        case .phiDetected:                     return "lock.shield"
        case .lowConfidence:                   return "questionmark.circle"
        case .nonClinical:                     return "sparkles"
        case .patientFacing:                   return "person.fill"
        case .quotaExceeded:                   return "hourglass"
        case .serviceUnavailable:              return "wifi.exclamationmark"
        }
    }
}
