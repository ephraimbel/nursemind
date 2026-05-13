import Foundation

// Curator-model lab entries (round 9 expansion — peds-specific labs).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax Clinical Nursing Skills
// (CC BY 4.0 with AI restriction), CDC + AAP newborn screening + lead surveillance concept citations.

private let openrnLabsR9 = CitationSource(
    id: "openrn_labs_round9",
    shortName: "Open RN Health Alterations / Pediatric Nursing — peds labs",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=newborn+pediatric+sweat+lead",
    lastRetrieved: "2026-05-04"
)
private let openstaxLabsR9 = CitationSource(
    id: "openstax_labs_round9",
    shortName: "OpenStax Clinical Nursing Skills — Pediatric / Adult Lab Values",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)
private let cdcLabsR9 = CitationSource(
    id: "cdc_labs_round9",
    shortName: "CDC newborn screening + lead exposure prevention",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/nbs/index.html",
    lastRetrieved: "2026-05-04"
)
private let cffConceptR9 = CitationSource(
    id: "cff_concept_round9",
    shortName: "Cystic Fibrosis Foundation diagnostic guidelines (concept citation)",
    publisher: "Cystic Fibrosis Foundation",
    license: .factCitationOnly,
    url: "https://www.cff.org/medical-professionals/cf-care-guidelines",
    lastRetrieved: "2026-05-04"
)

private let pedsLabR9 = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .safety)
private let cellularLabR9 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation)

// MARK: - Sweat Chloride Test

