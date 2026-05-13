import Foundation

// Curated ICU reference entries — Open RN (CC BY 4.0), with original-concept
// citations for legacy critical-care scoring tools (RASS, CAM-ICU). Tier-A RN
// review pending pre-launch for vent settings, prone protocol, and CAM-ICU.

private let openrnICU = CitationSource(
    id: "openrn_icu",
    shortName: "Open RN — Health Alterations: Critical Care chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=mechanical+ventilation+sedation+delirium",
    lastRetrieved: "2026-05-04"
)

private let rassSessler = CitationSource(
    id: "rass_sessler_2002",
    shortName: "RASS — Sessler et al, AJRCCM 2002 (concept citation)",
    detail: "Richmond Agitation-Sedation Scale, validated in mechanically ventilated adults",
    publisher: "American Journal of Respiratory and Critical Care Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/12421743/",
    lastRetrieved: "2026-05-04"
)

private let camICUEly = CitationSource(
    id: "cam_icu_ely_2001",
    shortName: "CAM-ICU — Ely et al, JAMA 2001 (concept citation)",
    detail: "Confusion Assessment Method for the ICU; ICU delirium screening tool",
    publisher: "JAMA",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/11730446/",
    lastRetrieved: "2026-05-04"
)

private let prosevaGuerin = CitationSource(
    id: "proseva_2013",
    shortName: "PROSEVA — Guérin et al, NEJM 2013 (concept citation)",
    detail: "Prone Positioning in Severe ARDS — landmark RCT establishing prone benefit",
    publisher: "New England Journal of Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/23688302/",
    lastRetrieved: "2026-05-04"
)

// MARK: - Mechanical Ventilation Basics

