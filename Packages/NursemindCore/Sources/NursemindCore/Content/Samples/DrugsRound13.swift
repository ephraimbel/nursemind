import Foundation

// Curator-model drug entries (round 13 expansion — endocrine + nephrology + DM/HF + pulm).
// Sources: openFDA SPL (CC0), Open RN Pharmacology (CC BY 4.0), CDC + ATA / Endo Society / KDIGO / ATS concept citations.

private let openfda = CitationSource(
    id: "openfda_round13",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR13 = CitationSource(
    id: "openrn_pharm_round13",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=thyroid+ADH+SGLT2+GLP1",
    lastRetrieved: "2026-05-04"
)
private let cdcR13 = CitationSource(
    id: "cdc_round13",
    shortName: "CDC clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let specialtyR13 = CitationSource(
    id: "specialty_round13",
    shortName: "ATA / Endocrine Society / KDIGO / ATS concept citations",
    publisher: "American Thyroid Association · Endocrine Society · KDIGO · ATS",
    license: .factCitationOnly,
    url: "https://www.thyroid.org/professionals/ata-professional-guidelines/",
    lastRetrieved: "2026-05-04"
)

// MARK: - Methimazole

public enum MethimazoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "methimazole",
        title: "Methimazole",
        subtitle: "Tapazole · thionamide · Graves' disease + hyperthyroidism",
        category: "Antithyroid (thionamide)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Thionamide antithyroid"),
            KeyValueRow(key: "Indications", value: "Hyperthyroidism (preferred over PTU EXCEPT 1st-trimester pregnancy + thyroid storm)"),
            KeyValueRow(key: "Onset", value: "Clinical effect 4–8 weeks"),
            KeyValueRow(key: "Boxed warnings", value: "Agranulocytosis (rare); congenital aplasia cutis (1st trimester)")
        ],
        indications: AttributedProse(
            "Treatment of hyperthyroidism (Graves' disease, toxic multinodular goiter, toxic adenoma); pre-thyroidectomy or pre-radioactive-iodine preparation; preferred over PTU except in 1st trimester pregnancy and thyroid storm per primary source.",
            citationIDs: ["openfda_round13", "specialty_round13"]
        ),
        mechanism: AttributedProse(
            "Inhibits thyroid peroxidase → blocks iodination and coupling of tyrosine residues → reduces thyroid hormone synthesis. Does NOT block T4-to-T3 peripheral conversion (vs PTU which does).",
            citationIDs: ["openfda_round13"]
        ),
        dosing: [
            DosingBlock(label: "Hyperthyroidism (adult)", body: "Initial 5–60 mg/day PO divided BID-TID based on severity; titrate to TSH/free T4; maintenance often 5–15 mg/day per primary source.", citationIDs: ["openfda_round13"])
        ],
        contraindications: AttributedProse(
            "First trimester of pregnancy (use PTU); breastfeeding (acceptable in low doses); hypersensitivity to methimazole/thionamides; severe hepatic disease per primary source.",
            citationIDs: ["openfda_round13"]
        ),
        warnings: [
            AttributedBullet("AGRANULOCYTOSIS (rare but life-threatening) — fever, sore throat → STOP and check CBC immediately; baseline + monitoring per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Hepatotoxicity — cholestatic injury; LFT monitoring.", citationIDs: ["openfda_round13"]),
            AttributedBullet("BOXED for PTU but not methimazole — vasculitis (ANCA-associated) reported.", citationIDs: ["openfda_round13"]),
            AttributedBullet("First-trimester pregnancy — congenital aplasia cutis, choanal/esophageal atresia per primary source.", citationIDs: ["openfda_round13"])
        ],
        adverseReactions: AttributedProse(
            "Rash (very common), arthralgia, GI upset, transient leukopenia, transient transaminitis, agranulocytosis (rare), cholestatic hepatitis (rare).",
            citationIDs: ["openfda_round13"]
        ),
        drugInteractions: [
            AttributedBullet("Warfarin — methimazole REDUCES anticoagulant effect by lowering hyperthyroid-induced increased clotting-factor metabolism.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Digoxin — hyperthyroid resolution may increase digoxin levels.", citationIDs: ["openfda_round13"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel — STOP and notify provider for fever / sore throat / mouth ulcers (agranulocytosis warning) per primary source.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Baseline + ongoing CBC, LFTs, TSH / free T4.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Pregnancy — switch to PTU in 1st trimester; can switch back to methimazole after.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Take with or without food at consistent times.", citationIDs: ["openrn_pharm_round13"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed. STOP and call us right away for fever, sore throat, mouth sores, yellow skin or eyes, or unusual fatigue. Get blood tests as scheduled. If you become pregnant, tell us right away — we will switch your medication for the first trimester.",
            citationIDs: ["openrn_pharm_round13"]
        ),
        citations: [openfda, openrnPharmR13, specialtyR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - PTU

public enum PTUSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ptu",
        title: "Propylthiouracil (PTU)",
        subtitle: "Thionamide · 1st-trimester pregnancy + thyroid storm · BOXED hepatotoxicity",
        category: "Antithyroid (thionamide)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Thionamide antithyroid"),
            KeyValueRow(key: "Indications", value: "Hyperthyroidism in 1st trimester pregnancy; thyroid storm (blocks peripheral T4→T3 conversion); methimazole-intolerant"),
            KeyValueRow(key: "Boxed warning", value: "SEVERE HEPATOTOXICITY (sometimes fatal) — limits routine first-line use"),
            KeyValueRow(key: "Notable", value: "Blocks peripheral T4 → T3 conversion (preferred in thyroid storm)")
        ],
        indications: AttributedProse(
            "Hyperthyroidism in adult and pediatric patients; first-trimester pregnancy; thyroid storm (blocks peripheral T4→T3 conversion); when methimazole is contraindicated per primary source.",
            citationIDs: ["openfda_round13", "specialty_round13"]
        ),
        mechanism: AttributedProse(
            "Inhibits thyroid peroxidase + blocks peripheral 5'-deiodinase (T4→T3 conversion) → reduces thyroid hormone synthesis AND active hormone available.",
            citationIDs: ["openfda_round13"]
        ),
        dosing: [
            DosingBlock(label: "Hyperthyroidism (adult)", body: "Initial 100–150 mg PO TID; maintenance 50–300 mg/day in 2–3 divided doses per primary source.", citationIDs: ["openfda_round13"]),
            DosingBlock(label: "Thyroid storm", body: "200–400 mg PO/NG every 4 hours; max 1200 mg/day per primary source.", citationIDs: ["openfda_round13"])
        ],
        contraindications: AttributedProse(
            "Pre-existing severe hepatic disease; hypersensitivity to thionamides per primary source.",
            citationIDs: ["openfda_round13"]
        ),
        warnings: [
            AttributedBullet("BOXED — severe hepatotoxicity / acute liver failure (sometimes fatal); baseline + ongoing LFTs; STOP for ALT >3× ULN per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("AGRANULOCYTOSIS (rare) — fever / sore throat → STOP and check CBC.", citationIDs: ["openfda_round13"]),
            AttributedBullet("ANCA-associated vasculitis with chronic use.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Congenital malformations less than methimazole in 1st trimester per primary source.", citationIDs: ["openfda_round13"])
        ],
        adverseReactions: AttributedProse(
            "Rash, GI upset, hepatotoxicity, agranulocytosis, vasculitis.",
            citationIDs: ["openfda_round13"]
        ),
        drugInteractions: [
            AttributedBullet("Same as methimazole — warfarin, digoxin.", citationIDs: ["openfda_round13"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel — STOP for jaundice, dark urine, fatigue, severe abdominal pain, fever, sore throat per primary source.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Baseline + monthly LFTs first 6 months; ongoing CBC, TSH / free T4.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("In thyroid storm — give PTU FIRST then iodine (Lugol) at least 1 hour later (PTU blocks new hormone; iodine without prior PTU could fuel synthesis) per primary source.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Switch to methimazole after 1st trimester to reduce hepatotoxicity risk per primary source.", citationIDs: ["openrn_pharm_round13"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed in divided doses. STOP and call us right away for fever / sore throat, yellow skin or eyes, dark urine, severe nausea, severe abdominal pain, or unusual fatigue. Get blood tests as scheduled.",
            citationIDs: ["openrn_pharm_round13"]
        ),
        citations: [openfda, openrnPharmR13, specialtyR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Desmopressin

public enum DesmopressinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "desmopressin",
        title: "Desmopressin (DDAVP)",
        subtitle: "Synthetic ADH analog · central DI + nocturnal enuresis + von Willebrand / mild hemophilia A",
        category: "Vasopressin analog",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic vasopressin V2 receptor agonist"),
            KeyValueRow(key: "Indications", value: "Central diabetes insipidus, primary nocturnal enuresis, von Willebrand disease type 1, mild hemophilia A"),
            KeyValueRow(key: "Forms", value: "Intranasal, oral, IV/SC; varied potencies — DOSING IS CRITICAL"),
            KeyValueRow(key: "Notable", value: "BOXED warning — severe hyponatremia / seizure (especially intranasal) per primary source")
        ],
        indications: AttributedProse(
            "Central diabetes insipidus; nocturnal enuresis (children); von Willebrand disease type 1 + mild hemophilia A (releases stored vWF / Factor VIII); platelet dysfunction in uremia per primary source.",
            citationIDs: ["openfda_round13", "specialty_round13"]
        ),
        mechanism: AttributedProse(
            "V2 receptor agonist in renal collecting duct → increases free-water reabsorption (antidiuretic). At higher doses + IV → releases vWF and Factor VIII from endothelial stores.",
            citationIDs: ["openfda_round13"]
        ),
        dosing: [
            DosingBlock(label: "Central DI (oral)", body: "0.05–0.4 mg PO BID-TID; titrate to urine output / sodium per primary source.", citationIDs: ["openfda_round13"]),
            DosingBlock(label: "Central DI (intranasal)", body: "10–40 mcg intranasal daily or BID per primary source.", citationIDs: ["openfda_round13"]),
            DosingBlock(label: "vWD / hemophilia A (IV)", body: "0.3 mcg/kg IV over 30 min; tachyphylaxis after repeated doses per primary source.", citationIDs: ["openfda_round13"])
        ],
        contraindications: AttributedProse(
            "Hyponatremia or risk of severe water retention; type 2B von Willebrand disease (paradoxical thrombocytopenia); CrCl <50 (relative); hypersensitivity per primary source.",
            citationIDs: ["openfda_round13"]
        ),
        warnings: [
            AttributedBullet("BOXED — severe hyponatremia and seizures (especially with intranasal form, fluid restriction not followed); MONITOR sodium per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("FDA RESTRICTED intranasal indication for nocturnal enuresis (2007) due to seizure deaths.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Tachyphylaxis with repeated doses for hemophilia A / vWD per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Hypertension (rare).", citationIDs: ["openfda_round13"])
        ],
        adverseReactions: AttributedProse(
            "Hyponatremia, headache, nausea, abdominal cramps, flushing, hypertension.",
            citationIDs: ["openfda_round13"]
        ),
        drugInteractions: [
            AttributedBullet("SSRIs, NSAIDs, carbamazepine — additive hyponatremia.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Loop diuretics — antagonize antidiuretic effect.", citationIDs: ["openfda_round13"])
        ],
        nursingImplications: [
            AttributedBullet("Restrict fluid per provider — drinking to thirst not always appropriate; counsel against excessive water intake.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Trend serum sodium daily during initiation in DI; weekly thereafter.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Strict I&O; daily weights; urine specific gravity in DI titration.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Hold dose if hyponatremia develops; restart at lower dose with provider.", citationIDs: ["openrn_pharm_round13"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed; do not double up. Tell us about headache, nausea, confusion, lethargy, or seizure — these are signs of low sodium. Limit fluids per your provider's guidance. Tell us if you have any new medical conditions or medications.",
            citationIDs: ["openrn_pharm_round13"]
        ),
        citations: [openfda, openrnPharmR13, specialtyR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Fludrocortisone

public enum FludrocortisoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "fludrocortisone",
        title: "Fludrocortisone",
        subtitle: "Florinef · synthetic mineralocorticoid · adrenal insufficiency replacement",
        category: "Mineralocorticoid (synthetic)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic mineralocorticoid (high mineralocorticoid + modest glucocorticoid activity)"),
            KeyValueRow(key: "Indications", value: "Primary adrenal insufficiency (Addison), congenital adrenal hyperplasia, salt-wasting CAH, orthostatic hypotension"),
            KeyValueRow(key: "Critical", value: "Used WITH glucocorticoid (hydrocortisone) for adrenal insufficiency, not alone"),
            KeyValueRow(key: "Notable", value: "STRESS DOSE not typically increased for fludrocortisone (vs glucocorticoid which is)")
        ],
        indications: AttributedProse(
            "Mineralocorticoid replacement in primary adrenal insufficiency (Addison's disease) and salt-losing forms of congenital adrenal hyperplasia; off-label orthostatic hypotension per primary source.",
            citationIDs: ["openfda_round13", "specialty_round13"]
        ),
        mechanism: AttributedProse(
            "Synthetic aldosterone analog → activates mineralocorticoid receptors in distal tubule → increases sodium reabsorption + potassium / hydrogen ion excretion → expands volume, raises BP.",
            citationIDs: ["openfda_round13"]
        ),
        dosing: [
            DosingBlock(label: "Adrenal insufficiency (adult)", body: "0.05–0.2 mg PO daily; titrate to BP, electrolytes, plasma renin activity per primary source.", citationIDs: ["openfda_round13"]),
            DosingBlock(label: "Pediatric (CAH salt-losing)", body: "0.05–0.3 mg PO daily; higher doses in infants; titrate per primary source.", citationIDs: ["openfda_round13"])
        ],
        contraindications: AttributedProse(
            "Systemic fungal infection; HF; hypertension (relative); hypersensitivity per primary source.",
            citationIDs: ["openfda_round13"]
        ),
        warnings: [
            AttributedBullet("Hypertension, edema, hypokalemia, hypernatremia (as expected from mineralocorticoid action).", citationIDs: ["openfda_round13"]),
            AttributedBullet("Caution in HF (volume expansion).", citationIDs: ["openfda_round13"]),
            AttributedBullet("Adrenal insufficiency patients still need stress-dose GLUCOCORTICOID for illness / surgery; fludrocortisone dose not typically increased.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Cushingoid features at high doses.", citationIDs: ["openfda_round13"])
        ],
        adverseReactions: AttributedProse(
            "Hypertension, edema, hypokalemia, headache, weight gain.",
            citationIDs: ["openfda_round13"]
        ),
        drugInteractions: [
            AttributedBullet("Diuretics — opposing effects; loop / thiazide can worsen hypokalemia.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Potassium supplements / ACE inhibitors / ARBs — usually well tolerated but monitor K.", citationIDs: ["openfda_round13"])
        ],
        nursingImplications: [
            AttributedBullet("Trend BP, electrolytes (Na + K), volume status.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Counsel adrenal-insufficiency patients on STRESS DOSE STEROIDS for illness / surgery — DOUBLE / TRIPLE hydrocortisone, fludrocortisone usually unchanged per primary source.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Patient + family education on adrenal-crisis recognition; injectable hydrocortisone (Solu-Cortef Act-O-Vial) for emergency use; medical-alert ID per primary source.", citationIDs: ["openrn_pharm_round13"])
        ],
        patientTeaching: AttributedProse(
            "Take this medicine every day. Do NOT stop suddenly. For illness or surgery, your hydrocortisone dose increases — fludrocortisone usually stays the same. Carry an injectable hydrocortisone kit and wear a medical-alert ID. Tell us about leg swelling, severe headache, or significant weight gain.",
            citationIDs: ["openrn_pharm_round13"]
        ),
        citations: [openfda, openrnPharmR13, specialtyR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tolvaptan

public enum TolvaptanSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tolvaptan",
        title: "Tolvaptan",
        subtitle: "Samsca · Jynarque · V2 receptor antagonist · hyponatremia + ADPKD",
        category: "Vasopressin V2 antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective V2 receptor antagonist (\"vaptan\")"),
            KeyValueRow(key: "Indications", value: "Hypervolemic + euvolemic hyponatremia (Samsca); slowing of ADPKD progression (Jynarque)"),
            KeyValueRow(key: "Boxed warnings", value: "Hepatotoxicity (Jynarque); osmotic demyelination from too-rapid Na correction (Samsca)"),
            KeyValueRow(key: "Setting", value: "Inpatient initiation per FDA REMS for both forms")
        ],
        indications: AttributedProse(
            "Clinically significant hypervolemic + euvolemic hyponatremia (heart failure, SIADH, hepatic) — Samsca; treatment to slow kidney function decline in autosomal dominant polycystic kidney disease (ADPKD) — Jynarque per primary source.",
            citationIDs: ["openfda_round13", "specialty_round13"]
        ),
        mechanism: AttributedProse(
            "Selective competitive antagonist at V2 receptors → blocks ADH-mediated water reabsorption in collecting duct → increases free-water excretion (\"aquaresis\") without changing sodium excretion → raises serum sodium.",
            citationIDs: ["openfda_round13"]
        ),
        dosing: [
            DosingBlock(label: "Hyponatremia (Samsca)", body: "Initial 15 mg PO daily; titrate to max 60 mg/day with MONITORED inpatient sodium correction per primary source.", citationIDs: ["openfda_round13"]),
            DosingBlock(label: "ADPKD (Jynarque)", body: "60 mg/day PO (split — 45 mg morning + 15 mg afternoon) titrated up; LFT-monitored REMS program per primary source.", citationIDs: ["openfda_round13"])
        ],
        contraindications: AttributedProse(
            "Anuria; volume depletion; severe hyponatremia requiring urgent correction (hypertonic saline); concurrent strong CYP3A4 inhibitors; hepatic impairment (Jynarque); hypersensitivity per primary source.",
            citationIDs: ["openfda_round13"]
        ),
        warnings: [
            AttributedBullet("BOXED (Samsca) — too-rapid sodium correction → osmotic demyelination syndrome (central pontine myelinolysis); INPATIENT-monitored initiation; max sodium correction 8–10 mEq/L per 24 hr per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("BOXED (Jynarque) — hepatotoxicity; FDA REMS with monthly LFTs first 18 months per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Limited duration use (Samsca <30 days) due to liver risk per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Hypovolemia / hypotension; DEHYDRATION risk if patient cannot drink — encourage water intake to thirst.", citationIDs: ["openfda_round13"])
        ],
        adverseReactions: AttributedProse(
            "Thirst, polyuria, dry mouth, hyperglycemia, dehydration, hepatotoxicity.",
            citationIDs: ["openfda_round13"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, macrolides, grapefruit) — RAISE tolvaptan; AVOID concurrent.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Strong CYP3A4 inducers — LOWER levels.", citationIDs: ["openfda_round13"])
        ],
        nursingImplications: [
            AttributedBullet("Inpatient-monitored sodium correction; check Na every 6 hours during initiation per primary source.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("For ADPKD (Jynarque) — monthly LFTs first 18 months; STOP if ALT/AST > 3× ULN per primary source.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Allow patient to drink to thirst — restrict fluids only if hyponatremia worsens.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Counsel about polyuria / nocturia — may be significant.", citationIDs: ["openrn_pharm_round13"])
        ],
        patientTeaching: AttributedProse(
            "You will start this medicine in the hospital so we can monitor your sodium. Drink water when you are thirsty — don't restrict fluids. Tell us about severe headache, confusion, swallowing problems, or yellow skin or eyes. Get blood tests as scheduled.",
            citationIDs: ["openrn_pharm_round13"]
        ),
        citations: [openfda, openrnPharmR13, specialtyR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tirzepatide

public enum TirzepatideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tirzepatide",
        title: "Tirzepatide",
        subtitle: "Mounjaro / Zepbound · dual GLP-1 + GIP agonist · T2DM + obesity",
        category: "Dual incretin agonist (GLP-1 + GIP)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dual GIP / GLP-1 receptor agonist"),
            KeyValueRow(key: "Indications", value: "Type 2 diabetes (Mounjaro); chronic weight management (Zepbound)"),
            KeyValueRow(key: "Form", value: "Once-weekly SQ injection (auto-injector pen)"),
            KeyValueRow(key: "Boxed warning", value: "Thyroid C-cell tumor risk (animal data); contraindicated in personal/family MEN-2 / medullary thyroid carcinoma")
        ],
        indications: AttributedProse(
            "Type 2 diabetes mellitus as adjunct to diet and exercise; chronic weight management in obesity (Zepbound brand for weight loss only) per primary source.",
            citationIDs: ["openfda_round13", "specialty_round13"]
        ),
        mechanism: AttributedProse(
            "Activates GIP (glucose-dependent insulinotropic peptide) AND GLP-1 receptors → enhances glucose-dependent insulin secretion, suppresses glucagon, slows gastric emptying, reduces appetite. Dual mechanism more potent than GLP-1 alone for weight loss.",
            citationIDs: ["openfda_round13"]
        ),
        dosing: [
            DosingBlock(label: "T2DM / weight management", body: "Initial 2.5 mg SQ once weekly × 4 weeks; titrate by 2.5 mg every 4 weeks; max 15 mg/week per primary source.", citationIDs: ["openfda_round13"])
        ],
        contraindications: AttributedProse(
            "Personal / family history of medullary thyroid carcinoma or MEN-2; hypersensitivity per primary source.",
            citationIDs: ["openfda_round13"]
        ),
        warnings: [
            AttributedBullet("BOXED — thyroid C-cell tumor in rodents; counsel and monitor for thyroid mass / persistent hoarseness / dysphagia per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Pancreatitis — STOP if severe abdominal pain; lipase + clinical assessment.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Gallbladder disease — biliary colic / cholecystitis with rapid weight loss.", citationIDs: ["openfda_round13"]),
            AttributedBullet("AKI — reduced volume from N/V; hydration counseling.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Hypoglycemia when combined with insulin / sulfonylurea — REDUCE companion-drug doses.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Diabetic retinopathy — possible worsening with rapid glucose improvement.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Suicidal ideation — class effect of GLP-1 agents being investigated; counsel about mood changes per primary source.", citationIDs: ["openfda_round13"])
        ],
        adverseReactions: AttributedProse(
            "Nausea (very common, dose-related), vomiting, diarrhea, constipation, decreased appetite, abdominal pain, injection-site reactions, pancreatitis, gallbladder disease.",
            citationIDs: ["openfda_round13"]
        ),
        drugInteractions: [
            AttributedBullet("Insulin / sulfonylurea — additive hypoglycemia; reduce companion dose.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Oral medications — slowed gastric emptying may delay / reduce absorption; OCPs may need backup method during dose escalation per primary source.", citationIDs: ["openfda_round13"])
        ],
        nursingImplications: [
            AttributedBullet("Teach SQ injection technique (thigh / abdomen / upper arm); rotate sites; weekly dosing.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Counsel about GI side effects — peak with each dose escalation; small frequent meals; HYDRATION (avoid AKI).", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Trend A1c, lipids, weight, kidney function.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Counsel insulin / sulfonylurea adjustment; hypoglycemia recognition + treatment.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Pre-procedure / surgery — GLP-1 agents may cause delayed gastric emptying; ASA recommends 1-week hold before elective surgery per primary source.", citationIDs: ["openrn_pharm_round13"])
        ],
        patientTeaching: AttributedProse(
            "Inject under the skin once a week, same day each week. Rotate injection sites. Expect nausea — usually improves over weeks; eat small frequent meals; stay hydrated. Tell us about severe stomach pain (pancreatitis), severe vomiting / diarrhea (kidney), neck swelling or hoarseness (thyroid), severe vision changes, or new mood concerns. Tell us before any planned surgery.",
            citationIDs: ["openrn_pharm_round13"]
        ),
        citations: [openfda, openrnPharmR13, specialtyR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Dapagliflozin

public enum DapagliflozinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "dapagliflozin",
        title: "Dapagliflozin",
        subtitle: "Farxiga · SGLT-2 inhibitor · T2DM + HF + CKD · cardio-renal benefit",
        category: "SGLT-2 inhibitor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Sodium-glucose co-transporter 2 inhibitor"),
            KeyValueRow(key: "Indications", value: "T2DM (with cardio-renal benefit), HFrEF + HFpEF, CKD with diabetic / non-diabetic kidney disease"),
            KeyValueRow(key: "Notable", value: "Beneficial across T2DM AND HF AND CKD — \"pillar\" of GDMT for HFrEF"),
            KeyValueRow(key: "Risks", value: "Euglycemic DKA; UTI / GU mycotic infections; volume depletion; rare Fournier gangrene")
        ],
        indications: AttributedProse(
            "Type 2 diabetes (with established or high CV / CKD risk); HFrEF + HFpEF; CKD with diabetic OR non-diabetic kidney disease per primary source.",
            citationIDs: ["openfda_round13", "specialty_round13"]
        ),
        mechanism: AttributedProse(
            "Inhibits SGLT-2 in proximal renal tubule → blocks glucose reabsorption → glucosuria → modest A1c reduction. Cardio-renal benefits are partially independent of glycemia (mechanisms include reduced glomerular hyperfiltration, blood pressure, oxidative stress, ketone-mediated cardiac efficiency).",
            citationIDs: ["openfda_round13"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "5–10 mg PO once daily per primary source.", citationIDs: ["openfda_round13"])
        ],
        contraindications: AttributedProse(
            "Severe renal impairment (CrCl <25 for T2DM; eGFR <20 for HF / CKD); type 1 diabetes (relative — DKA risk); ESRD on dialysis; hypersensitivity per primary source.",
            citationIDs: ["openfda_round13"]
        ),
        warnings: [
            AttributedBullet("EUGLYCEMIC DKA — can occur with NORMAL glucose; counsel patients about ketones if febrile / dehydrated / preoperative; HOLD perioperatively per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Volume depletion / hypotension — especially elderly + on diuretic; check BP and renal function.", citationIDs: ["openfda_round13"]),
            AttributedBullet("UTI + genital mycotic infection (especially in women + uncircumcised men); fluid intake + hygiene.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Fournier gangrene (rare necrotizing fasciitis of perineum) — counsel patients.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Bladder cancer — small association, contraindicated in active bladder cancer.", citationIDs: ["openfda_round13"])
        ],
        adverseReactions: AttributedProse(
            "GU mycotic infection, UTI, polyuria / nocturia, hypotension (especially with diuretic / volume contraction), AKI in dehydrated patients.",
            citationIDs: ["openfda_round13"]
        ),
        drugInteractions: [
            AttributedBullet("Diuretics — additive volume depletion; consider loop dose reduction.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Insulin / sulfonylurea — hypoglycemia (rare with SGLT-2 alone).", citationIDs: ["openfda_round13"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel HOLD ≥ 3 days BEFORE planned surgery / procedure (\"sick day rules\") per primary source.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Counsel about euglycemic DKA — symptoms include nausea / vomiting / fatigue / abdominal pain even with normal glucose.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Trend renal function (slight initial dip in eGFR is expected and benign per primary source).", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Counsel hydration + perineal hygiene to reduce GU infections.", citationIDs: ["openrn_pharm_round13"])
        ],
        patientTeaching: AttributedProse(
            "Take once daily; can be with or without food. Drink fluids regularly. Tell us right away about severe nausea / vomiting / abdominal pain / fatigue (even with normal blood sugar). Stop the medicine 3 days before any planned surgery — call us. Watch for genital itching / discharge / pain. Severe pain / redness / swelling between scrotum / vulva and anus is an emergency.",
            citationIDs: ["openrn_pharm_round13"]
        ),
        citations: [openfda, openrnPharmR13, specialtyR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Liraglutide

public enum LiraglutideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "liraglutide",
        title: "Liraglutide",
        subtitle: "Victoza / Saxenda · daily GLP-1 agonist · T2DM + obesity (peds + adult)",
        category: "GLP-1 receptor agonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "GLP-1 receptor agonist (daily SQ)"),
            KeyValueRow(key: "Indications", value: "Type 2 diabetes (Victoza), chronic weight management adult + adolescent (Saxenda — different indication and dose)"),
            KeyValueRow(key: "Boxed warning", value: "Thyroid C-cell tumor risk; same class as semaglutide / tirzepatide"),
            KeyValueRow(key: "Form", value: "Daily SQ injection")
        ],
        indications: AttributedProse(
            "Adjunct to diet / exercise for type 2 diabetes (Victoza brand); chronic weight management in obesity (Saxenda brand) — different dose / indication per primary source.",
            citationIDs: ["openfda_round13", "specialty_round13"]
        ),
        mechanism: AttributedProse(
            "GLP-1 receptor agonist → glucose-dependent insulin release, suppresses glucagon, slows gastric emptying, increases satiety.",
            citationIDs: ["openfda_round13"]
        ),
        dosing: [
            DosingBlock(label: "Victoza (T2DM)", body: "0.6 mg SQ daily × 1 week → 1.2 mg → 1.8 mg max per primary source.", citationIDs: ["openfda_round13"]),
            DosingBlock(label: "Saxenda (weight)", body: "0.6 mg SQ daily; increase by 0.6 mg weekly to 3 mg per primary source.", citationIDs: ["openfda_round13"])
        ],
        contraindications: AttributedProse(
            "Personal / family history of MTC or MEN-2; pregnancy (Saxenda); hypersensitivity per primary source.",
            citationIDs: ["openfda_round13"]
        ),
        warnings: [
            AttributedBullet("BOXED — thyroid C-cell tumor in rodents; counsel; STOP for thyroid mass / persistent hoarseness.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Pancreatitis, gallbladder disease, AKI from GI side effects, hypoglycemia with companion drugs.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Diabetic retinopathy worsening with rapid glucose improvement.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Pediatric (≥12 yr) approval for Saxenda obesity; Victoza in T2DM ≥10 yr per primary source.", citationIDs: ["openfda_round13"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, diarrhea, constipation, decreased appetite, injection-site reaction.",
            citationIDs: ["openfda_round13"]
        ),
        drugInteractions: [
            AttributedBullet("Insulin / sulfonylurea — hypoglycemia; reduce companion dose.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Oral medications — delayed absorption from gastric slowing.", citationIDs: ["openfda_round13"])
        ],
        nursingImplications: [
            AttributedBullet("Daily SQ injection; counsel timing flexibility (can switch days; missed dose — skip if next dose is within 12 hours).", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Same anesthesia / surgery considerations — gastric emptying delay; ASA recommends 1-week hold for elective surgery per primary source.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Counsel about GI side effects in titration; small meals; hydration.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Coordinate behavioral counseling for weight management — adjunct to medication is critical.", citationIDs: ["openrn_pharm_round13"])
        ],
        patientTeaching: AttributedProse(
            "Inject under the skin once daily. Rotate sites. Tell us about severe abdominal pain, severe vomiting, neck swelling or hoarseness, vision changes, or signs of low blood sugar. Tell us before any surgery. Combine with diet, activity, and behavioral counseling for best results.",
            citationIDs: ["openrn_pharm_round13"]
        ),
        citations: [openfda, openrnPharmR13, specialtyR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Calcitriol

public enum CalcitriolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "calcitriol",
        title: "Calcitriol",
        subtitle: "Rocaltrol · active vitamin D · CKD-MBD + hypoparathyroidism",
        category: "Active vitamin D analog",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Active vitamin D (1,25-(OH)₂ D₃) analog"),
            KeyValueRow(key: "Indications", value: "CKD-mineral bone disorder (secondary hyperparathyroidism); hypoparathyroidism; pseudohypoparathyroidism; refractory rickets"),
            KeyValueRow(key: "Notable", value: "Bypasses 1-α hydroxylation (impaired in CKD); active form available immediately"),
            KeyValueRow(key: "Risks", value: "Hypercalcemia + hyperphosphatemia (drives vascular calcification); strict monitoring")
        ],
        indications: AttributedProse(
            "Secondary hyperparathyroidism in CKD; hypoparathyroidism (post-thyroidectomy, autoimmune); rickets / osteomalacia; pseudohypoparathyroidism per primary source.",
            citationIDs: ["openfda_round13", "specialty_round13"]
        ),
        mechanism: AttributedProse(
            "Activates vitamin D receptor → increases intestinal calcium + phosphate absorption + bone resorption + suppresses PTH secretion.",
            citationIDs: ["openfda_round13"]
        ),
        dosing: [
            DosingBlock(label: "CKD-MBD", body: "0.25 mcg PO daily; titrate to PTH / Ca / phosphate per KDIGO; max ~1 mcg/day per primary source.", citationIDs: ["openfda_round13"]),
            DosingBlock(label: "Hypoparathyroidism", body: "0.25–2 mcg PO daily; titrate to ionized Ca per primary source.", citationIDs: ["openfda_round13"])
        ],
        contraindications: AttributedProse(
            "Hypercalcemia; hyperphosphatemia (relative); vitamin D toxicity; hypersensitivity per primary source.",
            citationIDs: ["openfda_round13"]
        ),
        warnings: [
            AttributedBullet("Hypercalcemia + hyperphosphatemia — drives vascular calcification + risk of nephrocalcinosis; strict monitoring.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Adynamic bone disease in CKD with over-suppression of PTH per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Drug interactions with thiazides → hypercalcemia.", citationIDs: ["openfda_round13"])
        ],
        adverseReactions: AttributedProse(
            "Hypercalcemia, hyperphosphatemia, polyuria, anorexia, nausea, weakness, soft-tissue calcification.",
            citationIDs: ["openfda_round13"]
        ),
        drugInteractions: [
            AttributedBullet("Thiazide diuretics — additive hypercalcemia.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Mineral oil, cholestyramine — REDUCE absorption.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Magnesium-containing antacids — hypermagnesemia in CKD.", citationIDs: ["openfda_round13"])
        ],
        nursingImplications: [
            AttributedBullet("Trend Ca, phosphate, PTH, creatinine per primary source.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Phosphate binders typically given concurrently in CKD-MBD.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Counsel patient about hypercalcemia warning signs — bone pain, weakness, polyuria, constipation, AMS.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("In hypoparathyroidism — usually paired with calcium supplementation; goal ionized Ca low-normal to avoid hypercalciuria.", citationIDs: ["openrn_pharm_round13"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed. Get blood tests as scheduled. Tell us about severe nausea, vomiting, weakness, frequent urination, bone pain, or constipation — these can mean too much calcium. Avoid antacids unless your provider says they are safe.",
            citationIDs: ["openrn_pharm_round13"]
        ),
        citations: [openfda, openrnPharmR13, specialtyR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cinacalcet

public enum CinacalcetSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cinacalcet",
        title: "Cinacalcet",
        subtitle: "Sensipar · calcimimetic · 2° hyperparathyroidism in dialysis + parathyroid carcinoma",
        category: "Calcimimetic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Calcium-sensing receptor agonist (calcimimetic)"),
            KeyValueRow(key: "Indications", value: "Secondary hyperparathyroidism in dialysis patients; parathyroid carcinoma + primary hyperparathyroidism (when surgery contraindicated)"),
            KeyValueRow(key: "Boxed warning", value: "Hypocalcemia — severe; trend ionized calcium per primary source"),
            KeyValueRow(key: "Notable", value: "Lowers PTH WITHOUT raising calcium / phosphate (vs vitamin D analogs)")
        ],
        indications: AttributedProse(
            "Secondary hyperparathyroidism in adult patients with CKD on dialysis; hypercalcemia in parathyroid carcinoma; primary hyperparathyroidism when parathyroidectomy is contraindicated per primary source.",
            citationIDs: ["openfda_round13", "specialty_round13"]
        ),
        mechanism: AttributedProse(
            "Allosterically activates calcium-sensing receptor on parathyroid cells → suppresses PTH secretion. Lowers Ca, phosphate, PTH simultaneously without active vitamin D's hypercalcemic effect.",
            citationIDs: ["openfda_round13"]
        ),
        dosing: [
            DosingBlock(label: "Dialysis (2° HPT)", body: "Initial 30 mg PO daily; titrate every 2–4 weeks to PTH 150–300 pg/mL; max 180 mg/day per primary source.", citationIDs: ["openfda_round13"]),
            DosingBlock(label: "Parathyroid carcinoma", body: "Initial 30 mg PO BID; titrate up; max 360 mg/day per primary source.", citationIDs: ["openfda_round13"])
        ],
        contraindications: AttributedProse(
            "Pre-existing hypocalcemia (correct first); concurrent strong CYP2D6 inhibitor; hypersensitivity per primary source.",
            citationIDs: ["openfda_round13"]
        ),
        warnings: [
            AttributedBullet("BOXED — hypocalcemia; counsel about paresthesias / muscle cramps / tetany / seizures; trend Ca per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("QT prolongation from hypocalcemia.", citationIDs: ["openfda_round13"]),
            AttributedBullet("HF worsening; GI symptoms common.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Adynamic bone disease in over-suppression.", citationIDs: ["openfda_round13"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, diarrhea, hypocalcemia, dizziness, dialysis-access infection.",
            citationIDs: ["openfda_round13"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, macrolides) — raise cinacalcet levels.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Cinacalcet is itself a strong CYP2D6 inhibitor — raises tricyclics, β-blockers (metoprolol), antipsychotics; reduce companion doses per primary source.", citationIDs: ["openfda_round13"])
        ],
        nursingImplications: [
            AttributedBullet("Take with food (food increases bioavailability).", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Trend ionized Ca, phosphate, PTH, ECG (QT) per protocol.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("HOLD if Ca <8.4 mg/dL OR ionized Ca low; restart at lower dose when corrected per primary source.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Counsel patient + family on hypocalcemia warning signs — muscle cramps, perioral / facial tingling, tetany, seizures.", citationIDs: ["openrn_pharm_round13"])
        ],
        patientTeaching: AttributedProse(
            "Take with food. Tell us about muscle cramps, twitching, numbness or tingling around the mouth or fingertips, palpitations, or seizures — these can mean low calcium. Get blood tests as scheduled.",
            citationIDs: ["openrn_pharm_round13"]
        ),
        citations: [openfda, openrnPharmR13, specialtyR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pirfenidone

public enum PirfenidoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "pirfenidone",
        title: "Pirfenidone",
        subtitle: "Esbriet · antifibrotic · idiopathic pulmonary fibrosis (IPF)",
        category: "Antifibrotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Antifibrotic — pyridone derivative"),
            KeyValueRow(key: "Indication", value: "Slows decline in FVC in idiopathic pulmonary fibrosis"),
            KeyValueRow(key: "Notable", value: "Photosensitivity is a major concern; LFT monitoring per primary source"),
            KeyValueRow(key: "Alternative", value: "Nintedanib for IPF + scleroderma ILD")
        ],
        indications: AttributedProse(
            "Treatment of idiopathic pulmonary fibrosis to slow disease progression (decline in FVC) per primary source.",
            citationIDs: ["openfda_round13", "specialty_round13"]
        ),
        mechanism: AttributedProse(
            "Reduces fibroblast proliferation, TGF-β-driven collagen synthesis, and inflammatory cytokine production. Exact mechanism not fully understood.",
            citationIDs: ["openfda_round13"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "Titrate 267 mg PO TID × 1 week, then 534 mg TID × 1 week, then 801 mg PO TID with food per primary source.", citationIDs: ["openfda_round13"])
        ],
        contraindications: AttributedProse(
            "Severe hepatic impairment; concurrent strong CYP1A2 inhibitor (fluvoxamine); hypersensitivity per primary source.",
            citationIDs: ["openfda_round13"]
        ),
        warnings: [
            AttributedBullet("Hepatotoxicity — baseline + monthly LFTs first 6 months, every 3 months thereafter; STOP for ALT >5× ULN per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("PHOTOSENSITIVITY / rash — sunscreen + protective clothing essential.", citationIDs: ["openfda_round13"]),
            AttributedBullet("GI side effects — nausea / diarrhea common; take with food.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Smoking — REDUCES pirfenidone levels; counsel cessation; not recommended in active smokers per primary source.", citationIDs: ["openfda_round13"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, fatigue, diarrhea, dyspepsia, anorexia, headache, photosensitivity, transient LFT elevation.",
            citationIDs: ["openfda_round13"]
        ),
        drugInteractions: [
            AttributedBullet("Fluvoxamine — strong CYP1A2 inhibitor; AVOID combination per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Smoking — induces CYP1A2; lowers pirfenidone level.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Ciprofloxacin (CYP1A2 inhibitor) — raises levels; reduce dose if combined per primary source.", citationIDs: ["openfda_round13"])
        ],
        nursingImplications: [
            AttributedBullet("Take WITH food in 3 divided daily doses (reduces GI upset and modulates absorption).", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Counsel sun protection — daily SPF ≥50, protective clothing; avoid prolonged sun.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("LFTs at baseline + monthly first 6 mo, then every 3 mo per primary source.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Coordinate vaccinations — pneumococcal, influenza, COVID; avoid live vaccines per provider.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Coordinate pulmonary rehabilitation, oxygen therapy, lung-transplant evaluation as appropriate.", citationIDs: ["openrn_pharm_round13"])
        ],
        patientTeaching: AttributedProse(
            "Take with food in three divided doses. Use sunscreen (SPF 50+) and protective clothing every day — sunburn is severe with this medicine. Get liver-function tests as scheduled. Tell us about yellow skin or eyes, severe nausea, dark urine, severe rash. Stop smoking if you smoke.",
            citationIDs: ["openrn_pharm_round13"]
        ),
        citations: [openfda, openrnPharmR13, specialtyR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Finerenone

public enum FinerenoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "finerenone",
        title: "Finerenone",
        subtitle: "Kerendia · non-steroidal MR antagonist · diabetic CKD + HFmrEF / HFpEF",
        category: "Non-steroidal mineralocorticoid receptor antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-steroidal mineralocorticoid receptor antagonist"),
            KeyValueRow(key: "Indications", value: "CKD associated with type 2 diabetes (slow progression + reduce CV events); HFmrEF + HFpEF (FINEARTS-HF)"),
            KeyValueRow(key: "Notable", value: "Less hyperkalemia, gynecomastia than spironolactone; more selective MR antagonism")
        ],
        indications: AttributedProse(
            "Reduce risk of sustained eGFR decline, ESKD, CV death, MI, HF hospitalization in adults with CKD associated with type 2 diabetes; HF with mildly reduced or preserved EF per primary source.",
            citationIDs: ["openfda_round13", "specialty_round13"]
        ),
        mechanism: AttributedProse(
            "Selectively blocks mineralocorticoid receptor (MR) → reduces inflammation and fibrosis in heart and kidney. Less affinity for androgen / progesterone receptors than spironolactone (fewer endocrine side effects).",
            citationIDs: ["openfda_round13"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "Initial 10 or 20 mg PO daily based on eGFR + K; titrate to 20 mg daily; HOLD for hyperkalemia per primary source.", citationIDs: ["openfda_round13"])
        ],
        contraindications: AttributedProse(
            "Concurrent strong CYP3A4 inhibitor; adrenal insufficiency; serum K >5; hypersensitivity per primary source.",
            citationIDs: ["openfda_round13"]
        ),
        warnings: [
            AttributedBullet("Hyperkalemia (similar magnitude to other MR antagonists but somewhat less); trend K at baseline + 4 weeks + periodically.", citationIDs: ["openfda_round13"]),
            AttributedBullet("eGFR decline — slight expected drop; manage per primary source.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Potassium-sparing diuretic / ACE / ARB / ARNI / NSAID — additive hyperkalemia.", citationIDs: ["openfda_round13"])
        ],
        adverseReactions: AttributedProse(
            "Hyperkalemia, hypotension, hyponatremia (mild), nasopharyngitis.",
            citationIDs: ["openfda_round13"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors — CONTRAINDICATED (azoles, clarithromycin); strong inducers — AVOID.", citationIDs: ["openfda_round13"]),
            AttributedBullet("Other K-sparing agents (spironolactone, eplerenone, ACEi, ARB, ARNI) — additive hyperkalemia.", citationIDs: ["openfda_round13"]),
            AttributedBullet("NSAIDs — additive AKI / hyperK.", citationIDs: ["openfda_round13"])
        ],
        nursingImplications: [
            AttributedBullet("Trend K at baseline, 4 weeks, then per protocol; HOLD if K >5.5 per primary source.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Counsel about potassium-rich foods (avoid in moderation), salt substitutes (often KCl).", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Coordinate with concurrent ACE / ARB / ARNI in HF — additive hyperkalemia + renal effects.", citationIDs: ["openrn_pharm_round13"]),
            AttributedBullet("Take consistently with or without food; missed dose — skip if next dose is within 12 hours.", citationIDs: ["openrn_pharm_round13"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed. Avoid salt substitutes (most are potassium chloride). Tell us about muscle weakness, palpitations, or new GI symptoms. Get blood tests on schedule. Tell every provider about all medications and supplements before starting anything new.",
            citationIDs: ["openrn_pharm_round13"]
        ),
        citations: [openfda, openrnPharmR13, specialtyR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}
