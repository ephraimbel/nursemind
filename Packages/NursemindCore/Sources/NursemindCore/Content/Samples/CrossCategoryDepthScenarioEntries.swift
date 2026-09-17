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

public enum CCDepthCheckbackFallingBloodPressureSample {
    public static let entry = ReferenceEntry(
        id: "checkback-falling-blood-pressure",
        title: "Falling blood pressure: close the loop",
        subtitle: "Published AHRQ communication teaching example",
        eyebrow: "SCENARIO · COMMUNICATION",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "Published example — AHRQ", [
            AttributedBullet("One member of the team calls out, \"BP is falling, 80/48 down from 90/60.\" Another team member verifies and validates receipt of the information by saying, \"Got it. BP is falling and at 80/48, down from 90/60.\" The original sender of the information completes the loop by saying, \"Correct.\"", citationIDs: ["cc_depth_checkback"])
        ]),
            .bullets(title: "Recognize and analyze the communication problem", [
            AttributedBullet("The example includes a trend and a current value. The receiver repeats both, allowing the sender to verify that the important information arrived accurately. AHRQ presents this as a communication exercise, without a treatment order or a reported clinical outcome.", citationIDs: ["cc_depth_checkback"])
        ]),
            .bullets(title: "Prioritize the shared understanding", [
            AttributedBullet("Identify who sent the observation and who received it. The check-back is complete only when the original sender confirms the receiver’s understanding, as shown by the final “Correct.”", citationIDs: ["cc_depth_checkback"])
        ]),
            .bullets(title: "Generate and take the communication action", [
            AttributedBullet("Use the three parts illustrated in the source: the sender states the message, the receiver repeats it, and the sender verifies or corrects the repeat. AHRQ recommends making this routine for information at risk of misunderstanding.", citationIDs: ["cc_depth_checkback"])
        ]),
            .bullets(title: "Evaluate the exchange", [
            AttributedBullet("AHRQ’s debrief asks who the sender and receiver were, how closed-loop communication was used and which potential communication error it avoided. Use those questions to evaluate whether the values and direction of change were understood.", citationIDs: ["cc_depth_checkback"])
        ]),
            .bullets(title: "Transfer to other messages", [
            AttributedBullet("AHRQ notes that messages in texts, email, test alerts and patient portals can also be misunderstood or missed. Communication needs confirmation of receipt and understanding; a sent message alone does not demonstrate a completed loop.", citationIDs: ["cc_depth_checkback"])
        ])
        ],
        citations: [cc_depth_checkback],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CCDepthCusLaborDeliveryEscalationSample {
    public static let entry = ReferenceEntry(
        id: "cus-labor-delivery-escalation",
        title: "Labor and delivery: speak up with CUS",
        subtitle: "AHRQ’s published example and written debrief",
        eyebrow: "SCENARIO · COMMUNICATION",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "Source and limits of this exercise", [
            AttributedBullet("AHRQ’s CUS page includes a labor-and-delivery teaching example. This exercise uses its published written debrief: a nurse states concern, describes discomfort with late decelerations and identifies a patient-safety concern. The page does not supply a numeric tracing or treatment outcome in that debrief.", citationIDs: ["cc_depth_cus"])
        ]),
            .bullets(title: "Recognize the concern", [
            AttributedBullet("The source describes the nurse beginning with “I am concerned” and then providing additional patient vital signs. The learning point is to name the concern clearly and connect it to the information available.", citationIDs: ["cc_depth_cus"])
        ]),
            .bullets(title: "Analyze and prioritize", [
            AttributedBullet("In the written debrief, the nurse says she is uncomfortable with the late decelerations and then says the patient’s safety is at risk. This is a demonstration of escalating the clarity of a safety message; it is not a fetal-monitor interpretation exercise.", citationIDs: ["cc_depth_cus"])
        ]),
            .bullets(title: "Generate a clear safety message", [
            AttributedBullet("CUS progresses from stating a concern, to explaining discomfort, to explicitly identifying the safety issue if the conflict remains unresolved. AHRQ recommends explaining how the concern relates to safety.", citationIDs: ["cc_depth_cus"])
        ]),
            .bullets(title: "Take action when acknowledgment is missing", [
            AttributedBullet("The source directs notification of a supervisor when the safety issue is not acknowledged. The purpose is to move an unresolved safety concern to someone who can respond.", citationIDs: ["cc_depth_cus"])
        ]),
            .bullets(title: "Evaluate the communication", [
            AttributedBullet("Review whether all three elements were recognizable: concern, discomfort and the patient-safety issue. AHRQ’s published debrief uses those elements to show how the nurse communicated effectively with the physician.", citationIDs: ["cc_depth_cus"])
        ])
        ],
        citations: [cc_depth_cus],
        lastSourceFidelityReview: "2026-09-17"
    )
}
