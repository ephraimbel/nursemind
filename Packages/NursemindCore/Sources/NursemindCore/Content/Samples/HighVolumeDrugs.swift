import Foundation

// Curator-model high-volume drug entries (v1.5 expansion).
// Sources: openFDA SPL (CC0), Open RN Nursing Pharmacology (CC BY 4.0), ADA / AHA
// concept citations. Drugs selected for high prevalence in current outpatient and
// inpatient practice that were missing from the prior catalog.

private let openfda = CitationSource(
    id: "openfda_hv",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_pharm_hv",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=cardiovascular+respiratory+endocrine",
    lastRetrieved: "2026-05-04"
)
private let adaHV = CitationSource(
    id: "ada_hv",
    shortName: "ADA Standards of Care (concept citation)",
    publisher: "American Diabetes Association",
    license: .factCitationOnly,
    url: "https://diabetesjournals.org/care",
    lastRetrieved: "2026-05-04"
)
private let ahaHV = CitationSource(
    id: "aha_hv",
    shortName: "AHA/ACC HF and CV guidelines (concept citation)",
    publisher: "American Heart Association · American College of Cardiology",
    license: .factCitationOnly,
    url: "https://www.acc.org/guidelines",
    lastRetrieved: "2026-05-04"
)

// MARK: - Semaglutide

