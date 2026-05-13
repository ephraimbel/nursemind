import Foundation

// Curator-model reference entries.
// Sources: CDC (US gov, public domain), HICPAC, NHSN, ACIP, Joint Commission (concept citation).
// Each entry restructures public-domain federal guidance into editorial form with attribution.

private let cdcIsolation = CitationSource(
    id: "cdc_isolation_2007_v2",
    shortName: "CDC Guideline for Isolation Precautions, 2007 (Siegel JD et al.) — maintenance updated",
    detail: "Healthcare Infection Control Practices Advisory Committee (HICPAC)",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/isolation-precautions/",
    lastRetrieved: "2026-05-04"
)

private let cdcStandardPrecautions = CitationSource(
    id: "cdc_standard_precautions",
    shortName: "CDC Standard Precautions for All Patient Care",
    detail: "Section of CDC Isolation Precautions Guideline",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/standard-precautions/",
    lastRetrieved: "2026-05-04"
)

private let cdcHandHygiene = CitationSource(
    id: "cdc_hand_hygiene",
    shortName: "CDC Hand Hygiene in Healthcare Settings",
    detail: "Boyce JM, Pittet D, et al. — HICPAC/SHEA/APIC/IDSA Hand Hygiene Task Force",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/clean-hands/hcp/clinical-safety/",
    lastRetrieved: "2026-05-04"
)

private let cdcCLABSI = CitationSource(
    id: "cdc_clabsi_guideline",
    shortName: "CDC Guidelines for the Prevention of Intravascular Catheter-Related Infections",
    detail: "O'Grady NP et al. — HICPAC",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/intravascular-catheter-related-infection/",
    lastRetrieved: "2026-05-04"
)

private let cdcCAUTI = CitationSource(
    id: "cdc_cauti_guideline",
    shortName: "CDC Guideline for Prevention of Catheter-Associated Urinary Tract Infections",
    detail: "Gould CV et al. — HICPAC",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/cauti/",
    lastRetrieved: "2026-05-04"
)

private let cdcUSPHSPEP = CitationSource(
    id: "cdc_usphs_pep",
    shortName: "CDC / US Public Health Service — Updated Guidelines for Management of Occupational Exposures to HBV, HCV, and HIV",
    detail: "Kuhar DT et al. — recommendations for postexposure prophylaxis",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/niosh/healthcare/risk-factors/bloodborne-pathogens.html",
    lastRetrieved: "2026-05-04"
)

private let cdcACIPAdult = CitationSource(
    id: "cdc_acip_adult_2026",
    shortName: "CDC ACIP Adult Immunization Schedule (current annual edition)",
    detail: "Recommendations of the Advisory Committee on Immunization Practices",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/vaccines/hcp/imz-schedules/adult-age.html",
    lastRetrieved: "2026-05-04"
)

private let tjcDoNotUse = CitationSource(
    id: "tjc_do_not_use_list",
    shortName: "Joint Commission Official 'Do Not Use' List of Abbreviations",
    detail: "Concept citation — list of abbreviations is TJC-published",
    publisher: "The Joint Commission",
    license: .factCitationOnly,
    url: "https://www.jointcommission.org/standards/national-patient-safety-goals/",
    lastRetrieved: "2026-05-04"
)

private let osha = CitationSource(
    id: "osha_bloodborne",
    shortName: "OSHA Bloodborne Pathogens Standard, 29 CFR 1910.1030",
    detail: "Federal regulation — exposure control requirements",
    publisher: "Occupational Safety and Health Administration",
    license: .publicDomain,
    url: "https://www.osha.gov/bloodborne-pathogens",
    lastRetrieved: "2026-05-04"
)

private let infectionControlTags = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .safetyAndInfectionControl,
    priorityConcept: .infection
)

private let safetyTags = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .safetyAndInfectionControl,
    priorityConcept: .safety
)

// MARK: Standard Precautions

