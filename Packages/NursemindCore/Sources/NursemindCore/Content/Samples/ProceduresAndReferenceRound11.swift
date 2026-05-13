import Foundation

// Curator-model procedure + reference entries (round 11 expansion).
// Sources: Open RN Skills + Health Alterations (CC BY 4.0), OpenStax (CC BY 4.0 with AI restriction),
// CDC + AHA + NHPCO + ATS / SCCM / NCSBN concept citations.

private let openrnSkR11p = CitationSource(
    id: "openrn_skills_round11",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=chest+tube+cardioversion+BiPAP",
    lastRetrieved: "2026-05-04"
)
private let openrnHar11 = CitationSource(
    id: "openrn_ha_round11_proc",
    shortName: "Open RN Health Alterations + Mental Health",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=dysrhythmia+EOL+advance",
    lastRetrieved: "2026-05-04"
)
private let openstaxR11p = CitationSource(
    id: "openstax_round11_proc",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let ahaConceptR11p = CitationSource(
    id: "aha_concept_round11p",
    shortName: "AHA ACLS / dysrhythmia algorithms (concept citation)",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://cpr.heart.org/en/courses/advanced-cardiovascular-life-support-acls",
    lastRetrieved: "2026-05-04"
)
private let nhpcoConceptR11 = CitationSource(
    id: "nhpco_round11",
    shortName: "NHPCO + AAHPM hospice / EOL standards (concept citation)",
    publisher: "National Hospice and Palliative Care Organization · AAHPM",
    license: .factCitationOnly,
    url: "https://www.nhpco.org/regulatory-and-quality/standards-of-practice/",
    lastRetrieved: "2026-05-04"
)
private let polstConceptR11 = CitationSource(
    id: "polst_round11",
    shortName: "National POLST + AHRQ Advance Care Planning (concept citation)",
    publisher: "National POLST Paradigm · AHRQ",
    license: .factCitationOnly,
    url: "https://polst.org/clinical-resources/",
    lastRetrieved: "2026-05-04"
)

private let safetyR11 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let perfusionProcR11 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion)
private let respProcR11 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange)
private let dysrRefR11 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let palliativeRefR11 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort)
private let mgmtRefR11 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety)

// MARK: - Chest Tube Insertion Assist