public enum MechanicalVentilationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "mechanical-ventilation-basics",
        title: "Mechanical ventilation basics",
        subtitle: "Modes, settings, alarms, weaning readiness",
        eyebrow: "REFERENCE · ICU",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        sections: [
            .prose(title: "What the vent is doing", AttributedProse("Mechanical ventilation supports the work of breathing while addressing failure of oxygenation, ventilation, or airway protection. Different modes do different things: control modes do the work for the patient, support modes augment patient effort. Settings drive what gets delivered.", citationIDs: ["openrn_icu"])),
            .keyValueTable(title: "Common modes", [
                KeyValueRow(key: "Assist-Control (AC) — volume", value: "Set rate, set tidal volume. Patient triggers extra breaths at full tidal volume. Used for ARDS, full vent support."),
                KeyValueRow(key: "AC — pressure", value: "Set rate, set inspiratory pressure. Tidal volume varies with lung compliance."),
                KeyValueRow(key: "SIMV", value: "Set rate of mandatory breaths; patient breathes spontaneously between. Less common now — slower weaning."),
                KeyValueRow(key: "Pressure Support (PS)", value: "Patient triggers every breath; vent adds inspiratory pressure boost. Spontaneous breathing trial mode."),
                KeyValueRow(key: "CPAP / BiPAP (NIV)", value: "Non-invasive (mask). CPAP = constant pressure; BiPAP = inspiratory + expiratory pressures."),
                KeyValueRow(key: "APRV", value: "Airway Pressure Release Ventilation. High pressure with brief releases. Used in severe ARDS.")
            ]),
            .keyValueTable(title: "Key settings", [
                KeyValueRow(key: "FiO₂", value: "Fraction of inspired oxygen, 21% (room air) → 100%. Wean to ≤60% as tolerated to avoid oxygen toxicity."),
                KeyValueRow(key: "PEEP", value: "Positive End-Expiratory Pressure. Keeps alveoli open. Typical 5 cmH₂O baseline; up to 18+ in ARDS."),
                KeyValueRow(key: "Tidal volume (Vt)", value: "Volume per breath. Lung-protective: 6 mL/kg ideal body weight in ARDS (4–8 mL/kg generally)."),
                KeyValueRow(key: "Rate (RR)", value: "Mandatory breaths per minute. Typical 12–18; higher for permissive hypercapnia or metabolic acidosis."),
                KeyValueRow(key: "I:E ratio", value: "Inspiratory:expiratory time. Typical 1:2 to 1:3. Inverse ratio for ARDS to improve oxygenation."),
                KeyValueRow(key: "Pressure support / inspiratory pressure", value: "Augmentation during patient-triggered breaths.")
            ]),
            .bullets(title: "Nursing assessment of the ventilated patient", [
                AttributedBullet("Confirm ETT depth (cm at lip), security, cuff inflation pressure (target 20–30 cmH₂O).", citationIDs: ["openrn_icu"]),
                AttributedBullet("Bilateral chest rise + breath sounds at every assessment — unilateral = mainstem migration or pneumothorax.", citationIDs: ["openrn_icu"]),
                AttributedBullet("ETCO₂ continuous monitoring (gold standard for confirming ventilation).", citationIDs: ["openrn_icu"]),
                AttributedBullet("Suction PRN — not on a schedule. Indications: visible secretions, increased peak pressure, decreased SpO₂, audible coarse rhonchi, patient cough/distress.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Oral care every 2 hr with chlorhexidine + subglottic suction (VAP prevention bundle).", citationIDs: ["openrn_icu"]),
                AttributedBullet("Head of bed 30–45° unless contraindicated (VAP prevention).", citationIDs: ["openrn_icu"]),
                AttributedBullet("Daily SAT (sedation awakening trial) and SBT (spontaneous breathing trial) — \"ABCDEF bundle\".", citationIDs: ["openrn_icu"]),
                AttributedBullet("DVT and stress-ulcer prophylaxis ordered.", citationIDs: ["openrn_icu"])
            ]),
            .keyValueTable(title: "Common alarms — interpret quickly", [
                KeyValueRow(key: "High peak pressure", value: "Causes: secretions, biting tube, kink, mucus plug, bronchospasm, pneumothorax, mainstem intubation. Action: assess, suction, listen to breath sounds, call for help."),
                KeyValueRow(key: "Low pressure / low tidal volume", value: "Causes: disconnect, leak, cuff issue, extubation. Action: confirm connections, check cuff, manually ventilate with BVM if needed."),
                KeyValueRow(key: "Apnea alarm", value: "Patient not triggering breaths in support mode. Confirm sedation level, neuro exam, vent settings."),
                KeyValueRow(key: "High respiratory rate", value: "Pain, anxiety, hypoxia, acidosis, ineffective sedation. Look for the cause.")
            ]),
            .bullets(title: "Weaning readiness — daily SBT criteria", [
                AttributedBullet("Reason for intubation has improved.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Hemodynamically stable on minimal/no vasopressors.", citationIDs: ["openrn_icu"]),
                AttributedBullet("FiO₂ ≤40–50% and PEEP ≤5–8 with adequate oxygenation (SpO₂ ≥92%).", citationIDs: ["openrn_icu"]),
                AttributedBullet("Adequate cough, gag reflex, ability to protect airway.", citationIDs: ["openrn_icu"]),
                AttributedBullet("RSBI <105 (rate / tidal volume) during SBT — predicts successful extubation.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Awake, follows commands, able to manage secretions.", citationIDs: ["openrn_icu"])
            ])
        ],
        citations: [openrnICU],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - RASS

