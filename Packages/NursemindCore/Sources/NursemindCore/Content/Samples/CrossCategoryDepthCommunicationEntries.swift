import Foundation

private let cc_depth_checkback = CitationSource(
    id: "cc_depth_checkback",
    shortName: "AHRQ TeamSTEPPS — Check-Back",
    detail: "July 2023. Published falling-blood-pressure dialogue reproduced with attribution; discussion of closed-loop communication. Source-fidelity review is not independent clinical approval.",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/teamstepps-program/curriculum/communication/tools/checkback.html",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_cus = CitationSource(
    id: "cc_depth_cus",
    shortName: "AHRQ TeamSTEPPS — CUS",
    detail: "May 2023. CUS steps and the written debrief of the labor-and-delivery teaching example. Video not reviewed; no invented vital signs, fetal tracing or outcome. Medical-interpreter use explicitly supported. Source-fidelity review is not independent clinical approval.",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/teamstepps-program/curriculum/mutual/tools/cus.html",
    lastRetrieved: "2026-09-17"
)

public enum CCDepthInterpreterSafetyEscalationSample {
    public static let entry = ReferenceEntry(
        id: "interpreter-safety-escalation",
        title: "Speaking up for interpreter support",
        subtitle: "CUS and check-back when language support is needed",
        eyebrow: "COMMUNICATION · TEAM SAFETY",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "When this tool applies", [
            AttributedBullet("AHRQ specifically recommends CUS for expressing concern about the need for a medical interpreter when care discussions involve a patient with limited English proficiency. The tool makes an unresolved communication-safety concern explicit.", citationIDs: ["cc_depth_cus"])
        ]),
            .bullets(title: "State the concern", [
            AttributedBullet("Begin by identifying the concern that interpreter support is needed. CUS starts with a clear statement of concern; it does not rely on the other team member inferring the issue from a vague objection.", citationIDs: ["cc_depth_cus"])
        ]),
            .bullets(title: "Explain the discomfort", [
            AttributedBullet("Explain why the situation makes you uncomfortable. AHRQ separates this step from simply stating concern so the recipient understands what needs to be addressed.", citationIDs: ["cc_depth_cus"])
        ]),
            .bullets(title: "Name the safety issue and escalate", [
            AttributedBullet("If the concern remains unresolved, state that it is a safety issue and explain the connection to safety. AHRQ advises notifying a supervisor when the safety issue is not acknowledged.", citationIDs: ["cc_depth_cus"])
        ]),
            .bullets(title: "Confirm the team’s understanding", [
            AttributedBullet("Check-back can verify that a message was received and understood: the receiver repeats the information and the original sender confirms or corrects it. Use that closed loop to reduce misunderstanding about the concern being raised.", citationIDs: ["cc_depth_checkback"])
        ]),
            .bullets(title: "Keep the communication goals distinct", [
            AttributedBullet("CUS calls attention to a safety concern; check-back verifies the understanding of a message. Acknowledging the message does not by itself show that the underlying concern has been resolved. Review the response to the stated concern as well as whether it was heard.", citationIDs: ["cc_depth_cus", "cc_depth_checkback"])
        ])
        ],
        citations: [cc_depth_checkback, cc_depth_cus],
        lastSourceFidelityReview: "2026-09-17"
    )
}
