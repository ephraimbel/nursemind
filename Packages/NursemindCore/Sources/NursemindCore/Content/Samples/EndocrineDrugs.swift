import Foundation

// Curator-model endocrine drug entries (v1.5 expansion).
// Sources: openFDA SPL (CC0), Open RN Nursing Pharmacology — Endocrine (CC BY 4.0),
// ADA Standards of Care (concept citation), VA PBM (public domain), ISMP high-alert.

private let openfda = CitationSource(
    id: "openfda_endo",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_pharm_endo",
    shortName: "Open RN Nursing Pharmacology — Endocrine Therapy",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
    lastRetrieved: "2026-05-04"
)
private let ada = CitationSource(
    id: "ada_standards",
    shortName: "ADA Standards of Care in Diabetes (concept citation)",
    publisher: "American Diabetes Association",
    license: .factCitationOnly,
    url: "https://diabetesjournals.org/care",
    lastRetrieved: "2026-05-04"
)
private let ismp = CitationSource(
    id: "ismp_high_alert_2024",
    shortName: "ISMP List of High-Alert Medications, 2024",
    detail: "Insulin and hypoglycemics are ISMP high-alert",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)

// MARK: - Insulin Glargine (Lantus / Basaglar / Toujeo)

public enum InsulinGlargineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "insulin-glargine",
        title: "Insulin Glargine",
        subtitle: "Lantus · Basaglar · Toujeo · long-acting basal insulin",
        category: "Insulin (Long-Acting Basal)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Long-acting basal insulin analog"),
            KeyValueRow(key: "Onset", value: "1–2 hr"),
            KeyValueRow(key: "Peak", value: "Essentially peakless"),
            KeyValueRow(key: "Duration", value: "~24 hours (Toujeo U-300 up to 36 hr)"),
            KeyValueRow(key: "Concentration", value: "U-100 (Lantus, Basaglar) or U-300 (Toujeo)")
        ],
        indications: AttributedProse(
            "Once-daily basal insulin coverage in type 1 and type 2 diabetes mellitus.",
            citationIDs: ["openfda_endo"]
        ),
        mechanism: AttributedProse(
            "Recombinant insulin analog precipitates at injection site at physiologic pH, dissolving slowly to form a near-constant low-level basal insulin concentration over 24 hours.",
            citationIDs: ["openfda_endo", "openrn_pharm_endo"]
        ),
        dosing: [
            DosingBlock(label: "Type 1 DM (basal portion)", body: "Approximately 50% of total daily insulin requirement, given once daily; remainder as rapid-acting prandial.", citationIDs: ["openfda_endo", "ada_standards"]),
            DosingBlock(label: "Type 2 DM (initiating basal)", body: "0.1–0.2 units/kg SC once daily, titrated to fasting glucose target.", citationIDs: ["ada_standards"]),
            DosingBlock(label: "Administration", body: "Once daily at the same time each day; do NOT mix in same syringe as other insulins.", citationIDs: ["openfda_endo"])
        ],
        contraindications: AttributedProse(
            "Hypoglycemia. Hypersensitivity to glargine or any component.",
            citationIDs: ["openfda_endo"]
        ),
        warnings: [
            AttributedBullet("Hypoglycemia is the most common and serious adverse effect.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Never IV or in IV pump — long-acting insulins are SC only.", citationIDs: ["openfda_endo", "ismp_high_alert_2024"]),
            AttributedBullet("Hypokalemia — insulin shifts potassium intracellularly; monitor with concurrent K-lowering drugs.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Do NOT mix with any other insulin in the same syringe.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Concentration confusion — Toujeo is U-300; not interchangeable unit-for-unit with U-100 glargine.", citationIDs: ["ismp_high_alert_2024"])
        ],
        adverseReactions: AttributedProse(
            "Hypoglycemia (most common), injection site reactions, lipodystrophy with site reuse, weight gain, peripheral edema, rare allergic reactions.",
            citationIDs: ["openfda_endo"]
        ),
        drugInteractions: [
            AttributedBullet("Hypoglycemia potentiated by: oral hypoglycemics, alcohol, ACE inhibitors, salicylates, MAOIs, sulfa drugs.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Hyperglycemia potentiated by: corticosteroids, atypical antipsychotics, thiazides, niacin, sympathomimetics.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Beta-blockers — mask hypoglycemic warning signs.", citationIDs: ["openfda_endo"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Verify CONCENTRATION (U-100 vs U-300 Toujeo) — different syringes/pens, not interchangeable.", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Inject SC at same time each day, rotating sites.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Do NOT mix with rapid-acting insulin in the same syringe.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Continue basal insulin even when NPO unless provider orders held — abrupt cessation in T1DM precipitates DKA.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Teach hypoglycemia recognition and 15-15 rule (15 g rapid carb, recheck in 15 min).", citationIDs: ["openrn_pharm_endo", "ada_standards"])
        ],
        patientTeaching: AttributedProse(
            "Inject at the same time each day. Rotate sites. Always carry fast-acting sugar (glucose tablets, juice). Test glucose as directed. Do not skip basal insulin even when sick — call your diabetes team for a sick-day plan. Refrigerate unopened pens; once opened, OK at room temp for 28 days (Toujeo varies — check insert).",
            citationIDs: ["openrn_pharm_endo", "ada_standards"]
        ),
        citations: [openfda, openrn, ada, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Insulin Lispro (Humalog / Admelog)

public enum InsulinLisproSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "insulin-lispro",
        title: "Insulin Lispro",
        subtitle: "Humalog · Admelog · rapid-acting insulin analog",
        category: "Insulin (Rapid-Acting)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Rapid-acting insulin analog"),
            KeyValueRow(key: "Onset", value: "10–15 min"),
            KeyValueRow(key: "Peak", value: "30–90 min"),
            KeyValueRow(key: "Duration", value: "3–5 hr"),
            KeyValueRow(key: "Use", value: "Mealtime (prandial) and correction; insulin pump")
        ],
        indications: AttributedProse(
            "Mealtime glycemic control in type 1 and type 2 diabetes; insulin pump therapy. IV in critical care for tight glucose control protocols.",
            citationIDs: ["openfda_endo"]
        ),
        mechanism: AttributedProse(
            "Recombinant insulin analog with reversed lysine-proline at B28-B29 — does not self-associate, allowing rapid SC absorption. Otherwise activates insulin receptor identically.",
            citationIDs: ["openfda_endo"]
        ),
        dosing: [
            DosingBlock(label: "Mealtime", body: "Variable; based on carbohydrate count and current glucose. Typical insulin-to-carb ratio 1:10–1:15 + correction factor per provider.", citationIDs: ["openfda_endo", "ada_standards"]),
            DosingBlock(label: "Timing", body: "0–15 minutes before a meal; can be given immediately after if intake is uncertain.", citationIDs: ["openfda_endo"]),
            DosingBlock(label: "IV (insulin drip)", body: "Per facility protocol for DKA, hyperglycemia in critical illness — use regular insulin or rapid-acting per protocol.", citationIDs: ["openfda_endo"])
        ],
        contraindications: AttributedProse(
            "Hypoglycemia. Hypersensitivity.",
            citationIDs: ["openfda_endo"]
        ),
        warnings: [
            AttributedBullet("Hypoglycemia is the major risk — give immediately before food intake is confirmed.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Pump malfunction or infusion site issues can cause rapid hyperglycemia and DKA.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Hypokalemia — monitor K, especially when given IV in DKA or critical care.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Concentration confusion — Humalog U-200 exists; not interchangeable unit-for-unit with U-100.", citationIDs: ["ismp_high_alert_2024"])
        ],
        adverseReactions: AttributedProse(
            "Hypoglycemia (common), injection site reactions, lipodystrophy with reuse of site, weight gain, allergic reactions (rare).",
            citationIDs: ["openfda_endo"]
        ),
        drugInteractions: [
            AttributedBullet("Hypoglycemia potentiated by: alcohol, sulfonylureas, MAOIs, ACEi, non-selective beta-blockers.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Hyperglycemia potentiated by: steroids, atypical antipsychotics, thiazides, sympathomimetics.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Beta-blockers mask hypoglycemic symptoms.", citationIDs: ["openfda_endo"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Confirm meal will be available within 15 min before giving prandial dose; hold and re-time if NPO.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Check glucose immediately before; hold and notify if <70 mg/dL or per protocol.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Verify CONCENTRATION (U-100 standard; U-200 less common).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Recheck glucose 1–2 hr post-meal; trend and report patterns.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Have rapid carb available at bedside.", citationIDs: ["openrn_pharm_endo"])
        ],
        patientTeaching: AttributedProse(
            "Inject just before eating. Always carry fast-acting sugar. Check glucose as directed. Rotate injection sites. Tell your team about new exercise, illness, or changes in carbohydrate intake — these change your needs.",
            citationIDs: ["openrn_pharm_endo"]
        ),
        citations: [openfda, openrn, ada, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Glucagon

public enum GlucagonSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "glucagon",
        title: "Glucagon",
        subtitle: "GlucaGen · Baqsimi (nasal) · Gvoke (auto-injector) — hypoglycemia rescue",
        category: "Antihypoglycemic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Pancreatic peptide hormone"),
            KeyValueRow(key: "Onset", value: "5–20 min IM/SC; intranasal 8–10 min"),
            KeyValueRow(key: "Half-life", value: "8–18 min (short)"),
            KeyValueRow(key: "Indication", value: "Severe hypoglycemia when patient unable to take oral carbs")
        ],
        indications: AttributedProse(
            "Severe hypoglycemia in patients with diabetes (especially T1DM) who cannot take oral carbohydrates. Diagnostic aid in radiologic procedures (slows GI motility). Beta-blocker overdose with severe bradycardia/hypotension (off-label, large doses).",
            citationIDs: ["openfda_endo"]
        ),
        mechanism: AttributedProse(
            "Stimulates hepatic glycogenolysis and gluconeogenesis → raises serum glucose. Requires hepatic glycogen stores — limited efficacy in malnutrition, alcoholism, or prolonged fasting.",
            citationIDs: ["openfda_endo", "openrn_pharm_endo"]
        ),
        dosing: [
            DosingBlock(label: "Severe hypoglycemia (adult)", body: "1 mg IM/SC × 1; may repeat in 15 min if no response. Intranasal (Baqsimi): 3 mg × 1.", citationIDs: ["openfda_endo"]),
            DosingBlock(label: "Severe hypoglycemia (pediatric)", body: "<25 kg: 0.5 mg IM/SC. ≥25 kg: 1 mg IM/SC. Baqsimi nasal: 3 mg × 1 (≥4 yr).", citationIDs: ["openfda_endo"]),
            DosingBlock(label: "Beta-blocker overdose (off-label)", body: "5–10 mg IV bolus, then continuous infusion 1–10 mg/hr per provider.", citationIDs: ["openfda_endo"])
        ],
        contraindications: AttributedProse(
            "Pheochromocytoma (catecholamine release). Insulinoma (paradoxical hypoglycemia). Hypersensitivity to glucagon.",
            citationIDs: ["openfda_endo"]
        ),
        warnings: [
            AttributedBullet("Less effective in patients with depleted glycogen — alcoholism, prolonged fasting, adrenal insufficiency, chronic hypoglycemia.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Vomiting is common after administration — turn patient on side to prevent aspiration if not fully alert.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Provide oral carbohydrate as soon as patient is able to swallow safely — glucagon effect is short-lived.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Hypertension and tachycardia in patients with pheochromocytoma — contraindication.", citationIDs: ["openfda_endo"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting (very common), transient tachycardia and hypertension, hypokalemia (with high doses), allergic reactions (rare).",
            citationIDs: ["openfda_endo"]
        ),
        drugInteractions: [
            AttributedBullet("Warfarin — glucagon may increase anticoagulant effect.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Beta-blockers — patient may have transient further increase in HR/BP.", citationIDs: ["openfda_endo"])
        ],
        nursingImplications: [
            AttributedBullet("Position patient on side (recovery position) before administration — vomiting common.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Check glucose before and 15 min after administration; provide oral carbs once alert and able to swallow.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("If no response in 15 min, repeat dose and CALL FOR HELP — IV dextrose if available.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Investigate cause — missed meal, exercise, insulin error; teach prevention.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Replace expired auto-injectors / nasal kits at home.", citationIDs: ["openrn_pharm_endo"])
        ],
        patientTeaching: AttributedProse(
            "If you have type 1 diabetes, keep a glucagon kit (auto-injector or nasal) at home, work, and with you when traveling. Teach a family member or coworker how to use it. After it works, eat a longer-acting carb (sandwich, crackers + protein). Replace before expiration.",
            citationIDs: ["openrn_pharm_endo"]
        ),
        citations: [openfda, openrn, ada],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Dextrose 50% (D50)

public enum Dextrose50Sample {
    public static let entry: DrugEntry = DrugEntry(
        id: "dextrose-50",
        title: "Dextrose 50%",
        subtitle: "D50W · 50% dextrose injection — hypoglycemia rescue",
        category: "Carbohydrate / Glucose",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Hypertonic dextrose solution"),
            KeyValueRow(key: "Concentration", value: "0.5 g dextrose per mL (50 g per 100 mL)"),
            KeyValueRow(key: "Route", value: "IV — central preferred; large peripheral OK in emergency"),
            KeyValueRow(key: "Onset", value: "Immediate")
        ],
        indications: AttributedProse(
            "Severe hypoglycemia (BG <50–70 mg/dL) in a patient unable to take oral carbohydrates. Insulin overdose. ACLS hypoglycemia protocols.",
            citationIDs: ["openfda_endo"]
        ),
        mechanism: AttributedProse(
            "Provides immediate exogenous glucose for cellular uptake; rapidly raises blood glucose.",
            citationIDs: ["openfda_endo", "openrn_pharm_endo"]
        ),
        dosing: [
            DosingBlock(label: "Adult (severe hypoglycemia)", body: "12.5–25 g (25–50 mL of D50W) slow IV push; may repeat × 1 if persistent.", citationIDs: ["openfda_endo"]),
            DosingBlock(label: "Pediatric", body: "Use D25W (children) or D10W (neonates) instead — D50W is too hyperosmolar for small veins/CNS.", citationIDs: ["openfda_endo"])
        ],
        contraindications: AttributedProse(
            "Severe hyperglycemia. Intracranial hemorrhage (caution — hyperosmolar load may worsen). Hyponatremia where rapid Na shift could cause harm. Pediatric patients (use lower-concentration dextrose).",
            citationIDs: ["openfda_endo"]
        ),
        warnings: [
            AttributedBullet("EXTRAVASATION — hypertonic; causes severe tissue necrosis. Use only large patent IVs; assess site.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Hyperosmolality and rebound hypoglycemia — recheck glucose 15 min after dose and provide longer-acting carb.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Phlebitis and pain on infusion through small veins.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Wernicke encephalopathy — give thiamine 100 mg IV BEFORE dextrose in known/suspected alcohol use disorder or malnutrition.", citationIDs: ["openrn_pharm_endo"])
        ],
        adverseReactions: AttributedProse(
            "Phlebitis, pain at site, extravasation necrosis, transient hyperglycemia, fluid overload (rare with single dose), rebound hypoglycemia.",
            citationIDs: ["openfda_endo"]
        ),
        drugInteractions: [
            AttributedBullet("Insulin — antagonizes the effect; verify reason for hypoglycemia.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Phenytoin, ceftriaxone — incompatible in same line; flush before/after.", citationIDs: ["openfda_endo"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm hypoglycemia (fingerstick) before giving — do not give based on symptoms alone if glucose available.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Use the LARGEST patent IV available; assess for patency before push.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("In suspected alcohol use disorder or malnutrition: give thiamine 100 mg IV BEFORE dextrose to prevent precipitation of Wernicke encephalopathy.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Recheck glucose 15 min after; give longer-acting carbohydrate when patient can eat safely.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Investigate cause — held diet, insulin overdose, sulfonylurea overdose (will rebound — admit for monitoring), liver failure, sepsis.", citationIDs: ["openrn_pharm_endo"])
        ],
        patientTeaching: AttributedProse(
            "After this rescue, you'll need to eat a longer-acting carb (sandwich, milk and crackers). Tell your provider what caused this low blood sugar so the plan can be adjusted.",
            citationIDs: ["openrn_pharm_endo"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Lactulose

public enum LactuloseSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lactulose",
        title: "Lactulose",
        subtitle: "Enulose · Kristalose · osmotic laxative · hepatic encephalopathy",
        category: "Osmotic Laxative / Ammonia-Lowering",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic non-absorbable disaccharide"),
            KeyValueRow(key: "Onset", value: "Constipation: 24–48 hr · HE: hours"),
            KeyValueRow(key: "Routes", value: "PO, NG, rectal (retention enema)"),
            KeyValueRow(key: "Goal in HE", value: "2–3 soft stools/day")
        ],
        indications: AttributedProse(
            "Chronic constipation. Treatment and prevention of hepatic encephalopathy in cirrhosis (reduces ammonia absorption and traps it in the colon).",
            citationIDs: ["openfda_endo"]
        ),
        mechanism: AttributedProse(
            "In the colon, gut bacteria metabolize lactulose to lactic and acetic acids → lower colonic pH → traps ammonia (NH3) as ammonium (NH4+), which is then excreted. Also creates osmotic gradient producing soft stools.",
            citationIDs: ["openfda_endo", "openrn_pharm_endo"]
        ),
        dosing: [
            DosingBlock(label: "Constipation", body: "15–30 mL PO daily; max 60 mL/day.", citationIDs: ["openfda_endo"]),
            DosingBlock(label: "Hepatic encephalopathy", body: "30–45 mL PO every 1–2 hours initially to induce rapid laxation; then titrate to 2–3 soft stools per day (typically 30–45 mL TID–QID).", citationIDs: ["openfda_endo"]),
            DosingBlock(label: "HE rectal (if obtunded)", body: "300 mL lactulose in 700 mL water as retention enema, retained for 30–60 min, repeated every 4–6 hours until oral therapy possible.", citationIDs: ["openfda_endo"])
        ],
        contraindications: AttributedProse(
            "Galactosemia. Bowel obstruction. Hypersensitivity.",
            citationIDs: ["openfda_endo"]
        ),
        warnings: [
            AttributedBullet("Diarrhea and dehydration with overuse — adjust dose to 2–3 stools/day, not maximum.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Electrolyte disturbances (hypokalemia, hypernatremia) with prolonged or excessive use.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Diabetic patients — lactulose contains some absorbable sugars; monitor glucose.", citationIDs: ["openfda_endo"])
        ],
        adverseReactions: AttributedProse(
            "Bloating, flatulence, cramps, diarrhea (common, dose-dependent), nausea.",
            citationIDs: ["openfda_endo"]
        ),
        drugInteractions: [
            AttributedBullet("Other laxatives — may obscure HE titration endpoint.", citationIDs: ["openfda_endo"]),
            AttributedBullet("Antibiotics (especially neomycin) — can reduce gut bacteria and lactulose efficacy in HE; rifaximin is the standard adjunct.", citationIDs: ["openrn_pharm_endo"])
        ],
        nursingImplications: [
            AttributedBullet("In HE: titrate to 2–3 soft stools/day — track stool frequency closely.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Mix with water, juice, or milk to improve palatability — sweet taste poorly tolerated.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Monitor mental status and ammonia level — clinical assessment is more important than the lab number.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Aspiration precautions if encephalopathic — head of bed elevated; consider NG/PEG if not tolerating PO.", citationIDs: ["openrn_pharm_endo"]),
            AttributedBullet("Replace fluids/electrolytes if losses are significant.", citationIDs: ["openrn_pharm_endo"])
        ],
        patientTeaching: AttributedProse(
            "Take as directed — the goal is 2–3 soft (not watery) stools per day. Drink plenty of water. Don't double doses if you miss one. Report increasing confusion, decreasing alertness, or fewer than 1 stool/day to your liver team.",
            citationIDs: ["openrn_pharm_endo"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}
