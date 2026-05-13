import Foundation

// Curator-model procedure + reference entries (round 10 expansion).
// Sources: Open RN Skills + Health Alterations (CC BY 4.0), OpenStax (CC BY 4.0 with AI restriction),
// CDC + AAPCC + NCSBN concept citations.

private let openrnSkR10p = CitationSource(
    id: "openrn_skills_round10",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=charcoal+naloxone+specimen",
    lastRetrieved: "2026-05-04"
)
private let openrnHar10 = CitationSource(
    id: "openrn_ha_round10_proc",
    shortName: "Open RN Health Alterations + Mental Health",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=toxidrome+STI+TB",
    lastRetrieved: "2026-05-04"
)
private let openstaxR10p = CitationSource(
    id: "openstax_round10_proc",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let cdcRefR10 = CitationSource(
    id: "cdc_ref_round10",
    shortName: "CDC STI Treatment Guidelines + TB testing",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/std/treatment-guidelines/",
    lastRetrieved: "2026-05-04"
)
private let aapccRefR10 = CitationSource(
    id: "aapcc_ref_round10",
    shortName: "AAPCC poisoning + naloxone administration (concept citation)",
    publisher: "AAPCC · SAMHSA · NHTSA naloxone training",
    license: .factCitationOnly,
    url: "https://aapcc.org/clinical-guidelines",
    lastRetrieved: "2026-05-04"
)
private let ncsbnRefR10 = CitationSource(
    id: "ncsbn_ref_round10",
    shortName: "NCSBN Clinical Judgment Measurement Model (concept citation)",
    publisher: "National Council of State Boards of Nursing",
    license: .factCitationOnly,
    url: "https://www.ncsbn.org/exams/clinical-judgment-measurement-model.page",
    lastRetrieved: "2026-05-04"
)

private let safetyR10 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let pharmRefR10 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)
private let infectionRefR10 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection)
private let cjmmRefR10 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety)

// MARK: - Activated Charcoal Administration

