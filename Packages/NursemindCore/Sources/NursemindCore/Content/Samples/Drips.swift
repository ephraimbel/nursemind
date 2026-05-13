import Foundation

// MARK: - Common citation sources reused across drips

private let openrnDrip = CitationSource(
    id: "openrn_drips",
    shortName: "Open RN Nursing Pharmacology — IV Continuous Infusions",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
    lastRetrieved: "2026-05-03"
)
private let ssc = CitationSource(
    id: "ssc_2021_pmc",
    shortName: "Surviving Sepsis Campaign 2021 (PMC OA)",
    detail: "Evans L, et al. Crit Care Med 2021",
    publisher: "Society of Critical Care Medicine",
    license: .ccBy4,
    url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8486643/",
    lastRetrieved: "2026-05-03"
)
private let aha = CitationSource(
    id: "aha_acls_drips",
    shortName: "AHA ACLS — Cardiac drip protocols (paraphrased)",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://cpr.heart.org/en/resuscitation-science/cpr-and-ecc-guidelines",
    lastRetrieved: "2026-05-03"
)
private let ismp = CitationSource(
    id: "ismp_high_alert_2024",
    shortName: "ISMP List of High-Alert Medications in Acute Care, 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-03"
)
private let openrnPharm = CitationSource(
    id: "openrn_pharm",
    shortName: "Open RN Nursing Pharmacology — Cardiovascular drugs",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
    lastRetrieved: "2026-05-03"
)
private let openfdaGeneric = CitationSource(
    id: "openfda_generic",
    shortName: "FDA SPL — generic labeling (drug-specific labels via openFDA)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-03"
)

// MARK: - Norepinephrine drip

