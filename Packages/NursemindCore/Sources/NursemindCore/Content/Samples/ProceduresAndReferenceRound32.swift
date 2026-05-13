import Foundation

// Curator-model procedures + reference (round 32 — critical care: central line + PA cath + cricothyrotomy + ARDS + vent modes + shock algorithm + HTN emergency).

private let openrnPRR32 = CitationSource(
    id: "openrn_pr_round32",
    shortName: "Open RN Nursing Skills + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcPRR32 = CitationSource(
    id: "cdc_pr_round32",
    shortName: "CDC + NHLBI + AHA concept citations",
    publisher: "CDC · NHLBI · AHA",
    license: .publicDomain,
    url: "https://www.cdc.gov/hai/bsi/clabsi-prevention.html",
    lastRetrieved: "2026-05-13"
)
private let specialtyPRR32 = CitationSource(
    id: "specialty_pr_round32",
    shortName: "SCCM + ACCP + ATS + AHA + ESC concept citations",
    publisher: "SCCM · ACCP · ATS · AHA · ESC",
    license: .factCitationOnly,
    url: "https://www.sccm.org/Clinical-Resources/",
    lastRetrieved: "2026-05-13"
)

private let procTagsR32 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .perfusion
)
private let refTagsR32 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .perfusion
)

public enum CentralLineInsertionSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "central-line-insertion",
        title: "Central venous catheter (CVC) insertion + sterile technique",
        subtitle: "Internal jugular vs subclavian vs femoral · ultrasound guidance · maximal sterile barrier · CLABSI prevention bundle · CXR confirm tip + pneumothorax",
        nclexTags: procTagsR32,
        indications: AttributedProse(
            "Central venous access — multilumen catheter in central vein for: vasoactive drug infusions (vasopressors, inotropes, irritant medications), TPN, frequent blood draws, hemodynamic monitoring (CVP, ScvO2), high-volume IV access, emergent resuscitation, hemodialysis access (HD catheter), poor peripheral access. Sites — internal jugular (preferred — ultrasound-guidable + lower pneumothorax + comfortable), subclavian (best CLABSI prevention + most patient mobility + highest pneumothorax + non-compressible), femoral (emergent + obese + supraclavicular issues + higher CLABSI + DVT risk) per primary source.",
            citationIDs: ["specialty_pr_round32"]
        ),
        contraindications: AttributedProse(
            "Local infection at insertion site; severe coagulopathy uncorrected (relative — internal jugular under ultrasound feasible with caution); thrombus in target vein; uncooperative patient (consider femoral or sedation); subclavian — pneumothorax history on opposite side (avoid bilateral risk).",
            citationIDs: ["specialty_pr_round32"]
        ),
        equipment: [
            AttributedBullet("Sterile central line kit — multilumen catheter (7-8.5 Fr triple, quad, or hemodialysis lumen 11.5-12 Fr), guidewire, dilator, scalpel, sterile drapes, mask, gown, sterile gloves.", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("Ultrasound machine + sterile probe cover (internal jugular preferred site for US guidance).", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("CHLORHEXIDINE 2% prep solution (large prep zone); maximum sterile barrier — large sterile drape covering full body.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("Lidocaine 1% with epinephrine for local anesthesia.", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("Suture material (silk 2-0) + sterile dressing + biopatch (chlorhexidine-impregnated disc).", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("Sterile saline flushes; needleless connectors; transparent sterile dressing.", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("ECG monitoring + emergency resuscitation supplies; sterile pressure transducer for CVP.", citationIDs: ["specialty_pr_round32"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders + indication + duration of need; CBC + platelet count + INR/PTT.", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("Anticoagulation reversal — INR <1.5, platelets >50K (>100K for subclavian); reverse if necessary; some emergent insertions proceed with caution.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("Patient education + INFORMED CONSENT (verbal in emergent).", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("HAND HYGIENE + maximum sterile barrier setup; surgical hand prep.", citationIDs: ["cdc_pr_round32"]),
            AttributedBullet("Position — supine + Trendelenburg for IJ + subclavian (engorges veins, reduces air embolism); head turned contralateral for IJ.", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("CHLORHEXIDINE prep large area + allow to dry × 30 seconds.", citationIDs: ["cdc_pr_round32"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Site selection + ultrasound", body: "Identify anatomy with ultrasound; internal jugular preferred (above clavicle, lateral to carotid); subclavian + femoral alternatives; assess vein patency + size + compressibility; identify nearby artery + landmarks.", citationIDs: ["specialty_pr_round32"]),
            ProcedureStep(number: 2, title: "Local anesthesia + needle puncture", body: "Lidocaine 1% subcutaneous wheal + deeper infiltration; 18-gauge introducer needle attached to syringe; advance under ultrasound visualization or anatomic landmarks; aspirate continuously; flash of venous blood confirms entry.", citationIDs: ["specialty_pr_round32"]),
            ProcedureStep(number: 3, title: "Seldinger technique", body: "Once venous blood flash; remove syringe; insert guidewire through needle; advance gently; remove needle leaving wire; observe ECG for ventricular ectopy (over-insertion); make small skin nick at wire entry.", citationIDs: ["openrn_pr_round32"]),
            ProcedureStep(number: 4, title: "Dilator + catheter advancement", body: "Dilator over wire to enlarge tract; remove dilator + advance catheter over wire to predetermined depth (right IJ ~14-16 cm, left IJ ~16-18 cm, right subclavian ~14-16 cm, left subclavian ~16-18 cm, femoral ~30-50 cm); remove wire (\"wire still here?\" verification); aspirate each port for blood return + flush with saline.", citationIDs: ["specialty_pr_round32"]),
            ProcedureStep(number: 5, title: "Securement + dressing", body: "Suture catheter to skin (silk 2-0 at each securement point); BIOPATCH (chlorhexidine disc) over insertion site; sterile transparent dressing; date dressing.", citationIDs: ["openrn_pr_round32"]),
            ProcedureStep(number: 6, title: "Verification", body: "POST-INSERTION CHEST X-RAY for IJ + subclavian — confirms tip position at SVC/cavoatrial junction + rules out pneumothorax + hemothorax; verify before using for medications; femoral does not require routine CXR.", citationIDs: ["specialty_pr_round32"])
        ],
        postProcedure: [
            AttributedBullet("CXR within 1 hour for IJ + subclavian — tip position + rule out complications; do NOT use until verified.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("Daily site inspection + dressing change weekly OR sooner if compromised; chlorhexidine prep.", citationIDs: ["cdc_pr_round32"]),
            AttributedBullet("Daily review of necessity — remove ASAP when no longer needed to reduce CLABSI risk; CDC CUSP/Comprehensive Unit-based Safety Program reduces CLABSI.", citationIDs: ["cdc_pr_round32"]),
            AttributedBullet("Counsel patient — keep dressing dry, no manipulation, signs/symptoms of infection (redness, pain, drainage, fever), bleeding.", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("Document — site, length, complications, sutures, dressing, CXR verification.", citationIDs: ["openrn_pr_round32"])
        ],
        documentation: [
            AttributedBullet("Indication, site, technique (US-guided vs landmark), attempts, complications, dressing, CXR verification.", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("Daily — site assessment, line indication, removal criteria.", citationIDs: ["cdc_pr_round32"]),
            AttributedBullet("CLABSI surveillance + reporting per CDC NHSN.", citationIDs: ["cdc_pr_round32"])
        ],
        watchFor: [
            AttributedBullet("PNEUMOTHORAX (IJ ~1-5%, subclavian ~2-10%) — emergent CXR; chest tube if significant; tension pneumothorax life-threatening.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("ARTERIAL PUNCTURE — carotid (IJ), subclavian artery; firm pressure 10-15 min; vascular surgery if persistent bleeding or pseudoaneurysm; rare CVA from inadvertent arterial catheter.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("HEMATOMA + BLEEDING — pressure; coagulopathy reversal.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("CATHETER MALPOSITION — tip in atrium, contralateral subclavian, IVC, internal jugular; CXR confirms; reposition if needed; do NOT use until correct.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("AIR EMBOLISM — clamp catheter when disconnected; Trendelenburg left lateral if suspected.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("CARDIAC ARRHYTHMIA — wire/catheter in atrium triggers ectopy; pull back 1-2 cm; usually resolves.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("CLABSI (central line-associated bloodstream infection) — fever, chills, hypotension; blood cultures (peripheral + central); empiric antibiotics + line removal if catheter-related.", citationIDs: ["cdc_pr_round32"]),
            AttributedBullet("CATHETER-RELATED THROMBOSIS — upper extremity / IJ / subclavian DVT; chronic if line in place long-term.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("CDC CLABSI PREVENTION BUNDLE — hand hygiene, maximum sterile barrier, chlorhexidine antisepsis, optimal site (avoid femoral when possible), daily review of line necessity, daily oral chlorhexidine, biopatch use.", citationIDs: ["cdc_pr_round32"]),
            AttributedBullet("Femoral — higher CLABSI + DVT + infection risk; avoid when possible; choose IJ or subclavian first.", citationIDs: ["specialty_pr_round32"])
        ],
        citations: [openrnPRR32, cdcPRR32, specialtyPRR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CricothyrotomySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "cricothyrotomy",
        title: "Cricothyrotomy / surgical airway",
        subtitle: "Emergency airway when can't intubate can't ventilate (CICV) · failed intubation algorithm endpoint · scalpel-finger-bougie technique · life-saving",
        nclexTags: procTagsR32,
        indications: AttributedProse(
            "EMERGENCY AIRWAY when can't intubate can't ventilate (CICV) scenario — failed conventional intubation + cannot adequately ventilate by bag-mask + supraglottic airway. Endpoint of difficult airway algorithm. Causes — severe facial/oral trauma + bleeding, severe upper airway obstruction (angioedema, anaphylaxis, foreign body, tumor, infection — epiglottitis, Ludwig angina), severe burns to face + airway, fixed flexion deformities, anatomic challenges. Two main techniques — scalpel-finger-bougie (open surgical) OR percutaneous needle/Seldinger; surgical preferred for adult emergencies per primary source.",
            citationIDs: ["specialty_pr_round32"]
        ),
        contraindications: AttributedProse(
            "Tracheal injury at intended site; gross distortion of neck anatomy preventing identification of landmarks; age <12 years (pediatric uses needle cricothyrotomy with transtracheal ventilation due to anatomic differences); no absolute contraindications in true emergency airway.",
            citationIDs: ["specialty_pr_round32"]
        ),
        equipment: [
            AttributedBullet("Surgical cricothyrotomy kit (or improvised) — scalpel #11 or #15 blade, BOUGIE (gum elastic), 6.0-7.0 endotracheal tube (cuffed) OR Shiley tracheostomy tube, syringe + saline.", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("Sterile gloves, mask, eye protection; sterile drape if time permits (often emergency without time).", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("Chlorhexidine prep + lidocaine for awake/sedated patients; rapid in arrest situations.", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("Bag-valve mask + supplemental oxygen + ventilator connections.", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("Suction setup + ETCO2 capnograph for confirmation.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("Surgical airway training + simulator practice — most providers infrequent use.", citationIDs: ["specialty_pr_round32"])
        ],
        preProcedure: [
            AttributedBullet("EMERGENCY scenario typically — limited time; communicate clearly + assemble team + assign roles.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("Patient positioning — supine + neck extended (towel roll under shoulders); identify landmarks — thyroid cartilage + cricoid cartilage + cricothyroid membrane.", citationIDs: ["openrn_pr_round32"]),
            AttributedBullet("Failed airway algorithm followed — laryngoscopy, video laryngoscopy, supraglottic airway, all failed → cricothyrotomy.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("Notify OR + ENT + anesthesia + general surgery; tracheostomy may follow.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("Bag-mask ventilation continues to oxygenate while preparing.", citationIDs: ["openrn_pr_round32"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Anatomic identification + immobilization", body: "Identify landmarks — thyroid cartilage prominence (Adam's apple) + cricoid cartilage below; CRICOTHYROID MEMBRANE between them; stabilize larynx with non-dominant hand thumb + middle finger on either side; index finger palpates cricothyroid membrane.", citationIDs: ["specialty_pr_round32"]),
            ProcedureStep(number: 2, title: "Vertical incision", body: "VERTICAL midline skin incision ~3-4 cm long over cricothyroid membrane (vertical to avoid major vessels; some prefer horizontal); deep enough to expose cricothyroid membrane; bleeding can be controlled with pressure or epinephrine-soaked gauze later.", citationIDs: ["specialty_pr_round32"]),
            ProcedureStep(number: 3, title: "Horizontal stab through membrane", body: "Horizontal incision through cricothyroid membrane with #11 scalpel blade — feel pop as airway entered.", citationIDs: ["specialty_pr_round32"]),
            ProcedureStep(number: 4, title: "Finger sweep + bougie insertion", body: "Insert finger through incision to confirm airway entry (\"FEEL\" for tracheal rings); insert BOUGIE through opening into trachea distally; finger remains in trachea until tube placed.", citationIDs: ["specialty_pr_round32"]),
            ProcedureStep(number: 5, title: "Tube insertion + cuff inflation", body: "Slide 6.0 cuffed endotracheal tube (OR Shiley) over bougie into trachea; remove bougie + finger; inflate cuff with 5-10 mL air; CONFIRM placement with bag-valve ventilation + chest rise + ETCO2 capnograph (gold standard).", citationIDs: ["specialty_pr_round32"]),
            ProcedureStep(number: 6, title: "Securement + monitoring", body: "Secure tube to neck with sutures or twill tape; bag-valve ventilation initially → mechanical ventilation; chest x-ray to confirm position (above carina, below cricothyroid membrane).", citationIDs: ["openrn_pr_round32"]),
            ProcedureStep(number: 7, title: "Transition to definitive airway", body: "Cricothyrotomy is TEMPORARY (24-72 hours); convert to FORMAL TRACHEOSTOMY within 24-72 hours to reduce subglottic stenosis risk; ENT/general surgery consultation.", citationIDs: ["specialty_pr_round32"])
        ],
        postProcedure: [
            AttributedBullet("ICU + mechanical ventilation; supportive care of underlying condition (airway obstruction, trauma).", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("Convert to TRACHEOSTOMY within 24-72 hours; cricothyrotomy site closure if appropriate.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("Antibiotic prophylaxis — debated; not routinely indicated for clean cricothyrotomy; consider if contaminated.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("Monitor for subglottic stenosis — laryngoscopy at 6 weeks + symptom assessment.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("Document — indication, technique, complications, transition planning.", citationIDs: ["openrn_pr_round32"])
        ],
        documentation: [
            AttributedBullet("EMERGENCY indication + failed airway algorithm steps + airway management + complications + outcome.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("Cricothyrotomy → tracheostomy transition; follow-up.", citationIDs: ["specialty_pr_round32"])
        ],
        watchFor: [
            AttributedBullet("MISIDENTIFICATION of landmarks — particularly obese, swollen, distorted neck; incorrect placement; ultrasound guidance can help when time permits.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("BLEEDING from anterior jugular veins + thyroid vessels — pressure + cauterization; uncommon if vertical incision over cricothyroid membrane.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("FALSE PASSAGE — extra-tracheal tube placement; emergent reassessment + repositioning; CO2 confirmation essential.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("SUBGLOTTIC STENOSIS — long-term complication; convert to tracheostomy within 24-72 hours to reduce risk.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("LARYNGEAL injury — cricoid cartilage damage; voice change + airway compromise long-term.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("PEDIATRIC differences — needle cricothyrotomy with transtracheal jet ventilation for age <12 years; anatomy + small airway considerations.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("PROVIDER experience — most providers infrequent use; simulation training + difficult airway training essential.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("FAILED airway algorithms — ASA + difficult airway society protocols; surgical cricothyrotomy is endpoint; never delay beyond minimum optimization attempts.", citationIDs: ["specialty_pr_round32"]),
            AttributedBullet("MORTALITY — patients in CICV scenario have high mortality regardless; cricothyrotomy life-saving when successful + timely.", citationIDs: ["specialty_pr_round32"])
        ],
        citations: [openrnPRR32, cdcPRR32, specialtyPRR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ARDSManagementSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ards-management-protocol",
        title: "ARDS management protocol",
        subtitle: "Lung-protective ventilation (TV 6 mL/kg PBW + plateau ≤30 + driving pressure ≤15) · prone positioning · neuromuscular blockade severe · conservative fluids · ECMO refractory",
        eyebrow: "REFERENCE · CRITICAL CARE",
        nclexTags: refTagsR32,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Acute respiratory distress syndrome (ARDS) — acute hypoxemic respiratory failure with bilateral infiltrates not fully explained by cardiac failure + onset within 7 days. Berlin definition severity by PaO2/FiO2 (mild >200, moderate 100-200, severe <100). Mainstay = LUNG-PROTECTIVE VENTILATION (6 mL/kg PBW + plateau ≤30 + driving pressure ≤15); PRONE POSITIONING for moderate-severe; neuromuscular blockade for severe early ARDS (cisatracurium); conservative fluid management; ECMO for refractory; treat underlying cause per primary source.",
                citationIDs: ["specialty_pr_round32"]
            )),
            .keyValueTable(title: "Berlin definition (2012)", [
                KeyValueRow(key: "Timing", value: "Within 7 days of known clinical insult or worsening respiratory symptoms"),
                KeyValueRow(key: "Imaging", value: "Bilateral opacities on chest X-ray or CT not fully explained by effusions, lobar/lung collapse, or nodules"),
                KeyValueRow(key: "Origin", value: "Respiratory failure not fully explained by cardiac failure or fluid overload (objective assessment with echo if no risk factors present)"),
                KeyValueRow(key: "Oxygenation", value: "Mild: PaO2/FiO2 200-300 with PEEP/CPAP ≥5; Moderate: 100-200 with PEEP ≥5; Severe: <100 with PEEP ≥5")
            ]),
            .keyValueTable(title: "Lung-protective ventilation (ARDSnet)", [
                KeyValueRow(key: "Tidal volume (TV)", value: "6 mL/kg PREDICTED BODY WEIGHT (PBW = 50 + 2.3 × (height in inches − 60) male; 45.5 + same female); reduce to 4 mL/kg if plateau >30; permit higher TV (8 mL/kg) if patient discomfort + plateau <25"),
                KeyValueRow(key: "Plateau pressure", value: "Target ≤30 cm H2O; measured during inspiratory pause"),
                KeyValueRow(key: "Driving pressure", value: "Plateau - PEEP ≤15 cm H2O (driving pressure most strongly correlates with mortality in ARDSnet meta-analysis)"),
                KeyValueRow(key: "PEEP", value: "Higher PEEP for moderate-severe ARDS; titration tables (ARDSnet low + high) OR esophageal manometry-guided transpulmonary pressure"),
                KeyValueRow(key: "FiO2", value: "Lowest to achieve SpO2 88-95% or PaO2 55-80 mm Hg"),
                KeyValueRow(key: "Respiratory rate", value: "Adjust to maintain pH 7.30-7.45; permissive hypercapnia acceptable (pH 7.20-7.45)"),
                KeyValueRow(key: "I:E ratio", value: "1:1 to 1:2 typically; longer expiratory time for COPD overlap")
            ]),
            .keyValueTable(title: "Adjunct therapies for moderate-severe ARDS", [
                KeyValueRow(key: "Prone positioning", value: "PROSEVA trial — ≥16 hours/day for moderate-severe (PaO2/FiO2 <150); significant mortality benefit; experienced team essential; manage hemodynamics, pressure injuries, ETT, lines"),
                KeyValueRow(key: "Neuromuscular blockade", value: "ACURASYS — early severe ARDS (PaO2/FiO2 <150) for 48 hours; CISATRACURIUM continuous infusion; ROSE trial subsequent (no benefit); selective use; mortality + sedation + paralysis"),
                KeyValueRow(key: "Conservative fluid strategy", value: "FACTT trial — net negative balance in stable ARDS reduces ventilator days + mortality (vs liberal); balance with sepsis early goal-directed therapy"),
                KeyValueRow(key: "Inhaled pulmonary vasodilators", value: "Inhaled NITRIC OXIDE OR inhaled EPOPROSTENOL — short-term improvement in oxygenation; no mortality benefit; bridging in select"),
                KeyValueRow(key: "ECMO", value: "EOLIA trial — VV-ECMO for refractory severe ARDS (PaO2/FiO2 <80 or <50 with FiO2 >80% × 6 hours OR refractory acidosis); specialized centers; mortality reduction in selected"),
                KeyValueRow(key: "Steroids", value: "Use varied; dexamethasone shown survival benefit in COVID-19 ARDS (RECOVERY trial); use depends on cause — methylprednisolone for moderate-severe ARDS not from infection (specific studies)"),
                KeyValueRow(key: "High-frequency oscillatory ventilation (HFOV)", value: "OSCAR + OSCILLATE trials — no benefit, possibly harm; generally NOT recommended"),
                KeyValueRow(key: "Recruitment maneuvers", value: "May briefly improve oxygenation; routine use questioned; selective + careful titration")
            ]),
            .keyValueTable(title: "Treatment of underlying cause", [
                KeyValueRow(key: "Sepsis", value: "Source control + appropriate antibiotics within 1 hour + adequate resuscitation + sepsis bundle"),
                KeyValueRow(key: "Pneumonia", value: "Empiric + targeted antibiotics; cultures; viral testing"),
                KeyValueRow(key: "Aspiration", value: "Suction + airway support; antibiotics if subsequent pneumonia (NOT prophylactic)"),
                KeyValueRow(key: "Drug-induced", value: "Discontinue offending agent; supportive"),
                KeyValueRow(key: "Pancreatitis + pancreatic ARDS", value: "Treat pancreatitis + supportive"),
                KeyValueRow(key: "Transfusion-related (TRALI)", value: "Supportive; rule out other causes; report"),
                KeyValueRow(key: "Pulmonary contusion", value: "Trauma management + supportive ventilation"),
                KeyValueRow(key: "Inhalational injury", value: "Bronchoscopy + supportive; carbon monoxide poisoning workup"),
                KeyValueRow(key: "Anaphylaxis", value: "Epinephrine + steroids + antihistamines + supportive")
            ]),
            .bullets(title: "Implementation principles", [
                AttributedBullet("Recognize ARDS early — apply lung-protective ventilation; reduce TV + plateau + driving pressure aggressively.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("PRONE positioning team — communication + safety + complications management; pressure injury prevention essential.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("FLUID management — conservative in stable; liberal initially during resuscitation; daily reassessment.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Daily SAT/SBT + ABCDEF bundle to reduce ventilator duration + ICU-acquired weakness + delirium.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("ECMO referral when criteria met; mobile ECMO teams + specialized centers.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Treat underlying cause — most important to long-term outcome.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Multidisciplinary team — critical care + pulmonology + respiratory therapy + nursing leadership + ICU nutrition + PT/OT for rehabilitation.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Outcomes — ARDS mortality remains 30-40%; survivors have post-ARDS syndrome (functional + cognitive + psychological); rehabilitation + follow-up clinic.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Family communication — early + ongoing; ICU diary; goals of care; advance directives.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Quality improvement + adherence to protocols + ARDSnet protocols + ABCDEF bundle compliance + mortality outcomes.", citationIDs: ["specialty_pr_round32"])
            ])
        ],
        citations: [openrnPRR32, cdcPRR32, specialtyPRR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum VentModesSelectionSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "mechanical-ventilation-modes-selection",
        title: "Mechanical ventilation modes + selection",
        subtitle: "Volume vs pressure control · AC vs SIMV vs PSV · PRVC · APRV · weaning + extubation · indications + complications · liberation strategies",
        eyebrow: "REFERENCE · CRITICAL CARE",
        nclexTags: refTagsR32,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Mechanical ventilation modes vary by trigger (patient or time), control (volume or pressure), cycling (volume, time, flow), and breath types. Selection depends on patient effort, disease state, oxygenation/ventilation goals, and weaning trajectory. Common modes — Assist-Control (AC), Synchronized Intermittent Mandatory Ventilation (SIMV), Pressure Support Ventilation (PSV), Pressure-Regulated Volume Control (PRVC), Airway Pressure Release Ventilation (APRV), and non-invasive modes per primary source.",
                citationIDs: ["specialty_pr_round32"]
            )),
            .keyValueTable(title: "Volume-controlled modes", [
                KeyValueRow(key: "Assist-Control (AC) Volume", value: "Set TV + RR + FiO2 + PEEP + I:E; patient triggers OR time-triggered; same TV delivered each breath; guarantees minimum ventilation; can develop auto-PEEP if patient tachypneic"),
                KeyValueRow(key: "SIMV Volume", value: "Set TV + RR; mandatory breaths synchronized with patient effort; between mandatory breaths patient breathes spontaneously (often with PSV); used for weaning historically (less now)"),
                KeyValueRow(key: "Indications", value: "Most ARDS + acute respiratory failure; precise tidal volume control important"),
                KeyValueRow(key: "Considerations", value: "Risk of barotrauma if compliance changes; need to monitor plateau pressure")
            ]),
            .keyValueTable(title: "Pressure-controlled modes", [
                KeyValueRow(key: "Pressure-Control (PC) AC", value: "Set inspiratory pressure (above PEEP) + RR + I:E + PEEP + FiO2; TV varies with compliance + resistance; protects against barotrauma; pressure-limited"),
                KeyValueRow(key: "Pressure Support Ventilation (PSV)", value: "Set pressure support level (above PEEP) + PEEP + FiO2; patient triggers + cycles (flow-cycled); for spontaneously breathing; weaning + comfort + non-invasive"),
                KeyValueRow(key: "Pressure-Regulated Volume Control (PRVC)", value: "Set target TV + RR + I:E + PEEP + FiO2; ventilator adjusts pressure each breath to deliver target volume at lowest pressure; combines benefits of pressure + volume modes"),
                KeyValueRow(key: "Considerations", value: "TV varies with patient effort + lung mechanics; useful when wanting both volume guarantee + pressure protection (PRVC)")
            ]),
            .keyValueTable(title: "Advanced + alternative modes", [
                KeyValueRow(key: "APRV (Airway Pressure Release Ventilation)", value: "Bi-level CPAP with brief releases for ventilation; used in some ARDS; controversial; specialty centers"),
                KeyValueRow(key: "High-Frequency Oscillatory Ventilation (HFOV)", value: "Very small TV + high RR; failed in adult ARDS trials (OSCAR + OSCILLATE); used in pediatric + neonatal"),
                KeyValueRow(key: "Bi-level / BiPAP non-invasive", value: "IPAP + EPAP + RR backup; for COPD exacerbation, cardiogenic pulmonary edema, OSA, OHS; bridging to extubation; avoid intubation"),
                KeyValueRow(key: "CPAP non-invasive", value: "Continuous positive airway pressure; for obstructive sleep apnea + pulmonary edema + post-extubation"),
                KeyValueRow(key: "Adaptive Support Ventilation (ASV)", value: "Auto-adjusts based on lung mechanics; ICU-acquired weakness reduction goal")
            ]),
            .keyValueTable(title: "Initial vent settings", [
                KeyValueRow(key: "Tidal volume (TV)", value: "6 mL/kg predicted body weight (PBW) for ARDS; 6-8 mL/kg for non-ARDS"),
                KeyValueRow(key: "Respiratory rate (RR)", value: "12-20 breaths/min adjusted to pH/CO2"),
                KeyValueRow(key: "PEEP", value: "Start 5 cm H2O for most; titrate up for hypoxemia + ARDS (5-15+ as needed)"),
                KeyValueRow(key: "FiO2", value: "Start 100% and wean to lowest maintaining SpO2 ≥90-94%"),
                KeyValueRow(key: "I:E ratio", value: "1:2 typical; 1:3-1:4 for COPD (longer expiratory); 1:1 for ARDS sometimes"),
                KeyValueRow(key: "Sensitivity / trigger", value: "Flow trigger preferred; -1 to -2 cm H2O sensitivity"),
                KeyValueRow(key: "Special — head injury", value: "Avoid hyperventilation (CO2 35 unless emergent ICP); avoid hypercapnia"),
                KeyValueRow(key: "Special — obstructive (COPD/asthma)", value: "Permissive hypercapnia (pH 7.20-7.45), low RR (8-12), prolonged expiratory time, monitor auto-PEEP")
            ]),
            .keyValueTable(title: "Weaning + extubation", [
                KeyValueRow(key: "Daily SAT (sedation awakening trial)", value: "Stop sedation each morning to assess readiness; ABCDEF bundle"),
                KeyValueRow(key: "Daily SBT (spontaneous breathing trial)", value: "T-piece or low PSV/CPAP × 30-120 minutes; assess tolerance"),
                KeyValueRow(key: "Extubation readiness criteria", value: "Underlying cause resolving, FiO2 ≤0.5 with SpO2 ≥90%, PEEP ≤8, hemodynamically stable, intact mental status + cough + secretions manageable, neuromuscular adequate, fluid balance + electrolytes optimized"),
                KeyValueRow(key: "Rapid shallow breathing index (RSBI)", value: "RR/TV in liters during SBT; <105 predicts successful extubation"),
                KeyValueRow(key: "Cuff leak test", value: "Significant cuff leak (audible or volume) predicts low risk of post-extubation stridor; consider steroids before extubation if poor leak"),
                KeyValueRow(key: "Post-extubation support", value: "High-flow nasal cannula OR NIV may bridge; reintubation risk highest first 24 hours"),
                KeyValueRow(key: "Tracheostomy timing", value: "If ventilator-dependent >14-21 days; early tracheostomy (7-10 days) may reduce ICU stay in selected"),
                KeyValueRow(key: "Failed extubation", value: "~10-20% risk; reintubation, alternative airway, or NIV bridge")
            ]),
            .bullets(title: "Selection principles", [
                AttributedBullet("ARDS — volume-controlled or PRVC with lung-protective settings (TV 6 mL/kg PBW + plateau ≤30 + driving pressure ≤15).", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("COPD/asthma — pressure-controlled OR volume with permissive hypercapnia + prolonged expiratory time + monitor auto-PEEP; minimize positive pressure to prevent hyperinflation.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Post-operative — typically AC then transition to PSV for weaning.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Neuromuscular weakness — volume-controlled with adequate ventilation; avoid increased RR/TV demand.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Spontaneously breathing — PSV with appropriate support level; CPAP only if minimal support needed.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Non-invasive ventilation — COPD exacerbation, cardiogenic pulmonary edema, OSA + OHS, immunocompromised respiratory failure — avoid intubation when possible.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Daily ABCDEF bundle — Awakening + Breathing trials + Choice of analgesia/sedation + Delirium monitoring + Early mobilization + Family engagement.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Liberation strategies — reduce sedation, daily SBT, communicate readiness, multidisciplinary rounds.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Complications — VAP, VILI, pneumothorax, hemodynamic compromise, oxygen toxicity, sinusitis, deep vein thrombosis, ICU-acquired weakness, delirium.", citationIDs: ["specialty_pr_round32"])
            ])
        ],
        citations: [openrnPRR32, cdcPRR32, specialtyPRR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ShockHemodynamicPatternsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "shock-hemodynamic-patterns",
        title: "Shock differentiation + hemodynamic patterns",
        subtitle: "Hypovolemic vs cardiogenic vs distributive vs obstructive · CVP + PCWP + CO + SVR pattern recognition · vasoactive selection · time-critical",
        eyebrow: "REFERENCE · CRITICAL CARE",
        nclexTags: refTagsR32,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Shock = life-threatening circulatory failure with inadequate tissue perfusion; four major categories — HYPOVOLEMIC, CARDIOGENIC, DISTRIBUTIVE (septic, anaphylactic, neurogenic, endocrine), OBSTRUCTIVE (massive PE, tension pneumothorax, cardiac tamponade). Hemodynamic patterns differentiate cause + guide therapy. Vasoactive selection — norepinephrine first-line for most; vasopressin + epinephrine adjunct; specific agents for specific scenarios per primary source.",
                citationIDs: ["specialty_pr_round32"]
            )),
            .keyValueTable(title: "Hemodynamic patterns by shock type", [
                KeyValueRow(key: "Hypovolemic", value: "↓ CVP + ↓ PCWP + ↓ CO/CI + ↑ SVR (vasoconstriction); cool extremities, narrow pulse pressure, oliguria; hemorrhage + dehydration + GI losses + burns; treat with crystalloid + blood products; control bleeding"),
                KeyValueRow(key: "Cardiogenic", value: "↑ CVP + ↑ PCWP + ↓ CO/CI + ↑ SVR; cool extremities, pulmonary edema, JVD; acute MI + ADHF + valve dysfunction + cardiomyopathy + arrhythmia; treat with inotropes (dobutamine + milrinone) + diuresis + mechanical support (IABP + Impella + ECMO)"),
                KeyValueRow(key: "Septic (distributive)", value: "↓-↑ CVP + ↓-↑ PCWP + ↑ CO/CI (hyperdynamic) + ↓ SVR; warm extremities (early), then cold (late); fever, infection source; antibiotics within 1 hr + fluid resuscitation 30 mL/kg + vasopressors (norepinephrine) + source control"),
                KeyValueRow(key: "Anaphylactic (distributive)", value: "↓ CVP + ↓ PCWP + ↑ CO/CI + ↓ SVR; urticaria + bronchospasm + angioedema; allergen exposure; epinephrine IM 0.3-0.5 mg + fluids + steroids + antihistamines + bronchodilators"),
                KeyValueRow(key: "Neurogenic (distributive)", value: "↓ CVP + ↓ PCWP + ↓-↑ CO/CI + ↓ SVR + bradycardia (loss of sympathetic outflow); spinal cord injury T6+; phenylephrine + fluids + atropine for bradycardia"),
                KeyValueRow(key: "Obstructive — PE", value: "↑ CVP + ↓-normal PCWP + ↓ CO/CI + ↑ SVR; sudden dyspnea + pleuritic chest pain + RV strain on echo; thrombolysis OR thrombectomy + anticoagulation"),
                KeyValueRow(key: "Obstructive — Tension pneumothorax", value: "↑ CVP + ↓ PCWP + ↓ CO/CI; tracheal deviation + asymmetric breath sounds; emergent needle decompression + chest tube"),
                KeyValueRow(key: "Obstructive — Cardiac tamponade", value: "↑ CVP + ↑ PCWP (equalization with diastolic pressures) + ↓ CO/CI; muffled heart sounds + JVD + pulsus paradoxus; emergent pericardiocentesis")
            ]),
            .keyValueTable(title: "Initial assessment + workup", [
                KeyValueRow(key: "Vital signs + perfusion", value: "BP (with MAP), HR, RR, temperature, SpO2, mental status, capillary refill, urine output, skin temperature + mottling"),
                KeyValueRow(key: "Labs", value: "CBC, CMP (lactate critical), coagulation, troponin, type/screen, blood cultures (sepsis), ABG, LFTs"),
                KeyValueRow(key: "Imaging", value: "CXR (cardiogenic, PE, pneumothorax), bedside echo (cardiac function, tamponade, PE), CT chest if PE/dissection, abdominal imaging if intra-abdominal source"),
                KeyValueRow(key: "Bedside US", value: "RUSH protocol (Rapid Ultrasound in SHock) — heart + IVC + lungs + abdomen + aorta; rapid bedside assessment"),
                KeyValueRow(key: "Invasive monitoring", value: "Arterial line for continuous BP; CVC for vasopressors + access; PAC selective; FloTrac/NICOM non-invasive CO"),
                KeyValueRow(key: "Initial resuscitation", value: "30 mL/kg crystalloid initial; reassess; vasopressors if persistent hypotension after fluids; correct hypoxemia + acidosis")
            ]),
            .keyValueTable(title: "Vasoactive selection", [
                KeyValueRow(key: "Norepinephrine", value: "First-line for most shock (septic, cardiogenic, distributive); alpha + minor beta-1; vasoconstriction + modest inotropy; start 0.01-0.05 mcg/kg/min, titrate to MAP ≥65"),
                KeyValueRow(key: "Vasopressin", value: "Adjunct to norepinephrine in septic shock (low-dose 0.03 units/min fixed); V1 vasoconstriction; reduces norepinephrine requirement; consider also in catecholamine-resistant"),
                KeyValueRow(key: "Epinephrine", value: "Severe shock requiring inotropy + vasoconstriction; bradycardia; cardiac arrest (1 mg IV q3-5 min); anaphylaxis (IM 0.3-0.5 mg); strong inotrope at high doses"),
                KeyValueRow(key: "Dopamine", value: "Used to be alternative; now less preferred (more arrhythmias than norepinephrine); reserve for selective scenarios (bradycardia with hypotension)"),
                KeyValueRow(key: "Phenylephrine", value: "Pure alpha-1 agonist; bolus + drip for hypotension in selected (LVOT obstruction, low SVR without need for inotropy); not for severe shock typically"),
                KeyValueRow(key: "Dobutamine", value: "Beta-1 inotrope + mild beta-2 vasodilation; cardiogenic shock with adequate BP; 2.5-10 mcg/kg/min; combine with vasopressor if hypotensive"),
                KeyValueRow(key: "Milrinone", value: "PDE-3 inhibitor inodilator; cardiogenic shock + ADHF + bridge to transplant; not for hypotensive shock without vasopressor"),
                KeyValueRow(key: "Isoproterenol", value: "Beta-1 + beta-2 agonist; bradycardia atropine-refractory bridge to pacing; refractory torsades")
            ]),
            .bullets(title: "Approach to undifferentiated shock", [
                AttributedBullet("ABCDE approach — airway, breathing, circulation, disability, exposure.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Initial RESUSCITATION — 30 mL/kg crystalloid IV bolus (if no contraindications like cardiogenic pulmonary edema severe); reassess MAP, HR, perfusion, lactate.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("BEDSIDE ECHO + ULTRASOUND — rapid assessment of cardiac function, IVC volume, pulmonary effusion + edema, tamponade, PE; differentiates shock types quickly.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("VASOPRESSOR — norepinephrine first-line if persistent hypotension after fluids; via central line preferred (peripheral can be used initially).", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("SOURCE CONTROL — sepsis: antibiotics within 1 hour + drain abscess + remove infected device; trauma: stop bleeding + damage control + transfusion; tamponade: pericardiocentesis; tension pneumothorax: needle decompression.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("MAP TARGET — typically ≥65 mm Hg; higher (75-80) for selected (chronic HTN, kidney/brain perfusion).", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("LACTATE — surrogate for tissue perfusion; trend critically; >2 mmol/L abnormal; >4 mmol/L severe; clearance correlates with outcome.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("ScvO2 / SvO2 — central venous (>70%) or mixed venous (>65%) oxygen saturation; low values suggest inadequate cardiac output; high values seen in distributive shock + cyanide.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Multidisciplinary — ED + ICU + surgery + cardiology + ID + transfusion medicine; rapid response + early intervention.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("ECMO consideration — for refractory shock not responding to maximum medical + mechanical support; VV-ECMO for respiratory, VA-ECMO for cardiac + combined; specialty centers.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Surviving Sepsis Campaign + AHA/ACC + SCCM guidelines — comprehensive evidence-based protocols.", citationIDs: ["specialty_pr_round32"])
            ])
        ],
        citations: [openrnPRR32, cdcPRR32, specialtyPRR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HTNEmergencySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "hypertensive-emergency-management",
        title: "Hypertensive emergency + urgency management",
        subtitle: "Acute end-organ damage (encephalopathy, stroke, MI, ADHF, aortic dissection, AKI, eclampsia) · gradual BP reduction · IV nicardipine/clevidipine/esmolol/labetalol/nitroprusside · special scenarios",
        eyebrow: "REFERENCE · CRITICAL CARE",
        nclexTags: refTagsR32,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "HYPERTENSIVE EMERGENCY — severe HTN with acute end-organ damage (encephalopathy, stroke, ACS, ADHF/pulmonary edema, aortic dissection, AKI, eclampsia, pheochromocytoma crisis) requiring immediate gradual BP reduction with IV antihypertensives. HYPERTENSIVE URGENCY — severe HTN (SBP >180 OR DBP >120) WITHOUT acute end-organ damage; gradual BP reduction over hours-days with oral antihypertensives + outpatient follow-up. Differentiation critical — emergency = ICU + IV agents; urgency = oral + close follow-up per primary source.",
                citationIDs: ["specialty_pr_round32"]
            )),
            .keyValueTable(title: "Hypertensive emergency scenarios + targets", [
                KeyValueRow(key: "Hypertensive encephalopathy", value: "MAP reduction ~25% in 1 hour, then to 160/100 over 2-6 hours; nicardipine OR clevidipine OR labetalol"),
                KeyValueRow(key: "Acute ischemic stroke", value: "Maintain BP <185/110 for tPA candidates; for non-thrombolytic, allow permissive HTN unless >220/120 (lower 15% over 24 hours); labetalol OR nicardipine"),
                KeyValueRow(key: "Acute hemorrhagic stroke (ICH)", value: "SBP target <140 (ATACH-II + INTERACT-2 trials) within first hour; nicardipine OR clevidipine"),
                KeyValueRow(key: "Acute coronary syndrome (ACS)", value: "Reduce BP + HR; nitroglycerin drip + beta-blocker (metoprolol IV OR esmolol drip); reduce ischemia + workload"),
                KeyValueRow(key: "Acute pulmonary edema / ADHF", value: "Reduce preload + afterload; nitroglycerin drip + IV diuretic (furosemide); nicardipine OR clevidipine; non-invasive ventilation (BiPAP)"),
                KeyValueRow(key: "Aortic dissection", value: "SBP target 100-120 + HR <60 within 20 minutes; beta-blocker (esmolol drip 50-200 mcg/kg/min) FIRST for HR + contractility, then add vasodilator (nicardipine, clevidipine, nitroprusside); avoid hydralazine + diltiazem (reflex tachycardia)"),
                KeyValueRow(key: "Acute kidney injury", value: "Gradual BP reduction over 6-12 hours; avoid nitroprusside (cyanide toxicity in renal failure); fenoldopam OR nicardipine"),
                KeyValueRow(key: "Eclampsia / severe preeclampsia", value: "Magnesium sulfate (seizure prophylaxis) + IV labetalol OR IV hydralazine OR IV nicardipine; delivery when stabilized; SBP <160 + DBP <110"),
                KeyValueRow(key: "Pheochromocytoma crisis", value: "Alpha-blocker (phentolamine boluses 5-10 mg + drip) BEFORE beta-blocker (esmolol); never beta-blocker alone → unopposed alpha → hypertensive crisis worsening"),
                KeyValueRow(key: "Sympathomimetic crisis (cocaine, amphetamine, MDMA)", value: "Avoid pure beta-blockers (unopposed alpha-mediated vasoconstriction); benzodiazepines first-line; phentolamine; alpha-blocker + beta-blocker combination if HR/BP")
            ]),
            .keyValueTable(title: "IV agent selection", [
                KeyValueRow(key: "Nicardipine drip", value: "Calcium channel blocker; 5-15 mg/h IV titrate; rapid + smooth titration; first-line for most HTN emergencies; safe in renal + hepatic"),
                KeyValueRow(key: "Clevidipine drip", value: "Ultra-short-acting CCB lipid emulsion; 1-21 mg/h IV; preferred when very rapid titration needed; egg/soy allergy precludes"),
                KeyValueRow(key: "Esmolol drip", value: "Ultra-short-acting beta-1 selective; 50-300 mcg/kg/min; first-line for aortic dissection + ACS + thyroid storm; useful when rapid HR control needed; AVOID in heart block + severe asthma + decompensated HF"),
                KeyValueRow(key: "Labetalol IV", value: "Combined alpha + beta blocker; bolus 10-20 mg IV + drip 0.5-2 mg/min; preferred for stroke + eclampsia"),
                KeyValueRow(key: "Nitroprusside drip", value: "Arteriolar + venous vasodilator; 0.3-10 mcg/kg/min; rapid effect; reserve for refractory or specific scenarios; CYANIDE TOXICITY in prolonged use + renal failure; hepatic clearance"),
                KeyValueRow(key: "Nitroglycerin drip", value: "Venous (preload) + arteriolar at high dose; first-line for ACS + acute pulmonary edema; 5-200 mcg/min"),
                KeyValueRow(key: "Hydralazine IV", value: "Arterial vasodilator; 10-20 mg IV q4-6 hours; preeclampsia + eclampsia first-line; reflex tachycardia; avoid aortic dissection"),
                KeyValueRow(key: "Enalaprilat IV", value: "ACE inhibitor; 0.625-1.25 mg IV q6 hours; renal protection; rarely used emergency"),
                KeyValueRow(key: "Fenoldopam drip", value: "Dopamine D1 agonist; 0.025-1.6 mcg/kg/min; renal protection; alternative when nitroprusside contraindicated; expensive"),
                KeyValueRow(key: "Phentolamine IV", value: "Alpha-blocker; 5-10 mg IV bolus; pheochromocytoma + sympathomimetic crisis; cocaine HTN")
            ]),
            .keyValueTable(title: "Oral antihypertensives for urgency", [
                KeyValueRow(key: "Captopril", value: "12.5-25 mg PO; rapid onset 15-30 min; reduce in renal impairment"),
                KeyValueRow(key: "Labetalol", value: "100-200 mg PO; onset 30-60 min"),
                KeyValueRow(key: "Clonidine", value: "0.1-0.3 mg PO; rebound HTN if stopped abruptly; once daily transdermal"),
                KeyValueRow(key: "Amlodipine", value: "5-10 mg PO; slower onset; long-acting"),
                KeyValueRow(key: "Hydrochlorothiazide", value: "12.5-25 mg PO; for volume + chronic management"),
                KeyValueRow(key: "Avoid in urgency", value: "Sublingual nifedipine — precipitous BP drop + ischemia (FDA discouraged)")
            ]),
            .bullets(title: "Management principles", [
                AttributedBullet("Differentiate EMERGENCY (end-organ damage) vs URGENCY (no end-organ damage) — clinical exam + targeted workup; emergency requires ICU + IV agents.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("End-organ assessment — neurologic exam (encephalopathy + stroke), ECG (ACS + ischemia + LV strain), chest X-ray (pulmonary edema), troponin (ACS), urinalysis + Cr (AKI), CT/CTA chest (aortic dissection), funduscopic exam (papilledema).", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("GRADUAL BP reduction — avoid precipitous drops which can cause cerebral + cardiac + renal hypoperfusion; specific targets per scenario.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("ARTERIAL LINE for continuous BP monitoring + accurate titration in IV antihypertensives.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("ETIOLOGY workup — pheochromocytoma (metanephrines), primary aldosteronism (ARR), renal artery stenosis (imaging), endocrine + Cushing + thyroid + drugs (sympathomimetics, MAOIs + food).", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Identify TRIGGER — medication non-adherence (most common in chronic HTN), drug + alcohol use, pregnancy + eclampsia, thyroid, withdrawal, anxiety + pain.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Multidisciplinary — emergency medicine + critical care + cardiology + nephrology + obstetrics (eclampsia) + endocrinology + neurology.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("Outpatient follow-up + adherence + long-term BP control + lifestyle modification + medication titration; address adherence barriers.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("DISCHARGE — adequate oral regimen + close follow-up within 1 week; patient education + home BP monitoring.", citationIDs: ["specialty_pr_round32"]),
                AttributedBullet("PREVENTION — secondary HTN workup if young, severe, refractory, or atypical features; lifestyle + medication adherence + long-term control reduces recurrence.", citationIDs: ["specialty_pr_round32"])
            ])
        ],
        citations: [openrnPRR32, cdcPRR32, specialtyPRR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}
