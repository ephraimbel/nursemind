import Foundation

// Curator-model diagnosis entries (round 24 — dementia spectrum + wound types + geriatric syndromes).

private let openrnDxR24 = CitationSource(
    id: "openrn_dx_round24",
    shortName: "Open RN Health Alterations + Mental Health + Gerontology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-12"
)
private let cdcDxR24 = CitationSource(
    id: "cdc_dx_round24",
    shortName: "CDC + AGS + Alzheimer's Association concept citations",
    publisher: "CDC · AGS · Alzheimer's Association",
    license: .publicDomain,
    url: "https://www.cdc.gov/aging/dementia/index.html",
    lastRetrieved: "2026-05-12"
)
private let specialtyDxR24 = CitationSource(
    id: "specialty_dx_round24",
    shortName: "AGS + APA + WOCN + IDSA + AAFP geriatric / wound / palliative",
    publisher: "AGS · APA · WOCN · IDSA · AAFP",
    license: .factCitationOnly,
    url: "https://www.americangeriatrics.org/publications-tools/clinical-practice-guidelines",
    lastRetrieved: "2026-05-12"
)

private let cogR24 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cognition)
private let safetyR24 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .safety)
private let woundR24 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .safety)
private let psychR24 = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood)
private let nutR24 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition)