public enum SweatChlorideSample {
    public static let entry: LabEntry = LabEntry(
        id: "sweat-chloride",
        title: "Sweat Chloride Test",
        subtitle: "Quantitative pilocarpine iontophoresis · cystic fibrosis diagnosis",
        specimen: "Sweat collected via Macroduct or Wescor system after pilocarpine iontophoresis",
        nclexTags: cellularLabR9,
        referenceRanges: [
            ReferenceRangeRow(value: "≥60 mmol/L — diagnostic of CF (any age)", label: "Diagnostic per CF Foundation", citationIDs: ["cff_concept_round9"]),
            ReferenceRangeRow(value: "30–59 mmol/L — intermediate; further evaluation (genetic testing) needed", label: "Intermediate", citationIDs: ["cff_concept_round9"]),
            ReferenceRangeRow(value: "<30 mmol/L (≤6 mo) or <40 mmol/L (>6 mo) — CF unlikely", label: "Normal", citationIDs: ["cff_concept_round9"]),
            ReferenceRangeRow(value: "Adequate sweat volume required (typically ≥75 mg, varies by method)", label: "Sample adequacy", citationIDs: ["openrn_labs_round9"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Positive sweat chloride (≥60 mmol/L)",
                summary: "Diagnostic for cystic fibrosis. Confirm with second sweat test on a different day if first was the initial screen. Genetic testing for CFTR mutations supports the diagnosis and informs treatment (CFTR-modulator eligibility).",
                nursingActions: [
                    "Coordinate referral to accredited CF center for confirmatory workup, multidisciplinary care, and CFTR mutation analysis",
                    "Family genetic counseling — autosomal recessive; sibling testing per primary source",
                    "Begin nutrition (pancreatic enzymes, ADEK vitamins) and pulmonary care planning"
                ],
                citationIDs: ["cff_concept_round9"]
            ),
            InterpretationTier(
                severity: .normal,
                label: "Intermediate sweat chloride (30–59 mmol/L)",
                summary: "Possible CFTR-related disorder; not diagnostic alone. Requires CFTR genotyping and CF-center evaluation per primary source.",
                nursingActions: [
                    "Coordinate CFTR mutation analysis",
                    "CF-center referral for assessment of CFTR-related metabolic syndrome (CRMS) per primary source",
                    "Family education on follow-up requirements"
                ],
                citationIDs: ["cff_concept_round9"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of altered sweat chloride",
                causes: [
                    "TRUE positive — CF (CFTR dysfunction)",
                    "Other causes of elevated sweat chloride — adrenal insufficiency, hypothyroidism, malnutrition, ectodermal dysplasia, glycogen storage disease type 1, fucosidosis, eczema",
                    "Inadequate sample (low sweat volume) — repeat test"
                ],
                citationIDs: ["openrn_labs_round9"]
            )
        ],
        nursingActions: [
            AttributedBullet("Newborn screening for CF (immunoreactive trypsinogen / IRT or DNA) is the entry point in most U.S. states; sweat chloride confirms per primary source.", citationIDs: ["cff_concept_round9"]),
            AttributedBullet("Pre-test — well-hydrated infant / child; coordinate with accredited CF center.", citationIDs: ["openrn_labs_round9"]),
            AttributedBullet("Pilocarpine iontophoresis is non-invasive; child may feel mild warmth at electrode site.", citationIDs: ["openrn_labs_round9"])
        ],
        watchFor: [
            AttributedBullet("False-negative — edema, severe dehydration, certain rare CFTR mutations may produce normal results.", citationIDs: ["openrn_labs_round9"]),
            AttributedBullet("False-positive — see causes above.", citationIDs: ["openrn_labs_round9"]),
            AttributedBullet("Always interpret in clinical and genetic context; CF-center expertise is essential.", citationIDs: ["openrn_labs_round9"])
        ],
        citations: [openrnLabsR9, openstaxLabsR9, cffConceptR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Newborn Metabolic Screen

public enum NewbornScreenSample {
    public static let entry: LabEntry = LabEntry(
        id: "newborn-metabolic-screen",
        title: "Newborn Metabolic Screen",
        subtitle: "State-mandated panel · 24–48 hr after birth · Guthrie / filter-paper card",
        specimen: "Capillary blood (heel stick) on filter-paper card (Guthrie card)",
        nclexTags: pedsLabR9,
        referenceRanges: [
            ReferenceRangeRow(value: "Per state — typical panel screens 30–50+ disorders including metabolic, endocrine, hematologic, immune", label: "State-specific panel", citationIDs: ["cdc_labs_round9"]),
            ReferenceRangeRow(value: "Optimal collection: 24–48 hours after birth (after first feeds for amino-acid disorders); within 7 days max", label: "Timing", citationIDs: ["openrn_labs_round9"]),
            ReferenceRangeRow(value: "Repeat per state protocol if collected <24 hr or in preterm / transferred infants", label: "Repeat criteria", citationIDs: ["openrn_labs_round9"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Positive newborn screen result",
                summary: "Notification typically comes from state lab to provider / hospital. Most positive screens are FALSE POSITIVES — but timely confirmatory testing is essential to identify treatable disorders before symptoms develop.",
                nursingActions: [
                    "Coordinate immediate confirmatory testing per protocol (specific to the disorder)",
                    "Refer to specialty center (metabolic, endocrine, hematology, immunology) for confirmation and management",
                    "Family counseling — most are false positives, but follow-through is critical"
                ],
                citationIDs: ["cdc_labs_round9"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Conditions commonly screened (varies by state)",
                causes: [
                    "Phenylketonuria (PKU)",
                    "Congenital hypothyroidism",
                    "Galactosemia",
                    "Maple syrup urine disease",
                    "Sickle cell disease",
                    "Cystic fibrosis (IRT or DNA)",
                    "Congenital adrenal hyperplasia (CAH)",
                    "Biotinidase deficiency",
                    "Severe combined immunodeficiency (SCID)",
                    "Critical congenital heart disease (CCHD) — pulse-ox screening (not blood)",
                    "Hearing screen (auditory)"
                ],
                citationIDs: ["cdc_labs_round9"]
            )
        ],
        nursingActions: [
            AttributedBullet("Collect at 24–48 hours after birth (after milk feeds have begun for amino-acid disorders) per primary source.", citationIDs: ["openrn_labs_round9"]),
            AttributedBullet("Use proper heel-stick technique — lateral or medial heel surface; allow blood to drop onto card without smearing or stacking spots per primary source.", citationIDs: ["openrn_labs_round9"]),
            AttributedBullet("Air-dry filter card horizontally; do not stack until dry; protect from humidity and heat; mail / send promptly per state requirements.", citationIDs: ["openrn_labs_round9"]),
            AttributedBullet("Document collection time, infant age (in hours), feeding status, transfusion / TPN history (affect interpretation).", citationIDs: ["openrn_labs_round9"]),
            AttributedBullet("Repeat per state protocol if first sample inadequate, premature collection, preterm infant, or NICU complexity.", citationIDs: ["openrn_labs_round9"])
        ],
        watchFor: [
            AttributedBullet("False-negative if collected too early (<24 hr — TSH and amino acids may not have risen) or after blood transfusion (washes away markers).", citationIDs: ["openrn_labs_round9"]),
            AttributedBullet("Family and PCP follow-up is essential — communicate result expectations and ensure birthing center hand-off includes screening status.", citationIDs: ["openrn_labs_round9"]),
            AttributedBullet("Hearing screen and CCHD pulse-ox screen are typically performed before discharge; document.", citationIDs: ["openrn_labs_round9"])
        ],
        citations: [openrnLabsR9, openstaxLabsR9, cdcLabsR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Lead Level

public enum LeadLevelSample {
    public static let entry: LabEntry = LabEntry(
        id: "lead-level",
        title: "Blood Lead Level (Pediatric)",
        subtitle: "Capillary screen → venous confirm · CDC reference value 3.5 mcg/dL",
        specimen: "Capillary or venous whole blood (lavender EDTA) — VENOUS preferred for confirmation",
        nclexTags: pedsLabR9,
        referenceRanges: [
            ReferenceRangeRow(value: "Reference value: ≥3.5 mcg/dL (CDC, 2021 update)", label: "CDC reference value", citationIDs: ["cdc_labs_round9"]),
            ReferenceRangeRow(value: "≥45 mcg/dL — chelation therapy considered", label: "Chelation threshold", citationIDs: ["openrn_labs_round9"]),
            ReferenceRangeRow(value: "≥70 mcg/dL — hospitalize and chelate; encephalopathy risk", label: "Critical", citationIDs: ["openrn_labs_round9"]),
            ReferenceRangeRow(value: "Capillary screen → CONFIRM with venous if elevated per primary source", label: "Confirmation rule", citationIDs: ["cdc_labs_round9"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Lead level ≥3.5 mcg/dL (CDC reference value)",
                summary: "Indicates exposure that warrants intervention. Below 45, focus on environmental remediation, nutrition, and follow-up testing. Above 45, consider chelation per primary source.",
                nursingActions: [
                    "Confirm capillary screen with VENOUS sample within timeframe per state guidance",
                    "Environmental investigation — lead paint, soil, water (older homes built pre-1978), occupational exposure of caregivers, traditional remedies, imported toys / cosmetics",
                    "Nutritional counseling — iron + calcium-rich diet REDUCES lead absorption per primary source",
                    "Coordinate with public health, follow-up testing, developmental screening"
                ],
                citationIDs: ["cdc_labs_round9"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Lead level ≥70 mcg/dL OR symptomatic",
                summary: "Symptoms — lethargy, ataxia, seizures, encephalopathy, abdominal pain, anorexia. Hospitalize, isolate from source, chelate (BAL + EDTA, then succimer); seizure precautions, monitor renal function per primary source.",
                nursingActions: [
                    "Hospitalize; remove from exposure source",
                    "Chelation per protocol; monitor for adverse effects (hypocalcemia, nephrotoxicity)",
                    "Neurologic monitoring; seizure precautions",
                    "Public health reporting (mandatory in most jurisdictions)"
                ],
                citationIDs: ["openrn_labs_round9"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Sources of lead exposure",
                causes: [
                    "Lead-based paint and dust in pre-1978 housing",
                    "Lead-contaminated water (lead service lines, solder)",
                    "Lead-contaminated soil (industrial sites, exterior paint)",
                    "Imported toys, jewelry, cosmetics, traditional remedies (greta, azarcón)",
                    "Caregiver occupational exposure (battery work, construction, smelting, ammunition)",
                    "Foreign-born children may have higher baseline exposure"
                ],
                citationIDs: ["cdc_labs_round9"]
            )
        ],
        nursingActions: [
            AttributedBullet("Risk-based screening per state at age 1 and 2 (or 3–6 if not previously screened); universal in some states/Medicaid populations per primary source.", citationIDs: ["cdc_labs_round9"]),
            AttributedBullet("Capillary collection technique avoids contamination — clean skin thoroughly; use trace-element-free supplies; confirm elevated capillary with venous.", citationIDs: ["openrn_labs_round9"]),
            AttributedBullet("Counsel — wash hands frequently, wash floors / windowsills with damp method, hot tap water only after running cold ≥30 sec, avoid imported pottery for food storage, iron and calcium-rich diet per primary source.", citationIDs: ["cdc_labs_round9"]),
            AttributedBullet("Coordinate developmental screening at every visit — lead is a neurodevelopmental toxin; effects can be subtle.", citationIDs: ["openrn_labs_round9"])
        ],
        watchFor: [
            AttributedBullet("NO SAFE LEVEL of lead exposure has been identified per CDC; the reference value reflects the upper 2.5% of US children, NOT a safety threshold.", citationIDs: ["cdc_labs_round9"]),
            AttributedBullet("Long-term effects — IQ reduction, attention / behavior issues, hypertension in adulthood; even \"low\" levels matter.", citationIDs: ["openrn_labs_round9"]),
            AttributedBullet("Pregnant women — lead crosses placenta; counsel about exposure history.", citationIDs: ["openrn_labs_round9"])
        ],
        citations: [openrnLabsR9, openstaxLabsR9, cdcLabsR9],
        lastSourceFidelityReview: "2026-05-04"
    )
}
