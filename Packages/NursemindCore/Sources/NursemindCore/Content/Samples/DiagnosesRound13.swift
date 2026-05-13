import Foundation

// Curator-model diagnosis entries (round 13 expansion — stroke + neuro + peds ID + endocrine + pulm/vasc).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax (CC BY 4.0 with AI restriction),
// CDC + AHA / AAN / AAP / ATA / ATS / SVS concept citations.

private let openrnDxR13 = CitationSource(
    id: "openrn_dx_round13",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=stroke+TBI+endocrine+IPF",
    lastRetrieved: "2026-05-04"
)
private let openstaxDxR13 = CitationSource(
    id: "openstax_dx_round13",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let cdcDxR13 = CitationSource(
    id: "cdc_dx_round13",
    shortName: "CDC clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let specialtyDxR13 = CitationSource(
    id: "specialty_dx_round13",
    shortName: "AHA / AAN / AAP / ATA / ATS / SVS guidelines (concept citation)",
    publisher: "AHA · AAN · AAP · ATA · ATS · SVS",
    license: .factCitationOnly,
    url: "https://professional.heart.org/en/guidelines-and-statements",
    lastRetrieved: "2026-05-04"
)

private let strokeR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let neuroR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation)
private let infectionR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)
private let endoR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)
private let pulmR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)
private let vascR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion)

// MARK: - Ischemic Stroke

