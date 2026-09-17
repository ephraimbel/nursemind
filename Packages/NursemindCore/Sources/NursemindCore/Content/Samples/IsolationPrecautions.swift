import Foundation

private let depth9_measles_control = CitationSource(
    id: "depth9_measles_control",
    shortName: "Measles: Healthcare Infection Prevention",
    detail: "Interim guidance: triage; AIIR placement; respirators; transport; duration; room clearance. Page dated August 19, 2025. Federal prose adapted; images and third-party material excluded. Targeted statement correction only; independent clinical review pending.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/measles/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_flu_control = CitationSource(
    id: "depth9_flu_control",
    shortName: "Seasonal Influenza: Healthcare Prevention",
    detail: "Healthcare scope; Droplet Precautions; duration; transport; aerosol-generating procedures. Page dated April 28, 2025. Federal prose adapted; images and third-party material excluded. Targeted statement correction only; independent clinical review pending.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/flu/hcp/infection-control/healthcare-settings.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_transmission = CitationSource(
    id: "depth9_transmission",
    shortName: "Transmission-Based Precautions",
    detail: "Droplet Precautions: patient placement, mask upon room entry and transport. Page dated April 3, 2024. Federal prose adapted; images and third-party material excluded. Targeted statement correction only; independent clinical review pending.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/basics/transmission-based-precautions.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_hands = CitationSource(
    id: "depth9_hands",
    shortName: "Clinical Safety: Hand Hygiene",
    detail: "ABHS versus soap and water; C. difficile routine care and outbreaks; glove use. Page dated February 27, 2024. Federal prose adapted; images and third-party material excluded. Targeted statement correction only; independent clinical review pending.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/clean-hands/hcp/clinical-safety/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_cdiff_control = CitationSource(
    id: "depth9_cdiff_control",
    shortName: "C. difficile: Clinical Guidance",
    detail: "Isolation and Contact Precautions; diagnostic stewardship; environmental cleaning. Page dated May 13, 2026. Federal prose adapted; images and third-party material excluded. Targeted statement correction only; independent clinical review pending.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/c-diff/hcp/clinical-guidance/index.html",
    lastRetrieved: "2026-09-17"
)

public enum IsolationPrecautionsSample {
    public static let entry: ReferenceEntry = {
        let cdc = CitationSource(
            id: "cdc_isolation_2007",
            shortName: "CDC Guideline for Isolation Precautions, 2007 (Siegel JD, et al.)",
            detail: "Updated 2024 maintenance",
            publisher: "Centers for Disease Control and Prevention",
            license: .publicDomain,
            url: "https://www.cdc.gov/infection-control/hcp/isolation-precautions/",
            lastRetrieved: "2026-05-03"
        )

        let standardPrecautions: AttributedProse = AttributedProse(
            "Standard Precautions apply to all patients regardless of suspected or confirmed infection status. They are the foundation of infection control and include hand hygiene, use of PPE based on anticipated exposure, respiratory hygiene/cough etiquette, safe injection practices, sterile instruments, and appropriate environmental cleaning.",
            citationIDs: ["cdc_isolation_2007"]
        )

        return ReferenceEntry(
            id: "isolation-precautions",
            title: "Isolation precautions",
            subtitle: "Standard, Contact, Droplet, Airborne",
            eyebrow: "REFERENCE · INFECTION CONTROL",
            nclexTags: NCLEXTags(
                category: .safeAndEffectiveCare,
                subcategory: .safetyAndInfectionControl,
                priorityConcept: .infection
            ),
            sections: [
                .prose(title: "Standard Precautions", standardPrecautions),
                .bullets(title: "Contact Precautions — when", [
                    AttributedBullet("Multidrug-resistant organisms (MRSA, VRE, ESBL, CRE)", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("C. difficile — Contact Precautions while suspected infection is evaluated.", citationIDs: ["depth9_cdiff_control"]),
                    AttributedBullet("Norovirus", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Scabies, lice", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Major wound infections with uncontained drainage", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("RSV in pediatrics (some facilities — varies)", citationIDs: ["cdc_isolation_2007"])
                ]),
                .bullets(title: "Contact Precautions — how", [
                    AttributedBullet("Private room or cohorted with same organism.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Gown and gloves on entry; remove before exit; perform hand hygiene immediately.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Dedicated equipment when possible; disinfect shared equipment between patients.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Limit patient transport; if needed, ensure receiving area is notified.", citationIDs: ["cdc_isolation_2007"])
                ]),
                .bullets(title: "Droplet Precautions — when", [
                    AttributedBullet("Seasonal influenza. Follow separate pathogen-specific guidance for other respiratory viruses.", citationIDs: ["depth9_flu_control"]),
                    AttributedBullet("Pertussis (whooping cough)", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Meningococcal disease (until 24 hours of effective therapy)", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Mumps, rubella, group A strep", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("RSV (some facilities)", citationIDs: ["cdc_isolation_2007"])
                ]),
                .bullets(title: "Droplet Precautions — how", [
                    AttributedBullet("Private room (or cohort with same organism); door may remain open.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Wear a facemask on entry to the patient room or patient space.", citationIDs: ["depth9_transmission"]),
                    AttributedBullet("Patient wears surgical mask during transport.", citationIDs: ["cdc_isolation_2007"])
                ]),
                .bullets(title: "Airborne Precautions — when", [
                    AttributedBullet("Tuberculosis (active pulmonary)", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Measles (rubeola)", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Varicella (chickenpox) — also Contact", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Disseminated zoster (shingles)", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("SARS, MERS, novel respiratory pathogens (per CDC update)", citationIDs: ["cdc_isolation_2007"])
                ]),
                .bullets(title: "Airborne Precautions — how", [
                    AttributedBullet("Airborne Infection Isolation Room (AIIR) — negative pressure, 6–12 air changes per hour.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Door MUST remain closed.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Fit-tested N95 respirator (or PAPR) on entry.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Patient wears surgical mask during transport.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Limit room entry to immune personnel for measles, varicella when possible.", citationIDs: ["cdc_isolation_2007"])
                ]),
                .bullets(title: "Common errors — watch for", [
                    AttributedBullet("Skipping gown, gloves or hand hygiene with C. difficile.", citationIDs: ["depth9_hands"]),
                    AttributedBullet("Using a surgical mask for TB or measles — these require an N95 respirator.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Failing to don PPE BEFORE entering the room — don in the anteroom or just outside, doff inside.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Measles uses Standard and Airborne Precautions; Contact Precautions are added only for another indication.", citationIDs: ["depth9_measles_control"])
                ])
            ],
            citations: [cdc, depth9_cdiff_control, depth9_hands, depth9_transmission, depth9_flu_control, depth9_measles_control],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
