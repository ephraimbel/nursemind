import Foundation

// Curator-model drug entries (round 29 — endocrine depth: thyroid + pituitary + parathyroid + adrenal + bone).

private let openfdaR29 = CitationSource(
    id: "openfda_round29",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-05-13"
)
private let openrnPharmR29 = CitationSource(
    id: "openrn_pharm_round29",
    shortName: "Open RN Pharmacology + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-13"
)
private let specialtyR29 = CitationSource(
    id: "specialty_round29",
    shortName: "Endocrine Society + AACE + ATA + NOF concept citations",
    publisher: "Endocrine Society · AACE · ATA · NOF",
    license: .factCitationOnly,
    url: "https://www.endocrine.org/clinical-practice-guidelines",
    lastRetrieved: "2026-05-13"
)
private let ismpR29 = CitationSource(
    id: "ismp_round29",
    shortName: "ISMP High-Alert Medications 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-13"
)

public enum PropylthiouracilSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "propylthiouracil",
        title: "Propylthiouracil (PTU)",
        subtitle: "Thioamide · 1st trimester pregnancy + thyroid storm · BOXED hepatotoxicity (rare fulminant) + ANCA vasculitis · blocks T4→T3 conversion",
        category: "Thioamide antithyroid — pregnancy + thyroid storm",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Thioamide — inhibits thyroid peroxidase + blocks peripheral T4→T3 conversion (unique vs methimazole)"),
            KeyValueRow(key: "Use", value: "Hyperthyroidism — preferred in PREGNANCY 1st trimester (vs methimazole teratogen) + THYROID STORM (high-dose); methimazole preferred otherwise"),
            KeyValueRow(key: "Dose", value: "Adult: 100-150 mg PO TID; thyroid storm: 200-300 mg PO/NG q4-6h × 24-48h; pediatric weight-based"),
            KeyValueRow(key: "Monitor", value: "TSH + free T4 q4-6 weeks; CBC (agranulocytosis); LFTs (boxed hepatotoxicity); ANCA if symptoms"),
            KeyValueRow(key: "Watch", value: "BOXED hepatotoxicity + fulminant liver failure (rarely fatal); ANCA-vasculitis; agranulocytosis; teratogen 2nd-3rd trimester")
        ],
        indications: AttributedProse(
            "Hyperthyroidism — preferred 1st trimester PREGNANCY (methimazole is teratogen with aplasia cutis + choanal atresia in 1st trimester per primary source) + THYROID STORM (high-dose blocks both synthesis + T4→T3 conversion). Methimazole preferred for non-pregnant otherwise (less hepatotoxic).",
            citationIDs: ["specialty_round29", "openfda_round29"]
        ),
        mechanism: AttributedProse(
            "Inhibits thyroid peroxidase enzyme → blocks iodination of tyrosine residues + coupling of MIT/DIT → reduced T3 + T4 synthesis. UNIQUE — also blocks peripheral 5'-deiodinase → reduces T4→T3 conversion (active hormone) — advantage in thyroid storm.",
            citationIDs: ["openfda_round29"]
        ),
        dosing: [
            DosingBlock(label: "Adult hyperthyroidism", body: "Initial 100-150 mg PO TID until euthyroid (~4-8 weeks); maintenance 50-100 mg PO BID-TID per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Thyroid storm", body: "200-300 mg PO/NG q4-6 hours × 24-48 hours, then taper; combine with beta-blocker (propranolol), iodine (Lugol's after PTU loaded), steroids, supportive care.", citationIDs: ["specialty_round29"]),
            DosingBlock(label: "Pregnancy 1st trimester", body: "Start 100-150 mg PO TID; minimum effective dose; SWITCH to methimazole in 2nd-3rd trimester (PTU hepatotoxic risk > methimazole teratogenicity later).", citationIDs: ["specialty_round29"]),
            DosingBlock(label: "Hepatic", body: "Discontinue if ALT/AST >3× ULN; PTU hepatotoxicity often unpredictable.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Pediatric", body: "5-7 mg/kg/day PO divided TID; max 300 mg/day; consult pediatric endocrinology.", citationIDs: ["openfda_round29"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to thioamides; severe hepatic disease. Caution — pregnancy (2nd-3rd trimester switch to methimazole); breastfeeding (low PTU dose acceptable).",
            citationIDs: ["openfda_round29"]
        ),
        warnings: [
            AttributedBullet("BOXED — SEVERE HEPATOTOXICITY: fulminant hepatic failure rare but fatal; ALT/AST monitoring; STOP if elevated; reserve for pregnancy 1st trimester OR thyroid storm OR methimazole intolerance.", citationIDs: ["openfda_round29"]),
            AttributedBullet("AGRANULOCYTOSIS — rare (~0.2-0.5%); STOP if sore throat / fever / oral ulcers + check CBC immediately; reversible with discontinuation.", citationIDs: ["openfda_round29"]),
            AttributedBullet("ANCA-ASSOCIATED VASCULITIS — drug-induced lupus-like; pulmonary-renal vasculitis; rare but serious; discontinue.", citationIDs: ["openfda_round29"]),
            AttributedBullet("HYPOTHYROIDISM — over-suppression; monitor TSH + adjust dose.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PREGNANCY teratogen 2nd-3rd trimester — switch to methimazole; PTU hepatotoxicity exceeds methimazole teratogenicity in later pregnancy.", citationIDs: ["specialty_round29"]),
            AttributedBullet("BREASTFEEDING — preferred (lower milk levels than methimazole at low dose).", citationIDs: ["specialty_round29"]),
            AttributedBullet("RASH / pruritus / GI common — usually self-limited.", citationIDs: ["openfda_round29"]),
            AttributedBullet("HYPOPROTHROMBINEMIA / bleeding — rare; monitor INR with concurrent warfarin.", citationIDs: ["openfda_round29"])
        ],
        adverseReactions: AttributedProse(
            "Rash, pruritus, nausea, vomiting, headache, fever, paresthesia, arthralgia, hepatotoxicity, agranulocytosis (rare), ANCA-vasculitis (rare).",
            citationIDs: ["openfda_round29"]
        ),
        drugInteractions: [
            AttributedBullet("WARFARIN — PTU can increase OR decrease anticoagulant effect; monitor INR closely.", citationIDs: ["openfda_round29"]),
            AttributedBullet("DIGOXIN — once euthyroid, digoxin requirements may decrease (re-evaluate).", citationIDs: ["openfda_round29"]),
            AttributedBullet("BETA-BLOCKERS — once euthyroid, dose may need reduction.", citationIDs: ["openfda_round29"]),
            AttributedBullet("AMIODARONE — complex thyroid effects; coordinate endocrinology.", citationIDs: ["openfda_round29"]),
            AttributedBullet("IODINE (Lugol's, SSKI) — give PTU FIRST then iodine in thyroid storm (iodine before thyroid blockade can paradoxically increase synthesis).", citationIDs: ["specialty_round29"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — TSH + free T4 + free T3, CBC, LFTs, pregnancy test, ANCA optional.", citationIDs: ["specialty_round29"]),
            AttributedBullet("MONITORING — TSH + free T4 q4-6 weeks until euthyroid; CBC + LFTs at baseline + clinically; immediate eval for sore throat / fever / oral ulcers.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Counsel — REPORT sore throat, fever, oral ulcers, yellow eyes/skin, dark urine, rash, joint pain → STOP + call provider.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("THYROID STORM — give PTU PO/NG (oral preferred; rectal possible if NPO); LOAD 600-1000 mg, then 200-300 mg q4-6h × 24-48h; combine with beta-blocker + steroids + iodine (Lugol's) AFTER PTU + supportive care.", citationIDs: ["specialty_round29"]),
            AttributedBullet("PREGNANCY — preferred 1st trimester ONLY; switch to methimazole 2nd-3rd trimester (PTU hepatotoxicity > methimazole teratogen later); coordinate OB + endocrine.", citationIDs: ["specialty_round29"]),
            AttributedBullet("BREASTFEEDING — preferred (low milk levels at low PTU dose); monitor infant thyroid.", citationIDs: ["specialty_round29"]),
            AttributedBullet("PRE-OPERATIVE — euthyroid before thyroidectomy; combine with KI/Lugol's 10-14 days prior.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Definitive therapy — counsel surgery (thyroidectomy) or radioactive iodine (I-131) as long-term options.", citationIDs: ["specialty_round29"])
        ],
        patientTeaching: AttributedProse(
            "This pill treats overactive thyroid. CALL US RIGHT AWAY if you get sore throat, fever, mouth sores, yellow eyes/skin, dark urine, rash, or joint pain. Get bloodwork as ordered. Take consistently. Tell us if you become pregnant (special instructions). Long-term plan may include surgery or radioactive iodine.",
            citationIDs: ["openrn_pharm_round29"]
        ),
        citations: [openfdaR29, openrnPharmR29, specialtyR29, ismpR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CabergolineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cabergoline",
        title: "Cabergoline (Dostinex)",
        subtitle: "Dopamine D2 agonist · prolactinoma 1st-line · twice weekly · CARDIAC VALVULOPATHY risk at high doses · psychiatric — impulse control",
        category: "Dopamine D2 receptor agonist — prolactinoma",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dopamine D2 receptor agonist — selective + long-acting"),
            KeyValueRow(key: "Use", value: "Hyperprolactinemia + prolactinoma (1st-line; tumor shrinkage in ~80%); not first-line for Parkinson disease (cardiac valve toxicity)"),
            KeyValueRow(key: "Dose", value: "Initial 0.25 mg PO twice weekly; titrate based on prolactin monthly to max 1 mg twice weekly; doses ≥2 mg/week → echo annually"),
            KeyValueRow(key: "Monitor", value: "Prolactin q4 weeks until normalized → q3 months; ECHO at baseline + annually if doses ≥2 mg/week; psychiatric"),
            KeyValueRow(key: "Watch", value: "CARDIAC VALVULOPATHY at high doses (Parkinson dose >3 mg/day); IMPULSE CONTROL DISORDERS (gambling, hypersexuality, binge eating); orthostatic hypotension")
        ],
        indications: AttributedProse(
            "Hyperprolactinemia (idiopathic, pituitary microadenoma, macroprolactinoma) — first-line over bromocriptine due to better tolerability + efficacy. Tumor shrinkage in ~80% + prolactin normalization. Some off-label uses (acromegaly suppression of GH, Cushing in selected cases) per primary source.",
            citationIDs: ["specialty_round29", "openfda_round29"]
        ),
        mechanism: AttributedProse(
            "Selective D2 dopamine receptor agonist with long half-life (~65 hours). Inhibits prolactin secretion from anterior pituitary lactotrophs by stimulating D2 receptors. Direct anti-tumor effect on prolactinoma cells → tumor shrinkage.",
            citationIDs: ["openfda_round29"]
        ),
        dosing: [
            DosingBlock(label: "Adult prolactinoma", body: "Initial 0.25 mg PO twice weekly (e.g., Sunday + Wednesday); titrate by 0.25 mg increments q4 weeks based on prolactin to max 1 mg twice weekly (some patients require more) per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Maintenance", body: "Continue lowest effective dose; consider discontinuation after 2 years if prolactin normal + tumor shrinkage stable.", citationIDs: ["specialty_round29"]),
            DosingBlock(label: "Renal / hepatic", body: "Severe hepatic impairment — use lower doses; renal impairment — no specific adjustment.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Pregnancy", body: "Discontinue when pregnancy confirmed for most (microadenomas); continue for macroadenomas + visual field consultation; monitor visual fields trimesterly.", citationIDs: ["specialty_round29"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; uncontrolled hypertension; history of cardiac valvulopathy (especially fibrotic); pregnancy (relative for microadenoma).",
            citationIDs: ["openfda_round29"]
        ),
        warnings: [
            AttributedBullet("CARDIAC VALVULOPATHY (fibrotic) — at high doses (>2-3 mg/day for Parkinson's); ergot-derivative class effect; ECHO baseline + annually if ≥2 mg/week.", citationIDs: ["openfda_round29"]),
            AttributedBullet("IMPULSE CONTROL DISORDERS — gambling, hypersexuality, binge eating, compulsive shopping; counsel + monitor + reduce dose if occur.", citationIDs: ["specialty_round29"]),
            AttributedBullet("ORTHOSTATIC HYPOTENSION — common; rise slowly; first dose effect; counsel.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PSYCHIATRIC — depression, psychosis, mania; monitor especially with history.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PLEURAL + PERICARDIAL fibrosis — class effect; report chest pain, dyspnea, edema.", citationIDs: ["openfda_round29"]),
            AttributedBullet("RAYNAUD-like vasospasm — class effect.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PREGNANCY — Category B; reproductive function restored may lead to unplanned pregnancy; discuss contraception + planning; macroadenomas may need continuation.", citationIDs: ["specialty_round29"]),
            AttributedBullet("BREASTFEEDING — suppresses lactation; AVOID in lactating mothers.", citationIDs: ["openfda_round29"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, headache, dizziness, orthostatic hypotension, fatigue, constipation, abdominal pain, asthenia, vomiting, dyspepsia, impulse control disorders.",
            citationIDs: ["openfda_round29"]
        ),
        drugInteractions: [
            AttributedBullet("DOPAMINE ANTAGONISTS (metoclopramide, antipsychotics, prochlorperazine) — antagonize cabergoline; avoid concurrent.", citationIDs: ["openfda_round29"]),
            AttributedBullet("ANTIHYPERTENSIVES — additive hypotension; titrate.", citationIDs: ["openfda_round29"]),
            AttributedBullet("STRONG CYP3A4 inhibitors (azoles, macrolides, ritonavir) — increase cabergoline levels; caution.", citationIDs: ["openfda_round29"]),
            AttributedBullet("ALCOHOL — additive hypotension + dizziness.", citationIDs: ["openfda_round29"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — prolactin, TSH, IGF-1 (rule out mixed adenoma), MRI pituitary, visual fields (macroadenoma), pregnancy test, echocardiogram, BP.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Prolactin q4 weeks until normalized → q3-6 months; MRI q6-12 months tumor surveillance; ECHO annually if dose ≥2 mg/week.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Counsel — orthostatic hypotension precautions; rise slowly; first doses with food; impulse control monitoring + reporting; pregnancy planning.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("IMPULSE CONTROL — patient + family aware; reduce dose / stop if occur; PD experience predicts.", citationIDs: ["specialty_round29"]),
            AttributedBullet("PREGNANCY — restored fertility; contraception until planned; if pregnant — typically stop for microadenoma, continue for macroadenoma; visual fields trimesterly.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Tumor RESISTANCE — ~10% don't respond; switch to bromocriptine OR surgery; aggressive tumors may need radiation.", citationIDs: ["specialty_round29"]),
            AttributedBullet("DISCONTINUATION trial after 2 years of normalized prolactin + tumor shrinkage; ~30-50% remain normoprolactinemic.", citationIDs: ["specialty_round29"]),
            AttributedBullet("MASS effect symptoms (HA, visual changes) — urgent reassessment.", citationIDs: ["specialty_round29"])
        ],
        patientTeaching: AttributedProse(
            "This pill shrinks the tumor in your pituitary + lowers your prolactin. Take 2 days a week. May cause dizziness — rise slowly. Tell us about gambling, hypersexuality, or compulsive behaviors that weren't there before. If you become pregnant, call us — we may adjust treatment. Don't breastfeed on this medicine.",
            citationIDs: ["openrn_pharm_round29"]
        ),
        citations: [openfdaR29, openrnPharmR29, specialtyR29, ismpR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BromocriptineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "bromocriptine",
        title: "Bromocriptine (Parlodel + Cycloset)",
        subtitle: "Dopamine D2 agonist · prolactinoma + NMS antidote + acromegaly · cabergoline preferred · Cycloset for type 2 diabetes morning dose",
        category: "Dopamine D2 receptor agonist — prolactinoma + NMS antidote + diabetes",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Ergot-derivative dopamine D2 agonist"),
            KeyValueRow(key: "Use", value: "Prolactinoma (alternative to cabergoline); acromegaly (limited efficacy); NMS antidote; Parkinson's (rarely used now); type 2 diabetes (Cycloset 1.6-4.8 mg AM)"),
            KeyValueRow(key: "Dose", value: "Prolactinoma start 1.25 mg PO BID at bedtime; titrate to 2.5-7.5 mg/day; acromegaly higher; Cycloset for DM2 1.6-4.8 mg AM with breakfast"),
            KeyValueRow(key: "Monitor", value: "Prolactin q4 weeks, BP, psychiatric, GI"),
            KeyValueRow(key: "Watch", value: "Cardiac valvulopathy + pleural fibrosis ergot class effect; orthostatic hypotension; psychiatric — impulse control; NOT for postpartum lactation suppression (FDA REMOVED indication for safety)")
        ],
        indications: AttributedProse(
            "Hyperprolactinemia + prolactinoma (less preferred than cabergoline due to GI side effects + TID dosing); acromegaly (limited efficacy); NEUROLEPTIC MALIGNANT SYNDROME (NMS) antidote (off-label); type 2 diabetes mellitus (Cycloset specifically); Parkinson's disease (rare due to cardiac valve toxicity). FDA REMOVED indication for postpartum lactation suppression per primary source.",
            citationIDs: ["specialty_round29", "openfda_round29"]
        ),
        mechanism: AttributedProse(
            "Ergot-derivative dopamine D2 receptor agonist (also D1 + alpha-1 + serotonergic activity). Inhibits prolactin secretion. In acromegaly — partially reduces GH (less effective than somatostatin analogs). NMS antidote — restores dopaminergic tone. Cycloset (diabetes) — acts on hypothalamic dopaminergic activity to reduce postprandial glucose.",
            citationIDs: ["openfda_round29"]
        ),
        dosing: [
            DosingBlock(label: "Prolactinoma", body: "Initial 1.25 mg PO at bedtime with food × 3 days → 2.5 mg BID with food; titrate up to 2.5-7.5 mg/day in 2-3 divided doses per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Acromegaly", body: "Higher doses 10-30 mg/day in divided doses; limited efficacy; somatostatin analogs preferred.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "NMS (off-label)", body: "2.5-5 mg PO/NG q6-8 hours; combined with dantrolene + supportive care; rapid d/c offending antipsychotic.", citationIDs: ["specialty_round29"]),
            DosingBlock(label: "Type 2 diabetes (Cycloset)", body: "1.6 mg PO daily with food within 2 hours of waking; titrate weekly by 0.8 mg to max 4.8 mg/day; quick-release formulation.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Renal / hepatic", body: "Caution; severe hepatic — avoid.", citationIDs: ["openfda_round29"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity (ergot derivatives); uncontrolled hypertension; severe ischemic heart disease; peripheral vascular disease; preeclampsia / eclampsia / hypertensive postpartum; concomitant other ergot alkaloids; syncopal migraine.",
            citationIDs: ["openfda_round29"]
        ),
        warnings: [
            AttributedBullet("CARDIAC VALVULOPATHY + fibrosis — ergot class effect at high doses (Parkinson's); ECHO baseline + annually if high dose long-term.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PLEURAL + retroperitoneal + pericardial fibrosis — class effect.", citationIDs: ["openfda_round29"]),
            AttributedBullet("HYPOTENSION — first-dose effect; orthostatic; severe in some.", citationIDs: ["openfda_round29"]),
            AttributedBullet("HYPERTENSIVE crisis + stroke — postpartum lactation suppression historically; FDA removed indication.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PSYCHIATRIC — impulse control disorders, psychosis, hallucinations.", citationIDs: ["specialty_round29"]),
            AttributedBullet("GI side effects — nausea, vomiting common; take with food.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PREGNANCY — Category B; reproductive function restored; discontinue if pregnancy desired (microadenoma) or continue for macroadenoma.", citationIDs: ["specialty_round29"]),
            AttributedBullet("BREASTFEEDING — bromocriptine suppresses lactation; AVOID in breastfeeding mothers.", citationIDs: ["openfda_round29"])
        ],
        adverseReactions: AttributedProse(
            "Nausea (very common), headache, dizziness, orthostatic hypotension, fatigue, constipation, abdominal pain, asthenia, nasal stuffiness, hallucinations, vasospasm.",
            citationIDs: ["openfda_round29"]
        ),
        drugInteractions: [
            AttributedBullet("DOPAMINE ANTAGONISTS — antagonize; avoid.", citationIDs: ["openfda_round29"]),
            AttributedBullet("ANTIHYPERTENSIVES — additive; titrate.", citationIDs: ["openfda_round29"]),
            AttributedBullet("STRONG CYP3A4 inhibitors — increase bromocriptine; caution.", citationIDs: ["openfda_round29"]),
            AttributedBullet("OTHER ERGOTS (dihydroergotamine, ergotamine) — contraindicated; additive vasospasm.", citationIDs: ["openfda_round29"]),
            AttributedBullet("ALCOHOL — additive hypotension; reduces tolerability.", citationIDs: ["openfda_round29"]),
            AttributedBullet("OCs — restored fertility; counsel.", citationIDs: ["specialty_round29"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — prolactin / GH / glucose depending on indication; BP, pregnancy test, ECG/ECHO baseline for cardiac.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Take with food → reduces GI side effects; first dose at bedtime to minimize hypotension.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("ORTHOSTATIC precautions — rise slowly; first dose effect.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Counsel — REPORT chest pain, dyspnea, swelling, severe headache, vision changes, mood changes / impulse behaviors.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Restored fertility — pregnancy planning + contraception.", citationIDs: ["specialty_round29"]),
            AttributedBullet("NMS — emergency use; combine with dantrolene + d/c antipsychotic + supportive ICU.", citationIDs: ["specialty_round29"]),
            AttributedBullet("CYCLOSET (DM2) — TIMING critical: within 2 hours of waking + with food; quick-release formulation distinct.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Cabergoline preferred for prolactinoma — better tolerability + efficacy + twice-weekly dosing.", citationIDs: ["specialty_round29"])
        ],
        patientTeaching: AttributedProse(
            "This medicine treats high prolactin / a pituitary tumor. Take with food; first dose at bedtime helps with dizziness. Rise slowly. Tell us about mood changes, impulsive behaviors (gambling, sex), chest pain, breathing trouble. Don't breastfeed on this. Pregnancy may be possible again — use contraception unless planning.",
            citationIDs: ["openrn_pharm_round29"]
        ),
        citations: [openfdaR29, openrnPharmR29, specialtyR29, ismpR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LanreotideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lanreotide",
        title: "Lanreotide (Somatuline Depot)",
        subtitle: "Long-acting somatostatin analog · acromegaly + neuroendocrine tumors · SC q4 weeks · less GI than octreotide · GALLSTONES + diabetes",
        category: "Long-acting somatostatin analog — acromegaly + NET",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Long-acting somatostatin analog (octapeptide); binds SST2 + SST5 receptors"),
            KeyValueRow(key: "Use", value: "Acromegaly (post-surgical or inadequate surgery candidates); neuroendocrine tumors (carcinoid, pancreatic NETs) for tumor control + symptom relief"),
            KeyValueRow(key: "Dose", value: "Acromegaly: 120 mg deep SC q4 weeks (single-dose syringe gluteal); NET: 120 mg q4 weeks; titrate based on response"),
            KeyValueRow(key: "Monitor", value: "IGF-1 + GH; tumor imaging; glucose; gallbladder ultrasound annually; TSH"),
            KeyValueRow(key: "Watch", value: "GALLSTONES (~25%); glucose dysregulation; bradycardia; injection site reactions")
        ],
        indications: AttributedProse(
            "Acromegaly — post-surgical persistent disease, surgical candidates with inadequate response, OR not surgical candidates. Neuroendocrine tumors (NETs) of GI tract + pancreas — tumor stabilization + symptom relief (flushing, diarrhea in carcinoid). Carcinoid syndrome symptoms per primary source.",
            citationIDs: ["specialty_round29", "openfda_round29"]
        ),
        mechanism: AttributedProse(
            "Long-acting cyclic octapeptide analog of somatostatin → binds somatostatin receptors (SST2 + SST5) → inhibits growth hormone (GH), IGF-1, insulin, glucagon, gastrin, serotonin, VIP, calcitonin, secretin, motilin secretion. Reduces tumor cell proliferation in NET.",
            citationIDs: ["openfda_round29"]
        ),
        dosing: [
            DosingBlock(label: "Acromegaly", body: "120 mg deep subcutaneous gluteal injection every 4 weeks (single-dose pre-filled syringe); adjust based on IGF-1 + GH + symptoms per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "GI / pancreatic NET", body: "120 mg q4 weeks initial; titrate based on response + symptoms.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Renal", body: "Mild-moderate impairment — no adjustment; severe — start 60 mg q4 weeks + titrate.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Hepatic", body: "No specific adjustment.", citationIDs: ["openfda_round29"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to lanreotide.",
            citationIDs: ["openfda_round29"]
        ),
        warnings: [
            AttributedBullet("GALLSTONES + cholecystitis — ~25% develop gallstones; gallbladder ultrasound at baseline + annually; symptomatic cholecystitis may need cholecystectomy.", citationIDs: ["openfda_round29"]),
            AttributedBullet("GLUCOSE DYSREGULATION — both hypoglycemia + hyperglycemia possible; monitor glucose; diabetics may need med adjustment.", citationIDs: ["openfda_round29"]),
            AttributedBullet("BRADYCARDIA — uncommon; monitor HR + ECG.", citationIDs: ["openfda_round29"]),
            AttributedBullet("THYROID — TSH may decrease; monitor.", citationIDs: ["openfda_round29"]),
            AttributedBullet("INJECTION SITE — nodules, pain, induration; rotate quadrants of buttock; deep SC technique critical.", citationIDs: ["openfda_round29"]),
            AttributedBullet("DRUG INTERACTIONS — cyclosporine, insulin, oral antidiabetics, beta-blockers, calcium channel blockers, bromocriptine — monitor.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PREGNANCY — limited data; risk-benefit; consider stopping with planned pregnancy.", citationIDs: ["openfda_round29"]),
            AttributedBullet("VITAMIN B12 deficiency — long-term; monitor + supplement.", citationIDs: ["specialty_round29"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, abdominal pain, nausea, cholelithiasis, flatulence, headache, injection site reactions, glucose dysregulation, fatigue.",
            citationIDs: ["openfda_round29"]
        ),
        drugInteractions: [
            AttributedBullet("CYCLOSPORINE — decreased levels; monitor.", citationIDs: ["openfda_round29"]),
            AttributedBullet("INSULIN + oral antidiabetics — adjust based on glucose response.", citationIDs: ["openfda_round29"]),
            AttributedBullet("BETA-BLOCKERS + CALCIUM CHANNEL BLOCKERS — additive bradycardia; monitor.", citationIDs: ["openfda_round29"]),
            AttributedBullet("BROMOCRIPTINE — increases bromocriptine levels.", citationIDs: ["openfda_round29"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — IGF-1, GH, glucose, TSH, EKG, gallbladder ultrasound, MRI pituitary, visual fields.", citationIDs: ["specialty_round29"]),
            AttributedBullet("DEEP SC GLUTEAL injection technique critical — single-dose pre-filled syringe; alternate buttock; train patient / caregiver for home administration.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Monitoring — IGF-1 + GH q3-6 months; tumor imaging MRI q6-12 months; glucose q3 months; TSH annual; GB US annual.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Counsel — GI side effects (diarrhea, abdominal pain) usually transient; report RUQ pain (gallstones), bradycardia symptoms.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Glucose monitoring — diabetics may need med adjustment; counsel hypoglycemia + hyperglycemia signs.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Self-injection education — many patients self-administer; technique demo + return-demo.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Comparison to octreotide LAR — lanreotide q4 weeks deep SC, octreotide LAR q4 weeks deep IM gluteal; similar efficacy + side effects.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Surgery as definitive therapy — somatostatin analog used pre/post surgery or for non-surgical candidates.", citationIDs: ["specialty_round29"])
        ],
        patientTeaching: AttributedProse(
            "This injection treats acromegaly or neuroendocrine tumors. You'll get it every 4 weeks in your buttock — we may teach you to do it at home. Diarrhea + stomach cramping common at first. Tell us about RUQ belly pain (gallstones) or slow heart rate. Get bloodwork as ordered.",
            citationIDs: ["openrn_pharm_round29"]
        ),
        citations: [openfdaR29, openrnPharmR29, specialtyR29, ismpR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PegvisomantSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "pegvisomant",
        title: "Pegvisomant (Somavert)",
        subtitle: "GH receptor antagonist · acromegaly refractory to somatostatin · daily SC · normalizes IGF-1 but not GH · LFT monitoring · tumor growth surveillance",
        category: "Growth hormone receptor antagonist — refractory acromegaly",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Genetically engineered GH analog — competitively binds GH receptor → blocks GH signaling → reduces IGF-1"),
            KeyValueRow(key: "Use", value: "Acromegaly with inadequate response to surgery + somatostatin analogs; refractory or intolerant to other therapies"),
            KeyValueRow(key: "Dose", value: "Initial 80 mg SC loading → 10 mg SC daily; titrate by 5 mg q4-6 weeks based on IGF-1 to max 30-40 mg/day"),
            KeyValueRow(key: "Monitor", value: "IGF-1 (target — normal age-adjusted) q4-6 weeks until stable → q3-6 months; LFTs monthly × 6 months → q3 months; MRI tumor surveillance q6-12 months"),
            KeyValueRow(key: "Watch", value: "HEPATOTOXICITY — boxed; LFT monitoring; TUMOR GROWTH surveillance (does not shrink tumor); injection site lipohypertrophy")
        ],
        indications: AttributedProse(
            "Acromegaly with inadequate response to surgery + somatostatin analogs OR intolerance to those therapies — normalizes IGF-1 (the most important biomarker) in ~70-90% of patients without affecting GH or directly shrinking tumor per primary source.",
            citationIDs: ["specialty_round29", "openfda_round29"]
        ),
        mechanism: AttributedProse(
            "Genetically engineered GH receptor antagonist (mutant GH analog) — competitively binds GH receptor → prevents GH binding → blocks GH signal transduction → reduces IGF-1 production. GH levels remain elevated (cannot use GH as response marker — IGF-1 is the biomarker).",
            citationIDs: ["openfda_round29"]
        ),
        dosing: [
            DosingBlock(label: "Loading", body: "80 mg SC loading dose; subsequent maintenance daily per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Maintenance", body: "10 mg SC daily; titrate by 5 mg q4-6 weeks based on IGF-1 to max 30-40 mg/day.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Renal / hepatic", body: "No specific renal adjustment; severe hepatic impairment — caution + monitor.", citationIDs: ["openfda_round29"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to pegvisomant.",
            citationIDs: ["openfda_round29"]
        ),
        warnings: [
            AttributedBullet("HEPATOTOXICITY — ALT/AST elevations (sometimes >10× ULN); monitor LFTs monthly × 6 months → q3 months; STOP if ALT/AST >5× ULN or symptomatic.", citationIDs: ["openfda_round29"]),
            AttributedBullet("TUMOR GROWTH SURVEILLANCE — pegvisomant does NOT shrink tumor; surveillance MRI q6-12 months; tumor growth requires reassessment + alternative therapy.", citationIDs: ["specialty_round29"]),
            AttributedBullet("INJECTION SITE LIPOHYPERTROPHY — rotate sites; observable cosmetic lumps.", citationIDs: ["openfda_round29"]),
            AttributedBullet("GLUCOSE — improves in diabetics; reduce diabetes meds.", citationIDs: ["openfda_round29"]),
            AttributedBullet("FREE WATER + EDEMA — mild common; usually transient.", citationIDs: ["openfda_round29"]),
            AttributedBullet("HEADACHE + FLU-LIKE symptoms — mild; transient.", citationIDs: ["openfda_round29"]),
            AttributedBullet("GH MEASUREMENTS unreliable — IGF-1 is biomarker; GH levels confounded by pegvisomant interfering with GH assays.", citationIDs: ["specialty_round29"])
        ],
        adverseReactions: AttributedProse(
            "Injection site reactions, lipohypertrophy, hepatic enzyme elevation, headache, flu-like symptoms, peripheral edema, nausea, diarrhea.",
            citationIDs: ["openfda_round29"]
        ),
        drugInteractions: [
            AttributedBullet("INSULIN + oral antidiabetics — pegvisomant improves glucose; reduce diabetes medications.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Opioid use — opioids can interfere with pegvisomant response; mechanism unclear.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Other PHARMACEUTICAL interactions minimal vs somatostatin analogs.", citationIDs: ["openfda_round29"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — IGF-1, GH (baseline; not useful for ongoing monitoring), LFTs, glucose, MRI pituitary + visual fields.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Monitoring — IGF-1 q4-6 weeks until stable then q3-6 months (TARGET — normal age-adjusted); LFTs monthly × 6 months → q3 months; MRI q6-12 months.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Patient education — daily SC injection self-administration; site rotation (abdomen, thigh, upper arm); lipohypertrophy avoidance.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Counsel — REPORT yellow eyes/skin, dark urine, abdominal pain (hepatotoxicity); tumor symptoms (headache, vision changes) → emergent.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Glucose monitoring — diabetics; adjust meds.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Multidisciplinary — endocrinology + neurosurgery + radiation oncology coordination for complete acromegaly management.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Sometimes COMBINED with somatostatin analogs in difficult patients for better control.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Cost + insurance — extremely expensive; coordinate specialty pharmacy + financial assistance.", citationIDs: ["specialty_round29"])
        ],
        patientTeaching: AttributedProse(
            "This daily shot treats acromegaly that didn't respond to other treatments. Inject into different spots — bumps can form. Tell us about yellow eyes/skin, dark urine, severe headaches, or vision changes. Get monthly bloodwork. Your tumor needs to be checked with MRI regularly — this medicine doesn't shrink it.",
            citationIDs: ["openrn_pharm_round29"]
        ),
        citations: [openfdaR29, openrnPharmR29, specialtyR29, ismpR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TeriparatideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "teriparatide",
        title: "Teriparatide (Forteo)",
        subtitle: "PTH 1-34 analog · ANABOLIC for severe osteoporosis · daily SC × 2 years lifetime max · OSTEOSARCOMA boxed warning · build bone vs antiresorptive",
        category: "PTH analog (recombinant human 1-34) — anabolic osteoporosis",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant human PTH (1-34 amino acids) — anabolic agent"),
            KeyValueRow(key: "Use", value: "Severe postmenopausal osteoporosis at high fracture risk (T-score ≤-2.5 + fragility fracture); male osteoporosis; glucocorticoid-induced osteoporosis"),
            KeyValueRow(key: "Dose", value: "20 mcg SC ONCE daily; maximum lifetime treatment 2 years"),
            KeyValueRow(key: "Monitor", value: "BMD q1-2 years; serum calcium periodically; uric acid"),
            KeyValueRow(key: "Watch", value: "BOXED osteosarcoma in rat studies (rare in humans but contraindicated with prior radiation / Paget disease / open epiphyses); hypercalcemia + orthostatic; follow with antiresorptive after 2 years")
        ],
        indications: AttributedProse(
            "Severe postmenopausal osteoporosis with high fracture risk — T-score ≤-2.5 with fragility fracture OR multiple risk factors OR failure of antiresorptives. Male osteoporosis with high fracture risk. Glucocorticoid-induced osteoporosis (long-term prednisone). Anabolic — builds new bone (vs antiresorptives that prevent loss) per primary source.",
            citationIDs: ["specialty_round29", "openfda_round29"]
        ),
        mechanism: AttributedProse(
            "Recombinant human PTH (1-34 amino acids — biologically active portion). Intermittent daily exposure → preferentially stimulates osteoblasts > osteoclasts → ANABOLIC effect with net bone formation > resorption. Reverses bone loss + increases BMD + reduces vertebral + non-vertebral fractures.",
            citationIDs: ["openfda_round29"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "20 mcg SC once daily — thigh or abdominal wall; multi-dose pen device per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Duration", body: "MAXIMUM 2 YEARS LIFETIME — based on rat carcinogenicity studies; follow with antiresorptive (bisphosphonate, denosumab) to preserve gains.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Renal", body: "Severe impairment (CrCl <30) — caution; mild-moderate no adjustment.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Storage", body: "Refrigerate 2-8°C; never freeze; protect from light; 28-day room temperature stability after first use.", citationIDs: ["openfda_round29"])
        ],
        contraindications: AttributedProse(
            "Pre-existing risk for osteosarcoma — Paget disease, unexplained alkaline phosphatase elevation, open epiphyses (pediatric), prior skeletal radiation; bone metastasis; hypercalcemia; severe renal impairment; hypersensitivity.",
            citationIDs: ["openfda_round29"]
        ),
        warnings: [
            AttributedBullet("BOXED — OSTEOSARCOMA in rats (dose-dependent); human cases very rare; 2-year lifetime maximum; contraindicated with risk factors.", citationIDs: ["openfda_round29"]),
            AttributedBullet("HYPERCALCEMIA — transient ~4-6 hours after injection; check calcium periodically; symptomatic rare.", citationIDs: ["openfda_round29"]),
            AttributedBullet("ORTHOSTATIC HYPOTENSION — first few doses; sit/lie 30 min after first 2-3 injections; subsequent rare.", citationIDs: ["openfda_round29"]),
            AttributedBullet("URIC ACID + GOUT — mild increases; monitor; counsel.", citationIDs: ["openfda_round29"]),
            AttributedBullet("FOLLOW WITH ANTIRESORPTIVE — bisphosphonate or denosumab after 2 years to preserve BMD gains; otherwise rapid loss.", citationIDs: ["specialty_round29"]),
            AttributedBullet("DIGOXIN — transient hypercalcemia may increase digoxin toxicity; monitor.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PREGNANCY — Category C; contraindicated for osteoporosis indication.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PEDIATRIC + young adults — contraindicated (open epiphyses).", citationIDs: ["openfda_round29"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, dizziness, leg cramps, arthralgia, fatigue, headache, transient hypercalcemia, mild uric acid elevation, injection site reactions, orthostatic hypotension.",
            citationIDs: ["openfda_round29"]
        ),
        drugInteractions: [
            AttributedBullet("DIGOXIN — transient hypercalcemia may precipitate digoxin toxicity; monitor.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Thiazide diuretics — increased hypercalcemia risk.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Calcium-containing antacids — additive hypercalcemia.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Other osteoporosis meds — not concurrent (separate antiresorptive after 2 years).", citationIDs: ["specialty_round29"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — DEXA (T-score, baseline BMD), CMP (calcium, phosphate, creatinine, alkaline phosphatase, uric acid), 25-OH vitamin D + supplement to ≥30 ng/mL, fracture risk (FRAX), comprehensive osteoporosis evaluation.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Pen device education — multi-dose pen; 28-day stability after first use at room temp; needles; rotation thigh + abdomen.", citationIDs: ["openfda_round29"]),
            AttributedBullet("ORTHOSTATIC — first 2-3 doses lying down or sitting × 30 min; later usually fine.", citationIDs: ["openfda_round29"]),
            AttributedBullet("CALCIUM 1000-1200 mg/day + VITAMIN D 800-1000 IU daily — concurrent with teriparatide.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Monitor — calcium periodically; DEXA q1-2 years; gout monitoring.", citationIDs: ["specialty_round29"]),
            AttributedBullet("FOLLOW UP — antiresorptive (alendronate, denosumab, zoledronic acid) immediately after 2-year teriparatide course to preserve gains.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Counsel — REPORT severe abdominal pain (rare carcinoma), severe bone pain (rare osteosarcoma), persistent nausea/vomiting (hypercalcemia).", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Cost + insurance — expensive; specialty pharmacy + financial assistance.", citationIDs: ["specialty_round29"])
        ],
        patientTeaching: AttributedProse(
            "This daily shot BUILDS new bone (most osteoporosis meds just prevent loss). Use 2 years max — then switch to another bone medicine. Inject in thigh or belly; first few doses sit or lie down. Take calcium + vitamin D daily. Tell us about severe bone pain, severe nausea, leg cramps. Refrigerate the pen.",
            citationIDs: ["openrn_pharm_round29"]
        ),
        citations: [openfdaR29, openrnPharmR29, specialtyR29, ismpR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum RomosozumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "romosozumab",
        title: "Romosozumab (Evenity)",
        subtitle: "Anti-sclerostin · severe postmenopausal osteoporosis · monthly SC × 12 months · BOXED CV events + MI/stroke · dual anabolic + antiresorptive",
        category: "Anti-sclerostin biologic — osteoporosis anabolic + antiresorptive",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Humanized monoclonal antibody against sclerostin"),
            KeyValueRow(key: "Use", value: "Postmenopausal women with severe osteoporosis at high fracture risk (T-score ≤-2.5 with fracture history OR multiple risk factors OR failure of other therapies)"),
            KeyValueRow(key: "Dose", value: "210 mg SC monthly × 12 months (single 12-month course; not repeated); follow with antiresorptive"),
            KeyValueRow(key: "Monitor", value: "BMD baseline + 12 months; calcium periodically; CV risk before initiation"),
            KeyValueRow(key: "Watch", value: "BOXED — increased MI + stroke + CV mortality; AVOID in patients with MI or stroke in prior 12 months OR high CV risk; dual mechanism (anabolic + antiresorptive)")
        ],
        indications: AttributedProse(
            "Postmenopausal women with severe osteoporosis at high fracture risk — T-score ≤-2.5 with fracture history OR multiple risk factors OR failure of other therapies. Single 12-month course; follow with antiresorptive (alendronate, denosumab, zoledronic acid) to preserve gains per primary source.",
            citationIDs: ["specialty_round29", "openfda_round29"]
        ),
        mechanism: AttributedProse(
            "Humanized monoclonal antibody against sclerostin — sclerostin is a glycoprotein from osteocytes that inhibits Wnt signaling + bone formation. Blocking sclerostin → activates Wnt pathway → DUAL effect: anabolic (bone formation) + antiresorptive (decreases osteoclast activity). Net massive bone gain in 12 months > teriparatide.",
            citationIDs: ["openfda_round29"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "210 mg subcutaneous monthly (administered as TWO consecutive injections of 105 mg each) — single 12-month course; NOT repeated per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Follow-up", body: "After 12 months romosozumab, transition to ANTIRESORPTIVE (bisphosphonate or denosumab) to preserve BMD gains; otherwise rapid loss.", citationIDs: ["specialty_round29"]),
            DosingBlock(label: "Renal / hepatic", body: "No specific adjustment; severe renal — caution.", citationIDs: ["openfda_round29"])
        ],
        contraindications: AttributedProse(
            "MI OR stroke in PRIOR 12 MONTHS; hypersensitivity; hypocalcemia.",
            citationIDs: ["openfda_round29"]
        ),
        warnings: [
            AttributedBullet("BOXED — INCREASED CARDIOVASCULAR EVENTS (MI + stroke + CV mortality); avoid in patients with MI or stroke in prior 12 months OR high CV risk; risk-benefit discussion.", citationIDs: ["openfda_round29"]),
            AttributedBullet("HYPOCALCEMIA — pretreat with calcium + vitamin D; correct before initiation; monitor.", citationIDs: ["openfda_round29"]),
            AttributedBullet("OSTEONECROSIS OF JAW (rare) — dental exam before; good oral hygiene; avoid invasive dental procedures during.", citationIDs: ["specialty_round29"]),
            AttributedBullet("ATYPICAL FEMUR FRACTURES (rare) — thigh / groin pain warrants evaluation; bilateral.", citationIDs: ["specialty_round29"]),
            AttributedBullet("HYPERSENSITIVITY REACTIONS — angioedema, urticaria, anaphylaxis rare.", citationIDs: ["openfda_round29"]),
            AttributedBullet("FOLLOW WITH ANTIRESORPTIVE — bisphosphonate or denosumab immediately after to preserve BMD gains; otherwise rapid loss.", citationIDs: ["specialty_round29"]),
            AttributedBullet("PREGNANCY — Category C / X; contraindicated.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Single 12-month course — not repeated.", citationIDs: ["openfda_round29"])
        ],
        adverseReactions: AttributedProse(
            "Arthralgia, headache, injection site reactions, muscle spasms, hypersensitivity reactions, MI / stroke (boxed), hypocalcemia, ONJ (rare), atypical femur fracture (rare).",
            citationIDs: ["openfda_round29"]
        ),
        drugInteractions: [
            AttributedBullet("CALCIUM-LOWERING agents — avoid concurrent; correct hypocalcemia before romosozumab.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Other osteoporosis biologics (denosumab) — not concurrent.", citationIDs: ["specialty_round29"]),
            AttributedBullet("LIVE VACCINES — avoid during therapy; data limited.", citationIDs: ["specialty_round29"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — DEXA T-score, CMP (calcium, phosphate, vitamin D), CV history + risk factors (MI, stroke in 12 months, CAD, PVD), dental exam (ONJ), pregnancy test.", citationIDs: ["specialty_round29"]),
            AttributedBullet("CV RISK ASSESSMENT essential — Avoid if MI / stroke in prior 12 months; risk-benefit discussion with cardiology.", citationIDs: ["specialty_round29"]),
            AttributedBullet("HYPOCALCEMIA — correct + supplement with calcium 1000-1200 mg/day + vitamin D 800-1000 IU daily BEFORE + DURING + AFTER.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Dental exam + clearance before initiation; counsel ONJ risk; good oral hygiene; avoid invasive dental procedures during.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Monthly SC injection — two 105 mg injections at separate sites (thigh, abdomen, upper arm); rotation.", citationIDs: ["openfda_round29"]),
            AttributedBullet("12-MONTH course — transition to bisphosphonate or denosumab immediately after; preserves gains.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Counsel — REPORT chest pain, severe HA, weakness, slurred speech (MI/stroke), thigh/groin pain (atypical femur fracture), severe jaw pain.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Cost + insurance — expensive; specialty pharmacy + financial assistance.", citationIDs: ["specialty_round29"])
        ],
        patientTeaching: AttributedProse(
            "This monthly shot builds bone for 12 months. WARNING — small increase in heart attack / stroke risk. Tell us about chest pain, weakness, slurred speech, severe headache RIGHT AWAY. Take calcium + vitamin D daily. After 12 months, you'll start another bone medicine. Get dental check before starting.",
            citationIDs: ["openrn_pharm_round29"]
        ),
        citations: [openfdaR29, openrnPharmR29, specialtyR29, ismpR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MetyraponeSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "metyrapone",
        title: "Metyrapone (Metopirone)",
        subtitle: "11-β-hydroxylase inhibitor · Cushing syndrome diagnostic + treatment · cortisol suppression test · adrenal insufficiency risk · GI side effects",
        category: "Steroidogenesis inhibitor — Cushing syndrome",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "11-β-hydroxylase enzyme inhibitor — blocks last step of cortisol synthesis"),
            KeyValueRow(key: "Use", value: "Diagnostic — overnight metyrapone test for ACTH-dependent Cushing; treatment — pre-operative or chronic medical management of Cushing syndrome"),
            KeyValueRow(key: "Dose", value: "Adult diagnostic: 30 mg/kg PO once at midnight (single test); treatment: 250-500 mg PO q4-6h, titrate to cortisol normalization"),
            KeyValueRow(key: "Monitor", value: "Cortisol level (target normal); ACTH; electrolytes; hypoadrenalism signs"),
            KeyValueRow(key: "Watch", value: "ADRENAL INSUFFICIENCY (over-suppression); GI side effects (nausea common); increased androgens + mineralocorticoid precursors → HTN / hypokalemia / hirsutism")
        ],
        indications: AttributedProse(
            "Diagnostic — overnight single-dose metyrapone test for ACTH-dependent Cushing syndrome workup. Treatment — pre-operative cortisol reduction in Cushing pre-surgery, OR chronic medical management of Cushing in non-surgical candidates / refractory disease. Off-label adrenal cortical carcinoma per primary source.",
            citationIDs: ["specialty_round29", "openfda_round29"]
        ),
        mechanism: AttributedProse(
            "Inhibits 11-β-hydroxylase enzyme (CYP11B1) — final step in cortisol biosynthesis (converting 11-deoxycortisol to cortisol) → reduced cortisol → reflex ACTH increase + buildup of 11-deoxycortisol + mineralocorticoid precursors + androgens. Diagnostic test relies on reflex ACTH rise.",
            citationIDs: ["openfda_round29"]
        ),
        dosing: [
            DosingBlock(label: "Diagnostic test (single dose)", body: "30 mg/kg PO (max 3 g) once at 11:30 PM (midnight); morning cortisol + 11-deoxycortisol + ACTH at 8 AM next day; ACTH-dependent Cushing shows expected rise in 11-deoxycortisol + ACTH.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Treatment", body: "Initial 250-500 mg PO q4-6h with food; titrate based on cortisol response to max 4-6 g/day per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Renal / hepatic", body: "Severe — caution; titrate based on cortisol response.", citationIDs: ["openfda_round29"])
        ],
        contraindications: AttributedProse(
            "Adrenal insufficiency; hypersensitivity; pregnancy (relative — limited data).",
            citationIDs: ["openfda_round29"]
        ),
        warnings: [
            AttributedBullet("ADRENAL INSUFFICIENCY — over-suppression risk; cortisol monitoring; symptoms — fatigue, hypotension, hyponatremia.", citationIDs: ["openfda_round29"]),
            AttributedBullet("HIRSUTISM + acne + virilization — increased androgens (precursor buildup); women may develop facial hair.", citationIDs: ["openfda_round29"]),
            AttributedBullet("HYPERTENSION + HYPOKALEMIA — mineralocorticoid precursors (11-deoxycorticosterone) accumulate; monitor BP + electrolytes.", citationIDs: ["openfda_round29"]),
            AttributedBullet("GI SIDE EFFECTS — nausea, vomiting, abdominal discomfort common; take with food.", citationIDs: ["openfda_round29"]),
            AttributedBullet("DIZZINESS + sedation — counsel.", citationIDs: ["openfda_round29"]),
            AttributedBullet("DIAGNOSTIC TEST — single overnight dose with morning labs; treatment requires chronic dosing.", citationIDs: ["specialty_round29"]),
            AttributedBullet("STRESS DOSING — if illness / surgery on chronic metyrapone, may need hydrocortisone stress-dose.", citationIDs: ["specialty_round29"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, dizziness, sedation, hypertension, hypokalemia, hirsutism, acne, headache, edema, adrenal insufficiency.",
            citationIDs: ["openfda_round29"]
        ),
        drugInteractions: [
            AttributedBullet("DIPHENYLHYDANTOIN, anticonvulsants — induce metabolism; reduce metyrapone effect; adjust.", citationIDs: ["openfda_round29"]),
            AttributedBullet("STRONG CYP3A4 inhibitors — increase metyrapone levels.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Hormones — interfere with cortisol assays; counsel timing of measurements.", citationIDs: ["openfda_round29"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — cortisol (24h urine free cortisol + late-night salivary cortisol + low-dose dex suppression), ACTH, electrolytes, BP, glucose.", citationIDs: ["specialty_round29"]),
            AttributedBullet("DIAGNOSTIC TEST — strict timing; 30 mg/kg at 11:30 PM; 8 AM next-day labs (cortisol + 11-deoxycortisol + ACTH).", citationIDs: ["openfda_round29"]),
            AttributedBullet("TREATMENT — divided q4-6h dosing with food; cortisol response monitoring frequently during titration.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Monitor — cortisol (target normal); electrolytes (potassium, sodium); BP; glucose; signs of adrenal insufficiency.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Counsel — take with food; report dizziness, severe weakness, hypotension (adrenal insufficiency); facial hair / acne (hirsutism).", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Stress dosing — if illness / surgery, may need hydrocortisone backup.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Definitive therapy — pituitary surgery for Cushing disease; adrenalectomy for adrenal Cushing; metyrapone bridge or chronic for non-surgical.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Coordinate endocrinology — close follow-up; specialty pharmacy.", citationIDs: ["specialty_round29"])
        ],
        patientTeaching: AttributedProse(
            "This medicine reduces cortisol in Cushing syndrome. Take with food. Tell us if you feel very weak, lightheaded, or about to faint — could be too much suppression. Side effects may include extra facial hair, acne (in women), high blood pressure. Get bloodwork as ordered. If you get sick or need surgery, we may add stress-dose steroids.",
            citationIDs: ["openrn_pharm_round29"]
        ),
        citations: [openfdaR29, openrnPharmR29, specialtyR29, ismpR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DoxazosinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "doxazosin",
        title: "Doxazosin (Cardura / Cardura XL)",
        subtitle: "Selective alpha-1 antagonist · BPH + HTN + pheochromocytoma preop · FIRST-DOSE syncope · orthostatic · NOT first-line HTN (ALLHAT)",
        category: "Selective alpha-1 adrenergic antagonist — BPH + pheo preop + HTN",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective alpha-1 adrenergic receptor antagonist (peripheral + prostatic)"),
            KeyValueRow(key: "Use", value: "Benign prostatic hyperplasia (BPH); hypertension (NOT first-line per ALLHAT — increased CHF + stroke); PHEOCHROMOCYTOMA preoperative alpha-blockade (alternative to phenoxybenzamine)"),
            KeyValueRow(key: "Dose", value: "Start 1 mg PO at bedtime; titrate q1-2 weeks to 4-8 mg/day; pheo preop higher 4-16 mg/day; max 16 mg/day"),
            KeyValueRow(key: "Monitor", value: "BP supine + standing; first-dose effect; symptoms"),
            KeyValueRow(key: "Watch", value: "FIRST-DOSE SYNCOPE / hypotension — give at bedtime; orthostatic; intraoperative floppy iris syndrome (IFIS) for cataract surgery; NOT first-line HTN")
        ],
        indications: AttributedProse(
            "Benign prostatic hyperplasia (BPH) urinary symptoms; hypertension (NOT first-line per ALLHAT trial — increased CHF + stroke); PHEOCHROMOCYTOMA preoperative alpha-blockade — alternative to phenoxybenzamine; selective alpha-1 well-tolerated outpatient prep per primary source.",
            citationIDs: ["specialty_round29", "openfda_round29"]
        ),
        mechanism: AttributedProse(
            "Selective alpha-1A + alpha-1B + alpha-1D adrenergic receptor antagonist → blocks vascular smooth muscle alpha-1 → vasodilation → reduced BP + improves BPH urinary symptoms (relaxes prostatic + bladder neck smooth muscle). Less selective for prostatic alpha-1A than tamsulosin.",
            citationIDs: ["openfda_round29"]
        ),
        dosing: [
            DosingBlock(label: "BPH / hypertension", body: "Initial 1 mg PO AT BEDTIME × 1 week → titrate q1-2 weeks to 4-8 mg/day; max 8 mg/day for HTN, 16 mg for BPH per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Pheochromocytoma preop", body: "Higher doses needed; titrate to BP target + orthostatic intolerance; 4-16 mg/day in divided doses; typically 10-14 days preop with rehydration + beta-blocker AFTER alpha-blockade established.", citationIDs: ["specialty_round29"]),
            DosingBlock(label: "Cardura XL (extended-release)", body: "Initial 4 mg AM; titrate to 8 mg AM; do not crush; for BPH.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Renal / hepatic", body: "Severe hepatic — caution; renal — no specific adjustment.", citationIDs: ["openfda_round29"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to quinazolines (terazosin, prazosin); pregnancy (limited data); hypotension; severe heart failure.",
            citationIDs: ["openfda_round29"]
        ),
        warnings: [
            AttributedBullet("FIRST-DOSE PHENOMENON — syncope + hypotension within 30-90 min of first dose; give AT BEDTIME; counsel; first 2-3 doses caution.", citationIDs: ["openfda_round29"]),
            AttributedBullet("ORTHOSTATIC HYPOTENSION — common; rise slowly; counsel + monitor.", citationIDs: ["openfda_round29"]),
            AttributedBullet("INTRAOPERATIVE FLOPPY IRIS SYNDROME (IFIS) — alpha-blocker class effect; complicates cataract surgery; tell ophthalmologist.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PRIAPISM — rare but emergent (alpha-blocker class); seek immediate care.", citationIDs: ["openfda_round29"]),
            AttributedBullet("CHF / STROKE — ALLHAT showed doxazosin arm increased CHF + stroke vs thiazide; NOT first-line HTN.", citationIDs: ["specialty_round29"]),
            AttributedBullet("PHEO PREOP — combine with beta-blockade AFTER alpha-blockade established (never beta-blockade alone — unopposed alpha → hypertensive crisis); rehydration; 10-14 days preop.", citationIDs: ["specialty_round29"]),
            AttributedBullet("OLDER ADULTS — increased fall risk from orthostasis.", citationIDs: ["openfda_round29"]),
            AttributedBullet("RECONSTRUCTION + DRAINAGE if interrupted — restart at LOWER dose; otherwise first-dose effect recurs.", citationIDs: ["openfda_round29"])
        ],
        adverseReactions: AttributedProse(
            "Dizziness, headache, fatigue, somnolence, orthostatic hypotension, edema, nausea, dyspnea, asthenia, rhinitis, ejaculatory dysfunction, priapism (rare).",
            citationIDs: ["openfda_round29"]
        ),
        drugInteractions: [
            AttributedBullet("ANTIHYPERTENSIVES + diuretics — additive hypotension; titrate.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PDE5 INHIBITORS (sildenafil, tadalafil) — additive hypotension; minimum 4-hour separation.", citationIDs: ["openfda_round29"]),
            AttributedBullet("STRONG CYP3A4 inhibitors — increase doxazosin levels.", citationIDs: ["openfda_round29"]),
            AttributedBullet("BETA-BLOCKERS — pheo preop: alpha-blockade FIRST, then beta-blocker; otherwise additive hypotension.", citationIDs: ["specialty_round29"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — BP supine + standing, heart rate, history of CHF / stroke / orthostasis, AAA / fall risk, vision (IFIS), medications.", citationIDs: ["specialty_round29"]),
            AttributedBullet("FIRST DOSE at bedtime; counsel orthostatic symptoms; have someone available.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Orthostatic precautions — rise slowly; sit on edge of bed before standing; first 2-3 doses caution.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Restart at low dose if missed >2-3 doses (first-dose effect returns).", citationIDs: ["openfda_round29"]),
            AttributedBullet("Counsel — report syncope, falls, vision changes, priapism (emergent), severe weakness.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("PHEO PREOP — 10-14 days preop with rehydration (1-2 L/day extra fluid); beta-blocker AFTER alpha established; coordinate endocrine + surgery + anesthesia.", citationIDs: ["specialty_round29"]),
            AttributedBullet("CATARACT SURGERY — inform ophthalmologist of doxazosin (IFIS risk).", citationIDs: ["openfda_round29"]),
            AttributedBullet("Falls — older adults at risk; consider alternative for HTN.", citationIDs: ["specialty_round29"])
        ],
        patientTeaching: AttributedProse(
            "This pill treats prostate symptoms / blood pressure / pheo prep. Take FIRST DOSE AT BEDTIME — may cause dizziness or fainting. Rise slowly from sitting/lying. Tell us about painful erections lasting >4 hours (priapism — emergency). Before cataract surgery, tell ophthalmologist you're on this. Take consistently — restart at low dose if missed >2 days.",
            citationIDs: ["openrn_pharm_round29"]
        ),
        citations: [openfdaR29, openrnPharmR29, specialtyR29, ismpR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PotassiumIodideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "potassium-iodide",
        title: "Potassium iodide (SSKI / Lugol's solution) + Lugol's iodine",
        subtitle: "Iodide salt · preoperative thyroidectomy + thyroid storm (after PTU/methimazole) · radiation prophylaxis · NEVER before PTU in thyroid storm",
        category: "Iodide — preoperative thyroidectomy + thyroid storm + radiation prophylaxis",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Iodide salt — pharmacologic doses inhibit thyroid hormone release + synthesis (Wolff-Chaikoff effect)"),
            KeyValueRow(key: "Use", value: "Preoperative thyroidectomy (10-14 days prior); thyroid storm (after PTU/methimazole loaded); radioactive iodine exposure prophylaxis (radiation emergency)"),
            KeyValueRow(key: "Dose", value: "Adult SSKI: 5-10 drops PO TID (1 drop ~50 mg KI); Lugol's: 4-8 drops PO TID; thyroid storm: 5 drops PO/NG q6h after PTU; radiation prophylaxis: 130 mg PO single dose"),
            KeyValueRow(key: "Monitor", value: "Thyroid hormones, signs of iodism (metallic taste, salivation, rash)"),
            KeyValueRow(key: "Watch", value: "MUST be given AFTER thioamide loaded in thyroid storm (iodine alone can paradoxically increase synthesis); brief duration only (escape phenomenon); iodism")
        ],
        indications: AttributedProse(
            "Preoperative thyroidectomy — reduces gland vascularity + size + bleeding 10-14 days prior. Thyroid storm — adjunct after PTU or methimazole loading. Radioactive iodine (I-131) thyroid prophylaxis in nuclear emergency. Iodine deficiency (not in iodine-replete areas). Off-label sporotrichosis per primary source.",
            citationIDs: ["specialty_round29", "openfda_round29"]
        ),
        mechanism: AttributedProse(
            "Pharmacologic doses of iodide → acutely inhibit thyroid hormone release (proteolysis of stored hormones) + synthesis (Wolff-Chaikoff effect — high iodine paradoxically suppresses iodide organification). EFFECT TRANSIENT — escape phenomenon in 10-14 days. Useful only for short-term thyroid suppression preop or in storm.",
            citationIDs: ["openfda_round29"]
        ),
        dosing: [
            DosingBlock(label: "Preoperative thyroidectomy", body: "SSKI 5-10 drops PO TID OR Lugol's 4-8 drops PO TID × 10-14 days prior; coordinate with thioamide (PTU or methimazole) per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Thyroid storm", body: "Lugol's 5-10 drops PO/NG q6 hours OR SSKI 5 drops q6 hours — given AT LEAST 1 HOUR AFTER PTU/methimazole loading (otherwise paradoxical increase in T4 synthesis).", citationIDs: ["specialty_round29"]),
            DosingBlock(label: "Radiation prophylaxis", body: "Adult 130 mg PO single dose; pediatric 65 mg (4-12 years), 32 mg (1-3 years), 16 mg (1 month-1 year), 16 mg (<1 month); single dose covers 24 hours; repeat per emergency protocol.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Renal / hepatic", body: "No specific adjustment.", citationIDs: ["openfda_round29"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to iodine; hyperkalemia; dermatitis herpetiformis; hypocomplementemic vasculitis; preexisting iodism.",
            citationIDs: ["openfda_round29"]
        ),
        warnings: [
            AttributedBullet("THYROID STORM — give AFTER PTU/methimazole loaded (≥1 hour); iodine alone CAN PARADOXICALLY INCREASE T4 synthesis (Jod-Basedow effect in iodine-deficient).", citationIDs: ["specialty_round29"]),
            AttributedBullet("ESCAPE PHENOMENON — thyroid suppression transient (10-14 days); not for chronic management.", citationIDs: ["specialty_round29"]),
            AttributedBullet("IODISM — chronic / high dose: metallic taste, increased salivation, coryza, rash, sore throat, GI upset; discontinue.", citationIDs: ["openfda_round29"]),
            AttributedBullet("HYPERSENSITIVITY — anaphylaxis rare; counsel any prior iodine reaction.", citationIDs: ["openfda_round29"]),
            AttributedBullet("HYPERKALEMIA — KI delivers potassium; cautious in renal impairment + ACE inhibitors.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PREGNANCY — Category D acute thyroid storm benefit > fetal risk; chronic large doses can suppress fetal thyroid.", citationIDs: ["openfda_round29"]),
            AttributedBullet("FETAL THYROID SUPPRESSION — pregnancy chronic high doses; brief preoperative typically acceptable.", citationIDs: ["specialty_round29"]),
            AttributedBullet("NEONATES + INFANTS — chronic high doses can suppress thyroid; brief acceptable.", citationIDs: ["openfda_round29"])
        ],
        adverseReactions: AttributedProse(
            "Metallic taste, increased salivation, rhinitis, rash, sore throat, swelling of salivary glands, GI upset, iodism, hyperkalemia.",
            citationIDs: ["openfda_round29"]
        ),
        drugInteractions: [
            AttributedBullet("ACE INHIBITORS + ARBs + potassium-sparing diuretics — additive hyperkalemia.", citationIDs: ["openfda_round29"]),
            AttributedBullet("LITHIUM — additive hypothyroidism.", citationIDs: ["openfda_round29"]),
            AttributedBullet("ANTITHYROID DRUGS (PTU, methimazole) — synergistic; appropriate sequencing in thyroid storm.", citationIDs: ["specialty_round29"]),
            AttributedBullet("AMIODARONE — additive thyroid effects.", citationIDs: ["openfda_round29"]),
            AttributedBullet("RADIOLOGIC CONTRAST iodinated — interferes; coordinate.", citationIDs: ["openfda_round29"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — TSH, free T4, allergies (iodine + shellfish), pregnancy status, kidney function, potassium.", citationIDs: ["specialty_round29"]),
            AttributedBullet("TIMING IN THYROID STORM — PTU or methimazole FIRST (load 600-1000 mg PTU); then ≥1 hour later add iodine (Lugol's / SSKI) per primary source.", citationIDs: ["specialty_round29"]),
            AttributedBullet("PREOPERATIVE THYROIDECTOMY — 10-14 days before surgery; combined with antithyroid drug; reduces gland vascularity / bleeding.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Administer in juice / milk / water to mask taste; metallic taste common; can also give via NG.", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("MONITOR for IODISM — metallic taste, salivation, rash, sore throat; discontinue if severe.", citationIDs: ["openfda_round29"]),
            AttributedBullet("RADIATION EMERGENCY — KI as soon as possible (within hours) of exposure; pediatric dosing differs; thyroid-specific protection.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Cardiac patients — caution with hyperkalemia + arrhythmias.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Coordinate endocrinology + surgery; communicate timing to entire team.", citationIDs: ["specialty_round29"])
        ],
        patientTeaching: AttributedProse(
            "These iodine drops prepare your thyroid for surgery or help with thyroid storm. Mix in juice or milk — has metallic taste. Take with your other thyroid medicine in the right order. Tell us about rash, metallic taste, mouth sores, sore throat. If you're pregnant, tell us. Stop after surgery / treatment unless told to continue.",
            citationIDs: ["openrn_pharm_round29"]
        ),
        citations: [openfdaR29, openrnPharmR29, specialtyR29, ismpR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ParicalcitolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "paricalcitol",
        title: "Paricalcitol (Zemplar)",
        subtitle: "Selective vitamin D analog · CKD secondary hyperparathyroidism · PO + IV · less hypercalcemia than calcitriol · PTH suppression",
        category: "Selective vitamin D receptor activator — CKD-MBD secondary HPT",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective vitamin D receptor activator (VDRA) — selective for parathyroid + bone vs gut + bone"),
            KeyValueRow(key: "Use", value: "Secondary hyperparathyroidism (SHPT) in chronic kidney disease (CKD) stages 3-5 + dialysis; reduces PTH with less hypercalcemia + hyperphosphatemia than calcitriol"),
            KeyValueRow(key: "Dose", value: "CKD 3-4 PO: 1 mcg daily OR 2 mcg 3× weekly + titrate; dialysis IV: 0.04-0.1 mcg/kg 3× weekly post-dialysis; titrate to PTH target"),
            KeyValueRow(key: "Monitor", value: "iPTH q3 months (target stage-dependent), calcium + phosphate q1 month initially, vitamin D"),
            KeyValueRow(key: "Watch", value: "Hypercalcemia + hyperphosphatemia (less than calcitriol but still possible); calciphylaxis risk in dialysis; cardiovascular calcification")
        ],
        indications: AttributedProse(
            "Secondary hyperparathyroidism (SHPT) in chronic kidney disease (CKD) stages 3-5 + on hemodialysis — reduces elevated PTH to KDIGO targets while minimizing hypercalcemia + hyperphosphatemia (selective for parathyroid + bone vs gut + bone) per primary source.",
            citationIDs: ["specialty_round29", "openfda_round29"]
        ),
        mechanism: AttributedProse(
            "Selective vitamin D receptor activator (VDRA) — 19-nor analog of calcitriol; activates VDR in parathyroid (suppresses PTH) + bone (improves bone mineralization) > intestine (less calcium absorption) + kidney; less hypercalcemia + hyperphosphatemia than calcitriol.",
            citationIDs: ["openfda_round29"]
        ),
        dosing: [
            DosingBlock(label: "CKD stages 3-4 (PO)", body: "Initial 1 mcg PO daily OR 2 mcg PO 3× weekly; titrate based on iPTH (target stage-dependent); max ~24 mcg/week per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Dialysis (IV)", body: "Initial 0.04-0.1 mcg/kg IV 3× weekly post-dialysis; titrate based on iPTH; titrate by 2-4 mcg per dose; max ~0.24 mcg/kg/dose.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Adjust based on calcium/phosphate", body: "Hold if calcium >10.5 mg/dL; hold or reduce if phosphate >5.5 mg/dL; resume at reduced dose.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Pediatric", body: "Limited; specialist guidance.", citationIDs: ["openfda_round29"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to paricalcitol; hypercalcemia; vitamin D toxicity.",
            citationIDs: ["openfda_round29"]
        ),
        warnings: [
            AttributedBullet("HYPERCALCEMIA — less than calcitriol but still possible; hold if calcium >10.5; vitamin D toxicity (hypercalcemia + hypercalciuria + soft tissue calcification).", citationIDs: ["openfda_round29"]),
            AttributedBullet("HYPERPHOSPHATEMIA — less than calcitriol but possible; control with phosphate binders.", citationIDs: ["openfda_round29"]),
            AttributedBullet("CALCIPHYLAXIS — rare but devastating in dialysis; ischemic skin necrosis; high mortality; review calcium-phosphate product (target <55).", citationIDs: ["specialty_round29"]),
            AttributedBullet("CARDIOVASCULAR CALCIFICATION — risk in CKD; balance PTH suppression with calcium-phosphate control.", citationIDs: ["specialty_round29"]),
            AttributedBullet("OVERSUPPRESSION of PTH — adynamic bone disease (oversuppressed PTH); target iPTH range per KDIGO.", citationIDs: ["specialty_round29"]),
            AttributedBullet("PREGNANCY — Category C; limited data.", citationIDs: ["openfda_round29"]),
            AttributedBullet("DRUG INTERACTIONS — limited; counsel.", citationIDs: ["openfda_round29"])
        ],
        adverseReactions: AttributedProse(
            "Hypercalcemia, hyperphosphatemia, headache, nausea, asthenia, edema, hypoesthesia, fatigue, depression.",
            citationIDs: ["openfda_round29"]
        ),
        drugInteractions: [
            AttributedBullet("CALCIUM-CONTAINING ANTACIDS + supplements + binders — additive hypercalcemia.", citationIDs: ["openfda_round29"]),
            AttributedBullet("OTHER vitamin D analogs (calcitriol, doxercalciferol, cholecalciferol) — additive; not concurrent.", citationIDs: ["openfda_round29"]),
            AttributedBullet("DIGOXIN — hypercalcemia precipitates digoxin toxicity.", citationIDs: ["openfda_round29"]),
            AttributedBullet("KETOCONAZOLE — increases paricalcitol levels.", citationIDs: ["openfda_round29"]),
            AttributedBullet("MAGNESIUM-containing antacids — additive hypermagnesemia.", citationIDs: ["openfda_round29"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — iPTH, calcium, phosphate, calcium-phosphate product, 25-OH vitamin D, magnesium, CKD stage, dialysis schedule.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Monitoring — iPTH q3 months (target stage-dependent), calcium + phosphate q1 month initially → q3 months; calcium-phosphate product <55 target.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Hold or reduce if calcium >10.5 OR phosphate >5.5 OR Ca×P >55; resume reduced dose when normalized.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Phosphate binders + dietary phosphate restriction — concurrent.", citationIDs: ["specialty_round29"]),
            AttributedBullet("IV dose — post-dialysis only; PO dose with or without food.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Counsel — report nausea, vomiting, severe weakness, confusion (hypercalcemia); skin ulcers (calciphylaxis emergent).", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("MULTIDISCIPLINARY — nephrology + dietitian + dialysis team; CKD-MBD management.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Alternative — calcimimetics (cinacalcet, etelcalcetide) for refractory; parathyroidectomy for severe SHPT.", citationIDs: ["specialty_round29"])
        ],
        patientTeaching: AttributedProse(
            "This vitamin D medicine helps with bone + parathyroid problems from kidney disease. We monitor calcium + phosphate + PTH carefully. Tell us about nausea, vomiting, weakness, confusion, or any skin sores (especially on your legs / belly — could be serious). Take your phosphate binders + restrict phosphate-rich foods. Coordinate with dialysis schedule.",
            citationIDs: ["openrn_pharm_round29"]
        ),
        citations: [openfdaR29, openrnPharmR29, specialtyR29, ismpR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CalcitoninSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "calcitonin",
        title: "Calcitonin (Miacalcin / Fortical)",
        subtitle: "Salmon calcitonin · acute hypercalcemia + Paget disease + osteoporosis (rarely now) · IM/SC/nasal · TACHYPHYLAXIS · increased cancer risk",
        category: "Calcitonin — hypercalcemia + Paget disease + osteoporosis",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Salmon calcitonin synthetic — inhibits osteoclasts + reduces renal calcium reabsorption"),
            KeyValueRow(key: "Use", value: "Acute hypercalcemia of malignancy (adjunct); Paget disease of bone (limited use); osteoporosis (postmenopausal — limited use due to cancer concerns)"),
            KeyValueRow(key: "Dose", value: "Acute hypercalcemia: 4-8 IU/kg IM/SC q12h; Paget: 50-100 IU SC/IM daily-q2 days; osteoporosis nasal: 200 IU intranasal daily alternating nostrils"),
            KeyValueRow(key: "Monitor", value: "Calcium response (acute hypercalcemia); BMD; bone pain (Paget)"),
            KeyValueRow(key: "Watch", value: "TACHYPHYLAXIS — efficacy diminishes after 24-48 hours (acute) or weeks-months (chronic); INCREASED CANCER RISK with intranasal use (FDA review); allergic reactions")
        ],
        indications: AttributedProse(
            "Acute hypercalcemia of malignancy (adjunct to bisphosphonates + fluids; rapid onset 4-6 hours but tachyphylaxis); Paget disease of bone (alternative to bisphosphonates); osteoporosis postmenopausal — limited use due to FDA cancer review per primary source.",
            citationIDs: ["specialty_round29", "openfda_round29"]
        ),
        mechanism: AttributedProse(
            "Salmon calcitonin (synthetic) — direct inhibition of osteoclast activity + induced apoptosis → reduced bone resorption + reduced calcium release. Renal — increases calcium + phosphate + sodium + chloride excretion. Rapid effect (hours) for acute hypercalcemia but tachyphylaxis within 24-48 hours.",
            citationIDs: ["openfda_round29"]
        ),
        dosing: [
            DosingBlock(label: "Acute hypercalcemia of malignancy", body: "4-8 IU/kg IM or SC q12 hours; combine with IV fluids + bisphosphonate (zoledronate); calcitonin rapid onset bridges until bisphosphonate effective (24-48 hours).", citationIDs: ["specialty_round29"]),
            DosingBlock(label: "Paget disease", body: "100 IU SC or IM daily initially; may reduce to 50 IU q2 days or 100 IU 3× weekly per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Osteoporosis (nasal)", body: "200 IU intranasal daily — alternating nostrils per primary source.", citationIDs: ["openfda_round29"]),
            DosingBlock(label: "Renal", body: "No specific adjustment.", citationIDs: ["openfda_round29"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to salmon calcitonin or any component.",
            citationIDs: ["openfda_round29"]
        ),
        warnings: [
            AttributedBullet("TACHYPHYLAXIS — efficacy diminishes after 24-48 hours (acute hypercalcemia) or weeks-months (chronic); not for chronic management of hypercalcemia.", citationIDs: ["openfda_round29"]),
            AttributedBullet("ALLERGIC REACTIONS — salmon protein hypersensitivity; rare anaphylaxis; consider skin test before initial dose for risk patients.", citationIDs: ["openfda_round29"]),
            AttributedBullet("INCREASED CANCER RISK — meta-analyses suggested increased prostate, liver, breast cancer with intranasal long-term use; FDA review limited osteoporosis indication.", citationIDs: ["openfda_round29"]),
            AttributedBullet("HYPOCALCEMIA — rare; particularly with vitamin D deficiency.", citationIDs: ["openfda_round29"]),
            AttributedBullet("INJECTION SITE reactions — common.", citationIDs: ["openfda_round29"]),
            AttributedBullet("FACE FLUSHING + nausea — common with parenteral.", citationIDs: ["openfda_round29"]),
            AttributedBullet("PREGNANCY — Category C; limited data.", citationIDs: ["openfda_round29"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, flushing, injection site reactions, nasal irritation (intranasal), epistaxis (intranasal), rhinitis, allergic reactions, anaphylaxis (rare).",
            citationIDs: ["openfda_round29"]
        ),
        drugInteractions: [
            AttributedBullet("LITHIUM — calcitonin may decrease lithium levels; monitor.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Other osteoporosis meds — usually not concurrent.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Bisphosphonates — synergistic in hypercalcemia; calcitonin bridges until bisphosphonate effective.", citationIDs: ["specialty_round29"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — calcium + phosphate + albumin + LFTs (Paget) + 25-OH vitamin D; skin test for salmon allergy (1 IU intradermal) if at risk.", citationIDs: ["specialty_round29"]),
            AttributedBullet("ACUTE HYPERCALCEMIA OF MALIGNANCY — combine with IV fluids 2-4 L/day + IV bisphosphonate (zoledronate 4 mg) + calcitonin q12h × 24-48h; calcitonin onset hours; bisphosphonate onset 24-48 hours.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Counsel — flushing + nausea common; usually transient; report rash, dyspnea, severe weakness (allergic reaction).", citationIDs: ["openrn_pharm_round29"]),
            AttributedBullet("Intranasal — alternating nostrils; clean nasal passages; possible epistaxis; FDA cancer concern limits chronic use.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Tachyphylaxis — efficacy wanes; not for chronic management of hypercalcemia.", citationIDs: ["openfda_round29"]),
            AttributedBullet("LARGELY REPLACED — bisphosphonates + denosumab for osteoporosis + hypercalcemia; calcitonin limited to bridge / acute / Paget.", citationIDs: ["specialty_round29"]),
            AttributedBullet("Storage — refrigerate; intranasal 35-day stability after first use.", citationIDs: ["openfda_round29"]),
            AttributedBullet("Patient education — self-administration SC + intranasal technique; rotation.", citationIDs: ["openrn_pharm_round29"])
        ],
        patientTeaching: AttributedProse(
            "This medicine reduces calcium + treats Paget disease. Can be a shot or nasal spray. Side effects — flushing, nausea, nose irritation. Tell us about rashes, severe weakness, breathing trouble. We typically use this for short periods — other medicines (bisphosphonates) work longer. Refrigerate.",
            citationIDs: ["openrn_pharm_round29"]
        ),
        citations: [openfdaR29, openrnPharmR29, specialtyR29, ismpR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}
