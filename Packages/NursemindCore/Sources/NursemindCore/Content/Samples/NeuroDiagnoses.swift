import Foundation

// Curator-model neuro diagnosis entries (v1.5 expansion).
// Sources: Open RN Med-Surg / Health Alterations (CC BY 4.0), CDC (public domain),
// AAN / AHA stroke guidelines (concept citations).

private let openrnNeuro = CitationSource(
    id: "openrn_neuro",
    shortName: "Open RN Health Alterations / Med-Surg — Neurologic",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=stroke+seizure+icp+neuro",
    lastRetrieved: "2026-05-04"
)
private let aanConcept = CitationSource(
    id: "aan_concept",
    shortName: "AAN clinical practice guidelines (concept citation)",
    publisher: "American Academy of Neurology",
    license: .factCitationOnly,
    url: "https://www.aan.com/Guidelines/",
    lastRetrieved: "2026-05-04"
)
private let ahaStroke = CitationSource(
    id: "aha_stroke",
    shortName: "AHA/ASA Stroke Guidelines (concept citation)",
    publisher: "American Heart Association · American Stroke Association",
    license: .factCitationOnly,
    url: "https://www.stroke.org/en/professionals",
    lastRetrieved: "2026-05-04"
)
private let cdcNeuro = CitationSource(
    id: "cdc_neuro",
    shortName: "CDC neurologic and stroke surveillance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/stroke/",
    lastRetrieved: "2026-05-04"
)

private let neuroTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation)

// MARK: - TIA

