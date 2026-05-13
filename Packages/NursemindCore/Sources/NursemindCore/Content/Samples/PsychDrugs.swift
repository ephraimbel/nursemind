import Foundation

// Curator-model psychiatric drug entries (v1.5 expansion).
// Sources: openFDA SPL (CC0), Open RN Mental Health Nursing (CC BY 4.0),
// VA PBM (public domain), ISMP high-alert (concept citation).

private let openfda = CitationSource(
    id: "openfda_psych",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_mental_health",
    shortName: "Open RN Mental Health Nursing",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingmhcc/?s=psychiatric+depression+anxiety",
    lastRetrieved: "2026-05-04"
)
private let openrnPharm = CitationSource(
    id: "openrn_pharm_psych",
    shortName: "Open RN Nursing Pharmacology — Mental Health",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=psychiatric+ssri+antipsychotic",
    lastRetrieved: "2026-05-04"
)
private let ismp = CitationSource(
    id: "ismp_high_alert_2024",
    shortName: "ISMP List of High-Alert Medications, 2024",
    detail: "Lithium and methadone are listed; concept citation",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)

// MARK: - Sertraline

public enum SertralineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sertraline",
        title: "Sertraline",
        subtitle: "Zoloft · selective serotonin reuptake inhibitor (SSRI)",
        category: "SSRI",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "SSRI"),
            KeyValueRow(key: "Onset", value: "1–2 weeks (initial); 4–6 weeks (full effect)"),
            KeyValueRow(key: "Half-life", value: "~26 hr"),
            KeyValueRow(key: "Pregnancy", value: "Often preferred SSRI in pregnancy and lactation")
        ],
        indications: AttributedProse(
            "Major depressive disorder, panic disorder, OCD, PTSD, social anxiety disorder, premenstrual dysphoric disorder.",
            citationIDs: ["openfda_psych"]
        ),
        mechanism: AttributedProse(
            "Selectively inhibits serotonin reuptake at the presynaptic neuron, increasing synaptic serotonin availability.",
            citationIDs: ["openfda_psych", "openrn_mental_health"]
        ),
        dosing: [
            DosingBlock(label: "Depression", body: "Initial 50 mg PO daily; titrate to 50–200 mg daily.", citationIDs: ["openfda_psych"]),
            DosingBlock(label: "Panic / PTSD / social anxiety", body: "Initial 25 mg PO daily for 1 week, then 50 mg daily; titrate to effect (max 200 mg).", citationIDs: ["openfda_psych"]),
            DosingBlock(label: "OCD", body: "Initial 50 mg PO daily; max 200 mg.", citationIDs: ["openfda_psych"])
        ],
        contraindications: AttributedProse(
            "Concurrent or recent (within 14 days) MAOI use. Concurrent pimozide. Hypersensitivity. Oral solution contains alcohol — caution with disulfiram.",
            citationIDs: ["openfda_psych"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: increased suicidality in children, adolescents, and young adults (<25). Monitor closely, especially first weeks and after dose changes.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Serotonin syndrome — risk increased with MAOIs, triptans, tramadol, linezolid, methylene blue, other serotonergic agents.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Hyponatremia (SIADH), especially in elderly.", citationIDs: ["openfda_psych"]),
            AttributedBullet("QT prolongation at high doses.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Discontinuation syndrome (flu-like, dizziness, paresthesias) — taper rather than abrupt stop.", citationIDs: ["openfda_psych"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, diarrhea, insomnia or somnolence, dizziness, fatigue, sexual dysfunction (very common), weight changes, sweating, tremor, hyponatremia (elderly), bleeding risk (especially with NSAIDs).",
            citationIDs: ["openfda_psych"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — serotonin syndrome; 14-day washout required between agents.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Tramadol, fentanyl, triptans, ondansetron, linezolid, methylene blue — additive serotonin risk.", citationIDs: ["openfda_psych"]),
            AttributedBullet("NSAIDs, anticoagulants — increased bleeding (GI especially).", citationIDs: ["openfda_psych"]),
            AttributedBullet("Warfarin — sertraline can raise INR.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Pimozide — contraindicated; QT additive.", citationIDs: ["openfda_psych"])
        ],
        nursingImplications: [
            AttributedBullet("Suicide assessment baseline and ongoing — full effect takes weeks; energy returns before mood, increasing risk.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Counsel that effect is delayed — encourage adherence even when no change felt.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Assess for serotonin syndrome: agitation, hyperthermia, clonus, autonomic instability.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Monitor sodium in elderly (hyponatremia risk).", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Taper rather than abrupt stop to avoid discontinuation syndrome.", citationIDs: ["openrn_mental_health"])
        ],
        patientTeaching: AttributedProse(
            "It takes 4–6 weeks for the full effect — keep taking even if you feel no change at first. Take with food if it upsets your stomach. Report any new or worsening thoughts of self-harm immediately. Do not stop suddenly. Avoid St. John's wort and ask before any new medications, especially pain relievers, migraine medications, or antibiotics.",
            citationIDs: ["openrn_mental_health"]
        ),
        citations: [openfda, openrn, openrnPharm],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Haloperidol

public enum HaloperidolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "haloperidol",
        title: "Haloperidol",
        subtitle: "Haldol · first-generation (typical) antipsychotic",
        category: "Antipsychotic (Typical)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "First-generation (typical) antipsychotic — D2 antagonist"),
            KeyValueRow(key: "Onset", value: "IM 30–60 min · IV 10 min · PO 2 hr"),
            KeyValueRow(key: "Half-life", value: "~18 hr (decanoate longer-acting depot)"),
            KeyValueRow(key: "Common ICU use", value: "Acute agitation/delirium (off-label)")
        ],
        indications: AttributedProse(
            "Schizophrenia, Tourette disorder, severe behavioral problems in children. Off-label: acute agitation, delirium in critical care, hyperactive delirium.",
            citationIDs: ["openfda_psych"]
        ),
        mechanism: AttributedProse(
            "Strong D2 dopamine receptor antagonist; reduces positive psychotic symptoms (hallucinations, delusions). Less effect on negative symptoms.",
            citationIDs: ["openfda_psych", "openrn_mental_health"]
        ),
        dosing: [
            DosingBlock(label: "Acute psychosis (adult)", body: "2–5 mg IM/IV every 4–8 hours; titrate to effect; max varies by indication and protocol.", citationIDs: ["openfda_psych"]),
            DosingBlock(label: "Acute agitation (off-label, ICU)", body: "0.5–10 mg IV/IM, repeated and titrated per institution; lower start in elderly (0.25–0.5 mg).", citationIDs: ["openrn_mental_health"]),
            DosingBlock(label: "Decanoate (long-acting)", body: "10–20× the daily oral dose IM monthly (specialist initiation only).", citationIDs: ["openfda_psych"])
        ],
        contraindications: AttributedProse(
            "Severe CNS depression, coma. Parkinson disease and Lewy body dementia (worsens motor symptoms). Known QT prolongation. Hypersensitivity.",
            citationIDs: ["openfda_psych"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: increased mortality in elderly with dementia-related psychosis (all antipsychotics).", citationIDs: ["openfda_psych"]),
            AttributedBullet("QT prolongation and torsades — baseline ECG and electrolytes if IV use; avoid with other QT-prolonging drugs.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Extrapyramidal symptoms (EPS): acute dystonia, parkinsonism, akathisia, tardive dyskinesia (long-term).", citationIDs: ["openfda_psych"]),
            AttributedBullet("Neuroleptic malignant syndrome (NMS) — fever, rigidity, autonomic instability, AMS; medical emergency.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Anticholinergic and orthostatic effects.", citationIDs: ["openfda_psych"])
        ],
        adverseReactions: AttributedProse(
            "EPS (acute dystonia, akathisia), QT prolongation, sedation, orthostatic hypotension, hyperprolactinemia, anticholinergic effects (less than low-potency typicals), tardive dyskinesia, NMS (rare but life-threatening).",
            citationIDs: ["openfda_psych"]
        ),
        drugInteractions: [
            AttributedBullet("QT-prolonging drugs (azithromycin, ondansetron, methadone, fluoroquinolones) — additive risk.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Other CNS depressants — additive sedation.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Levodopa, dopamine agonists — antagonized by haloperidol.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Anticholinergics — additive anticholinergic effects.", citationIDs: ["openfda_psych"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline ECG, K, and Mg before IV use; correct hypoK/hypoMg first.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Continuous cardiac monitoring with IV; assess QTc.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Assess for EPS at every shift; benztropine or diphenhydramine for acute dystonia.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Recognize NMS: hyperthermia, muscle rigidity, autonomic instability, altered mental status — STOP drug and notify provider immediately.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Use lowest effective dose for shortest duration in delirium; non-pharmacologic measures first when feasible.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Fall precautions for orthostasis.", citationIDs: ["openrn_mental_health"])
        ],
        patientTeaching: AttributedProse(
            "Take as directed. Rise slowly. Tell your team about muscle stiffness, restlessness, abnormal movements, fever, fast heartbeat, or fainting. Avoid alcohol. Use sun protection.",
            citationIDs: ["openrn_mental_health"]
        ),
        citations: [openfda, openrn, openrnPharm],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Quetiapine

public enum QuetiapineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "quetiapine",
        title: "Quetiapine",
        subtitle: "Seroquel · second-generation (atypical) antipsychotic",
        category: "Antipsychotic (Atypical)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Second-generation antipsychotic"),
            KeyValueRow(key: "Onset", value: "Hours; full antipsychotic effect over weeks"),
            KeyValueRow(key: "Half-life", value: "~6 hr (XR ~7 hr)"),
            KeyValueRow(key: "Common off-label", value: "Insomnia (low dose); use with caution")
        ],
        indications: AttributedProse(
            "Schizophrenia, bipolar disorder (acute mania, depressive episodes, maintenance), adjunctive in major depressive disorder.",
            citationIDs: ["openfda_psych"]
        ),
        mechanism: AttributedProse(
            "Antagonist at multiple receptors — D2, 5-HT2A (high affinity), H1, α1, M1. Atypical profile: lower EPS than typicals; substantial sedation and metabolic effects.",
            citationIDs: ["openfda_psych", "openrn_mental_health"]
        ),
        dosing: [
            DosingBlock(label: "Schizophrenia (IR)", body: "Day 1: 25 mg PO BID; titrate over days to 300–800 mg/day in 2 divided doses.", citationIDs: ["openfda_psych"]),
            DosingBlock(label: "Bipolar mania", body: "Day 1: 100 mg PO divided BID; up to 800 mg/day.", citationIDs: ["openfda_psych"]),
            DosingBlock(label: "Bipolar depression / MDD adjunct", body: "Lower doses, often XR 150–300 mg PO at bedtime.", citationIDs: ["openfda_psych"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to quetiapine.",
            citationIDs: ["openfda_psych"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: increased mortality in elderly with dementia-related psychosis.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Boxed warning: increased suicidality in young patients (<25) when used for depression.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Metabolic syndrome — weight gain, hyperglycemia/new-onset diabetes, dyslipidemia.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Orthostatic hypotension, especially during titration.", citationIDs: ["openfda_psych"]),
            AttributedBullet("QT prolongation; cataract risk with long-term use.", citationIDs: ["openfda_psych"]),
            AttributedBullet("NMS, tardive dyskinesia (lower risk than typicals but possible).", citationIDs: ["openfda_psych"])
        ],
        adverseReactions: AttributedProse(
            "Sedation (very common), orthostatic hypotension, dizziness, dry mouth, constipation, weight gain, hyperglycemia, dyslipidemia, transient LFT elevation, hyperprolactinemia (less than risperidone).",
            citationIDs: ["openfda_psych"]
        ),
        drugInteractions: [
            AttributedBullet("CYP3A4 inhibitors (azoles, macrolides) — significantly raise levels; reduce dose.", citationIDs: ["openfda_psych"]),
            AttributedBullet("CYP3A4 inducers (phenytoin, carbamazepine, rifampin) — reduce levels; may need higher dose.", citationIDs: ["openfda_psych"]),
            AttributedBullet("CNS depressants (alcohol, opioids, benzos) — additive sedation.", citationIDs: ["openfda_psych"]),
            AttributedBullet("QT-prolonging agents — additive QT effect.", citationIDs: ["openfda_psych"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline metabolic screen — weight, BMI, lipids, fasting glucose, HbA1c, BP; trend at 3 months and yearly.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Fall precautions during titration (orthostasis, sedation).", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Take at bedtime if sedation limits daytime function; XR formulation often used at bedtime.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Counsel on metabolic monitoring and lifestyle (diet, activity) — weight gain is common.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Periodic eye exams for cataract surveillance.", citationIDs: ["openfda_psych"])
        ],
        patientTeaching: AttributedProse(
            "Take as directed. Avoid alcohol. Rise slowly to prevent dizziness. Watch your weight and report large changes. See your provider for routine glucose, cholesterol, and eye checks. Report fever with stiffness, abnormal movements, or significant mood worsening.",
            citationIDs: ["openrn_mental_health"]
        ),
        citations: [openfda, openrn, openrnPharm],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Lithium

public enum LithiumSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lithium",
        title: "Lithium",
        subtitle: "Lithium carbonate · Eskalith · Lithobid · mood stabilizer",
        category: "Mood Stabilizer",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Alkali metal mood stabilizer"),
            KeyValueRow(key: "Onset", value: "5–7 days for mood effect"),
            KeyValueRow(key: "Half-life", value: "~24 hr"),
            KeyValueRow(key: "Therapeutic level", value: "Acute mania 0.8–1.2 mEq/L; maintenance 0.6–1.0 mEq/L"),
            KeyValueRow(key: "Toxic level", value: ">1.5 mEq/L (>2.5 severe; >3.5 life-threatening)")
        ],
        indications: AttributedProse(
            "Bipolar disorder — treatment of acute manic/mixed episodes and maintenance therapy. Augmentation in refractory depression.",
            citationIDs: ["openfda_psych"]
        ),
        mechanism: AttributedProse(
            "Mechanism not fully understood. Effects include altered second-messenger systems (inositol monophosphatase inhibition), modulation of monoaminergic neurotransmission, and neuroprotection.",
            citationIDs: ["openfda_psych", "openrn_mental_health"]
        ),
        dosing: [
            DosingBlock(label: "Acute mania", body: "Initial 600 mg PO TID (immediate-release), titrate to therapeutic level 0.8–1.2 mEq/L.", citationIDs: ["openfda_psych"]),
            DosingBlock(label: "Maintenance", body: "300–600 mg PO BID-TID, titrated to level 0.6–1.0 mEq/L.", citationIDs: ["openfda_psych"]),
            DosingBlock(label: "Level monitoring", body: "Trough 12 hours after last dose; check 5 days after any change, then every 1–3 months once stable.", citationIDs: ["openfda_psych"])
        ],
        contraindications: AttributedProse(
            "Severe renal or cardiovascular disease, dehydration, sodium depletion. Pregnancy first trimester (cardiac anomalies — Ebstein anomaly).",
            citationIDs: ["openfda_psych"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: lithium toxicity can occur near therapeutic levels — narrow therapeutic window.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Sodium and water depletion (low-salt diet, dehydration, diuretics, NSAIDs, ACEi) raise lithium levels.", citationIDs: ["openfda_psych", "openrn_mental_health"]),
            AttributedBullet("Renal impairment — long-term lithium causes nephrogenic diabetes insipidus and CKD; monitor creatinine.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Hypothyroidism and goiter — monitor TSH every 6–12 months.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Pregnancy — Ebstein anomaly (tricuspid valve malformation); use only when benefits outweigh risk.", citationIDs: ["openfda_psych"])
        ],
        adverseReactions: AttributedProse(
            "Tremor (fine), polyuria/polydipsia, weight gain, GI upset, cognitive dulling, hypothyroidism, acne, hair changes, ECG changes (T wave inversion). Toxicity signs (LATE — separate from therapeutic SE): coarse tremor, ataxia, confusion, slurred speech, seizures, coma.",
            citationIDs: ["openfda_psych", "openrn_mental_health"]
        ),
        drugInteractions: [
            AttributedBullet("NSAIDs — reduce renal clearance; raise lithium levels significantly.", citationIDs: ["openfda_psych"]),
            AttributedBullet("ACE inhibitors, ARBs — raise lithium levels.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Thiazide diuretics — raise lithium levels.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Loop diuretics — variable effect.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Carbamazepine, phenytoin — possible neurotoxicity.", citationIDs: ["openfda_psych"]),
            AttributedBullet("Haloperidol — neurotoxicity reported.", citationIDs: ["openfda_psych"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Trough levels 12 hours post-dose; correlate symptoms with level — toxicity can occur at therapeutic levels.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Counsel on consistent SODIUM and FLUID intake — sudden changes alter lithium level.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Monitor renal function (creatinine), TSH, calcium baseline and per protocol (often q6–12 months).", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Hold and notify for early toxicity signs: coarse tremor, GI upset, confusion, ataxia, slurred speech.", citationIDs: ["openrn_mental_health"]),
            AttributedBullet("Sick day plan: dehydration, vomiting, diarrhea, fever — hold lithium and contact prescriber.", citationIDs: ["openrn_mental_health"])
        ],
        patientTeaching: AttributedProse(
            "Take with food. Drink 2–3 L water/day; do not change your salt intake suddenly. Avoid ibuprofen and naproxen — use acetaminophen instead. Get blood levels as scheduled. Stop and call your provider for shaking, vomiting, diarrhea, severe drowsiness, slurred speech, or confusion. Tell every provider you take lithium.",
            citationIDs: ["openrn_mental_health"]
        ),
        citations: [openfda, openrn, openrnPharm, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}