public enum RASSReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "rass-scale",
        title: "RASS — Sedation level scoring",
        subtitle: "Richmond Agitation-Sedation Scale, target ranges, daily titration",
        eyebrow: "REFERENCE · ICU",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies),
        sections: [
            .prose(title: "Why RASS matters", AttributedProse("Over-sedated patients spend longer on the vent, develop more delirium, and have higher mortality. Under-sedated patients are agitated, dyssynchronous, and unsafe. RASS gives a common language for sedation goals and titration.", citationIDs: ["rass_sessler_2002", "openrn_icu"])),
            .keyValueTable(title: "RASS scale (+4 to −5)", [
                KeyValueRow(key: "+4 — Combative", value: "Overtly combative, violent, immediate danger to staff"),
                KeyValueRow(key: "+3 — Very agitated", value: "Pulls or removes tube/catheter, aggressive"),
                KeyValueRow(key: "+2 — Agitated", value: "Frequent non-purposeful movement, fights ventilator"),
                KeyValueRow(key: "+1 — Restless", value: "Anxious, apprehensive, but movements not aggressive"),
                KeyValueRow(key: "0 — Alert and calm", value: "Standard target for many patients"),
                KeyValueRow(key: "−1 — Drowsy", value: "Not fully alert; sustained awakening (eye contact) to voice ≥10 sec"),
                KeyValueRow(key: "−2 — Light sedation", value: "Briefly awakens with eye contact to voice <10 sec"),
                KeyValueRow(key: "−3 — Moderate sedation", value: "Movement or eye opening to voice (no eye contact)"),
                KeyValueRow(key: "−4 — Deep sedation", value: "No response to voice, but movement or eye opening to physical stimulation"),
                KeyValueRow(key: "−5 — Unarousable", value: "No response to voice or physical stimulation")
            ]),
            .keyValueTable(title: "Typical sedation goals", [
                KeyValueRow(key: "Most ventilated patients", value: "RASS 0 to −2 (light sedation, follows commands)"),
                KeyValueRow(key: "Severe ARDS / paralyzed", value: "RASS −4 to −5 (deep sedation; revisit daily)"),
                KeyValueRow(key: "Post-cardiac arrest", value: "Per neuroprognostication protocol; often deep sedation initially"),
                KeyValueRow(key: "Goal documentation", value: "Provider-set RASS goal; nurse titrates sedation to achieve")
            ]),
            .bullets(title: "How to score", [
                AttributedBullet("Step 1: Observe the patient quietly. Calm and alert (0)? Restless or agitated (+1 to +4)? Sedated/unresponsive (negative score)?", citationIDs: ["rass_sessler_2002"]),
                AttributedBullet("Step 2: If not at 0, state the patient's name, ask them to open eyes and look at speaker. Score based on duration and quality of eye opening.", citationIDs: ["rass_sessler_2002"]),
                AttributedBullet("Step 3: If no response to voice, physically stimulate (shoulder shake, then trapezius squeeze).", citationIDs: ["rass_sessler_2002"]),
                AttributedBullet("Reassess every shift, before/after sedation changes, and PRN.", citationIDs: ["openrn_icu"])
            ]),
            .bullets(title: "Daily SAT — Sedation Awakening Trial", [
                AttributedBullet("Once daily (typically AM), reduce or hold sedation infusion.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Watch for awakening, ability to follow commands.", citationIDs: ["openrn_icu"]),
                AttributedBullet("If patient awakens calmly and tolerates → proceed to SBT (spontaneous breathing trial).", citationIDs: ["openrn_icu"]),
                AttributedBullet("If patient becomes agitated or unsafe → restart sedation at 50% prior dose, titrate.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Document the SAT outcome and any RASS change.", citationIDs: ["openrn_icu"])
            ])
        ],
        citations: [rassSessler, openrnICU],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CAM-ICU

