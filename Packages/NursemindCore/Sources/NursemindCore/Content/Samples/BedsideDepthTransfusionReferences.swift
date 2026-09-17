import Foundation

private let bedside_depth_blood = CitationSource(
    id: "bedside_depth_blood", shortName: "Open RN — Administer Blood Products",
    detail: "Nursing Advanced Skills (2023). Sections 3.3 and 3.5, nursing workflow, monitoring and documentation. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and learning activities excluded. Separately attributed noncommercial or no-derivatives material excluded; permitted text adaptations are credited below. StatPearls-derived product/reaction tables in 3.2 excluded. Product-specific time limits, rates, compatibility and reaction workup remain subject to blood-bank policy; no copied dosage protocol. Source-fidelity review is not independent clinical approval.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK594497/", lastRetrieved: "2026-09-17"
)

public enum BloodTransfusionAdminSample {
    public static let entry = ReferenceEntry(
        id: "blood-transfusion-administration", title: "Blood transfusion administration",
        subtitle: "Verification, observation, reaction recognition and documentation", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies),
        sections: [
            .bullets(title: "Establish readiness before collecting blood", [
                AttributedBullet("Verify the order, required consent, indication, planned component and relevant compatibility testing. Review allergies and any prior transfusion reaction. Confirm that the patient understands the reason for treatment and knows how to report new symptoms.", citationIDs: ["bedside_depth_blood"]),
                AttributedBullet("Complete required baseline assessments before the component arrives, including vital signs and relevant respiratory, skin and pain findings. Clarify an unexplained fever or other concern with the team so a pre-existing abnormality is not mistaken for a new transfusion reaction.", citationIDs: ["bedside_depth_blood"])
            ]),
            .bullets(title: "Prepare access and equipment", [
                AttributedBullet("Confirm appropriate, patent vascular access and use the blood-bank-approved administration set and filter for the component. Have the prescribed compatible solution and monitoring equipment ready. Equipment requirements can differ by component and method of administration.", citationIDs: ["bedside_depth_blood"]),
                AttributedBullet("Do not add medicines to a blood component or administer them through its tubing. Use a separate route for incompatible therapy. Follow the blood bank’s compatibility policy; the Open RN workflow describes 0.9% sodium chloride as the standard compatible solution.", citationIDs: ["bedside_depth_blood"])
            ]),
            .bullets(title: "Perform the bedside identity check", [
                AttributedBullet("Complete the required independent bedside verification using the patient’s identifiers, order, compatibility documentation and component label. Verify the unit identification, component type, applicable blood-group compatibility and expiration. Follow local requirements for qualified staff and electronic verification.", citationIDs: ["bedside_depth_blood"]),
                AttributedBullet("Inspect the component for an unexpected appearance, leakage or other concern. Any discrepancy must be resolved before starting. A previous check elsewhere does not replace the final match between the patient and the actual unit at the bedside.", citationIDs: ["bedside_depth_blood"])
            ]),
            .bullets(title: "Protect the component during handling", [
                AttributedBullet("Collect the component only when the patient, staff and equipment are ready. Blood components require controlled storage and handling; do not put a unit in an ordinary ward refrigerator. Contact the blood bank when a delay makes the planned administration uncertain.", citationIDs: ["bedside_depth_blood"]),
                AttributedBullet("Follow the component-specific issue, start, completion and return rules. Do not apply a single time limit or infusion rate to every product and clinical situation. The prescribed plan and blood-bank policy determine these details.", citationIDs: ["bedside_depth_blood"])
            ]),
            .bullets(title: "Observe closely during initiation", [
                AttributedBullet("Begin according to the ordered rate and local protocol, remaining especially attentive during the first 15 minutes. Ask about new chills, itching, breathing difficulty, pain or a sudden sense of feeling unwell, and compare objective findings with baseline.", citationIDs: ["bedside_depth_blood"]),
                AttributedBullet("Continue scheduled vital signs, IV-site checks and symptom assessment throughout the transfusion. Early tolerance does not remove the need for observation later in the infusion. Document the rate and time with the patient’s response.", citationIDs: ["bedside_depth_blood"])
            ]),
            .bullets(title: "Respond to a suspected reaction", [
                AttributedBullet("A suspected reaction requires stopping the transfusion, assessing the patient and obtaining help according to the severity of the findings. Notify the responsible clinician and blood bank and follow the facility’s transfusion-reaction procedure.", citationIDs: ["bedside_depth_blood"]),
                AttributedBullet("Maintain needed IV access using new tubing and the compatible solution specified by policy; do not flush residual suspect blood into the patient. Retain the component and administration set for the blood bank, and obtain the ordered specimens and repeat identity checks.", citationIDs: ["bedside_depth_blood"])
            ]),
            .bullets(title: "Reassess the clinical response", [
                AttributedBullet("Evaluate respiratory status, vital signs, comfort, skin findings and IV-site condition during and after administration. New symptoms need assessment even when the component has finished; report and document their timing in relation to the transfusion.", citationIDs: ["bedside_depth_blood"]),
                AttributedBullet("Review the ordered follow-up laboratory results and the intended treatment goal with the team. Completion of a unit does not by itself demonstrate that the desired clinical outcome has been achieved.", citationIDs: ["bedside_depth_blood"])
            ]),
            .bullets(title: "Close the record and handoff", [
                AttributedBullet("Document the component and unit identification, start and finish times, volume administered, required checks, vital signs and patient response. Include any interruption, suspected reaction, notifications and specimens sent for investigation.", citationIDs: ["bedside_depth_blood"]),
                AttributedBullet("If care transfers before monitoring or follow-up is complete, communicate what was administered, the current status, any symptoms and the remaining observation or laboratory plan. Keep the blood-bank investigation and treating-team instructions available to the receiving nurse.", citationIDs: ["bedside_depth_blood"])
            ])
        ],
        citations: [bedside_depth_blood],
        lastSourceFidelityReview: "2026-09-17"
    )
}
