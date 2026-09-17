import Foundation

private let depth9_auris_clinical = CitationSource(
    id: "depth9_auris_clinical",
    shortName: "C. auris: Clinical Overview",
    detail: "Infection and colonization; diagnostic identification; reporting. Page dated February 26, 2026. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/candida-auris/hcp/clinical-overview/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_auris_control = CitationSource(
    id: "depth9_auris_control",
    shortName: "C. auris: Infection Control Guidance",
    detail: "Disinfection; shared equipment; setting-specific precautions; transfers; decolonization. Page dated April 24, 2024. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/candida-auris/hcp/infection-control/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_auris_screen = CitationSource(
    id: "depth9_auris_screen",
    shortName: "C. auris: Screening Recommendations",
    detail: "Who and when to screen; local strategy; reassessment of colonization. Page dated December 15, 2025. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/candida-auris/hcp/screening-hcp/index.html",
    lastRetrieved: "2026-09-17"
)

public enum CandidaAurisBedsidePreventionSample {
    public static let entry = ReferenceEntry(
        id: "candida-auris-bedside-prevention",
        title: "Candida auris — bedside prevention",
        subtitle: "Colonization, screening, equipment & care transitions",
        eyebrow: "REFERENCE · INFECTION PREVENTION",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .infection),
        sections: [
            .bullets(title: "Separate colonization from infection", [
                AttributedBullet("C. auris can colonize skin without symptoms or cause serious infection. Both colonized and infected patients can transmit the organism in healthcare settings.", citationIDs: ["depth9_auris_clinical"]),
                AttributedBullet("Invasive infection has no single distinctive symptom pattern. Illness depends on the involved site and severity; a colonization swab is not a bloodstream-infection diagnosis.", citationIDs: ["depth9_auris_clinical"])
            ]),
            .bullets(title: "Recognize risk and identification limits", [
                AttributedBullet("Risk is associated with complex care, invasive devices and prolonged or repeated healthcare stays. Traditional laboratory methods can misidentify this yeast.", citationIDs: ["depth9_auris_clinical"]),
                AttributedBullet("Suspected infection or colonization should reach infection prevention and public health promptly. Accurate species identification may require specialized laboratory methods.", citationIDs: ["depth9_auris_clinical"])
            ]),
            .bullets(title: "Match precautions to the setting", [
                AttributedBullet("Acute-care hospitals and long-term acute-care hospitals use Contact Precautions. Nursing homes use Contact or Enhanced Barrier Precautions according to the clinical situation and guidance.", citationIDs: ["depth9_auris_control"]),
                AttributedBullet("Use a single room when possible. Prioritize patients with uncontained secretions, diarrhea or draining wounds; infection prevention should direct any cohorting plan.", citationIDs: ["depth9_auris_control"])
            ]),
            .bullets(title: "Support the screening plan", [
                AttributedBullet("Screening identifies asymptomatic carriage. Shared rooms, care staff or mobile equipment can establish an epidemiologic link that matters even after an affected patient leaves.", citationIDs: ["depth9_auris_screen"]),
                AttributedBullet("Who and when to screen depends on local transmission, healthcare exposures, risk factors and the purpose of screening; it is a facility/public-health strategy.", citationIDs: ["depth9_auris_screen"])
            ]),
            .bullets(title: "Prevent equipment transmission", [
                AttributedBullet("Use an EPA List P disinfectant effective against C. auris. A claim against other Candida species does not establish effectiveness against C. auris.", citationIDs: ["depth9_auris_control"]),
                AttributedBullet("Assign responsibility for shared mobile equipment. Clean and disinfect between users, separate clean from contaminated equipment, and include daily and terminal room cleaning.", citationIDs: ["depth9_auris_control"])
            ]),
            .bullets(title: "Avoid false clearance", [
                AttributedBullet("Known carriers may have negative swabs followed by positive results. CDC does not recommend routine reassessment of colonization or stopping precautions because of a negative swab.", citationIDs: ["depth9_auris_screen"]),
                AttributedBullet("Colonization can persist for prolonged periods. Infection-control measures apply throughout inpatient healthcare stays, including after treatment of active infection.", citationIDs: ["depth9_auris_clinical"])
            ]),
            .bullets(title: "Preserve care access at transfer", [
                AttributedBullet("Screening should inform receiving-facility precautions; it should not be used to deny or delay transfers. Communicate known status and required infection-control measures.", citationIDs: ["depth9_auris_screen"]),
                AttributedBullet("Discharge decisions depend on clinical needs and the receiving facility’s ability to provide care. Keep infection-control alerts available for subsequent admissions.", citationIDs: ["depth9_auris_control"])
            ]),
            .bullets(title: "Understand prevention boundaries", [
                AttributedBullet("Alcohol-based hand sanitizer is preferred when hands are not visibly soiled. Clean hands before and after contact; gloves do not replace hand hygiene.", citationIDs: ["depth9_auris_control"]),
                AttributedBullet("No intervention is proven to eliminate C. auris colonization. Chlorhexidine bathing should not be represented as a reliable decolonization or isolation-clearance method.", citationIDs: ["depth9_auris_control"])
            ])
        ],
        citations: [depth9_auris_clinical, depth9_auris_control, depth9_auris_screen],
        lastSourceFidelityReview: "2026-09-17"
    )
}
