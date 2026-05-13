import Foundation

// Curator-model lab entries (round 4 expansion — endocrine, thyroid, toxicology, immunosuppression, osmolality).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax Clinical Nursing Skills appendix
// (CC BY 4.0 with AI restriction), CDC (public domain), AACE / ATA / AACC concept citations.

private let openrnLabsR4 = CitationSource(
    id: "openrn_labs_round4",
    shortName: "Open RN Health Alterations — Endocrine / Toxicology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=laboratory+values",
    lastRetrieved: "2026-05-04"
)
private let openstaxLabsR4 = CitationSource(
    id: "openstax_labs_round4",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values appendix",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)
private let cdcLabsR4 = CitationSource(
    id: "cdc_labs_round4",
    shortName: "CDC clinical laboratory standards / poison control",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/laboratory/",
    lastRetrieved: "2026-05-04"
)
private let endoConcept = CitationSource(
    id: "endo_concept_round4",
    shortName: "AACE / ATA / AACC clinical practice guidelines (concept citation)",
    publisher: "American Association of Clinical Endocrinology · American Thyroid Association · AACC",
    license: .factCitationOnly,
    url: "https://pro.aace.com/clinical-guidance",
    lastRetrieved: "2026-05-04"
)

private let endocrineLabTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation)
private let pharmLabTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)
private let fluidLabTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes)

// MARK: - Vitamin D (25-hydroxy)

