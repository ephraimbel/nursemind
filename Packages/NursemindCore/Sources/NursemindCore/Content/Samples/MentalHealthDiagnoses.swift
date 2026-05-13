import Foundation

// Curator-model mental health diagnosis entries (v1.5 expansion).
// Sources: Open RN Mental Health Nursing (CC BY 4.0), OpenStax Psychology (CC BY 4.0
// display), CDC behavioral health (public domain), DSM-5-TR / APA / SAMHSA / CSAT
// concept citations only.

private let openrnMH = CitationSource(
    id: "openrn_mh",
    shortName: "Open RN Mental Health Nursing",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingmhcc/?s=depression+anxiety+psychosis+mood",
    lastRetrieved: "2026-05-04"
)
private let cdcMH = CitationSource(
    id: "cdc_mh",
    shortName: "CDC Mental Health and Suicide Prevention guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/mentalhealth/",
    lastRetrieved: "2026-05-04"
)
private let dsmConcept = CitationSource(
    id: "dsm_concept",
    shortName: "DSM-5-TR diagnostic criteria (concept citation only — text not reproduced)",
    publisher: "American Psychiatric Association",
    license: .factCitationOnly,
    url: "https://www.psychiatry.org/psychiatrists/practice/dsm",
    lastRetrieved: "2026-05-04"
)
private let samhsaConcept = CitationSource(
    id: "samhsa_concept",
    shortName: "SAMHSA Treatment Improvement Protocols (concept citation)",
    publisher: "Substance Abuse and Mental Health Services Administration",
    license: .factCitationOnly,
    url: "https://www.samhsa.gov/find-help/national-helpline",
    lastRetrieved: "2026-05-04"
)
private let cssrsConcept = CitationSource(
    id: "cssrs_concept",
    shortName: "Columbia-Suicide Severity Rating Scale (concept citation)",
    publisher: "Columbia Lighthouse Project",
    license: .factCitationOnly,
    url: "https://cssrs.columbia.edu/",
    lastRetrieved: "2026-05-04"
)

private let psychDxTags = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood)
private let psychSafetyTags = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety)
private let cognitionTags = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .cognition)

// MARK: - Major Depressive Disorder