public enum CAMICUReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cam-icu-delirium",
        title: "CAM-ICU — Delirium screening",
        subtitle: "Detect ICU delirium early; prevent and treat",
        eyebrow: "REFERENCE · ICU",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cognition),
        sections: [
            .prose(title: "Why delirium screening matters", AttributedProse("ICU delirium affects up to 80% of ventilated patients and independently raises mortality, length of stay, and long-term cognitive impairment. It's often missed because hypoactive delirium (quiet confusion) looks like a sedated patient. CAM-ICU is a quick bedside screen designed for verbal-impaired patients.", citationIDs: ["cam_icu_ely_2001", "openrn_icu"])),
            .keyValueTable(title: "CAM-ICU — 4 features required: 1+2+(3 OR 4) = positive", [
                KeyValueRow(key: "Feature 1: Acute onset / fluctuating course", value: "Mental status change from baseline OR fluctuation in past 24 hr"),
                KeyValueRow(key: "Feature 2: Inattention", value: "Patient unable to follow simple attention task (e.g., squeeze hand on letter A in SAVEAHAART). >2 errors out of 10 = positive"),
                KeyValueRow(key: "Feature 3: Altered LOC", value: "Anything other than alert (RASS other than 0 — hypoactive or hyperactive)"),
                KeyValueRow(key: "Feature 4: Disorganized thinking", value: "Yes/no questions (\"Will a stone float on water?\") OR commands (\"Hold up this many fingers\"). >1 error = positive")
            ]),
            .bullets(title: "Screening rhythm", [
                AttributedBullet("First, score RASS. If RASS −4 or −5, patient cannot be assessed — document \"unable to assess.\"", citationIDs: ["cam_icu_ely_2001"]),
                AttributedBullet("If RASS −3 to +4, proceed with CAM-ICU.", citationIDs: ["cam_icu_ely_2001"]),
                AttributedBullet("Reassess every shift and any time mental status seems to shift.", citationIDs: ["openrn_icu"])
            ]),
            .keyValueTable(title: "Delirium subtypes", [
                KeyValueRow(key: "Hyperactive (~25%)", value: "Agitation, pulling lines, attempting to climb out of bed. Most easily recognized. Ironically lower mortality."),
                KeyValueRow(key: "Hypoactive (~50%)", value: "Quiet, withdrawn, slow responses, decreased activity. Most missed. Higher mortality."),
                KeyValueRow(key: "Mixed (~25%)", value: "Fluctuates between hyper- and hypoactive states.")
            ]),
            .bullets(title: "Reversible contributors — assess and address", [
                AttributedBullet("D — Drugs: benzodiazepines, opioids, anticholinergics. Wean if possible.", citationIDs: ["openrn_icu"]),
                AttributedBullet("E — Environment: noise, lights at night, no day-night cues. Cluster care, dim lights overnight, restore circadian.", citationIDs: ["openrn_icu"]),
                AttributedBullet("L — Lytes/labs: hyponatremia, hypoglycemia, hypoxia, hypercarbia, uremia. Correct.", citationIDs: ["openrn_icu"]),
                AttributedBullet("I — Infection / inflammation: sepsis, UTI, pneumonia. Treat the source.", citationIDs: ["openrn_icu"]),
                AttributedBullet("R — Restraints / immobility: minimize physical restraints, mobilize early.", citationIDs: ["openrn_icu"]),
                AttributedBullet("I — Injury / pain: control pain (poor pain control predicts delirium).", citationIDs: ["openrn_icu"]),
                AttributedBullet("U — Urinary retention / Urea (uremia / dehydration): catheter assessment; correct fluid status.", citationIDs: ["openrn_icu"]),
                AttributedBullet("M — Metabolic: thyroid, B12, glucose. Test and replace.", citationIDs: ["openrn_icu"])
            ]),
            .bullets(title: "Non-pharmacologic prevention bundle", [
                AttributedBullet("Frequent reorientation: \"Today is Monday, you're in the ICU at [hospital], it's [time].\"", citationIDs: ["openrn_icu"]),
                AttributedBullet("Glasses, hearing aids, dentures available and used.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Daily mobility (passive ROM, sitting up, ambulating per progression).", citationIDs: ["openrn_icu"]),
                AttributedBullet("Family presence — recognized faces and voices reduce delirium.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Sleep protection: minimize overnight interruptions; cluster vital sign timing if not critical.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Avoid benzodiazepines as first-line ICU sedation when possible (dexmedetomidine or propofol preferred).", citationIDs: ["openrn_icu"])
            ]),
            .bullets(title: "Pharmacologic considerations", [
                AttributedBullet("No medication reverses delirium itself — treat the underlying cause.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Antipsychotics (haloperidol, quetiapine) for severe agitation that endangers patient safety — short-term, low-dose.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Avoid benzodiazepines unless treating alcohol/benzo withdrawal — they prolong delirium.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Dexmedetomidine sedation associated with less delirium than benzodiazepine sedation.", citationIDs: ["openrn_icu"])
            ])
        ],
        citations: [camICUEly, openrnICU],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Prone Positioning

