import Foundation

private let lab_review_ranges_2026 = CitationSource(
    id: "lab_review_ranges_2026", shortName: "Open RN — Health Alterations: Normal Reference Ranges",
    detail: "Ernstmeyer K, Christman E, editors. Health Alterations (2024), Appendix A. Selected adult values; use the reporting laboratory interval. CC BY 4.0; presentation condensed and albumin units converted from g/L to g/dL.",
    publisher: "Open Resources for Nursing", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK613071/", lastRetrieved: "2026-09-17"
)

private let lab_bun = CitationSource(
    id: "lab_bun", shortName: "MedlinePlus — BUN",
    detail: "NLM-authored MedlinePlus medical-test information, paraphrased and condensed by NurseMind. External linked articles and third-party drug/encyclopedia content excluded.",
    publisher: "National Library of Medicine", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/bun-blood-urea-nitrogen/", lastRetrieved: "2026-09-17"
)

private let lab_result_context = CitationSource(
    id: "lab_result_context", shortName: "MedlinePlus — Understanding lab results",
    detail: "NLM-authored MedlinePlus medical-test information, paraphrased and condensed by NurseMind. External linked articles and third-party drug/encyclopedia content excluded.",
    publisher: "National Library of Medicine", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/how-to-understand-your-lab-results/", lastRetrieved: "2026-09-17"
)

private let lab_albumin = CitationSource(
    id: "lab_albumin", shortName: "MedlinePlus — Albumin",
    detail: "NLM-authored MedlinePlus medical-test information, paraphrased and condensed by NurseMind. External linked articles and third-party drug/encyclopedia content excluded.",
    publisher: "National Library of Medicine", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/albumin-blood-test/", lastRetrieved: "2026-09-17"
)

private let lab_aspen_proteins = CitationSource(
    id: "lab_aspen_proteins", shortName: "ASPEN — Visceral proteins and nutrition assessment",
    detail: "ASPEN (2021), Appropriate Use of Visceral Proteins in Nutrition Screening and Assessment. Factual citation and link; original wording, tables, figures and scoring tools are not reproduced.",
    publisher: "American Society for Parenteral and Enteral Nutrition", license: .factCitationOnly,
    url: "https://nutritioncare.org/wp-content/uploads/2024/12/Appropriate-Use-Visceral-Proteins-Nutrition-Screening-Assessment.pdf", lastRetrieved: "2026-09-17"
)

private let lab_bnp = CitationSource(
    id: "lab_bnp", shortName: "MedlinePlus — Natriuretic peptides",
    detail: "NLM-authored MedlinePlus medical-test information, paraphrased and condensed by NurseMind. External linked articles and third-party drug/encyclopedia content excluded.",
    publisher: "National Library of Medicine", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/natriuretic-peptide-tests-bnp-nt-probnp/", lastRetrieved: "2026-09-17"
)

private let lab_lipase = CitationSource(
    id: "lab_lipase", shortName: "MedlinePlus — Lipase",
    detail: "NLM-authored MedlinePlus medical-test information, paraphrased and condensed by NurseMind. External linked articles and third-party drug/encyclopedia content excluded.",
    publisher: "National Library of Medicine", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/lipase-tests/", lastRetrieved: "2026-09-17"
)

private let lab_pct = CitationSource(
    id: "lab_pct", shortName: "MedlinePlus — Procalcitonin",
    detail: "NLM-authored MedlinePlus medical-test information, paraphrased and condensed by NurseMind. External linked articles and third-party drug/encyclopedia content excluded.",
    publisher: "National Library of Medicine", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/procalcitonin-test/", lastRetrieved: "2026-09-17"
)

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
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-03"
)

// MARK: - BUN

