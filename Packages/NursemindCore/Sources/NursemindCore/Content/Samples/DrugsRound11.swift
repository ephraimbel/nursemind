import Foundation

// Curator-model drug entries (round 11 expansion — antiarrhythmics, RSI, palliative, dementia).
// Sources: openFDA SPL (CC0), Open RN Pharmacology (CC BY 4.0), CDC + NHPCO + ASCO concept citations.

private let openfda = CitationSource(
    id: "openfda_round11",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR11 = CitationSource(
    id: "openrn_pharm_round11",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=antiarrhythmic+RSI+palliative+dementia",
    lastRetrieved: "2026-05-04"
)
private let cdcR11 = CitationSource(
    id: "cdc_round11",
    shortName: "CDC pain / palliative guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/opioids/index.html",
    lastRetrieved: "2026-05-04"
)
private let specialtyR11 = CitationSource(
    id: "specialty_round11",
    shortName: "AHA / NHPCO / Alzheimer's Association concept citations",
    publisher: "AHA · NHPCO · Alzheimer's Association",
    license: .factCitationOnly,
    url: "https://www.heart.org/en/professional/quality-improvement",
    lastRetrieved: "2026-05-04"
)

// MARK: - Lidocaine

public enum LidocaineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lidocaine",
        title: "Lidocaine",
        subtitle: "Class IB antiarrhythmic + amide local anesthetic",
        category: "Class IB antiarrhythmic / local anesthetic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Class IB antiarrhythmic (Vaughan Williams) + amide local anesthetic"),
            KeyValueRow(key: "ACLS use", value: "Alternative to amiodarone for VT/VF (1–1.5 mg/kg IV bolus, repeat 0.5–0.75 mg/kg every 5–10 min; max 3 mg/kg)"),
            KeyValueRow(key: "Local anesthetic", value: "1% (10 mg/mL) and 2% (20 mg/mL) for infiltration; with epinephrine for prolonged effect (NOT in fingers/toes/nose/ears)"),
            KeyValueRow(key: "Toxicity", value: "Perioral numbness → tinnitus → seizures → cardiac arrest")
        ],
        indications: AttributedProse(
            "IV — ACLS for shock-refractory ventricular fibrillation / pulseless ventricular tachycardia (alternative to amiodarone), stable monomorphic VT. Local — infiltration, nerve block, topical mucosa per primary source.",
            citationIDs: ["openfda_round11", "specialty_round11"]
        ),
        mechanism: AttributedProse(
            "Blocks fast Na+ channels — preferentially in depolarized / ischemic tissue → shortens phase 0 of the cardiac action potential and refractory period. Local — blocks Na+ channels in peripheral nerves → blocks pain transmission.",
            citationIDs: ["openfda_round11"]
        ),
        dosing: [
            DosingBlock(label: "ACLS VT/VF", body: "1–1.5 mg/kg IV bolus; repeat 0.5–0.75 mg/kg every 5–10 min as needed (max 3 mg/kg) per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "ACLS infusion (post-conversion)", body: "1–4 mg/min IV continuous per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Local infiltration", body: "Maximum dose 4.5 mg/kg (or 7 mg/kg with epinephrine; max ~300 mg adult without epi, ~500 mg with epi) per primary source.", citationIDs: ["openfda_round11"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to amide anesthetics; complete heart block, second-degree block (without pacemaker); sinus bradycardia (without pacing); Stokes-Adams syndrome; Adams-Stokes syndrome; severe SA / AV / intraventricular block; shock per primary source.",
            citationIDs: ["openfda_round11"]
        ),
        warnings: [
            AttributedBullet("CNS toxicity — perioral numbness → tinnitus → metallic taste → drowsiness / blurred vision → seizures → coma (signs of escalating systemic absorption); STOP infusion / injection immediately per primary source.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Cardiotoxicity at higher levels — bradycardia, conduction block, asystole, arrest.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Methemoglobinemia (reported with topical use).", citationIDs: ["openfda_round11"]),
            AttributedBullet("Local anesthetic systemic toxicity (LAST) — emergency; LIPID emulsion 20% per ASRA protocol.", citationIDs: ["openfda_round11"])
        ],
        adverseReactions: AttributedProse(
            "CNS — perioral numbness, tinnitus, drowsiness, seizures; Cardiac — bradycardia, hypotension, dysrhythmia at toxic levels.",
            citationIDs: ["openfda_round11"]
        ),
        drugInteractions: [
            AttributedBullet("Cimetidine, β-blockers — REDUCE hepatic clearance → raise lidocaine levels.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Other antiarrhythmics — additive cardiotoxicity; CV monitoring.", citationIDs: ["openfda_round11"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous cardiac monitoring during IV use; trend BP and mental status.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Verify NO epinephrine in lidocaine for digital / acral / penile blocks (vasoconstriction → necrosis).", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Document lidocaine administered in any procedure to track total dose if multiple sites.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("LAST emergency — IV lipid emulsion 20% (1.5 mL/kg bolus then 0.25 mL/kg/min infusion) plus standard ACLS per primary source.", citationIDs: ["openrn_pharm_round11"])
        ],
        patientTeaching: AttributedProse(
            "Tell us about ringing in the ears, dizziness, numbness around the mouth, or feeling \"strange\" — these can be early warning signs. Avoid hot foods / drinks for 1 hour after dental procedures (risk of biting injury under anesthesia).",
            citationIDs: ["openrn_pharm_round11"]
        ),
        citations: [openfda, openrnPharmR11, specialtyR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Procainamide

public enum ProcainamideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "procainamide",
        title: "Procainamide",
        subtitle: "Class IA antiarrhythmic · WPW with AFib · stable wide-complex tachycardia",
        category: "Class IA antiarrhythmic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Class IA Vaughan Williams (Na+ + K+ channel blocker)"),
            KeyValueRow(key: "Indication", value: "Stable wide-complex tachycardia of unknown origin; AFib with WPW; alternative to amiodarone in select cases"),
            KeyValueRow(key: "Endpoints (STOP infusion)", value: "Hypotension, QRS widens >50%, conversion, OR cumulative max 17 mg/kg per primary source"),
            KeyValueRow(key: "Notable", value: "Long-term — drug-induced lupus (anti-histone antibodies)")
        ],
        indications: AttributedProse(
            "Stable wide-complex tachycardia of uncertain origin; atrial fibrillation in the setting of Wolff-Parkinson-White syndrome; ventricular arrhythmias when amiodarone is contraindicated or unavailable per primary source.",
            citationIDs: ["openfda_round11", "specialty_round11"]
        ),
        mechanism: AttributedProse(
            "Blocks fast Na+ channels (slows phase 0) and K+ channels (prolongs phase 3 / repolarization) → slows conduction and prolongs refractory period in atrial, ventricular, and bypass-tract tissue.",
            citationIDs: ["openfda_round11"]
        ),
        dosing: [
            DosingBlock(label: "Loading", body: "20–50 mg/min IV until: hypotension, QRS widens >50%, dysrhythmia conversion, OR maximum 17 mg/kg per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Maintenance infusion", body: "1–4 mg/min IV continuous per primary source.", citationIDs: ["openfda_round11"])
        ],
        contraindications: AttributedProse(
            "Complete heart block; second-degree AV block without pacing; SLE; torsades / long QT; severe hypotension / shock; myasthenia gravis; hypersensitivity per primary source.",
            citationIDs: ["openfda_round11"]
        ),
        warnings: [
            AttributedBullet("Hypotension during IV loading — slow infusion; STOP for SBP fall ≥30 mmHg or to <90.", citationIDs: ["openfda_round11"]),
            AttributedBullet("QT prolongation → torsades de pointes; STOP for QRS widening >50% from baseline.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Drug-induced lupus syndrome (anti-histone Ab+) with chronic use — fever, arthralgia, malar rash; reversible on stopping.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Bone-marrow suppression — agranulocytosis, thrombocytopenia (rare); CBC monitoring with chronic use.", citationIDs: ["openfda_round11"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension, QT prolongation, dizziness, lupus-like syndrome (chronic), GI upset, agranulocytosis (rare).",
            citationIDs: ["openfda_round11"]
        ),
        drugInteractions: [
            AttributedBullet("Other antiarrhythmics + QT-prolonging drugs — additive QT effect.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Beta-blockers, calcium-channel blockers — additive cardiac depression.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Cimetidine — reduces clearance.", citationIDs: ["openfda_round11"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous cardiac monitor; BP every 1–2 minutes during IV loading; HOLD per stop criteria above.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Document baseline QRS / QTc; trend during infusion.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Long-term — annual CBC, ANA, anti-histone antibody.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Patient education on lupus-like signs — joint pain, rash, fever; report to provider.", citationIDs: ["openrn_pharm_round11"])
        ],
        patientTeaching: AttributedProse(
            "If you take this long-term, report any joint pain, rash, fever, or unusual fatigue. Get blood tests as scheduled. Tell every provider about all medications — many interact.",
            citationIDs: ["openrn_pharm_round11"]
        ),
        citations: [openfda, openrnPharmR11, specialtyR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sotalol

public enum SotalolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sotalol",
        title: "Sotalol",
        subtitle: "Betapace · Class III antiarrhythmic + nonselective β-blocker",
        category: "Class III antiarrhythmic / β-blocker",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Class III antiarrhythmic with β-blocker activity"),
            KeyValueRow(key: "Indications", value: "Maintenance of sinus rhythm in AFib / atrial flutter; ventricular arrhythmias"),
            KeyValueRow(key: "Initiation", value: "INPATIENT × 3 days with continuous cardiac monitoring per primary source — torsades risk"),
            KeyValueRow(key: "Notable", value: "Renal-dose adjusted; QT prolongation common")
        ],
        indications: AttributedProse(
            "Maintenance of normal sinus rhythm in symptomatic atrial fibrillation / flutter; ventricular arrhythmias (life-threatening) per primary source.",
            citationIDs: ["openfda_round11", "specialty_round11"]
        ),
        mechanism: AttributedProse(
            "Blocks K+ channels (Class III) → prolongs action potential and refractory period; also nonselective β1/β2 blockade → reduces HR and contractility.",
            citationIDs: ["openfda_round11"]
        ),
        dosing: [
            DosingBlock(label: "AFib / flutter (oral)", body: "Initial 80 mg PO BID; titrate every 3 days based on QTc and renal function; max 320 mg/day per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Renal impairment", body: "CrCl 40–60: every 24 hours; CrCl <40: not recommended per primary source.", citationIDs: ["openfda_round11"])
        ],
        contraindications: AttributedProse(
            "Sinus bradycardia <50 (without pacemaker); 2nd / 3rd degree AV block; long QT or QTc >450 (women) / >440 (men); severe HF; bronchospastic disease (asthma); CrCl <40 mL/min; hypokalemia; hypersensitivity per primary source.",
            citationIDs: ["openfda_round11"]
        ),
        warnings: [
            AttributedBullet("BOXED — torsades de pointes; INITIATE INPATIENT × 3 days with continuous cardiac monitoring per primary source.", citationIDs: ["openfda_round11"]),
            AttributedBullet("QT prolongation — discontinue if QTc >500 ms or 25% prolongation per primary source.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Bronchospasm — caution in COPD, AVOID in asthma.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Bradycardia, heart block, hypotension; HF exacerbation.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Masked hypoglycemia in DM.", citationIDs: ["openfda_round11"])
        ],
        adverseReactions: AttributedProse(
            "Bradycardia, dizziness, fatigue, dyspnea, chest pain, edema, QT prolongation, bronchospasm.",
            citationIDs: ["openfda_round11"]
        ),
        drugInteractions: [
            AttributedBullet("Other QT-prolonging drugs — additive risk; AVOID combinations.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Diuretics — hypokalemia worsens QT; replete K and Mg before initiation.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Calcium-channel blockers — additive AV nodal effects.", citationIDs: ["openfda_round11"])
        ],
        nursingImplications: [
            AttributedBullet("Inpatient monitoring × 3 days at initiation per primary source — measure QTc 2–4 hours after each dose.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Trend electrolytes — keep K >4.0 and Mg >2.0 to reduce torsades risk.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Daily BP, HR, QTc; education on warning signs.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Counsel patient — do NOT stop suddenly (rebound tachycardia / ischemia).", citationIDs: ["openrn_pharm_round11"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed; do not stop suddenly. Tell us about palpitations, fainting, severe dizziness, shortness of breath, or swelling. Get blood tests and ECGs as scheduled. Tell every provider you take this — interactions are common.",
            citationIDs: ["openrn_pharm_round11"]
        ),
        citations: [openfda, openrnPharmR11, specialtyR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ibutilide

public enum IbutilideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ibutilide",
        title: "Ibutilide",
        subtitle: "Corvert · Class III antiarrhythmic · acute AFib / flutter conversion",
        category: "Class III antiarrhythmic",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Class III antiarrhythmic"),
            KeyValueRow(key: "Indication", value: "Rapid pharmacologic conversion of recent-onset AFib / flutter (≤48 hours)"),
            KeyValueRow(key: "Monitoring", value: "Continuous cardiac monitoring + 4-hour observation post-infusion (torsades risk)"),
            KeyValueRow(key: "Pre-treatment", value: "Replete K >4.0 and Mg >2.0; magnesium IV often given prophylactically per primary source")
        ],
        indications: AttributedProse(
            "Rapid conversion of recent-onset (≤48 hours) atrial fibrillation or atrial flutter to sinus rhythm per primary source.",
            citationIDs: ["openfda_round11", "specialty_round11"]
        ),
        mechanism: AttributedProse(
            "Activates slow inward Na+ current and blocks delayed-rectifier K+ current → prolongs action-potential duration and refractory period — leads to atrial conversion.",
            citationIDs: ["openfda_round11"]
        ),
        dosing: [
            DosingBlock(label: "Adult ≥60 kg", body: "1 mg IV over 10 minutes; if no conversion in 10 min, repeat 1 mg over 10 min per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Adult <60 kg", body: "0.01 mg/kg IV over 10 min; may repeat.", citationIDs: ["openfda_round11"])
        ],
        contraindications: AttributedProse(
            "QTc >440 ms; history of polymorphic VT / torsades; hypokalemia / hypomagnesemia (correct first); congenital long QT; severe HF; hypersensitivity per primary source.",
            citationIDs: ["openfda_round11"]
        ),
        warnings: [
            AttributedBullet("Torsades de pointes — most concerning adverse effect (~4–8%); STOP infusion if QTc rises >440 or new dysrhythmia per primary source.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Pre-treat with IV magnesium 2 g in many institutions to reduce torsades risk per primary source.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Continuous cardiac monitoring required during AND for at least 4 hours after infusion per primary source.", citationIDs: ["openfda_round11"])
        ],
        adverseReactions: AttributedProse(
            "Torsades / non-sustained polymorphic VT, sustained polymorphic VT, hypotension, headache, nausea.",
            citationIDs: ["openfda_round11"]
        ),
        drugInteractions: [
            AttributedBullet("Other QT-prolonging drugs — STOP or hold prior; additive torsades risk.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Class IA / III antiarrhythmics — separate by ≥5 hours per primary source.", citationIDs: ["openfda_round11"])
        ],
        nursingImplications: [
            AttributedBullet("Verify K >4.0, Mg >2.0 prior to administration; replete first.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Continuous cardiac monitor (12-lead capable); document baseline QTc; recheck during and after infusion.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Anticoagulation per ACC/AHA — avoid pharmacologic cardioversion >48 hr without anticoag (CHADS-VASc) per primary source.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("4-hour minimum observation post-infusion; have crash cart and lipid emulsion (LAST?) — actually defibrillator + magnesium + amiodarone available.", citationIDs: ["openrn_pharm_round11"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps your heart return to a normal rhythm. We will monitor you closely on a heart monitor for several hours. Tell us right away about palpitations, dizziness, or fainting.",
            citationIDs: ["openrn_pharm_round11"]
        ),
        citations: [openfda, openrnPharmR11, specialtyR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Flecainide

public enum FlecainideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "flecainide",
        title: "Flecainide",
        subtitle: "Tambocor · Class IC antiarrhythmic · pill-in-pocket AFib (no SHD)",
        category: "Class IC antiarrhythmic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Class IC Vaughan Williams (potent Na+ blocker)"),
            KeyValueRow(key: "Indications", value: "Paroxysmal AFib / SVT in patients WITHOUT structural heart disease; \"pill-in-pocket\" approach"),
            KeyValueRow(key: "AVOID", value: "Structural heart disease (CAD / HF / LV dysfunction) — increased mortality (CAST trial) per primary source"),
            KeyValueRow(key: "Combine with", value: "AV nodal blocker (β-blocker / non-DHP CCB) to prevent 1:1 conversion of atrial flutter")
        ],
        indications: AttributedProse(
            "Paroxysmal supraventricular tachycardia, paroxysmal AFib in patients without structural heart disease; sustained ventricular tachycardia in patients without structural heart disease per primary source.",
            citationIDs: ["openfda_round11"]
        ),
        mechanism: AttributedProse(
            "Potent fast Na+ channel blocker → markedly slows phase 0 of cardiac action potential → slows conduction.",
            citationIDs: ["openfda_round11"]
        ),
        dosing: [
            DosingBlock(label: "AFib maintenance", body: "Initial 50 mg PO every 12 hr; titrate by 50 mg every 4 days; max 300 mg/day per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Pill-in-pocket (selected patients)", body: "200 mg (≥70 kg) or 300 mg PO single-dose at AFib onset for self-conversion per primary source — first dose under supervision.", citationIDs: ["openfda_round11"])
        ],
        contraindications: AttributedProse(
            "STRUCTURAL HEART DISEASE — CAD, prior MI, LVH, HF, LVEF <40% (boxed-equivalent — increased mortality); 2nd / 3rd degree AV block without pacing; right bundle branch block; cardiogenic shock; hypersensitivity per primary source.",
            citationIDs: ["openfda_round11"]
        ),
        warnings: [
            AttributedBullet("BOXED — increased mortality in patients with structural heart disease (CAST trial — post-MI patients on flecainide had higher mortality than placebo) per primary source.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Pro-arrhythmic — VT, VF, 1:1 atrial flutter conduction (combine with β-blocker / non-DHP CCB).", citationIDs: ["openfda_round11"]),
            AttributedBullet("Negative inotrope — caution in HF.", citationIDs: ["openfda_round11"]),
            AttributedBullet("CNS — dizziness, blurred vision; visual disturbance specifically.", citationIDs: ["openfda_round11"])
        ],
        adverseReactions: AttributedProse(
            "Dizziness, visual disturbance, dyspnea, headache, palpitations, conduction disturbance, pro-arrhythmia.",
            citationIDs: ["openfda_round11"]
        ),
        drugInteractions: [
            AttributedBullet("Other antiarrhythmics + β-blockers / CCBs — additive negative inotropy and conduction effects.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Digoxin — flecainide raises digoxin level by ~25%; monitor.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Amiodarone — increased flecainide level; reduce dose if combined.", citationIDs: ["openfda_round11"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm absence of structural heart disease (echo / stress test) before initiation.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Co-administer AV nodal blocker (β-blocker or diltiazem) to prevent 1:1 atrial-flutter conduction per primary source.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Follow ECG QRS duration; >25% widening = stop or reduce.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Pill-in-pocket — first dose given under monitored observation.", citationIDs: ["openrn_pharm_round11"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed; do not stop suddenly. Tell us about palpitations, fainting, blurred vision, or shortness of breath. Get follow-up ECGs as scheduled. Tell every provider about all medications.",
            citationIDs: ["openrn_pharm_round11"]
        ),
        citations: [openfda, openrnPharmR11, specialtyR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Etomidate

public enum EtomidateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "etomidate",
        title: "Etomidate",
        subtitle: "Amidate · imidazole sedative-hypnotic · RSI / procedural sedation",
        category: "Sedative-hypnotic (non-barbiturate)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Imidazole sedative-hypnotic"),
            KeyValueRow(key: "Use", value: "Induction for RSI; brief procedural sedation"),
            KeyValueRow(key: "Onset / duration", value: "30–60 sec onset; 5–15 minute duration"),
            KeyValueRow(key: "Notable", value: "Hemodynamically NEUTRAL — preferred for shock / cardiac patients; transient ADRENAL SUPPRESSION even after single dose")
        ],
        indications: AttributedProse(
            "Induction of anesthesia for rapid-sequence intubation; procedural sedation when hemodynamic stability is critical (shock, cardiac, head injury) per primary source.",
            citationIDs: ["openfda_round11", "specialty_round11"]
        ),
        mechanism: AttributedProse(
            "GABA-A receptor agonism → CNS depression. Minimal effect on cardiac contractility, vascular tone, or respiratory drive.",
            citationIDs: ["openfda_round11"]
        ),
        dosing: [
            DosingBlock(label: "RSI induction (adult)", body: "0.3 mg/kg IV over 30–60 seconds per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Pediatric ≥10 yr", body: "0.2–0.3 mg/kg IV per primary source.", citationIDs: ["openfda_round11"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to etomidate. Use cautiously in adrenal insufficiency (single-dose adrenal suppression of clinical concern in critically ill / septic shock) per primary source.",
            citationIDs: ["openfda_round11"]
        ),
        warnings: [
            AttributedBullet("Adrenal suppression — even single dose suppresses cortisol synthesis for ~6–24 hours; debate about clinical significance in septic shock; some institutions prefer ketamine in sepsis per primary source.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Myoclonic jerking during induction — common; benign but can be dramatic; co-administer paralytic.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Pain at injection site — common; use larger vein or pretreat with lidocaine.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Postoperative nausea / vomiting more common than with propofol.", citationIDs: ["openfda_round11"])
        ],
        adverseReactions: AttributedProse(
            "Myoclonus, injection-site pain, nausea / vomiting, transient adrenal suppression.",
            citationIDs: ["openfda_round11"]
        ),
        drugInteractions: [
            AttributedBullet("Other CNS depressants — additive sedation; reduce dose.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Opioids (fentanyl) — common combination; reduces myoclonus.", citationIDs: ["openfda_round11"])
        ],
        nursingImplications: [
            AttributedBullet("Pre-oxygenate; have airway equipment ready.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Push over 30–60 seconds (rapid push reduces myoclonus per some protocols).", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Co-administer paralytic for RSI (succinylcholine or rocuronium).", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("In septic shock, weigh adrenal suppression risk vs hemodynamic benefit; ketamine often preferred by ICU per primary source.", citationIDs: ["openrn_pharm_round11"])
        ],
        patientTeaching: AttributedProse(
            "This medicine puts you to sleep rapidly for the breathing tube. You may feel a brief burning at the IV site or muscle twitching — this is normal.",
            citationIDs: ["openrn_pharm_round11"]
        ),
        citations: [openfda, openrnPharmR11, specialtyR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Scopolamine

public enum ScopolamineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "scopolamine",
        title: "Scopolamine",
        subtitle: "Transderm Scōp · anticholinergic · motion sickness + EOL secretions",
        category: "Anticholinergic (antimuscarinic)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Belladonna alkaloid antimuscarinic"),
            KeyValueRow(key: "Indications", value: "Motion sickness; postoperative N/V; end-of-life respiratory secretions (\"death rattle\")"),
            KeyValueRow(key: "Forms", value: "Transdermal patch (1.5 mg, behind ear, lasts 72 hours); SQ / IV (less common)"),
            KeyValueRow(key: "Notable", value: "Strong anticholinergic — Beers list; confusion / delirium in older adults")
        ],
        indications: AttributedProse(
            "Prevention of nausea / vomiting from motion sickness or postoperative; off-label — control of upper-respiratory secretions in dying patients (\"death rattle\") per primary source.",
            citationIDs: ["openfda_round11", "specialty_round11"]
        ),
        mechanism: AttributedProse(
            "Competitively blocks muscarinic receptors centrally and peripherally → reduces vestibular nausea, salivary / bronchial secretions.",
            citationIDs: ["openfda_round11"]
        ),
        dosing: [
            DosingBlock(label: "Motion sickness (adult)", body: "1 patch (1.5 mg) behind ear at least 4 hours before exposure; replace every 72 hours per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Terminal secretions (off-label)", body: "1 patch every 72 hours; or 0.4 mg SQ / IV every 4–6 hours per primary source.", citationIDs: ["openfda_round11"])
        ],
        contraindications: AttributedProse(
            "Narrow-angle glaucoma; urinary retention; ileus; hypersensitivity. Caution in elderly (delirium / falls).",
            citationIDs: ["openfda_round11"]
        ),
        warnings: [
            AttributedBullet("Strong anticholinergic — Beers list; confusion / delirium especially in older adults.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Dry mouth, blurred vision, urinary retention, constipation, ileus.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Wash hands after applying patch — eye contamination → mydriasis.", citationIDs: ["openfda_round11"])
        ],
        adverseReactions: AttributedProse(
            "Dry mouth (very common), blurred vision, drowsiness, urinary retention, confusion (esp. older adults).",
            citationIDs: ["openfda_round11"]
        ),
        drugInteractions: [
            AttributedBullet("Other anticholinergics — additive effect; deliriogenic in older adults.", citationIDs: ["openfda_round11"]),
            AttributedBullet("CNS depressants — additive sedation.", citationIDs: ["openfda_round11"])
        ],
        nursingImplications: [
            AttributedBullet("Apply patch to clean dry hairless area behind ear; wash hands after; rotate sites if reapplying.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("In EOL — discuss with family that secretion noise is more distressing to them than to the patient; positioning and gentle suctioning may help; medications less effective once secretions are established per primary source.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Older adults — assess delirium risk; consider alternative.", citationIDs: ["openrn_pharm_round11"])
        ],
        patientTeaching: AttributedProse(
            "Apply patch behind the ear at least 4 hours before travel; wash hands after applying. Remove patch before MRI. May cause dry mouth and blurred vision. For terminal-care use, the patch helps reduce noisy breathing — this is more upsetting to family than to your loved one.",
            citationIDs: ["openrn_pharm_round11"]
        ),
        citations: [openfda, openrnPharmR11, specialtyR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hyoscyamine

public enum HyoscyamineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "hyoscyamine",
        title: "Hyoscyamine",
        subtitle: "Levsin / Levbid · anticholinergic · GI cramping + EOL secretions",
        category: "Anticholinergic (antimuscarinic)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Belladonna alkaloid antimuscarinic"),
            KeyValueRow(key: "Indications", value: "GI / GU cramping (IBS, biliary, renal), peptic ulcer adjunct, EOL secretions"),
            KeyValueRow(key: "Forms", value: "PO tablets / sublingual / oral solution / IM / IV / SQ"),
            KeyValueRow(key: "Notable", value: "Beers list — anticholinergic burden in older adults")
        ],
        indications: AttributedProse(
            "Symptomatic relief of GI / GU cramping (IBS, functional GI disorders, biliary, renal colic adjunct), adjunct in peptic ulcer; off-label — terminal secretions in EOL care per primary source.",
            citationIDs: ["openfda_round11", "specialty_round11"]
        ),
        mechanism: AttributedProse(
            "Antimuscarinic action — reduces smooth-muscle tone in GI, GU; reduces secretions.",
            citationIDs: ["openfda_round11"]
        ),
        dosing: [
            DosingBlock(label: "Cramping (adult)", body: "0.125–0.25 mg PO / SL every 4 hours as needed (max 1.5 mg/day) per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Terminal secretions", body: "0.125–0.25 mg SL or SQ every 4 hours per primary source.", citationIDs: ["openfda_round11"])
        ],
        contraindications: AttributedProse(
            "Narrow-angle glaucoma; obstructive uropathy; obstructive GI disease (paralytic ileus, intestinal atony); severe ulcerative colitis; toxic megacolon; myasthenia gravis; hypersensitivity per primary source.",
            citationIDs: ["openfda_round11"]
        ),
        warnings: [
            AttributedBullet("Anticholinergic effects — dry mouth, blurred vision, urinary retention, constipation, tachycardia, confusion (esp. older adults).", citationIDs: ["openfda_round11"]),
            AttributedBullet("Heat stroke risk in hot environments (impaired sweating).", citationIDs: ["openfda_round11"]),
            AttributedBullet("Beers list — caution in older adults.", citationIDs: ["openfda_round11"])
        ],
        adverseReactions: AttributedProse(
            "Dry mouth, dizziness, blurred vision, urinary retention, tachycardia, confusion.",
            citationIDs: ["openfda_round11"]
        ),
        drugInteractions: [
            AttributedBullet("Other anticholinergics — additive burden.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Antacids — REDUCE absorption; separate by 2 hours.", citationIDs: ["openfda_round11"])
        ],
        nursingImplications: [
            AttributedBullet("SL or oral solution — useful in patients unable to swallow tablets (EOL care).", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Counsel about anticholinergic side effects; assess for urinary retention.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("In EOL — discuss with family the goals and limitations of secretion management.", citationIDs: ["openrn_pharm_round11"])
        ],
        patientTeaching: AttributedProse(
            "Take before meals if for cramping. Sip water for dry mouth. Tell us about difficulty urinating, racing heartbeat, or new confusion.",
            citationIDs: ["openrn_pharm_round11"]
        ),
        citations: [openfda, openrnPharmR11, specialtyR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Megestrol

public enum MegestrolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "megestrol",
        title: "Megestrol",
        subtitle: "Megace · synthetic progestin · cancer + AIDS-related cachexia",
        category: "Synthetic progestin",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic progesterone analog"),
            KeyValueRow(key: "Indications", value: "Cancer / AIDS cachexia (appetite stimulation); palliative breast / endometrial cancer treatment"),
            KeyValueRow(key: "Concerns", value: "VTE risk; modest weight gain (mostly fat / fluid); adrenal suppression with prolonged use; mortality may be increased per Beers list"),
            KeyValueRow(key: "Notable", value: "Use cautiously in older adults — Beers list per primary source")
        ],
        indications: AttributedProse(
            "Treatment of anorexia / cachexia or unexplained weight loss in patients with AIDS or cancer; palliative treatment of advanced breast cancer (endometrial cancer) per primary source.",
            citationIDs: ["openfda_round11", "specialty_round11"]
        ),
        mechanism: AttributedProse(
            "Synthetic progestin — stimulates appetite via peripheral hypothalamic mechanisms; mechanism in cachexia not fully understood.",
            citationIDs: ["openfda_round11"]
        ),
        dosing: [
            DosingBlock(label: "Cachexia (adult)", body: "Megace ES (suspension) 625 mg PO daily OR Megace tablets / suspension 400–800 mg PO daily per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Breast cancer", body: "160 mg PO daily per primary source.", citationIDs: ["openfda_round11"])
        ],
        contraindications: AttributedProse(
            "Pregnancy (boxed — fetal harm); known thromboembolic disease; hypersensitivity per primary source.",
            citationIDs: ["openfda_round11"]
        ),
        warnings: [
            AttributedBullet("VTE / PE — significant risk; balance against modest benefit; consider VTE prophylaxis per provider per primary source.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Adrenal suppression — corticosteroid-like effects; do NOT stop abruptly after prolonged use.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Hyperglycemia / new-onset DM.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Beers list — risks may exceed benefits in older adults.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Fluid retention — may worsen HF.", citationIDs: ["openfda_round11"])
        ],
        adverseReactions: AttributedProse(
            "Weight gain (mostly fluid / fat, not lean mass), edema, hyperglycemia, thrombosis, mood changes, nausea.",
            citationIDs: ["openfda_round11"]
        ),
        drugInteractions: [
            AttributedBullet("Estrogen-containing products — antagonize.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Insulin / oral hypoglycemics — adjust for hyperglycemia.", citationIDs: ["openfda_round11"])
        ],
        nursingImplications: [
            AttributedBullet("Discuss expectations — modest appetite improvement; weight gain mostly fluid / fat, not muscle; significant VTE risk per primary source.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("DVT prophylaxis consideration; encourage activity if able.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Trend glucose; monitor for fluid retention, mood changes.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Goals-of-care discussion — may not be appropriate for very-end-of-life patients per primary source.", citationIDs: ["openrn_pharm_round11"])
        ],
        patientTeaching: AttributedProse(
            "This medicine may improve your appetite and help with some weight gain. It can increase clot risk — tell us about leg pain or swelling, chest pain, or shortness of breath. Get blood-sugar tested if you are diabetic.",
            citationIDs: ["openrn_pharm_round11"]
        ),
        citations: [openfda, openrnPharmR11, specialtyR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Methadone

public enum MethadoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "methadone",
        title: "Methadone",
        subtitle: "Methadose · long-acting opioid · OUD treatment + chronic pain",
        category: "Long-acting opioid",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "μ-opioid agonist + NMDA antagonist"),
            KeyValueRow(key: "Indications", value: "Opioid use disorder (must be in licensed Opioid Treatment Program for OUD); severe chronic pain"),
            KeyValueRow(key: "Notable", value: "Long, variable half-life (8–60+ hours) → ACCUMULATION + delayed peak effect; QT prolongation; respiratory depression days after dose change"),
            KeyValueRow(key: "ISMP", value: "High-alert medication; conversion ratio NOT 1:1 with other opioids; special expertise required")
        ],
        indications: AttributedProse(
            "Maintenance treatment of opioid use disorder (must be dispensed through licensed OTP for OUD per federal regulation); severe chronic pain when alternatives inadequate; medically supervised opioid withdrawal per primary source.",
            citationIDs: ["openfda_round11", "cdc_round11"]
        ),
        mechanism: AttributedProse(
            "Full μ-opioid receptor agonist + NMDA receptor antagonist + serotonin / norepinephrine reuptake inhibitor → analgesia + decreased opioid craving / withdrawal + neuropathic-pain modulation.",
            citationIDs: ["openfda_round11"]
        ),
        dosing: [
            DosingBlock(label: "OUD initiation (OTP)", body: "Initial 20–30 mg PO once daily; titrate by 5 mg every few days based on withdrawal / craving / sedation per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "OUD maintenance", body: "Typical effective dose 60–120 mg PO daily once stabilized per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Chronic pain (analgesia)", body: "Conservative starting dose 2.5 mg PO every 8–12 hours; titrate slowly with caution per primary source — methadone equianalgesic ratios are NOT linear.", citationIDs: ["openfda_round11"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; significant respiratory depression; acute / severe asthma without monitoring; GI obstruction; hypersensitivity per primary source.",
            citationIDs: ["openfda_round11"]
        ),
        warnings: [
            AttributedBullet("BOXED — life-threatening respiratory depression, especially during initiation, dose conversion, or with concomitant CNS depressants.", citationIDs: ["openfda_round11"]),
            AttributedBullet("BOXED — QT prolongation / torsades; baseline + periodic ECG; especially with high doses (>100 mg/day), other QT drugs, hypokalemia.", citationIDs: ["openfda_round11"]),
            AttributedBullet("BOXED — long half-life means peak effect lags initiation; rapid titration leads to overdose.", citationIDs: ["openfda_round11"]),
            AttributedBullet("BOXED — addiction / abuse / misuse risk; prescribed only by REMS-trained prescriber; OUD requires OTP.", citationIDs: ["openfda_round11"]),
            AttributedBullet("BOXED — risk of fatal overdose with co-administration with benzos / alcohol / other CNS depressants per primary source.", citationIDs: ["openfda_round11"])
        ],
        adverseReactions: AttributedProse(
            "Sedation, constipation, respiratory depression, QT prolongation, hyperhidrosis, sexual dysfunction, prolonged QTc.",
            citationIDs: ["openfda_round11"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors / inducers — significantly alter methadone level; coordinate carefully.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Other QT-prolonging drugs (haloperidol, ondansetron, quinolones) — additive QT.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Benzos, alcohol, sedatives, gabapentinoids — additive respiratory depression; FDA labeling now individualized rather than universal contraindication.", citationIDs: ["openfda_round11"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline ECG; recheck at 30 days, 1 year, then annually or with dose changes per primary source.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Co-prescribe naloxone for any patient on methadone; counsel patient and family.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Monitor for sedation accumulation over first 1–2 weeks of initiation / dose change.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Coordinate OUD care with OTP (Opioid Treatment Program) — federal SAMHSA registration required.", citationIDs: ["openrn_pharm_round11"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed. Even a small dose increase can build up over days and cause overdose — never adjust your own dose. Always carry naloxone. Avoid alcohol, benzodiazepines, and sleep medications unless your provider has explicitly discussed it. Tell every provider about all medications.",
            citationIDs: ["openrn_pharm_round11"]
        ),
        citations: [openfda, openrnPharmR11, cdcR11, specialtyR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Donepezil

public enum DonepezilSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "donepezil",
        title: "Donepezil",
        subtitle: "Aricept · cholinesterase inhibitor · all stages of Alzheimer's",
        category: "Acetylcholinesterase inhibitor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Reversible acetylcholinesterase inhibitor"),
            KeyValueRow(key: "Indication", value: "Mild-moderate-severe Alzheimer disease (FDA-approved across all stages)"),
            KeyValueRow(key: "Effect", value: "Modest cognitive / functional benefit; does not stop disease progression"),
            KeyValueRow(key: "Notable", value: "GI side effects + bradycardia / syncope; titrate slowly")
        ],
        indications: AttributedProse(
            "Treatment of mild, moderate, and severe Alzheimer disease per primary source.",
            citationIDs: ["openfda_round11", "specialty_round11"]
        ),
        mechanism: AttributedProse(
            "Reversibly inhibits acetylcholinesterase → increases synaptic acetylcholine in CNS → improves cholinergic neurotransmission impaired in Alzheimer disease.",
            citationIDs: ["openfda_round11"]
        ),
        dosing: [
            DosingBlock(label: "Initial", body: "5 mg PO once daily at bedtime per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Titration", body: "After 4–6 weeks, increase to 10 mg PO daily; in severe AD may further increase to 23 mg/day per primary source.", citationIDs: ["openfda_round11"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to donepezil or piperidine derivatives; relative contraindications: significant bradycardia / heart block, active peptic ulcer disease, severe asthma per primary source.",
            citationIDs: ["openfda_round11"]
        ),
        warnings: [
            AttributedBullet("Bradycardia, AV block, syncope — assess HR and history of fainting; ECG in higher-risk patients per primary source.", citationIDs: ["openfda_round11"]),
            AttributedBullet("GI upset — nausea, vomiting, diarrhea, anorexia (very common, dose-related).", citationIDs: ["openfda_round11"]),
            AttributedBullet("Increased gastric acid → ulcer / GI bleeding risk in patients with prior PUD.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Bronchospasm — caution in asthma / COPD.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Cholinergic effects — urinary urgency, sweating, increased secretions.", citationIDs: ["openfda_round11"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, nausea, vomiting, weight loss, anorexia, insomnia / vivid dreams, headache, dizziness, bradycardia.",
            citationIDs: ["openfda_round11"]
        ),
        drugInteractions: [
            AttributedBullet("Anticholinergics — antagonize donepezil's mechanism (and worsen cognition); minimize Beers anticholinergics.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Other cholinergics, neuromuscular blockers, β-blockers — additive bradycardia / cholinergic.", citationIDs: ["openfda_round11"])
        ],
        nursingImplications: [
            AttributedBullet("Take at bedtime to reduce GI upset and align with vivid-dream timing; with food OK if nausea.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Baseline HR; recheck after dose changes; assess for syncope.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Family education — modest expected benefit; reassess every 6–12 months for continued benefit; consider discontinuation if functional decline despite therapy per primary source.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Reduce anticholinergic burden in medication review.", citationIDs: ["openrn_pharm_round11"])
        ],
        patientTeaching: AttributedProse(
            "Take at bedtime. Take with food if you have nausea. May cause vivid dreams. Tell us about fainting, slow heartbeat, severe stomach pain, or black stools. Do not stop suddenly — talk to us first. Family caregivers: reassess benefit every 6–12 months with us.",
            citationIDs: ["openrn_pharm_round11"]
        ),
        citations: [openfda, openrnPharmR11, specialtyR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Memantine

public enum MemantineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "memantine",
        title: "Memantine",
        subtitle: "Namenda · NMDA-receptor antagonist · moderate-to-severe Alzheimer's",
        category: "NMDA receptor antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Uncompetitive NMDA receptor antagonist"),
            KeyValueRow(key: "Indication", value: "Moderate-to-severe Alzheimer disease (often combined with cholinesterase inhibitor)"),
            KeyValueRow(key: "Notable", value: "Generally well tolerated; renal excretion — adjust in renal impairment"),
            KeyValueRow(key: "Combo", value: "Namzaric — fixed combination memantine + donepezil")
        ],
        indications: AttributedProse(
            "Moderate-to-severe Alzheimer disease — often used in combination with cholinesterase inhibitor (donepezil) for additive benefit per primary source.",
            citationIDs: ["openfda_round11", "specialty_round11"]
        ),
        mechanism: AttributedProse(
            "Blocks excessive glutamate-mediated NMDA receptor activation that contributes to neuronal toxicity, while preserving normal physiologic glutamatergic signaling.",
            citationIDs: ["openfda_round11"]
        ),
        dosing: [
            DosingBlock(label: "Initial", body: "5 mg PO daily; titrate by 5 mg/week per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Target", body: "10 mg PO BID (immediate-release) OR 28 mg PO daily (extended-release) per primary source.", citationIDs: ["openfda_round11"]),
            DosingBlock(label: "Renal impairment (CrCl <30)", body: "5 mg BID maximum per primary source.", citationIDs: ["openfda_round11"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to memantine or amantadine.",
            citationIDs: ["openfda_round11"]
        ),
        warnings: [
            AttributedBullet("Generally well tolerated.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Caution in seizure disorder.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Renal impairment — dose adjustment.", citationIDs: ["openfda_round11"])
        ],
        adverseReactions: AttributedProse(
            "Dizziness, headache, confusion, constipation, hypertension, somnolence.",
            citationIDs: ["openfda_round11"]
        ),
        drugInteractions: [
            AttributedBullet("Other NMDA antagonists (amantadine, dextromethorphan, ketamine) — caution.", citationIDs: ["openfda_round11"]),
            AttributedBullet("Drugs that alkalinize urine (carbonic anhydrase inhibitors, bicarbonate) — reduce renal clearance, raise levels.", citationIDs: ["openfda_round11"])
        ],
        nursingImplications: [
            AttributedBullet("Slow titration; renal-dose adjustment.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Often added when cholinesterase inhibitor alone insufficient or for moderate-severe disease.", citationIDs: ["openrn_pharm_round11"]),
            AttributedBullet("Family education — modest cognitive / functional benefit; reassess every 6–12 months.", citationIDs: ["openrn_pharm_round11"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed; can be taken with or without food. Tell us about confusion that worsens, dizziness, or fainting. Reassess benefit with us every 6–12 months.",
            citationIDs: ["openrn_pharm_round11"]
        ),
        citations: [openfda, openrnPharmR11, specialtyR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}
