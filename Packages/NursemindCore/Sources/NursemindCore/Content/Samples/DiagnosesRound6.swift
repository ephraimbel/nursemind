import Foundation

// Curator-model diagnosis entries (round 6 expansion — oncologic + endocrine emergencies, hem, GU, GI, pulm).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax Nursing
// (CC BY 4.0 with AI restriction), CDC (public domain), NCCN / Endocrine Society / AASLD / GOLD concept citations.

private let openrnMSr6 = CitationSource(
    id: "openrn_ms_round6",
    shortName: "Open RN Health Alterations / Medical-Surgical Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=oncologic+endocrine+hematologic+pulmonary+hepatic",
    lastRetrieved: "2026-05-04"
)
private let openstaxNurR6 = CitationSource(
    id: "openstax_nur_round6",
    shortName: "OpenStax Clinical Nursing Skills + Maternal Newborn",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let cdcDxR6 = CitationSource(
    id: "cdc_dx_round6",
    shortName: "CDC clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let nccnConceptR6 = CitationSource(
    id: "nccn_round6",
    shortName: "NCCN / Endocrine Society / AASLD / GOLD guidelines (concept citation)",
    publisher: "NCCN, Endocrine Society, AASLD, GOLD, ASCO",
    license: .factCitationOnly,
    url: "https://www.nccn.org/guidelines/",
    lastRetrieved: "2026-05-04"
)

private let oncEmR6 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)
private let endoEmR6 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)
private let hemR6 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .clottingHemostasis)
private let renalR6 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .fluidElectrolytes)
private let elimR6 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .elimination)
private let giR6 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let pulmR6 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)

// MARK: - SVC Syndrome

