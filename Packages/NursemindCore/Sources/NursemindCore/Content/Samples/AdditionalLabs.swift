import Foundation

// Shared sources for the additional labs
private let openrnLabRanges = CitationSource(
    id: "openrn_lab_ranges",
    shortName: "Open RN Nursing Fundamentals — Reference Ranges Appendix",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK613071/",
    lastRetrieved: "2026-05-03"
)
private let openstaxLabValues = CitationSource(
    id: "openstax_clinical_lab_values",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values appendix",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-03"
)
private let openrnElectrolytes = CitationSource(
    id: "openrn_medsurg_electrolytes",
    shortName: "Open RN Health Alterations — Fluids & Electrolytes",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK613071/",
    lastRetrieved: "2026-05-03"
)

// MARK: - Sodium

public enum SodiumSample {
    public static let entry: LabEntry = LabEntry(
        id: "sodium",
        title: "Sodium (Na⁺)",
        subtitle: "Serum · electrolyte / osmolality",
        specimen: "Serum or plasma",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes),
        referenceRanges: [
            ReferenceRangeRow(value: "135–145 mEq/L",  label: "Normal",        citationIDs: ["openrn_lab_ranges", "openstax_clinical_lab_values"]),
            ReferenceRangeRow(value: "<135 mEq/L",     label: "Hyponatremia",  citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<120 mEq/L",     label: "Critical low",  citationIDs: ["openrn_medsurg_electrolytes"]),
            ReferenceRangeRow(value: ">145 mEq/L",     label: "Hypernatremia", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">160 mEq/L",     label: "Critical high", citationIDs: ["openrn_medsurg_electrolytes"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Hyponatremia (<135)",
                summary: "Symptoms relate to rate of change more than absolute value. Acute drop → cerebral edema, headache, nausea, confusion, seizures, coma.",
                nursingActions: [
                    "Assess neurologic status — focal deficits, seizure precautions",
                    "Identify cause — SIADH, hypovolemia, CHF, diuretics, polydipsia",
                    "Slow correction — no faster than 8–10 mEq/L per 24 hours to avoid osmotic demyelination",
                    "Restrict free water; provide hypertonic saline (3%) only for severe symptomatic hyponatremia"
                ],
                citationIDs: ["openrn_medsurg_electrolytes"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Hypernatremia (>145)",
                summary: "Usually reflects free water deficit, not sodium excess. Common in hospitalized patients with limited free water access.",
                nursingActions: [
                    "Assess hydration status, urine output, mental status",
                    "Identify cause — dehydration, diabetes insipidus, hypertonic feeds",
                    "Replace free water gradually — correction faster than 12 mEq/L per 24 hours can cause cerebral edema",
                    "Strict I&O; daily weights"
                ],
                citationIDs: ["openrn_medsurg_electrolytes"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Hyponatremia causes", causes: ["SIADH (post-op, malignancy, drugs)", "CHF and cirrhosis (dilutional)", "Adrenal insufficiency", "Thiazide diuretics", "GI/skin losses with hypotonic replacement", "Polydipsia"], citationIDs: ["openrn_medsurg_electrolytes"]),
            CauseGroup(title: "Hypernatremia causes", causes: ["Free water deficit (poor intake, fever, third-spacing)", "Diabetes insipidus (central or nephrogenic)", "Hypertonic fluids or feeds", "Burns", "Osmotic diuresis"], citationIDs: ["openrn_medsurg_electrolytes"])
        ],
        nursingActions: [
            AttributedBullet("Always check trend, not single values — rate of change drives symptom severity.", citationIDs: ["openrn_medsurg_electrolytes"]),
            AttributedBullet("Pair sodium with osmolality and volume status (orthostatics, edema, JVD) for diagnosis.", citationIDs: ["openrn_medsurg_electrolytes"])
        ],
        watchFor: [
            AttributedBullet("Osmotic demyelination syndrome (formerly central pontine myelinolysis) — irreversible neurologic injury from too-rapid hyponatremia correction.", citationIDs: ["openrn_medsurg_electrolytes"])
        ],
        citations: [openrnLabRanges, openstaxLabValues, openrnElectrolytes],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Magnesium

public enum MagnesiumSample {
    public static let entry: LabEntry = LabEntry(
        id: "magnesium",
        title: "Magnesium (Mg²⁺)",
        subtitle: "Serum · electrolyte",
        specimen: "Serum",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes),
        referenceRanges: [
            ReferenceRangeRow(value: "1.5–2.5 mg/dL", label: "Normal",      citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<1.5 mg/dL",   label: "Low",         citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<1.0 mg/dL",   label: "Critical low", citationIDs: ["openrn_medsurg_electrolytes"]),
            ReferenceRangeRow(value: ">2.5 mg/dL",   label: "High",        citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">5.0 mg/dL",   label: "Critical high", citationIDs: ["openrn_medsurg_electrolytes"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Hypomagnesemia (<1.5)",
                summary: "Often coexists with hypokalemia and hypocalcemia. Risk of refractory arrhythmias, Torsades de Pointes, tetany. Common in alcohol use, malnutrition, diuretics, PPIs.",
                nursingActions: [
                    "Continuous cardiac monitoring",
                    "Replace magnesium IV (1–2 g IV) BEFORE potassium replacement — K⁺ won't hold without Mg²⁺",
                    "Assess for tetany (Chvostek's, Trousseau's), tremor, hyperreflexia",
                    "Identify cause — proton pump inhibitors are a frequently missed contributor"
                ],
                citationIDs: ["openrn_medsurg_electrolytes"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Hypermagnesemia (>2.5)",
                summary: "Usually iatrogenic (Mg sulfate in eclampsia, antacids) or in severe renal failure. Causes weakness, hyporeflexia, hypotension, respiratory depression, cardiac arrest.",
                nursingActions: [
                    "Stop magnesium-containing infusions or medications",
                    "Continuous cardiac monitoring",
                    "Calcium gluconate IV reverses life-threatening symptoms",
                    "Dialysis for severe cases or renal failure"
                ],
                citationIDs: ["openrn_medsurg_electrolytes"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Causes of hypomagnesemia", causes: ["Loop and thiazide diuretics", "PPIs (chronic use)", "Alcohol use disorder, malnutrition", "GI losses, laxative abuse", "DKA", "Pancreatitis"], citationIDs: ["openrn_medsurg_electrolytes"]),
            CauseGroup(title: "Causes of hypermagnesemia", causes: ["Renal failure", "Mg-containing antacids/laxatives in CKD", "Magnesium sulfate therapy (eclampsia, asthma)", "Adrenal insufficiency"], citationIDs: ["openrn_medsurg_electrolytes"])
        ],
        nursingActions: [
            AttributedBullet("Always check magnesium when potassium replacement isn't holding — they go together.", citationIDs: ["openrn_medsurg_electrolytes"]),
            AttributedBullet("In Mg sulfate therapy (preeclampsia/eclampsia), monitor reflexes; absent patellar reflex = toxicity, hold infusion.", citationIDs: ["openrn_medsurg_electrolytes"])
        ],
        watchFor: nil,
        citations: [openrnLabRanges, openstaxLabValues, openrnElectrolytes],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Calcium

public enum CalciumSample {
    public static let entry: LabEntry = LabEntry(
        id: "calcium",
        title: "Calcium (total Ca²⁺)",
        subtitle: "Serum · electrolyte / cellular signaling",
        specimen: "Serum (correct for albumin)",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes),
        referenceRanges: [
            ReferenceRangeRow(value: "8.5–10.5 mg/dL", label: "Normal (total)",   citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<8.5",           label: "Hypocalcemia",     citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<7.0",           label: "Critical low",     citationIDs: ["openrn_medsurg_electrolytes"]),
            ReferenceRangeRow(value: ">10.5",          label: "Hypercalcemia",    citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">12.0",          label: "Critical high",    citationIDs: ["openrn_medsurg_electrolytes"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Hypocalcemia (<8.5)",
                summary: "Symptoms include perioral tingling, tetany (Chvostek's, Trousseau's), laryngospasm, seizures, prolonged QT.",
                nursingActions: [
                    "Correct for albumin: corrected Ca = measured Ca + 0.8 × (4 − albumin in g/dL)",
                    "Continuous cardiac monitoring — QT prolongation",
                    "Seizure precautions",
                    "Check ionized calcium for accuracy if albumin abnormal",
                    "IV calcium gluconate (peripheral OK) or calcium chloride (central line) for severe symptoms",
                    "Replace magnesium first if low — calcium won't correct without it"
                ],
                citationIDs: ["openrn_medsurg_electrolytes"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Hypercalcemia (>10.5)",
                summary: "Symptoms — bones (pain), stones (renal), groans (abdominal), psychiatric overtones. Severe (>14): coma, cardiac arrest.",
                nursingActions: [
                    "Continuous cardiac monitoring — short QT, dysrhythmias",
                    "IV fluids (NS) to enhance renal excretion",
                    "Loop diuretic only after hydration",
                    "Bisphosphonates (zoledronic acid) for malignancy-related hypercalcemia",
                    "Calcitonin for rapid (but transient) lowering"
                ],
                citationIDs: ["openrn_medsurg_electrolytes"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Hypocalcemia causes", causes: ["Hypoparathyroidism (post-thyroid surgery)", "Vitamin D deficiency", "CKD", "Hypomagnesemia", "Pancreatitis", "Massive transfusion (citrate)"], citationIDs: ["openrn_medsurg_electrolytes"]),
            CauseGroup(title: "Hypercalcemia causes", causes: ["Primary hyperparathyroidism", "Malignancy (most common in hospitalized patients)", "Vitamin D toxicity", "Thiazide diuretics", "Granulomatous disease (sarcoidosis, TB)"], citationIDs: ["openrn_medsurg_electrolytes"])
        ],
        nursingActions: [
            AttributedBullet("Always interpret with albumin — total calcium falsely low in hypoalbuminemia.", citationIDs: ["openrn_medsurg_electrolytes"]),
            AttributedBullet("Ionized calcium is the metabolically active form — order in critical illness.", citationIDs: ["openrn_medsurg_electrolytes"])
        ],
        watchFor: nil,
        citations: [openrnLabRanges, openstaxLabValues, openrnElectrolytes],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Creatinine

public enum CreatinineSample {
    public static let entry: LabEntry = LabEntry(
        id: "creatinine",
        title: "Creatinine",
        subtitle: "Serum · renal function",
        specimen: "Serum",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes),
        referenceRanges: [
            ReferenceRangeRow(value: "0.7–1.3 mg/dL (men)",   label: "Normal — adult male",   citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "0.6–1.1 mg/dL (women)", label: "Normal — adult female", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "Increase ≥0.3 in 48 hr OR ≥1.5× baseline", label: "AKI (KDIGO)", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">4.0 mg/dL",            label: "Severe — consider RRT", citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Acute kidney injury",
                summary: "AKI is defined by KDIGO as creatinine increase ≥0.3 mg/dL within 48 hours, OR ≥1.5× baseline within 7 days, OR urine output <0.5 mL/kg/hr for ≥6 hours.",
                nursingActions: [
                    "Check baseline — trend matters more than absolute value",
                    "Strict I&O; daily weights",
                    "Review medications for nephrotoxins (NSAIDs, ACE/ARB at start, contrast, aminoglycosides, vancomycin)",
                    "Identify pre-renal vs intrinsic vs post-renal cause",
                    "Adjust dose-by-creatinine medications (vancomycin, gabapentin, enoxaparin)",
                    "Anticipate dialysis if severe (AEIOU: Acidosis, Electrolytes, Ingestions, Overload, Uremia)"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Pre-renal AKI", causes: ["Hypovolemia, dehydration", "Heart failure", "Sepsis", "Hemorrhage"], citationIDs: ["openrn_lab_ranges"]),
            CauseGroup(title: "Intrinsic AKI", causes: ["ATN (most common in hospital — ischemia or nephrotoxin)", "Acute interstitial nephritis (drugs)", "Glomerulonephritis", "Rhabdomyolysis"], citationIDs: ["openrn_lab_ranges"]),
            CauseGroup(title: "Post-renal AKI", causes: ["Obstruction (BPH, stones, malignancy, blocked Foley)"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: [
            AttributedBullet("Always pair creatinine with BUN, urine output, and volume assessment.", citationIDs: ["openrn_lab_ranges"]),
            AttributedBullet("BUN:creatinine ratio >20:1 suggests pre-renal; <15:1 suggests intrinsic.", citationIDs: ["openrn_lab_ranges"])
        ],
        watchFor: nil,
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Hemoglobin

public enum HemoglobinSample {
    public static let entry: LabEntry = LabEntry(
        id: "hemoglobin",
        title: "Hemoglobin (Hgb)",
        subtitle: "Whole blood · oxygen-carrying capacity",
        specimen: "Whole blood (lavender-top, EDTA)",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        referenceRanges: [
            ReferenceRangeRow(value: "13.5–17.5 g/dL (men)",   label: "Normal — adult male",   citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "12.0–16.0 g/dL (women)", label: "Normal — adult female", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<7 g/dL",                label: "Transfusion threshold (most adults)", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<8 g/dL",                label: "Transfusion threshold (cardiac, oncology)", citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Anemia / acute blood loss",
                summary: "Symptoms depend on rate. Chronic: fatigue, pallor, dyspnea on exertion. Acute drop: tachycardia, hypotension, mental status change.",
                nursingActions: [
                    "Assess symptoms — tachycardia and orthostatic hypotension are the earliest signs of acute loss",
                    "Identify source — overt (GI, surgical, trauma) vs occult (slow GI, retroperitoneal)",
                    "Anticipate type and cross, transfusion at thresholds (typically 7 g/dL stable, 8 cardiac)",
                    "Consider iron studies, B12/folate, reticulocyte count for chronic anemia work-up"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Acute blood loss", causes: ["GI bleed", "Surgical or trauma hemorrhage", "Postpartum hemorrhage"], citationIDs: ["openrn_lab_ranges"]),
            CauseGroup(title: "Chronic anemia", causes: ["Iron deficiency", "Chronic kidney disease (low EPO)", "Chronic disease/inflammation", "B12/folate deficiency", "Hemolytic anemia"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: [
            AttributedBullet("Acute-phase Hgb may not reflect true loss — initial Hgb in trauma can be deceptively normal before fluid equilibration.", citationIDs: ["openrn_lab_ranges"])
        ],
        watchFor: [
            AttributedBullet("Transfusion reactions — fever, chills, dyspnea, back pain, hypotension. Stop infusion, keep line open with NS, notify provider.", citationIDs: ["openrn_lab_ranges"])
        ],
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Platelets

public enum PlateletsSample {
    public static let entry: LabEntry = LabEntry(
        id: "platelets",
        title: "Platelets",
        subtitle: "Whole blood · primary hemostasis",
        specimen: "Whole blood (EDTA)",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .clottingHemostasis),
        referenceRanges: [
            ReferenceRangeRow(value: "150,000–450,000/μL", label: "Normal",                      citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<150,000",            label: "Thrombocytopenia",            citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<50,000",             label: "Bleeding risk with surgery",  citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<20,000",             label: "Spontaneous bleeding risk",   citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<10,000",             label: "Critical — transfuse",        citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Thrombocytopenia",
                summary: "Bleeding risk increases as platelets drop. Spontaneous bleeding typically occurs <20,000.",
                nursingActions: [
                    "Bleeding precautions: soft toothbrush, electric razor, no IM injections, no rectal temps/suppositories",
                    "Hold antiplatelets and anticoagulants per provider",
                    "Monitor for petechiae, ecchymoses, gingival/nasal bleeding, hematuria, melena",
                    "Anticipate platelet transfusion at facility threshold (commonly <10,000 prophylactic)",
                    "If on heparin and platelets drop ≥50% from baseline → suspect HIT, send 4T score, switch to non-heparin anticoagulant"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Thrombocytopenia causes", causes: ["HIT (heparin-induced)", "ITP (autoimmune)", "Sepsis with DIC", "Cirrhosis (sequestration in spleen)", "Marrow suppression (chemo, sepsis)", "Drug-induced (vancomycin, linezolid, sulfa)"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: nil,
        watchFor: [
            AttributedBullet("HIT — paradoxical thrombosis despite low platelets; do NOT give platelet transfusion in HIT (worsens thrombosis).", citationIDs: ["openrn_lab_ranges"])
        ],
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - INR / PT

public enum INRSample {
    public static let entry: LabEntry = LabEntry(
        id: "inr",
        title: "INR / PT",
        subtitle: "Plasma · extrinsic pathway / warfarin monitoring",
        specimen: "Plasma (light blue-top, citrate)",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .clottingHemostasis),
        referenceRanges: [
            ReferenceRangeRow(value: "0.9–1.1 (no anticoagulation)", label: "Normal INR",                          citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "2.0–3.0",                       label: "Therapeutic — most warfarin uses",   citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "2.5–3.5",                       label: "Therapeutic — mechanical mitral valve", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">5.0",                          label: "Bleeding risk — hold warfarin",      citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Supratherapeutic INR (>therapeutic range)",
                summary: "Risk of major bleeding. Action depends on absolute INR and bleeding presence.",
                nursingActions: [
                    "Hold warfarin",
                    "INR 4.5–10 (no bleeding) — hold warfarin, no vitamin K",
                    "INR >10 (no bleeding) — vitamin K 2.5–5 mg PO",
                    "Any INR with major bleeding — vitamin K 5–10 mg IV + 4-factor PCC (e.g., Kcentra)",
                    "Reassess INR daily until therapeutic"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Causes of elevated INR", causes: ["Warfarin (intentional or supratherapeutic)", "Antibiotics (potentiate warfarin via vitamin K)", "Hepatic dysfunction", "Vitamin K deficiency", "DIC"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: [
            AttributedBullet("Bleeding precautions for any INR >therapeutic.", citationIDs: ["openrn_lab_ranges"]),
            AttributedBullet("Do not draw INR from a heparinized line — falsely elevated.", citationIDs: ["openrn_lab_ranges"])
        ],
        watchFor: nil,
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - WBC

public enum WBCSample {
    public static let entry: LabEntry = LabEntry(
        id: "wbc",
        title: "White blood cell count",
        subtitle: "Whole blood · inflammation / infection / hematology",
        specimen: "Whole blood (EDTA)",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        referenceRanges: [
            ReferenceRangeRow(value: "4,500–11,000/μL", label: "Normal",         citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<4,500",          label: "Leukopenia",     citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "ANC <500",        label: "Severe neutropenia — neutropenic precautions", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">11,000",         label: "Leukocytosis",   citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">30,000",         label: "Marked — consider hematologic malignancy or severe infection", citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Leukocytosis",
                summary: "Most often infection or inflammation. A 'left shift' (>10% bands) suggests acute bacterial infection.",
                nursingActions: [
                    "Assess for fever, source of infection",
                    "Obtain cultures before antibiotics if possible (blood, urine, sputum, wound)",
                    "Trend with differential — bands, lymphocytes, eosinophils tell different stories",
                    "Pair with lactate, vital signs, mental status for sepsis screen"
                ],
                citationIDs: ["openrn_lab_ranges"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Neutropenia (ANC <500)",
                summary: "High infection risk. May not mount classic infection signs (fever, redness). Source: chemo, sepsis, marrow disease.",
                nursingActions: [
                    "Neutropenic precautions per facility — private room, low-bacterial-content food, no fresh flowers, hand hygiene strict",
                    "Avoid rectal temperatures and rectal medications (mucosal injury → bacteremia)",
                    "Fever in neutropenia is an emergency — empiric broad-spectrum antibiotics within 1 hour",
                    "Daily skin and mucosal exam for early infection signs"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Leukocytosis", causes: ["Bacterial infection / sepsis", "Stress (steroids, surgery, catecholamines)", "Hematologic malignancy", "Smoking"], citationIDs: ["openrn_lab_ranges"]),
            CauseGroup(title: "Leukopenia / neutropenia", causes: ["Chemotherapy", "Sepsis (consumption)", "Drug-induced (clozapine, methimazole, sulfa)", "Aplastic anemia", "HIV, viral suppression"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: nil,
        watchFor: [
            AttributedBullet("Older adults and immunosuppressed patients may have a normal WBC despite serious infection — rely on clinical exam, not the number.", citationIDs: ["openrn_lab_ranges"])
        ],
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - ABG

public enum ABGSample {
    public static let entry: LabEntry = LabEntry(
        id: "abg",
        title: "Arterial blood gas (ABG)",
        subtitle: "Arterial blood · acid-base + oxygenation",
        specimen: "Arterial blood (heparinized syringe, on ice if delayed)",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .acidBase),
        referenceRanges: [
            ReferenceRangeRow(value: "pH 7.35–7.45",          label: "Normal pH",          citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "PaCO₂ 35–45 mmHg",      label: "Normal PaCO₂",       citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "HCO₃⁻ 22–26 mEq/L",     label: "Normal bicarbonate", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "PaO₂ 80–100 mmHg",      label: "Normal PaO₂",        citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "SaO₂ 95–100%",          label: "Normal SaO₂",        citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Respiratory acidosis (pH ↓, PaCO₂ ↑)",
                summary: "Hypoventilation — COPD, opioid overdose, neuromuscular weakness, airway obstruction.",
                nursingActions: [
                    "Improve ventilation — encourage cough/deep breathe, suction, position upright",
                    "Reverse opioids if implicated (naloxone)",
                    "Anticipate non-invasive ventilation (BiPAP) or intubation in worsening cases"
                ],
                citationIDs: ["openrn_lab_ranges"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Respiratory alkalosis (pH ↑, PaCO₂ ↓)",
                summary: "Hyperventilation — anxiety, pain, sepsis, PE, salicylates, mechanical over-ventilation.",
                nursingActions: [
                    "Identify and treat the trigger (pain, anxiety, hypoxia)",
                    "PE workup if unexplained tachypnea + hypoxia",
                    "Adjust ventilator settings if mechanical"
                ],
                citationIDs: ["openrn_lab_ranges"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Metabolic acidosis (pH ↓, HCO₃⁻ ↓)",
                summary: "Calculate anion gap. High AG: lactic acidosis (sepsis, shock, ischemia), DKA, uremia, toxic ingestions (MUDPILES). Normal AG: GI losses, RTA.",
                nursingActions: [
                    "Identify the cause via anion gap and clinical context",
                    "Treat the underlying cause — fluids for sepsis, insulin for DKA, dialysis for uremia",
                    "Bicarbonate is generally reserved for pH <7.1 with hemodynamic compromise"
                ],
                citationIDs: ["openrn_lab_ranges"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Metabolic alkalosis (pH ↑, HCO₃⁻ ↑)",
                summary: "Vomiting/NG suction (HCl loss), diuretics, hypokalemia, exogenous bicarbonate.",
                nursingActions: [
                    "Replace volume and potassium (most common cause is contraction alkalosis from diuretics)",
                    "Treat underlying cause — antiemetics, replace H⁺ if severe (rare)",
                    "Avoid further bicarbonate-containing fluids"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Memory aid — MUDPILES (high anion gap acidosis)", causes: ["Methanol", "Uremia", "DKA", "Propylene glycol (lorazepam infusion)", "Iron, INH", "Lactic acidosis", "Ethylene glycol", "Salicylates"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: [
            AttributedBullet("Apply ROME mnemonic for quick interpretation: Respiratory Opposite (pH and PaCO₂ move opposite), Metabolic Equal (pH and HCO₃ move together).", citationIDs: ["openrn_lab_ranges"]),
            AttributedBullet("Always interpret with clinical context — single ABG is a snapshot, trend matters.", citationIDs: ["openrn_lab_ranges"])
        ],
        watchFor: nil,
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
    )
}
