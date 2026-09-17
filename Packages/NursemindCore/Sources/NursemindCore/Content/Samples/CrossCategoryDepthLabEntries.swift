import Foundation

private let cc_depth_cystatin = CitationSource(
    id: "cc_depth_cystatin",
    shortName: "NIDDK — Estimated GFR calculators",
    detail: "May 2024. Race-free combined creatinine–cystatin C estimation and interpretation near clinical decision values. Original federal educational prose only; linked third-party references excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/professionals/clinical-tools-patient-management/kidney-disease/laboratory-evaluation/estimated-gfr-calculators",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_gfr_accuracy = CitationSource(
    id: "cc_depth_gfr_accuracy",
    shortName: "NIDDK — Factors affecting eGFR accuracy",
    detail: "May 2025. Estimate uncertainty, biomarker variability, population differences and longitudinal interpretation. Original federal educational prose only; linked third-party references excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/research-funding/research-programs/kidney-clinical-research-epidemiology/laboratory/factors-affecting-egfr-accuracy",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_lab_context = CitationSource(
    id: "cc_depth_lab_context",
    shortName: "MedlinePlus — Understanding lab results",
    detail: "Reference intervals, units, preparation and interpretation limits. Original NLM medical-test prose; no A.D.A.M., AHFS or third-party bibliography content used. Source-fidelity review is not independent clinical approval.",
    publisher: "National Library of Medicine; NIH",
    license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/how-to-understand-your-lab-results/",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_osmolality = CitationSource(
    id: "cc_depth_osmolality",
    shortName: "MedlinePlus — Osmolality tests",
    detail: "Urine testing, paired serum interpretation, collection, preparation and qualitative associations; no unsourced interval. Original NLM medical-test prose; no A.D.A.M., AHFS or third-party bibliography content used. Source-fidelity review is not independent clinical approval.",
    publisher: "National Library of Medicine; NIH",
    license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/osmolality-tests/",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_uacr = CitationSource(
    id: "cc_depth_uacr",
    shortName: "NIDDK — Assess urine albumin",
    detail: "March 2012. Spot UACR, specimen choice and monitoring; older source, used for test principles rather than contemporary treatment algorithms. Original federal educational prose only; linked third-party references excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/professionals/clinical-tools-patient-management/kidney-disease/identify-manage-patients/evaluate-ckd/assess-urine-albumin",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_protein_urine = CitationSource(
    id: "cc_depth_protein_urine",
    shortName: "MedlinePlus — Protein in urine",
    detail: "Purpose, transient proteinuria and repeat testing. Original NLM article only; bibliography excluded. Original NLM medical-test prose; no A.D.A.M., AHFS or third-party bibliography content used. Source-fidelity review is not independent clinical approval.",
    publisher: "National Library of Medicine; NIH",
    license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/protein-in-urine/",
    lastRetrieved: "2026-09-17"
)

public enum CCDepthCystatinCSample {
    public static let entry = LabEntry(
        id: "cystatin-c",
        title: "Cystatin C",
        subtitle: "Serum biomarker used with creatinine to estimate GFR",
        specimen: "Serum",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .elimination),
        referenceRanges: [
            ReferenceRangeRow(value: "Use the laboratory’s assay-specific interval", label: "Cystatin C concentration", citationIDs: ["cc_depth_lab_context"])
        ],
        interpretationTiers: [
            InterpretationTier(severity: .normal, label: "Read the concentration and the estimate separately", summary: "Cystatin C can be combined with serum creatinine in an equation to estimate glomerular filtration rate. NIDDK supports the combined approach because it is generally more accurate and less biased than creatinine alone. A laboratory concentration and an estimated GFR describe different measurements.", citationIDs: ["cc_depth_cystatin"]),
            InterpretationTier(severity: .low, label: "When estimated GFR is near a decision value", summary: "NIDDK highlights combined creatinine–cystatin C estimation when eGFR is close to a value that affects drug dosing or transplant evaluation. The estimate still has uncertainty; it does not independently establish a diagnosis or a patient-specific dose.", citationIDs: ["cc_depth_cystatin", "cc_depth_gfr_accuracy"])
        ],
        nursingActions: [
            AttributedBullet("Review which equation the laboratory used and whether it includes both markers. NIDDK recommends equations without a race coefficient. When comparing results over time, a change in equation can alter the estimate even without a true change in kidney function.", citationIDs: ["cc_depth_cystatin"]),
            AttributedBullet("Assess trends using the same estimating equation. NIDDK cautions that population-based estimates can be less accurate for an individual; an isolated number deserves interpretation with the clinical picture.", citationIDs: ["cc_depth_gfr_accuracy"]),
            AttributedBullet("Biomarker measurement error, individual metabolism, differences from the equation’s development population and body-surface area can affect accuracy. Discuss a result that does not fit the broader assessment with the treating team.", citationIDs: ["cc_depth_gfr_accuracy"]),
            AttributedBullet("Urine albumin assessment provides additional information about kidney disease alongside eGFR. A cystatin C-based estimate does not replace the ordered urine assessment.", citationIDs: ["cc_depth_cystatin"]),
            AttributedBullet("Reference intervals vary by laboratory, assay, and population. Always verify against your facility's reported reference range. Not for diagnostic decision-making.", citationIDs: ["cc_depth_lab_context"])
        ],
        watchFor: [
            AttributedBullet("Do not interpret a result within the laboratory reference interval as proof that no kidney problem exists. NLM emphasizes that results within an interval can coexist with illness and that symptoms may require further evaluation.", citationIDs: ["cc_depth_lab_context"])
        ],
        citations: [cc_depth_cystatin, cc_depth_gfr_accuracy, cc_depth_lab_context],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CCDepthUrineOsmolalitySample {
    public static let entry = LabEntry(
        id: "urine-osmolality",
        title: "Urine osmolality",
        subtitle: "Urine concentration in the context of fluid balance",
        specimen: "Urine",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes),
        referenceRanges: [
            ReferenceRangeRow(value: "Use the reported reference interval", label: "Interpret with preparation and fluid status", citationIDs: ["cc_depth_lab_context", "cc_depth_osmolality"])
        ],
        interpretationTiers: [
            InterpretationTier(severity: .high, label: "More concentrated urine", summary: "Osmolality describes dissolved-particle concentration. NLM explains that when blood osmolality rises, kidneys normally retain water and urine becomes more concentrated. A high urine value is not a standalone diagnosis.", citationIDs: ["cc_depth_osmolality"]),
            InterpretationTier(severity: .low, label: "More dilute urine", summary: "When blood osmolality falls as the water content rises, urine normally becomes more dilute. Urine results are often considered with serum osmolality, symptoms, history and other blood tests.", citationIDs: ["cc_depth_osmolality"])
        ],
        commonCauses: [
            CauseGroup(title: "Conditions considered with abnormal urine osmolality", causes: ["Dehydration or overhydration", "Heart failure", "Liver disease", "Kidney disease"], citationIDs: ["cc_depth_osmolality"])
        ],
        nursingActions: [
            AttributedBullet("Confirm that the sample ordered is urine, not serum. Urine osmolality commonly complements serum testing and may help evaluate unusually high or low urine output.", citationIDs: ["cc_depth_osmolality"]),
            AttributedBullet("Follow the supplied collection instructions. When a clean-catch sample is requested, avoid touching the inside of the container, use the provided cleansing method, collect the middle portion and return the closed container as instructed.", citationIDs: ["cc_depth_osmolality"]),
            AttributedBullet("Preparation is test-specific. Follow the ordering clinician’s instructions about food or fluids; the source does not establish routine water restriction for every urine osmolality sample.", citationIDs: ["cc_depth_osmolality"]),
            AttributedBullet("The clinical history may include thirst, nausea, vomiting, headache, confusion or fatigue. The team interprets these observations alongside fluid balance and the paired laboratory findings.", citationIDs: ["cc_depth_osmolality"]),
            AttributedBullet("Reference intervals vary by laboratory, assay, and population. Always verify against your facility's reported reference range. Not for diagnostic decision-making.", citationIDs: ["cc_depth_lab_context"])
        ],
        watchFor: [
            AttributedBullet("A urine result alone cannot distinguish all causes of a fluid imbalance. NLM lists overlapping conditions and stresses the role of symptoms, medical history and other tests in interpretation.", citationIDs: ["cc_depth_osmolality"]),
            AttributedBullet("Confusion, seizures or breathing difficulty are among concerning symptoms described in the source’s fluid-imbalance and poisoning assessment. Clinical evaluation must not depend on a urine result alone.", citationIDs: ["cc_depth_osmolality", "cc_depth_lab_context"])
        ],
        citations: [cc_depth_lab_context, cc_depth_osmolality],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum UPCRSample {
    public static let entry = LabEntry(
        id: "urine-protein-creatinine",
        title: "Urine protein and albumin ratios (UPCR / UACR)",
        subtitle: "Separate total protein assessment from albumin-specific testing",
        specimen: "Spot urine; collection method depends on the ordered test",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .elimination),
        referenceRanges: [
            ReferenceRangeRow(value: "Use the laboratory’s reported interval and units", label: "Total urine protein / protein-to-creatinine result", citationIDs: ["cc_depth_protein_urine", "cc_depth_lab_context"]),
            ReferenceRangeRow(value: "UACR >30 mg/g", label: "Abnormal urine albumin by the cited NIDDK source", citationIDs: ["cc_depth_uacr"])
        ],
        interpretationTiers: [
            InterpretationTier(severity: .high, label: "Identify the analyte before interpreting the ratio", summary: "UACR compares urine albumin with urine creatinine and corrects for differences in urine concentration. Total urine protein testing and albumin-specific testing are distinct; an albumin cutoff must not be applied to a total-protein result.", citationIDs: ["cc_depth_uacr", "cc_depth_protein_urine"]),
            InterpretationTier(severity: .high, label: "Persistent versus transient findings", summary: "Protein can rise temporarily with strenuous exercise, dehydration, diet, stress or pregnancy. Repeat testing may help determine whether it remains elevated; a single high result does not identify the cause.", citationIDs: ["cc_depth_protein_urine"]),
            InterpretationTier(severity: .normal, label: "Follow the trend in context", summary: "NIDDK describes stable or falling albuminuria as a possible sign of treatment response and increasing albuminuria as a possible sign of progression. Interpret the trend with the rest of the kidney assessment.", citationIDs: ["cc_depth_uacr"])
        ],
        nursingActions: [
            AttributedBullet("For UACR, NIDDK prefers a first-morning specimen but accepts a random specimen when that is unavailable. Routine urine-albumin assessment does not require a 24-hour collection.", citationIDs: ["cc_depth_uacr"]),
            AttributedBullet("Record the test name and units with the result. Ratios reported in mg/g, raw urine concentrations and total daily excretion are not the same reported measurement. Verify the actual laboratory report before comparing values.", citationIDs: ["cc_depth_uacr", "cc_depth_lab_context"]),
            AttributedBullet("Review symptoms and conditions that affect interpretation. Proteinuria can precede symptoms; diabetes, hypertension, heart disease and family kidney history are reasons for closer kidney assessment.", citationIDs: ["cc_depth_protein_urine"]),
            AttributedBullet("Persistent urine protein usually prompts further evaluation to determine the cause. The quantity alone cannot establish a specific kidney diagnosis or choose treatment.", citationIDs: ["cc_depth_protein_urine"]),
            AttributedBullet("Reference intervals vary by laboratory, assay, and population. Always verify against your facility's reported reference range. Not for diagnostic decision-making.", citationIDs: ["cc_depth_lab_context"])
        ],
        watchFor: [
            AttributedBullet("A negative protein test means excessive protein was not detected in that sample; it does not guarantee overall health. Results within a reference interval may still need follow-up when symptoms or other findings are concerning.", citationIDs: ["cc_depth_protein_urine", "cc_depth_lab_context"])
        ],
        citations: [cc_depth_uacr, cc_depth_lab_context, cc_depth_protein_urine],
        lastSourceFidelityReview: "2026-09-17"
    )
}
