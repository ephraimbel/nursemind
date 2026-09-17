import Foundation

private let bedside_depth_wound = CitationSource(
    id: "bedside_depth_wound", shortName: "Open RN — Wound Care",
    detail: "Nursing Skills, 2nd edition (2023). Sections 20.3 assessment, 20.12 cleansing and 20.13 drain management. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and learning activities excluded. Separately attributed noncommercial or no-derivatives material excluded; permitted text adaptations are credited below. StatPearls-derived basic concepts, staging tables, Braden tool and third-party illustrations excluded. No debridement or drain-removal protocol. Source-fidelity review is not independent clinical approval.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596725/", lastRetrieved: "2026-09-17"
)

public enum WoundCareSample {
    public static let entry = ReferenceEntry(
        id: "wound-care-fundamentals", title: "Wound assessment and care",
        subtitle: "Consistent measurements, tissue description and response to care", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Identify the wound and clinical context", [
                AttributedBullet("Record the exact anatomic location and distinguish each wound when several are present. Review the suspected cause, current treatment order and prior description. A reproducible baseline is necessary to identify improvement or deterioration at later dressing changes.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Ask about pain before care and during cleansing or movement. Sensory impairment can reduce pain even with a substantial wound; absence of discomfort does not establish that skin and underlying tissue are intact.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Describe the bed and edges", [
                AttributedBullet("Describe visible tissue by appearance, including granulation tissue, slough and eschar, and estimate their extent using the facility’s documentation approach. Report unexpected tissue change rather than choosing debridement solely from a color description.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Assess whether wound edges are approximated, separated, rolled or otherwise changing. For a surgical incision, document any new separation and communicate it promptly. The wound bed, edges and surrounding skin each contribute different information.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Measure consistently", [
                AttributedBullet("Use the facility’s standardized method and centimeters to record length, width and depth. Consistent orientation, technique and documentation allow comparison; measurements obtained by different methods can create a misleading impression of healing or enlargement.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Assess tunneling and undermining only with the approved technique and appropriate competence. Document their location and extent, commonly using a clock-face convention with 12 o’clock toward the head. Do not force a measuring instrument into tissue.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Characterize drainage", [
                AttributedBullet("Record the amount, color, consistency and odor of exudate. Serous drainage is thin and watery; sanguineous drainage is bloody; serosanguineous drainage contains both. Describe what is observed and compare it with the prior assessment.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Thick opaque purulent drainage, a new odor or an unexpected increase in bleeding needs evaluation. Drainage should be interpreted alongside wound appearance, symptoms and the surrounding skin rather than used alone to assign an infectious diagnosis.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Inspect surrounding skin", [
                AttributedBullet("Assess the periwound area for erythema or other color change, warmth, swelling, induration, tenderness and maceration. Excess moisture and leaking exudate can damage surrounding skin, so dressing performance is part of the assessment.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Report new inflammation, purulent drainage, increasing pain or other concerning changes to the responsible team. Record the location and extent of the findings so subsequent assessments can determine whether the changes are spreading or resolving.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Match care to the order", [
                AttributedBullet("Verify the prescribed cleansing solution, dressing and packing plan before starting. Cleansing removes surface debris and makes assessment easier; use a method that cleans effectively without damaging tissue or forcing debris deeper into the wound.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("When irrigation or packing is ordered, follow the specific technique and equipment requirements. Packing should not be forced or compressed tightly into the wound. Keep wet packing from overlapping intact wound edges, and use the prescribed outer dressing.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Evaluate the dressing and tolerance", [
                AttributedBullet("The outer dressing should remain dry enough to maintain its protective function. A dressing saturated before the next scheduled change needs attention rather than simply waiting for the scheduled time. Report recurring saturation so the care plan can be reassessed.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Reassess pain and comfort after care and inspect for bleeding or other adverse response. Compare the wound and periwound findings over time rather than documenting only that the dressing was changed.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Document an assessment that can be repeated", [
                AttributedBullet("Include location, measurements, tissue and edge findings, drainage, surrounding skin, pain, solution and dressing used, and the patient’s response. Record concerning findings and who was notified, along with any revised orders or follow-up plan.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Use the next assessment to evaluate whether the current plan is meeting its goals. A stable technique and descriptive documentation make a change easier for another nurse or wound-care clinician to recognize.", citationIDs: ["bedside_depth_wound"])
            ])
        ],
        citations: [bedside_depth_wound],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum BedsideDepthSurgicalDrainMonitoringSample {
    public static let entry = ReferenceEntry(
        id: "surgical-drain-monitoring", title: "Surgical drains: assessment and output",
        subtitle: "Closed reservoirs, securement, measurement and postoperative trends", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Identify each drain separately", [
                AttributedBullet("Review the procedure, drain location, type and current care orders. A patient may have several drains serving different sites. Label and document each one distinctly so output from one location is not mistaken for another.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Closed systems such as Jackson-Pratt and Hemovac drains collect fluid in a reservoir using negative pressure. Their expected output depends on the operation and location; one output pattern is not appropriate for every surgical drain.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Assess the site and patient", [
                AttributedBullet("Inspect the insertion site, dressing and surrounding skin for leakage, bleeding, inflammation or other change. Ask about discomfort and compare the site with prior findings. Include the patient’s overall postoperative condition in the assessment.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Check the site and device throughout the shift according to the clinical situation and policy. A functioning reservoir does not remove the need to look for pain, skin injury or drainage around the tube.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Protect securement during movement", [
                AttributedBullet("Check that the tube and reservoir are secured according to the device and facility procedure. Maintain enough slack for movement so turning or walking does not pull on the insertion site.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("For the closed surgical drains described in Open RN, keep the reservoir below the wound to support drainage. Recheck positioning after transfers and personal care, when the device can become caught, pulled or displaced.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Empty with contamination prevention", [
                AttributedBullet("Use hand hygiene and the appropriate protective equipment. Open the reservoir as directed while protecting the plug and opening from contamination. Point the opening away from the face to reduce splash exposure.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Pour drainage into the measuring container without touching the reservoir opening to that container. Follow the device’s cleaning and closure instructions rather than handling the opening as an ordinary household container.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Reestablish the prescribed reservoir suction", [
                AttributedBullet("For compressible closed reservoirs, the prescribed emptying procedure includes compressing the reservoir before replacing its plug to reestablish the vacuum. Confirm that the device remains correctly closed and functioning afterward.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Assess the tubing, placement and reservoir when drainage does not appear to be functioning normally. Persistent leakage or failure to maintain the expected reservoir state needs clinical review; the emptying procedure does not authorize drain repositioning or removal.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Measure and characterize output", [
                AttributedBullet("Record volume, color, consistency and odor for each drain and identify the collection interval. Drainage belongs in the patient’s output record. Measure with the designated container rather than estimating from the appearance of a partly filled bulb.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Empty and assess frequently enough for the postoperative plan and local policy. A heavy, full reservoir can add traction and makes ongoing drainage assessment more difficult; do not wait for it to become an obstacle to safe movement.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Recognize an unexpected change", [
                AttributedBullet("Report concerning wound or drain findings, including new bleeding, changed drainage character, leakage, increasing pain or inflammation. Compare with the previous measurements and describe the change in concrete terms.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Evaluate the site and system when drainage changes unexpectedly rather than assuming that less output always indicates healing. The clinical team determines whether the drain needs additional assessment or a revised plan.", citationIDs: ["bedside_depth_wound"])
            ]),
            .bullets(title: "Record the care and response", [
                AttributedBullet("Document each drain’s site, securement, output, reservoir function and patient tolerance, together with care performed and any notifications. Include the response after emptying or other ordered care.", citationIDs: ["bedside_depth_wound"]),
                AttributedBullet("Hand off which drains remain in place, their recent output and unresolved concerns. This guide covers routine observation and reservoir care; surgical drain flushing, manipulation and removal require their own device-specific orders and trained procedure.", citationIDs: ["bedside_depth_wound"])
            ])
        ],
        citations: [bedside_depth_wound],
        lastSourceFidelityReview: "2026-09-17"
    )
}
