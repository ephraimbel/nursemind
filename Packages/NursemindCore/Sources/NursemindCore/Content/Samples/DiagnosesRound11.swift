import Foundation

// Curator-model diagnosis entries (round 11 expansion — cardiac dysrhythmias, EOL syndromes, neuro, vascular, oncology).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax (CC BY 4.0 with AI restriction),
// CDC + AHA + NHPCO + ATA + ACS concept citations.

private let openrnDxR11 = CitationSource(
    id: "openrn_dx_round11",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=dysrhythmia+palliative+cancer",
    lastRetrieved: "2026-05-04"
)
private let openstaxDxR11 = CitationSource(
    id: "openstax_dx_round11",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let cdcDxR11 = CitationSource(
    id: "cdc_dx_round11",
    shortName: "CDC clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let specialtyDxR11 = CitationSource(
    id: "specialty_dx_round11",
    shortName: "AHA / NHPCO / NCCN / ALSA concept citations",
    publisher: "AHA · NHPCO · NCCN · ALS Association",
    license: .factCitationOnly,
    url: "https://professional.heart.org/en/guidelines-and-statements",
    lastRetrieved: "2026-05-04"
)

private let dysrR11 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let palliativeR11 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort)
private let neuroR11 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation)
private let oncR11 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)
private let vascR11 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)

// MARK: - VT (Ventricular Tachycardia)

