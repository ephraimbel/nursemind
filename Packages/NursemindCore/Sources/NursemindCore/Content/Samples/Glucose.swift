import Foundation

public enum GlucoseSample {
    public static let entry: LabEntry = {
        let openrn = CitationSource(
            id: "openrn_lab_ranges",
            shortName: "Open RN Nursing Fundamentals — Reference Ranges Appendix",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK613071/",
            lastRetrieved: "2026-05-03"
        )
        let openstax = CitationSource(
            id: "openstax_clinical_lab_values",
            shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values appendix",
            publisher: "OpenStax · Rice University",
            license: .ccBy4WithAIRestriction,
            url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
            lastRetrieved: "2026-05-03"
        )
        let cdcDka = CitationSource(
            id: "cdc_dka",
            shortName: "CDC Diabetes — DKA criteria and education",
            detail: "Glucose typically > 250 mg/dL with ketosis and acidosis",
            publisher: "Centers for Disease Control and Prevention",
            license: .publicDomain,
            url: "https://www.cdc.gov/diabetes/about/diabetic-ketoacidosis.html",
            lastRetrieved: "2026-05-03"
        )
        let openrnAntidiab = CitationSource(
            id: "openrn_pharm_antidiabetics",
            shortName: "Open RN Nursing Pharmacology — Antidiabetic Medications",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )

        return LabEntry(
            id: "glucose",
            title: "Glucose (blood)",
            subtitle: "Capillary or serum · glycemic control",
            specimen: "Capillary fingerstick (POC) or serum (lab)",
            nclexTags: NCLEXTags(
                category: .physiologicalIntegrity,
                subcategory: .reductionOfRiskPotential,
                priorityConcept: .glucoseRegulation
            ),
            referenceRanges: [
                ReferenceRangeRow(value: "70 – 99 mg/dL (fasting)", label: "Normal fasting",      citationIDs: ["openrn_lab_ranges", "openstax_clinical_lab_values"]),
                ReferenceRangeRow(value: "< 70 mg/dL",              label: "Hypoglycemia",        citationIDs: ["openrn_lab_ranges"]),
                ReferenceRangeRow(value: "< 40 mg/dL",              label: "Critical low",        citationIDs: ["openrn_lab_ranges"]),
                ReferenceRangeRow(value: "100 – 125 mg/dL (fasting)", label: "Prediabetes range", citationIDs: ["openrn_lab_ranges"]),
                ReferenceRangeRow(value: "≥ 126 mg/dL (fasting) on two occasions", label: "Diabetes range", citationIDs: ["openrn_lab_ranges"]),
                ReferenceRangeRow(value: "> 250 mg/dL with ketosis", label: "DKA suspected",      citationIDs: ["cdc_dka"]),
                ReferenceRangeRow(value: "> 500 mg/dL",             label: "Critical high (HHS or DKA range)", citationIDs: ["openrn_lab_ranges"])
            ],
            interpretationTiers: [
                InterpretationTier(
                    severity: .critical,
                    label: "Critical low (< 40)",
                    summary: "Severe hypoglycemia. Risk of seizures, loss of consciousness, brain injury. Treat immediately.",
                    nursingActions: [
                        "If conscious and able to swallow: 15 g fast-acting carbohydrate (4 oz juice, glucose tablets); recheck in 15 min (15/15 rule)",
                        "If unconscious or NPO: D50W IV per protocol or glucagon IM",
                        "Recheck glucose every 15 minutes until > 70",
                        "Once stable, provide complex carb + protein snack",
                        "Identify cause (missed meal, excess insulin, exercise)"
                    ],
                    citationIDs: ["openrn_pharm_antidiabetics"]
                ),
                InterpretationTier(
                    severity: .low,
                    label: "Hypoglycemia (< 70)",
                    summary: "Common signs: tremor, diaphoresis, tachycardia, anxiety, hunger, slurred speech, confusion. Beta-blockers may mask adrenergic symptoms.",
                    nursingActions: [
                        "Apply the 15/15 rule: 15 g fast carb, recheck in 15 min",
                        "Monitor for symptom resolution",
                        "Once stable, provide complex carb + protein snack to prevent rebound"
                    ],
                    citationIDs: ["openrn_pharm_antidiabetics"]
                ),
                InterpretationTier(
                    severity: .high,
                    label: "Hyperglycemia (> 250)",
                    summary: "Risk of DKA in type 1 diabetes (with ketones, acidosis) or HHS in type 2 (with severe hyperosmolality, dehydration). Assess for symptoms — polyuria, polydipsia, blurred vision, fruity breath (DKA).",
                    nursingActions: [
                        "Check ketones (urine or beta-hydroxybutyrate)",
                        "Check vital signs and mental status",
                        "Notify provider; anticipate IV fluids, IV insulin infusion",
                        "Monitor potassium closely — insulin shifts K+ intracellularly",
                        "Strict I&O, hourly glucose checks during insulin infusion"
                    ],
                    citationIDs: ["cdc_dka", "openrn_pharm_antidiabetics"]
                )
            ],
            commonCauses: [
                CauseGroup(
                    title: "Causes of hypoglycemia",
                    causes: [
                        "Excess insulin or oral hypoglycemic dose",
                        "Missed or delayed meal",
                        "Vigorous unplanned exercise",
                        "Alcohol (especially without food)",
                        "Adrenal insufficiency",
                        "Sepsis"
                    ],
                    citationIDs: ["openrn_pharm_antidiabetics"]
                ),
                CauseGroup(
                    title: "Causes of hyperglycemia",
                    causes: [
                        "Inadequate insulin or non-adherence",
                        "Infection / sepsis (stress hyperglycemia)",
                        "Steroids, atypical antipsychotics",
                        "Pancreatic disease",
                        "Cushing syndrome",
                        "Total parenteral nutrition"
                    ],
                    citationIDs: ["openrn_pharm_antidiabetics"]
                )
            ],
            nursingActions: [
                AttributedBullet("Verify the meter is calibrated and not expired before POC fingerstick.", citationIDs: ["openrn_lab_ranges"]),
                AttributedBullet("Wash and dry the patient's hand before fingerstick — alcohol residue or food sugar can falsely elevate.", citationIDs: ["openrn_lab_ranges"]),
                AttributedBullet("Document the time of the most recent meal alongside the result for context.", citationIDs: ["openrn_pharm_antidiabetics"])
            ],
            watchFor: [
                AttributedBullet("Beta-blockers may mask the adrenergic symptoms of hypoglycemia (tremor, tachycardia) — patients may go directly to neuroglycopenic symptoms.", citationIDs: ["openrn_pharm_antidiabetics"]),
                AttributedBullet("Hospitalized patients on tube feeds are at high risk for hypoglycemia if the feed is held without holding insulin coverage.", citationIDs: ["openrn_pharm_antidiabetics"])
            ],
            citations: [openrn, openstax, cdcDka, openrnAntidiab],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
