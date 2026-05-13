import Foundation

private let openstax = CitationSource(
    id: "openstax_clinical",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/1-introduction",
    lastRetrieved: "2026-05-03"
)
private let openrn = CitationSource(
    id: "openrn_skills",
    shortName: "Open RN Nursing Skills (relevant chapter)",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK615342/",
    lastRetrieved: "2026-05-03"
)
private let cdc = CitationSource(
    id: "cdc_clinical",
    shortName: "CDC clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-03"
)

// MARK: - NG Tube Insertion

public enum NGTubeSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "ng-tube",
        title: "Nasogastric tube insertion",
        subtitle: "Salem sump or Levin tube",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort),
        indications: AttributedProse(
            "Gastric decompression (bowel obstruction, ileus, perioperative), enteral feeding (short-term), gastric lavage (rare), medication administration in patients unable to swallow.",
            citationIDs: ["openstax_clinical"]
        ),
        contraindications: AttributedProse(
            "Maxillofacial trauma, basilar skull fracture (relative — risk of intracranial placement), significant esophageal varices or strictures, recent nasal/sinus surgery.",
            citationIDs: ["openstax_clinical"]
        ),
        equipment: [
            AttributedBullet("NG tube (typically 14–18 Fr for adults; smaller for feeding only)", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Water-soluble lubricant", citationIDs: ["openstax_clinical"]),
            AttributedBullet("60-mL catheter-tip syringe and pH paper", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Suction setup if for decompression", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Tape or commercial securement device", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Glass of water with straw if patient can swallow", citationIDs: ["openstax_clinical"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order and indication.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Verify patient using two identifiers; explain procedure and obtain consent.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Position high Fowler's; have emesis basin ready.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Measure tube — NEX (tip of nose to earlobe to xiphoid process); mark with tape.", citationIDs: ["openstax_clinical"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Assess nostrils", body: "Check both nostrils for patency and deformity; choose the more patent side.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 2, title: "Lubricate", body: "Lubricate the first 4–6 inches of the tube with water-soluble lubricant.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 3, title: "Insert", body: "Insert tube straight back along the floor of the nostril (not upward). When you feel resistance at the nasopharynx (about 3 inches in), have the patient flex their head forward to close the airway and direct the tube into the esophagus.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 4, title: "Advance with swallows", body: "Have the patient sip water through the straw and swallow as you advance the tube to the marked length. Do not force against resistance.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 5, title: "Verify placement", body: "Check pH of aspirate (gastric typically <5; respiratory >6). Confirm with abdominal X-ray BEFORE first use for feeding (gold standard). Auscultation alone is NOT a reliable verification method.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 6, title: "Secure", body: "Secure with tape or device; mark exit point at nare with permanent marker for ongoing reference.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 7, title: "Connect", body: "Connect to suction (low intermittent for Salem sump, low continuous for feeding) or feeding set per orders.", citationIDs: ["openstax_clinical"])
        ],
        postProcedure: [
            AttributedBullet("Verify placement before EACH use — pH of aspirate, exit-point marking unchanged, length unchanged.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Provide oral care every 2–4 hours; nare care to prevent breakdown.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Reassess need daily — remove as soon as possible.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Strict I&O when on suction; track output color and volume.", citationIDs: ["openstax_clinical"])
        ],
        documentation: [
            AttributedBullet("Date, time, indication, tube type and size, nare used, length inserted, securement, patient tolerance, X-ray confirmation result.", citationIDs: ["openstax_clinical"])
        ],
        watchFor: [
            AttributedBullet("Tracheal placement: coughing, dyspnea, inability to talk — STOP, withdraw, reattempt.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Coiling in oropharynx: tube comes out the mouth.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Sinusitis or pressure ulcers from prolonged use.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Aspiration if HOB <30° or bolus feeds delivered too rapidly.", citationIDs: ["openstax_clinical"])
        ],
        citations: [openstax, openrn],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Blood Transfusion

public enum BloodTransfusionSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "blood-transfusion",
        title: "Blood transfusion administration",
        subtitle: "PRBC, FFP, platelets, cryoprecipitate",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies),
        indications: AttributedProse(
            "Restoration of oxygen-carrying capacity (PRBC) for symptomatic anemia or hemorrhage. FFP for coagulopathy with active bleeding or before invasive procedure. Platelets for severe thrombocytopenia or platelet dysfunction with bleeding.",
            citationIDs: ["openstax_clinical"]
        ),
        contraindications: AttributedProse(
            "History of severe transfusion reaction (relative — needs special preparation). Religious objection (Jehovah's Witnesses) — alternatives required.",
            citationIDs: ["openstax_clinical"]
        ),
        equipment: [
            AttributedBullet("Y-type blood tubing with in-line filter (170 micron)", citationIDs: ["openstax_clinical"]),
            AttributedBullet("0.9% sodium chloride (NS) — ONLY compatible IV fluid", citationIDs: ["openstax_clinical"]),
            AttributedBullet("18-gauge IV (preferred); 20-gauge acceptable", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Patient's typed and crossmatched blood product", citationIDs: ["openstax_clinical"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order, signed consent, type and crossmatch results.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Verify patient with TWO QUALIFIED PERSONNEL: name, DOB, blood band, blood unit number, ABO/Rh type, expiration. ANY mismatch — return to blood bank.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Baseline vital signs (within 30 minutes of start).", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Patent IV with NS already running.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Premedication if ordered (acetaminophen, diphenhydramine for patient with prior reactions).", citationIDs: ["openstax_clinical"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Begin slowly", body: "Start the unit at a SLOW rate (typically 50 mL/hr) for the first 15 minutes — most reactions occur in this window.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 2, title: "Stay with patient", body: "Stay at bedside for the first 15 minutes. Vital signs at 15 minutes.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 3, title: "Increase rate", body: "If no reaction, increase to ordered rate. Most adult PRBC units transfuse over 2–4 hours; max 4 hours from issue (bacterial contamination risk).", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 4, title: "Vital signs", body: "Recheck vital signs at 15 min, 30 min, then per facility protocol (often hourly), and at completion.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 5, title: "Complete", body: "Run NS through tubing to flush. Document end vital signs, total volume infused, patient tolerance.", citationIDs: ["openstax_clinical"])
        ],
        postProcedure: [
            AttributedBullet("Vital signs 1 hour after completion (or per protocol).", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Send blood bag and tubing to blood bank if any reaction occurred (per facility protocol).", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Repeat hemoglobin or platelet count per provider — typically 4–6 hours post-transfusion.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Continue to monitor for delayed reactions (TRALI, TACO, delayed hemolytic) for 24–48 hours.", citationIDs: ["openstax_clinical"])
        ],
        documentation: [
            AttributedBullet("Two-RN verification, baseline and serial vital signs, total volume infused, patient response, any reactions.", citationIDs: ["openstax_clinical"])
        ],
        watchFor: [
            AttributedBullet("Acute hemolytic reaction: fever, chills, flank/back pain, hypotension, dark urine — STOP, keep line open with NS, call provider, send unit/blood/urine to blood bank.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Febrile non-hemolytic: fever ≥1°C rise, chills — stop, evaluate, may pre-medicate next time.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Allergic/anaphylactic: hives, wheeze, hypotension — stop, give antihistamine; severe = epinephrine.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("TACO (transfusion-associated circulatory overload): dyspnea, hypoxia, hypertension, JVD — slow or stop, diuretic.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("TRALI (transfusion-related acute lung injury): dyspnea, hypoxia, bilateral infiltrates within 6 hours — stop, supportive ventilation; sentinel event.", citationIDs: ["openstax_clinical"])
        ],
        citations: [openstax, openrn],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Neurologic Assessment

public enum NeuroCheckSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "neuro-check",
        title: "Focused neurologic assessment",
        subtitle: "GCS · pupils · motor · cranial nerves at the bedside",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        indications: AttributedProse(
            "Routine assessment in head injury, stroke, seizure, altered mental status, post-procedural neurosurgery, and any patient with new neurologic complaint or change.",
            citationIDs: ["openstax_clinical"]
        ),
        contraindications: nil,
        equipment: [
            AttributedBullet("Penlight", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Reflex hammer (if doing reflexes)", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Cotton swab (if testing sensation)", citationIDs: ["openstax_clinical"])
        ],
        preProcedure: [
            AttributedBullet("Document baseline if available — change is what matters.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Note medications that affect mental status (sedatives, opioids).", citationIDs: ["openstax_clinical"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Level of consciousness", body: "Assess: alert and oriented (× person, place, time, situation). Use AVPU (Alert/Voice/Pain/Unresponsive) or GCS (E + V + M = 3–15).", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 2, title: "Glasgow Coma Scale", body: "Eye opening (1–4), Verbal (1–5), Motor (1–6). Score ≤8 = severe (consider intubation).", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 3, title: "Pupils", body: "Size (mm), shape (round/irregular), equality, reaction to light. PERRLA = pupils equal, round, reactive to light, accommodation. Note pinpoint (opioids), dilated (sympathomimetics), fixed/dilated (severe brain injury, anoxic).", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 4, title: "Motor", body: "Strength bilaterally — grade 0–5. Pronator drift test for subtle weakness (eyes closed, palms up — pronation/drift indicates contralateral lesion).", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 5, title: "Sensation", body: "Light touch, pinprick, position sense — bilaterally; compare sides.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 6, title: "Cranial nerves", body: "Quick screen: facial symmetry (CN VII), tongue midline (CN XII), gag/swallow (CN IX, X), shoulder shrug (CN XI), visual fields (CN II), extraocular movements (CN III, IV, VI).", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 7, title: "Speech and behavior", body: "Assess fluency, naming, repetition, comprehension. Note dysarthria (motor) vs aphasia (language).", citationIDs: ["openstax_clinical"])
        ],
        postProcedure: [
            AttributedBullet("Document objectively — describe what you see, not your interpretation. 'Right pronator drift' is better than 'right-sided weakness.'", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Compare to baseline — any decline warrants provider notification.", citationIDs: ["openstax_clinical"])
        ],
        documentation: [
            AttributedBullet("LOC, GCS components, pupil exam, motor and sensory findings, cranial nerve abnormalities, speech, comparison to baseline.", citationIDs: ["openstax_clinical"])
        ],
        watchFor: [
            AttributedBullet("New asymmetry — pupils, motor, drift — investigate immediately (stroke, mass, herniation).", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Cushing's triad (hypertension, bradycardia, irregular respirations) suggests increased ICP — emergency.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Posturing — decorticate (flexor) vs decerebrate (extensor) — signals brainstem involvement.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Sudden severe headache (thunderclap) — possible subarachnoid hemorrhage; emergency imaging.", citationIDs: ["openstax_clinical"])
        ],
        citations: [openstax, openrn],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Restraints

public enum RestraintsSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "restraints",
        title: "Restraint application",
        subtitle: "Physical restraints — last resort, with strict monitoring",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
        indications: AttributedProse(
            "ONLY when less restrictive alternatives have failed AND patient poses imminent danger to self or others, or to maintain medically necessary therapy (e.g., dislodging a critical line). Never as punishment, convenience, or coercion. Requires provider order; emergency use can begin and be ordered immediately after.",
            citationIDs: ["cdc_clinical", "openstax_clinical"]
        ),
        contraindications: AttributedProse(
            "When less restrictive alternatives can manage the situation (sitter, environmental modification, medication, family presence).",
            citationIDs: ["openstax_clinical"]
        ),
        equipment: [
            AttributedBullet("Provider-ordered restraint (limb, mitten, vest — LEAST restrictive that addresses the risk)", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Quick-release ties (granny knot or Posey-style) — never square knots", citationIDs: ["openstax_clinical"])
        ],
        preProcedure: [
            AttributedBullet("Document attempted alternatives — sitter, redirection, environmental adjustments, medication.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Provider order: type, behavior addressed, duration; emergency/violent restraints renew every 4 hours (adult), 2 hours (child 9–17), 1 hour (<9). Non-violent restraints renew every 24 hours.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Notify family per facility policy.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Explain to patient calmly even if confused — protects dignity and may de-escalate.", citationIDs: ["openstax_clinical"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Choose least restrictive", body: "Mittens (prevent line dislodgement) before wrist restraints; bilateral wrist before 4-point.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 2, title: "Secure to bed frame", body: "Tie restraint to the BED FRAME (not the side rail) using a quick-release knot. Never tie to a rail that moves with the bed.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 3, title: "Two-finger fit", body: "Two fingers should fit between restraint and skin — too tight cuts circulation, too loose can be removed or cause injury.", citationIDs: ["openstax_clinical"]),
            ProcedureStep(number: 4, title: "Position", body: "Limbs in functional position; never abduct above shoulder level.", citationIDs: ["openstax_clinical"])
        ],
        postProcedure: [
            AttributedBullet("Assess every 2 hours (adult, non-violent) or every 15 minutes (violent restraints): circulation (color, warmth, sensation, capillary refill), skin integrity, ROM, hydration, toileting, position change.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Release one restraint at a time for ROM and skin care every 2 hours.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Reassess for early discontinuation — restraints come off as soon as criteria are no longer met.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Document: behavior, alternative measures attempted, type and reason, monitoring, patient response.", citationIDs: ["openstax_clinical"])
        ],
        documentation: [
            AttributedBullet("Specific behavior, alternatives tried, provider order, type and location, monitoring at required intervals, patient response, criteria for discontinuation.", citationIDs: ["openstax_clinical"])
        ],
        watchFor: [
            AttributedBullet("Compromised circulation — pallor, cyanosis, paresthesia, weak pulse — release immediately.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Asphyxiation in vest restraints — always position to prevent slumping.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Aspiration risk in supine restrained patients — HOB elevated, frequent suction available.", citationIDs: ["openstax_clinical"]),
            AttributedBullet("Pressure injuries from immobility — turn and reposition every 2 hours.", citationIDs: ["openstax_clinical"])
        ],
        citations: [openstax, openrn, cdc],
        lastSourceFidelityReview: "2026-05-03"
    )
}
