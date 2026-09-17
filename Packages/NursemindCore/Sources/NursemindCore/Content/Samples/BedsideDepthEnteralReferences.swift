import Foundation

private let bedside_depth_placement = CitationSource(
    id: "bedside_depth_placement", shortName: "Open RN — Insert Nasogastric and Feeding Tubes",
    detail: "Nursing Advanced Skills (2023). Sections 5.2–5.3, tube purpose, initial radiographic confirmation and ongoing placement assessment. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and learning activities excluded. Separately attributed noncommercial or no-derivatives material excluded; permitted text adaptations are credited below. No insertion procedure or auscultation-based placement confirmation. Source-fidelity review is not independent clinical approval.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK594494/", lastRetrieved: "2026-09-17"
)

private let bedside_depth_enteral = CitationSource(
    id: "bedside_depth_enteral", shortName: "Open RN — Enteral Tube Management",
    detail: "Nursing Skills, 2nd edition (2023). Sections 17.2–17.6, tube maintenance, tolerance, misconnection prevention, assessment and NG suction. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and learning activities excluded. Separately attributed noncommercial or no-derivatives material excluded; permitted text adaptations are credited below. Placement confirmation follows the more explicit Advanced Skills chapter 5; residual volumes are not presented as a stand-alone aspiration test or universal stopping threshold. Source-fidelity review is not independent clinical approval.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596741/", lastRetrieved: "2026-09-17"
)

private let bedside_depth_fluid = CitationSource(
    id: "bedside_depth_fluid", shortName: "Open RN — Fluids and Electrolytes",
    detail: "Nursing Fundamentals, 2nd edition (2024). Section 15.6, applying the nursing process: history, examination, weights, intake/output and reassessment. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and learning activities excluded. Separately attributed noncommercial or no-derivatives material excluded; permitted text adaptations are credited below. StatPearls-derived fluid and acid-base passages and third-party treatment guidance outside 15.6 excluded. No fluid-resuscitation formula or electrolyte replacement regimen. Source-fidelity review is not independent clinical approval.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK610839/", lastRetrieved: "2026-09-17"
)

