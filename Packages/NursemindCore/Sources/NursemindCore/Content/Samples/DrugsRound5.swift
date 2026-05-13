import Foundation

// Curator-model psychiatric drug entries (round 5 expansion).
// Sources: openFDA SPL (CC0), Open RN Mental Health Nursing + Pharmacology (CC BY 4.0),
// VA PBM (public domain), ISMP high-alert (concept citation).

private let openfda = CitationSource(
    id: "openfda_round5",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnMHr5 = CitationSource(
    id: "openrn_mh_round5",
    shortName: "Open RN Mental Health Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingmhcc/?s=psychiatric+ssri+antipsychotic+mood+stabilizer",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR5 = CitationSource(
    id: "openrn_pharm_round5",
    shortName: "Open RN Nursing Pharmacology — Mental Health",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=psychiatric+antidepressant+antipsychotic+anticonvulsant",
    lastRetrieved: "2026-05-04"
)
private let ismpR5 = CitationSource(
    id: "ismp_round5",
    shortName: "ISMP List of High-Alert Medications (concept citation)",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)

// MARK: - Fluoxetine

public enum FluoxetineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "fluoxetine",
        title: "Fluoxetine",
        subtitle: "Prozac · selective serotonin reuptake inhibitor (SSRI)",
        category: "SSRI",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "SSRI — long half-life"),
            KeyValueRow(key: "Onset", value: "1–2 wk initial; 4–6 wk full effect"),
            KeyValueRow(key: "Half-life", value: "~1–4 days (norfluoxetine 7–15 days)"),
            KeyValueRow(key: "MAOI washout", value: "5 weeks before MAOI start (long t½)")
        ],
        indications: AttributedProse(
            "Major depressive disorder, OCD, bulimia nervosa, panic disorder, premenstrual dysphoric disorder; combination olanzapine-fluoxetine for treatment-resistant depression and bipolar depression per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        mechanism: AttributedProse(
            "Selectively inhibits serotonin reuptake at the presynaptic neuron, increasing synaptic serotonin availability. Norfluoxetine active metabolite has a very long half-life (forgiveness for missed doses, but long washout).",
            citationIDs: ["openfda_round5", "openrn_mh_round5"]
        ),
        dosing: [
            DosingBlock(label: "Depression / OCD", body: "Initial 20 mg PO daily; range 20–80 mg daily.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "Bulimia", body: "60 mg PO daily.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "Pediatric depression / OCD", body: "Per provider; 10–20 mg daily start; FDA-approved use in children/adolescents per primary source.", citationIDs: ["openfda_round5"])
        ],
        contraindications: AttributedProse(
            "Concurrent or recent (within 14 days) MAOI use; concurrent pimozide or thioridazine; hypersensitivity. Long washout (5 weeks) required when transitioning OFF fluoxetine to an MAOI.",
            citationIDs: ["openfda_round5"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: increased suicidality in <25; monitor closely first weeks and after dose changes.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Serotonin syndrome — MAOIs, linezolid, methylene blue, triptans, tramadol, fentanyl, ondansetron.", citationIDs: ["openfda_round5"]),
            AttributedBullet("QT prolongation; hyponatremia (SIADH) in elderly.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Activation / agitation, especially early in treatment; bleeding risk with NSAIDs / anticoagulants.", citationIDs: ["openfda_round5"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, headache, insomnia, anxiety, sexual dysfunction (very common), tremor, weight changes, hyponatremia (elderly), bleeding risk.",
            citationIDs: ["openfda_round5"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — serotonin syndrome; 5-week washout AFTER stopping fluoxetine before starting an MAOI per primary source.", citationIDs: ["openfda_round5"]),
            AttributedBullet("CYP2D6 inhibitor — raises levels of metoprolol, codeine (reduces analgesia), TCAs, antipsychotics, tamoxifen (lowers active metabolite).", citationIDs: ["openfda_round5"]),
            AttributedBullet("Warfarin — increased INR; monitor.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Pimozide, thioridazine — contraindicated due to additive QT.", citationIDs: ["openfda_round5"])
        ],
        nursingImplications: [
            AttributedBullet("Energy may return before mood — heightened suicide risk in early weeks; assess every visit.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Counsel on delayed onset (4–6 weeks for full effect) — encourage adherence.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Long half-life: tapering is built-in but MAOI washout is 5 weeks per primary source.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Assess for serotonin syndrome: agitation, hyperthermia, clonus, autonomic instability, AMS.", citationIDs: ["openrn_mh_round5"])
        ],
        patientTeaching: AttributedProse(
            "Takes 4–6 weeks for full effect; do not stop suddenly even though the long half-life means missed doses are well-tolerated. Report any new or worsening thoughts of self-harm. Avoid St. John's wort and tramadol; check before any new medication. Sexual side effects are common — talk to your provider, do not stop on your own.",
            citationIDs: ["openrn_mh_round5"]
        ),
        citations: [openfda, openrnMHr5, openrnPharmR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Citalopram

public enum CitalopramSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "citalopram",
        title: "Citalopram",
        subtitle: "Celexa · selective serotonin reuptake inhibitor (SSRI)",
        category: "SSRI",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "SSRI"),
            KeyValueRow(key: "Onset", value: "1–2 wk initial; 4–6 wk full effect"),
            KeyValueRow(key: "Max dose", value: "40 mg/day; 20 mg/day if >60 yr or hepatic impairment per primary source"),
            KeyValueRow(key: "QT", value: "Dose-dependent QT prolongation — boxed concern at higher doses")
        ],
        indications: AttributedProse(
            "Major depressive disorder. Off-label: anxiety disorders, OCD, panic disorder per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        mechanism: AttributedProse(
            "Selectively inhibits serotonin reuptake at the presynaptic neuron.",
            citationIDs: ["openfda_round5"]
        ),
        dosing: [
            DosingBlock(label: "Depression (adult)", body: "Initial 20 mg PO daily; range 20–40 mg daily.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "Elderly / hepatic impairment", body: "Maximum 20 mg PO daily — higher doses associated with QT prolongation per primary source.", citationIDs: ["openfda_round5"])
        ],
        contraindications: AttributedProse(
            "Concurrent or recent (14 days) MAOI; concurrent linezolid or IV methylene blue; pimozide; congenital long QT syndrome; hypersensitivity.",
            citationIDs: ["openfda_round5"]
        ),
        warnings: [
            AttributedBullet("Dose-dependent QT prolongation — DO NOT exceed 40 mg/day (20 mg if >60 yr or hepatic impairment).", citationIDs: ["openfda_round5"]),
            AttributedBullet("Boxed warning: suicidality in <25 — monitor closely.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Serotonin syndrome with serotonergic agents.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Hyponatremia (SIADH); bleeding risk; angle-closure glaucoma.", citationIDs: ["openfda_round5"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, dry mouth, somnolence, sweating, sexual dysfunction, fatigue, tremor, QT prolongation, hyponatremia (elderly).",
            citationIDs: ["openfda_round5"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs, linezolid, methylene blue — contraindicated; serotonin syndrome.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Other QT-prolonging drugs (amiodarone, quetiapine, ondansetron, methadone, fluoroquinolones, antipsychotics) — additive QT.", citationIDs: ["openfda_round5"]),
            AttributedBullet("CYP2C19 inhibitors (omeprazole, fluvoxamine) — raise citalopram levels; consider lower dose.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Warfarin, NSAIDs — bleeding risk.", citationIDs: ["openfda_round5"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline ECG in patients with cardiac risk factors or on other QT-prolonging drugs per primary source.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Limit to 20 mg/day in elderly and hepatic impairment.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Suicide assessment baseline and ongoing.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Counsel patient that 4–6 weeks needed for full effect; taper if discontinuing.", citationIDs: ["openrn_mh_round5"])
        ],
        patientTeaching: AttributedProse(
            "Takes 4–6 weeks to fully work; take at the same time daily. Report palpitations, fainting, or seizures. Do not stop suddenly — taper with your provider. Avoid alcohol; check before any new medication, including OTC heartburn medicines like omeprazole, which can raise citalopram levels.",
            citationIDs: ["openrn_mh_round5"]
        ),
        citations: [openfda, openrnMHr5, openrnPharmR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Duloxetine

public enum DuloxetineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "duloxetine",
        title: "Duloxetine",
        subtitle: "Cymbalta · serotonin-norepinephrine reuptake inhibitor (SNRI)",
        category: "SNRI",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "SNRI"),
            KeyValueRow(key: "Onset", value: "1–2 wk initial; 4–6 wk full effect"),
            KeyValueRow(key: "Half-life", value: "~12 hr"),
            KeyValueRow(key: "Notable", value: "Approved for diabetic peripheral neuropathy + fibromyalgia + chronic musculoskeletal pain")
        ],
        indications: AttributedProse(
            "Major depressive disorder, generalized anxiety disorder, diabetic peripheral neuropathic pain, fibromyalgia, chronic musculoskeletal pain (e.g., osteoarthritis, low back pain) per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        mechanism: AttributedProse(
            "Inhibits serotonin AND norepinephrine reuptake — increases synaptic monoamines. NE component contributes to analgesic effect via descending pain modulation.",
            citationIDs: ["openfda_round5", "openrn_mh_round5"]
        ),
        dosing: [
            DosingBlock(label: "Depression / GAD", body: "Initial 30–60 mg PO daily; range 60–120 mg daily.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "Diabetic neuropathic pain / fibromyalgia / chronic pain", body: "Initial 30–60 mg PO daily; max 60 mg daily for these indications per primary source.", citationIDs: ["openfda_round5"])
        ],
        contraindications: AttributedProse(
            "Concurrent or recent (14 days) MAOI; uncontrolled narrow-angle glaucoma; severe renal impairment (CrCl <30) per primary source; hepatic impairment / chronic alcohol use (hepatotoxicity).",
            citationIDs: ["openfda_round5"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: suicidality in <25.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Hepatotoxicity — avoid in chronic liver disease and heavy alcohol use; monitor LFTs.", citationIDs: ["openfda_round5"]),
            AttributedBullet("BP elevation — monitor; caution in uncontrolled HTN.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Serotonin syndrome with serotonergic agents.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Discontinuation syndrome — taper.", citationIDs: ["openfda_round5"])
        ],
        adverseReactions: AttributedProse(
            "Nausea (very common, often early), dry mouth, somnolence, fatigue, constipation, decreased appetite, hyperhidrosis, dizziness, BP elevation, hepatotoxicity (rare).",
            citationIDs: ["openfda_round5"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs, linezolid, methylene blue — contraindicated.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Strong CYP1A2 inhibitors (ciprofloxacin, fluvoxamine) — raise levels.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Other serotonergic agents — serotonin syndrome.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Warfarin — bleeding risk.", citationIDs: ["openfda_round5"])
        ],
        nursingImplications: [
            AttributedBullet("Take with food to reduce nausea (typically improves over first 1–2 weeks).", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Monitor BP — especially in uncontrolled HTN.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Avoid in heavy alcohol use; monitor LFTs.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Suicide assessment; taper at discontinuation.", citationIDs: ["openrn_mh_round5"])
        ],
        patientTeaching: AttributedProse(
            "Take with food to reduce nausea. Avoid alcohol. Report yellowing of skin or eyes, dark urine, severe abdominal pain (liver toxicity). Do not crush or chew capsule — swallow whole. Do not stop suddenly. Monitor blood pressure at home if your provider asks.",
            citationIDs: ["openrn_mh_round5"]
        ),
        citations: [openfda, openrnMHr5, openrnPharmR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Buspirone

public enum BuspironeSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "buspirone",
        title: "Buspirone",
        subtitle: "BuSpar · azapirone non-benzodiazepine anxiolytic",
        category: "Anxiolytic (azapirone)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "5-HT1A partial agonist"),
            KeyValueRow(key: "Onset", value: "2–4 wk for full anxiolytic effect — NOT for acute anxiety"),
            KeyValueRow(key: "Abuse potential", value: "None — non-controlled, non-sedating"),
            KeyValueRow(key: "Tolerance / withdrawal", value: "None — unlike benzodiazepines")
        ],
        indications: AttributedProse(
            "Generalized anxiety disorder. Off-label: adjunctive for SSRI-induced sexual dysfunction; aggression in dementia per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        mechanism: AttributedProse(
            "Partial agonist at 5-HT1A receptors; modulates serotonergic neurotransmission. No effect on GABA — so no sedation, no abuse, no withdrawal.",
            citationIDs: ["openfda_round5", "openrn_mh_round5"]
        ),
        dosing: [
            DosingBlock(label: "GAD (adult)", body: "Initial 7.5 mg PO BID; titrate by 5 mg every 2–3 days; usual 15–30 mg daily in divided doses; max 60 mg daily.", citationIDs: ["openfda_round5"])
        ],
        contraindications: AttributedProse(
            "Concurrent or recent (14 days) MAOI; severe hepatic or renal impairment; hypersensitivity.",
            citationIDs: ["openfda_round5"]
        ),
        warnings: [
            AttributedBullet("Not effective for acute anxiety / panic — slow onset; do not use as PRN.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Will not cover benzodiazepine withdrawal — patients on chronic benzodiazepine therapy must be tapered separately.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Serotonin syndrome with MAOIs.", citationIDs: ["openfda_round5"])
        ],
        adverseReactions: AttributedProse(
            "Dizziness, nausea, headache, nervousness, lightheadedness — generally mild and well-tolerated.",
            citationIDs: ["openfda_round5"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — contraindicated; hypertensive reaction.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, macrolides, grapefruit) — raise levels; reduce dose.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Strong CYP3A4 inducers (rifampin, phenytoin, carbamazepine) — lower levels; may need higher dose.", citationIDs: ["openfda_round5"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel on delayed onset (2–4 weeks) — set expectations; encourage adherence.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Excellent option for older adults — no sedation, no falls, no abuse.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Take consistently — twice or three-times-daily dosing.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Avoid grapefruit juice (CYP3A4 inhibition).", citationIDs: ["openrn_mh_round5"])
        ],
        patientTeaching: AttributedProse(
            "Buspirone is taken every day, not just when you feel anxious — it takes 2–4 weeks to work. Avoid grapefruit and grapefruit juice. It does not cause sedation or addiction. If you have been on a benzodiazepine, do not stop it abruptly — talk to your provider about a taper plan.",
            citationIDs: ["openrn_mh_round5"]
        ),
        citations: [openfda, openrnMHr5, openrnPharmR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Valproic Acid

public enum ValproicAcidSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "valproic-acid",
        title: "Valproic acid / Valproate / Divalproex",
        subtitle: "Depakote · mood stabilizer · antiepileptic",
        category: "Mood stabilizer / AED",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Antiepileptic + mood stabilizer"),
            KeyValueRow(key: "Therapeutic level", value: "50–125 mcg/mL (varies by indication)"),
            KeyValueRow(key: "Pregnancy", value: "TERATOGEN — neural tube defects, IQ effects; CONTRAINDICATED for migraine prophylaxis in pregnancy per primary source"),
            KeyValueRow(key: "ISMP high-alert", value: "Antiepileptic — narrow therapeutic index")
        ],
        indications: AttributedProse(
            "Bipolar disorder (acute mania, maintenance), seizure disorders (generalized, partial, absence), migraine prophylaxis (NOT in pregnancy) per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        mechanism: AttributedProse(
            "Increases GABA, blocks voltage-gated sodium channels, and modulates calcium channels — producing antiseizure and mood-stabilizing effects.",
            citationIDs: ["openfda_round5"]
        ),
        dosing: [
            DosingBlock(label: "Bipolar mania", body: "Initial 750 mg/day in divided doses; titrate to clinical effect and trough level 50–125 mcg/mL.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "Seizure disorder", body: "Initial 10–15 mg/kg/day divided; titrate weekly; trough level 50–100 mcg/mL.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "Migraine prophylaxis", body: "250 mg PO BID; max 1000 mg/day. CONTRAINDICATED in pregnancy.", citationIDs: ["openfda_round5"])
        ],
        contraindications: AttributedProse(
            "Pregnancy for migraine prophylaxis (boxed); urea cycle disorders; mitochondrial disease (POLG mutations) in <2 yr; significant hepatic disease; pancreatitis; hypersensitivity.",
            citationIDs: ["openfda_round5"]
        ),
        warnings: [
            AttributedBullet("Boxed warning — hepatotoxicity (esp. <2 yr, polypharmacy). Monitor LFTs at baseline and during first 6 months.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Boxed warning — pancreatitis; can be fatal; assess abdominal pain.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Boxed warning — teratogenicity; neural tube defects; IQ reduction in offspring; effective contraception required in reproductive-age patients.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Hyperammonemia — encephalopathy possible even with normal LFTs; check ammonia if AMS develops.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Thrombocytopenia — monitor CBC; bleeding risk.", citationIDs: ["openfda_round5"])
        ],
        adverseReactions: AttributedProse(
            "GI (N/V), tremor, sedation, weight gain, alopecia, thrombocytopenia, hepatotoxicity, pancreatitis, hyperammonemia, PCOS in young women per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        drugInteractions: [
            AttributedBullet("Lamotrigine — VPA inhibits glucuronidation; raises lamotrigine levels and SJS risk; DOSE-REDUCE lamotrigine when adding VPA per primary source.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Carbamazepine, phenytoin — complex interactions; level monitoring.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Aspirin (high dose) — displaces from protein binding; raises free VPA.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Warfarin — VPA can raise bleeding risk.", citationIDs: ["openfda_round5"])
        ],
        nursingImplications: [
            AttributedBullet("Trend trough levels (drawn just before next dose) — therapeutic 50–125 mcg/mL for bipolar, 50–100 mcg/mL for seizures per primary source.", citationIDs: ["openrn_pharm_round5"]),
            AttributedBullet("Baseline + ongoing LFTs, CBC with platelets, lipase if abdominal pain.", citationIDs: ["openrn_pharm_round5"]),
            AttributedBullet("Document contraception in reproductive-age patients; pregnancy planning before initiation.", citationIDs: ["openrn_pharm_round5"]),
            AttributedBullet("Take with food; ER tablets do not crush.", citationIDs: ["openrn_pharm_round5"])
        ],
        patientTeaching: AttributedProse(
            "Take with food; do not crush or chew extended-release tablets. Use reliable contraception — this medicine causes serious birth defects and lower IQ in children if taken during pregnancy. Report yellow eyes/skin, severe abdominal pain, easy bruising, or unusual fatigue. Get blood tests as scheduled. Do not stop suddenly — risk of seizure.",
            citationIDs: ["openrn_mh_round5"]
        ),
        citations: [openfda, openrnMHr5, openrnPharmR5, ismpR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Lamotrigine

public enum LamotrigineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lamotrigine",
        title: "Lamotrigine",
        subtitle: "Lamictal · mood stabilizer · antiepileptic",
        category: "Mood stabilizer / AED",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "AED — Na-channel blocker"),
            KeyValueRow(key: "Boxed warning", value: "Serious rash including SJS/TEN — risk highest with rapid titration or VPA combo"),
            KeyValueRow(key: "Titration", value: "Slow titration over weeks to months — DO NOT shortcut"),
            KeyValueRow(key: "Strength", value: "Best evidence in BIPOLAR DEPRESSION + maintenance")
        ],
        indications: AttributedProse(
            "Bipolar disorder maintenance (especially bipolar depression), seizure disorders (focal, generalized, Lennox-Gastaut). NOT indicated for acute mania per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        mechanism: AttributedProse(
            "Inhibits voltage-sensitive sodium channels — stabilizes neuronal membranes and reduces glutamate release.",
            citationIDs: ["openfda_round5"]
        ),
        dosing: [
            DosingBlock(label: "Bipolar — monotherapy", body: "Wk 1–2: 25 mg daily. Wk 3–4: 50 mg daily. Wk 5: 100 mg. Wk 6: 200 mg (target). Slow titration is mandatory to reduce SJS risk.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "With valproate (slower)", body: "Wk 1–2: 25 mg every other day. Wk 3–4: 25 mg daily. Wk 5: 50 mg. Wk 6: 100 mg (target). VPA inhibits lamotrigine clearance — half-rate titration per primary source.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "With CYP inducers (faster)", body: "Carbamazepine, phenytoin, phenobarbital, primidone, rifampin — accelerated titration; usual target 400 mg/day per primary source.", citationIDs: ["openfda_round5"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to lamotrigine. Restart after >5-day gap requires re-titration per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        warnings: [
            AttributedBullet("BOXED WARNING — Stevens-Johnson syndrome / toxic epidermal necrolysis. Risk highest in first 8 weeks, with rapid titration, with valproate, and in pediatrics. STOP at any rash and notify provider.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Hemophagocytic lymphohistiocytosis (HLH) — rare, severe immune reaction; fever, rash, lymphadenopathy → STOP.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Suicidality — class effect of AEDs; monitor.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Aseptic meningitis (rare).", citationIDs: ["openfda_round5"])
        ],
        adverseReactions: AttributedProse(
            "Headache, dizziness, ataxia, somnolence, blurred vision, rash (benign or severe), GI upset.",
            citationIDs: ["openfda_round5"]
        ),
        drugInteractions: [
            AttributedBullet("Valproate — DOUBLES lamotrigine half-life; reduce lamotrigine dose ~50%.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Strong inducers (carbamazepine, phenytoin, rifampin, primidone, phenobarbital, OCPs) — lower lamotrigine levels; need higher dose.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Estrogen-containing OCPs — lower lamotrigine levels; dose adjustments needed; pregnancy lowers levels too.", citationIDs: ["openfda_round5"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel patients to STOP and call provider for ANY new rash — rash can progress rapidly to SJS/TEN.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("If lamotrigine has been missed for >5 days, re-titrate per primary source — do NOT resume at previous dose.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Slow titration must be respected — never shortcut to reach therapeutic dose faster.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Pregnancy: counsel that lamotrigine levels DROP in pregnancy — closer monitoring + dose adjustments.", citationIDs: ["openrn_mh_round5"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed during the slow buildup — do not skip the small starter doses, even though they don't seem to be doing anything yet. STOP and call your provider IMMEDIATELY for any new rash, fever, mouth sores, or peeling skin. If you miss more than 5 days, do not just restart at your full dose — call your provider for instructions.",
            citationIDs: ["openrn_mh_round5"]
        ),
        citations: [openfda, openrnMHr5, openrnPharmR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Carbamazepine

public enum CarbamazepineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "carbamazepine",
        title: "Carbamazepine",
        subtitle: "Tegretol · mood stabilizer · antiepileptic",
        category: "Mood stabilizer / AED",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "AED — Na-channel blocker; potent CYP3A4 inducer"),
            KeyValueRow(key: "Therapeutic level", value: "4–12 mcg/mL"),
            KeyValueRow(key: "Boxed warning", value: "Aplastic anemia / agranulocytosis; SJS/TEN (HLA-B*1502 in Asian ancestry)"),
            KeyValueRow(key: "Auto-induction", value: "Self-induces metabolism → levels fall over 4–8 weeks; re-dose")
        ],
        indications: AttributedProse(
            "Seizure disorders (partial, generalized tonic-clonic), trigeminal neuralgia, bipolar disorder (acute manic and mixed episodes) per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        mechanism: AttributedProse(
            "Blocks voltage-dependent sodium channels — stabilizes neuronal membranes.",
            citationIDs: ["openfda_round5"]
        ),
        dosing: [
            DosingBlock(label: "Bipolar / Seizure", body: "Initial 200 mg PO BID; titrate weekly to therapeutic level 4–12 mcg/mL; usual range 800–1200 mg/day in divided doses.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "Trigeminal neuralgia", body: "Initial 100 mg BID; titrate by 200 mg/day; usual 400–800 mg/day in divided doses.", citationIDs: ["openfda_round5"])
        ],
        contraindications: AttributedProse(
            "Concurrent or recent (14 days) MAOI; bone marrow suppression; nefazodone; non-nucleoside RT inhibitors; hypersensitivity to TCAs.",
            citationIDs: ["openfda_round5"]
        ),
        warnings: [
            AttributedBullet("BOXED WARNING — aplastic anemia and agranulocytosis; baseline + periodic CBC.", citationIDs: ["openfda_round5"]),
            AttributedBullet("BOXED WARNING — SJS/TEN; screen for HLA-B*1502 in Asian ancestry before initiating per primary source.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Hyponatremia (SIADH) — common, dose-related; monitor sodium.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Hepatotoxicity; pancreatitis; teratogenic (neural tube defects).", citationIDs: ["openfda_round5"])
        ],
        adverseReactions: AttributedProse(
            "Dizziness, ataxia, drowsiness, nausea, diplopia, hyponatremia, rash, leukopenia, hepatotoxicity, hypothyroidism (chronic).",
            citationIDs: ["openfda_round5"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 inducer — lowers levels of OCPs, warfarin, statins, immunosuppressants, antifungals, DOACs, many AEDs (lamotrigine), many antipsychotics, opioids (methadone).", citationIDs: ["openfda_round5"]),
            AttributedBullet("CYP3A4 inhibitors (azoles, macrolides, grapefruit, diltiazem, verapamil) — raise carbamazepine levels → toxicity.", citationIDs: ["openfda_round5"]),
            AttributedBullet("MAOIs — contraindicated.", citationIDs: ["openfda_round5"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + periodic CBC, LFTs, sodium, drug level (4–12 mcg/mL).", citationIDs: ["openrn_pharm_round5"]),
            AttributedBullet("Counsel on contraception — lowers OCP effectiveness AND is teratogenic; barrier methods recommended.", citationIDs: ["openrn_pharm_round5"]),
            AttributedBullet("Monitor for ataxia, diplopia, AMS — early signs of toxicity; hold and check level.", citationIDs: ["openrn_pharm_round5"]),
            AttributedBullet("HLA-B*1502 testing before initiation in patients of Asian ancestry per primary source.", citationIDs: ["openrn_pharm_round5"])
        ],
        patientTeaching: AttributedProse(
            "Take with food; do not crush extended-release tablets. Avoid grapefruit. Tell every provider that you take this — it changes the way many other medicines work, including birth control. Use a backup birth control method. Report any new rash, fever, sore throat, easy bruising, yellowing skin, or severe headache. Get blood tests as scheduled.",
            citationIDs: ["openrn_mh_round5"]
        ),
        citations: [openfda, openrnMHr5, openrnPharmR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Olanzapine

public enum OlanzapineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "olanzapine",
        title: "Olanzapine",
        subtitle: "Zyprexa · second-generation (atypical) antipsychotic",
        category: "Atypical antipsychotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Atypical antipsychotic — D2/5-HT2A blocker"),
            KeyValueRow(key: "Notable", value: "Highest weight gain + metabolic risk among atypicals"),
            KeyValueRow(key: "Forms", value: "PO, ODT (Zyprexa Zydis), IM (Zyprexa, long-acting Relprevv)"),
            KeyValueRow(key: "Boxed warning", value: "Post-injection sedation/delirium with Relprevv LAI; Risk Evaluation and Mitigation Strategy required")
        ],
        indications: AttributedProse(
            "Schizophrenia, bipolar I (acute mania, mixed episodes, maintenance), agitation in bipolar/schizophrenia (IM); olanzapine-fluoxetine combo for treatment-resistant depression and bipolar depression per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        mechanism: AttributedProse(
            "Antagonist at dopamine D2, serotonin 5-HT2A, histamine H1, muscarinic, and α1-adrenergic receptors. Broad receptor profile drives both efficacy and side effects.",
            citationIDs: ["openfda_round5"]
        ),
        dosing: [
            DosingBlock(label: "Schizophrenia / bipolar", body: "Initial 5–10 mg PO daily; usual range 10–20 mg daily.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "Acute agitation (IM)", body: "10 mg IM; may repeat 2 hr later (max 30 mg/24 hr). DO NOT give with parenteral benzodiazepine (excessive sedation, hypotension) per primary source.", citationIDs: ["openfda_round5"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution: dementia-related psychosis (boxed warning — increased mortality in elderly).",
            citationIDs: ["openfda_round5"]
        ),
        warnings: [
            AttributedBullet("BOXED WARNING — increased mortality in elderly with dementia-related psychosis.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Metabolic syndrome — significant weight gain, hyperglycemia, dyslipidemia; monitor weight, BMI, fasting glucose, lipids.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Neuroleptic malignant syndrome — high fever, rigidity, AMS, autonomic instability.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Tardive dyskinesia (lower risk than first-gen but still possible).", citationIDs: ["openfda_round5"]),
            AttributedBullet("Orthostatic hypotension; QT prolongation; falls risk; anticholinergic effects.", citationIDs: ["openfda_round5"])
        ],
        adverseReactions: AttributedProse(
            "Significant weight gain, sedation, dry mouth, constipation, dizziness, orthostatic hypotension, akathisia, hyperglycemia, hyperlipidemia, hyperprolactinemia.",
            citationIDs: ["openfda_round5"]
        ),
        drugInteractions: [
            AttributedBullet("CNS depressants, alcohol, opioids — additive sedation.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Parenteral benzodiazepines + IM olanzapine — excessive sedation, hypotension; AVOID per primary source.", citationIDs: ["openfda_round5"]),
            AttributedBullet("CYP1A2 inducers (smoking) — lower olanzapine levels; smokers may need higher dose.", citationIDs: ["openfda_round5"]),
            AttributedBullet("CYP1A2 inhibitors (fluvoxamine, ciprofloxacin) — raise levels.", citationIDs: ["openfda_round5"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + ongoing weight, BMI, A1c or fasting glucose, lipids per primary source — q3 mo first year, then annually.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Educate on weight gain risk; lifestyle counseling; consider metformin if A1c rises.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Assess for EPS, akathisia, NMS at every encounter.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("DO NOT mix IM olanzapine with IM benzodiazepine; observe ≥2 hr post-IM in supervised setting.", citationIDs: ["openrn_mh_round5"])
        ],
        patientTeaching: AttributedProse(
            "Significant weight gain is common — diet, exercise, and follow-up labs are part of treatment. Report fevers, severe muscle stiffness, confusion, or fainting. Rise slowly to avoid dizziness. Avoid alcohol. Smoking changes the way this medicine works — tell your provider if you start or stop smoking.",
            citationIDs: ["openrn_mh_round5"]
        ),
        citations: [openfda, openrnMHr5, openrnPharmR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Aripiprazole

public enum AripiprazoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "aripiprazole",
        title: "Aripiprazole",
        subtitle: "Abilify · partial-agonist atypical antipsychotic",
        category: "Atypical antipsychotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dopamine D2 / 5-HT1A partial agonist; 5-HT2A antagonist"),
            KeyValueRow(key: "Notable", value: "Less weight gain and metabolic burden vs olanzapine, quetiapine"),
            KeyValueRow(key: "Forms", value: "PO, ODT, IM short-acting, long-acting injectable (Maintena, Aristada)"),
            KeyValueRow(key: "Risk", value: "Akathisia (very common); compulsive behaviors (gambling, eating, sexual)")
        ],
        indications: AttributedProse(
            "Schizophrenia, bipolar I (acute mania, maintenance), adjunctive treatment of MDD, irritability in autism spectrum disorder, Tourette disorder (pediatric) per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        mechanism: AttributedProse(
            "Partial agonist at D2 and 5-HT1A receptors; antagonist at 5-HT2A. Acts as dopamine system stabilizer — antagonist where dopamine is high, agonist where it is low.",
            citationIDs: ["openfda_round5"]
        ),
        dosing: [
            DosingBlock(label: "Schizophrenia / bipolar", body: "Initial 10–15 mg PO daily; range 10–30 mg daily.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "Adjunct MDD", body: "Initial 2–5 mg PO daily; range 5–15 mg daily.", citationIDs: ["openfda_round5"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution: dementia-related psychosis (boxed warning).",
            citationIDs: ["openfda_round5"]
        ),
        warnings: [
            AttributedBullet("BOXED WARNING — increased mortality in elderly with dementia-related psychosis; suicidality in young adults with antidepressant adjunct use.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Pathological compulsive behaviors — gambling, eating, sexual, shopping; warn patients and caregivers; reduce dose or stop if behaviors emerge.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Akathisia — very common; can be distressing and increase suicide risk.", citationIDs: ["openfda_round5"]),
            AttributedBullet("NMS, tardive dyskinesia, metabolic effects (less than other atypicals).", citationIDs: ["openfda_round5"])
        ],
        adverseReactions: AttributedProse(
            "Akathisia (very common), insomnia, anxiety, nausea, headache, restlessness, weight gain (less than olanzapine), orthostasis.",
            citationIDs: ["openfda_round5"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inducers (carbamazepine, rifampin) — double dose.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Strong CYP3A4 / CYP2D6 inhibitors (ketoconazole, fluoxetine, paroxetine, quinidine) — halve dose.", citationIDs: ["openfda_round5"])
        ],
        nursingImplications: [
            AttributedBullet("ASK about gambling, shopping, binge eating, hypersexuality at follow-up — patients may not volunteer; reduce dose or stop if present.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Assess for akathisia (subjective inner restlessness) — distinct from anxiety; can increase suicide risk.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Monitor metabolic parameters (less than olanzapine but still required).", citationIDs: ["openrn_mh_round5"])
        ],
        patientTeaching: AttributedProse(
            "Tell your provider right away if you notice new gambling, eating, shopping, or sexual urges — this medicine can cause these and they go away when the medicine is changed. Report inner restlessness or feeling unable to sit still. May take 1–2 weeks for full effect; do not stop suddenly.",
            citationIDs: ["openrn_mh_round5"]
        ),
        citations: [openfda, openrnMHr5, openrnPharmR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Risperidone

public enum RisperidoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "risperidone",
        title: "Risperidone",
        subtitle: "Risperdal · second-generation (atypical) antipsychotic",
        category: "Atypical antipsychotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "D2 / 5-HT2A antagonist"),
            KeyValueRow(key: "Notable", value: "Highest hyperprolactinemia among atypicals — gynecomastia, galactorrhea, amenorrhea"),
            KeyValueRow(key: "Forms", value: "PO, ODT, oral solution, long-acting IM (Risperdal Consta, Perseris)"),
            KeyValueRow(key: "Risk", value: "EPS at higher doses (≥6 mg) — closer to first-gen; weight gain moderate")
        ],
        indications: AttributedProse(
            "Schizophrenia, bipolar I (acute mania), irritability in autism spectrum disorder per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        mechanism: AttributedProse(
            "Antagonist at dopamine D2 and serotonin 5-HT2A receptors. At higher doses, D2 blockade approaches first-generation antipsychotic levels.",
            citationIDs: ["openfda_round5"]
        ),
        dosing: [
            DosingBlock(label: "Schizophrenia (adult)", body: "Initial 2 mg PO daily; titrate to 4–8 mg daily; max 16 mg.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "Bipolar mania", body: "Initial 2–3 mg PO daily; range 1–6 mg.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "Pediatric — autism irritability", body: "0.25–0.5 mg PO daily depending on weight; max 2.5 mg daily per primary source.", citationIDs: ["openfda_round5"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution: dementia-related psychosis (boxed warning).",
            citationIDs: ["openfda_round5"]
        ),
        warnings: [
            AttributedBullet("BOXED WARNING — increased mortality in elderly with dementia-related psychosis.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Hyperprolactinemia — galactorrhea, gynecomastia, amenorrhea, sexual dysfunction; reduces bone density long-term.", citationIDs: ["openfda_round5"]),
            AttributedBullet("EPS, akathisia, tardive dyskinesia, NMS.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Orthostasis; QT prolongation; metabolic effects (weight gain, glucose, lipids).", citationIDs: ["openfda_round5"])
        ],
        adverseReactions: AttributedProse(
            "EPS (esp. at higher doses), sedation, weight gain, dizziness, hyperprolactinemia, orthostatic hypotension, akathisia, fatigue.",
            citationIDs: ["openfda_round5"]
        ),
        drugInteractions: [
            AttributedBullet("CYP2D6 inhibitors (fluoxetine, paroxetine) — raise levels.", citationIDs: ["openfda_round5"]),
            AttributedBullet("CYP3A4 inducers (carbamazepine, phenytoin, rifampin) — lower levels.", citationIDs: ["openfda_round5"]),
            AttributedBullet("CNS depressants — additive sedation.", citationIDs: ["openfda_round5"])
        ],
        nursingImplications: [
            AttributedBullet("Assess for hyperprolactinemia symptoms — ask about menses, breast changes, sexual function.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Monitor weight, BMI, glucose, lipids; assess for EPS / akathisia / TD.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Orthostatic precautions; rise slowly.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("LAI options (Consta, Perseris) for adherence challenges.", citationIDs: ["openrn_mh_round5"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same time daily; rise slowly. Report any breast tenderness or discharge, missed periods, or sexual side effects. Report stiffness, tremor, or inability to sit still. Avoid alcohol. Do not stop suddenly.",
            citationIDs: ["openrn_mh_round5"]
        ),
        citations: [openfda, openrnMHr5, openrnPharmR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Clozapine

public enum ClozapineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "clozapine",
        title: "Clozapine",
        subtitle: "Clozaril · atypical antipsychotic for treatment-resistant schizophrenia",
        category: "Atypical antipsychotic",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Indication", value: "Treatment-resistant schizophrenia + suicidality in schizophrenia or schizoaffective disorder"),
            KeyValueRow(key: "REMS", value: "Mandatory ANC monitoring program — weekly × 6 mo, then q2 wk × 6 mo, then monthly"),
            KeyValueRow(key: "Boxed warnings", value: "Severe neutropenia, seizures, myocarditis, orthostatic hypotension, dementia mortality"),
            KeyValueRow(key: "Notable", value: "Most effective antipsychotic but most demanding monitoring")
        ],
        indications: AttributedProse(
            "Treatment-resistant schizophrenia (failed ≥2 other antipsychotics), reduction of recurrent suicidal behavior in schizophrenia or schizoaffective disorder per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        mechanism: AttributedProse(
            "Antagonist at D4, D2, 5-HT2A, α1, H1, and muscarinic receptors. Low D2 occupancy explains low EPS but does not explain superior efficacy in treatment resistance.",
            citationIDs: ["openfda_round5"]
        ),
        dosing: [
            DosingBlock(label: "Treatment-resistant schizophrenia", body: "Day 1: 12.5 mg once or twice. Titrate slowly by 25–50 mg/day to target 300–450 mg/day in divided doses; max 900 mg/day.", citationIDs: ["openfda_round5"])
        ],
        contraindications: AttributedProse(
            "Severe neutropenia (ANC <1500/mm³ baseline; <1000 in benign ethnic neutropenia per REMS); paralytic ileus; uncontrolled seizure disorder; severe CNS depression; hypersensitivity.",
            citationIDs: ["openfda_round5"]
        ),
        warnings: [
            AttributedBullet("BOXED — severe neutropenia / agranulocytosis. Mandatory REMS — prescriber, pharmacy, and patient must be enrolled. ANC monitoring weekly × 6 mo, then q2 wk × 6 mo, then monthly per primary source.", citationIDs: ["openfda_round5"]),
            AttributedBullet("BOXED — seizures (dose-related); titrate slowly; avoid in uncontrolled seizure disorder.", citationIDs: ["openfda_round5"]),
            AttributedBullet("BOXED — myocarditis and cardiomyopathy (highest in first 2 mo); monitor troponin, CRP, ECG, signs of HF.", citationIDs: ["openfda_round5"]),
            AttributedBullet("BOXED — orthostatic hypotension, bradycardia, syncope (slow titration mandatory).", citationIDs: ["openfda_round5"]),
            AttributedBullet("BOXED — increased mortality in elderly with dementia-related psychosis.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Severe constipation / paralytic ileus — assess bowel function; bowel regimen.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Hypersalivation (very common) — counsel; consider glycopyrrolate.", citationIDs: ["openfda_round5"])
        ],
        adverseReactions: AttributedProse(
            "Sedation, hypersalivation, weight gain, hyperglycemia, hyperlipidemia, constipation, orthostatic hypotension, tachycardia, agranulocytosis, seizures, myocarditis (rare).",
            citationIDs: ["openfda_round5"]
        ),
        drugInteractions: [
            AttributedBullet("Smoking — strong CYP1A2 induction; smokers need higher doses; LEVELS DOUBLE if smoking stopped abruptly.", citationIDs: ["openfda_round5"]),
            AttributedBullet("CYP1A2 inhibitors (fluvoxamine, ciprofloxacin) — raise clozapine levels significantly; lower dose.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Other bone-marrow-suppressing drugs — additive risk.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Anticholinergics — additive ileus / urinary retention.", citationIDs: ["openfda_round5"])
        ],
        nursingImplications: [
            AttributedBullet("Verify REMS enrollment and current ANC before EVERY dispense.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Monitor for fever, sore throat, infection (neutropenia); bowel function (ileus); chest pain, dyspnea, edema (myocarditis).", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Slow titration prevents seizures and orthostatic collapse — never skip dose escalation.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Notify provider if patient stops smoking abruptly — clozapine level may double.", citationIDs: ["openrn_mh_round5"])
        ],
        patientTeaching: AttributedProse(
            "You must come for blood work as scheduled — no exceptions. Tell us right away if you have a fever, sore throat, mouth sores, chest pain, shortness of breath, swelling in your legs, severe constipation, or seizures. Tell us if you change how much you smoke — this changes the dose you need.",
            citationIDs: ["openrn_mh_round5"]
        ),
        citations: [openfda, openrnMHr5, openrnPharmR5, ismpR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Methylphenidate

public enum MethylphenidateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "methylphenidate",
        title: "Methylphenidate",
        subtitle: "Ritalin / Concerta · CNS stimulant",
        category: "CNS stimulant (CII)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "CNS stimulant — Schedule II controlled substance"),
            KeyValueRow(key: "Onset", value: "30–60 min (IR); 1–2 hr (ER)"),
            KeyValueRow(key: "Boxed warning", value: "High potential for misuse, dependence, and diversion"),
            KeyValueRow(key: "Forms", value: "IR tablets, ER capsules (Concerta osmotic, Metadate, Daytrana patch)")
        ],
        indications: AttributedProse(
            "Attention-deficit/hyperactivity disorder, narcolepsy per primary source.",
            citationIDs: ["openfda_round5"]
        ),
        mechanism: AttributedProse(
            "Blocks reuptake of norepinephrine and dopamine, increasing synaptic levels in prefrontal cortex — improving attention and impulse control.",
            citationIDs: ["openfda_round5"]
        ),
        dosing: [
            DosingBlock(label: "ADHD — pediatric ≥6 yr", body: "IR: initial 5 mg PO BID-TID; titrate weekly; max 60 mg/day per primary source.", citationIDs: ["openfda_round5"]),
            DosingBlock(label: "ADHD — adult", body: "IR: 10–60 mg/day in 2–3 divided doses. ER: once daily 18–72 mg per primary source.", citationIDs: ["openfda_round5"])
        ],
        contraindications: AttributedProse(
            "Concurrent or recent (14 days) MAOI; significant anxiety, tension, agitation; glaucoma; motor tics or family history of Tourette syndrome (relative); severe hypertension or symptomatic cardiovascular disease; hypersensitivity.",
            citationIDs: ["openfda_round5"]
        ),
        warnings: [
            AttributedBullet("BOXED — dependence and abuse potential; assess for prior substance misuse; secure storage.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Sudden death has been reported in patients with structural cardiac abnormalities — screen with history and exam; consider ECG if cardiac concern.", citationIDs: ["openfda_round5"]),
            AttributedBullet("BP and HR elevation — monitor.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Worsening of psychosis or new psychotic / manic symptoms — particularly in patients with bipolar disorder.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Growth suppression in pediatrics — monitor height/weight.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Priapism (rare); peripheral vasculopathy (Raynaud's-like).", citationIDs: ["openfda_round5"])
        ],
        adverseReactions: AttributedProse(
            "Decreased appetite, insomnia, weight loss, irritability, headache, abdominal pain, tachycardia, BP elevation, anxiety, tics, growth slowing in children.",
            citationIDs: ["openfda_round5"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — contraindicated; hypertensive crisis.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Tricyclic antidepressants — increased TCA levels.", citationIDs: ["openfda_round5"]),
            AttributedBullet("Decongestants, other stimulants — additive cardiovascular effects.", citationIDs: ["openfda_round5"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline cardiac history, vital signs, height/weight; trend at follow-up.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Schedule II — prescription is paper or e-prescribed for controlled substances; no refills allowed by federal rule per primary source.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("Counsel on dosing schedule — last dose by mid-afternoon to avoid insomnia; ER once-daily morning.", citationIDs: ["openrn_mh_round5"]),
            AttributedBullet("ER tablet (Concerta) shell may appear in stool — that is normal; do not chew or crush ER forms.", citationIDs: ["openrn_mh_round5"])
        ],
        patientTeaching: AttributedProse(
            "Take in the morning; if a second dose is needed, take it before mid-afternoon. Do not crush or chew long-acting forms. Eat regular meals — appetite may decrease. Report chest pain, fast or pounding heartbeat, fainting, mood changes, or any abuse concerns. Keep secured — others may seek to misuse this medication.",
            citationIDs: ["openrn_mh_round5"]
        ),
        citations: [openfda, openrnMHr5, openrnPharmR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}
