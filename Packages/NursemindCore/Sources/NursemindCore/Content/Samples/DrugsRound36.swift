import Foundation

// Curator-model drug entries (round 36 — tier-2 by-name gaps, part 1).
// Continuation of the round-35 coverage diff: propranolol (non-interchangeable
// nonselective uses), atenolol (renally-cleared beta-blocker), verapamil
// (non-DHP with its own interaction profile), amitriptyline (TCA prototype in
// daily neuropathic-pain use), celecoxib (the COX-2 selective). Sources:
// openFDA SPL (public domain), Open RN Pharmacology (CC BY 4.0).

private let openfdaR36 = CitationSource(
    id: "openfda_round36",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-07-03"
)
private let openrnPharmR36 = CitationSource(
    id: "openrn_pharm_round36",
    shortName: "Open RN Pharmacology + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-07-03"
)

// MARK: - Propranolol

public enum PropranololSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "propranolol",
        title: "Propranolol",
        subtitle: "Inderal · nonselective beta-blocker · migraine, tremor, thyroid storm, varices",
        category: "Beta-Blocker (Nonselective)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Nonselective beta-blocker (β1 + β2)"),
            KeyValueRow(key: "Distinction", value: "Lipophilic — crosses into the CNS"),
            KeyValueRow(key: "Asthma", value: "Avoid — β2 blockade provokes bronchospasm"),
            KeyValueRow(key: "Never stop abruptly", value: "Rebound tachycardia, angina, MI risk")
        ],
        indications: AttributedProse(
            "The beta-blocker whose uses metoprolol cannot cover: migraine prophylaxis, essential tremor, portal hypertension and variceal bleeding prophylaxis, thyroid storm adjunct (rate control plus partial blockade of peripheral T4→T3 conversion), and performance anxiety in common practice — alongside the classical hypertension/angina/arrhythmia labels.",
            citationIDs: ["openfda_round36", "openrn_pharm_round36"]
        ),
        mechanism: AttributedProse(
            "Blocks both β1 (heart — rate, contractility, conduction) and β2 (bronchial and vascular smooth muscle, metabolic effects) receptors. High lipophilicity carries it across the blood-brain barrier — the basis of both its CNS benefits (migraine, tremor, anxiety) and its CNS side effects (fatigue, vivid dreams, depression).",
            citationIDs: ["openfda_round36"]
        ),
        dosing: [
            DosingBlock(label: "Migraine prophylaxis", body: "80–240 mg/day per label, divided or as long-acting form; effect assessed over weeks.", citationIDs: ["openfda_round36"]),
            DosingBlock(label: "Essential tremor", body: "40 mg twice daily initially, titrated per label (commonly 120–320 mg/day).", citationIDs: ["openfda_round36"]),
            DosingBlock(label: "Variceal prophylaxis", body: "Titrated to heart-rate target per hepatology protocol.", citationIDs: ["openrn_pharm_round36"])
        ],
        contraindications: AttributedProse(
            "Asthma and bronchospastic disease (nonselective β2 blockade). Severe bradycardia, heart block greater than first degree, or cardiogenic shock. Decompensated heart failure.",
            citationIDs: ["openfda_round36"]
        ),
        warnings: [
            AttributedBullet("Abrupt discontinuation after chronic use can precipitate rebound tachycardia, angina, and MI in coronary disease — taper over 1–2 weeks per label.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Masks hypoglycemia more completely than cardioselective agents — tachycardia and tremor disappear; sweating persists. Diabetic patients need this taught explicitly.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Bronchospasm in any patient with reactive airway disease — ask about asthma before the first dose, every time.", citationIDs: ["openfda_round36"]),
            AttributedBullet("CNS effects — fatigue, sleep disturbance, vivid dreams, depression — are more common than with hydrophilic beta-blockers and drive discontinuation if unexplained.", citationIDs: ["openfda_round36"])
        ],
        adverseReactions: AttributedProse(
            "Bradycardia, hypotension, fatigue, dizziness, cold extremities, bronchospasm (susceptible patients), vivid dreams, depression, sexual dysfunction, masked hypoglycemia.",
            citationIDs: ["openfda_round36"]
        ),
        drugInteractions: [
            AttributedBullet("Verapamil/diltiazem — additive AV-node suppression; bradycardia and block.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Insulin and hypoglycemics — masked hypoglycemia awareness.", citationIDs: ["openfda_round36"]),
            AttributedBullet("CYP1A2/2D6 substrates and inhibitors alter levels (e.g., fluoxetine raises them).", citationIDs: ["openfda_round36"]),
            AttributedBullet("NSAIDs — blunted antihypertensive effect.", citationIDs: ["openfda_round36"])
        ],
        nursingImplications: [
            AttributedBullet("Apical pulse and BP before dosing; hold-and-notify parameters per order.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Screen for asthma/COPD history before initiation — the nonselective distinction is the point of this drug and its danger.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Diabetics: teach that sweating becomes the reliable hypoglycemia signal.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Reinforce never stopping abruptly, and ask about mood/sleep on chronic therapy.", citationIDs: ["openrn_pharm_round36"])
        ],
        patientTeaching: AttributedProse(
            "Take it consistently and never stop suddenly — your dose comes down gradually if it's ever discontinued. If you have diabetes, know that this medicine hides most low-sugar warning signs except sweating. Report wheezing, unusual fatigue, or mood changes.",
            citationIDs: ["openrn_pharm_round36"]
        ),
        citations: [openfdaR36, openrnPharmR36],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Atenolol