public enum BUNSample {
    public static let entry: LabEntry = LabEntry(
        id: "bun",
        title: "BUN (blood urea nitrogen)",
        subtitle: "Serum · kidney function and interpretation limits",
        specimen: "Blood; use the collecting laboratory’s specimen instructions",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes),
        referenceRanges: [
            ReferenceRangeRow(value: "8–21 mg/dL", label: "Example adult interval", citationIDs: ["lab_review_ranges_2026"])
        ],
        interpretationTiers: [
            InterpretationTier(severity: .high, label: "Above the laboratory interval", summary: "Urea nitrogen is produced during protein breakdown and cleared through the kidneys. Elevation can accompany reduced kidney function, but does not establish a cause by itself.",
                nursingActions: ["Review creatinine and estimated GFR alongside BUN.", "Review recent intake, medicines and the clinical reason for testing."], citationIDs: ["lab_bun"])
        ],
        commonCauses: [
            CauseGroup(title: "Higher results may accompany", causes: ["Kidney dysfunction", "Dehydration", "High protein intake", "Burns or certain medicines"], citationIDs: ["lab_bun"]),
            CauseGroup(title: "Lower results may accompany", causes: ["Low protein intake or malnutrition", "Liver disease"], citationIDs: ["lab_bun"])
        ],
        nursingActions: [
            AttributedBullet("Bedside context includes changes in urination, swelling, fatigue, itching and muscle cramps; early kidney disease may have no symptoms. Record the observed findings rather than labeling an isolated value as kidney failure.", citationIDs: ["lab_bun"]),
            AttributedBullet("BUN alone usually needs no special preparation. When collected with other tests, confirm whether the combined order includes fasting instructions.", citationIDs: ["lab_bun"]),
            AttributedBullet("Compare trends using the same laboratory method where possible; check the units and interval on the report.", citationIDs: ["lab_result_context"])
        ],
        watchFor: [
            AttributedBullet("An abnormal result may need additional kidney testing. A normal result does not replace assessment when symptoms persist.", citationIDs: ["lab_bun"])
        ],
        citations: [lab_review_ranges_2026, lab_bun, lab_result_context],
        lastSourceFidelityReview: "2026-09-17"
    )
}

// MARK: - AST / ALT

