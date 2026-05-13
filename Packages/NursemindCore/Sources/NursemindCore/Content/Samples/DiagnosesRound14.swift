import Foundation

// Curator-model diagnosis entries (round 14 expansion — sleep, acute psych, allergy, MPN).
// Sources: Open RN Health Alterations + Mental Health (CC BY 4.0), OpenStax (CC BY 4.0 with AI restriction),
// CDC + AASM / APA / AAAAI / NCCN concept citations.

private let openrnDxR14 = CitationSource(
    id: "openrn_dx_round14",
    shortName: "Open RN Health Alterations + Mental Health",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=insomnia+mania+anaphylaxis+MPN",
    lastRetrieved: "2026-05-04"
)
private let specialtyDxR14 = CitationSource(
    id: "specialty_dx_round14",
    shortName: "AASM / APA / AAAAI / NCCN guidelines (concept citation)",
    publisher: "AASM · APA · AAAAI · NCCN",
    license: .factCitationOnly,
    url: "https://aasm.org/clinical-resources/practice-standards/",
    lastRetrieved: "2026-05-04"
)

private let sleepR14 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .cognition)
private let psychR14 = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood)
private let cognitionR14 = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .cognition)
private let allergyR14 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)
private let hemR14 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .clottingHemostasis)
private let pulmR14 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)

// MARK: - Chronic Insomnia Disorder