public enum AtenololSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "atenolol",
        title: "Atenolol",
        subtitle: "Tenormin · cardioselective beta-blocker · the renally-cleared one",
        category: "Beta-Blocker (Cardioselective)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Cardioselective (β1) beta-blocker"),
            KeyValueRow(key: "Distinction", value: "Renal clearance — dose falls with kidney function"),
            KeyValueRow(key: "CNS profile", value: "Hydrophilic — fewer sleep/mood effects"),
            KeyValueRow(key: "Dosing rhythm", value: "Once daily")
        ],
        indications: AttributedProse(
            "Hypertension and angina, with historical post-MI use. Still among the most-prescribed beta-blockers despite guideline drift toward other agents — millions of patients arrive on it, and its renal-clearance quirk is the fact that matters at the bedside.",
            citationIDs: ["openfda_round36"]
        ),
        mechanism: AttributedProse(
            "Selective β1 blockade at usual doses (selectivity fades as dose rises) — lowers heart rate, contractility, and renin release. Hydrophilic and renally excreted: it largely stays out of the CNS, and it accumulates as kidney function declines — the elderly patient whose heart rate keeps drifting down often has a creatinine story, not a cardiac one.",
            citationIDs: ["openfda_round36", "openrn_pharm_round36"]
        ),
        dosing: [
            DosingBlock(label: "Hypertension / angina", body: "25–100 mg PO once daily per label.", citationIDs: ["openfda_round36"]),
            DosingBlock(label: "Renal impairment", body: "Dose reduction and/or extended interval per label as creatinine clearance falls — the key atenolol-specific adjustment.", citationIDs: ["openfda_round36"])
        ],
        contraindications: AttributedProse(
            "Severe bradycardia, heart block greater than first degree, cardiogenic shock, decompensated heart failure.",
            citationIDs: ["openfda_round36"]
        ),
        warnings: [
            AttributedBullet("Renal accumulation — bradycardia and fatigue in CKD or acute kidney injury on a previously stable dose; reassess the dose whenever the creatinine moves.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Abrupt withdrawal risk (class): taper in coronary disease.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Cardioselectivity is relative — high doses reach β2; caution still applies in reactive airway disease.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Masks hypoglycemia (class effect), though sweating persists.", citationIDs: ["openfda_round36"])
        ],
        adverseReactions: AttributedProse(
            "Bradycardia, hypotension, fatigue, dizziness, cold extremities; fewer CNS effects than lipophilic agents.",
            citationIDs: ["openfda_round36"]
        ),
        drugInteractions: [
            AttributedBullet("Verapamil/diltiazem — additive AV suppression.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Clonidine — rebound hypertension interplay on withdrawal; sequence discontinuation carefully.", citationIDs: ["openfda_round36"]),
            AttributedBullet("NSAIDs — blunted antihypertensive effect.", citationIDs: ["openfda_round36"])
        ],
        nursingImplications: [
            AttributedBullet("Apical pulse and BP before dosing with hold parameters; correlate new bradycardia with renal function, not just the drug list.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Verify the dose against current creatinine on admission — home doses often predate the current kidneys.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Standard beta-blocker teaching: no abrupt discontinuation, positional care early in therapy.", citationIDs: ["openrn_pharm_round36"])
        ],
        patientTeaching: AttributedProse(
            "Take it once daily and don't stop it suddenly. Because your kidneys clear this medicine, tell every provider about kidney problems — the right dose can change when kidney function changes.",
            citationIDs: ["openrn_pharm_round36"]
        ),
        citations: [openfdaR36, openrnPharmR36],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Verapamil