public enum TIASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tia",
        title: "Transient Ischemic Attack (TIA)",
        subtitle: "Brief focal neurologic deficit · warning for stroke · urgent workup",
        nclexTags: neuroTags,
        definition: AttributedProse(
            "Transient episode of neurologic dysfunction caused by focal brain, spinal cord, or retinal ischemia, WITHOUT acute infarction on imaging. Symptoms typically resolve <1 hour but defined by absence of infarction on imaging, not symptom duration. Strong predictor of impending stroke — 10–15% have stroke within 90 days, half within 48 hours.",
            citationIDs: ["openrn_neuro", "aha_stroke"]
        ),
        pathophysiology: AttributedProse(
            "Most often embolic (atrial fibrillation, carotid atherosclerosis, aortic source) or thrombotic (small or large artery atherosclerosis). Same etiologies as ischemic stroke; transient resolution before infarction sets in.",
            citationIDs: ["openrn_neuro"]
        ),
        presentation: [
            AttributedBullet("Sudden focal deficit — weakness/numbness (face, arm, leg, especially unilateral), speech difficulty, vision change (amaurosis fugax = transient monocular blindness), vertigo with brainstem signs.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("BE FAST mnemonic: Balance, Eyes (vision), Face droop, Arm weakness, Speech difficulty, Time to call 911.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Symptoms typically resolve within minutes to <1 hour.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("ABCD² score predicts stroke risk: Age ≥60, BP ≥140/90, Clinical features (unilateral weakness, speech), Duration (≥60, 10–59), Diabetes; ≥4 = high risk.", citationIDs: ["aha_stroke"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MRI BRAIN preferred (more sensitive than CT for small infarcts) — absence of infarction confirms TIA vs minor stroke.", citationIDs: ["aha_stroke"]),
            AttributedBullet("Carotid imaging (US, CTA, MRA) — for ≥50% stenosis warranting intervention.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("ECG; cardiac monitoring for AFib (often prolonged outpatient monitoring needed).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Echocardiogram for cardiac source.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Labs: CBC, BMP, glucose, lipids, HbA1c, coagulation.", citationIDs: ["openrn_neuro"])
        ],
        priorityAssessments: [
            AttributedBullet("URGENT workup — most TIA workup completed within 24–48 hours of presentation; many institutions admit or use rapid TIA clinic.", citationIDs: ["aha_stroke"]),
            AttributedBullet("Vital signs, neuro exam baseline.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("ABCD² risk stratification.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Identify and treat reversible risk factors.", citationIDs: ["openrn_neuro"])
        ],
        commonInterventions: [
            AttributedBullet("ANTIPLATELET therapy: aspirin 81 mg + clopidogrel 75 mg loading then both for 21–90 days then ASA monotherapy (CHANCE/POINT trials), or aspirin alone if not high-risk.", citationIDs: ["aha_stroke"]),
            AttributedBullet("STATIN — high-intensity (atorvastatin 80 mg or rosuvastatin 20–40 mg).", citationIDs: ["aha_stroke"]),
            AttributedBullet("BP CONTROL — long-term goal <130/80; do not aggressively lower acutely.", citationIDs: ["aha_stroke"]),
            AttributedBullet("DIABETES management.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("ANTICOAGULATION if AFib — DOAC or warfarin (DOAC preferred unless valvular).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("CAROTID ENDARTERECTOMY or stenting for symptomatic ≥50% (men) or ≥70% (women) carotid stenosis — within 2 weeks ideal.", citationIDs: ["aha_stroke"]),
            AttributedBullet("Smoking cessation, weight management, alcohol moderation, physical activity.", citationIDs: ["openrn_neuro"])
        ],
        watchFor: [
            AttributedBullet("STROKE within 48 hours, 7 days, 90 days — TIA is a brain-attack warning; act urgently.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Misdiagnosis — migraine, seizure with Todd paralysis, hypoglycemia, conversion can mimic TIA.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Crescendo TIAs (multiple episodes) — high stroke risk; admit and urgent workup.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Untreated AFib — high recurrent stroke risk; ensure anticoagulation.", citationIDs: ["openrn_neuro"])
        ],
        citations: [openrnNeuro, ahaStroke],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Subarachnoid Hemorrhage

public enum SAHSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "subarachnoid-hemorrhage",
        title: "Subarachnoid Hemorrhage (SAH)",
        subtitle: "Thunderclap headache · 'worst headache of my life' · ruptured aneurysm",
        nclexTags: neuroTags,
        definition: AttributedProse(
            "Bleeding into the subarachnoid space between arachnoid and pia mater. Most often from rupture of a saccular ('berry') aneurysm of the circle of Willis (~80%); other causes include AVMs, trauma, vasculitis. High mortality (~30%) and morbidity. Time-critical recognition.",
            citationIDs: ["openrn_neuro"]
        ),
        pathophysiology: AttributedProse(
            "Aneurysm rupture → arterial blood floods subarachnoid space and CSF → meningeal irritation, increased ICP, disrupted cerebral autoregulation. Risk factors: hypertension, smoking, family history, polycystic kidney disease, connective tissue disease, female, cocaine.",
            citationIDs: ["openrn_neuro"]
        ),
        presentation: [
            AttributedBullet("THUNDERCLAP HEADACHE — sudden, severe, 'worst headache of my life,' peaks within seconds.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Nausea, vomiting, photophobia.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("MENINGEAL IRRITATION — neck stiffness, Brudzinski, Kernig (developing over hours).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Decreased LOC, confusion, focal deficits.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Seizures.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Sentinel ('warning') leak — milder headache days–weeks before rupture (50% in some series).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Hunt-Hess grading 1–5 by clinical severity; modified Fisher grading by CT findings.", citationIDs: ["openrn_neuro"])
        ],
        diagnosticCriteria: [
            AttributedBullet("NON-CONTRAST HEAD CT — sensitivity ~95% within 6 hours, decreases over time.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("LUMBAR PUNCTURE if CT negative and high suspicion — xanthochromia (yellow CSF supernatant) and elevated RBCs in tubes 1 and 4 (no clearing) confirm SAH.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("CT/MR ANGIOGRAPHY — identify aneurysm location for treatment planning.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Cerebral angiography — gold standard for aneurysm characterization.", citationIDs: ["openrn_neuro"])
        ],
        priorityAssessments: [
            AttributedBullet("Neuro checks every 1 hour minimum; assess for re-bleed (sudden worsening).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Vital signs continuous — BP control critical.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Hunt-Hess and Fisher grading on admission and as condition changes.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Quiet environment — minimize stimulation; HOB 30°; avoid Valsalva (stool softeners).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Seizure precautions.", citationIDs: ["openrn_neuro"])
        ],
        commonInterventions: [
            AttributedBullet("BP CONTROL — target SBP <140 (some sources <160) until aneurysm secured; IV nicardipine, labetalol.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("ANEURYSM SECURING within 24–72 hours — surgical CLIPPING or endovascular COILING (preferred when feasible).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("NIMODIPINE 60 mg PO/NG every 4 hours × 21 days — improves outcomes by reducing vasospasm.", citationIDs: ["aan_concept"]),
            AttributedBullet("Seizure prophylaxis (controversial — typically short course AED post-rupture or for those at high risk).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("EXTERNAL VENTRICULAR DRAIN (EVD) for hydrocephalus.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("VASOSPASM MONITORING (delayed cerebral ischemia, day 4–14): clinical exam, transcranial Doppler, possible angiography; treat with euvolemia, induced hypertension once aneurysm secured, possible angioplasty.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Stool softeners (no straining).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Hyponatremia management — cerebral salt wasting common; replace with hypertonic saline.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("DVT prophylaxis (mechanical until aneurysm secured; pharmacologic afterwards per neurosurgery).", citationIDs: ["openrn_neuro"])
        ],
        watchFor: [
            AttributedBullet("RE-BLEEDING — highest risk in first 24 hours (~4% in 24 hr if untreated); sudden worsening; high mortality.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("CEREBRAL VASOSPASM and DELAYED ISCHEMIA — peak day 4–14; new focal deficit or AMS; major cause of late mortality and disability.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("HYDROCEPHALUS — acute (blood blocks CSF) or chronic (arachnoid scarring); EVD or VP shunt.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Cerebral salt wasting / SIADH causing hyponatremia.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Cardiac complications — neurogenic stunned myocardium, arrhythmias.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Family screening for first-degree relatives with two or more affected.", citationIDs: ["openrn_neuro"])
        ],
        citations: [openrnNeuro, aanConcept, ahaStroke],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Subdural Hematoma

public enum SubduralHematomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "subdural-hematoma",
        title: "Subdural Hematoma (SDH)",
        subtitle: "Bridging vein tear · acute, subacute, chronic · elderly + anticoagulation",
        nclexTags: neuroTags,
        definition: AttributedProse(
            "Bleeding between dura and arachnoid mater, typically from torn bridging veins. Acute (<3 days, often after trauma), subacute (3 days–3 weeks), chronic (>3 weeks, often elderly with seemingly minor or forgotten trauma). Crescent-shaped on imaging.",
            citationIDs: ["openrn_neuro"]
        ),
        pathophysiology: AttributedProse(
            "Stretching/tearing of bridging veins between cortex and dural sinuses. Risk factors: age (atrophy stretches veins, more space for hematoma to expand), anticoagulation/antiplatelet, alcohol use, repeated falls, shunt over-drainage. Chronic SDH expands gradually as small re-bleeds occur in inflamed neomembranes.",
            citationIDs: ["openrn_neuro"]
        ),
        presentation: [
            AttributedBullet("ACUTE SDH (after major trauma): immediate or rapid LOC decline, focal deficits, possible seizures.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("CHRONIC SDH: gradual onset over weeks — subtle confusion, gait change, headache, mild focal weakness, fall in elderly often dismissed as 'getting old' or dementia worsening.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Headache, nausea, vomiting.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Focal deficits (contralateral hemiparesis, aphasia depending on location).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Pupillary changes, posturing in severe.", citationIDs: ["openrn_neuro"])
        ],
        diagnosticCriteria: [
            AttributedBullet("NON-CONTRAST HEAD CT — CRESCENT-SHAPED hyperdense (acute), isodense (subacute), or hypodense (chronic) collection that crosses suture lines (vs lens-shaped epidural that does NOT cross sutures).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("MRI more sensitive for small/chronic.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Coagulation labs, anticoagulant levels.", citationIDs: ["openrn_neuro"])
        ],
        priorityAssessments: [
            AttributedBullet("Neuro checks frequently; trend over time.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Anticoagulant/antiplatelet history — REVERSE if active bleed.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Falls history; mechanism and timing of trauma (often forgotten in chronic).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Increased ICP signs.", citationIDs: ["openrn_neuro"])
        ],
        commonInterventions: [
            AttributedBullet("Small / asymptomatic / chronic without mass effect: observation with serial imaging.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Symptomatic / large / mass effect / shifting midline: SURGICAL EVACUATION (craniotomy for acute; burr hole drainage for chronic with subdural drain).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("REVERSE ANTICOAGULATION urgently: warfarin (vitamin K + 4-factor PCC); DOAC (idarucizumab for dabigatran; andexanet alfa for factor Xa inhibitors); antiplatelet (platelet transfusion in some protocols).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Manage increased ICP — head elevation, mannitol/hypertonic saline, sedation, possible decompression.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Seizure prophylaxis in some patients.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("BP control to maintain CPP.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Restart anticoagulation timing controversial — risk of re-bleed vs thromboembolism; multidisciplinary decision.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Falls prevention in elderly — multidisciplinary (PT, home safety, medication review).", citationIDs: ["openrn_neuro"])
        ],
        watchFor: [
            AttributedBullet("Re-bleed and expansion — close serial neuro and imaging.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Herniation — if rapid expansion; surgical decompression.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Recurrence after surgical evacuation — common in chronic SDH; close follow-up imaging.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Falls in elderly with SDH — assess and mitigate.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("'Forgotten' trauma — chronic SDH commonly presents weeks after a fall; ask family.", citationIDs: ["openrn_neuro"])
        ],
        citations: [openrnNeuro, aanConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Guillain-Barré Syndrome

public enum GBSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "guillain-barre",
        title: "Guillain-Barré Syndrome (GBS)",
        subtitle: "Acute ascending symmetric weakness · areflexia · post-infectious",
        nclexTags: neuroTags,
        definition: AttributedProse(
            "Acute immune-mediated polyneuropathy causing rapidly progressive symmetric ascending weakness, often following a recent infection (Campylobacter jejuni, CMV, EBV, Mycoplasma, Zika, COVID, influenza). Most common form is acute inflammatory demyelinating polyradiculoneuropathy (AIDP). Most recover, but respiratory failure and dysautonomia can be life-threatening.",
            citationIDs: ["openrn_neuro"]
        ),
        pathophysiology: AttributedProse(
            "Molecular mimicry — antibodies against pathogen cross-react with peripheral nerve gangliosides → demyelination and/or axonal injury. Cranial nerves and respiratory muscles can be affected.",
            citationIDs: ["openrn_neuro"]
        ),
        presentation: [
            AttributedBullet("Symmetric, ASCENDING weakness — distal then proximal; legs first, then arms, then face/bulbar.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("AREFLEXIA or hyporeflexia — early and prominent finding.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Sensory symptoms (paresthesias, mild loss) but motor predominant.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Cranial nerve involvement: facial weakness (often bilateral), dysphagia, dysarthria; ophthalmoplegia in Miller-Fisher variant.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("RESPIRATORY MUSCLE WEAKNESS — leading cause of mortality; 25–30% need mechanical ventilation.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("AUTONOMIC INSTABILITY — fluctuating BP, arrhythmias, ileus, urinary retention.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Pain — neuropathic, prominent feature in many.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Onset 1–4 weeks after preceding illness; nadir within 4 weeks.", citationIDs: ["openrn_neuro"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — progressive symmetric weakness + areflexia.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("LP: ALBUMINOCYTOLOGIC DISSOCIATION — elevated CSF protein (often >100) with normal/few cells.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Nerve conduction studies: demyelination (slow conduction) or axonal pattern.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Spirometry: NIF (negative inspiratory force) and FVC trend — predict respiratory failure.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Rule out: spinal cord compression, myelitis, myasthenia gravis (test for AChR Ab), tick paralysis, botulism, toxic neuropathy.", citationIDs: ["openrn_neuro"])
        ],
        priorityAssessments: [
            AttributedBullet("FREQUENT respiratory assessment: NIF, FVC, single-breath count, RR, SpO₂; intubate when NIF less negative than -30 cmH₂O or FVC <15 mL/kg.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Continuous cardiac monitoring for autonomic dysrhythmias.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Neurologic exam every 1–4 hours (motor strength, reflexes, sensation, cranial nerves).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Swallow assessment — aspiration risk.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Bowel/bladder function (autonomic involvement).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Pain assessment and treatment.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("DVT prophylaxis (high risk).", citationIDs: ["openrn_neuro"])
        ],
        commonInterventions: [
            AttributedBullet("ICU admission for moderate–severe disease.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("PLASMAPHERESIS or IVIG (2 g/kg over 5 days) — equally effective; combination NOT additive; start within 2–4 weeks of onset.", citationIDs: ["aan_concept"]),
            AttributedBullet("CORTICOSTEROIDS NOT effective for GBS (ineffective and may be harmful).", citationIDs: ["aan_concept"]),
            AttributedBullet("Mechanical ventilation when respiratory failure imminent — do NOT wait for crisis.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Treat autonomic instability — beta-blocker for tachycardia, atropine for bradycardia, fluids vs vasopressor for BP swings.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Pain — neuropathic agents (gabapentin, pregabalin), short-course opioid as adjunct.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("DVT prophylaxis.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Aggressive PT/OT/SLP rehab — recovery weeks to months; some have residual deficits.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Psychological support — fear, locked-in feeling for those with severe weakness; communication assistive devices.", citationIDs: ["openrn_neuro"])
        ],
        watchFor: [
            AttributedBullet("RESPIRATORY FAILURE — leading cause of death; serial NIF/FVC; intubate proactively.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("AUTONOMIC INSTABILITY — fatal arrhythmia possible; cardiac monitoring.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("DVT/PE — prolonged immobility.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Pressure injuries, contractures from immobility.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Recurrence (~5%) and chronic CIDP variant.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Functional recovery typically 6–12 months; ~20% have residual weakness; mortality 3–7%.", citationIDs: ["openrn_neuro"])
        ],
        citations: [openrnNeuro, aanConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Myasthenia Gravis

public enum MyastheniaGravisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "myasthenia-gravis",
        title: "Myasthenia Gravis (MG)",
        subtitle: "Autoimmune NMJ disorder · fatigable weakness · myasthenic and cholinergic crises",
        nclexTags: neuroTags,
        definition: AttributedProse(
            "Autoimmune disorder where antibodies (typically against acetylcholine receptors, less commonly MuSK) cause failure of neuromuscular transmission. Hallmark: FATIGABLE muscle weakness improving with rest. Lifetime prevalence ~1 in 5000. Bimodal age distribution (women 20–40, men 60–80).",
            citationIDs: ["openrn_neuro"]
        ),
        pathophysiology: AttributedProse(
            "Antibody-mediated destruction/blockade of nicotinic acetylcholine receptors at NMJ → reduced effective receptors → progressive weakness with repeated muscle activation, recovery with rest. Thymus often abnormal (hyperplasia or thymoma).",
            citationIDs: ["openrn_neuro"]
        ),
        presentation: [
            AttributedBullet("FATIGABLE weakness — worsens with activity, improves with rest. Symptoms typically worse at end of day.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Ocular involvement (often first/only): PTOSIS, DIPLOPIA, ophthalmoparesis.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Bulbar: dysphagia, dysarthria, jaw weakness.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Limb: typically proximal weakness (deltoids, hip flexors).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Respiratory muscle weakness — myasthenic crisis.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Reflexes typically PRESERVED (vs GBS).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Triggers: infection, surgery, certain medications (aminoglycosides, fluoroquinolones, beta-blockers, magnesium, certain anesthetics).", citationIDs: ["openrn_neuro"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Anti-AChR antibodies positive in ~85% generalized; anti-MuSK in some seronegative.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Edrophonium (Tensilon) test — historical; transient improvement with short-acting acetylcholinesterase inhibitor; rarely used now.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Electromyography — repetitive nerve stimulation shows decremental response; single-fiber EMG most sensitive.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Ice pack test for ptosis — improvement with ice supports MG.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Chest CT/MRI — thymoma in 10–15%.", citationIDs: ["openrn_neuro"])
        ],
        priorityAssessments: [
            AttributedBullet("Respiratory function — NIF, FVC; serial in worsening symptoms.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Bulbar function — swallow safety, voice changes.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Trigger identification — infection, new medications, surgery, pregnancy.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Myasthenic vs cholinergic crisis differentiation.", citationIDs: ["openrn_neuro"])
        ],
        commonInterventions: [
            AttributedBullet("Symptomatic: PYRIDOSTIGMINE (Mestinon) — acetylcholinesterase inhibitor; 30–90 mg PO every 4–6 hours.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Immunosuppressives: corticosteroids, azathioprine, mycophenolate, rituximab, eculizumab, efgartigimod.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("THYMECTOMY — recommended for thymoma; also consider for non-thymomatous MG in selected patients.", citationIDs: ["aan_concept"]),
            AttributedBullet("Acute exacerbation / crisis: PLASMAPHERESIS or IVIG (2 g/kg over 5 days).", citationIDs: ["aan_concept"]),
            AttributedBullet("AVOID drugs that worsen MG: aminoglycosides, fluoroquinolones, beta-blockers, magnesium, neuromuscular blockers (use with caution and reduced doses), procainamide, telithromycin.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Patient education on triggers, medication adherence, MedicAlert ID, drug avoidance list.", citationIDs: ["openrn_neuro"])
        ],
        watchFor: [
            AttributedBullet("MYASTHENIC CRISIS — severe weakness with respiratory failure; precipitated by infection, surgery, medication, missed pyridostigmine. ICU; may need intubation; IVIG/plasmapheresis.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("CHOLINERGIC CRISIS — TOO MUCH pyridostigmine. SLUDGE symptoms (Salivation, Lacrimation, Urination, Diarrhea, GI distress, Emesis), miosis, fasciculations, weakness; treat with atropine and ICU support; HOLD pyridostigmine.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Differentiate crises: edrophonium test (improves myasthenic, worsens cholinergic) — rarely used clinically due to risks.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Pregnancy considerations — neonatal transient MG from maternal antibody transfer; medications differ in pregnancy.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Long-term immunosuppression complications — infection, malignancy, osteoporosis.", citationIDs: ["openrn_neuro"])
        ],
        citations: [openrnNeuro, aanConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Multiple Sclerosis

public enum MultipleSclerosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "multiple-sclerosis",
        title: "Multiple Sclerosis (MS)",
        subtitle: "Autoimmune CNS demyelination · relapsing-remitting common · disease-modifying therapies",
        nclexTags: neuroTags,
        definition: AttributedProse(
            "Chronic autoimmune disease of the CNS characterized by inflammatory demyelination causing diverse neurologic symptoms disseminated in space (multiple CNS lesions) and time (multiple episodes or progression). Most common in young adults; women affected 2–3× more than men.",
            citationIDs: ["openrn_neuro"]
        ),
        pathophysiology: AttributedProse(
            "Immune-mediated attack on myelin and oligodendrocytes in CNS → focal areas of demyelination ('plaques') in white matter and gray matter. Genetic susceptibility + environmental factors (vitamin D deficiency, EBV exposure, smoking, latitude). Subtypes: relapsing-remitting (RRMS, most common), secondary progressive, primary progressive, clinically isolated syndrome.",
            citationIDs: ["openrn_neuro"]
        ),
        presentation: [
            AttributedBullet("Highly variable — depends on lesion location.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("OPTIC NEURITIS (often first symptom): unilateral painful vision loss, color desaturation, RAPD.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Sensory symptoms: paresthesias, numbness, Lhermitte sign (electric shock down spine with neck flexion).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Motor weakness, spasticity, hyperreflexia, Babinski.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Cerebellar: ataxia, intention tremor, dysmetria, dysarthria.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Brainstem: diplopia, internuclear ophthalmoplegia (highly suggestive in young patient), vertigo.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Bladder dysfunction (urgency, retention), bowel changes, sexual dysfunction.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Cognitive impairment, fatigue (often most disabling), depression.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("UHTHOFF PHENOMENON — temporary worsening with heat (exercise, fever, hot bath).", citationIDs: ["openrn_neuro"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MCDONALD CRITERIA — clinical episodes plus MRI evidence of dissemination in space and time.", citationIDs: ["aan_concept"]),
            AttributedBullet("MRI BRAIN AND SPINE — periventricular, juxtacortical, infratentorial, spinal cord lesions; gadolinium-enhancing (active) vs not.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("LP: oligoclonal bands and elevated IgG index in CSF.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Visual evoked potentials may show subclinical optic nerve involvement.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Rule out mimics: NMO (aquaporin-4 antibody), MOG-associated disease, lupus, B12 deficiency, Lyme.", citationIDs: ["openrn_neuro"])
        ],
        priorityAssessments: [
            AttributedBullet("Functional status — Expanded Disability Status Scale (EDSS).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Bladder function — risk of UTI, retention, urosepsis.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Mood and cognition — depression and cognitive changes common.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Skin integrity (immobility), fall risk, swallow safety in advanced.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Treatment adherence and side-effect monitoring.", citationIDs: ["openrn_neuro"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE RELAPSE: high-dose IV methylprednisolone (1 g daily × 3–5 days) for moderate-severe relapse; oral taper sometimes; plasmapheresis if steroid-refractory severe.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("DISEASE-MODIFYING THERAPIES (DMTs) — many options reducing relapse rate and slowing progression: interferons, glatiramer, dimethyl fumarate, teriflunomide, fingolimod/ozanimod (S1P modulators), natalizumab, ocrelizumab, ofatumumab, alemtuzumab, cladribine.", citationIDs: ["aan_concept"]),
            AttributedBullet("SYMPTOMATIC: spasticity (baclofen, tizanidine, gabapentin), neuropathic pain (gabapentin/pregabalin), bladder (oxybutynin, mirabegron, intermittent catheterization), fatigue (amantadine, modafinil, exercise), depression (SSRI), cognitive (rehab).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("PT/OT/SLP rehab; assistive devices.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Vitamin D supplementation, smoking cessation, regular exercise.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Avoid OVERHEATING — cooling strategies; cooling vests for exercise.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("MS-specialized care center; multidisciplinary team.", citationIDs: ["openrn_neuro"])
        ],
        watchFor: [
            AttributedBullet("Progressive disability over years; some develop secondary progressive course.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("DMT-specific risks — PML with natalizumab/JC virus exposure; opportunistic infection with B-cell depleters; lymphopenia, malignancy with some agents.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Depression and suicide risk increased.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Recurrent UTI from neurogenic bladder — pyelonephritis, urosepsis.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Pseudoexacerbation — temporary worsening from heat, infection, stress, sleep deprivation; resolves with trigger removal.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Pregnancy — relapse rate decreases during pregnancy, increases postpartum; DMT considerations.", citationIDs: ["openrn_neuro"])
        ],
        citations: [openrnNeuro, aanConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Parkinson Disease

public enum ParkinsonDiseaseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "parkinson-disease",
        title: "Parkinson Disease (PD)",
        subtitle: "Bradykinesia + tremor + rigidity · dopaminergic therapy",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility),
        definition: AttributedProse(
            "Progressive neurodegenerative disorder characterized by motor symptoms (bradykinesia, resting tremor, rigidity, postural instability) plus non-motor symptoms (autonomic, cognitive, mood, sleep, sensory). Caused by loss of dopaminergic neurons in substantia nigra. Median age of onset ~60.",
            citationIDs: ["openrn_neuro"]
        ),
        pathophysiology: AttributedProse(
            "Loss of dopaminergic neurons in substantia nigra pars compacta → reduced dopamine in striatum → imbalance in basal ganglia motor circuits. Lewy bodies (alpha-synuclein aggregates) are pathologic hallmark. Etiology multifactorial — genetic and environmental.",
            citationIDs: ["openrn_neuro"]
        ),
        presentation: [
            AttributedBullet("CARDINAL MOTOR FEATURES (TRAP): TREMOR (resting, 'pill-rolling'), RIGIDITY (cogwheel), AKINESIA/BRADYKINESIA, POSTURAL instability.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("ASYMMETRIC onset, typically.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Mask-like face (hypomimia), decreased blink, monotone speech (hypophonia), micrographia (small handwriting), shuffling gait, reduced arm swing, festination, freezing.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("NON-MOTOR symptoms (often precede motor): hyposmia, REM sleep behavior disorder, constipation, depression, anxiety, orthostatic hypotension, urinary urgency, sexual dysfunction, fatigue, pain.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Cognitive impairment / dementia in 30–80% over course.", citationIDs: ["openrn_neuro"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — bradykinesia + (resting tremor OR rigidity) plus supportive criteria.", citationIDs: ["aan_concept"]),
            AttributedBullet("Levodopa response is supportive.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("MRI/SPECT to rule out other causes (vascular parkinsonism, NPH, atypical syndromes).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Exclude: drug-induced parkinsonism (antipsychotics, antiemetics like metoclopramide), atypical parkinsonian syndromes (PSP, MSA, CBD), essential tremor.", citationIDs: ["openrn_neuro"])
        ],
        priorityAssessments: [
            AttributedBullet("Motor function — UPDRS-III scoring; on/off fluctuations.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Falls risk — postural instability is major source of morbidity.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Swallowing — aspiration risk; SLP eval as needed.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Cognitive function — screen for dementia.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Mood — depression underdiagnosed; screen.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Constipation, orthostasis, bladder.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Medication TIMING — small windows of effective levodopa; do NOT skip or delay doses.", citationIDs: ["openrn_neuro"])
        ],
        commonInterventions: [
            AttributedBullet("LEVODOPA/CARBIDOPA (Sinemet) — most effective; immediate-release, controlled-release, IR-CR combinations; eventually motor fluctuations and dyskinesia develop.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Dopamine agonists — pramipexole, ropinirole, rotigotine patch.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("MAO-B inhibitors — selegiline, rasagiline, safinamide.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("COMT inhibitors — entacapone, opicapone (extend levodopa effect).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Anticholinergics (trihexyphenidyl, benztropine) for tremor — limited use due to cognitive side effects.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Amantadine for dyskinesia.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("DEEP BRAIN STIMULATION (DBS) for advanced disease with motor fluctuations or refractory tremor.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("REHABILITATION — PT (LSVT BIG), SLP (LSVT LOUD), OT.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("AVOID dopamine antagonists (typical antipsychotics, metoclopramide, prochlorperazine — worsen PD).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("For PD psychosis: pimavanserin, quetiapine, clozapine (NOT typical antipsychotics).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Hospitalized PD patients: continue home medications ON SCHEDULE (often shorter intervals than facility default); coordinate with home schedule.", citationIDs: ["openrn_neuro"])
        ],
        watchFor: [
            AttributedBullet("FALLS — leading source of morbidity; multidisciplinary fall prevention.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("ASPIRATION pneumonia — leading cause of death.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Motor fluctuations and dyskinesia — wearing off, on-off, peak-dose dyskinesia; medication adjustment.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Levodopa-induced psychosis, hallucinations, impulse control disorders (especially with dopamine agonists).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Orthostatic hypotension — fall risk; address.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Severe constipation / ileus.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Hospitalized PD patients have high adverse event rate from missed medications and prohibited drugs.", citationIDs: ["openrn_neuro"])
        ],
        citations: [openrnNeuro, aanConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Alzheimer Disease / Dementia

public enum AlzheimerDementiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "alzheimer-dementia",
        title: "Alzheimer Disease and Dementia",
        subtitle: "Progressive cognitive decline · safety, caregiver, behavioral support",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .cognition),
        definition: AttributedProse(
            "Dementia = acquired progressive decline in ≥1 cognitive domains causing functional impairment. Alzheimer disease (AD) is the most common cause (60–80%); other causes: vascular dementia, Lewy body dementia, frontotemporal dementia, mixed dementia, NPH (potentially reversible), B12 deficiency (potentially reversible). Distinguish from delirium (acute, fluctuating) and depression ('pseudodementia').",
            citationIDs: ["openrn_neuro"]
        ),
        pathophysiology: AttributedProse(
            "AD: extracellular amyloid-beta plaques + intracellular tau neurofibrillary tangles → neuronal loss, synaptic dysfunction, brain atrophy (medial temporal first). Hippocampus particularly affected, explaining early memory impairment. Genetic risk factors (APOE4) and rare familial forms.",
            citationIDs: ["openrn_neuro"]
        ),
        presentation: [
            AttributedBullet("EARLY: short-term memory loss (most prominent in AD), word-finding difficulty, executive dysfunction, getting lost in familiar places.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("MIDDLE: increasing confusion, disorientation, language difficulty, ADL impairment, behavioral changes (agitation, wandering, sundowning, paranoia, aggression), incontinence.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("LATE: severe cognitive impairment, mute or minimal speech, total ADL dependence, dysphagia, immobility, incontinence.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Lewy body dementia: fluctuating cognition, visual hallucinations, parkinsonism, REM sleep behavior disorder, antipsychotic sensitivity.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Vascular dementia: stepwise decline, focal deficits, cerebrovascular risk factors.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Frontotemporal: behavioral/personality changes, language variants; younger onset.", citationIDs: ["openrn_neuro"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Cognitive screening: Mini-Cog, MMSE, MoCA (more sensitive for mild impairment).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Functional assessment — ADLs, IADLs.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Lab workup to exclude reversible: TSH, B12, CBC, BMP, syphilis (RPR), HIV in select.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Brain imaging (MRI preferred) — exclude tumor, NPH, stroke; assess atrophy pattern.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("CSF biomarkers, amyloid PET — for atypical or research.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Distinguish from DELIRIUM (acute, fluctuating, often medical cause) and DEPRESSION ('pseudodementia' — improves with treatment).", citationIDs: ["openrn_neuro"])
        ],
        priorityAssessments: [
            AttributedBullet("Cognitive function tracking; functional decline.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Safety — wandering, falls, fire risk (cooking), driving cessation.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Behavioral and psychological symptoms (agitation, hallucinations, aggression, depression).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Caregiver burden — major risk for elder abuse and caregiver mental health.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Medication review — stop unnecessary, anticholinergic burden (Beers criteria).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Advance care planning early — capacity diminishes.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Acute changes → workup for delirium, infection (especially UTI), medication side effect, pain.", citationIDs: ["openrn_neuro"])
        ],
        commonInterventions: [
            AttributedBullet("CHOLINESTERASE INHIBITORS (donepezil, rivastigmine, galantamine) for mild-moderate AD; modest symptomatic benefit; bradycardia, GI side effects.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("MEMANTINE (NMDA antagonist) for moderate-severe AD; can combine with cholinesterase inhibitor.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Anti-amyloid antibodies (lecanemab, donanemab) for early AD with confirmed amyloid; modest benefit; ARIA risk; specialized centers.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("BEHAVIORAL SYMPTOMS — non-pharmacologic FIRST: validate, redirect, calm environment, structure, music, simple choices, address unmet needs (pain, hunger, toileting).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Pharmacologic for refractory severe agitation or psychosis: low-dose atypical antipsychotic (risperidone, olanzapine) — black-box warning increased mortality in elderly with dementia; use lowest dose, shortest duration; avoid in Lewy body (severe sensitivity).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("AVOID: anticholinergics (worsen cognition), benzodiazepines (paradoxical agitation, falls), restraints (worsen agitation).", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Caregiver support — education, respite, support groups, Adult Day Health, home health, eventual long-term care planning.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Address depression, anxiety, sleep.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Hospice referral for end-stage dementia.", citationIDs: ["openrn_neuro"])
        ],
        watchFor: [
            AttributedBullet("DELIRIUM superimposed on dementia — common, often missed; new acute change requires medical workup, not 'just dementia getting worse.'", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Falls, wandering, swallowing decline → aspiration pneumonia.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Caregiver burnout, abuse, neglect — assess and support.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Driving safety — discuss early; required reporting in some jurisdictions.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Capacity / surrogate decision-making — early advance care planning.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Antipsychotics in dementia — black box, increased mortality and stroke; reserve for severe symptoms with thoughtful trial.", citationIDs: ["openrn_neuro"]),
            AttributedBullet("Lewy body dementia — severe sensitivity to antipsychotics; can be life-threatening (NMS-like).", citationIDs: ["openrn_neuro"])
        ],
        citations: [openrnNeuro, aanConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}