public enum StandardPrecautionsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "standard-precautions",
        title: "Standard Precautions",
        subtitle: "The infection-control floor for every patient, every encounter",
        eyebrow: "REFERENCE · INFECTION CONTROL",
        nclexTags: infectionControlTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Standard Precautions are the minimum infection-prevention practices that apply to all patient care, regardless of suspected or confirmed infection status, in any setting where healthcare is delivered. They are based on the principle that all blood, body fluids, secretions, excretions (except sweat), non-intact skin, and mucous membranes may contain transmissible infectious agents.",
                citationIDs: ["cdc_standard_precautions"]
            )),
            .bullets(title: "Components", [
                AttributedBullet("Hand hygiene before and after every patient contact, after PPE removal, and before invasive procedures.", citationIDs: ["cdc_standard_precautions", "cdc_hand_hygiene"]),
                AttributedBullet("PPE selected based on anticipated exposure — gloves for body fluid contact; gown if soiling expected; mask plus eye protection if splash or spray expected.", citationIDs: ["cdc_standard_precautions"]),
                AttributedBullet("Respiratory hygiene / cough etiquette — masks for coughing patients, tissues, hand hygiene after respiratory secretions.", citationIDs: ["cdc_standard_precautions"]),
                AttributedBullet("Safe injection practices — one needle, one syringe, one time; single-dose vials for one patient only.", citationIDs: ["cdc_standard_precautions"]),
                AttributedBullet("Safe handling of potentially contaminated equipment or surfaces — clean and disinfect per facility protocol.", citationIDs: ["cdc_standard_precautions"]),
                AttributedBullet("Sharps safety — never recap needles; activate engineered safety device; dispose immediately in puncture-resistant container.", citationIDs: ["cdc_standard_precautions", "osha_bloodborne"])
            ]),
            .bullets(title: "Common errors", [
                AttributedBullet("Skipping hand hygiene between patients in the same room or between tasks on the same patient.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Wearing the same gloves between patients — every patient gets fresh gloves and fresh hand hygiene.", citationIDs: ["cdc_standard_precautions"]),
                AttributedBullet("Recapping needles — never. Activate safety device and drop into sharps container.", citationIDs: ["cdc_standard_precautions", "osha_bloodborne"]),
                AttributedBullet("Treating Standard Precautions as a step down from isolation precautions — they are the floor, not the ceiling.", citationIDs: ["cdc_standard_precautions"])
            ])
        ],
        citations: [cdcStandardPrecautions, cdcHandHygiene, osha],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Airborne Precautions

public enum AirbornePrecautionsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "airborne-precautions",
        title: "Airborne Precautions",
        subtitle: "AIIR · N95 · door closed",
        eyebrow: "REFERENCE · INFECTION CONTROL",
        nclexTags: infectionControlTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Airborne Precautions are used for patients with infections transmitted by small-particle (≤5 micron) airborne droplet nuclei that remain suspended in air over long distances. They require an Airborne Infection Isolation Room (AIIR) — negative pressure with 6–12 air changes per hour — and a fit-tested N95 respirator or PAPR for healthcare personnel.",
                citationIDs: ["cdc_isolation_2007_v2"]
            )),
            .bullets(title: "When to use", [
                AttributedBullet("Tuberculosis (active pulmonary or laryngeal).", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Measles (rubeola).", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Varicella / chickenpox — combine with Contact Precautions.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Disseminated zoster, or localized zoster in an immunocompromised patient.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Smallpox, monkeypox (specific scenarios per CDC update).", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("SARS, MERS, novel respiratory pathogens per current CDC guidance.", citationIDs: ["cdc_isolation_2007_v2"])
            ]),
            .bullets(title: "How to implement", [
                AttributedBullet("Place patient in an AIIR — negative pressure, 6–12 air changes per hour, exhaust to outside or HEPA filtration.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Door must remain closed at all times except for entry and exit.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Don a fit-tested N95 respirator or higher (PAPR) BEFORE entering the room.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Limit transport — if transport is necessary, the patient wears a surgical mask and skin lesions are covered.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Limit room entry to immune personnel for measles and varicella when possible.", citationIDs: ["cdc_isolation_2007_v2"])
            ]),
            .bullets(title: "Common errors", [
                AttributedBullet("Using a surgical mask instead of an N95 — surgical masks do not protect against airborne transmission.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Leaving the door open — breaks negative pressure and exposes the corridor.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Failing to fit-test the N95 — facial seal is what makes the respirator work.", citationIDs: ["cdc_isolation_2007_v2"])
            ])
        ],
        citations: [cdcIsolation],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Droplet Precautions

