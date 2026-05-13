import Foundation

// Curator-model lab entries (round 13 expansion — Graves' antibody, paraneoplastic, coagulation).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax (CC BY 4.0 with AI restriction),
// ATA / Endocrine Society / NCCN concept citations.

private let openrnLabsR13 = CitationSource(
    id: "openrn_labs_round13",
    shortName: "Open RN Health Alterations — endocrine + onc + coag labs",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=TRAb+PTHrP+fibrinogen",
    lastRetrieved: "2026-05-04"
)
private let openstaxLabsR13 = CitationSource(
    id: "openstax_labs_round13",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)
private let specialtyLabsR13 = CitationSource(
    id: "specialty_labs_round13",
    shortName: "ATA / Endo / NCCN guidelines (concept citation)",
    publisher: "ATA · Endo Society · NCCN",
    license: .factCitationOnly,
    url: "https://www.thyroid.org/professionals/ata-professional-guidelines/",
    lastRetrieved: "2026-05-04"
)

private let endoLabR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation)
private let oncoLabR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation)
private let coagLabR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .clottingHemostasis)

// MARK: - TRAb / TSI

public enum TRAbSample {
    public static let entry: LabEntry = LabEntry(
        id: "trab-tsi",
        title: "TSH-Receptor Antibody (TRAb / TSI)",
        subtitle: "Graves' disease confirmatory · differentiate causes of hyperthyroidism",
        specimen: "Serum (gold-top SST)",
        nclexTags: endoLabR13,
        referenceRanges: [
            ReferenceRangeRow(value: "<1.75 IU/L (negative; assay-specific)", label: "Reference (typical)", citationIDs: ["openstax_labs_round13"]),
            ReferenceRangeRow(value: "POSITIVE — supports Graves' disease", label: "Positive", citationIDs: ["specialty_labs_round13"]),
            ReferenceRangeRow(value: "TSI specifically detects STIMULATING antibody (vs blocking)", label: "TSI vs total TRAb", citationIDs: ["openrn_labs_round13"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Positive TRAb / TSI",
                summary: "Confirms autoimmune Graves' disease as cause of hyperthyroidism. Distinguishes from toxic multinodular goiter, toxic adenoma, thyroiditis. Higher titers correlate with active disease and ophthalmopathy severity.",
                nursingActions: [
                    "Coordinate antithyroid (methimazole) initiation; β-blocker for symptomatic relief",
                    "Pregnancy — TRAb crosses placenta; risk of fetal / neonatal hyperthyroidism even if mother controlled; trend per primary source",
                    "Eye exam baseline + during therapy — Graves' ophthalmopathy"
                ],
                citationIDs: ["specialty_labs_round13"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of TRAb positivity",
                causes: [
                    "Graves' disease (primary association)",
                    "First-degree relatives of Graves patients (low-titer, often subclinical)",
                    "Other autoimmune thyroid disease (rare; more often anti-TPO / anti-Tg in Hashimoto)"
                ],
                citationIDs: ["openrn_labs_round13"]
            )
        ],
        nursingActions: [
            AttributedBullet("Useful diagnostic when classic Graves' features absent (no orbitopathy / pretibial myxedema) per primary source.", citationIDs: ["openrn_labs_round13"]),
            AttributedBullet("Trending TRAb during pregnancy in women with Graves history — fetal hyperthyroidism risk; >5× upper limit warrants close monitoring per primary source.", citationIDs: ["specialty_labs_round13"]),
            AttributedBullet("Falling titer during antithyroid therapy may indicate higher chance of remission.", citationIDs: ["openrn_labs_round13"])
        ],
        watchFor: [
            AttributedBullet("Persistently HIGH TRAb after antithyroid course → less likely to remit; consider RAI / surgery per primary source.", citationIDs: ["openrn_labs_round13"]),
            AttributedBullet("Pregnancy — even euthyroid mother with high TRAb can have neonate with hyperthyroidism; pediatric coordination per primary source.", citationIDs: ["openrn_labs_round13"])
        ],
        citations: [openrnLabsR13, openstaxLabsR13, specialtyLabsR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - PTHrP

public enum PTHrPSample {
    public static let entry: LabEntry = LabEntry(
        id: "pthrp",
        title: "Parathyroid Hormone-Related Peptide (PTHrP)",
        subtitle: "Hypercalcemia of malignancy workup · paraneoplastic marker",
        specimen: "Plasma (lavender or gold-top, on ice)",
        nclexTags: oncoLabR13,
        referenceRanges: [
            ReferenceRangeRow(value: "<2.5 pmol/L (typical reference; varies by lab)", label: "Reference", citationIDs: ["openstax_labs_round13"]),
            ReferenceRangeRow(value: "Elevated PTHrP + suppressed PTH + hypercalcemia → humoral hypercalcemia of malignancy", label: "Diagnostic pattern", citationIDs: ["specialty_labs_round13"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated PTHrP",
                summary: "Confirms HUMORAL hypercalcemia of malignancy (~80% of malignancy-related hypercalcemia). Most often associated with squamous cell carcinoma (lung, head/neck), renal cell carcinoma, breast cancer, lymphoma. Distinguishes from primary hyperparathyroidism (which has elevated PTH).",
                nursingActions: [
                    "Coordinate oncology workup if not already known cancer",
                    "Treat hypercalcemia — IV NS, calcitonin, bisphosphonate, denosumab per primary source",
                    "Monitor for cardiac dysrhythmia at very high calcium"
                ],
                citationIDs: ["specialty_labs_round13"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated PTHrP",
                causes: [
                    "Squamous cell carcinoma (lung, head/neck, esophageal, cervical, skin)",
                    "Renal cell carcinoma",
                    "Breast cancer",
                    "Adult T-cell leukemia / lymphoma",
                    "Pregnancy / lactation (physiologic, transient mild elevation)",
                    "Benign familial hypocalciuric hypercalcemia (HFCH — RARE)"
                ],
                citationIDs: ["openrn_labs_round13"]
            )
        ],
        nursingActions: [
            AttributedBullet("Distinguish from primary hyperparathyroidism — PTHrP elevated + PTH SUPPRESSED in malignancy; PTH elevated in primary hyperPTH per primary source.", citationIDs: ["openrn_labs_round13"]),
            AttributedBullet("Trend during cancer therapy — falling PTHrP suggests tumor response.", citationIDs: ["openrn_labs_round13"]),
            AttributedBullet("Pair with vitamin D, PTH, calcium, phosphate for full hypercalcemia workup.", citationIDs: ["openrn_labs_round13"])
        ],
        watchFor: [
            AttributedBullet("HYPERCALCEMIC CRISIS — Ca >14 with AMS / dysrhythmia; ICU + aggressive treatment.", citationIDs: ["openrn_labs_round13"]),
            AttributedBullet("Resistant hypercalcemia despite first-line therapy → denosumab or pegloticase (rare); transition to comfort care if poor prognosis per primary source.", citationIDs: ["openrn_labs_round13"])
        ],
        citations: [openrnLabsR13, openstaxLabsR13, specialtyLabsR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Fibrinogen

public enum FibrinogenSample {
    public static let entry: LabEntry = LabEntry(
        id: "fibrinogen",
        title: "Fibrinogen",
        subtitle: "Coagulation factor I · obstetric hemorrhage + DIC + cirrhosis · cryoprecipitate",
        specimen: "Citrate plasma (light-blue tube)",
        nclexTags: coagLabR13,
        referenceRanges: [
            ReferenceRangeRow(value: "Adult: 200–400 mg/dL (typical)", label: "Reference", citationIDs: ["openstax_labs_round13"]),
            ReferenceRangeRow(value: "Pregnancy: 350–650 mg/dL (physiologic increase)", label: "Pregnancy reference", citationIDs: ["openrn_labs_round13"]),
            ReferenceRangeRow(value: "OB hemorrhage threshold: <200 mg/dL warrants cryoprecipitate per primary source", label: "OB threshold", citationIDs: ["specialty_labs_round13"]),
            ReferenceRangeRow(value: "Critical low: <100 mg/dL (severe risk of bleeding)", label: "Critical", citationIDs: ["openrn_labs_round13"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Hypofibrinogenemia",
                summary: "Significant bleeding risk; common in DIC, massive transfusion, advanced cirrhosis, congenital deficiency, post-cardiopulmonary bypass, postpartum hemorrhage. Replace with CRYOPRECIPITATE (each unit increases fibrinogen by ~5–10 mg/dL in adult) or fibrinogen concentrate per primary source.",
                nursingActions: [
                    "Type and cross; activate massive transfusion protocol if bleeding",
                    "Cryoprecipitate replacement to target ≥150–200 mg/dL in OB / surgical bleeding",
                    "Trend serial fibrinogen; assess clinical response"
                ],
                citationIDs: ["specialty_labs_round13"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Hyperfibrinogenemia",
                summary: "Acute-phase reactant — elevated in inflammation, pregnancy, infection, malignancy, vascular disease. Marker of CV / VTE risk in epidemiologic studies but not clinically actionable in isolation.",
                nursingActions: [
                    "Investigate underlying inflammatory / infectious / malignant cause",
                    "No specific intervention for elevated fibrinogen alone"
                ],
                citationIDs: ["openrn_labs_round13"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of LOW fibrinogen",
                causes: [
                    "DIC (sepsis, malignancy, OB)",
                    "Massive transfusion / dilutional",
                    "Advanced cirrhosis",
                    "Postpartum hemorrhage",
                    "Cardiopulmonary bypass",
                    "Thrombolytic therapy (tPA)",
                    "Congenital afibrinogenemia / dysfibrinogenemia"
                ],
                citationIDs: ["openrn_labs_round13"]
            ),
            CauseGroup(
                title: "Causes of HIGH fibrinogen",
                causes: [
                    "Acute-phase response — infection, inflammation, trauma",
                    "Pregnancy",
                    "Smoking",
                    "Malignancy"
                ],
                citationIDs: ["openrn_labs_round13"]
            )
        ],
        nursingActions: [
            AttributedBullet("In OB hemorrhage — fibrinogen falls FIRST among coagulation factors; serial fibrinogen guides cryoprecipitate replacement per primary source.", citationIDs: ["specialty_labs_round13"]),
            AttributedBullet("In DIC — fibrinogen low, D-dimer high, INR + PTT prolonged, platelets low, schistocytes on smear; treat underlying cause.", citationIDs: ["openrn_labs_round13"]),
            AttributedBullet("Cryoprecipitate dose typically 5–10 units in adult; each unit ~80 mg fibrinogen per primary source.", citationIDs: ["openrn_labs_round13"]),
            AttributedBullet("Pre-procedure hemostasis goal — fibrinogen >100–150 in non-bleeding; >150–200 in bleeding patient.", citationIDs: ["openrn_labs_round13"])
        ],
        watchFor: [
            AttributedBullet("OB hemorrhage — DROP in fibrinogen ≥30% from baseline (or <200 mg/dL) is strong predictor of severe PPH; aggressive replacement per primary source.", citationIDs: ["openrn_labs_round13"]),
            AttributedBullet("Massive transfusion — replenish fibrinogen with cryoprecipitate alongside FFP + platelets to prevent dilutional coagulopathy.", citationIDs: ["openrn_labs_round13"]),
            AttributedBullet("Concomitant thrombosis in DIC — paradoxic clotting can be present even with low fibrinogen.", citationIDs: ["openrn_labs_round13"])
        ],
        citations: [openrnLabsR13, openstaxLabsR13, specialtyLabsR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}
