import Foundation

// Curator-model continuous-infusion (drip) entries — batch 4.
// Completes the titratable-infusion gaps: chronotropy (isoproterenol), OB and
// torsades (magnesium sulfate), decongestion (furosemide infusion), rapid BP
// control (clevidipine), osmotherapy (3% hypertonic saline), and hemostasis
// (tranexamic acid). Sources: openFDA SPL (CC0), Open RN Nursing Pharmacology
// (CC BY 4.0), ISMP high-alert list (concept citation). All dosing is
// reference information from labeling/protocol convention — never directive.
// Tier-A RN review pre-publication (magnesium, hypertonic saline, TXA
// intrathecal-error content especially).

private let openfda4 = CitationSource(
    id: "openfda_drips4",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-07-03"
)
private let openrn4 = CitationSource(
    id: "openrn_pharm_drips4",
    shortName: "Open RN Nursing Pharmacology & Health Alterations chapters",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-07-03"
)
private let ismp4 = CitationSource(
    id: "ismp_high_alert_2024_b4",
    shortName: "ISMP List of High-Alert Medications, 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-07-03"
)

// MARK: - Isoproterenol

public enum IsoproterenolDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "isoproterenol-drip",
        title: "Isoproterenol (continuous infusion)",
        subtitle: "Isuprel · nonselective beta agonist — bradyarrhythmia bridge, torsades",
        category: "Beta-Adrenergic Agonist",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Nonselective beta-1/beta-2 agonist"),
            KeyValueRow(key: "Effect", value: "Chronotropy + inotropy + vasodilation"),
            KeyValueRow(key: "Onset", value: "Immediate IV; very short duration"),
            KeyValueRow(key: "Signature", value: "Raises heart rate without alpha vasoconstriction")
        ],
        indications: AttributedProse(
            "Temporizing treatment of hemodynamically significant bradycardia and heart block unresponsive to atropine, as a bridge to pacing. Suppression of torsades de pointes recurrence by raising heart rate (which shortens the QT interval) when pacing is not yet available. Beta-blocker overdose per toxicology direction.",
            citationIDs: ["openfda_drips4", "openrn_pharm_drips4"]
        ),
        mechanism: AttributedProse(
            "Pure nonselective beta agonism: beta-1 increases heart rate, conduction velocity, and contractility; beta-2 dilates skeletal-muscle and splanchnic vasculature. The net picture is a faster heart with a wide pulse pressure — systolic up from inotropy, diastolic down from vasodilation.",
            citationIDs: ["openfda_drips4"]
        ),
        dosing: [
            DosingBlock(label: "Continuous infusion (reference)", body: "2–10 mcg/min IV titrated to heart-rate response per label/protocol.", citationIDs: ["openfda_drips4"]),
            DosingBlock(label: "Torsades suppression", body: "Titrated to the heart rate that suppresses pause-dependent recurrence per cardiology direction — the target is a rate, not a dose.", citationIDs: ["openrn_pharm_drips4"])
        ],
        contraindications: AttributedProse(
            "Tachyarrhythmias, digitalis-induced tachycardia, angina — increasing rate and demand in an already-ischemic or already-fast heart. Hypersensitivity.",
            citationIDs: ["openfda_drips4"]
        ),
        warnings: [
            AttributedBullet("Myocardial oxygen demand rises sharply — isoproterenol can convert bradycardia into ischemia in coronary disease; chest pain on the drip is a stop-and-call finding.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Diastolic hypotension from beta-2 vasodilation can undercut coronary perfusion even as the rate improves — watch the whole blood pressure, not just the heart rate.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Ventricular arrhythmias — the same automaticity boost that treats bradycardia can create ectopy and VT.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("This is a bridge, not a destination — the definitive answer to unstable bradycardia is pacing; escalation planning happens in parallel, not after.", citationIDs: ["openrn_pharm_drips4"])
        ],
        adverseReactions: AttributedProse(
            "Tachycardia, palpitations, ventricular ectopy, angina, flushing, tremor, headache, diastolic hypotension.",
            citationIDs: ["openfda_drips4"]
        ),
        drugInteractions: [
            AttributedBullet("Other sympathomimetics — additive arrhythmia risk.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Beta-blockers — pharmacologic antagonism (the interaction is sometimes the point in overdose).", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Agents that prolong QT — isoproterenol is treating the consequence; coordinate discontinuation of the offenders.", citationIDs: ["openrn_pharm_drips4"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification at start, rate change, and bag change (ISMP high-alert adrenergic agonist).", citationIDs: ["ismp_high_alert_2024_b4"]),
            AttributedBullet("Continuous ECG with a stated target heart rate on the order — titrate to it and document rhythm response and ectopy.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Frequent BP with attention to diastolic pressure; report chest pain immediately.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Keep transcutaneous pacing pads on the patient and the pacer checked — the bridge can fail without notice.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("In torsades, track the QT context (electrolytes, offending drugs held, magnesium given) — the drip is one leg of a multi-part plan.", citationIDs: ["openrn_pharm_drips4"])
        ],
        patientTeaching: AttributedProse(
            "This medication keeps your heart rate up while we arrange a longer-term solution such as a pacemaker. Tell us immediately about chest pain, palpitations, or lightheadedness.",
            citationIDs: ["openrn_pharm_drips4"]
        ),
        citations: [openfda4, openrn4, ismp4],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Magnesium sulfate

public enum MagnesiumSulfateDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "magnesium-sulfate-drip",
        title: "Magnesium sulfate (continuous infusion)",
        subtitle: "Eclampsia prophylaxis · torsades — the infusion with a monitoring ladder",
        category: "Electrolyte / Anticonvulsant Infusion",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Roles", value: "Preeclampsia/eclampsia seizure prophylaxis; torsades de pointes"),
            KeyValueRow(key: "Clearance", value: "Renal — oliguria means accumulation"),
            KeyValueRow(key: "Toxicity ladder", value: "Reflexes lost → respiratory depression → cardiac compromise"),
            KeyValueRow(key: "Antidote", value: "Calcium gluconate at the bedside per protocol")
        ],
        indications: AttributedProse(
            "Seizure prophylaxis in severe preeclampsia and treatment of eclamptic seizures (continued through delivery and typically 24 hours postpartum per protocol). Torsades de pointes. Severe hypomagnesemia repletion. Preterm fetal neuroprotection per OB protocol.",
            citationIDs: ["openfda_drips4", "openrn_pharm_drips4"]
        ),
        mechanism: AttributedProse(
            "Physiologic calcium antagonist and membrane stabilizer — raises the seizure threshold centrally, relaxes smooth muscle, slows neuromuscular transmission, and stabilizes cardiac repolarization (the torsades effect). The therapeutic actions and the toxicity are the same pharmacology at different concentrations.",
            citationIDs: ["openfda_drips4", "openrn_pharm_drips4"]
        ),
        dosing: [
            DosingBlock(label: "OB seizure prophylaxis (convention)", body: "Loading 4–6 g IV over 20–30 minutes, then 1–2 g/hr continuous, per institutional protocol.", citationIDs: ["openrn_pharm_drips4"]),
            DosingBlock(label: "Torsades", body: "1–2 g IV over minutes per ACLS-era/institutional protocol (faster in pulseless arrest).", citationIDs: ["openrn_pharm_drips4"]),
            DosingBlock(label: "Renal impairment", body: "Reduced maintenance and heightened monitoring — magnesium is renally excreted, and preeclampsia itself impairs renal function.", citationIDs: ["openfda_drips4"])
        ],
        contraindications: AttributedProse(
            "Myasthenia gravis (neuromuscular blockade). Heart block. Significant renal failure requires markedly modified dosing and monitoring per protocol.",
            citationIDs: ["openfda_drips4"]
        ),
        warnings: [
            AttributedBullet("Toxicity follows a ladder: deep tendon reflexes disappear first, respiratory depression second, cardiac conduction problems and arrest last. DTRs are the early-warning system — assess them on schedule, every time.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Urine output is the leading indicator — falling output on a renally-cleared infusion means rising levels at an unchanged pump rate.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Concurrent CNS depressants and neuromuscular blockers are potentiated.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Antepartum use crosses the placenta — neonatal team should know the exposure (hypotonia, respiratory depression in the newborn).", citationIDs: ["openfda_drips4"])
        ],
        adverseReactions: AttributedProse(
            "Flushing and warmth (very common, expected), nausea, drowsiness, hypotension with rapid administration; toxicity: absent reflexes, respiratory depression, bradycardia, heart block, arrest.",
            citationIDs: ["openfda_drips4"]
        ),
        drugInteractions: [
            AttributedBullet("Neuromuscular blockers — markedly potentiated blockade.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("CNS depressants (opioids, benzodiazepines) — additive sedation and respiratory depression.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Calcium-channel blockers — additive hypotension reported in OB settings.", citationIDs: ["openrn_pharm_drips4"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification at start, rate change, and bag change (ISMP high-alert); OB protocols commonly require an independent pump check.", citationIDs: ["ismp_high_alert_2024_b4"]),
            AttributedBullet("Run the full check on schedule, as a set: DTRs present, respiratory rate ≥12, urine output ≥ approximately 30 mL/hr, and normal level of consciousness — each element covers a different rung of the toxicity ladder.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Calcium gluconate immediately available at the bedside per protocol for the duration of the infusion.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("At any toxicity sign: stop the infusion, support airway and breathing, call for help, antidote per protocol — and maintain seizure precautions, because stopping magnesium doesn't treat the preeclampsia.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Serum levels per protocol; trend alongside the clinical ladder rather than instead of it.", citationIDs: ["openrn_pharm_drips4"])
        ],
        patientTeaching: AttributedProse(
            "This medication protects you from seizures related to high blood pressure in pregnancy. Feeling warm and flushed is normal. We will check your reflexes, breathing, and urine output frequently — that close attention is expected and keeps the medication safe.",
            citationIDs: ["openrn_pharm_drips4"]
        ),
        citations: [openfda4, openrn4, ismp4],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Furosemide infusion

public enum FurosemideDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "furosemide-drip",
        title: "Furosemide (continuous infusion)",
        subtitle: "Lasix · loop diuretic — steady decongestion in acute heart failure",
        category: "Loop Diuretic Infusion",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Loop diuretic (Na-K-2Cl inhibitor)"),
            KeyValueRow(key: "Why a drip", value: "Steadier diuresis, avoids peaks/troughs of large boluses"),
            KeyValueRow(key: "Watchlist", value: "K⁺, Mg²⁺, creatinine, hearing, volume status"),
            KeyValueRow(key: "Output goal", value: "Set per team — hourly UOP is the feedback loop")
        ],
        indications: AttributedProse(
            "Decongestion in acute decompensated heart failure and other volume-overloaded states when intermittent boluses give inadequate or erratic response, or when a controlled steady diuresis is preferred.",
            citationIDs: ["openfda_drips4", "openrn_pharm_drips4"]
        ),
        mechanism: AttributedProse(
            "Inhibits the Na-K-2Cl cotransporter in the thick ascending limb of Henle — profound natriuresis and diuresis, with potassium, magnesium, and calcium wasting as the direct cost. Effect depends on the drug reaching the tubule, so renal perfusion and function shape the response.",
            citationIDs: ["openfda_drips4"]
        ),
        dosing: [
            DosingBlock(label: "Continuous infusion (convention)", body: "IV bolus followed by continuous infusion commonly in the 5–20 mg/hr range, titrated to urine-output response per protocol.", citationIDs: ["openrn_pharm_drips4"]),
            DosingBlock(label: "Renal impairment", body: "Higher rates may be required for effect; balance against ototoxicity risk, which rises with dose and infusion rate.", citationIDs: ["openfda_drips4"])
        ],
        contraindications: AttributedProse(
            "Anuria. Hypersensitivity (caution with severe sulfonamide allergy per label discussion).",
            citationIDs: ["openfda_drips4"]
        ),
        warnings: [
            AttributedBullet("Electrolyte depletion — hypokalemia and hypomagnesemia are the expected tax; both are proarrhythmic, and replacement is part of running the drip, not an afterthought.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Ototoxicity — associated with high doses and rapid administration; continuous infusion at controlled rates reduces but does not eliminate the risk. New tinnitus or hearing change is a report-now finding.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Over-diuresis — hypotension, prerenal kidney injury, and hemoconcentration; the goal is decongestion, not desiccation.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Diminishing response can mean diuretic resistance — braking phenomena, poor renal perfusion, or inadequate tubular delivery; that's a team conversation, not just a rate increase.", citationIDs: ["openrn_pharm_drips4"])
        ],
        adverseReactions: AttributedProse(
            "Hypokalemia, hypomagnesemia, hyponatremia, metabolic alkalosis, hypotension, prerenal azotemia, ototoxicity (dose/rate-related), hyperglycemia, hyperuricemia.",
            citationIDs: ["openfda_drips4"]
        ),
        drugInteractions: [
            AttributedBullet("Digoxin — hypokalemia potentiates digoxin toxicity.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Aminoglycosides — additive ototoxicity.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("NSAIDs — blunt diuretic response and add renal risk.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Lithium — reduced clearance, toxicity risk.", citationIDs: ["openfda_drips4"])
        ],
        nursingImplications: [
            AttributedBullet("Hourly urine output against the stated goal — the infusion is a feedback loop and UOP is the signal; report both failure to respond and overshoot.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Scheduled electrolytes with replacement per protocol; correlate with ECG changes and ectopy.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Daily weight, strict intake/output, orthostatic and perfusion assessment — track the decongestion, not just the urine.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Creatinine trend — a modest rise may be tolerated per team goals; know the plan rather than reflexively stopping.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Ask about hearing changes and tinnitus at assessment; verify concentration and rate against pharmacy standard.", citationIDs: ["openrn_pharm_drips4"])
        ],
        patientTeaching: AttributedProse(
            "This continuous water pill removes the extra fluid straining your heart and lungs. Expect to urinate a lot — that is the goal. Tell us about dizziness, muscle cramps, or any change in your hearing.",
            citationIDs: ["openrn_pharm_drips4"]
        ),
        citations: [openfda4, openrn4],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Clevidipine

public enum ClevidipineDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "clevidipine-drip",
        title: "Clevidipine (continuous infusion)",
        subtitle: "Cleviprex · ultra-short dihydropyridine in a lipid emulsion",
        category: "IV Antihypertensive (Dihydropyridine CCB)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dihydropyridine calcium-channel blocker"),
            KeyValueRow(key: "Formulation", value: "20% lipid emulsion — milky white, handle like a lipid"),
            KeyValueRow(key: "Half-life", value: "~1 min initial phase — fastest offset of the IV antihypertensives"),
            KeyValueRow(key: "Clearance", value: "Blood esterases — independent of kidneys and liver")
        ],
        indications: AttributedProse(
            "Blood-pressure reduction when oral therapy is not feasible or rapid, finely titratable control is required — hypertensive emergencies, perioperative hypertension, and neuro settings where minute-to-minute control matters.",
            citationIDs: ["openfda_drips4", "openrn_pharm_drips4"]
        ),
        mechanism: AttributedProse(
            "Arterial-selective L-type calcium-channel blockade — reduces afterload without significant effect on venous capacitance or cardiac filling pressures. Metabolized by esterases in blood and tissue, so its offset is nearly immediate and independent of organ function.",
            citationIDs: ["openfda_drips4"]
        ),
        dosing: [
            DosingBlock(label: "Initiation and titration (label)", body: "1–2 mg/hr initially; dose may be doubled at short intervals (~90 seconds) early in titration, slowing as BP approaches goal. Most patients are controlled at 4–6 mg/hr; label maximums apply.", citationIDs: ["openfda_drips4"]),
            DosingBlock(label: "Transition", body: "When converting to oral therapy, overlap per label/protocol and monitor for rebound hypertension after discontinuation.", citationIDs: ["openfda_drips4"])
        ],
        contraindications: AttributedProse(
            "Allergy to soybeans, soy products, eggs, or egg products (lipid vehicle). Defective lipid metabolism (e.g., pathologic hyperlipemia, lipoid nephrosis, acute pancreatitis with hyperlipidemia). Severe aortic stenosis.",
            citationIDs: ["openfda_drips4"]
        ),
        warnings: [
            AttributedBullet("It is a lipid emulsion: strict aseptic technique, and the vial/tubing carry a 12-hour hang-time discipline per label once punctured — lipids grow organisms.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Counts as caloric lipid intake (~2 kcal/mL) — nutrition calculations and lipid-restriction contexts must include it, and prolonged high rates warrant triglyceride monitoring.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Reflex tachycardia can occur as afterload falls; hypotension from overshoot corrects quickly on rate reduction thanks to the ultra-short half-life.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Rebound hypertension after stopping — patients not transitioned to ongoing therapy need continued BP surveillance for at least several hours per label.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Heart-failure caution — negative effects on contractility are minimal but dihydropyridine vasodilation still demands monitoring in marginal hearts.", citationIDs: ["openfda_drips4"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension, reflex tachycardia, headache, nausea, atrial fibrillation reported in surgical populations; hypertriglyceridemia with prolonged use.",
            citationIDs: ["openfda_drips4"]
        ),
        drugInteractions: [
            AttributedBullet("Other antihypertensives and vasodilators — additive effect; deliberate in emergencies, but sequence and roles should be explicit.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Beta-blockers — no pharmacokinetic interaction, but clevidipine does not protect against beta-blocker-withdrawal rebound.", citationIDs: ["openfda_drips4"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous or very frequent BP monitoring (arterial line typical in emergencies) with a written target range — this drug moves pressure within a minute or two of any rate change.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Handle as a lipid: dedicated aseptic spike, no filters that block lipids per policy, invert gently to check for emulsion separation, and respect the 12-hour discard clock.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Log the lipid calories for nutrition and check triglycerides on prolonged infusions.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Watch heart rate alongside pressure — reflex tachycardia changes the plan in ischemic hearts.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Plan the landing: confirm the oral agent and overlap before weaning, and keep BP checks going after discontinuation for rebound.", citationIDs: ["openfda_drips4"])
        ],
        patientTeaching: AttributedProse(
            "This milky-looking medication lowers your blood pressure quickly and precisely, and its effect stops almost as soon as we stop it. Tell us about headache, flushing, or feeling your heart race.",
            citationIDs: ["openrn_pharm_drips4"]
        ),
        citations: [openfda4, openrn4],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Hypertonic saline 3%

public enum HypertonicSalineDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "hypertonic-saline-drip",
        title: "Hypertonic saline 3% (infusion)",
        subtitle: "Osmotherapy — cerebral edema, symptomatic hyponatremia",
        category: "Hypertonic Electrolyte Infusion",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "What it is", value: "NaCl 3% — roughly 3× the sodium of normal saline"),
            KeyValueRow(key: "Jobs", value: "Osmotic brain shrinkage; controlled sodium correction"),
            KeyValueRow(key: "Hard limit", value: "Sodium correction ceiling per protocol (~8–10 mEq/L per 24 hr)"),
            KeyValueRow(key: "Lab cadence", value: "Serial sodium every 4–6 hr while infusing")
        ],
        indications: AttributedProse(
            "Cerebral edema and elevated intracranial pressure per neurocritical protocol (bolus or continuous strategies). Severe symptomatic hyponatremia (seizures, coma) as small protocol-driven boluses to raise sodium just enough to stop the emergency.",
            citationIDs: ["openrn_pharm_drips4"]
        ),
        mechanism: AttributedProse(
            "Raises plasma osmolality, drawing water out of brain tissue across an intact blood–brain barrier — reducing brain volume and ICP. In hyponatremia, the same osmotic pull reverses cerebral edema; the danger is that correcting sodium faster than the brain can adapt causes osmotic demyelination.",
            citationIDs: ["openrn_pharm_drips4"]
        ),
        dosing: [
            DosingBlock(label: "Symptomatic hyponatremia (convention)", body: "Small IV boluses (commonly ~100–150 mL over 10–20 minutes, repeatable per protocol) targeting a modest initial sodium rise sufficient to abort seizures/herniation physiology.", citationIDs: ["openrn_pharm_drips4"]),
            DosingBlock(label: "Neuro osmotherapy (convention)", body: "Continuous infusion commonly in the 0.5–1 mL/kg/hr range titrated to sodium/osmolality goals per neurocritical protocol.", citationIDs: ["openrn_pharm_drips4"]),
            DosingBlock(label: "Correction ceiling", body: "Total sodium rise limited per protocol — commonly ≤8–10 mEq/L in any 24 hr — to avoid osmotic demyelination; the ceiling is the treatment plan's most important number.", citationIDs: ["openrn_pharm_drips4"])
        ],
        contraindications: AttributedProse(
            "Use extreme caution in volume-overloaded states (decompensated heart failure) and chronic asymptomatic hyponatremia, where slow correction strategies apply.",
            citationIDs: ["openrn_pharm_drips4"]
        ),
        warnings: [
            AttributedBullet("Osmotic demyelination syndrome — overly rapid correction of chronic hyponatremia causes delayed, often devastating neurologic injury days later. The at-risk patient is the chronic, adapted one; the ceiling exists for them.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("This is a concentrated electrolyte (ISMP high-alert class): pump administration, independent checks, and pharmacy-standard concentrations only — never gravity, never eyeballed.", citationIDs: ["ismp_high_alert_2024_b4"]),
            AttributedBullet("Vein injury and extravasation — hypertonic solutions are irritants; central access is preferred for continuous use, with peripheral administration per policy through a large vein and vigilant site checks.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Volume and chloride load — pulmonary edema in marginal hearts and hyperchloremic acidosis with sustained use.", citationIDs: ["openrn_pharm_drips4"])
        ],
        adverseReactions: AttributedProse(
            "Hypernatremia, hyperchloremic metabolic acidosis, volume overload/pulmonary edema, phlebitis and infusion-site injury, rebound ICP effects on abrupt discontinuation in osmotherapy contexts.",
            citationIDs: ["openrn_pharm_drips4"]
        ),
        drugInteractions: [
            AttributedBullet("Concurrent sodium-affecting therapies (diuretics, vasopressin analogs, large isotonic volumes) — all move the same number; coordinate so the correction stays inside the ceiling.", citationIDs: ["openrn_pharm_drips4"])
        ],
        nursingImplications: [
            AttributedBullet("Serial sodium on the ordered cadence (typically every 4–6 hr) — plot the trajectory against the 24-hour ceiling, and treat an early overshoot as urgent, not merely notable.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Two-nurse verification and pump-only administration; confirm the concentration on the bag matches the order — 3% and 0.9% look alike.", citationIDs: ["ismp_high_alert_2024_b4"]),
            AttributedBullet("Hourly neuro checks in both use cases — improvement is the goal, and new deterioration is data in either direction.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Site assessment every shift minimum for peripheral administration; escalate infiltration immediately.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Watch volume status — lung sounds, oxygen requirement, edema — the sodium is riding on saline.", citationIDs: ["openrn_pharm_drips4"])
        ],
        patientTeaching: AttributedProse(
            "This concentrated salt solution reduces swelling around the brain or corrects a dangerously low sodium level. We will check your blood frequently — the correction must happen at a carefully controlled speed, and those labs are how we steer.",
            citationIDs: ["openrn_pharm_drips4"]
        ),
        citations: [openrn4, ismp4],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Tranexamic acid

public enum TranexamicAcidDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tranexamic-acid-drip",
        title: "Tranexamic acid (IV infusion)",
        subtitle: "TXA · antifibrinolytic — trauma, postpartum hemorrhage",
        category: "Antifibrinolytic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Antifibrinolytic (lysine analog)"),
            KeyValueRow(key: "Action", value: "Stabilizes clots that have already formed"),
            KeyValueRow(key: "Time sensitivity", value: "Trauma benefit is front-loaded — early administration matters"),
            KeyValueRow(key: "Clearance", value: "Renal — dose adjustments in kidney impairment")
        ],
        indications: AttributedProse(
            "Significant traumatic hemorrhage per institutional massive-hemorrhage protocols (bolus followed by infusion, initiated early after injury). Postpartum hemorrhage per OB protocol. Labeled uses include heavy menstrual bleeding (oral) and short-term use in hemophilia dental procedures; the trauma/OB infusion roles are protocol-driven.",
            citationIDs: ["openfda_drips4", "openrn_pharm_drips4"]
        ),
        mechanism: AttributedProse(
            "Lysine analog that blocks plasminogen's lysine-binding sites, preventing its activation to plasmin on fibrin — fibrinolysis slows, and existing clot is preserved. TXA does not create clot; it defends the clot the patient has already made, which is why timing relative to bleeding onset matters.",
            citationIDs: ["openfda_drips4", "openrn_pharm_drips4"]
        ),
        dosing: [
            DosingBlock(label: "Trauma (institutional convention)", body: "1 g IV over ~10 minutes, followed by 1 g infused over 8 hours, initiated as early as possible per massive-hemorrhage protocol.", citationIDs: ["openrn_pharm_drips4"]),
            DosingBlock(label: "Postpartum hemorrhage (convention)", body: "1 g IV per OB hemorrhage protocol, with a repeat dose provision if bleeding continues per protocol.", citationIDs: ["openrn_pharm_drips4"]),
            DosingBlock(label: "Renal impairment", body: "Dose reduction per label — TXA is renally excreted and accumulates in kidney injury.", citationIDs: ["openfda_drips4"])
        ],
        contraindications: AttributedProse(
            "Active intravascular clotting (DIC with dominant thrombosis per specialist direction). History of seizure disorder is a label caution at high doses. Subarachnoid hemorrhage caution per label. Hypersensitivity.",
            citationIDs: ["openfda_drips4"]
        ),
        warnings: [
            AttributedBullet("Wrong-route catastrophe: TXA vials have been confused with local anesthetics and injected intrathecally — a frequently fatal error documented by ISMP. Segregated storage, barcode scanning, and reading the vial aloud during checks are the defenses.", citationIDs: ["ismp_high_alert_2024_b4", "openfda_drips4"]),
            AttributedBullet("Seizures — dose-associated, described especially with the high doses used in cardiac surgery; new seizure activity on TXA is a report-now finding.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Thromboembolic risk — the theoretical cost of defending clot; evaluate new limb swelling, chest pain, or hypoxia promptly.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Visual disturbances on prolonged exposure per label — relevant to extended courses, not single-protocol dosing.", citationIDs: ["openfda_drips4"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, diarrhea, hypotension with rapid IV push (infuse at protocol rate), seizures (dose-related), thromboembolic events (uncommon), visual disturbance with prolonged use.",
            citationIDs: ["openfda_drips4"]
        ),
        drugInteractions: [
            AttributedBullet("Prothrombotic agents (combined hormonal contraceptives, factor concentrates) — additive thrombosis risk per label.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Anticoagulants — pharmacodynamic opposition; concurrent use is a deliberate specialist decision.", citationIDs: ["openrn_pharm_drips4"])
        ],
        nursingImplications: [
            AttributedBullet("Verify drug, route, and line explicitly — TXA is IV; the intrathecal mix-up literature earns it a read-the-label-aloud habit.", citationIDs: ["ismp_high_alert_2024_b4"]),
            AttributedBullet("Infuse the bolus over the protocol interval, not as a rapid push — hypotension follows fast administration.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("In trauma/OB use, chart the time from injury/delivery to administration — the protocols are built around early dosing.", citationIDs: ["openrn_pharm_drips4"]),
            AttributedBullet("Monitor for seizure activity and for thromboembolic signals (unilateral swelling, dyspnea, chest pain) during and after the course.", citationIDs: ["openfda_drips4"]),
            AttributedBullet("Renal function check before continued dosing — accumulation raises the seizure risk.", citationIDs: ["openfda_drips4"])
        ],
        patientTeaching: AttributedProse(
            "This medication helps your body hold onto the blood clots that stop bleeding. Tell us about any new leg swelling, chest pain, trouble breathing, or changes in your vision.",
            citationIDs: ["openrn_pharm_drips4"]
        ),
        citations: [openfda4, openrn4, ismp4],
        lastSourceFidelityReview: "2026-07-03"
    )
}
