import Foundation

// Curator-model psych / cardiac / OB drug entries (round 3 expansion).
// Sources: openFDA SPL (CC0), Open RN Pharmacology + Maternal-Newborn (CC BY 4.0),
// ACOG / ADA / CMQCC concept citations.

private let openfda = CitationSource(
    id: "openfda_round3b",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_pharm_round3b",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=psychiatric+ob+pregnancy",
    lastRetrieved: "2026-05-04"
)
private let openrnMatPharm = CitationSource(
    id: "openrn_matpharm_round3b",
    shortName: "Open RN Maternal-Newborn Nursing — Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/maternal/?s=oxytocin+magnesium+labor",
    lastRetrieved: "2026-05-04"
)
private let acogConcept = CitationSource(
    id: "acog_round3b",
    shortName: "ACOG Practice Bulletins (concept citation)",
    publisher: "American College of Obstetricians and Gynecologists",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-05-04"
)
private let cmqccConcept = CitationSource(
    id: "cmqcc_round3b",
    shortName: "CMQCC OB Hemorrhage / Hypertension toolkits (concept)",
    publisher: "California Maternal Quality Care Collaborative",
    license: .factCitationOnly,
    url: "https://www.cmqcc.org/resources-toolkits",
    lastRetrieved: "2026-05-04"
)
private let ismp = CitationSource(
    id: "ismp_round3b",
    shortName: "ISMP List of High-Alert Medications, 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)

// MARK: - Trazodone

public enum TrazodoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "trazodone",
        title: "Trazodone",
        subtitle: "Desyrel · serotonin modulator · widely used for sleep (off-label)",
        category: "Atypical Antidepressant / Sleep Aid",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Serotonin antagonist and reuptake inhibitor (SARI)"),
            KeyValueRow(key: "Onset (sleep)", value: "30–60 minutes"),
            KeyValueRow(key: "Half-life", value: "~7 hr"),
            KeyValueRow(key: "Common dose for sleep", value: "25–100 mg PO at bedtime")
        ],
        indications: AttributedProse(
            "Major depressive disorder (FDA-approved). Off-label and very common: insomnia (low-dose, especially in elderly or in patients with depression/anxiety where benzodiazepines should be avoided).",
            citationIDs: ["openfda_round3b"]
        ),
        mechanism: AttributedProse(
            "Inhibits serotonin reuptake AND antagonizes 5-HT2A receptors; H1-antihistamine and α1-adrenergic blockade contribute to sedation and orthostasis. The strong sedation at low doses (25–50 mg) is why it's used as a sleep aid.",
            citationIDs: ["openfda_round3b", "openrn_pharm_round3b"]
        ),
        dosing: [
            DosingBlock(label: "Depression", body: "Initial 150 mg PO daily in divided doses; titrate to 300–400 mg/day. Limited use as monotherapy due to sedation.", citationIDs: ["openfda_round3b"]),
            DosingBlock(label: "Insomnia (off-label)", body: "25–100 mg PO at bedtime.", citationIDs: ["openfda_round3b"])
        ],
        contraindications: AttributedProse(
            "Concurrent or recent (14 days) MAOI. Recovery phase of MI. Hypersensitivity.",
            citationIDs: ["openfda_round3b"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: increased suicidality in patients <25, especially first weeks and at dose changes.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("PRIAPISM — uncommon but a true emergency; counsel male patients to seek immediate care for prolonged erection.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Orthostatic hypotension — counsel slow rise from sitting/lying; fall risk especially in elderly.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("QT prolongation at higher doses.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Serotonin syndrome — risk with MAOIs, SSRIs, SNRIs, triptans, tramadol.", citationIDs: ["openfda_round3b"])
        ],
        adverseReactions: AttributedProse(
            "Sedation, orthostatic hypotension, dizziness, dry mouth, blurred vision, headache, GI upset, rare priapism, rare QT prolongation.",
            citationIDs: ["openfda_round3b"]
        ),
        drugInteractions: [
            AttributedBullet("Other sedatives, alcohol, opioids, benzodiazepines — additive sedation/respiratory depression.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Other serotonergic drugs (SSRIs, SNRIs, MAOIs, triptans) — serotonin syndrome.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Antihypertensives — additive hypotension.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("CYP3A4 inhibitors (azoles, ritonavir, clarithromycin) — raise levels.", citationIDs: ["openfda_round3b"])
        ],
        nursingImplications: [
            AttributedBullet("Take WITH food (improves absorption, reduces dizziness).", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("FALL PRECAUTIONS — elderly especially; orthostasis common; bedside commode at night, slow position changes.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Counsel about priapism — males should seek emergency care for any erection lasting >2–4 hours.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Sleep dose (25–100 mg) much lower than depression dose (150–400 mg) — avoid confusion.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Discontinuation syndrome possible — taper rather than abrupt stop on chronic use.", citationIDs: ["openrn_pharm_round3b"])
        ],
        patientTeaching: AttributedProse(
            "Take at bedtime with food — it works fast for sleep. Rise slowly from bed; you may feel dizzy. Avoid alcohol. Men: if you have an erection lasting more than 2 hours, go to the ED — this is rare but a real emergency. Don't stop suddenly if you've been on it for weeks.",
            citationIDs: ["openrn_pharm_round3b"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bupropion

public enum BupropionSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "bupropion",
        title: "Bupropion",
        subtitle: "Wellbutrin · Zyban · NDRI · activating antidepressant",
        category: "NDRI Antidepressant",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Norepinephrine-dopamine reuptake inhibitor (NDRI)"),
            KeyValueRow(key: "Onset", value: "1–2 weeks initial; 4–6 weeks full"),
            KeyValueRow(key: "Half-life", value: "~21 hr (XL)"),
            KeyValueRow(key: "Niche", value: "No sexual dysfunction · weight-neutral · helps with smoking cessation · contraindicated in eating disorders / seizure history")
        ],
        indications: AttributedProse(
            "Major depressive disorder. Seasonal affective disorder (XL). Smoking cessation (Zyban brand). Off-label: SSRI-induced sexual dysfunction augmentation, ADHD adjunct.",
            citationIDs: ["openfda_round3b"]
        ),
        mechanism: AttributedProse(
            "Inhibits norepinephrine and dopamine reuptake (no significant serotonin effect). Likely mechanism of smoking-cessation efficacy via dopamine reward circuit modulation.",
            citationIDs: ["openfda_round3b"]
        ),
        dosing: [
            DosingBlock(label: "Depression (XL)", body: "Initial 150 mg PO daily × 4 days, then 300 mg daily; max 450 mg/day.", citationIDs: ["openfda_round3b"]),
            DosingBlock(label: "Depression (SR)", body: "Initial 150 mg PO daily × 4 days, then 150 mg BID; max 400 mg/day.", citationIDs: ["openfda_round3b"]),
            DosingBlock(label: "Smoking cessation", body: "150 mg PO daily × 3 days, then 150 mg BID × 7–12 weeks; start 1–2 weeks before target quit date.", citationIDs: ["openfda_round3b"])
        ],
        contraindications: AttributedProse(
            "Seizure disorder. Eating disorders (anorexia / bulimia — bupropion lowers seizure threshold and these patients are at higher baseline seizure risk). Abrupt discontinuation of alcohol or sedatives. Concurrent MAOI. Hypersensitivity.",
            citationIDs: ["openfda_round3b"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: increased suicidality in patients <25.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("DOSE-RELATED SEIZURE risk — avoid in seizure history, eating disorders, head injury, alcohol/benzo withdrawal; respect dose limits.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Activation — anxiety, agitation, insomnia; avoid late-evening dosing.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Hypertension — may exacerbate; monitor BP.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Weight loss / appetite suppression (some patients) — opposite of many other antidepressants.", citationIDs: ["openrn_pharm_round3b"])
        ],
        adverseReactions: AttributedProse(
            "Insomnia, dry mouth, headache, agitation, nausea, tremor, hypertension, decreased appetite, rare seizures.",
            citationIDs: ["openfda_round3b"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — contraindicated.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Drugs lowering seizure threshold (tramadol, theophylline, antipsychotics, alcohol withdrawal) — additive risk.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("CYP2D6 substrates (tamoxifen, codeine prodrug → morphine) — bupropion inhibits CYP2D6.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Linezolid, methylene blue — caution.", citationIDs: ["openfda_round3b"])
        ],
        nursingImplications: [
            AttributedBullet("ASK about eating disorder history and seizure history before starting — these are hard contraindications often missed.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Take in the morning to minimize insomnia.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Counsel that effect takes 4–6 weeks; sexual side effects are uncommon (a feature for many).", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Avoid alcohol — additive seizure and CNS effects.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Monitor BP at follow-up.", citationIDs: ["openrn_pharm_round3b"])
        ],
        patientTeaching: AttributedProse(
            "Take in the morning. It can take 4–6 weeks to feel better. Don't drink alcohol. Tell your provider about any history of seizures or eating disorders. Watch for any worsening mood or thoughts of self-harm and call right away.",
            citationIDs: ["openrn_pharm_round3b"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pregabalin

public enum PregabalinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "pregabalin",
        title: "Pregabalin",
        subtitle: "Lyrica · α2δ ligand · neuropathic pain · DEA Schedule V",
        category: "α2δ Calcium-Channel Modulator",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "α2δ subunit ligand of voltage-gated calcium channels"),
            KeyValueRow(key: "Onset", value: "1–2 hr; therapeutic effect over days–weeks"),
            KeyValueRow(key: "Half-life", value: "~6 hr"),
            KeyValueRow(key: "Schedule", value: "DEA Schedule V (potential for misuse)")
        ],
        indications: AttributedProse(
            "Neuropathic pain (diabetic peripheral neuropathy, post-herpetic neuralgia, spinal-cord-injury pain), partial-onset seizures (adjunct), fibromyalgia, generalized anxiety disorder (off-label / approved abroad).",
            citationIDs: ["openfda_round3b"]
        ),
        mechanism: AttributedProse(
            "Binds α2δ subunit of voltage-gated calcium channels in CNS → reduces release of excitatory neurotransmitters. Structural analog of GABA but does NOT bind GABA receptors.",
            citationIDs: ["openfda_round3b"]
        ),
        dosing: [
            DosingBlock(label: "Diabetic neuropathic pain", body: "75 mg PO BID, titrate to 100 mg PO TID (300 mg/day total).", citationIDs: ["openfda_round3b"]),
            DosingBlock(label: "Post-herpetic neuralgia", body: "75 mg PO BID, titrate to 150–300 mg/day.", citationIDs: ["openfda_round3b"]),
            DosingBlock(label: "Fibromyalgia", body: "75 mg PO BID, titrate to 300–450 mg/day.", citationIDs: ["openfda_round3b"]),
            DosingBlock(label: "Renal adjustment", body: "Dose reduction required at CrCl <60 — significant.", citationIDs: ["openfda_round3b"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity.",
            citationIDs: ["openfda_round3b"]
        ),
        warnings: [
            AttributedBullet("CNS DEPRESSION + RESPIRATORY DEPRESSION — especially when combined with opioids, benzodiazepines, or alcohol; FDA warning (2019) on respiratory risk in elderly, COPD, and concurrent CNS depressants.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Misuse / dependence — particularly in patients with prior substance use disorder.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Peripheral edema — counsel; weight gain possible.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Dizziness and somnolence — fall risk.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Suicidality risk in AED indication.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Discontinuation syndrome — taper over ≥1 week.", citationIDs: ["openfda_round3b"])
        ],
        adverseReactions: AttributedProse(
            "Dizziness, somnolence, peripheral edema, weight gain, blurred vision, dry mouth, ataxia. Less common: euphoria, thinking abnormality, suicidal ideation.",
            citationIDs: ["openfda_round3b"]
        ),
        drugInteractions: [
            AttributedBullet("Opioids, benzodiazepines, alcohol — additive CNS and respiratory depression; FDA-warned combination.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("ACE inhibitors — additive angioedema risk reported.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Thiazolidinediones (pioglitazone) — additive edema/HF risk.", citationIDs: ["openfda_round3b"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel about overdose risk when combined with opioids — especially relevant for chronic-pain patients with multiple agents.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("FALL precautions — common cause of falls in elderly.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Renal function check before and during therapy.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Taper rather than abrupt stop.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Monitor weight; counsel diet/exercise.", citationIDs: ["openrn_pharm_round3b"])
        ],
        patientTeaching: AttributedProse(
            "Take with or without food at the same times each day. Rise slowly to prevent falls. Don't combine with alcohol, opioids, or sleep meds without telling your provider — this combination can cause dangerous breathing problems. If you stop, your provider will help you taper.",
            citationIDs: ["openrn_pharm_round3b"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cyclobenzaprine

public enum CyclobenzaprineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cyclobenzaprine",
        title: "Cyclobenzaprine",
        subtitle: "Flexeril · skeletal muscle relaxant",
        category: "Skeletal Muscle Relaxant",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Centrally-acting muscle relaxant; structurally a TCA"),
            KeyValueRow(key: "Onset", value: "1 hour"),
            KeyValueRow(key: "Half-life", value: "~18 hr"),
            KeyValueRow(key: "Recommended duration", value: "Short-term (≤2–3 weeks); little evidence beyond")
        ],
        indications: AttributedProse(
            "Adjunct (with rest and physical therapy) for relief of muscle spasm associated with acute, painful musculoskeletal conditions.",
            citationIDs: ["openfda_round3b"]
        ),
        mechanism: AttributedProse(
            "Acts at brainstem (not muscle directly) to reduce tonic somatic motor activity. Structurally a tricyclic; shares many of their adverse effects.",
            citationIDs: ["openfda_round3b"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "5–10 mg PO 3 times daily; max 30 mg/day. Use up to 2–3 weeks.", citationIDs: ["openfda_round3b"]),
            DosingBlock(label: "Elderly / hepatic impairment", body: "Reduce dose; consider 5 mg only and avoid in elderly per Beers Criteria.", citationIDs: ["openfda_round3b"])
        ],
        contraindications: AttributedProse(
            "Concurrent or recent (14 days) MAOI. Acute recovery phase of MI. Heart failure, arrhythmias, conduction disturbances. Hyperthyroidism. Hypersensitivity.",
            citationIDs: ["openfda_round3b"]
        ),
        warnings: [
            AttributedBullet("BEERS CRITERIA — avoid in elderly; high anticholinergic burden, sedation, falls.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Serotonin syndrome — risk with MAOIs, SSRIs, SNRIs, tramadol, linezolid.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Anticholinergic effects — dry mouth, constipation, urinary retention, blurred vision.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Sedation — additive with alcohol/opioids/benzos; fall risk.", citationIDs: ["openfda_round3b"])
        ],
        adverseReactions: AttributedProse(
            "Drowsiness, dizziness, dry mouth, fatigue, anticholinergic symptoms, headache.",
            citationIDs: ["openfda_round3b"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — contraindicated.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Tramadol, SSRIs, SNRIs, triptans — serotonin syndrome.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Other CNS depressants — additive sedation.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Anticholinergics — additive dry mouth, retention, confusion in elderly.", citationIDs: ["openfda_round3b"])
        ],
        nursingImplications: [
            AttributedBullet("AVOID in elderly (Beers); use alternative non-pharmacologic measures (heat, PT) preferentially.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Short-course only; do not auto-refill chronically.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Counsel against driving after first dose.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Take at bedtime if causing daytime drowsiness.", citationIDs: ["openrn_pharm_round3b"])
        ],
        patientTeaching: AttributedProse(
            "Take a small dose at bedtime first to see how it affects you — it can make you very sleepy. Don't combine with alcohol or pain medications. This is a short-term help; physical therapy and movement help your back more. Tell your provider if it makes you confused.",
            citationIDs: ["openrn_pharm_round3b"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Glipizide

public enum GlipizideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "glipizide",
        title: "Glipizide",
        subtitle: "Glucotrol · sulfonylurea · oral diabetes",
        category: "Sulfonylurea (2nd gen)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Second-generation sulfonylurea"),
            KeyValueRow(key: "Onset", value: "30 min; peak 1–3 hr"),
            KeyValueRow(key: "Half-life", value: "~3 hr (XL ~6 hr)"),
            KeyValueRow(key: "Hypoglycemia warning", value: "Especially in elderly, renal disease, missed meals")
        ],
        indications: AttributedProse(
            "Type 2 diabetes mellitus — adjunct to diet and exercise.",
            citationIDs: ["openfda_round3b"]
        ),
        mechanism: AttributedProse(
            "Closes ATP-sensitive potassium channels on pancreatic β-cells → cell depolarization → calcium influx → INSULIN release. Effect requires functional β-cells; ineffective in T1DM.",
            citationIDs: ["openfda_round3b"]
        ),
        dosing: [
            DosingBlock(label: "Immediate-release", body: "5 mg PO daily 30 min before breakfast; titrate to max 40 mg/day (in divided doses).", citationIDs: ["openfda_round3b"]),
            DosingBlock(label: "XL (extended-release)", body: "5 mg PO daily with breakfast; titrate to max 20 mg/day.", citationIDs: ["openfda_round3b"]),
            DosingBlock(label: "Elderly / renal / hepatic impairment", body: "Start 2.5 mg; cautious titration.", citationIDs: ["openfda_round3b"])
        ],
        contraindications: AttributedProse(
            "Type 1 diabetes mellitus. Diabetic ketoacidosis. Hypersensitivity to sulfonylureas / sulfa drugs (cross-reactivity). Pregnancy near term.",
            citationIDs: ["openfda_round3b"]
        ),
        warnings: [
            AttributedBullet("HYPOGLYCEMIA — most common and serious adverse effect; risk highest in elderly, renal/hepatic impairment, irregular meals, alcohol.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Cardiovascular outcomes — older sulfonylureas (tolbutamide) had concerns; modern data with glipizide reassuring but ADA increasingly favors metformin / GLP-1 / SGLT2 over sulfonylureas as second-line.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Weight gain.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Sulfa allergy cross-reactivity is theoretical; clarify reaction history before assuming contraindication.", citationIDs: ["openrn_pharm_round3b"])
        ],
        adverseReactions: AttributedProse(
            "Hypoglycemia, weight gain, GI upset, rash, photosensitivity (rare), hyponatremia (rare), cholestatic jaundice (rare).",
            citationIDs: ["openfda_round3b"]
        ),
        drugInteractions: [
            AttributedBullet("Insulin and other antidiabetics — additive hypoglycemia.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("β-blockers — mask hypoglycemia symptoms (especially non-selective).", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Bactrim, fluconazole, clarithromycin — increase hypoglycemia.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Alcohol — disulfiram-like reaction possible; potentiates hypoglycemia.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Thiazides, corticosteroids, atypical antipsychotics — antagonize glucose-lowering effect.", citationIDs: ["openfda_round3b"])
        ],
        nursingImplications: [
            AttributedBullet("Take 30 min before breakfast (immediate-release) to coincide with the meal-related insulin demand.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("HOLD if NPO or skipping a meal — high risk of hypoglycemia.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Counsel hypoglycemia recognition; carry rapid carb; teach 15-15 rule.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Monitor BG; HbA1c every 3 months until at goal.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Counsel on alcohol — both flush reaction and hypoglycemia.", citationIDs: ["openrn_pharm_round3b"])
        ],
        patientTeaching: AttributedProse(
            "Take 30 minutes before breakfast. NEVER take it if you're skipping breakfast — your blood sugar can drop dangerously. Always carry glucose tablets or juice. Limit alcohol. Tell every provider you take this — many other meds increase low-blood-sugar risk.",
            citationIDs: ["openrn_pharm_round3b"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Diltiazem PO

public enum DiltiazemPOSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "diltiazem-po",
        title: "Diltiazem (oral)",
        subtitle: "Cardizem CD · Tiazac · non-DHP CCB · rate control + HTN",
        category: "Calcium Channel Blocker (non-DHP)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-dihydropyridine calcium channel blocker"),
            KeyValueRow(key: "Onset", value: "30–60 min (IR); hours (XL)"),
            KeyValueRow(key: "Half-life", value: "3–5 hr (IR); 5–8 hr (XL)"),
            KeyValueRow(key: "Common roles", value: "Rate control in AFib/AFlutter; angina; HTN")
        ],
        indications: AttributedProse(
            "Hypertension, angina (vasospastic and chronic stable), rate control in atrial fibrillation/flutter (oral maintenance after IV), supraventricular tachycardia (chronic suppression).",
            citationIDs: ["openfda_round3b"]
        ),
        mechanism: AttributedProse(
            "Blocks L-type calcium channels in cardiac and vascular smooth muscle. Slows AV nodal conduction (rate control), reduces myocardial contractility and oxygen demand, vasodilates coronary and peripheral arteries.",
            citationIDs: ["openfda_round3b", "openrn_pharm_round3b"]
        ),
        dosing: [
            DosingBlock(label: "AFib rate control / HTN (XL)", body: "120–240 mg PO daily; titrate to max 360 mg/day.", citationIDs: ["openfda_round3b"]),
            DosingBlock(label: "Immediate-release (rare)", body: "30–90 mg PO 4 times daily.", citationIDs: ["openfda_round3b"])
        ],
        contraindications: AttributedProse(
            "Sick sinus syndrome (without pacemaker). Second/third-degree AV block (without pacemaker). Severe hypotension (SBP <90). Acute MI with pulmonary congestion. Heart failure with reduced ejection fraction (worsens contractility). Hypersensitivity. Concurrent IV β-blocker (relative — additive AV block).",
            citationIDs: ["openfda_round3b"]
        ),
        warnings: [
            AttributedBullet("Bradycardia and AV block — additive with β-blockers, digoxin.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Hypotension — caution in volume depletion, concurrent vasodilators.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Worsening of HF with reduced EF — avoid in HFrEF.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Hepatotoxicity rare; transaminitis possible.", citationIDs: ["openfda_round3b"])
        ],
        adverseReactions: AttributedProse(
            "Bradycardia, hypotension, peripheral edema (less than amlodipine), constipation, headache, dizziness, AV block.",
            citationIDs: ["openfda_round3b"]
        ),
        drugInteractions: [
            AttributedBullet("β-blockers — additive bradycardia and AV block.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Digoxin — diltiazem raises digoxin levels; additive AV nodal slowing.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("CYP3A4 inhibitors (azoles, macrolides, ritonavir) — raise diltiazem.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Statins (especially simvastatin, lovastatin) — raise statin levels (rhabdo risk); use limited doses.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Cyclosporine, tacrolimus — diltiazem raises levels.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Grapefruit juice — raises levels.", citationIDs: ["openfda_round3b"])
        ],
        nursingImplications: [
            AttributedBullet("Apical pulse before each dose; hold and notify if HR <50 or SBP <90.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("AVOID in HFrEF — worsens systolic function.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Daily weights; assess for ankle edema, constipation.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Counsel against grapefruit juice.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("XL formulations — DO NOT crush or split.", citationIDs: ["openrn_pharm_round3b"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same time each day. Don't crush or split the long-acting capsules. Avoid grapefruit juice. Tell your provider if you have heart failure or a slow pulse. Report ankle swelling, constipation that won't resolve, or feeling lightheaded.",
            citationIDs: ["openrn_pharm_round3b"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Oxytocin

public enum OxytocinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "oxytocin",
        title: "Oxytocin",
        subtitle: "Pitocin · uterotonic · induction, augmentation, PPH",
        category: "Uterotonic / Posterior Pituitary Hormone",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic posterior pituitary hormone"),
            KeyValueRow(key: "Onset (IV)", value: "Immediate; peak 30 min"),
            KeyValueRow(key: "Half-life", value: "1–6 minutes (very short — titrate by drip)"),
            KeyValueRow(key: "ISMP HIGH-ALERT", value: "Two-nurse verification; strict titration protocol")
        ],
        indications: AttributedProse(
            "Induction or augmentation of labor (IV titrated). Postpartum hemorrhage prevention (after delivery of placenta) and treatment. Incomplete or therapeutic abortion. Lactation initiation (intranasal — historical).",
            citationIDs: ["openfda_round3b"]
        ),
        mechanism: AttributedProse(
            "Binds oxytocin receptors on uterine myometrium → increases force and frequency of contractions; increases prostaglandin synthesis. Receptor density rises throughout pregnancy, peaking at labor.",
            citationIDs: ["openfda_round3b", "openrn_matpharm_round3b"]
        ),
        dosing: [
            DosingBlock(label: "Labor induction / augmentation (IV)", body: "Mix per facility protocol (typical: 10 units in 1000 mL LR or NS = 10 mU/mL). Start at 1–2 mU/min; titrate up by 1–2 mU/min every 15–60 min to achieve adequate contraction pattern (~ every 2–3 min). Max varies by protocol.", citationIDs: ["openfda_round3b", "acog_round3b"]),
            DosingBlock(label: "PPH (active management of 3rd stage)", body: "10 units IM after delivery of anterior shoulder OR 20–40 units in 1000 mL crystalloid run rapidly post-delivery for PPH.", citationIDs: ["openfda_round3b", "cmqcc_round3b"]),
            DosingBlock(label: "Acute PPH treatment", body: "Same IV regimen; if uterus remains atonic, escalate to additional uterotonics (methylergonovine, carboprost, misoprostol, TXA).", citationIDs: ["cmqcc_round3b"])
        ],
        contraindications: AttributedProse(
            "Significant cephalopelvic disproportion. Unfavorable fetal position (transverse). Fetal distress without imminent delivery. Hyperactive or hypertonic uterus. Prior classical cesarean / extensive uterine surgery (risk of rupture). Hypersensitivity.",
            citationIDs: ["openfda_round3b"]
        ),
        warnings: [
            AttributedBullet("UTERINE TACHYSYSTOLE / HYPERSTIMULATION → fetal distress, abruption, rupture; STOP infusion at first sign (>5 contractions in 10 min, persistent late decelerations, prolonged decel).", citationIDs: ["openfda_round3b", "acog_round3b"]),
            AttributedBullet("Uterine rupture — especially with prior cesarean or high doses.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Water intoxication / hyponatremia — antidiuretic effect at high doses or with hypotonic IV fluids; seizures possible.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Hypotension with rapid IV bolus — give as drip, not push (except specific PPH protocols).", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Postpartum: post-delivery doses still cause water retention; track I&O.", citationIDs: ["openrn_matpharm_round3b"])
        ],
        adverseReactions: AttributedProse(
            "Tachysystole, fetal heart rate abnormalities, uterine rupture, hyponatremia (water intoxication) at high cumulative doses, hypotension, nausea, vomiting, allergic reactions.",
            citationIDs: ["openfda_round3b"]
        ),
        drugInteractions: [
            AttributedBullet("Vasopressors — additive hypertension.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Cyclopropane anesthesia — hypotension and bradyarrhythmias (largely historical).", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Other prostaglandins (misoprostol) — additive uterotonic; sequence per protocol.", citationIDs: ["openfda_round3b"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_round3b"]),
            AttributedBullet("Continuous fetal monitoring during induction/augmentation; tocodynamometer for contraction frequency/intensity.", citationIDs: ["openrn_matpharm_round3b"]),
            AttributedBullet("Set up on a dedicated IV line via infusion pump — never piggyback into a primary line that could bolus.", citationIDs: ["openrn_matpharm_round3b"]),
            AttributedBullet("Tachysystole protocol: STOP/decrease oxytocin, position lateral, IV fluid bolus, oxygen 8–10 L NRB, notify provider; tocolytic (terbutaline) if persistent.", citationIDs: ["openrn_matpharm_round3b"]),
            AttributedBullet("Postpartum: assess fundus (firm, midline, at or below umbilicus), lochia, vital signs, pad weight; track urine output.", citationIDs: ["openrn_matpharm_round3b"]),
            AttributedBullet("Document contraction pattern, FHR, dose changes, response.", citationIDs: ["openrn_matpharm_round3b"])
        ],
        patientTeaching: AttributedProse(
            "This medication helps your contractions become regular and strong. We'll watch your baby's heart rate the whole time. Tell us right away if contractions feel too painful or if you feel dizzy. After the baby is born, this also helps your uterus contract back down to control bleeding.",
            citationIDs: ["openrn_matpharm_round3b"]
        ),
        citations: [openfda, openrn, openrnMatPharm, acogConcept, cmqccConcept, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tranexamic Acid (TXA)

public enum TranexamicAcidSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tranexamic-acid",
        title: "Tranexamic Acid (TXA)",
        subtitle: "Cyklokapron · Lysteda · antifibrinolytic · trauma + OB hemorrhage",
        category: "Antifibrinolytic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic lysine analog antifibrinolytic"),
            KeyValueRow(key: "Onset", value: "Minutes IV"),
            KeyValueRow(key: "Half-life", value: "~2 hr"),
            KeyValueRow(key: "Time-critical", value: "Trauma: within 3 hours of injury (CRASH-2). PPH: within 3 hours of bleed onset (WOMAN trial).")
        ],
        indications: AttributedProse(
            "Major trauma with significant bleeding (within 3 hours of injury — CRASH-2). Postpartum hemorrhage (within 3 hours — WOMAN trial). Heavy menstrual bleeding (oral). Surgical bleeding prophylaxis (e.g., orthopedic, cardiac). Hereditary angioedema.",
            citationIDs: ["openfda_round3b"]
        ),
        mechanism: AttributedProse(
            "Competitively inhibits binding of plasminogen and plasmin to fibrin → prevents fibrinolysis → stabilizes formed clots. Does NOT promote clotting de novo — supports existing clots.",
            citationIDs: ["openfda_round3b", "openrn_pharm_round3b"]
        ),
        dosing: [
            DosingBlock(label: "Trauma (CRASH-2 protocol)", body: "1 g IV over 10 minutes, then 1 g IV infusion over 8 hours. Start within 3 hours of injury — benefit decreases beyond 3 hr; potential harm if started >3 hr.", citationIDs: ["openfda_round3b"]),
            DosingBlock(label: "Postpartum hemorrhage (WOMAN protocol)", body: "1 g IV (10 mL of 100 mg/mL diluted in 100 mL saline) over 10 minutes within 3 hours of bleed onset. May repeat 1 g if bleeding continues at 30 min or restarts within 24 hr.", citationIDs: ["acog_round3b", "cmqcc_round3b"]),
            DosingBlock(label: "Heavy menstrual bleeding", body: "1300 mg PO TID × up to 5 days during menstruation.", citationIDs: ["openfda_round3b"])
        ],
        contraindications: AttributedProse(
            "Active intravascular clotting (DIC, acute thrombosis). Subarachnoid hemorrhage (relative — increased ischemic event risk). History of thromboembolism (relative). Color vision abnormality (very high doses associated). Hypersensitivity.",
            citationIDs: ["openfda_round3b"]
        ),
        warnings: [
            AttributedBullet("Thrombosis — DVT, PE, MI, stroke; small absolute risk increase.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Seizures — high doses, intra-thecal exposure, cardiac surgery; mostly with very high doses.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Visual disturbances — chronic high-dose use; rare.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Avoid in patients with active thrombotic disease or recent stroke.", citationIDs: ["openfda_round3b"])
        ],
        adverseReactions: AttributedProse(
            "Headache, nausea, vomiting, diarrhea, hypotension with rapid IV (avoid bolus push). Rare: thromboembolic events, seizures, visual changes.",
            citationIDs: ["openfda_round3b"]
        ),
        drugInteractions: [
            AttributedBullet("Hormonal contraceptives — additive thrombotic risk; counsel.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Tretinoin (acute promyelocytic leukemia) — thrombotic risk.", citationIDs: ["openfda_round3b"]),
            AttributedBullet("Factor IX complex / anti-inhibitor coagulant — thrombotic risk.", citationIDs: ["openfda_round3b"])
        ],
        nursingImplications: [
            AttributedBullet("INFUSE OVER 10 MINUTES — rapid push causes hypotension and possible seizure.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("DOCUMENT TIME of injury / bleed onset and time of TXA initiation — evidence base is time-critical.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Monitor for thromboembolic complications during admission; counsel on signs.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("In OB: TXA is part of the bundle but does NOT replace uterotonics, manual measures, or surgical management — escalate concurrently.", citationIDs: ["openrn_pharm_round3b"]),
            AttributedBullet("Trauma: best benefit when given pre-hospital or within 1 hour of injury.", citationIDs: ["openrn_pharm_round3b"])
        ],
        patientTeaching: AttributedProse(
            "This medication helps your blood clot stay stable while we control the bleeding. We'll give it slowly into your IV. Tell us if you notice leg swelling, chest pain, or trouble breathing in the days after — these can be signs of a clot.",
            citationIDs: ["openrn_pharm_round3b"]
        ),
        citations: [openfda, openrn, acogConcept, cmqccConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}
