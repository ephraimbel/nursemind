import Foundation

// Curator-model drug entries (round 10 expansion — toxidrome antidotes, addiction medicine, HIV PrEP / ART).
// Sources: openFDA SPL (CC0), Open RN Pharmacology (CC BY 4.0), CDC poisoning + HIV
// guidance (public domain), AAPCC / DHHS HIV / SAMHSA concept citations.

private let openfda = CitationSource(
    id: "openfda_round10",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR10 = CitationSource(
    id: "openrn_pharm_round10",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=antidote+toxicology+addiction+HIV",
    lastRetrieved: "2026-05-04"
)
private let cdcR10 = CitationSource(
    id: "cdc_round10",
    shortName: "CDC poisoning + HIV PrEP/PEP guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/poisoning/index.html",
    lastRetrieved: "2026-05-04"
)
private let specialtyR10 = CitationSource(
    id: "specialty_round10",
    shortName: "AAPCC / DHHS HIV / SAMHSA concept citations",
    publisher: "AAPCC · DHHS HIV Guidelines · SAMHSA",
    license: .factCitationOnly,
    url: "https://aapcc.org/clinical-guidelines",
    lastRetrieved: "2026-05-04"
)

// MARK: - Flumazenil

public enum FlumazenilSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "flumazenil",
        title: "Flumazenil",
        subtitle: "Romazicon · benzodiazepine receptor antagonist · selective reversal",
        category: "Benzodiazepine antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Competitive benzodiazepine receptor antagonist"),
            KeyValueRow(key: "Use", value: "Reversal of conscious sedation; benzo overdose in OPIOID-NAIVE patients without chronic benzo dependence"),
            KeyValueRow(key: "AVOID", value: "Chronic benzo use (precipitates withdrawal seizures); known seizure disorder; mixed overdose with TCAs / proconvulsants per primary source"),
            KeyValueRow(key: "Notable", value: "Short half-life (~1 hour) — re-sedation common after long-acting benzo overdose; observe / repeat doses")
        ],
        indications: AttributedProse(
            "Reversal of conscious sedation following benzodiazepine administration; selective use in benzodiazepine overdose in OPIOID-NAIVE patients WITHOUT chronic benzodiazepine dependence per primary source.",
            citationIDs: ["openfda_round10", "specialty_round10"]
        ),
        mechanism: AttributedProse(
            "Competitively binds GABA-A receptor benzodiazepine site → blocks benzodiazepine-mediated GABA potentiation → reverses sedation.",
            citationIDs: ["openfda_round10"]
        ),
        dosing: [
            DosingBlock(label: "Conscious sedation reversal", body: "0.2 mg IV over 15 sec; may repeat 0.2 mg every minute up to 1 mg total per primary source.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "Suspected benzo overdose (no chronic use)", body: "0.2 mg IV; titrate slowly with provider; max ~3 mg in 1 hr per primary source.", citationIDs: ["openfda_round10"])
        ],
        contraindications: AttributedProse(
            "Patients receiving benzodiazepines for life-threatening conditions (status epilepticus, ICP control); known TCA overdose (concurrent toxicity precipitates seizures); chronic benzodiazepine use / dependence (withdrawal seizures); hypersensitivity per primary source.",
            citationIDs: ["openfda_round10"]
        ),
        warnings: [
            AttributedBullet("Withdrawal seizures in chronic benzo users — life-threatening per primary source.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Re-sedation after the antagonist effect wears off (~1 hour) — observe and consider redosing.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Mixed overdose unmasking — may worsen TCA / proconvulsant toxicity.", citationIDs: ["openfda_round10"])
        ],
        adverseReactions: AttributedProse(
            "Agitation, anxiety, dizziness, nausea, vomiting; seizures (especially in chronic benzo users or mixed overdose).",
            citationIDs: ["openfda_round10"]
        ),
        drugInteractions: [
            AttributedBullet("TCAs / cocaine / chloroquine / theophylline / proconvulsants — increased seizure risk if reversed.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Other CNS depressants — may unmask incomplete reversal.", citationIDs: ["openfda_round10"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous monitoring after administration; re-sedation typically within 30–60 min — anticipate redosing.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Verify NO chronic benzo use, NO suspected TCA / proconvulsant co-ingestion before administration in suspected overdose.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Have airway / ventilation support ready; SUPPORTIVE CARE often safer than reversal in unintentional benzo overdose per primary source.", citationIDs: ["openrn_pharm_round10"])
        ],
        patientTeaching: AttributedProse(
            "If you take this medicine to wake up after a procedure, you will be observed for some time; the medicine does not last as long as the sedative. Tell us about any seizure history. Do not drive or make important decisions for 24 hours.",
            citationIDs: ["openrn_pharm_round10"]
        ),
        citations: [openfda, openrnPharmR10, specialtyR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pralidoxime

public enum PralidoximeSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "pralidoxime",
        title: "Pralidoxime (2-PAM)",
        subtitle: "Protopam · cholinesterase reactivator · organophosphate / nerve-agent antidote",
        category: "Cholinesterase reactivator",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Cholinesterase reactivator (oxime)"),
            KeyValueRow(key: "Indication", value: "Organophosphate / nerve-agent (sarin) poisoning — given AFTER atropine for muscarinic symptoms"),
            KeyValueRow(key: "Timing", value: "Most effective within hours of exposure (before \"aging\" of the bond)"),
            KeyValueRow(key: "Notable", value: "Atropine (anticholinergic) reverses the muscarinic crisis; pralidoxime regenerates AChE")
        ],
        indications: AttributedProse(
            "Treatment of poisoning by organophosphate pesticides (parathion, malathion, chlorpyrifos) and chemical-warfare nerve agents (sarin, VX). Used in combination with atropine and benzodiazepines per primary source.",
            citationIDs: ["openfda_round10", "specialty_round10"]
        ),
        mechanism: AttributedProse(
            "Reactivates acetylcholinesterase that has been inhibited by organophosphate binding — only effective before \"aging\" (irreversible bond formation), which occurs hours to days after exposure (faster for nerve agents).",
            citationIDs: ["openfda_round10"]
        ),
        dosing: [
            DosingBlock(label: "Organophosphate poisoning (adult)", body: "Loading 1–2 g IV over 15–30 minutes; may repeat in 1 hour; continuous infusion 250–500 mg/hr until symptoms resolve per primary source.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "Pediatric", body: "20–40 mg/kg IV over 15–30 minutes (max single dose 1 g) per primary source.", citationIDs: ["openfda_round10"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Use cautiously in renal impairment (dose reduction).",
            citationIDs: ["openfda_round10"]
        ),
        warnings: [
            AttributedBullet("Rapid IV push → tachycardia, laryngospasm, muscle rigidity, paralysis; INFUSE SLOWLY per primary source.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Aging of organophosphate-AChE bond — efficacy decreases sharply with delay.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Pralidoxime alone does NOT reverse nicotinic effects (paralysis) without ongoing reactivation; supportive care + ventilation often required.", citationIDs: ["openfda_round10"])
        ],
        adverseReactions: AttributedProse(
            "Dizziness, drowsiness, blurred vision, headache, muscle weakness; tachycardia / hypertension with rapid infusion.",
            citationIDs: ["openfda_round10"]
        ),
        drugInteractions: [
            AttributedBullet("Atropine — used together; counter muscarinic crisis.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Benzodiazepines — for seizures; standard adjunct.", citationIDs: ["openfda_round10"])
        ],
        nursingImplications: [
            AttributedBullet("DECONTAMINATE patient FIRST — remove clothing, wash skin; HCP wear PPE to prevent secondary exposure per primary source.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Atropine FIRST then pralidoxime — atropine reverses muscarinic SLUDGE-BBB symptoms; pralidoxime regenerates AChE.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Continuous monitoring; intubation often required for respiratory paralysis; benzo for seizures.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Coordinate with poison control; activate hazmat response per facility / community.", citationIDs: ["openrn_pharm_round10"])
        ],
        patientTeaching: AttributedProse(
            "After exposure, your skin and hair were washed and you received antidotes. You may need to stay in the ICU for monitoring. Some weakness may persist for days. Avoid the source of exposure; we will coordinate with your job or community.",
            citationIDs: ["openrn_pharm_round10"]
        ),
        citations: [openfda, openrnPharmR10, specialtyR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Methylene Blue

public enum MethyleneBlueSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "methylene-blue",
        title: "Methylene blue",
        subtitle: "Antidote for acquired methemoglobinemia · MAOI in low doses",
        category: "Antidote (methemoglobinemia)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Reducing agent (cofactor for NADPH-methemoglobin reductase)"),
            KeyValueRow(key: "Indication", value: "Symptomatic methemoglobinemia (>20–30% MetHb or symptoms with lower)"),
            KeyValueRow(key: "Caution", value: "G6PD-DEFICIENT patients — can paradoxically WORSEN hemolysis; consider exchange transfusion / hyperbaric per primary source"),
            KeyValueRow(key: "MAOI activity", value: "Causes serotonin syndrome with serotonergic agents; AVOID if patient on SSRIs / SNRIs / MAOIs / triptans")
        ],
        indications: AttributedProse(
            "Treatment of acquired methemoglobinemia (drug-induced — dapsone, benzocaine, nitrites, phenazopyridine; or environmental — well water nitrates) per primary source.",
            citationIDs: ["openfda_round10"]
        ),
        mechanism: AttributedProse(
            "Cofactor for NADPH-methemoglobin reductase → accelerates conversion of methemoglobin (Fe³⁺ — does not bind O2) back to functional hemoglobin (Fe²⁺).",
            citationIDs: ["openfda_round10"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "1–2 mg/kg IV over 5 minutes; may repeat in 30–60 min if symptoms persist; max total 7 mg/kg per primary source.", citationIDs: ["openfda_round10"])
        ],
        contraindications: AttributedProse(
            "G6PD deficiency (relative — may worsen hemolysis); concurrent serotonergic medication (serotonin-syndrome risk); severe renal impairment; hypersensitivity per primary source.",
            citationIDs: ["openfda_round10"]
        ),
        warnings: [
            AttributedBullet("SEROTONIN SYNDROME if patient is on SSRI / SNRI / MAOI / triptan / linezolid — methylene blue is a potent MAOI.", citationIDs: ["openfda_round10"]),
            AttributedBullet("G6PD deficiency — paradoxic hemolysis; consider alternative (ascorbic acid, exchange transfusion, hyperbaric O2).", citationIDs: ["openfda_round10"]),
            AttributedBullet("Falsely elevated SpO2 reading post-administration (interferes with pulse oximetry); use co-oximetry.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Blue-green discoloration of urine, sweat, and tissues (harmless but informs patient and family).", citationIDs: ["openfda_round10"])
        ],
        adverseReactions: AttributedProse(
            "Blue-green urine / discoloration; nausea, vomiting; chest pain, dyspnea; methemoglobinemia paradoxically at HIGH doses; G6PD hemolysis.",
            citationIDs: ["openfda_round10"]
        ),
        drugInteractions: [
            AttributedBullet("SSRIs, SNRIs, MAOIs, triptans, linezolid, tramadol, fentanyl — serotonin syndrome.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Other oxidizing drugs / nitrites — additive methemoglobinemia at high doses.", citationIDs: ["openfda_round10"])
        ],
        nursingImplications: [
            AttributedBullet("Verify G6PD status if known; review medication list for serotonergic agents BEFORE administration.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Co-oximetry to confirm decrease in MetHb; SpO2 unreliable.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Counsel about blue-green urine and skin discoloration.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Monitor for serotonin syndrome — agitation, hyperthermia, clonus, autonomic instability.", citationIDs: ["openrn_pharm_round10"])
        ],
        patientTeaching: AttributedProse(
            "Your urine and skin may turn blue-green for a day or two — this is harmless. Tell us about any antidepressants or migraine medications you take.",
            citationIDs: ["openrn_pharm_round10"]
        ),
        citations: [openfda, openrnPharmR10, specialtyR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hydroxocobalamin

public enum HydroxocobalaminSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "hydroxocobalamin",
        title: "Hydroxocobalamin (Cyanokit)",
        subtitle: "Cyanide antidote · IV · empirical for fire-victim severe lactic acidosis",
        category: "Cyanide antidote",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Vitamin B12 precursor antidote"),
            KeyValueRow(key: "Indication", value: "Suspected or confirmed cyanide poisoning — fire victim with severe lactic acidosis, AMS, hypotension; cyanide industrial exposure"),
            KeyValueRow(key: "Notable", value: "Causes RED-ORANGE skin / urine / tissue discoloration for 1–2 weeks; INTERFERES with co-oximetry and many other lab assays"),
            KeyValueRow(key: "Alternative", value: "Sodium thiosulfate ± sodium nitrite (older Lily kit)")
        ],
        indications: AttributedProse(
            "Empirical or confirmed cyanide poisoning. Particularly important for fire victims with smoke inhalation, severe lactic acidosis, AMS, or hypotension; industrial cyanide exposure per primary source.",
            citationIDs: ["openfda_round10", "specialty_round10"]
        ),
        mechanism: AttributedProse(
            "Cobalt center of hydroxocobalamin binds free cyanide → forms cyanocobalamin (vitamin B12) → renally excreted.",
            citationIDs: ["openfda_round10"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "5 g IV over 15 minutes; may repeat 5 g (total 10 g) for severe cases per primary source.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "Pediatric", body: "70 mg/kg IV (max 5 g) over 15 minutes per primary source.", citationIDs: ["openfda_round10"])
        ],
        contraindications: AttributedProse(
            "Known anaphylactic hypersensitivity (rare).",
            citationIDs: ["openfda_round10"]
        ),
        warnings: [
            AttributedBullet("HYPERTENSION (transient, often dramatic); allergic reactions including anaphylaxis (rare).", citationIDs: ["openfda_round10"]),
            AttributedBullet("Red-orange discoloration of urine, skin, secretions, tears for up to 2 weeks per primary source.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Interferes with co-oximetry, urinalysis, blood-chemistry assays — discuss with lab.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Acute kidney injury reported.", citationIDs: ["openfda_round10"])
        ],
        adverseReactions: AttributedProse(
            "Red-orange discoloration (universal); HTN, tachycardia, headache, rash, infusion-site reaction; AKI (rare); anaphylaxis (rare).",
            citationIDs: ["openfda_round10"]
        ),
        drugInteractions: [
            AttributedBullet("Sodium thiosulfate — give in SEPARATE IV line; precipitate forms if mixed.", citationIDs: ["openfda_round10"]),
            AttributedBullet("None other significant; supportive care guides.", citationIDs: ["openfda_round10"])
        ],
        nursingImplications: [
            AttributedBullet("Don't delay administration awaiting confirmatory labs in suspected cyanide-poisoning fire victim per primary source.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Use a separate IV line; do not mix in the same line as sodium thiosulfate.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Counsel patient + family about red-orange discoloration of skin / urine for 1–2 weeks.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Coordinate with poison control + lab — many assays will be affected.", citationIDs: ["openrn_pharm_round10"])
        ],
        patientTeaching: AttributedProse(
            "After this medicine, your skin and urine will appear red or orange for up to 2 weeks — this is harmless. Tell labs and clinics that draw blood about this medicine — it can affect their testing.",
            citationIDs: ["openrn_pharm_round10"]
        ),
        citations: [openfda, openrnPharmR10, specialtyR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Fomepizole

public enum FomepizoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "fomepizole",
        title: "Fomepizole",
        subtitle: "Antizol · alcohol dehydrogenase inhibitor · methanol / ethylene glycol",
        category: "Antidote (toxic alcohols)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Alcohol dehydrogenase inhibitor"),
            KeyValueRow(key: "Indication", value: "Methanol or ethylene glycol poisoning — confirmed or suspected"),
            KeyValueRow(key: "Adjunct", value: "Hemodialysis for severe cases (high level, AKI, severe acidosis, end-organ damage)"),
            KeyValueRow(key: "Compared to ethanol", value: "More predictable, less CNS depression, no need for blood-level monitoring; preferred over ethanol per primary source")
        ],
        indications: AttributedProse(
            "Methanol or ethylene glycol poisoning (confirmed or strongly suspected) — typically given in conjunction with cofactor therapy (folinic acid for methanol; thiamine + pyridoxine for ethylene glycol) and consideration of hemodialysis per primary source.",
            citationIDs: ["openfda_round10", "specialty_round10"]
        ),
        mechanism: AttributedProse(
            "Competitively inhibits alcohol dehydrogenase → blocks conversion of methanol to formate and ethylene glycol to glycolate / oxalate → prevents toxic metabolite formation.",
            citationIDs: ["openfda_round10"]
        ),
        dosing: [
            DosingBlock(label: "Loading", body: "15 mg/kg IV over 30 minutes per primary source.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "Maintenance", body: "10 mg/kg IV every 12 hours × 4 doses, then 15 mg/kg every 12 hours per primary source.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "Hemodialysis adjustment", body: "Increase frequency to every 4 hours during dialysis per primary source.", citationIDs: ["openfda_round10"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to fomepizole or other pyrazoles.",
            citationIDs: ["openfda_round10"]
        ),
        warnings: [
            AttributedBullet("Hypersensitivity reactions (rare).", citationIDs: ["openfda_round10"]),
            AttributedBullet("Headache, nausea, dizziness — common but mild.", citationIDs: ["openfda_round10"]),
            AttributedBullet("AVOID concurrent ethanol — ethanol is a competitive substrate; combination unpredictable.", citationIDs: ["openfda_round10"])
        ],
        adverseReactions: AttributedProse(
            "Headache, nausea, dizziness, infusion-site reaction; transient mild LFT elevation.",
            citationIDs: ["openfda_round10"]
        ),
        drugInteractions: [
            AttributedBullet("Ethanol — competitive substrate; effects unpredictable; use one or the other per primary source.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Other CYP2E1 inhibitors / inducers — minor effects.", citationIDs: ["openfda_round10"])
        ],
        nursingImplications: [
            AttributedBullet("Coordinate poison control + nephrology consult for hemodialysis decision.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Trend serum methanol / ethylene glycol level, anion gap, osmolar gap, ABG, electrolytes, creatinine.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Coadminister cofactors — folinic acid for methanol; thiamine + pyridoxine for ethylene glycol per primary source.", citationIDs: ["openrn_pharm_round10"])
        ],
        patientTeaching: AttributedProse(
            "This medicine blocks your body from turning the toxic alcohol into harmful chemicals. You may need dialysis to remove what's already in your blood. After recovery, we will refer you for follow-up about the source of exposure.",
            citationIDs: ["openrn_pharm_round10"]
        ),
        citations: [openfda, openrnPharmR10, specialtyR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Calcium Chloride

public enum CalciumChlorideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "calcium-chloride",
        title: "Calcium chloride 10%",
        subtitle: "Stabilizes cardiac membrane · hyperK · CCB / β-blocker overdose · hypocalcemia",
        category: "Electrolyte / antidote",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Calcium salt (3× elemental Ca per gram vs calcium gluconate)"),
            KeyValueRow(key: "Routes", value: "CENTRAL line preferred; peripheral OK in emergency but VESICANT — extravasation = severe tissue necrosis"),
            KeyValueRow(key: "Indications", value: "Hyperkalemia (membrane stabilization), CCB / β-blocker overdose, severe hypocalcemia, hypermagnesemia, fluoride / hydrofluoric-acid poisoning"),
            KeyValueRow(key: "Notable", value: "Calcium GLUCONATE is preferred peripherally (less vesicant); calcium CHLORIDE for cardiac codes / central access")
        ],
        indications: AttributedProse(
            "Hyperkalemia with EKG changes (membrane stabilization); calcium-channel-blocker or β-blocker overdose; severe hypocalcemia; hypermagnesemia (esp. mag-toxicity in OB); fluoride / hydrofluoric-acid burn or ingestion per primary source.",
            citationIDs: ["openfda_round10"]
        ),
        mechanism: AttributedProse(
            "Increases extracellular calcium → restores resting membrane potential gradient (cardiac stabilization in hyperK); displaces calcium-channel blockers; antagonizes magnesium at neuromuscular junction.",
            citationIDs: ["openfda_round10"]
        ),
        dosing: [
            DosingBlock(label: "Hyperkalemia (cardiac stabilization)", body: "1 g IV over 5–10 minutes (10 mL of 10% solution); may repeat in 5 minutes if EKG changes persist per primary source.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "CCB / β-blocker overdose", body: "1–3 g IV over 5–10 minutes; may repeat per primary source; high-dose insulin / glucagon adjuncts.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "Severe hypocalcemia / mag toxicity", body: "1 g IV over 10 minutes; titrate per ionized calcium per primary source.", citationIDs: ["openfda_round10"])
        ],
        contraindications: AttributedProse(
            "Hypercalcemia; digoxin toxicity (calcium worsens); concurrent ceftriaxone in neonates (precipitate); known hypersensitivity. Use cautiously in renal impairment.",
            citationIDs: ["openfda_round10"]
        ),
        warnings: [
            AttributedBullet("VESICANT — central line preferred; peripheral access OK in true emergency; extravasation causes severe tissue necrosis per primary source.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Bradycardia / asystole with rapid push.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Avoid in digoxin toxicity — increases dig-related arrhythmia risk (\"stone heart\").", citationIDs: ["openfda_round10"]),
            AttributedBullet("Avoid mixing with bicarbonate or phosphate-containing solutions (precipitate).", citationIDs: ["openfda_round10"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension, bradycardia, flushing, nausea / vomiting; tissue necrosis with extravasation; hypercalcemia.",
            citationIDs: ["openfda_round10"]
        ),
        drugInteractions: [
            AttributedBullet("Digoxin — increased dysrhythmia risk; AVOID acute administration in dig toxicity.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Ceftriaxone in neonates — precipitate; AVOID concurrent.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Sodium bicarbonate, phosphate — precipitate in same line.", citationIDs: ["openfda_round10"])
        ],
        nursingImplications: [
            AttributedBullet("Use CENTRAL line when possible; if peripheral, use LARGEST proximal vein and verify patency; STOP infusion at any sign of extravasation per primary source.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Cardiac monitor during administration; SLOW PUSH (over 5–10 min) for non-arrest doses.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Trend ionized calcium; assess EKG response in hyperkalemia.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("In hyperK — calcium STABILIZES the cardiac membrane but does NOT lower potassium; combine with insulin / glucose / β-agonist / kayexalate / dialysis per primary source.", citationIDs: ["openrn_pharm_round10"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps your heart's electrical activity. Tell us if the IV site burns or hurts during the infusion. After the urgent treatment, we will continue working on the underlying problem (high potassium, drug overdose).",
            citationIDs: ["openrn_pharm_round10"]
        ),
        citations: [openfda, openrnPharmR10, specialtyR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Naltrexone

public enum NaltrexoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "naltrexone",
        title: "Naltrexone",
        subtitle: "ReVia / Vivitrol · μ-opioid antagonist · OUD + AUD maintenance",
        category: "Opioid antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Long-acting μ-opioid receptor antagonist"),
            KeyValueRow(key: "Indications", value: "Alcohol use disorder; opioid use disorder maintenance"),
            KeyValueRow(key: "Forms", value: "PO daily (50 mg); IM monthly (Vivitrol 380 mg)"),
            KeyValueRow(key: "Critical", value: "OPIOID-FREE for ≥7–10 days (≥10–14 for methadone) before initiation — precipitates severe withdrawal otherwise per primary source")
        ],
        indications: AttributedProse(
            "Maintenance of opioid abstinence in patients with opioid use disorder (after detox); maintenance treatment of alcohol use disorder per primary source.",
            citationIDs: ["openfda_round10", "specialty_round10"]
        ),
        mechanism: AttributedProse(
            "Long-acting competitive μ-opioid receptor antagonist → blocks reinforcing effects of opioids and reduces craving; modulates reward pathways in alcohol use disorder.",
            citationIDs: ["openfda_round10"]
        ),
        dosing: [
            DosingBlock(label: "Oral (AUD or OUD)", body: "50 mg PO daily after confirmed opioid abstinence per primary source.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "Vivitrol IM (long-acting)", body: "380 mg IM gluteal once monthly per primary source.", citationIDs: ["openfda_round10"])
        ],
        contraindications: AttributedProse(
            "Current opioid use, opioid-positive UDS, or in opioid withdrawal; acute hepatitis or liver failure; hypersensitivity per primary source.",
            citationIDs: ["openfda_round10"]
        ),
        warnings: [
            AttributedBullet("PRECIPITATED OPIOID WITHDRAWAL if not abstinent for 7–10 days (10–14 for methadone) per primary source.", citationIDs: ["openfda_round10"]),
            AttributedBullet("OPIOID OVERDOSE risk after stopping — patient's opioid tolerance is reduced; relapse with prior dose can be fatal; counsel and prescribe naloxone.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Hepatotoxicity at high doses; monitor LFTs.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Vivitrol IM — injection-site reactions (induration, abscess); use Z-track gluteal technique.", citationIDs: ["openfda_round10"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, headache, fatigue, dizziness; injection-site reactions (Vivitrol); transient LFT elevation.",
            citationIDs: ["openfda_round10"]
        ),
        drugInteractions: [
            AttributedBullet("Opioid analgesics — blocked; counsel for emergency / surgical pain management.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Loperamide and other opioid agents — antagonized.", citationIDs: ["openfda_round10"])
        ],
        nursingImplications: [
            AttributedBullet("Verify opioid abstinence with naloxone challenge or UDS before initiation per primary source.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Counsel about reduced opioid tolerance after stopping — overdose risk; co-prescribe naloxone.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Vivitrol IM — Z-track deep gluteal injection; rotate sites; monitor for injection-site complications.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Coordinate behavioral therapy, AA / NA, peer support; medication alone is less effective than combined approach.", citationIDs: ["openrn_pharm_round10"])
        ],
        patientTeaching: AttributedProse(
            "This medicine reduces cravings for alcohol or opioids. Carry a card or wear a medical-alert bracelet — opioid pain medicines won't work normally for you. Always carry naloxone — if you relapse, your tolerance is much lower and overdose can happen with smaller amounts. Combine this medicine with counseling or peer support for best results.",
            citationIDs: ["openrn_pharm_round10"]
        ),
        citations: [openfda, openrnPharmR10, specialtyR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Buprenorphine

public enum BuprenorphineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "buprenorphine",
        title: "Buprenorphine (mono and naloxone combinations)",
        subtitle: "Suboxone · partial μ-agonist · OUD treatment + analgesia",
        category: "Partial μ-opioid agonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Partial μ-opioid agonist + κ-antagonist"),
            KeyValueRow(key: "Indications", value: "Opioid use disorder treatment; chronic pain (lower-dose patches and buccal films)"),
            KeyValueRow(key: "Combo with naloxone", value: "Suboxone (sublingual film) — naloxone deters IV diversion"),
            KeyValueRow(key: "Notable", value: "Ceiling effect on respiratory depression — safer than full agonists; precipitates withdrawal if patient still has full agonist on board")
        ],
        indications: AttributedProse(
            "Treatment of opioid use disorder (induction + maintenance); chronic pain (lower-dose buccal / transdermal forms); acute pain (IV / IM mono product) per primary source.",
            citationIDs: ["openfda_round10", "specialty_round10"]
        ),
        mechanism: AttributedProse(
            "Partial μ-receptor agonist with high receptor affinity → ceiling on respiratory depression and euphoria; high affinity displaces full agonists (precipitating withdrawal in opioid-dependent patients with recent agonist use).",
            citationIDs: ["openfda_round10"]
        ),
        dosing: [
            DosingBlock(label: "OUD induction (buprenorphine/naloxone SL film)", body: "2/0.5 mg or 4/1 mg SL once moderate-severe withdrawal present (typically COWS ≥8); titrate to suppression of withdrawal and craving — typical maintenance 8/2–24/6 mg/day per primary source.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "OUD long-acting injectable (Sublocade)", body: "300 mg SQ monthly × 2, then 100 mg SQ monthly per primary source.", citationIDs: ["openfda_round10"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; severe respiratory compromise unrelated to opioid use; significant hepatic impairment per primary source.",
            citationIDs: ["openfda_round10"]
        ),
        warnings: [
            AttributedBullet("PRECIPITATED OPIOID WITHDRAWAL — give only when patient is in moderate-severe withdrawal; otherwise use micro-dosing protocols per primary source.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Respiratory depression — ceiling effect, but additive with benzo / alcohol / other CNS depressants; counsel.", citationIDs: ["openfda_round10"]),
            AttributedBullet("QT prolongation; hepatotoxicity (less than methadone).", citationIDs: ["openfda_round10"]),
            AttributedBullet("X-waiver no longer required for prescribing in U.S. as of 2023; treat OUD without restriction within DEA registration per primary source.", citationIDs: ["openfda_round10"])
        ],
        adverseReactions: AttributedProse(
            "Constipation, headache, nausea, sweating, oral hypoesthesia (films), insomnia, sexual dysfunction, dental problems with sublingual films (decay risk).",
            citationIDs: ["openfda_round10"]
        ),
        drugInteractions: [
            AttributedBullet("Benzodiazepines, alcohol, other CNS depressants — additive sedation / respiratory depression; co-prescription is now individualized rather than universally avoided per primary source.", citationIDs: ["openfda_round10"]),
            AttributedBullet("CYP3A4 inhibitors / inducers — alter levels.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Other opioids — antagonized due to high receptor affinity.", citationIDs: ["openfda_round10"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm withdrawal status with COWS (Clinical Opiate Withdrawal Scale) before induction per primary source.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Educate on sublingual technique — let film fully dissolve under tongue; do NOT swallow.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Co-prescribe naloxone for relapse risk; counsel on dental hygiene; coordinate behavioral support.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Pregnancy — buprenorphine is a recommended treatment for OUD in pregnancy; coordinate with maternal-fetal medicine per primary source.", citationIDs: ["openrn_pharm_round10"])
        ],
        patientTeaching: AttributedProse(
            "Place the film under your tongue and let it dissolve completely — do not chew, swallow, or talk. Take only when you are in withdrawal — taking it too early causes worse withdrawal. Avoid alcohol and benzodiazepines unless your provider has specifically discussed it. Take care of your teeth — see a dentist regularly. Carry naloxone in case of relapse. Combine medicine with counseling for the best outcome.",
            citationIDs: ["openrn_pharm_round10"]
        ),
        citations: [openfda, openrnPharmR10, specialtyR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cyproheptadine

public enum CyproheptadineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cyproheptadine",
        title: "Cyproheptadine",
        subtitle: "Periactin · 5-HT2A antagonist · serotonin syndrome rescue + appetite",
        category: "First-gen antihistamine + serotonin antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "First-generation H1 + 5-HT2A antagonist"),
            KeyValueRow(key: "Indications", value: "Serotonin syndrome (off-label rescue), allergic rhinitis, appetite stimulation, chronic urticaria"),
            KeyValueRow(key: "Notable", value: "Rescue agent for moderate-severe serotonin syndrome — but not a substitute for STOPPING serotonergic agent + supportive care + benzos per primary source"),
            KeyValueRow(key: "Caution", value: "Anticholinergic + sedating — Beers list in older adults")
        ],
        indications: AttributedProse(
            "Allergic rhinitis, chronic urticaria, cold-induced urticaria, appetite stimulation. Off-label — moderate-severe serotonin syndrome rescue per primary source.",
            citationIDs: ["openfda_round10", "specialty_round10"]
        ),
        mechanism: AttributedProse(
            "First-generation H1 antagonist with significant 5-HT2A receptor antagonist activity — counters serotonergic excess.",
            citationIDs: ["openfda_round10"]
        ),
        dosing: [
            DosingBlock(label: "Serotonin syndrome (off-label)", body: "12 mg PO / NG initial; then 2 mg every 2 hours if symptoms continue; or 8 mg every 6 hours after stabilization per primary source.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "Allergic rhinitis (adult)", body: "4 mg PO every 8 hours; max 32 mg/day per primary source.", citationIDs: ["openfda_round10"])
        ],
        contraindications: AttributedProse(
            "Glaucoma; urinary retention; concurrent MAOI; pregnancy / lactation (relative); neonates / premature infants; hypersensitivity per primary source.",
            citationIDs: ["openfda_round10"]
        ),
        warnings: [
            AttributedBullet("Sedation (very common) — fall risk.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Anticholinergic burden — caution in older adults (Beers); confusion, urinary retention.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Weight gain (appetite stimulation).", citationIDs: ["openfda_round10"])
        ],
        adverseReactions: AttributedProse(
            "Sedation, dry mouth, constipation, urinary retention, weight gain, blurred vision, paradoxical excitation in children.",
            citationIDs: ["openfda_round10"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — contraindicated; serotonin syndrome despite mechanism (older labeling concern).", citationIDs: ["openfda_round10"]),
            AttributedBullet("CNS depressants — additive sedation.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Anticholinergics — additive effects.", citationIDs: ["openfda_round10"])
        ],
        nursingImplications: [
            AttributedBullet("Serotonin syndrome — STOP serotonergic agents FIRST; supportive care, benzodiazepines for agitation, cooling for hyperthermia, IV fluids; cyproheptadine ADJUNCT per primary source.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Available only PO / NG — dose carefully in unable-to-swallow patients (crush; consider alternative for severe cases).", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Counsel on sedation, dry mouth, and Beers concerns in older adults.", citationIDs: ["openrn_pharm_round10"])
        ],
        patientTeaching: AttributedProse(
            "This medicine causes drowsiness — do not drive or operate machinery. Avoid alcohol. May increase appetite. For older adults, use only when needed and short-term.",
            citationIDs: ["openrn_pharm_round10"]
        ),
        citations: [openfda, openrnPharmR10, specialtyR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tenofovir / Emtricitabine (Truvada / Descovy) — PrEP

public enum TruvadaPrEPSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tdf-ftc-prep",
        title: "Tenofovir disoproxil fumarate / emtricitabine (Truvada)",
        subtitle: "TDF/FTC · daily oral HIV pre-exposure prophylaxis",
        category: "HIV PrEP",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Nucleoside reverse-transcriptase inhibitor combination"),
            KeyValueRow(key: "Indication", value: "HIV pre-exposure prophylaxis in adults / adolescents at risk"),
            KeyValueRow(key: "Routes", value: "PO daily (Truvada — TDF/FTC) or daily (Descovy — TAF/FTC); cabotegravir LA injection (Apretude) is alternative"),
            KeyValueRow(key: "Notable", value: "Effective only with adherence; CONFIRM HIV-NEGATIVE before and every 3 months per CDC primary source")
        ],
        indications: AttributedProse(
            "Pre-exposure prophylaxis to reduce risk of sexually acquired HIV-1 in adults and adolescents at risk (e.g., MSM, transgender, heterosexual with HIV-positive partner, IDU). Truvada is also approved for IDU exposure; Descovy approval excludes receptive vaginal sex per primary source.",
            citationIDs: ["openfda_round10", "cdc_round10"]
        ),
        mechanism: AttributedProse(
            "Two NRTIs that prevent HIV reverse transcription — block establishment of infection in tissue exposures.",
            citationIDs: ["openfda_round10"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "1 tablet PO daily; consistent timing for adherence per primary source.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "On-demand (2-1-1, MSM only — off-label in U.S.)", body: "2 tabs 2–24 hr before sex, then 1 tab 24 hr later, then 1 tab 48 hr after first dose per primary source.", citationIDs: ["openfda_round10"])
        ],
        contraindications: AttributedProse(
            "Confirmed HIV-positive status (could induce drug resistance — use full ART); CrCl <60 (TDF/FTC); known hypersensitivity per primary source.",
            citationIDs: ["openfda_round10"]
        ),
        warnings: [
            AttributedBullet("BOXED — may be ineffective if HIV-positive and selecting for resistant virus; CONFIRM HIV-NEGATIVE before initiation and every 3 months per primary source.", citationIDs: ["openfda_round10"]),
            AttributedBullet("BOXED — hepatitis B reactivation if patient has chronic HBV and stops TDF/FTC abruptly per primary source.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Renal toxicity (TDF) — assess renal function baseline + every 6 months.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Bone-density loss with TDF; less with TAF (Descovy).", citationIDs: ["openfda_round10"]),
            AttributedBullet("Lactic acidosis / hepatic steatosis (rare class effect).", citationIDs: ["openfda_round10"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, headache, fatigue, weight changes, decreased BMD (TDF), modest renal effects.",
            citationIDs: ["openfda_round10"]
        ),
        drugInteractions: [
            AttributedBullet("Nephrotoxic drugs (NSAIDs, aminoglycosides, contrast) — additive renal effects.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Hepatitis C direct-acting antivirals — interactions; coordinate with HIV pharmacist.", citationIDs: ["openfda_round10"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm HIV-negative (4th-gen Ag/Ab) before initiation; baseline CrCl, HBV status, STI screen, pregnancy test per primary source.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Recheck HIV every 3 months; CrCl every 6 months; STI screen every 3–6 months; HBV / pregnancy as indicated per CDC primary source.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Counsel on adherence — daily, missed doses reduce efficacy; on-demand only validated for MSM exposures.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Reinforce safer-sex practices; PrEP does NOT prevent other STIs; consider HBV vaccine + meningococcal vaccination per primary source.", citationIDs: ["openrn_pharm_round10"])
        ],
        patientTeaching: AttributedProse(
            "Take this every day at the same time. Get tested for HIV every 3 months — if you become HIV-positive while taking PrEP without changing therapy, the virus may become resistant. PrEP does NOT prevent other STIs or pregnancy — use condoms and other prevention as needed. Tell your provider about any kidney problems or hepatitis B.",
            citationIDs: ["openrn_pharm_round10"]
        ),
        citations: [openfda, openrnPharmR10, cdcR10, specialtyR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sodium Thiosulfate

public enum SodiumThiosulfateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sodium-thiosulfate",
        title: "Sodium thiosulfate",
        subtitle: "Cyanide antidote (alternative / adjunct) + nitroprusside-toxicity prevention",
        category: "Cyanide antidote",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Sulfur donor (rhodanese substrate)"),
            KeyValueRow(key: "Indications", value: "Cyanide poisoning (with sodium nitrite or as alternative to hydroxocobalamin); nitroprusside-induced cyanide toxicity prophylaxis; off-label calcific uremic arteriolopathy"),
            KeyValueRow(key: "Compared to hydroxocobalamin", value: "No discoloration / lab interference, but slower onset and requires larger volume; often used in conjunction with sodium nitrite"),
            KeyValueRow(key: "FDA-approved (2022) ophthalmic", value: "Pediatric cisplatin-induced ototoxicity prevention")
        ],
        indications: AttributedProse(
            "Cyanide poisoning (alternative to hydroxocobalamin or in combination with sodium nitrite — older Lily kit); prophylaxis for nitroprusside-induced cyanide toxicity in prolonged / high-dose infusions; pediatric prevention of cisplatin-induced ototoxicity (Pedmark) per primary source.",
            citationIDs: ["openfda_round10", "specialty_round10"]
        ),
        mechanism: AttributedProse(
            "Provides sulfur substrate for rhodanese enzyme → converts cyanide to thiocyanate → renally excreted.",
            citationIDs: ["openfda_round10"]
        ),
        dosing: [
            DosingBlock(label: "Cyanide poisoning (adult)", body: "12.5 g IV (50 mL of 25% solution) over 10 minutes; may repeat half-dose if needed per primary source.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "Pediatric (cyanide)", body: "400 mg/kg IV (max 12.5 g) per primary source.", citationIDs: ["openfda_round10"]),
            DosingBlock(label: "Nitroprusside cyanide prophylaxis", body: "Co-infusion 5–10 mg per mg of nitroprusside per primary source.", citationIDs: ["openfda_round10"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Use cautiously in renal impairment (thiocyanate accumulation).",
            citationIDs: ["openfda_round10"]
        ),
        warnings: [
            AttributedBullet("Hypotension, nausea / vomiting, hypersensitivity (rare).", citationIDs: ["openfda_round10"]),
            AttributedBullet("Thiocyanate accumulation in renal impairment — psychosis / seizures (rare with single dose; relevant in long infusions).", citationIDs: ["openfda_round10"]),
            AttributedBullet("Use SEPARATE IV line from hydroxocobalamin (precipitate).", citationIDs: ["openfda_round10"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, hypotension, headache, infusion-site reactions; thiocyanate toxicity with prolonged infusion in renal impairment.",
            citationIDs: ["openfda_round10"]
        ),
        drugInteractions: [
            AttributedBullet("Hydroxocobalamin — give in SEPARATE line.", citationIDs: ["openfda_round10"]),
            AttributedBullet("Sodium nitrite — adjunct (older Lily kit).", citationIDs: ["openfda_round10"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous BP monitoring; slow infusion to minimize hypotension.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("Coordinate with poison control; consider hydroxocobalamin as first-line where available.", citationIDs: ["openrn_pharm_round10"]),
            AttributedBullet("In renal impairment with prolonged infusion, monitor thiocyanate level if available.", citationIDs: ["openrn_pharm_round10"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps your body get rid of cyanide. You may feel nauseated or briefly lightheaded during the infusion. After recovery, we will help with smoking-cessation or job / community follow-up depending on the cause of exposure.",
            citationIDs: ["openrn_pharm_round10"]
        ),
        citations: [openfda, openrnPharmR10, specialtyR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}
