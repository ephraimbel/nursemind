import Foundation

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
        subtitle: "Serum · renal + hydration marker",
        specimen: "Serum",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes),
        referenceRanges: [
            ReferenceRangeRow(value: "7–20 mg/dL",  label: "Normal adult", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">20 mg/dL",   label: "Elevated",     citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">100 mg/dL",  label: "Severe — likely uremic symptoms", citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated BUN",
                summary: "BUN reflects both renal function AND hydration/protein turnover. Always interpret with creatinine.",
                nursingActions: [
                    "Check BUN:Cr ratio: >20:1 suggests pre-renal (volume depletion, GI bleed, high-protein diet, steroids); 10–15:1 suggests intrinsic renal",
                    "Assess hydration: skin turgor, mucous membranes, orthostatics, urine output",
                    "Identify cause: dehydration, GI bleed, high-protein TPN, catabolic state, AKI",
                    "Trend with creatinine and clinical context"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Pre-renal (high BUN:Cr ratio)", causes: ["Dehydration", "GI bleed (protein load)", "Catabolic state", "Steroid therapy"], citationIDs: ["openrn_lab_ranges"]),
            CauseGroup(title: "Intrinsic renal (proportional BUN/Cr rise)", causes: ["AKI", "CKD", "ATN", "Glomerulonephritis"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: [
            AttributedBullet("Always pair BUN with creatinine; the ratio is more useful than either alone.", citationIDs: ["openrn_lab_ranges"])
        ],
        watchFor: [
            AttributedBullet("In GI bleeders, BUN can rise quickly from absorbed protein — disproportionate BUN rise with normal Cr suggests GI bleeding source.", citationIDs: ["openrn_lab_ranges"])
        ],
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
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
        subtitle: "Serum · synthetic liver function / nutrition",
        specimen: "Serum",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        referenceRanges: [
            ReferenceRangeRow(value: "3.5–5.0 g/dL", label: "Normal adult",     citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<3.5 g/dL",   label: "Hypoalbuminemia",  citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "<2.5 g/dL",   label: "Severe — edema, drug-binding shifts, poor wound healing", citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Hypoalbuminemia",
                summary: "Reflects either decreased synthesis (liver disease, malnutrition), increased loss (nephrotic syndrome, burns, GI loss), or dilutional/inflammatory state (sepsis, CHF).",
                nursingActions: [
                    "Identify cause: nutritional, hepatic, renal (proteinuria), GI (PLE), inflammatory",
                    "Correct calcium for albumin: corrected Ca = measured + 0.8 × (4 − albumin)",
                    "Drug binding shifts — highly protein-bound drugs (warfarin, phenytoin, calcium) may have higher free fraction",
                    "Monitor for edema; nutritional support per dietitian"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Decreased synthesis", causes: ["Cirrhosis", "Severe malnutrition", "Critical illness (acute phase response)"], citationIDs: ["openrn_lab_ranges"]),
            CauseGroup(title: "Increased loss", causes: ["Nephrotic syndrome (proteinuria)", "Burns", "Protein-losing enteropathy", "Open abdomens / surgical drains"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: [
            AttributedBullet("Always correct serum calcium for albumin in hypoalbuminemia.", citationIDs: ["openrn_lab_ranges"]),
            AttributedBullet("Albumin is a poor acute nutrition marker (long half-life ~21 days) — use prealbumin (~2 days) for short-term tracking.", citationIDs: ["openrn_lab_ranges"])
        ],
        watchFor: nil,
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - BNP / NT-proBNP

public enum BNPSample {
    public static let entry: LabEntry = LabEntry(
        id: "bnp",
        title: "BNP / NT-proBNP",
        subtitle: "Plasma · heart failure marker",
        specimen: "Plasma (EDTA)",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        referenceRanges: [
            ReferenceRangeRow(value: "BNP <100 pg/mL",         label: "HF unlikely",      citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "BNP 100–400 pg/mL",      label: "Indeterminate",    citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "BNP >400 pg/mL",         label: "HF likely",        citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "NT-proBNP <300 pg/mL",   label: "HF unlikely",      citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "NT-proBNP age-adjusted", label: ">450 (<50y), >900 (50–75y), >1800 (>75y) suggests HF", citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated BNP",
                summary: "Released from stretched ventricles; supports diagnosis of acute heart failure when accompanied by signs/symptoms.",
                nursingActions: [
                    "Pair with clinical exam (JVD, rales, S3, edema), CXR, echo",
                    "Trend during diuresis — falling BNP suggests improvement",
                    "Consider AKI: renal clearance of BNP is reduced → falsely elevated in CKD",
                    "Higher in older adults; lower in obese patients (false negatives)"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Cardiac causes of elevation", causes: ["Acute decompensated HF", "Right heart failure (PE, COR pulmonale)", "Ventricular hypertrophy", "Atrial fibrillation"], citationIDs: ["openrn_lab_ranges"]),
            CauseGroup(title: "Non-cardiac causes", causes: ["CKD (decreased clearance)", "Sepsis with myocardial strain", "Critical illness"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: [
            AttributedBullet("BNP is sensitive but not specific — use as part of HF assessment, not in isolation.", citationIDs: ["openrn_lab_ranges"]),
            AttributedBullet("Sacubitril/valsartan (Entresto) artificially elevates BNP — use NT-proBNP instead in those patients.", citationIDs: ["openrn_lab_ranges"])
        ],
        watchFor: nil,
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Lipase

public enum LipaseSample {
    public static let entry: LabEntry = LabEntry(
        id: "lipase",
        title: "Lipase",
        subtitle: "Serum · pancreatic injury marker",
        specimen: "Serum",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        referenceRanges: [
            ReferenceRangeRow(value: "0–160 U/L (varies)", label: "Normal adult",                                citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">3× upper limit",     label: "Suggestive of acute pancreatitis (with signs)", citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated lipase",
                summary: "Elevation >3× upper limit, with appropriate clinical signs (epigastric pain radiating to back, nausea, vomiting), supports diagnosis of acute pancreatitis.",
                nursingActions: [
                    "Assess pain, nausea/vomiting, abdominal exam (epigastric tenderness)",
                    "NPO for bowel rest until provider clears",
                    "IV fluids (often aggressive); pain control; antiemetics",
                    "Trend lipase with clinical course — but note absolute value doesn't correlate with severity",
                    "Identify trigger: gallstones, alcohol, hypertriglyceridemia, drugs (azathioprine, valproate, certain HIV meds)"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Acute pancreatitis triggers", causes: ["Gallstones", "Alcohol", "Hypertriglyceridemia (TG >1000)", "Drugs (azathioprine, valproate, GLP-1 agonists, didanosine)", "Hypercalcemia", "ERCP", "Trauma"], citationIDs: ["openrn_lab_ranges"]),
            CauseGroup(title: "Other causes of elevation", causes: ["AKI/CKD (decreased clearance)", "Bowel obstruction", "Cholecystitis"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: [
            AttributedBullet("Lipase is more specific than amylase for pancreatitis.", citationIDs: ["openrn_lab_ranges"]),
            AttributedBullet("Lipase magnitude doesn't predict severity — use scoring (Ranson, BISAP) instead.", citationIDs: ["openrn_lab_ranges"])
        ],
        watchFor: nil,
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
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
        subtitle: "Plasma · bacterial infection / antibiotic guidance",
        specimen: "Plasma",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        referenceRanges: [
            ReferenceRangeRow(value: "<0.10 ng/mL",   label: "Bacterial infection unlikely",    citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "0.10–0.25",     label: "Local bacterial infection possible", citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: "0.25–0.50",     label: "Bacterial infection likely",      citationIDs: ["openrn_lab_ranges"]),
            ReferenceRangeRow(value: ">0.50 ng/mL",   label: "Severe bacterial infection / sepsis likely", citationIDs: ["openrn_lab_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated procalcitonin",
                summary: "Suggests bacterial (vs. viral) infection. Used to support sepsis diagnosis, guide antibiotic decisions, and de-escalate therapy.",
                nursingActions: [
                    "Pair with clinical signs of sepsis, lactate, WBC",
                    "Trending procalcitonin guides antibiotic duration — provider may de-escalate when level falls",
                    "Not specific — also elevated in major surgery, trauma, burns, malignancy, fungal sepsis",
                    "Useful for differentiating bacterial pneumonia vs. viral / COPD exacerbation"
                ],
                citationIDs: ["openrn_lab_ranges"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Causes of elevation", causes: ["Bacterial sepsis", "Bacterial pneumonia", "Bacterial meningitis", "Major surgery / trauma (transient)", "Severe burns", "Cardiogenic shock with hepatic congestion"], citationIDs: ["openrn_lab_ranges"]),
            CauseGroup(title: "False low (don't over-rely)", causes: ["Localized infection (abscess, cellulitis without bacteremia)", "Early infection (within hours of onset)"], citationIDs: ["openrn_lab_ranges"])
        ],
        nursingActions: nil,
        watchFor: [
            AttributedBullet("Don't withhold antibiotics in suspected sepsis based on a single procalcitonin — clinical picture leads.", citationIDs: ["openrn_lab_ranges"])
        ],
        citations: [openrnLabRanges, openstaxLabValues],
        lastSourceFidelityReview: "2026-05-03"
    )
}