public enum VitaminDSample {
    public static let entry: LabEntry = LabEntry(
        id: "vitamin-d-25oh",
        title: "Vitamin D (25-hydroxy)",
        subtitle: "25-OH vitamin D · serum · bone health & deficiency screen",
        specimen: "Serum (gold-top SST)",
        nclexTags: endocrineLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "30–100 ng/mL (75–250 nmol/L)", label: "Sufficient (typical adult)", citationIDs: ["openstax_labs_round4"]),
            ReferenceRangeRow(value: "20–29 ng/mL", label: "Insufficient", citationIDs: ["openrn_labs_round4"]),
            ReferenceRangeRow(value: "<20 ng/mL (<50 nmol/L)", label: "Deficient", citationIDs: ["openrn_labs_round4"]),
            ReferenceRangeRow(value: ">100 ng/mL", label: "Potentially toxic — risk of hypercalcemia", citationIDs: ["openrn_labs_round4"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Vitamin D deficiency (<20 ng/mL)",
                summary: "Associated with osteomalacia in adults, rickets in children, secondary hyperparathyroidism, increased fall and fracture risk. Common in older adults, dark skin, limited sun exposure, malabsorption (celiac, Crohn's, bariatric surgery), CKD, and certain medications (anticonvulsants, glucocorticoids).",
                nursingActions: [
                    "Review supplementation order — typical replacement is ergocalciferol (D2) 50,000 IU weekly × 8 weeks per primary source",
                    "Educate on dietary sources (fatty fish, fortified milk) and safe sun exposure",
                    "Pair with calcium, PTH, and ionized calcium when assessing bone metabolism"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Vitamin D toxicity (>100 ng/mL with hypercalcemia)",
                summary: "Caused by excessive supplementation (rarely by sun exposure or diet). Manifests with hypercalcemia, polyuria, dehydration, nausea, confusion, kidney stones, and acute kidney injury.",
                nursingActions: [
                    "Hold all vitamin D and calcium supplements; review OTC and multivitamins",
                    "Hydration with isotonic fluids per primary source",
                    "Monitor calcium, BUN, creatinine, urine output"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of LOW vitamin D",
                causes: [
                    "Limited sun exposure / dark skin",
                    "Malabsorption — celiac, Crohn's, post-bariatric surgery",
                    "Chronic kidney disease (impaired 1-α hydroxylation)",
                    "Anticonvulsants, glucocorticoids, rifampin, antiretrovirals",
                    "Older adults / institutionalized patients"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            CauseGroup(
                title: "Causes of HIGH vitamin D",
                causes: [
                    "Supplement overdose (most common cause)",
                    "Granulomatous disease (sarcoidosis, TB)",
                    "Some lymphomas with extrarenal 1,25-(OH)₂D production"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        nursingActions: [
            AttributedBullet("25-OH D is the standard screening test — NOT 1,25-(OH)₂ D, which is reserved for specific differentials (CKD, granulomatous disease).", citationIDs: ["openrn_labs_round4"]),
            AttributedBullet("Routine screening in healthy adults is not universally recommended; test in symptomatic, at-risk, or osteoporosis patients per primary source.", citationIDs: ["endo_concept_round4"])
        ],
        watchFor: [
            AttributedBullet("Hypercalcemia symptoms (\"stones, bones, abdominal groans, psychiatric overtones\") in patients on high-dose D — stop supplement and call provider.", citationIDs: ["openrn_labs_round4"])
        ],
        citations: [openrnLabsR4, openstaxLabsR4, endoConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - PTH (Parathyroid Hormone)

public enum PTHSample {
    public static let entry: LabEntry = LabEntry(
        id: "parathyroid-hormone",
        title: "Parathyroid Hormone (PTH, intact)",
        subtitle: "Intact PTH · serum · calcium regulation",
        specimen: "Serum or EDTA plasma — keep cold; transport on ice per primary source",
        nclexTags: endocrineLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "10–65 pg/mL (1.0–6.8 pmol/L)", label: "Normal (intact PTH, typical adult)", citationIDs: ["openstax_labs_round4"]),
            ReferenceRangeRow(value: "Always interpret PTH ALONGSIDE simultaneous serum calcium", label: "Interpretation rule", citationIDs: ["openrn_labs_round4"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "High PTH + High calcium",
                summary: "Primary hyperparathyroidism (most often a parathyroid adenoma). Patient may have stones, fractures, fatigue, depression, constipation. Surgical referral for parathyroidectomy is standard per primary source.",
                nursingActions: [
                    "Pair with ionized calcium, 24-h urine calcium, vitamin D, kidney function",
                    "Fall and fracture precautions; bone density imaging often ordered",
                    "Hydration to prevent stones"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            InterpretationTier(
                severity: .high,
                label: "High PTH + Low calcium (secondary hyperparathyroidism)",
                summary: "Appropriate response to hypocalcemia — most often CKD with phosphate retention and impaired vitamin D activation. Vitamin D analogs and phosphate binders are typical management per primary source.",
                nursingActions: [
                    "Trend phosphorus, calcium, vitamin D, BUN/creatinine",
                    "Reinforce phosphate binder timing with meals",
                    "Watch for vascular calcification, bone pain, pruritus in CKD-MBD"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Low PTH + Low calcium (hypoparathyroidism)",
                summary: "Often post-surgical (thyroidectomy, parathyroidectomy) or autoimmune. Symptoms: tetany, paresthesias, Chvostek's and Trousseau's signs, prolonged QT.",
                nursingActions: [
                    "Telemetry — risk of long QT and seizures",
                    "Have IV calcium gluconate available for symptomatic hypocalcemia per provider order",
                    "Lifelong calcium + activated vitamin D (calcitriol) replacement is typical"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of HIGH PTH",
                causes: [
                    "Primary hyperparathyroidism (adenoma, hyperplasia, rarely carcinoma)",
                    "Secondary hyperparathyroidism — CKD, vitamin D deficiency",
                    "Tertiary hyperparathyroidism — autonomous gland after long secondary"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            CauseGroup(
                title: "Causes of LOW PTH",
                causes: [
                    "Post-surgical (thyroid/parathyroid surgery)",
                    "Autoimmune hypoparathyroidism",
                    "Severe hypomagnesemia (suppresses PTH release)",
                    "Hypercalcemia of malignancy (PTH suppressed; PTHrP often elevated instead)"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        nursingActions: [
            AttributedBullet("Always draw PTH WITH simultaneous calcium — interpretation is impossible without paired calcium.", citationIDs: ["openrn_labs_round4"]),
            AttributedBullet("Correct hypomagnesemia before re-checking PTH if PTH is inappropriately low — Mg deficiency can cause functional hypoparathyroidism.", citationIDs: ["openrn_labs_round4"])
        ],
        watchFor: [
            AttributedBullet("Post-thyroidectomy: monitor closely for tetany / paresthesias / Trousseau / Chvostek — calcium can drop within 24–72 hours.", citationIDs: ["openrn_labs_round4"])
        ],
        citations: [openrnLabsR4, openstaxLabsR4, endoConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Free T3

public enum FreeT3Sample {
    public static let entry: LabEntry = LabEntry(
        id: "free-t3",
        title: "Free T3 (Triiodothyronine)",
        subtitle: "Free triiodothyronine · serum · thyroid axis",
        specimen: "Serum (gold-top SST)",
        nclexTags: endocrineLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "2.3–4.2 pg/mL (3.5–6.5 pmol/L)", label: "Normal (typical adult)", citationIDs: ["openstax_labs_round4"]),
            ReferenceRangeRow(value: "Pair with TSH and Free T4 for thyroid status", label: "Interpretation rule", citationIDs: ["openrn_labs_round4"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated Free T3",
                summary: "Hyperthyroidism — Graves' disease, toxic multinodular goiter, toxic adenoma, thyroiditis (early phase). T3 toxicosis can occur with normal T4 and suppressed TSH.",
                nursingActions: [
                    "Telemetry / heart rate monitoring — risk of atrial fibrillation, thyroid storm",
                    "Cool environment, hydration, calorie support",
                    "Verify antithyroid medication adherence (methimazole, PTU per primary source)"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Low Free T3",
                summary: "Hypothyroidism (primary or central), severe non-thyroidal illness (\"low T3 syndrome\"), starvation, post-surgery, advanced age.",
                nursingActions: [
                    "Pair with TSH and Free T4 for differential",
                    "Avoid initiating thyroid replacement on low T3 alone in critical illness — repeat after recovery per primary source",
                    "Assess for cold intolerance, fatigue, weight gain, bradycardia"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of HIGH Free T3",
                causes: [
                    "Graves' disease",
                    "Toxic multinodular goiter / toxic adenoma",
                    "Thyroiditis (early thyrotoxic phase)",
                    "Excess exogenous T3 (liothyronine) or factitious thyrotoxicosis",
                    "T3 toxicosis (rare — TSH suppressed, T4 normal)"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            CauseGroup(
                title: "Causes of LOW Free T3",
                causes: [
                    "Primary hypothyroidism",
                    "Non-thyroidal illness syndrome (\"euthyroid sick\")",
                    "Severe caloric deprivation",
                    "Some medications (amiodarone, glucocorticoids, beta-blockers)"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        nursingActions: [
            AttributedBullet("Free T3 alone is not a screening test — TSH is the screen; reflex Free T4 ± Free T3 only when TSH is abnormal per primary source.", citationIDs: ["endo_concept_round4"])
        ],
        watchFor: [
            AttributedBullet("Thyroid storm: high fever, tachycardia >140, agitation, vomiting — life-threatening; supportive care + antithyroid + beta-blocker per provider order.", citationIDs: ["openrn_labs_round4"])
        ],
        citations: [openrnLabsR4, openstaxLabsR4, endoConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Acetaminophen Level

public enum AcetaminophenLevelSample {
    public static let entry: LabEntry = LabEntry(
        id: "acetaminophen-level",
        title: "Acetaminophen Level",
        subtitle: "Serum acetaminophen · toxicology · Rumack-Matthew nomogram",
        specimen: "Serum (red- or gold-top); ideally drawn 4 hours post-ingestion or later",
        nclexTags: pharmLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "Therapeutic: 10–20 mcg/mL", label: "Therapeutic", citationIDs: ["openrn_labs_round4"]),
            ReferenceRangeRow(value: ">150 mcg/mL at 4 hours = probable hepatotoxicity (Rumack-Matthew)", label: "Probable toxicity (4 h)", citationIDs: ["openrn_labs_round4"]),
            ReferenceRangeRow(value: "Toxic dose: ~150 mg/kg single ingestion in adults (lower thresholds in malnourished, alcohol use, chronic acetaminophen)", label: "Toxic dose threshold", citationIDs: ["openrn_labs_round4"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .critical,
                label: "Toxic level (above Rumack-Matthew treatment line)",
                summary: "Risk of fulminant hepatic necrosis. N-acetylcysteine (NAC) is the antidote and is most effective when given within 8 hours of ingestion per primary source. Phase I (0–24 h) often asymptomatic; phase II (24–72 h) liver injury manifests; phase III (72–96 h) peak hepatotoxicity.",
                nursingActions: [
                    "Notify provider STAT; activate poison control if not already involved",
                    "IV access × 2; trend AST, ALT, INR, bilirubin, creatinine, glucose, lactate",
                    "Administer NAC per provider order — do not delay for confirmatory level if ingestion >7.5 g or unknown",
                    "Strict I/O; monitor for hepatic encephalopathy"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Therapeutic level with hepatotoxicity",
                summary: "Chronic supratherapeutic dosing (>4 g/day, or >2 g/day in chronic alcohol use, malnutrition, fasting) can cause hepatotoxicity even with \"therapeutic\" levels. Trend LFTs, INR.",
                nursingActions: [
                    "Hold all acetaminophen-containing products (review combination products — hydrocodone-APAP, oxycodone-APAP, OTC cold/flu)",
                    "LFTs, INR, glucose, creatinine",
                    "NAC if hepatotoxicity present per provider order"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of toxic acetaminophen levels",
                causes: [
                    "Intentional overdose (suicide attempt)",
                    "Unintentional supratherapeutic dosing — combination products (hydrocodone/APAP, OTC cold/flu)",
                    "Pediatric dosing errors",
                    "Chronic high-dose use in fasting / alcohol use / malnutrition"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        nursingActions: [
            AttributedBullet("Use a 4-hour post-ingestion level on the Rumack-Matthew nomogram — earlier levels are NOT interpretable.", citationIDs: ["openrn_labs_round4"]),
            AttributedBullet("If ingestion time unknown, level >10 mcg/mL with elevated LFTs warrants NAC per primary source.", citationIDs: ["openrn_labs_round4"]),
            AttributedBullet("Activated charcoal within 1–2 hours of ingestion if alert and able to protect airway per primary source.", citationIDs: ["openrn_labs_round4"])
        ],
        watchFor: [
            AttributedBullet("Co-ingestants are common in intentional overdose — screen salicylate, ETOH, opioids, benzos.", citationIDs: ["openrn_labs_round4"]),
            AttributedBullet("Phase II silent period — patient may feel \"better\" while liver is failing. Trend LFTs and INR.", citationIDs: ["openrn_labs_round4"])
        ],
        citations: [openrnLabsR4, openstaxLabsR4, cdcLabsR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Salicylate Level

public enum SalicylateLevelSample {
    public static let entry: LabEntry = LabEntry(
        id: "salicylate-level",
        title: "Salicylate Level",
        subtitle: "Serum salicylate · ASA toxicity · mixed acid-base",
        specimen: "Serum (red- or gold-top); recheck every 2 hours until peak",
        nclexTags: pharmLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "Therapeutic (anti-inflammatory): 15–30 mg/dL", label: "Anti-inflammatory therapeutic", citationIDs: ["openrn_labs_round4"]),
            ReferenceRangeRow(value: "Therapeutic (antiplatelet): typically <5 mg/dL", label: "Antiplatelet therapeutic", citationIDs: ["openrn_labs_round4"]),
            ReferenceRangeRow(value: "Toxic: >40 mg/dL", label: "Toxic", citationIDs: ["openrn_labs_round4"]),
            ReferenceRangeRow(value: "Severe / critical: >70–90 mg/dL — consider hemodialysis per primary source", label: "Severe / dialysis threshold", citationIDs: ["openrn_labs_round4"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .critical,
                label: "Severe salicylate toxicity",
                summary: "Mixed primary respiratory alkalosis + primary metabolic acidosis with elevated anion gap. Symptoms: tinnitus, hyperventilation, hyperthermia, seizures, altered mental status, pulmonary edema. Urinary alkalinization with sodium bicarbonate enhances elimination; hemodialysis in severe cases per primary source.",
                nursingActions: [
                    "Call rapid response / ICU per facility protocol",
                    "Trend ABG, electrolytes, glucose, lactate, salicylate level every 2 hours",
                    "Sodium bicarbonate IV per provider order; monitor urine pH (target 7.5–8) and serum K (replete, low K prevents alkaluria)",
                    "Avoid intubation if possible — ventilator hypoventilation worsens acidosis catastrophically"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Mild-moderate salicylate toxicity",
                summary: "Tinnitus, nausea, hyperventilation, mild metabolic disturbance. Often managed with supportive care, fluids, glucose, and serial level monitoring.",
                nursingActions: [
                    "IV fluids with dextrose per provider order",
                    "Monitor neuro status, glucose (CNS hypoglycemia), potassium",
                    "Q2-hour salicylate levels until peak passed and trending down"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of salicylate toxicity",
                causes: [
                    "Acute aspirin overdose (intentional or unintentional)",
                    "Chronic supratherapeutic dosing — especially elderly, dehydrated",
                    "Topical methyl salicylate (oil of wintergreen) — highly concentrated",
                    "Bismuth subsalicylate (Pepto-Bismol) in pediatrics"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        nursingActions: [
            AttributedBullet("Pediatric: aspirin in viral illness → Reye's syndrome. Avoid in children with viral symptoms per primary source.", citationIDs: ["openrn_labs_round4"]),
            AttributedBullet("Chronic toxicity often missed — confused elderly with metabolic acidosis and tinnitus; check level even with \"therapeutic\" dosing.", citationIDs: ["openrn_labs_round4"])
        ],
        watchFor: [
            AttributedBullet("Cerebral and pulmonary edema — late, ominous; ICU-level care.", citationIDs: ["openrn_labs_round4"]),
            AttributedBullet("Hypoglycemia — even with normal serum glucose, CNS glucose may be low. Provide D5 in IVF.", citationIDs: ["openrn_labs_round4"])
        ],
        citations: [openrnLabsR4, openstaxLabsR4, cdcLabsR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Serum Osmolality

public enum SerumOsmolalitySample {
    public static let entry: LabEntry = LabEntry(
        id: "serum-osmolality",
        title: "Serum Osmolality",
        subtitle: "Calculated and measured · mOsm/kg · fluid balance & toxic alcohol screen",
        specimen: "Serum (gold- or red-top)",
        nclexTags: fluidLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "275–295 mOsm/kg (typical adult)", label: "Normal", citationIDs: ["openstax_labs_round4"]),
            ReferenceRangeRow(value: "Calculated: 2(Na) + (glucose/18) + (BUN/2.8)", label: "Calculation formula", citationIDs: ["openrn_labs_round4"]),
            ReferenceRangeRow(value: "Osmolar gap = measured − calculated; normal <10 mOsm/kg", label: "Osmolar gap", citationIDs: ["openrn_labs_round4"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "High serum osmolality",
                summary: "Dehydration, hypernatremia, hyperglycemia (DKA, HHS), uremia, mannitol therapy. With elevated osmolar gap (>10 mOsm/kg) consider toxic alcohol ingestion (methanol, ethylene glycol, isopropyl, propylene glycol).",
                nursingActions: [
                    "Trend Na, glucose, BUN, creatinine; calculate osmolar gap",
                    "If osmolar gap elevated and patient symptomatic, screen for toxic alcohols per primary source",
                    "Fluid resuscitation per provider order — careful in hypernatremia (avoid rapid correction)"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Low serum osmolality",
                summary: "Hyponatremia (SIADH, heart failure, cirrhosis, polydipsia, diuretics). Risk of cerebral edema if severe and rapid.",
                nursingActions: [
                    "Trend Na, urine osm, urine Na to differentiate hypovolemic vs euvolemic vs hypervolemic hyponatremia",
                    "Seizure precautions if Na <120",
                    "Free-water restriction or hypertonic saline per provider order — correct slowly to avoid central pontine myelinolysis"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of HIGH osmolality",
                causes: [
                    "Hypernatremia (free water loss, sodium gain)",
                    "Hyperglycemia — DKA, HHS",
                    "Uremia",
                    "Mannitol or contrast media",
                    "Toxic alcohol ingestion (elevated osmolar gap)"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            CauseGroup(
                title: "Causes of LOW osmolality",
                causes: [
                    "SIADH",
                    "Heart failure, cirrhosis, nephrotic syndrome (hypervolemic hyponatremia)",
                    "Diuretic-induced hyponatremia",
                    "Primary polydipsia"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        nursingActions: [
            AttributedBullet("Always calculate the osmolar gap when ordering measured osmolality — a wide gap is the only reliable bedside clue to toxic alcohol ingestion before specific assays return.", citationIDs: ["openrn_labs_round4"])
        ],
        watchFor: [
            AttributedBullet("Rapid correction of severe hypo- or hypernatremia → osmotic demyelination or cerebral edema; goal correction <8–10 mEq/L per 24 h per primary source.", citationIDs: ["openrn_labs_round4"])
        ],
        citations: [openrnLabsR4, openstaxLabsR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tacrolimus Level

public enum TacrolimusLevelSample {
    public static let entry: LabEntry = LabEntry(
        id: "tacrolimus-level",
        title: "Tacrolimus Level (FK506)",
        subtitle: "Trough whole-blood level · post-transplant immunosuppression",
        specimen: "Whole blood (lavender-top EDTA); trough drawn just before next dose",
        nclexTags: pharmLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "Target ranges vary by transplanted organ, time post-transplant, and protocol — typical kidney trough 5–15 ng/mL early, 5–10 ng/mL maintenance", label: "Typical kidney target (per primary source)", citationIDs: ["openrn_labs_round4"]),
            ReferenceRangeRow(value: "Liver: typical 8–12 ng/mL early, 5–10 ng/mL maintenance", label: "Typical liver target", citationIDs: ["openrn_labs_round4"]),
            ReferenceRangeRow(value: ">20 ng/mL — high toxicity risk per primary source", label: "Toxicity risk", citationIDs: ["openrn_labs_round4"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Supratherapeutic tacrolimus",
                summary: "Risk of nephrotoxicity, neurotoxicity (tremor, seizures, encephalopathy), hyperkalemia, hyperglycemia, hypomagnesemia, hypertension, opportunistic infection.",
                nursingActions: [
                    "Notify transplant team / provider",
                    "Trend creatinine, K, Mg, glucose, BP",
                    "Review interacting medications — azole antifungals, macrolides, diltiazem, grapefruit juice all raise levels"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Subtherapeutic tacrolimus",
                summary: "Risk of allograft rejection. Common causes: missed doses, drug interactions (rifampin, anticonvulsants), diarrhea, pharmacy substitution between brand and generic without TDM.",
                nursingActions: [
                    "Verify dose, timing of last dose, missed doses",
                    "Review interacting drugs and recent diet (grapefruit, St. John's wort)",
                    "Monitor for rejection signs per primary source — fever, graft tenderness, decreased urine output (kidney), elevated LFTs (liver)"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of HIGH tacrolimus levels",
                causes: [
                    "Azole antifungals (fluconazole, voriconazole, posaconazole)",
                    "Macrolide antibiotics (erythromycin, clarithromycin)",
                    "Diltiazem, verapamil",
                    "Grapefruit juice",
                    "Diarrhea (paradoxically increases absorption)",
                    "Hepatic dysfunction"
                ],
                citationIDs: ["openrn_labs_round4"]
            ),
            CauseGroup(
                title: "Causes of LOW tacrolimus levels",
                causes: [
                    "Rifampin / rifabutin",
                    "Phenytoin, carbamazepine, phenobarbital",
                    "St. John's wort",
                    "Missed or held doses",
                    "Brand-to-generic switch without re-monitoring per primary source"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        nursingActions: [
            AttributedBullet("Always draw TROUGH — just before next dose. A peak or random level is uninterpretable.", citationIDs: ["openrn_labs_round4"]),
            AttributedBullet("Educate transplant patients: never start any new medication, supplement, OTC, or herbal product without checking with transplant team.", citationIDs: ["openrn_labs_round4"]),
            AttributedBullet("Avoid grapefruit, grapefruit juice, and Seville oranges — strong CYP3A4 inhibitors per primary source.", citationIDs: ["openrn_labs_round4"])
        ],
        watchFor: [
            AttributedBullet("Tremor, headache, insomnia → common neurotoxic signs of supratherapeutic level.", citationIDs: ["openrn_labs_round4"]),
            AttributedBullet("New-onset diabetes after transplant — calcineurin inhibitor effect; monitor fasting glucose.", citationIDs: ["openrn_labs_round4"])
        ],
        citations: [openrnLabsR4, openstaxLabsR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Anti-TPO Antibodies

public enum AntiTPOSample {
    public static let entry: LabEntry = LabEntry(
        id: "anti-tpo-antibodies",
        title: "Anti-TPO Antibodies",
        subtitle: "Thyroid peroxidase antibodies · serum · autoimmune thyroid screen",
        specimen: "Serum (gold-top SST)",
        nclexTags: endocrineLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "<35 IU/mL (typical normal; method-specific)", label: "Normal", citationIDs: ["openstax_labs_round4"]),
            ReferenceRangeRow(value: "Elevated values support autoimmune thyroid disease", label: "Positive", citationIDs: ["openrn_labs_round4"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated anti-TPO",
                summary: "Most often Hashimoto's thyroiditis (autoimmune hypothyroidism); also seen in Graves' disease, postpartum thyroiditis, type 1 diabetes, Addison's, and other autoimmune conditions. Predicts progression from subclinical to overt hypothyroidism.",
                nursingActions: [
                    "Pair with TSH and Free T4 for current thyroid status",
                    "Educate that anti-TPO positivity indicates autoimmune predisposition and warrants periodic thyroid monitoring per primary source",
                    "In pregnancy: anti-TPO positivity raises risk of postpartum thyroiditis — recheck TSH at 6–12 weeks postpartum"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated anti-TPO",
                causes: [
                    "Hashimoto's thyroiditis",
                    "Graves' disease (often co-positive)",
                    "Postpartum thyroiditis",
                    "Other autoimmune conditions (T1DM, Addison's, pernicious anemia, vitiligo)",
                    "Up to ~10% of healthy adults (low titer, often clinically silent)"
                ],
                citationIDs: ["openrn_labs_round4"]
            )
        ],
        nursingActions: [
            AttributedBullet("Anti-TPO testing is most useful for: (1) confirming autoimmune cause of hypothyroidism, (2) risk-stratifying subclinical hypothyroidism, (3) postpartum thyroiditis screening per primary source.", citationIDs: ["endo_concept_round4"])
        ],
        watchFor: [
            AttributedBullet("Postpartum patients with positive anti-TPO — high risk for thyroiditis at 2–6 months postpartum; symptoms can mimic postpartum depression.", citationIDs: ["openrn_labs_round4"])
        ],
        citations: [openrnLabsR4, openstaxLabsR4, endoConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}