public enum BPSDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bpsd",
        title: "Behavioral + psychological symptoms of dementia (BPSD)",
        subtitle: "Agitation / delusions / hallucinations / depression in dementia · non-pharm FIRST · cautious antipsychotic · BLACK BOX mortality",
        nclexTags: cogR24,
        definition: AttributedProse(
            "Heterogeneous spectrum of non-cognitive symptoms in dementia — agitation, aggression, delusions, hallucinations, depression, anxiety, sleep disturbance, wandering, disinhibition. Affects up to 90% of dementia patients during illness; major source of caregiver burden + nursing home placement. NON-PHARMACOLOGIC interventions are FIRST-LINE per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — neurodegenerative changes affecting frontal / temporal / limbic regions; neurotransmitter dysfunction (dopamine, serotonin, norepinephrine, acetylcholine); concurrent medical illness (UTI, pneumonia, constipation, pain) + medication side effects + environmental factors (overstimulation, unmet needs, fear) frequently precipitate.",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("AGITATION — restlessness, motor activity, verbal agitation; most common BPSD.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("AGGRESSION — verbal + physical; distressing for caregivers.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("DELUSIONS — paranoid / persecutory (theft, infidelity), misidentification (Capgras — \"impostor\"), Lewy body dementia particularly prone.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("HALLUCINATIONS — visual most common in DLB; auditory in Alzheimer's.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("DEPRESSION — common; underdiagnosed; affects functional status; treatment important.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("SUNDOWNING — late-day worsening of agitation, confusion, restlessness.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("WANDERING + EXIT-SEEKING — safety concern; falls + getting lost risk.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Concerning red flags — sudden change suggesting delirium superimposed on dementia (UTI, pneumonia, medication, dehydration, pain) per primary source.", citationIDs: ["specialty_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL identification of behavioral / psychological symptoms in patient with established dementia diagnosis.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("EXCLUDE delirium superimposed on dementia (CAM, CAM-ICU) — sudden change requires medical workup per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WORKUP medical contributors — UA, CBC, CMP, TSH, B12, vitamin D, medication review (anticholinergics, opioids, benzodiazepines), pain assessment.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Assessment tools — Cohen-Mansfield Agitation Inventory (CMAI), Neuropsychiatric Inventory (NPI), Cornell Scale for Depression in Dementia (CSDD).", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("RULE OUT delirium / medical illness / pain / medication contribution FIRST.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Caregiver burden + safety assessment.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Environment + routine + recent changes.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Pain assessment using validated tool (PAINAD for non-verbal patients).", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("NON-PHARMACOLOGIC FIRST-LINE — calm environment, consistent caregivers, predictable routine, validation, redirection, reminiscence, music therapy, pet therapy, structured activities, simulated presence per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("REVERSIBLE causes — treat UTI / pneumonia / constipation / pain; address sensory deficits (glasses, hearing aids); review meds for anticholinergic burden.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PAIN MANAGEMENT — scheduled acetaminophen often resolves agitation in cognitively impaired who can't verbalize pain.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CITALOPRAM 10-30 mg/day (Citad-AD trial) — modest benefit for agitation in Alzheimer's; cardiac QT monitoring.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ANTIPSYCHOTICS (risperidone, olanzapine, quetiapine) — SHORT-TERM only for severe agitation / aggression / psychosis with safety risk; LOW DOSE; CONTINUOUS REASSESSMENT for taper / discontinuation; BLACK-BOX warning for increased mortality in dementia per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("TRAZODONE — selected for sleep / mild agitation; less mortality risk than antipsychotics.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("VALPROIC ACID, MOOD STABILIZERS — limited evidence; not first-line.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("BENZODIAZEPINES — AVOID (worsens cognition, falls, paradoxical agitation, dependence).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER support + education + respite — critical to delay institutionalization.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MEMORY CARE / DEMENTIA UNITS — for advanced patients with safety needs unable to manage in community.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Advance care planning — values, preferences, goals of care, comfort vs aggressive intervention.", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("ANTIPSYCHOTIC MORTALITY — black-box; ~1.6-1.7× increased mortality vs placebo; reserve for severe, time-limited use; document risk-benefit conversation.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("FALLS — significantly increased with antipsychotics, benzodiazepines, anticholinergics; vigilant fall prevention.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("STROKE risk — antipsychotics in dementia.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DELIRIUM superimposed — sudden worsening; medical workup; common precipitants UTI, pneumonia, dehydration, medication.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER BURNOUT + abuse risk — counsel + screen + connect to resources.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("LEWY BODY DEMENTIA — extreme antipsychotic sensitivity; severe parkinsonism / NMS-like reaction; AVOID first-generation antipsychotics; quetiapine + clozapine safer.", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum VascularDementiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "vascular-dementia",
        title: "Vascular dementia",
        subtitle: "Stepwise cognitive decline · post-stroke · subcortical white matter · vascular risk factor control · NO disease-modifying treatment",
        nclexTags: cogR24,
        definition: AttributedProse(
            "Cognitive decline due to cerebrovascular disease — multi-infarct dementia, strategic infarct dementia, subcortical ischemic vascular dementia, post-stroke cognitive impairment. Second most common dementia after Alzheimer's; often coexists (mixed dementia). Risk factors are vascular — HTN, DM, smoking, dyslipidemia, atrial fibrillation per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "Cerebrovascular disease → small + large vessel ischemia → white matter changes (leukoaraiosis), lacunar infarcts, cortical infarcts → cognitive impairment. Subcortical ischemic vascular dementia (SIVD, Binswanger disease) — chronic white matter disease + executive dysfunction predominantly.",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("STEPWISE COGNITIVE DECLINE — sudden drops following strokes; plateaus between events (vs gradual decline of Alzheimer's).", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("EXECUTIVE DYSFUNCTION prominent — slowed processing, poor planning, impaired judgment; subcortical pattern.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("MEMORY impairment — present but typically less severe than Alzheimer's early on; often retrieval rather than encoding.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("FOCAL NEUROLOGIC SIGNS — hemiparesis, gait abnormalities, urinary incontinence, dysarthria, hyperreflexia.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("DEPRESSION + apathy — common; subcortical involvement.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Risk factors — HTN (most important), DM, smoking, hyperlipidemia, atrial fibrillation, prior stroke / TIA, atherosclerosis, age, family history of stroke.", citationIDs: ["specialty_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MMSE / MoCA — cognitive screening; MoCA more sensitive for executive dysfunction in vascular dementia.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("NEUROIMAGING (MRI > CT) — multiple infarcts, white matter lesions, lacunes, periventricular changes.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DIAGNOSIS — cognitive impairment + cerebrovascular disease evidence + temporal relationship; NINDS-AIREN or DSM-5 criteria.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Vascular workup — BP, lipids, A1c, ECG (Afib), carotid Doppler, echocardiogram per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Rule out — other dementias (Alzheimer's, DLB, FTD), reversible causes (B12, hypothyroidism, depression, NPH).", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("Vascular risk factor optimization — primary intervention.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Cognitive functional assessment for safety + supports.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Mood screening + depression treatment.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Caregiver burden + planning.", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("VASCULAR RISK FACTOR CONTROL — BP <130/80, A1c <7%, statin, smoking cessation, antiplatelet (aspirin / clopidogrel) for prior stroke; anticoagulation for atrial fibrillation per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("NO FDA-APPROVED disease-modifying treatment for vascular dementia.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CHOLINESTERASE INHIBITORS (donepezil, galantamine, rivastigmine) — modest benefit; off-label for vascular + mixed dementia per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MEMANTINE — possible benefit in mixed / advanced disease.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("LIFESTYLE — Mediterranean diet, regular exercise, social engagement, cognitive stimulation, sleep optimization per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("STROKE PREVENTION — secondary stroke prevention reduces further cognitive decline.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DEPRESSION TREATMENT — SSRIs (citalopram, escitalopram) preferred; non-pharmacologic + behavioral.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("REHABILITATION — PT/OT/SLP for stroke residua; cognitive rehab; functional adaptation.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER + family support + education; advance care planning early.", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("RECURRENT STROKES — accelerate cognitive decline; aggressive prevention.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MIXED DEMENTIA — vascular + Alzheimer's coexist commonly; both contribute; combined treatment approaches.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("FALLS — focal neurologic signs + gait abnormalities + cognitive impairment; PT + home modifications.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("URINARY INCONTINENCE — common subcortical sign; may benefit timed voiding + behavioral interventions.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DEPRESSION undertreated — important to address; functional improvement possible.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DRIVING SAFETY — cognitive + motor; assessment + counseling; DMV reporting per state law.", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum LewyBodyDementiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "lewy-body-dementia",
        title: "Dementia with Lewy bodies (DLB)",
        subtitle: "Visual hallucinations + parkinsonism + fluctuating cognition + REM sleep behavior · ANTIPSYCHOTIC SENSITIVITY · cholinesterase inhibitors helpful",
        nclexTags: cogR24,
        definition: AttributedProse(
            "Progressive neurodegenerative dementia characterized by α-synuclein Lewy body deposition. Third most common dementia after Alzheimer's + vascular. Distinguished from Parkinson disease dementia by ONSET (DLB cognitive decline within 1 year of motor symptoms; PDD cognitive decline >1 year after motor disease). Distinct treatment considerations per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "α-synuclein Lewy body deposition in cortex + brainstem + autonomic ganglia → cholinergic + dopaminergic dysfunction → cognitive + motor + autonomic + REM sleep features. Genetic + environmental contributors poorly understood.",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("CORE FEATURES (≥2 = probable DLB) — fluctuating cognition with marked variations in attention/alertness; recurrent visual hallucinations (well-formed + detailed); spontaneous parkinsonism; REM sleep behavior disorder.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("VISUAL HALLUCINATIONS — well-formed, detailed (people, animals); often non-threatening; pathognomonic if combined with other features.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("FLUCTUATING COGNITION — daily / hourly variation in alertness + cognition; can mimic delirium.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("PARKINSONISM — bradykinesia, rigidity, postural instability; tremor often less prominent than PD.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("REM SLEEP BEHAVIOR DISORDER — acting out dreams, often violent; can predate cognitive symptoms by years.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("AUTONOMIC dysfunction — orthostatic hypotension, urinary incontinence, constipation.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("ANTIPSYCHOTIC SENSITIVITY — severe parkinsonism, NMS-like, decreased consciousness with even small doses; CRITICAL to recognize.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Memory loss may be mild early on (vs Alzheimer's); attention + executive + visuospatial worse.", citationIDs: ["openrn_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — McKeith criteria 2017; ≥2 core features = probable DLB; 1 core feature + biomarker = probable.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DAT-SPECT (dopamine transporter imaging) — reduced striatal uptake; high sensitivity + specificity.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("REM sleep polysomnography — confirms RBD.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MIBG scintigraphy — reduced cardiac uptake in DLB.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MRI — relatively preserved hippocampus (vs Alzheimer's) — supportive.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Rule out — Alzheimer's, Parkinson disease dementia, vascular dementia, FTD.", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("RECOGNIZE early — to avoid antipsychotic-induced harm.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Falls + orthostatic hypotension assessment.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("RBD safety — bed setup to prevent injury during enacted dreams.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Caregiver education — fluctuations + visual hallucinations + sensitivity.", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("CHOLINESTERASE INHIBITORS — RIVASTIGMINE first-line (FDA-approved for PD dementia; off-label for DLB) per primary source; donepezil + galantamine effective.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MEMANTINE — adjunctive in moderate-severe.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MOTOR symptoms — levodopa-carbidopa cautiously (can worsen psychosis); start low, monitor.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("REM SLEEP BEHAVIOR DISORDER — melatonin 3-9 mg QHS first-line; clonazepam 0.25-2 mg QHS alternative; bed safety setup.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ANTIPSYCHOTIC SENSITIVITY — AVOID FIRST-GENERATION (haloperidol, chlorpromazine); SECOND-GEN cautiously — QUETIAPINE + CLOZAPINE preferred; risperidone + olanzapine more sensitivity per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ORTHOSTATIC HYPOTENSION — increase fluids + salt, midodrine, fludrocortisone, compression stockings.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DEPRESSION — SSRIs (sertraline, citalopram); avoid TCAs (anticholinergic).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("AVOID anticholinergic medications — worsen cognition + hallucinations + autonomic features.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PT/OT — gait + balance + functional adaptation; falls prevention.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER education + support; advance care planning early.", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("ANTIPSYCHOTIC SENSITIVITY — even small doses → severe parkinsonism, NMS-like, decreased consciousness; STRONGLY consider before any antipsychotic; medical alert bracelet.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("FALLS — orthostatic + parkinsonism + cognitive impairment combine; high fracture risk.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ASPIRATION PNEUMONIA — dysphagia common in advanced disease; SLP eval; thickened liquids.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DELIRIUM superimposed — easily confused with fluctuations; medical workup if sudden change.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER BURDEN — fluctuations + hallucinations + behavioral symptoms; respite + support.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PROGNOSIS — generally faster decline than Alzheimer's; median survival 5-7 years post-diagnosis.", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum FrontotemporalDementiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "frontotemporal-dementia",
        title: "Frontotemporal dementia (FTD)",
        subtitle: "Younger onset 45-65 · personality/behavior change OR language decline first · NO cholinesterase benefit · psychiatric mimic",
        nclexTags: cogR24,
        definition: AttributedProse(
            "Heterogeneous group of neurodegenerative disorders characterized by frontal + temporal lobe atrophy. Subtypes — behavioral variant FTD (bvFTD — personality / behavior change), primary progressive aphasia (PPA — language predominant). Younger onset typical (45-65). Often misdiagnosed as psychiatric illness. NO cholinesterase inhibitor benefit per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "Frontotemporal lobar degeneration (FTLD) — multiple proteinopathies (tau, TDP-43, FUS). ~40% familial (autosomal dominant — MAPT, GRN, C9orf72 mutations). Frontal + temporal cortex atrophy; behavioral / language manifestations depending on involvement.",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("BEHAVIORAL VARIANT FTD (bvFTD) — disinhibition (socially inappropriate behavior), apathy, loss of empathy, perseverative behavior, hyperorality (binge eating + odd food preferences), executive dysfunction.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("MEMORY relatively preserved early on (vs Alzheimer's).", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("PRIMARY PROGRESSIVE APHASIA (PPA) — semantic variant (loss of word meaning), nonfluent variant (effortful speech, agrammatism), logopenic variant (often Alzheimer's pathology, word retrieval).", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("FTD-MND overlap — coexisting motor neuron disease (ALS-like); poor prognosis.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("OFTEN MISDIAGNOSED as depression, bipolar, schizophrenia, OCD, frontal lobe stroke given younger age.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("FAMILY HISTORY common (~40% inherited).", citationIDs: ["specialty_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — Rascovsky 2011 bvFTD criteria; PPA criteria.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MRI — frontal + temporal atrophy; relatively preserved hippocampus + parietal (vs Alzheimer's).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("FDG-PET — frontal + temporal hypometabolism; supportive.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Genetic testing — MAPT, GRN, C9orf72 for familial cases (~40%); counsel + genetic counseling.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Rule out — psychiatric illness, Alzheimer's, vascular, autoimmune encephalitis (anti-NMDA, anti-LGI1), Creutzfeldt-Jakob disease.", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("Recognize EARLY — younger patients often missed for years.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Family genetic counseling if positive — ~40% inheritable.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Caregiver burden assessment — extreme due to behavioral + early-onset financial / family impact.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Capacity assessment — driving, financial, healthcare decisions.", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("NO disease-modifying treatment available; symptomatic management only.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CHOLINESTERASE INHIBITORS NOT recommended — no benefit + may worsen behavior.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MEMANTINE — limited evidence; not routinely recommended.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("SSRIs — for behavioral symptoms (disinhibition, compulsive behaviors, irritability); sertraline, citalopram, paroxetine; modest evidence per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ANTIPSYCHOTICS — caution; can worsen parkinsonism + extra-pyramidal symptoms; use sparingly + low dose.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("BEHAVIORAL interventions — structured environment, redirection, removing triggers, supervision, safety planning.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("SLP for primary progressive aphasia — communication strategies + augmentative communication.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("OT for adaptive equipment + safety + ADLs.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Caregiver SUPPORT crucial — high burden from behavioral symptoms; FTD-specific support groups; respite.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ADVANCE CARE PLANNING + capacity / DPOA / financial planning EARLY (before progression).", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("BEHAVIORAL DETERIORATION + safety risks — disinhibited behavior, aggression, hypersexuality; medication + environmental management.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("EARLY INSTITUTIONAL placement common due to caregiver burden; counsel.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ALS / motor neuron disease overlap — accelerated decline; specialty referral.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("FAMILIAL cases — genetic counseling for at-risk relatives; preimplantation diagnosis available.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER MENTAL HEALTH — depression + anxiety + burnout; intensive support needed; respite essential.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PROGNOSIS — median survival 6-11 years from diagnosis; faster with FTD-MND.", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum MCISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "mild-cognitive-impairment",
        title: "Mild cognitive impairment (MCI)",
        subtitle: "Cognitive change beyond aging but not dementia · 10-15%/year progress to dementia · lifestyle interventions · regular monitoring",
        nclexTags: cogR24,
        definition: AttributedProse(
            "Cognitive decline greater than expected for age + education but NOT meeting criteria for dementia (preserved ADLs). Affects ~15-20% of adults ≥65; ~10-15% per year progress to dementia (Alzheimer's most commonly), but ~30% remain stable or improve. Subtypes — amnestic (memory predominant — Alzheimer's prodrome) + non-amnestic per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "Heterogeneous — amnestic MCI often early Alzheimer's pathology; non-amnestic MCI may reflect vascular, FTD, DLB, or other early neurodegeneration. Some MCI is reversible (medication side effects, depression, thyroid, B12 deficiency, sleep apnea).",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("PATIENT or FAMILY concern about cognitive change beyond expected aging.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Objective cognitive impairment on testing (1-1.5 SD below age + education norms).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PRESERVED ADLs / IADLs — independent functioning maintained (vs dementia).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("AMNESTIC MCI — memory primarily; often Alzheimer's prodrome.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("NON-AMNESTIC MCI — executive / visuospatial / language; vascular, FTD, DLB precursors.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Risk factors — age, family history, vascular risk factors, head trauma, low education, depression, sleep disturbance, hearing / vision loss, social isolation.", citationIDs: ["specialty_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Cognitive complaint by patient or informant.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Objective evidence of cognitive impairment on testing — MoCA most sensitive (≤26/30 abnormal); MMSE less sensitive in MCI.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PRESERVED functional independence (ADLs / IADLs).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Does NOT meet criteria for dementia (functional decline absent).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WORKUP reversible causes — TSH, B12, vitamin D, A1c, depression screening (PHQ-9), sleep evaluation (apnea), medication review (anticholinergics, benzodiazepines), substance use.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MRI — rule out structural cause (tumor, hydrocephalus, multiple infarcts).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("AD biomarkers (CSF Aβ + tau OR amyloid PET) — research / specialty; emerging clinical use.", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("Functional assessment — must distinguish from dementia.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Reversible cause workup before attributing to neurodegeneration.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Mood + sleep + medication review.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Driving safety + financial capacity assessment + future planning.", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("ADDRESS REVERSIBLE causes — medication discontinuation (anticholinergics, benzodiazepines), B12 / D / thyroid / depression / sleep apnea treatment per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("LIFESTYLE — Mediterranean / DASH / MIND diet, regular aerobic exercise (≥150 min/week), cognitive stimulation, social engagement, sleep optimization, vascular risk factor control per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CHOLINESTERASE INHIBITORS NOT recommended for MCI per AAN — no proven benefit + side effects per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("LECANEMAB (Leqembi) — anti-amyloid monoclonal; FDA-approved 2023 for MCI / mild Alzheimer's with biomarker-confirmed amyloid; modest cognitive benefit + risk of ARIA (amyloid-related imaging abnormalities) — edema + microhemorrhage; specialty + monitoring per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DONANEMAB — alternative anti-amyloid monoclonal; 2024 FDA approval; similar profile to lecanemab.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("REGULAR FOLLOW-UP — annual cognitive assessment; monitor for progression.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ADVANCE CARE PLANNING — driving + financial + healthcare while capacity preserved.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CLINICAL TRIALS — patients with MCI prime candidates; refer to AD research centers.", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("PROGRESSION TO DEMENTIA — 10-15%/year; varies by subtype + biomarker status; monitor + plan.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("REVERSIBLE causes — medication, depression, sleep apnea, B12 / thyroid / D — meaningful cognitive recovery possible if addressed.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ANTI-AMYLOID monoclonal therapy — ARIA-E (edema) + ARIA-H (hemorrhage) common; serial MRI monitoring; APOE4 homozygotes higher risk.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ANXIETY + DEPRESSION around diagnosis — counsel + screen + treat; supports.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DRIVING SAFETY — assess + counsel; not always immediately impaired but monitor.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER preparation — early planning prevents crisis later.", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PolypharmacySyndromeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "polypharmacy-syndrome",
        title: "Polypharmacy syndrome (in elderly)",
        subtitle: "≥5 medications · prescribing cascade · BEERS criteria · ADRs + falls + hospitalization · DEPRESCRIBE systematically",
        nclexTags: safetyR24,
        definition: AttributedProse(
            "Use of ≥5 prescription medications concurrently (some define ≥10 as \"hyperpolypharmacy\"). Common in elderly with multimorbidity. Independently associated with adverse drug reactions, falls, hospitalization, cognitive impairment, mortality. Often arises from PRESCRIBING CASCADE — adding drug to treat side effect of prior drug per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — multimorbidity + multiple prescribers + lack of coordination + prescribing cascade + over-the-counter additions + supplements + unclear deprescribing strategies. Elderly have altered pharmacokinetics (reduced renal / hepatic clearance) + pharmacodynamics (increased sensitivity to CNS / cardiovascular effects).",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("≥5 prescription medications.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Adverse drug reactions — falls, confusion, urinary retention, sedation, dizziness.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Drug-drug + drug-disease interactions.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Functional decline — falls, fractures, frailty progression.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Cognitive impairment — anticholinergic burden, sedative cumulation.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Patient + caregiver confusion about regimen + adherence problems.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Prescribing cascade examples — diuretic for edema → hyperuricemia → allopurinol → rash → diphenhydramine → confusion.", citationIDs: ["specialty_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — count of medications + comprehensive review for clinical relevance.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("AGS BEERS CRITERIA — list of potentially inappropriate medications in older adults; updated every 4 years; categories — drugs to avoid, drugs to use with caution, drug-disease interactions, drug-drug interactions per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("STOPP / START criteria — European; STOPP = drugs to stop; START = drugs to start that are missing.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Anticholinergic burden — sum of anticholinergic activities; ACB scale.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Patient-centered comprehensive medication review by pharmacist.", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("Comprehensive medication reconciliation at every transition.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PRESCRIBING CASCADE recognition — every new symptom, ask \"Is this a medication side effect?\" before adding new drug.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Patient goals + values + life expectancy — match treatment intensity.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Adherence + understanding + costs.", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("DEPRESCRIBING — systematic review + reduction of unnecessary / harmful medications per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("STEP 1 — Get complete medication list (Brown Bag) — prescription + OTC + supplements + herbals.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("STEP 2 — Identify potentially inappropriate using BEERS / STOPP / anticholinergic burden.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("STEP 3 — Patient-centered priorities — symptoms most bothersome, life expectancy, goals.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("STEP 4 — TAPER OR STOP — most need taper (especially benzodiazepines, SSRIs, opioids, β-blockers, PPI, antiepileptics, antipsychotics).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("STEP 5 — MONITOR for return of symptoms vs withdrawal vs improvement.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PHARMACIST consultation — comprehensive medication review valuable.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("SIMPLIFY regimen — combine doses, eliminate redundancies, switch to once-daily where possible.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PATIENT EDUCATION — what each medication does, side effects to report, when to call.", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("ADVERSE DRUG REACTIONS — falls, confusion, urinary retention, dizziness; up to 30% of geriatric ED visits per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("HOSPITALIZATION risk — 4-9% of admissions in elderly are drug-related; up to 50% preventable.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ANTICHOLINERGIC BURDEN — cumulative; cognitive decline + delirium + falls; deprescribe diphenhydramine, oxybutynin, TCAs.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("BENZODIAZEPINES + Z-DRUGS — falls, confusion; Beers list; difficult to taper but high yield.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PPIs long-term — review for ongoing indication; Beers list cautious; bone fracture, B12 deficiency, C. diff.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("OPIOIDS — fall + delirium + addiction risk; deprescribe carefully; gradual taper.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("OPHTHALMIC, TOPICAL, INHALATIONAL meds also count + can have systemic effects.", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PressureInjuryR24Sample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pressure-injury-treatment",
        title: "Pressure injury (treatment)",
        subtitle: "Stages 1-4 + DTPI + unstageable · NPIAP staging · prevention bundle · stage-appropriate dressing · q2h reposition · Braden screening",
        nclexTags: woundR24,
        definition: AttributedProse(
            "Localized damage to skin + underlying soft tissue from pressure ± shear, usually over bony prominence. Up to 18% prevalence in acute care; CMS hospital-acquired condition (no reimbursement for stages 3-4 acquired in hospital). Prevention is the gold standard; treatment varies by stage + tissue type per NPIAP / WOCN per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "Pressure ± shear over bony prominence → tissue ischemia → cellular hypoxia → necrosis. Risk factors — immobility, malnutrition, decreased perfusion, moisture exposure, friction, sensory impairment, advanced age, comorbid disease. Top sites — sacrum, heels, ischial tuberosity, occiput.",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("STAGE 1 — non-blanchable erythema of intact skin.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("STAGE 2 — partial-thickness skin loss with exposed dermis (looks like blister or shallow open ulcer).", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("STAGE 3 — full-thickness skin loss with adipose visible; granulation + slough may be present; tunneling possible.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("STAGE 4 — full-thickness loss with exposed bone, tendon, muscle, or fascia; significant tunneling + undermining.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("DEEP TISSUE PRESSURE INJURY (DTPI) — persistent non-blanchable deep red, maroon, or purple discoloration; intact or non-intact skin; deep tissue damage.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("UNSTAGEABLE — full-thickness with slough / eschar obscuring depth; cannot stage until debrided.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("MEDICAL DEVICE-RELATED pressure injury — different anatomic distribution; compression from ETT, BiPAP mask, casts, splints.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("MUCOSAL pressure injury — different tissue; staging not applicable; result from medical devices on mucous membranes.", citationIDs: ["openrn_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL DIAGNOSIS — visual + palpation; NPIAP staging system per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("BRADEN SCALE — risk assessment; ≤18 = at risk; sensory perception, moisture, activity, mobility, nutrition, friction / shear.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Wound assessment — measure length × width × depth; wound bed (granulation, slough, eschar); peri-wound; exudate; odor.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Photography per facility wound-tracking protocol.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WOUND CULTURE — deep tissue if signs of infection (cellulitis, osteomyelitis suspected); avoid superficial swab (colonization vs infection).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MRI for suspected osteomyelitis under stage 3-4 over bony prominence.", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("Risk identification (Braden) on admission + daily.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Skin assessment from head to toe daily; under devices.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Existing wounds — assessment + measurement + photography.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Nutrition — albumin, prealbumin, weight loss, intake; NUTR consultation.", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION BUNDLE — Braden screening, q2h repositioning + 30° lateral tilt (NOT 90°), pressure-redistribution mattress / cushion, heel offloading (boots), skin care + barrier creams, moisture management, nutritional support per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("STAGE 1 — pressure relief + barrier cream + frequent skin assessment; heals in days-weeks.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("STAGE 2 — clean + moist environment; transparent film, hydrocolloid, hydrogel, or foam dressing; avoid wet-to-dry per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("STAGE 3-4 — wound bed management — debride necrotic tissue (sharp / autolytic / enzymatic); pack dead space; absorbent dressings (alginate, foam) for exudate; antimicrobial dressings (silver) if infected; NEGATIVE PRESSURE WOUND THERAPY (wound vac) for selected per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DEEP TISSUE PRESSURE INJURY — pressure relief + monitoring; may evolve to full-thickness.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("UNSTAGEABLE — debridement to expose wound bed (except stable dry eschar on heels — leave intact).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ANTIBIOTICS — only for clinical infection / cellulitis / osteomyelitis; NOT for routine colonization.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PAIN MANAGEMENT — pre-medicate before dressing changes; topical anesthesia.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("NUTRITION — protein 1.25-1.5 g/kg/day; calories 30-35 kcal/kg/day; arginine + zinc + vitamin C may help; oral or enteral preferred over parenteral.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WOCN consultation — for stages 3-4, complex wounds, slow healing.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("SURGICAL closure — for deep stages 3-4 unable to heal; flap procedures.", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("OSTEOMYELITIS — stage 3-4 over bony prominence; persistent / non-healing; MRI + bone biopsy + 4-6 weeks IV abx.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("SEPSIS — pressure injury can be source; especially in immunocompromised; surveillance.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PROGRESSION despite optimal care — assess for unaddressed pressure / shear / moisture; nutritional support; medical comorbidities (DM, vascular).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CMS HAC — stages 3-4 acquired in-hospital are non-reimbursed; rigorous prevention essential.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MEDICAL DEVICE-RELATED — different prevention strategies; rotate or remove devices when possible; padding under devices.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("END-OF-LIFE — pressure injuries common despite optimal care; comfort goal; palliative wound care; SCALE pressure injury concept (skin changes at life's end).", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum DiabeticFootUlcerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "diabetic-foot-ulcer",
        title: "Diabetic foot ulcer (DFU)",
        subtitle: "Neuropathy + vascular + infection · WAGNER / IDSA staging · OFFLOADING + glucose + abx + perfusion · 50% recurrence · amputation risk",
        nclexTags: woundR24,
        definition: AttributedProse(
            "Skin breakdown / wound on foot in diabetic patient; multifactorial pathogenesis (neuropathy + vascular insufficiency + biomechanical stress + infection). Affects ~25% of diabetics in lifetime; precedes >85% of diabetic amputations. Multidisciplinary management dramatically reduces amputation rates per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "Diabetic peripheral neuropathy → loss of protective sensation + autonomic dysfunction (dry skin + cracks + decreased sweating) + motor (foot deformity, Charcot foot) → repetitive trauma + pressure points → wound formation. PAD / vascular disease → poor healing. Hyperglycemia → impaired immune response + infection → progression to deep tissue + osteomyelitis + amputation.",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("PLANTAR ULCER — typically over metatarsal heads (1st MT, 5th MT, hallux); painless due to neuropathy.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("CALLUS overlying ulcer — biomechanical pressure point; debride callus to find ulcer.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Surrounding callus, fissures, dry skin, deformity (claw toes, hallux valgus, Charcot foot).", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("INFECTED ulcer — erythema, warmth, swelling, purulent drainage, foul odor, lymphangitis, lymphadenopathy, fever (sometimes absent).", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("DEEP infection / osteomyelitis — exposed bone, bone visible on probing (\"probe-to-bone\" test positive), persistent ulcer despite care.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("ISCHEMIC ulcer (PAD) — distal toes / heels; pale / cool foot; absent pulses; pain (paradoxically — even with neuropathy if severe ischemia).", citationIDs: ["openrn_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL inspection + monofilament test (10g Semmes-Weinstein) + tuning fork (128 Hz) — neuropathy assessment.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("VASCULAR assessment — pulses (DP, PT), ABI (ABI <0.9 = PAD), toe pressures (toe-brachial index), TCO2, transcutaneous oxygen.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WAGNER classification (0-5) — 0 (pre-ulcerative), 1 (superficial), 2 (deep to tendon/joint/bone), 3 (deep + abscess/osteomyelitis), 4 (forefoot gangrene), 5 (whole-foot gangrene).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("IDSA classification — uninfected, mild, moderate, severe; guides antibiotic selection per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PROBE-TO-BONE TEST — sterile probe touches bone = strong predictor of osteomyelitis.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WOUND CULTURE — deep tissue (curettage / biopsy); avoid superficial swab.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("OSTEOMYELITIS workup — XR (insensitive early), MRI (gold standard), bone scan, bone biopsy + culture.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Vascular imaging if PAD — duplex US, angiography (CT or MR) for revascularization planning.", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("ASSESS daily for new ulcer in all DM patients (\"DM foot exam\").", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Neuropathy + vascular assessment.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Severity classification (Wagner + IDSA).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Glycemic control + comorbidity (PAD, CKD, smoking).", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("OFFLOADING — total contact cast (TCC) gold standard for plantar ulcers; removable cast walker (RCW); orthopedic shoes; crutches / wheelchair for deep / refractory per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DEBRIDEMENT — sharp (preferred), enzymatic, autolytic; remove necrotic tissue + callus to expose viable wound bed; weekly OR more frequent.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WOUND CARE — moist wound healing; appropriate dressing (alginate / foam for exudate; hydrocolloid for granulation; antimicrobial silver for infected); offloading more important than dressing per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("INFECTION TREATMENT — IDSA-stratified — mild = oral cephalexin / amox-clav × 7-14 days; moderate = oral or IV broader spectrum × 7-14 days; severe = IV broad-spectrum (amox-clav, pip-tazo, carbapenem) + admit.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("OSTEOMYELITIS — surgical debridement + IV antibiotics 6-12 weeks (vancomycin + rifampin or culture-guided per primary source).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("REVASCULARIZATION — if PAD + non-healing; angioplasty + stent or bypass; vascular surgery referral.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("GLYCEMIC OPTIMIZATION — A1c target individualized; insulin often needed acutely.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("BIOLOGIC + ADJUNCTIVE — platelet-derived growth factor (becaplermin), bioengineered skin substitutes, hyperbaric oxygen for selected non-healing wounds.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PATIENT EDUCATION — daily foot inspection, proper footwear, no walking barefoot, podiatry follow-up regularly.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MULTIDISCIPLINARY TEAM — diabetes specialist, podiatry, vascular surgery, infectious disease, wound care, prosthetics; reduces amputation by 40-50%.", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("AMPUTATION — minor (toe / forefoot) up to major (BKA / AKA); 50% mortality at 5 years post-major amputation; aggressive prevention.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("OSTEOMYELITIS — aggressive surgical + 6-12 weeks IV antibiotics; bone biopsy guides therapy.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CHARCOT FOOT — neuropathic osteoarthropathy; \"hot, swollen, deformed\" diabetic foot WITHOUT obvious infection; XR + MRI; offloading + bracing × 6-12 months.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("NECROTIZING SOFT TISSUE INFECTION — rare but emergent; surgical debridement + broad-spectrum abx.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("RECURRENCE 50% in 5 years — lifelong vigilance + offloading + regular foot exams + appropriate footwear.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CARDIOVASCULAR mortality — diabetic foot ulcer is marker of diffuse vascular disease; aggressive CV risk reduction (statin, BP, ASA, smoking cessation).", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum VenousStasisUlcerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "venous-stasis-ulcer",
        title: "Venous stasis ulcer",
        subtitle: "MEDIAL malleolus · irregular shallow + exudate · COMPRESSION mainstay · elevation · varicose / DVT history · most common LE ulcer",
        nclexTags: woundR24,
        definition: AttributedProse(
            "Most common type of leg ulcer (~70%) — caused by chronic venous insufficiency leading to venous hypertension, edema, hemosiderin deposition, lipodermatosclerosis, ulceration. Occurs over medial malleolus (\"gaiter area\"). Compression therapy is mainstay; cleanse + appropriate dressing + treat underlying CVI per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "Chronic venous insufficiency (incompetent valves in deep / superficial / perforating veins, post-thrombotic syndrome) → venous hypertension → fluid + protein leak into interstitium → edema + inflammation + fibrosis (lipodermatosclerosis) + hyperpigmentation (hemosiderin) → tissue breakdown + ulcer. Risk factors — varicose veins, prior DVT, obesity, female, multiparity, prolonged standing, heart failure.",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("LOCATION — medial malleolus (\"gaiter area\" — between knee + ankle on medial leg); irregular shape; shallow.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("EXUDATE — moderate to large amount; serous to seropurulent.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("PERIWOUND — hemosiderin deposition (rust-brown discoloration), lipodermatosclerosis (\"upside-down champagne bottle leg\"), atrophie blanche, varicosities, edema.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Pulses PRESENT (vs arterial); skin warm; foot color normal.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("PAIN — variable; usually less than arterial; may be relieved by elevation; aching / heaviness in leg.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Risk factors — prior DVT (post-thrombotic syndrome), varicose veins, obesity, female, multiparity, heart failure, prolonged standing.", citationIDs: ["specialty_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — classic location + appearance + risk factors.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ABI — exclude PAD before compression (compression is contraindicated in significant arterial disease); ABI 0.8-1.3 acceptable for compression.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DUPLEX ULTRASOUND — assess venous reflux + thrombosis; identifies treatable venous pathology.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WOUND CULTURE — only if signs of infection (cellulitis, increased exudate, odor); avoid superficial swab.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Differentiate — arterial ulcer (distal, painful, absent pulses), pressure injury, diabetic ulcer (location), pyoderma gangrenosum (severe pain, undermined edges, autoimmune), malignancy (Marjolin ulcer in chronic non-healing).", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("ABI BEFORE compression — exclude significant PAD.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Wound assessment + measurement + photography.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Underlying venous insufficiency — venous duplex; treatment options.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Pain + functional impact + adherence to compression.", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("COMPRESSION THERAPY — gold standard; 30-40 mmHg multilayer compression bandage (Profore, Coban) OR Unna boot OR compression stockings (after acute) per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ELEVATION — leg above heart 30 min × 3-4×/day reduces edema.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WOUND CARE — gentle cleansing with saline; appropriate absorbent dressing (alginate / foam for exudate); avoid maceration.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DEBRIDEMENT — sharp / autolytic for slough / necrotic tissue.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ANTIBIOTICS — only if INFECTED (not for routine colonization); cephalexin / amoxicillin-clavulanate; consider MRSA risk.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("VENOUS INTERVENTION — venous duplex showing reflux → endovenous laser ablation, sclerotherapy, ligation, stripping; treats underlying CVI.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("SKIN CARE — moisturize peri-wound; treat dermatitis (low-potency steroid for eczema); barrier creams.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PENTOXIFYLLINE — may improve healing in selected refractory cases per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WEIGHT loss + activity — improves venous return.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("LIFELONG compression stockings — after healing prevents recurrence.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WOCN consultation — chronic + non-healing wounds.", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("RECURRENCE common — lifelong compression + venous treatment; counsel.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("INFECTION — cellulitis common; aggressive abx; admit if systemic signs.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ARTERIAL DISEASE concurrent — mixed ulcer; modify compression to lower pressure or avoid.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CONTACT DERMATITIS to dressings or topical agents — common; allergy testing if persistent.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MARJOLIN ULCER — squamous cell carcinoma in chronic non-healing wound; biopsy if not healing in 3-6 months.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DEEP VEIN THROMBOSIS — increased risk in chronic venous disease; counsel signs.", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ArterialUlcerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "arterial-ulcer",
        title: "Arterial (ischemic) ulcer / PAD ulcer",
        subtitle: "DISTAL toes / heels · PUNCHED-OUT · PAINFUL · pulse absent · ABI <0.5 · REVASCULARIZATION + risk factor control · NO compression",
        nclexTags: woundR24,
        definition: AttributedProse(
            "Lower extremity ulcer caused by inadequate arterial perfusion from peripheral arterial disease (PAD) — atherosclerosis most common. Critical limb ischemia (CLI) — chronic limb-threatening ischemia (CLTI) is the modern term. Major risk factor for amputation. Revascularization + medical management essential per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "Atherosclerotic arterial occlusion → reduced perfusion to tissues → ischemia + tissue necrosis + ulceration. Risk factors — diabetes, smoking, dyslipidemia, HTN, age, family history, CKD, hyperhomocysteinemia. Diabetes accelerates + complicates PAD significantly.",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("LOCATION — distal toes (often medial / lateral edges, between toes), heels, lateral foot.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("APPEARANCE — small, deep, \"PUNCHED-OUT\" — well-defined edges, dry wound bed, pale base.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("PAINFUL — severe; rest pain often present; worse at night; relieved by dependency.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Skin signs — pale or cyanotic, cool, hairless, shiny, atrophic; brittle nails.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Pulses ABSENT or DIMINISHED (DP, PT, popliteal, femoral).", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Capillary refill prolonged (>3 sec); foot blanches with elevation, becomes deep red on dependency (rubor of dependency).", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Risk factors — diabetes, smoking (most modifiable + significant), age, CV disease, family history.", citationIDs: ["specialty_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ABI — Ankle-Brachial Index — definitive screening; <0.9 = PAD; <0.5 = severe / critical limb ischemia.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Toe-brachial index (TBI) — useful in calcified vessels (DM, CKD) where ABI falsely elevated; <0.7 = PAD.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Transcutaneous oxygen pressure (TcPO2) — <30 mmHg = severe ischemia + poor healing.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DUPLEX ULTRASOUND — identifies + locates arterial stenoses.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CTA / MRA / Angiography — definitive vascular imaging for revascularization planning.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Differentiate — venous ulcer (medial malleolus, exudate, edema), diabetic neuropathic (plantar pressure point), pressure injury, vasculitic ulcer, malignancy.", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("ABI / TBI before any compression therapy.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Pulse exam + skin signs of ischemia.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Pain assessment + management (severe + impacts QOL).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Cardiovascular risk factors + diffuse vascular disease (CAD, carotid, AAA).", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("REVASCULARIZATION — primary intervention if surgical candidate; angioplasty + stent (endovascular) OR bypass (open surgery); vascular surgery + interventional radiology per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("RISK FACTOR CONTROL — smoking cessation (single most important), antiplatelet (aspirin or clopidogrel), high-intensity statin, BP <130/80, A1c <7%, diet + exercise per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WOUND CARE — DRY dressings (vs moist for venous); minimal debridement until perfusion improved; avoid aggressive debridement that can extend ischemia.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("AVOID COMPRESSION (significantly impedes already-compromised arterial flow); modified low-compression possible in mixed venous-arterial under specialty.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PAIN MANAGEMENT — multimodal; opioids often needed; gabapentin / pregabalin for neuropathic component.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("FOOT POSITIONING — DEPENDENT (lower than heart) — uses gravity to improve perfusion; opposite of venous management.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ANTIBIOTICS — for clinical infection (cellulitis, gangrene); often broad-spectrum + admit; cover anaerobes if necrotic.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("HYPERBARIC OXYGEN — selected non-healing wounds.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("AMPUTATION — when revascularization not feasible / failed + non-healing / infected; minor (toe / forefoot) → BKA → AKA depending on extent.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PREVENTION — daily foot inspection, proper footwear, no walking barefoot, podiatry follow-up, smoking cessation.", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("ACUTE LIMB ISCHEMIA — sudden 5 P's (pain, pulselessness, pallor, paresthesias, paralysis); emergent vascular surgery; thrombectomy / thrombolysis; <6 hr window.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("AMPUTATION — major (BKA / AKA) → high mortality (25-50% at 5 years); rehabilitation + prosthetics + psychosocial support.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("NECROTIZING SOFT TISSUE INFECTION — rare; emergent surgical + IV abx.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MARJOLIN ULCER — squamous cell carcinoma in chronic non-healing wound; biopsy if persistent.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CARDIOVASCULAR mortality — PAD is marker of generalized atherosclerosis; CAD + stroke risk; aggressive CV risk reduction.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DIABETIC concurrent — combined neuropathic + ischemic; multidisciplinary; higher amputation risk.", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ChronicOsteomyelitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "osteomyelitis-chronic",
        title: "Chronic osteomyelitis",
        subtitle: "Bone infection >6 weeks · sinus tract / sequestrum / involucrum · MRI + bone biopsy · 6-12 weeks IV abx + surgical debridement · long-term morbidity",
        nclexTags: woundR24,
        definition: AttributedProse(
            "Bone infection persisting >6 weeks despite treatment; characterized by necrotic bone (sequestrum), reactive bone formation (involucrum), sinus tracts. Often follows open trauma, surgical complication, or contiguous spread (diabetic foot ulcer, pressure injury). Difficult to eradicate; high recurrence; long-term IV abx + surgical debridement essential per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "Bacterial colonization of bone → biofilm formation → chronic inflammation → bone necrosis → sequestrum (necrotic bone fragment) + involucrum (new bone around sequestrum) + sinus tract (drains to skin). S. aureus most common; polymicrobial in DFU + pressure injury; gram-negatives + anaerobes in chronic + nosocomial.",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("PERSISTENT WOUND not healing — diabetic foot ulcer, pressure injury, post-surgical wound.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("SINUS TRACT draining purulent material from skin to bone.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("EXPOSED BONE in wound or POSITIVE PROBE-TO-BONE test.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Pain over affected area; usually less than acute osteomyelitis.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Systemic symptoms often absent in chronic; fever uncommon.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Recurrent flares of pain, swelling, drainage interspersed with quiescent periods.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Risk factors — diabetic foot ulcer, pressure injury, prior fracture (especially open), prior surgery, vascular insufficiency, immunosuppression.", citationIDs: ["specialty_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MRI — gold standard imaging; high sensitivity + specificity; identifies sequestrum + involucrum + sinus tract per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("XR — late changes (sequestrum, involucrum); insensitive early.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CT — useful for bone detail; alternative to MRI when contraindicated.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Bone scan — three-phase; positive in chronic but less specific.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("BONE BIOPSY + CULTURE — gold standard for organism identification; guides targeted abx; do AFTER stopping abx (if possible) for accurate culture per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("INFLAMMATORY MARKERS — ESR + CRP elevated (often >100 ESR, >5 CRP); useful for monitoring response.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Probe-to-bone test — sensitive + specific for diabetic foot osteomyelitis.", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("Confirm diagnosis with imaging + bone biopsy / culture.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Multidisciplinary — orthopedics + ID + wound care + vascular (if PAD) + endocrine (if DM).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Vascular assessment — perfusion required for healing.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Glycemic + nutritional + comorbidity optimization.", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("SURGICAL DEBRIDEMENT — remove sequestrum + necrotic bone; essential per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("IV ANTIBIOTICS 6-12 WEEKS — typically through PICC line; targeted to bone biopsy culture; vancomycin + ceftriaxone OR pip-tazo OR culture-guided per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ORAL STEPDOWN — high-bioavailability oral abx (linezolid, levofloxacin) for selected after initial IV per OVIVA trial; emerging evidence.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("LONG-TERM SUPPRESSIVE oral antibiotics — selected refractory + non-surgical candidates; lifelong sometimes.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("WOUND CARE — appropriate dressings; serial debridement; offload pressure (DFU, pressure injury).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("REVASCULARIZATION if PAD — perfusion essential for abx delivery + healing.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("HYPERBARIC OXYGEN — adjunctive in selected refractory cases.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("AMPUTATION — when extensive infection, failed treatment, life-threatening sepsis, irreversible vascular insufficiency.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Long-term follow-up + surveillance for recurrence.", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("RECURRENCE — common; serial monitoring with ESR + CRP + clinical + imaging.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CHRONIC SUPPRESSIVE THERAPY — if surgery not feasible; long-term oral abx; counseling.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("AMPUTATION — high in DFU + extensive soft tissue + vascular involvement.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PICC LINE complications — line infection, DVT; vigilant monitoring.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ANTIBIOTIC TOXICITY — vancomycin nephrotoxicity, levofloxacin tendon rupture / QT prolongation, linezolid thrombocytopenia / serotonin syndrome.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PSYCHOSOCIAL — long IV course + frequent appointments + impact on QOL; support.", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum CaregiverBurnoutSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "caregiver-burnout",
        title: "Caregiver burnout",
        subtitle: "Chronic stress + exhaustion + depression in informal caregiver · risk factor for elder abuse · respite + screening + community resources",
        nclexTags: psychR24,
        definition: AttributedProse(
            "Physical, emotional, mental exhaustion in caregivers (especially informal / family) of chronically ill or disabled relatives. Affects up to 60% of dementia caregivers; significant risk factor for caregiver depression, illness, mortality + for elder abuse / neglect. Often unrecognized + untreated per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "Chronic high-stress demands without adequate respite + social support → physiologic + psychological stress responses → cortisol dysregulation, immune dysfunction, sleep deprivation, depression, anxiety. Compounded by financial strain, role conflicts, ambiguous loss, anticipatory grief.",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("PHYSICAL — chronic fatigue, sleep disturbance, weight changes, headache, GI symptoms, weakened immunity (frequent illness), exacerbation of chronic conditions.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("EMOTIONAL — depression, anxiety, irritability, anger, guilt, hopelessness, social withdrawal, anhedonia.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("MENTAL — difficulty concentrating, decision-making impaired, apathy.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("BEHAVIORAL — neglect of own health, increased substance use, isolation, hostility toward care recipient.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("FINANCIAL — out-of-pocket caregiving costs, lost wages from reduced employment.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Risk factors — high-need care recipient (dementia, behavioral symptoms), prolonged caregiving duration, lack of social support, financial strain, female (most caregivers), pre-existing depression / anxiety, multiple competing roles.", citationIDs: ["specialty_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL recognition based on caregiver report + behavioral signs.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ZARIT BURDEN INTERVIEW (ZBI) — 22-item validated tool; ≥21 = high burden.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("MASLACH BURNOUT INVENTORY — emotional exhaustion + depersonalization + reduced personal accomplishment.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PHQ-9 + GAD-7 — depression + anxiety screening for caregiver.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Differentiate normal caregiving stress vs burnout vs major depression / anxiety disorder.", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("Routine caregiver screening at care recipient visits.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Mental health screening + suicide risk assessment.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Elder abuse / neglect screening — burnout is risk factor.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Caregiver own health needs + access to care.", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("RESPITE CARE — adult day programs, in-home respite, short-term residential respite; allows caregiver break.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("EDUCATION + SKILLS TRAINING — disease-specific (Alzheimer's Association, Parkinson's Foundation), problem-solving, behavioral management.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("SUPPORT GROUPS — in-person + online; reduces isolation; condition-specific groups.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("COMMUNITY RESOURCES — Area Agency on Aging, Meals on Wheels, transportation, home modifications, caregiver coaches.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PSYCHOLOGICAL TREATMENT — CBT for caregivers, mindfulness-based stress reduction, behavioral activation, antidepressants if depression diagnosed.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("FINANCIAL SUPPORT — Medicaid Home + Community-Based Services waivers, VA caregiver program (for veterans), state-specific paid family caregiver programs.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("LEGAL + ADVANCE PLANNING — POA, healthcare proxy, financial planning; reduces uncertainty + future stress.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER SELF-CARE counseling — sleep, nutrition, exercise, social connection, own medical care.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("LONG-TERM CARE planning — facility placement when home care no longer feasible; reduce shame / guilt.", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("ELDER ABUSE / NEGLECT — caregiver burnout is major risk; mandatory reporting; APS referral.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER MORTALITY — increased mortality for elderly caregivers under high strain (Schulz + Beach 1999); urgent intervention.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER DEPRESSION + SUICIDE — screen + treat aggressively; safety planning.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER MEDICAL ILLNESS — neglect of own health; ensure they have own PCP + care.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ANTICIPATORY GRIEF + COMPLICATED GRIEF after care recipient death; bereavement support.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("FAMILY CONFLICT around care decisions, financial burden distribution; family meetings + mediation.", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum FailureToThriveElderlySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "failure-to-thrive-elderly",
        title: "Failure to thrive in elderly (geriatric FTT)",
        subtitle: "Weight loss + decreased intake + functional decline + cognitive impairment · multifactorial · workup reversible · palliative consideration",
        nclexTags: nutR24,
        definition: AttributedProse(
            "Syndrome of weight loss, decreased appetite + nutrition, inactivity, cognitive impairment in older adults; not a single diagnosis but constellation. Often final common pathway of chronic illness, depression, dementia, polypharmacy, social isolation, or end-of-life. Workup reversible causes; consider palliative trajectory if non-reversible per primary source.",
            citationIDs: ["specialty_dx_round24", "openrn_dx_round24"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — chronic disease (cancer, heart failure, COPD, advanced dementia), depression, polypharmacy (anorexia from medications), dental issues, dysphagia, social isolation, financial limitations, alcohol / substance use, sensory deficits (taste / smell), age-related changes (sarcopenia, anorexia of aging).",
            citationIDs: ["specialty_dx_round24"]
        ),
        presentation: [
            AttributedBullet("Unintentional WEIGHT LOSS — typically ≥5% body weight in 6-12 months OR ≥10% over 1 year; significant marker.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("DECREASED APPETITE / intake — anorexia of aging; lack of interest in food.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("FUNCTIONAL DECLINE — ADLs / IADLs decline; sarcopenia + frailty.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("COGNITIVE IMPAIRMENT — depression, dementia, delirium contributing.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Social withdrawal, depression, fatigue, weakness.", citationIDs: ["openrn_dx_round24"]),
            AttributedBullet("Common contributors — depression, poor dentition, dysphagia, polypharmacy, medical illness exacerbation, cognitive decline, social isolation, financial hardship, alcohol abuse, end-of-life process.", citationIDs: ["specialty_dx_round24"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL based on weight loss + functional / cognitive / nutritional decline; no specific lab.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Workup REVERSIBLE causes — TSH, B12, vitamin D, A1c, CBC, CMP, depression screening (PHQ-9 / GDS), nutritional assessment (MNA-SF), dental exam, swallow eval (SLP), medication review (Beers / STOPP), socioeconomic / safety assessment.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Cancer screening if not done — colonoscopy, mammography, prostate, etc. (risk-benefit per life expectancy).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Functional assessment — Katz ADL, Lawton IADL, gait speed, hand grip strength.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Comprehensive geriatric assessment (CGA).", citationIDs: ["specialty_dx_round24"])
        ],
        priorityAssessments: [
            AttributedBullet("Comprehensive workup for reversible causes.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Nutritional + functional + cognitive + mood assessment.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Goals of care discussion — match aggressiveness to prognosis + values.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("Caregiver + family + social context.", citationIDs: ["specialty_dx_round24"])
        ],
        commonInterventions: [
            AttributedBullet("TREAT REVERSIBLE causes — depression (SSRI especially mirtazapine for appetite + sleep), thyroid, B12 / D / iron, dental issues, dysphagia (SLP + diet modification), polypharmacy review.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("NUTRITIONAL — small frequent calorie-dense meals; preferred foods; oral nutritional supplements (Ensure, Boost) between meals; protein 1.2-1.5 g/kg/day per primary source.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("APPETITE STIMULANTS (limited evidence) — mirtazapine 7.5-15 mg QHS (sedation + appetite + mood), megestrol (limited benefit + DVT / adrenal suppression risk), dronabinol (cancer cachexia).", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("EXERCISE / PT — strength + balance training; reduces sarcopenia + improves function.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("SOCIAL engagement — community programs, senior centers, religious activities, family connection.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER + family education + support.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PALLIATIVE CARE consultation — for end-of-life trajectory + symptom management + goals of care.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ENTERAL FEEDING (PEG) — limited evidence for benefit in advanced dementia FTT; does NOT improve survival, quality of life, or aspiration risk per primary source; often unnecessary; family education important.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("ADVANCE CARE PLANNING — DPOA, POLST, hospice consideration if appropriate.", citationIDs: ["specialty_dx_round24"])
        ],
        watchFor: [
            AttributedBullet("DEPRESSION often missed — strongly associated with FTT + treatable; SCREEN + treat aggressively.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("OCCULT MALIGNANCY — appropriate workup; balance with prognosis + life expectancy.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("FALLS + FRACTURES — sarcopenia + weakness; aggressive prevention.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("DEHYDRATION — common; counsel + encourage fluids.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("PRESSURE INJURIES — malnutrition + immobility risk.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("END-OF-LIFE — FTT may be sign of dying process; PEG feeding does not reverse + adds discomfort; comfort care + family support; hospice referral.", citationIDs: ["specialty_dx_round24"]),
            AttributedBullet("CAREGIVER BURDEN — assess + support; respite; resources.", citationIDs: ["specialty_dx_round24"])
        ],
        citations: [openrnDxR24, cdcDxR24, specialtyDxR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}