public enum VTSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ventricular-tachycardia",
        title: "Ventricular tachycardia (VT)",
        subtitle: "Wide-complex tachycardia · monomorphic vs polymorphic · stable vs unstable",
        nclexTags: dysrR11,
        definition: AttributedProse(
            "Three or more consecutive ventricular ectopic beats at a rate >100 bpm with WIDE QRS complexes (>0.12 sec). Sustained VT (>30 sec or hemodynamic compromise) is a medical emergency. Subdivided as monomorphic (single uniform morphology) or polymorphic (varying morphology — torsades when associated with prolonged QT) per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Ventricular reentry, triggered automaticity, or abnormal automaticity — most commonly arising from ischemic / scarred myocardium (post-MI, cardiomyopathy). Polymorphic / torsades is associated with prolonged QT.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Stable — palpitations, lightheadedness, mild chest discomfort; HR typically 100–250.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Unstable — hypotension, AMS, syncope, ischemic chest pain, acute heart failure, pulmonary edema.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Pulseless VT — unresponsive, no pulse — TREATED AS VFib per ACLS per primary source.", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECG — wide QRS (>0.12 sec) at >100 bpm; AV dissociation, fusion / capture beats, concordance support VT diagnosis (vs SVT with aberrancy).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("12-lead ECG — confirm morphology, look for OLD scar, ischemia, prolonged QT, electrolyte clues.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("BMP, Mg, troponin, drug screen.", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("ABCs — pulse, BP, mental status (DETERMINES STABLE vs UNSTABLE management).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Continuous cardiac monitor; 12-lead ECG.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Reversible causes — ischemia, electrolytes (K, Mg), drug toxicity (digoxin, TCA), hypoxia, acidosis, prolonged QT.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("UNSTABLE WITH PULSE — synchronized cardioversion 100 J (biphasic, monomorphic); 200 J for polymorphic per ACLS per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("UNSTABLE WITHOUT PULSE — defibrillate per VFib protocol (200 J biphasic; CPR; epinephrine + amiodarone).", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("STABLE MONOMORPHIC — IV antiarrhythmic — amiodarone 150 mg IV over 10 min, repeat to total 1500 mg/24 hr; OR procainamide 20–50 mg/min IV; OR sotalol if no QT prolongation per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("STABLE POLYMORPHIC (torsades) — magnesium 2 g IV; correct K, Mg; STOP QT-prolonging agents; overdrive pacing per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Treat ischemia — heparin, dual antiplatelet, cath as appropriate.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("ICD evaluation for survivors of sustained VT not from reversible cause.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("DEGENERATION TO VFib — the lethal arrhythmia; rapid escalation; immediate defibrillation.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Underlying ischemic / structural disease — workup essential.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Electrolyte clues — hypoK, hypoMg as triggers.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - VF (Ventricular Fibrillation)

public enum VFSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ventricular-fibrillation",
        title: "Ventricular fibrillation (VF)",
        subtitle: "Lethal arrhythmia · CHAOTIC ventricular activity · DEFIBRILLATE",
        nclexTags: dysrR11,
        definition: AttributedProse(
            "Chaotic, disorganized ventricular electrical activity → no effective myocardial contraction → CARDIAC ARREST. Most common initial rhythm in sudden cardiac death; survival depends on bystander CPR + early defibrillation per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Multiple simultaneous reentry circuits → no coordinated depolarization → ventricles quiver. Most often triggered by acute myocardial ischemia / infarction; also long QT, channelopathies, electrolyte derangement, hypothermia, drugs.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Sudden loss of consciousness, no pulse, agonal or absent breathing.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("ECG — coarse or fine fibrillatory waves; no organized QRS; no pulse.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Often preceded by VT.", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Pulseless patient + ventricular fibrillation on monitor / ECG.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Distinguish coarse VF (more recently onset, more responsive to defibrillation) from fine VF (later, less responsive).", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("ABCs — confirm pulselessness within 10 sec; START CPR.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Identify reversible causes — Hs and Ts mnemonic.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("DEFIBRILLATE 200 J biphasic (or per device) ASAP — single most important intervention per ACLS per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Resume CPR immediately after shock × 2 minutes; minimize interruptions.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Epinephrine 1 mg IV every 3–5 min; amiodarone 300 mg IV bolus (then 150 mg) OR lidocaine 1–1.5 mg/kg per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Address Hs and Ts — Hypovolemia, Hypoxia, Hydrogen ion (acidosis), Hypo/hyperK, Hypoglycemia, Hypothermia; Toxins, Tamponade, Tension pneumothorax, Thrombosis (PE / coronary), Trauma per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Post-arrest — therapeutic targeted temperature management (TTM) 32–36°C × 24 hours; coronary cath; 12-lead ECG; ICU per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("ICD for survivors of sudden cardiac death not from reversible cause.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("FAILED resuscitation — most common cause of cardiac-arrest mortality; high-quality CPR + early defibrillation are the only proven interventions.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Reversible causes missed — keep Hs and Ts in mind.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Post-arrest neurologic injury common; counsel family about prognostication after 72 hr (TTM affects assessment).", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Torsades de Pointes

public enum TorsadesSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "torsades-de-pointes",
        title: "Torsades de pointes",
        subtitle: "Polymorphic VT + prolonged QT · MAGNESIUM + correct cause",
        nclexTags: dysrR11,
        definition: AttributedProse(
            "Polymorphic ventricular tachycardia associated with prolonged QT interval. Characterized by twisting of the QRS axis around the isoelectric line. Often self-terminates but can progress to VFib per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Prolonged QT → early afterdepolarizations → polymorphic VT. Causes: hypokalemia, hypomagnesemia, hypocalcemia, drugs (many), congenital long QT, ischemia, bradycardia (pause-dependent).",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Sudden palpitations, dizziness, syncope, often with documented prolonged QT on baseline ECG.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("ECG — polymorphic VT with axis changes; baseline QT prolonged.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Hemodynamic compromise common.", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECG showing polymorphic VT + prolonged QT on baseline.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("BMP, Mg, ABG; medication review; toxicology if suspected.", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("ABCs; assess pulse and stability.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Continuous cardiac monitor; 12-lead ECG with QTc measurement.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Identify QT prolonging factors — meds, electrolytes, ischemia, congenital.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("MAGNESIUM 2 g IV bolus over 1–2 minutes; repeat as needed per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("CORRECT K (target >4.0) and Mg (target >2.0).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("STOP all QT-prolonging drugs (haloperidol, ondansetron, quinolones, methadone, citalopram >40 mg, antiemetics).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("OVERDRIVE PACING (atrial or ventricular) for refractory pause-dependent torsades; isoproterenol bridge per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("UNSTABLE — defibrillate UNSYNCHRONIZED 200 J (synchronization may not be possible due to varying morphology).", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("AVOID amiodarone, procainamide, sotalol — these PROLONG QT and worsen torsades per primary source.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Long-term — cardiology evaluation for congenital long QT; β-blocker, ICD, lifestyle changes.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("DEGENERATION TO VFib — defibrillate immediately if pulseless.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Recurrence — until QT normalized; continuous monitoring.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Drug interactions — review every new medication for QT effects in known long-QT patients.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Long QT Syndrome

public enum LongQTSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "long-qt-syndrome",
        title: "Long QT syndrome (LQTS)",
        subtitle: "Inherited or acquired · syncope / sudden death risk · β-blocker + lifestyle",
        nclexTags: dysrR11,
        definition: AttributedProse(
            "Disorder characterized by prolonged ventricular repolarization (long QT interval) → predisposition to torsades / sudden cardiac death. May be congenital (channelopathies — LQTS1, LQTS2, LQTS3, etc.) or acquired (drugs, electrolytes) per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Mutations in genes encoding cardiac potassium / sodium channels → delayed repolarization. LQTS1 (KCNQ1) — exertion / swimming triggers; LQTS2 (KCNH2) — auditory / emotion; LQTS3 (SCN5A) — sleep / rest.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Syncope (often with exertion / emotion / startle).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Seizures — sometimes misdiagnosed as epilepsy.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Sudden cardiac arrest — first manifestation in some.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Family history of unexplained sudden death.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("ECG — QTc >450 ms (men), >460 ms (women); >500 ms is high-risk.", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Resting ECG with manual QT measurement (Bazett's correction); 24-hour Holter; exercise ECG (LQTS1 prolongation).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Schwartz score combines clinical, ECG, family history.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Genetic testing for affected genes — also tests family.", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("History — syncope triggers, exertional symptoms, family history.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("ECG QTc; trend; identify QT-prolonging meds and electrolytes.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("AVOID QT-prolonging drugs (CredibleMeds.org list); educate patient + carry medical-alert ID per primary source.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("β-BLOCKER (nadolol or propranolol) — first-line for symptomatic congenital LQTS per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("ICD for survivors of cardiac arrest, syncope on β-blocker, high-risk genotypes.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Lifestyle — avoid swimming alone (LQTS1), startling alarms (LQTS2), competitive sports per primary source.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Maintain potassium and magnesium in upper-normal range.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Family screening — first-degree relatives need ECG ± genetic testing.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("Acquired LQTS — drug-induced; review every medication; counsel patient to inform every provider.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Pregnancy — postpartum is high-risk period for LQTS2; close monitoring.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Sudden death in young athlete — workup screening if family history.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - WPW

public enum WPWSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "wpw",
        title: "Wolff-Parkinson-White syndrome (WPW)",
        subtitle: "Bypass tract · DELTA wave · AVOID AV nodal blockers in AFib + WPW",
        nclexTags: dysrR11,
        definition: AttributedProse(
            "Pre-excitation syndrome caused by an accessory pathway (Bundle of Kent) bypassing the AV node. WPW pattern — short PR + delta wave on ECG. WPW syndrome — pattern + symptomatic tachyarrhythmias. Risk of sudden death from rapid AFib conduction down accessory pathway per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Congenital extra electrical connection between atria and ventricles → bypasses AV node delay. Allows fast antidromic / orthodromic AVRT (re-entry tachycardia) and dangerous rapid ventricular response in AFib.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Asymptomatic WPW pattern (incidental finding).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Palpitations, dizziness, syncope from supraventricular tachycardia.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("ECG — short PR (<120 ms), delta wave (slurred upstroke of QRS), wide QRS (≥120 ms).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Rapid wide-complex irregularly irregular rhythm = AFib with conduction down accessory pathway = pre-excited AFib (DANGEROUS).", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Resting 12-lead ECG; sometimes intermittent — exercise / event monitor.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Electrophysiology study (EP) — definitive; localizes pathway and assesses risk.", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("History of palpitations, syncope; family history of sudden death.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("ECG — pattern recognition; rhythm during symptoms.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("STABLE narrow-complex (orthodromic AVRT) — vagal maneuvers, adenosine 6 mg IV (then 12 mg).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("AFib WITH WPW (pre-excited AFib) — AVOID adenosine, β-blockers, CCBs, digoxin (block AV node → all conduction goes down accessory pathway → may degenerate to VFib) per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Pre-excited AFib stable — IV PROCAINAMIDE or ibutilide; UNSTABLE — synchronized cardioversion per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Definitive — RADIOFREQUENCY CATHETER ABLATION of accessory pathway — high success rate, often curative per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Asymptomatic WPW — risk stratification; ablation considered for high-risk professions / athletes per primary source.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("AFib + WPW — life-threatening rapid ventricular response; AVOID AV-nodal blockers.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Sudden cardiac death — risk in undiagnosed WPW with AFib; family screening if SCD history.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Recurrence after ablation possible — long-term cardiology follow-up.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Complete Heart Block

public enum CompleteHBSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "complete-heart-block",
        title: "Complete (3rd-degree) heart block",
        subtitle: "Atrial / ventricular dissociation · escape rhythm · pacemaker indicated",
        nclexTags: dysrR11,
        definition: AttributedProse(
            "Complete failure of AV conduction — atria and ventricles depolarize independently. Ventricular rate determined by escape pacemaker (junctional 40–60 bpm or ventricular 20–40 bpm). Almost always requires pacemaker per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "AV node or His-Purkinje system disease (degenerative — Lev / Lenègre, ischemic, infiltrative — sarcoid / amyloid, drug-induced — β-blockers / CCBs / digoxin, congenital). Without AV conduction, ventricles rely on lower escape rhythms.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Bradycardia (often 30–40 bpm); fatigue, dyspnea, syncope (Stokes-Adams), heart failure.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("ECG — regular P waves NOT associated with QRS; QRS narrow (junctional escape ~40–60) or wide (ventricular escape ~20–40); AV dissociation.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Cannon A waves on JVP exam.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Hemodynamic compromise — hypotension, AMS.", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("12-lead ECG showing complete AV dissociation.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Echocardiogram — assess for underlying structural / ischemic disease.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Reversible causes — recent MI (RCA territory), drug toxicity, electrolytes (hyperK), Lyme, sarcoid.", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs; symptoms (syncope, lightheadedness, ischemia, HF).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Reversible cause workup.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("UNSTABLE — atropine 0.5–1 mg IV (often INEFFECTIVE in 3rd-degree block) → transcutaneous pacing; epinephrine 2–10 mcg/min OR dopamine 5–20 mcg/kg/min infusion until transvenous pacing per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("STABLE — observe; correct reversible causes; transvenous pacing as bridge.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("DEFINITIVE — permanent pacemaker (dual-chamber or single-chamber) per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Reverse causes — hold β-blockers / CCBs / digoxin; treat hyperK; revascularize for ischemic block.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("ASYSTOLE — ventricular escape can fail; emergent pacing; CPR if pulseless.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Stokes-Adams syncope — sudden loss of consciousness from cessation of ventricular escape.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Post-pacemaker — site care, pacemaker syndrome, lead displacement.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cancer Cachexia

public enum CancerCachexiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cancer-cachexia",
        title: "Cancer cachexia",
        subtitle: "Multifactorial muscle wasting · poor prognosis · multimodal management",
        nclexTags: palliativeR11,
        definition: AttributedProse(
            "Multifactorial syndrome of involuntary weight loss (especially skeletal muscle, with or without fat loss) that cannot be fully reversed by nutritional support. Defined as >5% weight loss in 6 months OR BMI <20 with any weight loss OR sarcopenia + 2% weight loss per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Tumor- and host-derived inflammatory cytokines (TNF, IL-1, IL-6) → catabolism, anorexia, lipolysis, proteolysis, metabolic dysregulation. Distinct from simple starvation — supplementation alone does not reverse.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Progressive involuntary weight loss; loss of lean mass disproportionate to fat loss.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Fatigue, weakness, decreased functional status.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Anorexia, early satiety, taste / smell changes.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Sarcopenia, decreased grip strength.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Decreased quality of life, emotional distress.", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("EPCRC consensus — >5% weight loss in 6 mo, or BMI <20 + any weight loss, or sarcopenia + 2% weight loss per primary source.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Stages — pre-cachexia, cachexia, refractory cachexia.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Workup — rule out treatable causes (depression, dental, swallowing, chemo side effects).", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("Weight trend; anthropometrics; performance status (KPS, ECOG); grip strength.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Symptom screen — anorexia, nausea, taste, dental, swallowing, mood, social factors.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Goals of care — palliative vs disease-directed; family understanding.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("Multimodal — address anorexia (megestrol, mirtazapine, dronabinol, olanzapine, corticosteroids), exercise (resistance + aerobic), nutrition counseling, anti-inflammatory therapy, treat reversible causes per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Megestrol or dronabinol — modest appetite improvement; mostly fat / fluid weight gain (not muscle); VTE risk with megestrol per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Olanzapine low-dose — emerging evidence for appetite + N/V in cancer per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Aggressive nutrition support (TPN, PEG) NOT recommended in advanced refractory cachexia per primary source — does not improve survival or quality of life.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Symptom palliation — pain, depression, nausea, constipation; multidisciplinary palliative care.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Psychosocial — counseling for patient and family; reframe weight loss as part of disease process, not nutrition failure.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("REFRACTORY cachexia — patient with very advanced disease; focus shifts to comfort and dignity, NOT aggressive nutrition.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Family distress about feeding — emotional driver; counsel about role of food as love and culturally appropriate alternatives.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Trial of feeding interventions has time-limited window — set goals and review.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cancer Pain Crisis

public enum CancerPainCrisisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cancer-pain-crisis",
        title: "Cancer pain crisis",
        subtitle: "Severe uncontrolled pain · IV opioid escalation · interdisciplinary",
        nclexTags: palliativeR11,
        definition: AttributedProse(
            "Acute severe uncontrolled pain in cancer patient — pain rating ≥7/10 OR functional disability OR overwhelming distress despite previously adequate regimen. Considered an oncologic emergency requiring rapid intervention per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Disease progression, neural invasion, pathologic fracture, bowel obstruction, infection, treatment-related (mucositis, postoperative), unrelieved by ongoing baseline therapy.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Severe pain (numerical 7–10 or visual analog), often despite scheduled opioid.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Functional impairment — inability to sleep, eat, ambulate.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Emotional distress — anxiety, depression, fear of dying, family distress.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("New pattern (somatic vs visceral vs neuropathic) → consider new pathology (fracture, obstruction, abscess).", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Reassess for new structural cause — imaging if mass, new neurologic deficit, or unable to attribute to known disease.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Pain dimensions — quality (somatic, neuropathic, visceral), location, severity, function, mood.", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs; respiratory rate before each opioid dose.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("New focal exam findings — fracture site, abdominal rigidity, neuro deficit.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Mood, anxiety, family / social context.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("RAPID OPIOID TITRATION — IV opioid (morphine 2–5 mg or hydromorphone 0.2–0.5 mg) every 15–30 min until pain controlled; double dose if no response per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Convert to PCA or continuous infusion once stable; calculate 24-hour requirement to set up scheduled regimen.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Identify and treat new cause — surgical for fracture; radiation for bone met or cord compression; antibiotics for abscess.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Adjuvants — gabapentin / pregabalin for neuropathic, dexamethasone for nerve / capsular pain, bisphosphonates for bone, lidocaine patch for localized.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Procedural — nerve block, epidural, intrathecal opioid, neurolytic procedures (celiac plexus block) for refractory per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Multidisciplinary — palliative care + oncology + pain management; psychosocial support.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Anticipate and treat opioid side effects — constipation (scheduled bowel regimen), nausea, sedation.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("OPIOID-INDUCED RESPIRATORY DEPRESSION — naloxone titrated to restore breathing without precipitating severe pain rebound.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("New STRUCTURAL cause — bone met, cord compression (back pain + neurologic deficit = oncologic emergency).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Total pain — physical + emotional + spiritual + social; address all dimensions.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Goals of care — when to transition to comfort care if persistent uncontrolled pain.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Terminal Dyspnea / Death Rattle

public enum TerminalDyspneaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "terminal-dyspnea",
        title: "Terminal dyspnea / \"death rattle\"",
        subtitle: "EOL respiratory distress + secretions · positioning + opioid + anticholinergic",
        nclexTags: palliativeR11,
        definition: AttributedProse(
            "Subjective sensation of breathlessness (dyspnea) and / or noisy upper-airway secretions (\"death rattle\") in dying patients. Both are common and distressing; effective management is the priority of EOL care per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — disease progression (HF, COPD, pneumonia, malignancy, ascites), anxiety, secretions accumulating in oropharynx as swallow / cough wane.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Dyspnea — visible accessory-muscle use, tachypnea, restlessness, anxiety; subjective complaint if able.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Death rattle — gurgling / rattling sound from upper-airway secretions; often more distressing to family than to patient.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Cyanosis, mottling, agonal breathing as death approaches.", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — well-recognized in patients with active dying process; further imaging usually inappropriate / counterproductive.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Distinguish dyspnea from agitation — patients may show similar restlessness; assess and treat empirically.", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("Symptom severity — dyspnea scale, agitation, comfort.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Family at bedside — emotional state, support needs.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Medications and goals of care; advance directives.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("DYSPNEA: opioid (morphine 2–5 mg PO/SL or 1–2 mg SQ/IV every 1–2 hr titrated) — first-line per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Anxiolytic — lorazepam 0.5–1 mg PO/SL/SQ every 4–6 hr for anxious dyspnea.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Position — upright or 45° if able; lateral if secretions; fan toward face (trigeminal stimulation reduces dyspnea per primary source).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Oxygen — only if symptomatic relief; saturation goals not the focus.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("DEATH RATTLE: positioning (lateral, elevate HOB), gentle oral suction (deep suction often distressing); consider scopolamine patch / hyoscyamine SL — more effective if started EARLY before secretions accumulate per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Family education — death rattle reflects disease, not patient suffering; loved one is typically not aware.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Reassess and titrate frequently; chaplain and bereavement support.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("OVER-AGGRESSIVE suctioning increases distress and bleeding; gentle oral suction only.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Inadequate symptom control → patient and family suffering; do not under-dose due to fear of hastening death — appropriate symptom management is ethically required per primary source.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Family bereavement — anticipatory grief, debriefing, follow-up bereavement support.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Opioid-Induced Constipation

public enum OICSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "opioid-induced-constipation",
        title: "Opioid-induced constipation (OIC)",
        subtitle: "Predictable opioid side effect · scheduled bowel regimen · PAMORA for refractory",
        nclexTags: palliativeR11,
        definition: AttributedProse(
            "Constipation that develops after starting / changing opioid therapy. Opioids slow GI motility via μ-receptors throughout the GI tract. Affects nearly all patients on chronic opioids per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Opioid binding to peripheral μ-opioid receptors in GI tract → reduced peristalsis + increased water absorption from colon + decreased intestinal secretions → hard, infrequent, hard-to-pass stools.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Reduced bowel-movement frequency (<3 / week is classic threshold).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Hard, lumpy stools; straining; sensation of incomplete evacuation.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Abdominal discomfort, bloating, anorexia.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Severe — fecal impaction, paradoxic overflow diarrhea, ileus, bowel perforation.", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — symptoms in setting of opioid use; rule out other causes.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Bristol stool scale; abdominal exam, rectal exam if impaction suspected.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Imaging if suspected obstruction.", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("Bowel-movement history; medication review; fluid / fiber intake; mobility.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Abdominal exam — distension, tympany, bowel sounds; rectal exam for impaction.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Pain control — under-treatment of pain may also reduce mobility / contribute.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("PROPHYLACTIC bowel regimen for ALL patients starting opioids — stimulant + softener (senna + docusate; OR senna alone — docusate evidence limited) per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Add osmotic laxative (PEG / polyethylene glycol 17 g daily) if inadequate per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Lifestyle — hydration, fiber (caution with constipation — can worsen if not also moving), mobility, regular toilet routine.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("REFRACTORY — peripherally-acting μ-opioid receptor antagonists (PAMORAs) — methylnaltrexone SQ, naloxegol PO, naldemedine PO; do NOT cross BBB so analgesia preserved per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Suppositories, enemas, manual disimpaction for severe / impaction.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("AVOID bulk-forming laxatives in opioid use without adequate hydration — can worsen impaction.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("FECAL IMPACTION — passage of liquid stool around hard mass (can be mistaken for diarrhea); rectal exam.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Bowel obstruction / perforation — abdominal pain, distension, peritoneal signs.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Patient distress / non-adherence to opioid due to OIC — address proactively.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Tolerance does NOT develop to opioid GI effects — bowel regimen needed throughout opioid therapy.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ALS

public enum ALSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "als",
        title: "Amyotrophic lateral sclerosis (ALS)",
        subtitle: "Motor neuron disease · upper + lower motor neuron · multidisciplinary palliative",
        nclexTags: neuroR11,
        definition: AttributedProse(
            "Progressive neurodegenerative disease of upper and lower motor neurons — leads to muscle weakness, atrophy, dysphagia, dysarthria, and respiratory failure. Most cases sporadic; ~10% familial. Median survival 3–5 years from symptom onset per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Selective loss of motor neurons in motor cortex, brainstem, spinal cord. Mechanisms — glutamate excitotoxicity, oxidative stress, mitochondrial dysfunction, protein aggregation. Sensory and cognitive functions usually preserved.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Progressive painless weakness — typically asymmetric, starting in one limb (limb-onset) or with dysarthria / dysphagia (bulbar-onset).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Upper motor neuron — spasticity, hyperreflexia, Babinski sign.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Lower motor neuron — weakness, atrophy, fasciculations, hyporeflexia in affected limbs.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Bulbar — dysarthria, dysphagia, drooling, tongue atrophy / fasciculations.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Respiratory — dyspnea on exertion → orthopnea → respiratory failure (most common cause of death).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("PRESERVED — sensation, sphincter / sexual function, eye movements (until late), cognition (frontotemporal dementia in 5–10%).", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — combined upper + lower motor neuron findings in multiple regions; progressive course.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("EMG — diffuse denervation with normal nerve conduction; supports diagnosis.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("MRI brain / spine — rule out compressive / structural lesions.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Genetic testing for familial cases (SOD1, C9orf72, FUS, TDP-43).", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("Functional ability (ALSFRS-R), pulmonary function (FVC, MIP), swallow, nutrition.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Symptoms — dyspnea, dysphagia, drooling, cramping, spasticity, depression, pseudobulbar affect.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Family / caregiver burden; advance-care planning.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("DISEASE-MODIFYING — riluzole (modest survival benefit), edaravone IV, AMX0035 / Relyvrio (short trials supported), tofersen (SOD1) per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("MULTIDISCIPLINARY clinic — neurology, PT/OT/ST, respiratory, nutrition, social work, palliative care; improves survival per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Respiratory — non-invasive ventilation (BiPAP) when FVC <50%; cough-assist devices; tracheostomy if patient elects per primary source.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Nutrition — PEG tube before significant aspiration / weight loss (FVC >50% best timing).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Symptom — baclofen / tizanidine for spasticity, anticholinergic for drooling, opioids for dyspnea, antidepressants, dextromethorphan-quinidine for pseudobulbar affect.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("AAC — augmentative communication devices as speech declines.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Hospice referral; advance directives early in disease.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("RESPIRATORY FAILURE — most common cause of death; NIV adherence and family preparation.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("ASPIRATION pneumonia — swallow evaluation; PEG; positioning.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Suicide / depression — high prevalence; mental-health support.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Caregiver burnout — respite, resources.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Trigeminal Neuralgia

public enum TrigeminalNeuralgiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "trigeminal-neuralgia",
        title: "Trigeminal neuralgia",
        subtitle: "\"Tic douloureux\" · brief lancinating face pain · carbamazepine first-line",
        nclexTags: neuroR11,
        definition: AttributedProse(
            "Severe, brief, lancinating facial pain in distribution of the trigeminal nerve (CN V), most often V2 / V3 divisions. Most cases are caused by vascular compression of the trigeminal nerve root entry zone (most often superior cerebellar artery) per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Vascular loop compression (most), demyelination (multiple sclerosis), tumor → ectopic firing of trigeminal sensory fibers → paroxysmal pain.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Sudden, severe, electric-shock-like pain, lasting seconds to 2 minutes.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Unilateral, in V2 (cheek, upper jaw) or V3 (lower jaw) distribution.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Triggered by light touch — talking, chewing, brushing teeth, cold breeze on face.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Refractory periods between attacks.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Atypical features (constant background pain, bilateral, sensory deficit) → consider symptomatic / secondary cause (MS, tumor) and image with MRI.", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical history of paroxysmal lancinating facial pain triggered by innocuous stimuli.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("MRI brain — rules out MS, tumor; can identify vascular compression.", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain frequency, severity, triggers, impact on eating / hygiene / sleep / mood.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Sensory exam — should be normal in classic TN; abnormal sensation → consider secondary cause.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("MRI per primary source.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("CARBAMAZEPINE — first-line; initial 100 mg PO BID, titrate to 200–400 mg BID per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("OXCARBAZEPINE — alternative; better tolerated; same first-line efficacy per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Second-line — gabapentin, pregabalin, baclofen, lamotrigine.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("REFRACTORY or surgically amenable — microvascular decompression (Jannetta procedure), gamma-knife radiosurgery, percutaneous rhizotomy per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Educate patient — avoid triggers when possible; supportive care during attacks.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("Carbamazepine adverse effects — SJS / TEN (HLA-B*1502 in Asian ancestry), aplastic anemia, hyponatremia, hepatotoxicity; baseline + periodic CBC, LFTs, sodium.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Atypical features → MRI to rule out MS / tumor.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Mental-health impact — high suicide risk in untreated severe TN; address proactively.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Aortic Aneurysm (AAA)

public enum AAASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "aaa",
        title: "Abdominal aortic aneurysm (AAA)",
        subtitle: "Aortic dilation ≥3 cm · screen male smokers 65–75 · rupture = emergency",
        nclexTags: vascR11,
        definition: AttributedProse(
            "Abnormal dilation of the abdominal aorta ≥3 cm. Risk of rupture rises sharply with size — small (<5.5 cm) typically observed; larger (≥5.5 cm) repaired electively. Rupture is catastrophic with high mortality per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — atherosclerosis, smoking (strongest modifiable risk), hypertension, family history, connective-tissue disease (Marfan, Ehlers-Danlos), inflammation. Wall weakening → progressive dilation.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("ASYMPTOMATIC — most AAAs found incidentally on imaging or screening US.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Symptomatic (\"about to rupture\") — severe abdominal / back / flank pain, pulsatile abdominal mass, hypotension, syncope.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Ruptured — sudden severe abdominal / back pain + hypotension + pulsatile mass = CLASSIC TRIAD; hemorrhagic shock.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Distal embolization — blue-toe syndrome, peripheral ischemia.", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Abdominal ultrasound — first-line screening / surveillance.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("CT angiogram — definitive sizing and surgical planning.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("USPSTF screening — one-time abdominal US in MEN aged 65–75 who have ever smoked per primary source.", citationIDs: ["specialty_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs (especially in suspected rupture); IV access × 2 large-bore.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Pulsatile mass on abdominal exam (limited sensitivity).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Pain pattern — flank / back / abdomen radiating; rapid bedside US (FAST or AAA-specific) when rupture suspected.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("Asymptomatic small (<5.5 cm) — surveillance US every 6–12 months; aggressive risk-factor management — smoking cessation, BP, statin per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("≥5.5 cm OR rapidly expanding (>0.5 cm/6 mo) OR symptomatic — elective endovascular (EVAR) or open repair per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("RUPTURED — immediate vascular surgery; 2 large-bore IVs; massive transfusion protocol; PERMISSIVE HYPOTENSION (target SBP ~80–90) until clamped to limit further bleeding per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Post-EVAR — surveillance for endoleak (CT angiogram at intervals); lifelong follow-up.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Smoking cessation — single most important intervention to slow progression.", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("RUPTURE = EMERGENCY — high mortality even with prompt intervention; do NOT delay surgical consult while imaging.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Distal embolization — sudden lower-extremity ischemia.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Aortoenteric fistula — late post-graft complication; massive GI bleed in patient with AAA history.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Family screening — first-degree relatives of AAA patient have increased risk.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Lung Cancer

public enum LungCancerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "lung-cancer",
        title: "Lung cancer",
        subtitle: "Leading cause of cancer death · NSCLC vs SCLC · smoking + occupational exposure",
        nclexTags: oncR11,
        definition: AttributedProse(
            "Most common cause of cancer death worldwide. Two major histologic categories: non-small-cell lung cancer (NSCLC, ~85% — adenocarcinoma, squamous, large cell) and small-cell lung cancer (SCLC, ~15%). Smoking is the strongest risk factor; non-smoker cases (often EGFR-mutant adenocarcinoma) are increasingly recognized per primary source.",
            citationIDs: ["openrn_dx_round11", "specialty_dx_round11"]
        ),
        pathophysiology: AttributedProse(
            "Carcinogen exposure (smoking, radon, asbestos) → DNA damage → malignant transformation. NSCLC tends to be slower-growing; SCLC is highly aggressive with early metastasis.",
            citationIDs: ["openrn_dx_round11"]
        ),
        presentation: [
            AttributedBullet("Many ASYMPTOMATIC — found on screening / imaging.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Cough (new or changed), hemoptysis, dyspnea, wheezing, pneumonia recurrent in same lobe.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Constitutional — weight loss, fatigue, anorexia, night sweats.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Local invasion — Pancoast tumor (apex + Horner syndrome + arm pain), SVC syndrome, recurrent laryngeal nerve invasion (hoarseness), pleural effusion.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Paraneoplastic — SCLC associated with SIADH, Cushing (ectopic ACTH), Lambert-Eaton; squamous-cell with hypercalcemia (PTHrP).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Metastatic — bone (pain, fracture), brain (focal deficit, headache), liver, adrenal.", citationIDs: ["openrn_dx_round11"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Imaging — CXR, then CT chest with contrast; PET for staging.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Tissue diagnosis — bronchoscopy with biopsy, percutaneous CT-guided biopsy, surgical biopsy.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Molecular testing — EGFR, ALK, ROS1, BRAF, KRAS G12C, NTRK, RET, MET, PD-L1 per NCCN per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Staging — TNM (NSCLC) or limited / extensive (SCLC).", citationIDs: ["openrn_dx_round11"])
        ],
        priorityAssessments: [
            AttributedBullet("Pulmonary status, performance status, comorbidities (especially COPD).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Smoking history, occupational exposure (asbestos, radon).", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Mental health — diagnosis distress, smoking cessation challenges, family support.", citationIDs: ["openrn_dx_round11"])
        ],
        commonInterventions: [
            AttributedBullet("USPSTF SCREENING — annual low-dose CT chest in adults 50–80 with 20+ pack-year history who currently smoke or quit within 15 yr per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("NSCLC EARLY-STAGE — surgical resection (lobectomy + lymph-node dissection) ± adjuvant chemo / targeted / immunotherapy.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("NSCLC LOCALLY ADVANCED — combined chemoradiation ± consolidation immunotherapy (durvalumab) per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("NSCLC METASTATIC — driver-mutation-targeted therapy (osimertinib EGFR, alectinib ALK, etc.) when applicable; immunotherapy (pembrolizumab) per PD-L1; chemotherapy combinations per primary source.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("SCLC — etoposide / platinum + immunotherapy ± thoracic radiation; prophylactic cranial irradiation in select cases.", citationIDs: ["specialty_dx_round11"]),
            AttributedBullet("Smoking cessation — improves survival even after diagnosis; offer counseling, varenicline / bupropion / NRT.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Multidisciplinary — pulmonology, oncology, radiation oncology, thoracic surgery, palliative care from diagnosis (improves both quality of life AND survival per primary source).", citationIDs: ["openrn_dx_round11"])
        ],
        watchFor: [
            AttributedBullet("PARANEOPLASTIC syndromes — SIADH, hypercalcemia, Cushing, Lambert-Eaton; can complicate management.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Brain metastases — common; whole-brain radiation, stereotactic radiosurgery, or systemic therapy with CNS penetration.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Immune-related adverse events with checkpoint inhibitors — colitis, hepatitis, pneumonitis, endocrinopathy; high-dose steroids.", citationIDs: ["openrn_dx_round11"]),
            AttributedBullet("Hospice / palliative care — early integration improves outcomes per primary source.", citationIDs: ["openrn_dx_round11"])
        ],
        citations: [openrnDxR11, specialtyDxR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}
