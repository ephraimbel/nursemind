import Foundation

public enum HandHygieneSample {
    public static let entry: ProcedureEntry = {
        let cdc = CitationSource(
            id: "cdc_hand_hygiene",
            shortName: "CDC Hand Hygiene in Healthcare Settings",
            detail: "Boyce JM, Pittet D et al. — Guideline for Hand Hygiene in Health-Care Settings",
            publisher: "Centers for Disease Control and Prevention",
            license: .publicDomain,
            url: "https://www.cdc.gov/clean-hands/hcp/index.html",
            lastRetrieved: "2026-05-03"
        )
        let openstax = CitationSource(
            id: "openstax_clinical_hh",
            shortName: "OpenStax Clinical Nursing Skills — Hand Hygiene",
            publisher: "OpenStax · Rice University",
            license: .ccBy4WithAIRestriction,
            url: "https://openstax.org/books/clinical-nursing-skills/pages/1-introduction",
            lastRetrieved: "2026-05-03"
        )
        let who = CitationSource(
            id: "who_5_moments",
            shortName: "WHO — My 5 Moments for Hand Hygiene",
            detail: "Cite-only — fact citation",
            publisher: "World Health Organization",
            license: .factCitationOnly,
            url: "https://www.who.int/teams/integrated-health-services/infection-prevention-control/hand-hygiene",
            lastRetrieved: "2026-05-03"
        )

        return ProcedureEntry(
            id: "hand-hygiene",
            title: "Hand hygiene",
            subtitle: "Alcohol-based hand rub and soap-and-water technique",
            nclexTags: NCLEXTags(
                category: .safeAndEffectiveCare,
                subcategory: .safetyAndInfectionControl,
                priorityConcept: .infection
            ),
            indications: AttributedProse(
                "Hand hygiene is the single most effective measure for preventing healthcare-associated infections. Perform per the WHO 5 Moments: before touching a patient, before clean/aseptic procedures, after body fluid exposure, after touching a patient, after touching patient surroundings.",
                citationIDs: ["cdc_hand_hygiene", "who_5_moments"]
            ),
            contraindications: nil,
            equipment: [
                AttributedBullet("Alcohol-based hand rub (60–95% alcohol) — preferred for routine decontamination unless hands are visibly soiled.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Soap (plain or antimicrobial) and running water — required when hands are visibly soiled, after using the restroom, or after caring for patients with C. difficile or norovirus (alcohol does not kill spores).", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Single-use paper towels.", citationIDs: ["cdc_hand_hygiene"])
            ],
            preProcedure: [
                AttributedBullet("Remove rings (other than a plain band), watch, and bracelets.", citationIDs: ["openstax_clinical_hh"]),
                AttributedBullet("Push sleeves above the elbows.", citationIDs: ["openstax_clinical_hh"]),
                AttributedBullet("Inspect hands for visible soil and skin breaks.", citationIDs: ["openstax_clinical_hh"])
            ],
            steps: [
                ProcedureStep(number: 1, title: "Apply product", body: "For alcohol rub: dispense ~3 mL into palm. For soap-and-water: wet hands first with warm water, then apply soap.", citationIDs: ["cdc_hand_hygiene", "openstax_clinical_hh"]),
                ProcedureStep(number: 2, title: "Cover all surfaces", body: "Rub palms together. Right palm over left dorsum, then left palm over right dorsum. Palm to palm with fingers interlaced. Backs of fingers against opposing palms with fingers interlocked. Rotational rubbing of each thumb. Rotational rubbing of fingertips against the opposing palm.", citationIDs: ["cdc_hand_hygiene"]),
                ProcedureStep(number: 3, title: "Duration", body: "Alcohol rub: continue rubbing until hands feel dry (typically 20 seconds). Soap-and-water: scrub for at least 20 seconds (about the time it takes to sing 'Happy Birthday' twice).", citationIDs: ["cdc_hand_hygiene"]),
                ProcedureStep(number: 4, title: "Rinse and dry (water method)", body: "Rinse hands thoroughly under running water with fingertips pointed down. Dry with a single-use paper towel.", citationIDs: ["cdc_hand_hygiene", "openstax_clinical_hh"]),
                ProcedureStep(number: 5, title: "Turn off faucet without recontaminating", body: "Use the paper towel to turn off the faucet (in non-touchless rooms). Discard the towel directly into the trash.", citationIDs: ["openstax_clinical_hh"])
            ],
            postProcedure: [
                AttributedBullet("Apply alcohol-free moisturizer at the start or end of shift to prevent skin breakdown — frequent hand hygiene + dry skin is a major reason for non-compliance.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Re-apply hand hygiene at every WHO 5 Moments trigger throughout the shift.", citationIDs: ["who_5_moments"])
            ],
            documentation: nil,
            watchFor: [
                AttributedBullet("Artificial nails are prohibited in direct patient care per CDC — they harbor pathogens and prevent thorough washing.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("C. difficile, norovirus, anthrax — soap and water mechanically removes spores; alcohol rub alone does NOT kill them.", citationIDs: ["cdc_hand_hygiene"])
            ],
            citations: [cdc, openstax, who],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