public enum DropletPrecautionsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "droplet-precautions",
        title: "Droplet Precautions",
        subtitle: "Surgical mask within 3–6 feet · private room",
        eyebrow: "REFERENCE · INFECTION CONTROL",
        nclexTags: infectionControlTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Droplet Precautions are used for patients with infections transmitted by large respiratory droplets (>5 microns) that travel only short distances (typically less than 3–6 feet) before falling. Unlike airborne pathogens, droplets do not remain suspended — a private room is sufficient and door may remain open. A surgical mask is worn for close patient contact.",
                citationIDs: ["cdc_isolation_2007_v2"]
            )),
            .bullets(title: "When to use", [
                AttributedBullet("Influenza.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Pertussis (whooping cough).", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Meningococcal disease — until 24 hours of effective therapy.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Mumps, rubella.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Group A streptococcal pharyngitis or pneumonia (until 24 hours of effective therapy).", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Diphtheria (pharyngeal).", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Mycoplasma pneumonia.", citationIDs: ["cdc_isolation_2007_v2"])
            ]),
            .bullets(title: "How to implement", [
                AttributedBullet("Private room preferred; cohort with same organism if private room unavailable.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Door may remain open — droplets do not travel through air over distance.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Surgical mask within 3–6 feet of the patient (per facility protocol; some facilities mask on entry).", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Patient wears a surgical mask during transport.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Eye protection if splashes/sprays are anticipated.", citationIDs: ["cdc_isolation_2007_v2"])
            ])
        ],
        citations: [cdcIsolation],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Contact Precautions

public enum ContactPrecautionsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "contact-precautions",
        title: "Contact Precautions",
        subtitle: "Gown + gloves on entry · dedicated equipment",
        eyebrow: "REFERENCE · INFECTION CONTROL",
        nclexTags: infectionControlTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Contact Precautions are used for patients with infections transmitted by direct contact with the patient or indirect contact with the patient's environment. They require a gown and gloves on entry, dedicated patient-care equipment when possible, and dedicated attention to environmental cleaning.",
                citationIDs: ["cdc_isolation_2007_v2"]
            )),
            .bullets(title: "When to use", [
                AttributedBullet("Multidrug-resistant organisms — MRSA, VRE, ESBL-producing organisms, CRE.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Clostridioides difficile — soap and water for hand hygiene; alcohol-based hand rub does NOT inactivate spores.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Norovirus — also requires soap and water; alcohol is less effective.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Scabies, lice (pediculosis).", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Major non-contained wound infections, abscesses, decubitus ulcers with copious drainage.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("RSV in pediatric patients (varies by facility — some require Droplet + Contact).", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Varicella, disseminated zoster — combine with Airborne.", citationIDs: ["cdc_isolation_2007_v2"])
            ]),
            .bullets(title: "How to implement", [
                AttributedBullet("Private room preferred; cohort with same organism if needed.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Gown and gloves on entry — don BEFORE entering the room.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Remove gown and gloves at exit and perform hand hygiene immediately.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Use dedicated equipment (BP cuff, stethoscope, thermometer) when possible; disinfect any shared equipment between patients.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Limit transport; if transport is necessary, ensure receiving area is notified and equipment is contained.", citationIDs: ["cdc_isolation_2007_v2"])
            ]),
            .bullets(title: "Common errors", [
                AttributedBullet("Using alcohol hand rub for C. difficile — alcohol does NOT kill spores. Use soap and water mechanical removal.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Donning PPE inside the room — don in the anteroom or just outside the door.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Removing gloves before gown — sequence is gloves → goggles/face shield → gown → mask/respirator (per CDC PPE doffing sequence).", citationIDs: ["cdc_isolation_2007_v2"])
            ])
        ],
        citations: [cdcIsolation],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Hand Hygiene (CDC)

public enum HandHygieneReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "hand-hygiene-reference",
        title: "Hand hygiene — when and how",
        subtitle: "CDC / HICPAC clinical practice",
        eyebrow: "REFERENCE · INFECTION CONTROL",
        nclexTags: infectionControlTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Hand hygiene is the single most important measure to prevent the transmission of healthcare-associated infections. The CDC HICPAC/SHEA/APIC/IDSA Hand Hygiene Task Force recommends alcohol-based hand rub as the preferred method in most clinical situations because it is faster, more effective against most pathogens, and better tolerated by skin than soap and water. Soap-and-water washing is required when hands are visibly soiled and when caring for patients with C. difficile, norovirus, or other spore-forming or non-enveloped pathogens.",
                citationIDs: ["cdc_hand_hygiene"]
            )),
            .bullets(title: "When (CDC indications)", [
                AttributedBullet("Before touching a patient.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Before performing a clean or aseptic procedure (IV insertion, wound care, medication preparation).", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("After exposure or risk of exposure to body fluids.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("After touching a patient.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("After touching the patient's surroundings — bedrail, IV pump, chart — even if the patient was not touched.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Immediately after removing gloves.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Before donning sterile gloves for a procedure.", citationIDs: ["cdc_hand_hygiene"])
            ]),
            .bullets(title: "How — alcohol-based hand rub", [
                AttributedBullet("Apply enough product to cover all surfaces of both hands.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Rub palms, backs, between fingers, around thumbs, fingertips into opposite palm, and wrists.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Continue rubbing until hands are completely dry — typically 20–30 seconds.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Do NOT rinse or wipe — the alcohol must evaporate to fully act.", citationIDs: ["cdc_hand_hygiene"])
            ]),
            .bullets(title: "How — soap and water", [
                AttributedBullet("Wet hands with water; apply soap.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Rub all surfaces — palms, backs, between fingers, around thumbs, fingertips, wrists — for at least 20 seconds.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Rinse thoroughly under running water.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Dry with a single-use towel; use the towel to turn off the faucet.", citationIDs: ["cdc_hand_hygiene"])
            ]),
            .bullets(title: "Use soap and water (not alcohol) when…", [
                AttributedBullet("Hands are visibly soiled with blood, body fluids, or other contaminants.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Caring for a patient with C. difficile — alcohol does not inactivate spores.", citationIDs: ["cdc_hand_hygiene", "cdc_isolation_2007_v2"]),
                AttributedBullet("Caring for a patient with norovirus or other non-enveloped viruses — alcohol is less effective.", citationIDs: ["cdc_hand_hygiene"]),
                AttributedBullet("Before eating and after using the restroom.", citationIDs: ["cdc_hand_hygiene"])
            ])
        ],
        citations: [cdcHandHygiene, cdcIsolation],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: CLABSI Bundle

public enum CLABSIBundleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "clabsi-bundle",
        title: "CLABSI prevention bundle",
        subtitle: "Central line-associated bloodstream infection",
        eyebrow: "REFERENCE · INFECTION CONTROL",
        nclexTags: infectionControlTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Central line-associated bloodstream infections (CLABSI) are among the most preventable and most costly healthcare-associated infections. The CDC HICPAC bundle is a small set of evidence-based practices that, performed reliably as a unit, reduce CLABSI rates substantially. Every nurse caring for a patient with a central line is responsible for adhering to and enforcing each bundle element.",
                citationIDs: ["cdc_clabsi_guideline"]
            )),
            .bullets(title: "Insertion bundle (provider + nurse co-monitor)", [
                AttributedBullet("Hand hygiene immediately before insertion.", citationIDs: ["cdc_clabsi_guideline"]),
                AttributedBullet("Maximal sterile barrier precautions — cap, mask, sterile gown, sterile gloves, and a full-body sterile drape for the patient.", citationIDs: ["cdc_clabsi_guideline"]),
                AttributedBullet("Chlorhexidine skin antisepsis (>0.5% chlorhexidine in alcohol) — allow to dry completely before puncture.", citationIDs: ["cdc_clabsi_guideline"]),
                AttributedBullet("Optimal site selection — subclavian preferred over internal jugular; femoral avoided when possible due to higher infection risk.", citationIDs: ["cdc_clabsi_guideline"]),
                AttributedBullet("Daily review of line necessity — remove the line as soon as it is no longer required.", citationIDs: ["cdc_clabsi_guideline"])
            ]),
            .bullets(title: "Maintenance bundle (every shift)", [
                AttributedBullet("Hand hygiene before any line manipulation.", citationIDs: ["cdc_clabsi_guideline"]),
                AttributedBullet("Scrub the hub — disinfect the access port with alcohol or chlorhexidine for at least 15 seconds and allow to dry before access.", citationIDs: ["cdc_clabsi_guideline"]),
                AttributedBullet("Inspect the dressing every shift — change every 7 days for transparent or every 2 days for gauze, and any time it is wet, soiled, or loose.", citationIDs: ["cdc_clabsi_guideline"]),
                AttributedBullet("Replace administration sets per protocol — typically every 96 hours for fluids, every 24 hours for blood, every 12 hours for propofol.", citationIDs: ["cdc_clabsi_guideline"]),
                AttributedBullet("Daily assessment of necessity — advocate for line removal during rounds when no longer indicated.", citationIDs: ["cdc_clabsi_guideline"])
            ])
        ],
        citations: [cdcCLABSI],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: CAUTI Bundle

