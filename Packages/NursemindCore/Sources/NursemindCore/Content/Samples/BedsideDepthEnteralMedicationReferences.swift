import Foundation

private let bedside_depth_medication = CitationSource(
    id: "bedside_depth_medication", shortName: "Open RN — Administration of Enteral Medications",
    detail: "Nursing Skills, 2nd edition (2023). Enteral-tube medication preparation, administration and evaluation sections. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and learning activities excluded. Separately attributed noncommercial or no-derivatives material excluded; permitted text adaptations are credited below. Medication-administration checklist also adapts Clinical Procedures for Safer Patient Care by the British Columbia Institute of Technology, CC BY 4.0. Exact formulations, flush volumes, feeding holds and water selection require the individual order, pharmacy review and facility policy; no medication dosing. Source-fidelity review is not independent clinical approval.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596740/", lastRetrieved: "2026-09-17"
)

private let bedside_depth_placement = CitationSource(
    id: "bedside_depth_placement", shortName: "Open RN — Insert Nasogastric and Feeding Tubes",
    detail: "Nursing Advanced Skills (2023). Sections 5.2–5.3, tube purpose, initial radiographic confirmation and ongoing placement assessment. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and learning activities excluded. Separately attributed noncommercial or no-derivatives material excluded; permitted text adaptations are credited below. No insertion procedure or auscultation-based placement confirmation. Source-fidelity review is not independent clinical approval.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK594494/", lastRetrieved: "2026-09-17"
)

public enum BedsideDepthEnteralMedicationSafetySample {
    public static let entry = ReferenceEntry(
        id: "enteral-medication-safety", title: "Enteral tubes: medication safety",
        subtitle: "Formulation checks, separate administration and feeding coordination", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies),
        sections: [
            .bullets(title: "Verify the medicine and route", [
                AttributedBullet("Check the order against the medication record, patient identifiers, allergies and the required pre-administration assessment. Confirm that the medicine is intended for this enteral route and that the patient’s tube and current feeding plan are understood.", citationIDs: ["bedside_depth_medication"]),
                AttributedBullet("Review the medicine’s purpose and any response that should be evaluated afterward. A feeding tube changes preparation and delivery; it does not remove the usual medication checks or the need to address an unclear order.", citationIDs: ["bedside_depth_medication"])
            ]),
            .bullets(title: "Check the exact formulation", [
                AttributedBullet("Consult the pharmacist or an authoritative product reference before crushing a tablet or opening a capsule. Extended-release and enteric-coated products generally require an alternative plan; crushing can change how the medicine is delivered.", citationIDs: ["bedside_depth_medication"]),
                AttributedBullet("An available liquid is not automatically interchangeable with every tablet or capsule. Confirm suitability, preparation instructions and the ordered formulation with pharmacy, especially when a substitution would change concentration, absorption or delivery characteristics.", citationIDs: ["bedside_depth_medication"])
            ]),
            .bullets(title: "Verify tube readiness", [
                AttributedBullet("Confirm the documented initial placement verification and the required ongoing checks before giving medicine through the tube. Compare the external length with baseline and investigate any concern for displacement.", citationIDs: ["bedside_depth_placement"]),
                AttributedBullet("Do not administer through a tube of uncertain position. Auscultation after air injection is unreliable, and aspirate appearance alone is not adequate confirmation. Suspected aspiration or malposition requires holding use and clinical assessment.", citationIDs: ["bedside_depth_placement"])
            ]),
            .bullets(title: "Position for administration", [
                AttributedBullet("Elevate the head of the bed at least 30–45 degrees for tube-medication administration when the individual care plan permits. Maintain the required positioning afterward and during continuous feeding. If positioning is contraindicated, clarify the administration plan with the treating team.", citationIDs: ["bedside_depth_medication"])
            ]),
            .bullets(title: "Prepare each medicine separately", [
                AttributedBullet("Prepare medicines individually using the approved technique for the exact formulation. Do not combine multiple medicines into one mixture and do not mix them directly into enteral formula. Separate preparation reduces incompatibility and tube-clogging problems.", citationIDs: ["bedside_depth_medication"]),
                AttributedBullet("Use the correct enteral syringe and prescribed route. Maintain clean medication preparation and connection practices, keeping enteral equipment distinct from intravenous equipment throughout the process.", citationIDs: ["bedside_depth_medication"])
            ]),
            .bullets(title: "Coordinate feeds and suction", [
                AttributedBullet("Pause feeding or suction when required by the medication-administration procedure and the medicine’s absorption requirements. Ask pharmacy about medicine–nutrition interactions and the necessary interval before restarting feeds.", citationIDs: ["bedside_depth_medication"]),
                AttributedBullet("There is no single feeding-hold or suction-restart interval appropriate for every medicine. Confirm the individual instructions, then document when delivery was interrupted and resumed so missed nutrition or loss of the administered medicine can be recognized.", citationIDs: ["bedside_depth_medication"])
            ]),
            .bullets(title: "Flush according to the care plan", [
                AttributedBullet("Use the prescribed water type and flush volume before medication, between separately administered medicines and after the final medicine. Individualize the plan for fluid restriction, tube characteristics and the patient’s needs in accordance with pharmacy and facility guidance.", citationIDs: ["bedside_depth_medication"]),
                AttributedBullet("Count medication water and flushes in the intake record. Do not silently omit required flushing to meet a fluid limit; clarify a feasible plan with the responsible team so medication delivery, patency and fluid goals can all be addressed.", citationIDs: ["bedside_depth_medication"])
            ]),
            .bullets(title: "Recognize a delivery problem", [
                AttributedBullet("Resistance, inability to deliver a medicine or uncertainty that the full preparation entered the tube requires assessment through the facility’s medication and tube-care process. Avoid forceful administration and obtain help when the route is not usable.", citationIDs: ["bedside_depth_medication"]),
                AttributedBullet("Report a missed, delayed, refused or incompletely administered medicine according to policy. Do not record a dose as successfully given when delivery remains uncertain; the treating team needs that information before deciding the next step.", citationIDs: ["bedside_depth_medication"])
            ]),
            .bullets(title: "Evaluate and document", [
                AttributedBullet("Document the medicine, route, time, relevant assessment and any administration problem. Evaluate the expected response, including the effectiveness of a medicine given as needed, and assess for an adverse response.", citationIDs: ["bedside_depth_medication"]),
                AttributedBullet("Communicate unresolved formulation questions, feed or suction holds and tube-patency concerns at handoff. Clear timing and response documentation help the next nurse maintain the medication and nutrition plan safely.", citationIDs: ["bedside_depth_medication"])
            ])
        ],
        citations: [bedside_depth_medication, bedside_depth_placement],
        lastSourceFidelityReview: "2026-09-17"
    )
}