public enum SemaglutideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "semaglutide",
        title: "Semaglutide",
        subtitle: "Ozempic · Wegovy · Rybelsus · GLP-1 receptor agonist",
        category: "GLP-1 Receptor Agonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Glucagon-like peptide-1 (GLP-1) receptor agonist"),
            KeyValueRow(key: "Onset", value: "Hours; clinical effect over weeks"),
            KeyValueRow(key: "Half-life", value: "~1 week (once-weekly dosing)"),
            KeyValueRow(key: "Routes", value: "SC weekly (Ozempic, Wegovy); PO daily (Rybelsus)"),
            KeyValueRow(key: "Indications", value: "T2DM (Ozempic, Rybelsus); chronic weight management (Wegovy); CV risk reduction in T2DM with CVD")
        ],
        indications: AttributedProse(
            "Type 2 diabetes mellitus (improves glycemia, reduces major adverse cardiovascular events in patients with established CVD). Chronic weight management in adults with obesity (BMI ≥30) or overweight (BMI ≥27) with weight-related comorbidity.",
            citationIDs: ["openfda_hv"]
        ),
        mechanism: AttributedProse(
            "GLP-1 receptor agonist — stimulates glucose-dependent insulin release, suppresses glucagon, slows gastric emptying, increases satiety. Glucose-dependent action means low risk of hypoglycemia when used alone (vs sulfonylureas, insulin).",
            citationIDs: ["openfda_hv", "openrn_pharm_hv"]
        ),
        dosing: [
            DosingBlock(label: "Ozempic (T2DM, SC weekly)", body: "Start 0.25 mg weekly × 4 weeks (initial dose for tolerability, not therapeutic), then 0.5 mg weekly × 4 weeks; titrate to 1 mg or 2 mg weekly per response.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Wegovy (chronic weight management, SC weekly)", body: "Start 0.25 mg weekly; titrate every 4 weeks to maintenance 2.4 mg weekly.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Rybelsus (T2DM, PO daily)", body: "Start 3 mg daily × 30 days, then 7 mg daily; may increase to 14 mg daily. Take on EMPTY STOMACH with ≤4 oz water; wait ≥30 min before food/other meds.", citationIDs: ["openfda_hv"])
        ],
        contraindications: AttributedProse(
            "Personal or family history of medullary thyroid carcinoma (MTC). Multiple endocrine neoplasia type 2 (MEN 2). Hypersensitivity to semaglutide.",
            citationIDs: ["openfda_hv"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: thyroid C-cell tumors observed in rodents — relevance to humans uncertain; avoid in personal/family history of MTC or MEN 2.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Pancreatitis — discontinue if persistent severe abdominal pain with elevated lipase.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Diabetic retinopathy complications — rapid glucose improvement can transiently worsen retinopathy; monitor ophthalmologically in known retinopathy.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Acute kidney injury — typically from severe dehydration from GI side effects; ensure hydration.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Gallbladder disease, cholelithiasis — increased risk.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hypoglycemia when combined with sulfonylurea or insulin — reduce those doses.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hold prior to surgery / procedures requiring sedation due to gastric retention/aspiration risk (anesthesia society guidance — typically hold weekly dose 1 week prior).", citationIDs: ["openrn_pharm_hv"])
        ],
        adverseReactions: AttributedProse(
            "Most common: nausea (very common, often dose-limiting), vomiting, diarrhea, constipation, abdominal pain, decreased appetite, fatigue, headache. Less common: pancreatitis, gallbladder disease, AKI from dehydration, retinopathy progression, injection-site reactions.",
            citationIDs: ["openfda_hv"]
        ),
        drugInteractions: [
            AttributedBullet("Insulin and sulfonylureas — additive hypoglycemia; reduce doses.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Slowed gastric emptying — affects absorption of oral medications (especially time-sensitive ones).", citationIDs: ["openfda_hv"]),
            AttributedBullet("Levothyroxine — separate timing from Rybelsus.", citationIDs: ["openfda_hv"])
        ],
        nursingImplications: [
            AttributedBullet("Inject SC weekly at any time of day, with or without food; rotate sites (abdomen, thigh, upper arm).", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Inject same day each week (within 5 days late = take ASAP, then resume weekly schedule).", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Counsel on dose titration to manage GI side effects — most resolve with continued use.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Hydration — increased dehydration risk from N/V/diarrhea.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Surgery / sedation: hold per anesthesia protocol due to gastric retention.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Reinforce: not a substitute for diet/exercise/insulin in T1DM; not for ketoacidosis treatment.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Eating disorder screening — semaglutide is sometimes misused in patients with disordered eating; assess.", citationIDs: ["openrn_pharm_hv"])
        ],
        patientTeaching: AttributedProse(
            "Inject under the skin once a week, same day each week. Eat smaller meals to reduce nausea. Drink plenty of water. Tell every healthcare provider you take this — especially before any procedure with sedation. Do not share pens. Report severe abdominal pain (could be pancreatitis or gallbladder).",
            citationIDs: ["openrn_pharm_hv"]
        ),
        citations: [openfda, openrn, adaHV],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Empagliflozin

public enum EmpagliflozinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "empagliflozin",
        title: "Empagliflozin",
        subtitle: "Jardiance · SGLT2 inhibitor — DM2, HF, CKD",
        category: "SGLT2 Inhibitor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Sodium-glucose cotransporter-2 (SGLT2) inhibitor"),
            KeyValueRow(key: "Onset", value: "Hours; clinical benefit over weeks"),
            KeyValueRow(key: "Half-life", value: "~13 hours (once-daily dosing)"),
            KeyValueRow(key: "Indications", value: "T2DM, HFrEF AND HFpEF (regardless of diabetes), CKD, CV mortality reduction"),
            KeyValueRow(key: "Pillar of HF therapy", value: "One of the four GDMT pillars for HFrEF")
        ],
        indications: AttributedProse(
            "Type 2 diabetes mellitus. Heart failure with reduced or preserved ejection fraction (regardless of diabetes status — significantly reduces hospitalizations and CV death). Chronic kidney disease (slows progression). Reduces CV mortality in T2DM with established CVD.",
            citationIDs: ["openfda_hv", "aha_hv"]
        ),
        mechanism: AttributedProse(
            "Inhibits SGLT2 in proximal renal tubule → reduced glucose and sodium reabsorption → glucosuria and natriuresis → modest BP and weight reduction, glycemic improvement, hemodynamic benefits in HF, and renal protection (multifactorial).",
            citationIDs: ["openfda_hv", "openrn_pharm_hv"]
        ),
        dosing: [
            DosingBlock(label: "T2DM / HF / CKD", body: "10 mg PO daily; may increase to 25 mg daily for additional glycemic effect.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Renal dosing", body: "Per FDA labeling — initiation typically allowed down to eGFR 20–25; do not initiate at very low eGFR; discontinue if dialysis.", citationIDs: ["openfda_hv"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Severe renal impairment / dialysis (per current labeling). Type 1 diabetes (off-label use with caution due to euglycemic DKA risk).",
            citationIDs: ["openfda_hv"]
        ),
        warnings: [
            AttributedBullet("EUGLYCEMIC DKA — can occur with relatively normal glucose; high suspicion if patient on SGLT2 has nausea, vomiting, malaise, abdominal pain, dyspnea — check ABG and ketones.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Genitourinary infections — UTI, candida vulvovaginitis/balanitis (glucose in urine); rare Fournier gangrene (perineal necrotizing fasciitis — surgical emergency).", citationIDs: ["openfda_hv"]),
            AttributedBullet("Volume depletion / hypotension, especially in elderly, low SBP, on diuretics — adjust diuretic.", citationIDs: ["openfda_hv"]),
            AttributedBullet("AKI in volume-depleted; ensure hydration.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hypoglycemia when combined with insulin / sulfonylurea — reduce those doses.", citationIDs: ["openfda_hv"]),
            AttributedBullet("HOLD around surgery (3–4 days before per ADA / surgical society guidance) due to euglycemic DKA risk.", citationIDs: ["ada_hv"])
        ],
        adverseReactions: AttributedProse(
            "Genital mycotic infections, UTIs, polyuria, volume depletion symptoms, dyslipidemia (LDL increase), euglycemic DKA (rare but serious), Fournier gangrene (rare), AKI.",
            citationIDs: ["openfda_hv"]
        ),
        drugInteractions: [
            AttributedBullet("Insulin and sulfonylureas — increased hypoglycemia.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Diuretics — additive volume depletion / hypotension.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Lithium — SGLT2 inhibitors can lower lithium levels.", citationIDs: ["openfda_hv"])
        ],
        nursingImplications: [
            AttributedBullet("Take in the morning, with or without food.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Counsel on perineal hygiene and recognition of UTI / yeast infection symptoms.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Hydration education; recognize dehydration symptoms.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Hold for 3–4 days before surgery (consult anesthesia / surgical team protocol).", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Recognize euglycemic DKA — N/V, malaise, abdominal pain, dyspnea even with normal glucose; check ketones, ABG.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Sick-day rule: hold SGLT2 inhibitor during acute illness with poor PO intake until recovered.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Counsel that SGLT2 benefit in HF is independent of glucose-lowering effect.", citationIDs: ["openrn_pharm_hv"])
        ],
        patientTeaching: AttributedProse(
            "Take once a day in the morning. Drink plenty of water. Tell every provider before any surgery. Stop taking and call your provider if you have severe nausea, vomiting, abdominal pain, or trouble breathing — even if your blood sugar is normal. Practice good perineal hygiene; report any genital itching or burning.",
            citationIDs: ["openrn_pharm_hv"]
        ),
        citations: [openfda, openrn, adaHV, ahaHV],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sacubitril-Valsartan

public enum SacubitrilValsartanSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sacubitril-valsartan",
        title: "Sacubitril / Valsartan",
        subtitle: "Entresto · ARNI — first-line for HFrEF",
        category: "ARNI (Angiotensin Receptor / Neprilysin Inhibitor)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "ARNI — neprilysin inhibitor + ARB"),
            KeyValueRow(key: "Onset", value: "Hours; clinical effect over weeks"),
            KeyValueRow(key: "Half-life", value: "Sacubitril active metabolite ~11 hr, valsartan ~10 hr"),
            KeyValueRow(key: "Note", value: "Replaces ACEi/ARB; do NOT combine with ACEi (angioedema risk)")
        ],
        indications: AttributedProse(
            "Heart failure with reduced ejection fraction (HFrEF) — superior to enalapril for mortality and HF hospitalization (PARADIGM-HF). One of the four GDMT pillars. Indicated also in HFpEF with potential benefit in lower EF range.",
            citationIDs: ["openfda_hv", "aha_hv"]
        ),
        mechanism: AttributedProse(
            "Sacubitril (prodrug → active LBQ657) inhibits NEPRILYSIN, an enzyme that degrades natriuretic peptides (BNP, ANP, CNP) and other vasoactive substances → increased natriuretic peptide effect (vasodilation, natriuresis, diuresis, reduced sympathetic activity). Valsartan blocks AT₁ receptor, antagonizing renin-angiotensin-aldosterone system.",
            citationIDs: ["openfda_hv", "openrn_pharm_hv"]
        ),
        dosing: [
            DosingBlock(label: "Initiation", body: "Start 24/26 mg or 49/51 mg PO BID (lower if previously on low-dose ACEi/ARB or ACE-naive); titrate every 2–4 weeks toward target.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Target maintenance", body: "97/103 mg PO BID.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Switching from ACEi", body: "WAIT ≥36 HOURS after last ACE inhibitor dose before starting Entresto (angioedema risk).", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Renal / hepatic adjustment", body: "Reduce starting dose in eGFR <30, moderate hepatic impairment.", citationIDs: ["openfda_hv"])
        ],
        contraindications: AttributedProse(
            "History of angioedema (especially ACEi-related). Concurrent ACE inhibitor (must wait 36 hours after stopping). Concurrent aliskiren in patients with diabetes. Severe hepatic impairment. Pregnancy (boxed warning — fetal toxicity).",
            citationIDs: ["openfda_hv"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: pregnancy — discontinue immediately if pregnancy detected; fetal harm.", citationIDs: ["openfda_hv"]),
            AttributedBullet("ANGIOEDEMA — higher risk in patients with prior ACEi-angioedema; Black patients have higher background risk.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hypotension — especially with concurrent diuretic or volume depletion; titrate cautiously.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hyperkalemia — additive with K-sparing diuretics, K supplements, NSAIDs.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Renal impairment — monitor creatinine; reduce dose if rises significantly.", citationIDs: ["openfda_hv"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension, hyperkalemia, cough (less than ACEi), dizziness, renal impairment, angioedema (rare but serious).",
            citationIDs: ["openfda_hv"]
        ),
        drugInteractions: [
            AttributedBullet("ACE inhibitors — DO NOT COMBINE; 36-hour washout required.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Aliskiren in diabetic patients — contraindicated.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Lithium — Entresto can raise lithium levels.", citationIDs: ["openfda_hv"]),
            AttributedBullet("NSAIDs — reduced antihypertensive effect, worsened renal function.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Other antihypertensives, K-sparing agents — additive effects.", citationIDs: ["openfda_hv"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm 36-hour gap from last ACE inhibitor dose before initiating.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Take with or without food, BID.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Baseline and follow-up BMP — K, creatinine within 1–2 weeks of initiation/dose change; then per stability.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Counsel on angioedema — face/lip/tongue swelling, especially during sleep; STOP and call 911.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Confirm not pregnant in patients of childbearing potential.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("BNP is no longer useful for monitoring on Entresto (sacubitril increases BNP via neprilysin inhibition); use NT-proBNP instead.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Educate that this replaces ACEi/ARB; do not take concurrently.", citationIDs: ["openrn_pharm_hv"])
        ],
        patientTeaching: AttributedProse(
            "Take twice a day with or without food. Do NOT take alongside an ACE inhibitor (lisinopril, enalapril) — your team will time the switch. Stop and call 911 if your face, lips, or tongue swell. Notify provider if pregnant. Get your blood work done as scheduled.",
            citationIDs: ["openrn_pharm_hv"]
        ),
        citations: [openfda, openrn, ahaHV],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Escitalopram

public enum EscitalopramSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "escitalopram",
        title: "Escitalopram",
        subtitle: "Lexapro · selective serotonin reuptake inhibitor (SSRI)",
        category: "SSRI",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "SSRI"),
            KeyValueRow(key: "Onset", value: "1–2 weeks initial; 4–6 weeks full effect"),
            KeyValueRow(key: "Half-life", value: "~27–32 hr"),
            KeyValueRow(key: "Note", value: "S-enantiomer of citalopram; lower QT risk than citalopram")
        ],
        indications: AttributedProse(
            "Major depressive disorder, generalized anxiety disorder. Off-label: panic, OCD, PTSD, social anxiety, premenstrual dysphoric disorder.",
            citationIDs: ["openfda_hv"]
        ),
        mechanism: AttributedProse(
            "Selectively inhibits serotonin reuptake at presynaptic neuron, increasing synaptic serotonin. Among the most selective SSRIs.",
            citationIDs: ["openfda_hv", "openrn_pharm_hv"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "Initial 10 mg PO daily; may increase to 20 mg daily after 1+ weeks.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Elderly / hepatic impairment", body: "10 mg PO daily (usual maximum).", citationIDs: ["openfda_hv"])
        ],
        contraindications: AttributedProse(
            "Concurrent MAOI (or within 14 days). Concurrent pimozide. Hypersensitivity.",
            citationIDs: ["openfda_hv"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: increased suicidality in children, adolescents, young adults <25; monitor closely especially first weeks and at dose changes.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Serotonin syndrome — risk with MAOIs, triptans, tramadol, linezolid, methylene blue, other serotonergic agents.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hyponatremia (SIADH), especially in elderly.", citationIDs: ["openfda_hv"]),
            AttributedBullet("QT prolongation at doses >20 mg (less than citalopram).", citationIDs: ["openfda_hv"]),
            AttributedBullet("Discontinuation syndrome — taper rather than abrupt stop.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Bleeding risk especially with NSAIDs, anticoagulants.", citationIDs: ["openfda_hv"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, insomnia or somnolence, fatigue, dizziness, sexual dysfunction (very common, often persistent), hyponatremia, weight changes, sweating, bleeding risk.",
            citationIDs: ["openfda_hv"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — serotonin syndrome; 14-day washout.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Tramadol, fentanyl, triptans, ondansetron, linezolid, methylene blue — serotonin syndrome risk.", citationIDs: ["openfda_hv"]),
            AttributedBullet("NSAIDs, anticoagulants — increased bleeding.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Pimozide — contraindicated; QT additive.", citationIDs: ["openfda_hv"])
        ],
        nursingImplications: [
            AttributedBullet("Suicide assessment baseline and ongoing; energy may return before mood (transient increased risk).", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Counsel that effect is delayed — encourage adherence even when no improvement felt initially.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Take in the morning if causes insomnia, evening if causes drowsiness.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Sodium monitoring in elderly.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Taper rather than abrupt stop.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Address sexual dysfunction — common reason for discontinuation; bupropion augmentation, switch agent, dose timing.", citationIDs: ["openrn_pharm_hv"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same time each day. It takes 4–6 weeks for full effect — don't stop early. Report any worsening mood or thoughts of self-harm immediately. Tell your provider about all medications, especially pain meds, migraine meds, antibiotics. Avoid St. John's wort. Don't stop suddenly.",
            citationIDs: ["openrn_pharm_hv"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Venlafaxine

public enum VenlafaxineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "venlafaxine",
        title: "Venlafaxine",
        subtitle: "Effexor · SNRI — depression, anxiety, panic",
        category: "SNRI",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Serotonin-norepinephrine reuptake inhibitor (SNRI)"),
            KeyValueRow(key: "Onset", value: "1–2 weeks initial; 4–6 weeks full effect"),
            KeyValueRow(key: "Half-life", value: "5–11 hr (parent) — short; XR formulation preferred"),
            KeyValueRow(key: "Discontinuation", value: "Pronounced discontinuation syndrome; taper carefully")
        ],
        indications: AttributedProse(
            "Major depressive disorder, generalized anxiety disorder, panic disorder, social anxiety disorder. Off-label: vasomotor symptoms (hot flashes), neuropathic pain, fibromyalgia.",
            citationIDs: ["openfda_hv"]
        ),
        mechanism: AttributedProse(
            "Inhibits serotonin AND norepinephrine reuptake (dose-dependent — primarily serotonin at lower doses, NE added at higher doses). Weak dopamine reuptake inhibition at very high doses.",
            citationIDs: ["openfda_hv", "openrn_pharm_hv"]
        ),
        dosing: [
            DosingBlock(label: "Depression / GAD (XR)", body: "Initial 37.5–75 mg PO daily; titrate to 75–225 mg daily.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Panic disorder (XR)", body: "Initial 37.5 mg daily × 7 days, then 75 mg daily; titrate to max 225 mg.", citationIDs: ["openfda_hv"])
        ],
        contraindications: AttributedProse(
            "Concurrent MAOI (or within 14 days; allow 7 days after venlafaxine before starting MAOI). Hypersensitivity.",
            citationIDs: ["openfda_hv"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: increased suicidality in patients <25.", citationIDs: ["openfda_hv"]),
            AttributedBullet("DOSE-DEPENDENT BP ELEVATION — monitor BP, especially at higher doses.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Pronounced DISCONTINUATION SYNDROME (flu-like, dizziness, paresthesias, electric-shock sensations) due to short half-life — taper slowly over weeks.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Serotonin syndrome.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hyponatremia (SIADH).", citationIDs: ["openfda_hv"]),
            AttributedBullet("Bleeding risk.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Mydriasis — caution in narrow-angle glaucoma.", citationIDs: ["openfda_hv"])
        ],
        adverseReactions: AttributedProse(
            "Nausea (very common), headache, somnolence, dizziness, dry mouth, sweating, sexual dysfunction, insomnia, anxiety, hypertension (dose-dependent), constipation.",
            citationIDs: ["openfda_hv"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — contraindicated; serotonin syndrome.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Other serotonergic agents — serotonin syndrome.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Anticoagulants, NSAIDs — bleeding risk.", citationIDs: ["openfda_hv"])
        ],
        nursingImplications: [
            AttributedBullet("Take in the morning with food (XR).", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Monitor BP at baseline and follow-up; manage HTN if it develops.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Suicide assessment.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Counsel on the importance of NOT missing doses (discontinuation syndrome with even one missed dose) and on slow taper if discontinuation needed.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Effect onset 4–6 weeks for full benefit.", citationIDs: ["openrn_pharm_hv"])
        ],
        patientTeaching: AttributedProse(
            "Take in the morning with food. Take EVERY day at the same time — missed doses can cause flu-like symptoms. Don't stop suddenly; your provider will help you taper. Get your blood pressure checked. Report worsening mood, agitation, or thoughts of self-harm immediately.",
            citationIDs: ["openrn_pharm_hv"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Mirtazapine

public enum MirtazapineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "mirtazapine",
        title: "Mirtazapine",
        subtitle: "Remeron · atypical antidepressant — sedation, appetite stimulation",
        category: "Atypical Antidepressant (NaSSA)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Noradrenergic and specific serotonergic antidepressant (NaSSA)"),
            KeyValueRow(key: "Onset", value: "1–2 weeks initial; 4–6 weeks full effect"),
            KeyValueRow(key: "Half-life", value: "~20–40 hr"),
            KeyValueRow(key: "Common roles", value: "Depression with insomnia or weight loss; appetite stimulant in elderly")
        ],
        indications: AttributedProse(
            "Major depressive disorder. Off-label: insomnia (low-dose), appetite stimulation in cachexia, anxiety, PTSD adjunct.",
            citationIDs: ["openfda_hv"]
        ),
        mechanism: AttributedProse(
            "Antagonist at central α2-adrenergic autoreceptors → increased noradrenergic and serotonergic neurotransmission. Strong H1 antihistamine (sedation, weight gain), 5-HT2 and 5-HT3 antagonism (less sexual dysfunction, less GI upset, antiemetic).",
            citationIDs: ["openfda_hv", "openrn_pharm_hv"]
        ),
        dosing: [
            DosingBlock(label: "Depression", body: "Initial 15 mg PO at bedtime; titrate every 1–2 weeks to 30–45 mg at bedtime.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Sedation paradox", body: "Lower doses (15 mg) more sedating; higher doses (30–45 mg) less sedating because noradrenergic effects increase.", citationIDs: ["openrn_pharm_hv"])
        ],
        contraindications: AttributedProse(
            "Concurrent MAOI (or within 14 days). Hypersensitivity.",
            citationIDs: ["openfda_hv"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: increased suicidality in patients <25.", citationIDs: ["openfda_hv"]),
            AttributedBullet("AGRANULOCYTOSIS / neutropenia (rare) — discontinue and check CBC if febrile illness with sore throat or signs of infection.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Sedation, weight gain, increased appetite.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Serotonin syndrome with serotonergic agents.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hyponatremia.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Discontinuation syndrome.", citationIDs: ["openfda_hv"])
        ],
        adverseReactions: AttributedProse(
            "Sedation (very common), weight gain, increased appetite, dry mouth, constipation, dizziness, less sexual dysfunction than SSRIs, less GI upset; rare agranulocytosis.",
            citationIDs: ["openfda_hv"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — contraindicated; serotonin syndrome.", citationIDs: ["openfda_hv"]),
            AttributedBullet("CNS depressants (alcohol, opioids, benzodiazepines) — additive sedation.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Serotonergic agents — serotonin syndrome (less risk than SSRIs but possible).", citationIDs: ["openfda_hv"])
        ],
        nursingImplications: [
            AttributedBullet("Give at BEDTIME — leverages sedation for sleep.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Useful in patients with depression + insomnia + weight loss / poor appetite (e.g., elderly, cachexia, hospice).", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Monitor weight; counsel on diet/activity to mitigate gain.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Check CBC if signs of infection (rare agranulocytosis).", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Caution combining with other CNS depressants (especially in elderly).", citationIDs: ["openrn_pharm_hv"])
        ],
        patientTeaching: AttributedProse(
            "Take at bedtime — it will make you sleepy. Expect increased appetite and possible weight gain. Avoid alcohol. Tell your provider about any fever or sore throat. Don't stop suddenly.",
            citationIDs: ["openrn_pharm_hv"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hydroxychloroquine

public enum HydroxychloroquineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "hydroxychloroquine",
        title: "Hydroxychloroquine",
        subtitle: "Plaquenil · DMARD — RA, lupus, malaria · retinal toxicity monitoring",
        category: "Antimalarial / DMARD",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "4-aminoquinoline; immunomodulator / antimalarial"),
            KeyValueRow(key: "Onset (autoimmune)", value: "Weeks to months for full effect"),
            KeyValueRow(key: "Half-life", value: "~40 days (very long)"),
            KeyValueRow(key: "Toxicity monitoring", value: "Annual ophthalmology — retinal toxicity (irreversible)")
        ],
        indications: AttributedProse(
            "Rheumatoid arthritis, systemic lupus erythematosus (SLE), malaria prophylaxis and treatment. Off-label: discoid lupus, Sjögren syndrome.",
            citationIDs: ["openfda_hv"]
        ),
        mechanism: AttributedProse(
            "Multifactorial — increases endolysosomal pH, interferes with antigen processing, modulates cytokines, inhibits TLR signaling. Antimalarial mechanism via heme polymerization inhibition.",
            citationIDs: ["openfda_hv"]
        ),
        dosing: [
            DosingBlock(label: "RA / SLE", body: "200–400 mg PO daily (often divided BID); maintenance dose should not exceed 5 mg/kg actual body weight per day to minimize retinal toxicity.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Malaria prophylaxis", body: "400 mg PO weekly starting 2 weeks before travel, during, and 4 weeks after.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Malaria treatment (uncomplicated)", body: "Per CDC/WHO regimen.", citationIDs: ["openfda_hv"])
        ],
        contraindications: AttributedProse(
            "Pre-existing maculopathy or retinal disease. Hypersensitivity to 4-aminoquinolines.",
            citationIDs: ["openfda_hv"]
        ),
        warnings: [
            AttributedBullet("RETINAL TOXICITY — irreversible bull's-eye maculopathy, especially with cumulative dose and >5 years use; baseline and annual ophthalmologic exam (visual fields, OCT).", citationIDs: ["openfda_hv"]),
            AttributedBullet("Cardiomyopathy and conduction abnormalities (rare, with prolonged use).", citationIDs: ["openfda_hv"]),
            AttributedBullet("QT prolongation — caution with other QT-prolonging drugs.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hemolysis in G6PD deficiency.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hypoglycemia.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Skeletal muscle weakness (rare myopathy).", citationIDs: ["openfda_hv"])
        ],
        adverseReactions: AttributedProse(
            "GI upset, nausea, headache, skin pigmentation, photosensitivity, retinal toxicity (irreversible), QT prolongation, rare cardiomyopathy, rare hemolysis in G6PD deficiency.",
            citationIDs: ["openfda_hv"]
        ),
        drugInteractions: [
            AttributedBullet("Other QT-prolonging drugs (azithromycin, fluoroquinolones, antipsychotics) — additive QT effect.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Digoxin — hydroxychloroquine raises levels.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Insulin and antidiabetics — hypoglycemia.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Cyclosporine — raises levels.", citationIDs: ["openfda_hv"])
        ],
        nursingImplications: [
            AttributedBullet("Take with food or milk to reduce GI side effects.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Reinforce ANNUAL OPHTHALMOLOGY follow-up — retinal toxicity is preventable with monitoring.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Counsel on photoprotection (sunscreen, hats).", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Long onset — set expectations for autoimmune indications (months).", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Report visual changes IMMEDIATELY (blurred vision, blind spots, color vision changes).", citationIDs: ["openrn_pharm_hv"])
        ],
        patientTeaching: AttributedProse(
            "Take with food. Get an eye exam every year — this medication can damage your retina before you notice symptoms. Use sunscreen and wear a hat. Report any vision changes right away. It can take months to feel better for arthritis or lupus.",
            citationIDs: ["openrn_pharm_hv"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Methotrexate

public enum MethotrexateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "methotrexate",
        title: "Methotrexate",
        subtitle: "DMARD · oncologic · ectopic pregnancy · WEEKLY (not daily) for autoimmune",
        category: "Antimetabolite / DMARD",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Folate antagonist (dihydrofolate reductase inhibitor)"),
            KeyValueRow(key: "Onset (RA)", value: "3–6 weeks (full effect 12+ weeks)"),
            KeyValueRow(key: "Half-life", value: "3–10 hr (low-dose)"),
            KeyValueRow(key: "Critical dosing rule", value: "AUTOIMMUNE = WEEKLY (not daily) — daily dosing causes fatal toxicity"),
            KeyValueRow(key: "Antidote", value: "Leucovorin (folinic acid) for high-dose toxicity")
        ],
        indications: AttributedProse(
            "AUTOIMMUNE: rheumatoid arthritis, psoriasis, psoriatic arthritis, JIA, Crohn disease (off-label for many). ONCOLOGIC: leukemias, lymphomas, breast cancer, osteosarcoma, head and neck cancer, choriocarcinoma. OBSTETRIC: ectopic pregnancy.",
            citationIDs: ["openfda_hv"]
        ),
        mechanism: AttributedProse(
            "Inhibits dihydrofolate reductase → blocks folate-dependent thymidylate and purine synthesis → arrests DNA synthesis. At low doses (autoimmune), additional anti-inflammatory effects via adenosine release.",
            citationIDs: ["openfda_hv", "openrn_pharm_hv"]
        ),
        dosing: [
            DosingBlock(label: "RA / autoimmune (LOW-dose, WEEKLY)", body: "7.5–25 mg PO/SC ONCE WEEKLY. NEVER daily.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Folate supplementation", body: "Folic acid 1 mg PO daily (or leucovorin 5 mg weekly) reduces side effects without compromising efficacy.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Ectopic pregnancy", body: "50 mg/m² IM × 1 (single-dose protocol); follow serial hCG.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Oncologic", body: "Highly variable; may include high-dose IV with leucovorin rescue.", citationIDs: ["openfda_hv"])
        ],
        contraindications: AttributedProse(
            "Pregnancy (boxed warning — abortifacient and teratogen). Breastfeeding. Severe hepatic disease, alcohol use disorder. Severe renal impairment. Bone marrow failure. Active infection. Immunodeficiency. Hypersensitivity.",
            citationIDs: ["openfda_hv"]
        ),
        warnings: [
            AttributedBullet("BOXED WARNING: serious toxicity — bone marrow suppression, hepatotoxicity, pulmonary fibrosis, dermatologic reactions, GI ulceration, fetal death, malignancy (rare).", citationIDs: ["openfda_hv"]),
            AttributedBullet("DOSING ERRORS — daily dosing instead of weekly is FATAL; ISMP repeatedly highlights as preventable harm; verify weekly schedule with patient at every visit.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Pregnancy — teratogenic and abortifacient; effective contraception required (3 months after last dose for males, 1 ovulatory cycle for females; some sources longer).", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hepatotoxicity — monitor LFTs; avoid alcohol; cumulative dose risk.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Pulmonary toxicity (interstitial pneumonitis) — fever, cough, dyspnea; STOP and evaluate.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Mucositis, stomatitis, GI ulceration.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Renal impairment delays clearance — high-dose with poor renal function is dangerous.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Live vaccines contraindicated.", citationIDs: ["openfda_hv"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, fatigue, alopecia, mucositis, transaminitis, cytopenias, photosensitivity, mood changes, rare pulmonary fibrosis, rare hepatic fibrosis (cumulative dose), rare opportunistic infections.",
            citationIDs: ["openfda_hv"]
        ),
        drugInteractions: [
            AttributedBullet("NSAIDs and salicylates — reduce MTX clearance, increase toxicity (relevant especially with high-dose oncologic; less concerning with low-dose stable autoimmune).", citationIDs: ["openfda_hv"]),
            AttributedBullet("Trimethoprim-sulfamethoxazole — additive folate antagonism, marrow suppression; AVOID combination.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Probenecid — reduces clearance.", citationIDs: ["openfda_hv"]),
            AttributedBullet("PPIs — high-dose MTX clearance impaired.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Alcohol — additive hepatotoxicity.", citationIDs: ["openfda_hv"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("CONFIRM WEEKLY dosing schedule at every encounter — patient should know the day of the week and the dose. Counsel never to take daily.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Folic acid supplement reduces side effects — verify patient is taking.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Baseline and follow-up CBC, LFTs, creatinine; per provider monitoring schedule.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Effective contraception in patients of reproductive potential.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Avoid alcohol; counsel on photoprotection.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Live vaccines contraindicated; non-live (e.g., influenza inactivated) OK.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("MTX toxicity (overdose, daily error, severe mucositis): leucovorin (folinic acid) rescue, hydration, urine alkalinization.", citationIDs: ["openrn_pharm_hv"])
        ],
        patientTeaching: AttributedProse(
            "Take this medicine ONCE A WEEK — never daily. Pick a day and stick with it. Take folic acid as directed (usually daily, except the day of methotrexate per provider). Get blood work as scheduled. Avoid alcohol. Use birth control. Tell every provider about this medicine. Stop and call for fever, mouth sores, severe nausea, dark urine, yellowing of skin, or new shortness of breath/cough.",
            citationIDs: ["openrn_pharm_hv"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Prednisone

public enum PrednisoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "prednisone",
        title: "Prednisone",
        subtitle: "Oral systemic corticosteroid · DON'T STOP ABRUPTLY",
        category: "Glucocorticoid (Oral)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic glucocorticoid (intermediate-acting)"),
            KeyValueRow(key: "Onset", value: "Hours; therapeutic effect varies by indication"),
            KeyValueRow(key: "Half-life", value: "Plasma 2–4 hr; biological 12–36 hr"),
            KeyValueRow(key: "Equivalent doses", value: "5 mg prednisone ≈ 4 mg methylprednisolone ≈ 0.75 mg dexamethasone ≈ 20 mg hydrocortisone")
        ],
        indications: AttributedProse(
            "Wide-ranging anti-inflammatory and immunosuppressive use: asthma/COPD exacerbation, autoimmune disease (SLE, RA, IBD), allergic reactions, organ transplantation, hematologic malignancy, adrenal insufficiency (replacement), nephrotic syndrome, dermatologic conditions, ocular inflammation.",
            citationIDs: ["openfda_hv"]
        ),
        mechanism: AttributedProse(
            "Binds glucocorticoid receptor → suppresses inflammatory gene transcription, reduces cytokine production, stabilizes membranes, immunosuppression. Mineralocorticoid effects mild at low doses, more at higher doses.",
            citationIDs: ["openfda_hv", "openrn_pharm_hv"]
        ),
        dosing: [
            DosingBlock(label: "Asthma/COPD exacerbation", body: "40–60 mg PO daily × 5–7 days; usually no taper needed if course <14 days.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Acute polymyalgia rheumatica", body: "10–20 mg PO daily.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Giant cell arteritis", body: "40–60 mg PO daily; higher if vision involved.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Long-term courses", body: "TAPER over weeks-months when ≥3 weeks of treatment to allow adrenal recovery.", citationIDs: ["openfda_hv"])
        ],
        contraindications: AttributedProse(
            "Systemic fungal infections (untreated). Live vaccines (during high-dose immunosuppression). Hypersensitivity.",
            citationIDs: ["openfda_hv"]
        ),
        warnings: [
            AttributedBullet("HPA-axis SUPPRESSION with courses ≥3 weeks — DO NOT STOP ABRUPTLY; risk of adrenal crisis. Stress-dose during illness/surgery for chronic users.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hyperglycemia, new-onset diabetes — monitor especially in known DM.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Hypertension, fluid retention.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Osteoporosis with prolonged use — calcium, vitamin D, DEXA, bisphosphonate per duration/dose.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Increased infection risk — opportunistic infections at high cumulative doses; PJP prophylaxis if ≥20 mg daily for ≥4 weeks (variable per provider).", citationIDs: ["openfda_hv"]),
            AttributedBullet("Mood changes — euphoria, depression, mania, insomnia, psychosis at higher doses.", citationIDs: ["openfda_hv"]),
            AttributedBullet("GI ulceration — increased risk with NSAIDs; PPI in select.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Cataracts, glaucoma with prolonged use.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Avascular necrosis (especially femoral head) — rare but devastating.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Children — growth suppression with prolonged use.", citationIDs: ["openfda_hv"])
        ],
        adverseReactions: AttributedProse(
            "Insomnia, mood changes, increased appetite, weight gain, hyperglycemia, hypertension, fluid retention, osteopenia, skin thinning, easy bruising, acne, cushingoid features, infection susceptibility, GI ulcer (with NSAIDs), cataracts, AVN.",
            citationIDs: ["openfda_hv"]
        ),
        drugInteractions: [
            AttributedBullet("NSAIDs — increased GI ulcer risk.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Live vaccines — contraindicated during high-dose immunosuppression.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Diabetes meds — counter glucose lowering.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Anticoagulants — variable effect on INR.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Strong CYP3A4 inducers (phenytoin, rifampin) — reduce steroid effect.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Diuretics (loop, thiazide) — additive K loss.", citationIDs: ["openfda_hv"])
        ],
        nursingImplications: [
            AttributedBullet("Take in the morning to mimic diurnal cortisol pattern; with food to reduce GI upset.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Counsel against ABRUPT discontinuation if course >2–3 weeks.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Glucose monitoring in DM.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Bone health: calcium 1000–1200 mg/day, vitamin D 800–1000 IU/day; bisphosphonate per provider for prolonged use.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Monitor BP, weight, mood; counsel on infection precautions and prompt evaluation of fever.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Stress-dose during illness/surgery for patients on chronic therapy.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("MedicAlert ID for chronic users.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Tuberculosis screening before starting prolonged immunosuppression.", citationIDs: ["openrn_pharm_hv"])
        ],
        patientTeaching: AttributedProse(
            "Take in the morning with food. Don't stop suddenly if you've been taking it for more than 2 weeks — your provider will help you taper. Tell every provider you're on steroids. Watch your blood sugar if you have diabetes. Report fever, severe abdominal pain, vision changes, mood changes, or muscle weakness. Wear a medical ID for long-term use.",
            citationIDs: ["openrn_pharm_hv"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Oseltamivir

public enum OseltamivirSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "oseltamivir",
        title: "Oseltamivir",
        subtitle: "Tamiflu · neuraminidase inhibitor · influenza A and B · start within 48 hr",
        category: "Antiviral (Influenza)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Neuraminidase inhibitor"),
            KeyValueRow(key: "Spectrum", value: "Influenza A and B"),
            KeyValueRow(key: "Onset", value: "Begin within 48 hr of symptom onset for best benefit"),
            KeyValueRow(key: "Half-life", value: "1–3 hr (active metabolite 6–10 hr)"),
            KeyValueRow(key: "Routes", value: "PO capsule, oral suspension")
        ],
        indications: AttributedProse(
            "Treatment of acute uncomplicated influenza A and B in patients ≥2 weeks (started within 48 hours of symptom onset). Post-exposure prophylaxis ≥1 year. Treatment beyond 48 hours considered in hospitalized, severe, or high-risk patients.",
            citationIDs: ["openfda_hv"]
        ),
        mechanism: AttributedProse(
            "Inhibits viral neuraminidase enzyme → impairs release of progeny virus from infected cells → reduces viral replication and shedding.",
            citationIDs: ["openfda_hv"]
        ),
        dosing: [
            DosingBlock(label: "Adult treatment", body: "75 mg PO BID × 5 days.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Adult prophylaxis", body: "75 mg PO daily × at least 7 days post-exposure (longer in outbreak setting).", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Pediatric (≥2 weeks)", body: "Weight-based per package insert.", citationIDs: ["openfda_hv"]),
            DosingBlock(label: "Renal adjustment", body: "Dose reduction for CrCl <60.", citationIDs: ["openfda_hv"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity.",
            citationIDs: ["openfda_hv"]
        ),
        warnings: [
            AttributedBullet("Neuropsychiatric events — confusion, abnormal behavior, self-injury (especially in pediatric patients); monitor and counsel.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Skin reactions — rare SJS/TEN; discontinue and seek care for severe rash.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Bacterial superinfection — especially pneumonia; oseltamivir does NOT prevent bacterial complications.", citationIDs: ["openfda_hv"]),
            AttributedBullet("Inactivated influenza VACCINE preferred for prevention; oseltamivir prophylaxis is adjunct in select circumstances.", citationIDs: ["openfda_hv"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting (most common — take with food), headache, neuropsychiatric events (rare), rash (rare).",
            citationIDs: ["openfda_hv"]
        ),
        drugInteractions: [
            AttributedBullet("Live attenuated influenza vaccine — avoid concurrent (oseltamivir reduces vaccine efficacy).", citationIDs: ["openfda_hv"])
        ],
        nursingImplications: [
            AttributedBullet("START within 48 hours of symptom onset for best benefit; in hospitalized or severe disease, can give later.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Take with food to reduce nausea/vomiting.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("DROPLET PRECAUTIONS for hospitalized influenza; until 24 hours afebrile + improving + 7 days from symptom onset.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Counsel that influenza vaccination is the primary prevention; oseltamivir does not replace vaccination.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Monitor for bacterial superinfection — secondary pneumonia is the leading cause of influenza mortality.", citationIDs: ["openrn_pharm_hv"]),
            AttributedBullet("Monitor pediatric patients for behavioral changes.", citationIDs: ["openrn_pharm_hv"])
        ],
        patientTeaching: AttributedProse(
            "Start as soon as flu symptoms begin — within 48 hours works best. Take with food. Complete the full 5 days even if you feel better. Watch a child closely for confusion or unusual behavior. The flu vaccine is still the best prevention. Cover coughs; isolate from family; wash hands often.",
            citationIDs: ["openrn_pharm_hv"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}
