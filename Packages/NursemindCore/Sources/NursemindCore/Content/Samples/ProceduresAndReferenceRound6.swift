import Foundation

// Curator-model procedure + reference entries (round 6 expansion).
// Sources: Open RN Skills + Health Alterations (CC BY 4.0), OpenStax Clinical Nursing Skills
// (CC BY 4.0 with AI restriction), CDC + KDIGO + AHA + AASLD concept citations.

private let openrnSkR6 = CitationSource(
    id: "openrn_skills_round6",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=paracentesis+thoracentesis+blood+culture",
    lastRetrieved: "2026-05-04"
)
private let openrnHar6 = CitationSource(
    id: "openrn_ha_round6_proc",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=AKI+CKD+atrial+fibrillation+pulmonary+embolism",
    lastRetrieved: "2026-05-04"
)
private let openstaxSkR6p = CitationSource(
    id: "openstax_skills_round6",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let kdigoConceptR6 = CitationSource(
    id: "kdigo_round6",
    shortName: "KDIGO clinical practice guidelines (concept citation)",
    publisher: "Kidney Disease: Improving Global Outcomes",
    license: .factCitationOnly,
    url: "https://kdigo.org/guidelines/",
    lastRetrieved: "2026-05-04"
)
private let cardConceptR6 = CitationSource(
    id: "card_concept_round6",
    shortName: "AHA / ACC / CHEST guidelines (concept citation)",
    publisher: "American Heart Association · American College of Cardiology · CHEST",
    license: .factCitationOnly,
    url: "https://www.ahajournals.org/journal/circ",
    lastRetrieved: "2026-05-04"
)
private let aasldConceptR6 = CitationSource(
    id: "aasld_round6",
    shortName: "AASLD / EASL hepatology guidelines (concept citation)",
    publisher: "American Association for the Study of Liver Diseases",
    license: .factCitationOnly,
    url: "https://www.aasld.org/practice-guidelines",
    lastRetrieved: "2026-05-04"
)

private let safetyR6 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let perfusionR6 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion)
private let renalRefR6 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes)
private let infectionR6 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection)

// MARK: - Paracentesis Assist

