import Foundation

// Curator-model lab entries (v1.5 expansion).
// Sources: Open RN (CC BY 4.0), OpenStax (CC BY 4.0 display), CDC (public domain),
// IDSA / ATS / ATA / CAP concept citations.

private let openrnLabs2 = CitationSource(
    id: "openrn_labs2",
    shortName: "Open RN Nursing Fundamentals — Reference Ranges",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingfundamentals/?s=lab+reference+range",
    lastRetrieved: "2026-05-04"
)
private let openrnMedSurg2 = CitationSource(
    id: "openrn_medsurg2",
    shortName: "Open RN Health Alterations / Med-Surg",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=lab+abnormal+interpretation",
    lastRetrieved: "2026-05-04"
)
private let openstaxLabs2 = CitationSource(
    id: "openstax_labs2",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values appendix",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)
private let cdcLabRef = CitationSource(
    id: "cdc_lab_ref",
    shortName: "CDC clinical and laboratory standards (concept citation)",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/laboratory/",
    lastRetrieved: "2026-05-04"
)

private let infectionTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection)
private let cardiacTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion)
private let endocrineTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .glucoseRegulation)
private let acidBaseTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .acidBase)
private let pharmTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)

// MARK: - Hematocrit

public enum HematocritSample {
    public static let entry: LabEntry = LabEntry(
        id: "hematocrit",
        title: "Hematocrit (Hct)",
        subtitle: "Volume percent of red blood cells",
        specimen: "Whole blood (EDTA, lavender-top)",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        referenceRanges: [
            ReferenceRangeRow(value: "Male 41–53% · Female 36–46%", label: "Normal (adult)", citationIDs: ["openrn_labs2", "openstax_labs2"]),
            ReferenceRangeRow(value: "Approximately 3× Hgb in g/dL", label: "Rule of thumb (Hct ≈ 3 × Hgb)", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "< 21% (or < 7 g/dL Hgb)", label: "Critical low — typical transfusion threshold", citationIDs: ["openrn_medsurg2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Anemia",
                summary: "Reduced RBC volume from blood loss, hemolysis, or decreased production. Symptoms vary with chronicity.",
                nursingActions: [
                    "Assess for source of blood loss — GI, GU, surgical site, occult",
                    "Trend serial Hgb/Hct; correlate with hemodynamic stability",
                    "Anticipate type & screen and possible transfusion per provider/protocol",
                    "Iron studies, B12/folate, reticulocyte count for non-acute anemia"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Polycythemia / hemoconcentration",
                summary: "Elevated due to true erythrocytosis (polycythemia vera, chronic hypoxia) OR hemoconcentration (dehydration, burns, diuretics).",
                nursingActions: [
                    "Assess hydration status — IV fluids if dehydrated, recheck Hct",
                    "Investigate chronic hypoxia (COPD, OSA, smoking)",
                    "Anticipate phlebotomy for polycythemia vera"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of low Hct",
                causes: [
                    "Acute or chronic blood loss",
                    "Hemolysis",
                    "Iron / B12 / folate deficiency",
                    "Bone marrow suppression",
                    "Chronic kidney disease (low erythropoietin)",
                    "Volume overload (dilutional)"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            CauseGroup(
                title: "Causes of high Hct",
                causes: [
                    "Dehydration / hemoconcentration",
                    "Polycythemia vera",
                    "Chronic hypoxemia (COPD, OSA, high altitude)",
                    "Smoking",
                    "Erythropoietin abuse"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("Hct lags blood loss by 4–6 hours after acute hemorrhage — initial Hct may appear normal in active GI bleed.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Trend with Hgb; Hct ≈ 3× Hgb — large discrepancy suggests assay error.", citationIDs: ["openrn_labs2"])
        ],
        watchFor: [
            AttributedBullet("Symptomatic anemia (dyspnea, chest pain, tachycardia, AMS) — may need transfusion sooner than threshold suggests.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Falling trend without obvious bleed source — consider occult GI bleed, retroperitoneal hemorrhage, hemolysis.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - PT (Prothrombin Time)

public enum PTSample {
    public static let entry: LabEntry = LabEntry(
        id: "pt",
        title: "PT (Prothrombin Time)",
        subtitle: "Extrinsic pathway · paired with INR",
        specimen: "Citrated plasma (blue-top tube; fill to line)",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .clottingHemostasis),
        referenceRanges: [
            ReferenceRangeRow(value: "11–13 seconds (typical)", label: "Normal", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "INR 0.8–1.2", label: "Normal (standardized as INR)", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "INR 2.0–3.0", label: "Therapeutic on warfarin (most uses)", citationIDs: ["openrn_medsurg2"]),
            ReferenceRangeRow(value: "INR 2.5–3.5", label: "Therapeutic on warfarin (mech mitral valve)", citationIDs: ["openrn_medsurg2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Prolonged PT/INR",
                summary: "Reduced extrinsic pathway clotting factor activity (factor VII most sensitive). Causes include warfarin therapy, vitamin K deficiency, hepatic dysfunction, DIC.",
                nursingActions: [
                    "Verify warfarin dose against INR target",
                    "Bleeding precautions; assess for active bleeding",
                    "If supratherapeutic on warfarin, consult dose-adjustment protocol or provider",
                    "Vitamin K reversal if indicated; PCC for major bleeding"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of prolonged PT",
                causes: [
                    "Warfarin therapy (intended)",
                    "Vitamin K deficiency",
                    "Liver disease (decreased synthesis)",
                    "DIC",
                    "Massive transfusion (dilutional)",
                    "Factor VII deficiency (rare)"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("INR is the standardized version of PT — use INR for warfarin monitoring across labs.", citationIDs: ["openrn_labs2"]),
            AttributedBullet("Trend with aPTT — DIC and severe liver disease prolong both.", citationIDs: ["openrn_medsurg2"])
        ],
        watchFor: [
            AttributedBullet("Major bleeding with INR >5 — vitamin K reversal; PCC if life-threatening.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Acute liver failure — INR >1.5 plus encephalopathy is a transplant emergency.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bicarbonate (HCO3)

public enum BicarbonateSample {
    public static let entry: LabEntry = LabEntry(
        id: "bicarbonate",
        title: "Bicarbonate (HCO₃⁻)",
        subtitle: "Serum CO₂ content · acid-base buffer",
        specimen: "Serum",
        nclexTags: acidBaseTags,
        referenceRanges: [
            ReferenceRangeRow(value: "22–26 mEq/L", label: "Normal", citationIDs: ["openrn_labs2", "openstax_labs2"]),
            ReferenceRangeRow(value: "< 22 mEq/L", label: "Metabolic acidosis", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "> 26 mEq/L", label: "Metabolic alkalosis", citationIDs: ["openrn_labs2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Low HCO₃⁻ — metabolic acidosis",
                summary: "Loss or consumption of bicarbonate. Use anion gap (Na − [Cl + HCO3]) to differentiate: high gap = MUDPILES; normal gap = HARD-UP/diarrhea.",
                nursingActions: [
                    "Calculate anion gap",
                    "ABG to confirm pH and respiratory compensation",
                    "Investigate cause: lactate (sepsis/shock), ketones (DKA), creatinine (uremia), ingestion history",
                    "Treat underlying cause; bicarbonate replacement only for severe acidemia (pH <7.1 typically) per provider"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            InterpretationTier(
                severity: .high,
                label: "High HCO₃⁻ — metabolic alkalosis",
                summary: "From acid loss (vomiting, NG suction, diuretics) or bicarbonate gain (excess intake). Often accompanied by hypokalemia and hypochloremia.",
                nursingActions: [
                    "Assess GI losses; review diuretic use",
                    "Replace volume with NS if volume-depleted; replace K, Cl",
                    "Address underlying cause (antiemetic, diuretic adjustment)"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Low HCO₃⁻ (acidosis)",
                causes: [
                    "Lactic acidosis (sepsis, shock, ischemia)",
                    "DKA, alcoholic ketoacidosis, starvation",
                    "Uremia (chronic kidney disease)",
                    "Toxin ingestion (methanol, ethylene glycol, salicylates)",
                    "Diarrhea (HCO3 loss)",
                    "Renal tubular acidosis"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            CauseGroup(
                title: "High HCO₃⁻ (alkalosis)",
                causes: [
                    "Vomiting, NG suction (loss of HCl)",
                    "Loop and thiazide diuretics",
                    "Hyperaldosteronism / Cushing syndrome",
                    "Excess sodium bicarbonate intake",
                    "Hypokalemia"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("Always interpret HCO3 alongside ABG, anion gap, and clinical context — number alone is incomplete.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Severe acidosis (pH <7.20) impairs cardiac contractility, vasopressor response — may require ICU.", citationIDs: ["openrn_medsurg2"])
        ],
        watchFor: [
            AttributedBullet("Rapid correction of chronic acidosis can worsen ionized calcium, K shifts — go slow.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Severe alkalosis: tetany, paresthesias, seizures from low ionized calcium and hypokalemia.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ESR

public enum ESRSample {
    public static let entry: LabEntry = LabEntry(
        id: "esr",
        title: "ESR (Erythrocyte Sedimentation Rate)",
        subtitle: "Westergren · non-specific inflammation marker",
        specimen: "Whole blood (EDTA, lavender-top)",
        nclexTags: infectionTags,
        referenceRanges: [
            ReferenceRangeRow(value: "Male <50 yr: ≤15 mm/hr · Female <50 yr: ≤20 mm/hr", label: "Normal (adult under 50)", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "Male ≥50 yr: ≤20 mm/hr · Female ≥50 yr: ≤30 mm/hr", label: "Normal (adult 50+)", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: ">100 mm/hr", label: "Marked elevation — temporal arteritis, malignancy, abscess", citationIDs: ["openrn_medsurg2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated ESR",
                summary: "Non-specific marker of inflammation. Rises and falls slowly compared to CRP — better for chronic disease monitoring.",
                nursingActions: [
                    "Interpret with clinical context — non-specific",
                    "Combined with CRP for inflammatory disease workup (RA, GCA, polymyalgia rheumatica)",
                    "Trend over weeks-months for treatment response in chronic conditions"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated ESR",
                causes: [
                    "Infection (especially chronic, e.g., osteomyelitis, endocarditis)",
                    "Inflammatory arthritis (RA), polymyalgia rheumatica, giant cell arteritis",
                    "Malignancy (multiple myeloma, lymphoma)",
                    "Pregnancy (mild)",
                    "Anemia",
                    "Advanced age"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("ESR rises slowly (days) and falls slowly (weeks) — not useful for acute changes; use CRP instead.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("ESR >100 in elderly with new headache → urgent eval for giant cell (temporal) arteritis to prevent vision loss.", citationIDs: ["openrn_medsurg2"])
        ],
        watchFor: [
            AttributedBullet("Suspected temporal arteritis: temporal headache, jaw claudication, vision changes, ESR >50 — start steroids while workup proceeds.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Free T4

public enum FreeT4Sample {
    public static let entry: LabEntry = LabEntry(
        id: "free-t4",
        title: "Free T4 (Free Thyroxine)",
        subtitle: "Unbound thyroxine · paired with TSH",
        specimen: "Serum",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation),
        referenceRanges: [
            ReferenceRangeRow(value: "0.8–1.8 ng/dL (typical adult)", label: "Normal", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "Low free T4 + high TSH", label: "Primary hypothyroidism (overt)", citationIDs: ["openrn_medsurg2"]),
            ReferenceRangeRow(value: "Normal free T4 + high TSH", label: "Subclinical hypothyroidism", citationIDs: ["openrn_medsurg2"]),
            ReferenceRangeRow(value: "High free T4 + low TSH", label: "Primary hyperthyroidism", citationIDs: ["openrn_medsurg2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Low free T4",
                summary: "Confirms hypothyroidism when paired with elevated TSH. Suggests central (pituitary) hypothyroidism if TSH also low/normal.",
                nursingActions: [
                    "Levothyroxine titration; assess symptoms (fatigue, cold intolerance, weight gain, constipation, bradycardia)",
                    "Monitor for myxedema coma in severe — emergency"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            InterpretationTier(
                severity: .high,
                label: "High free T4",
                summary: "Confirms hyperthyroidism when paired with suppressed TSH. Investigate cause (Graves, toxic nodule).",
                nursingActions: [
                    "Cardiac monitoring — atrial fibrillation common",
                    "Assess for thyroid storm — fever, severe tachycardia, agitation; medical emergency",
                    "Anticipate beta-blocker, methimazole/PTU, possible radioiodine"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Low free T4",
                causes: [
                    "Hashimoto thyroiditis (with elevated TSH)",
                    "Post-thyroidectomy / post-radioiodine",
                    "Iodine deficiency",
                    "Central hypothyroidism (pituitary disease)",
                    "Drug-induced (lithium, amiodarone)"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            CauseGroup(
                title: "High free T4",
                causes: [
                    "Graves disease",
                    "Toxic multinodular goiter",
                    "Toxic adenoma",
                    "Thyroiditis (transient)",
                    "Exogenous thyroid hormone excess"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("Free T4 is preferred over total T4 — bypasses binding-protein variability (pregnancy, OCPs).", citationIDs: ["openrn_labs2"]),
            AttributedBullet("Pregnancy alters TSH/T4 reference ranges per trimester.", citationIDs: ["openrn_medsurg2"])
        ],
        watchFor: [
            AttributedBullet("Myxedema coma: profound hypothermia, bradycardia, hypotension, AMS — ICU emergency.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Thyroid storm: fever, tachycardia, agitation — 10–30% mortality.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CK-MB

public enum CKMBSample {
    public static let entry: LabEntry = LabEntry(
        id: "ck-mb",
        title: "CK-MB",
        subtitle: "Creatine kinase MB isoenzyme · cardiac marker (largely replaced by troponin)",
        specimen: "Serum",
        nclexTags: cardiacTags,
        referenceRanges: [
            ReferenceRangeRow(value: "0–6.3 ng/mL (varies by lab)", label: "Normal", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "CK-MB > 5% of total CK with elevation", label: "Suggests myocardial source", citationIDs: ["openrn_medsurg2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated CK-MB",
                summary: "Specific to cardiac muscle damage. Rises 4–6 hr after MI, peaks 18–24 hr, normalizes 48–72 hr — useful for detecting RE-INFARCTION because troponin stays elevated for days.",
                nursingActions: [
                    "Trend serial — initial may be negative if drawn too early",
                    "Pair with troponin (more sensitive/specific) and ECG",
                    "If reinfarction suspected (post-PCI/CABG), CK-MB rise is the marker"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated CK-MB",
                causes: [
                    "Acute MI",
                    "Myocarditis",
                    "Cardiac contusion (trauma)",
                    "Post-cardiac surgery (CABG)",
                    "Defibrillation",
                    "Severe rhabdomyolysis (some MB fraction from skeletal muscle)"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("Troponin is the preferred biomarker for MI — CK-MB largely supplanted but useful for reinfarction detection.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Trend serial markers q3–6 hr if MI suspected and initial negative.", citationIDs: ["openrn_medsurg2"])
        ],
        watchFor: [
            AttributedBullet("ECG ischemia + chest pain with negative early markers — repeat troponin (and CK-MB if reinfarction concern) per protocol.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Beta-hCG

public enum BetaHCGSample {
    public static let entry: LabEntry = LabEntry(
        id: "beta-hcg",
        title: "Beta-hCG",
        subtitle: "Quantitative · pregnancy and tumor marker",
        specimen: "Serum (urine for qualitative)",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .cellularRegulation),
        referenceRanges: [
            ReferenceRangeRow(value: "<5 mIU/mL", label: "Non-pregnant", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "Doubles every 48 hr in early viable IUP", label: "Normal early pregnancy", citationIDs: ["openrn_medsurg2"]),
            ReferenceRangeRow(value: "Subnormal rise (<53% in 48 hr) or plateau", label: "Concerning for ectopic or non-viable", citationIDs: ["openrn_medsurg2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Positive in non-pregnant patient or unexpected context",
                summary: "Pregnancy is the most common cause. Other causes: gestational trophoblastic disease (very high), germ cell tumors, rare pituitary hCG production.",
                nursingActions: [
                    "Confirm with quantitative serum if qualitative urine positive",
                    "Pelvic ultrasound to confirm IUP if unsure",
                    "If pelvic pain + positive hCG, rule out ectopic urgently"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated hCG",
                causes: [
                    "Normal pregnancy",
                    "Multiple gestation (higher than singleton)",
                    "Ectopic pregnancy (typically lower-than-expected rise)",
                    "Gestational trophoblastic disease (markedly elevated)",
                    "Germ cell tumors (testicular, ovarian)",
                    "Recent miscarriage/abortion (declining)"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("ALWAYS check pregnancy status in any patient of childbearing potential before imaging with radiation, surgery, or teratogenic medications (e.g., isotretinoin, methotrexate, ACEi, ARB).", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("False negatives possible very early (<10 days post-conception) — repeat in 48–72 hr if concern.", citationIDs: ["openrn_medsurg2"])
        ],
        watchFor: [
            AttributedBullet("Ectopic pregnancy — abdominal/pelvic pain plus positive hCG = urgent ultrasound; ruptured ectopic is surgical emergency.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Hyperemesis with very high hCG → consider gestational trophoblastic disease (molar pregnancy).", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Urinalysis

public enum UrinalysisSample {
    public static let entry: LabEntry = LabEntry(
        id: "urinalysis",
        title: "Urinalysis (UA)",
        subtitle: "Dipstick + microscopy · screening multi-test",
        specimen: "Clean-catch midstream urine",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .elimination),
        referenceRanges: [
            ReferenceRangeRow(value: "Color: pale yellow to amber · Clarity: clear", label: "Normal appearance", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "Specific gravity 1.005–1.030 · pH 4.5–8.0", label: "Normal physical/chemical", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "Protein neg/trace · glucose neg · ketones neg · blood neg · nitrite neg · LE neg", label: "Normal dipstick", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "WBC <5/hpf · RBC <3/hpf · few epithelial cells · no bacteria, casts, crystals", label: "Normal microscopy", citationIDs: ["openrn_labs2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Pyuria + bacteriuria + nitrites + LE positive",
                summary: "Strongly suggestive of urinary tract infection. Confirm with culture and sensitivity in complicated cases or treatment failure.",
                nursingActions: [
                    "Collect clean-catch culture before antibiotics if possible",
                    "Empiric antibiotics per local susceptibility patterns and patient factors",
                    "Encourage hydration; symptom management"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Hematuria",
                summary: "Blood in urine. Causes range from trauma, stones, infection to malignancy. New unexplained hematuria warrants workup.",
                nursingActions: [
                    "Confirm with microscopy (vs myoglobinuria, hemoglobinuria, food dyes)",
                    "Repeat UA; consider imaging and cystoscopy if persistent",
                    "Review anticoagulants — does not absolve workup"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Proteinuria",
                summary: "May indicate renal disease (glomerular or tubular), pre-eclampsia in pregnancy, or transient causes (fever, exercise).",
                nursingActions: [
                    "Quantify with spot albumin/creatinine ratio or 24-hour collection",
                    "BMP, lipid panel, BP control, ACE inhibitor/ARB consideration if persistent"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Common abnormalities and causes",
                causes: [
                    "Glucose: diabetes, stress hyperglycemia",
                    "Ketones: DKA, starvation, alcoholic ketoacidosis",
                    "Protein: glomerulonephritis, diabetic nephropathy, pre-eclampsia, fever",
                    "Blood: UTI, stone, trauma, malignancy, glomerular disease",
                    "WBC casts: pyelonephritis",
                    "RBC casts: glomerulonephritis",
                    "Crystals: stone risk, drug crystals (sulfa, acyclovir)"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("Clean-catch technique reduces contamination — instruct on cleansing and midstream collection.", citationIDs: ["openrn_labs2"]),
            AttributedBullet("Send within 1 hour of collection or refrigerate — bacteria multiply at room temperature.", citationIDs: ["openrn_labs2"]),
            AttributedBullet("Asymptomatic bacteriuria in elderly is often NOT treated — avoid unnecessary antibiotics.", citationIDs: ["cdc_lab_ref"])
        ],
        watchFor: [
            AttributedBullet("Foul-smelling urine + AMS in elderly — UTI is a common cause of acute confusion.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Pre-eclampsia: HTN + proteinuria after 20 weeks gestation; severe features warrant hospitalization.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2, cdcLabRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Blood Culture

public enum BloodCultureSample {
    public static let entry: LabEntry = LabEntry(
        id: "blood-culture",
        title: "Blood Culture",
        subtitle: "Aerobic + anaerobic bottles · sepsis workup",
        specimen: "Two sets (aerobic + anaerobic) from two separate sites",
        nclexTags: infectionTags,
        referenceRanges: [
            ReferenceRangeRow(value: "No growth (negative)", label: "Normal", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "≥2 sets needed for diagnostic confidence", label: "Specimen requirement", citationIDs: ["openrn_medsurg2"]),
            ReferenceRangeRow(value: "Time to positivity 12–48 hr typical for true bacteremia", label: "Result timing", citationIDs: ["openrn_medsurg2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Positive blood culture",
                summary: "Bacteremia or fungemia. Action depends on organism and clinical context. Single positive with skin flora (CoNS) often contaminant; same organism in two sets supports true infection.",
                nursingActions: [
                    "Notify provider immediately for unexpected positives",
                    "Repeat cultures after 48 hr of effective therapy for clearance documentation",
                    "Antibiotic adjustment per sensitivities (typically available 24–48 hr after growth)",
                    "Source control workup (line removal, source imaging) per provider"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Common true pathogens",
                causes: [
                    "Staphylococcus aureus (MSSA, MRSA)",
                    "Streptococcus species",
                    "E. coli, Klebsiella, Pseudomonas (gram-negatives)",
                    "Enterococcus",
                    "Candida species",
                    "Anaerobes (less common)"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            CauseGroup(
                title: "Common contaminants (especially single set)",
                causes: [
                    "Coagulase-negative Staphylococcus (often)",
                    "Diphtheroids",
                    "Bacillus species (non-anthracis)",
                    "Propionibacterium acnes"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("Draw BEFORE antibiotics whenever possible — antibiotics dramatically reduce yield.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Two sets from TWO DIFFERENT SITES (not from same line) within minutes — improves sensitivity and identifies contamination.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Aseptic technique — chlorhexidine prep, allow to dry, do not re-palpate site.", citationIDs: ["openrn_labs2"]),
            AttributedBullet("Inoculate aerobic bottle FIRST, then anaerobic — air in syringe goes into aerobic.", citationIDs: ["openrn_labs2"])
        ],
        watchFor: [
            AttributedBullet("Sepsis bundle: cultures + lactate + broad-spectrum antibiotics + IV fluids within 1 hour of recognition (CMS/SEP-1).", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Persistent positive cultures despite antibiotics = endocarditis, undrained abscess, line/device infection — escalate workup.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2, cdcLabRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sputum Culture

public enum SputumCultureSample {
    public static let entry: LabEntry = LabEntry(
        id: "sputum-culture",
        title: "Sputum Culture",
        subtitle: "Lower respiratory pathogen identification",
        specimen: "Expectorated sputum (deep cough), induced sputum, or endotracheal aspirate / BAL",
        nclexTags: infectionTags,
        referenceRanges: [
            ReferenceRangeRow(value: "Normal flora only", label: "Negative for pathogens", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "Adequate sample: <10 squamous cells, >25 PMNs per low-power field", label: "Sample quality", citationIDs: ["openrn_medsurg2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Pathogen isolated",
                summary: "Identifies likely cause of pneumonia, bronchitis, or other lower respiratory infection. Sensitivities guide targeted therapy and de-escalation from empiric coverage.",
                nursingActions: [
                    "Match antibiotic to organism and sensitivity per provider",
                    "Reassess with sensitivities (de-escalate broad coverage)",
                    "Continue isolation per organism (e.g., contact precautions for MRSA)"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Common pathogens",
                causes: [
                    "Streptococcus pneumoniae",
                    "Haemophilus influenzae",
                    "Staphylococcus aureus (MSSA, MRSA)",
                    "Pseudomonas aeruginosa (especially CF, structural lung disease, vent)",
                    "Klebsiella pneumoniae",
                    "Mycoplasma / Legionella (atypicals — culture less sensitive; PCR/urinary antigen)"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("Collect early morning sputum after rinsing mouth (do not brush teeth) — better sample.", citationIDs: ["openrn_labs2"]),
            AttributedBullet("Saliva is NOT sputum — coach for deep cough; chest physiotherapy or albuterol can help.", citationIDs: ["openrn_labs2"]),
            AttributedBullet("Send promptly; refrigerate if delay.", citationIDs: ["openrn_labs2"]),
            AttributedBullet("Suspected TB: airborne isolation pending 3 AFB smears (smear-negative does not rule out — culture still needed).", citationIDs: ["cdc_lab_ref"])
        ],
        watchFor: [
            AttributedBullet("Antibiotic stewardship — de-escalate empiric broad coverage to targeted therapy when sensitivities known.", citationIDs: ["cdc_lab_ref"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2, cdcLabRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - C. difficile Toxin / NAAT

public enum CDiffSample {
    public static let entry: LabEntry = LabEntry(
        id: "c-diff-toxin",
        title: "C. difficile Testing",
        subtitle: "Toxin EIA / GDH / NAAT (PCR) on liquid stool",
        specimen: "Liquid (loose, takes shape of container) stool — formed stool not accepted",
        nclexTags: infectionTags,
        referenceRanges: [
            ReferenceRangeRow(value: "Negative (no toxin / no toxin gene detected)", label: "Normal", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "Tested only in patients with ≥3 unformed stools / 24 hr", label: "Testing criterion", citationIDs: ["cdc_lab_ref"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Positive C. diff",
                summary: "Active infection in symptomatic patient. Asymptomatic carriers should NOT be tested (false-positive treatment risk). Severity grading guides oral vancomycin or fidaxomicin choice.",
                nursingActions: [
                    "CONTACT PRECAUTIONS with soap-and-water hand hygiene (alcohol does NOT kill spores)",
                    "Single-patient room or cohort",
                    "DC offending antibiotics if possible",
                    "Initiate oral vancomycin or fidaxomicin per IDSA guideline (concept only)",
                    "Monitor for severe (WBC >15, Cr >1.5×) and fulminant (ileus, megacolon, shock) disease"
                ],
                citationIDs: ["openrn_medsurg2", "cdc_lab_ref"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Risk factors for C. diff",
                causes: [
                    "Recent antibiotic use (clindamycin, fluoroquinolones, cephalosporins, β-lactams)",
                    "PPI use",
                    "Hospitalization or healthcare exposure",
                    "Advanced age",
                    "Immunocompromise",
                    "Inflammatory bowel disease"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("DO NOT test asymptomatic patients or formed stool — high false positive (colonization).", citationIDs: ["cdc_lab_ref"]),
            AttributedBullet("Soap and water hand hygiene — spores are alcohol-resistant.", citationIDs: ["cdc_lab_ref"]),
            AttributedBullet("Bleach-based environmental cleaning of room.", citationIDs: ["cdc_lab_ref"]),
            AttributedBullet("Test of cure NOT recommended — patients can shed toxin/DNA after symptoms resolve.", citationIDs: ["cdc_lab_ref"])
        ],
        watchFor: [
            AttributedBullet("Fulminant C. diff: ileus, toxic megacolon, hypotension, shock — surgical emergency; consider colectomy.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Recurrence (15–25%) common — fidaxomicin or fecal microbiota transplant for multiple recurrences.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, cdcLabRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Vancomycin Trough

public enum VancomycinTroughSample {
    public static let entry: LabEntry = LabEntry(
        id: "vancomycin-trough",
        title: "Vancomycin Trough / AUC",
        subtitle: "Therapeutic drug monitoring",
        specimen: "Serum (timed)",
        nclexTags: pharmTags,
        referenceRanges: [
            ReferenceRangeRow(value: "Trough 10–20 mcg/mL (most uses)", label: "Therapeutic", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "AUC 400–600 mg·hr/L (preferred per IDSA 2020)", label: "Therapeutic AUC target (severe MRSA)", citationIDs: ["openrn_medsurg2"]),
            ReferenceRangeRow(value: "Trough >20 mcg/mL", label: "Supratherapeutic — nephrotoxicity risk", citationIDs: ["openrn_medsurg2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Supratherapeutic trough",
                summary: "Increased nephrotoxicity (and ototoxicity at very high levels). Hold dose and reassess interval; recheck level.",
                nursingActions: [
                    "Hold next dose; recheck level per pharmacy/protocol",
                    "Assess renal function (BUN/creatinine, urine output)",
                    "Pharmacy adjusts dose/interval to target",
                    "Monitor for AKI"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Subtherapeutic trough",
                summary: "Inadequate concentration; risk of treatment failure. Pharmacy adjusts dose upward; rule out collection-timing error first.",
                nursingActions: [
                    "Verify timing — trough should be within 30 minutes BEFORE the next dose",
                    "Pharmacy increases dose or shortens interval",
                    "Recheck after appropriate steady state"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of supratherapeutic levels",
                causes: [
                    "Renal impairment (most common)",
                    "Concurrent nephrotoxins (NSAIDs, aminoglycosides, contrast)",
                    "Volume depletion",
                    "Drug-drug interactions reducing clearance"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("Trough timing: draw within 30 minutes BEFORE the 4th dose (steady state) and before any subsequent change.", citationIDs: ["openrn_labs2"]),
            AttributedBullet("Document infusion-related red man syndrome (flushing, pruritus during infusion) — slow infusion to ≥60 min, premedicate with antihistamine; not a true allergy.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Monitor renal function 2–3× weekly; daily in critically ill or unstable.", citationIDs: ["openrn_medsurg2"])
        ],
        watchFor: [
            AttributedBullet("Acute kidney injury — trend creatinine and urine output; consider switching to alternative agent if AKI develops.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Ototoxicity — rare; ringing in ears or hearing loss should prompt reassessment.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Digoxin Level

public enum DigoxinLevelSample {
    public static let entry: LabEntry = LabEntry(
        id: "digoxin-level",
        title: "Digoxin Level",
        subtitle: "Therapeutic drug monitoring",
        specimen: "Serum (drawn 6–8 hr post-dose, or just before next dose)",
        nclexTags: pharmTags,
        referenceRanges: [
            ReferenceRangeRow(value: "0.5–2.0 ng/mL", label: "Therapeutic (broad)", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "0.5–0.9 ng/mL", label: "Heart failure target (better outcomes)", citationIDs: ["openrn_medsurg2"]),
            ReferenceRangeRow(value: ">2.0 ng/mL", label: "Toxic", citationIDs: ["openrn_labs2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Toxic digoxin level",
                summary: "Toxicity can occur at therapeutic levels with hypokalemia, hypomagnesemia, or hypercalcemia. Symptoms: anorexia, nausea, visual halos, confusion, any new arrhythmia.",
                nursingActions: [
                    "Hold digoxin; obtain ECG and BMP (K, Mg, Ca)",
                    "Replace electrolytes as needed (especially K and Mg)",
                    "Severe toxicity (life-threatening arrhythmia, K >5, level >10–15 ng/mL): digoxin immune Fab (DigiFab) per provider"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated digoxin levels",
                causes: [
                    "Renal impairment (most common — long half-life extends with reduced clearance)",
                    "Drug interactions (amiodarone, verapamil, quinidine, clarithromycin)",
                    "Hypokalemia (potentiates effect at any level)",
                    "Dehydration",
                    "Recent dose increase or loading"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("Trough timing matters — draw 6–8 hr after dose, ideally just before next dose.", citationIDs: ["openrn_labs2"]),
            AttributedBullet("Always interpret with K, Mg, renal function, and ECG.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Apical pulse for full minute before each dose; hold and notify if HR <60 (adult).", citationIDs: ["openrn_medsurg2"])
        ],
        watchFor: [
            AttributedBullet("New arrhythmia in patient on digoxin — assume toxicity until proven otherwise.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Yellow/green visual halos or anorexia — early toxicity signs.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Lipid Panel

public enum LipidPanelSample {
    public static let entry: LabEntry = LabEntry(
        id: "lipid-panel",
        title: "Lipid Panel",
        subtitle: "Total cholesterol · LDL · HDL · triglycerides",
        specimen: "Serum (fasting traditional; non-fasting acceptable for screening)",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .perfusion),
        referenceRanges: [
            ReferenceRangeRow(value: "Total cholesterol <200 mg/dL", label: "Desirable", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "LDL <100 mg/dL (general); <70 in established CV disease", label: "Desirable", citationIDs: ["openrn_medsurg2"]),
            ReferenceRangeRow(value: "HDL ≥40 (men) / ≥50 (women) mg/dL", label: "Desirable", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "Triglycerides <150 mg/dL", label: "Normal", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "TG >500 mg/dL", label: "Pancreatitis risk; treat", citationIDs: ["openrn_medsurg2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated LDL or low HDL",
                summary: "ASCVD risk factor. Statin therapy decision based on 10-year risk, established disease, diabetes, age, and LDL level.",
                nursingActions: [
                    "Lifestyle counseling (diet, exercise, smoking cessation, weight)",
                    "Statin therapy per ASCVD risk per provider",
                    "Recheck 4–12 weeks after change; then 6–12 months once stable"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Severe hypertriglyceridemia (>500)",
                summary: "Pancreatitis risk; treat with fibrate, omega-3, lifestyle, glycemic control if diabetic.",
                nursingActions: [
                    "Investigate secondary causes — uncontrolled diabetes, alcohol, hypothyroidism, drugs",
                    "Acute pancreatitis: NPO, IV fluids, pain control, monitor lipase"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of dyslipidemia",
                causes: [
                    "Genetic (familial hypercholesterolemia)",
                    "Diet, obesity, sedentary lifestyle",
                    "Diabetes (atherogenic dyslipidemia)",
                    "Hypothyroidism (raises LDL)",
                    "Nephrotic syndrome",
                    "Drugs: thiazides, β-blockers, atypical antipsychotics, steroids, cyclosporine"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("Fasting (9–12 hr) traditionally requested for triglycerides; non-fasting acceptable for total/HDL/LDL screening.", citationIDs: ["openrn_labs2"]),
            AttributedBullet("Counsel on Mediterranean diet, regular exercise, smoking cessation as foundation.", citationIDs: ["openrn_medsurg2"])
        ],
        watchFor: [
            AttributedBullet("Statin myopathy — muscle pain or weakness; check CK; switch agent or reduce dose.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Statin-related new-onset diabetes is well-described but small effect — benefits typically outweigh.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ferritin / Iron Studies

public enum FerritinSample {
    public static let entry: LabEntry = LabEntry(
        id: "ferritin",
        title: "Ferritin & Iron Studies",
        subtitle: "Ferritin · serum iron · TIBC · transferrin saturation",
        specimen: "Serum",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        referenceRanges: [
            ReferenceRangeRow(value: "Ferritin: M 24–336 · F 11–307 ng/mL", label: "Normal", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "Serum iron: 50–170 mcg/dL", label: "Normal", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "TIBC: 240–450 mcg/dL", label: "Normal", citationIDs: ["openrn_labs2"]),
            ReferenceRangeRow(value: "Transferrin saturation: 20–50%", label: "Normal", citationIDs: ["openrn_labs2"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Iron deficiency anemia",
                summary: "Low ferritin (<30, definitely <15) is the most specific marker. Pattern: low Fe, high TIBC, low transferrin sat. Microcytic hypochromic anemia.",
                nursingActions: [
                    "Investigate source — menstruation, GI loss (occult blood, colonoscopy in adult men and post-menopausal women)",
                    "Oral iron replacement (preferred ferrous sulfate or every-other-day dosing per recent evidence)",
                    "IV iron for malabsorption, intolerance, or severe deficiency"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated ferritin",
                summary: "Acute phase reactant — rises with inflammation, infection, malignancy. Marked elevation (>1000) suggests hemochromatosis, hemophagocytic lymphohistiocytosis, or significant inflammation.",
                nursingActions: [
                    "Interpret in inflammatory context — paired with CRP, ESR",
                    "Investigate hemochromatosis if persistently elevated without inflammation (transferrin sat >45%, genetic testing)"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of low ferritin (iron deficiency)",
                causes: [
                    "Menstrual or pregnancy losses",
                    "GI bleeding (occult — colonic malignancy, peptic ulcer)",
                    "Poor dietary intake (vegan, malnutrition)",
                    "Malabsorption (celiac, gastric bypass, IBD)"
                ],
                citationIDs: ["openrn_medsurg2"]
            ),
            CauseGroup(
                title: "Causes of elevated ferritin",
                causes: [
                    "Inflammation, infection, malignancy (acute phase)",
                    "Hereditary hemochromatosis",
                    "Repeated transfusions",
                    "Liver disease",
                    "Hemophagocytic lymphohistiocytosis (HLH — markedly elevated)"
                ],
                citationIDs: ["openrn_medsurg2"]
            )
        ],
        nursingActions: [
            AttributedBullet("Take oral iron between meals (peak absorption); vitamin C enhances absorption.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("Counsel on side effects — dark stools (expected), constipation, GI upset; alternate-day dosing improves tolerance.", citationIDs: ["openrn_medsurg2"])
        ],
        watchFor: [
            AttributedBullet("New iron deficiency anemia in adult man or post-menopausal woman → COLON CANCER until proven otherwise; refer for colonoscopy.", citationIDs: ["openrn_medsurg2"]),
            AttributedBullet("IV iron infusion: monitor for hypersensitivity, especially first dose; resuscitation equipment available.", citationIDs: ["openrn_medsurg2"])
        ],
        citations: [openrnLabs2, openrnMedSurg2, openstaxLabs2],
        lastSourceFidelityReview: "2026-05-04"
    )
}
