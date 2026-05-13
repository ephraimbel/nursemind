import Foundation

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
                    AttributedBullet("C. difficile (always SOAP AND WATER for hand hygiene; alcohol does not kill spores)", citationIDs: ["cdc_isolation_2007"]),
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
                    AttributedBullet("Influenza, COVID-19 (combined with airborne in some scenarios)", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Pertussis (whooping cough)", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Meningococcal disease (until 24 hours of effective therapy)", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Mumps, rubella, group A strep", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("RSV (some facilities)", citationIDs: ["cdc_isolation_2007"])
                ]),
                .bullets(title: "Droplet Precautions — how", [
                    AttributedBullet("Private room (or cohort with same organism); door may remain open.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Surgical mask within 3–6 feet of patient (per facility).", citationIDs: ["cdc_isolation_2007"]),
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
                    AttributedBullet("Using alcohol hand rub for C. difficile — alcohol does NOT kill spores. Use soap and water mechanical removal.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Using a surgical mask for TB or measles — these require an N95 respirator.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Failing to don PPE BEFORE entering the room — don in the anteroom or just outside, doff inside.", citationIDs: ["cdc_isolation_2007"]),
                    AttributedBullet("Combining precautions: varicella, disseminated zoster, and measles often need both Airborne AND Contact.", citationIDs: ["cdc_isolation_2007"])
                ])
            ],
            citations: [cdc],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