public enum ParacentesisAssistSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "paracentesis-assist",
        title: "Paracentesis assist",
        subtitle: "Diagnostic + therapeutic abdominal tap · cirrhosis / SBP / ascites",
        nclexTags: safetyR6,
        indications: AttributedProse(
            "Diagnostic — new-onset ascites, suspected SBP (any cirrhotic with ascites and abdominal pain, fever, AMS, AKI, GI bleed, or rapid clinical change). Therapeutic — symptomatic large-volume ascites (typically 4–8 L removed; replace with albumin 6–8 g per liter removed when removing >5 L per primary source).",
            citationIDs: ["openrn_skills_round6", "aasld_round6"]
        ),
        contraindications: AttributedProse(
            "Hemodynamic instability requiring resuscitation; pregnancy (relative — use ultrasound guidance); skin infection / cellulitis at planned insertion site; bowel obstruction with distended bowel; surgical adhesions in the planned tract.",
            citationIDs: ["openrn_skills_round6"]
        ),
        equipment: [
            AttributedBullet("Paracentesis kit — Caldwell needle, multi-port catheter, three-way stopcock, evacuation bag/bottle.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Sterile gloves, drape, mask, eye protection; chlorhexidine prep; lidocaine 1%; local-anesthesia syringe.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Specimen tubes — cell count (lavender), chemistry (red), microbiology (blood-culture bottles inoculated at bedside), cytology (large-volume per primary source).", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Albumin 25% bottles per provider order for large-volume taps.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Bedside ultrasound for site selection (preferred per primary source).", citationIDs: ["openrn_skills_round6"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order, indications, INR / platelets, recent imaging.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Obtain informed consent.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Empty bladder before procedure.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Position patient supine with HOB ~30°; mark site (typically LLQ ~2 fingerbreadths cephalad and medial to ASIS, avoiding scars and visible vessels) per primary source.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Baseline vital signs; IV access if not present.", citationIDs: ["openrn_skills_round6"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Prep + drape", body: "Provider performs hand hygiene, dons sterile attire, preps skin with chlorhexidine, allows to dry, drapes.", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 2, title: "Local anesthesia", body: "Lidocaine 1% to skin, subcutaneous, peritoneum.", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 3, title: "Z-track insertion", body: "Provider uses Z-track technique to reduce post-procedure leak — pull skin caudally, insert needle perpendicular, advance until ascitic fluid returns; release skin to seal tract on withdrawal.", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 4, title: "Diagnostic samples", body: "Aspirate 30–60 mL initially. Send for: cell count + differential (lavender), albumin / total protein / glucose / LDH (chemistry), GRAM stain + culture (inoculate blood-culture bottles AT THE BEDSIDE), cytology if indicated, amylase if pancreatic ascites suspected per primary source.", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 5, title: "Therapeutic drainage (if planned)", body: "Connect catheter to evacuation bottle; drain by gravity. Stop at planned volume or if patient becomes hypotensive. Most facilities cap at 4–6 L without albumin; >5 L removal requires albumin per primary source.", citationIDs: ["aasld_round6"]),
            ProcedureStep(number: 6, title: "Albumin replacement", body: "If >5 L removed, infuse albumin 25% — 6–8 g albumin per liter removed (often 50–100 g total) per primary source — reduces post-paracentesis circulatory dysfunction.", citationIDs: ["aasld_round6"]),
            ProcedureStep(number: 7, title: "Withdraw + dress", body: "Provider removes catheter; release Z-track; apply pressure dressing.", citationIDs: ["openrn_skills_round6"])
        ],
        postProcedure: [
            AttributedBullet("Vital signs immediately post-procedure, q15 min × 1 hr, then q30 min × 1 hr per primary source.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Reassess for hypotension, leakage, hematoma, peritonitis (fever, rebound).", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Strict bed rest 1–2 hr post-procedure; elevate HOB.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Send specimens promptly; document fluid color and volume.", citationIDs: ["openrn_skills_round6"])
        ],
        documentation: [
            AttributedBullet("Volume, color, samples sent, albumin given, vital signs, patient tolerance, complications.", citationIDs: ["openrn_skills_round6"])
        ],
        watchFor: [
            AttributedBullet("Post-paracentesis circulatory dysfunction — hypotension, AKI; albumin reduces this.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Persistent ascitic leak from puncture site — pressure dressing, ostomy bag if leaking; rarely requires suturing.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Bleeding (rare with INR <2.5; coag correction not routinely required); peritoneal hematoma.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Bowel perforation (rare); SBP introduced by procedure (rare with sterile technique).", citationIDs: ["openrn_skills_round6"])
        ],
        citations: [openrnSkR6, openstaxSkR6p, aasldConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Thoracentesis Assist

public enum ThoracentesisAssistSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "thoracentesis-assist",
        title: "Thoracentesis assist",
        subtitle: "Pleural fluid sampling / drainage · diagnostic + therapeutic",
        nclexTags: safetyR6,
        indications: AttributedProse(
            "Diagnostic evaluation of new pleural effusion (Light's criteria for transudate vs exudate); therapeutic drainage of symptomatic large effusion; empiric drainage of suspected empyema or hemothorax. Bedside or interventional radiology with ultrasound guidance per primary source.",
            citationIDs: ["openrn_skills_round6"]
        ),
        contraindications: AttributedProse(
            "Hemodynamic instability requiring resuscitation; coagulopathy with bleeding (correct first per provider); skin infection at planned site; mechanical ventilation with very high PEEP (relative); single lung physiology (relative).",
            citationIDs: ["openrn_skills_round6"]
        ),
        equipment: [
            AttributedBullet("Thoracentesis kit — small-bore catheter-over-needle, three-way stopcock, evacuation bag.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Sterile attire, chlorhexidine, lidocaine 1%, ultrasound machine, sterile probe cover.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Specimen containers — cell count (lavender), chemistry (red — pH, LDH, glucose, protein, ADA if TB suspected), microbiology, cytology.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Cardiac monitor, pulse ox, supplemental O2 available; suction setup.", citationIDs: ["openrn_skills_round6"])
        ],
        preProcedure: [
            AttributedBullet("Verify order, INR / platelets / aPTT, recent imaging.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Informed consent; mark side (RIGHT or LEFT) on chart.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Position — sitting upright leaning forward over a bedside table with arms supported; if unable, lateral decubitus with affected side up.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Baseline vitals; IV access; supplemental O2 ready.", citationIDs: ["openrn_skills_round6"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Site selection", body: "Bedside ultrasound to identify largest pleural-fluid pocket; mark site (typically posterior axillary line, one intercostal space below the cephalad margin of effusion, ABOVE the rib to avoid intercostal neurovascular bundle).", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 2, title: "Prep + local anesthesia", body: "Sterile prep + drape; lidocaine to skin, intercostal muscles, parietal pleura.", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 3, title: "Catheter insertion", body: "Provider inserts catheter over needle through anesthetized tract; advances over rib; aspirates fluid; threads catheter and removes needle.", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 4, title: "Diagnostic + therapeutic drainage", body: "Send first samples for cell count, chemistry (pH, LDH, glucose, protein), micro (Gram + culture), cytology if malignancy suspected. Drain therapeutically; cap at ~1.5 L per session OR until cough / chest discomfort develops to avoid re-expansion pulmonary edema per primary source.", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 5, title: "Withdraw + dress", body: "Patient hums or exhales as catheter is removed (reduces air entry). Apply occlusive dressing.", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 6, title: "Post-procedure CXR", body: "Routine post-procedure CXR debated; obtain if symptomatic, suspected pneumothorax, multiple attempts, or with ultrasound finding suggesting pneumothorax per primary source.", citationIDs: ["openrn_skills_round6"])
        ],
        postProcedure: [
            AttributedBullet("Vital signs and SpO2 q15 min × 1 hr; assess for dyspnea, chest pain, cough.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Reassess breath sounds for new pneumothorax.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Keep patient supine for ~30 min; reposition as tolerated.", citationIDs: ["openrn_skills_round6"])
        ],
        documentation: [
            AttributedBullet("Site, ultrasound use, fluid color and volume, samples sent, vital signs, patient tolerance, post-procedure CXR results.", citationIDs: ["openrn_skills_round6"])
        ],
        watchFor: [
            AttributedBullet("PNEUMOTHORAX — sudden chest pain, dyspnea, decreased breath sounds; emergent CXR or POCUS; chest tube if large or symptomatic.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("RE-EXPANSION PULMONARY EDEMA — cough, dyspnea, hypoxia after large-volume removal; supportive care.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Hemothorax (intercostal artery injury), splenic / liver injury (low approach), vasovagal episode.", citationIDs: ["openrn_skills_round6"])
        ],
        citations: [openrnSkR6, openstaxSkR6p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Blood Culture Collection

public enum BloodCultureCollectionSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "blood-culture-collection",
        title: "Blood culture collection",
        subtitle: "TWO sets · separate sites · BEFORE antibiotics · contamination prevention",
        nclexTags: infectionR6,
        indications: AttributedProse(
            "Suspected bloodstream infection — sepsis, fever of unknown origin, suspected endocarditis, suspected line infection. Cultures inform antibiotic choice and shorten duration. Collect BEFORE empirical antibiotics whenever possible per primary source.",
            citationIDs: ["openrn_skills_round6"]
        ),
        contraindications: AttributedProse(
            "None absolute. Avoid drawing through indwelling line UNLESS line infection is suspected (then paired peripheral + line cultures are needed for differential time-to-positivity per primary source).",
            citationIDs: ["openrn_skills_round6"]
        ),
        equipment: [
            AttributedBullet("Two sets — each set = one aerobic + one anaerobic bottle (4 bottles total, ideally drawn from two separate venipuncture sites per primary source).", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Chlorhexidine swabs, alcohol pads, sterile gloves (or non-sterile + no-touch technique), tourniquet, 22 G needles or butterflies, 10–20 mL syringe per bottle.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Specimen labels.", citationIDs: ["openrn_skills_round6"])
        ],
        preProcedure: [
            AttributedBullet("Verify order; obtain TWO sets when bacteremia is suspected — single set has insufficient sensitivity per primary source.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Plan blood-culture collection BEFORE first dose of antibiotic when feasible.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Identify two separate venipuncture sites.", citationIDs: ["openrn_skills_round6"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene + skin prep", body: "Hand hygiene; chlorhexidine to skin × 30 sec friction; allow to air-dry COMPLETELY (≥30 sec) — INADEQUATE drying is the most common cause of contamination.", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 2, title: "Disinfect bottle tops", body: "Wipe each bottle's rubber septum with alcohol; allow to dry (do NOT use chlorhexidine on bottle tops — can interfere with assay per primary source).", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 3, title: "Draw blood", body: "Apply tourniquet; do NOT re-palpate cleansed site after prep. If repalpating, re-prep skin. Insert needle, draw 8–10 mL into each bottle (volume is the single biggest determinant of sensitivity per primary source).", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 4, title: "Inoculate aerobic FIRST", body: "When using a butterfly into bottles directly, inoculate AEROBIC bottle FIRST to avoid pulling air from the line into the anaerobic bottle. Mix gently after inoculation.", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 5, title: "Repeat at second site", body: "Move to second venipuncture site (or contralateral arm) for the second set. Two sets from two sites distinguishes contamination from true bacteremia.", citationIDs: ["openrn_skills_round6"]),
            ProcedureStep(number: 6, title: "Label + transport", body: "Label at the bedside with patient info, time, site (peripheral / line); send to lab promptly.", citationIDs: ["openrn_skills_round6"])
        ],
        postProcedure: [
            AttributedBullet("Document time of cultures and time of FIRST antibiotic dose — sepsis bundles measure this gap.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Reassess vitals; trend lactate, WBC, lactate, organ dysfunction markers.", citationIDs: ["openrn_skills_round6"])
        ],
        documentation: [
            AttributedBullet("Date / time, sites used, antibiotic timing relative to draw, patient tolerance.", citationIDs: ["openrn_skills_round6"])
        ],
        watchFor: [
            AttributedBullet("CONTAMINATION — coag-negative staph, Bacillus, Corynebacterium in only ONE bottle of one set is most often contamination; one set positive in 4 bottles for the same organism is highly suggestive of contamination per primary source.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Underfilling bottles → false negatives; FILL adequately.", citationIDs: ["openrn_skills_round6"]),
            AttributedBullet("Drawing through ports / lines without paired peripheral set increases contamination risk and limits interpretability.", citationIDs: ["openrn_skills_round6"])
        ],
        citations: [openrnSkR6, openstaxSkR6p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - KDIGO AKI Staging

public enum KDIGOAKISample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "kdigo-aki-staging",
        title: "KDIGO AKI staging",
        subtitle: "Creatinine + urine output criteria · stage 1 → 3 · concept reference",
        eyebrow: "REFERENCE · NEPHROLOGY",
        nclexTags: renalRefR6,
        sections: [
            .prose(title: "Source", AttributedProse(
                "KDIGO (Kidney Disease: Improving Global Outcomes) defines and stages acute kidney injury using BOTH serum creatinine AND urine output. Use the WORST stage from either column. THIS IS A CONCEPT REFERENCE per primary source — apply within local clinical workflows.",
                citationIDs: ["kdigo_round6"]
            )),
            .keyValueTable(title: "Definition of AKI (any one)", [
                KeyValueRow(key: "Creatinine rise ≥0.3 mg/dL", value: "Within 48 hours"),
                KeyValueRow(key: "Creatinine increase ≥1.5× baseline", value: "Known or presumed within prior 7 days"),
                KeyValueRow(key: "Urine output", value: "<0.5 mL/kg/hr for ≥6 hours")
            ]),
            .keyValueTable(title: "Stage 1", [
                KeyValueRow(key: "Creatinine", value: "1.5–1.9× baseline OR ≥0.3 mg/dL increase"),
                KeyValueRow(key: "Urine output", value: "<0.5 mL/kg/hr for 6–12 hours"),
                KeyValueRow(key: "Action", value: "Identify and remove cause; correct hypovolemia; review nephrotoxins; pharmacy renal-dose review")
            ]),
            .keyValueTable(title: "Stage 2", [
                KeyValueRow(key: "Creatinine", value: "2.0–2.9× baseline"),
                KeyValueRow(key: "Urine output", value: "<0.5 mL/kg/hr for ≥12 hours"),
                KeyValueRow(key: "Action", value: "Nephrology consult consideration; trend electrolytes; assess acid-base; evaluate need for renal replacement therapy")
            ]),
            .keyValueTable(title: "Stage 3", [
                KeyValueRow(key: "Creatinine", value: "≥3.0× baseline OR ≥4.0 mg/dL OR initiation of RRT"),
                KeyValueRow(key: "Urine output", value: "<0.3 mL/kg/hr for ≥24 hours OR anuria for ≥12 hours"),
                KeyValueRow(key: "Action", value: "Nephrology consult; assess for emergent RRT (AEIOU — acidosis, electrolytes, ingestion, overload, uremia)")
            ]),
            .keyValueTable(title: "Common causes by category (KDIGO AKI workup)", [
                KeyValueRow(key: "Pre-renal", value: "Hypovolemia, hypotension, shock, hepatorenal, NSAIDs, ACEi/ARB"),
                KeyValueRow(key: "Intrinsic", value: "ATN (ischemic, nephrotoxic), AIN (drugs), glomerulonephritis, vasculitis, contrast-induced"),
                KeyValueRow(key: "Post-renal", value: "BPH, retention, stones, malignancy, blood clot")
            ]),
            .bullets(title: "Nursing actions across stages", [
                AttributedBullet("Hourly UOP measurement; daily weights; strict I&O.", citationIDs: ["openrn_ha_round6_proc"]),
                AttributedBullet("Review medications — renal-dose adjust antibiotics, pharmacy consult; HOLD nephrotoxins (NSAIDs, ACEi/ARB, ATB until cultures back, contrast).", citationIDs: ["openrn_ha_round6_proc"]),
                AttributedBullet("Trend creatinine / BUN; electrolytes (K!), bicarbonate, phosphorus, calcium.", citationIDs: ["openrn_ha_round6_proc"]),
                AttributedBullet("Assess for fluid overload — edema, JVD, crackles; manage with diuretics or ultrafiltration per provider.", citationIDs: ["openrn_ha_round6_proc"]),
                AttributedBullet("Indications for emergent RRT (AEIOU): refractory ACIDOSIS, ELECTROLYTE imbalance (hyperkalemia), INGESTION, fluid OVERLOAD, UREMIA (encephalopathy, pericarditis).", citationIDs: ["kdigo_round6"])
            ])
        ],
        citations: [kdigoConceptR6, openrnHar6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Wells Criteria for PE

public enum WellsCriteriaSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "wells-criteria-pe",
        title: "Wells criteria for pulmonary embolism",
        subtitle: "Pre-test probability · clinical decision rule · concept reference",
        eyebrow: "REFERENCE · CARDIOLOGY",
        nclexTags: perfusionR6,
        sections: [
            .prose(title: "Purpose", AttributedProse(
                "The Wells score stratifies pre-test probability for pulmonary embolism, guiding the choice of D-dimer vs imaging. Use IN COMBINATION with clinical judgment. THIS IS A CONCEPT REFERENCE per primary source — apply within local protocols.",
                citationIDs: ["card_concept_round6"]
            )),
            .keyValueTable(title: "Wells score for PE — points", [
                KeyValueRow(key: "Clinical signs of DVT", value: "+3"),
                KeyValueRow(key: "PE is the most likely diagnosis", value: "+3"),
                KeyValueRow(key: "Heart rate >100", value: "+1.5"),
                KeyValueRow(key: "Immobilization ≥3 days OR surgery in past 4 weeks", value: "+1.5"),
                KeyValueRow(key: "Previous DVT or PE", value: "+1.5"),
                KeyValueRow(key: "Hemoptysis", value: "+1"),
                KeyValueRow(key: "Active malignancy (treated within 6 mo or palliative)", value: "+1")
            ]),
            .keyValueTable(title: "Two-tier interpretation (commonly used)", [
                KeyValueRow(key: "Score ≤4 — \"PE Unlikely\"", value: "Obtain D-dimer; if negative, PE excluded; if positive → CT-PA per primary source"),
                KeyValueRow(key: "Score >4 — \"PE Likely\"", value: "Proceed directly to CT-PA (skip D-dimer)")
            ]),
            .keyValueTable(title: "Three-tier interpretation (older)", [
                KeyValueRow(key: "<2 — Low (≈3% PE)", value: "D-dimer; if negative, PE essentially excluded"),
                KeyValueRow(key: "2–6 — Moderate (≈21% PE)", value: "D-dimer; if positive → CT-PA"),
                KeyValueRow(key: ">6 — High (≈67% PE)", value: "Skip D-dimer; proceed to CT-PA")
            ]),
            .bullets(title: "PERC rule (rule-out for very low risk)", [
                AttributedBullet("If patient is at LOW pre-test probability AND PERC-negative (all 8 criteria absent), PE can be ruled out without D-dimer testing per primary source.", citationIDs: ["card_concept_round6"]),
                AttributedBullet("PERC criteria: age <50, HR <100, SpO2 ≥95% on room air, no hemoptysis, no estrogen use, no prior DVT/PE, no unilateral leg swelling, no surgery / trauma requiring hospitalization within 4 weeks.", citationIDs: ["card_concept_round6"])
            ]),
            .bullets(title: "Nursing actions when PE is suspected", [
                AttributedBullet("Sudden dyspnea, pleuritic chest pain, tachycardia, hypoxia, hemoptysis, syncope — RAPID workup.", citationIDs: ["openrn_ha_round6_proc"]),
                AttributedBullet("ABCs; supplemental oxygen; large-bore IV; cardiac monitor.", citationIDs: ["openrn_ha_round6_proc"]),
                AttributedBullet("ECG (S1Q3T3 classic but uncommon; sinus tachycardia most common), POCUS for RV strain.", citationIDs: ["openrn_ha_round6_proc"]),
                AttributedBullet("Coordinate CT-PA imaging promptly; if hemodynamically unstable → bedside POCUS, anticoagulation, consider thrombolytics or thrombectomy per provider.", citationIDs: ["card_concept_round6"]),
                AttributedBullet("D-dimer interpretation — high sensitivity / low specificity; useful to RULE OUT in low-probability patients only; not for confirming.", citationIDs: ["openrn_ha_round6_proc"])
            ])
        ],
        citations: [cardConceptR6, openrnHar6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CHA2DS2-VASc Score

public enum CHADS2VAScSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "chadsvasc-score",
        title: "CHA₂DS₂-VASc score",
        subtitle: "Stroke risk in atrial fibrillation · anticoagulation decision support",
        eyebrow: "REFERENCE · CARDIOLOGY",
        nclexTags: perfusionR6,
        sections: [
            .prose(title: "Purpose", AttributedProse(
                "CHA₂DS₂-VASc estimates annual stroke risk in patients with non-valvular atrial fibrillation, guiding the decision to anticoagulate. THIS IS A CONCEPT REFERENCE per primary source — apply within local guidelines.",
                citationIDs: ["card_concept_round6"]
            )),
            .keyValueTable(title: "CHA₂DS₂-VASc — points", [
                KeyValueRow(key: "C — Congestive heart failure / LV dysfunction", value: "+1"),
                KeyValueRow(key: "H — Hypertension", value: "+1"),
                KeyValueRow(key: "A₂ — Age ≥75", value: "+2"),
                KeyValueRow(key: "D — Diabetes mellitus", value: "+1"),
                KeyValueRow(key: "S₂ — Prior Stroke / TIA / thromboembolism", value: "+2"),
                KeyValueRow(key: "V — Vascular disease (prior MI, PAD, aortic plaque)", value: "+1"),
                KeyValueRow(key: "A — Age 65–74", value: "+1"),
                KeyValueRow(key: "Sc — Sex category female", value: "+1")
            ]),
            .keyValueTable(title: "Risk-based recommendations (general framework)", [
                KeyValueRow(key: "Score 0 (men) or 1 (women, sex point only)", value: "No anticoagulation"),
                KeyValueRow(key: "Score 1 (men) or 2 (women)", value: "Consider anticoagulation"),
                KeyValueRow(key: "Score ≥2 (men) or ≥3 (women)", value: "Anticoagulation recommended (DOAC preferred for non-valvular AFib unless contraindicated) per primary source")
            ]),
            .keyValueTable(title: "HAS-BLED score (bleeding risk)", [
                KeyValueRow(key: "H — HTN (uncontrolled)", value: "+1"),
                KeyValueRow(key: "A — Abnormal renal/liver function", value: "+1 each"),
                KeyValueRow(key: "S — Prior Stroke", value: "+1"),
                KeyValueRow(key: "B — Bleeding history / predisposition", value: "+1"),
                KeyValueRow(key: "L — Labile INR (if on warfarin)", value: "+1"),
                KeyValueRow(key: "E — Elderly (>65)", value: "+1"),
                KeyValueRow(key: "D — Drugs (antiplatelet, NSAIDs) or alcohol abuse", value: "+1 each"),
                KeyValueRow(key: "Score ≥3", value: "High bleeding risk — does NOT contraindicate anticoagulation but warrants monitoring + modification of reversible risks per primary source")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Calculate score on every new AFib patient; reassess at every encounter — points accumulate with age.", citationIDs: ["openrn_ha_round6_proc"]),
                AttributedBullet("Educate on stroke signs (BE-FAST); reinforce anticoagulation adherence.", citationIDs: ["openrn_ha_round6_proc"]),
                AttributedBullet("DOACs require renal-dose adjustment and have specific reversal agents (idarucizumab for dabigatran; andexanet alfa for factor Xa inhibitors).", citationIDs: ["openrn_ha_round6_proc"]),
                AttributedBullet("Warfarin requires regular INR; bridging only in selected high-risk patients per primary source.", citationIDs: ["openrn_ha_round6_proc"]),
                AttributedBullet("Address modifiable bleeding risks — uncontrolled BP, alcohol, concurrent NSAIDs / antiplatelets, falls.", citationIDs: ["openrn_ha_round6_proc"])
            ])
        ],
        citations: [cardConceptR6, openrnHar6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Child-Pugh / MELD

public enum ChildPughMELDSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "child-pugh-meld",
        title: "Child-Pugh and MELD scores",
        subtitle: "Liver-disease severity · prognosis + transplant prioritization",
        eyebrow: "REFERENCE · HEPATOLOGY",
        nclexTags: perfusionR6,
        sections: [
            .prose(title: "Purpose", AttributedProse(
                "Both scores estimate severity of chronic liver disease but differ in inputs and use cases. Child-Pugh predicts surgical / procedural risk and prognosis; MELD-Na is the U.S. liver-transplant allocation score. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["aasld_round6"]
            )),
            .keyValueTable(title: "Child-Pugh (CTP) score — points (1, 2, or 3 each)", [
                KeyValueRow(key: "Total bilirubin", value: "<2 (1 pt) · 2–3 (2 pt) · >3 (3 pt) — adjusted thresholds in cholestatic disease"),
                KeyValueRow(key: "Albumin", value: ">3.5 (1 pt) · 2.8–3.5 (2 pt) · <2.8 (3 pt)"),
                KeyValueRow(key: "INR", value: "<1.7 (1 pt) · 1.7–2.3 (2 pt) · >2.3 (3 pt)"),
                KeyValueRow(key: "Ascites", value: "None (1) · slight (2) · moderate / refractory (3)"),
                KeyValueRow(key: "Hepatic encephalopathy", value: "None (1) · grade 1–2 (2) · grade 3–4 (3)")
            ]),
            .keyValueTable(title: "Child-Pugh class + 1-yr survival", [
                KeyValueRow(key: "Class A (5–6 pts)", value: "≈100% one-year survival"),
                KeyValueRow(key: "Class B (7–9 pts)", value: "≈80% one-year survival; surgical risk elevated"),
                KeyValueRow(key: "Class C (10–15 pts)", value: "≈45% one-year survival; high surgical mortality")
            ]),
            .keyValueTable(title: "MELD-Na score components", [
                KeyValueRow(key: "Inputs", value: "Total bilirubin, INR, creatinine, sodium"),
                KeyValueRow(key: "Range", value: "6 (less ill) to 40 (gravely ill)"),
                KeyValueRow(key: "Use", value: "U.S. liver-transplant allocation; 3-month mortality estimate"),
                KeyValueRow(key: "Notes", value: "MELD-Na replaced original MELD in 2016; MELD 3.0 introduced 2023 incorporating sex and albumin per primary source")
            ]),
            .keyValueTable(title: "MELD score and mortality (general)", [
                KeyValueRow(key: "MELD <10", value: "<2% three-month mortality"),
                KeyValueRow(key: "MELD 10–19", value: "~6% three-month mortality"),
                KeyValueRow(key: "MELD 20–29", value: "~20% three-month mortality"),
                KeyValueRow(key: "MELD 30–39", value: "~50% three-month mortality"),
                KeyValueRow(key: "MELD ≥40", value: ">70% three-month mortality")
            ]),
            .bullets(title: "Nursing actions across cirrhosis severity", [
                AttributedBullet("Monitor for decompensation triggers — infection (always tap ascites for SBP), GI bleed (varices), medications (sedatives, opioids, NSAIDs, contrast), dehydration.", citationIDs: ["openrn_ha_round6_proc"]),
                AttributedBullet("Encephalopathy — lactulose to titrate to 3 soft stools per day; rifaximin adjunct per primary source.", citationIDs: ["aasld_round6"]),
                AttributedBullet("Ascites — sodium restriction, spironolactone + furosemide combination; large-volume paracentesis for refractory.", citationIDs: ["aasld_round6"]),
                AttributedBullet("Coagulopathy — INR is NOT a reliable bleeding-risk marker in cirrhosis; consider thromboelastography / fibrinogen for procedural risk per primary source.", citationIDs: ["aasld_round6"]),
                AttributedBullet("Refer for transplant evaluation — CTP B/C or MELD ≥15 per primary source.", citationIDs: ["aasld_round6"])
            ])
        ],
        citations: [aasldConceptR6, openrnHar6],
        lastSourceFidelityReview: "2026-05-04"
    )
}