public enum PronePositioningSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "prone-positioning",
        title: "Prone positioning in ARDS",
        subtitle: "PROSEVA criteria, choreography, complications",
        eyebrow: "REFERENCE · ICU",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        sections: [
            .prose(title: "Why prone", AttributedProse("In severe ARDS, prone positioning improves V/Q matching, recruits dorsal lung units, and reduces mortality (PROSEVA trial). It's a high-effort, multi-person procedure with real complications — but in the right patient, it's life-saving.", citationIDs: ["proseva_2013"])),
            .keyValueTable(title: "Indications (PROSEVA-style criteria)", [
                KeyValueRow(key: "Severe ARDS", value: "PaO₂/FiO₂ <150 on FiO₂ ≥0.6 and PEEP ≥5"),
                KeyValueRow(key: "Within 36 hours of intubation", value: "Earlier prone shows more benefit"),
                KeyValueRow(key: "Duration", value: "≥16 hours per session in PROSEVA protocol"),
                KeyValueRow(key: "Continue daily", value: "Until oxygenation improves (typically PaO₂/FiO₂ >150 in supine, FiO₂ ≤0.4)")
            ]),
            .bullets(title: "Contraindications", [
                AttributedBullet("Spinal instability, recent spine surgery.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Open abdomen, major facial trauma.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Hemodynamic instability (severe shock, life-threatening arrhythmia) without resolution attempt.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Increased ICP without monitoring.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Pregnancy (relative — case-by-case).", citationIDs: ["openrn_icu"])
            ]),
            .numberedSteps(title: "Pre-prone choreography (5+ team members)", [
                "Assemble team: 1 at head (manages ETT and lines), 2 on each side (rotate body), 1 at foot.",
                "Pause enteral feeds 1 hour before; check residuals.",
                "Empty ostomy bags. Confirm Foley and rectal tube secured.",
                "Confirm ETT depth and security. Suction airway and oral cavity.",
                "Pre-oxygenate to FiO₂ 100% briefly.",
                "Disconnect non-essential lines; secure essential lines/drains with extra slack.",
                "Place pillows for chest, pelvis, and shins (to keep abdomen free for ventilation, prevent ulcers).",
                "Apply protective dressings to forehead, cheeks, chin, shoulders, breasts (women), iliac crests, knees, dorsum of feet.",
                "Sedation/analgesia adequate; consider neuromuscular blockade per protocol.",
                "Use a designated prone-positioning bed or technique (egg-roll, swimmer's position)."
            ], citationIDs: ["openrn_icu"]),
            .bullets(title: "Continuous monitoring during prone", [
                AttributedBullet("Reposition head every 2 hr to alternate sides — prevent corneal abrasion, facial pressure injury.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Eye care every 2 hr: lubricate, tape closed if needed.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Reposition arms in swimmer's position (one up, one down) — alternate.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Check pressure points every 2 hr: forehead, cheeks, breasts, iliac crest, knees, feet.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Watch for ETT migration — common with position changes; capnography continuous.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Monitor for hypotension during transition — pre-load fluid bolus may be ordered.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Skin assessment AFTER returning to supine — check all anterior pressure points.", citationIDs: ["openrn_icu"])
            ]),
            .bullets(title: "Complications to watch for", [
                AttributedBullet("Pressure injury (most common): forehead, chin, breasts, iliac crests, knees.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Facial edema (ubiquitous in 16+ hr prone) — resolves over hours after supine return.", citationIDs: ["openrn_icu"]),
                AttributedBullet("ETT dislodgement — most catastrophic; pre-secure, reassess depth after every position change.", citationIDs: ["openrn_icu"]),
                AttributedBullet("CVC, arterial line, chest tube dislodgement.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Brachial plexus injury from arm malposition.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Aspiration — minimize residuals, hold feeds 1 hr pre-prone.", citationIDs: ["openrn_icu"]),
                AttributedBullet("Cardiac arrest during turn — rare but described; have full code cart at bedside.", citationIDs: ["openrn_icu"])
            ])
        ],
        citations: [prosevaGuerin, openrnICU],
        lastSourceFidelityReview: "2026-05-04"
    )
}
