import Foundation

// Curator-model continuous-infusion (drip) entries (v1.5 expansion).
// Sources: openFDA SPL (CC0), Open RN Nursing Pharmacology (CC BY 4.0),
// SCCM (concept citation), ISMP high-alert (concept citation).

private let openfda = CitationSource(
    id: "openfda_drips2",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_pharm_drips2",
    shortName: "Open RN Nursing Pharmacology — Critical Care",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=critical+care+vasopressor+sedation",
    lastRetrieved: "2026-05-04"
)
private let ismp = CitationSource(
    id: "ismp_high_alert_2024",
    shortName: "ISMP List of High-Alert Medications, 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)

// MARK: - Fentanyl Drip

public enum FentanylDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "fentanyl-drip",
        title: "Fentanyl (continuous infusion)",
        subtitle: "Synthetic opioid analgesic — ICU sedation/analgesia",
        category: "Opioid Analgesic Drip",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic μ-opioid agonist"),
            KeyValueRow(key: "Onset", value: "Immediate IV"),
            KeyValueRow(key: "Half-life (single dose)", value: "2–4 hr; context-sensitive HL increases with prolonged infusion"),
            KeyValueRow(key: "Concentration", value: "Typical 10–50 mcg/mL")
        ],
        indications: AttributedProse(
            "Continuous IV analgesia in critically ill patients (intubated, post-op, end-of-life). Adjunct to sedation in mechanically ventilated patients.",
            citationIDs: ["openfda_drips2"]
        ),
        mechanism: AttributedProse(
            "Selective μ-opioid receptor agonist; provides analgesia, sedation, respiratory depression. Highly lipophilic — rapid onset, redistribution from CNS limits single-dose duration but accumulates with continuous infusion.",
            citationIDs: ["openfda_drips2", "openrn_pharm_drips2"]
        ),
        dosing: [
            DosingBlock(label: "Bolus (loading)", body: "25–100 mcg IV; titrate to effect in 5-min increments.", citationIDs: ["openfda_drips2"]),
            DosingBlock(label: "Continuous infusion", body: "25–200 mcg/hr; titrate to RASS, CPOT, or BPS pain/sedation goal.", citationIDs: ["openfda_drips2"]),
            DosingBlock(label: "Renal/hepatic impairment", body: "Decrease dose and titrate slowly; metabolite is inactive but accumulation possible.", citationIDs: ["openfda_drips2"])
        ],
        contraindications: AttributedProse(
            "Severe respiratory depression without airway support. Hypersensitivity to fentanyl. Concurrent or recent (14 days) MAOI.",
            citationIDs: ["openfda_drips2"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: addiction, abuse, life-threatening respiratory depression. Concurrent benzodiazepines or other CNS depressants → fatal respiratory depression risk.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Chest wall rigidity ('wooden chest') — high-dose rapid bolus can cause skeletal muscle and chest wall rigidity, impairing ventilation.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Tolerance and physical dependence develop rapidly — anticipate withdrawal with abrupt discontinuation; taper after >5 days.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Bradycardia and hypotension, especially in hypovolemic patients.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Context-sensitive half-time — duration of action increases significantly with prolonged infusion (lipophilic accumulation).", citationIDs: ["openrn_pharm_drips2"])
        ],
        adverseReactions: AttributedProse(
            "Respiratory depression, sedation, hypotension, bradycardia, ileus, urinary retention, pruritus, tolerance/dependence, withdrawal on discontinuation, chest wall rigidity (rare).",
            citationIDs: ["openfda_drips2"]
        ),
        drugInteractions: [
            AttributedBullet("Benzodiazepines, propofol, dexmedetomidine — additive sedation/respiratory depression.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("MAOIs — serotonin syndrome.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("CYP3A4 inhibitors — raise fentanyl levels.", citationIDs: ["openfda_drips2"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification at start, rate change, and bag change (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Continuous SpO2, capnography (when intubated/sedated), HR, BP, RR.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Use a validated pain (CPOT, BPS) and sedation (RASS) tool every 2–4 hours.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Daily sedation interruption ('sedation vacation') per protocol — assess for spontaneous awakening trial.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Bowel regimen and skin assessment with prolonged immobility.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Naloxone available for over-sedation; titrate carefully — full reversal precipitates withdrawal in tolerant patients.", citationIDs: ["openrn_pharm_drips2"])
        ],
        patientTeaching: AttributedProse(
            "This continuous medication helps keep you comfortable while you are critically ill. After you no longer need it, your team will reduce it slowly to prevent withdrawal symptoms.",
            citationIDs: ["openrn_pharm_drips2"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ketamine Drip

public enum KetamineDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ketamine-drip",
        title: "Ketamine (continuous infusion)",
        subtitle: "Ketalar · NMDA antagonist — analgesia, sedation, refractory status asthmaticus",
        category: "Dissociative Sedative-Analgesic",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "NMDA receptor antagonist"),
            KeyValueRow(key: "Onset", value: "30 sec IV"),
            KeyValueRow(key: "Half-life", value: "2–3 hr"),
            KeyValueRow(key: "Hemodynamics", value: "Sympathomimetic — preserves HR/BP unlike most sedatives")
        ],
        indications: AttributedProse(
            "Procedural sedation. Adjunct analgesia in opioid-tolerant patients (low-dose drip). ICU sedation when hemodynamic stability matters. Refractory status asthmaticus (bronchodilator effect). Refractory depression (subspecialty use).",
            citationIDs: ["openfda_drips2"]
        ),
        mechanism: AttributedProse(
            "Non-competitive NMDA receptor antagonist — produces dissociative anesthesia, analgesia, and bronchodilation while preserving airway reflexes and sympathetic tone.",
            citationIDs: ["openfda_drips2", "openrn_pharm_drips2"]
        ),
        dosing: [
            DosingBlock(label: "Procedural sedation", body: "1–2 mg/kg IV slow over 60 sec, repeat 0.5–1 mg/kg as needed.", citationIDs: ["openfda_drips2"]),
            DosingBlock(label: "Sub-anesthetic analgesia (drip)", body: "0.1–0.3 mg/kg/hr continuous IV — adjuvant to opioid; reduces opioid requirements.", citationIDs: ["openrn_pharm_drips2"]),
            DosingBlock(label: "ICU sedation", body: "0.5–2 mg/kg/hr titrated to RASS goal.", citationIDs: ["openrn_pharm_drips2"]),
            DosingBlock(label: "Status asthmaticus", body: "1–2 mg/kg loading, then 0.5–1.5 mg/kg/hr (per institution).", citationIDs: ["openrn_pharm_drips2"])
        ],
        contraindications: AttributedProse(
            "Conditions where significant rise in BP would be hazardous (severe HTN, increased ICP, aortic dissection — relative; long-debated). Active psychosis. Hypersensitivity.",
            citationIDs: ["openfda_drips2"]
        ),
        warnings: [
            AttributedBullet("Emergence reactions — vivid dreams, hallucinations, dissociation; minimized by quiet recovery and benzodiazepine prophylaxis if needed.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Sympathomimetic — hypertension, tachycardia; usually a benefit in shock but caution in coronary disease.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Increased oral secretions — may need anti-sialogogue (glycopyrrolate) for procedural use.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Laryngospasm rare but possible — maintain airway readiness.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Long-term use: cystitis (chronic recreational use); hepatotoxicity reported.", citationIDs: ["openfda_drips2"])
        ],
        adverseReactions: AttributedProse(
            "Hypertension, tachycardia, increased secretions, emergence delirium, nausea/vomiting, nystagmus, transient apnea after rapid bolus, laryngospasm (rare).",
            citationIDs: ["openfda_drips2"]
        ),
        drugInteractions: [
            AttributedBullet("Benzodiazepines — reduce emergence reactions; additive sedation.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Theophylline — may lower seizure threshold.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Antihypertensives — additive hypotension at higher doses.", citationIDs: ["openfda_drips2"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Continuous cardiac, BP, SpO2 monitoring; capnography in non-intubated procedural use.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Quiet recovery environment to reduce emergence reactions; reorientation as patient awakens.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Suction available for increased secretions.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Document opioid-sparing effect when used as analgesic adjuvant.", citationIDs: ["openrn_pharm_drips2"])
        ],
        patientTeaching: AttributedProse(
            "This medication may make you feel like you are floating or having vivid dreams during the procedure. We will be with you the whole time. After it wears off, those feelings go away.",
            citationIDs: ["openrn_pharm_drips2"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Esmolol Drip

public enum EsmololDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "esmolol-drip",
        title: "Esmolol (continuous infusion)",
        subtitle: "Brevibloc · ultra-short-acting cardioselective β-blocker",
        category: "Beta-blocker Drip",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Cardioselective β1-blocker"),
            KeyValueRow(key: "Onset", value: "1–2 minutes"),
            KeyValueRow(key: "Half-life", value: "9 minutes (ultra-short)"),
            KeyValueRow(key: "Use", value: "Acute SVT, perioperative HTN/tachycardia, aortic dissection rate control")
        ],
        indications: AttributedProse(
            "Rate control in supraventricular tachycardia (atrial fibrillation/flutter, sinus tachycardia in critical illness). Perioperative hypertension and tachycardia. Heart rate control in aortic dissection. Hypertensive emergency.",
            citationIDs: ["openfda_drips2"]
        ),
        mechanism: AttributedProse(
            "Cardioselective β1 antagonist — slows AV nodal conduction, reduces heart rate and contractility. Rapidly hydrolyzed by RBC esterases (independent of liver/kidney) — reason for ultra-short half-life.",
            citationIDs: ["openfda_drips2", "openrn_pharm_drips2"]
        ),
        dosing: [
            DosingBlock(label: "Loading", body: "500 mcg/kg IV over 1 minute.", citationIDs: ["openfda_drips2"]),
            DosingBlock(label: "Maintenance", body: "50 mcg/kg/min, titrate by 50 mcg/kg/min every 4 minutes; max 200 mcg/kg/min.", citationIDs: ["openfda_drips2"]),
            DosingBlock(label: "Repeat loading", body: "May reload 500 mcg/kg over 1 min between titration steps if rapid effect needed.", citationIDs: ["openfda_drips2"])
        ],
        contraindications: AttributedProse(
            "Severe sinus bradycardia, second/third-degree AV block (without pacemaker), sick sinus syndrome, decompensated heart failure, cardiogenic shock, severe asthma/COPD bronchospasm. Hypersensitivity.",
            citationIDs: ["openfda_drips2"]
        ),
        warnings: [
            AttributedBullet("Hypotension is the most common adverse effect — dose-dependent.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Bradycardia and AV block — monitor continuously.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Cardioselectivity is dose-dependent — at higher doses, β2-blockade can precipitate bronchospasm.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Can mask hypoglycemia in diabetics; reduces glycogenolysis.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Extravasation — can cause skin necrosis; use central line for prolonged or higher-rate infusion when possible.", citationIDs: ["openfda_drips2"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension (very common, dose-related), bradycardia, dizziness, nausea, infusion site reactions, bronchospasm at high doses, fatigue.",
            citationIDs: ["openfda_drips2"]
        ),
        drugInteractions: [
            AttributedBullet("Other AV nodal blockers (verapamil, diltiazem, digoxin) — additive bradycardia.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Catecholamines (epi, norepi) — antagonized.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Insulin and oral hypoglycemics — masks hypoglycemia.", citationIDs: ["openfda_drips2"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification at start and rate changes (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Continuous cardiac and BP monitoring (arterial line preferred for titration).", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Hold and notify provider for SBP <90, HR <50, or new bronchospasm; effect resolves quickly after stopping due to short half-life.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Use larger gauge IV in larger vein; assess site for extravasation.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Plan transition to longer-acting beta-blocker (PO metoprolol, IV labetalol) before discontinuing if ongoing rate control needed.", citationIDs: ["openrn_pharm_drips2"])
        ],
        patientTeaching: AttributedProse(
            "This rapid-acting medication slows your heart rate. You will feel it work within minutes. We will follow your blood pressure and pulse closely.",
            citationIDs: ["openrn_pharm_drips2"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cisatracurium Drip

public enum CisatracuriumDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cisatracurium-drip",
        title: "Cisatracurium (continuous infusion)",
        subtitle: "Nimbex · non-depolarizing neuromuscular blocker — ICU paralysis",
        category: "Neuromuscular Blocker (Non-depolarizing) Drip",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Benzylisoquinoline non-depolarizing NMB"),
            KeyValueRow(key: "Onset", value: "2–3 minutes"),
            KeyValueRow(key: "Duration (single dose)", value: "30–60 minutes"),
            KeyValueRow(key: "Metabolism", value: "Hofmann elimination — independent of organ function")
        ],
        indications: AttributedProse(
            "Adjunct to anesthesia or ICU sedation to facilitate intubation, mechanical ventilation, and ARDS lung-protective strategies. Refractory status asthmaticus when paralysis required.",
            citationIDs: ["openfda_drips2"]
        ),
        mechanism: AttributedProse(
            "Non-depolarizing NMB — competitively blocks acetylcholine at the nicotinic receptor of the neuromuscular junction → flaccid paralysis. Hofmann elimination is non-enzymatic and independent of renal/hepatic function.",
            citationIDs: ["openfda_drips2", "openrn_pharm_drips2"]
        ),
        dosing: [
            DosingBlock(label: "Bolus (intubation)", body: "0.15–0.2 mg/kg IV.", citationIDs: ["openfda_drips2"]),
            DosingBlock(label: "ICU continuous infusion", body: "1–3 mcg/kg/min, titrated to train-of-four (target 1–2/4 twitches) or until refractory ventilator dyssynchrony resolves.", citationIDs: ["openfda_drips2"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Inadequate sedation/analgesia — paralysis without sedation is awareness without movement; CRITICAL safety failure.",
            citationIDs: ["openfda_drips2"]
        ),
        warnings: [
            AttributedBullet("PARALYSIS WITHOUT SEDATION/ANALGESIA — paralyzed patients can be awake, in pain, terrified. Ensure deep sedation (RASS −5) and continuous analgesia BEFORE and DURING paralysis.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Prolonged weakness syndrome — risk increased with concurrent steroids, sepsis, prolonged use; train-of-four monitoring helps minimize cumulative dose.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Eye care critical — paralyzed patients cannot blink; lubricate every 2 hours, taping eyelids if needed to prevent corneal abrasion.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("DVT prophylaxis essential — paralyzed patients at high VTE risk.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Reversal: sugammadex does NOT reverse cisatracurium (works on aminosteroid NMBs only); neostigmine + glycopyrrolate is the reversal.", citationIDs: ["openfda_drips2"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension (less than other NMBs), bradycardia, prolonged paralysis, ICU-acquired weakness with prolonged use, corneal injury without eye care, pressure injury without aggressive turning.",
            citationIDs: ["openfda_drips2"]
        ),
        drugInteractions: [
            AttributedBullet("Aminoglycosides, magnesium, lithium — potentiate paralysis.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Anticonvulsants (phenytoin, carbamazepine) — chronic use shortens duration.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Inhaled anesthetics — potentiate paralysis.", citationIDs: ["openfda_drips2"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification at start and rate change (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("VERIFY adequate sedation (RASS −5) and analgesia BEFORE starting; never paralyze an awake patient.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Train-of-four (TOF) every 4 hours — target 1–2/4 twitches; hold or reduce if 0/4 (over-paralysis).", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Eye care (lubricant + tape if needed) every 2 hours.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Pressure injury prevention — turn q2h, heel offload, specialty mattress.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("DVT prophylaxis (mechanical + pharmacologic per protocol).", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Daily 'paralytic holiday' per protocol when feasible.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Accept that ventilator alarms (no spontaneous effort) are expected — do not extubate during paralysis.", citationIDs: ["openrn_pharm_drips2"])
        ],
        patientTeaching: AttributedProse(
            "When you wake up, you may not remember being on this medication. Tell us about any awareness or distress you recall — we want to know.",
            citationIDs: ["openrn_pharm_drips2"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Octreotide Drip

public enum OctreotideDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "octreotide-drip",
        title: "Octreotide (continuous infusion)",
        subtitle: "Sandostatin · somatostatin analog — variceal bleed, severe diarrhea",
        category: "Somatostatin Analog Drip",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Somatostatin analog"),
            KeyValueRow(key: "Onset", value: "Minutes IV"),
            KeyValueRow(key: "Half-life", value: "~1.5 hr"),
            KeyValueRow(key: "Acute use", value: "Esophageal variceal bleeding, refractory diarrhea, post-pancreatic surgery")
        ],
        indications: AttributedProse(
            "Esophageal/gastric variceal bleeding (reduces splanchnic blood flow). Severe diarrhea (carcinoid syndrome, VIPoma, post-chemo, dumping syndrome). Pancreatic fistula management. Acromegaly (long-acting depot, not drip).",
            citationIDs: ["openfda_drips2"]
        ),
        mechanism: AttributedProse(
            "Synthetic analog of somatostatin — inhibits release of GH, glucagon, insulin, gastrin, secretin, and VIP. Reduces splanchnic and portal blood flow → useful in variceal bleeding. Inhibits GI secretion → useful in fistulas and severe diarrhea.",
            citationIDs: ["openfda_drips2", "openrn_pharm_drips2"]
        ),
        dosing: [
            DosingBlock(label: "Variceal bleeding", body: "50 mcg IV bolus, then 50 mcg/hr continuous IV × 3–5 days.", citationIDs: ["openfda_drips2"]),
            DosingBlock(label: "Severe diarrhea (refractory)", body: "50–100 mcg SC every 8 hours OR continuous IV per protocol.", citationIDs: ["openfda_drips2"]),
            DosingBlock(label: "Pancreatic fistula", body: "100–200 mcg SC every 8 hours.", citationIDs: ["openfda_drips2"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to octreotide or any component.",
            citationIDs: ["openfda_drips2"]
        ),
        warnings: [
            AttributedBullet("Hyperglycemia and hypoglycemia — alters insulin/glucagon balance; monitor glucose closely especially in diabetics.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Bradycardia and conduction abnormalities.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Cholelithiasis with prolonged use — biliary stasis.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Vitamin B12 deficiency with prolonged use.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Thyroid suppression possible.", citationIDs: ["openfda_drips2"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, abdominal pain, diarrhea (paradoxical), steatorrhea, hyperglycemia or hypoglycemia, bradycardia, gallstones with prolonged use, injection site discomfort.",
            citationIDs: ["openfda_drips2"]
        ),
        drugInteractions: [
            AttributedBullet("Insulin, sulfonylureas — altered glucose control; need closer monitoring.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Cyclosporine — octreotide reduces levels.", citationIDs: ["openfda_drips2"]),
            AttributedBullet("Beta-blockers — additive bradycardia.", citationIDs: ["openfda_drips2"])
        ],
        nursingImplications: [
            AttributedBullet("In active variceal bleed: ensure large-bore IV access, type & cross, prepare for possible endoscopy/Blakemore tube.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Glucose checks every 4–6 hours; sliding scale or insulin drip per protocol.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Monitor HR; report bradycardia.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Track stool/output volumes; assess hydration status.", citationIDs: ["openrn_pharm_drips2"]),
            AttributedBullet("Anticipate ceftriaxone for SBP prophylaxis in cirrhotic GI bleed.", citationIDs: ["openrn_pharm_drips2"])
        ],
        patientTeaching: AttributedProse(
            "This medication helps slow bleeding from veins in your esophagus or reduce severe diarrhea. We will check your blood sugar regularly while it is running.",
            citationIDs: ["openrn_pharm_drips2"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}
