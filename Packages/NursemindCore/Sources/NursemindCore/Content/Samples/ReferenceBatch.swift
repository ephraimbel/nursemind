import Foundation

private let depth9_hands = CitationSource(
    id: "depth9_hands",
    shortName: "Clinical Safety: Hand Hygiene",
    detail: "ABHS versus soap and water; C. difficile routine care and outbreaks; glove use. Page dated February 27, 2024. Federal prose adapted; images and third-party material excluded. Targeted statement correction only; independent clinical review pending.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/clean-hands/hcp/clinical-safety/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_noro_control = CitationSource(
    id: "depth9_noro_control",
    shortName: "Norovirus: Healthcare Outbreak Recommendations",
    detail: "2011 guideline summary: patient placement; hand hygiene; PPE; environmental cleaning; staff exclusion. Page dated March 21, 2024. Federal prose adapted; images and third-party material excluded. Targeted statement correction only; independent clinical review pending.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/norovirus-guidelines/summary-recommendations.html",
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

private let depth9_transmission = CitationSource(
    id: "depth9_transmission",
    shortName: "Transmission-Based Precautions",
    detail: "Droplet Precautions: patient placement, mask upon room entry and transport. Page dated April 3, 2024. Federal prose adapted; images and third-party material excluded. Targeted statement correction only; independent clinical review pending.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/basics/transmission-based-precautions.html",
    lastRetrieved: "2026-09-17"
)

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
        subtitle: "Facemask on room entry · private room",
        eyebrow: "REFERENCE · INFECTION CONTROL",
        nclexTags: infectionControlTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Droplet Precautions supplement Standard Precautions for relevant respiratory infections. Use a private room when possible, patient source control and a facemask on staff entry to the room or care space.",
                citationIDs: ["depth9_transmission"]
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
                AttributedBullet("Wear a facemask on entry to the patient room or patient space.", citationIDs: ["depth9_transmission"]),
                AttributedBullet("Patient wears a surgical mask during transport.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Eye protection if splashes/sprays are anticipated.", citationIDs: ["cdc_isolation_2007_v2"])
            ])
        ],
        citations: [cdcIsolation, depth9_transmission],
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
                AttributedBullet("C. difficile — use Contact Precautions and the facility hand-hygiene protocol.", citationIDs: ["depth9_cdiff_control"]),
                AttributedBullet("Norovirus — use outbreak-specific Contact Precautions and hand-hygiene measures.", citationIDs: ["depth9_noro_control"]),
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
                AttributedBullet("Skipping soap-and-water handwashing during C. difficile or norovirus outbreaks.", citationIDs: ["depth9_hands"]),
                AttributedBullet("Donning PPE inside the room — don in the anteroom or just outside the door.", citationIDs: ["cdc_isolation_2007_v2"]),
                AttributedBullet("Contaminating hands during glove removal or skipping hand hygiene after removing gloves.", citationIDs: ["depth9_hands"])
            ])
        ],
        citations: [cdcIsolation, depth9_cdiff_control, depth9_noro_control, depth9_hands],
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
                "CDC prefers alcohol-based sanitizer for most routine care unless hands are visibly soiled. Gloves do not replace hand hygiene.",
                citationIDs: ["depth9_hands"]
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
                AttributedBullet("After C. difficile care during outbreaks.", citationIDs: ["depth9_hands"]),
                AttributedBullet("After norovirus care during outbreaks.", citationIDs: ["depth9_hands"]),
                AttributedBullet("Before eating and after using the restroom.", citationIDs: ["cdc_hand_hygiene"])
            ])
        ],
        citations: [cdcHandHygiene, cdcIsolation, depth9_hands],
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