public enum NorepiDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "norepinephrine-drip",
        title: "Norepinephrine drip",
        subtitle: "Levophed continuous infusion · first-line vasopressor",
        category: "Vasopressor drip",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "α/β agonist (catecholamine)"),
            KeyValueRow(key: "Standard concentration", value: "4 mg / 250 mL D5W or NS (16 mcg/mL)"),
            KeyValueRow(key: "Typical dose", value: "0.05–0.5 mcg/kg/min"),
            KeyValueRow(key: "Max usual", value: "3 mcg/kg/min"),
            KeyValueRow(key: "Goal", value: "MAP ≥65 mmHg"),
            KeyValueRow(key: "Line", value: "Central preferred")
        ],
        indications: AttributedProse(
            "First-line vasopressor for septic shock, cardiogenic shock, post-cardiac arrest hypotension. Per Surviving Sepsis Campaign, norepinephrine is the first-line vasopressor for septic shock with persistent hypotension despite fluid resuscitation.",
            citationIDs: ["ssc_2021_pmc"]
        ),
        mechanism: AttributedProse(
            "Potent α₁ vasoconstrictor with modest β₁ inotropic effect. Increases SVR, MAP, and (modestly) cardiac contractility.",
            citationIDs: ["openrn_pharm"]
        ),
        dosing: [
            DosingBlock(label: "Starting dose", body: "0.05 mcg/kg/min, titrate by 0.02–0.05 mcg/kg/min every 5–15 minutes to MAP ≥65.", citationIDs: ["ssc_2021_pmc"]),
            DosingBlock(label: "Typical range", body: "0.05–0.5 mcg/kg/min.", citationIDs: ["ssc_2021_pmc"]),
            DosingBlock(label: "Max usual", body: "3 mcg/kg/min — beyond this, add a second pressor (vasopressin, epinephrine).", citationIDs: ["ssc_2021_pmc"])
        ],
        contraindications: nil,
        warnings: [
            AttributedBullet("Extravasation causes severe tissue ischemia and necrosis. Phentolamine is the antidote — 5–10 mg in 10 mL NS infiltrated locally.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Central line strongly preferred. If peripheral, use largest vein possible, monitor site every 1 hour, and switch to central as soon as possible.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Reflex bradycardia from rapid blood pressure rise.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Discontinue gradually — abrupt cessation causes rebound hypotension.", citationIDs: ["openrn_pharm"])
        ],
        adverseReactions: AttributedProse("Hypertension, reflex bradycardia, arrhythmias, peripheral ischemia, extravasation injury, anxiety.", citationIDs: ["openrn_pharm"]),
        drugInteractions: [
            AttributedBullet("MAOIs and tricyclics — severe prolonged hypertension.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Halogenated anesthetics — increased ventricular arrhythmia risk.", citationIDs: ["openrn_pharm"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse independent verification of pump rate, concentration, and dose at every change (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Dedicated infusion pump and dedicated central line lumen when possible.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Continuous arterial line BP preferred; if NIBP, cycle every 5 minutes during titration.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Continuous cardiac monitoring; monitor MAP, HR, mental status, urine output, extremity perfusion.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Assess IV site every hour for extravasation; immediately stop and report blanching, swelling, or pain.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Wean slowly when MAP stable on minimum dose for ≥2–4 hours; reduce by 0.02–0.05 mcg/kg/min every 15–30 min.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Document every titration with reason (e.g., MAP 60 → increased to 0.10 mcg/kg/min at 1430).", citationIDs: ["openrn_drips"])
        ],
        patientTeaching: nil,
        citations: [openfdaGeneric, openrnDrip, openrnPharm, ssc, ismp],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Epinephrine drip

public enum EpinephrineDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "epinephrine-drip",
        title: "Epinephrine drip",
        subtitle: "Adrenalin continuous infusion · second-line vasopressor / inotrope",
        category: "Vasopressor / Inotrope drip",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "α and β-adrenergic agonist"),
            KeyValueRow(key: "Standard concentration", value: "4 mg / 250 mL (16 mcg/mL)"),
            KeyValueRow(key: "Typical dose", value: "0.01–0.5 mcg/kg/min"),
            KeyValueRow(key: "Anaphylaxis dose", value: "0.05–0.1 mcg/kg/min IV"),
            KeyValueRow(key: "Goal", value: "MAP, HR, perfusion")
        ],
        indications: AttributedProse(
            "Second-line vasopressor in septic shock (after norepinephrine). Anaphylactic shock with refractory hypotension. Cardiac arrest (1 mg IV/IO bolus per ACLS, not via continuous infusion).",
            citationIDs: ["ssc_2021_pmc", "aha_acls_drips"]
        ),
        mechanism: AttributedProse(
            "Strong α (vasoconstriction) and β₁ (inotropic + chronotropic) at higher doses; predominantly β₂ at low doses (peripheral vasodilation, bronchodilation).",
            citationIDs: ["openrn_pharm"]
        ),
        dosing: [
            DosingBlock(label: "Starting (septic shock)", body: "0.05 mcg/kg/min; titrate by 0.05 mcg/kg/min every 5 min to MAP ≥65.", citationIDs: ["ssc_2021_pmc"]),
            DosingBlock(label: "Anaphylaxis (refractory)", body: "0.05–0.1 mcg/kg/min IV; titrate to BP and symptom resolution.", citationIDs: ["openrn_drips"]),
            DosingBlock(label: "Typical range", body: "0.01–0.5 mcg/kg/min.", citationIDs: ["ssc_2021_pmc"])
        ],
        contraindications: nil,
        warnings: [
            AttributedBullet("Tachyarrhythmias and ventricular ectopy — especially at higher doses.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Increased myocardial oxygen demand — caution in coronary disease.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Extravasation causes ischemia; phentolamine is antidote.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Hyperglycemia — monitor glucose.", citationIDs: ["openrn_pharm"])
        ],
        adverseReactions: AttributedProse("Tachycardia, arrhythmias, hypertension, anxiety, tremor, hyperglycemia, extravasation injury.", citationIDs: ["openrn_pharm"]),
        drugInteractions: [
            AttributedBullet("Beta-blockers — may blunt response; uncommonly cause severe hypertension via unopposed alpha.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("MAOIs, tricyclics — severe hypertension.", citationIDs: ["openrn_pharm"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification per dose change (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Central line strongly preferred; continuous cardiac and BP monitoring.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Monitor for arrhythmias more closely than with norepinephrine — epi has more β effect.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Check blood glucose every 4 hours in continuous infusion.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Assess IV site hourly.", citationIDs: ["openrn_drips"])
        ],
        patientTeaching: nil,
        citations: [openfdaGeneric, openrnDrip, openrnPharm, ssc, aha, ismp],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Vasopressin drip

public enum VasopressinDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "vasopressin-drip",
        title: "Vasopressin drip",
        subtitle: "ADH analogue · adjunct vasopressor in septic shock",
        category: "Vasopressor drip",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Antidiuretic hormone analogue"),
            KeyValueRow(key: "Standard concentration", value: "20 units / 100 mL NS (0.2 units/mL)"),
            KeyValueRow(key: "Fixed dose", value: "0.03–0.04 units/min (NOT titrated)"),
            KeyValueRow(key: "Role", value: "Adjunct to norepinephrine in septic shock")
        ],
        indications: AttributedProse(
            "Per Surviving Sepsis Campaign: add vasopressin to norepinephrine when MAP target is not achieved with norepinephrine alone, to allow norepinephrine dose reduction or as a catecholamine-sparing agent.",
            citationIDs: ["ssc_2021_pmc"]
        ),
        mechanism: AttributedProse(
            "V1 receptor agonist on vascular smooth muscle → vasoconstriction. Independent of adrenergic pathway.",
            citationIDs: ["openrn_pharm"]
        ),
        dosing: [
            DosingBlock(label: "Septic shock dose (fixed)", body: "0.03 units/min by continuous infusion; can increase to 0.04 units/min in selected patients. NOT titrated to BP.", citationIDs: ["ssc_2021_pmc"])
        ],
        contraindications: nil,
        warnings: [
            AttributedBullet("Mesenteric ischemia — caution in patients with peripheral vascular or mesenteric disease.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Coronary vasoconstriction — caution in CAD.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Hyponatremia with prolonged use.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Decreased cardiac output reported with high doses.", citationIDs: ["openrn_pharm"])
        ],
        adverseReactions: AttributedProse("Mesenteric/peripheral ischemia, dysrhythmias, hyponatremia, hypertension, abdominal cramping.", citationIDs: ["openrn_pharm"]),
        drugInteractions: [
            AttributedBullet("Other vasopressors — additive vasoconstriction.", citationIDs: ["openrn_pharm"])
        ],
        nursingImplications: [
            AttributedBullet("Run as a fixed dose — do NOT titrate to MAP.", citationIDs: ["ssc_2021_pmc"]),
            AttributedBullet("Monitor sodium daily.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Assess for mesenteric ischemia — abdominal pain, bloody stools, lactate trending up.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Assess peripheral perfusion every hour.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Wean off when norepinephrine has been weaned to ≤0.1 mcg/kg/min and MAP stable.", citationIDs: ["openrn_drips"])
        ],
        patientTeaching: nil,
        citations: [openfdaGeneric, openrnDrip, ssc, ismp],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Phenylephrine drip