public enum BedsideDepthFeedingTubePlacementSafetySample {
    public static let entry = ReferenceEntry(
        id: "feeding-tube-placement-safety", title: "Feeding tubes: placement and connection safety",
        subtitle: "Initial confirmation, migration checks and safe use", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Identify the route and intended use", [
                AttributedBullet("Confirm the type of tube, its intended endpoint and whether it is ordered for feeding, medication delivery or gastric decompression. A feeding tube and a sump tube are not interchangeable merely because both enter through the nose.", citationIDs: ["bedside_depth_placement"]),
                AttributedBullet("Review the documented insertion and placement-confirmation information before use. Communicate uncertainty about the route, tip location or authorized use to the responsible clinician; the external appearance of the tubing cannot resolve those questions.", citationIDs: ["bedside_depth_placement"])
            ]),
            .bullets(title: "Confirm initial placement appropriately", [
                AttributedBullet("For a blindly inserted nasogastric or feeding tube, obtain the required radiographic confirmation before initial use for feeding or medication. Verify that the result and authorization to use the tube are documented through the facility’s process.", citationIDs: ["bedside_depth_placement"]),
                AttributedBullet("Bedside checks do not replace this initial confirmation. NurseMind does not interpret the radiograph; image interpretation and the decision that the tube is correctly positioned belong to the qualified clinical team.", citationIDs: ["bedside_depth_placement"])
            ]),
            .bullets(title: "Establish an external-length baseline", [
                AttributedBullet("Mark and document the tube’s external length at the exit site after confirmed placement. Compare this measurement with the baseline during ongoing assessments and before use. Secure the tube to reduce unintentional movement.", citationIDs: ["bedside_depth_placement"]),
                AttributedBullet("Reassess when coughing, vomiting, movement or other events raise concern for migration. A changed external length is a reason to investigate; unchanged length is only one part of assessment and does not prove that every internal part of the tube remains correctly positioned.", citationIDs: ["bedside_depth_placement"])
            ]),
            .bullets(title: "Avoid unreliable confirmation shortcuts", [
                AttributedBullet("Injecting air and listening over the abdomen for a sound is not a reliable placement-confirmation method. Appearance of aspirated material alone is also unreliable. Do not treat either finding as permission to begin feeding.", citationIDs: ["bedside_depth_placement"]),
                AttributedBullet("Bedside pH testing may be part of the local ongoing-assessment process, but its interpretation depends on conditions and policy. When position is uncertain, withhold use and obtain the responsible clinician’s assessment and any required repeat imaging.", citationIDs: ["bedside_depth_placement"])
            ]),
            .bullets(title: "Watch for intolerance or respiratory change", [
                AttributedBullet("Assess for coughing, respiratory difficulty or other signs suggesting possible aspiration or displacement. If aspiration or malposition is suspected, stop feeding and tube-medication administration and notify the responsible clinician while the patient is assessed.", citationIDs: ["bedside_depth_placement"]),
                AttributedBullet("Clinical deterioration requires the appropriate urgent response. A tube-placement checklist should not delay assessment of breathing, oxygenation or consciousness when the person becomes unwell.", citationIDs: ["bedside_depth_placement"])
            ]),
            .bullets(title: "Trace the entire connection", [
                AttributedBullet("Trace each line from the patient to its source before connecting and reconnecting it, and repeat this during handoff. Work in adequate lighting and distinguish enteral delivery tubing from intravenous tubing.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("Use the intended enteral equipment and connectors. Do not alter or improvise adapters that defeat a device’s safety design. A secure-looking connection is not enough if it joins the wrong delivery route.", citationIDs: ["bedside_depth_enteral"])
            ]),
            .bullets(title: "Inspect the exit site and securement", [
                AttributedBullet("For a nasal tube, inspect the nares and nearby skin for pressure injury, redness, swelling or bleeding. Check securement and assess for tubing curled in the mouth. Record pain and discomfort that may interfere with care.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("For an abdominal feeding access, assess the surrounding skin and insertion site according to the device’s care plan. New pain, leakage or skin breakdown warrants reassessment; tube care includes the tissue around the access, not just patency.", citationIDs: ["bedside_depth_enteral"])
            ]),
            .bullets(title: "Make the next use safer", [
                AttributedBullet("Document the confirmation method, recorded external length, assessment findings, any suspected migration and what action followed. Include whether the tube is currently cleared for use or remains on hold pending review.", citationIDs: ["bedside_depth_placement"]),
                AttributedBullet("At transfer, communicate the type and purpose of the tube and unresolved placement concerns. Ongoing placement assessment continues after the first verified image; the original insertion record is not a permanent guarantee against later displacement.", citationIDs: ["bedside_depth_placement"])
            ])
        ],
        citations: [bedside_depth_placement, bedside_depth_enteral],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum BedsideDepthEnteralFeedingToleranceSample {
    public static let entry = ReferenceEntry(
        id: "enteral-feeding-tolerance", title: "Enteral feeding: tolerance and monitoring",
        subtitle: "Delivery checks, gastrointestinal symptoms, hydration and reassessment", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Match the prescription to the tube", [
                AttributedBullet("Verify the formula, route, volume, administration method, rate and ordered water-flush plan. Know whether the tube ends in the stomach or small intestine. Review the feeding plan with the treating team and dietitian rather than assuming that any tube can receive the same schedule.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("Check formula expiration and the handling requirements for the product and delivery system. Record what is actually delivered; interrupted feeds, missed flushes and discarded formula affect the intake record and the nutrition plan.", citationIDs: ["bedside_depth_enteral"])
            ]),
            .bullets(title: "Confirm readiness for each use", [
                AttributedBullet("Verify that required initial placement confirmation is documented and reassess the external length and other placement checks before use. If the tube may have migrated or placement is uncertain, hold use and obtain assessment through the facility’s process.", citationIDs: ["bedside_depth_placement"]),
                AttributedBullet("New coughing, respiratory difficulty or suspected aspiration during feeding requires stopping the feed and prompt clinical assessment. Do not use an abdominal sound after air injection as reassurance that feeding can continue.", citationIDs: ["bedside_depth_placement"])
            ]),
            .bullets(title: "Reduce aspiration risk", [
                AttributedBullet("Maintain the head of the bed at 30–45 degrees during feeding unless contraindicated, following the individual care plan. Positioning, ongoing placement checks and assessment for gastrointestinal intolerance work together; no single check eliminates aspiration risk.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("Recheck position after procedures, hygiene and transfers. If the prescribed positioning cannot be maintained, communicate with the team and follow the feeding plan for that situation instead of overlooking the conflict.", citationIDs: ["bedside_depth_enteral"])
            ]),
            .bullets(title: "Assess gastrointestinal tolerance", [
                AttributedBullet("Ask about fullness, nausea, vomiting, cramping, bloating, diarrhea and constipation. Examine the abdomen and compare findings with baseline. The person’s report is useful even when the pump shows that the ordered volume is being delivered.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("Report intolerance and follow the local hold or rate-adjustment protocol and provider orders. A change in formula or delivery rate requires clinical review; recurring symptoms should not be recorded without a reassessment of the feeding plan.", citationIDs: ["bedside_depth_enteral"])
            ]),
            .bullets(title: "Use residual measurements in context", [
                AttributedBullet("Follow the institution’s policy on whether and how to measure gastric residual volume. Interpret a measured residual together with symptoms and the feeding plan; it should not be used as a stand-alone guarantee of aspiration safety.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("Unnecessary interruptions can reduce nutrient delivery, and frequent aspiration of gastric contents may contribute to tube occlusion. This guide does not prescribe a universal residual threshold or replace the unit’s enteral-nutrition protocol.", citationIDs: ["bedside_depth_enteral"])
            ]),
            .bullets(title: "Track fluid and metabolic observations", [
                AttributedBullet("Document formula, water flushes and other fluids given through the tube. Review the ordered intake/output, weight and nutrition-monitoring plan so delivery can be compared with the patient’s ongoing needs.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("Monitor blood glucose and electrolytes as ordered and report significant changes. Feeding tolerance includes metabolic and hydration observations as well as the absence of nausea; the team determines any formula, fluid or medication adjustments.", citationIDs: ["bedside_depth_enteral"])
            ]),
            .bullets(title: "Protect tube patency", [
                AttributedBullet("Follow the prescribed flush schedule around intermittent or continuous feeding and medication administration. Insufficient flushing, inappropriate medication preparation and contamination can contribute to clogging and interrupt nutrition or medicine delivery.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("When clogging occurs, use the facility’s approved gentle water-based first approach. Do not substitute cranberry juice or carbonated beverages; acidic liquids can worsen precipitation of formula proteins. Persistent blockage requires the approved clinical pathway rather than force.", citationIDs: ["bedside_depth_enteral"])
            ]),
            .bullets(title: "Document the response and next plan", [
                AttributedBullet("Record the amount and method of feeding, water provided, placement checks, relevant abdominal findings and tolerance. When feeding is stopped or changed, document the reason, notifications and the ordered reassessment or restart plan.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("Include tube-site skin findings and the person’s concerns at handoff. A clear record of symptoms, timing and delivered volume helps the next nurse distinguish a continuing problem from a new one.", citationIDs: ["bedside_depth_enteral"])
            ])
        ],
        citations: [bedside_depth_enteral, bedside_depth_placement],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum BedsideDepthNasogastricDecompressionMonitoringSample {
    public static let entry = ReferenceEntry(
        id: "nasogastric-decompression-monitoring", title: "NG decompression: bedside monitoring",
        subtitle: "Tube purpose, suction, output and abdominal reassessment", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Identify the decompression plan", [
                AttributedBullet("Gastric decompression removes stomach contents through a nasogastric tube connected to suction. Confirm the tube type and clinical purpose. A double-lumen sump tube has a drainage lumen and a smaller air-vent lumen that helps protect the gastric mucosa during suction.", citationIDs: ["bedside_depth_placement"]),
                AttributedBullet("Know which lumen has which function and follow the device’s instructions. A vent is not a medication or feeding port. The presence of a gastric tube does not by itself authorize feeding or medicine administration through it.", citationIDs: ["bedside_depth_placement"])
            ]),
            .bullets(title: "Check placement and securement", [
                AttributedBullet("Review the placement-confirmation record and compare the external length with the documented baseline. Reassess if the tube has been pulled, the patient has vomited or other findings suggest movement. A suspected displaced tube needs review before continued use.", citationIDs: ["bedside_depth_placement"]),
                AttributedBullet("Check that securement limits traction without creating skin injury. Include placement concerns and the current authorization for use in the handoff rather than assuming that the next nurse has seen the insertion record.", citationIDs: ["bedside_depth_placement"])
            ]),
            .bullets(title: "Assess the abdomen and symptoms", [
                AttributedBullet("Ask about nausea, vomiting, fullness and abdominal discomfort. Inspect for distension, auscultate and palpate as appropriate, and compare with previous findings. Assessment helps determine whether decompression is having the intended effect.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("New or worsening symptoms despite apparent suction require reassessment. Document the time course and accompanying output or equipment changes; the suction sound alone is not a measure of clinical improvement.", citationIDs: ["bedside_depth_enteral"])
            ]),
            .bullets(title: "Verify suction against the order", [
                AttributedBullet("Connect the appropriate drainage lumen to the collection system and verify the prescribed suction setting and mode. Observe whether gastric contents travel through the tubing into the canister. Use the ordered setup and equipment instructions rather than one setting for all patients.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("Inspect the path for visible problems when expected drainage is absent and communicate persistent concerns. Changes to suction, flushing or tube position require the applicable order and device procedure; do not resolve resistance by escalating force.", citationIDs: ["bedside_depth_enteral"])
            ]),
            .bullets(title: "Describe output precisely", [
                AttributedBullet("Measure and document output amount, color, odor and consistency with its time interval. A meaningful report identifies how the current output differs from the prior pattern and what abdominal or other symptoms accompany it.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("Unexpected dark or bloody-appearing drainage, a marked increase in output or worsening nausea and distension requires prompt clinical review. Preserve the timing and measured observations so the team can assess the significance.", citationIDs: ["bedside_depth_enteral"])
            ]),
            .bullets(title: "Include losses in fluid assessment", [
                AttributedBullet("Review gastrointestinal losses together with other output, intake, daily weights, vital signs, examination findings and ordered laboratory results. Repeated gastric losses can contribute to fluid and electrolyte imbalance and should remain visible in the ongoing assessment.", citationIDs: ["bedside_depth_fluid"]),
                AttributedBullet("Communicate increasing losses, reduced urine output, weakness, dizziness or other changing findings. The treating team determines replacement and laboratory monitoring; a canister measurement does not independently define a fluid or electrolyte prescription.", citationIDs: ["bedside_depth_fluid"])
            ]),
            .bullets(title: "Protect nasal and oral tissues", [
                AttributedBullet("Inspect the nares for pressure damage, swelling, redness or bleeding and check surrounding skin at the securement site. Ask about discomfort and inspect for tubing curled in the mouth. Include these findings in routine tube reassessment.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("Report skin breakdown, persistent bleeding, pain or a change in tube appearance. Maintaining the access site and comfort is part of tube management even when suction output remains adequate.", citationIDs: ["bedside_depth_enteral"])
            ]),
            .bullets(title: "Hand off the purpose and response", [
                AttributedBullet("Document the prescribed suction mode and setting, output with time interval, abdominal findings, tube-site condition and patient tolerance. Include interventions and who was notified about abnormal findings.", citationIDs: ["bedside_depth_enteral"]),
                AttributedBullet("At transfer, communicate continuing symptoms and any unresolved drainage or placement concern. Reassessment should establish whether the treatment is relieving symptoms and whether complications or a revised plan need attention.", citationIDs: ["bedside_depth_enteral"])
            ])
        ],
        citations: [bedside_depth_placement, bedside_depth_enteral, bedside_depth_fluid],
        lastSourceFidelityReview: "2026-09-17"
    )
}
