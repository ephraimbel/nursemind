import Foundation

// Curator-model procedure entries (v1.5 expansion).
// Sources: OpenStax Clinical Nursing Skills (CC BY 4.0 with display restriction),
// Open RN Nursing Skills (CC BY 4.0), AHA BLS (concept citation), CDC PPE (public domain).

private let openstaxSkills2 = CitationSource(
    id: "openstax_skills2",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let openrnSkills2 = CitationSource(
    id: "openrn_skills2",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=procedure+catheter+wound+drain",
    lastRetrieved: "2026-05-04"
)
private let cdcPPE = CitationSource(
    id: "cdc_ppe_ref",
    shortName: "CDC Personal Protective Equipment Sequence",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/personal-protective-equipment/",
    lastRetrieved: "2026-05-04"
)
private let ahaBLS = CitationSource(
    id: "aha_bls_concept",
    shortName: "American Heart Association BLS (concept citation)",
    detail: "Sequence and ratios — 30:2 compressions to breaths, 100–120/min depth 2 in",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://cpr.heart.org/",
    lastRetrieved: "2026-05-04"
)

private let infectionTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection)
private let safetyTags = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let basicCareTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition)
private let pharmTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)
private let perfusionTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)

// MARK: - Oxygen Administration

public enum OxygenAdministrationSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "oxygen-administration",
        title: "Oxygen administration",
        subtitle: "Nasal cannula · simple mask · non-rebreather · Venturi · HFNC",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        indications: AttributedProse(
            "Hypoxemia (SpO2 below target), increased work of breathing, suspected acute coronary syndrome with hypoxia, post-anesthesia, severe anemia. Target SpO2 typically 92–98% (88–92% in COPD with chronic CO2 retention).",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "No absolute contraindications. Caution in chronic CO2 retention (titrate to lower SpO2 target 88–92%) and in paraquat poisoning (oxygen worsens injury — rare).",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("Oxygen source (wall, cylinder); flowmeter calibrated to delivery device.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Appropriate device: nasal cannula, simple mask, partial rebreather, non-rebreather with reservoir, Venturi mask, HFNC, or CPAP/BiPAP.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Humidifier when flow >4 L/min via nasal cannula or for HFNC.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("SpO2 monitor; capnography for non-invasive ventilation or sedated patients.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order including FiO2 or flow rate, target SpO2, and device.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Hand hygiene; explain to patient.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Assess baseline respiratory status, SpO2, work of breathing, lung sounds.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Post NO SMOKING signs; remove petroleum products; verify smoke detector function.", citationIDs: ["openrn_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Select device based on need", body: "Nasal cannula 1–6 L/min (≈ 24–44% FiO2). Simple mask 6–10 L/min (40–60%). Non-rebreather 10–15 L/min (≈ 80–95%) — reservoir bag must stay inflated. Venturi for precise FiO2 (24, 28, 31, 35, 40, 50%) — preferred in COPD. HFNC for higher flow + heated humidified.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Connect and adjust flow", body: "Attach device to flowmeter. Set flow per order. Verify flow with reservoir bag inflation (non-rebreather) or with FiO2 settings (HFNC, BiPAP).", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Apply to patient", body: "Position prongs in nares (NC) or mask over nose and mouth with elastic strap; ensure seal. Adjust for comfort; pad behind ears for prolonged use.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Reassess and titrate", body: "Recheck SpO2 within 5 min; titrate to target SpO2 per order. Lower flow first if SpO2 above range; escalate device if not meeting target on max for current device.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Reassess SpO2, RR, work of breathing every 1–4 hours per acuity.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Check skin behind ears, nares, under mask edges every shift; pad as needed.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Encourage incentive spirometry, ambulation, deep breathing as tolerated.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Wean oxygen as tolerated to lowest device/flow that maintains target SpO2.", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("Device, flow/FiO2, SpO2 before and after, RR, work of breathing.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Patient response and tolerance; skin integrity at contact points.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("Hypercapnia in COPD with high FiO2 — somnolence, headache, asterixis; titrate down or escalate to NIV per provider.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Increasing work of breathing or anxiety despite oxygen — escalate to provider; consider intubation criteria.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Mucosal dryness, nosebleeds — humidify if NC >4 L/min.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Fire safety — no smoking, no petroleum lubricants, no electrical sparks near oxygen.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Incentive Spirometry

public enum IncentiveSpirometrySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "incentive-spirometry",
        title: "Incentive spirometry",
        subtitle: "Pulmonary toileting · atelectasis prevention",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        indications: AttributedProse(
            "Prevention of atelectasis and pneumonia post-operatively, post-immobilization, and in patients at risk for hypoventilation. Routine for thoracic, abdominal, and cardiac surgery patients.",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "Patients unable to follow instructions or generate sufficient inspiratory effort. Recent pneumothorax (relative — confirm with provider).",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("Incentive spirometer with pre-set goal indicator.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Pillow for splinting an abdominal/thoracic incision.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Verify order and patient understanding.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Hand hygiene; explain purpose and technique.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Assess pain — premedicate if needed; effective IS requires comfort.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Position upright (high Fowler) or side-lying with HOB up.", citationIDs: ["openstax_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Position spirometer", body: "Hold spirometer upright. Set or note target volume marker per provider order or baseline.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Splint incision", body: "Splint any abdominal or thoracic incision with a pillow to reduce pain and improve effort.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Exhale and seal", body: "Exhale normally, then seal lips around mouthpiece.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Slow deep inhalation", body: "Inhale SLOWLY and DEEPLY through the mouthpiece; raise the indicator to the goal volume; hold 3–5 seconds at the top.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 5, title: "Repeat", body: "Remove mouthpiece, exhale slowly. Repeat 10 breaths every hour while awake (or per facility protocol).", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 6, title: "Cough and clear", body: "Cough at the end of the set to mobilize secretions; splint incision.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Reassess lung sounds; document volume achieved.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Reassess pain and effectiveness; address pain barriers.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Encourage early ambulation as adjunct to pulmonary toileting.", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("Volume achieved (vs goal), number of repetitions, pain score, breath sounds.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("Persistent decreased volumes — consider pain, effort, atelectasis; notify provider.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Dizziness or lightheadedness from over-vigorous use — pause and resume slowly.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - PPE Don and Doff

public enum PPEDonDoffSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "ppe-don-doff",
        title: "PPE donning and doffing",
        subtitle: "CDC sequence · contact / droplet / airborne",
        nclexTags: infectionTags,
        indications: AttributedProse(
            "Required for any anticipated contact with blood, body fluids, secretions, mucous membranes, non-intact skin, or contaminated surfaces. Specific PPE depends on transmission-based precautions in place.",
            citationIDs: ["cdc_ppe_ref"]
        ),
        contraindications: AttributedProse(
            "None. PPE must always be appropriate to the precautions ordered.",
            citationIDs: ["cdc_ppe_ref"]
        ),
        equipment: [
            AttributedBullet("Gown (fluid-resistant), gloves (fitted), mask (surgical) or N95 respirator (fit-tested), eye protection (face shield or goggles).", citationIDs: ["cdc_ppe_ref"]),
            AttributedBullet("PAPR if N95 unavailable or for prolonged exposure to airborne pathogens.", citationIDs: ["cdc_ppe_ref"])
        ],
        preProcedure: [
            AttributedBullet("Identify required PPE based on signage outside the room.", citationIDs: ["cdc_ppe_ref"]),
            AttributedBullet("Hand hygiene before donning.", citationIDs: ["cdc_ppe_ref"]),
            AttributedBullet("Inspect equipment for damage; verify sizes; ensure fit-testing on file for N95.", citationIDs: ["cdc_ppe_ref"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "DON: Gown", body: "Don gown — fully cover torso from neck to knees, arms to wrist. Tie at neck and back.", citationIDs: ["cdc_ppe_ref"]),
            ProcedureStep(number: 2, title: "DON: Mask or respirator", body: "Don mask — secure ties or elastic; mold nose piece to face. For N95: perform user seal check.", citationIDs: ["cdc_ppe_ref"]),
            ProcedureStep(number: 3, title: "DON: Goggles or face shield", body: "Place over face/eyes and adjust to fit.", citationIDs: ["cdc_ppe_ref"]),
            ProcedureStep(number: 4, title: "DON: Gloves", body: "Don gloves — extend over the cuff of the gown.", citationIDs: ["cdc_ppe_ref"]),
            ProcedureStep(number: 5, title: "DOFF: Gloves", body: "Remove gloves first — they are most contaminated. Pinch outside of one glove at wrist, peel off rolling inside-out; hold removed glove in opposite (gloved) hand. Slide ungloved finger under wrist of remaining glove and peel off, encasing the first glove.", citationIDs: ["cdc_ppe_ref"]),
            ProcedureStep(number: 6, title: "DOFF: Goggles or face shield", body: "Remove from the back by lifting head band or ear pieces; place in receptacle for reprocessing or waste.", citationIDs: ["cdc_ppe_ref"]),
            ProcedureStep(number: 7, title: "DOFF: Gown", body: "Unfasten ties, peel away from neck and shoulders, turn contaminated side inward, roll into a bundle and discard.", citationIDs: ["cdc_ppe_ref"]),
            ProcedureStep(number: 8, title: "DOFF: Mask or respirator", body: "Grasp ONLY the bottom and then top ties/elastics; do not touch the front. Discard.", citationIDs: ["cdc_ppe_ref"]),
            ProcedureStep(number: 9, title: "Hand hygiene", body: "Perform hand hygiene immediately after removing all PPE.", citationIDs: ["cdc_ppe_ref"])
        ],
        postProcedure: [
            AttributedBullet("Hand hygiene after every PPE removal step if any contamination suspected.", citationIDs: ["cdc_ppe_ref"]),
            AttributedBullet("Replace any single-use items; reprocess reusable items per facility policy.", citationIDs: ["cdc_ppe_ref"])
        ],
        documentation: [
            AttributedBullet("Document care delivered with appropriate precautions; PPE breach should be reported per facility policy.", citationIDs: ["cdc_ppe_ref"])
        ],
        watchFor: [
            AttributedBullet("Self-contamination during doff — slow down at this step; the doffing sequence is where transmission most often occurs.", citationIDs: ["cdc_ppe_ref"]),
            AttributedBullet("Touching the face with gloved hands — break the habit; common contamination route.", citationIDs: ["cdc_ppe_ref"]),
            AttributedBullet("PAPR or N95 fit issues — refit, reseat, or escalate; do not enter without intact seal.", citationIDs: ["cdc_ppe_ref"])
        ],
        citations: [openstaxSkills2, openrnSkills2, cdcPPE],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Adult BLS / CPR

public enum AdultBLSSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "adult-bls",
        title: "Adult basic life support (BLS)",
        subtitle: "AHA sequence · CAB · 30:2 · 100–120 compressions/min",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        indications: AttributedProse(
            "Cardiac arrest in an adult — unresponsive with no normal breathing and no detectable pulse within 10 seconds.",
            citationIDs: ["openstax_skills2", "aha_bls_concept"]
        ),
        contraindications: AttributedProse(
            "Valid Do Not Resuscitate (DNR) order. Obvious signs of irreversible death (rigor, lividity, decapitation).",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("AED — apply as soon as available.", citationIDs: ["aha_bls_concept"]),
            AttributedBullet("Bag-valve mask with oxygen reservoir; oral airway adjuncts.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Backboard or hard surface for effective compressions.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Code cart, suction, monitor/defibrillator.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Ensure scene is safe.", citationIDs: ["aha_bls_concept"]),
            AttributedBullet("Check responsiveness — tap and shout.", citationIDs: ["aha_bls_concept"]),
            AttributedBullet("Activate emergency response (call code blue / 911) and request AED/defibrillator.", citationIDs: ["aha_bls_concept"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Check breathing and pulse simultaneously (≤10 sec)", body: "Look for normal breathing (gasping is NOT normal). Palpate carotid pulse for no more than 10 seconds.", citationIDs: ["aha_bls_concept"]),
            ProcedureStep(number: 2, title: "Begin chest compressions", body: "If no pulse: start compressions. Heel of one hand on lower half of sternum, other hand on top, fingers interlocked. Lock elbows, shoulders directly over hands. Push HARD (≥2 inches, ≤2.4 inches) and FAST (100–120/min). Allow full chest recoil between compressions.", citationIDs: ["aha_bls_concept"]),
            ProcedureStep(number: 3, title: "Open airway, give breaths (30:2 ratio)", body: "After 30 compressions, open airway with head tilt-chin lift (or jaw thrust if trauma suspected). Give 2 breaths via BVM with 100% oxygen — each over 1 second; watch for chest rise.", citationIDs: ["aha_bls_concept"]),
            ProcedureStep(number: 4, title: "Apply AED as soon as available", body: "Power on AED. Place pads (one upper right chest, one lower left chest). Follow voice prompts. Pause compressions only for analysis and shock; resume immediately after.", citationIDs: ["aha_bls_concept"]),
            ProcedureStep(number: 5, title: "Continue cycles, rotate compressors q2 min", body: "Continue 30:2 cycles, switching the compressor every 2 minutes (with each rhythm check) to prevent fatigue. Minimize pauses (>10 seconds reduces survival).", citationIDs: ["aha_bls_concept"]),
            ProcedureStep(number: 6, title: "Advanced airway adjustment", body: "Once advanced airway placed (ETT/SGA), give continuous compressions and 1 breath every 6 seconds (10/min); do NOT pause for breaths.", citationIDs: ["aha_bls_concept"])
        ],
        postProcedure: [
            AttributedBullet("ROSC: assess perfusion (BP, end-tidal CO2 rise, pulse). Continue post-cardiac arrest care per ACLS — targeted temperature management, hemodynamic support, 12-lead ECG, etiology workup.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Communication with family — provide updates as situation allows; consider family presence per facility policy.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Code debrief — what worked, what didn't, team learning.", citationIDs: ["openrn_skills2"])
        ],
        documentation: [
            AttributedBullet("Time of arrest, time of CPR initiation, time of first shock, ROSC time, drugs given, rhythm changes, disposition.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Code sheet completed during the event by recorder; reviewed and finalized after.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("Inadequate compression depth or rate — provide real-time feedback (CPR feedback device or coach).", citationIDs: ["aha_bls_concept"]),
            AttributedBullet("Excessive ventilation — increases intrathoracic pressure, reduces venous return; deliver only 1 breath every 6 seconds with advanced airway.", citationIDs: ["aha_bls_concept"]),
            AttributedBullet("Reversible causes (Hs and Ts) — hypovolemia, hypoxia, H+, hypo/hyperK, hypothermia, tension PTX, tamponade, toxins, thrombosis (PE/MI), trauma.", citationIDs: ["aha_bls_concept"])
        ],
        citations: [openstaxSkills2, openrnSkills2, ahaBLS],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - NG Feeding (Tube Feeding via NG)

public enum NGFeedingSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "ng-feeding",
        title: "NG / OG tube feeding",
        subtitle: "Bolus · intermittent · continuous enteral nutrition",
        nclexTags: basicCareTags,
        indications: AttributedProse(
            "Inability to meet nutritional needs orally with intact GI function — dysphagia, decreased LOC, ICU patients, head/neck post-op, anorexia, severe malnutrition.",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "Bowel obstruction, severe ileus, GI bleeding (active), high-output enterocutaneous fistula, severe hemodynamic instability requiring high-dose vasopressors.",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("Verified NG/OG tube with documented placement (X-ray for initial verification).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Prescribed enteral formula at room temperature.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Feeding pump (continuous), gravity bag, or large catheter-tip syringe (bolus).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("60 mL syringe; pH paper; water for flushing.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order: formula, route, rate, duration, water flush schedule.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Hand hygiene; identify patient with two identifiers.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("HOB elevated to ≥30° (preferably 45°) — aspiration prevention.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Verify tube placement before each intermittent feeding and every 4 hours during continuous feeding: aspirate gastric contents (pH ≤5 supports gastric placement), document tube length at nares vs baseline.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Check residual per protocol — typically hold and notify if >250–500 mL or per institution.", citationIDs: ["openstax_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Confirm placement and patency", body: "Check external tube length against baseline (taped at nares). Aspirate gastric contents; pH ≤5 supports gastric placement (alkaline if recent meds/PPI — interpret in context). Flush 30 mL warm water if patent.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Check residual (gastric only)", body: "Aspirate contents with 60 mL syringe; measure. If <250 mL (or per protocol), return aspirate (avoids electrolyte loss) and proceed. If >250–500 mL, hold and notify provider.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Administer feeding", body: "Bolus: deliver 240–480 mL via gravity over 30–60 min. Intermittent: similar volumes via pump or gravity 4–6× daily. Continuous: connect bag and prime pump; set rate per order.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Flush after feeding", body: "Flush with 30 mL warm water after each bolus, before and after each medication, and every 4 hours during continuous feeds.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 5, title: "Maintain HOB elevation", body: "Keep HOB ≥30° during and at least 30–60 min after bolus feeding to reduce aspiration risk.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Document amount given, residual, patient tolerance.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Monitor blood glucose per protocol; hyperglycemia is common.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Daily weights, I&O, electrolytes per orders.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Oral care — patients on tube feeds still need q4h oral care to prevent VAP/aspiration.", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("Time, formula, volume, rate, residual, flushes, patient tolerance, HOB position.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("Aspiration — coughing, dyspnea, new fever, infiltrate; STOP feeding, suction, elevate, notify provider.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Diarrhea — common; reduce rate, switch formula, rule out C. diff if antibiotics given.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Refeeding syndrome in chronically malnourished patients — slow re-feeding (start 25% goal), replete K, Mg, phos, thiamine BEFORE.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Tube migration — daily check of external length; X-ray if unsure.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pulse Oximetry / SpO2 Monitoring

public enum PulseOximetrySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "pulse-oximetry",
        title: "Pulse oximetry (SpO₂)",
        subtitle: "Continuous and intermittent monitoring",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        indications: AttributedProse(
            "Assessment of oxygenation status — routine vital signs, suspected hypoxemia, oxygen therapy titration, post-op/post-procedure, sedation monitoring, sleep monitoring.",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "None absolute. Limitations include unreliable readings with poor perfusion, severe anemia, dyshemoglobinemias (CO poisoning, methemoglobinemia), and dark nail polish.",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("Pulse oximeter — clip-on, adhesive, or wraparound probe.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Hand hygiene; explain to patient.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Select site — fingertip most common; alternates: toe, earlobe, forehead, nose bridge for poor perfusion.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Remove dark nail polish or false nails on selected finger; clean finger.", citationIDs: ["openstax_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Apply probe", body: "Place probe on selected site with light source aligned. Ensure secure contact without compression that limits perfusion.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Wait for stable reading", body: "Allow 5–10 seconds for the device to display a stable SpO2 and pulse rate; verify pulse rate matches palpated pulse.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Document", body: "Document SpO2, oxygen device and flow if applicable, pulse rate.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Continuous monitoring set-up", body: "Set alarms per facility (typical low SpO2 alarm 90%, can be adjusted per acuity and condition); rotate continuous probes per protocol (every 2–4 hr) to prevent pressure injury.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Compare to baseline; trend over time more useful than single reading.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Correlate with patient appearance, respiratory effort, and mental status — clinical assessment beats device.", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("SpO2 value, oxygen device/flow, pulse rate, signal quality.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("False high in CO poisoning — SpO2 reads carboxyhemoglobin as oxygenated; use co-oximetry (ABG) if suspected.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("False low with poor perfusion (cold, hypotension), nail polish, motion artifact — verify with ABG when result doesn't match clinical picture.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Pressure injury at probe site with continuous monitoring — rotate q2–4h.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Newer evidence: pulse oximeters less accurate in patients with darker skin tones — confirm with ABG when reading doesn't match clinical signs.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Orthostatic Vital Signs

public enum OrthostaticVitalsSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "orthostatic-vitals",
        title: "Orthostatic vital signs",
        subtitle: "Supine → sit → stand BP and pulse",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        indications: AttributedProse(
            "Assessment for orthostatic hypotension — dizziness/syncope on standing, suspected volume depletion, falls assessment, autonomic dysfunction (Parkinson, diabetic neuropathy), medication evaluation (antihypertensives, alpha-blockers, diuretics).",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "Patients unable to safely change position (recent surgery with restrictions, severe instability, active syncope).",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("BP cuff (manual or automated), stethoscope.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Watch with second hand or timer.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Verify order; explain to patient.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Have patient supine for at least 5 minutes before initial reading.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Ensure call bell within reach; stand within arm's reach during standing measurement — assist if dizzy.", citationIDs: ["openstax_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Supine measurement", body: "After 5+ minutes supine, measure BP and HR. Document.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Sit and remeasure (some protocols)", body: "Have patient sit on edge of bed for 1 minute. Measure BP and HR. Document.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Stand and remeasure", body: "Help patient stand; measure BP and HR at 1 minute and again at 3 minutes standing. Document.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Assess symptoms", body: "Ask about dizziness, lightheadedness, blurred vision, palpitations at each position change.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Return patient to safe position; assist back to bed/chair if symptomatic.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Document positive findings: SBP drop ≥20 mmHg, DBP drop ≥10 mmHg, OR HR rise ≥30 bpm within 3 minutes of standing.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Notify provider for positive findings; review medications for orthostatic-causing drugs.", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("BP and HR at each position with timing; symptoms with each position change.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("Symptomatic orthostasis — high fall risk; institute fall precautions, slow position changes, compression stockings, hydration.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("HR rise ≥30 with no BP change — POTS (postural orthostatic tachycardia syndrome).", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Severe symptoms (syncope, near-syncope) — return to supine immediately, notify provider.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Foley Removal

public enum FoleyRemovalSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "foley-removal",
        title: "Indwelling urinary catheter removal",
        subtitle: "Foley discontinuation · CAUTI prevention",
        nclexTags: infectionTags,
        indications: AttributedProse(
            "Catheter no longer indicated. Daily nurse-driven removal protocols reduce CAUTI rates. Indications for removal include: spontaneous voiding planned, no longer measuring strict I&O, no urinary retention or obstruction, no provider order to keep.",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "Active retention without alternative drainage plan, urologic surgery requiring drainage, ICU strict I&O monitoring, end-of-life care where catheter improves comfort.",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("Clean gloves; underpad; 10 mL syringe (Luer or appropriate size for balloon).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Receptacle for the catheter; bladder scanner for post-removal assessment.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Verify order or nurse-driven protocol applies.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Hand hygiene; explain to patient.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Note balloon volume (typically 10 mL — labeled on inflation port).", citationIDs: ["openstax_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Position and protect", body: "Position patient supine with knees flexed (female) or supine (male). Place underpad beneath buttocks.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Deflate balloon", body: "Attach syringe to inflation port; aspirate ALL fluid (typically 10 mL — confirm against label). DO NOT cut the inflation port — particles can migrate into bladder.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Remove catheter", body: "Gently and steadily withdraw catheter; if resistance, stop and reassess balloon — may need additional aspiration or provider involvement.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Inspect catheter", body: "Inspect tip for completeness; document any sediment, blood, or unusual appearance.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 5, title: "Perineal care", body: "Provide perineal care; remove gloves; hand hygiene.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Encourage fluid intake (unless restricted); track first void within 6 hours.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Bladder scan if no void within 6 hours or if patient reports pressure/discomfort; >300–400 mL with inability to void may indicate retention requiring intermittent cath or replacement.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Monitor for dysuria, urgency, frequency — common transiently; persistent symptoms warrant UTI workup.", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("Time of removal, balloon volume, catheter tip integrity, patient tolerance, post-removal voiding plan.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("Acute urinary retention post-removal — bladder scan, intermittent cath if needed.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Hematuria — minor expected; significant or persistent requires evaluation.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("UTI symptoms after removal — dysuria, frequency, fever; urinalysis and culture.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ostomy Care

public enum OstomyCareSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "ostomy-care",
        title: "Ostomy care and pouch change",
        subtitle: "Colostomy · ileostomy · urostomy",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .elimination),
        indications: AttributedProse(
            "Routine ostomy maintenance — pouch change every 3–7 days or when leakage occurs. Initial pouching after creation, peristomal skin care, patient education, complication assessment.",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "None absolute; if early post-op (less than 24–48 hr) or stoma appears non-viable, defer to surgical team.",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("New pouch with appropriate flange size (cut to ⅛ inch larger than stoma diameter).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Skin barrier wafer; stoma measuring guide.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Mild soap, warm water, soft cloths or gauze; skin barrier paste/powder if peristomal skin breakdown.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Disposable gloves; protective skin wipe.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Disposable bag for old pouch and waste.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Hand hygiene; explain to patient; provide privacy.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Position supine or semi-Fowler; expose abdomen; protect with underpad.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Schedule before meals or 1–2 hours after — minimizes output during change.", citationIDs: ["openstax_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Empty existing pouch", body: "Empty contents into toilet or container; document amount/character.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Remove old pouch", body: "Gently peel pouch from skin, supporting skin with non-dominant hand to prevent trauma. Use adhesive remover wipes if needed.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Clean stoma and skin", body: "Cleanse stoma and peristomal skin gently with warm water and mild soap (avoid lotions, oils). Pat dry — moisture prevents pouch adhesion.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Assess stoma and skin", body: "ASSESS: Stoma should be pink/red, moist, slightly raised. Concerning: dusky/dark (ischemia), retracted (prolapse risk), hemorrhage. Peristomal skin should be intact; document any breakdown.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 5, title: "Measure and prepare new pouch", body: "Measure stoma; cut flange to ⅛ inch larger than stoma diameter (too large allows leakage; too small abrades stoma). Apply skin barrier powder + sealant if peristomal breakdown.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 6, title: "Apply new pouch", body: "Center flange over stoma; apply firm pressure for 1–2 minutes to ensure adhesion (warm hand helps activate adhesive). Confirm seal.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 7, title: "Close pouch", body: "Apply clip or close seal at bottom of pouch.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Dispose of waste appropriately; hand hygiene.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Document stoma color, output character/amount, peristomal skin, pouch system used, patient education provided.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Provide patient education — empty pouch when 1/3 full, change every 3–7 days, skin care, dietary considerations (gas, odor, blockage).", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("Stoma assessment, output character/volume, peristomal skin, pouch type, patient tolerance, education provided.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("Dusky or black stoma — ischemia/necrosis; surgical emergency.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Stoma retraction or prolapse — notify provider; modify pouching.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Peristomal skin breakdown — wound/ostomy nurse consult; barrier paste, hydrocolloid.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("High-output ileostomy — dehydration, hyponatremia, AKI; track output, replace fluids/electrolytes.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("No output × 4–6 hours from ileostomy — possible obstruction; assess for distention, vomiting; notify provider.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Enema Administration

public enum EnemaSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "enema",
        title: "Enema administration",
        subtitle: "Cleansing · retention · therapeutic",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .elimination),
        indications: AttributedProse(
            "Constipation refractory to oral laxatives, bowel preparation, fecal impaction, medication delivery (lactulose for hepatic encephalopathy in obtunded patients), Kayexalate for hyperkalemia.",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "Suspected bowel obstruction or perforation, recent colorectal surgery, severe rectal bleeding, neutropenia (mucosal injury risk), increased ICP (Valsalva risk).",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("Prescribed solution (tap water, NS, soap suds, hypertonic phosphate [Fleet], oil retention).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Enema bag/bucket with tubing (large-volume) or pre-filled bottle (small-volume).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Water-soluble lubricant; clean gloves; underpad; toilet/bedpan/commode.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Verify order — type, volume, route, frequency.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Hand hygiene; explain procedure; ensure privacy.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Position left side-lying (Sims) with right knee flexed — uses gravity and colon anatomy.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Warm solution to body temperature (cold causes cramping).", citationIDs: ["openstax_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Lubricate tip", body: "Lubricate tip of tubing or bottle 3–4 inches.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Insert tip", body: "Gently insert 3–4 inches into rectum (1–2 inches in pediatric), aiming toward umbilicus.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Administer solution", body: "Large-volume: hold bag 12–18 inches above rectum; instill SLOWLY over 5–10 minutes. Pause if patient reports cramping. Small-volume Fleet: squeeze bottle steadily.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Encourage retention", body: "Cleansing enema: hold 5–10 min. Retention enema (oil, lactulose): hold 30+ min as tolerated.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 5, title: "Assist with toileting", body: "Assist to toilet, bedpan, or commode; provide call bell and privacy. Stay nearby for fall risk.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Document type and volume of enema, results (consistency, amount, presence of stool), patient tolerance.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Provide perineal care; assess perineal skin.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Monitor for vagal response (bradycardia, hypotension), especially in elderly or with prolonged Valsalva.", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("Type, volume, time, retention time, results, patient tolerance, vital signs if vagal symptoms occurred.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("Hypertonic phosphate (Fleet) — risk of hyperphosphatemia and AKI in elderly, renal impairment, prolonged retention; avoid in renal disease.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Vagal response — bradycardia, dizziness, syncope; stop, reposition supine, monitor.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Bowel perforation — rare but possible with forceful insertion; severe pain or bleeding requires emergent eval.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Eye Drops Administration

public enum EyeDropsSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "eye-drops",
        title: "Eye drops administration",
        subtitle: "Ophthalmic medication · single eye or bilateral",
        nclexTags: pharmTags,
        indications: AttributedProse(
            "Topical ocular medication — glaucoma, infection, allergy, post-op, dry eye. Right eye (OD), left eye (OS), both eyes (OU).",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "Hypersensitivity to medication, eye injury without provider order.",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("Prescribed ophthalmic medication; tissue.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Clean gloves.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Verify the SEVEN rights: right patient, right drug, right dose, right route, right time, right eye, right documentation.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Verify allergy; check expiration; warm cold drops in hand briefly.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Hand hygiene; explain to patient.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Position patient supine or sitting with head tilted back.", citationIDs: ["openstax_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Open the eye", body: "With non-dominant hand, gently pull lower eyelid down to form a small pocket (conjunctival sac).", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Instill drops", body: "Hold dropper 0.5–1 inch above eye; never touch the eye or lashes with tip. Instill prescribed number of drops into the conjunctival sac (NOT directly on cornea).", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Close eye and apply pressure", body: "Have patient close eye gently for 1–2 minutes; apply gentle pressure to inner canthus (nasolacrimal duct) to reduce systemic absorption — important for beta-blockers (timolol).", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Wipe excess", body: "Wipe excess medication from outer to inner canthus with tissue. Do not rub.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 5, title: "Wait between drops", body: "If multiple eye medications: wait 5 minutes between drops; ointments last; suspensions shake before use.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Document drug, dose, eye, time, patient response.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Assess for therapeutic effect and side effects (especially systemic with timolol — bradycardia, bronchospasm).", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("Drug, dose, eye, time, patient tolerance, response.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("Stinging or blurred vision is common briefly; persistent or severe pain requires reassessment.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Systemic effects from absorption (timolol → bradycardia, bronchospasm; atropine → tachycardia, dry mouth).", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Contamination of dropper tip — discard if touched eye/lashes/skin.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ear Drops Administration

public enum EarDropsSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "ear-drops",
        title: "Ear drops administration",
        subtitle: "Otic medication · pediatric vs adult positioning",
        nclexTags: pharmTags,
        indications: AttributedProse(
            "Otitis externa, cerumen impaction softening, post-op tympanostomy tube infection, otalgia. Right ear (AD), left ear (AS), both ears (AU).",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "Perforated tympanic membrane (most agents — confirm with provider before administration if perforation suspected). Hypersensitivity.",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("Prescribed otic medication.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Cotton ball (loose), tissue.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Verify rights of medication administration.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Hand hygiene; explain to patient.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Warm bottle in hands for 1–2 minutes (cold drops cause vertigo).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Position patient side-lying with affected ear up.", citationIDs: ["openstax_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Straighten ear canal", body: "ADULT: pull pinna UP and BACK. CHILD <3 years: pull pinna DOWN and BACK.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Instill drops", body: "Hold dropper just above ear canal; do not touch the ear with the tip. Instill prescribed number of drops along the side of the canal (avoids air bubble in tympanic membrane).", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Massage tragus", body: "Gently massage the tragus to help drops travel down the canal.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Maintain position", body: "Keep patient on side for 5 minutes to allow drops to penetrate.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 5, title: "Optional cotton", body: "Loose cotton ball at canal opening (NOT packed in) to retain drops if needed; remove after 15 min.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Document drug, dose, ear, time, patient response.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Assess pain, hearing, drainage at next encounter.", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("Drug, dose, ear, time, response.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("Vertigo, tinnitus — usually transient, especially with cold drops.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Worsening pain, fever, persistent drainage — notify provider; possible tympanic perforation or treatment failure.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - PCA (Patient-Controlled Analgesia) Setup

public enum PCASetupSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "pca-setup",
        title: "PCA pump setup and management",
        subtitle: "Patient-controlled analgesia · safety checks",
        nclexTags: pharmTags,
        indications: AttributedProse(
            "Post-op pain management (especially major surgery), cancer pain, sickle cell crisis, severe acute pain in patient who can self-administer.",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "Patient unable to understand or operate the device (cognitive impairment, age <5, unable to press button). Severe respiratory disease without monitoring. Allergy to opioid. PCA-by-proxy (family member pressing button) — not allowed unless authorized PCA-by-proxy program.",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("PCA pump and tubing; opioid syringe/cassette per facility (morphine, hydromorphone, or fentanyl).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Naloxone available at bedside.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Capnography (preferred) and continuous SpO2 monitor.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Pain assessment scale and sedation scale (Pasero Opioid-induced Sedation Scale — POSS).", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order — drug, concentration, demand dose, lockout interval, hourly maximum, basal rate (if any).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Confirm patient cognitively able to use device — teach back demonstration.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Two-nurse independent double check at start, every shift, at any change, and at every refill (ISMP high-alert).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Patient understands PCA-by-proxy is NOT allowed — only the patient may press the button.", citationIDs: ["openstax_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Verify settings (two-nurse check)", body: "Confirm drug, concentration, demand dose, lockout (typical 6–10 min), 1- or 4-hour limit, basal (often NONE for opioid-naive — basal increases respiratory depression risk).", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Connect tubing", body: "Prime tubing per pump; connect to dedicated IV port closest to patient. Use anti-siphon and anti-reflux valves per system.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Patient education", body: "Teach button use, lockout concept (won't get extra dose if pressed during lockout), expected side effects, when to call nurse.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Initial assessment", body: "Baseline pain, sedation (POSS), RR, SpO2, capnography. Document attempts vs delivered doses.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 5, title: "Reassess frequently", body: "Reassess pain, sedation, RR, SpO2, capnography every 1–2 hours initially, then per protocol. Document attempts vs delivered for trend.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Track attempts vs delivered doses — high attempts/low delivered = inadequate analgesia (consult pain team).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Bowel regimen prophylactically.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Transition to oral analgesia when tolerating PO and pain controlled — overlap to prevent breakthrough.", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("Pump settings, drug, concentration, attempts, deliveries, pain score, POSS, RR, SpO2, capnography, two-nurse check.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("Excessive sedation (POSS ≥3) — STOP PCA, reassess; naloxone if RR <8 or unresponsive.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Respiratory depression — RR <10 or SpO2 dropping or capnography rising; STOP, oxygen, reverse with naloxone.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("PCA-by-proxy — family pressing button is a serious safety violation; reinforce education and document.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Inadequate analgesia despite use — consult pain team; consider basal rate, change drug, multimodal therapy.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Wound VAC (Negative Pressure Wound Therapy)

public enum WoundVACSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "wound-vac",
        title: "Negative pressure wound therapy (Wound VAC)",
        subtitle: "Foam · drape · vacuum drainage",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        indications: AttributedProse(
            "Chronic wounds (pressure injuries, venous ulcers, diabetic foot ulcers), traumatic wounds, dehisced surgical wounds, skin grafts and flaps, enterocutaneous fistula management. Promotes granulation, removes exudate, reduces edema.",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "Untreated osteomyelitis, malignancy in the wound, exposed vital structures or anastomoses, necrotic tissue with eschar (debride first), unexplored fistulas with body cavity communication.",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("VAC unit (KCI, ActiV.A.C., Smith & Nephew systems).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Reticulated polyurethane foam (black) or polyvinyl alcohol (white) — choice per wound.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Adhesive transparent drape; SensaT.R.A.C. or similar pad with tubing.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Sterile gloves; sterile saline; scissors (sterile); skin prep wipes.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order including pressure setting (typically 75–125 mmHg continuous), foam type, dressing change frequency (every 48–72 hours).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Premedicate per pain protocol — VAC dressing changes are painful.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Hand hygiene; sterile field; assess wound (length, width, depth, undermining/tunneling, tissue type, exudate, peri-wound skin).", citationIDs: ["openstax_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Discontinue suction", body: "Turn off VAC; clamp tubing; gently remove old drape and foam (saline-soak if foam adheres to wound bed to reduce trauma).", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Clean wound", body: "Cleanse wound with sterile saline; assess; document. Notify provider of changes (tunneling, fistula, slough, infection signs).", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Cut foam to size", body: "Cut foam to fit wound exactly — should fill cavity but not overlap onto intact skin. Document number of pieces and confirm count at next change to ensure no retained foam.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Place foam in wound", body: "Place foam in wound; gently fill all areas (no air gaps). Cover with adhesive transparent drape extending 3–5 cm onto intact peri-wound skin.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 5, title: "Cut hole and apply pad", body: "Cut a small (~2.5 cm) hole in drape over foam; apply SensaT.R.A.C. or similar suction pad over hole.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 6, title: "Connect to VAC unit", body: "Connect tubing; turn on VAC at prescribed pressure (typically 125 mmHg continuous, 75 mmHg for fragile or painful wounds).", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 7, title: "Verify seal", body: "Confirm dressing collapses inward (raisin appearance) — indicates good seal. Patch any leaks with extra drape.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Document wound assessment, foam count, pressure setting, dressing intactness, patient tolerance, pain.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Empty canister when 2/3 full; track output character and volume.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Verify therapy continuous (no longer than 2 hours off without changing dressing — wound bed dries out).", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("Wound assessment, foam count, pressure setting, exudate volume/character, peri-wound skin, patient tolerance.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("BLEEDING — bright red exudate, sudden increase, visible vessels: STOP therapy, apply pressure, notify provider/surgeon STAT.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Air leak — alarm sounding; reseal drape; no greater than 2-hour interruption without dressing change.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Retained foam from prior change — count carefully every change.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Maceration of peri-wound skin — apply skin protectant before drape.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Infection signs — increased pain, foul odor, purulent exudate, fever; notify provider.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - NG Tube Removal

public enum NGTubeRemovalSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "ng-tube-removal",
        title: "Nasogastric tube removal",
        subtitle: "Discontinuation of NG/OG tube",
        nclexTags: basicCareTags,
        indications: AttributedProse(
            "Bowel function returned (passing flatus, soft abdomen, decreased output). Decompression no longer needed. Patient tolerating clamped tube trial. Provider order to discontinue.",
            citationIDs: ["openstax_skills2", "openrn_skills2"]
        ),
        contraindications: AttributedProse(
            "Active bowel obstruction, persistent vomiting, large NG output indicating ongoing decompression need. Verify provider order.",
            citationIDs: ["openrn_skills2"]
        ),
        equipment: [
            AttributedBullet("Clean gloves; underpad/towel; tissue.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("60 mL syringe for any final aspiration; emesis basin.", citationIDs: ["openstax_skills2"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order; verify clamped trial successful (no nausea/vomiting/distention 4–8 hr after clamping).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Hand hygiene; explain procedure; reassure patient (removal causes mild gagging).", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Position semi-Fowler; place underpad on chest; have tissue ready.", citationIDs: ["openstax_skills2"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Disconnect suction", body: "Turn off suction; disconnect tubing.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 2, title: "Final flush or aspirate", body: "Flush 30 mL air or normal saline through tube to clear contents (or aspirate residual per protocol).", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 3, title: "Remove tape", body: "Gently remove tape securing tube to nose and gown.", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 4, title: "Have patient take a deep breath and hold", body: "Instruct patient to take a deep breath and hold it (closes epiglottis, reduces aspiration risk during removal).", citationIDs: ["openstax_skills2"]),
            ProcedureStep(number: 5, title: "Withdraw smoothly", body: "Withdraw tube smoothly and steadily over 3–6 seconds. Place in emesis basin or waste; cover.", citationIDs: ["openstax_skills2"])
        ],
        postProcedure: [
            AttributedBullet("Provide oral and nasal care — apply lubricant to dry nasal passages.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Assess for nausea, vomiting, distention; reassess in 4–8 hours.", citationIDs: ["openstax_skills2"]),
            AttributedBullet("Advance diet per provider order — typically clears → soft → regular as tolerated.", citationIDs: ["openstax_skills2"])
        ],
        documentation: [
            AttributedBullet("Time of removal, tube intact, final aspirate amount, patient tolerance, post-removal assessment, diet advancement.", citationIDs: ["openstax_skills2"])
        ],
        watchFor: [
            AttributedBullet("Nausea, vomiting, distention after removal — may need NG replacement; notify provider.", citationIDs: ["openrn_skills2"]),
            AttributedBullet("Persistent epistaxis or sore throat — usually self-limited; cool fluids help.", citationIDs: ["openrn_skills2"])
        ],
        citations: [openstaxSkills2, openrnSkills2],
        lastSourceFidelityReview: "2026-05-04"
    )
}