public enum PhenylephrineDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "phenylephrine-drip",
        title: "Phenylephrine drip",
        subtitle: "Neo-Synephrine · pure α₁ vasoconstrictor",
        category: "Vasopressor drip",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective α₁-adrenergic agonist"),
            KeyValueRow(key: "Standard concentration", value: "20 mg / 250 mL (80 mcg/mL)"),
            KeyValueRow(key: "Typical dose", value: "0.4–9.1 mcg/kg/min"),
            KeyValueRow(key: "Use case", value: "Tachyarrhythmia + hypotension (no β effect)")
        ],
        indications: AttributedProse(
            "Hypotension where avoiding β-stimulation is desired (severe tachycardia, hypertrophic cardiomyopathy with outflow obstruction, post-anesthesia hypotension). Anesthesia-induced hypotension.",
            citationIDs: ["openrn_pharm"]
        ),
        mechanism: AttributedProse(
            "Pure α₁ agonist — increases SVR and MAP. No β effect → no inotropy or chronotropy; reflex bradycardia common.",
            citationIDs: ["openrn_pharm"]
        ),
        dosing: [
            DosingBlock(label: "Starting", body: "0.5 mcg/kg/min; titrate to MAP target.", citationIDs: ["openrn_pharm"]),
            DosingBlock(label: "Range", body: "0.4–9.1 mcg/kg/min.", citationIDs: ["openrn_pharm"])
        ],
        contraindications: nil,
        warnings: [
            AttributedBullet("Reflex bradycardia — common; usually does not require treatment.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Increased afterload — may worsen heart failure with reduced EF.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Extravasation causes severe ischemia — phentolamine antidote.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Decreased renal and mesenteric perfusion at high doses.", citationIDs: ["openrn_pharm"])
        ],
        adverseReactions: AttributedProse("Reflex bradycardia, hypertension, decreased cardiac output, peripheral ischemia.", citationIDs: ["openrn_pharm"]),
        drugInteractions: [
            AttributedBullet("MAOIs — severe hypertension.", citationIDs: ["openrn_pharm"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Continuous cardiac and BP monitoring; central line preferred.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Expect HR to drop with BP rise — assess perfusion (mental status, urine output) more than HR alone.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Caution in HFrEF — phenylephrine increases afterload and may decrease cardiac output.", citationIDs: ["openrn_drips"])
        ],
        patientTeaching: nil,
        citations: [openfdaGeneric, openrnDrip, ismp],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Heparin drip

public enum HeparinDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "heparin-drip",
        title: "Heparin drip",
        subtitle: "Continuous IV heparin · therapeutic anticoagulation",
        category: "Anticoagulant drip",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Indirect thrombin inhibitor"),
            KeyValueRow(key: "Standard concentration", value: "25,000 units / 250 mL (100 units/mL) D5W"),
            KeyValueRow(key: "Loading bolus", value: "80 units/kg IV"),
            KeyValueRow(key: "Initial infusion", value: "18 units/kg/hr"),
            KeyValueRow(key: "Goal aPTT", value: "1.5–2.5 × control (per protocol)")
        ],
        indications: AttributedProse(
            "Therapeutic anticoagulation for acute DVT/PE, ACS, atrial fibrillation with thromboembolism, mechanical valve thrombosis, ECMO, CRRT.",
            citationIDs: ["openrn_pharm"]
        ),
        mechanism: AttributedProse(
            "Enhances antithrombin III, inhibiting factors Xa and IIa.",
            citationIDs: ["openrn_pharm"]
        ),
        dosing: [
            DosingBlock(label: "Loading", body: "80 units/kg IV bolus (cap at 10,000 units typical max).", citationIDs: ["openrn_pharm"]),
            DosingBlock(label: "Initial infusion", body: "18 units/kg/hr; round to nearest 50 units/hr.", citationIDs: ["openrn_pharm"]),
            DosingBlock(label: "Adjustments (nomogram)", body: "Adjust per facility-specific aPTT or anti-Xa nomogram every 6 hours until therapeutic, then every 24 hours.", citationIDs: ["openrn_pharm"])
        ],
        contraindications: AttributedProse("History of HIT/HITTS, hypersensitivity, uncontrolled active bleeding (except in DIC), severe thrombocytopenia.", citationIDs: ["openrn_pharm"]),
        warnings: [
            AttributedBullet("HIT/HITTS — monitor platelets at baseline, then every 2–3 days. Discontinue if platelets <100,000 or drop ≥50% from baseline.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Bleeding — monitor for bruising, hematuria, melena, severe headache.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Hyperkalemia — monitor potassium, especially with CKD or potassium-sparing diuretics.", citationIDs: ["openrn_pharm"])
        ],
        adverseReactions: AttributedProse("Bleeding, HIT, thrombocytopenia, hyperkalemia, injection site irritation, hypersensitivity.", citationIDs: ["openrn_pharm"]),
        drugInteractions: [
            AttributedBullet("Other anticoagulants and antiplatelets — additive bleeding.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("NSAIDs — additive bleeding.", citationIDs: ["openrn_pharm"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification of bag, concentration, weight, and rate (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Use a dedicated pump and clearly label the line.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Draw aPTT (or anti-Xa) per protocol — typically every 6 hours until therapeutic, then every 24 hours.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Monitor CBC and platelets at baseline and per protocol.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Assess for bleeding every shift — pad placement, gum/nose, urine, stool, neuro signs.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Have protamine sulfate available as the reversal agent (1 mg neutralizes ~100 units heparin).", citationIDs: ["openrn_drips"]),
            AttributedBullet("Hold for 1 hour before invasive procedures per provider; restart per orders.", citationIDs: ["openrn_drips"])
        ],
        patientTeaching: AttributedProse("Report any unusual bleeding, severe headache, or signs of stroke immediately. Avoid IM injections, contact sports, and razors with blades. Inform all providers about heparin therapy.", citationIDs: ["openrn_pharm"]),
        citations: [openfdaGeneric, openrnDrip, openrnPharm, ismp],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Insulin drip (DKA / hyperglycemic crisis)

public enum InsulinDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "insulin-drip",
        title: "Insulin drip",
        subtitle: "Continuous IV regular insulin · DKA / HHS / glycemic control",
        category: "Antidiabetic drip",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Short-acting human insulin"),
            KeyValueRow(key: "Standard concentration", value: "100 units / 100 mL NS (1 unit/mL)"),
            KeyValueRow(key: "DKA initial", value: "0.1 units/kg/hr (after K⁺ verified ≥3.3)"),
            KeyValueRow(key: "Goal glucose drop", value: "50–75 mg/dL/hr")
        ],
        indications: AttributedProse(
            "Diabetic ketoacidosis (DKA), hyperosmolar hyperglycemic state (HHS), perioperative glycemic control, ICU glycemic control, hyperkalemia (with dextrose) treatment.",
            citationIDs: ["openrn_pharm"]
        ),
        mechanism: AttributedProse(
            "Stimulates peripheral glucose uptake and inhibits hepatic glucose production.",
            citationIDs: ["openrn_pharm"]
        ),
        dosing: [
            DosingBlock(label: "DKA — verify K⁺ first", body: "Verify potassium ≥3.3 mEq/L. Start 0.1 units/kg/hr; goal glucose drop 50–75 mg/dL/hr. When glucose ≤200, add D5 to fluids and reduce insulin to 0.05 units/kg/hr.", citationIDs: ["openrn_pharm"]),
            DosingBlock(label: "Hyperkalemia treatment", body: "10 units IV regular insulin + 25 g dextrose IV (do NOT use as drip).", citationIDs: ["openrn_pharm"]),
            DosingBlock(label: "ICU glycemic", body: "Variable per facility protocol (typically 0.5–6 units/hr titrated to target glucose).", citationIDs: ["openrn_pharm"])
        ],
        contraindications: AttributedProse("Hypoglycemia, potassium <3.3 mEq/L (in DKA — replace K⁺ first), hypersensitivity to insulin.", citationIDs: ["openrn_pharm"]),
        warnings: [
            AttributedBullet("Hypoglycemia — most common and life-threatening complication.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Hypokalemia — insulin shifts K⁺ intracellularly; replace aggressively in DKA.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Cerebral edema in pediatric DKA — too-rapid glucose correction increases risk.", citationIDs: ["openrn_pharm"])
        ],
        adverseReactions: AttributedProse("Hypoglycemia, hypokalemia, allergic reactions.", citationIDs: ["openrn_pharm"]),
        drugInteractions: [
            AttributedBullet("Beta-blockers — mask adrenergic warning signs of hypoglycemia.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Corticosteroids — antagonize insulin; expect higher requirements.", citationIDs: ["openrn_pharm"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification — wrong insulin type or concentration is a sentinel-event-class error (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Use ONLY insulin syringes/pumps; NEVER tuberculin or 1-mL syringes.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Hourly fingerstick glucose; goal drop 50–75 mg/dL/hr in DKA.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Monitor potassium every 2 hours initially in DKA; replace before/with insulin if K⁺ <5.3.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Add D5 to fluids when glucose ≤200 mg/dL; do not stop insulin until anion gap normalizes.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Transition to subcutaneous insulin only after anion gap closed AND patient eating; overlap IV and SC by 1–2 hours.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Have D50W available at bedside for hypoglycemia.", citationIDs: ["openrn_drips"])
        ],
        patientTeaching: nil,
        citations: [openfdaGeneric, openrnDrip, openrnPharm, ismp],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Propofol drip

public enum PropofolDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "propofol-drip",
        title: "Propofol drip",
        subtitle: "Diprivan · ICU sedation",
        category: "Sedative drip",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "GABA-A potentiator (general anesthetic)"),
            KeyValueRow(key: "Standard concentration", value: "10 mg/mL (1%) — undiluted"),
            KeyValueRow(key: "ICU dose", value: "5–80 mcg/kg/min"),
            KeyValueRow(key: "Onset", value: "<1 min"),
            KeyValueRow(key: "Calorie content", value: "1.1 kcal/mL — count toward TPN")
        ],
        indications: AttributedProse(
            "ICU sedation in mechanically ventilated patients. Procedural sedation. Induction of general anesthesia.",
            citationIDs: ["openrn_pharm"]
        ),
        mechanism: AttributedProse(
            "Potentiates GABA-A receptor activity, producing rapid-onset, short-duration sedation, hypnosis, and amnesia.",
            citationIDs: ["openrn_pharm"]
        ),
        dosing: [
            DosingBlock(label: "ICU sedation", body: "Start 5 mcg/kg/min; titrate by 5 mcg/kg/min every 5–10 min to RASS goal. Typical range 5–50 mcg/kg/min.", citationIDs: ["openrn_pharm"]),
            DosingBlock(label: "Maximum sustained", body: "Avoid >67 mcg/kg/min for >48 hours (PRIS risk).", citationIDs: ["openrn_pharm"])
        ],
        contraindications: AttributedProse("Hypersensitivity to propofol, eggs, soybeans, or sulfites (formulation-dependent). Use with caution in shock or hypovolemia.", citationIDs: ["openrn_pharm"]),
        warnings: [
            AttributedBullet("Hypotension — common, especially with rapid rate increases.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Respiratory depression — only for intubated patients (in continuous infusion).", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Propofol-related infusion syndrome (PRIS) — metabolic acidosis, hyperkalemia, rhabdomyolysis, AKI, cardiac collapse. Risk with high doses (>67 mcg/kg/min) and prolonged use (>48 hr). Monitor lactate, CK, triglycerides.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Hypertriglyceridemia — pancreatitis risk; check triglycerides every 48 hours.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Bacterial contamination — change tubing AND bottle every 12 hours; use strict aseptic technique.", citationIDs: ["openrn_pharm"])
        ],
        adverseReactions: AttributedProse("Hypotension, bradycardia, respiratory depression, injection site pain, hypertriglyceridemia, PRIS (rare but fatal).", citationIDs: ["openrn_pharm"]),
        drugInteractions: [
            AttributedBullet("Other CNS depressants (opioids, benzodiazepines) — additive sedation and respiratory depression.", citationIDs: ["openrn_pharm"])
        ],
        nursingImplications: [
            AttributedBullet("Patient must be intubated for continuous infusion; not for spontaneously breathing patients.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Change tubing and bottle every 12 hours strictly — bacterial growth in lipid emulsion.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Daily sedation interruption / spontaneous awakening trial per facility protocol.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Monitor BP every 15 min during titration; expect hypotension.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Monitor triglycerides at baseline and every 48 hours; lactate, CK, lipase if PRIS suspected.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Count propofol calories in nutrition planning — 1.1 kcal/mL.", citationIDs: ["openrn_drips"])
        ],
        patientTeaching: nil,
        citations: [openfdaGeneric, openrnDrip, openrnPharm, ismp],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Diltiazem drip

public enum DiltiazemDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "diltiazem-drip",
        title: "Diltiazem drip",
        subtitle: "Cardizem · rate control for atrial fibrillation/flutter",
        category: "Antiarrhythmic drip",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-dihydropyridine calcium-channel blocker"),
            KeyValueRow(key: "Standard concentration", value: "125 mg / 100 mL (1.25 mg/mL)"),
            KeyValueRow(key: "Bolus", value: "0.25 mg/kg IV (avg 20 mg) over 2 min"),
            KeyValueRow(key: "Infusion", value: "5–15 mg/hr"),
            KeyValueRow(key: "Goal", value: "HR <110 (or per provider)")
        ],
        indications: AttributedProse(
            "Rate control of atrial fibrillation and atrial flutter with rapid ventricular response. Acute treatment of paroxysmal supraventricular tachycardia (after vagal maneuvers).",
            citationIDs: ["openrn_pharm"]
        ),
        mechanism: AttributedProse(
            "Blocks slow calcium channels in cardiac conduction tissue → slows AV node conduction, reduces ventricular rate, mild negative inotropy.",
            citationIDs: ["openrn_pharm"]
        ),
        dosing: [
            DosingBlock(label: "Initial bolus", body: "0.25 mg/kg IV over 2 minutes (typical 20 mg). May repeat 0.35 mg/kg IV in 15 min if inadequate.", citationIDs: ["openrn_pharm"]),
            DosingBlock(label: "Continuous infusion", body: "5–15 mg/hr, titrated to HR target.", citationIDs: ["openrn_pharm"])
        ],
        contraindications: AttributedProse("Sick sinus syndrome (without pacemaker), 2°/3° AV block, hypotension (SBP <90), wide-complex tachycardia (Wolff-Parkinson-White), severe heart failure with reduced EF.", citationIDs: ["openrn_pharm"]),
        warnings: [
            AttributedBullet("Hypotension — common; have IV calcium and IV fluids available.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Bradycardia and AV block — additive with beta-blockers; avoid combination.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Worsening heart failure with reduced EF.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Wide-complex tachycardia of uncertain origin — could be VT or WPW; can cause cardiac arrest.", citationIDs: ["openrn_pharm"])
        ],
        adverseReactions: AttributedProse("Hypotension, bradycardia, AV block, heart failure exacerbation, peripheral edema, headache.", citationIDs: ["openrn_pharm"]),
        drugInteractions: [
            AttributedBullet("Beta-blockers — additive bradycardia and AV block; avoid IV combination.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Digoxin — diltiazem increases digoxin levels.", citationIDs: ["openrn_pharm"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous cardiac monitoring; check BP every 15 minutes during titration.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Have IV calcium gluconate and IV fluids at bedside for hypotension.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Confirm narrow-complex rhythm before bolus — wide-complex of uncertain origin is contraindicated.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Hold and notify provider if HR <60 or SBP <90.", citationIDs: ["openrn_drips"]),
            AttributedBullet("Transition to PO diltiazem when stable — typical conversion: continuous rate × 3 + 3 = total daily PO dose, divided.", citationIDs: ["openrn_drips"])
        ],
        patientTeaching: nil,
        citations: [openfdaGeneric, openrnDrip, openrnPharm],
        lastSourceFidelityReview: "2026-05-03"
    )
}
