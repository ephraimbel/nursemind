import Foundation

// Curator-model diagnosis entries (v1.5 expansion — endocrine, electrolyte, fluid).
// Sources: Open RN Med-Surg / Health Alterations (CC BY 4.0), OpenStax Pathophysiology
// & Medical Surgical Nursing (CC BY 4.0 display restriction), CDC (public domain).

private let openrnMedSurg3 = CitationSource(
    id: "openrn_medsurg3",
    shortName: "Open RN Health Alterations / Medical-Surgical Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=diagnoses+pathophysiology",
    lastRetrieved: "2026-05-04"
)
private let openstaxMedSurg = CitationSource(
    id: "openstax_medsurg",
    shortName: "OpenStax Medical-Surgical Nursing",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/medical-surgical-nursing",
    lastRetrieved: "2026-05-04"
)
private let cdcDx = CitationSource(
    id: "cdc_dx_ref",
    shortName: "CDC clinical guidance (concept citation)",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)

private let endocrineEmergencyTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .glucoseRegulation)
private let fluidElectrolyteTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .fluidElectrolytes)
private let acidBaseTagsDx = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .acidBase)
private let infectionTagsDx = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)

// MARK: - HHS

public enum HHSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hhs",
        title: "Hyperglycemic Hyperosmolar State (HHS)",
        subtitle: "Severe hyperglycemia · profound dehydration · type 2 DM",
        nclexTags: endocrineEmergencyTags,
        definition: AttributedProse(
            "Life-threatening complication of type 2 diabetes mellitus characterized by severe hyperglycemia (typically >600 mg/dL), profound dehydration, hyperosmolality, and altered mental status WITHOUT significant ketosis or acidosis (distinguishing it from DKA).",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "Relative insulin deficiency in type 2 DM allows enough insulin activity to suppress lipolysis and ketogenesis but not enough to control glucose. Severe hyperglycemia drives osmotic diuresis → profound volume depletion (often 8–12 L deficit) → progressive hyperosmolality and hemoconcentration. Mental status deteriorates with serum osmolality.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Polyuria, polydipsia, weight loss progressing over days–weeks.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Profound dehydration — dry mucous membranes, poor skin turgor, hypotension, tachycardia.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Altered mental status proportional to serum osmolality — confusion, lethargy, seizures, coma.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Glucose typically >600 mg/dL (often >1000).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Minimal/no acidosis (pH >7.30, HCO3 >18).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Minimal/no ketones.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Serum osmolality >320 mOsm/kg.", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Plasma glucose >600 mg/dL.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Serum osmolality >320 mOsm/kg.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Arterial pH >7.30 and HCO3 >18 mEq/L.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Minimal ketonemia and ketonuria.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Altered mental status common.", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("Mental status, vital signs every 15–60 min initially.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Strict I&O — track urine output as guide to resuscitation.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hourly glucose; q2–4h electrolytes (especially K, Na, Cl, glucose, BUN/Cr).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Look for precipitant — infection, MI, stroke, missed medications, new-onset diabetes.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Cardiac monitoring during initial resuscitation; volume overload risk in elderly with cardiac disease.", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("Aggressive IV fluid resuscitation — typical: 1–1.5 L NS in first hour, then titrate based on hemodynamics, urine output; cautious in cardiac/renal disease.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Continuous insulin drip (lower rates than DKA) — start AFTER initial fluid resuscitation; insulin alone without fluids can worsen hypotension by drawing fluid into cells.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Replace potassium per protocol — total body K depleted even when serum normal; K shifts intracellularly with insulin.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Treat precipitant — antibiotics for infection, etc.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("VTE prophylaxis — high risk due to dehydration, hyperosmolality, immobility.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Transition to subcutaneous insulin once glucose <250 mg/dL, anion gap closed (if any), patient eating; overlap drip and SC for 1–2 hours.", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("Fluid overload — especially elderly with cardiac/renal disease; pulmonary edema.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Cerebral edema — rare in HHS (more common in pediatric DKA); manifest as worsening mental status during treatment.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hypoglycemia and hypokalemia during insulin/fluid therapy — frequent monitoring.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Mortality in HHS is significantly higher than DKA (10–20%) — typically older, sicker patients.", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - SIADH

public enum SIADHSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "siadh",
        title: "SIADH",
        subtitle: "Syndrome of Inappropriate Antidiuretic Hormone Secretion",
        nclexTags: fluidElectrolyteTags,
        definition: AttributedProse(
            "Excessive ADH (vasopressin) secretion or action causes water retention, dilutional hyponatremia, and concentrated urine despite low serum osmolality.",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "Inappropriate ADH release (CNS disease, malignancy — especially small cell lung cancer, drugs, pulmonary disease) causes the kidney to retain free water. Plasma is dilute (low Na, low osmolality) while urine is concentrated (inappropriate). Volume status is euvolemic.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Hyponatremia symptoms — headache, nausea, lethargy progressing to confusion, seizures, coma.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("EUVOLEMIC — no edema, no orthostasis (unlike heart failure or cirrhosis).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Decreased urine output volume but concentrated urine.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Weight gain from water retention without obvious edema.", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum sodium <135 (often <130) mEq/L.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Serum osmolality <275 mOsm/kg.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Urine osmolality >100 mOsm/kg (inappropriately concentrated).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Urine sodium >40 mEq/L.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Euvolemia clinically.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Normal renal, adrenal, and thyroid function.", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("Neurologic exam — orientation, seizure precautions, level of consciousness.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Fluid balance — strict I&O, daily weights.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Serial sodium — too rapid correction (>8–12 mEq/L per 24 hr) risks osmotic demyelination syndrome.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Investigate cause — chest CT (small cell lung cancer), CNS imaging, medication review (SSRIs, carbamazepine, vincristine).", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("Fluid restriction — typically 800–1000 mL/day (most patients respond).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Treat underlying cause when possible.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Severe symptomatic hyponatremia (seizures, coma): hypertonic 3% saline cautiously per protocol — typically 100 mL bolus, may repeat × 2 if symptoms persist; aim to raise Na 4–6 mEq in first 6 hr but not >12 in 24 hr.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Vasopressin receptor antagonists (tolvaptan, conivaptan) for refractory cases.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Salt tablets for chronic mild SIADH.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Loop diuretic + salt replacement in select cases.", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("Osmotic demyelination syndrome (central pontine myelinolysis) — rapid Na correction in chronic hyponatremia causes locked-in syndrome; sodium correction must be slow.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Seizures from severe hyponatremia (Na <120).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Cerebral edema — signs of increased ICP from rapid free water shifts.", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - DI

public enum DiabetesInsipidusSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "diabetes-insipidus",
        title: "Diabetes Insipidus (DI)",
        subtitle: "Central or nephrogenic · ADH deficiency or resistance",
        nclexTags: fluidElectrolyteTags,
        definition: AttributedProse(
            "Disorder of free water excretion due to either deficient ADH secretion (central DI) or renal resistance to ADH (nephrogenic DI). Causes large volumes of dilute urine, hypernatremia, and dehydration.",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "Central DI: pituitary disease, head trauma, neurosurgery (especially transsphenoidal), tumor → ↓ ADH. Nephrogenic DI: lithium, hypercalcemia, hypokalemia, genetic → kidney unresponsive to ADH. Result is loss of large volumes of free water.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Polyuria — often >3 L/day, can be 5–20 L; dilute (urine SG <1.005, urine osm <300).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Polydipsia — intense craving for cold water.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hypernatremia, hyperosmolality if water intake fails to keep up.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Dehydration — mucous membranes dry, tachycardia, hypotension late.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Altered mental status with severe hypernatremia.", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Polyuria (>3 L/day) with dilute urine (SG <1.005, osm <300 mOsm/kg).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hypernatremia (Na >145) and hyperosmolality (>295 mOsm/kg).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Water deprivation test differentiates types.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Desmopressin challenge: central DI responds (urine concentrates), nephrogenic does not.", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("Strict I&O — output may exceed 1 L/hr in severe DI.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hourly vitals; q2–4h sodium and osmolality during acute treatment.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Daily weights.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Neurologic checks — risk for cerebral demyelination if rapid correction OR cerebral edema if untreated.", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("Replace fluid losses — IV D5W or hypotonic saline; oral water if able.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Central DI: desmopressin (DDAVP) intranasal, SC, IV, or PO.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Nephrogenic DI: discontinue offending drug (lithium); thiazide diuretic + low-sodium diet (paradoxically reduces urine output via volume contraction); amiloride for lithium-induced.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Correct sodium SLOWLY — no faster than 0.5 mEq/L/hr (12 mEq/L per 24 hours).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Treat underlying cause when possible.", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("Hypernatremic dehydration with altered mental status — neurologic emergency.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Cerebral edema with too-rapid correction of chronic hypernatremia.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Triphasic post-pituitary surgery: initial polyuric phase → SIADH phase (5–10 days) → permanent DI; track sodium closely.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Ensure water access — patient with intact thirst can usually compensate; risk is in obtunded or restrained patients.", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Adrenal Insufficiency / Addisonian Crisis

public enum AdrenalCrisisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "adrenal-crisis",
        title: "Adrenal Crisis (Addisonian Crisis)",
        subtitle: "Acute glucocorticoid insufficiency · life-threatening",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        definition: AttributedProse(
            "Acute, life-threatening manifestation of adrenal insufficiency characterized by hypotension, hypovolemia, hyponatremia, hyperkalemia, hypoglycemia, and shock. Occurs in patients with primary adrenal disease (Addison's), pituitary failure, or sudden steroid withdrawal in chronically dependent patients.",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "Insufficient cortisol (and in primary disease, aldosterone) cannot mount a stress response. Cortisol deficiency → vasodilation, decreased catecholamine response, hypoglycemia. Aldosterone deficiency (primary AI) → sodium loss, potassium retention, volume contraction.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Profound hypotension (often refractory to fluids and vasopressors without steroids).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hypovolemic shock signs — tachycardia, oliguria, mottled skin, AMS.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Severe weakness, anorexia, nausea/vomiting, abdominal pain.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hyperpigmentation — chronic primary AI (ACTH-driven melanocyte stimulation).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hypoglycemia, hyponatremia, hyperkalemia, possible eosinophilia.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Fever (precipitant infection).", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Random cortisol — typically inappropriately low for clinical state.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("ACTH stimulation test (cosyntropin) — primary AI fails to respond; do NOT delay treatment for testing.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Electrolyte pattern: hypoNa, hyperK, hypoglycemia, possible mild metabolic acidosis.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Clinical scenario in chronic steroid user with sudden withdrawal or stress is sufficient to treat empirically.", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs continuously; hypotension may be refractory until steroids given.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Glucose, electrolytes hourly initially.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Mental status, urine output.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Identify precipitant — infection, MI, surgery, steroid withdrawal, vomiting/diarrhea preventing oral steroid intake.", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("HYDROCORTISONE 100 mg IV bolus IMMEDIATELY (do not wait for confirmation).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Then hydrocortisone 50 mg IV every 6 hours OR 200 mg/24 hr continuous infusion × 24 hours, taper based on response.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Aggressive IV fluids — NS or D5NS to restore volume; total deficit can be 4–6 L.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Correct hypoglycemia with D50W per protocol.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Treat hyperkalemia per protocol if symptomatic / high level.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Treat precipitating cause (antibiotics for infection, etc.).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Patient education on stress-dose steroids, MedicAlert ID, never stopping abruptly.", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("Hemodynamic improvement after steroid administration is dramatic — within 1–2 hours.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Concurrent thyroid hormone replacement (some patients) — give STEROIDS FIRST then thyroid; thyroid alone can precipitate adrenal crisis.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Mineralocorticoid replacement (fludrocortisone) typically not needed acutely if hydrocortisone dose ≥50 mg/day (provides sufficient mineralocorticoid activity).", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hypernatremia

public enum HypernatremiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hypernatremia",
        title: "Hypernatremia",
        subtitle: "Serum sodium >145 mEq/L · free water deficit",
        nclexTags: fluidElectrolyteTags,
        definition: AttributedProse(
            "Elevated serum sodium concentration (>145 mEq/L) indicating a free water deficit relative to sodium. Severe (>160) is associated with significant morbidity and mortality.",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "Loss of free water (most common — diabetes insipidus, GI losses with inadequate replacement, fever, burns) or excess sodium intake (rare — hypertonic saline, salt poisoning). Hyperosmolar state shrinks brain cells; chronic compensation occurs over days, so rapid correction can cause cerebral edema.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Thirst (intact in conscious, alert patients) — most reliable early symptom.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Mucous membranes dry, decreased skin turgor, tachycardia.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Neurologic symptoms — irritability, restlessness, weakness, confusion, lethargy, seizures, coma at severe levels.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("In severe hypernatremia: focal neurologic deficits, intracerebral hemorrhage from brain shrinkage tearing bridging veins.", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum sodium >145 mEq/L; severe >160.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Volume status assessment — hypovolemic (most common), euvolemic, hypervolemic (rare).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Urine osmolality — concentrated (intact ADH response, indicating extra-renal water loss) vs dilute (DI).", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("Mental status, level of consciousness, focal deficits.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Volume status — orthostatic vitals, mucous membranes, urine output.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Serial sodium — every 4–6 hours; aim NOT to exceed 0.5 mEq/L/hr or 12 mEq/L per 24 hours of correction.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Identify cause — DI, GI losses, inadequate intake (elderly, comatose, restrained patients).", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("Hypovolemic hypernatremia: NS first to restore volume, then D5W or 1/2 NS for free water deficit.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Calculate free water deficit and replace SLOWLY over 48–72 hours.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Encourage oral water if patient able to drink.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Treat cause — DDAVP for central DI, thiazide for nephrogenic DI, replace ongoing GI losses.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Monitor for over-correction — stop or slow infusion if Na drops faster than 0.5 mEq/L/hr.", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("Cerebral edema from rapid correction — worsening mental status during treatment requires immediate evaluation.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Seizures from severe hypernatremia — seizure precautions.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Volume overload from over-resuscitation in elderly with cardiac/renal disease.", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hypokalemia

public enum HypokalemiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hypokalemia",
        title: "Hypokalemia",
        subtitle: "Serum K <3.5 mEq/L · arrhythmia risk",
        nclexTags: fluidElectrolyteTags,
        definition: AttributedProse(
            "Serum potassium below 3.5 mEq/L. Mild 3.0–3.4, moderate 2.5–2.9, severe <2.5. Cardiac arrhythmias, muscle weakness, and rhabdomyolysis are major risks.",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "GI losses (vomiting, diarrhea, NG suction, ileostomy), renal losses (diuretics — loop and thiazide, hyperaldosteronism, magnesium depletion, RTA), intracellular shift (insulin, alkalosis, β-agonists), inadequate intake. Hypomagnesemia commonly accompanies and prevents K replenishment.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Muscle weakness, cramps, fatigue.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hyporeflexia.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Constipation, ileus.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Cardiac — palpitations, premature beats, arrhythmias; ECG: ST depression, T-wave flattening, prominent U waves, QT prolongation.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Severe (<2.5): paralysis, rhabdomyolysis, respiratory failure, life-threatening arrhythmias.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Potentiates digoxin toxicity — any new arrhythmia in patient on digoxin requires K check.", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum K <3.5 mEq/L.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Concurrent magnesium — replace if low (cannot fix K with low Mg).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("ECG changes correlate roughly with severity.", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("Cardiac monitoring for severe hypokalemia or any patient on digoxin.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Muscle strength, reflexes.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Concurrent labs — Mg, glucose, ABG (alkalosis), digoxin level if on therapy.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Identify cause — diuretics, GI losses, refeeding, insulin, hypomagnesemia.", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("Mild–moderate (asymptomatic, K 2.5–3.4): oral KCl 40–80 mEq/day; recheck in 24 hr.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Severe or symptomatic: IV KCl per protocol — typically 10–20 mEq/hr through peripheral IV (max 10 mEq/hr peripheral; central line for higher rates), continuous cardiac monitoring.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("REPLACE MAGNESIUM concurrently — hypomagnesemia causes renal K wasting; cannot correct K without Mg.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Discontinue or reduce K-wasting drugs if able.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Recheck K 1–2 hours after IV repletion.", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("Lethal arrhythmias — ventricular tachycardia, torsades, ventricular fibrillation; especially with digoxin.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Phlebitis from peripheral IV K — never push IV K; max 10 mEq/hr peripheral; concentration and rate per protocol.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Refeeding syndrome — anticipate K, Mg, phos drops in malnourished patient resumed on nutrition.", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hypocalcemia

public enum HypocalcemiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hypocalcemia",
        title: "Hypocalcemia",
        subtitle: "Total Ca <8.5 mg/dL · ionized Ca <4.5 mg/dL",
        nclexTags: fluidElectrolyteTags,
        definition: AttributedProse(
            "Decreased serum calcium concentration. Total calcium <8.5 mg/dL or ionized calcium <4.5 mg/dL. Severity assessed by symptoms more than absolute level.",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "Hypoparathyroidism (most often post-thyroidectomy), vitamin D deficiency, chronic kidney disease, acute pancreatitis (saponification), massive transfusion (citrate binding), hypomagnesemia (PTH dysfunction), tumor lysis, sepsis. Acute alkalosis lowers ionized calcium without changing total.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Perioral numbness, paresthesias of fingers and toes.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Muscle cramps, tetany.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Chvostek sign — facial muscle twitch when CN VII tapped.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Trousseau sign — carpal spasm with BP cuff inflation.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Laryngospasm (stridor) — airway emergency.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Seizures.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Cardiac — QT prolongation, torsades de pointes; refractory hypotension.", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Total calcium <8.5 mg/dL OR ionized <4.5 mg/dL.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Correct total calcium for albumin (corrected Ca = measured + 0.8 × [4 − albumin]).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Ionized calcium is more accurate, especially in critically ill or alkalemic patients.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Concurrent magnesium — must replace if low.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("PTH and vitamin D for chronic workup.", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("Airway — assess for laryngospasm/stridor; have airway equipment available.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Cardiac monitoring for severe hypocalcemia, post-thyroidectomy, massive transfusion patients.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Neurologic — Chvostek, Trousseau, paresthesias, seizures.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Concurrent labs — Mg, phosphorus, albumin, PTH.", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("Symptomatic or severe: IV calcium gluconate (1–2 g over 10–20 min) or calcium chloride (central line — phlebitic peripherally).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Asymptomatic mild: oral calcium carbonate or citrate with vitamin D.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("REPLACE MAGNESIUM concurrently — calcium will not correct with low Mg.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Treat underlying cause — vitamin D supplementation, calcitriol for renal failure, parathyroid hormone for hypoparathyroidism.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Massive transfusion: 1 g calcium gluconate per 4 units PRBCs (citrate binds Ca).", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("Tetany progressing to laryngospasm — airway emergency.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Torsades from QT prolongation.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Post-thyroidectomy: routine calcium check, signs of acute hypocalcemia within 24 hours.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("IV calcium extravasation — severe tissue necrosis; central line preferred for chloride.", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ARDS

public enum ARDSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ards",
        title: "Acute Respiratory Distress Syndrome (ARDS)",
        subtitle: "Acute hypoxemic respiratory failure · bilateral infiltrates",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        definition: AttributedProse(
            "Acute, diffuse, inflammatory lung injury causing increased pulmonary capillary permeability, non-cardiogenic pulmonary edema, and refractory hypoxemia. Berlin criteria: acute onset (within 1 week), bilateral opacities on imaging, not fully explained by cardiac failure, PaO2/FiO2 ≤300 with PEEP ≥5.",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "Direct (pneumonia, aspiration, inhalation injury, drowning) or indirect (sepsis, pancreatitis, transfusion, trauma) lung injury triggers diffuse alveolar damage. Increased capillary permeability → protein-rich fluid floods alveoli → impaired gas exchange. Surfactant dysfunction → atelectasis. Resolution may include fibrosis with permanent impairment.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Acute, severe dyspnea and tachypnea.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Refractory hypoxemia — SpO2 fails to improve despite high FiO2.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Bilateral diffuse infiltrates on chest imaging.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("No clinical evidence of cardiogenic pulmonary edema (no JVD, no S3, normal echo).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Crackles on auscultation; intercostal retractions; accessory muscle use.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Identifiable insult within 1 week — sepsis is the most common precipitant.", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Berlin criteria: acute onset (within 1 week), bilateral opacities, no full cardiac explanation.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Severity by P/F ratio (on PEEP ≥5): mild 200–300, moderate 100–200, severe ≤100.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Echo to rule out cardiogenic pulmonary edema.", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous respiratory monitoring — RR, work of breathing, SpO2, ABG, capnography.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hemodynamics — preload, afterload, cardiac output (often pulmonary artery catheter or echo guided).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Identify and treat underlying cause — cultures, source control.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Daily sedation interruption when feasible; early mobility.", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("Lung-protective ventilation: low tidal volume (4–8 mL/kg ideal body weight), plateau pressure ≤30 cmH2O, PEEP optimization, permissive hypercapnia.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Conservative fluid strategy after initial resuscitation — diuresis as tolerated improves oxygenation.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("PRONE positioning for severe ARDS (P/F <150) for ≥16 hours/day — improves mortality.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Neuromuscular blockade for severe ARDS with vent dyssynchrony (cisatracurium 48 hours).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Treat cause — antibiotics for sepsis, source control, etc.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("VV-ECMO for refractory hypoxemia at experienced centers.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Aggressive prevention of complications: VAP bundle, VTE prophylaxis, GI prophylaxis, pressure injury prevention, sedation goal RASS −2 to 0 when possible.", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("Barotrauma — pneumothorax, pneumomediastinum from high pressures.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Multi-organ failure — sepsis-related ARDS often has concurrent AKI, shock liver, DIC.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("ICU-acquired weakness with prolonged sedation, paralytics, immobility.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Long-term: ~25–40% mortality; survivors have functional and cognitive impairment for months–years.", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pneumothorax

public enum PneumothoraxSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pneumothorax",
        title: "Pneumothorax",
        subtitle: "Air in the pleural space · spontaneous · traumatic · tension",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        definition: AttributedProse(
            "Accumulation of air in the pleural space causing partial or complete lung collapse. Spontaneous (primary or secondary), traumatic (penetrating or blunt injury, iatrogenic from line placement, biopsy, or barotrauma), or tension (one-way valve trapping air → mediastinal shift, hemodynamic compromise).",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "Air enters pleural space → loss of negative pressure → lung collapses partially or fully. Tension pneumothorax: air enters during inspiration but cannot escape, intra-pleural pressure rises with each breath, compresses heart and great vessels → obstructive shock and death within minutes if untreated.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Sudden, sharp pleuritic chest pain.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Acute dyspnea, tachypnea.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Decreased or absent breath sounds on the affected side.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hyperresonance on percussion of affected side.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Decreased chest expansion on affected side.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hypoxemia, tachycardia.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("TENSION: hypotension, JVD, tracheal DEVIATION away from affected side, severe distress, possible arrest.", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Chest X-ray: visceral pleural line with absence of lung markings beyond it.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Bedside ultrasound: absence of lung sliding (high sensitivity).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("CT chest for occult/small/multiple pneumothoraces.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("TENSION pneumothorax is a CLINICAL diagnosis — do not delay treatment for imaging.", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous SpO2, vital signs.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Breath sounds bilaterally — frequent reassessment.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Chest tube management — drainage character, water seal, suction, no kinks.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Subcutaneous emphysema — palpate for crepitus around tube site, neck, chest.", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("TENSION pneumothorax: IMMEDIATE needle decompression — large-bore (14–16 G) needle in 2nd intercostal space midclavicular line OR 4th–5th intercostal space anterior axillary line, then chest tube.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Small spontaneous (<2 cm, asymptomatic): observation with supplemental O2; reabsorbs over days.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Larger or symptomatic: chest tube to water seal ± suction.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Recurrent or persistent air leak: pleurodesis, surgical bleb resection.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Treat underlying cause — TB, COPD, malignancy, trauma.", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("TENSION pneumothorax — DO NOT WAIT for imaging; needle decompress now.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Chest tube dislodgment — apply occlusive dressing taped on three sides (allows air out, prevents tension); call provider STAT.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Continuous bubbling in water seal chamber → air leak; assess all connections, tube site for leak.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Re-expansion pulmonary edema — rare; rapid lung re-inflation can cause unilateral edema.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Recurrence — primary spontaneous pneumothorax has high recurrence rate (~30%).", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Transfusion Reaction

public enum TransfusionReactionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "transfusion-reaction",
        title: "Transfusion Reactions",
        subtitle: "Acute hemolytic · febrile non-hemolytic · allergic · TRALI · TACO",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety),
        definition: AttributedProse(
            "Adverse reaction to blood product transfusion. Categories: acute hemolytic (ABO incompatibility — life-threatening), febrile non-hemolytic (most common), allergic/anaphylactic, transfusion-related acute lung injury (TRALI), transfusion-associated circulatory overload (TACO), bacterial contamination, delayed hemolytic.",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "Acute hemolytic: recipient antibodies attack donor RBCs (most often ABO mismatch from clerical error) → intravascular hemolysis, DIC, AKI. TRALI: donor antibodies activate recipient neutrophils in pulmonary vasculature. TACO: rapid transfusion overwhelms cardiovascular capacity. Allergic: anti-IgA antibodies.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Acute HEMOLYTIC: fever, chills, low back pain, hypotension, hemoglobinuria (red urine), bleeding (DIC). Onset within minutes.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Febrile non-hemolytic: fever, chills, mild dyspnea, NO hypotension or hemolysis signs. Most common reaction.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Allergic (mild): urticaria, pruritus.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Anaphylactic: bronchospasm, angioedema, hypotension, shock.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("TRALI: dyspnea, hypoxia, bilateral pulmonary infiltrates within 6 hours of transfusion, NO LV failure signs.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("TACO: dyspnea, hypoxia, JVD, S3 gallop, bilateral crackles, hypertension — fluid overload picture.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Bacterial contamination: high fever, hypotension, shock — most common with platelets (room temp storage).", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis based on timing relative to transfusion and pattern of signs.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Lab confirmation: direct Coombs (positive in hemolytic), haptoglobin (low), LDH (high), bilirubin (high), free hemoglobin in urine.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Repeat type and crossmatch from patient and unit; return unit and tubing to blood bank.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("CXR for TRALI/TACO; BNP elevated in TACO, normal in TRALI.", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("PRE-transfusion: two-nurse verification of patient identity, blood product, ABO/Rh, expiration, integrity. CRITICAL safety check.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Vitals before, 15 minutes into transfusion, q30 min during, and after — most reactions occur in first 15 minutes.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Stay with patient first 15 minutes.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Frequent assessment of respiratory, cardiac, and neurologic status.", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("ANY suspected reaction: STOP transfusion immediately, maintain IV access with NS through new tubing, notify provider and blood bank.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Send unit, tubing, post-transfusion blood and urine sample to blood bank for workup.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Acute hemolytic: aggressive fluid resuscitation, urine output goal >100 mL/hr (dilute pigment), treat DIC, possible dialysis.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Febrile non-hemolytic: antipyretic; can resume after evaluation if no other findings.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Mild allergic: antihistamine, slow infusion; can usually resume.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Anaphylactic: epinephrine, antihistamine, steroids, IV fluids; future use of washed cells or IgA-deficient products if IgA-deficient patient.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("TRALI: supportive — oxygen, mechanical ventilation if needed; AVOID diuretics (not fluid overload).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("TACO: stop, sit upright, oxygen, IV diuretic.", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("Acute hemolytic + DIC → high mortality if not promptly recognized.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Bacterial contamination — escalating fever, hypotension; broad-spectrum antibiotics.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Delayed hemolytic — 7–14 days after transfusion; falling Hgb, mild jaundice; antibody screen.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("TRALI is a leading cause of transfusion-related death; report all suspected cases.", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Upper GI Bleed

public enum UpperGIBleedSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "upper-gi-bleed",
        title: "Upper GI Bleed",
        subtitle: "Hematemesis · melena · proximal to ligament of Treitz",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        definition: AttributedProse(
            "Bleeding from a source proximal to the ligament of Treitz (esophagus, stomach, duodenum). Common causes: peptic ulcer disease, esophageal/gastric varices (cirrhosis), Mallory-Weiss tear, gastritis, malignancy.",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "Erosion of mucosa or rupture of variceal vessels causes blood loss into GI tract. Variceal bleeding is high-pressure, often catastrophic. PUD bleeding from H. pylori, NSAIDs, stress.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Hematemesis — bright red blood (active) or coffee-ground (older blood).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Melena — black, tarry, foul-smelling stools (digested blood).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hematochezia (massive UGIB only — usually lower GI source).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hemodynamic instability — tachycardia, hypotension, orthostasis, shock if massive.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Pallor, weakness, dyspnea, chest pain (especially with cardiac comorbidity).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Stigmata of cirrhosis (varices) — spider angiomata, ascites, jaundice.", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical presentation + Hgb drop + endoscopic confirmation.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Risk scoring — Glasgow-Blatchford (admission triage), Rockall (post-endoscopy).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Type and cross, BMP, LFTs, INR, lactate.", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("Hemodynamics — vitals every 5–15 min in active bleed; central line if persistent shock.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("LARGE-BORE IV access (2 × 18 G or larger) for fluid/blood resuscitation.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Blood loss estimation — quantify hematemesis, melena.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Mental status, urine output as perfusion indicators.", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("ABCs — secure airway if obtunded or massive hematemesis (aspiration risk).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Two large-bore IVs; type and cross; transfuse PRBCs to maintain Hgb >7 (>8 if cardiac disease); platelets if <50K and bleeding; FFP for INR >1.5.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("PPI infusion (pantoprazole 80 mg bolus + 8 mg/hr) for suspected PUD bleed.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Octreotide drip for variceal bleed (50 mcg bolus + 50 mcg/hr × 3–5 days).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Ceftriaxone for SBP prophylaxis in cirrhotic GI bleeding.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Urgent endoscopy within 24 hours (within 12 hours if variceal/ongoing).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Balloon tamponade (Sengstaken-Blakemore) for refractory variceal bleeding bridging to endoscopy/TIPS.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hold/reverse anticoagulants per protocol.", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("Massive bleeding → shock, MI, AKI, multi-organ failure.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Aspiration with massive hematemesis — secure airway early.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Re-bleeding after endoscopic therapy — high-risk lesions; second-look endoscopy.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hepatic encephalopathy precipitated by GI bleed in cirrhotic patient — protein load + intestinal blood.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Initial Hgb may not reflect true loss — intravascular volume contracts before equilibration; trend.", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bowel Obstruction

public enum BowelObstructionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bowel-obstruction",
        title: "Bowel Obstruction",
        subtitle: "Mechanical or functional · small or large bowel",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .elimination),
        definition: AttributedProse(
            "Disruption of normal intestinal flow. Mechanical (adhesions — most common cause of small bowel obstruction post-op, hernia, malignancy, volvulus) or functional (paralytic ileus). Partial vs complete; small vs large bowel. Strangulating obstruction with bowel ischemia is surgical emergency.",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "Obstruction → distention proximal, decompression distal. Increased intraluminal pressure → reduced absorption, increased secretion, third-spacing → hypovolemia. Bacterial overgrowth → translocation, sepsis. Strangulation → ischemia → necrosis → perforation.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Crampy abdominal pain — intermittent, colicky in small bowel; constant in large bowel.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Abdominal distention.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Nausea, vomiting (proximal obstruction = early bilious emesis; distal = late, feculent emesis).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Obstipation — no flatus or stool.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hyperactive bowel sounds early (high-pitched tinkling); HYPOACTIVE/ABSENT late.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Strangulation: severe constant pain, fever, peritoneal signs (rebound, guarding), tachycardia, hypotension.", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Imaging: upright abdominal X-ray (air-fluid levels, dilated loops); CT (gold standard for cause and severity).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Lactate elevated suggests ischemia.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("CBC, BMP — leukocytosis, electrolyte derangements, AKI.", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — tachycardia, fever, hypotension suggest strangulation.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Abdominal exam — distention, tenderness, peritoneal signs (rebound, guarding).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Bowel sounds, presence of flatus/stool.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Strict I&O including NG output.", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("NPO; gastric decompression with NG tube to low intermittent suction.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Aggressive IV fluids (LR or NS); replace electrolytes (especially K from vomiting/NG losses).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Pain control — careful with opioids (slows motility); IV hydromorphone or morphine titrated.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Antiemetics.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Partial obstruction often resolves with bowel rest.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Complete obstruction or strangulation: SURGICAL evaluation; emergent if peritoneal signs.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Antibiotics if sepsis or strangulation suspected.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Daily abdominal exams, X-rays, BMP.", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("Strangulation/ischemia — severe pain, fever, leukocytosis, peritoneal signs, lactate; SURGICAL EMERGENCY.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Perforation — sudden severe pain, peritoneal signs, free air on imaging.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Hypovolemic shock from third-spacing and vomiting losses.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Ogilvie syndrome (acute colonic pseudo-obstruction) — large bowel without mechanical block; treat with neostigmine after rule out perforation.", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Appendicitis

public enum AppendicitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "appendicitis",
        title: "Acute Appendicitis",
        subtitle: "Right lower quadrant pain · surgical emergency",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection),
        definition: AttributedProse(
            "Inflammation of the vermiform appendix, typically due to luminal obstruction by fecalith, lymphoid hyperplasia, or tumor. Progresses to perforation if untreated. Surgical emergency.",
            citationIDs: ["openrn_medsurg3"]
        ),
        pathophysiology: AttributedProse(
            "Obstruction → bacterial overgrowth → distention → wall ischemia → necrosis → perforation. Perforation contained by omentum forms abscess; free perforation causes diffuse peritonitis.",
            citationIDs: ["openrn_medsurg3", "openstax_medsurg"]
        ),
        presentation: [
            AttributedBullet("Periumbilical pain initially, MIGRATES to right lower quadrant (McBurney point) over 12–24 hours — classic.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Anorexia (very common — appendicitis without anorexia is rare).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Nausea, vomiting (after pain onset, not before).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Low-grade fever (high fever suggests perforation).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Tenderness at McBurney point; positive Rovsing, psoas, obturator signs.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Leukocytosis (typically 10K–20K).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("PERFORATION: severe diffuse pain, rebound, guarding, high fever, septic appearance.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Atypical presentations: pregnancy (RUQ pain, displaced appendix), elderly (vague), retrocecal (back/flank pain), pelvic (tenesmus).", citationIDs: ["openrn_medsurg3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical exam + leukocytosis + neutrophilia.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("CT abdomen/pelvis with contrast — gold standard in adults.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Ultrasound preferred in pregnancy and pediatrics (avoid radiation).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Alvarado score helps risk-stratify but not diagnostic alone.", citationIDs: ["openrn_medsurg3"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain location, severity, and progression — sudden relief may indicate perforation (release of pressure), then return of severe pain with peritonitis.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Vital signs — fever, tachycardia, hypotension suggest perforation/sepsis.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Abdominal exam — peritoneal signs (rebound, guarding, rigidity).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Pre-op preparation — NPO, IV access, fluids, antibiotics, consent.", citationIDs: ["openrn_medsurg3"])
        ],
        commonInterventions: [
            AttributedBullet("NPO; IV fluids (LR or NS).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Pre-op antibiotics covering enteric organisms (e.g., piperacillin-tazobactam, ceftriaxone + metronidazole).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Pain control — IV opioid or NSAID per provider; do NOT withhold pain meds awaiting surgical decision (modern teaching).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Antiemetic.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Surgical: laparoscopic appendectomy is standard of care.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Selected non-perforated cases may be managed with antibiotics alone (controversial; recurrence risk).", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Perforation/abscess: percutaneous drainage + antibiotics, interval appendectomy in 6–8 weeks.", citationIDs: ["openrn_medsurg3"])
        ],
        watchFor: [
            AttributedBullet("Perforation with peritonitis or sepsis — high mortality if not promptly recognized.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Atypical presentation in elderly (vague pain, low-grade fever) — high index of suspicion.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Pregnancy — appendix displaced upward; consider RUQ pain.", citationIDs: ["openrn_medsurg3"]),
            AttributedBullet("Post-op: ileus, wound infection, intra-abdominal abscess.", citationIDs: ["openrn_medsurg3"])
        ],
        citations: [openrnMedSurg3, openstaxMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}