public enum VerapamilSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "verapamil",
        title: "Verapamil",
        subtitle: "Calan · non-DHP calcium channel blocker · rate control with a constipation tax",
        category: "Calcium Channel Blocker (Non-Dihydropyridine)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-dihydropyridine CCB (cardiac-acting)"),
            KeyValueRow(key: "Distinguish from", value: "Amlodipine/nifedipine (vascular DHPs)"),
            KeyValueRow(key: "Hallmark side effect", value: "Constipation"),
            KeyValueRow(key: "Avoid in", value: "HFrEF — negative inotropy")
        ],
        indications: AttributedProse(
            "Rate control in atrial fibrillation/flutter, SVT (including IV use per protocol), angina, and hypertension; cluster-headache prophylaxis in specialty practice. The cardiac-acting counterpart to diltiazem, with a stronger negative-inotropic and constipating profile.",
            citationIDs: ["openfda_round36", "openrn_pharm_round36"]
        ),
        mechanism: AttributedProse(
            "Blocks L-type calcium channels preferentially in cardiac tissue — slows SA-node rate and AV-node conduction and reduces contractility, with modest vasodilation. The AV-node effect is the therapy in arrhythmias; the contractility effect is the danger in failing hearts.",
            citationIDs: ["openfda_round36"]
        ),
        dosing: [
            DosingBlock(label: "Oral", body: "Immediate-release 80–120 mg three times daily per label; sustained-release once–twice daily totals per label (commonly 180–480 mg/day).", citationIDs: ["openfda_round36"]),
            DosingBlock(label: "IV (SVT, monitored setting)", body: "Per protocol with continuous ECG and BP — hypotension and bradycardia are the acute risks.", citationIDs: ["openfda_round36"]),
            DosingBlock(label: "Hepatic impairment", body: "Reduce — extensively hepatically metabolized.", citationIDs: ["openfda_round36"])
        ],
        contraindications: AttributedProse(
            "Severe LV dysfunction / decompensated heart failure. Hypotension or cardiogenic shock. Sick sinus syndrome or second/third-degree block without a pacemaker. Atrial fibrillation with an accessory pathway (WPW) — AV blockade can accelerate conduction down the bypass tract.",
            citationIDs: ["openfda_round36"]
        ),
        warnings: [
            AttributedBullet("Beta-blocker combinations compound AV-node suppression — bradycardia and block; the combination is occasionally intentional and always deliberate.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Negative inotropy — worsens HFrEF; amlodipine is the CCB that heart failure tolerates, not verapamil.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Constipation is near-universal enough to plan for — in older adults it becomes impaction and delirium; a bowel regimen belongs in the conversation.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Raises digoxin levels; strong CYP3A4 inhibitor interactions run both directions (and grapefruit juice raises verapamil).", citationIDs: ["openfda_round36"])
        ],
        adverseReactions: AttributedProse(
            "Constipation, bradycardia, hypotension, AV block, peripheral edema, dizziness, gingival hyperplasia (rare), worsened heart failure.",
            citationIDs: ["openfda_round36"]
        ),
        drugInteractions: [
            AttributedBullet("Beta-blockers — additive AV suppression.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Digoxin — levels rise; watch for toxicity.", citationIDs: ["openfda_round36"]),
            AttributedBullet("CYP3A4 inhibitors/inducers and substrates (statins — simvastatin dose caps apply); grapefruit juice.", citationIDs: ["openfda_round36"])
        ],
        nursingImplications: [
            AttributedBullet("Pulse and BP before dosing; ECG monitoring for IV use.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Ask about bowel patterns at every assessment on chronic therapy — patients rarely volunteer it.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Review the MAR for beta-blockers and digoxin whenever verapamil starts.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Confirm ejection-fraction context before administration in any patient with heart-failure history.", citationIDs: ["openrn_pharm_round36"])
        ],
        patientTeaching: AttributedProse(
            "This slows and steadies your heart. Constipation is its most common side effect — fluids, fiber, and telling us early all help. Avoid grapefruit juice, and don't stop the medicine abruptly.",
            citationIDs: ["openrn_pharm_round36"]
        ),
        citations: [openfdaR36, openrnPharmR36],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Amitriptyline