public enum SVCSyndromeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "svc-syndrome",
        title: "Superior vena cava (SVC) syndrome",
        subtitle: "Oncologic emergency · venous obstruction · facial swelling + dyspnea",
        nclexTags: oncEmR6,
        definition: AttributedProse(
            "Obstruction of the superior vena cava — most often by external compression from a mediastinal mass (lung cancer, lymphoma, germ-cell tumor) or by intravascular thrombus (catheter-related). Typically presents with facial / upper-extremity edema, dyspnea, headache, and dilated chest collateral veins per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Reduced venous return from head, neck, and upper extremities → venous hypertension, edema, collateral formation. Severity ranges from mild facial swelling to airway compromise, cerebral edema, and hemodynamic collapse.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Facial swelling, especially periorbital; flushing.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Dyspnea (most common symptom), cough, hoarseness, stridor.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Upper-extremity edema; distended jugular and chest-wall veins.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Headache, visual changes, AMS — concerning for cerebral edema.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Pemberton sign — facial congestion when arms raised above head.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CT chest with IV contrast (test of choice) — identifies cause and extent.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Tissue diagnosis — bronchoscopy, biopsy, or thoracentesis prior to chemo/radiation when feasible (do not lose tissue diagnosis to emergent treatment unless airway-threatening per primary source).", citationIDs: ["nccn_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Airway — stridor, hoarse voice → ENT / airway team standby.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Neurologic — AMS, headache, visual changes (cerebral edema).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("HOB elevated (≥30°), supplemental O2, IV access in LOWER extremity (avoid upper-extremity IV — drains into compressed SVC).", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("HOB ≥30°; supplemental oxygen; LOWER-extremity IV access.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Diuresis can transiently reduce edema but does not address obstruction.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Definitive — radiation, chemotherapy, or endovascular stenting per oncology / IR; tumor type drives choice (chemo for lymphoma / germ cell; radiation or stent for NSCLC) per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Glucocorticoids (per provider) for steroid-responsive tumors (lymphoma, thymoma).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Anticoagulation if catheter-related thrombosis is the cause; consider catheter removal.", citationIDs: ["openrn_ms_round6"])
        ],
        watchFor: [
            AttributedBullet("AIRWAY EMERGENCY — stridor, hoarseness, severe dyspnea; activate rapid response.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Cerebral edema — AMS / vision changes; emergent stenting or intervention.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Bleeding from collateral varices — rare but possible.", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Malignant Spinal Cord Compression

public enum CordCompressionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "malignant-spinal-cord-compression",
        title: "Malignant spinal cord compression (MSCC)",
        subtitle: "Oncologic emergency · back pain → motor/sensory loss · time-critical",
        nclexTags: oncEmR6,
        definition: AttributedProse(
            "Compression of the spinal cord or cauda equina by epidural metastasis (most often from prostate, lung, breast, or hematologic malignancy). Time to treatment is the strongest predictor of preserved ambulation per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Tumor in the vertebral body extends epidurally → mechanical compression and vascular compromise of the cord → ischemia, edema, demyelination, infarction. Permanent neurologic deficit develops if untreated.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Back pain — present in >90%; typically progressive, worse at night or with recumbency, may be band-like (\"radicular\").", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Motor weakness — symmetric proximal lower extremity (cord) or saddle distribution (cauda equina).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Sensory level — band of altered sensation at the level of compression.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Bowel / bladder dysfunction — late sign; once present, recovery is unlikely.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Cauda equina — saddle anesthesia, urinary retention, fecal incontinence, lower-extremity weakness.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MRI of the WHOLE spine (multiple metastases possible) — gold standard.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("CT myelogram if MRI contraindicated.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Tumor markers, PSA in male patients with unknown primary.", citationIDs: ["openrn_ms_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Neurologic exam — strength, sensation by dermatome, reflexes, rectal tone, post-void residual.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Pain — back pain in cancer patient should prompt urgent imaging per primary source.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Mobility — ambulation status BEFORE treatment is the strongest predictor of post-treatment function.", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("Spine precautions / log-roll; HOB flat unless contraindicated; immobilize until cleared.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Dexamethasone bolus + scheduled doses per provider — reduces cord edema (typical 10 mg IV bolus then 4–10 mg q6h per primary source).", citationIDs: ["nccn_round6"]),
            AttributedBullet("Emergent radiation oncology + neurosurgery consult — surgical decompression preferred for solitary lesion + good performance status; radiation alone for diffuse / poor candidates per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Foley if retention; bowel regimen.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("DVT prophylaxis (mechanical until stable for pharmacologic).", citationIDs: ["openrn_ms_round6"])
        ],
        watchFor: [
            AttributedBullet("RAPID PROGRESSION — neurologic decline can occur over hours; reassess at every interaction.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Cauda equina — surgical emergency; urinary retention, saddle anesthesia, fecal incontinence.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Post-treatment thrombocytopenia (radiation) → bleeding risk.", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hypercalcemia of Malignancy

public enum HypercalcemiaMalignancySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hypercalcemia-of-malignancy",
        title: "Hypercalcemia of malignancy",
        subtitle: "Oncologic emergency · PTHrP / osteolytic / 1,25-(OH)₂D",
        nclexTags: oncEmR6,
        definition: AttributedProse(
            "Severely elevated serum calcium in a patient with cancer. Most often due to humoral hypercalcemia of malignancy (PTHrP) in solid tumors, osteolytic bone metastases (myeloma, breast), or 1,25-(OH)₂D production (lymphoma) per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Three mechanisms: (1) PTHrP secretion by squamous-cell, renal-cell, breast cancers — humoral; (2) osteolytic metastases releasing calcium directly; (3) lymphoma producing extrarenal 1,25-(OH)₂D. Suppressed PTH distinguishes from primary hyperparathyroidism.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("\"Stones, bones, abdominal groans, psychiatric overtones\" — kidney stones, bone pain, constipation, nausea, AMS.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Polyuria → dehydration — calcium-induced nephrogenic DI.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Severe — coma, dysrhythmia, short QT, asystole.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum calcium (corrected for albumin) or ionized calcium.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("PTH suppressed (distinguishes from hyperparathyroidism); PTHrP elevated in humoral type.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Severity: mild <12 mg/dL; moderate 12–14; severe >14; crisis >18 per primary source.", citationIDs: ["openrn_ms_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Hydration — most patients are profoundly volume-depleted.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Telemetry — short QT, dysrhythmia.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Mental status — confusion, coma at higher levels.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Renal function — AKI common.", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("Aggressive isotonic IV fluids (often 200–300 mL/hr per provider) — restores volume, promotes calciuresis per primary source.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Bisphosphonates (zoledronic acid 4 mg IV or pamidronate) — onset 24–48 hr; preferred for osteolytic and humoral.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Calcitonin SQ/IM — rapid onset (4–6 hr) but tachyphylaxis; bridge until bisphosphonate works.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Denosumab — for refractory or bisphosphonate-contraindicated patients.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Glucocorticoids — effective in lymphoma / 1,25-(OH)₂D-mediated.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Loop diuretic ONLY after volume restoration (not first-line per current guidance) per primary source.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Hemodialysis — refractory severe hypercalcemia or AKI.", citationIDs: ["openrn_ms_round6"])
        ],
        watchFor: [
            AttributedBullet("OVER-DIURESIS → worsened dehydration → worsened hypercalcemia.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Bisphosphonate-induced AKI (especially with rapid infusion or volume depletion); osteonecrosis of jaw with chronic use.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Cardiac dysrhythmias — short QT progressing to asystole at very high levels.", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Malignant Hyperthermia

public enum MalignantHyperthermiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "malignant-hyperthermia",
        title: "Malignant hyperthermia (MH)",
        subtitle: "Anesthesia emergency · volatile anesthetic + succinylcholine · dantrolene",
        nclexTags: oncEmR6,
        definition: AttributedProse(
            "Inherited hypermetabolic crisis triggered by volatile inhaled anesthetics (sevoflurane, desflurane, isoflurane, halothane) or succinylcholine in genetically susceptible individuals. Defective ryanodine receptor (RYR1) → uncontrolled calcium release → sustained muscle contraction, hypermetabolism, hyperthermia, rhabdomyolysis per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Ryanodine receptor mutation → trigger agent causes uncontrolled Ca²⁺ release from sarcoplasmic reticulum → sustained contraction, ATP depletion, heat production, lactic acidosis, hyperkalemia, rhabdomyolysis. Mortality without dantrolene treatment was historically >70%; with treatment, <5%.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Earliest signs: rising end-tidal CO2 despite increased ventilation, masseter rigidity (succinylcholine), tachycardia, tachypnea.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Hyperthermia — LATE sign; >38.8°C and rising rapidly per primary source.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Generalized muscle rigidity, mottled skin, dysrhythmia, hyperkalemia.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Cola-colored urine — myoglobinuria from rhabdomyolysis.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — combination of trigger exposure + classic findings; ETCO2 rise is most sensitive early sign.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Caffeine-halothane contracture test on biopsy — definitive but performed only in specialized labs.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Genetic testing for RYR1 / CACNA1S in family members.", citationIDs: ["openrn_ms_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous capnography is the single most important monitor — RISING ETCO2 is the earliest reliable sign.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Telemetry, core temperature, ABG, K, CK, urine output.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Family history of anesthesia complications, MH, exertional rhabdomyolysis.", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("STOP trigger agent immediately; switch to non-trigger anesthetic (TIVA — propofol).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Hyperventilate with 100% O2 at high flows (10+ L/min) to wash out volatile agent and clear CO2.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("DANTROLENE 2.5 mg/kg IV bolus, repeat every 5–10 min until symptoms resolve (often 10 mg/kg total or more); maintenance 1 mg/kg q4–6h × 24–48 hr per MHAUS / primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Active cooling — cold IV NS, ice packs, gastric/bladder lavage, target <38°C; STOP cooling at 38°C to avoid overshoot.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Treat hyperkalemia (calcium gluconate, insulin/D50, bicarbonate, kayexalate / patiromer); IV bicarbonate for acidosis.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("ICU admission for ≥24 hr; monitor for recrudescence, DIC, AKI.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Refer survivor + family to MHAUS / genetics; provide medical-alert bracelet.", citationIDs: ["nccn_round6"])
        ],
        watchFor: [
            AttributedBullet("Recrudescence — 25% within 24–48 hr; continue dantrolene maintenance.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("AKI from rhabdomyolysis (myoglobinuria) — fluid resuscitation; consider bicarbonate.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("DIC — bleeding, abnormal coags.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Family — RYR1 inheritance; refer to MHAUS for guidance.", citationIDs: ["nccn_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Thyroid Storm

public enum ThyroidStormSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "thyroid-storm",
        title: "Thyroid storm",
        subtitle: "Endocrine emergency · severe thyrotoxicosis · multi-organ failure",
        nclexTags: endoEmR6,
        definition: AttributedProse(
            "Life-threatening exacerbation of thyrotoxicosis with multi-organ involvement. Often precipitated by infection, surgery, trauma, iodine load, parturition, or non-adherence in known hyperthyroid patients per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Sudden surge of thyroid hormone or up-regulation of receptor sensitivity → hypermetabolism, hyperadrenergic state, hyperthermia, dysrhythmia, heart failure, hepatic dysfunction, AMS.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Hyperthermia (often >39.5°C / 103°F).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Tachycardia (often >140), atrial fibrillation, heart failure.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("AMS, agitation, delirium, seizure, coma.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("GI — N/V/D, jaundice, hepatic failure.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Diaphoresis, tremor, exophthalmos (Graves'), goiter.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Burch-Wartofsky score ≥45 supports thyroid storm per primary source.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — Burch-Wartofsky scoring; do not delay treatment for confirmation.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("TSH suppressed; Free T4 and T3 elevated.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Workup for precipitating cause — infection, MI, AKI, etc.", citationIDs: ["openrn_ms_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — temperature (continuous), HR, BP, telemetry; mental status.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Volume status — third spacing common; hourly UOP.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Look for precipitant — infection, ACS, trauma, recent iodine load (contrast).", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("ICU admission; continuous monitoring; IV access.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Beta-blocker — propranolol 60–80 mg PO q4h or esmolol drip per primary source — controls heart rate and reduces T4→T3 conversion.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Antithyroid drug — propylthiouracil (PTU) 500–1000 mg load then 250 mg q4h per primary source (preferred in storm — also blocks T4→T3 conversion); methimazole is alternative.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Iodine — Lugol or potassium iodide; ALWAYS give AT LEAST 1 HOUR AFTER PTU/methimazole (otherwise iodine fuels new thyroid hormone synthesis) per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Glucocorticoid — hydrocortisone 100 mg IV q8h — blocks T4→T3 conversion and treats relative adrenal insufficiency.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Cooling — acetaminophen, cooling blankets; AVOID aspirin (displaces T4 from binding protein → worsens storm) per primary source.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Fluid resuscitation; treat dysrhythmias; treat precipitant.", citationIDs: ["openrn_ms_round6"])
        ],
        watchFor: [
            AttributedBullet("Heart failure / pulmonary edema — careful with beta-blockers in decompensated HF; esmolol titratable.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Hepatic failure — PTU itself can be hepatotoxic; trend LFTs.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Infection precipitant — culture, empirical antibiotics if suspected.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("MORTALITY 10–30% even with treatment — high-acuity ICU patient.", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Myxedema Coma

public enum MyxedemaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "myxedema-coma",
        title: "Myxedema coma",
        subtitle: "Severe hypothyroidism · hypothermia · AMS · hyponatremia",
        nclexTags: endoEmR6,
        definition: AttributedProse(
            "Decompensated severe hypothyroidism with multi-system slowdown — hypothermia, hypoventilation, hyponatremia, hypoglycemia, bradycardia, and AMS or coma. Most often in elderly women with chronic untreated or undertreated hypothyroidism, precipitated by cold exposure, infection, surgery, or sedating medications per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Severely deficient thyroid hormone → reduced metabolic rate, impaired CV function, decreased respiratory drive, impaired free-water excretion → hyponatremia, decreased cortisol response.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Hypothermia (often <35.5°C / 95.9°F).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("AMS / coma; depressed reflexes (delayed relaxation phase classic — \"hung-up\" reflexes).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Bradycardia, hypotension, narrow pulse pressure.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Hypoventilation → hypercapnic respiratory failure.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Non-pitting facial / pretibial edema (myxedema), macroglossia, hoarse voice, alopecia of lateral eyebrows.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Hyponatremia, hypoglycemia.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — do not delay treatment for confirmatory tests.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("TSH markedly elevated (primary) or normal/low (central); Free T4 very low.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("ABG, CBC, BMP, glucose, cortisol baseline; cultures for precipitating infection.", citationIDs: ["openrn_ms_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Airway / breathing — hypoventilation; intubate if needed.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Core temperature — passive rewarming (blankets, warm room); avoid AGGRESSIVE rewarming → vasodilation / shock per primary source.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Identify precipitant (infection, MI, sedative, cold exposure).", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("ICU admission; supportive care.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("LEVOTHYROXINE IV — typical loading 200–400 mcg IV bolus, then 50–100 mcg IV daily per primary source. T3 (liothyronine) is sometimes added per endocrine consult.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Hydrocortisone 100 mg IV q8h — empirical until adrenal insufficiency excluded (concurrent adrenal insufficiency is common).", citationIDs: ["nccn_round6"]),
            AttributedBullet("Slow correction of hyponatremia (<8–10 mEq/24 hr) to avoid central pontine myelinolysis.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Treat infection if present; cautious with sedating drugs.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Glucose for hypoglycemia.", citationIDs: ["openrn_ms_round6"])
        ],
        watchFor: [
            AttributedBullet("Mortality 20–60% per primary source — high-risk diagnosis even with treatment.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Adrenal crisis precipitated by thyroid hormone replacement WITHOUT steroid coverage — always co-administer hydrocortisone empirically.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Cardiac arrhythmias on initiating thyroid replacement in elderly with CAD.", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cushing Syndrome

public enum CushingSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cushing-syndrome",
        title: "Cushing syndrome",
        subtitle: "Cortisol excess · iatrogenic > endogenous · classic phenotype",
        nclexTags: endoEmR6,
        definition: AttributedProse(
            "Constellation of signs and symptoms from prolonged exposure to elevated glucocorticoids. Most often iatrogenic (chronic steroid therapy); endogenous causes include pituitary adenoma (Cushing disease), ectopic ACTH (small-cell lung cancer), and adrenal adenoma per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Chronic glucocorticoid excess → catabolic state, central adiposity, immune suppression, insulin resistance, electrolyte effects, bone loss, mood changes, and HPA-axis suppression.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Central obesity, supraclavicular and dorsocervical (buffalo hump) fat pads, moon facies.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Skin — wide purple striae, easy bruising, thin skin, poor wound healing, acne.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Proximal muscle weakness; difficulty rising from chair.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Hypertension, glucose intolerance / DM, hypokalemia (especially ectopic ACTH).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Mood — depression, irritability, psychosis at high levels.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Osteoporosis, recurrent infection (immunosuppression), hirsutism, menstrual changes.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Screening — 24-hr urine free cortisol, late-night salivary cortisol, low-dose dexamethasone suppression test (≥2 of 3 abnormal).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Once confirmed — measure ACTH; high suggests pituitary or ectopic, low suggests adrenal.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Pituitary MRI (Cushing disease), CT chest/abdomen for ectopic / adrenal tumors per primary source.", citationIDs: ["nccn_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Medication reconciliation — steroid use is the most common cause; include topical, inhaled, intra-articular, OTC.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Glucose, BP, K, mental status, infection screen.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Skin integrity, fall risk, bone density.", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("Iatrogenic — slow taper of exogenous steroid per provider (do NOT stop abruptly — adrenal crisis); use lowest effective dose.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Endogenous — surgical resection of pituitary adenoma (transsphenoidal) or adrenal tumor per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Medical therapy — ketoconazole, metyrapone, mifepristone, osilodrostat, pasireotide for inoperable / persistent disease.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Manage complications — DM, HTN, osteoporosis, depression, infection prophylaxis.", citationIDs: ["openrn_ms_round6"])
        ],
        watchFor: [
            AttributedBullet("ADRENAL CRISIS post-surgery or with abrupt steroid taper — fatigue, hypotension, hypoglycemia, hyperkalemia; STRESS-DOSE STEROIDS for surgery, illness.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Fragility fractures — vertebral collapse common; bone-density imaging, bisphosphonate per provider.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Increased thrombosis risk; consider DVT prophylaxis perioperatively.", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ITP (Immune Thrombocytopenia)

public enum ITPSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "itp",
        title: "Immune thrombocytopenia (ITP)",
        subtitle: "Isolated thrombocytopenia · autoimmune · steroids / IVIG",
        nclexTags: hemR6,
        definition: AttributedProse(
            "Acquired autoimmune disorder characterized by isolated thrombocytopenia (typically <100 × 10⁹/L) without other cytopenias and without an identified secondary cause. Pediatric ITP is often post-viral and self-limited; adult ITP is typically chronic per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Anti-platelet antibodies → splenic destruction of antibody-coated platelets AND impaired megakaryocyte production. Result: low platelet count with otherwise normal CBC.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Petechiae, purpura, ecchymoses (mucocutaneous bleeding).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Epistaxis, gingival bleeding, menorrhagia.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Hematuria, GI bleeding (less common).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Intracranial hemorrhage rare but feared (<1% in adults; higher with platelets <10).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Otherwise WELL — no fever, splenomegaly, lymphadenopathy in primary ITP.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CBC with peripheral smear — isolated thrombocytopenia; no schistocytes (rules out TTP), no blasts (rules out leukemia).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Workup to exclude secondary causes — HIV, hepatitis C, H. pylori, SLE, drug-induced, pregnancy, lymphoproliferative disorder.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Bone marrow biopsy — not routinely required in classic presentation; consider in atypical / refractory.", citationIDs: ["openrn_ms_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Bleeding assessment — skin, mucous membranes, GU, GI, neuro.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Medication review — heparin (HIT), quinine, sulfa drugs, vancomycin, valproate.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Pregnancy testing in reproductive-age females.", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("Observation — platelets >30 × 10⁹/L without bleeding may not require treatment per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("First-line — corticosteroids (prednisone or dexamethasone).", citationIDs: ["nccn_round6"]),
            AttributedBullet("IVIG — rapid platelet rise; useful pre-procedure or for active bleeding.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Anti-D immunoglobulin (RhIG) — Rh-positive non-splenectomized patients per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Second-line — thrombopoietin receptor agonists (eltrombopag, romiplostim), rituximab, splenectomy, fostamatinib.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Platelet transfusion — for life-threatening bleeding ONLY; consumed rapidly otherwise.", citationIDs: ["openrn_ms_round6"])
        ],
        watchFor: [
            AttributedBullet("INTRACRANIAL HEMORRHAGE — sudden severe headache, AMS, focal deficit; emergent imaging.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("BLEEDING PRECAUTIONS — soft toothbrush, electric razor, no NSAIDs / aspirin / anticoagulants, fall precautions, no rectal temps.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Monitor for steroid side effects — hyperglycemia, infection, mood, GI.", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hemophilia A / B

public enum HemophiliaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hemophilia",
        title: "Hemophilia A and B",
        subtitle: "X-linked factor VIII (A) or IX (B) deficiency · joint and soft-tissue bleeding",
        nclexTags: hemR6,
        definition: AttributedProse(
            "X-linked recessive bleeding disorders caused by deficiency of clotting factor VIII (hemophilia A) or factor IX (hemophilia B). Severity depends on factor activity level: severe <1%, moderate 1–5%, mild 5–40% per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Deficient factor VIII or IX → inability to amplify the intrinsic coagulation pathway → impaired thrombin burst → defective fibrin formation → bleeding into joints, muscles, soft tissues.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Hemarthrosis — most characteristic; recurrent joint bleeds → chronic arthropathy.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Muscle hematomas; deep soft-tissue bleeding.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Mucosal bleeding; intracranial hemorrhage (especially neonatal birth trauma).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Prolonged bleeding after circumcision, dental extraction, surgery, minor trauma.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Prolonged aPTT, normal PT, normal platelet count.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Specific factor VIII or IX activity assay → confirms.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Genetic testing for confirmation and family planning.", citationIDs: ["openrn_ms_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Bleeding source and severity; ABCs.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Joint exam — pain, swelling, warmth, decreased range; HEMARTHROSIS is treated as a bleed.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Neuro exam for any HEAD INJURY — even minor trauma is treated as ICH until imaging clears.", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("FACTOR REPLACEMENT — recombinant or plasma-derived factor VIII (A) or IX (B), dosed by weight, target factor level, and bleed site per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Emicizumab (Hemlibra) — bispecific antibody for prophylaxis in hemophilia A (with or without inhibitors); SQ weekly to monthly.", citationIDs: ["nccn_round6"]),
            AttributedBullet("DDAVP (desmopressin) — releases stored factor VIII; useful for MILD hemophilia A only; tachyphylaxis after 2–3 days.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Antifibrinolytics (tranexamic acid, aminocaproic acid) — adjunct for mucosal bleeds; AVOID with concurrent prothrombin complex.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Joint injury — RICE (rest, ice, compression, elevation) plus factor replacement; physical therapy after acute phase.", citationIDs: ["openrn_ms_round6"])
        ],
        watchFor: [
            AttributedBullet("INTRACRANIAL HEMORRHAGE — leading cause of mortality; LOW threshold for head CT after head trauma.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Inhibitor development — antibodies neutralize replacement factor; require alternative therapy.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("AVOID IM injections, aspirin, NSAIDs, rectal temperatures; use SQ when possible.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("HCV / HIV risk in older patients exposed to plasma-derived products before viral inactivation; modern recombinant products are safer.", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Nephrotic Syndrome

public enum NephroticSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "nephrotic-syndrome",
        title: "Nephrotic syndrome",
        subtitle: "Proteinuria >3.5 g · hypoalbuminemia · edema · hyperlipidemia",
        nclexTags: renalR6,
        definition: AttributedProse(
            "Glomerular disease characterized by heavy proteinuria (>3.5 g/24 hr in adults), hypoalbuminemia (<3 g/dL), edema, and often hyperlipidemia. Common causes: minimal-change disease (peds), membranous nephropathy, FSGS, diabetic nephropathy, lupus nephritis per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Increased glomerular permeability → urinary loss of albumin (and other proteins including immunoglobulins, antithrombin III) → low serum oncotic pressure → fluid shifts into interstitium → edema. Liver upregulates lipid synthesis → hyperlipidemia.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Edema — periorbital (especially morning), pretibial, ascites, anasarca in severe.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Foamy urine (proteinuria).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Weight gain; decreased UOP if AKI.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Increased susceptibility to infection (urinary loss of immunoglobulins).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Thromboembolic events — DVT, PE, renal vein thrombosis (loss of antithrombin III).", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("24-hr urine protein >3.5 g OR spot urine protein/creatinine ratio >3.5.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Serum albumin <3 g/dL; cholesterol elevated.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Renal biopsy for definitive diagnosis (in adults); empirical steroid trial in children with classic presentation.", citationIDs: ["openrn_ms_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Daily weights, strict I&O, edema mapping.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("BP — often elevated; medications for renin-angiotensin blockade.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("DVT/PE assessment — high thrombotic risk.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Infection screen — fever, rigors; treat early.", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("ACEi or ARB — reduces proteinuria via efferent arteriole effect per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Diuretics for symptomatic edema (loops; spironolactone for ascites; albumin + loop for refractory edema per provider).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Sodium restriction; protein 0.8–1 g/kg/day (NOT high-protein diet — increases proteinuria) per primary source.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Statin for hyperlipidemia.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Disease-specific — steroids (minimal change), immunosuppressants (FSGS, membranous, lupus nephritis); rituximab in refractory.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Anticoagulation — consider in high-risk patients per primary source (typically albumin <2.5 g/dL with membranous nephropathy).", citationIDs: ["openrn_ms_round6"])
        ],
        watchFor: [
            AttributedBullet("VTE / renal vein thrombosis — sudden flank pain + AKI = renal vein thrombosis until proven otherwise.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Spontaneous bacterial peritonitis in patients with ascites.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Steroid side effects in pediatric patients on chronic prednisone.", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - BPH

public enum BPHSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bph",
        title: "Benign prostatic hyperplasia (BPH)",
        subtitle: "LUTS · obstruction · medical → surgical · NOT cancer",
        nclexTags: elimR6,
        definition: AttributedProse(
            "Non-malignant enlargement of the prostate gland, common in aging men, causing lower urinary tract symptoms (LUTS) due to bladder outlet obstruction. Distinct from prostate cancer per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Hyperplasia of stromal and glandular components in the transition zone of the prostate → mechanical obstruction of the urethra and increased smooth-muscle tone (alpha-1 adrenergic mediated) → impaired voiding.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Voiding (\"obstructive\") — hesitancy, weak stream, intermittency, post-void dribbling, sense of incomplete emptying, straining.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Storage (\"irritative\") — frequency, urgency, nocturia.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Acute urinary retention — sudden inability to void; emergency.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("UTI, bladder stones, hematuria, post-renal AKI in severe.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DRE — enlarged, smooth, rubbery prostate; nodularity or asymmetry → cancer concern.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("PSA — may be modestly elevated; combine with DRE; biopsy for asymmetric/elevated PSA.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("AUA Symptom Index (IPSS) for severity scoring per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("UA, BUN/creatinine, post-void residual.", citationIDs: ["openrn_ms_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Bladder distension, suprapubic discomfort.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Post-void residual — bladder scan.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Renal function — chronic obstruction can cause hydronephrosis / AKI.", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("Lifestyle — limit fluids before bed, avoid caffeine/alcohol, double voiding, scheduled voiding.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Alpha-1 blockers (tamsulosin, alfuzosin, silodosin) — relax prostatic smooth muscle; rapid effect.", citationIDs: ["nccn_round6"]),
            AttributedBullet("5-alpha-reductase inhibitors (finasteride, dutasteride) — shrink prostate; effect over months; useful with larger prostates.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Anticholinergics for storage symptoms (with caution — retention risk).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Avoid retention-precipitating drugs — antihistamines, decongestants, opioids, anticholinergics.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Surgical — TURP, laser prostatectomy, water vapor (Rezum), Urolift; for refractory or complications per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Acute retention — Foley catheter; alpha-blocker prior to voiding trial.", citationIDs: ["openrn_ms_round6"])
        ],
        watchFor: [
            AttributedBullet("ACUTE URINARY RETENTION — straight catheterization; consider hospitalization if comorbidities; trend renal function for hydronephrosis / AKI.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Orthostatic hypotension with alpha-blockers — counsel to take at bedtime initially.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Floppy iris syndrome with tamsulosin — counsel ophthalmologist before cataract surgery.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Post-TURP syndrome — hyponatremia from absorbed irrigation fluid (less common with bipolar / saline).", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Esophageal Varices

public enum EsophagealVaricesSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "esophageal-varices",
        title: "Esophageal varices / variceal hemorrhage",
        subtitle: "Portal hypertension · cirrhosis · life-threatening upper GI bleed",
        nclexTags: giR6,
        definition: AttributedProse(
            "Dilated submucosal veins in the distal esophagus that develop in patients with portal hypertension (typically cirrhosis). Variceal rupture causes massive upper GI hemorrhage with high mortality per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Portal hypertension (from cirrhosis, portal vein thrombosis, schistosomiasis) → portosystemic collaterals develop in distal esophagus and stomach → varices form. Once portal pressures > 12 mmHg, bleeding risk rises.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Hematemesis (often massive, bright red), melena, hematochezia in massive bleed.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Shock — tachycardia, hypotension, AMS.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Stigmata of chronic liver disease — jaundice, spider angiomas, palmar erythema, ascites, splenomegaly, caput medusae.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("May have history of known cirrhosis or prior variceal bleed.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — UGI bleed in patient with cirrhosis; EGD is diagnostic AND therapeutic.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Hgb / Hct (delayed equilibration in acute bleed), platelets, INR, BMP, LFTs, type & cross.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Lactate, ABG.", citationIDs: ["openrn_ms_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("ABCs — airway protection (intubation often needed for hematemesis with AMS).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("IV access × 2 large-bore (16 G or larger); central line if possible.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Vital signs, mental status; serial Hgb/Hct.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Aspiration risk — NG tube placement is debated in active variceal bleed.", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("Resuscitation — crystalloid initial, then PRBCs to target Hgb 7–8 g/dL (avoid over-transfusion → portal pressure rise → rebleed) per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Octreotide drip — splanchnic vasoconstrictor; bolus + 50 mcg/hr × 3–5 days per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Antibiotics — ceftriaxone 1 g IV daily (empirical; reduces SBP risk and mortality) per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Emergent EGD with band ligation (preferred) or sclerotherapy within 12 hours.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Balloon tamponade (Sengstaken-Blakemore / Minnesota tube) — rescue for refractory bleeding while preparing for definitive therapy; airway must be protected.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("TIPS — transjugular intrahepatic portosystemic shunt for refractory or recurrent bleeding.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Secondary prophylaxis — non-selective beta-blocker (propranolol, nadolol, carvedilol) AND repeat banding per primary source.", citationIDs: ["nccn_round6"])
        ],
        watchFor: [
            AttributedBullet("REBLEEDING — most common in first 5 days; monitor closely.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Hepatic encephalopathy — protein load from blood worsens encephalopathy; lactulose.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("SBP — fever, abdominal tenderness, AMS in cirrhotic with ascites; diagnostic paracentesis.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Aspiration pneumonia from hematemesis — airway protection is critical.", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - COPD Exacerbation

public enum COPDExacSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "copd-exacerbation",
        title: "COPD exacerbation (AECOPD)",
        subtitle: "Increased dyspnea / sputum / purulence · steroids + bronchodilators ± antibiotics",
        nclexTags: pulmR6,
        definition: AttributedProse(
            "Acute worsening of respiratory symptoms in a patient with COPD requiring change in management — typically increased dyspnea, sputum volume, and/or sputum purulence. Most often triggered by viral or bacterial infection or environmental exposure per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Increased airway inflammation and mucus → worsening airflow limitation, gas-exchange impairment, dynamic hyperinflation. Worsens cor pulmonale, raises right-heart afterload, and can precipitate respiratory failure.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Increased dyspnea over baseline.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Increased sputum volume; purulent sputum (yellow, green, brown).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Wheezing, prolonged expiration, accessory-muscle use.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Hypoxemia, hypercapnia (often chronic baseline).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("AMS, somnolence, pursed-lip breathing, tripod position.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — anthonisen criteria (dyspnea + sputum volume + purulence) for moderate-severe; consider antibiotics if 2+ per primary source.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("CXR to rule out pneumonia, pneumothorax, pulmonary edema.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("ABG — hypercapnia, acidosis (acute on chronic).", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("CBC, BMP, BNP if HF suspected, troponin if MI suspected.", citationIDs: ["openrn_ms_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Respiratory rate, SpO2, work of breathing, mental status — TRENDS matter most.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("ABG for hypercapnia, especially if AMS or accessory-muscle use.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Inhaler technique, adherence, recent triggers, vaccination status.", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("Controlled oxygen — target SpO2 88–92% to avoid CO2 retention from loss of hypoxic drive per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Inhaled SABA + SAMA (albuterol + ipratropium) via nebulizer — every 1–4 hours initially.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Systemic corticosteroid — prednisone 40 mg PO daily × 5 days OR methylprednisolone IV per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Antibiotics — for moderate-severe exacerbation with purulent sputum; common: amoxicillin-clavulanate, azithromycin, doxycycline; broader for recent hospitalization or risk factors per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("NIPPV (BiPAP) — for hypercapnic respiratory failure with pH 7.25–7.35; reduces intubation rate per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Intubation if NIPPV fails, severe acidosis, AMS not responsive.", citationIDs: ["openrn_ms_round6"])
        ],
        watchFor: [
            AttributedBullet("HYPERCAPNIC NARCOSIS from over-aggressive oxygen — somnolence, AMS in CO2-retainer; reduce FiO2 to maintain 88–92% SpO2.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Concomitant PE in COPD exacerbation without classic cause — has been documented in up to 25% per primary source; consider workup.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Pneumothorax — sudden chest pain + dyspnea worsening; CXR.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Discharge — confirm inhaler technique, smoking cessation, vaccinations (influenza, pneumococcal, RSV per current guidance), pulmonary rehab referral, action plan.", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Spontaneous Bacterial Peritonitis

public enum SBPSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "sbp",
        title: "Spontaneous bacterial peritonitis (SBP)",
        subtitle: "Cirrhosis + ascites · empirical ceftriaxone · paracentesis is diagnostic",
        nclexTags: giR6,
        definition: AttributedProse(
            "Bacterial infection of ascitic fluid in a patient with cirrhosis WITHOUT a surgically treatable intraabdominal source. Diagnosis: ascitic fluid PMN ≥250/mm³ per primary source.",
            citationIDs: ["openrn_ms_round6", "nccn_round6"]
        ),
        pathophysiology: AttributedProse(
            "Bacterial translocation across the gut wall into the ascitic fluid (impaired immunity in cirrhosis, reduced ascitic complement). Most common organisms: E. coli, Klebsiella, Streptococcus pneumoniae per primary source.",
            citationIDs: ["openrn_ms_round6"]
        ),
        presentation: [
            AttributedBullet("Fever (often low-grade), abdominal pain, abdominal tenderness.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Worsening ascites; failure to improve on standard therapy.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("AMS / hepatic encephalopathy may be the only sign.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("AKI / hepatorenal syndrome can develop rapidly.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("May be CLINICALLY SILENT — low threshold to tap.", citationIDs: ["openrn_ms_round6"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DIAGNOSTIC PARACENTESIS for any cirrhotic with ascites and ANY of: abdominal pain, fever, AMS, AKI, GI bleed, rapid worsening per primary source.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Ascitic PMN ≥250/mm³ — diagnostic.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Ascitic culture — bedside inoculation of blood-culture bottles improves yield.", citationIDs: ["openrn_ms_round6"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs, mental status, abdominal exam, UOP.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Trend creatinine, sodium, platelets, INR.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Coag status before paracentesis (typically does not need correction unless severe).", citationIDs: ["openrn_ms_round6"])
        ],
        commonInterventions: [
            AttributedBullet("Empirical antibiotics — CEFTRIAXONE 2 g IV daily is standard first-line; piperacillin-tazobactam or carbapenem for nosocomial / recent antibiotic exposure per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("ALBUMIN 1.5 g/kg day 1 + 1 g/kg day 3 — reduces hepatorenal syndrome and mortality per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Repeat paracentesis at 48 hr if not improving — check PMN drop ≥25%.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Avoid nephrotoxins (NSAIDs, contrast, aminoglycosides); careful diuresis.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Secondary prophylaxis — daily ciprofloxacin or trimethoprim-sulfamethoxazole long-term after first SBP per primary source.", citationIDs: ["nccn_round6"]),
            AttributedBullet("Primary prophylaxis — patients with active GI bleed + cirrhosis (ceftriaxone or fluoroquinolone) for 5–7 days per primary source.", citationIDs: ["nccn_round6"])
        ],
        watchFor: [
            AttributedBullet("HEPATORENAL SYNDROME — AKI in cirrhotic without other cause; high mortality; albumin and vasoconstrictors per provider.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Hepatic encephalopathy worsens — lactulose, treat infection.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("MORTALITY 20–40% per episode — even with appropriate therapy.", citationIDs: ["openrn_ms_round6"]),
            AttributedBullet("Liver-transplant evaluation should follow SBP — refer.", citationIDs: ["openrn_ms_round6"])
        ],
        citations: [openrnMSr6, nccnConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}