public enum InsomniaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "chronic-insomnia",
        title: "Chronic insomnia disorder",
        subtitle: "Difficulty initiating / maintaining sleep · CBT-I first-line · pharmacotherapy short-term",
        nclexTags: sleepR14,
        definition: AttributedProse(
            "DSM-5 criteria — dissatisfaction with sleep quantity / quality with difficulty initiating, maintaining sleep, or early morning awakening, ≥3 nights/week × ≥3 months, with daytime impairment, despite adequate opportunity for sleep, not better explained by another disorder per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — predisposing (age, female, family history), precipitating (stressful event), perpetuating (compensatory sleep behaviors, increased time in bed, conditioned arousal). Hyperarousal of cortical / autonomic systems persists.",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("Sleep onset latency >30 minutes; waking after sleep onset (WASO) >30 min; early morning waking; non-restorative sleep.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Daytime — fatigue, mood disturbance, cognitive impairment, irritability, reduced productivity.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Comorbidities — anxiety, depression, chronic pain, OSA, RLS; consider underlying disorder.", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical history; sleep diary 1–2 weeks; sleep questionnaires (PSQI, ISI).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Polysomnography — only if comorbid OSA / parasomnia / refractory cases per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Workup for medical contributors — thyroid, anemia, hormonal, depression, substance use.", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("Sleep history — schedule, latency, awakenings, total sleep time, naps; use sleep diary.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Comorbidity screen — depression, anxiety, OSA risk (Epworth, STOP-BANG), substance use, pain.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Medication review — stimulants, antidepressants, decongestants, beta-blockers can disrupt sleep.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("CBT-I (cognitive behavioral therapy for insomnia) — FIRST-LINE per AASM; superior to medication long-term per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("CBT-I components — sleep hygiene, stimulus control, sleep restriction, cognitive restructuring, relaxation.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pharmacologic (short-term) — non-benzodiazepine receptor agonists (zolpidem, eszopiclone), DORA (suvorexant, lemborexant), low-dose doxepin, melatonin agonist (ramelteon) per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("AVOID benzodiazepines for chronic use — tolerance + dependence; AVOID antihistamines (diphenhydramine) in older adults — Beers per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Treat comorbidities — depression / anxiety / OSA → improves sleep.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Sleep hygiene — consistent schedule, dark / cool bedroom, no screens before bed, limit caffeine + alcohol + naps.", citationIDs: ["openrn_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("Untreated OSA presenting as insomnia — STOP-BANG screen; sleep study if positive per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Depression — bidirectional relationship; treat both.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Long-term hypnotic dependence — taper carefully; consider CBT-I bridge.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Impact on driving / occupational safety — counsel.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Narcolepsy

public enum NarcolepsySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "narcolepsy",
        title: "Narcolepsy",
        subtitle: "Excessive daytime sleepiness · cataplexy (Type 1) · scheduled naps + stimulants",
        nclexTags: sleepR14,
        definition: AttributedProse(
            "Chronic neurologic disorder characterized by excessive daytime sleepiness with rapid REM onset. Type 1 — with cataplexy and / or low CSF orexin (hypocretin); Type 2 — without cataplexy. Median symptom onset adolescence / young adulthood; often delayed diagnosis per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "Type 1 — autoimmune destruction of orexin (hypocretin) neurons in lateral hypothalamus → loss of wake-promoting signal. Strong HLA-DQB1*06:02 association. Type 2 — pathophysiology unclear; orexin levels normal.",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("Excessive daytime sleepiness — irresistible sleep attacks; \"sleep drunkenness.\"", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("CATAPLEXY — sudden brief loss of muscle tone triggered by emotion (laughter, anger, surprise); pathognomonic for Type 1.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("SLEEP PARALYSIS — temporary inability to move on falling asleep / waking.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("HYPNAGOGIC / HYPNOPOMPIC HALLUCINATIONS — vivid sensory experiences at sleep onset / waking.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Disrupted nighttime sleep.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pediatric — irritability, behavioral changes, weight gain.", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Polysomnography + multiple sleep latency test (MSLT) — mean sleep latency ≤8 minutes + ≥2 sleep-onset REM periods (SOREMPs) per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("CSF orexin <110 pg/mL — confirms Type 1 (less commonly used).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Distinguish from idiopathic hypersomnia, OSA, sleep deprivation, depression.", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("Daytime sleepiness severity — Epworth Sleepiness Scale.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Cataplexy frequency + triggers; sleep paralysis; hallucinations.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Driving safety — counsel on driving restrictions during uncontrolled phases.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("Pharmacologic — modafinil / armodafinil first-line for sleepiness; pitolisant (H3 inverse agonist); solriamfetol; methylphenidate / amphetamine derivatives if needed per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Cataplexy — sodium oxybate / oxybate (Xyrem / Lumryz / Xywav) — REMS-controlled; first-line; also improves sleep + sleepiness per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("SSRI / SNRI / venlafaxine — also reduce cataplexy.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("BEHAVIORAL — scheduled naps (15–20 min × 2/day), good sleep hygiene, regular exercise, avoid heavy meals / alcohol per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Driver safety — DMV / occupational counseling; avoid driving when sleepy.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Patient + family education + support groups.", citationIDs: ["openrn_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("Sodium oxybate — Schedule III; respiratory depression with concurrent CNS depressants; REMS-required prescribing per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Cataplexy attacks — rare but can be dramatic; reassure family that consciousness is preserved.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Stimulants — cardiovascular effects; ECG / BP at baseline + ongoing.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pediatric narcolepsy — often misdiagnosed as ADHD; team-based diagnosis per primary source.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Acute Mania

public enum AcuteManiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acute-mania",
        title: "Acute mania (bipolar I)",
        subtitle: "Elevated/irritable mood + DIGFAST · psychiatric emergency · mood stabilizer + atypical",
        nclexTags: psychR14,
        definition: AttributedProse(
            "Distinct period of abnormally + persistently elevated, expansive, OR irritable mood + persistently increased goal-directed activity / energy, ≥1 week (or any duration if hospitalization needed), with significant functional impairment / psychosis. Defines bipolar I disorder per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — genetic (high heritability), neurochemical (dopaminergic + glutamatergic dysregulation), circadian, environmental (stress, substance, sleep deprivation precipitates).",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("DIGFAST — Distractibility, Indiscretion (impulsive), Grandiosity, Flight of ideas, Activity / agitation increased, Sleep need decreased, Talkativeness (pressured speech).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Severe — psychosis (mood-congruent grandiose / persecutory delusions or hallucinations).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Risk-taking — financial, sexual, driving; high-risk behaviors.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Suicide risk — both elevated mood and depressive episodes are high-risk; mixed features especially dangerous.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Hypomania (bipolar II) — same features <1 week, no functional impairment, no psychosis.", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5 — ≥3 DIGFAST symptoms (4 if mood is irritable only) for ≥1 week + functional impairment per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Rule out medical causes — hyperthyroidism, steroids, stimulants, DKA, encephalitis, brain tumor.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Drug screen for stimulants / cocaine / amphetamines.", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("Suicide / homicide risk — direct questions; safety planning.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Mental status exam — orientation, mood, affect, thought process, content, perception, judgment, insight.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Substance use; medication adherence; sleep / nutrition; recent precipitating factors.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Capacity for treatment decisions; legal hold if needed.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("HOSPITALIZATION typically required for severe mania (psychosis, danger to self / others, inability to self-care).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pharmacologic — combination MOOD STABILIZER + ATYPICAL ANTIPSYCHOTIC for severe; lithium, valproate, OR atypical (olanzapine, quetiapine, risperidone, aripiprazole, asenapine, cariprazine, lurasidone, etc.) for moderate per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("STOP antidepressants if patient was on one — can precipitate / worsen mania per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Adjunctive benzodiazepines for agitation / insomnia.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("ECT — for severe / refractory / rapid cycling / pregnancy where medication problematic per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Environment — quiet, low-stimulus; firm + consistent limits without arguing.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Maintenance — lithium / valproate / atypicals; psychoeducation; relapse prevention; address sleep.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Psychoeducation about triggers (sleep loss, substance use, stress, medication non-adherence).", citationIDs: ["openrn_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("SUICIDE RISK — particularly mixed features and post-mania depressive switch; ongoing safety assessment.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("FINANCIAL / SEXUAL / LEGAL CONSEQUENCES — protect patient + family during episodes.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Lithium monitoring — narrow therapeutic; toxicity especially with NSAIDs, dehydration, ACEi, salt restriction per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pregnancy considerations — valproate teratogenic (avoid); lithium with cardiology surveillance per primary source.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - First-Episode Psychosis

public enum FirstEpisodePsychosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "first-episode-psychosis",
        title: "First-episode psychosis (FEP)",
        subtitle: "New-onset psychotic symptoms · CSC programs · early intervention improves outcomes",
        nclexTags: cognitionR14,
        definition: AttributedProse(
            "Initial presentation of psychotic symptoms (hallucinations, delusions, disorganized thought / behavior) — most often emerging in late teens to mid-20s. May represent schizophrenia, schizoaffective, brief psychotic, mood disorder with psychosis, substance / medical-induced, or prodrome of bipolar. Coordinated specialty care (CSC) programs improve long-term outcomes per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "Heterogeneous — genetic + neurodevelopmental + environmental (urban living, cannabis use in adolescence, prenatal infection, social adversity). Dopaminergic dysregulation in mesolimbic pathway → positive symptoms.",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("POSITIVE — hallucinations (auditory most common), delusions, disorganized speech, grossly disorganized / catatonic behavior.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("NEGATIVE — flat affect, anhedonia, alogia, avolition, social withdrawal.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Cognitive — attention, working memory, processing speed deficits.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Functional decline — academic, occupational, social.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Prodrome — months-years of mood / cognitive / social changes preceding onset (\"clinical high risk\").", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Comprehensive psychiatric evaluation including MSE.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Rule out medical / neurologic — basic metabolic, TSH, B12, RPR, HIV, urine drug screen, MRI brain (rule out tumor / encephalitis), EEG (rule out seizure / NMDA-receptor encephalitis) per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Exclude substance-induced (especially methamphetamine, cocaine, cannabis, hallucinogens).", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("Suicide / homicide / self-care risk — high during FEP; ongoing assessment.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Symptom severity (PANSS or BPRS); insight; treatment alliance.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Family function + caregiver capacity.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Substance use; medical workup as above.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("COORDINATED SPECIALTY CARE (CSC) — multidisciplinary team-based program; improves outcomes vs usual care per RAISE study per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Pharmacologic — atypical antipsychotic (start low, go slow); aripiprazole, risperidone, paliperidone common first-line for FEP per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("AVOID olanzapine first-line — significant metabolic burden in young patients per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Long-acting injectable (LAI) — consider after acute stabilization; improves adherence.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("CBT for psychosis (CBTp), family psychoeducation, supported employment / education (IPS), case management.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Substance-use treatment — cannabis / stimulants worsen prognosis.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Continue antipsychotic for ≥1–2 years post-remission to reduce relapse per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Annual metabolic monitoring — weight, A1c, lipids; cardiovascular risk in psychosis is elevated independent of medication.", citationIDs: ["openrn_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("SUICIDE — peak risk in first year post-diagnosis; ongoing safety planning.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("ANTI-NMDA RECEPTOR ENCEPHALITIS — autoimmune; presents with psychosis + seizures + dystonia; emergent treatment with IVIG / plasmapheresis / steroids per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Family burden — high; family psychoeducation reduces relapse.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Stigma — counsel + connect to support / advocacy.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Catatonia

public enum CatatoniaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "catatonia",
        title: "Catatonia",
        subtitle: "Psychomotor syndrome · benzodiazepine challenge + ECT · medical or psychiatric origin",
        nclexTags: cognitionR14,
        definition: AttributedProse(
            "Psychomotor syndrome characterized by motor / behavioral / autonomic features. May occur in mood disorders (most common — bipolar, MDD), schizophrenia, autism, intellectual disability, medical / neurologic conditions (autoimmune encephalitis, NMS, infection, metabolic). Bush-Francis Catatonia Rating Scale assesses severity per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — GABA hypoactivity, glutamatergic / dopaminergic dysregulation. Underlying medical / psychiatric trigger present in most cases.",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("Stupor or mutism; immobility / posturing.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("WAXY FLEXIBILITY (cerea flexibilitas) — passive movement maintained against gravity.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Echolalia (mimicking speech); echopraxia (mimicking movement).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("NEGATIVISM — opposing or refusing; STEREOTYPY — repetitive movement.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("MALIGNANT CATATONIA — fever, autonomic instability, rhabdomyolysis; can mimic NMS / serotonin syndrome; emergent.", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5 / Bush-Francis — ≥3 of 12 motor / behavioral features (stupor, mutism, immobility, posturing, waxy flexibility, etc.).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Rule out medical — encephalitis (especially autoimmune anti-NMDA receptor in young women with ovarian teratoma), seizure, metabolic, drug toxicity, NMS, locked-in syndrome per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Workup — basic metabolic, CBC, TSH, ammonia, drug screen, MRI / EEG / LP per neurology consultation.", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — fever / autonomic instability suggests malignant catatonia.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Hydration, nutrition, skin integrity (immobility), DVT risk.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Medical workup before assuming psychiatric cause — anti-NMDA encephalitis is a treatable mimic.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("LORAZEPAM CHALLENGE — 1–2 mg IV / IM / SL; rapid response within minutes-hours diagnostically + therapeutically per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Maintenance — lorazepam scheduled (8–24 mg/day in divided doses); titrate to response.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("ECT (electroconvulsive therapy) — definitive treatment for refractory or malignant catatonia; first-line in malignant per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("AVOID antipsychotics in pure catatonia — can precipitate / worsen NMS-like state per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Treat underlying — autoimmune encephalitis (IVIG / steroids / plasmapheresis), psychiatric (mood stabilizer / antidepressant once catatonia resolved).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Supportive — IV fluids, nutrition (NG / TPN), DVT prophylaxis, skin care, range-of-motion, monitoring for aspiration.", citationIDs: ["openrn_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("MALIGNANT CATATONIA — fever + autonomic instability + rhabdomyolysis; ICU-level care; ECT often life-saving per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("ANTI-NMDA RECEPTOR ENCEPHALITIS — emergency; missed diagnosis is treatable per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("VTE / aspiration / pressure injury / dehydration from prolonged immobility — preventive care.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Opioid Withdrawal

public enum OpioidWithdrawalSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "opioid-withdrawal",
        title: "Opioid withdrawal",
        subtitle: "COWS-graded · uncomfortable but rarely lethal · MAT initiation opportunity",
        nclexTags: psychR14,
        definition: AttributedProse(
            "Constellation of physical + psychological symptoms after abrupt cessation / dose reduction in opioid-dependent person. Onset 6–12 hours short-acting opioids, 24–48 hours methadone. Uncomfortable but rarely life-threatening (unlike alcohol / benzo withdrawal) per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "Loss of opioid receptor agonism → noradrenergic rebound (locus coeruleus disinhibition) → autonomic + somatic withdrawal symptoms.",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("Restlessness, anxiety, dysphoria, drug craving.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Autonomic — yawning, lacrimation, rhinorrhea, diaphoresis, piloerection (\"goosebumps\"), mydriasis.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("GI — nausea, vomiting, diarrhea, abdominal cramping.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Musculoskeletal — myalgias, arthralgias, leg cramps, restless legs.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Cardiovascular — tachycardia, hypertension.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Insomnia, hot / cold flushes.", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical Opiate Withdrawal Scale (COWS) — 11-item scale; mild 5–12, moderate 13–24, moderately severe 25–36, severe >36 per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Drug screen confirms recent opioid use (and may guide treatment).", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("COWS score; trend during treatment.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Last-use time + substance + dose; concurrent benzodiazepines / alcohol (more dangerous combinations).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pregnancy — opioid agonist therapy preferred over withdrawal per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Suicide risk; mental health.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("MEDICATION-ASSISTED TREATMENT (MAT) — buprenorphine or methadone preferred for moderate-severe withdrawal AND ongoing OUD treatment per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("BUPRENORPHINE — initiate when COWS ≥8–13 (in moderate withdrawal) to prevent precipitated withdrawal; 4–8 mg SL × 1 then titrate per protocol.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("METHADONE — only at OTP or hospitalized in inpatient setting per federal regulation.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Symptomatic — clonidine 0.1–0.2 mg PO (autonomic symptoms; check BP), ondansetron (nausea), loperamide (diarrhea), hydroxyzine (anxiety / sleep), NSAIDs (myalgia), trazodone (sleep).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Lofexidine (Lucemyra) — α2 agonist FDA-approved specifically for opioid withdrawal; alternative to clonidine per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Hydration, electrolyte support, comfort measures.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("CO-PRESCRIBE NALOXONE for relapse risk; counsel about reduced tolerance after withdrawal — overdose risk per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Behavioral therapy + peer support (AA / NA / SMART Recovery).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pregnancy — methadone or buprenorphine maintenance preferred; AVOID withdrawal in pregnancy (fetal risk) per primary source.", citationIDs: ["specialty_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("PRECIPITATED WITHDRAWAL with buprenorphine — give only at COWS ≥8–13; if precipitated, lorazepam + clonidine + supportive care; consider increasing buprenorphine dose per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("OPIOID OVERDOSE relapse — patient's tolerance is reduced after withdrawal; counsel + naloxone.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Concurrent benzodiazepine or alcohol withdrawal — separately dangerous; assess simultaneously.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pregnancy — opioid withdrawal causes fetal distress; coordinate maternal-fetal medicine + addiction medicine.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - HAE

public enum HAESample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hae",
        title: "Hereditary angioedema (HAE)",
        subtitle: "C1-INH deficiency · recurrent non-pruritic swelling · airway emergency · NOT histamine-mediated",
        nclexTags: allergyR14,
        definition: AttributedProse(
            "Inherited disorder of bradykinin overproduction due to C1-esterase inhibitor deficiency or dysfunction. Causes recurrent attacks of cutaneous + mucosal swelling that are NON-PRURITIC, NON-URTICARIAL, and DO NOT respond to antihistamines / steroids / epinephrine (which work for histaminergic angioedema) per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "Type 1 (85%) — low C1-INH; Type 2 (15%) — dysfunctional C1-INH. Without C1-INH inhibition, kallikrein converts kininogen to bradykinin → vasodilation + capillary permeability → angioedema. Triggers: trauma, surgery, dental work, infection, stress, OCPs, ACEi.",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("Recurrent NON-PRURITIC swelling — face, lips, tongue, larynx, hands, feet, abdomen.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("ABDOMINAL ATTACKS — severe pain, vomiting, sometimes ascites; mimics surgical abdomen → unnecessary surgery in undiagnosed cases.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("LARYNGEAL ATTACKS — life-threatening airway compromise; ~50% of patients lifetime risk.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Family history (autosomal dominant); first attack typically childhood / adolescence.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("PRODROME — fatigue, mood, erythema marginatum (non-pruritic rash) precedes attack hours.", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("C1-INH function level — LOW (Type 1 + Type 2).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("C1-INH antigenic level — LOW in Type 1, NORMAL in Type 2 per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("C4 level — LOW between attacks (screening test).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Genetic testing for SERPING1 (C1-INH gene) for confirmation + family.", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("Airway — emergent if laryngeal involvement (stridor, voice change, dysphagia).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Severity + location of attack; trigger if identifiable.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Family history; coordinate genetic counseling + family screening.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE ATTACK — DOES NOT respond to epinephrine / antihistamines / steroids; use HAE-specific therapies per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("C1-INH concentrate IV (Berinert) — gold standard acute therapy.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Icatibant SQ (Firazyr) — bradykinin B2 receptor antagonist; effective acute attack therapy.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Ecallantide SQ (Kalbitor) — kallikrein inhibitor; in clinic only (anaphylaxis risk).", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("FFP — alternative if specific therapy not available; less effective.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("EMERGENT INTUBATION — for laryngeal swelling; LOW threshold.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("LONG-TERM PROPHYLAXIS — C1-INH IV every 3–4 days OR SQ 2× weekly; lanadelumab SQ; berotralstat PO; danazol per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Pre-procedure prophylaxis — C1-INH before dental / surgical procedures per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Avoid ACEi (precipitates HAE attacks); avoid OCPs (estrogens worsen) per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Patient + family education + medical-alert ID + emergency action plan.", citationIDs: ["openrn_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("LARYNGEAL ATTACK — airway emergency; emergent intubation (consider awake fiberoptic if anatomy distorted).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("MISDIAGNOSED ABDOMINAL ATTACK — patient may receive unnecessary laparotomy; HAE imaging shows mucosal edema.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("ACEi-induced angioedema — different mechanism (also bradykinin); STOP ACEi; HAE therapies sometimes used per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Acquired C1-INH deficiency (rare) — older onset; associated with lymphoproliferative / autoimmune disease.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Allergic Rhinitis

public enum AllergicRhinitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "allergic-rhinitis",
        title: "Allergic rhinitis",
        subtitle: "IgE-mediated · seasonal vs perennial · INCS first-line · immunotherapy for severe",
        nclexTags: allergyR14,
        definition: AttributedProse(
            "Inflammatory disorder of nasal mucosa caused by IgE-mediated reaction to inhaled allergens. Seasonal (pollen) or perennial (dust mites, pets, mold). Most common chronic disease in children + 10–30% of adults per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "Allergen exposure → IgE-mediated mast cell degranulation → histamine + leukotriene + cytokine release → early-phase (sneezing, rhinorrhea) + late-phase (congestion, eosinophilic infiltration) reactions.",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("Sneezing, rhinorrhea (clear), nasal pruritus, congestion.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Itchy / watery eyes (allergic conjunctivitis); itchy palate / throat / ears.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Postnasal drip, cough, decreased smell.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("\"Allergic shiners\" (dark periorbital circles), \"allergic salute\" (children rubbing nose upward), nasal crease.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pale / boggy nasal mucosa; clear discharge.", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical history + physical exam.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Skin prick testing (most sensitive) OR specific IgE blood testing — confirm allergens for immunotherapy candidates per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Eosinophils on nasal smear (supportive).", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("Symptom severity — impact on sleep / school / work / quality of life.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Triggers identification — environmental, occupational, seasonal pattern.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Comorbidities — asthma, atopic dermatitis, sinusitis, otitis media, sleep-disordered breathing per primary source.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("INTRANASAL CORTICOSTEROID (INCS) — fluticasone, mometasone, budesonide, triamcinolone; FIRST-LINE for moderate-severe symptoms; daily dosing per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Second-generation oral antihistamines — cetirizine, loratadine, fexofenadine, desloratadine; less sedating than first-generation.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Intranasal antihistamines — azelastine, olopatadine; rapid onset.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Combination INCS + intranasal antihistamine (Dymista — fluticasone-azelastine) for moderate-severe per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Leukotriene receptor antagonist (montelukast) — adjunctive; FDA boxed warning for neuropsychiatric effects.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Saline nasal rinse / spray — adjunctive; safe.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Allergen immunotherapy (SCIT or SLIT) — disease-modifying for severe / refractory cases per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Allergen avoidance — HEPA filters, dust-mite covers, pet bathing, pollen avoidance, mold remediation.", citationIDs: ["openrn_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("ASTHMA exacerbation — \"one airway, one disease\"; uncontrolled rhinitis worsens asthma; treat both per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("CHRONIC SINUSITIS / nasal polyps — when refractory to standard therapy; ENT referral per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Sleep-disordered breathing in children with chronic nasal obstruction — sleep evaluation per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Decongestant rebound (rhinitis medicamentosa) — limit oxymetazoline / pseudoephedrine to ≤3 days.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - EoE

public enum EoESample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "eosinophilic-esophagitis",
        title: "Eosinophilic esophagitis (EoE)",
        subtitle: "Chronic immune esophageal disease · dysphagia / food impaction · PPI / topical steroid",
        nclexTags: allergyR14,
        definition: AttributedProse(
            "Chronic immune-mediated disease of esophagus characterized by eosinophilic inflammation (≥15 eos/HPF on biopsy) + symptoms of esophageal dysfunction. Distinct from GERD-related eosinophilia. Most common cause of dysphagia / food impaction in young adults per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "Th2 / IL-13 / IL-4 / IL-5 cytokine-driven eosinophilic inflammation in response to food antigens (most common — milk, wheat, eggs, soy, peanuts, seafood). Strong association with atopy.",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("Adult — dysphagia (especially solid foods, slow eating, chewing thoroughly, drinking with meals to wash down), FOOD IMPACTION (often presenting symptom).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pediatric — feeding difficulties, vomiting, abdominal pain, failure to thrive.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Atopic background (asthma, allergic rhinitis, atopic dermatitis, food allergies).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("EGD — esophageal rings, furrows, white exudates, narrowing, fragility (\"crepe-paper esophagus\").", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Symptoms of esophageal dysfunction + ≥15 eosinophils per high-power field on esophageal biopsy + exclusion of other causes per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Multiple-level biopsies (proximal + distal) — patchy involvement.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pre- and post-treatment biopsy to confirm response.", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("Atopic comorbidities; food triggers identification — empirical 6-food elimination + sequential reintroduction OR allergy-test-guided.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Nutritional status, weight loss, feeding behavior in pediatrics.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Food impaction history — emergent EGD if active.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("Three D's — DIET, DRUGS, DILATION per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("PPI — first-line in many guidelines (~30–50% respond — \"PPI-responsive\" per primary source).", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("TOPICAL CORTICOSTEROIDS — swallowed budesonide slurry or fluticasone (NOT inhaled) — first-line for many; esophageal candidiasis risk per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("DUPILUMAB (anti-IL-4Rα) — FDA-approved 2022 for adults + adolescents; SQ injection per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("DIET — empirical 6-food elimination (milk, wheat, soy, eggs, peanuts/nuts, seafood) with sequential reintroduction; or amino-acid elemental formula (peds).", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("ENDOSCOPIC DILATION for strictures — careful (perforation risk in fragile esophagus) per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Avoid / treat triggers; allergy referral.", citationIDs: ["openrn_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("FOOD IMPACTION — emergent EGD; risk of perforation with prolonged impaction.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Stricture / perforation during dilation — careful technique.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Topical steroid candidiasis — counsel oral hygiene + rinse mouth; not swallow.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pediatric — failure to thrive; coordinate dietitian.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Polycythemia Vera

public enum PVSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "polycythemia-vera",
        title: "Polycythemia vera (PV)",
        subtitle: "JAK2-mutated MPN · elevated Hct · phlebotomy + hydroxyurea + low-dose ASA",
        nclexTags: hemR14,
        definition: AttributedProse(
            "Myeloproliferative neoplasm characterized by autonomous erythrocytosis (and often thrombocytosis + leukocytosis) due to JAK2 mutation (V617F or exon 12). Hgb >16.5 (men) / >16 (women) typical. Risk of thrombosis + transformation to myelofibrosis / AML per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "JAK2 V617F mutation in hematopoietic stem cell → constitutive activation of cytokine signaling → erythroid + megakaryocytic + granulocytic hyperproliferation independent of erythropoietin.",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("Many ASYMPTOMATIC — found on routine CBC.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Hyperviscosity — headache, dizziness, blurred vision, tinnitus.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Aquagenic pruritus (after warm bath / shower) — characteristic.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Erythromelalgia — burning pain in hands / feet.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Splenomegaly (often massive).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Thrombosis (arterial + venous) — including unusual sites (Budd-Chiari, splenic vein, cerebral, mesenteric).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Bleeding paradoxically (acquired vWD at very high Hct).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Plethora (ruddy facial appearance), conjunctival suffusion.", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("WHO 2016 — Hgb / Hct elevated + JAK2 mutation + bone-marrow hypercellularity (when needed) per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("LOW erythropoietin + JAK2 V617F = classic finding.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Differentiate from secondary erythrocytosis (smoking, OSA, EPO-secreting tumor, chronic hypoxia, doping).", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("Hct trend; symptom burden (MPN10 score); thrombotic / bleeding history.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("CV risk factors; antithrombotic strategy.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Splenic exam; pruritus; transformation surveillance.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("PHLEBOTOMY to maintain Hct <45% (men) / <42% (women) per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("LOW-DOSE ASPIRIN 81 mg PO daily — reduces thrombosis (CYTO-PV trial) per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("HIGH-RISK PV (age >60 or prior thrombosis) — add CYTOREDUCTION — hydroxyurea or peginterferon-α (also pregnancy-safer) per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("RUXOLITINIB (JAK1/2 inhibitor) — 2nd-line / refractory; reduces splenomegaly + symptoms per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Pruritus — antihistamines, SSRIs, JAK inhibitors, narrowband UVB.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("CV risk factors aggressive control — BP, smoking, lipids.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Surveillance — CBC + differential periodically; bone-marrow biopsy if transformation suspected.", citationIDs: ["openrn_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("THROMBOSIS — leading cause of mortality; aggressive Hct control + ASA.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("TRANSFORMATION — to myelofibrosis (10–20 yr) or AML (rare); declining counts, splenomegaly progression, weight loss.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pregnancy — high-risk; hematology + maternal-fetal medicine; aspirin + interferon-α per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Surgical bleeding risk — pre-op phlebotomy to lower Hct.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Essential Thrombocythemia

public enum ETSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "essential-thrombocythemia",
        title: "Essential thrombocythemia (ET)",
        subtitle: "Sustained platelet >450k · JAK2 / CALR / MPL · thrombosis + bleeding paradox",
        nclexTags: hemR14,
        definition: AttributedProse(
            "Myeloproliferative neoplasm with sustained thrombocytosis (platelet >450,000) caused by JAK2 (60%), CALR (30%), or MPL (3%) mutations. Risk-stratify thrombosis + bleeding by age + prior events + JAK2 status per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "Driver mutation → constitutive thrombopoietin signaling → autonomous megakaryocyte / platelet production. Platelets often dysfunctional → both thrombosis AND bleeding risk (acquired vWD at very high counts).",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("Many asymptomatic; found on routine CBC.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Vasomotor — headaches, dizziness, visual disturbance, paresthesias, erythromelalgia.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Thrombosis (arterial > venous) — TIA / stroke / MI / DVT / PE.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Bleeding (acquired vWD at very high counts >1500–2000k).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Splenomegaly (less than PV).", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Platelet >450,000 sustained + bone marrow showing megakaryocyte proliferation + JAK2 / CALR / MPL mutation OR exclusion of reactive thrombocytosis (iron-deficiency anemia, infection, inflammation, malignancy, post-splenectomy) per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Distinguish from CML (BCR-ABL), PV, prefibrotic myelofibrosis.", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("Risk stratification — IPSET-thrombosis (age, prior thrombosis, CV factors, JAK2 mutation).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Bleeding tendency at very high platelets.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pregnancy planning — high-risk.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("LOW-RISK (<60 yr, no prior thrombosis, no JAK2) — observation OR low-dose aspirin per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("INTERMEDIATE (no prior thrombosis but JAK2 OR CV risks) — low-dose aspirin per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("HIGH-RISK (age ≥60, prior thrombosis) — CYTOREDUCTION — hydroxyurea OR pegylated interferon-α (esp. younger / pregnancy planning) + aspirin per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Anagrelide — alternative cytoreduction (less preferred — cardiac side effects).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("HOLD aspirin if platelets >1000–1500k and acquired vWD; consider cytoreduction first per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pregnancy — interferon-α + low-dose ASA (some patients) per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Surveillance CBC every 3–6 months stable.", citationIDs: ["openrn_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("THROMBOSIS — careful CV risk-factor management.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("BLEEDING at very high counts — acquired vWD; AVOID antiplatelet until cytoreduced.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("TRANSFORMATION to myelofibrosis or AML — rare in ET; declining counts / splenomegaly progression.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pregnancy loss / placental thrombosis higher risk; coordinate care.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Myelofibrosis

public enum MyelofibrosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "myelofibrosis",
        title: "Myelofibrosis",
        subtitle: "MPN with marrow fibrosis · cytopenias + splenomegaly · ruxolitinib + transplant",
        nclexTags: hemR14,
        definition: AttributedProse(
            "Myeloproliferative neoplasm with progressive bone-marrow fibrosis → extramedullary hematopoiesis (especially massive splenomegaly), cytopenias, constitutional symptoms. Primary myelofibrosis (PMF) or secondary (post-PV / post-ET). Median survival varies widely by risk strata per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "JAK2 / CALR / MPL mutation + reactive marrow fibrosis driven by abnormal megakaryocyte cytokines (TGF-β, PDGF) → marrow failure → extramedullary hematopoiesis (spleen, liver) → massive splenomegaly + cytopenias.",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("Constitutional — fatigue, weight loss, night sweats, low-grade fevers.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("MASSIVE SPLENOMEGALY — early satiety, abdominal discomfort, postprandial fullness.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Anemia (transfusion dependence common); thrombocytopenia or thrombocytosis; leukocytosis or leukopenia.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Bone pain, pruritus, splenic infarcts.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Tear-drop RBCs, leukoerythroblastic blood smear.", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Bone marrow biopsy — fibrosis grade ≥2 + atypical megakaryocytes; aspirate often \"dry tap\" per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("JAK2 / CALR / MPL mutation + exclusion of secondary causes.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Risk stratification — DIPSS, MIPSS70 per primary source.", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("Symptom burden + transfusion dependence + splenomegaly size.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Risk stratification for transplant decision.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Performance status; comorbidities for transplant evaluation.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("ALLOGENEIC STEM-CELL TRANSPLANT — only curative option; high-risk young / fit patients per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("RUXOLITINIB (JAK1/2 inhibitor) — first-line for symptomatic / splenomegaly; reduces spleen + symptoms; modest survival benefit per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Fedratinib, momelotinib (cardio-renal-anemia benefit), pacritinib (thrombocytopenia-friendly) — alternative JAK inhibitors per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Anemia management — transfusions, danazol, lenalidomide / thalidomide (some), erythropoietin (selected per EPO level).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Splenectomy — refractory splenomegaly / symptoms; selected; transplant candidates first.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Splenic radiation — palliation in non-surgical candidates.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Iron-overload management for transfusion-dependent (chelation).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Palliative care + symptom control.", citationIDs: ["openrn_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("LEUKEMIC TRANSFORMATION — accelerated phase / AML; declining counts, blasts in peripheral blood, severe symptoms; high mortality.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("PORTAL HYPERTENSION from massive splenomegaly + extramedullary hematopoiesis; varices, ascites.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Iron overload from chronic transfusion — cardiac / hepatic / endocrine.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Infection from cytopenias and immunosuppression of treatment.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}


public enum OHSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ohs",
        title: "Obesity hypoventilation syndrome (OHS)",
        subtitle: "BMI ≥30 + awake hypercapnia · daytime PaCO2 ≥45 · BiPAP first-line",
        nclexTags: pulmR14,
        definition: AttributedProse(
            "Triad — obesity (BMI ≥30) + chronic awake hypercapnia (PaCO2 ≥45 mmHg) + sleep-disordered breathing (90% have OSA) — without other cause of hypoventilation. Higher mortality than obesity alone or OSA alone; many initially identified during ICU admission per primary source.",
            citationIDs: ["openrn_dx_round14", "specialty_dx_round14"]
        ),
        pathophysiology: AttributedProse(
            "Obesity-related restrictive lung physiology + impaired ventilatory drive + sleep-disordered breathing → chronic hypoventilation, hypoxemia, hypercapnia, secondary erythrocytosis, pulmonary HTN, right HF.",
            citationIDs: ["openrn_dx_round14"]
        ),
        presentation: [
            AttributedBullet("Daytime sleepiness, fatigue, morning headache, dyspnea on exertion.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Witnessed apneas / loud snoring (OSA).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("BMI ≥30 (often ≥40); waist circumference markedly elevated.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Cyanosis, plethora (erythrocytosis), peripheral edema (right HF).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Can present as acute hypercapnic respiratory failure during illness or sedation.", citationIDs: ["openrn_dx_round14"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Awake ABG — PaCO2 ≥45 mmHg + BMI ≥30; rule out other causes of hypoventilation per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Polysomnography to characterize OSA + CO2 monitoring.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Echo for pulmonary HTN; CBC for erythrocytosis; PFTs to rule out COPD.", citationIDs: ["openrn_dx_round14"])
        ],
        priorityAssessments: [
            AttributedBullet("Pre-op anesthesia consultation — high-risk for sedation-induced respiratory failure.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Sleep study; OSA severity (AHI).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pulmonary HTN screen; right HF signs.", citationIDs: ["openrn_dx_round14"])
        ],
        commonInterventions: [
            AttributedBullet("BiPAP (NIV) — first-line; improves sleep + daytime hypercapnia + survival per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("CPAP — alternative if predominantly OSA + minimal hypoventilation; titrated per sleep study.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("WEIGHT LOSS — single most important; behavioral + pharmacotherapy (GLP-1, tirzepatide) + bariatric surgery — definitive per primary source.", citationIDs: ["specialty_dx_round14"]),
            AttributedBullet("Supplemental oxygen — adjunct if hypoxemia persists after NIV (target SpO2 88–92% in chronic hypercapnia).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Avoid sedatives (opioids, benzos, sleep aids) — worsen hypoventilation.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Treat pulmonary HTN, right HF, polycythemia (phlebotomy if Hct >55).", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Pre-op planning — postoperative monitoring + early NIV; AVOID early extubation in OHS without NIV bridging per primary source.", citationIDs: ["openrn_dx_round14"])
        ],
        watchFor: [
            AttributedBullet("ACUTE-ON-CHRONIC HYPERCAPNIC RESPIRATORY FAILURE — illness / surgery; emergent BiPAP + reduced FiO2 (target SpO2 88–92%) per primary source.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("OXYGEN-INDUCED CO2 RETENTION — high-flow O2 in chronic hypercapnia removes hypoxic drive; titrate.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("PERIOPERATIVE DEATH — anesthesia-related; bariatric / sleep-medicine specialty pre-op.", citationIDs: ["openrn_dx_round14"]),
            AttributedBullet("Right HF / cor pulmonale — diuretics + NIV; persistent pulmonary HTN warrants further workup.", citationIDs: ["openrn_dx_round14"])
        ],
        citations: [openrnDxR14, specialtyDxR14],
        lastSourceFidelityReview: "2026-05-04"
    )
}
