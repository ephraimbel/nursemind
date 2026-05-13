import Foundation

// Curator-model antimicrobial drug entries (round 6 expansion).
// Sources: openFDA SPL (CC0), Open RN Pharmacology (CC BY 4.0),
// CDC stewardship + TB guidance (public domain), IDSA / ATS / ASHP concept citations.

private let openfda = CitationSource(
    id: "openfda_round6",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR6 = CitationSource(
    id: "openrn_pharm_round6",
    shortName: "Open RN Nursing Pharmacology — Antimicrobials",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=antibacterial+antifungal+aminoglycoside+carbapenem",
    lastRetrieved: "2026-05-04"
)
private let cdcStewR6 = CitationSource(
    id: "cdc_stew_round6",
    shortName: "CDC antibiotic stewardship + TB guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/antibiotic-use/clinicians/index.html",
    lastRetrieved: "2026-05-04"
)
private let idsaConceptR6 = CitationSource(
    id: "idsa_round6",
    shortName: "IDSA / ATS clinical practice guidelines (concept citation)",
    publisher: "Infectious Diseases Society of America",
    license: .factCitationOnly,
    url: "https://www.idsociety.org/practice-guideline/",
    lastRetrieved: "2026-05-04"
)

// MARK: - Ampicillin-Sulbactam

public enum AmpSulbactamSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ampicillin-sulbactam",
        title: "Ampicillin-sulbactam",
        subtitle: "Unasyn · β-lactam + β-lactamase inhibitor combination",
        category: "Aminopenicillin + β-lactamase inhibitor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Aminopenicillin + β-lactamase inhibitor"),
            KeyValueRow(key: "Onset / route", value: "IV / IM"),
            KeyValueRow(key: "Renal adjustment", value: "Yes — dose-reduce with reduced CrCl"),
            KeyValueRow(key: "Coverage", value: "Many gram-positive cocci, gram-negative enterics, anaerobes (oral, abdominal)")
        ],
        indications: AttributedProse(
            "Skin and soft tissue infection, intra-abdominal infection, pelvic infection, polymicrobial aspiration pneumonia, animal/human bite wounds, mixed-flora head and neck infection per primary source.",
            citationIDs: ["openfda_round6"]
        ),
        mechanism: AttributedProse(
            "Ampicillin inhibits bacterial cell-wall synthesis by binding penicillin-binding proteins. Sulbactam irreversibly inhibits many β-lactamases, restoring ampicillin activity against β-lactamase-producing organisms.",
            citationIDs: ["openfda_round6"]
        ),
        dosing: [
            DosingBlock(label: "Adult — most infections", body: "1.5–3 g IV/IM every 6 hours; max 12 g/day total (8 g of ampicillin) per primary source.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Renal impairment", body: "Dose interval extended in CrCl <30; dialysis dosing per pharmacy.", citationIDs: ["openfda_round6"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to penicillins, cephalosporins (cross-reactivity), or β-lactamase inhibitors. History of hepatic dysfunction or jaundice with prior use.",
            citationIDs: ["openfda_round6"]
        ),
        warnings: [
            AttributedBullet("Anaphylaxis — including fatal — possible; review allergy history carefully.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Severe cutaneous adverse reactions (SJS/TEN, AGEP, DRESS) — STOP and notify.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Hepatotoxicity reported; monitor LFTs in prolonged use.", citationIDs: ["openfda_round6"]),
            AttributedBullet("C. difficile-associated diarrhea — assess for CDI in any antibiotic-exposed patient with new diarrhea.", citationIDs: ["openfda_round6"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, rash, nausea, injection-site pain, transient LFT elevation, hypersensitivity, candidiasis with prolonged use.",
            citationIDs: ["openfda_round6"]
        ),
        drugInteractions: [
            AttributedBullet("Probenecid — raises serum levels.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Allopurinol — increased rash risk.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Tetracyclines / chloramphenicol — bacteriostatic + bactericidal antagonism (theoretical; rarely clinically meaningful).", citationIDs: ["openfda_round6"])
        ],
        nursingImplications: [
            AttributedBullet("Verify allergy history including reaction details (rash vs anaphylaxis).", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Infuse over 15–30 min per primary source; monitor for infusion reactions.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Renal dosing per pharmacy.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Counsel on diarrhea — call provider if persistent or bloody (CDI risk).", citationIDs: ["openrn_pharm_round6"])
        ],
        patientTeaching: AttributedProse(
            "This is a strong antibiotic — finish the full course even when you feel better. Tell us right away about any rash, hives, swelling of face or throat, or trouble breathing. Diarrhea is common; persistent or bloody diarrhea can indicate a serious gut infection — call your provider.",
            citationIDs: ["openrn_pharm_round6"]
        ),
        citations: [openfda, openrnPharmR6, cdcStewR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cefuroxime

public enum CefuroximeSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cefuroxime",
        title: "Cefuroxime",
        subtitle: "Zinacef / Ceftin · second-generation cephalosporin",
        category: "Cephalosporin (2nd gen)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Second-generation cephalosporin"),
            KeyValueRow(key: "Routes", value: "IV / IM / PO (axetil)"),
            KeyValueRow(key: "Coverage", value: "Many gram-positive + extended gram-negative (H. influenzae, Moraxella); some anaerobes"),
            KeyValueRow(key: "Common uses", value: "Community-acquired pneumonia, sinusitis, otitis, skin/soft tissue, surgical prophylaxis")
        ],
        indications: AttributedProse(
            "Lower respiratory tract infection, skin and soft tissue infection, urinary tract infection, gonorrhea (single dose IM), surgical prophylaxis, otitis media, sinusitis per primary source.",
            citationIDs: ["openfda_round6"]
        ),
        mechanism: AttributedProse(
            "Inhibits bacterial cell-wall synthesis by binding penicillin-binding proteins. More resistant to many β-lactamases than first-generation cephalosporins.",
            citationIDs: ["openfda_round6"]
        ),
        dosing: [
            DosingBlock(label: "Adult IV/IM", body: "750 mg–1.5 g every 8 hours; up to 1.5 g every 6 hours for severe infection per primary source.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Adult PO (axetil)", body: "250–500 mg every 12 hours.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Renal impairment", body: "Adjust interval in CrCl <30 per pharmacy.", citationIDs: ["openfda_round6"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to cephalosporins; severe allergic reaction to penicillins (cross-reactivity).",
            citationIDs: ["openfda_round6"]
        ),
        warnings: [
            AttributedBullet("Anaphylaxis; severe cutaneous reactions (SJS/TEN, DRESS); STOP at any rash.", citationIDs: ["openfda_round6"]),
            AttributedBullet("C. difficile-associated diarrhea.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Pseudomembranous colitis, hemolytic anemia.", citationIDs: ["openfda_round6"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, nausea, rash, injection-site pain, transient LFT elevation, eosinophilia.",
            citationIDs: ["openfda_round6"]
        ),
        drugInteractions: [
            AttributedBullet("Probenecid raises levels.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Aminoglycosides — additive nephrotoxicity (rare with cefuroxime).", citationIDs: ["openfda_round6"]),
            AttributedBullet("Oral cefuroxime axetil absorption increased with food.", citationIDs: ["openfda_round6"])
        ],
        nursingImplications: [
            AttributedBullet("PO formulation must be taken WITH food to enhance absorption per primary source.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Verify cephalosporin / penicillin allergy; document reaction type.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Infuse IV over 15–60 min; rotate sites for IM injection (large-volume).", citationIDs: ["openrn_pharm_round6"])
        ],
        patientTeaching: AttributedProse(
            "Take with food. Finish the full course. Report rash, diarrhea, or any allergic symptoms. Avoid alcohol during therapy if recommended by provider for nausea control.",
            citationIDs: ["openrn_pharm_round6"]
        ),
        citations: [openfda, openrnPharmR6, cdcStewR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Daptomycin

public enum DaptomycinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "daptomycin",
        title: "Daptomycin",
        subtitle: "Cubicin · cyclic lipopeptide for serious gram-positive infection",
        category: "Lipopeptide antibiotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Cyclic lipopeptide"),
            KeyValueRow(key: "Coverage", value: "Gram-positive only — MRSA, VRE (some), MSSA, Strep"),
            KeyValueRow(key: "DO NOT USE FOR", value: "Pneumonia — inactivated by surfactant per primary source"),
            KeyValueRow(key: "Monitoring", value: "Weekly CK; muscle symptoms")
        ],
        indications: AttributedProse(
            "Complicated skin and skin-structure infection, S. aureus bacteremia (including right-sided endocarditis) per primary source.",
            citationIDs: ["openfda_round6"]
        ),
        mechanism: AttributedProse(
            "Binds bacterial membrane in a calcium-dependent manner; rapid depolarization → cell death. Concentration-dependent bactericidal activity.",
            citationIDs: ["openfda_round6"]
        ),
        dosing: [
            DosingBlock(label: "cSSSI", body: "4 mg/kg IV once daily.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Bacteremia / endocarditis", body: "6 mg/kg IV once daily; many experts use 8–10 mg/kg for serious infection per primary source.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Renal impairment", body: "CrCl <30: every-48-hour dosing per primary source.", citationIDs: ["openfda_round6"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to daptomycin.",
            citationIDs: ["openfda_round6"]
        ),
        warnings: [
            AttributedBullet("MYOPATHY / RHABDOMYOLYSIS — monitor weekly CK; STOP if CK >5× ULN with symptoms or >10× ULN without per primary source.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Eosinophilic pneumonia — STOP if dyspnea, cough, hypoxemia, pulmonary infiltrates.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Peripheral neuropathy.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Falsely elevated PT/INR with certain assays.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Inactivated by lung surfactant — DO NOT use for pneumonia per primary source.", citationIDs: ["openfda_round6"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, nausea, headache, injection-site reactions, elevated CK, rash, eosinophilic pneumonia (rare but serious).",
            citationIDs: ["openfda_round6"]
        ),
        drugInteractions: [
            AttributedBullet("Statins — additive myopathy; consider holding statin while on daptomycin per primary source.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Tobramycin — possible interaction; monitor.", citationIDs: ["openfda_round6"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + weekly CK; ASK about muscle pain, weakness, dark urine each visit.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Infuse IV over 30 min; assess for new respiratory symptoms.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Confirm not being used for pneumonia indication.", citationIDs: ["openrn_pharm_round6"])
        ],
        patientTeaching: AttributedProse(
            "Tell us about muscle pain, weakness, or dark-colored urine. Report any new shortness of breath or cough. Follow up for weekly blood tests.",
            citationIDs: ["openrn_pharm_round6"]
        ),
        citations: [openfda, openrnPharmR6, idsaConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Meropenem

public enum MeropenemSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "meropenem",
        title: "Meropenem",
        subtitle: "Merrem · carbapenem for serious or MDR infections",
        category: "Carbapenem",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Carbapenem"),
            KeyValueRow(key: "Coverage", value: "Very broad — most gram-positive, gram-negative (incl. ESBL Enterobacterales, Pseudomonas), anaerobes"),
            KeyValueRow(key: "DOES NOT cover", value: "MRSA, atypicals, VRE, Stenotrophomonas"),
            KeyValueRow(key: "Stewardship", value: "Reserve for serious / resistant infection")
        ],
        indications: AttributedProse(
            "Complicated intra-abdominal infection, bacterial meningitis (Listeria still requires ampicillin), nosocomial / ventilator-associated pneumonia, complicated skin and soft tissue infection, febrile neutropenia, complicated UTI per primary source.",
            citationIDs: ["openfda_round6"]
        ),
        mechanism: AttributedProse(
            "Inhibits bacterial cell-wall synthesis by binding penicillin-binding proteins; resistant to most β-lactamases including ESBLs (but not carbapenemases).",
            citationIDs: ["openfda_round6"]
        ),
        dosing: [
            DosingBlock(label: "Most indications", body: "1 g IV every 8 hours.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Meningitis", body: "2 g IV every 8 hours.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Renal impairment", body: "Dose-reduce in CrCl <50; pharmacy dosing.", citationIDs: ["openfda_round6"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to carbapenems; severe hypersensitivity to other β-lactams.",
            citationIDs: ["openfda_round6"]
        ),
        warnings: [
            AttributedBullet("Anaphylaxis; cross-reactivity with penicillins / cephalosporins (lower than once thought, but possible).", citationIDs: ["openfda_round6"]),
            AttributedBullet("Seizures — risk increases with renal impairment, CNS pathology, high doses.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Severe cutaneous reactions (SJS/TEN, DRESS).", citationIDs: ["openfda_round6"]),
            AttributedBullet("C. difficile-associated diarrhea.", citationIDs: ["openfda_round6"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, nausea, rash, headache, injection-site reaction, thrombophlebitis, transient LFT and platelet changes.",
            citationIDs: ["openfda_round6"]
        ),
        drugInteractions: [
            AttributedBullet("Valproic acid — meropenem dramatically REDUCES VPA levels → seizure risk; AVOID combination per primary source.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Probenecid — raises meropenem levels.", citationIDs: ["openfda_round6"])
        ],
        nursingImplications: [
            AttributedBullet("Carbapenems and VPA do NOT mix — review medication list before infusing; alternative seizure control if needed.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Renal dosing critical — pharmacy-driven; monitor creatinine.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Infuse IV over 15–30 min standard; extended infusion (3 hr) sometimes used for resistant gram-negatives per primary source.", citationIDs: ["openrn_pharm_round6"])
        ],
        patientTeaching: AttributedProse(
            "Report diarrhea (especially severe or bloody), rash, or seizures. Tell every provider about all medications — meropenem can interact dangerously with seizure medication called valproic acid.",
            citationIDs: ["openrn_pharm_round6"]
        ),
        citations: [openfda, openrnPharmR6, idsaConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ertapenem

public enum ErtapenemSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ertapenem",
        title: "Ertapenem",
        subtitle: "Invanz · once-daily carbapenem (no Pseudomonas / Acinetobacter)",
        category: "Carbapenem",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Carbapenem"),
            KeyValueRow(key: "Coverage", value: "ESBL Enterobacterales, anaerobes, MSSA, Strep — NO Pseudomonas, NO Acinetobacter, NO Enterococcus"),
            KeyValueRow(key: "Dosing", value: "ONCE DAILY — outpatient parenteral antibiotic therapy (OPAT) friendly"),
            KeyValueRow(key: "Common use", value: "Complicated UTI / pyelonephritis with ESBL; complicated intra-abdominal; OPAT")
        ],
        indications: AttributedProse(
            "Complicated intra-abdominal infection, complicated skin and soft tissue infection (including diabetic foot without osteomyelitis), community-acquired pneumonia, complicated UTI / pyelonephritis, acute pelvic infection, surgical prophylaxis (colorectal) per primary source.",
            citationIDs: ["openfda_round6"]
        ),
        mechanism: AttributedProse(
            "Inhibits bacterial cell-wall synthesis by binding penicillin-binding proteins. Long half-life supports once-daily dosing.",
            citationIDs: ["openfda_round6"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "1 g IV or IM once daily.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Renal impairment", body: "CrCl <30: 500 mg once daily.", citationIDs: ["openfda_round6"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to ertapenem or other carbapenems; severe β-lactam allergy.",
            citationIDs: ["openfda_round6"]
        ),
        warnings: [
            AttributedBullet("Anaphylaxis; cross-reactivity with other β-lactams.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Seizures — especially in renal impairment, CNS disease.", citationIDs: ["openfda_round6"]),
            AttributedBullet("C. difficile-associated diarrhea.", citationIDs: ["openfda_round6"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, infusion-site reaction, headache, rash, nausea, transient LFT elevation.",
            citationIDs: ["openfda_round6"]
        ),
        drugInteractions: [
            AttributedBullet("Valproic acid — REDUCES VPA levels; AVOID per primary source.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Probenecid — increases ertapenem levels.", citationIDs: ["openfda_round6"])
        ],
        nursingImplications: [
            AttributedBullet("Once-daily dosing makes ertapenem a workhorse for OPAT (outpatient infusion).", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Reconstitute per pharmacy; IM injection uses lidocaine diluent — ALWAYS confirm not for IV use; verify lidocaine allergy.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("AVOID with VPA.", citationIDs: ["openrn_pharm_round6"])
        ],
        patientTeaching: AttributedProse(
            "This is a once-daily IV antibiotic — keep the appointment for each dose. Report rash, severe diarrhea, or seizures. Tell us if you take valproic acid.",
            citationIDs: ["openrn_pharm_round6"]
        ),
        citations: [openfda, openrnPharmR6, idsaConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Gentamicin

public enum GentamicinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "gentamicin",
        title: "Gentamicin",
        subtitle: "Garamycin · aminoglycoside · narrow therapeutic index",
        category: "Aminoglycoside",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Aminoglycoside — gram-negative + synergy for gram-positive"),
            KeyValueRow(key: "Toxicity", value: "Nephrotoxicity + ototoxicity (often irreversible)"),
            KeyValueRow(key: "Dosing options", value: "Traditional q8h with peak/trough OR extended-interval (5–7 mg/kg q24h)"),
            KeyValueRow(key: "Stewardship", value: "Short courses; strict TDM")
        ],
        indications: AttributedProse(
            "Serious gram-negative infection, often as part of combination therapy. Synergistic combination with cell-wall agents (penicillin, ampicillin, vancomycin) for enterococcal endocarditis. Topical (eye drops, creams) per primary source.",
            citationIDs: ["openfda_round6"]
        ),
        mechanism: AttributedProse(
            "Binds 30S ribosome → bacterial protein-synthesis errors → death. Concentration-dependent bactericidal with post-antibiotic effect.",
            citationIDs: ["openfda_round6"]
        ),
        dosing: [
            DosingBlock(label: "Extended-interval (most common)", body: "5–7 mg/kg IV every 24 hours; nomogram-based or random level approach to subsequent dosing per primary source.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Traditional", body: "1–2.5 mg/kg IV every 8 hours; peak 5–10 mcg/mL, trough <2 mcg/mL.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Synergy (endocarditis)", body: "1 mg/kg IV every 8 hours; lower target levels per ID consult.", citationIDs: ["openfda_round6"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to aminoglycosides; relative contraindication: severe renal impairment (use only when no alternative); pregnancy (unless benefit > risk — fetal ototoxicity).",
            citationIDs: ["openfda_round6"]
        ),
        warnings: [
            AttributedBullet("BOXED — nephrotoxicity (often reversible) and ototoxicity (vestibular and cochlear; often IRREVERSIBLE) — risk increases with prolonged use, high troughs, advanced age, dehydration, concurrent nephro/ototoxins.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Neuromuscular blockade — myasthenia gravis, post-anesthesia.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Fetal ototoxicity in pregnancy.", citationIDs: ["openfda_round6"])
        ],
        adverseReactions: AttributedProse(
            "Acute kidney injury, ototoxicity (high-pitched hearing loss; vertigo), rash, anemia.",
            citationIDs: ["openfda_round6"]
        ),
        drugInteractions: [
            AttributedBullet("Vancomycin, NSAIDs, contrast, loop diuretics — additive nephrotoxicity.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Other ototoxins (loop diuretics, cisplatin) — additive ototoxicity.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Neuromuscular blockers — prolonged blockade.", citationIDs: ["openfda_round6"])
        ],
        nursingImplications: [
            AttributedBullet("ALWAYS draw level per ordering protocol — extended-interval random level (typically 8–12 hr post-dose) OR traditional peak (30 min post-end of infusion) and trough (within 30 min before next dose).", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Daily creatinine; ASK about hearing changes, tinnitus, balance changes — STOP for any new ototoxicity.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Limit to shortest effective course; pharmacy- and ID-driven.", citationIDs: ["openrn_pharm_round6"])
        ],
        patientTeaching: AttributedProse(
            "Tell us right away about any change in hearing, ringing in your ears, dizziness, or balance problems. Make sure to keep all blood-work appointments. Drink fluids. Tell us about all medications, including NSAIDs.",
            citationIDs: ["openrn_pharm_round6"]
        ),
        citations: [openfda, openrnPharmR6, idsaConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tobramycin

public enum TobramycinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tobramycin",
        title: "Tobramycin",
        subtitle: "Nebcin / Tobi · aminoglycoside · IV / inhaled (cystic fibrosis)",
        category: "Aminoglycoside",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Aminoglycoside"),
            KeyValueRow(key: "Routes", value: "IV; inhaled (Tobi) for chronic Pseudomonas in CF; ophthalmic"),
            KeyValueRow(key: "Coverage", value: "Pseudomonas (slightly better than gentamicin), Enterobacterales"),
            KeyValueRow(key: "Toxicity", value: "Same class — nephrotoxicity, ototoxicity")
        ],
        indications: AttributedProse(
            "Serious gram-negative infection, especially Pseudomonas aeruginosa. Inhaled formulation for chronic Pseudomonas suppression in cystic fibrosis. Ophthalmic for bacterial conjunctivitis per primary source.",
            citationIDs: ["openfda_round6"]
        ),
        mechanism: AttributedProse(
            "Binds 30S ribosome → bacterial protein-synthesis errors → bactericidal. Concentration-dependent killing.",
            citationIDs: ["openfda_round6"]
        ),
        dosing: [
            DosingBlock(label: "IV — extended interval", body: "5–7 mg/kg IV every 24 hours per primary source; pharmacy-driven adjustments.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Inhaled (CF)", body: "300 mg via nebulizer twice daily for 28 days on / 28 days off cycle per primary source.", citationIDs: ["openfda_round6"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to aminoglycosides.",
            citationIDs: ["openfda_round6"]
        ),
        warnings: [
            AttributedBullet("BOXED — nephrotoxicity, ototoxicity (often irreversible).", citationIDs: ["openfda_round6"]),
            AttributedBullet("Inhaled — bronchospasm, voice alteration; pre-test dose may be performed.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Neuromuscular blockade.", citationIDs: ["openfda_round6"])
        ],
        adverseReactions: AttributedProse(
            "AKI, ototoxicity, rash; inhaled — voice alteration, bronchospasm, cough.",
            citationIDs: ["openfda_round6"]
        ),
        drugInteractions: [
            AttributedBullet("Same as gentamicin — additive nephro / ototoxicity with vancomycin, NSAIDs, contrast, loop diuretics.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Neuromuscular blockers.", citationIDs: ["openfda_round6"])
        ],
        nursingImplications: [
            AttributedBullet("Same TDM as gentamicin — pharmacy-driven IV monitoring.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Inhaled — administer with bronchodilator first (assess for bronchospasm); rinse mouth after.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Hearing screening for chronic CF inhaled use per primary source.", citationIDs: ["openrn_pharm_round6"])
        ],
        patientTeaching: AttributedProse(
            "For inhaled use: take your bronchodilator first if prescribed, then the inhaled antibiotic; clean nebulizer parts after each use. For IV use: report any change in hearing, ringing, dizziness, or decreased urine output.",
            citationIDs: ["openrn_pharm_round6"]
        ),
        citations: [openfda, openrnPharmR6, idsaConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Aztreonam

public enum AztreonamSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "aztreonam",
        title: "Aztreonam",
        subtitle: "Azactam · monobactam · gram-negative coverage with no β-lactam cross-reactivity (mostly)",
        category: "Monobactam",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Monobactam"),
            KeyValueRow(key: "Coverage", value: "Gram-NEGATIVE only (incl. Pseudomonas); NO gram-positive, NO anaerobes"),
            KeyValueRow(key: "Use case", value: "PCN-allergic patients needing gram-negative coverage (low cross-reactivity per primary source — except ceftazidime, which shares R1 side chain)"),
            KeyValueRow(key: "Routes", value: "IV / IM / inhaled (Cayston for CF)")
        ],
        indications: AttributedProse(
            "Gram-negative infections including UTI, lower respiratory tract, septicemia, skin/soft tissue, intra-abdominal (with anaerobic coverage added), gynecologic infection per primary source. Inhaled for chronic CF Pseudomonas.",
            citationIDs: ["openfda_round6"]
        ),
        mechanism: AttributedProse(
            "Binds penicillin-binding protein 3 of gram-negative organisms; no activity against gram-positive or anaerobes due to PBP differences.",
            citationIDs: ["openfda_round6"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "1–2 g IV/IM every 6–12 hours depending on infection severity; max 8 g/day.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Renal impairment", body: "Dose-reduce in CrCl <30; pharmacy-driven.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Inhaled (Cayston)", body: "75 mg via nebulizer 3 times daily 28 days on / 28 days off per primary source.", citationIDs: ["openfda_round6"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to aztreonam.",
            citationIDs: ["openfda_round6"]
        ),
        warnings: [
            AttributedBullet("Hypersensitivity, including anaphylaxis (low but present).", citationIDs: ["openfda_round6"]),
            AttributedBullet("CAUTION in patients with severe ceftazidime allergy — shared R1 side chain → cross-reactivity per primary source.", citationIDs: ["openfda_round6"]),
            AttributedBullet("C. difficile-associated diarrhea.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Severe cutaneous reactions (SJS/TEN) reported.", citationIDs: ["openfda_round6"])
        ],
        adverseReactions: AttributedProse(
            "Rash, diarrhea, transient LFT elevation, eosinophilia, injection-site reactions; inhaled — wheeze, cough.",
            citationIDs: ["openfda_round6"]
        ),
        drugInteractions: [
            AttributedBullet("Probenecid raises levels.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Combine with anaerobe-active agent for mixed infections (intra-abdominal).", citationIDs: ["openfda_round6"])
        ],
        nursingImplications: [
            AttributedBullet("Verify allergy status — aztreonam is often the FIRST CHOICE for gram-negative coverage in PCN-allergic patients per primary source — but ceftazidime allergy requires caution.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Often paired with vancomycin or linezolid (gram-positive) and metronidazole (anaerobes) when broad empiric coverage needed.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Renal dosing per pharmacy.", citationIDs: ["openrn_pharm_round6"])
        ],
        patientTeaching: AttributedProse(
            "Report rash, hives, diarrhea, or any allergic symptoms. For inhaled form, take with a bronchodilator first if prescribed and clean equipment per instructions.",
            citationIDs: ["openrn_pharm_round6"]
        ),
        citations: [openfda, openrnPharmR6, idsaConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tigecycline

public enum TigecyclineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tigecycline",
        title: "Tigecycline",
        subtitle: "Tygacil · glycylcycline · broad-spectrum reserve antibiotic",
        category: "Glycylcycline",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Glycylcycline (tetracycline-class)"),
            KeyValueRow(key: "Coverage", value: "Very broad — MRSA, VRE, ESBL Enterobacterales, Acinetobacter, anaerobes, atypicals"),
            KeyValueRow(key: "DOES NOT cover", value: "Pseudomonas, Proteus, Providencia"),
            KeyValueRow(key: "Boxed warning", value: "Increased mortality vs comparators in approved + non-approved indications — RESERVE for when no alternative")
        ],
        indications: AttributedProse(
            "Complicated skin and soft tissue infection, complicated intra-abdominal infection, community-acquired bacterial pneumonia per primary source.",
            citationIDs: ["openfda_round6"]
        ),
        mechanism: AttributedProse(
            "Binds 30S ribosome → bacteriostatic protein-synthesis inhibition. Modified structure overcomes most tetracycline resistance mechanisms.",
            citationIDs: ["openfda_round6"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "100 mg IV loading; then 50 mg IV every 12 hours per primary source.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Severe hepatic impairment", body: "100 mg IV load; then 25 mg IV every 12 hours per primary source.", citationIDs: ["openfda_round6"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to tigecycline or tetracyclines; pregnancy, lactation, children <8 years (tetracycline-class effects on bone and tooth development).",
            citationIDs: ["openfda_round6"]
        ),
        warnings: [
            AttributedBullet("BOXED — increased mortality across infection types vs comparator antibiotics per primary source. Use only when alternatives unavailable.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Anaphylaxis; severe cutaneous reactions; hepatotoxicity; pancreatitis.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Photosensitivity.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Tooth discoloration / bone growth in <8 yr / pregnancy.", citationIDs: ["openfda_round6"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting (very common), diarrhea, headache, transient LFT elevation, photosensitivity.",
            citationIDs: ["openfda_round6"]
        ),
        drugInteractions: [
            AttributedBullet("Warfarin — increased INR; monitor.", citationIDs: ["openfda_round6"]),
            AttributedBullet("OCPs — possibly reduced efficacy (tetracycline-class).", citationIDs: ["openfda_round6"])
        ],
        nursingImplications: [
            AttributedBullet("Reserve antibiotic — confirm ID approval / stewardship per facility.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Premedicate / slow infusion rates if patient is N/V-prone.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Counsel on photosensitivity and contraception.", citationIDs: ["openrn_pharm_round6"])
        ],
        patientTeaching: AttributedProse(
            "Use sunscreen and protective clothing — sunburn risk is high. Use a backup birth-control method while on this antibiotic. Report severe abdominal pain (pancreatitis), yellow skin or eyes, or significant rash.",
            citationIDs: ["openrn_pharm_round6"]
        ),
        citations: [openfda, openrnPharmR6, idsaConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Amphotericin B

public enum AmphotericinBSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "amphotericin-b",
        title: "Amphotericin B (liposomal / deoxycholate)",
        subtitle: "Polyene antifungal · serious systemic mycoses",
        category: "Polyene antifungal",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Polyene antifungal"),
            KeyValueRow(key: "Forms", value: "Conventional (deoxycholate) — most toxic; Liposomal (AmBisome) — preferred when affordable"),
            KeyValueRow(key: "Notable", value: "\"Shake and bake\" — fevers, chills, rigors with infusion"),
            KeyValueRow(key: "Toxicity", value: "Nephrotoxicity (dose-related, hypomagnesemia, hypokalemia), infusion reactions")
        ],
        indications: AttributedProse(
            "Serious systemic fungal infection — invasive candidiasis, aspergillosis, cryptococcal meningitis, mucormycosis, blastomycosis, histoplasmosis, coccidioidomycosis, leishmaniasis per primary source.",
            citationIDs: ["openfda_round6"]
        ),
        mechanism: AttributedProse(
            "Binds ergosterol in fungal cell membranes → pore formation → cell death. Mammalian cells (cholesterol-based) less affected, but cross-binding accounts for nephrotoxicity.",
            citationIDs: ["openfda_round6"]
        ),
        dosing: [
            DosingBlock(label: "Conventional (deoxycholate)", body: "0.3–1.5 mg/kg IV daily — pharmacy-driven; rarely used now due to toxicity.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Liposomal (AmBisome)", body: "3–5 mg/kg IV daily; up to 10 mg/kg for cryptococcal meningitis or mucormycosis per primary source.", citationIDs: ["openfda_round6"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to amphotericin B (relative — rarely an absolute contraindication).",
            citationIDs: ["openfda_round6"]
        ),
        warnings: [
            AttributedBullet("Nephrotoxicity (dose-related); pre-hydrate with 500–1000 mL NS before AND after each dose per primary source.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Infusion reactions — fevers, chills, rigors, hypotension, tachycardia; premedicate with acetaminophen + diphenhydramine ± meperidine for rigors per primary source.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Hypokalemia, hypomagnesemia — replete aggressively; baseline + daily K, Mg.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Anaphylaxis (rare).", citationIDs: ["openfda_round6"])
        ],
        adverseReactions: AttributedProse(
            "AKI (most common), hypokalemia, hypomagnesemia, infusion reaction (fever, rigors, hypotension), anemia, headache.",
            citationIDs: ["openfda_round6"]
        ),
        drugInteractions: [
            AttributedBullet("Other nephrotoxins — AVOID concurrent NSAIDs, aminoglycosides, contrast, calcineurin inhibitors when feasible.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Drugs that lower K (loop / thiazide diuretics, steroids) — additive hypokalemia.", citationIDs: ["openfda_round6"])
        ],
        nursingImplications: [
            AttributedBullet("Pre-hydrate with NS per provider order; premedicate; have meperidine available for rigors per primary source.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Daily creatinine, K, Mg; replete electrolytes; trend BUN.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Liposomal preferred when AKI risk is elevated (transplant, AKI, advanced age) per primary source.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Verify formulation (CONVENTIONAL vs LIPOSOMAL) — dosing differs by 3–10×; ISMP medication-error category.", citationIDs: ["openrn_pharm_round6"])
        ],
        patientTeaching: AttributedProse(
            "You will get IV fluids before and after the antifungal — this protects your kidneys. You may feel chills or fever during the infusion; this is common and we will give medication for comfort. Tell us about muscle cramps or weakness — these can mean low potassium.",
            citationIDs: ["openrn_pharm_round6"]
        ),
        citations: [openfda, openrnPharmR6, idsaConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Micafungin

public enum MicafunginSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "micafungin",
        title: "Micafungin",
        subtitle: "Mycamine · echinocandin · invasive Candida",
        category: "Echinocandin antifungal",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Echinocandin"),
            KeyValueRow(key: "Coverage", value: "Candida (incl. C. glabrata), Aspergillus (alternative); NO Cryptococcus, NO Mucor"),
            KeyValueRow(key: "Toxicity", value: "Generally well tolerated; minimal renal/hepatic adjustment"),
            KeyValueRow(key: "Common use", value: "Empiric therapy for candidemia in non-neutropenic AND neutropenic patients per primary source")
        ],
        indications: AttributedProse(
            "Candidemia, esophageal candidiasis, prophylaxis of Candida in stem-cell transplant recipients per primary source.",
            citationIDs: ["openfda_round6"]
        ),
        mechanism: AttributedProse(
            "Inhibits β-(1,3)-D-glucan synthase → disrupted fungal cell-wall synthesis → cell death. Fungicidal against Candida; fungistatic against Aspergillus.",
            citationIDs: ["openfda_round6"]
        ),
        dosing: [
            DosingBlock(label: "Candidemia / invasive candidiasis", body: "100 mg IV once daily (150 mg for esophageal candidiasis) per primary source.", citationIDs: ["openfda_round6"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to echinocandins.",
            citationIDs: ["openfda_round6"]
        ),
        warnings: [
            AttributedBullet("Hypersensitivity / anaphylaxis (rare).", citationIDs: ["openfda_round6"]),
            AttributedBullet("Hepatotoxicity — monitor LFTs.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Hemolytic anemia (rare).", citationIDs: ["openfda_round6"])
        ],
        adverseReactions: AttributedProse(
            "Headache, nausea, diarrhea, transient LFT elevation, hypokalemia.",
            citationIDs: ["openfda_round6"]
        ),
        drugInteractions: [
            AttributedBullet("Sirolimus, nifedipine — micafungin can raise their levels.", citationIDs: ["openfda_round6"])
        ],
        nursingImplications: [
            AttributedBullet("Once-daily IV; well tolerated.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Trend LFTs; ID consult typically guides duration.", citationIDs: ["openrn_pharm_round6"])
        ],
        patientTeaching: AttributedProse(
            "Report rash, hives, yellow skin or eyes, or unusual fatigue. Keep follow-up labs.",
            citationIDs: ["openrn_pharm_round6"]
        ),
        citations: [openfda, openrnPharmR6, idsaConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Isoniazid

public enum IsoniazidSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "isoniazid",
        title: "Isoniazid (INH)",
        subtitle: "First-line antimycobacterial · TB treatment / latent TB infection",
        category: "Antitubercular",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Antimycobacterial — INH"),
            KeyValueRow(key: "Use", value: "Latent TB (monotherapy 6–9 mo) or active TB (combination — RIPE: rifampin/INH/pyrazinamide/ethambutol)"),
            KeyValueRow(key: "Boxed", value: "Hepatotoxicity — can be fatal"),
            KeyValueRow(key: "Co-administer", value: "Pyridoxine (vitamin B6) 25–50 mg daily to prevent peripheral neuropathy per primary source")
        ],
        indications: AttributedProse(
            "Treatment of latent and active tuberculosis (Mycobacterium tuberculosis). Combination regimen for active disease per CDC / ATS / IDSA guidelines per primary source.",
            citationIDs: ["openfda_round6"]
        ),
        mechanism: AttributedProse(
            "Prodrug activated by mycobacterial catalase-peroxidase (KatG); inhibits mycolic acid synthesis → cell-wall disruption → bactericidal against actively dividing M. tuberculosis.",
            citationIDs: ["openfda_round6"]
        ),
        dosing: [
            DosingBlock(label: "Adult — daily", body: "5 mg/kg PO daily (max 300 mg) per primary source.", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Adult — twice weekly", body: "15 mg/kg PO (max 900 mg).", citationIDs: ["openfda_round6"]),
            DosingBlock(label: "Latent TB", body: "Daily INH 6–9 months OR weekly INH-rifapentine (3HP) ×12 weeks per CDC.", citationIDs: ["cdc_stew_round6"])
        ],
        contraindications: AttributedProse(
            "Active hepatic disease; previous severe INH-related hepatic injury; hypersensitivity.",
            citationIDs: ["openfda_round6"]
        ),
        warnings: [
            AttributedBullet("BOXED — severe and sometimes fatal hepatitis; risk increases with age, alcohol use, daily ETOH, postpartum, viral hepatitis, methotrexate, multiple drug interactions.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Peripheral neuropathy — pyridoxine 25–50 mg daily prevents per primary source.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Hypersensitivity (DRESS, lupus-like syndrome).", citationIDs: ["openfda_round6"]),
            AttributedBullet("CNS effects (psychosis, seizure).", citationIDs: ["openfda_round6"])
        ],
        adverseReactions: AttributedProse(
            "Hepatotoxicity (asymptomatic LFT rise common; symptomatic hepatitis less common but serious), peripheral neuropathy, rash, GI upset.",
            citationIDs: ["openfda_round6"]
        ),
        drugInteractions: [
            AttributedBullet("Acetaminophen — additive hepatotoxicity.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Phenytoin — INH inhibits phenytoin metabolism; phenytoin toxicity.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Carbamazepine — increased CBZ levels.", citationIDs: ["openfda_round6"]),
            AttributedBullet("Rifampin — increased hepatotoxicity (used together but monitored).", citationIDs: ["openfda_round6"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + monthly LFTs (or per facility); ASK about anorexia, nausea, dark urine, RUQ pain at every visit.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Co-administer pyridoxine 25–50 mg daily — prevents neuropathy per primary source.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Strict alcohol avoidance.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Take on empty stomach if tolerated; with food if GI upset.", citationIDs: ["openrn_pharm_round6"]),
            AttributedBullet("Public health reporting requirement for active TB; directly observed therapy (DOT) is standard.", citationIDs: ["cdc_stew_round6"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed for the FULL course — incomplete treatment causes resistant TB. Take vitamin B6 (pyridoxine) every day to prevent nerve damage. AVOID alcohol completely. Report yellow skin or eyes, dark urine, severe nausea, loss of appetite, or numbness/tingling immediately. Keep all clinic appointments — monthly check-ins are required.",
            citationIDs: ["openrn_pharm_round6"]
        ),
        citations: [openfda, openrnPharmR6, cdcStewR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}
