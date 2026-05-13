import Foundation

// Curator-model diagnosis entries (round 31 — neurology depth: headache + movement + autoimmune + infectious + SCI sequelae).

private let openrnDxR31 = CitationSource(
    id: "openrn_dx_round31",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcDxR31 = CitationSource(
    id: "cdc_dx_round31",
    shortName: "CDC + NINDS + AAN concept citations",
    publisher: "CDC · NINDS · AAN",
    license: .publicDomain,
    url: "https://www.ninds.nih.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyDxR31 = CitationSource(
    id: "specialty_dx_round31",
    shortName: "AAN + AHS + IHS + MDS + ILAE concept citations",
    publisher: "AAN · AHS · IHS · MDS · ILAE",
    license: .factCitationOnly,
    url: "https://www.aan.com/Guidelines/",
    lastRetrieved: "2026-05-13"
)

private let headacheTagR31 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .painComfort)
private let neuroTagR31 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation)
private let infectionNeuroTagR31 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection)
private let perfusionNeuroTagR31 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)

public enum ClusterHeadacheSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cluster-headache",
        title: "Cluster headache",
        subtitle: "Trigeminal autonomic cephalalgia · severe unilateral periorbital + autonomic features · circadian + seasonal · oxygen + triptans + verapamil + galcanezumab",
        nclexTags: headacheTagR31,
        definition: AttributedProse(
            "Trigeminal autonomic cephalalgia — severe strictly unilateral periorbital or temporal headache with ipsilateral autonomic features (lacrimation, conjunctival injection, ptosis, miosis, nasal congestion, rhinorrhea). Episodic clusters (weeks-months) with remission OR chronic. Patients agitated + pace. Acute — 100% oxygen + SC sumatriptan; preventive — verapamil + galcanezumab + steroids transitional per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "Posterior hypothalamic activation + trigeminal autonomic reflex — neural mechanism + circadian regulation explaining strict unilaterality + clockwork timing + autonomic features. Genetic predisposition + male predominance (3-4:1).",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("STRICTLY UNILATERAL periorbital + temporal severe pain — \"suicide headache\" intensity; sharp, stabbing, drilling; 15-180 minutes duration.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("AUTONOMIC features ipsilateral — lacrimation + conjunctival injection + ptosis + miosis (partial Horner) + nasal congestion + rhinorrhea + facial sweating.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("BEHAVIORAL — agitation, restlessness, pacing (in contrast to migraine where patients prefer rest in dark room).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("CIRCADIAN + SEASONAL pattern — predictable timing (often same time each day, especially night); seasonal recurrence (spring + fall common).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("CLUSTER PERIODS — 2 weeks to 3 months with daily attacks; remissions months to years (episodic 80-90%); chronic without remission (10-20%).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — MALE predominance (3-4:1), age 20-50 peak, smoking history (~90%), alcohol triggers during cluster, family history.", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ICHD-3 diagnostic criteria — ≥5 attacks of severe unilateral orbital/supraorbital/temporal pain 15-180 min + ≥1 autonomic feature OR restlessness/agitation + frequency 1 every other day to 8/day during cluster per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MRI brain — exclude structural cause especially first cluster or atypical features.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Pituitary/MRI — secondary cluster from pituitary lesions reported.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Differential — trigeminal neuralgia (briefer, not autonomic), SUNCT/SUNA (briefer, autonomic), paroxysmal hemicrania (responds to indomethacin), hemicrania continua, migraine without aura.", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("Distinguish episodic vs chronic cluster — duration + remission pattern.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Identify triggers — alcohol especially during cluster (avoid); smoking + lifestyle.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Brain imaging if atypical — exclude secondary cause.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Mental health screening — suicide risk during severe clusters.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE — 100% OXYGEN 12-15 L/min via non-rebreather × 15-20 minutes (HIGHLY effective; rapid onset) per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ACUTE — SUMATRIPTAN 6 mg SC (preferred over PO due to rapid onset); zolmitriptan 5 mg nasal spray.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ACUTE — INTRANASAL LIDOCAINE 4% spray; dihydroergotamine (DHE) SC/IV/nasal.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PREVENTIVE — VERAPAMIL 240-960 mg PO daily divided (start 80 mg TID, titrate); ECG baseline + at each dose increase (PR/AV block); first-line preventive.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PREVENTIVE — GALCANEZUMAB (Emgality) 300 mg SC monthly — FDA-approved specifically for episodic cluster.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("TRANSITIONAL — corticosteroids (prednisone 60-100 mg PO × 5 days → taper) + greater occipital nerve block; bridge to verapamil takes weeks.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("REFRACTORY — lithium, topiramate, melatonin, ergot derivatives; SPHENOPALATINE GANGLION stimulation; deep brain stimulation; occipital nerve stimulation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Triggers — avoid ALCOHOL during cluster; smoking cessation; sleep hygiene.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Mental health support — depression + suicide risk during severe clusters.", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("SUICIDE — \"suicide headache\" name reflects extreme intensity + despair during attacks; mental health support + screening.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("VERAPAMIL cardiac toxicity — AV block, bradycardia; ECG monitoring at each dose increase.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("TRIPTAN overuse + medication-overuse headache — limit triptans + acute treatments.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("OXYGEN home delivery — coordinate with respiratory; cost + insurance.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Chronic vs episodic transition — clusters can convert to chronic.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Pregnancy — limited preventive options; oxygen + lidocaine spray safer.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TensionHeadacheSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tension-type-headache",
        title: "Tension-type headache (TTH)",
        subtitle: "Most common primary headache · bilateral pressing/tightening · mild-moderate · NO nausea/vomiting · acute analgesics + amitriptyline prophylaxis",
        nclexTags: headacheTagR31,
        definition: AttributedProse(
            "Most common primary headache disorder — bilateral pressing/tightening mild-moderate quality without aggravation by physical activity, nausea, or vomiting; mild photophobia OR phonophobia possible but not both. Episodic infrequent (<1/month), episodic frequent (1-14/month), chronic (≥15/month). Multifactorial — myofascial + central sensitization + psychosocial per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — peripheral myofascial pain (pericranial + cervical muscle tension), central sensitization (chronic), psychosocial stressors, sleep disturbance, posture. Distinct from migraine despite some overlap.",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("BILATERAL pressing/tightening (band-like) quality; mild-moderate intensity; 30 minutes to 7 days duration.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("NOT aggravated by routine physical activity (unlike migraine).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("NO nausea / vomiting (mild photophobia OR phonophobia but not both).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Pericranial muscle tenderness — palpation often positive.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Triggers — stress, fatigue, sleep deprivation, poor posture, eyestrain, hunger, dehydration.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Chronic TTH — ≥15 days/month × ≥3 months; comorbid depression + anxiety + sleep disorders common.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — stress + lifestyle factors; female slight predominance; age 30-50 peak; comorbid migraine common.", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ICHD-3 — ≥2 of: bilateral, pressing/tightening, mild-moderate, NOT aggravated by activity; NO nausea/vomiting; ≤1 of photophobia OR phonophobia; episodic infrequent/frequent vs chronic by frequency per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Diagnosis clinical; imaging only for red flags (acute worsening, age >50, neurologic deficits, immunocompromise).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Differential — migraine without aura, medication-overuse headache, secondary causes (cervicogenic, sinusitis, TMJ, intracranial mass).", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("Headache diary — frequency, severity, duration, triggers, medication use.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Identify triggers + lifestyle factors.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Mental health + sleep assessment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Medication-overuse headache screening — frequent acute meds.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Red flags — emergent imaging.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE — over-the-counter NSAIDs (ibuprofen 400-800 mg, naproxen 500 mg) OR acetaminophen 1000 mg; combination acetaminophen + caffeine + aspirin (Excedrin) effective per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("LIMIT acute meds — ≤2-3 days/week to prevent medication-overuse headache.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PROPHYLACTIC for frequent/chronic — AMITRIPTYLINE 10-25 mg PO at bedtime, titrate to 50-100 mg; first-line preventive.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Alternative preventives — nortriptyline (less sedation), mirtazapine, venlafaxine, gabapentin, topiramate.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("NON-PHARMACOLOGIC — biofeedback, cognitive behavioral therapy, relaxation training, physical therapy (cervical), trigger point injections, acupuncture; effective + first-line for many.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Lifestyle — sleep hygiene, regular exercise, stress management, hydration, regular meals, posture, ergonomics, eye strain reduction.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Treat comorbidities — depression, anxiety, sleep disorders, neck pain.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("BOTOX — chronic migraine indication only (not TTH); some off-label TTH use.", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("MEDICATION-OVERUSE HEADACHE — common transformation from frequent acute medication use (≥10-15 days/month); withdraw + bridge.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("DEPRESSION + anxiety — comorbid; SSRI + non-pharmacologic.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MISDIAGNOSIS — migraine without aura, sinusitis, TMJ, cervicogenic.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("AMITRIPTYLINE side effects — anticholinergic, sedation, weight gain, QT; elderly precautions.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CHRONIC TTH significantly impacts QoL; multidisciplinary approach.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Sometimes coexists with migraine — both must be treated.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MedicationOveruseHeadacheSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "medication-overuse-headache",
        title: "Medication-overuse headache (MOH)",
        subtitle: "≥15 HA days/month + frequent acute medication overuse · triptan/ergot/opioid/butalbital 10+/month or analgesic 15+/month · withdrawal protocol + bridge",
        nclexTags: headacheTagR31,
        definition: AttributedProse(
            "Chronic headache (≥15 days/month) occurring in patients with primary headache disorder (usually migraine OR TTH) overusing acute headache medications. Triggers: triptans/ergots/opioids/butalbital combinations ≥10 days/month OR simple analgesics ≥15 days/month for ≥3 months. Treatment — discontinue overused medication + bridge + preventive + nonpharmacologic per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "Central sensitization + receptor adaptation from chronic acute medication exposure → rebound headache + reduced threshold for headache. Genetic predisposition + medication-specific mechanisms (opioid > butalbital > triptan/ergot > combination > simple analgesic by risk).",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("HEADACHE ≥15 days/month — daily OR near-daily; often morning OR awakens patient.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("OVERUSED acute headache MEDICATION ≥3 months — triptans/ergots/opioids/butalbital combinations ≥10 days/month OR simple analgesics ≥15 days/month.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Underlying primary headache (migraine most common, then TTH).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("REBOUND on medication withdrawal — temporary worsening before improvement.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — frequent acute medication use, opioids/butalbital highest risk, female, depression/anxiety, sleep disorders.", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ICHD-3 — headache ≥15 days/month + regular overuse of acute medication for ≥3 months per criteria above per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Headache diary — confirms pattern + medication use.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Rule out secondary causes if atypical or red flags.", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify overused medication + duration + frequency.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Mental health + depression/anxiety screening.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Comprehensive medication review.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Patient education + commitment to withdrawal protocol.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Outpatient vs inpatient withdrawal decision.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("DISCONTINUATION of overused medication — abrupt vs taper depending on agent; opioid + butalbital tapering required (withdrawal syndrome); triptans + analgesics often abrupt per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("BRIDGE THERAPY — naproxen 500 mg BID × 2-4 weeks; prednisone 60 mg × 5 days taper; nerve blocks; antiemetics (prochlorperazine, metoclopramide).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PREVENTIVE initiation during withdrawal — amitriptyline, topiramate, beta-blockers, CGRP-MAB; addresses underlying primary headache.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("NON-PHARMACOLOGIC — cognitive behavioral therapy, biofeedback, relaxation, lifestyle (sleep, exercise, regular meals, hydration), stress management.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Acute medication LIMITS post-withdrawal — strict limits ≤2-3 days/week; rescue therapy planning.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Treat comorbidities — depression, anxiety, insomnia, substance use disorder if opioid-related.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Follow-up — headache diary + monthly visits initially; success defined as headache day reduction + medication use within limits.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Inpatient withdrawal — severe MOH, multiple comorbidities, opioid dependence, prior failures.", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("WITHDRAWAL REBOUND — temporary severe headache worsening; bridge therapy; coach patience; usually improves within 2-4 weeks.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("OPIOID WITHDRAWAL — physiologic dependence; taper required; substance use disorder treatment if applicable.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("BUTALBITAL WITHDRAWAL — seizure risk; taper required + close monitoring.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("RELAPSE common — patient education + ongoing support + preventive + lifestyle.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("DEPRESSION + ANXIETY contribute + complicate; treat concurrently.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PATIENT EDUCATION — understand cause + commitment; many initially reluctant; multidisciplinary support.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ACUTE MEDICATION SCRIPTING — limits + rescue plan; preventives + abortive distinct roles.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum EssentialTremorSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "essential-tremor",
        title: "Essential tremor (ET)",
        subtitle: "Most common movement disorder · bilateral postural + kinetic upper extremity tremor · improves with alcohol · propranolol + primidone · DBS for severe",
        nclexTags: neuroTagR31,
        definition: AttributedProse(
            "Most common movement disorder; bilateral postural + kinetic upper extremity tremor (8-12 Hz) for ≥3 years. Distinct from Parkinson's (rest tremor, asymmetric, other parkinsonism). Improved by alcohol in many. First-line treatment — propranolol + primidone; DBS or focused ultrasound for refractory per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "Cerebellar-thalamic-cortical loop dysfunction; familial autosomal dominant in ~50% (LINGO1, others); neurodegenerative + neurophysiologic mechanisms.",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("BILATERAL upper extremity postural + kinetic tremor (action tremor); 8-12 Hz frequency; symmetric mostly.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("HEAD TREMOR — yes/no (titubation) or side-to-side; voice tremor common.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Distinct from PARKINSON's (rest tremor + asymmetric + other parkinsonism features), cerebellar (intention + with target approach), dystonic, drug-induced, physiologic.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("ALCOHOL RESPONSIVENESS — many patients (50-70%) experience temporary improvement with small alcohol; helps differentiation from Parkinson + cerebellar.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Progressive worsening over decades; impacts ADLs (writing, eating, drinking, fine motor).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Family history positive ~50%.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — family history + age (peak >65), but can start anytime; female + male equal; mild cognitive impairment in some.", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — bilateral upper extremity action tremor ≥3 years + isolated tremor syndrome (no Parkinson, cerebellar, dystonia, drug); other body areas (head, voice, lower extremity) possible per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Differentiate from PARKINSON — Parkinson has REST tremor (improves with action), asymmetric, with rigidity + bradykinesia + posture/gait; DAT scan + clinical exam.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Differentiate from CEREBELLAR — intention tremor (worse approaching target), dysmetria, ataxia, dysdiadochokinesia.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Rule out — hyperthyroidism (TSH), drug-induced (lithium, valproate, beta-agonists, caffeine, stimulants, SSRIs, amiodarone, tacrolimus), Wilson disease in young (ceruloplasmin), Fragile X tremor-ataxia syndrome (FXTAS).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Brain MRI — typically normal; consider if focal neurologic deficits or onset younger.", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("Distinguish from Parkinson disease — critical for management.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Medication review for drug-induced tremor + thyroid screening.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Functional impact assessment — ADLs, occupation, psychosocial.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Family history + genetic counseling if early onset.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Multidisciplinary — neurology + neurosurgery for advanced cases.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("FIRST-LINE — PROPRANOLOL 60-320 mg PO daily; titrate; effective ~50%; contraindications include asthma, heart block, severe diabetes per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("FIRST-LINE alternative — PRIMIDONE 25-750 mg PO daily; titrate slowly (sedation + dizziness initial); effective ~50%.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("SECOND-LINE — topiramate, gabapentin, atenolol, clonazepam, alprazolam (limited due to dependence).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("DEEP BRAIN STIMULATION (DBS) — VIM thalamus; severe refractory; significant improvement in many; surgical risks + ongoing management.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MR-GUIDED FOCUSED ULTRASOUND THALAMOTOMY — unilateral non-invasive ablation; emerging alternative to DBS.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Botulinum toxin — focal use for head/voice tremor; limited evidence.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Lifestyle — avoid caffeine + nicotine + stimulants; alcohol moderation (don't rely on it as treatment); stress management; assistive devices.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Occupational therapy — adaptive devices, weighted utensils, ergonomic adjustments.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Mental health support — depression + social impact + work impact.", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("Misdiagnosis as Parkinson — critical to differentiate; DAT scan + clinical specialist evaluation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PROPRANOLOL side effects — bradycardia, hypotension, fatigue, depression, sexual dysfunction; contraindications.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PRIMIDONE side effects — sedation + ataxia initial; slow titration; tolerance develops; phenobarbital metabolite contributes.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("DBS complications — stroke, hemorrhage, infection, hardware issues; experienced center.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ALCOHOL DEPENDENCE — patients may self-medicate; counsel + screen.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PSYCHOSOCIAL impact — social anxiety + depression + work limitation; mental health support.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PROGRESSIVE COURSE — worsens over decades; adjust treatment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Mild cognitive impairment + dementia — increased risk in elderly ET.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum RLSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "restless-legs-syndrome",
        title: "Restless legs syndrome (RLS / Willis-Ekbom disease)",
        subtitle: "Sensorimotor disorder · urge to move legs + dysesthesia · circadian (evening/night) · iron deficiency common cause · gabapentin/pregabalin > dopamine agonists",
        nclexTags: neuroTagR31,
        definition: AttributedProse(
            "Sensorimotor disorder — irresistible urge to move legs with unpleasant dysesthesia, worse at rest + evening/night, relieved by movement. Primary (idiopathic, often familial) vs secondary (iron deficiency, ESRD, pregnancy, peripheral neuropathy, medication-induced). Treatment — iron repletion + alpha-2-delta ligands (gabapentin enacarbil, pregabalin) preferred over dopamine agonists (augmentation risk) per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "Brain iron deficiency + dopaminergic system dysfunction in basal ganglia / substantia nigra; genetic predisposition (MEIS1, BTBD9, MAP2K5 loci); neurotransmitter imbalance + circadian regulation.",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("URGE TO MOVE legs (typically) accompanied by uncomfortable + dysesthetic sensations (crawling, itching, throbbing, pulling, electric).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Symptoms BEGIN OR WORSEN at rest + during inactivity.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Symptoms PARTIALLY OR TOTALLY RELIEVED by movement.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("CIRCADIAN pattern — worse evening/night; sleep disruption; insomnia.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("PERIODIC LIMB MOVEMENTS OF SLEEP (PLMS) — common comorbid; involuntary limb movements during sleep.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Secondary causes — iron deficiency (most common), end-stage renal disease, pregnancy (3rd trimester), peripheral neuropathy (diabetes), medications (antidepressants — SSRI/SNRI/TCA/mirtazapine, antipsychotics, antihistamines like diphenhydramine, metoclopramide, lithium).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — family history (~50% primary), iron deficiency anemia, ESRD, pregnancy, age >50, female, sleep deprivation.", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — 4 essential criteria (\"URGE\"): Urge to move legs with uncomfortable sensations, Rest worsens, Get up to move relieves, Evening/night worsening; all 4 required per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("FERRITIN level — target >75 ng/mL (some say >100); ferritin <75 → iron repletion indicated; serum iron + TIBC + saturation; transferrin saturation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("BUN/Cr — ESRD as secondary cause.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Polysomnography — supportive but not required; PLMS index >15/hour supports.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Pregnancy test — symptoms often appear/worsen 3rd trimester.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Medication review — common offenders.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Differential — leg cramps, peripheral neuropathy, akathisia (medication-induced), claudication, positional pain.", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("Iron studies + ferritin — target >75 ng/mL.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Secondary cause workup — ESRD, pregnancy, peripheral neuropathy, medications.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Sleep + functional impact assessment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Medication review + discontinuation of offending agents when possible.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Avoid dopamine agonists as first-line (augmentation risk).", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("IRON REPLETION — ferrous sulfate 325 mg PO daily + vitamin C IF FERRITIN <75 ng/mL; IV iron (iron sucrose, ferric carboxymaltose, iron isomaltoside) for severe deficiency or refractory per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("FIRST-LINE pharmacology — ALPHA-2-DELTA LIGANDS (gabapentin enacarbil 600 mg PO at 5 PM; pregabalin 150-450 mg PO at bedtime; gabapentin 300-1800 mg at bedtime); preferred over dopamine agonists due to augmentation risk.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("DOPAMINE AGONISTS — pramipexole 0.125-0.5 mg PO at bedtime; ropinirole 0.25-3 mg PO at bedtime; rotigotine patch 1-3 mg/24h transdermal; AUGMENTATION RISK (symptoms worsen + spread proximally + earlier in day) limits long-term use; reserved for severe refractory or short-term.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("OPIOIDS for refractory — oxycodone, methadone, tramadol; low-dose; risk of dependence.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("NON-PHARMACOLOGIC — leg massage + warm/cool baths + stretching + walking + pneumatic compression; counterintuitive activity; caffeine + alcohol + smoking moderation; sleep hygiene.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Treat SECONDARY causes — iron, ESRD (dialysis optimization), pregnancy (non-pharmacologic first), peripheral neuropathy.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Medication review + DISCONTINUE OFFENDERS when feasible — antidepressants (consider bupropion alternative), antihistamines (diphenhydramine), metoclopramide, lithium.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Pregnancy — non-pharmacologic + IRON + low-dose carbidopa-levodopa for severe (off-label, evidence limited); avoid pregabalin/gabapentin/dopamine agonists in early pregnancy.", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("AUGMENTATION on dopamine agonists — symptoms worsen + spread proximally + start earlier in day + sometimes upper extremities; reduce dose + switch to alpha-2-delta ligand + sometimes opioid bridge.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("REBOUND on missed/delayed doses — symptoms worsen; counsel adherence.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("IRON deficiency screening — primary modifiable factor; recheck periodically.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MEDICATION-INDUCED RLS — review + discontinue offenders.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Sleep disturbance + daytime fatigue + cognitive impact.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MENTAL HEALTH — anxiety + depression comorbid; significant QoL impact.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Pregnancy management — coordinate with OB; non-pharmacologic first; IRON; avoid most pharmaceuticals.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AntiNMDARSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "anti-nmda-encephalitis",
        title: "Anti-NMDA-receptor encephalitis",
        subtitle: "Autoimmune limbic encephalitis · young women + ovarian teratoma · psychiatric + seizures + dyskinesia + autonomic + dysautonomia · IVIG + plasmapheresis + rituximab",
        nclexTags: infectionNeuroTagR31,
        definition: AttributedProse(
            "Most common autoimmune encephalitis — IgG antibodies against GluN1 subunit of NMDA receptor. Young women (often <30), ~50% with ovarian teratoma. Multistage syndrome — prodromal viral-like → psychiatric (psychosis, agitation, mania) → seizures → movement disorders (orofacial dyskinesias) + autonomic instability + decreased consciousness → recovery slow. Treatment — TUMOR REMOVAL if present + IVIG/plasmapheresis + steroids → rituximab/cyclophosphamide if refractory per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "IgG autoantibodies against GluN1 subunit of NMDA receptor → internalize + downregulate NMDA receptors on neurons → glutamatergic hypofunction → psychiatric, motor, seizure, autonomic manifestations. Trigger — ovarian teratoma (50%), other tumors (rare), preceding HSV encephalitis, idiopathic.",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("PRODROMAL phase (days-weeks) — flu-like, headache, fever.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("PSYCHIATRIC phase — anxiety, agitation, psychosis (delusions, hallucinations), mania, paranoia, catatonia, mutism; often misdiagnosed as primary psychiatric.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("SEIZURE phase — focal or generalized seizures; status epilepticus common.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("MOVEMENT DISORDERS — orofacial dyskinesias (characteristic), chorea, dystonia, rigidity, opisthotonus.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("AUTONOMIC DYSREGULATION — hyperthermia, BP fluctuations, arrhythmias, hypoventilation, salivation, urinary issues; may require ICU.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("DECREASED LEVEL OF CONSCIOUSNESS — coma in severe cases.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("MEMORY + COGNITIVE deficits — recovery slow over months-years.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — young women (median 21 years), ovarian teratoma (~50% female), preceding HSV encephalitis (in some), idiopathic, pediatric cases (no tumor usually).", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ANTI-NMDA-R ANTIBODIES — IgG against GluN1; CSF more sensitive than serum; CSF positivity diagnostic per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CSF analysis — lymphocytic pleocytosis (~75%), oligoclonal bands, mildly elevated protein; rule out HSV, bacterial, viral other.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MRI BRAIN — often NORMAL; sometimes T2 hyperintensities in medial temporal lobes (limbic) + cortical/subcortical.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("EEG — diffuse slowing; \"extreme delta brush\" pattern characteristic; seizures.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("TUMOR WORKUP — pelvic + abdominal imaging (transvaginal US + MRI for ovarian teratoma); chest/abdomen CT.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Exclude infectious encephalitis — HSV PCR, other viral, bacterial cultures.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Anti-NMDA-R is part of comprehensive autoimmune encephalitis panel; consider with NMDA-, GABA-A/B, AMPA, LGI1, CASPR2, GAD65, others.", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("EMERGENT ICU admission — autonomic instability + airway protection + seizures.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("TUMOR WORKUP — pelvic/abdominal imaging emergent; tumor removal expedites recovery.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Multidisciplinary — neurology + critical care + gynecology + oncology + psychiatry + IR (plasmapheresis).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Anti-NMDA-R antibodies + autoimmune encephalitis panel sent early.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Empiric treatment may begin before antibody result.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("TUMOR REMOVAL — emergent surgical resection of ovarian teratoma if found; transforms prognosis per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("FIRST-LINE IMMUNOTHERAPY — IVIG 2 g/kg over 2-5 days OR PLASMA EXCHANGE 5-7 sessions OR HIGH-DOSE METHYLPREDNISOLONE 1 g IV × 5 days; often combination.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("SECOND-LINE for refractory — RITUXIMAB 375 mg/m² IV weekly × 4 OR CYCLOPHOSPHAMIDE 750 mg/m² IV monthly × 3-6 months.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MAINTENANCE — rituximab q6 months OR mycophenolate OR azathioprine × 12-24+ months to prevent relapse.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ICU SUPPORTIVE CARE — airway protection + mechanical ventilation if needed, autonomic management (sedation, beta-blockers for tachycardia), seizure control (multiple AEDs), nutrition + skin care.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PSYCHIATRIC management — antipsychotics often required for agitation (avoid haloperidol — worsens dyskinesia); benzodiazepines for agitation + seizures.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("SEIZURE management — multiple AEDs needed; status epilepticus protocols.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("REHABILITATION — long-term cognitive + motor recovery over months-years; physical therapy + occupational therapy + speech + cognitive rehabilitation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Multidisciplinary follow-up — neurology + psychiatry + gynecology if teratoma + relapse surveillance.", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("RECOVERY SLOW + INCOMPLETE — recovery over months-years; ~80% achieve substantial recovery; ~20% with significant disability + 5-10% mortality.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("RELAPSE — 12-25% relapse; maintenance immunotherapy reduces.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("HALOPERIDOL + first-generation antipsychotics — worsen dyskinesia + autonomic; AVOID; use atypicals (quetiapine, olanzapine) at lowest effective doses.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("DELAYED DIAGNOSIS — psychiatric presentation often misdiagnosed as primary psychiatric disorder; high suspicion in young women + neurologic features + atypical psychiatric.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("AUTOIMMUNE OVERLAP — other limbic encephalitis (LGI1 — facio-brachial dystonic seizures + hyponatremia in elderly; CASPR2; GABA-B; AMPA).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PARANEOPLASTIC — teratoma in young women; rule out other tumors in older patients with atypical presentations.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("POST-HSV PRECEDED cases — secondary autoimmune phenomenon weeks-months after HSV encephalitis recovery.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ICU complications — VTE, pressure injuries, hospital-acquired infections, ventilator-associated pneumonia.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AutonomicDysreflexiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "autonomic-dysreflexia",
        title: "Autonomic dysreflexia (AD)",
        subtitle: "EMERGENT in SCI T6 + above · severe HTN + bradycardia + HA + sweating ABOVE lesion + flushing · noxious stimulus below · sit upright + remove trigger + nifedipine",
        nclexTags: perfusionNeuroTagR31,
        definition: AttributedProse(
            "Life-threatening hypertensive emergency in patients with spinal cord injury (SCI) at T6 or above. Uncontrolled sympathetic response to noxious stimulus below the level of injury (most often BLADDER distension OR BOWEL impaction) — severe hypertension + bradycardia + pounding headache + diaphoresis + flushing above lesion + pallor below + nasal congestion. EMERGENCY — sit upright + identify + remove trigger + antihypertensive (nifedipine SL OR captopril SL) if BP persists per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "Noxious stimulus below SCI level → afferent signals → uninhibited sympathetic outflow below lesion → vasoconstriction + hypertension → carotid + aortic baroreceptors detect hypertension → parasympathetic response above lesion (vasodilation, sweating, flushing, headache) + cardiac bradycardia; descending inhibition cannot reach below lesion → escalating HTN.",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("SEVERE HYPERTENSION — sudden SBP ≥20-40 mm Hg above baseline (often 200+); can reach 300/200.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("POUNDING HEADACHE — frontal, severe; hallmark.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("BRADYCARDIA — paradoxical (baroreceptor reflex from hypertension); 50-60 BPM usually.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("DIAPHORESIS + FLUSHING ABOVE lesion — face, neck, upper trunk.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("PALLOR + COOL skin BELOW lesion — vasoconstriction.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Anxiety, apprehension, blurred vision, nasal congestion + stuffiness.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("TRIGGERS — bladder distension (most common — urinary retention, blocked catheter), bowel impaction, urinary/bowel procedures, sexual activity, labor + delivery, ingrown toenail, tight clothing, pressure injury, fracture, DVT.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — SCI at T6 OR above, especially complete tetraplegia; women with SCI during labor + delivery; first 2 years post-injury highest risk but lifelong.", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — SCI T6 or above + sudden HTN + symptoms (HA, sweating above lesion, flushing) + noxious trigger below lesion per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("BP measurement — sudden ≥20-40 mm Hg above baseline; baseline often low (~90-110 SBP in SCI).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Identify trigger — bladder scan + urinary catheter assessment + abdominal/rectal exam for impaction + skin inspection + foot examination.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Differential — preeclampsia (SCI + pregnancy), pheochromocytoma (rare), thyroid storm, primary HTN crisis.", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("EMERGENT — life-threatening; risk of stroke, MI, seizure, death.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("BP monitoring continuous + close.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Identify + REMOVE TRIGGER — primary intervention.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Sit upright + loosen clothing — immediate.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Antihypertensive if BP persists despite trigger removal.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("SIT UPRIGHT — head + trunk elevation to maximize orthostatic blood pooling + reduce BP per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("LOOSEN clothing + restraints + remove constrictive garments.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("IDENTIFY + REMOVE TRIGGER — BLADDER: check for distension, drain catheter (irrigate or replace if blocked); BOWEL: digital exam + manual disimpaction (LIDOCAINE LUBRICANT gel — without lidocaine can worsen); SKIN: pressure injuries + ingrown toenails + tight clothing.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ANTIHYPERTENSIVE if SBP >150 OR symptoms persist after trigger removal — NIFEDIPINE 10 mg sublingual / immediate-release capsule chewed OR CAPTOPRIL 25 mg SL OR HYDRALAZINE 10-20 mg IM/IV OR nitrate paste; rapid-acting + short-duration so doesn't precipitate sustained hypotension as trigger is removed.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Continuous BP monitoring × 2-4 hours post-episode; some require ICU.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Prevention — bladder management protocols + bowel program + skin care + preventive treatment of triggers; education for SCI patients + caregivers.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Pregnancy + labor — emergent management; epidural anesthesia can prevent AD; coordinate MFM + SCI specialists.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Patient + family + caregiver education — recognition + immediate response; emergency medical card.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Documentation — triggers + management + response for personalized protocols.", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("STROKE / INTRACRANIAL HEMORRHAGE — severe hypertension can rupture aneurysms or precipitate ischemic events; emergent.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MI + cardiac events — angina, arrhythmia, pulmonary edema.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("SEIZURE — hypertensive encephalopathy.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("HYPOTENSION post-treatment — if trigger removed + antihypertensive given, can rebound hypotensive.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("RECURRENCE — same trigger can recur immediately; bladder distension + bowel impaction often persistent.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PREGNANCY + LABOR — high-risk; preventive epidural + emergent treatment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PATIENT EDUCATION — recognize symptoms + immediate action + emergency contact; medical alert bracelet.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PROCEDURES + SURGERIES below lesion — pre-procedural anesthesia + BP monitoring; communicate SCI to all providers.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Underlying SCI care — long-term bladder + bowel + skin management.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CervicalDystoniaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cervical-dystonia",
        title: "Cervical dystonia (spasmodic torticollis)",
        subtitle: "Most common focal adult dystonia · involuntary neck postures + tremor · sensory \"geste\" trick relieves · BOTOX 1st-line + DBS refractory",
        nclexTags: neuroTagR31,
        definition: AttributedProse(
            "Most common focal adult-onset dystonia — involuntary sustained or intermittent muscle contractions causing abnormal head/neck postures (torticollis = rotation, laterocollis = tilt, retrocollis = backward, anterocollis = forward); usually combined patterns + dystonic tremor. Idiopathic in most; small % genetic. First-line — BOTULINUM TOXIN injections q3 months; DBS for refractory per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "Basal ganglia + sensorimotor integration dysfunction; loss of cortical inhibition + altered plasticity; genetic predisposition in some (DYT genes).",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("INVOLUNTARY neck postures — rotation (most common), tilt, backward extension, forward flexion, often combined.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("DYSTONIC TREMOR — superimposed jerky tremor of head.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("PAIN — common (~75%); cervical muscle spasm + secondary OA + headache.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("\"GESTE ANTAGONISTE\" / sensory trick — touching face/chin temporarily relieves dystonia (characteristic feature).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("PROGRESSIVE worsening over months-years; mostly idiopathic adult-onset (40-60s); secondary causes rare.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("PSYCHOLOGICAL impact — depression, anxiety, social isolation; visible disorder; pain.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — female slight predominance, age 40-60 peak, family history small %, prior cervical trauma in some, idiopathic in most.", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — abnormal head/neck posture + sustained or intermittent muscle contractions + sensory trick (geste antagoniste); progressive course per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Cervical MRI / CT — exclude structural causes (mass, syringomyelia, cervical spine pathology, dural fistula).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Brain MRI — exclude basal ganglia lesions (stroke, tumor, demyelination).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Drug history — review for tardive dystonia from antipsychotics + antiemetics.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Genetic testing — if early onset, family history, atypical features (DYT genes).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Wilson disease screen in young (<50) — ceruloplasmin, 24h urine copper, slit lamp.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Differential — psychogenic dystonia (rare features), tardive dystonia, cervical myopathy, congenital muscular torticollis.", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("Movement disorders specialist referral.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Identify specific dystonia pattern + affected muscles for BOTOX planning.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Functional + psychosocial assessment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Rule out secondary causes if atypical.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Pain assessment + management.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("FIRST-LINE — BOTULINUM TOXIN injections q3 months (onabotulinumtoxinA, abobotulinumtoxinA, incobotulinumtoxinA, rimabotulinumtoxinB); EMG OR ultrasound guidance; specialist movement disorder; ~70-80% benefit per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ADJUNCT oral medications — trihexyphenidyl, benztropine (anticholinergics — limited tolerability in elderly); baclofen; clonazepam; tetrabenazine for severe; muscle relaxants; analgesics for pain.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PHYSICAL THERAPY — stretching + strengthening + postural training; relaxation; sensory tricks training.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("DEEP BRAIN STIMULATION (DBS) — internal globus pallidus (GPi); severe refractory cases; significant improvement in many.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Selective denervation surgery — rare; superseded by DBS.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PAIN management — chronic muscle pain often persists despite botulinum toxin; PT + analgesics + sometimes opioids for severe.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Mental health support — depression + anxiety + social impact; counseling + medications.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Support groups — Dystonia Medical Research Foundation; patient + caregiver education.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Cervical spine care — secondary OA + radiculopathy + cervical compression complications; coordinate ortho + spine.", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("CERVICAL SPINE complications — secondary degenerative changes + radiculopathy + myelopathy + cord compression in severe long-standing cases.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("BOTULINUM TOXIN side effects — neck weakness, dysphagia (especially with anterocollis), dry mouth, neck pain at injection site; immunogenicity reducing efficacy long-term.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PROGRESSIVE WORSENING over years.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PSYCHOSOCIAL impact — depression + anxiety; visible + chronic; counseling.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("DBS complications — stroke, hemorrhage, infection, hardware; experienced center.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("RESPONSE VARIABILITY — some patients don't respond to botulinum or oral medications; alternative approaches needed.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("OTHER DYSTONIAS — generalized + segmental + writer's cramp + blepharospasm + spasmodic dysphonia + oromandibular dystonia.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BrainAbscessSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "brain-abscess",
        title: "Brain abscess",
        subtitle: "Localized intracerebral pus collection · contiguous (sinus/ear/dental) + hematogenous + post-op · MRI ring-enhancing · stereotactic drainage + broad antibiotics 6-8 weeks",
        nclexTags: infectionNeuroTagR31,
        definition: AttributedProse(
            "Focal collection of pus within brain parenchyma — causes (1) contiguous spread (sinusitis, otitis media, mastoiditis, dental, endocarditis), (2) hematogenous (cyanotic CHD, lung abscess, IVDU), (3) post-surgical / penetrating trauma. Bacterial most common (streptococci, anaerobes, S. aureus, gram-negatives); fungal in immunocompromised. Stereotactic drainage + 6-8 weeks IV antibiotics per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "Bacterial entry → cerebritis (focal inflammation) → necrosis + capsule formation over 1-2 weeks → mature abscess with thick capsule + central pus + perilesional edema → mass effect + ICP elevation + seizures + focal deficits. Source-dependent organism + location patterns.",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("HEADACHE — most common (~70%); often progressive, persistent, sometimes severe; not always classic.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("FEVER — only ~50%; immunocompromised + indolent may be afebrile.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("FOCAL NEUROLOGIC DEFICITS — hemiparesis, aphasia, cranial nerve palsies; depending on location.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("SEIZURES — focal or generalized; ~25-50%.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("ALTERED MENTAL STATUS + decreased consciousness in severe + cerebral edema.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Increased intracranial pressure — papilledema, vomiting, Cushing triad in late.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Source clues — sinus pain (sinusitis), ear pain + drainage (otitis/mastoiditis), dental pain (dental abscess), recent procedures, IVDU + endocarditis, cyanotic CHD, immunocompromise.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — sinusitis + ENT infections, otitis + mastoiditis, dental infections, endocarditis (especially IVDU), congenital cyanotic heart disease (right-to-left shunt), immunocompromise (HIV, transplant, chemotherapy), penetrating head trauma, neurosurgical procedures.", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MRI BRAIN with contrast — gold standard; RING-ENHANCING lesion with central necrosis + perilesional edema + restricted diffusion (DWI) — bright on DWI (pus is hyperintense, distinguishing from tumor) per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CT brain alternative — ring-enhancing; less sensitive than MRI.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("LUMBAR PUNCTURE — generally CONTRAINDICATED if mass effect (risk of herniation); CSF usually shows lymphocytic pleocytosis, elevated protein, low glucose if positive.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ASPIRATION + CULTURE — stereotactic aspiration gold standard for diagnosis + therapy; gram stain + bacterial + anaerobic + fungal + AFB cultures + sensitivities + 16S rRNA PCR + cytology.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("BLOOD CULTURES — bacteremia in ~10-30%; 2 sets aerobic + anaerobic.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("SOURCE workup — sinus/ear/dental + cardiac echocardiogram for endocarditis + chest CT for lung abscess + HIV testing + immune status.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Differential — primary CNS tumor (glioma, lymphoma), metastasis, demyelinating mass, resolving hematoma, fungal abscess, parasitic (toxoplasmosis, neurocysticercosis).", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("Emergent neuroimaging + neurosurgery consultation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Source identification — ENT + dental + cardiac evaluation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Empiric antibiotics + emergent drainage planning.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ICP management — head elevation, hyperosmolar therapy if signs; possibly external ventricular drain.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Multidisciplinary — neurosurgery + ID + ICU.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("STEREOTACTIC ASPIRATION + DRAINAGE — neurosurgical procedure under MRI/CT guidance; provides diagnostic culture + therapeutic drainage; often repeated; some small (<2.5 cm) treated conservatively per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("EMPIRIC ANTIBIOTICS while culture pending — VANCOMYCIN (MRSA + streptococci) + CEFTRIAXONE OR CEFEPIME (gram-negatives + streptococci) + METRONIDAZOLE (anaerobes) IV.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("DURATION — 6-8 weeks IV antibiotics typically; longer for immunocompromised, multiple abscesses, atypical organisms; oral step-down sometimes after improvement.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Source-specific — TREAT UNDERLYING source (sinus surgery, dental extraction, endocarditis treatment, lung abscess drainage, HIV ART for OI).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CORTICOSTEROIDS — controversial; reserved for significant cerebral edema + mass effect; dexamethasone 4-10 mg q6 hours; taper as improves.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("SEIZURE management — anticonvulsants if seizures; prophylactic for cortical lesions; usually continued ≥3-6 months.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ICP MANAGEMENT — elevation, mannitol/hypertonic saline, possibly EVD; emergent neurosurgery for herniation risk.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Serial neuroimaging — q1-2 weeks during treatment to monitor response + plan re-aspiration if needed.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Multidisciplinary — neurosurgery + ID + ICU + relevant source-related specialty (ENT, dentistry, cardiology).", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("MORTALITY — historically high (~25%); improved with imaging + early intervention to 5-15%; immunocompromised + delayed treatment + multiple abscesses worse.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("INCREASED ICP + HERNIATION — emergent; EVD + decompression; mortality high if delayed.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("RECURRENT or MULTIPLE abscesses — common in immunocompromised + endocarditis + cyanotic CHD; surveillance + extended treatment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("LONG-TERM SEQUELAE — seizures, focal deficits, cognitive impairment; rehabilitation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("FUNGAL abscess (Aspergillus, Mucorales, Candida) — immunocompromised; high mortality; amphotericin + isavuconazole + surgical.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PARASITIC — toxoplasmosis (HIV), neurocysticercosis; different treatment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Cerebritis stage (early, no capsule) — conservative antibiotic treatment may suffice; capsule formation requires drainage.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Underlying immunocompromise workup — HIV testing, immune evaluation, malignancy screening.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HSVEncephalitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hsv-encephalitis",
        title: "Herpes simplex virus (HSV) encephalitis",
        subtitle: "Most common sporadic viral encephalitis · temporal lobe predilection · HSV-1 adults · ACYCLOVIR EMPIRICAL EARLY · permanent deficits without treatment · post-HSV anti-NMDA",
        nclexTags: infectionNeuroTagR31,
        definition: AttributedProse(
            "Most common cause of sporadic viral encephalitis in adults — HSV-1 (occasionally HSV-2). Hemorrhagic necrotizing temporal lobe + frontal involvement classic. Mortality 70%+ untreated; 20-30% with early acyclovir + significant morbidity. ACYCLOVIR EMPIRICALLY started ANY suspected encephalitis BEFORE PCR confirmation — every hour of delay worsens outcomes; HSV PCR CSF >95% sensitive after day 1-2 per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "HSV-1 reactivation from trigeminal ganglion (or primary infection in some) → retrograde transport along nerves → temporal + frontal lobes → hemorrhagic necrosis + lymphocytic + plasma cell infiltrate + inclusion bodies in neurons + glial cells.",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("FEVER + HEADACHE + ALTERED MENTAL STATUS triad — but not all present; can be variable.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("PERSONALITY + BEHAVIORAL CHANGES — temporal lobe predilection; confusion, agitation, hallucinations, psychiatric features.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("APHASIA, anomic + receptive — left temporal involvement.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("SEIZURES — focal complex partial + secondary generalized; ~50%; status epilepticus possible.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Focal neurologic deficits — hemiparesis, ataxia, cranial nerve palsies.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("ALTERED LEVEL OF CONSCIOUSNESS — coma in severe cases; mass effect + ICP.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Onset usually subacute over days; sometimes rapid.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — adults peak any age (bimodal in children + 40s+), HSV-1 reactivation, immunocompromise increases risk + atypical presentations.", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CSF HSV PCR — gold standard; >95% sensitive after day 1-2 of symptoms; specific; QUANTITATIVE for monitoring; CSF pleocytosis (lymphocytic 10-1000), elevated protein, normal-low glucose, possible RBCs (hemorrhagic) per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MRI BRAIN — TEMPORAL + FRONTAL lobe edema, hemorrhage, T2 hyperintensity; restricted diffusion early; characteristic finding.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("EEG — focal temporal slowing + periodic lateralizing epileptiform discharges (PLEDs) suggestive.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CT brain — less sensitive than MRI; temporal lobe edema + hemorrhage in advanced.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("BRAIN BIOPSY — historical; rarely needed with PCR.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Differential — autoimmune encephalitis (anti-NMDA), other viral (West Nile, EEE/WEE, enterovirus, VZV, EBV, CMV in immunocompromised), bacterial meningoencephalitis, brain abscess, neurosarcoidosis.", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("ACYCLOVIR EMPIRIC IMMEDIATELY — start in any suspected viral encephalitis BEFORE PCR confirmation; every hour of delay worsens outcomes.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("LP — within hours; PCR; cell count + protein + glucose + bacterial culture + viral panel.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MRI brain — within hours.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("EEG — if seizures suspected.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ICU + airway protection + seizure management.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("ACYCLOVIR 10 mg/kg IV q8 hours × 14-21 days — EMPIRIC + start immediately; renal dose adjustment per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("If CSF HSV PCR NEGATIVE — repeat PCR (especially if early <day 2 + clinical concerning); continue acyclovir during workup if clinical features compatible.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("If PCR POSITIVE — complete 14-21 days IV acyclovir; PCR at end of treatment to confirm clearance.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Supportive ICU — airway protection + intubation if decreased mental status; mechanical ventilation; seizure control (multiple AEDs); ICP management (head elevation, hyperosmolar therapy, possibly EVD); electrolytes + nutrition.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Corticosteroids — controversial; some advocate for cerebral edema; recent trials suggest no clear benefit + may worsen.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Anti-NMDA-R antibody testing — POST-HSV anti-NMDA encephalitis recognized; relapse with new psychiatric/movement features weeks-months after HSV encephalitis; check NMDA antibodies; immunotherapy if positive.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ALTERED dose for renal — adjust acyclovir; ensure adequate hydration to prevent crystalluria.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("REHABILITATION — long-term cognitive + behavioral + neurologic deficits; PT/OT/speech + cognitive rehabilitation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Multidisciplinary — neurology + critical care + ID + rehabilitation + psychiatry (post-HSV behavioral changes).", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("MORTALITY + MORBIDITY — 70%+ untreated; 20-30% with treatment; significant cognitive + behavioral + neurologic sequelae; older + delayed treatment worse.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ACYCLOVIR NEPHROTOXICITY — crystalluria + AKI; adequate hydration + renal monitoring + dose adjustment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("POST-HSV ANTI-NMDA-R encephalitis — weeks-months after HSV recovery; psychiatric + movement features; anti-NMDA antibodies + immunotherapy; up to ~25% of HSV survivors.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("RELAPSE — uncommon but possible; consider continued or extended acyclovir; PCR + clinical re-evaluation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CHRONIC SEIZURES — common sequelae; AEDs long-term.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("BEHAVIORAL + COGNITIVE deficits — temporal lobe damage; memory impairment, executive dysfunction, behavior change; rehabilitation + family support.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("DELAYED DIAGNOSIS = WORSE OUTCOMES — empirical acyclovir critical.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Neonatal HSV — different presentation + treatment + outcomes; pediatric ID.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ADEMSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acute-disseminated-encephalomyelitis",
        title: "Acute disseminated encephalomyelitis (ADEM)",
        subtitle: "Post-infectious / post-vaccinal demyelination · MULTIFOCAL + monophasic typically · pediatric > adult · steroids + IVIG + plasmapheresis · DDX MS first attack",
        nclexTags: infectionNeuroTagR31,
        definition: AttributedProse(
            "Acute monophasic demyelinating disease of CNS — multifocal symptoms (encephalopathy required + multifocal neurologic deficits). Typically follows infection (viral, mycoplasma, etc.) by 1-3 weeks OR vaccination. Pediatric (peak 5-8 years) > adult. Distinct from MS first attack — encephalopathy + monophasic course. Treatment — high-dose steroids + IVIG/plasmapheresis if refractory; ~70-80% recover fully per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "Immune-mediated demyelination triggered by preceding infection or vaccination (\"molecular mimicry\") → multifocal inflammation + perivascular demyelination throughout CNS (brain, brainstem, cerebellum, spinal cord, optic nerves). Monophasic typically; multiphasic + recurrent variants rare.",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("ENCEPHALOPATHY REQUIRED for diagnosis — altered consciousness, irritability, behavioral changes, confusion.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("MULTIFOCAL neurologic deficits — variable based on lesion locations; hemiparesis, ataxia, cranial nerve palsies, visual changes (optic neuritis), spinal cord symptoms (paresis, sensory level, bladder/bowel dysfunction).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("FEVER + HEADACHE + meningismus — common in initial presentation.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("SEIZURES — focal or generalized.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("OPTIC NEURITIS — vision loss, eye pain.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Spinal cord — myelitis with paraparesis or quadriparesis, sensory level, bowel/bladder.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Preceding TRIGGER — viral infection (URI, gastroenteritis, varicella, measles, mumps, rubella, influenza, EBV, mycoplasma) OR vaccination 1-3 weeks prior; ~70% post-infectious.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — children 5-8 years peak (can occur any age), recent infection or vaccination, no family history typically.", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — first clinical event with multifocal CNS demyelination + encephalopathy + abnormal MRI per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MRI BRAIN + SPINE — multifocal T2 hyperintense lesions involving WHITE MATTER + GRAY MATTER (basal ganglia, thalamus common, distinguishing from MS); large + asymmetric + often gadolinium-enhancing (all enhancing same age = monophasic); spinal cord lesions common.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CSF — lymphocytic pleocytosis (~30%), elevated protein; OLIGOCLONAL BANDS usually NEGATIVE (vs MS where positive); rule out infectious encephalitis.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Anti-MOG (myelin oligodendrocyte glycoprotein) antibodies — increasingly recognized; \"MOGAD\" (MOG antibody-associated disease) is overlapping/distinct entity; can present as ADEM, optic neuritis, transverse myelitis; relapsing in some.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("EXCLUDE infectious encephalitis — HSV PCR, other viral, bacterial.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Differentiate from MS first attack — encephalopathy + monophasic + gray matter + basal ganglia involvement + younger; longitudinal follow-up critical.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Aquaporin-4 antibody — NMOSD if positive (different treatment).", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("Hospital admission + supportive care.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Empiric acyclovir + antibiotics until infectious encephalitis excluded.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Multidisciplinary — neurology + ID + ophthalmology + PT/OT + rehabilitation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Distinguish from MS first attack — clinical features + MRI + serology + longitudinal follow-up.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Anti-MOG antibody testing — MOGAD distinct entity.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("HIGH-DOSE METHYLPREDNISOLONE 1 g IV daily × 5-7 days (pediatric 20-30 mg/kg/day max 1 g) → oral prednisone taper over 4-6 weeks; first-line per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("IVIG 2 g/kg over 2-5 days — for refractory or severe; alternative or adjunct to steroids.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PLASMA EXCHANGE 5-7 sessions — for severe or refractory; especially with spinal cord involvement; emergent transverse myelitis.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Supportive ICU — airway protection + seizure management + ICP management; rehabilitation early.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MOGAD recurrent variant — long-term immunotherapy (rituximab, azathioprine, MMF, IVIG monthly) for relapsing disease.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("LONGITUDINAL FOLLOW-UP — MRI surveillance for new lesions over years to identify MS vs ADEM vs MOGAD; clinical assessment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("VACCINATIONS — continue routine vaccinations after recovery; counsel about preceding infection / vaccination triggers (very rare association).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Rehabilitation — PT/OT, cognitive rehabilitation, speech, vision therapy; significant recovery over months.", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("RECOVERY — 70-80% full recovery; 20-30% with residual deficits; mortality <5%.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("RELAPSE — monophasic typically; recurrent ADEM (multiphasic) + MOGAD relapsing patterns increasingly recognized.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CONVERSION TO MS — distinguish from MS first attack; longitudinal MRI surveillance + clinical features; some initially diagnosed as ADEM later prove to be MS.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MOGAD — anti-MOG antibody-associated demyelinating disease; can mimic ADEM/NMO/MS; long-term immunotherapy for relapsing variants.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("OPTIC NEURITIS sequelae — vision deficits; ophthalmology follow-up.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("STEROID side effects — hyperglycemia, hypertension, mood changes, sleep disturbance, opportunistic infections.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Pediatric vs adult — pediatric better prognosis + recovery; adult ADEM more often atypical + relapsing.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MORTALITY <5% but significant in severe + multi-organ + delayed treatment.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CervicalSpondyloticMyelopathySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cervical-spondylotic-myelopathy",
        title: "Cervical spondylotic myelopathy (CSM)",
        subtitle: "Most common cause of spinal cord dysfunction in elderly · degenerative spinal stenosis · gait + hand clumsy + UMN signs · MRI · decompression surgery for progressive",
        nclexTags: neuroTagR31,
        definition: AttributedProse(
            "Spinal cord dysfunction from degenerative cervical spondylosis with stenosis. Most common cause of spinal cord dysfunction in elderly. Insidious gait + hand dysfunction + upper motor neuron signs. MRI confirms cord compression + signal change. SURGICAL DECOMPRESSION (laminectomy, laminoplasty, or anterior cervical discectomy + fusion) for progressive moderate-severe disease prevents further decline per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — disc degeneration + osteophyte formation + ligamentum flavum hypertrophy + facet joint hypertrophy → spinal canal narrowing → cord compression + ischemia + chronic inflammation → demyelination + neuronal damage.",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("GAIT DIFFICULTY — wide-based, stiff, slow; spasticity + ataxia; falls.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("HAND CLUMSINESS + numbness — fine motor + grip strength; \"can't button shirt\" or \"can't hold pen\"; intrinsic muscle wasting.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("LHERMITTE SIGN — electric shock down spine + extremities with neck flexion.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("UPPER MOTOR NEURON signs — hyperreflexia, clonus, Babinski + Hoffmann signs.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("BLADDER + bowel dysfunction in severe — urgency, incontinence, retention.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("NECK pain + stiffness common but not prominent in pure myelopathy.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — age >50 (most >60), males slight predominance, occupations with cervical strain, congenital narrow spinal canal, athletes (rugby, football, gymnastics).", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MRI CERVICAL SPINE — gold standard; identifies stenosis + cord compression + T2 signal hyperintensity (myelomalacia) + level of involvement per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CT cervical spine — bony anatomy; ossified posterior longitudinal ligament (OPLL).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Plain radiographs — degenerative changes; range of motion + flexion/extension views.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Neurologic examination — UMN signs (hyperreflexia, clonus, Babinski, Hoffmann), motor weakness (intrinsic hand muscles), sensory deficits, gait assessment, modified Japanese Orthopedic Association (mJOA) score for severity.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Electromyography (EMG) — distinguishes myelopathy from radiculopathy + peripheral neuropathy.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Somatosensory evoked potentials (SSEPs) — cord function assessment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Differential — multiple sclerosis (younger, MRI signal patterns), ALS, B12 deficiency, syringomyelia, neuromyelitis optica, peripheral neuropathy.", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity assessment — mJOA score; mild (mJOA 15-17), moderate (12-14), severe (≤11).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Neurosurgery / spine surgery referral for moderate-severe + progressive.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Functional impact — gait, fine motor, occupational, ADLs.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Falls risk + safety assessment + home assessment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Rule out alternative diagnoses — MS, ALS, B12 deficiency, peripheral neuropathy.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("SURGICAL DECOMPRESSION — for moderate-severe + progressive disease; options — ANTERIOR cervical discectomy + fusion (ACDF) for 1-2 level disease, ANTERIOR cervical corpectomy + fusion for multi-level + OPLL, POSTERIOR laminectomy + fusion OR laminoplasty for multi-level + extensive disease per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CONSERVATIVE — for mild + non-progressive — physical therapy, cervical collar (limited evidence), NSAIDs, lifestyle (avoid neck strain, falls prevention), regular monitoring; progressive disease eventually requires surgery.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Falls prevention — home assessment, assistive devices (walker, cane), avoid hazardous activities.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Physical therapy — strengthening (avoid extreme neck postures + axial loading), gait training, balance training, fine motor training.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Occupational therapy — assistive devices for fine motor + ADLs.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Pain management — NSAIDs, gabapentin/pregabalin for neuropathic pain, muscle relaxants; opioids limited.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Treat comorbid radiculopathy + bowel/bladder dysfunction.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Post-operative care — pain management, mobility, physical therapy, cervical immobilization (some procedures), return to activity gradually.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Long-term follow-up — neurologic exam + functional assessment at intervals; recurrence + adjacent segment disease.", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("PROGRESSIVE NEUROLOGIC DECLINE — gradual + sometimes step-wise; surgical decompression prevents progression but does not always reverse fully.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CENTRAL CORD SYNDROME from minor trauma — acute worsening in CSM patients; emergency.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ADJACENT SEGMENT DISEASE — post-fusion; degenerative changes adjacent to surgery; surveillance.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("SURGICAL COMPLICATIONS — neurologic worsening (5-10%), dysphagia + voice change (anterior), CSF leak, hardware issues, infection, adjacent disc disease.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("FALLS + ASSOCIATED INJURIES — gait instability; spinal cord at high risk.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CARPAL TUNNEL or peripheral nerve compression — coexisting; differentiate from myelopathy + treat.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("REHABILITATION + ADAPTATION — post-surgical recovery 3-12 months; some residual deficits permanent.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PSYCHOSOCIAL impact — functional decline + disability + caregiver burden.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DiabeticPeripheralNeuropathySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "painful-diabetic-neuropathy",
        title: "Painful diabetic peripheral neuropathy (DPN)",
        subtitle: "Stocking-glove sensory loss + burning + tingling · glucose control + foot care · pregabalin/gabapentin/duloxetine + TCAs · capsaicin + tapentadol · foot ulcer + Charcot",
        nclexTags: neuroTagR31,
        definition: AttributedProse(
            "Distal symmetric sensorimotor polyneuropathy from chronic hyperglycemia — most common complication of diabetes (~50% lifetime risk). Length-dependent (\"stocking-glove\") pattern. SENSORY > motor; PAINFUL + non-painful subtypes. Treatment — GLUCOSE CONTROL + FOOT CARE + neuropathic pain management (alpha-2-delta ligands, SNRIs, TCAs, topical capsaicin); foot ulcer + Charcot neuroarthropathy + amputation are complications per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — metabolic (advanced glycation end products + oxidative stress + polyol pathway + protein kinase C); vascular (microvascular ischemia); immune-inflammatory; growth factor deficiency. Length-dependent — longest axons (feet) affected first.",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("SENSORY SYMPTOMS — numbness, tingling, burning, electric shocks; symmetric STOCKING-GLOVE pattern (feet first, then hands); positive symptoms (tingling, burning, pain) + negative (loss of sensation).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("PAIN — burning, electric, shooting, stabbing; nocturnal worsening; ~50% have painful subtype.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("MOTOR symptoms (later) — weakness, atrophy of intrinsic foot muscles, hammer toes, Charcot foot deformity.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("AUTONOMIC features may coexist — gastroparesis, postural hypotension, sexual dysfunction, anhidrosis.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("LOSS OF PROTECTIVE SENSATION — foot ulceration risk from undetected trauma + ill-fitting footwear; charcot neuroarthropathy (acute warm swollen foot mimicking infection).", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — duration of diabetes, glycemic control (higher HbA1c), older age, smoking, hypertension, dyslipidemia, peripheral artery disease, micro-albuminuria.", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — distal symmetric sensorimotor neuropathy in diabetic + exclusion of other causes per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Monofilament 10-g testing — loss of protective sensation; positive sites; ANNUAL screening in all diabetics.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Vibration perception (128 Hz tuning fork) — reduced/absent at great toe; semiquantitative.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Pinprick + temperature — small fiber assessment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Ankle reflexes — absent or reduced.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Electromyography (EMG) + nerve conduction studies — confirm + characterize; usually not required for typical presentation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("EXCLUDE OTHER causes — B12 deficiency (especially metformin), thyroid (TSH), monoclonal gammopathy (SPEP), alcohol, chemotherapy, HIV, hereditary, autoimmune, paraneoplastic — REASSESS if atypical features (asymmetric, motor predominant, rapidly progressive).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Other diabetic neuropathies — autonomic, mononeuritis multiplex, lumbosacral radiculoplexus neuropathy (diabetic amyotrophy), truncal radiculopathy, cranial mononeuropathies — distinct workup + management.", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("Glycemic control optimization — HbA1c target individualized.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Foot exam at EVERY visit — visual + monofilament + vibration + reflexes; podiatry referral.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Symptom burden assessment + neuropathic pain treatment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Exclude alternative causes if atypical.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Multidisciplinary — diabetes, neurology, podiatry, wound care, pain management.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("GLYCEMIC CONTROL — most important; HbA1c target individualized; rapid glucose correction can paradoxically worsen pain (\"treatment-induced neuropathy\").", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CARDIOVASCULAR risk reduction — BP, lipids, smoking cessation, weight management.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("NEUROPATHIC PAIN — first-line: PREGABALIN 75-300 mg PO BID + GABAPENTIN 100-1200 mg PO TID (titrate gradually); SNRIs — DULOXETINE 30-60 mg PO daily, VENLAFAXINE; TCAs — AMITRIPTYLINE 10-150 mg PO at bedtime, NORTRIPTYLINE (less anticholinergic) per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("TOPICAL — CAPSAICIN 0.075% cream or 8% patch (Qutenza), lidocaine 5% patch.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("OPIOIDS for refractory — TAPENTADOL FDA-approved; tramadol; oxycodone limited due to dependence + tolerance.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("FOOT CARE — daily inspection + moisturizers (NOT between toes), properly fitting shoes + protective footwear, no barefoot walking, professional podiatry visits, prompt treatment of any abnormality, avoid hot water.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("FOOT ULCER management — wound care + offloading (total contact cast, removable cast walker) + infection treatment + vascular assessment; multidisciplinary wound clinic.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CHARCOT NEUROARTHROPATHY — acute warm swollen foot in diabetic; immobilization (total contact cast) + non-weight-bearing × months; consult orthopedic/podiatric surgery.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("B12 supplementation — patients on metformin or low levels.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Smoking cessation, alcohol moderation, regular exercise.", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("FOOT ULCER + INFECTION — major complication; loss of protective sensation + microvascular disease + poor healing; aggressive prevention + multidisciplinary management.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("AMPUTATION — diabetic foot complications leading cause of amputation; prevention + early intervention.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CHARCOT NEUROARTHROPATHY — often misdiagnosed as infection; immobilization critical.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("TREATMENT-INDUCED NEUROPATHY — rapid glucose correction can paradoxically worsen pain (\"insulin neuritis\"); usually transient.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("AUTONOMIC NEUROPATHY — gastroparesis (DKA + glucose management), orthostatic hypotension, silent cardiac ischemia, anhidrosis, sexual dysfunction; affects management decisions.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("DEPRESSION + chronic pain — common comorbidity; integrated care.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("SLEEP DISRUPTION + functional decline + quality of life impact.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("OPIOID dependence + tolerance — limit and monitor for non-medical use.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("B12 deficiency from metformin — supplementation in long-term users.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("VASCULAR INSUFFICIENCY — coexisting peripheral artery disease; ABI + referral.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HemicraniaContinuaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hemicrania-continua",
        title: "Hemicrania continua",
        subtitle: "Strictly unilateral chronic daily HA · INDOMETHACIN-RESPONSIVE (pathognomonic) · trigeminal autonomic features mild · gabapentin + topiramate alternatives",
        nclexTags: headacheTagR31,
        definition: AttributedProse(
            "Continuous strictly unilateral headache (>3 months) with exacerbations + ipsilateral autonomic features OR restlessness/agitation. PATHOGNOMONIC response to INDOMETHACIN — diagnostic. Often misdiagnosed as migraine or tension HA. Treatment — indomethacin first-line; alternatives — gabapentin, topiramate, melatonin, COX-2 inhibitors per primary source.",
            citationIDs: ["specialty_dx_round31", "openrn_dx_round31"]
        ),
        pathophysiology: AttributedProse(
            "Trigeminal autonomic cephalalgia spectrum; pathophysiology partially understood; central sensitization + neuroinflammation; prostaglandin pathway involvement (hence indomethacin response).",
            citationIDs: ["specialty_dx_round31"]
        ),
        presentation: [
            AttributedBullet("CONTINUOUS strictly UNILATERAL headache — frontotemporal + side-locked; mild-moderate background + exacerbations to severe.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("DURATION ≥3 months without remission.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("EXACERBATIONS — superimposed severe exacerbations several times/week, lasting hours.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("AUTONOMIC FEATURES — mild (less than cluster); ipsilateral conjunctival injection, lacrimation, ptosis/miosis, nasal congestion; OR restlessness/agitation.", citationIDs: ["openrn_dx_round31"]),
            AttributedBullet("Risk factors — adult-onset; female slight predominance; mid-adult years.", citationIDs: ["specialty_dx_round31"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ICHD-3 criteria — unilateral + continuous + 3+ months + exacerbations with autonomic features OR restlessness + ABSOLUTE INDOMETHACIN RESPONSE (pathognomonic) per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("INDOMETHACIN TRIAL — 25-75 mg PO TID with food; symptom resolution within hours-days is diagnostic; if no response, NOT hemicrania continua.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MRI brain — exclude secondary causes especially in atypical features or first presentation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Differential — chronic migraine (bilateral common, no indomethacin response), cluster (episodic + severe + brief), paroxysmal hemicrania (brief frequent attacks + indomethacin-responsive), cervicogenic, sinusitis, intracranial mass.", citationIDs: ["specialty_dx_round31"])
        ],
        priorityAssessments: [
            AttributedBullet("Indomethacin trial — definitive diagnosis + treatment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Exclude secondary cause if atypical.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("GI risk assessment before indomethacin (high-dose NSAID).", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Headache specialist referral.", citationIDs: ["specialty_dx_round31"])
        ],
        commonInterventions: [
            AttributedBullet("INDOMETHACIN 25 mg PO TID with food → titrate to 75 mg TID (max 225 mg/day); response within hours-days; GI protection with PPI per primary source.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MINIMUM EFFECTIVE DOSE — once symptom-free, reduce dose to lowest maintaining control.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Long-term indomethacin — GI + renal + cardiovascular toxicity risks; periodic monitoring.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("ALTERNATIVES if indomethacin intolerable — COX-2 inhibitors (celecoxib), gabapentin, topiramate, melatonin, lamotrigine; less effective.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("GREATER OCCIPITAL NERVE BLOCKS — transient benefit; therapeutic + diagnostic.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CGRP-MABs — emerging data; off-label; specialist consultation.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PPI co-administration — gastric protection during chronic indomethacin.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Trigger avoidance + lifestyle.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Mental health support — chronic pain impact.", citationIDs: ["specialty_dx_round31"])
        ],
        watchFor: [
            AttributedBullet("INDOMETHACIN GI TOXICITY — gastritis, ulcers, bleeding; PPI prophylaxis + lowest effective dose; chronic NSAID risk.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("INDOMETHACIN RENAL TOXICITY — AKI, fluid retention, hypertension; periodic BUN/Cr + BP.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("CARDIOVASCULAR risk — NSAIDs increase MI + stroke risk; cardiac risk assessment.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("MISDIAGNOSIS — often diagnosed as migraine or tension HA before indomethacin trial; high suspicion for unilateral chronic HA.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("INADEQUATE DOSING — indomethacin trial requires up to 225 mg/day; lower doses may fail; diagnostic only with adequate trial.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("PSYCHOSOCIAL impact + chronic pain.", citationIDs: ["specialty_dx_round31"]),
            AttributedBullet("Pregnancy — indomethacin contraindicated 3rd trimester (ductal closure); alternative management.", citationIDs: ["specialty_dx_round31"])
        ],
        citations: [openrnDxR31, cdcDxR31, specialtyDxR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}
