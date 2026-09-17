import Foundation

private let depth9_measles_clinical = CitationSource(
    id: "depth9_measles_clinical",
    shortName: "Measles: Clinical Overview",
    detail: "Features; infectious period; reporting; IgM and RT-PCR confirmation. Page dated August 5, 2026. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/measles/hcp/clinical-overview/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_measles_control = CitationSource(
    id: "depth9_measles_control",
    shortName: "Measles: Healthcare Infection Prevention",
    detail: "Interim guidance: triage; AIIR placement; respirators; transport; duration; room clearance. Page dated August 19, 2025. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/measles/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_measles_worker = CitationSource(
    id: "depth9_measles_worker",
    shortName: "Measles: Healthcare Personnel",
    detail: "Occupational exposure; evidence of immunity; monitoring and work restrictions. Page dated April 5, 2024. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/healthcare-personnel-epidemiology-control/measles.html",
    lastRetrieved: "2026-09-17"
)

public enum MeaslesHealthcarePreventionSample {
    public static let entry = ReferenceEntry(
        id: "measles-healthcare-exposure-prevention",
        title: "Measles — healthcare exposure prevention",
        subtitle: "Triage, airborne isolation, testing & staff follow-up",
        eyebrow: "REFERENCE · INFECTION PREVENTION",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .infection),
        sections: [
            .bullets(title: "Recognize a compatible presentation", [
                AttributedBullet("Fever with cough, runny nose and conjunctivitis can precede a rash spreading from the head downward. Immunocompromised patients may lack the typical rash.", citationIDs: ["depth9_measles_clinical"]),
                AttributedBullet("Measles can spread before the rash: the usual infectious period extends from four days before through four days after rash onset.", citationIDs: ["depth9_measles_clinical"])
            ]),
            .bullets(title: "Separate the patient at first contact", [
                AttributedBullet("Provide a facemask and separate suspected cases promptly at triage. Use Standard and Airborne Precautions with immediate airborne infection isolation room placement.", citationIDs: ["depth9_measles_control"]),
                AttributedBullet("If no AIIR is available, keep the masked patient in a private room with the door closed while arranging transfer to an appropriate facility.", citationIDs: ["depth9_measles_control"])
            ]),
            .bullets(title: "Use respiratory protection correctly", [
                AttributedBullet("Staff entering the care area need a fit-tested NIOSH-approved N95 or more protective respirator, regardless of presumptive measles immunity.", citationIDs: ["depth9_measles_control"]),
                AttributedBullet("Unprotected shared-air exposure can occur while an infectious patient is present or for up to two hours after departure. Report potential exposures promptly.", citationIDs: ["depth9_measles_worker"])
            ]),
            .bullets(title: "Arrange testing and notification", [
                AttributedBullet("Suspected measles requires immediate public-health notification. Coordinate testing through the clinical and public-health teams; do not wait for a confirmed result to report.", citationIDs: ["depth9_measles_clinical"]),
                AttributedBullet("CDC recommends serum plus a throat or nasopharyngeal swab at first contact. Measles-specific IgM and RT-PCR support confirmation; urine can sometimes add detection.", citationIDs: ["depth9_measles_clinical"])
            ]),
            .bullets(title: "Plan essential transport", [
                AttributedBullet("Limit transport to essential purposes, notify the receiving area and have the patient wear a facemask if tolerated. Transporting staff use appropriate respiratory protection.", citationIDs: ["depth9_measles_control"]),
                AttributedBullet("Before arrival, telephone triage and emergency-service handoffs can arrange the entry route and precautions, reducing exposure in shared waiting areas.", citationIDs: ["depth9_measles_control"])
            ]),
            .bullets(title: "Distinguish isolation endpoints", [
                AttributedBullet("CDC uses four days after rash onset for routine airborne isolation, counting rash onset as day zero; immunocompromised patients remain isolated through the illness.", citationIDs: ["depth9_measles_control"]),
                AttributedBullet("Empty-room clearance depends on ventilation and facility engineering assessment; it can take up to two hours. Unprotected entry should await the required clearance interval.", citationIDs: ["depth9_measles_control"])
            ]),
            .bullets(title: "Follow occupational-health assessment", [
                AttributedBullet("Exposed asymptomatic staff with documented immunity usually need daily symptom monitoring from day five after first exposure through day 21 after last exposure.", citationIDs: ["depth9_measles_worker"]),
                AttributedBullet("Staff without evidence of immunity need prompt occupational-health assessment for prophylaxis and work restrictions. Prior vaccination and exposure dates change the applicable pathway.", citationIDs: ["depth9_measles_worker"])
            ]),
            .bullets(title: "Watch for complications", [
                AttributedBullet("Pneumonia and encephalitis are serious complications. Adults, pregnant people and immunocompromised patients can have increased risk of severe disease.", citationIDs: ["depth9_measles_clinical"]),
                AttributedBullet("An exposed staff member who develops compatible symptoms should contact occupational health before returning to patient care; symptomatic and immunocompromised personnel have specific exclusion requirements.", citationIDs: ["depth9_measles_worker"])
            ])
        ],
        citations: [depth9_measles_clinical, depth9_measles_control, depth9_measles_worker],
        lastSourceFidelityReview: "2026-09-17"
    )
}
