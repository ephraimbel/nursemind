import Foundation

public enum InsulinRegularSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_humulin_r",
            shortName: "FDA Structured Product Labeling — Humulin R (Insulin Human, regular)",
            detail: "SET ID: 81199e55-ade9-46de-a5a3-c0415acee403",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_antidiabetics",
            shortName: "Open RN Nursing Pharmacology — Antidiabetic Medications",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )
        let openstax = CitationSource(
            id: "openstax_pharm_insulins",
            shortName: "OpenStax Pharmacology for Nurses — Insulins",
            publisher: "OpenStax · Rice University",
            license: .ccBy4WithAIRestriction,
            url: "https://openstax.org/books/pharmacology/pages/1-introduction",
            lastRetrieved: "2026-05-03"
        )
        let ismp = CitationSource(
            id: "ismp_high_alert_2024",
            shortName: "ISMP List of High-Alert Medications in Acute Care, 2024",
            detail: "Concept citation only — insulin is an ISMP high-alert medication",
            publisher: "Institute for Safe Medication Practices",
            license: .factCitationOnly,
            url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "insulin-regular",
            title: "Insulin (regular)",
            subtitle: "Humulin R · Novolin R · short-acting insulin",
            category: "Antidiabetic — Insulin",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Short-acting human insulin"),
                KeyValueRow(key: "Onset", value: "30 min (SC); ~15 min (IV)"),
                KeyValueRow(key: "Peak", value: "2–4 hr (SC)"),
                KeyValueRow(key: "Duration", value: "5–8 hr (SC)")
            ],
            indications: AttributedProse(
                "Indicated to improve glycemic control in adult and pediatric patients with diabetes mellitus.",
                citationIDs: ["openfda_humulin_r"]
            ),
            mechanism: AttributedProse(
                "Regulates glucose metabolism by stimulating peripheral glucose uptake and inhibiting hepatic glucose production.",
                citationIDs: ["openfda_humulin_r"]
            ),
            dosing: [
                DosingBlock(
                    label: "Subcutaneous",
                    body: "Inject 30 minutes before meals into the thigh, upper arm, abdomen, or buttocks. Rotate sites within the same region. Dose individualized based on metabolic needs, glucose monitoring, and glycemic goals.",
                    citationIDs: ["openfda_humulin_r"]
                ),
                DosingBlock(
                    label: "Intravenous",
                    body: "0.1–1 unit/mL concentrations only, under medical supervision (e.g., DKA management, perioperative glucose control).",
                    citationIDs: ["openfda_humulin_r"]
                ),
                DosingBlock(
                    label: "Mixing",
                    body: "Only with Humulin N. Draw Humulin R first, then Humulin N. Inject immediately. Do not dilute for IV use; may dilute for SC only under supervision.",
                    citationIDs: ["openfda_humulin_r"]
                )
            ],
            contraindications: AttributedProse(
                "During hypoglycemic episodes; hypersensitivity to insulin human or any of its excipients.",
                citationIDs: ["openfda_humulin_r"]
            ),
            warnings: [
                AttributedBullet("Hypoglycemia is the most common adverse reaction and is potentially life-threatening; monitor frequently.", citationIDs: ["openfda_humulin_r"]),
                AttributedBullet("Medication errors (insulin mix-ups) reported — verify product label before each injection.", citationIDs: ["openfda_humulin_r"]),
                AttributedBullet("Changes in regimen, brand, or formulation may cause hypo- or hyperglycemia; increase glucose monitoring during transitions.", citationIDs: ["openfda_humulin_r"]),
                AttributedBullet("Hypersensitivity reactions, including anaphylaxis, possible.", citationIDs: ["openfda_humulin_r"]),
                AttributedBullet("Hypokalemia — insulin shifts potassium intracellularly; monitor potassium especially in IV use and DKA.", citationIDs: ["openfda_humulin_r"]),
                AttributedBullet("Heart failure risk when used with thiazolidinediones (TZDs).", citationIDs: ["openfda_humulin_r"])
            ],
            adverseReactions: AttributedProse(
                "Common: hypoglycemia, allergic reactions, injection site reactions, lipodystrophy, weight gain, edema, pruritus, rash.",
                citationIDs: ["openfda_humulin_r"]
            ),
            drugInteractions: [
                AttributedBullet("Increased hypoglycemia risk: oral antidiabetic agents, ACE inhibitors, ARBs, fibrates, fluoxetine, MAOIs, sulfonamide antibiotics.", citationIDs: ["openfda_humulin_r"]),
                AttributedBullet("Decreased insulin effect: corticosteroids, diuretics, oral contraceptives, sympathomimetics, thyroid hormones.", citationIDs: ["openfda_humulin_r"]),
                AttributedBullet("Variable effect: alcohol, beta-blockers, lithium, pentamidine.", citationIDs: ["openfda_humulin_r"]),
                AttributedBullet("Beta-blockers and clonidine — may blunt symptoms of hypoglycemia; increase glucose monitoring.", citationIDs: ["openfda_humulin_r"])
            ],
            nursingImplications: [
                AttributedBullet("Two-nurse independent verification of dose, units, type, and concentration before administration (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
                AttributedBullet("Use only insulin syringes labeled in units; do not use a tuberculin syringe.", citationIDs: ["openrn_pharm_antidiabetics"]),
                AttributedBullet("Verify the right insulin TYPE (regular, NPH, glargine, etc.) — types are not interchangeable.", citationIDs: ["openrn_pharm_antidiabetics", "ismp_high_alert_2024"]),
                AttributedBullet("Check blood glucose before administering and 2–4 hours after (peak effect for regular insulin).", citationIDs: ["openrn_pharm_antidiabetics", "openstax_pharm_insulins"]),
                AttributedBullet("Ensure patient has consumed (or will consume) carbohydrate within 30 minutes of SC dose.", citationIDs: ["openrn_pharm_antidiabetics"]),
                AttributedBullet("Monitor for signs of hypoglycemia: tremor, diaphoresis, tachycardia, anxiety, confusion, slurred speech.", citationIDs: ["openrn_pharm_antidiabetics", "openstax_pharm_insulins"]),
                AttributedBullet("Have rapid-acting glucose source available (4 oz juice, glucose tablets, IV D50W).", citationIDs: ["openrn_pharm_antidiabetics"]),
                AttributedBullet("Rotate injection sites within an anatomical region to prevent lipodystrophy.", citationIDs: ["openrn_pharm_antidiabetics"]),
                AttributedBullet("Refrigerate unopened vials; opened vials may be kept at room temperature for 28–31 days per manufacturer.", citationIDs: ["openrn_pharm_antidiabetics"])
            ],
            patientTeaching: AttributedProse(
                "Always check the label and dose before injecting. Eat within 30 minutes after a regular insulin dose. Recognize and treat hypoglycemia: 15 grams of fast-acting carbohydrate, recheck glucose in 15 minutes (the 15/15 rule). Carry a glucose source at all times. Wear medical identification. Rotate injection sites. Store insulin per manufacturer instructions.",
                citationIDs: ["openrn_pharm_antidiabetics", "openstax_pharm_insulins"]
            ),
            citations: [openfda, openrn, openstax, ismp],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