public enum IschemicStrokeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ischemic-stroke",
        title: "Ischemic stroke",
        subtitle: "~85% of strokes · alteplase + thrombectomy · time-critical",
        nclexTags: strokeR13,
        definition: AttributedProse(
            "Acute neurologic deficit from arterial occlusion in cerebral circulation — most often thromboembolic. Treatment in earliest possible window (alteplase up to 4.5 hours; mechanical thrombectomy up to 24 hours in selected large-vessel occlusion) per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Cerebral artery occlusion → core infarct (irreversible) surrounded by ischemic penumbra (potentially salvageable). Common etiologies: cardioembolic (AFib, prosthetic valve), large-artery atherothrombotic, small-vessel lacunar, cryptogenic (often PFO).",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("Sudden focal deficit — unilateral weakness / numbness, aphasia, dysarthria, vision loss, ataxia, vertigo.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("BE-FAST screening — Balance, Eyes, Face, Arms, Speech, Time.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("MCA — contralateral face / arm weakness > leg, aphasia (dominant), neglect (non-dominant).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Posterior circulation — vertigo, ataxia, diplopia, dysphagia, crossed deficits.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Lacunar — pure motor / sensory / dysarthria-clumsy hand / ataxic hemiparesis.", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Emergent non-contrast CT head — RULES OUT hemorrhage (cannot reliably DIAGNOSE acute ischemia in first hours).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("CT angiogram + perfusion to identify large-vessel occlusion + penumbra.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("MRI DWI — most sensitive for early ischemia.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Workup — ECG (AFib), echo, carotid US, lipid panel, A1c, lipids, hypercoagulable per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Stroke alert / activate code; door-to-needle goal <60 minutes per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("NIHSS at baseline + serially.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Last-known-well time (NOT symptom-discovery time); witnesses; medication review (anticoagulants, prior tPA contraindications).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("BP — must be <185/110 for tPA per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Glucose — exclude hypoglycemia mimics; recheck.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("ALTEPLASE / TENECTEPLASE IV within 4.5 hours of symptom onset (alteplase 0.9 mg/kg, max 90 mg, 10% bolus + 90% over 1 hour) per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("MECHANICAL THROMBECTOMY — large-vessel anterior occlusion within 6 hours; up to 24 hours in select patients with significant penumbra (DAWN / DEFUSE-3) per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("BP control — pre-tPA <185/110; post-tPA <180/105 × 24 hours per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("ASPIRIN 162–325 mg PO/PR within 24–48 hours (after tPA window or instead in non-tPA candidates) per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("DUAL antiplatelet (ASA + clopidogrel) for 21 days in minor non-cardioembolic stroke / TIA per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Anticoagulation for AFib — within 1–14 days based on stroke size per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Stroke-unit care; swallow eval before PO; DVT prophylaxis; rehab (PT/OT/ST); risk-factor management.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Statin (high-intensity), antihypertensive, glycemic control; smoking cessation; AFib anticoagulation per CHADS-VASc per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("HEMORRHAGIC TRANSFORMATION post-tPA — sudden neuro deterioration, headache, hypertension; STOP tPA if running, emergent CT, reverse with cryoprecipitate / TXA / platelets per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Cerebral edema with malignant MCA stroke — hemicraniectomy may be life-saving in selected patients per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("ASPIRATION pneumonia from dysphagia — NPO until swallow eval cleared.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Recurrence prevention — most strokes occur in patients with prior stroke / TIA; aggressive secondary prevention per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hemorrhagic Stroke (ICH)

public enum HemorrhagicStrokeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hemorrhagic-stroke",
        title: "Hemorrhagic stroke (intracerebral hemorrhage)",
        subtitle: "~10–15% of strokes · BP control + reverse anticoagulation · NSGY consult",
        nclexTags: strokeR13,
        definition: AttributedProse(
            "Bleeding within the brain parenchyma — typically from chronic hypertension, cerebral amyloid angiopathy, vascular malformation, anticoagulation, trauma. Higher mortality than ischemic stroke per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Vessel rupture → hematoma compressing surrounding brain → secondary edema and ischemia. Hematoma EXPANSION in first hours common — drives early mortality.",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("Sudden severe headache (often in HTN-related deep ICH); rapid neuro decline.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Focal deficit corresponds to hematoma location — basal ganglia / thalamus (HTN), lobar (CAA in elderly), cerebellar (vertigo + ataxia + altered mental status).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Vomiting, decreased LOC.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Hypertension (often dramatic at presentation).", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Non-contrast CT head — gold standard for emergent diagnosis; identifies hematoma volume + location.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("CT angiogram for spot sign (predicts hematoma expansion) and underlying vascular lesion.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("MRI for chronic etiology workup (CAA, microbleeds).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Coagulation panel; reverse anticoagulation immediately if applicable.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Airway / GCS; NIHSS; pupillary exam (herniation signs).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("BP — aggressive control in first hours.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Anticoagulation status — reverse emergently.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Trauma assessment — rule out subdural / epidural / contusion in trauma.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("BP control — target SBP <140 mmHg in most spontaneous ICH per primary source; nicardipine / labetalol / clevidipine IV.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("REVERSE ANTICOAGULATION — warfarin → 4-factor PCC + vitamin K; dabigatran → idarucizumab; factor Xa inhibitor → andexanet alfa or 4-factor PCC; heparin → protamine per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("ICP management — HOB 30°, head-midline neutral, mannitol or hypertonic saline (3%) per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Neurosurgical consult — cerebellar hemorrhage >3 cm with brainstem compression / hydrocephalus = SURGICAL EMERGENCY; large supratentorial hematoma controversial per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("EVD for hydrocephalus / IVH; ICP monitor in selected.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Seizure prophylaxis NOT routinely indicated; treat seizures if they occur.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("VTE prophylaxis — start mechanical immediately; pharmacologic at 24–48 hours if hemorrhage stable per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Goals-of-care discussion — high mortality, especially with severe deficit + poor pre-stroke status.", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("HEMATOMA EXPANSION in first 6 hours — repeat CT at 6–24 hours; aggressive BP control reduces but does not eliminate.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("HERNIATION — fixed dilated pupil, Cushing's triad (HTN + bradycardia + irregular respirations); emergent intervention.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("HYDROCEPHALUS from IVH or posterior fossa hematoma — EVD.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Re-bleed risk — long-term BP control, anticoagulation reassessment per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - SAH

public enum SAHRound13Sample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "sah",
        title: "Subarachnoid hemorrhage (SAH)",
        subtitle: "Aneurysmal · \"thunderclap\" headache · vasospasm + rebleed risk",
        nclexTags: strokeR13,
        definition: AttributedProse(
            "Bleeding into subarachnoid space — most commonly from rupture of a saccular (\"berry\") aneurysm at branch points of circle of Willis (~80%); other causes include AVM, trauma, perimesencephalic. High mortality and morbidity even with treatment per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Aneurysm rupture → blood under arterial pressure into subarachnoid space → ICP elevation, irritation of meninges, vasospasm 4–14 days later, hydrocephalus, rebleed risk if untreated.",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("\"WORST HEADACHE OF MY LIFE\" — sudden / thunderclap; classic.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Photophobia, nausea / vomiting, neck stiffness, brief loss of consciousness.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Focal deficit (CN III palsy from posterior communicating aneurysm — \"down and out\" pupil dilated).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Sentinel headache — minor leak preceding rupture by days-weeks (~10–40%).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Hunt-Hess grade 1–5 (clinical severity) and Fisher grade 1–4 (CT blood) for prognosis.", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Non-contrast CT head — sensitivity ~99% within 6 hours, falls to ~85% at 24 hours.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("LUMBAR PUNCTURE if CT negative + clinical suspicion remains — xanthochromia (yellow CSF from RBC breakdown) confirms SAH per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("CT angiogram or DSA to identify aneurysm.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Airway / GCS; pupillary; cranial-nerve exam; signs of meningismus.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("BP — control to prevent rebleed (target SBP <140 typically).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Vasospasm surveillance with TCD ultrasound days 4–14.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("EMERGENT NEUROSURGICAL CONSULT for definitive aneurysm treatment — endovascular coiling vs surgical clipping per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("BP control — keep SBP <140 to prevent rebleed; nicardipine / labetalol / clevidipine.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("NIMODIPINE 60 mg PO every 4 hours × 21 days — REDUCES vasospasm-related stroke per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("ICP management; EVD if hydrocephalus.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Vasospasm management — INDUCED HYPERTENSION (post-coiling/clipping) per primary source; verapamil intra-arterial; angioplasty for refractory.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Seizure prophylaxis — short-course in selected patients per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("DVT prophylaxis — mechanical until aneurysm secured + 24 hours; then pharmacologic.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("HYPERVOLEMIA / HEMODILUTION (\"Triple H\") historical; current focus is euvolemia + induced hypertension per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("REBLEED — peak first 24 hours; mortality >50%; aggressive BP control + early aneurysm treatment.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("VASOSPASM days 4–14 → delayed cerebral ischemia; nimodipine + monitoring.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Hydrocephalus — communicating from blood blockage; EVD or VP shunt.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("HYPONATREMIA from cerebral salt wasting OR SIADH; differentiate (volume status); treat appropriately per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Long-term — cognitive deficits, depression, family burden.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Severe TBI

public enum SevereTBISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "severe-tbi",
        title: "Severe traumatic brain injury (TBI)",
        subtitle: "GCS ≤8 · ICP control · prevent secondary injury",
        nclexTags: neuroR13,
        definition: AttributedProse(
            "Severe TBI defined by post-resuscitation GCS ≤8. Primary injury is from initial impact (often irreversible); SECONDARY injury (hypoxia, hypotension, ICP elevation, cerebral ischemia, edema, seizure, fever, hyperglycemia) is the focus of ICU management per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Mechanical injury → axonal stretching, contusion, hematoma. Cytotoxic edema + blood-brain barrier disruption → ICP rise → cerebral perfusion drop → secondary ischemia. Cushing's reflex (HTN + bradycardia + irregular respirations) signals critical ICP.",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("GCS ≤8; coma; pupillary abnormalities (asymmetric / fixed = herniation).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Cushing's triad — HTN + bradycardia + irregular respirations = elevated ICP / herniation.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Posturing — decorticate (flexor) or decerebrate (extensor); decerebrate is worse prognosis.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Skull fracture — Battle sign (postauricular bruise, basilar fracture), raccoon eyes (periorbital, basilar), CSF rhinorrhea / otorrhea.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Concomitant trauma common — c-spine, thoracic, abdominal.", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("GCS — eye opening + verbal + motor; pre-resuscitation and post-resuscitation.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Non-contrast CT head — gold standard; identifies hematoma, contusion, mass effect.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("CT cervical spine — clear before manipulation.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("ICP monitor (intraventricular bolt or fiberoptic) — for GCS ≤8 + abnormal CT per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("ABCs — intubate for airway protection (RSI with etomidate / propofol; AVOID succinylcholine if hyperK or burns; consider ICP-friendly induction).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("AVOID hypotension (SBP <90) and hypoxia (SpO2 <90) — strong predictors of poor outcome per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("ICP / CPP monitoring — target ICP <22 mmHg, CPP 60–70 mmHg per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Pupils, GCS, motor exam every 1 hour minimum.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("HOB 30°, head midline neutral; cervical collar until c-spine cleared.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("ICP first-tier — sedation (propofol / fentanyl), CSF drainage via EVD, mannitol 0.25–1 g/kg IV or hypertonic saline 3% (250 mL) per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Second-tier — moderate hyperventilation (PaCO2 30–35 brief); pentobarbital coma; decompressive craniectomy per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("AVOID hyperventilation as first-line — causes cerebral vasoconstriction and ischemia.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Glycemic control — avoid hyperglycemia + hypoglycemia.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Seizure prophylaxis — levetiracetam × 7 days post-injury per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Avoid fever — antipyretics + cooling.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Nutrition — early enteral within 72 hours.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Surgical evacuation of hematoma — emergent for >30 mL EDH or SDH with mass effect per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Neurorehab + family support; long-term cognitive / behavioral / physical therapy.", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("HERNIATION — fixed dilated pupil, Cushing's triad, posturing → emergent osmotic + hyperventilation + decompression.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("DELAYED ICH — repeat CT at 6 hours; some hemorrhages enlarge.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Seizure — even subclinical; cEEG in selected.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("DI / SIADH from posterior pituitary injury.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Long-term — chronic traumatic encephalopathy with repeated injury; family education and rehabilitation.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - MIS-C

public enum MISCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "mis-c",
        title: "Multisystem inflammatory syndrome in children (MIS-C)",
        subtitle: "Post-COVID hyperinflammatory · Kawasaki-like · IVIG + steroids",
        nclexTags: infectionR13,
        definition: AttributedProse(
            "Hyperinflammatory syndrome in children typically 2–6 weeks after SARS-CoV-2 infection (sometimes asymptomatic exposure). Resembles Kawasaki disease + toxic shock with cardiovascular shock predominance. CDC case definition specifies fever + multisystem (≥2 organ systems) + lab evidence of inflammation + recent SARS-CoV-2 + no alternate diagnosis per primary source.",
            citationIDs: ["openrn_dx_round13", "cdc_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Post-infectious immune dysregulation triggered by SARS-CoV-2 → cytokine storm → endothelial injury → cardiogenic shock + multi-organ involvement.",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("Fever ≥38.0°C × ≥24 hours.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Multi-organ — GI (severe abdominal pain / vomiting / diarrhea — most common), cardiac (myocarditis, shock, dysrhythmia, pericardial effusion, coronary aneurysm), shock, mucocutaneous (rash, conjunctival injection, oral / extremity changes — Kawasaki-like).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Elevated inflammatory markers — CRP, ferritin, ESR, D-dimer; lymphopenia / thrombocytopenia.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Recent SARS-CoV-2 (PCR / antibody / exposure within 4 weeks).", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CDC definition — age <21, fever, ≥2 organ involvement, lab inflammation, recent SARS-CoV-2, no alternate diagnosis per primary source.", citationIDs: ["cdc_dx_round13"]),
            AttributedBullet("WHO criteria similar; both require multi-system involvement.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Workup — CBC, CRP, ferritin, D-dimer, troponin, BNP, coags, electrolytes, ferritin; SARS-CoV-2 PCR + antibody; ECG + echo (essential — coronary aneurysms, ventricular dysfunction).", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Hemodynamic stability — shock common; trend BP / HR / lactate / urine output.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Cardiac — echo, ECG, troponin, BNP; coronary-aneurysm screen.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Mucocutaneous — rash, mucositis, periorbital changes (Kawasaki-like).", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("ADMIT to PICU for monitoring; pediatric infectious-disease + cardiology + rheumatology consult per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("IVIG 2 g/kg IV over 8–12 hours per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Methylprednisolone 1–2 mg/kg/day IV per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Refractory — anakinra (IL-1 receptor antagonist) or infliximab (anti-TNF) per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("ASA 30–50 mg/kg/day until afebrile, then 3–5 mg/kg/day low-dose for coronary protection until inflammation resolves and coronaries normal per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("VTE prophylaxis — enoxaparin in significant inflammation / coronary aneurysm per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Echocardiogram at diagnosis, 1 week, 6 weeks per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Vaccinate against COVID-19 per CDC / AAP after recovery.", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("CARDIOGENIC SHOCK — most serious; ICU-level vasopressors / inotropes / ECMO if needed.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("CORONARY ANEURYSMS — surveillance echo; antiplatelet therapy; pediatric cardiology long-term follow-up.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Distinguish from KAWASAKI — overlaps but MIS-C has more GI / myocarditis / older age; treatment principles overlap.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Family + child psychological support — recent COVID + critical illness.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, cdcDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - NEC

public enum NECSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "nec",
        title: "Necrotizing enterocolitis (NEC)",
        subtitle: "Premature infants · feeding intolerance · pneumatosis intestinalis · NPO + abx",
        nclexTags: infectionR13,
        definition: AttributedProse(
            "Most common life-threatening GI emergency of premature neonates. Inflammatory necrosis of bowel — most often distal ileum and proximal colon. Risk increases with prematurity, formula feeding, hypoxic / ischemic episodes per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — immature mucosal barrier + abnormal microbial colonization + ischemia / reperfusion + formula feeding + inflammatory cascade → bowel-wall injury → bacterial translocation, pneumatosis (gas in bowel wall), perforation, peritonitis, sepsis, death.",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("Feeding intolerance — increased residuals, vomiting (often bilious), abdominal distension.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Bloody / mucoid stools.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Lethargy, temperature instability, apnea, bradycardia.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Abdominal exam — distended, tender, discolored (red / bluish), absent bowel sounds, palpable mass; abdominal-wall erythema in advanced.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Shock / DIC / multi-organ failure in advanced disease.", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Abdominal radiograph — pneumatosis intestinalis (gas in bowel wall — pathognomonic), portal venous gas, free air (perforation), fixed loop.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Bell staging — I (suspected), II (definite — pneumatosis), III (advanced — perforation, shock) per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Labs — leukopenia / leukocytosis, thrombocytopenia, metabolic acidosis, lactate, hypoglycemia, electrolyte derangement.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — apnea, bradycardia, hypotension, temp instability.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Abdominal exam at every assessment — measure girth, color, palpation.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Feeding tolerance, residuals, stool characteristics.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("STOP feeds — NPO immediately; IV fluids + parenteral nutrition.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("OGT decompression — low intermittent suction.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Broad-spectrum IV ANTIBIOTICS — ampicillin + gentamicin + metronidazole (or piperacillin-tazobactam) × 7–14 days per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Serial abdominal radiographs every 6–12 hours during acute phase.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Surgical consult — perforation, fixed loop, refractory deterioration → exploratory laparotomy + bowel resection per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Supportive — vasopressors, ventilation, transfusion, electrolyte correction.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Reintroduction of feeds — slow progression after 7–14 days NPO once stable; breast milk preferred per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("PREVENTION — breast milk (vs formula), probiotic in some NICUs, careful feeding advancement protocols, antenatal corticosteroids per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("PERFORATION — sudden deterioration, free air on x-ray; surgical emergency.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("SHORT-BOWEL SYNDROME from extensive resection — long-term TPN dependence; intestinal-failure care.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Strictures from healed NEC — months later present with obstruction.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Long-term — neurodevelopmental delay, growth issues common per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Neonatal Sepsis

public enum NeonatalSepsisRound13Sample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "neonatal-sepsis-r13",
        title: "Neonatal sepsis",
        subtitle: "Early-onset (≤72 hr — GBS / E. coli) vs late-onset (>72 hr — coag-neg staph / GBS)",
        nclexTags: infectionR13,
        definition: AttributedProse(
            "Bloodstream / systemic infection in a neonate with positive culture or strong clinical suspicion. Categorized by timing — early-onset (≤72 hours of life — typically perinatal acquisition: group B streptococcus, E. coli, Listeria) and late-onset (>72 hours — typically nosocomial: coag-neg staph, GBS, enterococcus, gram-negatives, Candida) per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Early-onset — perinatal exposure to maternal genital flora; risk factors include prolonged ROM, maternal chorioamnionitis, GBS colonization, prematurity. Late-onset — nosocomial / community acquisition.",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("Subtle / non-specific — temperature instability (HYPO- or hyperthermia), feeding intolerance, lethargy.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Respiratory — apnea, tachypnea, grunting, retractions, cyanosis.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Cardiovascular — poor perfusion, mottling, weak pulses, prolonged cap refill, hypotension (LATE).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Neuro — irritability, seizures, bulging fontanelle (meningitis).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Skin — petechiae, mottling.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Glucose abnormalities — hypoglycemia or hyperglycemia.", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Sepsis screen — CBC with differential (immature/total ratio >0.2 supportive), CRP / procalcitonin, blood culture × 2 sites.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Lumbar puncture for CSF — meningitis is part of sepsis workup in newborns per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Urinalysis + urine culture (>72 hr olds), tracheal aspirate if intubated.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Maternal records — GBS status, ROM, chorioamnionitis, antibiotics.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs (T, HR, RR, BP); skin perfusion; mental status; feeding.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Glucose; weight; UOP.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Risk factors — perinatal vs nosocomial; recent procedures / lines.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("EMPIRICAL ANTIBIOTICS within 1 hour of suspicion — early-onset: ampicillin + gentamicin (covers GBS, E. coli, Listeria); late-onset: vancomycin + gentamicin or cefepime per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Adjust antibiotics per culture + sensitivity; treat 7–14 days for confirmed bacteremia + 21 days for meningitis per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Supportive — fluid resuscitation (10–20 mL/kg NS bolus if shock), vasopressors per pediatric sepsis bundle, ventilation, glucose support per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Thermoregulation — incubator / warmer.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Maternal GBS-positive — intrapartum penicillin or ampicillin reduces early-onset GBS sepsis per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Family education + follow-up; coordinate with OB for maternal contributors (chorioamnionitis treatment, future-pregnancy counseling).", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("MENINGITIS — neuro signs, bulging fontanelle, seizures; LP essential.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("DIC — petechiae, bleeding, prolonged INR; supportive.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("NEC concurrent — abdominal signs.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Hypotension late sign — early signs are subtle (apnea, lethargy, feeding poorly).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Long-term neurodevelopmental sequelae — follow-up needed.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hashimoto Thyroiditis

public enum HashimotoSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hashimoto-thyroiditis",
        title: "Hashimoto thyroiditis",
        subtitle: "Most common cause of hypothyroidism · anti-TPO + anti-Tg · levothyroxine",
        nclexTags: endoR13,
        definition: AttributedProse(
            "Autoimmune chronic lymphocytic thyroiditis — most common cause of hypothyroidism in iodine-sufficient regions. Strongly associated with anti-thyroid peroxidase (anti-TPO) and anti-thyroglobulin (anti-Tg) antibodies. May initially be euthyroid or hyperthyroid (hashitoxicosis) before progressing to hypothyroidism per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "T-cell + autoantibody-mediated destruction of thyroid follicles → progressive hypothyroidism. Family history common; associated with other autoimmune disorders (T1DM, vitiligo, celiac, RA, SLE).",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("Hypothyroid symptoms — fatigue, weight gain, cold intolerance, dry skin, hair loss, constipation, bradycardia, slow speech, depression.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Goiter — diffuse, painless, firm, sometimes nodular.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Hashitoxicosis (early) — transient hyperthyroid features (palpitations, heat intolerance, weight loss) before progression to hypothyroidism.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Severe untreated — myxedema coma (hypothermia, hypoventilation, AMS).", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("TSH elevated, free T4 low (overt) or normal (subclinical).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("ANTI-TPO antibodies positive (~95%) + ANTI-Tg antibodies positive — confirm autoimmune etiology.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Thyroid US — heterogeneous hypoechoic gland with pseudonodules; rule out malignancy if dominant nodule.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Thyroid exam — gland size, texture, nodules; cervical lymphadenopathy.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Family history; co-existing autoimmune diseases; pregnancy planning.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Severity of hypothyroid symptoms; cardiac history; baseline weight, mood, cognition.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("LEVOTHYROXINE replacement — typical dose 1.6 mcg/kg/day; lower in elderly / cardiac (start 25 mcg) per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Take on EMPTY stomach 30–60 min before food / coffee / supplements for consistent absorption per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Trend TSH every 6–8 weeks during titration; annually once stable per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Pregnancy — increase dose 25–30% upon confirmation; check TSH every 4 weeks first half per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Monitor for malignancy — Hashimoto increases risk of thyroid lymphoma + papillary carcinoma; biopsy concerning nodules per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Screen for other autoimmune diseases — celiac, T1DM, B12 deficiency, Addison's per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Family genetic counseling — autoimmune polyglandular syndromes.", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("MYXEDEMA COMA — severe untreated hypothyroidism + precipitant; emergent IV levothyroxine + hydrocortisone per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("THYROID LYMPHOMA — rapidly enlarging mass; biopsy.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Pregnancy — undertreated maternal hypothyroidism causes fetal cognitive deficits; close monitoring per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Drug interactions — calcium / iron / PPI / sevelamer reduce levothyroxine absorption; estrogens raise TBG (require dose increase).", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Graves Disease

public enum GravesSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "graves-disease",
        title: "Graves disease",
        subtitle: "Most common cause of hyperthyroidism · TSH-receptor Ab · ophthalmopathy",
        nclexTags: endoR13,
        definition: AttributedProse(
            "Autoimmune hyperthyroidism caused by stimulating antibodies (TRAb / TSI) targeting the TSH receptor. Most common cause of hyperthyroidism. Distinct features include diffuse goiter, ophthalmopathy (proptosis, lid retraction, diplopia), and pretibial myxedema per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Stimulating IgG antibody binds TSH receptor → continuous thyroid stimulation → overproduction of T3/T4 → hyperthyroidism. Same antibody and lymphocyte infiltration cross-react with retro-orbital connective tissue → ophthalmopathy and pretibial myxedema.",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("Hyperthyroid features — palpitations, heat intolerance, weight loss with increased appetite, anxiety, tremor, hyperactive reflexes, oligomenorrhea, increased BMs.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Diffuse goiter — symmetric, smooth, with bruit / thrill (highly vascular).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("OPHTHALMOPATHY — proptosis, lid retraction (lid lag, von Graefe sign), diplopia, conjunctival injection, optic neuropathy in severe.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("PRETIBIAL MYXEDEMA — non-pitting waxy edema typically anterior shins.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Atrial fibrillation, heart failure, osteoporosis with chronic disease.", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("TSH suppressed; free T4 + T3 elevated.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("TRAB / TSI antibodies positive — confirms Graves vs other hyperthyroid causes.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Radioactive iodine uptake (RAIU) — DIFFUSELY elevated in Graves (vs focal in toxic adenoma, low in thyroiditis).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Ophthalmologic exam for ophthalmopathy severity.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — HR, BP; assess for AFib, HF.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Eye exam — proptosis, vision, color vision (optic-neuropathy screen), cornea exposure.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Mood, sleep, weight; cardiac history; bone density baseline.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("Three definitive options — antithyroid drug, radioactive iodine (RAI), or thyroidectomy. Choice depends on patient preference, severity, ophthalmopathy, pregnancy plans per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("ANTITHYROID DRUG — methimazole (preferred); PTU in 1st-trimester pregnancy or thyroid storm; trial × 12–18 months for chance of remission per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("BETA-BLOCKER — propranolol or atenolol for symptom control while waiting for thionamide effect; reduces palpitations, tremor, anxiety per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("RADIOACTIVE IODINE — definitive but causes hypothyroidism in ~80%; AVOID in pregnancy / breastfeeding / active ophthalmopathy (worsens it) per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("THYROIDECTOMY — for severe ophthalmopathy, large goiter, pregnancy with antithyroid intolerance, patient preference.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("OPHTHALMOPATHY — smoking cessation (smoking dramatically worsens), artificial tears, head elevation, prism glasses; severe / progressive — IV methylprednisolone, teprotumumab (FDA-approved IGF-1R antibody), orbital decompression per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Cardiac — rate control AFib; cardiology consult for HF.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Bone health — calcium / vitamin D; reassess after euthyroid restoration.", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("THYROID STORM — fever / tachycardia / AMS; emergent ICU + PTU + iodine + steroid + β-blocker per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("AGRANULOCYTOSIS on thionamides — fever / sore throat → STOP and check CBC.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Ophthalmopathy progression — refer ophthalmology; vision-threatening.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Pregnancy considerations — TSI crosses placenta; risk of fetal / neonatal hyperthyroidism even if mother controlled per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hyperparathyroidism

public enum HyperparathyroidismSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "primary-hyperparathyroidism",
        title: "Primary hyperparathyroidism",
        subtitle: "PTH ↑ + Ca ↑ · adenoma 80% · parathyroidectomy curative",
        nclexTags: endoR13,
        definition: AttributedProse(
            "Autonomous PTH overproduction — most often a SOLITARY parathyroid adenoma (~80%). Diagnosed by elevated PTH with elevated calcium (or inappropriately normal PTH for hypercalcemia). Other causes — hyperplasia (15%), MEN syndromes, parathyroid carcinoma (rare) per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Excess PTH → bone resorption (osteoporosis), increased renal calcium reabsorption + decreased phosphate reabsorption (renal stones), GI calcium absorption ↑.",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("Often ASYMPTOMATIC — found on routine BMP showing hypercalcemia.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("\"Stones, bones, abdominal groans, psychiatric overtones\" — kidney stones, osteopenia / osteoporosis, constipation / N/V / abdominal pain, fatigue / depression / cognitive changes.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Polyuria / polydipsia from hypercalcemia.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Severe — hypercalcemic crisis with AMS, dehydration, dysrhythmia.", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Elevated calcium (corrected for albumin or ionized Ca) + elevated or inappropriately-normal PTH.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("24-hour urine calcium — RULES OUT familial hypocalciuric hypercalcemia (which mimics).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Imaging — sestamibi scan, neck US, 4D-CT to localize adenoma for surgery.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("DXA — assess osteoporosis; renal US for stones.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Family history → MEN1 / MEN2A workup if young patient.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Calcium severity — symptomatic hypercalcemia → emergent treatment.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Bone density (DXA) + fracture history.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Renal stones / function.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Cognitive / mood / GI symptoms; mental-health screen.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("PARATHYROIDECTOMY — definitive; cures ~95% (by experienced surgeon); indications include symptomatic disease, age <50, calcium >1 mg/dL above ULN, osteoporosis, renal stones, eGFR <60 per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Asymptomatic non-surgical — surveillance Ca + creatinine + DXA every 1–2 years per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Cinacalcet (calcimimetic) — for non-surgical patients with significant hypercalcemia.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Bisphosphonates / denosumab — for osteoporosis component.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Hydration counseling — 2–3 L/day; avoid thiazides + lithium (raise calcium).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Severe / crisis — IV NS aggressive hydration, calcitonin (rapid but tachyphylaxis), bisphosphonate (slower onset), denosumab, dialysis if refractory per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("HYPERCALCEMIC CRISIS — Ca >14 with AMS / dysrhythmia; ICU + aggressive treatment.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Post-parathyroidectomy hypocalcemia (\"hungry bone\") — paresthesias, tetany, Chvostek / Trousseau; calcium + calcitriol replacement per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Post-op recurrent laryngeal nerve injury — hoarseness; voice rest.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("MEN1 / MEN2A — screen for pituitary, pancreatic NET, pheochromocytoma, medullary thyroid carcinoma per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - IPF

public enum IPFSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ipf",
        title: "Idiopathic pulmonary fibrosis (IPF)",
        subtitle: "Progressive scarring of lung · UIP pattern · antifibrotic + transplant",
        nclexTags: pulmR13,
        definition: AttributedProse(
            "Chronic progressive fibrotic interstitial lung disease of unknown cause, characterized by usual interstitial pneumonia (UIP) pattern. Median survival 3–5 years from diagnosis without treatment. Antifibrotic agents (pirfenidone, nintedanib) slow decline per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Aberrant epithelial wound healing → fibroblast / myofibroblast accumulation → progressive collagen deposition → architectural destruction (honeycombing). Risk factors: age >60, male, smoking, GERD, occupational dust, viral infection, genetic predisposition.",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("Progressive dyspnea on exertion (insidious onset over months-years).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Non-productive chronic cough.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Bibasilar fine \"velcro\" inspiratory crackles.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Clubbing in advanced disease.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("ACUTE EXACERBATION — sudden worsening of dyspnea / hypoxia within 1 month; high mortality per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HIGH-RESOLUTION CT — UIP pattern (peripheral / basal honeycombing + traction bronchiectasis + reticular pattern, NO ground-glass / nodules) per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Surgical lung biopsy if HRCT non-diagnostic.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("EXCLUDE other causes — autoimmune CT disease (ANA, RF, anti-CCP, ANCA, myositis), occupational / hypersensitivity pneumonitis, drugs (amiodarone, methotrexate, nitrofurantoin), familial.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("PFTs — restrictive pattern + reduced DLCO.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Resting + ambulatory SpO2; 6-minute walk test.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("PFTs + DLCO + serial.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Pulmonary HTN screen (echo, BNP).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Performance / functional status; transplant candidacy.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("ANTIFIBROTIC — pirfenidone (TID, photosensitivity + GI) OR nintedanib (BID, GI + LFTs); both slow decline in FVC per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Supplemental oxygen — when SpO2 <88% rest or with exertion; goal SpO2 ≥90%.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("PULMONARY REHABILITATION — improves quality of life, exercise tolerance per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Vaccinations — pneumococcal, influenza, COVID, RSV per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("LUNG TRANSPLANTATION — definitive option for younger / fitter patients; refer early per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Treat GERD — may slow progression.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Smoking cessation; air-quality counseling.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Acute exacerbation — corticosteroids debated; supportive ICU care; high mortality per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Palliative care + advance directives — EARLY integration improves QoL per primary source.", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("ACUTE EXACERBATION — emergent ICU; mortality up to 50%.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("PULMONARY HYPERTENSION + cor pulmonale — common late; assess regularly.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Lung cancer — increased risk in IPF; surveillance imaging.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Depression / anxiety — high prevalence; integrate mental health.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sarcoidosis

public enum SarcoidosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "sarcoidosis",
        title: "Sarcoidosis",
        subtitle: "Multisystem non-caseating granulomas · BHL · steroid first-line",
        nclexTags: pulmR13,
        definition: AttributedProse(
            "Multisystem inflammatory disease of unknown cause characterized by NON-CASEATING GRANULOMAS in affected organs — most often lung + intrathoracic lymph nodes + skin + eyes + heart + nervous system. Higher prevalence in Black women per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Aberrant T-cell-mediated immune response to unknown antigen → granuloma formation. Resolves spontaneously in many cases; chronic / progressive in others.",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("Many ASYMPTOMATIC — found on routine CXR (BHL = bilateral hilar lymphadenopathy).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Pulmonary — dyspnea, cough, chest discomfort.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Constitutional — fever, fatigue, weight loss.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Skin — erythema nodosum (lower extremities, painful), lupus pernio (chronic violaceous facial plaques), papules / plaques.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Eye — anterior uveitis (most common), keratoconjunctivitis.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Cardiac — arrhythmia (heart block, VT), HF, sudden death.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Neuro — cranial-nerve palsies (CN VII), aseptic meningitis, hypopituitarism.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Lofgren syndrome (acute, good prognosis) — fever + erythema nodosum + arthralgia + BHL.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Heerfordt syndrome — uveitis + parotitis + facial palsy + fever.", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Imaging — CXR / CT showing bilateral hilar lymphadenopathy + reticulonodular infiltrates; staging I (BHL only) → IV (fibrosis).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("BIOPSY — non-caseating granulomas (often EBUS-TBNA of lymph node, skin, conjunctival, salivary).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("ACE level — non-specific (raised in many granulomatous diseases); not diagnostic.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Hypercalcemia / hypercalciuria from granuloma 1,25-(OH)₂D production per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Cardiac MRI / PET, ophthalmology slit-lamp, neurology workup as indicated.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Pulmonary status — PFTs, 6-minute walk, SpO2.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Cardiac — ECG (heart block, dysrhythmia), echo, BNP; cardiac MRI if abnormal.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Eye — slit lamp exam.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Calcium / creatinine; LFTs (granulomatous hepatitis); CBC.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("ASYMPTOMATIC stage I — observation; many resolve spontaneously per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("SYMPTOMATIC pulmonary or organ-threatening — corticosteroids (prednisone 20–40 mg/day) × 6–12 months with slow taper per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Steroid-sparing — methotrexate, azathioprine, mycophenolate; refractory — infliximab, repository corticotropin per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("CARDIAC sarcoidosis — high-dose steroids; antiarrhythmic + ICD if dysrhythmia per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Hypercalcemia — hydration; AVOID supplemental vitamin D; sun avoidance per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Eye — topical steroids; aggressive treatment per ophthalmology.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Vaccinations updated; bone health (steroid-induced osteoporosis prophylaxis).", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("CARDIAC sarcoid — sudden death from arrhythmia; aggressive workup if cardiac symptoms.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Pulmonary HTN with advanced fibrotic disease.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Neurosarcoidosis — emergent steroids; persistent deficits.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Steroid side effects — weight, bone, glucose, mood, infection; manage proactively.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - PAD

public enum PADSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pad",
        title: "Peripheral arterial disease (PAD)",
        subtitle: "Atherosclerosis · ABI · claudication · CV risk-factor management + revascularization",
        nclexTags: vascR13,
        definition: AttributedProse(
            "Atherosclerotic narrowing of the peripheral arteries — most often lower extremities. Spectrum from asymptomatic to claudication to critical limb ischemia (rest pain, ulcers, gangrene). Strong marker of generalized atherosclerosis — high CV mortality per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Same atherosclerotic process as CAD + cerebrovascular disease — driven by smoking, DM, HTN, dyslipidemia, age, family history, CKD.",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("CLAUDICATION — reproducible cramping / aching of calf / thigh / buttock with exertion, relieved by rest (named for muscle group affected).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("REST PAIN — burning / pain at metatarsal heads, often worse supine (gravity helps); critical limb ischemia.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Non-healing ulcers — typically at toes, lateral foot, pressure points; arterial ulcers \"punched out\" (vs venous which are wet, gravity-dependent).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Cool, pale extremity; absent / diminished pulses; loss of hair; thickened nails.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("ACUTE limb ischemia — \"6 P's\" — Pain, Pallor, Pulseless, Paresthesias, Paralysis, Poikilothermic; surgical EMERGENCY.", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ANKLE-BRACHIAL INDEX (ABI) — gold standard non-invasive screen; ABI ≤0.90 diagnostic; 0.91–1.30 normal; >1.30 non-compressible (calcified — DM, CKD) per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Toe-brachial index (TBI) when ABI non-compressible.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Duplex US, CT angio, MR angio for anatomical mapping.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Workup for CV risk factors — A1c, lipids, BP, smoking status.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Pulses (femoral, popliteal, dorsalis pedis, posterior tibial); ABI; sensation; skin integrity.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Foot exam EVERY visit in DM patients — neuropathy + PAD increase amputation risk markedly.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Smoking status, glycemic control, lipid + BP management.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("SMOKING CESSATION — single most important intervention per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Supervised exercise (walking program) — first-line for claudication; improves walking distance per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Antiplatelet — clopidogrel preferred over aspirin per primary source; or DAPT for stenting.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("HIGH-INTENSITY STATIN — even with normal lipids; reduces cardiovascular events per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("BP control — ACE / ARB preferred (also slows CKD); avoid β-blockers if claudication worsens (rare).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Diabetes — A1c target individualized; SGLT-2 / GLP-1 with cardio-renal benefit preferred.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Cilostazol (PDE3 inhibitor) — improves walking distance; AVOID in HF; per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Rivaroxaban 2.5 mg BID + aspirin (\"COMPASS\" regimen) for stable PAD per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("REVASCULARIZATION — endovascular (angioplasty + stent) or surgical bypass for lifestyle-limiting claudication or CRITICAL limb ischemia per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("ACUTE limb ischemia — emergent vascular surgery + heparin per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Foot care — daily inspection, well-fitting shoes, no walking barefoot, pedicure with sanitized tools, podiatric follow-up.", citationIDs: ["openrn_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("ACUTE LIMB ISCHEMIA — emergent — \"6 P's\" — emergent vascular surgery to save limb.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("CRITICAL LIMB ISCHEMIA — rest pain or non-healing ulcer; high amputation + mortality risk; refer URGENTLY for revascularization.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Concurrent CAD + cerebrovascular disease — high CV mortality risk; aggressive risk-factor management is the highest priority.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Diabetic foot — combined neuropathy + PAD = high amputation risk; preventive foot care.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pulmonary Hypertension

public enum PulmHTNSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pulmonary-hypertension",
        title: "Pulmonary hypertension (PH)",
        subtitle: "mPAP ≥20 · WHO Group 1–5 · group-specific therapy · right HF",
        nclexTags: pulmR13,
        definition: AttributedProse(
            "Elevated mean pulmonary arterial pressure (mPAP ≥20 mmHg per WHO 2018, formerly ≥25). 5 WHO groups by etiology — Group 1 PAH (idiopathic, drug-induced, CT disease), Group 2 (left-heart disease), Group 3 (lung disease / hypoxia), Group 4 (CTEPH — chronic thromboembolic), Group 5 (multifactorial). Group-specific therapy critical per primary source.",
            citationIDs: ["openrn_dx_round13", "specialty_dx_round13"]
        ),
        pathophysiology: AttributedProse(
            "Endothelial dysfunction + smooth-muscle proliferation + thrombosis in pulmonary vasculature → increased PVR → RV pressure overload → RV hypertrophy → RV failure → death.",
            citationIDs: ["openrn_dx_round13"]
        ),
        presentation: [
            AttributedBullet("Progressive dyspnea on exertion (most common).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Fatigue, syncope (with exertion — RV cannot increase output), chest pain.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Right-heart failure features — JVD, hepatomegaly, ascites, lower-extremity edema.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Loud P2 (pulmonic component of S2); RV heave; tricuspid regurgitation murmur.", citationIDs: ["openrn_dx_round13"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECHO — estimates pulmonary artery systolic pressure (TR jet velocity); RV size + function.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("RIGHT-HEART CATHETERIZATION — DEFINITIVE; mPAP ≥20 mmHg + PCWP ≤15 + PVR ≥3 = pre-capillary PH (PAH suspected) per primary source.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Etiology workup — V/Q scan (CTEPH), PFTs (lung disease), echo (left HF), HIV, autoimmune, sleep study.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("BNP / NT-proBNP for severity + monitoring.", citationIDs: ["openrn_dx_round13"])
        ],
        priorityAssessments: [
            AttributedBullet("Functional class (WHO I–IV); 6-minute walk distance; SpO2 + exertional desaturation.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("RV function (echo, BNP, RA pressure).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Volume status; signs of right HF.", citationIDs: ["openrn_dx_round13"])
        ],
        commonInterventions: [
            AttributedBullet("Group 1 (PAH) — endothelin-receptor antagonists (bosentan, ambrisentan, macitentan); PDE5 inhibitors (sildenafil, tadalafil); riociguat (sGC stimulator); prostacyclins (epoprostenol IV, treprostinil SQ/IV/inhaled, iloprost inhaled, selexipag oral); sotatercept (activin signaling) per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Group 2 — TREAT LEFT HEART DISEASE; PAH-specific drugs typically NOT indicated per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Group 3 — TREAT UNDERLYING LUNG DISEASE + supplemental O2.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Group 4 (CTEPH) — pulmonary endarterectomy or balloon pulmonary angioplasty ± riociguat per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Group 5 — treat underlying.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Diuretics for RV volume overload; oxygen for hypoxemia (target SpO2 ≥90%).", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Anticoagulation — generally for CTEPH, idiopathic PAH (selected) per primary source.", citationIDs: ["specialty_dx_round13"]),
            AttributedBullet("Lung / heart-lung transplant for advanced disease.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("AVOID pregnancy in PAH — high mortality (30–50%); contraception counseling per primary source.", citationIDs: ["specialty_dx_round13"])
        ],
        watchFor: [
            AttributedBullet("RV FAILURE — JVD, edema, hepatomegaly, ascites, hypotension; ICU + inotropes.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Syncope / sudden cardiac death — RV cannot maintain output; warning sign of severe disease.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("Pulmonary infection / arrhythmia decompensation — emergent.", citationIDs: ["openrn_dx_round13"]),
            AttributedBullet("DRUG INTERACTIONS — many PAH drugs interact with CYP3A4 inducers / inhibitors and with HIV antiretrovirals; coordinate with PH center.", citationIDs: ["openrn_dx_round13"])
        ],
        citations: [openrnDxR13, specialtyDxR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}
