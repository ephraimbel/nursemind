import Foundation

private let bedside_depth_chest = CitationSource(
    id: "bedside_depth_chest", shortName: "Open RN — Manage Chest Tube Drainage Systems",
    detail: "Nursing Advanced Skills (2023). Section 6.3 nursing responsibilities and section 6.2 chamber descriptions. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and learning activities excluded. Separately attributed noncommercial or no-derivatives material excluded; permitted text adaptations are credited below. The chamber descriptions also adapt Clinical Procedures for Safer Patient Care by the British Columbia Institute of Technology, CC BY 4.0. StatPearls-derived anatomy, indications and placement passages excluded. Device-specific emergency procedures are not reproduced. Source-fidelity review is not independent clinical approval.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK594490/", lastRetrieved: "2026-09-17"
)

public enum ChestTubeSample {
    public static let entry = ReferenceEntry(
        id: "chest-tube-drainage", title: "Chest tube drainage system",
        subtitle: "Chambers, respiratory assessment, drainage and troubleshooting", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Identify the prescribed system", [
                AttributedBullet("Confirm the tube’s purpose, the prescribed suction or water-seal plan, and the model of drainage device. Systems differ in how suction is set and displayed. The manufacturer’s instructions and current orders determine the setup; a wall regulator number alone does not describe the entire system.", citationIDs: ["bedside_depth_chest"]),
                AttributedBullet("Review the prior respiratory examination, drainage measurements and device findings at handoff. These establish a comparison for new symptoms, increasing losses, changes in bubbling or unexpected cessation of drainage.", citationIDs: ["bedside_depth_chest"])
            ]),
            .bullets(title: "Assess the patient before the chambers", [
                AttributedBullet("Assess respiratory rate and effort, oxygen saturation, breath sounds, dyspnea, blood pressure and pain. Reassess trends during the shift. Worsening breathing or circulation may reflect a complication even when the drainage unit appears to be operating.", citationIDs: ["bedside_depth_chest"]),
                AttributedBullet("Inspect the insertion-site dressing for integrity and drainage. Assess nearby skin for bleeding, inflammation and crepitus, the crackling associated with subcutaneous air. New or increasing subcutaneous emphysema needs prompt communication and assessment.", citationIDs: ["bedside_depth_chest"])
            ]),
            .bullets(title: "Read the collection chamber", [
                AttributedBullet("Record the amount, color and characteristics of drainage, with a time interval. Mark the collection level with date and time according to local practice so subsequent output can be compared with a clear baseline.", citationIDs: ["bedside_depth_chest"]),
                AttributedBullet("Report excessive bleeding or an unexpected drainage change with the patient’s condition and the measured interval. If flow stops, assess tubing and the patient; a quiet collection chamber by itself does not establish that the underlying problem has resolved.", citationIDs: ["bedside_depth_chest"])
            ]),
            .bullets(title: "Understand water-seal behavior", [
                AttributedBullet("The water seal permits air to leave while limiting its return into the pleural space. Maintain the specified water level when the device uses one. Tidaling is movement with breathing; absent tidaling may reflect obstruction, a system problem or lung re-expansion and requires clinical context.", citationIDs: ["bedside_depth_chest"]),
                AttributedBullet("Continuous bubbling in the water-seal chamber can indicate an air leak. Inspect external connections and the insertion site for a correctable problem. Notify the responsible clinician if the tube is dislodged or an external leak cannot be identified and corrected.", citationIDs: ["bedside_depth_chest"])
            ]),
            .bullets(title: "Distinguish wet from dry suction", [
                AttributedBullet("In a wet suction system, the suction-control chamber uses a water column and generally shows gentle continuous bubbling when connected appropriately. This expected bubbling is different from continuous bubbling in the water-seal chamber.", citationIDs: ["bedside_depth_chest"]),
                AttributedBullet("Dry suction systems use their control dial and a manufacturer-specific indicator such as a float or bellows. Verify the prescribed setting and indicator. Do not increase wall suction simply to produce vigorous bubbling or treat all chambers as if they had the same function.", citationIDs: ["bedside_depth_chest"])
            ]),
            .bullets(title: "Protect the drainage pathway", [
                AttributedBullet("Keep the drainage unit upright, stable and below the chest. Prevent tubing from kinking and secure connections and the chest tube according to policy. Account for the device during transfers so it is not pulled, tipped or raised unintentionally.", citationIDs: ["bedside_depth_chest"]),
                AttributedBullet("Do not routinely clamp a chest tube because trapped air can create a tension pneumothorax. Brief clamping for a defined clinical procedure requires the applicable protocol and trained team. Do not strip the tubing; this can produce harmful intraluminal pressures.", citationIDs: ["bedside_depth_chest"])
            ]),
            .bullets(title: "Prepare for deterioration or disconnection", [
                AttributedBullet("Breathing difficulty, falling oxygenation, cyanosis, chest pain, rapid or shallow breathing, new subcutaneous emphysema or excessive bleeding require immediate assessment and notification; activate the facility’s emergency response when indicated. Keep the patient under observation while help is obtained.", citationIDs: ["bedside_depth_chest"]),
                AttributedBullet("Know where the locally required emergency supplies are kept. A displaced tube or disconnected unit needs the facility’s device-specific emergency procedure and prompt clinical help. This reference does not substitute a universal dressing or improvised water-seal maneuver for that procedure.", citationIDs: ["bedside_depth_chest"])
            ]),
            .bullets(title: "Support comfort and a clear handoff", [
                AttributedBullet("Assess insertion-site pain and the response to prescribed analgesia and repositioning. Explain that new breathing difficulty should be reported immediately, and support ordered coughing, deep breathing and movement while protecting the tube.", citationIDs: ["bedside_depth_chest"]),
                AttributedBullet("Hand off the current suction or water-seal plan, respiratory findings, insertion-site condition, drainage amount and character, bubbling or tidaling changes, and any escalation. Document both the observation and the patient’s response to care.", citationIDs: ["bedside_depth_chest"])
            ])
        ],
        citations: [bedside_depth_chest],
        lastSourceFidelityReview: "2026-09-17"
    )
}
