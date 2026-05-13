import Foundation

public enum DKASample {
    public static let entry: DiagnosisEntry = {
        let cdc = CitationSource(
            id: "cdc_dka",
            shortName: "CDC Diabetes — Diabetic Ketoacidosis",
            publisher: "Centers for Disease Control and Prevention",
            license: .publicDomain,
            url: "https://www.cdc.gov/diabetes/about/diabetic-ketoacidosis.html",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_medsurg_dka",
            shortName: "Open RN Health Alterations — DKA / HHS chapter",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK613071/",
            lastRetrieved: "2026-05-03"
        )
        let ada = CitationSource(
            id: "ada_standards_paraphrased",
            shortName: "ADA Standards of Care in Diabetes (paraphrased + cited)",
            detail: "DKA criteria: glucose >250, pH <7.30, bicarbonate <18, ketonemia/ketonuria",
            publisher: "American Diabetes Association",
            license: .factCitationOnly,
            url: "https://diabetesjournals.org/care",
            lastRetrieved: "2026-05-03"
        )

        return DiagnosisEntry(
            id: "dka",
            title: "Diabetic ketoacidosis (DKA)",
            subtitle: "Acute hyperglycemic emergency",
            nclexTags: NCLEXTags(
                category: .physiologicalIntegrity,
                subcategory: .physiologicalAdaptation,
                priorityConcept: .glucoseRegulation
            ),
            definition: AttributedProse(
                "DKA is an acute, life-threatening complication of diabetes characterized by hyperglycemia, ketonemia, and metabolic acidosis. Most common in type 1 diabetes but can occur in type 2 (especially with severe stress or SGLT2-inhibitor use).",
                citationIDs: ["cdc_dka", "openrn_medsurg_dka"]
            ),
            pathophysiology: AttributedProse(
                "Insulin deficiency prevents glucose uptake by cells. Counter-regulatory hormones (glucagon, cortisol, catecholamines) mobilize free fatty acids, which are oxidized to ketone bodies. Ketones are strong organic acids — they overwhelm buffering capacity, producing high anion gap metabolic acidosis. Hyperglycemia drives osmotic diuresis, leading to severe dehydration and electrolyte losses.",
                citationIDs: ["openrn_medsurg_dka"]
            ),
            presentation: [
                AttributedBullet("Polyuria, polydipsia, polyphagia (early).", citationIDs: ["cdc_dka", "openrn_medsurg_dka"]),
                AttributedBullet("Nausea, vomiting, abdominal pain.", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("Fruity (acetone) breath odor.", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("Kussmaul respirations — deep, rapid, labored breathing (compensation for acidosis).", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("Dehydration: dry mucous membranes, poor skin turgor, tachycardia, hypotension.", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("Altered mental status — drowsiness, confusion, coma in severe cases.", citationIDs: ["openrn_medsurg_dka"])
            ],
            diagnosticCriteria: [
                AttributedBullet("Glucose >250 mg/dL.", citationIDs: ["ada_standards_paraphrased", "cdc_dka"]),
                AttributedBullet("Arterial pH <7.30 (mild), <7.00 (severe).", citationIDs: ["ada_standards_paraphrased"]),
                AttributedBullet("Serum bicarbonate <18 mEq/L (mild), <10 (severe).", citationIDs: ["ada_standards_paraphrased"]),
                AttributedBullet("Positive serum or urine ketones (beta-hydroxybutyrate elevated).", citationIDs: ["ada_standards_paraphrased"]),
                AttributedBullet("Anion gap >12.", citationIDs: ["openrn_medsurg_dka"])
            ],
            priorityAssessments: [
                AttributedBullet("Vital signs and continuous cardiac monitoring (electrolyte shifts → arrhythmias).", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("Mental status and neurological status hourly during treatment.", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("Strict hourly intake and output; foley insertion may be considered.", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("Hourly glucose and BMP / electrolyte panel during insulin infusion.", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("Trend ABG/VBG, anion gap, and beta-hydroxybutyrate to assess resolution.", citationIDs: ["openrn_medsurg_dka"])
            ],
            commonInterventions: [
                AttributedBullet("IV fluids — 0.9% NS first to restore intravascular volume; switch to 0.45% NS once hemodynamically stable.", citationIDs: ["openrn_medsurg_dka", "ada_standards_paraphrased"]),
                AttributedBullet("Add D5W to maintenance fluids when glucose drops to ~250 mg/dL to prevent hypoglycemia and cerebral edema.", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("IV regular insulin infusion (typically 0.1 units/kg/hr) — DO NOT start until potassium is verified ≥3.3 mEq/L.", citationIDs: ["openrn_medsurg_dka", "ada_standards_paraphrased"]),
                AttributedBullet("Potassium replacement is almost universally needed — even with normal serum K+ at presentation, total body K+ is depleted.", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("Bicarbonate is generally NOT given unless pH <6.9 (controversial; can worsen cerebral edema).", citationIDs: ["ada_standards_paraphrased"]),
                AttributedBullet("Identify and treat the precipitating cause: infection, missed insulin doses, MI, pancreatitis, medication non-adherence.", citationIDs: ["openrn_medsurg_dka"])
            ],
            watchFor: [
                AttributedBullet("Cerebral edema — especially in pediatric patients during the first 24 hours of treatment. Headache, altered mentation, bradycardia, hypertension, posturing.", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("Hypoglycemia — most common complication of treatment.", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("Hypokalemia — life-threatening arrhythmias if K+ replacement is inadequate.", citationIDs: ["openrn_medsurg_dka"]),
                AttributedBullet("Recurrent DKA — transition from IV to SC insulin must overlap by 1–2 hours to prevent rebound.", citationIDs: ["openrn_medsurg_dka"])
            ],
            citations: [cdc, openrn, ada],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
