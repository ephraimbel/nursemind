import Foundation

// Curator-model procedures + reference (round 17 — emergency airway + trauma + critical care).

private let openrnPRR17 = CitationSource(
    id: "openrn_pr_round17",
    shortName: "Open RN Critical Care + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-04"
)
private let specialtyPRR17 = CitationSource(
    id: "specialty_pr_round17",
    shortName: "ATLS / ASA / SCCM / WHO concept citations",
    publisher: "ATLS · ASA · SCCM · WHO",
    license: .factCitationOnly,
    url: "https://www.facs.org/quality-programs/trauma/atls/",
    lastRetrieved: "2026-05-04"
)

private let procTagsR17 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let refTagsR17 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

public enum RSISample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "rapid-sequence-intubation",
        title: "Rapid sequence intubation (RSI)",
        subtitle: "Pre-oxygenation + induction + paralytic + intubation · 7 P's framework · cricoid pressure debate",
        nclexTags: procTagsR17,
        indications: AttributedProse(
            "Emergency airway management when patient cannot maintain airway / oxygenation / ventilation OR for procedural airway control with high aspiration risk. Standard for emergency intubation outside of OR per primary source.",
            citationIDs: ["specialty_pr_round17"]
        ),
        contraindications: AttributedProse(
            "Anticipated difficult airway without backup plan; severely compromised hemodynamics where induction may cause arrest (consider awake fiberoptic). Most contraindications are RELATIVE — coordinate with anesthesia.",
            citationIDs: ["specialty_pr_round17"]
        ),
        equipment: [
            AttributedBullet("Cardiac + SpO2 + capnography monitors; suction; bag-valve-mask + 100% O2 source; appropriate-size ETT + backup smaller / larger.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("Laryngoscope (Mac or Miller, video laryngoscope preferred); stylet; bougie; supraglottic airway (LMA) backup; surgical airway kit.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("Induction agent (etomidate, ketamine, propofol); paralytic (succinylcholine OR rocuronium); pre-medications (fentanyl).", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("Post-intubation sedation + paralytic infusion ready (propofol, fentanyl, cisatracurium).", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("End-tidal CO2 colorimetric / waveform; ETT confirmation tools.", citationIDs: ["specialty_pr_round17"])
        ],
        preProcedure: [
            AttributedBullet("PREPARATION — equipment ready, drugs drawn + labeled, monitoring on, IV access × 2, briefing of team roles.", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("PRE-OXYGENATION — 100% O2 NRB or BVM × 3 minutes (or 8 vital-capacity breaths); apneic oxygenation via NC at 15 L/min during apnea per primary source.", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("PRE-MEDICATION (selective) — fentanyl 1–3 mcg/kg for HTN / increased ICP; lidocaine 1.5 mg/kg for bronchospasm (less common now).", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("Predict difficult airway — LEMON (Look, Evaluate 3-3-2, Mallampati, Obstruction, Neck mobility); have backup airway plan.", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("POSITIONING — sniffing position (ear-to-sternal-notch alignment); ramped position in obese.", citationIDs: ["openrn_pr_round17"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Preparation + pre-oxygenation", body: "Equipment + drugs ready; pre-oxygenate 100% O2 × 3 minutes; positioning; brief team.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 2, title: "Pre-treatment (optional)", body: "Fentanyl 1–3 mcg/kg if HTN / increased ICP / aortic dissection.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 3, title: "Paralysis with induction", body: "Induction agent + paralytic given in rapid succession — etomidate 0.3 mg/kg OR ketamine 1–2 mg/kg OR propofol 1–2 mg/kg + succinylcholine 1.5 mg/kg OR rocuronium 1.0–1.2 mg/kg per primary source.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 4, title: "Positioning + Cricoid pressure (controversial)", body: "Sniffing position; cricoid pressure historically for aspiration prevention but evidence weak — released if poor view per primary source.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 5, title: "Placement of tube", body: "Direct or video laryngoscopy → visualize cords → pass ETT through cords → confirm position; depth typically 3 × ETT size at lip / 21–23 cm at lip.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 6, title: "Post-intubation management", body: "Confirm with capnography (gold standard) + bilateral breath sounds + chest rise; secure tube; CXR for depth verification; sedation + analgesia + paralytic infusion; ventilator settings per protocol.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 7, title: "Post-intubation safety", body: "Sedation BEFORE paralytic wears off (avoid awareness paralysis); lung-protective ventilation 6 mL/kg ideal body weight; head-of-bed 30°.", citationIDs: ["specialty_pr_round17"])
        ],
        postProcedure: [
            AttributedBullet("Capnography continuous; serial ABGs; lung-protective ventilation.", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("Adequate sedation + analgesia BEFORE paralytic wears off; daily SAT (sedation interruption) per protocol.", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("Oral care + DVT + ulcer prophylaxis bundle.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("Document — drugs + doses + view (Cormack-Lehane), attempts, complications.", citationIDs: ["openrn_pr_round17"])
        ],
        documentation: [
            AttributedBullet("Indication, drugs + doses + sequence, ETT size + depth, attempts, complications, post-intubation status.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("Pre-procedure + post-procedure SpO2 / vitals.", citationIDs: ["openrn_pr_round17"])
        ],
        watchFor: [
            AttributedBullet("ESOPHAGEAL INTUBATION — capnography is gold standard; remove + reattempt if no waveform.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("MAIN-STEM INTUBATION — auscultate bilateral breath sounds; CXR depth verification; pull back if right-sided breath sounds only.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("HYPOTENSION / cardiac arrest post-induction — pre-treat with fluids / vasopressors in shock; choose hemodynamically stable agent (etomidate, ketamine).", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("ASPIRATION — pre-anesthesia fasting often impossible in emergency; suction ready; cricoid debated.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("DIFFICULT AIRWAY — escalate to video laryngoscopy / bougie / LMA / surgical airway per algorithm; do not persist with multiple failed attempts.", citationIDs: ["specialty_pr_round17"])
        ],
        citations: [openrnPRR17, specialtyPRR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum NeedleThoracostomySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "needle-thoracostomy",
        title: "Needle thoracostomy (chest decompression)",
        subtitle: "Tension PTX rescue · 14G angiocath · 2nd ICS MCL or 5th ICS AAL · followed by chest tube",
        nclexTags: procTagsR17,
        indications: AttributedProse(
            "Emergency decompression of suspected tension pneumothorax with hemodynamic compromise — DO NOT delay for imaging confirmation. Bridge to definitive tube thoracostomy per primary source.",
            citationIDs: ["specialty_pr_round17"]
        ),
        contraindications: AttributedProse(
            "None in life-threatening tension pneumothorax. Avoid in stable patients without tension physiology — definitive tube thoracostomy preferred.",
            citationIDs: ["specialty_pr_round17"]
        ),
        equipment: [
            AttributedBullet("14-gauge (or 10G if available) angiocath, ≥5 cm length (longer in obese / muscular).", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("Chlorhexidine prep; sterile gloves; one-way valve / Heimlich valve OR finger of glove.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("Tube thoracostomy kit + chest tube to follow needle decompression.", citationIDs: ["specialty_pr_round17"])
        ],
        preProcedure: [
            AttributedBullet("Recognize tension PTX clinically — hypotension + decreased breath sounds + hyperresonance; tracheal deviation late.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("100% O2; large IV access; cardiac monitoring.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("Chlorhexidine prep at site if time permits — emergent procedure prioritizes speed over sterile technique.", citationIDs: ["openrn_pr_round17"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Identify site", body: "5th intercostal space at anterior axillary line (preferred for adequate length, less failure) OR 2nd ICS at midclavicular line (alternate, more failures in obese / muscular adults) per primary source.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 2, title: "Prep site", body: "Chlorhexidine if time permits.", citationIDs: ["openrn_pr_round17"]),
            ProcedureStep(number: 3, title: "Insert needle", body: "Advance 14G angiocath OVER the rib (avoid neurovascular bundle below rib) at 90° to chest wall until pop / hiss of air; advance catheter, withdraw needle.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 4, title: "Confirm decompression", body: "Listen for hiss of air; expect hemodynamic improvement within minutes; secure catheter; attach Heimlich valve / finger-cot one-way valve.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 5, title: "Definitive treatment", body: "Place chest tube as soon as feasible — needle is BRIDGE only.", citationIDs: ["specialty_pr_round17"])
        ],
        postProcedure: [
            AttributedBullet("Confirm clinical improvement; chest X-ray after definitive chest tube placement.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("Watch for re-tension if catheter occluded / kinked.", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("Document time + site + response; trauma surgery / pulmonology consult.", citationIDs: ["openrn_pr_round17"])
        ],
        documentation: [
            AttributedBullet("Indication, site, needle size, response, time to chest tube placement.", citationIDs: ["openrn_pr_round17"])
        ],
        watchFor: [
            AttributedBullet("FAILED DECOMPRESSION — needle too short for body habitus (use 5 cm minimum, longer in obese); try alternate site / longer needle; intercostal vessel injury.", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("RE-TENSION — clogged / kinked catheter; reassess if symptoms recur; chest tube definitive.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("PNEUMOTHORAX from procedure if no tension was actually present — minor, usually self-resolves.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("HEMORRHAGE if intercostal vessel injured — over rib (not under) entry technique.", citationIDs: ["openrn_pr_round17"])
        ],
        citations: [openrnPRR17, specialtyPRR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum CricothyroidotomySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "cricothyroidotomy",
        title: "Surgical cricothyroidotomy",
        subtitle: "CICO rescue airway · cricothyroid membrane · 6.0 ETT · transition to formal trach",
        nclexTags: procTagsR17,
        indications: AttributedProse(
            "Cannot intubate / cannot oxygenate (CICO) emergency — failed intubation + failed BVM + failed supraglottic airway in patient who cannot be ventilated. Last-resort surgical airway per ASA difficult airway algorithm per primary source.",
            citationIDs: ["specialty_pr_round17"]
        ),
        contraindications: AttributedProse(
            "Severe trauma to neck obscuring landmarks (consider tracheostomy instead); children <8 years (needle cricothyroidotomy + jet ventilation preferred over surgical) per primary source.",
            citationIDs: ["specialty_pr_round17"]
        ),
        equipment: [
            AttributedBullet("Scalpel #10 or #11 blade; bougie; 6.0 cuffed ETT (or tracheostomy tube); tracheal hook (if available); curved hemostat; suction.", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("100% O2 + BVM + ventilator backup.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("\"Scalpel-bougie\" technique kit increasingly preferred over commercial cric kits per primary source.", citationIDs: ["specialty_pr_round17"])
        ],
        preProcedure: [
            AttributedBullet("CICO criteria met; declare \"can't intubate, can't oxygenate\" — alert team, call for help, prepare surgical airway.", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("Identify cricothyroid membrane — between thyroid + cricoid cartilages; superior to suprasternal notch.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("Position — supine, neck extended; chlorhexidine if time permits; gloves on.", citationIDs: ["openrn_pr_round17"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Identify cricothyroid membrane", body: "Palpate thyroid prominence (Adam's apple) → move inferiorly → identify cricoid (firm ring below) → space between = cricothyroid membrane.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 2, title: "Stabilize larynx", body: "Non-dominant hand stabilizes larynx; thumb + middle finger.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 3, title: "Vertical skin incision", body: "Vertical 3–5 cm midline incision through skin over cricothyroid membrane (avoids vessels) per primary source.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 4, title: "Horizontal stab through membrane", body: "Horizontal stab incision through cricothyroid membrane; rotate scalpel 90° to widen opening.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 5, title: "Insert bougie", body: "Pass bougie through opening into trachea, directed caudally; feel for tracheal rings (if scalpel-bougie technique).", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 6, title: "Railroad ETT over bougie", body: "Pass 6.0 cuffed ETT over bougie into trachea; remove bougie.", citationIDs: ["specialty_pr_round17"]),
            ProcedureStep(number: 7, title: "Confirm placement + ventilate", body: "Inflate cuff; confirm with capnography + bilateral breath sounds + chest rise; secure with tape / suture.", citationIDs: ["specialty_pr_round17"])
        ],
        postProcedure: [
            AttributedBullet("Mechanical ventilation; capnography continuous.", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("Transition to formal tracheostomy or oral intubation within 72 hours (cric is bridge — high subglottic stenosis risk if prolonged).", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("Hemorrhage control; pressure / suture if bleeding.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("ICU admission; serial assessment for displacement.", citationIDs: ["openrn_pr_round17"])
        ],
        documentation: [
            AttributedBullet("Indication (CICO criteria + failed alternatives), technique, ETT size, complications, time to definitive airway.", citationIDs: ["openrn_pr_round17"])
        ],
        watchFor: [
            AttributedBullet("FALSE PASSAGE — into pretracheal tissue; capnography failure; immediate redo via different approach.", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("SUBGLOTTIC STENOSIS — long-term complication; prompt conversion to tracheostomy per primary source.", citationIDs: ["specialty_pr_round17"]),
            AttributedBullet("HEMORRHAGE — superior thyroid / cricothyroid arteries; pressure + ligation.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("TRACHEAL / ESOPHAGEAL INJURY — too aggressive incision; thoracic surgery if suspected.", citationIDs: ["openrn_pr_round17"]),
            AttributedBullet("REGULAR TRAINING + SIMULATION — rare procedure, perishable skill; team rehearsals.", citationIDs: ["specialty_pr_round17"])
        ],
        citations: [openrnPRR17, specialtyPRR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum ATLSPrimarySurveySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "atls-primary-survey",
        title: "ATLS primary survey (ABCDE)",
        subtitle: "Airway · Breathing · Circulation · Disability · Exposure · life-threats first",
        eyebrow: "REFERENCE · TRAUMA",
        nclexTags: refTagsR17,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Advanced Trauma Life Support (ATLS) primary survey — systematic identification + treatment of immediately life-threatening injuries in 10 minutes; ABCDE order; treat as you find. Secondary survey + tertiary review follow per primary source.",
                citationIDs: ["specialty_pr_round17"]
            )),
            .bullets(title: "A — Airway with cervical spine protection", [
                AttributedBullet("Assess patency, voice, foreign body, swelling, soot.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Maintain c-spine immobilization; jaw-thrust (no neck extension) for airway opening.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Definitive airway — ETT for any compromise; surgical airway if needed.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Suction + reposition + remove FB; assume cervical injury until imaging clears.", citationIDs: ["openrn_pr_round17"])
            ]),
            .bullets(title: "B — Breathing + ventilation", [
                AttributedBullet("Inspect: chest rise, symmetry, wounds, paradoxical motion (flail chest).", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Auscultate: bilateral breath sounds; percuss; palpate for crepitus.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Recognize + treat — tension PTX (needle decomp), open PTX (3-sided dressing), massive hemothorax (chest tube), flail (analgesia + supportive vent), cardiac tamponade (FAST + pericardiocentesis).", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("100% O2; pulse ox + capnography.", citationIDs: ["openrn_pr_round17"])
            ]),
            .bullets(title: "C — Circulation with hemorrhage control", [
                AttributedBullet("HR + BP + cap refill + skin color + mental status; FAST exam for occult bleeding.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Identify + control external hemorrhage — pressure, tourniquet (extremity), wound packing (junctional).", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Two large-bore IVs; balanced resuscitation 1:1:1 (PRBC:FFP:plt) for class III–IV shock; massive transfusion protocol.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("TXA within 3 hours of injury; permissive hypotension (SBP 80–90) until hemorrhage controlled in penetrating trauma; full BP for TBI.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Trauma surgery for OR; angiography for selected; resuscitative thoracotomy in extremis (penetrating).", citationIDs: ["specialty_pr_round17"])
            ]),
            .bullets(title: "D — Disability (neurologic)", [
                AttributedBullet("AVPU rapid + GCS; pupil size + reactivity; lateralizing signs.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Glucose check (rule out hypoglycemia mimicking AMS).", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Spinal cord level if cord injury suspected.", citationIDs: ["openrn_pr_round17"]),
                AttributedBullet("CT head + cervical spine for any concerning finding; neurosurgical consult.", citationIDs: ["specialty_pr_round17"])
            ]),
            .bullets(title: "E — Exposure + Environmental control", [
                AttributedBullet("Fully expose — remove all clothing; identify all wounds + bruising + mechanism clues.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Logroll for back exam; document wounds + scars + tattoos.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Prevent hypothermia — warm blankets, warmed IV fluids, room warm; trauma triad of death (hypothermia + acidosis + coagulopathy) is preventable.", citationIDs: ["specialty_pr_round17"])
            ]),
            .bullets(title: "Adjuncts to primary survey", [
                AttributedBullet("Cardiac + SpO2 + capnography monitors; arterial line for severe.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Foley catheter (urethral injury — no Foley if blood at meatus / scrotal hematoma); NG tube (avoid if midface fracture).", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Trauma series — chest, pelvis (lateral cervical historically; CT now standard).", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Type + cross; lactate; coags; ABG; lipase; b-HCG (women); urine; toxicology.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Tetanus; analgesia; antibiotics if indicated.", citationIDs: ["openrn_pr_round17"])
            ]),
            .bullets(title: "Reassess + secondary survey", [
                AttributedBullet("Re-evaluate ABCDE after each intervention; complete secondary survey (head-to-toe + history) when stabilized.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Tertiary survey 24 hours after — catches missed injuries (10–15% in major trauma).", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Trauma center transfer per state criteria; do not delay for non-essential workup.", citationIDs: ["specialty_pr_round17"])
            ])
        ],
        citations: [openrnPRR17, specialtyPRR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum WHOSurgicalSafetyChecklistSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "who-surgical-safety-checklist",
        title: "WHO Surgical Safety Checklist",
        subtitle: "Sign-in · time-out · sign-out · reduces mortality + complications",
        eyebrow: "REFERENCE · PERIOPERATIVE",
        nclexTags: refTagsR17,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "WHO Safe Surgery Saves Lives initiative — three-phase checklist (sign-in before anesthesia, time-out before incision, sign-out before patient leaves OR). Reduces mortality by ~40% + complications by ~30% in major studies. Adopted as standard of care globally per primary source.",
                citationIDs: ["specialty_pr_round17"]
            )),
            .bullets(title: "Sign-in (before anesthesia induction)", [
                AttributedBullet("Patient confirmed identity + site + procedure + consent.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Site marked / NA.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Anesthesia safety check completed.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Pulse oximeter on + functioning.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Allergies known + documented.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Difficult airway / aspiration risk identified + equipment available.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Risk of >500 mL blood loss (>7 mL/kg in children) — IV / fluids / blood plan.", citationIDs: ["specialty_pr_round17"])
            ]),
            .bullets(title: "Time-out (before skin incision)", [
                AttributedBullet("All team members introduced by name + role.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Patient + procedure + site verbally confirmed by entire team.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Surgeon — critical / unexpected steps + duration + anticipated blood loss.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Anesthesia — patient-specific concerns.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Nursing — sterility confirmation + equipment / instruments + concerns.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Antibiotic prophylaxis given within 60 min of incision (or 120 min for vancomycin / fluoroquinolones) per primary source.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Imaging available (if applicable).", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("VTE prophylaxis plan; glucose / temperature / hair removal.", citationIDs: ["specialty_pr_round17"])
            ]),
            .bullets(title: "Sign-out (before patient leaves OR)", [
                AttributedBullet("Procedure name confirmed + recorded.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Instrument + sponge + sharp count correct.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Specimens labeled correctly (including patient name).", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Equipment problems noted + addressed.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Surgeon, anesthesia, nursing — key concerns for recovery + management of patient.", citationIDs: ["specialty_pr_round17"])
            ]),
            .bullets(title: "Implementation pearls", [
                AttributedBullet("All team members must speak + actively participate; not just \"check the box\" exercise.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Team leader (often surgeon) initiates; flat hierarchy welcomes concerns from any team member.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Modify for local context but maintain core elements.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Audit + feedback — sustained adherence requires monitoring.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Role of nurse — verifying counts, advocating for patient, raising concerns; documented as part of surgical record.", citationIDs: ["openrn_pr_round17"])
            ])
        ],
        citations: [openrnPRR17, specialtyPRR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum DifficultAirwayAlgorithmSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "difficult-airway-algorithm",
        title: "ASA difficult airway algorithm",
        subtitle: "Predict · prepare · plan A/B/C · escalate to surgical airway · CICO management",
        eyebrow: "REFERENCE · AIRWAY",
        nclexTags: refTagsR17,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "ASA difficult airway algorithm — systematic approach to anticipated + unanticipated difficult airway with primary + backup plans. Goal — maintain oxygenation + ventilation; avoid catastrophic CICO scenarios. All emergency providers should rehearse + know algorithm per primary source.",
                citationIDs: ["specialty_pr_round17"]
            )),
            .bullets(title: "Prediction (LEMON)", [
                AttributedBullet("L — Look externally for anatomic concerns.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("E — Evaluate 3-3-2 rule — 3 finger mouth opening, 3 finger hyo-mental, 2 finger thyro-hyoid distances.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("M — Mallampati class III–IV difficult.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("O — Obstruction / obesity.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("N — Neck mobility (cervical spine, RA, ankylosing spondylitis, halo).", citationIDs: ["specialty_pr_round17"])
            ]),
            .bullets(title: "Anticipated difficult airway", [
                AttributedBullet("Awake intubation strategy — fiberoptic / video laryngoscopy with sedation (ketamine or dexmedetomidine), topical anesthesia.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Pre-position equipment + backup; second provider available; plan for surgical airway.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Verify ability to ventilate before paralysis.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Consider regional / monitored anesthesia care alternative if procedure permits.", citationIDs: ["specialty_pr_round17"])
            ]),
            .bullets(title: "Unanticipated difficult intubation (cannot intubate)", [
                AttributedBullet("Plan A — direct or video laryngoscopy; max 3 attempts.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Plan B — supraglottic airway (LMA, i-gel) if can ventilate.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Plan C — bag-valve-mask ventilation (consider 2-person, oral / nasal airway, jaw thrust).", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Plan D — surgical airway (cricothyroidotomy) if Plans A-C fail (CICO).", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Wake patient up if stable + non-emergent procedure feasible.", citationIDs: ["specialty_pr_round17"])
            ]),
            .bullets(title: "CICO management (Cannot Intubate, Cannot Oxygenate)", [
                AttributedBullet("Declare CICO out loud — alerts team to imminent surgical airway.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Continue 100% O2 BVM + supraglottic; surgical airway initiated promptly per primary source.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Cricothyroidotomy preferred in adults; needle cricothyroidotomy + jet ventilation in children <8.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Don't persist with multiple failed laryngoscopy attempts — each attempt worsens edema + bleeding.", citationIDs: ["specialty_pr_round17"])
            ]),
            .bullets(title: "Equipment readiness", [
                AttributedBullet("Direct + video laryngoscopy at every emergency intubation.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Bougie + multiple ETT sizes + supraglottic airway sizes.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Surgical airway kit immediately available + everyone knows location.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Capnography mandatory — confirms ETT placement.", citationIDs: ["openrn_pr_round17"]),
                AttributedBullet("Suction + 100% O2 source + monitors checked before induction.", citationIDs: ["openrn_pr_round17"])
            ]),
            .bullets(title: "Post-difficult airway", [
                AttributedBullet("Document — ASA difficult airway notification card / wristband for patient + family.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Notify primary care + anesthesia for future procedures.", citationIDs: ["openrn_pr_round17"]),
                AttributedBullet("Debrief team — lessons learned + system improvement.", citationIDs: ["specialty_pr_round17"])
            ])
        ],
        citations: [openrnPRR17, specialtyPRR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum TransfusionReactionRecognitionSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "transfusion-reaction-protocol",
        title: "Transfusion reaction recognition + management",
        subtitle: "STOP transfusion · symptom-based recognition · blood bank workup · prevention bundles",
        eyebrow: "REFERENCE · TRANSFUSION SAFETY",
        nclexTags: refTagsR17,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Transfusion reactions range from mild febrile / allergic to life-threatening AHTR / TRALI / TACO / sepsis. STOP transfusion at first sign + assess; differentiate type quickly to guide treatment + prevent future episodes per primary source.",
                citationIDs: ["specialty_pr_round17"]
            )),
            .keyValueTable(title: "Reaction type · key features · timing", [
                KeyValueRow(key: "Acute hemolytic (AHTR)", value: "Fever + back pain + hypotension + hemoglobinuria + DIC; minutes; ABO-incompatible; clerical error usually"),
                KeyValueRow(key: "Febrile non-hemolytic (FNHTR)", value: "Isolated fever / chills; mild; pre-existing leukocyte antibodies; common (especially with pooled platelets); leukoreduction reduces"),
                KeyValueRow(key: "Allergic / urticarial", value: "Hives + pruritus, mild; antihistamines; resume if mild after 30 min"),
                KeyValueRow(key: "Anaphylactic", value: "Hypotension + bronchospasm + angioedema; IgA deficient recipient anti-IgA in plasma; epinephrine + IgA-deficient products"),
                KeyValueRow(key: "TRALI", value: "Hypoxia + bilateral infiltrates within 6 hr; donor anti-HLA / anti-HNA; lung-protective ventilation; fluids cautious"),
                KeyValueRow(key: "TACO", value: "Hypoxia + hypertension + JVD within 6 hr; volume overload; diuretics + slow rate"),
                KeyValueRow(key: "Septic transfusion (BTR)", value: "Fever + hypotension + rigors; bacterial contamination (especially platelets); broad-spectrum abx + cultures"),
                KeyValueRow(key: "Delayed hemolytic (DHTR)", value: "Falling Hgb + jaundice 3–14 days post; non-ABO antibodies (Kidd, Kell, Duffy); supportive"),
                KeyValueRow(key: "Iron overload", value: "Chronic transfusion — DM, cardiomyopathy, cirrhosis; chelation"),
                KeyValueRow(key: "Post-transfusion purpura", value: "Profound thrombocytopenia 5–10 days post; HPA-1a antibodies; IVIG"),
                KeyValueRow(key: "Graft-versus-host disease", value: "Rare; immunocompromised recipient; irradiated products prevent"),
                KeyValueRow(key: "Hyperkalemic cardiac arrest", value: "Massive transfusion in peds / renal failure; aged units high K+; monitor + use fresher units")
            ]),
            .bullets(title: "Universal initial response to suspected reaction", [
                AttributedBullet("STOP transfusion immediately; maintain IV access with NS via separate tubing.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Verify patient + unit identity + label vs blood bank record.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Vital signs + symptom assessment.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Notify provider + blood bank.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Send unit + tubing + post-reaction blood + urine to blood bank for workup.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Document reaction in medical record + transfusion reaction form.", citationIDs: ["openrn_pr_round17"])
            ]),
            .bullets(title: "Triage decision tree", [
                AttributedBullet("Mild allergic (urticaria) only → diphenhydramine; resume slowly if symptoms resolve in 30 min.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Fever / chills only → acetaminophen; consider FNHTR; do not resume the same unit; investigate AHTR / sepsis.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Hypotension + back pain + dark urine → AHTR — supportive + workup.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Hypoxia + infiltrates → TRALI vs TACO — BNP + clinical features.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Anaphylaxis → epinephrine + airway + shock care; consider IgA deficiency workup.", citationIDs: ["specialty_pr_round17"])
            ]),
            .bullets(title: "Prevention", [
                AttributedBullet("Two-person identity verification at bedside before initiating; barcode scanning.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Vital signs before, 15 minutes in, end of transfusion + 30 minutes post.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Slow start (50 mL first 15 min) — most reactions occur in first 15 min.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Leukoreduction (universal in most centers) reduces FNHTR + CMV transmission.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("IgA-deficient recipient — washed RBCs / IgA-deficient plasma.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Irradiated products — for immunocompromised + intrauterine + neonatal transfusions.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("CMV-negative products for at-risk populations.", citationIDs: ["specialty_pr_round17"]),
                AttributedBullet("Slow rate + pre-diuretic for high-risk TACO patients.", citationIDs: ["specialty_pr_round17"])
            ])
        ],
        citations: [openrnPRR17, specialtyPRR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}