public enum ActivatedCharcoalSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "activated-charcoal",
        title: "Activated charcoal administration",
        subtitle: "Single dose vs MDAC · timing matters · airway-protective",
        nclexTags: safetyR10,
        indications: AttributedProse(
            "Acute toxic ingestion within ~1–2 hours, where toxin is adsorbed by charcoal AND patient is alert with intact airway-protective reflexes (or intubated). Multi-dose activated charcoal (MDAC) for life-threatening ingestions of theophylline, carbamazepine, dapsone, phenobarbital, quinine per primary source.",
            citationIDs: ["openrn_skills_round10", "aapcc_ref_round10"]
        ),
        contraindications: AttributedProse(
            "AMS without airway protection (intubate first); ingestion >1–2 hours ago (limited benefit unless MDAC indication); corrosive ingestion (acids, alkalis); hydrocarbons (aspiration risk + not adsorbed); non-adsorbable toxins (lithium, iron, lead, alcohols); GI obstruction or perforation.",
            citationIDs: ["openrn_skills_round10"]
        ),
        equipment: [
            AttributedBullet("Activated charcoal premixed slurry (or powder + sorbitol mixture per facility); typical adult dose 1 g/kg (max ~50–100 g).", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Drinking cup with straw OR NG tube (small-bore for slurry); suction at bedside.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Emesis basin; gloves; gown; eye protection.", citationIDs: ["openrn_skills_round10"])
        ],
        preProcedure: [
            AttributedBullet("Verify ingestion (substance, time, amount); contact poison control.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Assess mental status, airway-protective reflexes, hemodynamic stability.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Position upright (HOB ≥30°) or lateral if intubated.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Antiemetic per provider — vomiting common.", citationIDs: ["openrn_skills_round10"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene + don PPE", body: "Gloves, gown, eye protection — charcoal stains everything.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 2, title: "Verify airway", body: "Patient alert and able to swallow safely OR intubated with secured airway. Do NOT administer to unprotected airway.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 3, title: "Administer slurry", body: "Mix vigorously; have patient drink through straw (faster than spoon). For NG: instill slowly via gravity over 5–10 min; flush with water.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 4, title: "MDAC if indicated", body: "For multi-dose protocol — repeat 0.25–0.5 g/kg every 2–4 hours per primary source. Risk of bowel obstruction with prolonged use.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 5, title: "Monitor + reassess", body: "Continuous monitoring for vomiting and aspiration; reassess airway and bowel sounds.", citationIDs: ["openrn_skills_round10"])
        ],
        postProcedure: [
            AttributedBullet("Document time, dose, patient tolerance, airway protection assessment.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Counsel that stools will be black for several days.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Coordinate ongoing toxicology workup, antidote administration, and possibly hemodialysis per provider.", citationIDs: ["openrn_skills_round10"])
        ],
        documentation: [
            AttributedBullet("Time of ingestion / time of charcoal, dose, route (PO vs NG), patient response, vital signs, mental status.", citationIDs: ["openrn_skills_round10"])
        ],
        watchFor: [
            AttributedBullet("ASPIRATION — most serious complication; airway must be intact OR secured before administration.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Vomiting and re-aspiration of charcoal — antiemetic prophylaxis; lateral position if vomiting.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Bowel obstruction with multi-dose use; assess bowel function.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("DOES NOT bind alcohols, iron, lithium, lead, fluoride, hydrocarbons, corrosives — limited or no benefit; coordinate with poison control.", citationIDs: ["openrn_skills_round10"])
        ],
        citations: [openrnSkR10p, openstaxR10p, aapccRefR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Naloxone Administration

public enum NaloxoneAdministrationSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "naloxone-administration",
        title: "Naloxone administration (clinical + community)",
        subtitle: "Intranasal / IM / IV · short half-life · multiple doses common",
        nclexTags: pharmRefR10,
        indications: AttributedProse(
            "Suspected opioid overdose with respiratory depression / unresponsiveness. Naloxone is non-controlled and available without prescription in all U.S. states for community administration (Narcan nasal spray OTC FDA-approved 2023) per primary source.",
            citationIDs: ["openrn_skills_round10", "aapcc_ref_round10"]
        ),
        contraindications: AttributedProse(
            "None in true overdose. Use lowest effective dose to restore breathing in known opioid-dependent patients to avoid precipitated severe withdrawal (which is unpleasant but not life-threatening per se).",
            citationIDs: ["openrn_skills_round10"]
        ),
        equipment: [
            AttributedBullet("Naloxone — intranasal 4 mg pre-filled atomizer (Narcan), or 8 mg (Kloxxado), or IM auto-injector (Evzio), or IV/IM 0.4 mg vial.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Bag-valve mask (BVM); oxygen if available; pulse oximeter.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Phone — call 911 / activate rapid response.", citationIDs: ["openrn_skills_round10"])
        ],
        preProcedure: [
            AttributedBullet("Assess scene safety; check for breathing, pulse, responsiveness.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Activate emergency response (911 / facility code) — naloxone is bridging therapy, not definitive.", citationIDs: ["openrn_skills_round10"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Open airway + start rescue breaths", body: "If not breathing or breathing inadequately, support breathing with rescue breaths or BVM (10 breaths/min) per primary source.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 2, title: "Administer naloxone INTRANASAL (community / clinical)", body: "Tilt head back, support neck. Insert atomizer fully into one nostril until fingers touch base of nose. Press plunger firmly — full dose. Use other nostril for second dose if needed.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 3, title: "OR Administer IM", body: "0.4 mg IM (deltoid or thigh) per primary source — onset 2–5 min; can repeat every 2–3 min.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 4, title: "OR Administer IV (clinical setting)", body: "0.04–0.4 mg IV (titrate up); IV onset is fastest (1–2 min). Slow titration in opioid-dependent patient to avoid severe withdrawal.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 5, title: "Continue rescue breathing", body: "Continue ventilation between doses; reassess breathing every 2–3 min.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 6, title: "Repeat doses", body: "Naloxone half-life 30–90 min — SHORTER than most opioids. Repeat every 2–3 min as needed; in fentanyl / synthetic opioid era often need MULTIPLE doses (sometimes 4–6+) per primary source.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 7, title: "Recovery position + monitor", body: "Once breathing restored, place in recovery (lateral) position. Continue monitoring for re-sedation when naloxone wears off.", citationIDs: ["openrn_skills_round10"])
        ],
        postProcedure: [
            AttributedBullet("Patient MUST be transported to ED for monitoring — naloxone half-life is shorter than most opioids; re-sedation common.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Coordinate referral to addiction medicine / MAT / harm-reduction; provide replacement naloxone kit and counseling.", citationIDs: ["openrn_skills_round10"])
        ],
        documentation: [
            AttributedBullet("Time of arrest / response, doses given, route, response, transport / handoff.", citationIDs: ["openrn_skills_round10"])
        ],
        watchFor: [
            AttributedBullet("RE-SEDATION — naloxone wears off in 30–90 min; long-acting opioids (methadone) and synthetic opioids (fentanyl, fluorofentanyl) outlast it.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("PRECIPITATED WITHDRAWAL — agitation, vomiting, diaphoresis, diarrhea; supportive; calm reassurance; do not over-titrate naloxone.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("ACUTE PULMONARY EDEMA (rare but reported) — supportive O2 / ventilation.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Co-ingestants common — assess for benzo / sedative co-overdose; supportive care.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Counsel community responders — call 911 ALWAYS; naloxone is bridging.", citationIDs: ["openrn_skills_round10"])
        ],
        citations: [openrnSkR10p, openstaxR10p, aapccRefR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - STI Specimen Collection

public enum STISpecimenSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "sti-specimen-collection",
        title: "STI specimen collection",
        subtitle: "NAAT urine + swab · 3-site testing for at-risk · trauma-informed",
        nclexTags: infectionRefR10,
        indications: AttributedProse(
            "Screening or symptomatic testing for gonorrhea, chlamydia, trichomoniasis, HSV, syphilis, HIV, hepatitis. Three-site (urethral / pharyngeal / rectal) testing for sexually active MSM, HIV-positive, or per CDC risk criteria per primary source.",
            citationIDs: ["openrn_skills_round10", "cdc_ref_round10"]
        ),
        contraindications: AttributedProse(
            "Refusal of testing; active vaginal bleeding may interfere with NAAT (can still collect; document). Use trauma-informed approach.",
            citationIDs: ["openrn_skills_round10"]
        ),
        equipment: [
            AttributedBullet("NAAT collection kits per site — vaginal / urethral swab, urine first-catch container, pharyngeal swab, rectal swab.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Speculum, lubricant (water-based), light source, sterile gloves; KOH and saline slides for wet mount if indicated.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Serology tubes for syphilis (RPR + treponemal), HIV (4th-gen Ag/Ab), hepatitis panel.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Specimen labels; transport bags; chain-of-custody if forensic.", citationIDs: ["openrn_skills_round10"])
        ],
        preProcedure: [
            AttributedBullet("Trauma-informed introduction; private space; explain procedure step-by-step; verbal consent.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Sexual history briefly (sites of exposure determine sites tested); pregnancy status.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Patient should NOT have urinated in past 1 hour for first-catch urine NAAT (per primary source).", citationIDs: ["openrn_skills_round10"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene + don gloves", body: "Standard precautions; sterile gloves for invasive cervical / urethral collection.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 2, title: "URINE NAAT (most common)", body: "First-catch urine (first 20–30 mL) — patient catches initial urine in cup (NOT mid-stream; this is reverse of standard UA). Most accurate for urethral chlamydia / gonorrhea per primary source.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 3, title: "VAGINAL self-collected swab", body: "Patient inserts swab 2 inches into vagina; rotate against vaginal walls × 10–30 sec; place in transport tube. EQUIVALENT to provider-collected for NAAT per primary source.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 4, title: "CERVICAL swab (with speculum)", body: "After speculum insertion, swab cervix firmly to obtain endocervical cells; rotate × 10 sec. Place in NAAT transport tube.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 5, title: "PHARYNGEAL swab", body: "Swab posterior pharynx and tonsils with NAAT swab (oral mucosa surface); place in transport. Often missed in STI screening despite high prevalence in MSM and oral-receptive partners per primary source.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 6, title: "RECTAL swab", body: "Insert NAAT swab 2–3 cm into anus; rotate against mucosa × 10 sec; place in transport.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 7, title: "GENITAL ULCER / vesicle workup", body: "PCR swab for HSV from base of vesicle / ulcer; serum syphilis RPR + treponemal; HIV.", citationIDs: ["openrn_skills_round10"]),
            ProcedureStep(number: 8, title: "Wet mount (BV / trichomoniasis / yeast)", body: "Saline slide for clue cells (BV) and motile trichomonads; KOH slide for whiff test (BV) and yeast hyphae. Increasingly replaced by NAAT panels.", citationIDs: ["openrn_skills_round10"])
        ],
        postProcedure: [
            AttributedBullet("Label every specimen at the bedside with patient identifiers, site, date / time, ordering provider.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Counsel result timing (typically 1–7 days); plan follow-up; provide contact info.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("EXPEDITED PARTNER THERAPY (EPT) where legally permitted; partner notification per primary source.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Counsel safer sex, condoms, PrEP eligibility, vaccinations (HPV, hepatitis B).", citationIDs: ["openrn_skills_round10"])
        ],
        documentation: [
            AttributedBullet("Sites tested, type of swab / specimen, patient tolerance, education provided, follow-up plan.", citationIDs: ["openrn_skills_round10"])
        ],
        watchFor: [
            AttributedBullet("EXTRA-GENITAL (pharyngeal / rectal) infections often missed if not specifically tested; counsel and screen all exposed sites.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Suspected sexual assault — coordinate with SANE (Sexual Assault Nurse Examiner) for forensic chain of custody.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Reassess for HIV PrEP eligibility — many STI patients are PrEP candidates.", citationIDs: ["openrn_skills_round10"]),
            AttributedBullet("Doxycycline post-exposure prophylaxis (Doxy-PEP) — emerging CDC-recommended for MSM / transgender women at risk per primary source.", citationIDs: ["cdc_ref_round10"])
        ],
        citations: [openrnSkR10p, openstaxR10p, cdcRefR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - NCSBN Clinical Judgment Measurement Model

public enum NCSBNCJMMSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ncsbn-cjmm",
        title: "NCSBN Clinical Judgment Measurement Model (CJMM)",
        subtitle: "6-step framework · NGN-aligned · concept reference",
        eyebrow: "REFERENCE · NCLEX",
        nclexTags: cjmmRefR10,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "The NCSBN Clinical Judgment Measurement Model (CJMM) is the cognitive framework underlying the Next-Generation NCLEX (NGN) examination launched April 2023. It defines six iterative cognitive steps nurses use to make sound clinical decisions. THIS IS A CONCEPT REFERENCE per primary source — apply the model in case-based reasoning and NGN preparation.",
                citationIDs: ["ncsbn_ref_round10"]
            )),
            .keyValueTable(title: "Six steps of the CJMM", [
                KeyValueRow(key: "1. Recognize cues", value: "Identify relevant data — vital signs, lab values, patient statements, history, physical findings; distinguish significant from background"),
                KeyValueRow(key: "2. Analyze cues", value: "Connect cues to clinical concepts; identify patterns; distinguish expected vs unexpected; differential reasoning"),
                KeyValueRow(key: "3. Prioritize hypotheses", value: "Rank possible problems by urgency, likelihood, risk; identify the highest-priority clinical concern"),
                KeyValueRow(key: "4. Generate solutions", value: "Brainstorm appropriate interventions for the priority hypothesis; consider risks, benefits, evidence"),
                KeyValueRow(key: "5. Take action", value: "Implement selected interventions; perform skills, administer medications, communicate, escalate appropriately"),
                KeyValueRow(key: "6. Evaluate outcomes", value: "Reassess after intervention; did the patient respond as expected? Adjust plan; continue cycle")
            ]),
            .keyValueTable(title: "NGN item types that test these steps", [
                KeyValueRow(key: "Bowtie", value: "Center action with two cause / two intervention boxes — tests recognize, analyze, take action"),
                KeyValueRow(key: "Trend", value: "Sequential vital signs / lab values — tests evaluate outcomes"),
                KeyValueRow(key: "Cloze (fill-in)", value: "Drop-down within a sentence — tests prioritize, generate solutions"),
                KeyValueRow(key: "Matrix multiple-response", value: "Grid of options × actions — tests analyze, generate"),
                KeyValueRow(key: "Highlight (drag-and-drop)", value: "Highlight relevant data in case study — tests recognize cues"),
                KeyValueRow(key: "Extended multiple response", value: "Select all that apply with partial credit — tests generate / take action")
            ]),
            .keyValueTable(title: "External factors that influence judgment", [
                KeyValueRow(key: "Environment", value: "Resources, technology, time pressure"),
                KeyValueRow(key: "Task complexity", value: "Acuity, novelty, risk"),
                KeyValueRow(key: "Cultural / situational", value: "Patient values, family dynamics, language, social determinants")
            ]),
            .keyValueTable(title: "Internal factors", [
                KeyValueRow(key: "Knowledge", value: "Foundational knowledge, evidence-based practice"),
                KeyValueRow(key: "Specialty", value: "Clinical experience and pattern recognition"),
                KeyValueRow(key: "Prior experience", value: "Similar cases inform pattern recognition"),
                KeyValueRow(key: "Time pressure", value: "Affects depth of reasoning")
            ]),
            .bullets(title: "Applying the CJMM at the bedside", [
                AttributedBullet("Use SBAR + CJMM together — SBAR for communication, CJMM for clinical reasoning.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Reflect after each acute event — what cues did I miss? What pattern did I recognize? Did my action work?", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Pre-conference / huddle — practice each step out loud to develop pattern recognition.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Worst-first prioritization — Maslow / ABCs / safety-first / acute-vs-chronic / unstable-vs-stable.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Always EVALUATE after acting — without reassessment the cycle is incomplete.", citationIDs: ["openrn_ha_round10_proc"])
            ])
        ],
        citations: [ncsbnRefR10, openrnHar10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CDC STI Treatment Guidelines Summary

public enum STIGuidelinesSummary {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cdc-sti-guidelines-summary",
        title: "CDC STI Treatment Guidelines summary",
        subtitle: "First-line regimens · screening intervals · partner therapy · concept reference",
        eyebrow: "REFERENCE · INFECTIOUS DISEASE",
        nclexTags: infectionRefR10,
        sections: [
            .prose(title: "Source", AttributedProse(
                "The CDC Sexually Transmitted Infections Treatment Guidelines (most recently 2021 with periodic updates) is the authoritative U.S. reference for STI diagnosis, treatment, and prevention. THIS IS A CONCEPT REFERENCE — verify the current published version before applying clinically.",
                citationIDs: ["cdc_ref_round10"]
            )),
            .keyValueTable(title: "First-line regimens (uncomplicated)", [
                KeyValueRow(key: "Gonorrhea", value: "Ceftriaxone 500 mg IM single dose (1 g if ≥150 kg); add doxycycline 100 mg PO BID × 7 days unless chlamydia excluded"),
                KeyValueRow(key: "Chlamydia", value: "Doxycycline 100 mg PO BID × 7 days (replaces single-dose azithromycin as preferred)"),
                KeyValueRow(key: "Chlamydia in pregnancy", value: "Azithromycin 1 g PO single dose (doxy contraindicated)"),
                KeyValueRow(key: "Syphilis (early)", value: "Benzathine penicillin G 2.4 million units IM single dose"),
                KeyValueRow(key: "Syphilis (late latent / tertiary)", value: "Benzathine penicillin G 2.4 million units IM weekly × 3"),
                KeyValueRow(key: "Neurosyphilis", value: "Aqueous penicillin G 18–24 million units/day IV × 10–14 days"),
                KeyValueRow(key: "Trichomoniasis (F)", value: "Metronidazole 500 mg PO BID × 7 days (preferred); single-dose 2 g PO acceptable in M"),
                KeyValueRow(key: "Genital herpes (primary)", value: "Acyclovir 400 mg PO TID × 7–10 days; valacyclovir 1 g PO BID × 7–10 days"),
                KeyValueRow(key: "Genital herpes suppression", value: "Valacyclovir 500 mg PO daily (1 g if ≥10 outbreaks/yr)"),
                KeyValueRow(key: "Bacterial vaginosis", value: "Metronidazole 500 mg PO BID × 7 days OR intravaginal gel × 5 days"),
                KeyValueRow(key: "Pelvic inflammatory disease (outpatient)", value: "Ceftriaxone 500 mg IM + doxycycline 100 mg PO BID + metronidazole 500 mg PO BID × 14 days")
            ]),
            .keyValueTable(title: "Screening intervals (CDC USPSTF)", [
                KeyValueRow(key: "Chlamydia / gonorrhea (women <25)", value: "Annual; rescreen in 3 months after treatment"),
                KeyValueRow(key: "Pregnant women", value: "Chlamydia + gonorrhea + syphilis + HIV + HBV at first prenatal visit; rescreen syphilis high-risk + at delivery"),
                KeyValueRow(key: "MSM", value: "At least annual chlamydia / gonorrhea (urethral, pharyngeal, rectal as exposed); syphilis; HIV every 3–6 months if at risk"),
                KeyValueRow(key: "HIV-positive sexually active", value: "Annual minimum or more frequent per risk"),
                KeyValueRow(key: "Universal", value: "HIV at least once age 13–64 per CDC")
            ]),
            .keyValueTable(title: "Expedited Partner Therapy (EPT) and reporting", [
                KeyValueRow(key: "EPT", value: "Provider-prescribed treatment for partner WITHOUT clinical evaluation — legally permitted in most U.S. states for chlamydia and gonorrhea per primary source"),
                KeyValueRow(key: "Reporting", value: "Most STIs are reportable to public health; partner notification services available through health department"),
                KeyValueRow(key: "Universal counseling", value: "Safer sex, condoms, PrEP eligibility, hepatitis B + HPV vaccination")
            ]),
            .keyValueTable(title: "Doxy-PEP (post-exposure)", [
                KeyValueRow(key: "Indication", value: "MSM / transgender women with bacterial STI in past year — REDUCES recurrent gonorrhea / chlamydia / syphilis per primary source"),
                KeyValueRow(key: "Dose", value: "Doxycycline 200 mg PO single dose within 72 hours of condomless sex"),
                KeyValueRow(key: "Status", value: "CDC 2024 recommendation; counsel about resistance monitoring + STI panel testing")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Counsel patient about diagnosis without judgment; confidentiality and respect.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Reinforce that partner treatment is necessary to prevent reinfection.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Offer / coordinate vaccinations — HPV (through age 26 routine, 27–45 shared decision), hepatitis B per primary source.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Assess HIV PrEP eligibility for any STI patient.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Document chain of custody and use SANE protocols for sexual-assault evaluations.", citationIDs: ["openrn_ha_round10_proc"])
            ])
        ],
        citations: [cdcRefR10, openrnHar10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - LTBI Testing Reference

public enum LTBITestingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ltbi-testing",
        title: "Latent TB infection (LTBI) testing reference",
        subtitle: "TST induration thresholds · IGRA pros / cons · who to test",
        eyebrow: "REFERENCE · INFECTIOUS DISEASE",
        nclexTags: infectionRefR10,
        sections: [
            .prose(title: "Source + framework", AttributedProse(
                "CDC and IDSA guide LTBI testing in the U.S. Two test types: tuberculin skin test (TST / Mantoux / PPD) and interferon-gamma release assay (IGRA — QuantiFERON, T-SPOT). THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["cdc_ref_round10"]
            )),
            .keyValueTable(title: "Who to TEST for LTBI (per CDC)", [
                KeyValueRow(key: "Recent close contacts", value: "Of person with infectious TB"),
                KeyValueRow(key: "HIV-positive", value: "All HIV+ patients should be screened"),
                KeyValueRow(key: "Immunocompromised", value: "TNF-α inhibitor candidates, transplant, chemotherapy, chronic steroids ≥15 mg prednisone equivalent ≥1 month"),
                KeyValueRow(key: "Immigrants / travelers", value: "From high-prevalence countries (Asia, Africa, Latin America, Eastern Europe)"),
                KeyValueRow(key: "Healthcare workers", value: "On hire and per protocol"),
                KeyValueRow(key: "Congregate settings", value: "Incarcerated, homeless shelters, long-term care"),
                KeyValueRow(key: "IV drug users", value: "Higher TB exposure risk"),
                KeyValueRow(key: "Children with risk exposure", value: "Especially <5 years")
            ]),
            .keyValueTable(title: "TST (Mantoux) — induration thresholds", [
                KeyValueRow(key: "≥5 mm POSITIVE", value: "HIV-positive, recent close contact, immunocompromised (TNF-α, transplant, ≥15 mg prednisone ≥1 mo), CXR with old fibrotic disease"),
                KeyValueRow(key: "≥10 mm POSITIVE", value: "Recent immigration from high-prevalence country (≤5 yr), IV drug user, congregate setting (jail, shelter, LTC, healthcare), child <5 yr, mycobacteriology lab personnel, certain medical conditions (DM, silicosis, CKD, leukemia, lymphoma, head/neck or lung cancer, weight loss ≥10%, gastrectomy, jejunoileal bypass)"),
                KeyValueRow(key: "≥15 mm POSITIVE", value: "Persons with NO known risk factors (general population)")
            ]),
            .keyValueTable(title: "IGRA (QuantiFERON, T-SPOT) — pros / cons", [
                KeyValueRow(key: "Pro — single visit", value: "No 48–72 hr return needed"),
                KeyValueRow(key: "Pro — BCG independent", value: "Not affected by prior BCG vaccination (vs TST)"),
                KeyValueRow(key: "Pro — objective", value: "Lab result; no reader-dependent error"),
                KeyValueRow(key: "Con — cost", value: "More expensive per test"),
                KeyValueRow(key: "Con — variability", value: "Indeterminate results possible; reduced sensitivity in immunocompromised"),
                KeyValueRow(key: "Indication", value: "Preferred per CDC for: BCG-vaccinated, persons unlikely to return for TST reading; either acceptable for most other groups")
            ]),
            .keyValueTable(title: "After positive screen — workup", [
                KeyValueRow(key: "Symptom screen", value: "Cough >3 wk, fever, night sweats, weight loss, hemoptysis"),
                KeyValueRow(key: "CXR", value: "PA + lateral; rule out active disease"),
                KeyValueRow(key: "Sputum AFB if active suspected", value: "3 specimens 8 hours apart; isolation if active"),
                KeyValueRow(key: "If LTBI confirmed", value: "Treat per CDC short-course preferred (3HP, 4R, 3HR) over older 9-month INH per primary source"),
                KeyValueRow(key: "Co-screen", value: "HIV, hepatitis B/C, baseline LFTs, pregnancy, alcohol use")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("TST administration — intradermal volar forearm, 0.1 mL of 5 TU PPD; create 6–10 mm wheal; READ at 48–72 hours measuring INDURATION (not erythema) in millimeters.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Counsel patient about return visit; document positive result and refer for evaluation.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Address stigma — LTBI is not contagious; treatment prevents reactivation, not exposure spread.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Coordinate with public health for active TB; ensure DOT (directly observed therapy) per primary source.", citationIDs: ["openrn_ha_round10_proc"])
            ])
        ],
        citations: [cdcRefR10, openrnHar10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Toxidromes Recognition Reference

public enum ToxidromesReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "toxidromes-recognition",
        title: "Toxidromes recognition reference",
        subtitle: "Anticholinergic / cholinergic / sympathomimetic / opioid / sedative · serotonin / NMS",
        eyebrow: "REFERENCE · TOXICOLOGY",
        nclexTags: pharmRefR10,
        sections: [
            .prose(title: "Framework", AttributedProse(
                "Toxidromes are clusters of signs and symptoms that suggest a class of poisoning. Rapid recognition narrows the differential and guides initial management before lab confirmation. THIS IS A CONCEPT REFERENCE per primary source — always pair clinical pattern with poison-control consultation.",
                citationIDs: ["aapcc_ref_round10"]
            )),
            .keyValueTable(title: "Anticholinergic", [
                KeyValueRow(key: "Mnemonic", value: "\"Hot, dry, blind, mad, red, full as a flask\""),
                KeyValueRow(key: "Signs", value: "Hyperthermia, anhidrosis, mydriasis (poor reflex), AMS / agitation, tachycardia, urinary retention, ileus"),
                KeyValueRow(key: "Causes", value: "TCAs, antihistamines, atropine / scopolamine, oxybutynin, antipsychotics, jimson weed"),
                KeyValueRow(key: "Antidote", value: "Physostigmine (severe; AVOID in TCA overdose); supportive + benzos for agitation"),
                KeyValueRow(key: "TCA pearl", value: "Sodium bicarbonate IV for QRS >100 ms")
            ]),
            .keyValueTable(title: "Cholinergic / organophosphate", [
                KeyValueRow(key: "Mnemonic", value: "SLUDGE-BBB or DUMBELS"),
                KeyValueRow(key: "Muscarinic", value: "Salivation, lacrimation, urination, defecation, GI cramps, emesis, bronchorrhea, bronchospasm, bradycardia"),
                KeyValueRow(key: "Nicotinic", value: "Fasciculations, weakness, paralysis"),
                KeyValueRow(key: "CNS", value: "Confusion, seizures"),
                KeyValueRow(key: "Causes", value: "Organophosphates / carbamates (insecticides), nerve agents (sarin), donepezil overdose"),
                KeyValueRow(key: "Antidote", value: "DECONTAMINATE first; ATROPINE high-dose to dry secretions; PRALIDOXIME for AChE reactivation; benzos for seizures")
            ]),
            .keyValueTable(title: "Sympathomimetic", [
                KeyValueRow(key: "Signs", value: "Hyperthermia, HTN, tachycardia, agitation, mydriasis (PRESERVED reflex), DIAPHORESIS"),
                KeyValueRow(key: "Causes", value: "Cocaine, methamphetamine, MDMA, bath salts, decongestants, prescription stimulants"),
                KeyValueRow(key: "Antidote", value: "BENZOS first-line; AVOID pure β-blockers (esp. cocaine); cooling for hyperthermia"),
                KeyValueRow(key: "vs Anticholinergic", value: "Sympathomimetic = DIAPHORETIC + responsive pupils; anticholinergic = DRY + sluggish pupils")
            ]),
            .keyValueTable(title: "Opioid", [
                KeyValueRow(key: "Triad", value: "Respiratory depression + MIOSIS (pinpoint) + AMS / coma"),
                KeyValueRow(key: "Other", value: "Bradycardia, hypotension, decreased bowel sounds"),
                KeyValueRow(key: "Causes", value: "Heroin, fentanyl, prescription opioids; iatrogenic / accidental"),
                KeyValueRow(key: "Antidote", value: "NALOXONE — IN, IM, IV; multiple doses common (especially fentanyl); BVM ventilation between doses")
            ]),
            .keyValueTable(title: "Sedative-hypnotic", [
                KeyValueRow(key: "Signs", value: "CNS depression / coma, NORMAL pupils (not miotic), respiratory depression less prominent than opioids unless mixed; nystagmus / slurred speech"),
                KeyValueRow(key: "Causes", value: "Benzodiazepines, barbiturates, GHB, alcohol, Z-drugs (zolpidem)"),
                KeyValueRow(key: "Antidote", value: "Benzo: FLUMAZENIL — selective use only (NOT chronic users / TCA co-overdose); supportive otherwise; barbiturate / alcohol — supportive only")
            ]),
            .keyValueTable(title: "Serotonin syndrome (vs NMS)", [
                KeyValueRow(key: "Onset", value: "Serotonin: HOURS; NMS: DAYS"),
                KeyValueRow(key: "Reflexes", value: "Serotonin: HYPER + clonus; NMS: NORMAL or BRADY"),
                KeyValueRow(key: "Pupils", value: "Serotonin: MYDRIASIS; NMS: NORMAL"),
                KeyValueRow(key: "Rigidity", value: "Serotonin: lower-extremity > upper, sometimes clonus; NMS: LEAD-PIPE generalized"),
                KeyValueRow(key: "Trigger", value: "Serotonin: serotonergic agent; NMS: neuroleptic / antipsychotic"),
                KeyValueRow(key: "Antidote", value: "Serotonin: STOP agent + benzos + cyproheptadine if moderate-severe; NMS: STOP agent + supportive + dantrolene / bromocriptine for severe")
            ]),
            .bullets(title: "Universal management principles", [
                AttributedBullet("ABCs first; protect airway; resuscitate.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Activate poison control (1-800-222-1222 in U.S.) early — they have the most current antidote and management guidance per primary source.", citationIDs: ["aapcc_ref_round10"]),
                AttributedBullet("Decontaminate when applicable — wash skin, remove clothing for organophosphate / chemical exposure; HCP wear PPE.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Activated charcoal in select acute ingestions <1–2 hours with intact airway.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Co-ingestants common — UDS, acetaminophen, salicylate are routine in altered patient.", citationIDs: ["openrn_ha_round10_proc"]),
                AttributedBullet("Fentanyl contamination — naloxone for any unresponsive patient with respiratory depression of unknown cause.", citationIDs: ["openrn_ha_round10_proc"])
            ])
        ],
        citations: [aapccRefR10, openrnHar10],
        lastSourceFidelityReview: "2026-05-04"
    )
}
