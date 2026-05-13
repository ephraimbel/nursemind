import Foundation

// Curator-model procedures + reference (round 30 — ID depth: Mantoux + PICC + sputum AFB + ART/OI/antifungal/tropical reference).

private let openrnPRR30 = CitationSource(
    id: "openrn_pr_round30",
    shortName: "Open RN Nursing Skills + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcPRR30 = CitationSource(
    id: "cdc_pr_round30",
    shortName: "CDC + DHHS + IDSA + WHO concept citations",
    publisher: "CDC · DHHS · IDSA · WHO",
    license: .publicDomain,
    url: "https://clinicalinfo.hiv.gov/en/guidelines",
    lastRetrieved: "2026-05-13"
)
private let specialtyPRR30 = CitationSource(
    id: "specialty_pr_round30",
    shortName: "IDSA + HIVMA + ATS + IDSA + AASLD concept citations",
    publisher: "IDSA · HIVMA · ATS · AASLD",
    license: .factCitationOnly,
    url: "https://www.idsociety.org/practice-guideline/",
    lastRetrieved: "2026-05-13"
)

private let procTagsR30 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .infection
)
private let refTagsR30 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .infection
)

public enum TuberculinSkinTestSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "tuberculin-skin-test",
        title: "Tuberculin skin test (Mantoux PPD)",
        subtitle: "Intradermal 0.1 mL PPD · read induration 48-72h · 5/10/15 mm cutoffs by risk · BCG false-positive · IGRA alternative · 2-step testing for serial",
        nclexTags: procTagsR30,
        indications: AttributedProse(
            "Screening for latent or active tuberculosis (TB) infection — universal in healthcare workers, immigrants from high-prevalence countries, close contacts of TB cases, HIV+ patients, pre-immunosuppression / biologic / transplant candidates, homeless / incarcerated, IVDU, organ recipients, children in close contact. Alternative — interferon-γ release assay (IGRA — QuantiFERON, T-SPOT.TB) preferred for BCG-vaccinated + low-return populations per primary source.",
            citationIDs: ["specialty_pr_round30"]
        ),
        contraindications: AttributedProse(
            "History of severe reaction to prior TST (necrosis, ulceration, anaphylaxis); active vesicular skin disease at injection site; documented prior positive PPD (no need to repeat) — caution + alternatives.",
            citationIDs: ["specialty_pr_round30"]
        ),
        equipment: [
            AttributedBullet("Purified protein derivative (PPD-S) 5 tuberculin units in 0.1 mL.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("1 mL tuberculin syringe + 26-27 gauge intradermal needle.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Alcohol prep, gauze, marker for circling site.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Mantoux test record sheet + induration ruler.", citationIDs: ["openrn_pr_round30"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders + indication + prior PPD history.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Assess risk factors + BCG vaccination history (BCG can cause false-positive — IGRA preferred if BCG-vaccinated).", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("ASK about recent live vaccine — MMR, varicella, smallpox, BCG — within 4-6 weeks can cause FALSE-NEGATIVE TST; delay TST.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("Assess if patient can return in 48-72 hours for reading — critical; non-return → consider IGRA.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("Position — sitting; arm extended palm-up.", citationIDs: ["openrn_pr_round30"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Site preparation", body: "Volar surface of forearm (anterior + middle); 2-4 inches below antecubital crease; avoid lesions, hair, veins; clean with alcohol prep + allow to dry.", citationIDs: ["openrn_pr_round30"]),
            ProcedureStep(number: 2, title: "Intradermal injection", body: "Bevel UP at 5-15° angle; insert just below skin; inject 0.1 mL PPD INTRADERMALLY — pale BLEB OR WHEAL 6-10 mm forms; if no wheal forms (subcutaneous injection or leakage) → repeat at different site immediately + document.", citationIDs: ["openrn_pr_round30"]),
            ProcedureStep(number: 3, title: "Marking + documentation", body: "Lightly circle site with skin marker (do not cover); date + time + dose + lot + manufacturer + administrator; instruct patient on care + return for reading.", citationIDs: ["openrn_pr_round30"]),
            ProcedureStep(number: 4, title: "Patient instructions", body: "AVOID — covering, scratching, rubbing, applying lotions, getting wet repeatedly; minor erythema acceptable; SEEK CARE immediately for severe reaction (vesicles, ulceration, large blister).", citationIDs: ["openrn_pr_round30"]),
            ProcedureStep(number: 5, title: "Reading at 48-72 hours", body: "Measure INDURATION (palpable raised firm area — NOT erythema) using ballpoint pen technique — gently roll pen toward induration → resistance at edge → mark; measure with millimeter ruler across forearm (transverse to long axis); record in mm per primary source.", citationIDs: ["openrn_pr_round30"]),
            ProcedureStep(number: 6, title: "Interpretation by risk", body: "≥5 mm POSITIVE — HIV+, close contacts of active TB, organ transplant + immunosuppressed, CXR with prior TB; ≥10 mm POSITIVE — IVDU, healthcare workers + lab personnel, immigrants from high-prevalence (within 5 years), homeless / incarcerated, children <5, those with medical conditions (diabetes, CKD, silicosis); ≥15 mm POSITIVE — no risk factors.", citationIDs: ["specialty_pr_round30"]),
            ProcedureStep(number: 7, title: "Two-step testing", body: "First-time testing in healthcare workers + adults — initial PPD followed by SECOND PPD 1-3 weeks later if first negative; second positive → BOOSTER phenomenon (latent TB) vs new conversion → treat as latent.", citationIDs: ["specialty_pr_round30"])
        ],
        postProcedure: [
            AttributedBullet("Document — site, dose, lot, induration in mm, interpretation, follow-up.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("POSITIVE PPD — CXR + clinical symptoms eval to RULE OUT active TB; if active suspected → 3 sputum AFB smears + culture + isolation; if latent + chest x-ray negative + no symptoms → treat latent TB (INH 9 months OR rifampin 4 months OR 3HP — INH + rifapentine weekly × 12 weeks).", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("NEGATIVE PPD in immunocompromised — false-negative possible; consider IGRA + clinical evaluation.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("Public health notification + contact investigation if active TB.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("BCG-vaccinated + ambiguous — IGRA preferred (no BCG cross-reactivity).", citationIDs: ["specialty_pr_round30"])
        ],
        documentation: [
            AttributedBullet("Date + time of injection, site, dose, lot, manufacturer; reader + reading date/time; induration in mm; interpretation (positive/negative); follow-up plan.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("If positive — chest X-ray date + result + treatment plan.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("Patient education + handout given.", citationIDs: ["openrn_pr_round30"])
        ],
        watchFor: [
            AttributedBullet("FALSE NEGATIVE in immunocompromised, malnourished, infants <6 weeks, viral illness, recent live vaccine, overwhelming TB, anergy — consider IGRA or treat clinically.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("FALSE POSITIVE from BCG vaccine, nontuberculous mycobacteria; IGRA preferred for BCG-vaccinated (no cross-reactivity).", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("BOOSTER PHENOMENON — initial negative in remote infection; second PPD becomes positive; two-step testing identifies vs conversion.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("ANERGY — severe immunocompromise; absent response to any antigen; clinical evaluation primary.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("SEVERE REACTIONS — necrosis, ulceration, blister — uncommon; document + avoid retesting.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("PATIENT NON-RETURN — common issue; IGRA single-visit alternative.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("ACTIVE TB — emergent workup; isolation (airborne precautions, negative-pressure room, N95); public health notification.", citationIDs: ["cdc_pr_round30"]),
            AttributedBullet("LATENT TB treatment — INH 9 mo, rifampin 4 mo, 3HP weekly × 12 weeks; LFT + neuropathy monitoring; hepatotoxicity risk especially with chronic alcohol + age >35.", citationIDs: ["specialty_pr_round30"])
        ],
        citations: [openrnPRR30, cdcPRR30, specialtyPRR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PICCLineCareSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "picc-line-management",
        title: "PICC line management",
        subtitle: "Peripherally inserted central catheter · long-term IV access · weekly dressing + flush + lock · CLABSI prevention · removal complications",
        nclexTags: procTagsR30,
        indications: AttributedProse(
            "Peripherally inserted central catheter (PICC) for long-term intravenous access (weeks-months) — IV antibiotics for OI + bacteremia + endocarditis, chemotherapy, parenteral nutrition (TPN), home infusion, frequent blood draws / repeated peripheral access. Inserted in antecubital vein (basilic preferred) → tip in superior vena cava (junction with right atrium). Reduces multiple peripheral sticks + reliable central access per primary source.",
            citationIDs: ["specialty_pr_round30"]
        ),
        contraindications: AttributedProse(
            "Severe coagulopathy uncorrected, active infection at insertion site, history of severe vein thrombosis in target extremity, end-stage renal disease (preserve veins for dialysis), severe contralateral edema, prior radiation / lymphedema affected extremity, breast cancer surgery same side (lymphedema risk), severely contracted veins.",
            citationIDs: ["specialty_pr_round30"]
        ),
        equipment: [
            AttributedBullet("Sterile PICC insertion kit — catheter (single/double/triple lumen), guidewire, dilator, sheath, sterile drape, gown, gloves, mask, eye protection.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Ultrasound guidance + microintroducer technique.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("Chlorhexidine + alcohol prep, sterile dressing kit, biopatch (chlorhexidine-impregnated disc).", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Sterile saline flush + heparin lock solutions; needleless connectors.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Tip verification — fluoroscopy OR ECG-guided OR post-insertion chest X-ray.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("Stat-Lock or other catheter securement device.", citationIDs: ["openrn_pr_round30"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders + indication + duration of need + planned infusions; CBC, INR/PT, platelet count, BUN/Cr; allergies; weight.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Examine both arms — vein selection (basilic preferred, then cephalic, then brachial); avoid affected side post-mastectomy, AV fistula side, contralateral to wound.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("PROCEDURAL CONSENT.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Standard precautions + sterile barrier + hand hygiene.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Anti-anxiety / analgesia per institutional protocol.", citationIDs: ["openrn_pr_round30"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Insertion (vascular access team)", body: "Sterile prep + drape; ultrasound-guided antecubital vein puncture (basilic preferred); microintroducer; guidewire; sheath dilation; catheter advanced to SVC; remove sheath; verify tip; secure with sutureless device; sterile dressing.", citationIDs: ["specialty_pr_round30"]),
            ProcedureStep(number: 2, title: "Tip verification", body: "POST-INSERTION CHEST X-RAY confirms tip location at SVC / cavoatrial junction; alternative — ECG-guided real-time during insertion; fluoroscopy in IR; document final position before use.", citationIDs: ["specialty_pr_round30"]),
            ProcedureStep(number: 3, title: "Daily care + assessment", body: "Inspect insertion site at every shift for signs of infection (redness, warmth, drainage, pain), thrombosis (swelling above site, pain, discoloration), occlusion, dislodgement, leakage; measure arm circumference baseline + daily.", citationIDs: ["openrn_pr_round30"]),
            ProcedureStep(number: 4, title: "Dressing change", body: "Sterile dressing change WEEKLY OR sooner if soiled / loose / damp; chlorhexidine + alcohol prep + dry; biopatch over insertion site; transparent sterile dressing; secure catheter; document.", citationIDs: ["openrn_pr_round30"]),
            ProcedureStep(number: 5, title: "Flushing + locking", body: "FLUSH with 10 mL sterile saline before + after each medication / blood draw; PULSATILE technique (\"start-stop\" to prevent biofilm); LOCK with heparin 10-100 U/mL or saline per institutional protocol after use; FORWARD-PUSH disconnect technique.", citationIDs: ["openrn_pr_round30"]),
            ProcedureStep(number: 6, title: "Blood draw", body: "DISCARD 5-10 mL waste first; aspirate sample; flush thoroughly per institution; document.", citationIDs: ["openrn_pr_round30"]),
            ProcedureStep(number: 7, title: "Removal", body: "Sterile technique; cut sutures / securement; remove catheter SMOOTHLY + SLOWLY; observe for resistance + breakage; measure length removed (verify intact); apply firm pressure 5-10 minutes; sterile occlusive dressing; document patient response.", citationIDs: ["specialty_pr_round30"])
        ],
        postProcedure: [
            AttributedBullet("Daily site assessment + measure arm circumference (above + below + at site); compare to baseline.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Sterile dressing change weekly OR sooner if compromised; biopatch.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Flush + lock per protocol; pulsatile technique; forward-push disconnect.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Education — keep dry; avoid heavy lifting + repetitive motions of affected arm; sign / symptom counseling (fever, pain, swelling, redness, drainage, breathlessness).", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Home care or facility — coordinate continued care; supplies; emergency contact.", citationIDs: ["specialty_pr_round30"])
        ],
        documentation: [
            AttributedBullet("Insertion details — date, vein, length, tip position, complications, securement.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Daily — site assessment, flush, dressing condition, arm circumference, patient symptoms.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Removal — date, length removed, intact, complications.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("CLABSI surveillance + reporting per institutional + CDC.", citationIDs: ["cdc_pr_round30"])
        ],
        watchFor: [
            AttributedBullet("CENTRAL LINE-ASSOCIATED BLOODSTREAM INFECTION (CLABSI) — fever, chills, signs of sepsis; blood cultures from PICC + peripheral; CDC bundle includes chlorhexidine, hand hygiene, daily review of necessity, maximum sterile barrier.", citationIDs: ["cdc_pr_round30"]),
            AttributedBullet("THROMBOSIS — upper extremity DVT; arm swelling, pain, discoloration; ultrasound; anticoagulation usually; remove PICC controversial.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("CATHETER OCCLUSION — fibrin sheath, thrombus, drug precipitate, mechanical kink; tPA (alteplase) for thrombotic; saline + change technique for mechanical.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("CATHETER DISLODGEMENT / migration — verify tip position with CXR if accidental pulling; never push back in (infection risk).", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("PNEUMOTHORAX, hemothorax, arterial puncture — insertion complications (rare with US-guided PICC).", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("AIR EMBOLISM — clamp catheter when disconnected, Trendelenburg + left lateral if suspected.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("EXTRAVASATION — vesicant chemotherapy + medications; emergent + assessment.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("CATHETER BREAKAGE — measure length removed to verify intact; piece could embolize.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("ALLERGIC REACTIONS — to catheter material, chlorhexidine, heparin; uncommon.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("DAILY review of necessity — remove when no longer indicated to reduce CLABSI risk.", citationIDs: ["cdc_pr_round30"])
        ],
        citations: [openrnPRR30, cdcPRR30, specialtyPRR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SputumAFBCollectionSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "sputum-collection-afb",
        title: "Sputum collection for acid-fast bacilli (AFB)",
        subtitle: "TB diagnostic · 3 specimens 8-24h apart · early morning preferred · INDUCED sputum if not productive · airborne precautions · culture + smear + PCR",
        nclexTags: procTagsR30,
        indications: AttributedProse(
            "Diagnosis of pulmonary tuberculosis or non-tuberculous mycobacterial (NTM) disease — chronic cough >3 weeks + fever / weight loss / night sweats / hemoptysis; HIV+ with cough; close contacts of active TB; abnormal CXR; immigrants from high-prevalence countries; healthcare workers with suspected exposure. THREE specimens 8-24 hours apart improves sensitivity per primary source.",
            citationIDs: ["specialty_pr_round30"]
        ),
        contraindications: AttributedProse(
            "Severe respiratory distress (defer if unable to participate); hemoptysis active major; uncooperative patient (NG suction in pediatric / unable).",
            citationIDs: ["specialty_pr_round30"]
        ),
        equipment: [
            AttributedBullet("Sterile sputum collection cups (50 mL leak-proof); labels.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("HEPA filter / negative-pressure room for induction OR outdoor collection.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("N95 RESPIRATOR (NOT surgical mask) for healthcare worker during induction.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("Hypertonic saline 3% nebulizer + nebulizer + tubing for INDUCED SPUTUM if not productive.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("Toothbrush + water for oral rinse before specimen.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Bronchoscopy / BAL backup if sputum non-diagnostic.", citationIDs: ["specialty_pr_round30"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders + indication; respiratory isolation if TB suspected (AIRBORNE PRECAUTIONS, negative-pressure room, N95).", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("Patient education — instructions for proper collection (cough from deep in lungs, NOT saliva), 3 specimens 8-24 hours apart, early morning preferred.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("ORAL RINSE with water (NOT mouthwash) immediately before collection to reduce contamination.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Identify location — patient room with negative pressure OR outdoor / well-ventilated area.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("DOC mask / N95 fit-tested for healthcare worker; institutional respiratory protection policy.", citationIDs: ["specialty_pr_round30"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Spontaneous sputum collection", body: "Patient seated upright; deep breaths × 3-5; cough deeply from chest; spit into sterile container WITHOUT contaminating outside; close lid tightly; minimum 5 mL preferred; label with patient ID, date, time, specimen # (1, 2, 3 of 3).", citationIDs: ["openrn_pr_round30"]),
            ProcedureStep(number: 2, title: "Induced sputum (if not productive)", body: "Nebulize HYPERTONIC SALINE 3% × 5-20 minutes; produces mucus + induces cough; HIGH-RISK procedure for healthcare worker exposure (aerosol generation); REQUIRES negative-pressure room + N95; multiple specimens during induction; treat as infectious specimen.", citationIDs: ["specialty_pr_round30"]),
            ProcedureStep(number: 3, title: "Specimen handling", body: "Label all 3 specimens; transport in biohazard bag; store refrigerated 4°C if delay >1 hour; deliver to laboratory promptly (within 24 hours).", citationIDs: ["openrn_pr_round30"]),
            ProcedureStep(number: 4, title: "Specimen quality", body: "Assess — purulent OR mucoid (good) vs saliva (poor); reject saliva-only; minimum 5 mL preferred but smaller acceptable if good quality; LAB will perform smear + culture + PCR.", citationIDs: ["specialty_pr_round30"]),
            ProcedureStep(number: 5, title: "Lab processing", body: "ACID-FAST STAIN (Ziehl-Neelsen or auramine-rhodamine) within 24 hours for AFB; CULTURE — Lowenstein-Jensen solid + MGIT liquid; sensitive but takes 4-8 weeks; NUCLEIC ACID AMPLIFICATION TEST (NAAT) — Xpert MTB/RIF rapid PCR + rifampin resistance detection within hours; molecular susceptibility for other drugs.", citationIDs: ["specialty_pr_round30"]),
            ProcedureStep(number: 6, title: "Result interpretation", body: "AFB SMEAR positive — strongly suggests TB but doesn't speciate (could be NTM); NEGATIVE doesn't exclude (10^4 organisms/mL needed for smear); CULTURE confirms + speciates + susceptibility; PCR rapid confirmation + first-line rifampin resistance.", citationIDs: ["specialty_pr_round30"])
        ],
        postProcedure: [
            AttributedBullet("Continue airborne precautions until ACTIVE TB excluded (3 negative AFB smears) or treatment effective (typically 2 weeks of effective treatment).", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("Public health notification + contact investigation for active TB.", citationIDs: ["cdc_pr_round30"]),
            AttributedBullet("Patient education — TB treatment if positive (4-drug RIPE × 2 months → 2-drug × 4 months for drug-susceptible); DOT (directly observed therapy) often.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("Follow-up culture at month 2 — assesses treatment response; positive at 2 months → adjust regimen + susceptibility re-test.", citationIDs: ["specialty_pr_round30"])
        ],
        documentation: [
            AttributedBullet("Date + time of each collection; specimen quality + volume; method (spontaneous vs induced); patient cooperation.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Isolation status; precautions implemented.", citationIDs: ["openrn_pr_round30"]),
            AttributedBullet("Lab results — smear, culture, PCR susceptibility.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("Public health notification + contact tracing if active TB.", citationIDs: ["cdc_pr_round30"])
        ],
        watchFor: [
            AttributedBullet("HEALTHCARE WORKER EXPOSURE — N95 + negative-pressure room + minimize personnel during aerosol-generating procedures (induction, intubation, bronchoscopy).", citationIDs: ["cdc_pr_round30"]),
            AttributedBullet("SALIVA ONLY — poor quality specimen; rejected by lab; coach patient to cough deeper.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("FALSE NEGATIVE — paucibacillary disease (HIV+, immunocompromised); requires multiple specimens + culture + PCR + bronchoscopy if high suspicion.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("NTM colonization — sputum positive in structural lung disease without active disease; clinical context + culture susceptibility + ATS/IDSA criteria.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("DRUG-RESISTANT TB — rapid PCR for rifampin resistance (Xpert); culture-based susceptibility for full panel; MDR-TB (resistant INH + rifampin) + XDR-TB; specialized treatment.", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("HIV TB COINFECTION — paucibacillary, atypical presentation; ART + TB treatment timing (ART 2-8 weeks after TB therapy depending CD4).", citationIDs: ["specialty_pr_round30"]),
            AttributedBullet("CONTACT INVESTIGATION — public health notification + close contact testing + treatment of latent.", citationIDs: ["cdc_pr_round30"]),
            AttributedBullet("DIRECTLY OBSERVED THERAPY (DOT) — improves adherence; reduces resistance development; public health.", citationIDs: ["cdc_pr_round30"]),
            AttributedBullet("BRONCHOSCOPY / BAL if sputum non-diagnostic — increases yield in difficult-to-diagnose cases.", citationIDs: ["specialty_pr_round30"])
        ],
        citations: [openrnPRR30, cdcPRR30, specialtyPRR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ARTRegimenSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "art-regimen-selection",
        title: "Antiretroviral therapy (ART) regimen selection",
        subtitle: "DHHS preferred 1st-line (INSTI-based STR) · Biktarvy + Dovato + Triumeq · resistance testing · drug interactions · co-morbidities + pregnancy",
        eyebrow: "REFERENCE · ID",
        nclexTags: refTagsR30,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Antiretroviral therapy (ART) — combination of 3+ antiretroviral drugs targeting HIV at multiple stages. DHHS Adult + Adolescent Guidelines updated regularly; INSTI-based single-tablet regimens (STRs) preferred first-line. Goals — viral suppression (undetectable <50 copies/mL), CD4 recovery, prevent disease progression + transmission. Resistance testing before initiation; co-morbidities + drug interactions + pregnancy + adherence considered. Lifelong therapy + clinic visits per primary source.",
                citationIDs: ["specialty_pr_round30"]
            )),
            .keyValueTable(title: "DHHS preferred first-line (treatment-naive 2023+)", [
                KeyValueRow(key: "Biktarvy (BIC/FTC/TAF)", value: "Bictegravir 50 mg + emtricitabine 200 mg + tenofovir alafenamide 25 mg — once daily; INSTI-based STR; high genetic barrier; small + tolerable"),
                KeyValueRow(key: "Triumeq (DTG/ABC/3TC)", value: "Dolutegravir + abacavir + lamivudine — once daily; INSTI-based STR; HLA-B*5701 screen for abacavir hypersensitivity"),
                KeyValueRow(key: "Dovato (DTG/3TC)", value: "Dolutegravir + lamivudine — once daily; 2-drug regimen; treatment-naive with HBV-negative + HIV viral load <500,000 + no resistance"),
                KeyValueRow(key: "Cabenuva (CAB + RPV)", value: "Long-acting cabotegravir + rilpivirine — monthly OR every 2 months IM; for virologically suppressed switch; eliminates daily pill"),
                KeyValueRow(key: "Considerations", value: "HLA-B*5701 (abacavir), HBV co-infection (TDF/TAF active vs HBV), CKD (TAF safer than TDF), pregnancy (DTG ok per current guidelines), cost + access")
            ]),
            .keyValueTable(title: "Alternative + experienced regimens", [
                KeyValueRow(key: "Genvoya (EVG/COBI/FTC/TAF)", value: "Elvitegravir + cobicistat + FTC/TAF — once daily; INSTI-based; cobicistat boosts elvitegravir + complicates drug interactions"),
                KeyValueRow(key: "Odefsey (RPV/FTC/TAF)", value: "Rilpivirine + FTC/TAF — once daily; NNRTI-based; viral load <100,000 + CD4 >200 required; meal-dependent absorption"),
                KeyValueRow(key: "Atripla (EFV/FTC/TDF)", value: "Efavirenz + FTC/TDF — once daily; NNRTI-based; older but reliable; CNS side effects (vivid dreams, dizziness) + pregnancy concerns"),
                KeyValueRow(key: "Prezcobix + 2 NRTIs", value: "Darunavir/cobicistat + (TDF + 3TC OR ABC + 3TC) — PI-based; pregnancy + treatment-experienced + salvage"),
                KeyValueRow(key: "Salvage / MDR HIV", value: "Lenacapavir + optimized background regimen; specialized centers; severe resistance")
            ]),
            .keyValueTable(title: "Drug classes + key agents", [
                KeyValueRow(key: "Integrase inhibitors (INSTI)", value: "Bictegravir (BIC), dolutegravir (DTG), cabotegravir (CAB), elvitegravir (EVG, needs cobicistat boost), raltegravir (RAL); first-line; high genetic barrier (BIC, DTG); minimal interactions"),
                KeyValueRow(key: "NRTI backbone", value: "Tenofovir disoproxil fumarate (TDF) + tenofovir alafenamide (TAF — safer renal/bone), emtricitabine (FTC), lamivudine (3TC), abacavir (ABC — HLA-B*5701 screen), zidovudine (AZT — older)"),
                KeyValueRow(key: "NNRTI", value: "Efavirenz (EFV — CNS side effects + pregnancy), rilpivirine (RPV — meal-dependent), doravirine (DOR), nevirapine (NVP — rash + LFTs)"),
                KeyValueRow(key: "Protease inhibitors (PI)", value: "Darunavir (DRV — boosted), atazanavir (ATV), lopinavir-ritonavir (LPV/r) — boosted; CYP3A4 substrate + extensive interactions; cardiovascular + GI"),
                KeyValueRow(key: "Entry inhibitors", value: "Maraviroc (MVC — CCR5 antagonist, tropism testing required), enfuvirtide (T-20 — fusion inhibitor SC)"),
                KeyValueRow(key: "Capsid inhibitor", value: "Lenacapavir — first-in-class long-acting q6 month SC"),
                KeyValueRow(key: "Attachment inhibitor", value: "Fostemsavir (Rukobia) — salvage MDR HIV")
            ]),
            .keyValueTable(title: "Pre-ART workup", [
                KeyValueRow(key: "Confirm HIV", value: "4th-generation HIV-1/2 antigen-antibody test; HIV viral load (RNA) + CD4 count + CD4%"),
                KeyValueRow(key: "Genotype resistance testing", value: "HIV-1 genotypic resistance testing — protease + reverse transcriptase + integrase; tropism testing if maraviroc consideration; transmitted resistance in 5-15% treatment-naive"),
                KeyValueRow(key: "Co-infections", value: "Hepatitis A + B + C panels; syphilis (RPR); HSV; gonorrhea + chlamydia (urine + rectal + pharyngeal as indicated); TB screening (PPD or IGRA); CMV serology; toxoplasma serology"),
                KeyValueRow(key: "Comorbidities", value: "CBC, CMP, fasting lipids, fasting glucose / HbA1c, urinalysis, eGFR, urinary protein/Cr ratio (TDF nephrotoxicity baseline), 25-OH vitamin D, bone density (TDF for older), pregnancy test"),
                KeyValueRow(key: "Vaccinations", value: "Influenza annual, pneumococcal (PCV15 → PPSV23), hepatitis A + B if non-immune, HPV, Tdap, COVID-19, MMR + VZV if CD4 ≥200 + non-immune (LIVE — avoid if CD4 <200), Shingrix (recombinant, no live)"),
                KeyValueRow(key: "Mental health + social", value: "Depression + anxiety screening, substance use, housing + food security, support system, partner notification + treatment + PrEP for partners")
            ]),
            .bullets(title: "Initiation principles", [
                AttributedBullet("RAPID ART INITIATION — same day or within 1-2 weeks of HIV diagnosis; reduces transmission + improves outcomes per primary source.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("INSTI-based STR preferred for most — Biktarvy, Triumeq, Dovato.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("Pregnancy — DTG-based preferred per current DHHS perinatal guidelines (data accumulating, prior concern about NTD signal not confirmed); ART before + during + after pregnancy.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("HBV co-infection — TAF + FTC (or TDF + FTC) covers both; don't discontinue without HBV-active alternative (severe flare).", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("HCV co-infection — treat HCV with DAAs; some HIV ART affects DAA selection; coordinate.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("TB co-infection — coordinate ART + anti-TB; rifampin reduces many ART levels; rifabutin alternative; ART start 2-8 weeks after TB therapy.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("Renal disease — TAF preferred over TDF (CrCl >30); INSTI-based; avoid TDF in CrCl <50.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("Cardiovascular risk — abacavir may increase MI risk; balance.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("Mental health — efavirenz CNS side effects; alternatives available.", citationIDs: ["specialty_pr_round30"])
            ]),
            .bullets(title: "Monitoring + follow-up", [
                AttributedBullet("HIV viral load — q4-8 weeks until suppressed (<50 copies/mL) → q3-6 months stable → q12 months in long-term suppressed.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("CD4 count — q3-6 months until stable + ≥350; less frequent in long-term suppressed.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("Adherence + side effects + tolerability + drug interactions — every visit.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("Comprehensive comorbidity monitoring — fasting lipids, glucose, BUN/Cr, urinalysis, LFTs, weight, BP, mental health.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("Aging considerations — bone density, cognition, cardiovascular risk reduction, cancer screening, polypharmacy.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("Treatment failure — virologic failure + repeat resistance testing + tailor next regimen; ID specialist consultation.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("U=U — UNDETECTABLE = UNTRANSMITTABLE; sexual transmission risk effectively zero with sustained suppression; counsel + reduce stigma.", citationIDs: ["specialty_pr_round30"])
            ]),
            .bullets(title: "Prevention — PrEP + PEP", [
                AttributedBullet("HIV PrEP (pre-exposure prophylaxis) — TDF/FTC (Truvada) OR TAF/FTC (Descovy) daily oral; cabotegravir LA injectable q2 months.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("PrEP candidates — MSM with multiple partners + STI history, heterosexual with HIV+ partner not virally suppressed, IVDU, transgender, sexual workers; HIV testing q3 months + STI screening + adherence.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("HIV PEP (post-exposure prophylaxis) — 28 days of 3-drug ART within 72 hours of exposure; occupational + sexual / IVDU; baseline + 6-week + 12-week HIV testing.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("Treatment as prevention — virally suppressed HIV+ does NOT transmit sexually (U=U).", citationIDs: ["specialty_pr_round30"])
            ])
        ],
        citations: [openrnPRR30, cdcPRR30, specialtyPRR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum OIProphylaxisSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "opportunistic-infection-prophylaxis",
        title: "HIV opportunistic infection prophylaxis",
        subtitle: "CD4-driven · PCP CD4 <200 (TMP-SMX) · MAC CD4 <50 (azithromycin) · toxoplasmosis CD4 <100 (TMP-SMX) · stop on immune recovery",
        eyebrow: "REFERENCE · ID",
        nclexTags: refTagsR30,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Prophylaxis of opportunistic infections (OIs) in HIV/AIDS — based on CD4 count + specific risk factors. ART-induced immune recovery enables DISCONTINUATION of most primary prophylaxis after CD4 sustained above thresholds × 3-6 months. CDC + HIVMA + DHHS guidelines updated regularly. Knowing CD4 thresholds + duration + agent + alternative for intolerance is essential per primary source.",
                citationIDs: ["specialty_pr_round30"]
            )),
            .keyValueTable(title: "Pneumocystis pneumonia (PCP / PJP) — CD4 <200", [
                KeyValueRow(key: "Indication", value: "CD4 <200 OR oropharyngeal candidiasis (thrush) OR CD4 percentage <14% OR AIDS-defining illness OR previously had PCP (secondary prophylaxis)"),
                KeyValueRow(key: "First-line", value: "TRIMETHOPRIM-SULFAMETHOXAZOLE (TMP-SMX) 1 DS (160/800 mg) PO daily OR 1 DS PO 3×/week"),
                KeyValueRow(key: "Alternatives (sulfa-intolerant)", value: "Dapsone 100 mg PO daily (G6PD screen); atovaquone 1500 mg PO daily with fatty food; pentamidine aerosolized 300 mg via Respirgard II nebulizer monthly"),
                KeyValueRow(key: "Discontinue", value: "CD4 >200 × 3 months ON ART AND viral suppression; restart if CD4 falls <200")
            ]),
            .keyValueTable(title: "Toxoplasma encephalitis — CD4 <100 + IgG+", [
                KeyValueRow(key: "Indication", value: "CD4 <100 AND Toxoplasma IgG positive (prior exposure)"),
                KeyValueRow(key: "First-line", value: "TRIMETHOPRIM-SULFAMETHOXAZOLE (TMP-SMX) 1 DS PO daily — same drug covers PCP + toxo"),
                KeyValueRow(key: "Alternatives", value: "Dapsone 50 mg PO daily + pyrimethamine 50 mg + leucovorin 25 mg PO weekly; atovaquone 1500 mg PO daily +/- pyrimethamine + leucovorin"),
                KeyValueRow(key: "Discontinue", value: "CD4 >200 × 3 months ON ART AND viral suppression")
            ]),
            .keyValueTable(title: "Mycobacterium avium complex (MAC) — CD4 <50", [
                KeyValueRow(key: "Indication", value: "CD4 <50 — REMOVED from routine prophylaxis recommendations by HIVMA in 2017 due to effective ART; START ART instead; only consider if ART unavailable / non-adherent + CD4 <50"),
                KeyValueRow(key: "If indicated", value: "Azithromycin 1200 mg PO weekly OR 600 mg PO 2×/week; clarithromycin 500 mg PO BID alternative; rifabutin 300 mg PO daily for some"),
                KeyValueRow(key: "Discontinue", value: "CD4 >100 × 3 months ON ART AND viral suppression")
            ]),
            .keyValueTable(title: "Cryptococcal disease — preemptive in CD4 <100 + CrAg+", [
                KeyValueRow(key: "Universal screening", value: "Serum cryptococcal antigen (CrAg) in HIV+ with CD4 <100 OR CD4 <200 with prior OIs per WHO"),
                KeyValueRow(key: "CrAg+ asymptomatic", value: "FLUCONAZOLE 800 mg PO daily × 2 weeks → 400 mg × 8 weeks → 200 mg daily maintenance until CD4 recovery"),
                KeyValueRow(key: "CrAg+ symptomatic", value: "Full workup including LP + cryptococcal meningitis treatment (induction amphotericin + flucytosine + ICP management)"),
                KeyValueRow(key: "Discontinue maintenance", value: "CD4 >100 × 3 months on ART + asymptomatic + CSF culture negative")
            ]),
            .keyValueTable(title: "Tuberculosis — universal screening + treat latent", [
                KeyValueRow(key: "Screening", value: "All HIV+ patients at diagnosis + annual + after any exposure with INTERFERON-γ RELEASE ASSAY (IGRA) preferred OR TST"),
                KeyValueRow(key: "Treat latent TB", value: "Isoniazid (INH) 300 mg PO daily × 9 months + pyridoxine 25-50 mg daily; OR INH + rifapentine weekly × 12 weeks (3HP) preferred; OR rifampin 600 mg daily × 4 months (limited HIV ART compatibility)"),
                KeyValueRow(key: "Active TB", value: "RIPE — rifampin (or rifabutin with ART) + isoniazid + pyrazinamide + ethambutol × 2 months → RI × 4 months; coordinate ART timing")
            ]),
            .keyValueTable(title: "Hepatitis A + B — vaccinate non-immune", [
                KeyValueRow(key: "Hepatitis A", value: "All HIV+ non-immune patients; especially MSM, IVDU, traveling to endemic areas, chronic liver disease, occupational"),
                KeyValueRow(key: "Hepatitis B", value: "All HIV+ non-immune patients with anti-HBs <10 mIU/mL; higher dose vaccine schedule (40 mcg × 4 doses) if CD4 <500"),
                KeyValueRow(key: "Other vaccines", value: "Influenza annual, pneumococcal (PCV15 → PPSV23), HPV (≤26 years), Tdap, COVID-19, Shingrix recombinant (NOT live), meningococcal if high risk")
            ]),
            .keyValueTable(title: "Other OIs (less common prophylaxis)", [
                KeyValueRow(key: "CMV", value: "No primary prophylaxis; preemptive treatment with valganciclovir for CMV viremia in transplant; secondary prophylaxis after CMV retinitis until immune recovery"),
                KeyValueRow(key: "Candida", value: "No primary prophylaxis routinely; fluconazole 100-200 mg daily for recurrent oral / esophageal candidiasis"),
                KeyValueRow(key: "Cryptosporidium / Microsporidia", value: "No effective prophylaxis; advise on water + food safety; ART start"),
                KeyValueRow(key: "Histoplasmosis / coccidioidomycosis", value: "Endemic areas; routine prophylaxis not recommended"),
                KeyValueRow(key: "Bacterial respiratory + sinopulmonary", value: "Pneumococcal + influenza vaccines; no antibiotic prophylaxis routine")
            ]),
            .bullets(title: "Principles + safety", [
                AttributedBullet("CD4 + viral load drive prophylaxis decisions; ART for immune restoration is primary strategy.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("Discontinuation criteria — sustained immune recovery (CD4 above threshold × 3-6 months on ART with viral suppression).", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("RESTART prophylaxis if CD4 falls below threshold.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("DRUG INTERACTIONS — sulfa drugs, dapsone, azoles, macrolides, rifamycin family all interact with ART; pharmacist consultation.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("HEPATOTOXICITY + cytopenias + rash — common side effects; monitor.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("ADHERENCE essential; daily pill burden challenging; combine prophylaxis with ART regimen pills.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("HIVMA + DHHS + CDC guidelines updated regularly — stay current.", citationIDs: ["specialty_pr_round30"])
            ])
        ],
        citations: [openrnPRR30, cdcPRR30, specialtyPRR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AntifungalClassesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "antifungal-classes",
        title: "Antifungal classes + spectra + indications",
        subtitle: "Polyenes (ampho B) · azoles (fluc/itra/voric/posa/isav) · echinocandins (caspo/micafun/anidulafun) · 5-FC + griseofulvin + nystatin · spectrum + toxicity matrix",
        eyebrow: "REFERENCE · ID",
        nclexTags: refTagsR30,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Antifungal classes target fungal cell wall (echinocandins) or membrane sterols (polyenes, azoles, allylamines) or nucleic acid synthesis (5-flucytosine). Spectrum, toxicity, drug interactions, route, formulation, cost vary significantly. Knowing spectrum + indications + side effects guides selection; pharmacist + ID consultation for invasive disease per primary source.",
                citationIDs: ["specialty_pr_round30"]
            )),
            .keyValueTable(title: "Polyenes — bind ergosterol (broad)", [
                KeyValueRow(key: "Amphotericin B deoxycholate", value: "Historic; binds ergosterol → membrane pore formation; broad spectrum (Candida + Aspergillus + Cryptococcus + Histoplasma + Blastomyces + Coccidioides + Mucorales); SEVERE NEPHROTOXICITY + electrolytes + infusion reactions; \"shake + bake\" fever / chills"),
                KeyValueRow(key: "Liposomal amphotericin B (AmBisome)", value: "Preferred when amphotericin needed; LESS nephrotoxic; same spectrum; reduced infusion reactions; preferred for mucormycosis + induction cryptococcosis + severe disseminated histoplasmosis"),
                KeyValueRow(key: "Amphotericin B lipid complex (Abelcet)", value: "Less commonly used; similar profile to liposomal"),
                KeyValueRow(key: "Nystatin", value: "Oral suspension + topical; mucocutaneous Candida only; no systemic absorption from oral; safe for thrush + denture stomatitis"),
                KeyValueRow(key: "Major toxicity", value: "Nephrotoxicity (Cr, K, Mg), hypokalemia + hypomagnesemia common, infusion reactions (fever, chills, hypotension), anemia, hepatic")
            ]),
            .keyValueTable(title: "Azoles — inhibit ergosterol synthesis (CYP14α)", [
                KeyValueRow(key: "Fluconazole", value: "Narrow spectrum — Candida (NOT C. krusei + reduced C. glabrata), Cryptococcus, Coccidioides, Histoplasma (mild), Blastomyces; NO Aspergillus / Mucorales; widely used + safer than amphotericin; oral/IV; renal dose; LFT monitoring; drug interactions less than other azoles"),
                KeyValueRow(key: "Itraconazole", value: "Endemic mycoses (Histoplasma + Blastomyces + Coccidioides + Sporothrix), aspergillosis (non-invasive), onychomycosis; BOXED CHF, hepatotoxicity, extensive CYP3A4 interactions; absorption variable (capsule needs food/acid; oral solution better); IV limited"),
                KeyValueRow(key: "Voriconazole", value: "INVASIVE ASPERGILLOSIS first-line; broad including Fusarium, Scedosporium; visual disturbances (~30%), photosensitivity + skin cancer, hepatotoxicity, QT, extensive CYP interactions; therapeutic drug monitoring (target 2-5 mcg/mL)"),
                KeyValueRow(key: "Posaconazole", value: "Broad antifungal prophylaxis (AML, GVHD); aspergillosis, mucormycosis, endemic; CYP3A4 inhibitor; tablet preferred over suspension"),
                KeyValueRow(key: "Isavuconazole", value: "INVASIVE ASPERGILLOSIS + MUCORMYCOSIS first-line; less hepatotoxic than voriconazole; QT SHORTENING (unique); PO/IV interchangeable; CYP3A4 substrate + inhibitor; predictable PK + minimal TDM needed"),
                KeyValueRow(key: "Major toxicity (azoles)", value: "Hepatotoxicity (all), QT prolongation (most, except isavuconazole shortens), drug interactions (CYP3A4), GI, rash; voriconazole — visual + photosensitivity; itraconazole — CHF"),
                KeyValueRow(key: "Topical/intravaginal", value: "Clotrimazole, miconazole, ketoconazole topical/intravaginal — vulvovaginal candidiasis + tinea")
            ]),
            .keyValueTable(title: "Echinocandins — inhibit β-glucan synthesis (cell wall)", [
                KeyValueRow(key: "Caspofungin", value: "Candida (especially non-albicans), Aspergillus salvage; IV only; well-tolerated; minimal interactions; LFT monitoring"),
                KeyValueRow(key: "Micafungin", value: "Similar; FDA-approved Candida invasive + prophylaxis"),
                KeyValueRow(key: "Anidulafungin", value: "Similar; minimal renal/hepatic adjustment"),
                KeyValueRow(key: "Spectrum + use", value: "Invasive candidiasis + candidemia FIRST-LINE; Aspergillus salvage (not monotherapy); NO Cryptococcus + NO Mucorales coverage"),
                KeyValueRow(key: "Major toxicity", value: "LFTs (mild), minimal nephrotoxicity, infusion reactions mild")
            ]),
            .keyValueTable(title: "5-Flucytosine (5-FC) + others", [
                KeyValueRow(key: "5-Flucytosine (Ancobon)", value: "Synergistic with amphotericin B for CRYPTOCOCCAL meningitis INDUCTION (2 weeks); also Candida endocarditis; oral only; renal adjustment; therapeutic drug monitoring (peak 30-100 mcg/mL)"),
                KeyValueRow(key: "5-FC toxicity", value: "Bone marrow suppression + GI + hepatotoxicity; monitor CBC + LFTs weekly; rarely standalone (resistance + toxicity)"),
                KeyValueRow(key: "Griseofulvin", value: "Dermatophyte infections (tinea capitis especially in children); oral; replaced largely by terbinafine + azoles"),
                KeyValueRow(key: "Terbinafine (Lamisil)", value: "Allylamine — inhibits squalene epoxidase; dermatophytes (onychomycosis + tinea); LFT + drug interactions"),
                KeyValueRow(key: "Topical agents", value: "Clotrimazole, miconazole, ketoconazole, terbinafine, ciclopirox, naftifine — superficial mycoses")
            ]),
            .bullets(title: "Selection by indication", [
                AttributedBullet("INVASIVE CANDIDIASIS / CANDIDEMIA — ECHINOCANDIN (caspofungin/micafungin/anidulafungin) first-line; fluconazole if susceptible C. albicans + stable; amphotericin B for Mucorales co-suspicion.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("INVASIVE ASPERGILLOSIS — VORICONAZOLE OR ISAVUCONAZOLE first-line; liposomal amphotericin B second-line; combination with echinocandin for refractory.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("MUCORMYCOSIS — LIPOSOMAL AMPHOTERICIN B + ISAVUCONAZOLE + SURGICAL DEBRIDEMENT; reverse predisposing (DKA + immunosuppression).", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("CRYPTOCOCCAL MENINGITIS — induction LIPOSOMAL AMPHOTERICIN B + FLUCYTOSINE × 2 weeks → consolidation fluconazole high-dose × 8 weeks → maintenance fluconazole 200 mg until CD4 recovery; ICP management.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("PCP — TMP-SMX first-line + adjunct steroids if severe; alternatives atovaquone, dapsone-trimethoprim, primaquine-clindamycin, IV pentamidine.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("ENDEMIC MYCOSES — itraconazole for mild-moderate; liposomal amphotericin B for severe induction → itraconazole maintenance.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("MUCOSAL CANDIDIASIS — clotrimazole, fluconazole, nystatin.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("PROPHYLAXIS in transplant + heme malignancy + chronic granulomatous — posaconazole, isavuconazole, voriconazole.", citationIDs: ["specialty_pr_round30"])
            ]),
            .bullets(title: "Drug interactions + monitoring", [
                AttributedBullet("AZOLE drug interactions — extensive CYP3A4 effects; statins, CCBs, opioids, immunosuppressants, anticoagulants, antiarrhythmics — review every visit.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("THERAPEUTIC DRUG MONITORING — voriconazole (trough 2-5 mcg/mL), itraconazole (trough >1 mcg/mL), posaconazole (some); isavuconazole + fluconazole typically not routine.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("LFTs + Cr monitoring with all systemic antifungals; serial cultures + biomarkers.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("RESISTANCE — Candida (echinocandin resistance C. parapsilosis + C. glabrata), azole-resistant Aspergillus (environmental azole exposure), Mucorales intrinsically resistant to most azoles + echinocandins.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("DURATION — variable based on disease, pathogen, immune status; ID consultation for invasive disease.", citationIDs: ["specialty_pr_round30"])
            ])
        ],
        citations: [openrnPRR30, cdcPRR30, specialtyPRR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TropicalFeverWorkupSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "tropical-fever-workup",
        title: "Tropical fever differential + workup",
        subtitle: "Returning traveler · malaria FIRST · dengue + typhoid + leptospirosis + rickettsial + viral hemorrhagic + acute HIV · travel + exposure history",
        eyebrow: "REFERENCE · ID",
        nclexTags: refTagsR30,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Returning international traveler with fever — differential broad including life-threatening infections. MALARIA is most urgent diagnosis; dengue, typhoid, leptospirosis, rickettsial, acute HIV, hepatitis A common. Comprehensive travel + exposure history + clinical features + targeted testing essential. CDC Travelers' Health + IDSA travel medicine guidelines per primary source.",
                citationIDs: ["specialty_pr_round30"]
            )),
            .keyValueTable(title: "Initial assessment", [
                KeyValueRow(key: "Travel history", value: "Destinations + dates + duration; rural vs urban; high-risk activities (caving, freshwater swimming, sexual contact, food/water exposure); hospitalization abroad; prophylaxis received + adherence"),
                KeyValueRow(key: "Exposure history", value: "Mosquito (DEET + bed nets + clothing), water (freshwater leptospirosis + schistosomiasis), food (undercooked meat + raw seafood + unpasteurized dairy + street food typhoid + cholera + hepatitis A), sexual + IVDU (HIV + hepatitis + STIs), animal contact (rabies + brucellosis), construction / soil (histoplasmosis + coccidioidomycosis + sporotrichosis), cave (histoplasmosis), forest (Lyme + tick-borne)"),
                KeyValueRow(key: "Timing", value: "Incubation period — malaria 7-30 days (P. falciparum) to months-years (P. vivax/ovale); dengue 4-7 days; typhoid 7-21 days; leptospirosis 2-20 days; ebola/Marburg 2-21 days; acute HIV 2-4 weeks; hepatitis A 15-50 days; hepatitis B 30-180 days"),
                KeyValueRow(key: "Symptoms", value: "Fever pattern + severity, rash (dengue + rickettsial + typhoid rose spots + leptospirosis), arthralgia (chikungunya + dengue), GI (typhoid + cholera + amebiasis), respiratory, neurologic (cerebral malaria + meningitis), jaundice (yellow fever + hepatitis + leptospirosis), bleeding (dengue + hemorrhagic fevers)")
            ]),
            .keyValueTable(title: "Malaria — MUST RULE OUT FIRST", [
                KeyValueRow(key: "Indication", value: "ANY febrile patient returning from malaria-endemic area within 1 year (most within 1 month)"),
                KeyValueRow(key: "Diagnostics", value: "Thick + thin blood smears (gold standard) + repeat q12-24 hours × 48-72 hours if negative + high suspicion; rapid diagnostic test (RDT); molecular PCR if available"),
                KeyValueRow(key: "Severity", value: "P. falciparum parasitemia ≥2% (non-immune) OR ≥5% (semi-immune) + organ involvement → SEVERE; ICU + IV artesunate"),
                KeyValueRow(key: "Treatment", value: "P. falciparum: ACT (artemether-lumefantrine) OR atovaquone-proguanil OR quinine; severe: IV artesunate; P. vivax/ovale: chloroquine + PRIMAQUINE radical cure (G6PD screen)")
            ]),
            .keyValueTable(title: "Dengue + arboviruses", [
                KeyValueRow(key: "Dengue", value: "Asia + Latin America + Caribbean + Pacific + Africa; Aedes mosquitoes day-biting; fever + retroorbital pain + myalgia + arthralgia + rash; thrombocytopenia + leukopenia + elevated AST/ALT; severe dengue (DHF/DSS) with hemorrhage + plasma leak + shock"),
                KeyValueRow(key: "Diagnostics", value: "NS1 antigen (acute), IgM + IgG serology, PCR; CBC (low plt + WBC), CMP, LFTs"),
                KeyValueRow(key: "Treatment", value: "SUPPORTIVE — fluid + electrolytes; AVOID NSAIDs/aspirin (bleeding); acetaminophen safe; monitor for warning signs of severe dengue"),
                KeyValueRow(key: "Chikungunya", value: "Aedes mosquito; fever + severe POLYARTHRALGIA (often persisting months); rash; tropical regions; serology + PCR"),
                KeyValueRow(key: "Zika", value: "Aedes mosquito + sexual transmission; fever + rash + conjunctivitis + arthralgia mild; CONGENITAL MICROCEPHALY + Guillain-Barré; counsel pregnancy"),
                KeyValueRow(key: "Yellow fever", value: "Africa + South America; mosquito; fever → biphasic with severe phase (jaundice + hemorrhage + AKI); high mortality; YELLOW FEVER VACCINE prophylaxis (live)")
            ]),
            .keyValueTable(title: "Typhoid + paratyphoid (Salmonella enterica)", [
                KeyValueRow(key: "Epidemiology", value: "Asia + sub-Saharan Africa; fecal-oral; food/water contamination; incubation 7-21 days"),
                KeyValueRow(key: "Clinical", value: "Sustained fever (step-ladder rise), headache, abdominal pain, relative bradycardia, hepatosplenomegaly, ROSE SPOTS (truncal blanching), intestinal perforation in week 3 (emergency)"),
                KeyValueRow(key: "Diagnostics", value: "Blood culture (1st week + most sensitive), bone marrow culture (sensitive any time), stool culture (later); Widal serology (low yield, not preferred)"),
                KeyValueRow(key: "Treatment", value: "CEFTRIAXONE 2 g IV daily × 10-14 days OR azithromycin 1 g daily × 7 days; fluoroquinolone resistance increasing especially Indian + Pakistani strains; cipro reserved for susceptible")
            ]),
            .keyValueTable(title: "Leptospirosis", [
                KeyValueRow(key: "Epidemiology", value: "Worldwide tropical; freshwater swimming, flooding, rodent contact, sewer workers, military, returning travelers from rural areas"),
                KeyValueRow(key: "Clinical", value: "Biphasic — week 1 acute leptospiremia (high fever + headache + myalgia + CONJUNCTIVAL SUFFUSION + jaundice + AKI in severe Weil disease + bleeding); week 2 immune phase (recurrent fever + meningitis + uveitis)"),
                KeyValueRow(key: "Diagnostics", value: "Serology (microscopic agglutination test — MAT); PCR; dark-field microscopy difficult"),
                KeyValueRow(key: "Treatment", value: "DOXYCYCLINE 100 mg PO BID × 7 days (mild); PENICILLIN G 1.5 million units IV q6h OR ceftriaxone 1 g IV daily × 7 days (severe Weil disease + ICU + supportive AKI + dialysis if needed)")
            ]),
            .keyValueTable(title: "Rickettsial infections", [
                KeyValueRow(key: "Rocky Mountain spotted fever (RMSF)", value: "US (Southeast + Mid-Atlantic); tick bite; fever + headache + RASH (palms + soles spread inward); thrombocytopenia + elevated LFTs; PROMPT doxycycline ESSENTIAL (fatal if untreated)"),
                KeyValueRow(key: "Mediterranean spotted fever / boutonneuse", value: "Mediterranean + Africa; tick bite; ESCHAR (tâche noire); fever + rash + headache; doxycycline"),
                KeyValueRow(key: "Scrub typhus", value: "Asia + Pacific; chigger bite; ESCHAR + fever + lymphadenopathy + rash; doxycycline"),
                KeyValueRow(key: "Murine typhus", value: "Worldwide; rat flea; fever + rash + myalgia; doxycycline"),
                KeyValueRow(key: "Diagnostics", value: "Serology (acute + convalescent); PCR; treat empirically while awaiting if clinical suspicion + epidemiology + symptoms")
            ]),
            .keyValueTable(title: "Other tropical / important entities", [
                KeyValueRow(key: "Acute HIV", value: "Mononucleosis-like (fever + lymphadenopathy + rash + pharyngitis + myalgia) 2-4 weeks after sexual / IVDU / occupational; HIV viral load (RNA) — POSITIVE before antibody seroconversion; 4th gen Ag/Ab + RNA"),
                KeyValueRow(key: "Hepatitis A", value: "Fecal-oral; food/water; jaundice + RUQ + nausea + LFT elevation; serology IgM; supportive"),
                KeyValueRow(key: "Schistosomiasis", value: "Sub-Saharan Africa + Asia; freshwater swimming; acute Katayama fever (fever + urticaria + hepatosplenomegaly + eosinophilia); chronic GU OR GI involvement; PRAZIQUANTEL"),
                KeyValueRow(key: "Amebiasis", value: "Entamoeba histolytica; dysentery + liver abscess; stool + serology; METRONIDAZOLE 750 mg PO TID × 7-10 days + paromomycin or iodoquinol for luminal eradication"),
                KeyValueRow(key: "Visceral leishmaniasis (kala-azar)", value: "Sand fly; sub-Saharan Africa + India + Latin America + Mediterranean; chronic fever + hepatosplenomegaly + pancytopenia; liposomal amphotericin B"),
                KeyValueRow(key: "African trypanosomiasis (sleeping sickness)", value: "Tsetse fly sub-Saharan Africa; chancre + fever + lymphadenopathy → CNS encephalitis (sleeping); pentamidine + suramin + melarsoprol"),
                KeyValueRow(key: "Chagas disease", value: "Reduviid bug Latin America; acute fever + Romaña sign → chronic cardiomyopathy + megacolon + megaesophagus; benznidazole / nifurtimox"),
                KeyValueRow(key: "Viral hemorrhagic fevers (Ebola + Marburg + Lassa + CCHF)", value: "Outbreak-associated; very high transmissibility + isolation; supportive + experimental antivirals; public health emergency")
            ]),
            .bullets(title: "Diagnostic approach", [
                AttributedBullet("MALARIA WORKUP FIRST — repeat smears + RDTs even if initial negative.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("BROAD INITIAL labs — CBC + diff (atypical lymphocytes, thrombocytopenia, eosinophilia), CMP, LFTs, INR/PT, urinalysis, blood cultures × 2, lactate (severe).", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("HIV TESTING universal — 4th-gen Ag/Ab + RNA in acute presentations.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("STOOL studies if diarrhea — bacterial culture + ova/parasites + Giardia/Crypto antigens + C. difficile toxin.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("SEROLOGY targeted by exposure — dengue, chikungunya, Zika, leptospirosis, rickettsial, hepatitis A/B/E, schistosomiasis, leishmaniasis, brucellosis.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("IMAGING — chest X-ray + abdominal ultrasound for hepatosplenomegaly + masses; CT/MRI for CNS / cardiac.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("CDC TRAVELERS' HEALTH + WHO + EXPERT CONSULTATION — emergency tropical medicine clinics; CDC hotline (770) 488-7788 for rare diseases.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("ISOLATION precautions — VHF + measles + influenza + COVID + active TB; epidemiologic risk assessment.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("EMPIRIC ANTIMALARIAL — emergent in severe falciparum suspicion while workup ongoing.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("EMPIRIC DOXYCYCLINE — rickettsial empiric coverage in compatible scenarios.", citationIDs: ["specialty_pr_round30"]),
                AttributedBullet("PUBLIC HEALTH REPORTING — many tropical diseases reportable to CDC + state.", citationIDs: ["specialty_pr_round30"])
            ])
        ],
        citations: [openrnPRR30, cdcPRR30, specialtyPRR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}