public enum MajorDepressionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "major-depression",
        title: "Major Depressive Disorder (MDD)",
        subtitle: "Persistent depressed mood + functional impairment ≥2 weeks",
        nclexTags: psychDxTags,
        definition: AttributedProse(
            "Mood disorder characterized by ≥2 weeks of persistently depressed mood and/or anhedonia plus additional symptoms causing clinically significant impairment. Lifetime prevalence ~17%; leading cause of disability worldwide.",
            citationIDs: ["openrn_mh", "dsm_concept"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — genetic vulnerability, monoamine neurotransmitter dysregulation (serotonin, norepinephrine, dopamine), HPA axis dysregulation with elevated cortisol, neuroplasticity changes (reduced hippocampal volume), psychosocial stressors, medical contributors (hypothyroidism, vitamin D deficiency, chronic illness).",
            citationIDs: ["openrn_mh"]
        ),
        presentation: [
            AttributedBullet("DSM-5 requires ≥5 of 9 symptoms ≥2 weeks, including either depressed mood OR anhedonia (use SIG E CAPS or DEPRESSED mnemonic).", citationIDs: ["dsm_concept"]),
            AttributedBullet("Depressed mood most of the day, nearly every day.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Anhedonia — markedly diminished interest/pleasure.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Significant weight change or appetite change.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Insomnia or hypersomnia nearly every day.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Psychomotor agitation or retardation.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Fatigue or loss of energy.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Feelings of worthlessness or excessive/inappropriate guilt.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Diminished concentration or decisiveness.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Recurrent thoughts of death, suicidal ideation, plan, or attempt.", citationIDs: ["dsm_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5: ≥5 symptoms (above) ≥2 weeks, with at least one being depressed mood OR anhedonia.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Functional impairment in social, occupational, or other important areas.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Not attributable to substance, medical condition, or another psychiatric disorder.", citationIDs: ["dsm_concept"]),
            AttributedBullet("PHQ-9 commonly used for screening and severity tracking; ≥10 suggests moderate depression.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Rule out medical mimics: hypothyroidism (TSH), B12 deficiency, anemia, vitamin D, drug-induced (steroids, beta-blockers, interferon).", citationIDs: ["openrn_mh"])
        ],
        priorityAssessments: [
            AttributedBullet("Suicide risk assessment EVERY ENCOUNTER — direct, non-judgmental questioning (Columbia-Suicide Severity Rating Scale).", citationIDs: ["openrn_mh", "cssrs_concept"]),
            AttributedBullet("Functional status — work, school, relationships, ADLs, hygiene.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use — comorbid alcohol/opioid use very common; screen with AUDIT-C, single-question opioid screen.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Sleep quality, appetite/weight, energy, concentration, psychomotor activity.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Hopelessness — strong predictor of suicide risk; document directly.", citationIDs: ["openrn_mh"])
        ],
        commonInterventions: [
            AttributedBullet("Mild–moderate: psychotherapy first-line (CBT, IPT) OR antidepressant; equally effective.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Moderate–severe: combination psychotherapy + antidepressant.", citationIDs: ["openrn_mh"]),
            AttributedBullet("First-line antidepressants: SSRIs (sertraline, escitalopram, fluoxetine), SNRIs (venlafaxine, duloxetine), bupropion, mirtazapine. Choose based on side-effect profile and patient factors.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Counsel that antidepressant effect takes 2–6 weeks; energy/sleep often improve before mood (raises near-term suicide risk during initiation).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Continue antidepressant ≥6–9 months after first remission; longer for recurrent.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Severe / refractory / catatonic / psychotic: ECT effective and underused; ketamine/esketamine for treatment-resistant.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Lifestyle — exercise (effect size comparable to mild antidepressant), sleep hygiene, light therapy for seasonal pattern, social engagement.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Active suicidal ideation with plan/intent → safety plan, remove means, hospitalize voluntarily; involuntary commitment if imminent risk and patient refuses.", citationIDs: ["openrn_mh"])
        ],
        watchFor: [
            AttributedBullet("Suicide — leading cause of death in MDD; risk factors: prior attempts, family history, hopelessness, substance use, access to means, recent loss, hospital discharge first 30 days.", citationIDs: ["openrn_mh", "cssrs_concept"]),
            AttributedBullet("Antidepressant black-box warning: increased suicidality in patients <25, especially first weeks after initiation or dose change. Closer monitoring during this window.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Switch to bipolar — antidepressant in undiagnosed bipolar can precipitate mania; ask about prior elevated/irritable mood.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Serotonin syndrome with combined serotonergic agents.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Discontinuation syndrome with abrupt stop of SSRIs/SNRIs (especially short half-life: paroxetine, venlafaxine).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Postpartum, perimenopausal, geriatric depression have specific considerations.", citationIDs: ["openrn_mh"])
        ],
        citations: [openrnMH, dsmConcept, cssrsConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bipolar Disorder

public enum BipolarDisorderSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bipolar-disorder",
        title: "Bipolar Disorder",
        subtitle: "Recurrent episodes of mania or hypomania alternating with depression",
        nclexTags: psychDxTags,
        definition: AttributedProse(
            "Mood disorder characterized by episodes of mania (Bipolar I), hypomania (Bipolar II), or mixed features, typically alternating with depressive episodes. Lifetime prevalence ~2.8%. Average age of onset late teens to early 20s. Highly heritable.",
            citationIDs: ["openrn_mh", "dsm_concept"]
        ),
        pathophysiology: AttributedProse(
            "Strong genetic component (heritability ~60–80%); dysregulation of monoamines, glutamate, GABA; circadian rhythm dysregulation; structural and functional brain differences. Triggers include sleep disruption, substance use, antidepressant exposure, stress.",
            citationIDs: ["openrn_mh"]
        ),
        presentation: [
            AttributedBullet("MANIC EPISODE (Bipolar I): ≥1 week of elevated/expansive/irritable mood + ↑ goal-directed activity, requiring hospitalization or causing marked impairment/psychotic features.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Mania symptoms (DIG FAST mnemonic): Distractibility, Insomnia (decreased need for sleep), Grandiosity, Flight of ideas/racing thoughts, Activity (↑ goal-directed), Speech (pressured), Thoughtlessness/risk-taking (spending sprees, hypersexuality, substance use).", citationIDs: ["openrn_mh"]),
            AttributedBullet("HYPOMANIC EPISODE (Bipolar II): ≥4 days of similar symptoms but less severe; observable change but NOT causing marked impairment, hospitalization, or psychosis.", citationIDs: ["dsm_concept"]),
            AttributedBullet("DEPRESSIVE EPISODE: same criteria as MDD.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Mixed features: depressive episode with concurrent manic symptoms (or vice versa) — high suicide risk.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Psychosis can occur during severe mania or depression.", citationIDs: ["openrn_mh"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Bipolar I: at least one MANIC episode (depressive episodes common but not required).", citationIDs: ["dsm_concept"]),
            AttributedBullet("Bipolar II: at least one HYPOMANIC episode AND at least one MAJOR DEPRESSIVE episode (no mania).", citationIDs: ["dsm_concept"]),
            AttributedBullet("Cyclothymic disorder: ≥2 years of subthreshold hypomanic and depressive symptoms.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Mood Disorder Questionnaire (MDQ) is a validated screen.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Always screen depressed patients for prior mania/hypomania — antidepressant alone in undiagnosed bipolar can precipitate mania or rapid cycling.", citationIDs: ["openrn_mh"])
        ],
        priorityAssessments: [
            AttributedBullet("Suicide risk — high lifetime risk (~15× general population), especially during depressive and mixed episodes.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Sleep — both trigger and symptom; assess and protect.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Risk-taking behaviors during mania — spending, sexual, substance, driving; protect patient and finances.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use — comorbidity ~50%; screen and address.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Medication adherence — central to maintenance; assess barriers, side effects, insight.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Functional impairment — work, relationships, finances, legal.", citationIDs: ["openrn_mh"])
        ],
        commonInterventions: [
            AttributedBullet("MOOD STABILIZERS (lithium, valproate, lamotrigine, carbamazepine) — foundation of treatment.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Lithium: gold standard; specifically reduces suicide risk; therapeutic monitoring required.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Valproate: rapid effect for acute mania; teratogenic — avoid in patients of reproductive potential without effective contraception.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Lamotrigine: best for bipolar depression maintenance; titrate slowly to avoid SJS.", citationIDs: ["openrn_mh"]),
            AttributedBullet("ATYPICAL ANTIPSYCHOTICS (olanzapine, quetiapine, risperidone, aripiprazole, lurasidone) — acute mania, mixed states, maintenance, and bipolar depression (quetiapine, lurasidone, olanzapine-fluoxetine).", citationIDs: ["openrn_mh"]),
            AttributedBullet("ANTIDEPRESSANTS — controversial; only with mood stabilizer cover; risk of cycling/mania induction.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Acute mania: hospitalize for safety, sleep restoration, rapid mood stabilization (often combination); restraint as last resort.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Psychotherapy: psychoeducation, CBT, family-focused therapy, interpersonal/social rhythm therapy.", citationIDs: ["openrn_mh"]),
            AttributedBullet("ECT for severe refractory mania, depression, mixed states, or pregnancy.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Lifelong treatment — discontinuation precipitates relapse.", citationIDs: ["openrn_mh"])
        ],
        watchFor: [
            AttributedBullet("Suicide — peak risk in mixed and depressive episodes; lithium reduces risk.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Lithium toxicity — narrow therapeutic window; dehydration, NSAIDs, ACEi raise levels.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Valproate teratogenicity — neural tube defects; pregnancy avoidance/effective contraception.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Lamotrigine SJS/TEN — slow titration prevents.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Atypical antipsychotic metabolic effects — weight, glucose, lipids; monitor.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use comorbidity worsens course; integrated treatment.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Cognitive impairment can persist between episodes.", citationIDs: ["openrn_mh"])
        ],
        citations: [openrnMH, dsmConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Schizophrenia

public enum SchizophreniaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "schizophrenia",
        title: "Schizophrenia",
        subtitle: "Chronic psychotic disorder · positive + negative + cognitive symptoms",
        nclexTags: psychDxTags,
        definition: AttributedProse(
            "Chronic psychotic disorder characterized by ≥6 months of disturbance including ≥1 month of active-phase symptoms (delusions, hallucinations, disorganized speech, grossly disorganized/catatonic behavior, OR negative symptoms). Lifetime prevalence ~1%. Onset typically late teens to early 30s.",
            citationIDs: ["openrn_mh", "dsm_concept"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — strong genetic component, dopamine hyperactivity in mesolimbic pathway (positive symptoms), dopamine hypoactivity in mesocortical (negative/cognitive), glutamate dysregulation, structural brain changes (reduced gray matter, enlarged ventricles), neurodevelopmental factors, environmental triggers (cannabis use in adolescence, urban birth, prenatal infection).",
            citationIDs: ["openrn_mh"]
        ),
        presentation: [
            AttributedBullet("POSITIVE SYMPTOMS: hallucinations (auditory most common), delusions (paranoid most common), disorganized speech (loose associations, neologisms), bizarre behavior, catatonia.", citationIDs: ["openrn_mh"]),
            AttributedBullet("NEGATIVE SYMPTOMS (5 A's): Affect (flat or blunted), Alogia (poverty of speech), Anhedonia, Avolition (lack of motivation), Asociality.", citationIDs: ["openrn_mh"]),
            AttributedBullet("COGNITIVE SYMPTOMS: impaired attention, working memory, executive function — often most disabling.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Functional decline — work, school, relationships, self-care.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Lack of insight (anosognosia) is common.", citationIDs: ["openrn_mh"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5: ≥2 of (delusions, hallucinations, disorganized speech, disorganized/catatonic behavior, negative symptoms) for ≥1 month, with at least one being delusions, hallucinations, or disorganized speech.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Total disturbance ≥6 months (including prodromal/residual symptoms).", citationIDs: ["dsm_concept"]),
            AttributedBullet("Functional impairment in work, relationships, or self-care.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Not better explained by mood disorder with psychosis, substance, or medical condition.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Differential: schizoaffective disorder (mood + psychotic symptoms with psychotic-only periods), brief psychotic disorder, schizophreniform disorder (1–6 months), substance-induced psychosis, mood disorder with psychotic features, delusional disorder.", citationIDs: ["openrn_mh"])
        ],
        priorityAssessments: [
            AttributedBullet("Safety — command hallucinations, paranoid delusions, suicide risk (high), homicide risk if active paranoia.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Reality testing, content of hallucinations/delusions.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Insight and judgment.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Medication adherence — central problem; long-acting injectables for non-adherent.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use — comorbid in 50%; complicates symptoms and treatment.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Metabolic monitoring — atypical antipsychotics cause weight gain, hyperglycemia, dyslipidemia (baseline + ongoing).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Functional status — housing, finances, employment, social support.", citationIDs: ["openrn_mh"])
        ],
        commonInterventions: [
            AttributedBullet("ANTIPSYCHOTICS — first- or second-generation; second-generation (atypical) generally first-line due to lower EPS risk.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Clozapine for treatment-resistant schizophrenia; only antipsychotic shown to reduce suicide; requires REMS due to agranulocytosis risk (weekly CBC × 6 months, then less frequent).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Long-acting injectables (LAIs) — paliperidone, aripiprazole, risperidone, haloperidol decanoate — for non-adherence.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Acute psychotic episode: hospitalize, antipsychotic ± benzodiazepine for agitation; quiet environment, low stimulation.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Psychosocial: assertive community treatment (ACT), cognitive remediation, supported employment, family psychoeducation, social skills training.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Communicate clearly and concretely; do not argue with delusions; acknowledge feelings without confirming content.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Address comorbid substance use, depression, medical conditions (cardiovascular disease shortens life expectancy by ~15–25 years).", citationIDs: ["openrn_mh"])
        ],
        watchFor: [
            AttributedBullet("Suicide — lifetime risk 5–10%; highest early in illness, post-discharge, with depression.", citationIDs: ["openrn_mh"]),
            AttributedBullet("NEUROLEPTIC MALIGNANT SYNDROME (NMS) — fever, rigidity, AMS, autonomic instability; medical emergency.", citationIDs: ["openrn_mh"]),
            AttributedBullet("EXTRAPYRAMIDAL SYMPTOMS — acute dystonia, akathisia, parkinsonism (treat with anticholinergic), tardive dyskinesia (often irreversible).", citationIDs: ["openrn_mh"]),
            AttributedBullet("METABOLIC SYNDROME — atypical antipsychotics; monitor and treat.", citationIDs: ["openrn_mh"]),
            AttributedBullet("AGRANULOCYTOSIS with clozapine — life-threatening; weekly CBC monitoring required.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Cardiovascular disease, smoking, diabetes — major drivers of premature mortality.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use — cannabis, stimulants worsen psychosis.", citationIDs: ["openrn_mh"])
        ],
        citations: [openrnMH, dsmConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Generalized Anxiety Disorder

public enum GADSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "generalized-anxiety-disorder",
        title: "Generalized Anxiety Disorder (GAD)",
        subtitle: "Excessive uncontrollable worry ≥6 months",
        nclexTags: psychDxTags,
        definition: AttributedProse(
            "Persistent, excessive, and difficult-to-control worry about multiple events/activities for ≥6 months, with associated physical and cognitive symptoms causing significant impairment. Lifetime prevalence ~5–7%.",
            citationIDs: ["openrn_mh", "dsm_concept"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — genetic vulnerability, dysregulated GABA/serotonin/norepinephrine systems, hyperactive amygdala, reduced prefrontal modulation, learned threat/avoidance patterns.",
            citationIDs: ["openrn_mh"]
        ),
        presentation: [
            AttributedBullet("Excessive, persistent worry across multiple domains (work, family, health, finances).", citationIDs: ["dsm_concept"]),
            AttributedBullet("Difficulty controlling the worry.", citationIDs: ["dsm_concept"]),
            AttributedBullet("≥3 of 6 physical symptoms: restlessness, fatigue, concentration difficulty, irritability, muscle tension, sleep disturbance.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Causes significant distress or functional impairment.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Often comorbid with depression, other anxiety disorders, substance use.", citationIDs: ["openrn_mh"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5: persistent excessive anxiety/worry about multiple events ≥6 months, difficult to control, with ≥3 physical symptoms (1 in children), causing impairment, not due to substance/medical condition.", citationIDs: ["dsm_concept"]),
            AttributedBullet("GAD-7 questionnaire — validated screening tool; ≥10 = moderate, ≥15 = severe.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Rule out medical mimics: hyperthyroidism (TSH), pheochromocytoma, cardiac arrhythmia, substance (caffeine, stimulants, withdrawal).", citationIDs: ["openrn_mh"])
        ],
        priorityAssessments: [
            AttributedBullet("Suicide risk — anxiety disorders increase risk.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use — alcohol, benzodiazepines often used for self-medication.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Functional impact — work, relationships, sleep, physical health.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Comorbid depression — frequent.", citationIDs: ["openrn_mh"])
        ],
        commonInterventions: [
            AttributedBullet("First-line: COGNITIVE BEHAVIORAL THERAPY (CBT) — particularly effective; equal or superior to medication.", citationIDs: ["openrn_mh"]),
            AttributedBullet("First-line medications: SSRIs (escitalopram, sertraline, paroxetine) and SNRIs (venlafaxine, duloxetine).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Buspirone — non-addictive option; takes 2–4 weeks for effect.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Benzodiazepines — short-term bridge only; high risk of dependence; avoid long-term.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Hydroxyzine — non-addictive PRN option.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Lifestyle: regular exercise (significant anxiolytic effect), sleep hygiene, caffeine reduction, mindfulness/relaxation training, limit alcohol.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Combination of CBT + medication for severe disease.", citationIDs: ["openrn_mh"])
        ],
        watchFor: [
            AttributedBullet("Comorbid depression and substance use.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Benzodiazepine dependence — high; avoid initiation unless time-limited specific use.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Cardiovascular morbidity from chronic stress.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Worry can transition into other anxiety disorders or depression.", citationIDs: ["openrn_mh"])
        ],
        citations: [openrnMH, dsmConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Panic Disorder

public enum PanicDisorderSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "panic-disorder",
        title: "Panic Disorder",
        subtitle: "Recurrent unexpected panic attacks + persistent anticipatory worry",
        nclexTags: psychDxTags,
        definition: AttributedProse(
            "Recurrent unexpected panic attacks plus ≥1 month of persistent worry about additional attacks or maladaptive behavior change (e.g., avoidance). Lifetime prevalence ~5%. Often complicated by agoraphobia.",
            citationIDs: ["openrn_mh", "dsm_concept"]
        ),
        pathophysiology: AttributedProse(
            "Hyperactivation of the locus coeruleus, amygdala-mediated false alarm response, impaired prefrontal regulation. Genetic vulnerability, chronic stress, prior trauma. Caffeine, stimulants, lactate infusion can provoke.",
            citationIDs: ["openrn_mh"]
        ),
        presentation: [
            AttributedBullet("Sudden surge of intense fear or discomfort peaking within minutes.", citationIDs: ["dsm_concept"]),
            AttributedBullet("≥4 of 13 symptoms: palpitations/tachycardia, sweating, trembling, dyspnea, choking, chest pain, nausea, dizziness, chills/heat, paresthesias, derealization/depersonalization, fear of losing control/going crazy, fear of dying.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Often presents to ED with cardiac/dyspnea complaints — workup for cardiac, PE, hyperthyroid first.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Anticipatory anxiety between attacks; behavioral changes to avoid attacks (avoidance).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Agoraphobia: fear/avoidance of situations where escape may be difficult (open spaces, crowds, public transport, being alone) — develops in many with panic disorder.", citationIDs: ["openrn_mh"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5: recurrent unexpected panic attacks + ≥1 month of either persistent worry about more attacks OR maladaptive behavior change.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Not attributable to substance, medical condition, or another mental disorder.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Rule out: MI, PE, arrhythmia, hyperthyroidism, pheochromocytoma, hypoglycemia, substance intoxication/withdrawal.", citationIDs: ["openrn_mh"])
        ],
        priorityAssessments: [
            AttributedBullet("Cardiac/respiratory workup as appropriate, especially first presentation.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Suicide risk — increased.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Functional impairment, agoraphobic avoidance, work/relationship impact.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use — alcohol/benzodiazepine self-medication common.", citationIDs: ["openrn_mh"])
        ],
        commonInterventions: [
            AttributedBullet("CBT (specifically panic-focused with interoceptive exposure) — first-line, highly effective.", citationIDs: ["openrn_mh"]),
            AttributedBullet("SSRIs (sertraline, paroxetine, escitalopram) and SNRIs (venlafaxine) — first-line medications; start LOW (worsen anxiety initially), titrate slowly.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Benzodiazepines — short-term bridge during SSRI titration; avoid long-term due to dependence and tolerance.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Acute panic attack: stay with patient, calm voice, slow breathing, ground (5-4-3-2-1 sensory), reassure attack will pass.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Avoid stimulants and caffeine.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Treat agoraphobia with exposure therapy.", citationIDs: ["openrn_mh"])
        ],
        watchFor: [
            AttributedBullet("Suicide risk — especially with comorbid depression.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Benzodiazepine dependence.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Agoraphobia — significant disability if untreated.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Repeated ED visits without cardiac findings — high cost; recognize and treat.", citationIDs: ["openrn_mh"])
        ],
        citations: [openrnMH, dsmConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - PTSD

public enum PTSDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ptsd",
        title: "Post-Traumatic Stress Disorder (PTSD)",
        subtitle: "Symptoms ≥1 month after exposure to traumatic event(s)",
        nclexTags: psychDxTags,
        definition: AttributedProse(
            "Disorder developing after exposure to actual or threatened death, serious injury, or sexual violence (directly, witnessed, or learned about in close family/friend). Symptoms last ≥1 month and cause significant impairment. Lifetime prevalence ~6–8%.",
            citationIDs: ["openrn_mh", "dsm_concept"]
        ),
        pathophysiology: AttributedProse(
            "Dysregulated fear circuitry — hyperactive amygdala, impaired hippocampal contextualization, reduced prefrontal regulation. HPA axis dysregulation. Genetic vulnerability + trauma severity + lack of social support increase risk.",
            citationIDs: ["openrn_mh"]
        ),
        presentation: [
            AttributedBullet("Four symptom clusters: INTRUSION, AVOIDANCE, NEGATIVE COGNITIONS/MOOD, AROUSAL/REACTIVITY.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Intrusion: recurrent involuntary memories, nightmares, flashbacks, intense distress to cues.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Avoidance: of trauma reminders, internal (thoughts) or external (places, people, activities).", citationIDs: ["dsm_concept"]),
            AttributedBullet("Negative cognitions/mood: distorted blame, persistent negative emotions, anhedonia, detachment, inability to recall key aspects.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Arousal: hypervigilance, exaggerated startle, irritability/anger, recklessness, sleep disturbance, concentration impairment.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Dissociation common in some patients.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Comorbid depression, substance use, suicide risk all elevated.", citationIDs: ["openrn_mh"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5: trauma exposure + ≥1 intrusion + ≥1 avoidance + ≥2 negative cognition/mood + ≥2 arousal symptoms ≥1 month, causing impairment.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Acute Stress Disorder = similar symptoms 3 days–1 month post-trauma.", citationIDs: ["dsm_concept"]),
            AttributedBullet("PCL-5 questionnaire and CAPS-5 interview for screening/severity.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Special populations: combat veterans, sexual assault survivors, refugees, accident survivors, intimate partner violence, complex trauma (childhood abuse).", citationIDs: ["openrn_mh"])
        ],
        priorityAssessments: [
            AttributedBullet("Suicide risk — significantly elevated.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use, alcohol — high comorbidity (~50%).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Safety from ongoing trauma (IPV, abuse) — current safety must be addressed first.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Sleep, irritability/anger expression — relational and occupational impact.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Triggers in clinical environment — pelvic exam, restraints, certain procedures may retraumatize; trauma-informed care.", citationIDs: ["openrn_mh"])
        ],
        commonInterventions: [
            AttributedBullet("First-line PSYCHOTHERAPY: trauma-focused CBT, prolonged exposure (PE), cognitive processing therapy (CPT), eye movement desensitization and reprocessing (EMDR).", citationIDs: ["openrn_mh"]),
            AttributedBullet("First-line medications: SSRIs (sertraline and paroxetine FDA-approved) and SNRI (venlafaxine).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Prazosin for trauma-related nightmares.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Avoid benzodiazepines — worsen PTSD outcomes long-term.", citationIDs: ["openrn_mh"]),
            AttributedBullet("MDMA-assisted therapy in research/late-stage approval pathway.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Trauma-informed care in all healthcare settings — explain procedures, give control, allow companion, screen for trauma history.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Treat comorbid substance use, depression, sleep.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Veteran-specific resources (VA, Vets4Warriors); IPV resources (national hotlines); sexual assault resources (RAINN).", citationIDs: ["openrn_mh"])
        ],
        watchFor: [
            AttributedBullet("Suicide — significantly increased risk; assess at every encounter.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use disorder — common; integrated treatment.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Reactivation of trauma during medical procedures — pelvic exams, intubation, restraint; trauma-informed adaptations.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Complex PTSD — persistent disturbances in self-organization, relationships; complex presentation requires longer-term care.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Cardiovascular morbidity — chronic stress; treat conventional risk factors.", citationIDs: ["openrn_mh"])
        ],
        citations: [openrnMH, dsmConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - OCD

public enum OCDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ocd",
        title: "Obsessive-Compulsive Disorder (OCD)",
        subtitle: "Recurrent obsessions + time-consuming compulsions",
        nclexTags: psychDxTags,
        definition: AttributedProse(
            "Disorder characterized by recurrent unwanted intrusive thoughts (obsessions) and/or repetitive behaviors or mental acts (compulsions) the person feels driven to perform, that are time-consuming (>1 hr/day) or cause significant distress/impairment. Lifetime prevalence ~2–3%.",
            citationIDs: ["openrn_mh", "dsm_concept"]
        ),
        pathophysiology: AttributedProse(
            "Dysfunction of cortico-striatal-thalamic-cortical circuit; serotonin and glutamate systems implicated; high heritability; PANDAS in pediatric cases (post-streptococcal autoimmune phenomenon).",
            citationIDs: ["openrn_mh"]
        ),
        presentation: [
            AttributedBullet("OBSESSIONS: intrusive, unwanted thoughts/images/urges (contamination, harm to self/others, symmetry, taboo themes, religious scrupulosity); patient typically recognizes as own thoughts and excessive.", citationIDs: ["dsm_concept"]),
            AttributedBullet("COMPULSIONS: repetitive behaviors (washing, checking, ordering) or mental acts (counting, praying, repeating) performed to reduce anxiety; usually not realistically connected to what they are intended to neutralize.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Time-consuming (>1 hr/day) or causing significant impairment.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Insight ranges from good to poor (with poor insight specifier) to absent/delusional.", citationIDs: ["dsm_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5: obsessions, compulsions, or both that are time-consuming (>1 hr/day) or cause distress/impairment.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Not better explained by substance, medical condition, or another mental disorder.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Yale-Brown Obsessive-Compulsive Scale (Y-BOCS) for severity assessment.", citationIDs: ["openrn_mh"])
        ],
        priorityAssessments: [
            AttributedBullet("Functional impact — time spent, work/school/relationship effects.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Suicide risk — elevated, especially if untreated.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Comorbidity — depression, anxiety disorders, tic disorders, autism.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Skin breakdown from compulsive washing.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Impact on family — accommodation by family members reinforces; assess and address.", citationIDs: ["openrn_mh"])
        ],
        commonInterventions: [
            AttributedBullet("First-line PSYCHOTHERAPY: exposure and response prevention (ERP) — most effective treatment; therapist-guided graduated exposure to feared stimulus while preventing compulsion.", citationIDs: ["openrn_mh"]),
            AttributedBullet("First-line medications: SSRIs at HIGHER doses than for depression (fluoxetine 60–80 mg, sertraline 200 mg, fluvoxamine, paroxetine).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Clomipramine (TCA) — effective but more side effects.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Augmentation with antipsychotic (low-dose risperidone or aripiprazole) for partial response.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Severe refractory: deep brain stimulation, transcranial magnetic stimulation.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Family education — do NOT participate in or accommodate compulsions.", citationIDs: ["openrn_mh"])
        ],
        watchFor: [
            AttributedBullet("Skin breakdown from washing; consequences of avoidance.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Comorbid depression and suicide risk.", citationIDs: ["openrn_mh"]),
            AttributedBullet("OCD spectrum: body dysmorphic disorder, hoarding disorder, trichotillomania, excoriation, hypochondriasis.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Pediatric-onset OCD with sudden severe onset post-strep — consider PANDAS evaluation.", citationIDs: ["openrn_mh"])
        ],
        citations: [openrnMH, dsmConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Anorexia Nervosa

public enum AnorexiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "anorexia-nervosa",
        title: "Anorexia Nervosa",
        subtitle: "Energy restriction · low weight · intense fear of weight gain · body image disturbance",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition),
        definition: AttributedProse(
            "Eating disorder characterized by restriction of energy intake leading to significantly low body weight, intense fear of weight gain, and disturbance in self-perceived weight/shape. Highest mortality of any psychiatric disorder (~5–10%) — from medical complications and suicide.",
            citationIDs: ["openrn_mh", "dsm_concept"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — genetic vulnerability, neurobiological factors (altered serotonin, reward circuitry), psychological (perfectionism, anxiety, trauma), sociocultural (thin ideal, weight stigma). Restriction self-reinforces via cognitive narrowing.",
            citationIDs: ["openrn_mh"]
        ),
        presentation: [
            AttributedBullet("Restriction of energy intake → significantly low body weight (BMI <18.5 in adults; <fifth percentile in pediatrics).", citationIDs: ["dsm_concept"]),
            AttributedBullet("Intense fear of gaining weight or becoming fat OR persistent behavior interfering with weight gain.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Disturbed body-shape perception, undue influence of body weight on self-evaluation, or denial of seriousness of low weight.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Restricting type vs binge-eating/purging type.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Physical: amenorrhea (in those who menstruate), bradycardia, hypotension, hypothermia, lanugo, dry skin, brittle nails, peripheral edema, dental erosion (purging), parotid enlargement (purging), Russell sign (calluses on knuckles from self-induced vomiting).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Psychological: rigid thinking, perfectionism, social withdrawal, mood disturbance, obsessive ritualistic eating behaviors.", citationIDs: ["openrn_mh"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5: energy restriction → significantly low body weight + intense fear of weight gain + body-image disturbance.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Severity by BMI: mild ≥17, moderate 16–16.99, severe 15–15.99, extreme <15.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Workup: BMP, magnesium, phosphorus, LFTs, CBC, ECG, DEXA scan if prolonged, β-hCG.", citationIDs: ["openrn_mh"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — bradycardia (<40), hypotension, hypothermia, orthostasis are admission criteria.", citationIDs: ["openrn_mh"]),
            AttributedBullet("ECG — QT prolongation, arrhythmias.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Electrolytes — refeeding risk; baseline K, Mg, phos.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Suicide risk — high (especially with comorbid depression).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Behavioral observation — meals supervised, post-meal observation 30–60 min to prevent purging.", citationIDs: ["openrn_mh"])
        ],
        commonInterventions: [
            AttributedBullet("MEDICAL STABILIZATION first — admission criteria include severe bradycardia, hypotension, electrolyte derangement, ECG changes, BMI <15 or rapid weight loss.", citationIDs: ["openrn_mh"]),
            AttributedBullet("REFEEDING — start LOW (e.g., 1200 kcal/day) and advance slowly to prevent refeeding syndrome.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Replete K, Mg, PHOSPHORUS, thiamine BEFORE refeeding; recheck daily during early refeeding.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Daily weights (face away from scale per patient preference; consistent timing).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Supervised meals, scheduled times, observation post-meal.", citationIDs: ["openrn_mh"]),
            AttributedBullet("PSYCHOTHERAPY: family-based therapy (Maudsley, FBT) is first-line for adolescents; CBT-E for adults; specialist eating disorder treatment.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Medications LIMITED role — no medication restores weight; SSRIs do not work in malnourished state.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Multidisciplinary team — medical, psychiatric, dietitian, family.", citationIDs: ["openrn_mh"])
        ],
        watchFor: [
            AttributedBullet("REFEEDING SYNDROME — hypoPHOSPHATEMIA, hypoK, hypoMg, thiamine deficiency causing cardiac dysfunction, arrhythmia, congestive failure, neurologic injury, death; slow refeeding + electrolyte repletion is prevention.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Cardiac arrhythmia (QT prolongation, bradycardia) — leading cause of medical death.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Suicide — second leading cause of death.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Osteoporosis — irreversible bone loss; DEXA, calcium/vitamin D, weight restoration only proven treatment.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Compensatory behaviors (purging, exercise, laxative misuse) — assess and supervise.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Crossover to bulimia or binge eating disorder is common.", citationIDs: ["openrn_mh"])
        ],
        citations: [openrnMH, dsmConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bulimia Nervosa

public enum BulimiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bulimia-nervosa",
        title: "Bulimia Nervosa",
        subtitle: "Recurrent binge eating + inappropriate compensatory behaviors",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition),
        definition: AttributedProse(
            "Eating disorder characterized by recurrent episodes of binge eating accompanied by inappropriate compensatory behaviors (vomiting, laxatives, diuretics, fasting, excessive exercise) ≥1×/week for ≥3 months. Body weight typically normal range, distinguishing from anorexia.",
            citationIDs: ["openrn_mh", "dsm_concept"]
        ),
        pathophysiology: AttributedProse(
            "Similar multifactorial etiology to anorexia. Binge-purge cycle is self-reinforcing; serotonergic dysregulation; impulsivity often elevated.",
            citationIDs: ["openrn_mh"]
        ),
        presentation: [
            AttributedBullet("Binge eating: large amount of food in discrete period (e.g., <2 hr) with sense of loss of control.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Compensatory behaviors: self-induced vomiting, laxative/diuretic misuse, fasting, excessive exercise.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Both occur ≥1×/week ≥3 months.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Self-evaluation unduly influenced by body shape/weight.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Physical signs of purging: dental erosion (lingual), parotid enlargement, Russell sign (knuckle calluses), hypokalemia, hypochloremic metabolic alkalosis, esophageal tears.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Weight typically normal or overweight (in contrast to anorexia).", citationIDs: ["openrn_mh"]),
            AttributedBullet("High comorbid depression, anxiety, substance use, impulsivity.", citationIDs: ["openrn_mh"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5 criteria above; severity by frequency of compensatory episodes per week (mild 1–3, moderate 4–7, severe 8–13, extreme ≥14).", citationIDs: ["dsm_concept"]),
            AttributedBullet("Workup: BMP (hypoK, hypoCl, alkalosis), magnesium, ECG, dental exam.", citationIDs: ["openrn_mh"])
        ],
        priorityAssessments: [
            AttributedBullet("Electrolyte derangement — hypokalemic alkalosis from vomiting; cardiac risk.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Suicide risk — elevated; impulsivity often present.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use comorbidity.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Esophageal injury — Mallory-Weiss tears, dental erosion.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Pregnancy considerations — risks to fetus from electrolyte/nutrition.", citationIDs: ["openrn_mh"])
        ],
        commonInterventions: [
            AttributedBullet("CBT-E (enhanced CBT for eating disorders) is first-line and highly effective.", citationIDs: ["openrn_mh"]),
            AttributedBullet("FLUOXETINE is the only SSRI FDA-approved for bulimia (60 mg/day, higher than depression dose).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Avoid bupropion (lowers seizure threshold; contraindicated in bulimia).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Replete electrolytes; treat hypokalemic alkalosis with KCl.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Dental care; protective measures (rinse with water, NOT brushing immediately after vomiting).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Address comorbid depression, anxiety, substance use, trauma.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Medical hospitalization for severe electrolyte derangement, hemodynamic instability, suicidal ideation.", citationIDs: ["openrn_mh"])
        ],
        watchFor: [
            AttributedBullet("Hypokalemia → cardiac arrhythmia, sudden death.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Esophageal rupture (Boerhaave) — rare but lethal.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Suicide and self-injury.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use disorder comorbidity.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Bupropion contraindicated (seizure risk in purging patients).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Pregnancy — gestational complications and fetal risks.", citationIDs: ["openrn_mh"])
        ],
        citations: [openrnMH, dsmConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Substance Use Disorder

public enum SubstanceUseDisorderSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "substance-use-disorder",
        title: "Substance Use Disorder (SUD)",
        subtitle: "Pattern of use causing impairment · alcohol, opioids, stimulants, cannabis, etc.",
        nclexTags: psychSafetyTags,
        definition: AttributedProse(
            "DSM-5 diagnostic category encompassing alcohol use disorder, opioid use disorder, stimulant use disorder, cannabis use disorder, and others. Severity (mild/moderate/severe) graded by number of criteria met. Chronic, relapsing-remitting brain disorder, not moral failure.",
            citationIDs: ["openrn_mh", "dsm_concept", "samhsa_concept"]
        ),
        pathophysiology: AttributedProse(
            "Repeated use → neuroadaptation in mesolimbic reward circuits, especially nucleus accumbens; tolerance and physical dependence develop; prefrontal regulatory control weakens; cue-induced craving; vulnerability is genetic + developmental + environmental (ACE scores, mental health, social context).",
            citationIDs: ["openrn_mh"]
        ),
        presentation: [
            AttributedBullet("DSM-5 11 criteria across impaired control, social impairment, risky use, pharmacological (tolerance, withdrawal): ≥2 = SUD; 2–3 mild, 4–5 moderate, ≥6 severe.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Patterns vary by substance — alcohol, opioids, stimulants, sedatives, cannabis, hallucinogens, inhalants, tobacco/nicotine.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Common comorbidities: depression, anxiety, PTSD, personality disorders, other SUDs (polysubstance use).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Medical complications: hepatic disease (alcohol), HCV/HIV (IV use), endocarditis, cellulitis, abscess, overdose.", citationIDs: ["openrn_mh"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5 criteria — substance-specific.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Screening tools: AUDIT-C (alcohol), DAST-10 (drug), single-question opioid screen, CAGE.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Toxicology — urine drug screen (sensitivity varies; not definitive); alcohol level, GGT.", citationIDs: ["openrn_mh"])
        ],
        priorityAssessments: [
            AttributedBullet("Universal screening at every healthcare encounter (SBIRT model).", citationIDs: ["samhsa_concept"]),
            AttributedBullet("Withdrawal risk — alcohol/benzo (DTs, seizures, life-threatening), opioid (very uncomfortable but rarely fatal in adults), stimulant (depression, suicidality).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Suicide risk — significantly elevated.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Overdose risk and naloxone access — especially with opioid use.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Comorbid mental health, medical complications.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Social: housing, employment, legal, support system.", citationIDs: ["openrn_mh"])
        ],
        commonInterventions: [
            AttributedBullet("MOTIVATIONAL INTERVIEWING — non-judgmental, patient-centered approach to engagement.", citationIDs: ["openrn_mh"]),
            AttributedBullet("HARM REDUCTION — naloxone distribution, fentanyl test strips, syringe services, safer use education.", citationIDs: ["samhsa_concept"]),
            AttributedBullet("Withdrawal management — alcohol (benzodiazepines per CIWA), opioid (buprenorphine, methadone, comfort medications), benzodiazepine (slow taper).", citationIDs: ["openrn_mh"]),
            AttributedBullet("MEDICATIONS FOR ADDICTION TREATMENT (MAT): Alcohol — naltrexone, acamprosate, disulfiram. Opioid — buprenorphine, methadone, naltrexone. Tobacco — nicotine replacement, varenicline, bupropion.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Behavioral therapies: CBT, contingency management, 12-step facilitation, motivational enhancement therapy.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Mutual-support groups: AA, NA, SMART Recovery.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Treat comorbid mental health — integrated treatment improves outcomes.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Address social determinants — housing first, employment support, legal aid.", citationIDs: ["openrn_mh"])
        ],
        watchFor: [
            AttributedBullet("OVERDOSE — leading cause of accidental death in U.S.; provide naloxone with all opioid prescriptions and to those at risk.", citationIDs: ["samhsa_concept"]),
            AttributedBullet("Severe alcohol/benzo withdrawal — seizures, DTs; medical emergency.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Suicide.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Endocarditis, hepatitis, HIV from IV use.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Fentanyl-contaminated supply — many non-opioid drugs now contaminated with fentanyl/xylazine; harm reduction critical.", citationIDs: ["samhsa_concept"]),
            AttributedBullet("Stigma — barrier to care; trauma-informed, non-judgmental approach essential.", citationIDs: ["openrn_mh"])
        ],
        citations: [openrnMH, dsmConcept, samhsaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Suicide Risk Assessment

public enum SuicideRiskSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "suicide-risk",
        title: "Suicide Risk Assessment & Intervention",
        subtitle: "Universal screening · structured assessment · safety planning",
        nclexTags: psychSafetyTags,
        definition: AttributedProse(
            "Suicide is the 11th leading cause of death in the U.S. and 2nd leading cause of death for ages 10–34. Universal screening, structured risk assessment, lethal means counseling, and safety planning are the evidence-based core of nursing intervention. Suicide risk is dynamic — assess at every encounter.",
            citationIDs: ["openrn_mh", "cdc_mh", "cssrs_concept"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — biological vulnerability (family history, neurobiology), psychiatric disorders (depression, bipolar, schizophrenia, SUD, BPD, PTSD), psychological pain, hopelessness, social factors (loss, isolation, financial), access to lethal means, recent precipitants (loss, discharge, anniversaries).",
            citationIDs: ["openrn_mh"]
        ),
        presentation: [
            AttributedBullet("Direct verbal: 'I want to die,' 'I won't be here much longer,' 'Everyone would be better off without me.'", citationIDs: ["openrn_mh"]),
            AttributedBullet("Behavioral: giving away possessions, putting affairs in order, sudden calmness after agitation, withdrawal, increased substance use, accessing means.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Risk factors: prior attempt (strongest predictor — multiplies risk 30–40×), psychiatric disorder, substance use, hopelessness, recent loss, social isolation, family history of suicide, chronic pain, terminal illness, access to firearm, recent psychiatric discharge (highest risk first 30 days).", citationIDs: ["openrn_mh", "cdc_mh"]),
            AttributedBullet("Demographic: peak rates in middle-aged white men, AI/AN populations, and LGBTQ+ youth.", citationIDs: ["cdc_mh"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Universal screening: PHQ-9 item 9, ASQ (Ask Suicide-Screening Questions), Columbia-Suicide Severity Rating Scale (C-SSRS).", citationIDs: ["cssrs_concept"]),
            AttributedBullet("Direct, non-judgmental questioning DOES NOT increase suicide risk and is required for assessment.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Document: ideation (passive vs active), plan (specific, lethal, available), intent, prior attempts, protective factors.", citationIDs: ["openrn_mh"])
        ],
        priorityAssessments: [
            AttributedBullet("Screen at every healthcare contact — primary care, ED, psychiatric, OB, pediatric.", citationIDs: ["cdc_mh"]),
            AttributedBullet("Detailed C-SSRS or equivalent if positive screen.", citationIDs: ["cssrs_concept"]),
            AttributedBullet("Access to lethal means — firearms, medications (especially opioids, benzos, TCAs).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use, recent intoxication.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Protective factors — children, faith, future-orientation, treatment engagement, social support.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Recent stressors — loss, legal/financial trouble, anniversary, discharge.", citationIDs: ["openrn_mh"])
        ],
        commonInterventions: [
            AttributedBullet("ACTIVE IDEATION WITH PLAN/INTENT: 1:1 observation, secure environment (no harm objects), psychiatric evaluation, hospitalization (voluntary preferred; involuntary if imminent risk and refuses).", citationIDs: ["openrn_mh"]),
            AttributedBullet("SAFETY PLAN (Stanley-Brown 6-step): warning signs, internal coping strategies, social distractions/people, supportive contacts, professional/agency contacts, lethal means restriction.", citationIDs: ["openrn_mh"]),
            AttributedBullet("LETHAL MEANS RESTRICTION — counsel and act on firearm safety, medication storage, access reduction.", citationIDs: ["cdc_mh"]),
            AttributedBullet("Treat underlying disorders — depression, bipolar, SUD, anxiety with evidence-based therapy and medication.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Lithium reduces suicide in bipolar and depression.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Clozapine reduces suicide in schizophrenia.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Ketamine/esketamine — rapid (within hours) reduction in suicidal ideation.", citationIDs: ["openrn_mh"]),
            AttributedBullet("CBT-SP (CBT for suicide prevention), DBT (BPD), CAMS (Collaborative Assessment and Management of Suicidality).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Post-discharge follow-up within 24–72 hours — highest risk window.", citationIDs: ["openrn_mh"]),
            AttributedBullet("988 Suicide & Crisis Lifeline (call/text) — provide to every patient.", citationIDs: ["cdc_mh"])
        ],
        watchFor: [
            AttributedBullet("Sudden calm after extreme distress — may indicate decision/plan finalized, NOT improvement.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Hopelessness — strongest psychological predictor.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Discharge/transition first 30 days — highest-risk window.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Substance use — disinhibits and lowers threshold; treat both.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Antidepressant initiation in young adults — black-box warning; closer monitoring.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Suicide contagion — clusters in adolescents; safe messaging principles.", citationIDs: ["cdc_mh"]),
            AttributedBullet("Survivor support — postvention; family/friends after suicide are themselves at increased risk.", citationIDs: ["openrn_mh"])
        ],
        citations: [openrnMH, cdcMH, dsmConcept, cssrsConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Opioid Use Disorder

public enum OpioidUseDisorderSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "opioid-use-disorder",
        title: "Opioid Use Disorder (OUD)",
        subtitle: "Treatable chronic disease · MOUD saves lives · naloxone for everyone at risk",
        nclexTags: psychSafetyTags,
        definition: AttributedProse(
            "Problematic pattern of opioid use leading to clinically significant impairment or distress, manifested by ≥2 of 11 DSM-5 criteria within a 12-month period. Includes prescription opioid misuse and illicit opioid use (heroin, fentanyl). Treatable chronic disease.",
            citationIDs: ["openrn_mh", "dsm_concept", "samhsa_concept"]
        ),
        pathophysiology: AttributedProse(
            "Mu-opioid receptor adaptation → tolerance, dependence, hyperalgesia, dysphoria during withdrawal. Mesolimbic reward circuit hijacked. Genetic vulnerability + environmental factors. Fentanyl-contaminated supply has dramatically increased overdose deaths.",
            citationIDs: ["openrn_mh", "samhsa_concept"]
        ),
        presentation: [
            AttributedBullet("DSM-5 criteria: tolerance, withdrawal, taking more than intended, unsuccessful efforts to cut down, time spent obtaining/using/recovering, craving, role failure, social/interpersonal problems, giving up activities, hazardous use, continued use despite consequences.", citationIDs: ["dsm_concept"]),
            AttributedBullet("Withdrawal: anxiety, insomnia, dilated pupils, lacrimation, rhinorrhea, yawning, sweating, abdominal cramping, diarrhea, vomiting, gooseflesh, muscle aches.", citationIDs: ["openrn_mh"]),
            AttributedBullet("OVERDOSE: pinpoint pupils, respiratory depression (RR <8), decreased LOC, possible cyanosis, possible cardiac arrest.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Track marks (IV use), abscesses, endocarditis (right-sided), HCV/HIV/HBV.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Comorbid depression, anxiety, PTSD common.", citationIDs: ["openrn_mh"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5 ≥2 criteria within 12 months: 2–3 mild, 4–5 moderate, ≥6 severe.", citationIDs: ["dsm_concept"]),
            AttributedBullet("UDS — opioid presence; commercial assays may miss synthetic opioids (fentanyl, methadone, oxycodone).", citationIDs: ["openrn_mh"]),
            AttributedBullet("COWS (Clinical Opiate Withdrawal Scale) for withdrawal severity.", citationIDs: ["openrn_mh"])
        ],
        priorityAssessments: [
            AttributedBullet("OVERDOSE risk — provide NALOXONE to every patient with OUD and household contacts.", citationIDs: ["samhsa_concept"]),
            AttributedBullet("Withdrawal severity (COWS) — severe withdrawal predicts treatment retention.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Comorbid HIV, HCV, endocarditis, cellulitis.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Mental health comorbidities.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Pregnancy — maternal MOUD reduces overdose, neonatal outcomes; methadone or buprenorphine preferred over withdrawal.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Pain management — chronic pain + OUD is complex; multimodal approach.", citationIDs: ["openrn_mh"])
        ],
        commonInterventions: [
            AttributedBullet("MEDICATIONS FOR OPIOID USE DISORDER (MOUD) — first-line, life-saving, reduces overdose mortality 50%+.", citationIDs: ["openrn_mh", "samhsa_concept"]),
            AttributedBullet("BUPRENORPHINE (partial agonist; ceiling effect on respiratory depression; office-based prescribing): start when in moderate withdrawal (COWS ≥8) to avoid precipitated withdrawal; sublingual film/tablet, monthly long-acting injection (Sublocade).", citationIDs: ["openrn_mh"]),
            AttributedBullet("METHADONE (full agonist; opioid treatment program / 'methadone clinic' only): daily observed dosing, gradual titration.", citationIDs: ["openrn_mh"]),
            AttributedBullet("NALTREXONE (opioid antagonist; oral or monthly extended-release injection Vivitrol): requires complete opioid abstinence ≥7–10 days before initiation; precipitated withdrawal otherwise.", citationIDs: ["openrn_mh"]),
            AttributedBullet("WITHDRAWAL: comfort medications — clonidine, ondansetron, loperamide, hydroxyzine, dicyclomine, NSAIDs.", citationIDs: ["openrn_mh"]),
            AttributedBullet("OVERDOSE: NALOXONE 2–4 mg IN or 0.4 mg IV; repeat q2–3 min if no response; ventilatory support; expect repeat doses with high-potency synthetic opioids.", citationIDs: ["openrn_mh"]),
            AttributedBullet("HARM REDUCTION: naloxone distribution, fentanyl test strips, syringe services, safer-use education, never use alone.", citationIDs: ["samhsa_concept"]),
            AttributedBullet("Behavioral therapies adjunctive: CBT, contingency management, 12-step.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Treat comorbid mental health (integrated care improves outcomes).", citationIDs: ["openrn_mh"]),
            AttributedBullet("Pregnancy: BUPRENORPHINE or METHADONE — do not detoxify (high relapse, fetal mortality); planned NICU for NAS management.", citationIDs: ["openrn_mh"])
        ],
        watchFor: [
            AttributedBullet("OVERDOSE — fentanyl-contaminated supply makes accidental overdose extremely common; naloxone access universal.", citationIDs: ["samhsa_concept"]),
            AttributedBullet("Precipitated withdrawal — naloxone reversal of overdose, naltrexone in opioid-dependent, buprenorphine started too soon; severe withdrawal.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Endocarditis, HIV, HCV from IV use — screen and treat.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Stigma — major barrier to care; treat with respect, offer MOUD without judgment.", citationIDs: ["openrn_mh"]),
            AttributedBullet("Post-incarceration overdose risk — tolerance lost during abstinence; high mortality first 2 weeks after release.", citationIDs: ["samhsa_concept"]),
            AttributedBullet("Neonatal abstinence syndrome (NAS) — eat, sleep, console (ESC) approach over scoring scales; non-pharmacologic first.", citationIDs: ["openrn_mh"])
        ],
        citations: [openrnMH, dsmConcept, samhsaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}