public enum CAUTIBundleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cauti-bundle",
        title: "CAUTI prevention bundle",
        subtitle: "Catheter-associated urinary tract infection",
        eyebrow: "REFERENCE · INFECTION CONTROL",
        nclexTags: infectionControlTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Catheter-associated urinary tract infections (CAUTI) are the most common healthcare-associated infection in the United States. The CDC HICPAC guideline emphasizes that the most effective CAUTI prevention is to avoid placing an indwelling catheter when not indicated, and to remove it as soon as it is no longer required. Every nurse on every shift should be assessing the necessity of every Foley.",
                citationIDs: ["cdc_cauti_guideline"]
            )),
            .bullets(title: "Appropriate indications for an indwelling catheter", [
                AttributedBullet("Acute urinary retention or bladder outlet obstruction.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("Need for accurate measurement of urinary output in a critically ill patient.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("Selected perioperative use — anticipated prolonged surgery, intraoperative monitoring, urologic surgery.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("To assist in healing of open sacral or perineal wounds in incontinent patients.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("Patient requires prolonged immobilization (e.g., unstable thoracic or lumbar spine).", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("End-of-life comfort care.", citationIDs: ["cdc_cauti_guideline"])
            ]),
            .bullets(title: "NOT appropriate indications", [
                AttributedBullet("Convenience or substitute for nursing care of an incontinent patient.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("Obtaining urine for culture or other diagnostic tests when the patient can voluntarily void.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("Postoperative use without a defined ongoing indication.", citationIDs: ["cdc_cauti_guideline"])
            ]),
            .bullets(title: "Insertion bundle", [
                AttributedBullet("Hand hygiene immediately before and after insertion.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("Aseptic technique with sterile equipment, sterile gloves, sterile drape, antiseptic cleansing solution.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("Use the smallest catheter that allows good drainage.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("Secure the catheter after insertion to prevent movement and urethral traction.", citationIDs: ["cdc_cauti_guideline"])
            ]),
            .bullets(title: "Maintenance bundle (every shift)", [
                AttributedBullet("Maintain a closed, sterile drainage system — disconnect only when necessary, and disinfect the catheter-tubing junction before reconnection.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("Keep the drainage bag below the level of the bladder at all times — including during transport.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("Empty the drainage bag regularly using a separate, clean container for each patient; avoid contact between the spigot and the container.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("Perform routine perineal hygiene with soap and water — antiseptic cleaning of the meatus is NOT recommended.", citationIDs: ["cdc_cauti_guideline"]),
                AttributedBullet("Daily review of catheter necessity — advocate for removal as soon as the indication has resolved.", citationIDs: ["cdc_cauti_guideline"])
            ])
        ],
        citations: [cdcCAUTI],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Bloodborne Pathogen Exposure

public enum BloodbornePathogenExposureSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "bloodborne-pathogen-exposure",
        title: "Needlestick / bloodborne exposure",
        subtitle: "First minutes after a percutaneous or mucocutaneous exposure",
        eyebrow: "REFERENCE · OCCUPATIONAL SAFETY",
        nclexTags: safetyTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "An occupational bloodborne pathogen exposure — needlestick, sharps injury, or significant mucous membrane / non-intact skin contact with blood or potentially infectious body fluid — requires immediate first aid and rapid reporting so that post-exposure prophylaxis (PEP) for HIV, HBV, and HCV can be initiated within the windows that make it effective. PEP for HIV is most effective when started within 2 hours and is generally not recommended after 72 hours.",
                citationIDs: ["cdc_usphs_pep", "osha_bloodborne"]
            )),
            .numberedSteps(title: "First minutes — what to do", [
                "Wash the exposure site immediately. For percutaneous injury or non-intact skin: wash with soap and water. For mucous membrane (eye, mouth, nose) exposure: irrigate with water or saline for at least 15 minutes. Do NOT apply bleach, alcohol, or caustic agents to the skin.",
                "Allow the wound to bleed freely; do not squeeze the site (no evidence that squeezing reduces transmission and it may cause further tissue damage).",
                "Report the exposure to your supervisor and to Employee Health / Occupational Health immediately — this is a time-sensitive medical event.",
                "Follow your facility's exposure protocol — typically baseline labs (HIV, HBV surface antibody/antigen, HCV antibody) for the exposed worker, and source-patient labs if consent can be obtained.",
                "Initiate HIV PEP per institutional protocol if indicated — ideally within 2 hours, generally not started after 72 hours per CDC/USPHS.",
                "Document the route, source, and circumstances of the exposure for the OSHA exposure record."
            ], citationIDs: ["cdc_usphs_pep", "osha_bloodborne"]),
            .bullets(title: "What you'll be assessed for", [
                AttributedBullet("Type of exposure — percutaneous (needle, scalpel) carries the highest risk; intact-skin contact carries minimal risk.", citationIDs: ["cdc_usphs_pep"]),
                AttributedBullet("Source patient infection status — known HIV-, HBV-, HCV-positive vs. unknown.", citationIDs: ["cdc_usphs_pep"]),
                AttributedBullet("Your immunization status — HBV vaccine series and current surface antibody titer.", citationIDs: ["cdc_usphs_pep"]),
                AttributedBullet("Volume and depth — large-bore hollow needle with visible blood is higher risk than a solid suture needle.", citationIDs: ["cdc_usphs_pep"])
            ]),
            .bullets(title: "Common errors", [
                AttributedBullet("Delaying the report to 'finish the shift' — the PEP window can close before the patient is even handed off.", citationIDs: ["cdc_usphs_pep"]),
                AttributedBullet("Applying bleach or harsh chemicals to the skin — increases tissue damage with no protective benefit.", citationIDs: ["cdc_usphs_pep"]),
                AttributedBullet("Failing to obtain source-patient consent for testing in time — every minute matters; involve the supervisor early.", citationIDs: ["cdc_usphs_pep"])
            ])
        ],
        citations: [cdcUSPHSPEP, osha],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Adult Immunization Schedule

public enum AdultImmunizationScheduleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "adult-immunization-schedule",
        title: "Adult immunization schedule",
        subtitle: "CDC ACIP — current annual recommendations",
        eyebrow: "REFERENCE · IMMUNIZATIONS",
        nclexTags: NCLEXTags(
            category: .healthPromotion,
            subcategory: .healthPromotion,
            priorityConcept: .infection
        ),
        sections: [
            .prose(title: "What it is", AttributedProse(
                "The CDC Advisory Committee on Immunization Practices (ACIP) publishes an annually updated adult immunization schedule that recommends vaccines by age, medical condition, and other indications. The schedule below summarizes the routine adult vaccines as of the listed retrieval date — always verify with the current ACIP schedule before counseling or administration, because recommendations change every year.",
                citationIDs: ["cdc_acip_adult_2026"]
            )),
            .keyValueTable(title: "Routine adult vaccines (verify current edition)", [
                KeyValueRow(key: "Influenza", value: "Annually, all adults ≥6 months."),
                KeyValueRow(key: "Tdap / Td", value: "Tdap once in adulthood, then Td or Tdap booster every 10 years. One dose of Tdap during each pregnancy (preferably 27–36 weeks)."),
                KeyValueRow(key: "MMR", value: "1–2 doses for adults without evidence of immunity (varies by birth year and risk)."),
                KeyValueRow(key: "Varicella", value: "2 doses for adults without evidence of immunity."),
                KeyValueRow(key: "Zoster (recombinant, RZV)", value: "2 doses for adults ≥50, or ≥19 if immunocompromised."),
                KeyValueRow(key: "HPV", value: "Routine through age 26; shared clinical decision-making 27–45."),
                KeyValueRow(key: "Pneumococcal", value: "Recommended for all adults ≥65 and for younger adults with risk conditions; check current ACIP schedule for PCV/PPSV sequencing."),
                KeyValueRow(key: "Hepatitis B", value: "Routine for adults 19–59; ≥60 with risk factors or by shared decision."),
                KeyValueRow(key: "Hepatitis A", value: "Adults at risk or by shared decision."),
                KeyValueRow(key: "Meningococcal", value: "By risk factor and age (military, college students in residence, asplenia, complement deficiency, occupational exposure)."),
                KeyValueRow(key: "RSV", value: "Per current ACIP recommendations for adults ≥60 and pregnant persons."),
                KeyValueRow(key: "COVID-19", value: "Per current CDC/ACIP guidance; updated annually.")
            ]),
            .bullets(title: "How to use this", [
                AttributedBullet("This is a summary, not a substitute for the current ACIP schedule. The full schedule includes contraindications, precautions, dosing intervals, catch-up rules, and risk-condition-specific recommendations.", citationIDs: ["cdc_acip_adult_2026"]),
                AttributedBullet("Always check the current annual ACIP adult immunization schedule before counseling, ordering, or administering.", citationIDs: ["cdc_acip_adult_2026"]),
                AttributedBullet("Verify pregnancy status and contraindications before live vaccines (MMR, varicella, RZV is NOT live).", citationIDs: ["cdc_acip_adult_2026"]),
                AttributedBullet("Document lot number, manufacturer, expiration, site, route, and the VIS edition date given to the patient.", citationIDs: ["cdc_acip_adult_2026"])
            ])
        ],
        citations: [cdcACIPAdult],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: TJC Do-Not-Use Abbreviations

public enum DoNotUseAbbreviationsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "do-not-use-abbreviations",
        title: "Do-not-use abbreviations",
        subtitle: "Joint Commission — official 'Do Not Use' list",
        eyebrow: "REFERENCE · DOCUMENTATION",
        nclexTags: safetyTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "The Joint Commission maintains an official 'Do Not Use' list of abbreviations, acronyms, symbols, and dose designations that have been associated with serious medication errors when misread. The list applies to all orders and all medication-related documentation, whether handwritten, electronic, or pre-printed. Use the spelled-out alternative every time.",
                citationIDs: ["tjc_do_not_use_list"]
            )),
            .keyValueTable(title: "Do not use → write instead", [
                KeyValueRow(key: "U or u (unit)", value: "Mistaken for 0, 4, or cc — write 'unit'."),
                KeyValueRow(key: "IU (international unit)", value: "Mistaken for IV or 10 — write 'international unit'."),
                KeyValueRow(key: "QD, QOD, Q.D., Q.O.D.", value: "Mistaken for each other — write 'daily' / 'every other day'."),
                KeyValueRow(key: "Trailing zero (X.0 mg)", value: "Decimal point missed — never use a trailing zero. Write 'X mg.'"),
                KeyValueRow(key: "Lacking leading zero (.X mg)", value: "Decimal point missed — always use a leading zero. Write '0.X mg.'"),
                KeyValueRow(key: "MS, MSO4, MgSO4", value: "Confused for each other — write 'morphine sulfate' or 'magnesium sulfate.'")
            ]),
            .bullets(title: "Why it matters", [
                AttributedBullet("Each abbreviation on this list has been associated with documented patient deaths or serious harm.", citationIDs: ["tjc_do_not_use_list"]),
                AttributedBullet("The cost of spelling out the word is one second; the cost of a misread is irreversible.", citationIDs: ["tjc_do_not_use_list"]),
                AttributedBullet("If a verbal order or handwritten note uses one of these abbreviations, do not interpret — call back and clarify.", citationIDs: ["tjc_do_not_use_list"])
            ])
        ],
        citations: [tjcDoNotUse],
        lastSourceFidelityReview: "2026-05-04"
    )
}