public enum AmitriptylineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "amitriptyline",
        title: "Amitriptyline",
        subtitle: "Elavil · TCA prototype · low-dose neuropathic pain workhorse",
        category: "Tricyclic Antidepressant",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Tertiary-amine tricyclic antidepressant"),
            KeyValueRow(key: "Modern role", value: "Low-dose neuropathic pain, migraine prophylaxis, sleep"),
            KeyValueRow(key: "Burden", value: "Strongly anticholinergic + sedating — Beers drug"),
            KeyValueRow(key: "Overdose", value: "Lethal — see TCA overdose entry")
        ],
        indications: AttributedProse(
            "Labeled for depression, but modern bedside use is mostly low-dose: neuropathic pain (diabetic neuropathy, post-herpetic neuralgia), migraine prophylaxis, fibromyalgia, and insomnia in common practice. The doses differ by an order of magnitude — knowing which regimen a patient is on changes every expectation.",
            citationIDs: ["openfda_round36", "openrn_pharm_round36"]
        ),
        mechanism: AttributedProse(
            "Inhibits serotonin and norepinephrine reuptake (the antidepressant and pain-modulating action) while also blocking muscarinic, histaminic, and alpha-1 receptors (the side-effect burden) and cardiac sodium channels (the overdose lethality). Pain benefit at low dose arrives over 1–2 weeks and does not require antidepressant-range dosing.",
            citationIDs: ["openfda_round36"]
        ),
        dosing: [
            DosingBlock(label: "Neuropathic pain / migraine (common practice)", body: "10–25 mg PO at bedtime, titrated gradually as tolerated.", citationIDs: ["openrn_pharm_round36"]),
            DosingBlock(label: "Depression (label)", body: "75–150 mg/day ranges per label, divided or at bedtime; up to 300 mg/day in hospitalized settings.", citationIDs: ["openfda_round36"]),
            DosingBlock(label: "Elderly", body: "Lowest possible doses if used at all — Beers-criteria medication; safer alternatives usually exist.", citationIDs: ["openrn_pharm_round36"])
        ],
        contraindications: AttributedProse(
            "Recent MI. Concurrent or recent (14-day) MAOI therapy. Known hypersensitivity. Caution in glaucoma, urinary retention, seizure disorders, and cardiac conduction disease.",
            citationIDs: ["openfda_round36"]
        ),
        warnings: [
            AttributedBullet("Overdose lethality: a one-week supply at antidepressant doses can be fatal (sodium-channel blockade → arrhythmias) — prescribing and dispensing quantities matter in patients with self-harm risk. See the TCA overdose entry.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Boxed warning (antidepressant class): suicidality in young people — monitor early therapy.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Anticholinergic load: dry mouth, constipation, urinary retention, blurred vision, cognitive impairment — additive with the rest of the medication list, and the reason it's a Beers drug.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Orthostatic hypotension and sedation — fall risk; bedtime dosing is both the therapy schedule and the safety measure.", citationIDs: ["openfda_round36"]),
            AttributedBullet("QT prolongation — baseline ECG in cardiac disease and with other QT drugs per practice.", citationIDs: ["openfda_round36"])
        ],
        adverseReactions: AttributedProse(
            "Sedation, dry mouth, constipation, urinary retention, blurred vision, orthostatic hypotension, weight gain, tachycardia, QT prolongation, confusion in the elderly.",
            citationIDs: ["openfda_round36"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — contraindicated (serotonin syndrome, hypertensive reactions).", citationIDs: ["openfda_round36"]),
            AttributedBullet("Other serotonergic drugs — serotonin syndrome risk.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Anticholinergics, antihistamines — additive burden.", citationIDs: ["openfda_round36"]),
            AttributedBullet("CYP2D6 inhibitors (fluoxetine, bupropion) — raise TCA levels.", citationIDs: ["openfda_round36"])
        ],
        nursingImplications: [
            AttributedBullet("Clarify the indication and expected dose range on reconciliation — 25 mg at bedtime for neuropathy is a different therapy than 150 mg for depression.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Falls and orthostatic precautions; bowel and bladder surveillance in older adults.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Assess mood and self-harm risk, and flag large supplies in at-risk patients.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Set expectations: pain benefit builds over 1–2 weeks; sedation often improves.", citationIDs: ["openrn_pharm_round36"])
        ],
        patientTeaching: AttributedProse(
            "Take it at bedtime — drowsiness is expected and often useful. Dry mouth and constipation are common; fluids and fiber help. It takes a week or two to help nerve pain, so don't judge it by the first nights. Never take extra doses.",
            citationIDs: ["openrn_pharm_round36"]
        ),
        citations: [openfdaR36, openrnPharmR36],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Celecoxib

public enum CelecoxibSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "celecoxib",
        title: "Celecoxib",
        subtitle: "Celebrex · COX-2 selective NSAID · gentler stomach, same kidneys and heart",
        category: "NSAID (COX-2 Selective)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "COX-2 selective NSAID"),
            KeyValueRow(key: "Advantage", value: "Less GI ulceration; no platelet inhibition"),
            KeyValueRow(key: "Unchanged risks", value: "Cardiovascular and renal — full class warnings"),
            KeyValueRow(key: "Allergy note", value: "Sulfonamide moiety — caution with sulfa allergy")
        ],
        indications: AttributedProse(
            "Osteoarthritis, rheumatoid arthritis, ankylosing spondylitis, acute pain, and dysmenorrhea — chosen when GI risk or the need to preserve platelet function argues against nonselective NSAIDs (e.g., patients on anticoagulants needing an anti-inflammatory, per prescriber judgment).",
            citationIDs: ["openfda_round36"]
        ),
        mechanism: AttributedProse(
            "Selective COX-2 inhibition spares COX-1 — preserving gastric mucosal prostaglandins (less ulceration) and platelet thromboxane (no bleeding-time effect). The kidney and the cardiovascular system depend on both isoforms, so those class risks remain intact.",
            citationIDs: ["openfda_round36", "openrn_pharm_round36"]
        ),
        dosing: [
            DosingBlock(label: "Osteoarthritis", body: "200 mg PO once daily or 100 mg twice daily per label.", citationIDs: ["openfda_round36"]),
            DosingBlock(label: "Acute pain", body: "400 mg initially, then 200 mg per label schedule on day one; 200 mg twice daily thereafter.", citationIDs: ["openfda_round36"]),
            DosingBlock(label: "Poor CYP2C9 metabolizers / hepatic impairment", body: "Reduce per label.", citationIDs: ["openfda_round36"])
        ],
        contraindications: AttributedProse(
            "Aspirin-exacerbated respiratory disease. Peri-CABG pain. Known sulfonamide, aspirin, or NSAID hypersensitivity reactions. Third-trimester pregnancy.",
            citationIDs: ["openfda_round36"]
        ),
        warnings: [
            AttributedBullet("Boxed warnings (class): cardiovascular thrombotic risk — the concern that removed other coxibs from the market — and GI bleeding, which is reduced, not eliminated.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Renal effects are fully present: AKI risk in CKD, dehydration, heart failure, and the ACE-inhibitor/ARB + diuretic combination.", citationIDs: ["openfda_round36"]),
            AttributedBullet("No platelet effect means no cardioprotection — patients who stopped aspirin because 'Celebrex covers it' have it backwards.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Sulfonamide caution — clarify the actual sulfa reaction history rather than reflexively withholding.", citationIDs: ["openfda_round36"])
        ],
        adverseReactions: AttributedProse(
            "Dyspepsia, abdominal pain, diarrhea, edema, hypertension, AKI, rash; GI bleeding less frequent than nonselective NSAIDs but real.",
            citationIDs: ["openfda_round36"]
        ),
        drugInteractions: [
            AttributedBullet("Warfarin — monitor INR on initiation despite the platelet-sparing profile; bleeding events are reported.", citationIDs: ["openfda_round36"]),
            AttributedBullet("ACE-I/ARB + diuretics — renal risk and blunted effect.", citationIDs: ["openfda_round36"]),
            AttributedBullet("CYP2C9 inhibitors (fluconazole) — raise celecoxib levels; celecoxib inhibits CYP2D6.", citationIDs: ["openfda_round36"]),
            AttributedBullet("Lithium — levels rise.", citationIDs: ["openfda_round36"])
        ],
        nursingImplications: [
            AttributedBullet("Same renal vigilance as any NSAID: creatinine, urine output, BP — selectivity spares the stomach, not the kidney.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Clarify aspirin status in cardiac patients — celecoxib is not an antiplatelet.", citationIDs: ["openrn_pharm_round36"]),
            AttributedBullet("Take the sulfa-allergy history precisely; document the reaction, not just the label.", citationIDs: ["openrn_pharm_round36"])
        ],
        patientTeaching: AttributedProse(
            "This anti-inflammatory is easier on the stomach than ibuprofen but works the same way on your kidneys and blood pressure — report swelling or decreased urination. It does not protect your heart the way aspirin does; don't change aspirin without asking.",
            citationIDs: ["openrn_pharm_round36"]
        ),
        citations: [openfdaR36, openrnPharmR36],
        lastSourceFidelityReview: "2026-07-03"
    )
}