public enum LiverEnzymesSample {
    public static let entry: LabEntry = LabEntry(
        id: "ast-alt",
        title: "AST / ALT",
        subtitle: "Serum · liver enzymes",
        specimen: "Serum",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation),
        referenceRanges: [
            ReferenceRangeRow(value: "AST 10–40 U/L", label: "Normal adult", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "ALT 7–56 U/L",  label: "Normal adult", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">3× upper limit", label: "Significant elevation", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">1000 U/L",       label: "Acute hepatocellular injury — hepatitis, ischemia, drug-induced", citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated transaminases",
                summary: "Reflect hepatocyte injury. ALT is more liver-specific; AST is also in muscle, heart, RBCs. Pattern matters: AST > ALT (especially 2:1) suggests alcohol-related liver disease.",
                nursingActions: [
                    "Identify cause: alcohol, viral hepatitis, drug-induced (acetaminophen, statins, antibiotics), NAFLD, ischemia",
                    "Pair with bilirubin, alkaline phosphatase, INR, albumin to assess synthetic function",
                    "Hold or modify hepatotoxic medications per provider",
                    "Counsel patient: limit alcohol, avoid acetaminophen, review all OTC and supplements"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Hepatocellular injury (AST/ALT predominantly elevated)", causes: ["Viral hepatitis", "Drug-induced liver injury (acetaminophen, statins, isoniazid, antiepileptics)", "Alcoholic hepatitis (AST:ALT >2:1)", "Ischemic hepatitis (shock liver)", "NAFLD/NASH"], citationIDs: ["openrn_lab_ranges"]),
            CauseGroup(title: "Cholestatic injury (alk phos predominantly elevated)", causes: ["Biliary obstruction", "Primary biliary cholangitis", "Drug-induced cholestasis"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: [
            AttributedBullet("AST is non-specific — also rises in MI, muscle injury, hemolysis. Look at ALT for liver specificity.", citationIDs: ["openrn_lab_ranges"])
        ],
        watchFor: [
            AttributedBullet("Falling LFTs after marked elevation may not mean recovery — could be massive hepatocyte loss in acute liver failure. Trend with INR and bilirubin.", citationIDs: ["openrn_lab_ranges"])
        ],
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Albumin

public enum AlbuminSample {
    public static let entry: LabEntry = LabEntry(
        id: "albumin",
        title: "Albumin",
        subtitle: "Serum · liver, protein loss and inflammation",
        specimen: "Blood; use the collecting laboratory’s specimen instructions",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        referenceRanges: [
            ReferenceRangeRow(value: "3.5–5.0 g/dL", label: "Example adult interval", citationIDs: ["lab_review_ranges_2026"])
        ],
        interpretationTiers: [
            InterpretationTier(severity: .low, label: "Low albumin", summary: "Albumin is produced by the liver. A low result can accompany liver disease, kidney protein loss, inflammation or other illness; albumin alone cannot diagnose the cause.",
                nursingActions: ["Review accompanying liver and kidney findings.", "Record edema, appetite changes, weight changes and relevant symptoms."], citationIDs: ["lab_albumin"])
        ],
        commonCauses: [
            CauseGroup(title: "Possible contributors to low results", causes: ["Liver or kidney disease", "Infection, burns or malabsorption", "Poor nutritional intake may coexist"], citationIDs: ["lab_albumin"]),
            CauseGroup(title: "Higher results", causes: ["Dehydration can concentrate albumin."], citationIDs: ["lab_albumin"])
        ],
        nursingActions: [
            AttributedBullet("Review medicines, supplements and pregnancy status when interpreting the result. Albumin alone generally requires no preparation, but other tests in the same collection may require fasting.", citationIDs: ["lab_albumin"]),
            AttributedBullet("Neither albumin nor prealbumin measures nutritional adequacy reliably. Inflammation can lower both independently of nutritional status; replacing albumin with prealbumin does not solve this problem.", citationIDs: ["lab_aspen_proteins"]),
            AttributedBullet("Nutrition screening should include intake and unintentional weight change. A comprehensive assessment also considers physical findings, functional status and the medical history; involve the dietitian through the care pathway.", citationIDs: ["lab_aspen_proteins"])
        ],
        watchFor: [
            AttributedBullet("Normal albumin does not exclude malnutrition, and an increase alone does not prove that nutrition support is adequate. Assess nutrition risk directly rather than treating a protein concentration as the goal.", citationIDs: ["lab_aspen_proteins"]),
            AttributedBullet("The result must be interpreted with symptoms and other tests; a low value alone does not identify a single diagnosis.", citationIDs: ["lab_albumin"])
        ],
        citations: [lab_review_ranges_2026, lab_albumin, lab_aspen_proteins],
        lastSourceFidelityReview: "2026-09-17"
    )
}

// MARK: - BNP / NT-proBNP

public enum BNPSample {
    public static let entry: LabEntry = LabEntry(
        id: "bnp",
        title: "BNP / NT-proBNP",
        subtitle: "Plasma · heart failure assessment in context",
        specimen: "Blood; use the collecting laboratory’s specimen instructions",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        referenceRanges: [
            ReferenceRangeRow(value: "BNP <100 pg/mL", label: "Example adult interval", citationIDs: ["lab_review_ranges_2026"]),
            ReferenceRangeRow(value: "NT-proBNP", label: "Use the laboratory’s assay-specific interval", citationIDs: ["lab_result_context"])
        ],
        interpretationTiers: [
            InterpretationTier(severity: .high, label: "Elevated natriuretic peptide", summary: "BNP and NT-proBNP testing can support heart failure assessment and monitoring. An elevated result is not a diagnosis by itself.",
                nursingActions: ["Review breathlessness, fatigue and swelling with the clinical team.", "Interpret with examination and other cardiac testing."], citationIDs: ["lab_bnp"])
        ],
        commonCauses: [
            CauseGroup(title: "Other contributors to elevation", causes: ["Kidney failure", "Valve or other heart disease", "Pulmonary embolism or pulmonary hypertension"], citationIDs: ["lab_bnp"])
        ],
        nursingActions: [
            AttributedBullet("Document changes in breathing, activity tolerance and edema alongside the result so that the laboratory trend has bedside context.", citationIDs: ["lab_bnp"]),
            AttributedBullet("Age, sex and the medical history influence interpretation. Verify which peptide was measured before comparing reports.", citationIDs: ["lab_bnp"]),
            AttributedBullet("Testing generally requires no special preparation. Explain that this is one part of the assessment and that additional testing may be needed to establish the cause of symptoms.", citationIDs: ["lab_bnp"])
        ],
        watchFor: [
            AttributedBullet("Obesity can lower natriuretic peptide concentrations. A lower result does not, by itself, exclude heart failure in a symptomatic person.", citationIDs: ["lab_bnp"]),
            AttributedBullet("An elevated result may reflect more than one condition; avoid attributing all breathlessness or swelling to heart failure from the number alone.", citationIDs: ["lab_bnp"])
        ],
        citations: [lab_review_ranges_2026, lab_result_context, lab_bnp],
        lastSourceFidelityReview: "2026-09-17"
    )
}

// MARK: - Lipase

public enum LipaseSample {
    public static let entry: LabEntry = LabEntry(
        id: "lipase",
        title: "Lipase",
        subtitle: "Serum · pancreatic enzyme and abdominal assessment",
        specimen: "Blood; use the collecting laboratory’s specimen instructions",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        referenceRanges: [
            ReferenceRangeRow(value: "Laboratory-specific", label: "Use the reported interval and units", citationIDs: ["lab_result_context"])
        ],
        interpretationTiers: [
            InterpretationTier(severity: .high, label: "Elevated lipase", summary: "Lipase helps digest fats. Elevation may accompany pancreatic injury, but other conditions can also increase it; interpret it with the clinical presentation.",
                nursingActions: ["Review abdominal pain, radiation toward the back, nausea and vomiting.", "Include fever, jaundice and the medical history in the assessment."], citationIDs: ["lab_lipase"])
        ],
        commonCauses: [
            CauseGroup(title: "Possible contributors", causes: ["Acute pancreatitis", "Kidney disease", "Gallbladder or intestinal disease", "Certain medicines"], citationIDs: ["lab_lipase"]),
            CauseGroup(title: "Low results", causes: ["Chronic pancreatic damage can reduce enzyme production."], citationIDs: ["lab_lipase"])
        ],
        nursingActions: [
            AttributedBullet("Review medicines and supplements with the ordering clinician. Do not advise patients to stop a medicine simply to prepare for this test.", citationIDs: ["lab_lipase"]),
            AttributedBullet("Preparation depends on the order; fasting may be requested. Verify the actual collection instructions rather than assuming every lipase order requires fasting.", citationIDs: ["lab_lipase"]),
            AttributedBullet("Explain that the result helps investigate symptoms and is interpreted with history and other findings, rather than identifying the cause of pain on its own.", citationIDs: ["lab_lipase"])
        ],
        watchFor: [
            AttributedBullet("An abnormal lipase value does not distinguish every pancreatic condition from nonpancreatic causes. Persistent symptoms still need clinical assessment and any further testing the team considers appropriate.", citationIDs: ["lab_lipase"])
        ],
        citations: [lab_result_context, lab_lipase],
        lastSourceFidelityReview: "2026-09-17"
    )
}

// MARK: - CK / CK-MB

public enum CKSample {
    public static let entry: LabEntry = LabEntry(
        id: "ck",
        title: "CK / CK-MB",
        subtitle: "Serum · muscle / cardiac injury",
        specimen: "Serum",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        referenceRanges: [
            ReferenceRangeRow(value: "CK 22–198 U/L (men)",   label: "Normal — adult male",   citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "CK 26–192 U/L (women)", label: "Normal — adult female", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">5× upper limit",        label: "Marked elevation",      citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">5000 U/L",              label: "Severe rhabdomyolysis — AKI risk", citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated CK (rhabdomyolysis)",
                summary: "Reflects muscle injury — trauma, prolonged immobility, statin myopathy, seizures, exertion, ischemia. Triad: myalgia + weakness + tea-colored urine.",
                nursingActions: [
                    "Aggressive IV fluids (NS) — goal urine output 200–300 mL/hr to flush myoglobin",
                    "Monitor potassium (released from muscle) and calcium (drops in early phase, rises later)",
                    "Monitor renal function — myoglobin precipitates in tubules",
                    "Trend CK every 6–12 hours; expect peak 24–72 hours after insult",
                    "Identify cause: pressure injury, statin, exertion, seizure, trauma"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Causes of rhabdomyolysis", causes: ["Crush injury, prolonged down-time", "Compartment syndrome", "Statin myopathy (esp. with fibrates, azoles)", "Cocaine, methamphetamine", "Seizure, status asthmaticus", "Heat stroke, neuroleptic malignant syndrome", "Influenza myositis"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: [
            AttributedBullet("CK-MB used historically for MI diagnosis; troponin has largely replaced it. Still occasionally used for re-infarction.", citationIDs: ["openrn_lab_ranges"])
        ],
        watchFor: [
            AttributedBullet("AKI from rhabdomyolysis can develop within hours — early aggressive hydration prevents it.", citationIDs: ["openrn_lab_ranges"])
        ],
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Procalcitonin

public enum ProcalcitoninSample {
    public static let entry: LabEntry = LabEntry(
        id: "procalcitonin",
        title: "Procalcitonin",
        subtitle: "Blood · infection assessment and test limitations",
        specimen: "Blood; use the collecting laboratory’s specimen instructions",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        referenceRanges: [
            ReferenceRangeRow(value: "Laboratory-specific", label: "Use the reported interval and clinical context", citationIDs: ["lab_result_context"])
        ],
        interpretationTiers: [
            InterpretationTier(severity: .high, label: "Elevated procalcitonin", summary: "Procalcitonin may rise with a serious bacterial infection. It can assist the team’s infection assessment and monitoring, but it does not identify the organism.",
                nursingActions: ["Review the result with symptoms, examination and other ordered tests.", "Additional testing is needed to identify the infection and its cause."], citationIDs: ["lab_pct"])
        ],
        commonCauses: [
            CauseGroup(title: "Noninfectious contributors", causes: ["Major surgery or trauma", "Severe burns", "Severe heart injury"], citationIDs: ["lab_pct"]),
            CauseGroup(title: "A low result can occur", causes: ["Early in an infection, before the concentration has increased."], citationIDs: ["lab_pct"])
        ],
        nursingActions: [
            AttributedBullet("Record recent surgery, injury or burns when communicating the result; these can change its meaning. Testing itself usually requires no special preparation.", citationIDs: ["lab_pct"]),
            AttributedBullet("The trend may help the clinician assess response to treatment. The value is one part of that decision, alongside the patient’s condition and other findings.", citationIDs: ["lab_pct"])
        ],
        watchFor: [
            AttributedBullet("A low initial result cannot exclude an early infection. New confusion, breathing difficulty, rapid heartbeat or severe illness require prompt clinical attention rather than reassurance from the laboratory number.", citationIDs: ["lab_pct"]),
            AttributedBullet("An elevated result does not identify a particular bacterium or replace the additional investigations used to establish the cause.", citationIDs: ["lab_pct"])
        ],
        citations: [lab_result_context, lab_pct],
        lastSourceFidelityReview: "2026-09-17"
    )
}
