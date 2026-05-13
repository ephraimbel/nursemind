import Foundation

// Curator-model ECG / rhythm reference cards (v1.5 expansion).
// Sources: Open RN Cardiac (CC BY 4.0), AHA ACLS (concept citation).

private let openrnECG = CitationSource(
    id: "openrn_ecg",
    shortName: "Open RN Health Alterations / Med-Surg — Cardiovascular Rhythms",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=ekg+rhythm+arrhythmia+cardiac",
    lastRetrieved: "2026-05-04"
)
private let ahaECG = CitationSource(
    id: "aha_ecg",
    shortName: "AHA ACLS / BLS algorithms (concept citation)",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://cpr.heart.org/",
    lastRetrieved: "2026-05-04"
)

private let ecgTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion)

// MARK: - 12-Lead Basics

public enum ECG12LeadBasicsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ecg-12-lead-basics",
        title: "12-Lead ECG basics",
        subtitle: "Lead placement · interval analysis · 5-step interpretation",
        eyebrow: "REFERENCE · ECG",
        nclexTags: ecgTags,
        sections: [
            .keyValueTable(title: "Lead placement (12-lead)", [
                KeyValueRow(key: "RA / LA / RL / LL", value: "Limb leads — RA right wrist, LA left wrist, RL right ankle (ground), LL left ankle"),
                KeyValueRow(key: "V1", value: "4th intercostal space, RIGHT sternal border"),
                KeyValueRow(key: "V2", value: "4th intercostal space, LEFT sternal border"),
                KeyValueRow(key: "V3", value: "Halfway between V2 and V4"),
                KeyValueRow(key: "V4", value: "5th intercostal space, midclavicular line"),
                KeyValueRow(key: "V5", value: "5th intercostal space, anterior axillary line"),
                KeyValueRow(key: "V6", value: "5th intercostal space, midaxillary line")
            ]),
            .keyValueTable(title: "Anatomic regions and corresponding leads", [
                KeyValueRow(key: "Inferior wall (RCA territory)", value: "II, III, aVF"),
                KeyValueRow(key: "Lateral wall (Cx/Diag)", value: "I, aVL, V5, V6"),
                KeyValueRow(key: "Anterior wall (LAD)", value: "V3, V4 (V1–V4 anteroseptal)"),
                KeyValueRow(key: "Septal wall (LAD septal)", value: "V1, V2"),
                KeyValueRow(key: "Posterior wall (RCA/Cx)", value: "Reciprocal ST DEPRESSION in V1–V3 with tall R; obtain V7–V9"),
                KeyValueRow(key: "Right ventricle", value: "Inferior MI → obtain V4R; ST elevation = RV involvement")
            ]),
            .keyValueTable(title: "Normal intervals (small box = 0.04 sec; large box = 0.20 sec)", [
                KeyValueRow(key: "Heart rate", value: "Count R waves in 6-second strip × 10 (irregular); 1500/small boxes between R waves (regular)"),
                KeyValueRow(key: "P wave", value: "<0.12 sec wide, <2.5 mm tall; upright in II"),
                KeyValueRow(key: "PR interval", value: "0.12–0.20 sec (3–5 small boxes)"),
                KeyValueRow(key: "QRS complex", value: "0.06–0.10 sec (≤0.12 normal)"),
                KeyValueRow(key: "QT interval", value: "<0.44 (men) / <0.46 (women); QTc = QT / √(RR in sec); >500 ms = high torsades risk"),
                KeyValueRow(key: "ST segment", value: "Isoelectric; elevation/depression abnormal"),
                KeyValueRow(key: "T wave", value: "Upright in I, II, V3–V6; inverted in aVR")
            ]),
            .numberedSteps(title: "5-step rhythm strip interpretation", [
                "Rate — calculate atrial and ventricular rates separately if different.",
                "Rhythm — regular vs irregular? Pattern (regularly irregular vs irregularly irregular)?",
                "P waves — present? One per QRS? Same morphology? Upright in II?",
                "PR interval — 0.12–0.20 sec? Constant? Lengthening (Wenckebach)?",
                "QRS complex — narrow (<0.12) vs wide; uniform; relationship to P wave."
            ], citationIDs: ["openrn_ecg"]),
            .bullets(title: "Common artifact sources", [
                AttributedBullet("Patient movement, shivering — wandering baseline.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("60-Hz electrical interference — fuzzy baseline; check leads.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Loose lead wire — flat or chaotic line; lead reversal — abnormal axis.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Always confirm lethal rhythm by clinical assessment (pulse + responsiveness) before treating; treat the patient, not the monitor.", citationIDs: ["openrn_ecg"])
            ])
        ],
        citations: [openrnECG, ahaECG],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sinus Rhythm

public enum SinusRhythmSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "sinus-rhythm-reference",
        title: "Sinus rhythms — normal, brady, tachy, arrhythmia",
        subtitle: "P before every QRS · upright in II · PR 0.12–0.20",
        eyebrow: "REFERENCE · ECG · BASE RHYTHMS",
        nclexTags: ecgTags,
        sections: [
            .keyValueTable(title: "Normal sinus rhythm (NSR)", [
                KeyValueRow(key: "Rate", value: "60–100 bpm"),
                KeyValueRow(key: "Rhythm", value: "Regular"),
                KeyValueRow(key: "P waves", value: "One upright P before every QRS in II"),
                KeyValueRow(key: "PR interval", value: "0.12–0.20 sec"),
                KeyValueRow(key: "QRS", value: "0.06–0.10 sec")
            ]),
            .keyValueTable(title: "Sinus bradycardia", [
                KeyValueRow(key: "Rate", value: "<60 bpm (otherwise looks like NSR)"),
                KeyValueRow(key: "Causes", value: "Athletic conditioning, sleep, vagal stimulation, medications (β-blocker, CCB, digoxin), inferior MI, hypothyroidism, hypothermia, increased ICP"),
                KeyValueRow(key: "Treatment", value: "Treat only if symptomatic (dizziness, hypotension, AMS, chest pain, HF). Per ACLS: atropine 1 mg IV (max 3 mg), transcutaneous pacing, dopamine or epi infusion, address cause")
            ]),
            .keyValueTable(title: "Sinus tachycardia", [
                KeyValueRow(key: "Rate", value: "100–160 bpm (typically; up to 220 in young patients)"),
                KeyValueRow(key: "Causes", value: "Pain, anxiety, fever, hypovolemia, hypoxia, sepsis, anemia, hyperthyroidism, exercise, stimulants (caffeine, cocaine, amphetamines), medications (albuterol, dopamine), withdrawal"),
                KeyValueRow(key: "Treatment", value: "TREAT THE CAUSE — fluids for hypovolemia, antipyretic, oxygen, sedation, etc. Beta-blocker only if cause addressed")
            ]),
            .keyValueTable(title: "Sinus arrhythmia", [
                KeyValueRow(key: "Pattern", value: "Sinus rhythm with rate variation linked to respiration (inspiration → faster, expiration → slower)"),
                KeyValueRow(key: "Significance", value: "NORMAL variant, especially in young patients; usually no treatment")
            ]),
            .bullets(title: "Pearls", [
                AttributedBullet("Symptomatic bradycardia in setting of MI may need pacing; remember atropine ineffective in heart-transplant recipients (denervated heart).", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Persistent unexplained tachycardia warrants workup — sepsis is the most-missed cause in hospitalized patients.", citationIDs: ["openrn_ecg"])
            ])
        ],
        citations: [openrnECG, ahaECG],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Atrial Fibrillation

public enum AFibReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "afib-reference",
        title: "Atrial fibrillation",
        subtitle: "Irregularly irregular · no discernible P waves · stroke risk",
        eyebrow: "REFERENCE · ECG · TACHYARRHYTHMIAS",
        nclexTags: ecgTags,
        sections: [
            .keyValueTable(title: "Identification", [
                KeyValueRow(key: "Rhythm", value: "Irregularly irregular (ventricular response)"),
                KeyValueRow(key: "P waves", value: "Absent — replaced by chaotic 'fibrillatory' baseline"),
                KeyValueRow(key: "Atrial rate", value: ">350 bpm (chaotic, not measured)"),
                KeyValueRow(key: "Ventricular rate", value: "Variable (controlled <100; uncontrolled / RVR >100, often 110–180)"),
                KeyValueRow(key: "QRS", value: "Usually narrow (unless aberrant conduction)")
            ]),
            .bullets(title: "Causes", [
                AttributedBullet("HTN, valvular disease (especially mitral), heart failure, ischemic heart disease, cardiomyopathy.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Hyperthyroidism, alcohol ('holiday heart'), pulmonary disease (COPD, OSA, PE).", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Post-cardiothoracic surgery, sepsis, electrolyte derangement.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Pheochromocytoma, stimulants.", citationIDs: ["openrn_ecg"])
            ]),
            .bullets(title: "Clinical significance", [
                AttributedBullet("Loss of atrial kick (~20% cardiac output) — poorly tolerated in stiff/HCM/AS hearts.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("STROKE RISK — stagnant atrial blood forms thrombi (especially in left atrial appendage); CHA₂DS₂-VASc scores risk.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Rapid ventricular rates → diastolic filling impairment → hypotension, ischemia, tachycardia-induced cardiomyopathy.", citationIDs: ["openrn_ecg"])
            ]),
            .keyValueTable(title: "Treatment principles", [
                KeyValueRow(key: "Unstable (hypotension, AMS, chest pain, HF)", value: "SYNCHRONIZED CARDIOVERSION 120–200 J biphasic"),
                KeyValueRow(key: "Rate control", value: "IV diltiazem or metoprolol (avoid in WPW); digoxin in HF; goal HR <110 (lenient) or <80 (strict per indication)"),
                KeyValueRow(key: "Rhythm control", value: "Pharmacologic (amiodarone, flecainide, sotalol, dofetilide) or electrical cardioversion; pulmonary vein isolation (ablation)"),
                KeyValueRow(key: "Anticoagulation", value: "Per CHA₂DS₂-VASc score (≥2 men, ≥3 women) — DOAC preferred over warfarin (except mechanical valve, severe mitral stenosis)"),
                KeyValueRow(key: "Cardioversion safety", value: "If AFib >48 hr or unknown duration: TEE to exclude LA thrombus OR therapeutic anticoagulation ≥3 weeks before AND ≥4 weeks after cardioversion")
            ]),
            .bullets(title: "CHA₂DS₂-VASc scoring", [
                AttributedBullet("CHF (1), HTN (1), Age ≥75 (2), Age 65–74 (1), Diabetes (1), prior Stroke/TIA (2), Vascular disease (1), Sex female (1).", citationIDs: ["openrn_ecg"]),
                AttributedBullet("≥2 in men, ≥3 in women → anticoagulate. Score 0 in men, 1 in women → none typically. Score 1 in men → consider.", citationIDs: ["openrn_ecg"])
            ]),
            .bullets(title: "AFib with WPW (wide-complex irregular tachycardia)", [
                AttributedBullet("DO NOT use AV nodal blockers (adenosine, beta-blockers, CCB, digoxin) — they accelerate accessory pathway, can degenerate to VF.", citationIDs: ["aha_ecg"]),
                AttributedBullet("Procainamide or cardioversion preferred.", citationIDs: ["aha_ecg"])
            ])
        ],
        citations: [openrnECG, ahaECG],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Atrial Flutter

public enum AFlutterReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "aflutter-reference",
        title: "Atrial flutter",
        subtitle: "Sawtooth flutter waves · usually 2:1 conduction · ablation",
        eyebrow: "REFERENCE · ECG · TACHYARRHYTHMIAS",
        nclexTags: ecgTags,
        sections: [
            .keyValueTable(title: "Identification", [
                KeyValueRow(key: "Atrial rate", value: "250–350 bpm (typically ~300)"),
                KeyValueRow(key: "Atrial pattern", value: "SAWTOOTH 'flutter waves' best seen in II, III, aVF"),
                KeyValueRow(key: "Ventricular rate", value: "Determined by AV conduction ratio — 2:1 → 150 (most common); 3:1 → 100; 4:1 → 75"),
                KeyValueRow(key: "Rhythm", value: "Regular if conduction ratio constant; irregular if variable"),
                KeyValueRow(key: "QRS", value: "Narrow")
            ]),
            .bullets(title: "Causes and clinical considerations", [
                AttributedBullet("Same as AFib — often co-exists or alternates.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Ventricular rate of 150 in adult should always raise suspicion of atrial flutter with 2:1 block.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("STROKE risk similar to AFib — same anticoagulation principles (CHA₂DS₂-VASc).", citationIDs: ["openrn_ecg"])
            ]),
            .keyValueTable(title: "Treatment", [
                KeyValueRow(key: "Unstable", value: "Synchronized cardioversion at 50–100 J (responds to lower energy than AFib)"),
                KeyValueRow(key: "Rate control", value: "Diltiazem, beta-blocker (often more difficult than AFib)"),
                KeyValueRow(key: "Rhythm control", value: "Cardioversion or pharmacologic; CATHETER ABLATION of cavotricuspid isthmus is highly effective and often first-line for typical right-atrial flutter"),
                KeyValueRow(key: "Anticoagulation", value: "Same as AFib")
            ]),
            .bullets(title: "Pearls", [
                AttributedBullet("Vagal maneuvers or adenosine can transiently slow AV conduction and unmask flutter waves diagnostically.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Rate control of flutter is harder than AFib; rhythm control or ablation often preferred.", citationIDs: ["openrn_ecg"])
            ])
        ],
        citations: [openrnECG, ahaECG],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - SVT

public enum SVTReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "svt-reference",
        title: "Supraventricular tachycardia (SVT)",
        subtitle: "Narrow regular rapid · vagal → adenosine",
        eyebrow: "REFERENCE · ECG · TACHYARRHYTHMIAS",
        nclexTags: ecgTags,
        sections: [
            .keyValueTable(title: "Identification", [
                KeyValueRow(key: "Rate", value: "150–250 bpm"),
                KeyValueRow(key: "Rhythm", value: "Regular"),
                KeyValueRow(key: "P waves", value: "Often hidden in QRS or T wave; retrograde in some types"),
                KeyValueRow(key: "QRS", value: "Narrow (<0.12 sec); wide if pre-existing bundle branch block or aberrancy"),
                KeyValueRow(key: "Onset/offset", value: "Usually ABRUPT (paroxysmal SVT — PSVT)")
            ]),
            .bullets(title: "Common types", [
                AttributedBullet("AV nodal reentrant tachycardia (AVNRT) — most common; reentrant circuit within AV node.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("AV reentrant tachycardia (AVRT) — accessory pathway (e.g., WPW) involvement.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Atrial tachycardia — focal atrial origin.", citationIDs: ["openrn_ecg"])
            ]),
            .keyValueTable(title: "Treatment (stable, narrow regular)", [
                KeyValueRow(key: "Step 1", value: "VAGAL maneuvers — Valsalva (modified Valsalva more effective: blow into syringe then lay supine with legs raised), carotid sinus massage (NOT in elderly with bruits or carotid disease)"),
                KeyValueRow(key: "Step 2", value: "ADENOSINE 6 mg IV rapid push followed by 20 mL NS flush via large proximal vein (antecubital); if ineffective, 12 mg IV; may repeat 12 mg × 1"),
                KeyValueRow(key: "Step 3 (if persists)", value: "Beta-blocker, calcium channel blocker (diltiazem) IV"),
                KeyValueRow(key: "Step 4 (refractory)", value: "Synchronized cardioversion 50–100 J biphasic")
            ]),
            .keyValueTable(title: "Treatment (unstable)", [
                KeyValueRow(key: "Hypotension, AMS, chest pain, HF", value: "Synchronized cardioversion immediately (50–100 J biphasic)")
            ]),
            .bullets(title: "Adenosine pearls", [
                AttributedBullet("Patient WILL feel transient flushing, chest discomfort, doom-like sensation — warn them; lasts ~10 sec.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Brief (3–6 sec) sinus pause is expected — monitor and have crash cart ready.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Use proximal large vein (antecubital); rapid push followed by FAST flush — adenosine half-life is ~10 seconds.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Avoid if asthma (bronchospasm), heart transplant (denervated heart — may cause prolonged asystole; reduce dose).", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Wide-complex tachycardia — DO NOT use adenosine if rhythm uncertain; assume VT until proven otherwise.", citationIDs: ["openrn_ecg"])
            ])
        ],
        citations: [openrnECG, ahaECG],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ventricular Tachycardia

public enum VTReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "vt-reference",
        title: "Ventricular tachycardia (VT)",
        subtitle: "Wide regular tachycardia · pulse vs pulseless · monomorphic vs polymorphic",
        eyebrow: "REFERENCE · ECG · LIFE-THREATENING",
        nclexTags: ecgTags,
        sections: [
            .keyValueTable(title: "Identification", [
                KeyValueRow(key: "Rate", value: "Usually 150–250 bpm"),
                KeyValueRow(key: "Rhythm", value: "Regular (monomorphic) or irregular (polymorphic, torsades)"),
                KeyValueRow(key: "QRS", value: "WIDE (≥0.12 sec) — bizarre morphology"),
                KeyValueRow(key: "P waves", value: "Usually absent or AV dissociation (independent P waves)"),
                KeyValueRow(key: "Definition", value: "≥3 consecutive ventricular beats; sustained = ≥30 sec or hemodynamic compromise")
            ]),
            .bullets(title: "Causes", [
                AttributedBullet("ISCHEMIA / MI (most common in adults).", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Cardiomyopathy, heart failure, prior MI scar.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Electrolyte derangement (hypoK, hypoMg, hyperK).", citationIDs: ["openrn_ecg"]),
                AttributedBullet("QT-prolonging drugs → torsades.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Inherited (long QT syndrome, Brugada, ARVC, HCM).", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Drug toxicity (digoxin, cocaine, methamphetamine).", citationIDs: ["openrn_ecg"])
            ]),
            .keyValueTable(title: "Treatment by stability", [
                KeyValueRow(key: "PULSELESS VT", value: "Treat as VF — DEFIBRILLATE (200 J biphasic), CPR, epi q3–5 min, amiodarone 300 mg IV (then 150 mg if recurs)"),
                KeyValueRow(key: "UNSTABLE with pulse", value: "Synchronized cardioversion at 100 J biphasic; sedate if alert"),
                KeyValueRow(key: "STABLE monomorphic VT with pulse", value: "Amiodarone 150 mg IV over 10 min OR procainamide; consult cardiology"),
                KeyValueRow(key: "POLYMORPHIC / TORSADES", value: "Magnesium sulfate 1–2 g IV; correct K and Mg; remove offending drugs; if pulseless, defibrillate; if recurrent, overdrive pacing or isoproterenol")
            ]),
            .bullets(title: "Wide-complex tachycardia approach", [
                AttributedBullet("Assume VT until proven otherwise — especially in patient with structural heart disease.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Distinguishing from SVT with aberrancy is difficult on rhythm strip — when in doubt, treat as VT.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Brugada criteria help differentiate but are imperfect; clinical history (prior MI, cardiomyopathy) supports VT.", citationIDs: ["openrn_ecg"])
            ]),
            .bullets(title: "Pearls", [
                AttributedBullet("New VT in patient on digoxin → consider digoxin toxicity; check level, K, Mg.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("After ROSC from VT/VF, evaluate underlying cause — coronary angiography for suspected ischemia.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Recurrent VT/VF — ICD placement reduces mortality.", citationIDs: ["openrn_ecg"])
            ])
        ],
        citations: [openrnECG, ahaECG],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ventricular Fibrillation

public enum VFReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "vf-reference",
        title: "Ventricular fibrillation (VF)",
        subtitle: "Chaotic disorganized rhythm · NO cardiac output · DEFIBRILLATE",
        eyebrow: "REFERENCE · ECG · LIFE-THREATENING",
        nclexTags: ecgTags,
        sections: [
            .keyValueTable(title: "Identification", [
                KeyValueRow(key: "Pattern", value: "Chaotic, disorganized, irregular waveform with no discernible P waves, QRS, or T waves"),
                KeyValueRow(key: "Coarse VF", value: "Larger amplitude waveforms — more recent onset, more shockable"),
                KeyValueRow(key: "Fine VF", value: "Smaller amplitude — longer duration; can be mistaken for asystole; may degenerate to asystole"),
                KeyValueRow(key: "Rate", value: "Cannot measure"),
                KeyValueRow(key: "Cardiac output", value: "ZERO — patient is in cardiac arrest")
            ]),
            .bullets(title: "Always confirm", [
                AttributedBullet("Confirm clinical cardiac arrest — UNRESPONSIVE + NO PULSE.", citationIDs: ["aha_ecg"]),
                AttributedBullet("Loose lead, movement artifact, electrical interference can mimic VF on monitor; confirm patient.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("If patient is awake and talking, the monitor is wrong.", citationIDs: ["openrn_ecg"])
            ]),
            .numberedSteps(title: "ACLS treatment", [
                "CPR continuous; minimize pauses (<10 sec).",
                "DEFIBRILLATE — biphasic 120–200 J (or per device); resume CPR IMMEDIATELY.",
                "Rhythm check every 2 min; defibrillate again if shockable.",
                "Epinephrine 1 mg IV/IO every 3–5 minutes.",
                "Amiodarone 300 mg IV/IO bolus after second shock; 150 mg if recurs (or lidocaine 1–1.5 mg/kg).",
                "Identify reversible causes (Hs and Ts) — hypovolemia, hypoxia, H+ acidosis, hypo/hyperkalemia, hypothermia, tension PTX, tamponade, toxins, thrombosis (PE/MI)."
            ], citationIDs: ["aha_ecg"]),
            .bullets(title: "Pearls", [
                AttributedBullet("Time to defibrillation is the strongest predictor of survival — minimize delay.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("DO NOT defibrillate asystole or PEA — non-shockable; CPR + epinephrine + reversible-cause search.", citationIDs: ["aha_ecg"]),
                AttributedBullet("Post-ROSC: targeted temperature management, treat reversible cause, ICU.", citationIDs: ["aha_ecg"]),
                AttributedBullet("Survivor without identified reversible cause — ICD evaluation.", citationIDs: ["openrn_ecg"])
            ])
        ],
        citations: [openrnECG, ahaECG],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - AV Blocks

public enum AVBlocksReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "av-blocks-reference",
        title: "AV blocks — 1st, 2nd type I, 2nd type II, 3rd",
        subtitle: "PR pattern + QRS dropout pattern · pacing for type II and 3rd",
        eyebrow: "REFERENCE · ECG · CONDUCTION",
        nclexTags: ecgTags,
        sections: [
            .keyValueTable(title: "First-degree AV block", [
                KeyValueRow(key: "Pattern", value: "PR interval CONSISTENTLY >0.20 sec; every P followed by a QRS"),
                KeyValueRow(key: "Causes", value: "Increased vagal tone, β-blocker, CCB, digoxin, ischemia, idiopathic"),
                KeyValueRow(key: "Treatment", value: "Usually NONE; address cause; rarely symptomatic")
            ]),
            .keyValueTable(title: "Second-degree AV block, TYPE I (Wenckebach / Mobitz I)", [
                KeyValueRow(key: "Pattern", value: "PR interval PROGRESSIVELY LENGTHENS until a QRS is dropped; cycle repeats. Grouped beating."),
                KeyValueRow(key: "Site of block", value: "AV NODE (typically benign)"),
                KeyValueRow(key: "Causes", value: "Increased vagal tone, β-blocker, CCB, digoxin, inferior MI"),
                KeyValueRow(key: "Treatment", value: "Usually NONE if asymptomatic; atropine and pacing if symptomatic; address cause")
            ]),
            .keyValueTable(title: "Second-degree AV block, TYPE II (Mobitz II)", [
                KeyValueRow(key: "Pattern", value: "PR interval CONSTANT (often prolonged) with INTERMITTENT non-conducted P waves (2:1, 3:1 conduction). NO progressive lengthening."),
                KeyValueRow(key: "Site of block", value: "INFRA-NODAL (His-Purkinje) — DANGEROUS, can progress to complete heart block"),
                KeyValueRow(key: "Causes", value: "Anterior MI, conduction system disease, fibrosis, surgery"),
                KeyValueRow(key: "Treatment", value: "PACING — transcutaneous bridge to TRANSVENOUS or PERMANENT pacemaker; atropine ineffective and may worsen")
            ]),
            .keyValueTable(title: "Third-degree (complete) AV block", [
                KeyValueRow(key: "Pattern", value: "AV DISSOCIATION — P waves and QRS complexes have NO relationship; both regular but independent rates"),
                KeyValueRow(key: "P rate", value: "Sinus rate (60–100)"),
                KeyValueRow(key: "QRS rate", value: "Junctional escape (40–60, narrow) or ventricular escape (20–40, wide)"),
                KeyValueRow(key: "Causes", value: "MI (especially inferior — often transient; anterior — often permanent), conduction disease, surgery, drugs, Lyme carditis"),
                KeyValueRow(key: "Treatment", value: "Pacing — transcutaneous immediately, then TRANSVENOUS; PERMANENT pacemaker in most")
            ]),
            .bullets(title: "Pearls", [
                AttributedBullet("Mobitz I (Wenckebach) is usually benign and AV-nodal; Mobitz II is infranodal and dangerous — pace.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("2:1 AV block — could be either type; trend rhythm strip and look for grouped beating or ventricular response to atropine to differentiate.", citationIDs: ["openrn_ecg"]),
                AttributedBullet("Symptomatic bradycardia from AV block — pacing per ACLS.", citationIDs: ["aha_ecg"]),
                AttributedBullet("Look for reversible causes — drug effects (β-blocker, CCB, digoxin), electrolyte (hyperK), ischemia, Lyme.", citationIDs: ["openrn_ecg"])
            ])
        ],
        citations: [openrnECG, ahaECG],
        lastSourceFidelityReview: "2026-05-04"
    )
}
