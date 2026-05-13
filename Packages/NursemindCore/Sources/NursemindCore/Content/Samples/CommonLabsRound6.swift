import Foundation

// Curator-model lab entries (round 6 expansion — endocrine + DM monitoring).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax Clinical Nursing Skills
// (CC BY 4.0 with AI restriction), Endocrine Society + ADA concept citations.

private let openrnLabsR6 = CitationSource(
    id: "openrn_labs_round6",
    shortName: "Open RN Health Alterations — endocrine labs",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=cortisol+aldosterone+c-peptide+a1c",
    lastRetrieved: "2026-05-04"
)
private let openstaxLabsR6 = CitationSource(
    id: "openstax_labs_round6",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values appendix",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)
private let endoConceptR6 = CitationSource(
    id: "endo_concept_round6",
    shortName: "Endocrine Society / ADA Standards of Care (concept citation)",
    publisher: "Endocrine Society · American Diabetes Association",
    license: .factCitationOnly,
    url: "https://www.endocrine.org/clinical-practice-guidelines",
    lastRetrieved: "2026-05-04"
)

private let endoLabR6 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation)
private let glucoseLabR6 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .glucoseRegulation)

// MARK: - ACTH Stimulation Test

public enum ACTHStimSample {
    public static let entry: LabEntry = LabEntry(
        id: "acth-stimulation-test",
        title: "ACTH Stimulation (Cosyntropin) Test",
        subtitle: "Adrenal-axis assessment · diagnose adrenal insufficiency",
        specimen: "Serum cortisol; baseline, then 30 and/or 60 minutes after IV/IM cosyntropin",
        nclexTags: endoLabR6,
        referenceRanges: [
            ReferenceRangeRow(value: "Baseline cortisol drawn (typically morning); cosyntropin 250 mcg IV/IM", label: "Standard high-dose protocol", citationIDs: ["openrn_labs_round6"]),
            ReferenceRangeRow(value: "Normal: cortisol ≥18 mcg/dL at 30 or 60 minutes", label: "Normal response", citationIDs: ["openrn_labs_round6"]),
            ReferenceRangeRow(value: "Insufficient: peak cortisol <18 mcg/dL", label: "Adrenal insufficiency (primary or secondary)", citationIDs: ["openrn_labs_round6"]),
            ReferenceRangeRow(value: "Pair with baseline ACTH — high ACTH = primary; low/normal = secondary (pituitary)", label: "ACTH pairing", citationIDs: ["openrn_labs_round6"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Failed stimulation — adrenal insufficiency",
                summary: "Peak cortisol <18 mcg/dL after cosyntropin indicates inability to mount an adrenal response. Primary (Addison's, autoimmune, infection, hemorrhage) or secondary (pituitary, prior steroid suppression).",
                nursingActions: [
                    "Notify provider — patient typically requires hydrocortisone replacement",
                    "Assess for impending adrenal crisis: hypotension, hypoglycemia, hyperkalemia, AMS",
                    "Stress-dose education: triple home dose for fevers / surgery / illness; medical-alert bracelet"
                ],
                citationIDs: ["openrn_labs_round6"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of failed stimulation",
                causes: [
                    "Primary adrenal insufficiency (Addison's, autoimmune, TB, HIV, adrenal hemorrhage, metastases)",
                    "Secondary (pituitary disease, post-surgery, post-radiation)",
                    "Tertiary — chronic exogenous steroid suppressing CRH (most common)",
                    "Critical illness-related corticosteroid insufficiency"
                ],
                citationIDs: ["openrn_labs_round6"]
            )
        ],
        nursingActions: [
            AttributedBullet("Hold hydrocortisone for ≥24 hr before testing if able (cross-reacts with cortisol assay); dexamethasone 0.5 mg can be given for stress without affecting assay per primary source.", citationIDs: ["openrn_labs_round6"]),
            AttributedBullet("In suspected adrenal crisis, do NOT delay treatment — give hydrocortisone empirically and obtain cortisol/ACTH levels concurrently per primary source.", citationIDs: ["openrn_labs_round6"]),
            AttributedBullet("Document time of cosyntropin administration and exact draw times.", citationIDs: ["openrn_labs_round6"])
        ],
        watchFor: [
            AttributedBullet("Adrenal crisis — fatigue, hypotension, hypoglycemia, hyperkalemia; activate rapid response and give hydrocortisone immediately.", citationIDs: ["openrn_labs_round6"]),
            AttributedBullet("Sudden discontinuation of long-term oral steroid → adrenal insufficiency for weeks-months; taper required.", citationIDs: ["openrn_labs_round6"])
        ],
        citations: [openrnLabsR6, openstaxLabsR6, endoConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Aldosterone–Renin Ratio

public enum AldoReninSample {
    public static let entry: LabEntry = LabEntry(
        id: "aldosterone-renin-ratio",
        title: "Aldosterone–Renin Ratio (ARR)",
        subtitle: "Screen for primary aldosteronism in resistant HTN / spontaneous hypokalemia",
        specimen: "Plasma aldosterone + plasma renin activity (or direct renin) — drawn morning, ≥2 hr after rising",
        nclexTags: endoLabR6,
        referenceRanges: [
            ReferenceRangeRow(value: "Plasma aldosterone (PAC) typical normal: 4–31 ng/dL upright (varies by lab and Na intake)", label: "Reference (typical)", citationIDs: ["openstax_labs_round6"]),
            ReferenceRangeRow(value: "Plasma renin activity (PRA): 0.5–4 ng/mL/hr (varies)", label: "Reference (typical)", citationIDs: ["openstax_labs_round6"]),
            ReferenceRangeRow(value: "ARR > 20–30 with PAC ≥15 ng/dL — POSITIVE screen for primary aldosteronism per primary source", label: "Positive screen", citationIDs: ["endo_concept_round6"]),
            ReferenceRangeRow(value: "Confirmation testing required — saline load, captopril, fludrocortisone suppression", label: "Confirmation step", citationIDs: ["endo_concept_round6"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Positive screen for primary aldosteronism",
                summary: "Adrenal aldosterone-producing adenoma or bilateral hyperplasia. Often presents as treatment-resistant HTN with hypokalemia. Specific treatment (adrenalectomy or mineralocorticoid antagonist) markedly improves cardiovascular outcomes per primary source.",
                nursingActions: [
                    "Notify provider; coordinate confirmatory testing per endocrine consult",
                    "Replete potassium; reduce dietary salt",
                    "Anticipate adrenal venous sampling and possible CT adrenal protocol"
                ],
                citationIDs: ["endo_concept_round6"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of ARR alterations",
                causes: [
                    "Primary aldosteronism — high aldosterone, low/suppressed renin",
                    "Renovascular HTN — high renin and aldosterone (NOT primary aldosteronism)",
                    "Secondary aldosteronism — heart failure, cirrhosis, nephrotic syndrome (high renin and aldosterone)",
                    "Beta-blockers — falsely lower renin → falsely elevate ARR",
                    "MR antagonists (spironolactone, eplerenone) — falsely raise renin → falsely lower ARR (hold ≥4–6 weeks before testing per primary source)"
                ],
                citationIDs: ["openrn_labs_round6"]
            )
        ],
        nursingActions: [
            AttributedBullet("Hold MR antagonists for ≥4–6 weeks before testing per primary source.", citationIDs: ["openrn_labs_round6"]),
            AttributedBullet("Hold beta-blockers, ACEi/ARB if possible (ideally ≥2 weeks); switch to verapamil or hydralazine for BP per provider.", citationIDs: ["openrn_labs_round6"]),
            AttributedBullet("Replete potassium to upper-normal before testing — hypokalemia falsely lowers aldosterone.", citationIDs: ["openrn_labs_round6"]),
            AttributedBullet("Liberalize salt intake before sampling unless contraindicated per provider.", citationIDs: ["openrn_labs_round6"])
        ],
        watchFor: [
            AttributedBullet("Severe hypokalemia → cardiac arrhythmia; replete carefully (oral or IV per provider).", citationIDs: ["openrn_labs_round6"]),
            AttributedBullet("Resistant HTN — patients on ≥3 antihypertensives including a diuretic warrant secondary HTN workup per primary source.", citationIDs: ["endo_concept_round6"])
        ],
        citations: [openrnLabsR6, openstaxLabsR6, endoConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - C-peptide

public enum CPeptideSample {
    public static let entry: LabEntry = LabEntry(
        id: "c-peptide",
        title: "C-peptide",
        subtitle: "Endogenous insulin marker · differentiate type 1 vs type 2 vs factitious hypoglycemia",
        specimen: "Serum (gold-top SST); fasting or random per indication",
        nclexTags: glucoseLabR6,
        referenceRanges: [
            ReferenceRangeRow(value: "Fasting: 0.8–3.1 ng/mL (typical adult)", label: "Fasting (per primary source)", citationIDs: ["openstax_labs_round6"]),
            ReferenceRangeRow(value: "Pair with simultaneous glucose for interpretation", label: "Always paired with glucose", citationIDs: ["openrn_labs_round6"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Low C-peptide with hypoglycemia",
                summary: "Either insulin deficiency (type 1 DM, late LADA) OR exogenous insulin (factitious / surreptitious hypoglycemia). Pairing with insulin and proinsulin distinguishes — exogenous insulin → high insulin, LOW C-peptide.",
                nursingActions: [
                    "Notify provider; suspect factitious hypoglycemia if discordant",
                    "If type 1 DM, transition to insulin therapy",
                    "Document insulin / oral hypoglycemic exposure history"
                ],
                citationIDs: ["openrn_labs_round6"]
            ),
            InterpretationTier(
                severity: .high,
                label: "High C-peptide with hypoglycemia",
                summary: "Endogenous hyperinsulinemia — sulfonylurea / meglitinide ingestion (toxicology screen positive) or insulinoma (toxicology negative). Surgical evaluation for insulinoma per primary source.",
                nursingActions: [
                    "Notify provider; obtain sulfonylurea screen",
                    "Imaging for insulinoma if drug screen negative",
                    "Diazoxide for symptom control per provider while diagnostic workup proceeds"
                ],
                citationIDs: ["openrn_labs_round6"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Differential by C-peptide pattern",
                causes: [
                    "Type 1 DM — low C-peptide, low insulin, hyperglycemia",
                    "Type 2 DM — normal-high C-peptide, normal-high insulin (insulin resistance)",
                    "Factitious hypoglycemia — low C-peptide, high insulin",
                    "Sulfonylurea ingestion — high C-peptide, high insulin, drug detected",
                    "Insulinoma — high C-peptide, high insulin, negative drug screen"
                ],
                citationIDs: ["openrn_labs_round6"]
            )
        ],
        nursingActions: [
            AttributedBullet("ALWAYS draw with simultaneous serum glucose AND insulin (and consider proinsulin and oral hypoglycemic screen) per primary source.", citationIDs: ["openrn_labs_round6"]),
            AttributedBullet("In suspected factitious hypoglycemia, document who has access to insulin and any psychiatric / medical staff history.", citationIDs: ["openrn_labs_round6"])
        ],
        watchFor: [
            AttributedBullet("Hypoglycemia unawareness — chronic insulin therapy can blunt counter-regulation; teach glucose monitoring + glucagon access.", citationIDs: ["openrn_labs_round6"])
        ],
        citations: [openrnLabsR6, openstaxLabsR6, endoConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hemoglobin A1c

public enum A1cSample {
    public static let entry: LabEntry = LabEntry(
        id: "hemoglobin-a1c",
        title: "Hemoglobin A1c (HbA1c)",
        subtitle: "3-month average glucose · diabetes diagnosis + monitoring",
        specimen: "Whole blood (lavender-top EDTA)",
        nclexTags: glucoseLabR6,
        referenceRanges: [
            ReferenceRangeRow(value: "<5.7% — normal", label: "Normal", citationIDs: ["openstax_labs_round6"]),
            ReferenceRangeRow(value: "5.7–6.4% — prediabetes", label: "Prediabetes", citationIDs: ["openrn_labs_round6"]),
            ReferenceRangeRow(value: "≥6.5% — diabetes (on 2 occasions OR with classic symptoms + glucose) per primary source", label: "Diagnostic for DM", citationIDs: ["endo_concept_round6"]),
            ReferenceRangeRow(value: "Most adults — target <7% (per ADA)", label: "General DM target", citationIDs: ["endo_concept_round6"]),
            ReferenceRangeRow(value: "Older adults / multiple comorbidities — target 7–8% to avoid hypoglycemia per primary source", label: "Individualized older-adult target", citationIDs: ["endo_concept_round6"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "A1c above target",
                summary: "Reflects 3-month average glucose. Indicates need for treatment intensification — lifestyle, oral agents (metformin, GLP-1 agonist, SGLT-2 inhibitor), or insulin per primary source.",
                nursingActions: [
                    "Reinforce SMBG / CGM use; review carbohydrate intake and timing",
                    "Assess medication adherence, technique, and barriers",
                    "Refer to diabetes educator and dietitian; consider CGM for trends",
                    "Assess for diabetes complications — retinopathy, nephropathy, neuropathy, cardiovascular per ADA Standards of Care"
                ],
                citationIDs: ["endo_concept_round6"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Conditions that ALTER A1c interpretation",
                causes: [
                    "Anemia / hemoglobinopathies (sickle cell, thalassemia) — falsely high or low",
                    "Recent transfusion or hemolysis — falsely low",
                    "Pregnancy — A1c less reliable; use OGTT or CGM",
                    "Iron deficiency — falsely high",
                    "Splenectomy — falsely high (longer RBC lifespan)",
                    "Dialysis — varies; consider fructosamine"
                ],
                citationIDs: ["openrn_labs_round6"]
            )
        ],
        nursingActions: [
            AttributedBullet("A1c approximate average glucose: 6% ≈ 126; 7% ≈ 154; 8% ≈ 183; 9% ≈ 212; 10% ≈ 240 mg/dL per primary source.", citationIDs: ["endo_concept_round6"]),
            AttributedBullet("Recheck every 3–6 months; more often if therapy changing.", citationIDs: ["openrn_labs_round6"]),
            AttributedBullet("Use trends + SMBG patterns + CGM time-in-range in treatment decisions, not A1c alone.", citationIDs: ["openrn_labs_round6"])
        ],
        watchFor: [
            AttributedBullet("Hypoglycemia unawareness — A1c may LOOK okay while patient swings between highs and lows; CGM identifies this.", citationIDs: ["openrn_labs_round6"]),
            AttributedBullet("Steroid bursts, infection, surgery → temporarily worsen A1c; reassess after stress resolves.", citationIDs: ["openrn_labs_round6"])
        ],
        citations: [openrnLabsR6, openstaxLabsR6, endoConceptR6],
        lastSourceFidelityReview: "2026-05-04"
    )
}
