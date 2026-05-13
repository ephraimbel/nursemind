import Foundation

// Curator-model drug entries (round 7 expansion — transplant immunosuppression, dermatology, ophthalmology, ENT topical).
// Sources: openFDA SPL (CC0), Open RN Pharmacology (CC BY 4.0), CDC stewardship
// (public domain), AST / AAO / AAD concept citations.

private let openfda = CitationSource(
    id: "openfda_round7",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR7 = CitationSource(
    id: "openrn_pharm_round7",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=immunosuppressant+ophthalmic+topical+steroid",
    lastRetrieved: "2026-05-04"
)
private let cdcR7 = CitationSource(
    id: "cdc_round7",
    shortName: "CDC clinical guidance (transplant infection / topical antibiotic stewardship)",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let specialtyConceptR7 = CitationSource(
    id: "specialty_concept_round7",
    shortName: "AST / AAO / AAD specialty guidelines (concept citation)",
    publisher: "American Society of Transplantation · American Academy of Ophthalmology · American Academy of Dermatology",
    license: .factCitationOnly,
    url: "https://www.myast.org/practice-resources/practice-guidelines",
    lastRetrieved: "2026-05-04"
)

// MARK: - Mycophenolate Mofetil

public enum MycophenolateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "mycophenolate",
        title: "Mycophenolate mofetil",
        subtitle: "CellCept · antiproliferative immunosuppressant · transplant maintenance",
        category: "Antimetabolite immunosuppressant",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Inhibits IMP dehydrogenase → blocks T- and B-cell proliferation"),
            KeyValueRow(key: "Routes", value: "PO (mofetil → mycophenolic acid) or IV"),
            KeyValueRow(key: "Boxed warning", value: "Embryofetal toxicity (REMS), increased infection + lymphoma risk"),
            KeyValueRow(key: "Common pairings", value: "Tacrolimus + prednisone in solid-organ transplant")
        ],
        indications: AttributedProse(
            "Prophylaxis of organ rejection in kidney, liver, and heart transplant recipients (in combination with calcineurin inhibitor and corticosteroids). Off-label use in lupus nephritis, autoimmune disease per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        mechanism: AttributedProse(
            "Hydrolyzed to mycophenolic acid → reversibly inhibits inosine monophosphate dehydrogenase (IMPDH) → depletes guanosine nucleotides selectively in lymphocytes → blocks T- and B-cell proliferation.",
            citationIDs: ["openfda_round7"]
        ),
        dosing: [
            DosingBlock(label: "Renal transplant — adult", body: "1 g PO/IV BID; total 2 g/day per primary source.", citationIDs: ["openfda_round7"]),
            DosingBlock(label: "Heart transplant", body: "1.5 g PO BID; total 3 g/day.", citationIDs: ["openfda_round7"]),
            DosingBlock(label: "Liver transplant", body: "1.5 g PO BID; total 3 g/day.", citationIDs: ["openfda_round7"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to mycophenolate; pregnancy (boxed); breastfeeding.",
            citationIDs: ["openfda_round7"]
        ),
        warnings: [
            AttributedBullet("BOXED — embryofetal toxicity (1st trimester pregnancy loss, congenital malformations); REMS-required pregnancy testing and contraception (TWO methods or abstinence) per primary source.", citationIDs: ["openfda_round7"]),
            AttributedBullet("BOXED — increased risk of severe infection, including PML / JC virus; opportunistic infection (CMV, BK virus, fungal).", citationIDs: ["openfda_round7"]),
            AttributedBullet("BOXED — lymphoma (PTLD), skin malignancy (squamous-cell carcinoma); lifelong skin surveillance.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Bone marrow suppression — neutropenia, anemia, thrombocytopenia.", citationIDs: ["openfda_round7"]),
            AttributedBullet("GI — diarrhea, abdominal pain (very common, dose-limiting).", citationIDs: ["openfda_round7"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea (very common), nausea, anemia, leukopenia, infection, hypertension, hyperglycemia, hyperkalemia.",
            citationIDs: ["openfda_round7"]
        ),
        drugInteractions: [
            AttributedBullet("Antacids, sucralfate, iron — REDUCE absorption; separate by 2 hours.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Cholestyramine — reduces enterohepatic recirculation, lowers MPA AUC.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Acyclovir, ganciclovir, probenecid — raise mycophenolic acid levels.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Live vaccines — AVOID (immunosuppressed).", citationIDs: ["openfda_round7"])
        ],
        nursingImplications: [
            AttributedBullet("Verify pregnancy status + contraception plan per REMS before EVERY dispense in reproductive-age females.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Monitor CBC weekly first month, then twice monthly months 2–3, then monthly per primary source; watch for neutropenia.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("ASSESS for new infection at every visit — fever, fatigue, cough, urinary symptoms; CMV / BK virus screening per protocol.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Skin-cancer screening + sun protection; AAD recommends annual full-skin exam in transplant patients per primary source.", citationIDs: ["specialty_concept_round7"]),
            AttributedBullet("Take on empty stomach if tolerated; with food if GI upset.", citationIDs: ["openrn_pharm_round7"])
        ],
        patientTeaching: AttributedProse(
            "This medicine prevents your body from rejecting the transplant — never miss a dose. Use TWO forms of birth control or abstinence; this medicine causes severe birth defects. Tell us about any fever, sore throat, mouth sores, persistent diarrhea, or new skin lesions. Wear sunscreen and protective clothing daily; have your skin checked yearly. Avoid grapefruit, alcohol, and live vaccines.",
            citationIDs: ["openrn_pharm_round7"]
        ),
        citations: [openfda, openrnPharmR7, specialtyConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cyclosporine

public enum CyclosporineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cyclosporine",
        title: "Cyclosporine",
        subtitle: "Sandimmune / Neoral / Gengraf · calcineurin inhibitor",
        category: "Calcineurin inhibitor",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Calcineurin inhibitor (CNI)"),
            KeyValueRow(key: "Notable", value: "GINGIVAL HYPERPLASIA + HIRSUTISM characteristic; tacrolimus has largely replaced cyclosporine for new transplants"),
            KeyValueRow(key: "Targets", value: "Trough 100–400 ng/mL depending on transplant type and time per primary source"),
            KeyValueRow(key: "Toxicity", value: "Nephrotoxicity (dose-related), HTN, hyperkalemia, hyperglycemia, neurotoxicity")
        ],
        indications: AttributedProse(
            "Prophylaxis of organ rejection in kidney, liver, heart, and bone-marrow transplant; severe rheumatoid arthritis; severe psoriasis; ophthalmic emulsion for chronic dry eye per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        mechanism: AttributedProse(
            "Binds cyclophilin → inhibits calcineurin → blocks IL-2 transcription and T-cell activation → immunosuppression.",
            citationIDs: ["openfda_round7"]
        ),
        dosing: [
            DosingBlock(label: "Solid-organ transplant", body: "Initial 4–9 mg/kg/day in two divided doses (PO Neoral / Gengraf microemulsion); titrate to trough per transplant type and time post-transplant per primary source.", citationIDs: ["openfda_round7"]),
            DosingBlock(label: "Severe psoriasis / RA", body: "Lower doses; pharmacy-driven titration.", citationIDs: ["openfda_round7"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to cyclosporine; uncontrolled HTN; concurrent retinoids in psoriasis (relative); concurrent live vaccines.",
            citationIDs: ["openfda_round7"]
        ),
        warnings: [
            AttributedBullet("Nephrotoxicity (dose-related); HTN; hyperkalemia; hypomagnesemia.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Hepatotoxicity; tremor / paresthesia / seizure; PRES.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Increased infection (opportunistic, CMV, fungal); lymphoma / skin cancer.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Hyperglycemia / new-onset DM; dyslipidemia.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Brand-NOT-substitutable — Sandimmune, Neoral, Gengraf are NOT bioequivalent without therapeutic drug monitoring per primary source.", citationIDs: ["openfda_round7"])
        ],
        adverseReactions: AttributedProse(
            "GINGIVAL HYPERPLASIA, HIRSUTISM, tremor, headache, HTN, AKI, hyperkalemia, hypomagnesemia, hyperglycemia, infection.",
            citationIDs: ["openfda_round7"]
        ),
        drugInteractions: [
            AttributedBullet("CYP3A4 inhibitors (azoles, macrolides, diltiazem, verapamil, grapefruit) — RAISE cyclosporine; toxicity.", citationIDs: ["openfda_round7"]),
            AttributedBullet("CYP3A4 inducers (rifampin, phenytoin, phenobarbital, St. John's wort) — LOWER cyclosporine; rejection risk.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Statins — increased rhabdomyolysis risk; pravastatin / fluvastatin preferred per primary source.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Other nephrotoxins — additive AKI.", citationIDs: ["openfda_round7"])
        ],
        nursingImplications: [
            AttributedBullet("ALWAYS document brand name — formulations are not interchangeable without TDM.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Monitor trough q1–2 weeks early, then per protocol; baseline + ongoing creatinine, K, Mg, BP, LFTs, glucose, lipids.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Counsel on excellent oral hygiene to reduce gingival hyperplasia.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("AVOID grapefruit, St. John's wort; counsel before any new medication.", citationIDs: ["openrn_pharm_round7"])
        ],
        patientTeaching: AttributedProse(
            "Never stop this medicine without your transplant team. Take at the same times every day — keep a 12-hour interval. Brush twice daily and floss to reduce gum overgrowth. Avoid grapefruit. Use sunscreen daily. Tell us about all medications, supplements, and herbal products before starting them.",
            citationIDs: ["openrn_pharm_round7"]
        ),
        citations: [openfda, openrnPharmR7, specialtyConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sirolimus

public enum SirolimusSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sirolimus",
        title: "Sirolimus",
        subtitle: "Rapamune · mTOR inhibitor · maintenance immunosuppression",
        category: "mTOR inhibitor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "mTOR inhibitor"),
            KeyValueRow(key: "Targets", value: "Trough typically 5–15 ng/mL (combination) or 10–20 ng/mL (monotherapy) per primary source"),
            KeyValueRow(key: "Notable", value: "Impaired wound healing → AVOID in early post-transplant period"),
            KeyValueRow(key: "Forms", value: "Oral tablets and solution; long half-life ≈60 hours")
        ],
        indications: AttributedProse(
            "Prophylaxis of renal-transplant rejection (typically combined with calcineurin inhibitor or used after switch); lymphangioleiomyomatosis (LAM); off-label in heart and liver transplant per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        mechanism: AttributedProse(
            "Binds FKBP-12 → inhibits mammalian target of rapamycin (mTOR) → blocks IL-2-driven T-cell proliferation. Anti-proliferative AND anti-angiogenic.",
            citationIDs: ["openfda_round7"]
        ),
        dosing: [
            DosingBlock(label: "Renal transplant — adult", body: "Loading 6 mg PO once, then 2 mg PO daily (low-immunologic-risk patients) per primary source; titrate to trough.", citationIDs: ["openfda_round7"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to sirolimus or mTOR inhibitors; lung transplant (boxed) — bronchial anastomotic dehiscence; first 30 days liver transplant (boxed) — hepatic-artery thrombosis.",
            citationIDs: ["openfda_round7"]
        ),
        warnings: [
            AttributedBullet("BOXED — increased mortality with use in lung transplant per primary source.", citationIDs: ["openfda_round7"]),
            AttributedBullet("BOXED — hepatic-artery thrombosis when used in early liver transplant.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Impaired wound healing; lymphocele; dehiscence — usually held perioperatively.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Pneumonitis (interstitial); proteinuria; hyperlipidemia (significant).", citationIDs: ["openfda_round7"]),
            AttributedBullet("Bone marrow suppression; thrombocytopenia; mouth ulcers.", citationIDs: ["openfda_round7"])
        ],
        adverseReactions: AttributedProse(
            "Hyperlipidemia (very common), hypertension, edema, mouth ulcers, acne, joint pain, anemia, thrombocytopenia, proteinuria, pneumonitis.",
            citationIDs: ["openfda_round7"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors / inducers — significant trough effects (azoles, rifampin, etc.).", citationIDs: ["openfda_round7"]),
            AttributedBullet("Cyclosporine — raises sirolimus levels (timing matters; separate by 4 hr if combined per primary source).", citationIDs: ["openfda_round7"]),
            AttributedBullet("ACEi + sirolimus — angioedema risk increased.", citationIDs: ["openfda_round7"])
        ],
        nursingImplications: [
            AttributedBullet("Trough monitoring; coordinate with transplant pharmacy.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Lipid panel every 1–3 months; statin per provider.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("HOLD prior to surgery per provider for wound healing.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Monitor for cough, dyspnea (pneumonitis); proteinuria.", citationIDs: ["openrn_pharm_round7"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same time daily; if combined with cyclosporine, take them 4 hours apart. Tell us about cough, shortness of breath, mouth sores, leg swelling, or any planned surgery — this medicine may need to be held. Get cholesterol checked regularly.",
            citationIDs: ["openrn_pharm_round7"]
        ),
        citations: [openfda, openrnPharmR7, specialtyConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Azathioprine

public enum AzathioprineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "azathioprine",
        title: "Azathioprine",
        subtitle: "Imuran · purine antimetabolite · IBD / RA / transplant",
        category: "Antimetabolite immunosuppressant",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Purine antimetabolite (prodrug to 6-mercaptopurine)"),
            KeyValueRow(key: "Notable", value: "Allopurinol interaction → severe BMS; TPMT testing before initiation per primary source"),
            KeyValueRow(key: "Pregnancy", value: "Generally compatible with continuing in IBD / transplant per primary source — risk-benefit"),
            KeyValueRow(key: "Onset", value: "Slow — 6–12 weeks for IBD")
        ],
        indications: AttributedProse(
            "Prevention of renal-transplant rejection; severe rheumatoid arthritis; inflammatory bowel disease (Crohn's, ulcerative colitis); other autoimmune disease per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        mechanism: AttributedProse(
            "Prodrug → 6-mercaptopurine → competes with endogenous purines, inhibiting DNA / RNA synthesis in proliferating lymphocytes. Metabolized by TPMT (thiopurine S-methyltransferase) — TPMT-deficient patients have markedly increased toxicity.",
            citationIDs: ["openfda_round7"]
        ),
        dosing: [
            DosingBlock(label: "Renal transplant", body: "1–3 mg/kg PO daily, adjust per response and CBC.", citationIDs: ["openfda_round7"]),
            DosingBlock(label: "RA / IBD", body: "1.0–2.5 mg/kg PO daily; titrate.", citationIDs: ["openfda_round7"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; pregnancy in patients receiving for RA; concurrent allopurinol unless dose-reduced 75% per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        warnings: [
            AttributedBullet("Bone marrow suppression — leukopenia, thrombocytopenia, anemia; check CBC routinely.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Increased malignancy — lymphoma, skin cancer (squamous-cell), hepatosplenic T-cell lymphoma (rare, often fatal in young IBD males).", citationIDs: ["openfda_round7"]),
            AttributedBullet("Hepatotoxicity; pancreatitis (especially IBD).", citationIDs: ["openfda_round7"]),
            AttributedBullet("Infection — opportunistic, viral.", citationIDs: ["openfda_round7"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, leukopenia, anemia, thrombocytopenia, transient LFT elevation, alopecia, infection.",
            citationIDs: ["openfda_round7"]
        ),
        drugInteractions: [
            AttributedBullet("ALLOPURINOL — markedly raises 6-MP levels → severe BMS; if must combine, REDUCE azathioprine dose by 75% per primary source.", citationIDs: ["openfda_round7"]),
            AttributedBullet("ACEi — additive anemia / leukopenia; monitor.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Live vaccines — AVOID.", citationIDs: ["openfda_round7"])
        ],
        nursingImplications: [
            AttributedBullet("TPMT genotyping (or activity assay) BEFORE initiation per primary source — homozygous deficiency dosing is dramatically reduced.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("CBC weekly first month, then monthly during stable therapy.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("LFTs at baseline + monthly initially; lipase if abdominal pain.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Skin-cancer screen yearly; sun protection counseling.", citationIDs: ["openrn_pharm_round7"])
        ],
        patientTeaching: AttributedProse(
            "Take with food to reduce nausea. Tell us about fever, sore throat, mouth sores, easy bruising, severe abdominal pain, yellow skin, or any new skin lesion. Use sun protection daily. Tell every provider you take this — especially if they consider allopurinol.",
            citationIDs: ["openrn_pharm_round7"]
        ),
        citations: [openfda, openrnPharmR7, specialtyConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Basiliximab

public enum BasiliximabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "basiliximab",
        title: "Basiliximab",
        subtitle: "Simulect · IL-2R antagonist · induction immunosuppression",
        category: "Monoclonal antibody (anti-IL-2Rα)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Chimeric monoclonal antibody — anti-CD25 (IL-2Rα)"),
            KeyValueRow(key: "Indication", value: "INDUCTION immunosuppression at transplant — typically 2 doses (day 0 and day 4)"),
            KeyValueRow(key: "Notable", value: "NON-DEPLETING — does not lyse T-cells; lower infection risk than ATG"),
            KeyValueRow(key: "Use case", value: "Low-to-moderate immunologic risk renal transplant per primary source")
        ],
        indications: AttributedProse(
            "Prophylaxis of acute rejection in renal-transplant recipients in combination with cyclosporine and corticosteroids per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        mechanism: AttributedProse(
            "Binds CD25 (IL-2 receptor alpha chain) on activated T-cells → blocks IL-2-mediated T-cell activation and proliferation. Non-depleting.",
            citationIDs: ["openfda_round7"]
        ),
        dosing: [
            DosingBlock(label: "Adult induction", body: "20 mg IV on day 0 (within 2 hours before transplant) and day 4 post-transplant per primary source.", citationIDs: ["openfda_round7"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to basiliximab.",
            citationIDs: ["openfda_round7"]
        ),
        warnings: [
            AttributedBullet("Hypersensitivity / anaphylaxis — including with re-exposure; have epinephrine + supportive care available per primary source.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Risk of opportunistic infection and PTLD (lower than depleting agents).", citationIDs: ["openfda_round7"])
        ],
        adverseReactions: AttributedProse(
            "Generally well tolerated; constipation, nausea, headache, fever — distinguishable from underlying transplant course.",
            citationIDs: ["openfda_round7"]
        ),
        drugInteractions: [
            AttributedBullet("Live vaccines — AVOID for at least the period of immunosuppression.", citationIDs: ["openfda_round7"])
        ],
        nursingImplications: [
            AttributedBullet("Infuse over 20–30 min (or push); have anaphylaxis cart available.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Document doses, premedication, vital signs, and any reaction.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Coordinate with transplant pharmacy and ID for prophylaxis (PJP, CMV) per protocol.", citationIDs: ["openrn_pharm_round7"])
        ],
        patientTeaching: AttributedProse(
            "This medicine is given twice around the time of your transplant to prevent rejection. Tell us right away about rash, hives, swelling, or trouble breathing. We will start additional anti-rejection medicines you take by mouth.",
            citationIDs: ["openrn_pharm_round7"]
        ),
        citations: [openfda, openrnPharmR7, specialtyConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ATG (Antithymocyte Globulin)

public enum ATGSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "antithymocyte-globulin",
        title: "Antithymocyte globulin (ATG)",
        subtitle: "Thymoglobulin / Atgam · T-cell-depleting induction or rejection treatment",
        category: "Polyclonal antibody (T-cell depleting)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Polyclonal anti-thymocyte antibody (rabbit or equine)"),
            KeyValueRow(key: "Indications", value: "Induction in HIGH-immunologic-risk transplant; treatment of acute rejection; aplastic anemia"),
            KeyValueRow(key: "Notable", value: "Cytokine release syndrome — premedicate; depletes T-cells for weeks-months"),
            KeyValueRow(key: "Risks", value: "Severe infection, PTLD (long-term)")
        ],
        indications: AttributedProse(
            "Induction immunosuppression in HIGH-risk solid-organ transplant; treatment of steroid-resistant acute rejection; aplastic anemia per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        mechanism: AttributedProse(
            "Polyclonal antibodies opsonize T-lymphocytes → complement-mediated lysis and reticuloendothelial clearance → profound T-cell depletion lasting weeks to months.",
            citationIDs: ["openfda_round7"]
        ),
        dosing: [
            DosingBlock(label: "Thymoglobulin (rabbit) — induction", body: "1.5 mg/kg IV daily × 4–7 doses per primary source.", citationIDs: ["openfda_round7"]),
            DosingBlock(label: "Treatment of rejection", body: "1.5 mg/kg IV daily × 7–14 days; pharmacy / transplant team-driven.", citationIDs: ["openfda_round7"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to rabbit or equine proteins (per product); active acute or chronic infection requiring delay.",
            citationIDs: ["openfda_round7"]
        ),
        warnings: [
            AttributedBullet("Cytokine release syndrome — fever, chills, hypotension, dyspnea during infusion; PREMEDICATE with acetaminophen + diphenhydramine + IV methylprednisolone per primary source.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Severe infection — bacterial, viral (CMV, BK, EBV), fungal; PJP and CMV prophylaxis per protocol.", citationIDs: ["openfda_round7"]),
            AttributedBullet("PTLD (post-transplant lymphoproliferative disorder) — EBV-driven.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Anaphylaxis — test dose may be considered for equine product; rabbit is more common now.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Serum sickness — fever, rash, arthralgia 7–14 days post.", citationIDs: ["openfda_round7"])
        ],
        adverseReactions: AttributedProse(
            "Fever, chills, hypotension, leukopenia, thrombocytopenia, headache, infection, serum sickness.",
            citationIDs: ["openfda_round7"]
        ),
        drugInteractions: [
            AttributedBullet("Live vaccines — AVOID for the duration of immunosuppression and beyond.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Other immunosuppressants — additive infection risk.", citationIDs: ["openfda_round7"])
        ],
        nursingImplications: [
            AttributedBullet("Premedicate per protocol — acetaminophen + diphenhydramine + IV steroid; have anaphylaxis cart at bedside.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Slow infusion — typically over 4–6 hours; central line preferred; continuous monitoring during infusion.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Daily CBC; trend platelets and lymphocytes; pause / reduce dose if cytopenias.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Initiate / continue PJP, CMV, antifungal prophylaxis per primary source.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Educate on serum sickness symptoms 1–2 weeks later.", citationIDs: ["openrn_pharm_round7"])
        ],
        patientTeaching: AttributedProse(
            "You may feel chills, fever, or muscle aches during the infusion — we will give medications to help. Tell us right away about rash, swelling, or trouble breathing. After the infusion, watch for fever, sore throat, painful urination, mouth sores, or any sign of infection. Get blood tests as scheduled.",
            citationIDs: ["openrn_pharm_round7"]
        ),
        citations: [openfda, openrnPharmR7, specialtyConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hydroxyzine

public enum HydroxyzineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "hydroxyzine",
        title: "Hydroxyzine",
        subtitle: "Vistaril / Atarax · first-generation H1 antagonist · anxiety / pruritus",
        category: "First-gen antihistamine",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "First-generation H1 antihistamine"),
            KeyValueRow(key: "Indications", value: "Anxiety (short-term), pruritus (urticaria, atopic dermatitis), N/V, pre-op sedation"),
            KeyValueRow(key: "Notable", value: "Sedating; QT prolongation at high doses; on Beers list — caution in older adults"),
            KeyValueRow(key: "Forms", value: "PO, IM (NEVER IV — tissue necrosis)")
        ],
        indications: AttributedProse(
            "Symptomatic relief of anxiety; pruritus from allergic reactions, atopic and contact dermatitis; preanesthetic sedation; control of nausea/vomiting per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        mechanism: AttributedProse(
            "Competitive H1-receptor antagonist with significant central CNS-depressant and anticholinergic activity. Blocks histamine-mediated pruritus and produces sedation.",
            citationIDs: ["openfda_round7"]
        ),
        dosing: [
            DosingBlock(label: "Anxiety (adult)", body: "50–100 mg PO every 6 hours as needed.", citationIDs: ["openfda_round7"]),
            DosingBlock(label: "Pruritus (adult)", body: "25 mg PO every 6–8 hours as needed.", citationIDs: ["openfda_round7"]),
            DosingBlock(label: "Pediatric", body: "0.5–0.6 mg/kg/dose PO every 6 hours; max 50 mg per dose per primary source.", citationIDs: ["openfda_round7"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to hydroxyzine, cetirizine, levocetirizine; congenital long-QT syndrome; early pregnancy (1st trimester); IV administration (tissue necrosis).",
            citationIDs: ["openfda_round7"]
        ),
        warnings: [
            AttributedBullet("QT prolongation — caution with other QT-prolonging agents and in patients with cardiac risk factors.", citationIDs: ["openfda_round7"]),
            AttributedBullet("CNS depression — additive with alcohol, opioids, benzodiazepines.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Anticholinergic burden — caution in older adults (Beers); dry mouth, urinary retention, constipation, confusion, falls.", citationIDs: ["openfda_round7"]),
            AttributedBullet("NEVER administer IV — severe tissue damage (chemical thrombosis, necrosis).", citationIDs: ["openfda_round7"])
        ],
        adverseReactions: AttributedProse(
            "Sedation (most common), dry mouth, dizziness, headache, urinary retention, constipation, paradoxical excitation in children/elderly.",
            citationIDs: ["openfda_round7"]
        ),
        drugInteractions: [
            AttributedBullet("CNS depressants — additive sedation.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Anticholinergics — additive effects; deliriogenic in elderly.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Other QT-prolonging drugs — cumulative QT.", citationIDs: ["openfda_round7"])
        ],
        nursingImplications: [
            AttributedBullet("CONFIRM order — never administer IV; IM injection is deep into large muscle (avoid SQ).", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Fall precautions — first dose, especially in older adults.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Counsel on alcohol avoidance and driving.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Beers list — consider safer alternatives in older adults (e.g., SSRI / buspirone for anxiety; non-anticholinergic anti-pruritic per provider).", citationIDs: ["openrn_pharm_round7"])
        ],
        patientTeaching: AttributedProse(
            "This medicine causes drowsiness — do not drive or operate machinery until you know how it affects you. Avoid alcohol. Tell us about palpitations or fainting. For older adults, this is generally a short-term medication; long-term use can affect memory and balance.",
            citationIDs: ["openrn_pharm_round7"]
        ),
        citations: [openfda, openrnPharmR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Clobetasol Topical

public enum ClobetasolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "clobetasol-topical",
        title: "Clobetasol propionate (topical)",
        subtitle: "Temovate · super-high-potency class I topical corticosteroid",
        category: "Topical corticosteroid (class I)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Super-high-potency topical steroid (class I — strongest)"),
            KeyValueRow(key: "Common uses", value: "Severe psoriasis, lichen planus, lichen sclerosus, severe eczema (short courses)"),
            KeyValueRow(key: "Limit", value: "Max 50 g/week × ≤2 weeks at a time per primary source"),
            KeyValueRow(key: "Avoid", value: "Face, axillae, groin, occlusion (HPA suppression risk)")
        ],
        indications: AttributedProse(
            "Inflammatory and pruritic manifestations of corticosteroid-responsive dermatoses, primarily severe forms — psoriasis, lichen planus, lichen sclerosus, severe eczema (short-term) per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        mechanism: AttributedProse(
            "Binds glucocorticoid receptors → reduces inflammation, vasoconstriction, immunosuppression in the skin.",
            citationIDs: ["openfda_round7"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "Apply thin film to affected area BID for ≤2 weeks at a time; max 50 g/week per primary source.", citationIDs: ["openfda_round7"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to clobetasol; primary skin infections (untreated bacterial, fungal, viral); rosacea, perioral dermatitis (worsens).",
            citationIDs: ["openfda_round7"]
        ),
        warnings: [
            AttributedBullet("HPA-axis suppression — even with topical use; risk increases with potency, occlusion, surface area, duration, broken skin, pediatrics.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Local — skin atrophy, striae, telangiectasia, hypopigmentation, perioral dermatitis (face), tinea incognito (masked fungal infection).", citationIDs: ["openfda_round7"]),
            AttributedBullet("Avoid face, intertriginous areas, genitals (use lower-potency steroid).", citationIDs: ["openfda_round7"]),
            AttributedBullet("Do NOT occlude unless directed.", citationIDs: ["openfda_round7"])
        ],
        adverseReactions: AttributedProse(
            "Burning, itching, irritation at application site; long-term — skin thinning, striae, telangiectasia.",
            citationIDs: ["openfda_round7"]
        ),
        drugInteractions: [
            AttributedBullet("Other topical preparations may alter absorption; minimize concurrent topical irritants.", citationIDs: ["openfda_round7"])
        ],
        nursingImplications: [
            AttributedBullet("Use FINGERTIP UNIT method for teaching — one fingertip unit (FTU) covers an area equal to two adult palms per primary source.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Counsel ≤2-week courses; rebound flare possible; taper to lower-potency for chronic conditions.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Skin checks for atrophy, striae; reassess at follow-up.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("AVOID face / groin; counsel on appropriate body sites.", citationIDs: ["openrn_pharm_round7"])
        ],
        patientTeaching: AttributedProse(
            "Apply a thin film twice daily to affected areas only; do not use on face, underarms, or groin unless told. Wash hands after applying. Use for up to 2 weeks then stop or step down. Watch for skin thinning or stretch marks. Cover the medicine only if your provider tells you.",
            citationIDs: ["openrn_pharm_round7"]
        ),
        citations: [openfda, openrnPharmR7, specialtyConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Latanoprost (Ophthalmic)

public enum LatanoprostSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "latanoprost",
        title: "Latanoprost (ophthalmic)",
        subtitle: "Xalatan · prostaglandin analog · first-line for open-angle glaucoma",
        category: "Ophthalmic prostaglandin analog",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Prostaglandin F2α analog"),
            KeyValueRow(key: "Indication", value: "Open-angle glaucoma, ocular hypertension"),
            KeyValueRow(key: "Onset", value: "IOP reduction within 3–4 hours; max effect 8–12 hours"),
            KeyValueRow(key: "Dose timing", value: "ONCE DAILY at evening — better adherence and IOP control")
        ],
        indications: AttributedProse(
            "Reduction of elevated intraocular pressure in open-angle glaucoma or ocular hypertension per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        mechanism: AttributedProse(
            "Increases uveoscleral outflow of aqueous humor → reduces IOP.",
            citationIDs: ["openfda_round7"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "1 drop in affected eye(s) ONCE DAILY in the evening per primary source.", citationIDs: ["openfda_round7"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to latanoprost or any component.",
            citationIDs: ["openfda_round7"]
        ),
        warnings: [
            AttributedBullet("PERMANENT iris darkening (typically in mixed-iris colors); periorbital skin pigment changes; eyelash growth and darkening.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Macular edema (risk in aphakic, pseudophakic with torn posterior capsule).", citationIDs: ["openfda_round7"]),
            AttributedBullet("Conjunctival hyperemia, eyelid eversion changes (prostaglandin-associated periorbitopathy).", citationIDs: ["openfda_round7"]),
            AttributedBullet("Reactivation of herpetic keratitis.", citationIDs: ["openfda_round7"])
        ],
        adverseReactions: AttributedProse(
            "Iris pigmentation, eyelash changes, conjunctival hyperemia, ocular irritation, blurred vision.",
            citationIDs: ["openfda_round7"]
        ),
        drugInteractions: [
            AttributedBullet("Combination with thimerosal-containing eye drops — precipitate; separate by ≥5 min.", citationIDs: ["openfda_round7"])
        ],
        nursingImplications: [
            AttributedBullet("Teach proper instillation — wash hands, tilt head back, pull lower lid down to form pocket, instill 1 drop, close eye, apply nasolacrimal occlusion (gently press inner canthus 1 min) to reduce systemic absorption per primary source.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Wait ≥5 min between different eye medications.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Refrigerate before opening; once opened, room-temperature stability per labeling.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Counsel on iris/eyelid changes (often permanent); document in chart for medico-legal record.", citationIDs: ["openrn_pharm_round7"])
        ],
        patientTeaching: AttributedProse(
            "Use exactly once a day in the evening. Wash your hands. Press the inner corner of your eye for 1 minute after the drop to keep the medicine in the eye and out of your bloodstream. Wait 5 minutes between different eye drops. Your eye color, eyelashes, and skin around your eye may darken — this can be permanent.",
            citationIDs: ["openrn_pharm_round7"]
        ),
        citations: [openfda, openrnPharmR7, specialtyConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Timolol (Ophthalmic)

public enum TimololOphthalmicSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "timolol-ophthalmic",
        title: "Timolol (ophthalmic)",
        subtitle: "Timoptic · non-selective β-blocker eye drop · glaucoma",
        category: "Ophthalmic β-blocker",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-selective β-blocker (β1 + β2)"),
            KeyValueRow(key: "Indication", value: "Open-angle glaucoma, ocular hypertension"),
            KeyValueRow(key: "Forms", value: "0.25% / 0.5% solution; gel-forming solution (once daily)"),
            KeyValueRow(key: "Notable", value: "Significant systemic absorption — bradycardia, bronchospasm; AVOID in asthma / COPD / heart block")
        ],
        indications: AttributedProse(
            "Reduction of elevated intraocular pressure in glaucoma or ocular hypertension per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        mechanism: AttributedProse(
            "Reduces aqueous humor PRODUCTION by blocking β1 and β2 receptors on the ciliary body.",
            citationIDs: ["openfda_round7"]
        ),
        dosing: [
            DosingBlock(label: "Solution 0.25–0.5%", body: "1 drop in affected eye(s) BID per primary source.", citationIDs: ["openfda_round7"]),
            DosingBlock(label: "Gel-forming solution", body: "1 drop in affected eye(s) ONCE DAILY.", citationIDs: ["openfda_round7"])
        ],
        contraindications: AttributedProse(
            "Asthma, severe COPD; sinus bradycardia; second/third-degree AV block (without pacemaker); overt cardiac failure; cardiogenic shock; hypersensitivity.",
            citationIDs: ["openfda_round7"]
        ),
        warnings: [
            AttributedBullet("SYSTEMIC β-blockade — bronchospasm, bradycardia, hypotension, masked hypoglycemia in DM, heart-block exacerbation.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Use NASOLACRIMAL OCCLUSION to reduce systemic absorption per primary source.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Hypersensitivity reactions; corneal sensitivity reduction.", citationIDs: ["openfda_round7"])
        ],
        adverseReactions: AttributedProse(
            "Burning, stinging, blurred vision, headache, bradycardia, bronchospasm, fatigue.",
            citationIDs: ["openfda_round7"]
        ),
        drugInteractions: [
            AttributedBullet("Oral β-blockers, calcium-channel blockers, digoxin — additive bradycardia / heart block.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Clonidine withdrawal — rebound HTN exaggerated.", citationIDs: ["openfda_round7"])
        ],
        nursingImplications: [
            AttributedBullet("ASSESS pulmonary and cardiac history before initiation — asthma, COPD, bradycardia, heart block are contraindications.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Instillation technique with NASOLACRIMAL OCCLUSION (1 min) significantly reduces systemic absorption — counsel every patient.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Monitor pulse and BP at follow-up; assess for systemic effects.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("If switching from solution to gel, decrease frequency to once-daily per primary source.", citationIDs: ["openrn_pharm_round7"])
        ],
        patientTeaching: AttributedProse(
            "After putting in the drop, gently press the inner corner of your eye for 1 minute — this keeps the medicine out of your bloodstream. Tell us about wheezing, slow heartbeat, dizziness, or fatigue. If you have asthma, COPD, or heart problems, this medication may not be safe for you — let your provider know.",
            citationIDs: ["openrn_pharm_round7"]
        ),
        citations: [openfda, openrnPharmR7, specialtyConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Brimonidine (Ophthalmic)

public enum BrimonidineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "brimonidine-ophthalmic",
        title: "Brimonidine (ophthalmic)",
        subtitle: "Alphagan · α2-agonist eye drop · glaucoma",
        category: "Ophthalmic α2-agonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective α2-adrenergic agonist"),
            KeyValueRow(key: "Indication", value: "Open-angle glaucoma, ocular hypertension"),
            KeyValueRow(key: "Mechanism", value: "REDUCES aqueous production AND increases uveoscleral outflow"),
            KeyValueRow(key: "Notable", value: "Use cautiously in pediatrics — CNS depression / apnea risk; AVOID <2 yr per primary source")
        ],
        indications: AttributedProse(
            "Reduction of intraocular pressure in glaucoma or ocular hypertension; ocular redness reduction (lower-concentration OTC formulation) per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        mechanism: AttributedProse(
            "Selective α2-adrenergic agonist → reduces aqueous humor production and increases uveoscleral outflow.",
            citationIDs: ["openfda_round7"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "1 drop in affected eye(s) THREE TIMES daily per primary source (some practices use BID).", citationIDs: ["openfda_round7"])
        ],
        contraindications: AttributedProse(
            "Concurrent or recent (within 14 days) MAOI use; infants / children <2 years (CNS depression, apnea); hypersensitivity.",
            citationIDs: ["openfda_round7"]
        ),
        warnings: [
            AttributedBullet("CNS depression — drowsiness, fatigue, hypotension; especially in infants and small children.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Allergic conjunctivitis (relatively common over time).", citationIDs: ["openfda_round7"]),
            AttributedBullet("Caution in cardiovascular disease, depression, hepatic / renal impairment.", citationIDs: ["openfda_round7"])
        ],
        adverseReactions: AttributedProse(
            "Conjunctival hyperemia, ocular pruritus, dry mouth, oral dryness, fatigue, drowsiness.",
            citationIDs: ["openfda_round7"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — contraindicated.", citationIDs: ["openfda_round7"]),
            AttributedBullet("CNS depressants, antihypertensives — additive effects.", citationIDs: ["openfda_round7"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel parents — KEEP OUT OF REACH OF CHILDREN; even small amounts ingested can cause severe CNS depression.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Nasolacrimal occlusion technique reduces systemic absorption.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("Monitor for development of allergic reactions (over months); switch class if intolerance develops.", citationIDs: ["openrn_pharm_round7"])
        ],
        patientTeaching: AttributedProse(
            "Use as prescribed; press inner corner of eye for 1 minute after each drop. Keep the bottle securely closed and away from children — even a small swallow can be dangerous to a young child. Tell us about persistent eye redness, itching, dry mouth, or fatigue.",
            citationIDs: ["openrn_pharm_round7"]
        ),
        citations: [openfda, openrnPharmR7, specialtyConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Mupirocin (Topical / Nasal)

public enum MupirocinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "mupirocin",
        title: "Mupirocin",
        subtitle: "Bactroban · topical antibiotic · impetigo + nasal MRSA decolonization",
        category: "Topical antibiotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Pseudomonic acid antibiotic — topical"),
            KeyValueRow(key: "Coverage", value: "Gram-positive — Staph aureus (incl. MRSA), Strep pyogenes"),
            KeyValueRow(key: "Forms", value: "Cream / ointment 2% (skin); intranasal 2% (decolonization)"),
            KeyValueRow(key: "Common uses", value: "Impetigo, secondarily infected dermatoses, pre-op nasal MRSA decolonization per primary source")
        ],
        indications: AttributedProse(
            "Topical treatment of impetigo (children and adults) and secondarily infected traumatic skin lesions; intranasal eradication of methicillin-resistant Staphylococcus aureus (MRSA) colonization in adult patients and HCP per primary source.",
            citationIDs: ["openfda_round7"]
        ),
        mechanism: AttributedProse(
            "Inhibits bacterial isoleucyl-tRNA synthetase → blocks protein synthesis. Mechanism is novel — does not cross-resist with other classes.",
            citationIDs: ["openfda_round7"]
        ),
        dosing: [
            DosingBlock(label: "Topical (skin)", body: "Apply small amount to affected area TID × up to 10 days; cover with gauze if desired per primary source.", citationIDs: ["openfda_round7"]),
            DosingBlock(label: "Intranasal (MRSA decolonization)", body: "Apply half of single-use tube to each nostril BID × 5 days; pinch nostrils to spread.", citationIDs: ["openfda_round7"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to mupirocin or polyethylene-glycol vehicle; large burns or open wounds (PEG absorption can cause renal toxicity per primary source).",
            citationIDs: ["openfda_round7"]
        ),
        warnings: [
            AttributedBullet("Resistance — increasing prevalence; reserve for documented or high-risk indications.", citationIDs: ["openfda_round7"]),
            AttributedBullet("AVOID large open wounds / burns — polyethylene-glycol vehicle can be systemically absorbed and cause renal injury.", citationIDs: ["openfda_round7"]),
            AttributedBullet("Avoid eyes, mucous membranes (other than intranasal product); discontinue if sensitization develops.", citationIDs: ["openfda_round7"])
        ],
        adverseReactions: AttributedProse(
            "Burning, stinging, pain, pruritus, headache (intranasal), nasal congestion (intranasal).",
            citationIDs: ["openfda_round7"]
        ),
        drugInteractions: [
            AttributedBullet("Other intranasal products — separate; avoid concurrent use unless directed.", citationIDs: ["openfda_round7"])
        ],
        nursingImplications: [
            AttributedBullet("CDC recommends targeted MRSA decolonization for surgical patients, dialysis, and ICU per primary source — typically with chlorhexidine bathing PLUS intranasal mupirocin.", citationIDs: ["cdc_round7"]),
            AttributedBullet("Wash hands before and after application; do NOT apply with finger near eyes; stop and notify if rash / sensitization.", citationIDs: ["openrn_pharm_round7"]),
            AttributedBullet("If no response in 3–5 days for impetigo, reassess for resistance or alternative diagnosis.", citationIDs: ["openrn_pharm_round7"])
        ],
        patientTeaching: AttributedProse(
            "Apply only to the affected area; wash your hands before and after. For nasal use: pinch your nose after applying to spread the medicine. Do not apply to large open wounds or burns. Tell us if redness, itching, or burning gets worse.",
            citationIDs: ["openrn_pharm_round7"]
        ),
        citations: [openfda, openrnPharmR7, cdcR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}