public enum ChestTubeInsertionSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "chest-tube-insertion",
        title: "Chest tube insertion assist",
        subtitle: "Pneumothorax / hemothorax / empyema · Heimlich vs. underwater seal · post-op CXR",
        nclexTags: safetyR11,
        indications: AttributedProse(
            "Drainage of pleural air (pneumothorax), blood (hemothorax), pus (empyema), large effusion, post-cardiothoracic surgery. Emergency placement (sometimes finger thoracostomy) for tension pneumothorax per primary source.",
            citationIDs: ["openrn_skills_round11", "openstax_round11_proc"]
        ),
        contraindications: AttributedProse(
            "Coagulopathy (relative — correct first if elective; do not delay in tension PTX); skin infection at site; loculated effusion (image-guided); patient refusal.",
            citationIDs: ["openrn_skills_round11"]
        ),
        equipment: [
            AttributedBullet("Chest-tube tray — small-bore (\"pigtail\" 8–14 Fr) for air / simple effusion; large-bore (28–36 Fr) for hemothorax / empyema / post-op.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Sterile gloves, gown, mask + eye protection; chlorhexidine prep; sterile drape; lidocaine 1% with epinephrine; scalpel, hemostat (Kelly clamp), suture (silk 0 or 2-0); occlusive dressing (petroleum gauze).", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Pleur-evac (3-chamber underwater-seal drainage) OR Heimlich one-way valve (small bore for outpatient pneumothorax).", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Wall suction setup (typically -20 cmH2O); sterile water for water seal.", citationIDs: ["openrn_skills_round11"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order, indication, side / level, marked at bedside; informed consent; coag check (correct if needed and elective).", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Position — supine with affected arm raised over head OR sitting upright leaning forward (lower-rib site).", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Pre-medicate per provider — IV opioid + anxiolytic; hand the laparoscopic towel.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Set up Pleur-evac with sterile water in chambers; connect to wall suction (-20 cmH2O standard).", citationIDs: ["openrn_skills_round11"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Prep + drape", body: "Provider performs hand hygiene, dons sterile attire, preps with chlorhexidine, allows to dry, drapes.", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 2, title: "Site selection", body: "Typical — 4th–5th intercostal space (nipple line in male; inframammary fold in female), midaxillary or anterior axillary line. Apex (2nd intercostal space, midclavicular) for emergent pneumothorax decompression.", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 3, title: "Local anesthesia", body: "Lidocaine to skin → subcutaneous → over rib → through pleura (parietal pleura is most innervated).", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 4, title: "Incision + blunt dissection", body: "Provider makes ~2 cm horizontal incision OVER (not under) rib; blunt dissection with hemostat through intercostal muscles into pleural space until rush of air or fluid.", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 5, title: "Tube insertion", body: "Insert chest tube directing apex / posterior for pneumothorax; basilar / posterior for fluid; seat to appropriate depth (last fenestration well inside pleural space).", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 6, title: "Connect + secure", body: "Connect tube to Pleur-evac; verify water-seal chamber for tidaling (rises with inspiration in spontaneously breathing patient) and bubbling (active air leak). Secure with horizontal-mattress or purse-string suture; apply petroleum gauze + occlusive dressing per primary source.", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 7, title: "Post-insertion CXR", body: "Confirm tube position and lung re-expansion; note any residual pneumothorax, malposition, or unexpected fluid.", citationIDs: ["openrn_skills_round11"])
        ],
        postProcedure: [
            AttributedBullet("Continuous monitoring — vital signs, SpO2, pain; assess for tube patency, drainage volume / character, water-seal tidaling / bubbling.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Document drainage volume hourly first hour, then per facility (typically every 1–2 hours initially).", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Encourage cough, deep breath, incentive spirometry; mobilize per provider.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Tube removal per provider — typically when air leak resolved + drainage <100–200 mL/24 hr; valsalva or end-expiration during pull; occlusive dressing post-pull; CXR 1 hour after.", citationIDs: ["openrn_skills_round11"])
        ],
        documentation: [
            AttributedBullet("Site, tube size, indication, drainage characteristics + volume, water-seal status, vital signs, post-CXR results, patient tolerance.", citationIDs: ["openrn_skills_round11"])
        ],
        watchFor: [
            AttributedBullet("ACCIDENTAL DISLODGMENT — apply OCCLUSIVE petroleum-gauze dressing taped on 3 sides (allows air to escape but not enter); call provider; do NOT clamp the tube during transport.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("MORE THAN 100–200 mL/hr OF BLOODY OUTPUT — surgical thoracostomy may be needed; notify per primary source.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("LOSS OF TIDALING — tube clogged or lung re-expanded; reassess / image.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("PERSISTENT BUBBLING in water seal — air leak; check connections from patient to drainage system before assuming pulmonary leak.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("RE-EXPANSION PULMONARY EDEMA — rapid re-expansion of long-collapsed lung; supportive O2 / ventilation.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Tension pneumothorax during placement — sudden hemodynamic collapse; emergent decompression.", citationIDs: ["openrn_skills_round11"])
        ],
        citations: [openrnSkR11p, openstaxR11p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Synchronized Cardioversion

public enum CardioversionSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "synchronized-cardioversion",
        title: "Synchronized cardioversion preparation",
        subtitle: "SVT / AFib / VT WITH pulse · sedation + sync · 100–200 J biphasic",
        nclexTags: perfusionProcR11,
        indications: AttributedProse(
            "Hemodynamically UNSTABLE supraventricular tachyarrhythmia (AFib / atrial flutter / SVT) or stable VT WITH PULSE that does not respond to medications. Always SYNCHRONIZED to QRS to avoid R-on-T → VFib per primary source.",
            citationIDs: ["openrn_skills_round11", "aha_concept_round11p"]
        ),
        contraindications: AttributedProse(
            "Pulseless cardiac arrest (use UNSYNCHRONIZED defibrillation instead); digoxin toxicity (relative — risk of refractory VT); known mural thrombus on echo unless emergent; sinus tachycardia (treat underlying cause).",
            citationIDs: ["openrn_skills_round11"]
        ),
        equipment: [
            AttributedBullet("Defibrillator with SYNC button + adhesive defibrillation pads or paddles + gel.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Cardiac monitor (often integrated with defibrillator); 12-lead ECG capability.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Sedation kit — etomidate or midazolam + opioid (fentanyl) per facility / provider.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("BVM, oxygen, suction, intubation equipment in case of airway compromise.", citationIDs: ["openrn_skills_round11"])
        ],
        preProcedure: [
            AttributedBullet("Verify rhythm (12-lead ECG); verify provider order; confirm anticoagulation status for AFib >48 hr per primary source.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Informed consent if time allows; emergent only if unstable.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Pre-oxygenate; IV access × 2; baseline vitals; place defibrillation pads (anterior-posterior or anterolateral).", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Sedate with provider — etomidate 0.1–0.2 mg/kg IV OR midazolam 1–2 mg IV ± fentanyl per primary source.", citationIDs: ["openrn_skills_round11"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Confirm SYNC mode", body: "Press SYNC button on defibrillator; confirm SYNC marker on each QRS complex; if SYNC fails to mark, increase ECG amplitude or change lead.", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 2, title: "Select energy", body: "Adult — narrow regular SVT 50–100 J; AFib 120–200 J biphasic; atrial flutter 50–100 J; monomorphic VT with pulse 100 J per AHA ACLS per primary source.", citationIDs: ["aha_concept_round11p"]),
            ProcedureStep(number: 3, title: "All clear + shock", body: "\"All CLEAR — oxygen away — shock!\" Confirm no contact; press SHOCK button (may need to HOLD until next QRS — sync delays slightly).", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 4, title: "Reassess rhythm + pulse", body: "If conversion successful — note rhythm, vitals, mental status. If unsuccessful — confirm SYNC still active, increase energy, reattempt.", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 5, title: "Watch for complications", body: "Hypotension, pulmonary edema, embolic stroke (esp. AFib), skin burn, dysrhythmia.", citationIDs: ["openrn_skills_round11"])
        ],
        postProcedure: [
            AttributedBullet("Continuous cardiac monitor; vitals q15 min × 1 hr.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Anticoagulation per ACOG (3 weeks before + 4 weeks after for AFib >48 hr unless emergent and TEE-cleared) per primary source.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("12-lead post-conversion to confirm sinus rhythm; document.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Educate patient — sedation amnesia common; brief skin redness expected.", citationIDs: ["openrn_skills_round11"])
        ],
        documentation: [
            AttributedBullet("Pre-rhythm / vitals, sedation given, energy delivered, SYNC confirmed, response, complications, post-rhythm + vitals.", citationIDs: ["openrn_skills_round11"])
        ],
        watchFor: [
            AttributedBullet("UNSYNCHRONIZED shock during AFib / SVT → R-on-T → VFib; ALWAYS verify SYNC active.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Embolic stroke after AFib cardioversion >48 hr without anticoagulation — critical concern.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Hypotension / pulmonary edema post-conversion — supportive.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Skin burns from defibrillation — minimize with quality gel / pads, dry skin.", citationIDs: ["openrn_skills_round11"])
        ],
        citations: [openrnSkR11p, openstaxR11p, ahaConceptR11p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - BiPAP / NIPPV Setup

public enum BiPAPSetupSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "bipap-setup",
        title: "BiPAP / NIPPV setup and management",
        subtitle: "Bilevel pressure · COPD / cardiogenic edema · IPAP / EPAP titration",
        nclexTags: respProcR11,
        indications: AttributedProse(
            "Hypercapnic respiratory failure (COPD exacerbation pH 7.25–7.35), cardiogenic pulmonary edema, post-extubation respiratory failure, do-not-intubate patients with reversible respiratory failure, OSA / OHS per primary source.",
            citationIDs: ["openrn_skills_round11", "openstax_round11_proc"]
        ),
        contraindications: AttributedProse(
            "Apnea or near-apnea; cardiac / respiratory arrest; severe AMS / inability to protect airway; copious secretions; recent upper-GI surgery; facial trauma / surgery preventing seal; hemodynamic instability; high aspiration risk.",
            citationIDs: ["openrn_skills_round11"]
        ),
        equipment: [
            AttributedBullet("BiPAP machine with humidification; full-face or nasal-mask interface (correct sizing).", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Headgear; capnography ETCO2 line if available; pulse oximetry.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Suction at bedside; intubation tray immediately available if BiPAP fails.", citationIDs: ["openrn_skills_round11"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order — indication, IPAP / EPAP, FiO2, backup rate.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Reverse Trendelenburg or HOB ≥30°; assess airway, mental status, secretions.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Educate patient — show mask, explain pressure sensation, demonstrate stop signal.", citationIDs: ["openrn_skills_round11"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Initial settings", body: "Typical starting point — IPAP 10 cmH2O / EPAP 5 cmH2O; FiO2 to maintain SpO2 88–92% in COPD or 92–96% otherwise per primary source.", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 2, title: "Apply mask", body: "Hold mask in place initially to allow patient to acclimate; tighten headgear progressively until minimal leak; AVOID over-tightening (skin breakdown).", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 3, title: "Reassess in 30–60 min", body: "Goals — improved respiratory rate, accessory-muscle use, ABG (rise in pH, fall in PaCO2), mental status.", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 4, title: "Titrate", body: "Increase IPAP by 2 cmH2O for inadequate ventilation (rising CO2); increase EPAP for hypoxemia. Maximum typically IPAP 20 / EPAP 10 cmH2O before considering intubation per primary source.", citationIDs: ["openrn_skills_round11"]),
            ProcedureStep(number: 5, title: "Recognize failure", body: "If no improvement in 1–2 hours OR worsening — proceed to INTUBATION per primary source. BiPAP failure includes worsening ABG, AMS, hemodynamic instability, intolerance.", citationIDs: ["openrn_skills_round11"])
        ],
        postProcedure: [
            AttributedBullet("Continuous monitoring; ABG initially, then at 1 hr, 4 hr, then per protocol.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Oral / nasal care; reposition mask q2h to prevent pressure injury (especially nasal bridge).", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Allow brief breaks for eating / drinking / oral care; coordinate with team.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Wean as patient improves — reduce IPAP / EPAP / FiO2 sequentially per protocol.", citationIDs: ["openrn_skills_round11"])
        ],
        documentation: [
            AttributedBullet("Indication, settings (IPAP / EPAP / FiO2 / rate), mask type / size, ABG response, vital signs, mental status, complications, tolerance.", citationIDs: ["openrn_skills_round11"])
        ],
        watchFor: [
            AttributedBullet("INTUBATION TRIGGERS — worsening ABG (pH falling, CO2 rising), worsening mental status, hemodynamic compromise, mask intolerance.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Pressure injury at nasal bridge / chin / cheeks — protective dressings, mask rotation.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Aerophagia / gastric distension — NG tube if severe.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Aspiration — assess swallow before allowing PO; coordinate diet timing with mask removal.", citationIDs: ["openrn_skills_round11"]),
            AttributedBullet("Eye irritation from mask leak — adjust seal, lubricant.", citationIDs: ["openrn_skills_round11"])
        ],
        citations: [openrnSkR11p, openstaxR11p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Dysrhythmia Identification Reference

public enum DysrhythmiaIDSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "dysrhythmia-identification",
        title: "Dysrhythmia identification reference",
        subtitle: "Rhythm strip systematic interpretation · key rhythms by mechanism",
        eyebrow: "REFERENCE · CARDIOLOGY",
        nclexTags: dysrRefR11,
        sections: [
            .prose(title: "Systematic interpretation steps", AttributedProse(
                "Use a consistent approach for every rhythm strip: (1) RATE, (2) RHYTHM (regular / irregular), (3) P waves (present? identical? 1:1 with QRS?), (4) PR interval (0.12–0.20 sec normal), (5) QRS duration (<0.12 sec narrow / ≥0.12 wide), (6) QT interval (QTc <450 men / <460 women normal), (7) ST / T wave changes. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["aha_concept_round11p"]
            )),
            .keyValueTable(title: "Sinus rhythms", [
                KeyValueRow(key: "Sinus bradycardia", value: "Sinus rhythm <60 bpm — normal in athletes / sleep; symptomatic — atropine 0.5–1 mg IV; pacing if persistent"),
                KeyValueRow(key: "Sinus tachycardia", value: "Sinus rhythm >100 bpm — usually compensatory; treat underlying cause (hypovolemia, fever, pain, hypoxia, anemia, hyperthyroid)"),
                KeyValueRow(key: "Sinus arrhythmia", value: "Slight rate variation with respiration — physiologic")
            ]),
            .keyValueTable(title: "Atrial dysrhythmias", [
                KeyValueRow(key: "Premature atrial contractions (PAC)", value: "Early P wave with different morphology; usually benign"),
                KeyValueRow(key: "Atrial fibrillation (AFib)", value: "Irregularly irregular; no discrete P waves; rate-control + anticoagulation per CHA₂DS₂-VASc"),
                KeyValueRow(key: "Atrial flutter", value: "\"Sawtooth\" flutter waves; typically 2:1 or 4:1 conduction (atrial 250–350); same management framework as AFib"),
                KeyValueRow(key: "PSVT / AVNRT / AVRT", value: "Narrow-complex regular tachycardia 150–250; vagal → adenosine → β-blocker / CCB")
            ]),
            .keyValueTable(title: "Junctional rhythms", [
                KeyValueRow(key: "Junctional escape", value: "Rate 40–60; absent / inverted / retrograde P waves; backup pacemaker rhythm"),
                KeyValueRow(key: "Accelerated junctional", value: "Rate 60–100; cause-directed treatment (digoxin toxicity, ischemia)"),
                KeyValueRow(key: "Junctional tachycardia", value: "Rate >100; rare; treat underlying")
            ]),
            .keyValueTable(title: "Ventricular dysrhythmias", [
                KeyValueRow(key: "PVCs", value: "Wide bizarre QRS, no preceding P; isolated / coupled / bigeminy; treat underlying ischemia / electrolytes"),
                KeyValueRow(key: "VT (monomorphic)", value: "≥3 PVCs at >100; uniform morphology; stable → amiodarone; unstable with pulse → synchronized cardioversion 100 J"),
                KeyValueRow(key: "Polymorphic VT (torsades)", value: "Variable QRS axis; long QT context; magnesium 2 g IV; correct K and Mg; defibrillate if pulseless"),
                KeyValueRow(key: "VFib", value: "Chaotic; no discrete QRS; PULSELESS; defibrillate 200 J biphasic + CPR + ACLS")
            ]),
            .keyValueTable(title: "AV blocks", [
                KeyValueRow(key: "1st-degree", value: "PR >0.20 sec, all QRS conducted; usually asymptomatic"),
                KeyValueRow(key: "2nd-degree Mobitz I (Wenckebach)", value: "Progressive PR lengthening → dropped QRS; usually benign; treat reversible cause"),
                KeyValueRow(key: "2nd-degree Mobitz II", value: "Constant PR + sudden dropped QRS; high risk of progression; PERMANENT PACER per primary source"),
                KeyValueRow(key: "3rd-degree (complete)", value: "AV dissociation; ventricular escape rhythm; PERMANENT PACER")
            ]),
            .keyValueTable(title: "Other key patterns", [
                KeyValueRow(key: "WPW pattern", value: "Short PR + delta wave + wide QRS — bypass tract; AVOID AV-nodal blockers in WPW + AFib (use procainamide / cardioversion)"),
                KeyValueRow(key: "Long QT", value: "QTc >450 men / >460 women — torsades risk; review meds, electrolytes; β-blocker if congenital"),
                KeyValueRow(key: "Paced rhythm", value: "Pacing spike → QRS; assess capture (electrical) and pulse (mechanical); failure to capture / sense / pace"),
                KeyValueRow(key: "Asystole / PEA", value: "ACLS: high-quality CPR + epinephrine; identify Hs and Ts; do NOT shock asystole / PEA")
            ]),
            .bullets(title: "Universal action principles", [
                AttributedBullet("STABLE vs UNSTABLE — vital signs and mental status drive immediate intervention.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Identify reversible causes — Hs and Ts (hypovolemia, hypoxia, hydrogen ion, hypo/hyperK, hypoglycemia, hypothermia; toxins, tamponade, tension PTX, thrombosis, trauma).", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("ALWAYS pair monitor rhythm with patient assessment — pulses, BP, mental status.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Synchronized cardioversion for unstable tachyarrhythmia WITH PULSE; defibrillation for VFib / pulseless VT.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Address underlying cause and electrolyte abnormalities.", citationIDs: ["openrn_ha_round11_proc"])
            ])
        ],
        citations: [ahaConceptR11p, openrnHar11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - End-of-Life Comfort Care

public enum EOLComfortCareSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "eol-comfort-care",
        title: "End-of-life comfort care reference",
        subtitle: "Symptom-focused care · medications · family support · ethics",
        eyebrow: "REFERENCE · PALLIATIVE",
        nclexTags: palliativeRefR11,
        sections: [
            .prose(title: "Framework", AttributedProse(
                "Comfort care (also called comfort measures only or end-of-life care) is a transition of treatment goals — from disease modification to maximizing comfort, dignity, and quality of life. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["nhpco_round11"]
            )),
            .keyValueTable(title: "Common EOL symptoms + first-line treatments", [
                KeyValueRow(key: "Pain", value: "Opioid (morphine 2–5 mg PO/SL/SQ q1–2h; convert to standing scheduled dose); +/- adjuvant (NSAID, gabapentin)"),
                KeyValueRow(key: "Dyspnea", value: "Opioid (low-dose); fan toward face; oxygen only if relief; positioning"),
                KeyValueRow(key: "Anxiety", value: "Lorazepam 0.5–1 mg PO/SL/SQ q4–6h"),
                KeyValueRow(key: "Restlessness / agitation / terminal delirium", value: "Haloperidol 0.5–2 mg q4–6h; lorazepam if anxiety prominent; address pain and reversible causes"),
                KeyValueRow(key: "Nausea / vomiting", value: "Haloperidol 0.5–1 mg / olanzapine 2.5 mg / metoclopramide / dexamethasone — choose by mechanism"),
                KeyValueRow(key: "Secretions / death rattle", value: "Position change; gentle oral suction; scopolamine patch / glycopyrrolate / hyoscyamine SL — most effective EARLY"),
                KeyValueRow(key: "Constipation", value: "Senna + PEG; PAMORA if opioid-induced and refractory"),
                KeyValueRow(key: "Mucositis / mouth care", value: "Magic mouthwash; lip balm; gentle oral hygiene; ice chips"),
                KeyValueRow(key: "Pruritus", value: "Topical emollient; antihistamines; opioid rotation if opioid-induced")
            ]),
            .keyValueTable(title: "Common comfort-care kit medications (hospice)", [
                KeyValueRow(key: "Liquid morphine concentrate (20 mg/mL)", value: "0.25–0.5 mL SL q1–2h for pain / dyspnea"),
                KeyValueRow(key: "Liquid lorazepam (2 mg/mL)", value: "0.25–0.5 mL SL q4–6h for anxiety / agitation"),
                KeyValueRow(key: "Haloperidol 1 mg/mL", value: "0.5–2 mg SL/SQ q4–6h for delirium / N+V"),
                KeyValueRow(key: "Atropine 1% ophthalmic", value: "1–2 drops SL q4–6h for secretions (off-label)"),
                KeyValueRow(key: "Acetaminophen rectal", value: "650 mg PR q4–6h for fever / mild pain"),
                KeyValueRow(key: "Bisacodyl rectal", value: "10 mg PR q24h for constipation"),
                KeyValueRow(key: "Scopolamine patch", value: "1.5 mg q72h for secretions")
            ]),
            .keyValueTable(title: "Active dying signs (hours-days)", [
                KeyValueRow(key: "Decreased intake / interest in food + water", value: "Anorexia, weight loss; do NOT force-feed; mouth care"),
                KeyValueRow(key: "Increased sleep / decreased responsiveness", value: "Frequent rest; allow quiet visits"),
                KeyValueRow(key: "Skin changes", value: "Mottling (typically lower extremities), cool extremities, peripheral cyanosis"),
                KeyValueRow(key: "Respiratory pattern changes", value: "Cheyne-Stokes, apneic pauses, agonal breathing"),
                KeyValueRow(key: "Decreased urine output", value: "Concentrated urine; eventual anuria"),
                KeyValueRow(key: "Death rattle", value: "Upper airway secretions; positioning; medications"),
                KeyValueRow(key: "Terminal restlessness", value: "Often distressing to family; treat with haloperidol / lorazepam; assess for pain and bladder distension")
            ]),
            .bullets(title: "Family communication", [
                AttributedBullet("Use clear, gentle language: \"dying,\" not \"passing\"; avoid medical jargon and euphemism.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Prepare family for changes — agonal breathing, mottling, decreased responsiveness; reassure these are normal dying signs.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Permission-giving — many families need explicit permission to be present, to speak, to allow death.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Spiritual / cultural / religious accommodations — chaplain, rituals, music, presence.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Anticipatory grief support; hospice volunteer presence; bereavement follow-up.", citationIDs: ["openrn_ha_round11_proc"])
            ]),
            .bullets(title: "Ethical principles", [
                AttributedBullet("DOUBLE EFFECT — appropriate medication for symptom control may incidentally hasten death; ethically acceptable when intent is symptom relief per primary source.", citationIDs: ["nhpco_round11"]),
                AttributedBullet("Withholding / withdrawing life-sustaining treatment is ETHICALLY EQUIVALENT in the U.S. — both are accepted per AMA + Hastings Center guidance.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Voluntary stopping eating and drinking (VSED) is patient-driven; coordinate with hospice + ethics if requested.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("MEDICAL AID IN DYING (MAID) legal in some jurisdictions; institutional policy varies; nurses MAY conscientiously object per primary source.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Cultural humility — death practices vary widely; ASK family about preferences for the body, ritual, timing.", citationIDs: ["openrn_ha_round11_proc"])
            ])
        ],
        citations: [nhpcoConceptR11, openrnHar11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Death Pronouncement + Bereavement

public enum DeathPronouncementSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "death-pronouncement",
        title: "Death pronouncement and bereavement support",
        subtitle: "Steps · documentation · family conversation · cultural / religious",
        eyebrow: "REFERENCE · END OF LIFE",
        nclexTags: palliativeRefR11,
        sections: [
            .prose(title: "Framework", AttributedProse(
                "Death pronouncement is a clinical and human ritual. Approach with calm, dignity, presence. Most U.S. states allow RN pronouncement in hospice / long-term care / certain hospitals — verify scope of practice. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["nhpco_round11"]
            )),
            .keyValueTable(title: "Pronouncement steps", [
                KeyValueRow(key: "1. Confirm identity + verify expected death", value: "Two identifiers; confirm in chart that comfort care / DNR active and death anticipated"),
                KeyValueRow(key: "2. Notify family / chaplain / spiritual support", value: "Privacy, family at bedside if desired"),
                KeyValueRow(key: "3. Auscultate", value: "Heart sounds 1–2 minutes (apical); breath sounds 1–2 minutes; absence confirms"),
                KeyValueRow(key: "4. Assess responsiveness", value: "Painful stimulus, light reflex, fixed and dilated pupils"),
                KeyValueRow(key: "5. Note time of death", value: "Time of pronouncement (the legal time, not necessarily moment of last breath)"),
                KeyValueRow(key: "6. Document", value: "Time, findings, who present, family notified, cause per existing diagnosis, autopsy / organ donation discussion if applicable"),
                KeyValueRow(key: "7. Notify provider, social work, mortuary", value: "Per facility policy; some states require provider sign-off")
            ]),
            .keyValueTable(title: "Communicating with family", [
                KeyValueRow(key: "Use the WORD \"died\"", value: "\"Your father has died.\" Avoid euphemisms (\"passed,\" \"gone\")"),
                KeyValueRow(key: "Allow silence", value: "Family will react in their own way; presence is the gift"),
                KeyValueRow(key: "Permission to grieve", value: "Tears, anger, relief, denial — all normal"),
                KeyValueRow(key: "Offer time + presence", value: "Allow family time alone with body; offer to stay or leave; chaplain"),
                KeyValueRow(key: "Cultural / religious sensitivity", value: "Ask about practices for body, prayers, washing, burial timing")
            ]),
            .keyValueTable(title: "Postmortem care priorities", [
                KeyValueRow(key: "Family time first", value: "Allow loved ones to be with the body before postmortem care"),
                KeyValueRow(key: "Remove tubes / lines per protocol", value: "If autopsy planned, leave tubes in place per protocol"),
                KeyValueRow(key: "Clean and position", value: "Bathe, fresh gown, position supine, close eyes / mouth, place dentures if applicable"),
                KeyValueRow(key: "Personal items", value: "Inventory and return to family per facility"),
                KeyValueRow(key: "Identification", value: "Maintain ID bands; tag toe per facility / mortuary")
            ]),
            .bullets(title: "Bereavement support", [
                AttributedBullet("Acknowledge grief in the family — provide bereavement resources, hospice follow-up call, support-group referrals.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("CHILDREN — use concrete language at developmental level (\"Grandma died — her body stopped working\"); avoid \"sleeping\" / \"went away\" — generates fear.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Anticipatory grief — present before death; recognize and support during long illness.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Complicated grief — persistent functional impairment >12 months; refer to mental-health support per primary source.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("STAFF debrief — caring for dying patients is emotionally demanding; team huddle, EAP, peer support.", citationIDs: ["openrn_ha_round11_proc"])
            ]),
            .bullets(title: "Special situations", [
                AttributedBullet("Unexpected / traumatic death — coroner notification; preserve evidence; do not perform postmortem care without provider approval.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Organ / tissue donation — coordinate with OPO (organ procurement organization); do not request donation; OPO does so.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Pediatric / perinatal death — extra time, memory-making (footprints, hair lock, photographs), bereavement nurse / chaplain.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Patient dies alone — \"No One Dies Alone\" / vigil-volunteer programs in many institutions per primary source.", citationIDs: ["openrn_ha_round11_proc"])
            ])
        ],
        citations: [nhpcoConceptR11, openrnHar11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Advance Directives + POLST

public enum AdvanceDirectivesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "advance-directives-polst",
        title: "Advance directives + POLST overview",
        subtitle: "Living will · DPOA · POLST · DNR/DNAR · across care settings",
        eyebrow: "REFERENCE · ETHICS / ADMIN",
        nclexTags: mgmtRefR11,
        sections: [
            .prose(title: "Framework", AttributedProse(
                "Advance care planning documents allow patients to record wishes for care if they lose decision-making capacity. THIS IS A CONCEPT REFERENCE per primary source — laws vary by state / jurisdiction; verify locally before applying.",
                citationIDs: ["polst_round11"]
            )),
            .keyValueTable(title: "Living will", [
                KeyValueRow(key: "Definition", value: "Written document recording patient's wishes for life-sustaining treatment (e.g., intubation, CPR, artificial nutrition / hydration) IF terminally ill or in persistent vegetative state"),
                KeyValueRow(key: "When activated", value: "When patient lacks capacity AND condition meets state-specific trigger (typically terminal / PVS)"),
                KeyValueRow(key: "Limitations", value: "Often vague; may not address every clinical scenario; difficult to find in emergency"),
                KeyValueRow(key: "Best paired with", value: "DPOA-HC and POLST")
            ]),
            .keyValueTable(title: "Durable Power of Attorney for Health Care (DPOA-HC) / Health Care Proxy", [
                KeyValueRow(key: "Definition", value: "Legal document naming a SURROGATE to make health-care decisions if patient loses capacity"),
                KeyValueRow(key: "When activated", value: "When patient lacks decisional capacity per provider"),
                KeyValueRow(key: "Surrogate's standard", value: "Substituted judgment — what the patient would have wanted; if unknown, best interest"),
                KeyValueRow(key: "Strengths", value: "Flexible — can navigate situations not covered by living will")
            ]),
            .keyValueTable(title: "POLST / MOLST / POST (state-specific)", [
                KeyValueRow(key: "Definition", value: "Physician / Practitioner Orders for Life-Sustaining Treatment — actionable medical orders signed by provider AND patient/surrogate"),
                KeyValueRow(key: "Difference from advance directive", value: "POLST is a MEDICAL ORDER honored ACROSS care settings (home, EMS, ED, hospital, LTC); travels with patient"),
                KeyValueRow(key: "Best for", value: "Patients with serious illness or limited life expectancy (~1 year)"),
                KeyValueRow(key: "Sections", value: "(A) CPR vs DNR for cardiac arrest; (B) Medical interventions (full / selective / comfort); (C) Artificial nutrition; (D) signatures")
            ]),
            .keyValueTable(title: "DNR / DNAR / Allow Natural Death (AND)", [
                KeyValueRow(key: "DNR", value: "Do Not Resuscitate — order not to perform CPR in cardiac arrest"),
                KeyValueRow(key: "DNAR", value: "Do Not ATTEMPT Resuscitation — emphasizes that CPR is not always successful"),
                KeyValueRow(key: "AND (Allow Natural Death)", value: "Modern reframe — emphasizes goals of comfort care over withholding"),
                KeyValueRow(key: "DNI", value: "Do Not Intubate — separate from DNR; CPR can include compressions without intubation"),
                KeyValueRow(key: "Comfort Measures Only (CMO)", value: "Treatment focused entirely on symptom relief; no escalation; transitions to hospice / palliative care")
            ]),
            .keyValueTable(title: "When advance directive does NOT exist", [
                KeyValueRow(key: "Substitute decision-maker hierarchy", value: "Most states — spouse, adult children, parents, adult siblings, then friends; varies; verify state law"),
                KeyValueRow(key: "Two-physician documentation", value: "When no surrogate available, ethics + provider consensus typically required for major decisions"),
                KeyValueRow(key: "Court-appointed guardian", value: "Last resort when family disputes or no surrogate")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("ASK every adult about advance directives at admission per primary source — federal Patient Self-Determination Act requires offer.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Document existence + location of advance directive; SCAN into chart; reconcile across care settings.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Facilitate conversations — patient + family + provider; do not delay until crisis.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("If documents conflict — most recent written + signed prevails; provider order (POLST) supersedes living-will instructions when current.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("In medical emergency without documents — proceed with life-sustaining care (presumed consent); pause for advance directive review when stable.", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Patient capacity — re-assess at every transition; capacity is task-specific (may have capacity for some decisions but not others).", citationIDs: ["openrn_ha_round11_proc"]),
                AttributedBullet("Advocate for ethics consultation when conflict arises between family / care team.", citationIDs: ["openrn_ha_round11_proc"])
            ])
        ],
        citations: [polstConceptR11, nhpcoConceptR11, openrnHar11],
        lastSourceFidelityReview: "2026-05-04"
    )
}
