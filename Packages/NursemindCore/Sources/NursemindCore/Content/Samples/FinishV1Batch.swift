import Foundation

// Curator-model entries that bring Procedures, Diagnoses, and Reference categories
// to the v1 target. Sources: Open RN Med-Surg + Health Alterations + Nursing Skills (CC BY 4.0),
// OpenStax Clinical Nursing Skills (CC BY 4.0 with display restriction), CDC HICPAC and
// NPIAP guidance (public domain or fact-citation), AHA and KDIGO concept citations.

// MARK: - Shared citation sources

private let openrnMedSurgFinish = CitationSource(
    id: "openrn_medsurg_finish",
    shortName: "Open RN Medical-Surgical Nursing",
    detail: "Open Resources for Nursing — Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingadvancedskills/?s=medical+surgical+nursing",
    lastRetrieved: "2026-05-04"
)

private let openrnHealthAltFinish = CitationSource(
    id: "openrn_healthalt_finish",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=health+alterations+pathophysiology",
    lastRetrieved: "2026-05-04"
)

private let openrnSkillsFinish = CitationSource(
    id: "openrn_skills_finish",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=skills+procedure+technique",
    lastRetrieved: "2026-05-04"
)

private let openstaxSkillsFinish = CitationSource(
    id: "openstax_skills_finish",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)

private let cdcHandHygieneFinish = CitationSource(
    id: "cdc_hand_hygiene_finish",
    shortName: "CDC Hand Hygiene in Healthcare Settings",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/clean-hands/hcp/clinical-safety/",
    lastRetrieved: "2026-05-04"
)

private let cdcPPESequence = CitationSource(
    id: "cdc_ppe_sequence",
    shortName: "CDC Sequence for Putting On and Removing Personal Protective Equipment",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/personal-protective-equipment/",
    lastRetrieved: "2026-05-04"
)

private let npiap = CitationSource(
    id: "npiap_pressure_injury",
    shortName: "NPIAP Pressure Injury Staging (concept citation)",
    detail: "National Pressure Injury Advisory Panel staging system — concept reference; staging definitions are widely accepted standard of care",
    publisher: "National Pressure Injury Advisory Panel",
    license: .factCitationOnly,
    url: "https://npiap.com/page/PressureInjuryStages",
    lastRetrieved: "2026-05-04"
)

private let ahaCpr = CitationSource(
    id: "aha_cpr_ecc_finish",
    shortName: "AHA Adult ACLS / Emergency Cardiovascular Care (concept citation)",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://cpr.heart.org/en/resuscitation-science/cpr-and-ecc-guidelines",
    lastRetrieved: "2026-05-04"
)

private let infectionTagsFinish = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .infection
)

private let perfusionTagsFinish = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .physiologicalAdaptation,
    priorityConcept: .perfusion
)

private let fluidTagsFinish = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .fluidElectrolytes
)

private let mobilityTagsFinish = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .basicCareAndComfort,
    priorityConcept: .mobility
)

private let glucoseTagsFinish = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .physiologicalAdaptation,
    priorityConcept: .glucoseRegulation
)

private let gasExchangeTagsFinish = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .gasExchange
)

// MARK: - Procedure: Tracheal Suctioning (in-line)

public enum TrachealSuctioningSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "tracheal-suctioning",
        title: "Tracheal suctioning",
        subtitle: "Closed in-line system · sterile technique",
        nclexTags: gasExchangeTagsFinish,
        indications: AttributedProse(
            "Tracheal suctioning removes secretions from the trachea and lower airways in patients with artificial airways (endotracheal or tracheostomy tubes) when the patient cannot clear them independently. Indicators include audible or visible secretions, decreased SpO2, increased peak inspiratory pressures on the ventilator, decreased tidal volumes, restlessness, or coarse rhonchi.",
            citationIDs: ["openrn_skills_finish", "openstax_skills_finish"]
        ),
        contraindications: AttributedProse(
            "There are no absolute contraindications when suctioning is necessary, but caution with severe bronchospasm, pulmonary hemorrhage, severe coagulopathy, or unstable cardiovascular status — pre-oxygenate and limit suction time.",
            citationIDs: ["openrn_skills_finish"]
        ),
        equipment: [
            AttributedBullet("Closed in-line suction catheter (in place on the ventilator circuit) of appropriate size — typically 12–14 Fr for adults.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Suction source set to 80–120 mmHg negative pressure for adults.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Sterile saline for catheter clearing only — routine instillation of saline for secretion mobilization is NOT recommended.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Pulse oximeter, ambu bag connected to oxygen source, ventilator with FiO2 100% pre-suction setting if available.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Clean gloves, mask with eye protection, gown.", citationIDs: ["cdc_hand_hygiene_finish"])
        ],
        preProcedure: [
            AttributedBullet("Verify indication — auscultate, observe vent waveforms, check SpO2.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Hand hygiene; don PPE.", citationIDs: ["cdc_hand_hygiene_finish"]),
            AttributedBullet("Pre-oxygenate with 100% FiO2 for 30–60 seconds (via ventilator pre-suction button or ambu bag).", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Ensure suction system is connected and at correct pressure (80–120 mmHg adult).", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Position patient semi-Fowler's if tolerated.", citationIDs: ["openrn_skills_finish"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Pre-oxygenate", body: "Pre-oxygenate with 100% FiO2 for 30–60 seconds via ventilator pre-suction or ambu bag.", citationIDs: ["openrn_skills_finish"]),
            ProcedureStep(number: 2, title: "Insert catheter without suction", body: "Advance the closed-system catheter through the ETT or tracheostomy until resistance is met or the patient coughs (typically 1–2 cm beyond the tip of the artificial airway). Do NOT apply suction during insertion.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 3, title: "Withdraw with suction", body: "Apply intermittent suction by pressing the thumb control while withdrawing the catheter in a steady motion. Do not rotate (closed-system catheters do not require rotation). Limit each pass to no more than 10–15 seconds.", citationIDs: ["openrn_skills_finish", "openstax_skills_finish"]),
            ProcedureStep(number: 4, title: "Clear the catheter", body: "After withdrawing, instill 5–10 mL of saline into the closed-system flush port to clear secretions from the catheter (this is for the catheter, NOT the patient's airway).", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 5, title: "Hyperoxygenate and reassess", body: "Allow the patient to receive 100% FiO2 for 30–60 seconds between passes. Reassess SpO2, breath sounds, vent waveforms, and patient tolerance before another pass.", citationIDs: ["openrn_skills_finish"]),
            ProcedureStep(number: 6, title: "Repeat as needed", body: "Repeat passes as needed to clear secretions, generally limit to 3 consecutive passes; allow recovery between attempts.", citationIDs: ["openstax_skills_finish"])
        ],
        postProcedure: [
            AttributedBullet("Return ventilator FiO2 to baseline setting.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Reassess respiratory status — SpO2, lung sounds, work of breathing, vent waveforms.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Provide oral care per VAP prevention bundle.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Discard PPE; perform hand hygiene.", citationIDs: ["cdc_hand_hygiene_finish"])
        ],
        documentation: [
            AttributedBullet("Indication for suctioning, time, and pre/post SpO2.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Character (color, viscosity, amount) of secretions.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Patient tolerance, including any vital sign changes.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Number of suction passes.", citationIDs: ["openrn_skills_finish"])
        ],
        watchFor: [
            AttributedBullet("Hypoxia — limit each pass to 10–15 seconds; pre-oxygenate.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Bradycardia from vagal stimulation — stop, reassess, hyperoxygenate.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Bronchospasm — wheezing, coughing fit; allow recovery.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Mucosal trauma — bloody secretions; reduce suction pressure, evaluate technique.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Increased ICP from coughing — pre-oxygenate, minimize stimulation, consider sedation per protocol.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("VAP risk — coordinate suctioning with bundle elements (HOB ≥30°, oral care, sedation interruption, DVT and ulcer prophylaxis).", citationIDs: ["openrn_skills_finish"])
        ],
        citations: [openrnSkillsFinish, openstaxSkillsFinish, cdcHandHygieneFinish],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Procedure: 12-Lead ECG

public enum TwelveLeadECGSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "twelve-lead-ecg",
        title: "12-lead ECG placement",
        subtitle: "Standard 10-electrode 12-lead acquisition",
        nclexTags: perfusionTagsFinish,
        indications: AttributedProse(
            "A 12-lead electrocardiogram is performed to evaluate cardiac rhythm, conduction, and for evidence of myocardial ischemia or infarction. Indications include chest pain, dyspnea, syncope, palpitations, suspected arrhythmia, suspected drug toxicity (digoxin, tricyclics), preoperative cardiac risk assessment, and routine cardiac monitoring per protocol.",
            citationIDs: ["openrn_skills_finish", "openstax_skills_finish"]
        ),
        equipment: [
            AttributedBullet("12-lead ECG machine (calibrated, paper loaded).", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("10 disposable electrodes.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Skin prep — alcohol wipes; razor or clippers if hairy chest.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Drape for patient privacy.", citationIDs: ["openstax_skills_finish"])
        ],
        preProcedure: [
            AttributedBullet("Verify the order and indication; identify the patient using two identifiers.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Explain the procedure — non-invasive, painless, takes about 5 minutes.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Position the patient supine with chest exposed (drape for privacy).", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Hand hygiene.", citationIDs: ["cdc_hand_hygiene_finish"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Prepare the skin", body: "Wipe each electrode site with alcohol and let dry. Clip excessive chest hair if needed for adhesion. Lightly abrade the skin if very dry to improve signal.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 2, title: "Place limb leads", body: "Limb leads on flat fleshy areas — RA on right wrist or upper arm, LA on left wrist or upper arm, RL on right ankle or lower leg, LL on left ankle or lower leg. Avoid placing on bony prominences.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 3, title: "Place V1", body: "V1: 4th intercostal space, right sternal border. Find the manubriosternal angle (Angle of Louis) and slide down to the second rib; the second intercostal space is just below; count down to the 4th intercostal space.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 4, title: "Place V2", body: "V2: 4th intercostal space, left sternal border (mirror image of V1).", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 5, title: "Place V4", body: "V4: 5th intercostal space, midclavicular line. (Place V4 before V3 — V3 is between V2 and V4.)", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 6, title: "Place V3", body: "V3: directly between V2 and V4.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 7, title: "Place V5", body: "V5: same horizontal level as V4, anterior axillary line.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 8, title: "Place V6", body: "V6: same horizontal level as V4 and V5, midaxillary line.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 9, title: "Verify and acquire", body: "Verify all 10 electrodes are well-attached. Ask patient to lie still and not talk during acquisition. Press acquire on the ECG machine.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 10, title: "Review and label", body: "Review the tracing for artifact, baseline drift, and lead reversal. Confirm patient name, date, time on the strip. Have a provider read for any urgent findings.", citationIDs: ["openstax_skills_finish"])
        ],
        postProcedure: [
            AttributedBullet("Remove electrodes; clean any residual adhesive from the skin.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Provide privacy and comfort.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Notify provider for any acute changes — ST elevation, new arrhythmia, prolonged QT.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Hand hygiene.", citationIDs: ["cdc_hand_hygiene_finish"])
        ],
        documentation: [
            AttributedBullet("Indication, time of acquisition, and any symptoms at the time.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Whom the ECG was reviewed by and any actions taken.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Patient tolerance.", citationIDs: ["openstax_skills_finish"])
        ],
        watchFor: [
            AttributedBullet("ST elevation in contiguous leads — possible STEMI; activate cath lab per facility protocol.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("New arrhythmia — wide-complex, AV block, atrial fibrillation with rapid ventricular response — notify immediately.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Lead reversal — produces an abnormal-looking tracing; verify electrode placement before treating.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("If posterior MI suspected (tall R in V1, ST depression in V1–V3), additional posterior leads (V7–V9) are warranted.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("If RV infarct suspected with inferior MI, right-sided leads (V4R) are warranted.", citationIDs: ["openrn_skills_finish"])
        ],
        citations: [openrnSkillsFinish, openstaxSkillsFinish, cdcHandHygieneFinish],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Procedure: Chest Tube Care

public enum ChestTubeCareSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "chest-tube-care",
        title: "Chest tube care",
        subtitle: "Closed drainage system maintenance · pleural / mediastinal",
        nclexTags: gasExchangeTagsFinish,
        indications: AttributedProse(
            "Chest tube care includes assessment, drainage system maintenance, and patient monitoring for any patient with a thoracostomy tube. Indications for chest tube placement include pneumothorax, hemothorax, pleural effusion, empyema, post-cardiothoracic surgery, and chylothorax.",
            citationIDs: ["openrn_medsurg_finish", "openstax_skills_finish"]
        ),
        equipment: [
            AttributedBullet("Closed chest drainage system (typically dry suction or water seal type).", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Sterile occlusive dressing supplies for any dressing changes.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Two large hemostats / Kelly clamps at the bedside (some facilities — verify policy; many now recommend NEVER routinely clamping a chest tube).", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Sterile occlusive gauze (petrolatum) for emergency tube dislodgement.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Suction source per provider order.", citationIDs: ["openstax_skills_finish"])
        ],
        preProcedure: [
            AttributedBullet("Verify the system is connected, intact, and functioning per order.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Identify patient using two identifiers; explain assessment.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Position patient semi-Fowler's or higher.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Hand hygiene; don clean gloves.", citationIDs: ["cdc_hand_hygiene_finish"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Assess the patient", body: "Respiratory rate, work of breathing, SpO2, breath sounds bilaterally, chest wall symmetry, pain at insertion site.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 2, title: "Assess insertion site", body: "Inspect dressing for integrity, drainage character, and odor. Palpate for subcutaneous emphysema (crepitus). Check that the suture is intact.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 3, title: "Assess tubing", body: "Tubing should be patent — no kinks, no dependent loops (which trap fluid and impede drainage), no clots. Tubing should be secured and below the level of the chest at all times.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 4, title: "Assess drainage chamber", body: "Mark the level of drainage on the outside of the chamber with the time. Note color, character, and amount. Notify provider for >100 mL/hr (or per facility threshold) of bloody drainage.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 5, title: "Assess water seal chamber", body: "Tidaling — fluctuation with respiration — confirms the system is patent and the lung is not yet re-expanded. Cessation of tidaling can mean lung re-expansion OR obstruction in the tubing — assess the patient.", citationIDs: ["openstax_skills_finish", "openrn_medsurg_finish"]),
            ProcedureStep(number: 6, title: "Assess for air leak", body: "Bubbling in the water seal chamber on expiration only is a normal finding immediately after pneumothorax. Continuous bubbling indicates an air leak — check connections, dressing, and patient. Notify provider.", citationIDs: ["openstax_skills_finish", "openrn_medsurg_finish"]),
            ProcedureStep(number: 7, title: "Assess suction (if ordered)", body: "If on dry suction, verify the indicator window shows the ordered suction is being delivered. If on wet suction, gentle bubbling in the suction control chamber indicates suction is working.", citationIDs: ["openstax_skills_finish"])
        ],
        postProcedure: [
            AttributedBullet("Reposition patient comfortably; ensure tubing is not tucked under the body or kinked.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Encourage deep breathing, coughing, incentive spirometry per protocol.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Manage pain — controls splinting and improves lung re-expansion.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Hand hygiene.", citationIDs: ["cdc_hand_hygiene_finish"])
        ],
        documentation: [
            AttributedBullet("Time, drainage amount and character, suction setting, water seal status (tidaling, air leak).", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Insertion site appearance, dressing integrity.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Patient tolerance, pain assessment, respiratory status.", citationIDs: ["openstax_skills_finish"])
        ],
        watchFor: [
            AttributedBullet("Sudden onset of respiratory distress — possible tension pneumothorax (trachea deviation, hypotension, absent breath sounds on affected side); chest tube may have dislodged or system disconnected. EMERGENCY.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Tube dislodgement from patient — apply sterile petrolatum gauze taped on three sides to allow air escape but prevent re-entry, notify provider immediately.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Disconnection from drainage system — submerge the tube end in sterile water until reconnection; do NOT clamp.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Excessive bloody drainage (>100 mL/hr or per facility threshold) — possible hemothorax; assess hemodynamics, notify provider, type and crossmatch.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Subcutaneous emphysema spreading — palpable crepitus extending; may indicate inadequate drainage or large air leak; notify provider.", citationIDs: ["openrn_medsurg_finish"])
        ],
        citations: [openrnMedSurgFinish, openstaxSkillsFinish, cdcHandHygieneFinish],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Procedure: SCD application

public enum SCDApplicationSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "scd-application",
        title: "Sequential compression device application",
        subtitle: "DVT prophylaxis · mechanical",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .clottingHemostasis
        ),
        indications: AttributedProse(
            "Sequential compression devices (SCDs) provide mechanical prophylaxis against deep vein thrombosis in immobile or postoperative patients. Used either alone (in patients at high bleeding risk where pharmacologic prophylaxis is contraindicated) or in combination with pharmacologic prophylaxis. They mimic muscle pump action by sequentially inflating cuffs from distal to proximal, propelling venous blood toward the heart and reducing venous stasis.",
            citationIDs: ["openrn_skills_finish", "openrn_medsurg_finish"]
        ),
        contraindications: AttributedProse(
            "Active DVT or known acute lower-extremity DVT (compression can dislodge clot — clarify with provider before application); severe peripheral arterial disease or absent pedal pulses; recent skin graft, fresh wound, or fracture in the limb; severe peripheral neuropathy; massive limb edema where the cuff cannot fit safely; suspected compartment syndrome.",
            citationIDs: ["openrn_skills_finish"]
        ),
        equipment: [
            AttributedBullet("SCD pump (calibrated, plugged in, alarms verified).", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Appropriately sized sleeves — knee-high or thigh-high per provider order; sized by limb circumference per manufacturer guide.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Tubing and connectors specific to the SCD system.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Stockinette or thin layer of clothing to wear under the sleeve for skin protection (if facility protocol).", citationIDs: ["openstax_skills_finish"])
        ],
        preProcedure: [
            AttributedBullet("Verify the order and rule out contraindications — assess pedal pulses and skin integrity.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Identify patient using two identifiers; explain procedure.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Position patient supine or semi-Fowler's with legs accessible.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Hand hygiene.", citationIDs: ["cdc_hand_hygiene_finish"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Measure and select sleeve", body: "Measure the calf (knee-high) or thigh (thigh-high) circumference per manufacturer instructions. Select the correct size — too tight impedes circulation, too loose is ineffective.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 2, title: "Place sleeve under the leg", body: "Open the sleeve flat on the bed. Position the patient's leg on top of the sleeve with the marked landmarks aligned (typically posterior knee crease for knee-high; gluteal fold for thigh-high).", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 3, title: "Wrap and fasten", body: "Wrap the sleeve around the leg with the inflatable bladders facing inward. Fasten the velcro snugly — should admit two fingers between the sleeve and the leg.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 4, title: "Connect to pump", body: "Connect the sleeve tubing to the pump tubing per manufacturer's keyed connectors.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 5, title: "Turn on the pump", body: "Turn on the pump and verify cycling — sleeves should sequentially inflate from distal to proximal at the prescribed pressure (typically 35–55 mmHg) and cycle every 60 seconds.", citationIDs: ["openstax_skills_finish"]),
            ProcedureStep(number: 6, title: "Verify patient comfort", body: "Confirm the patient is not experiencing pain, numbness, or excessive pressure. Adjust if uncomfortable.", citationIDs: ["openstax_skills_finish"])
        ],
        postProcedure: [
            AttributedBullet("Apply continuously except during ambulation, bathing, or skin/circulation assessment (typically every 8 hours).", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Remove every 8 hours to inspect skin and assess pulses.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Encourage ambulation per provider order — SCDs are not a substitute for movement.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("Hand hygiene.", citationIDs: ["cdc_hand_hygiene_finish"])
        ],
        documentation: [
            AttributedBullet("Time of application; size, pressure setting, and limb assessment.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Skin integrity, distal pulses, sensation, color, and temperature.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Patient tolerance.", citationIDs: ["openstax_skills_finish"]),
            AttributedBullet("Times removed for assessment or ambulation.", citationIDs: ["openstax_skills_finish"])
        ],
        watchFor: [
            AttributedBullet("Compartment syndrome — pain out of proportion, paresthesia, paralysis, pallor, pulselessness; emergency.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Skin breakdown — pressure injury under the sleeve; assess every 8 hours.", citationIDs: ["openrn_skills_finish"]),
            AttributedBullet("DVT despite prophylaxis — asymmetric leg swelling, pain, warmth; do not massage; elevate; notify provider.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Pump failure — alarm, no cycling; check connections, tubing for kinks, and replace pump.", citationIDs: ["openstax_skills_finish"])
        ],
        citations: [openrnSkillsFinish, openrnMedSurgFinish, openstaxSkillsFinish, cdcHandHygieneFinish],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Diagnosis: Hyperkalemia

public enum HyperkalemiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hyperkalemia",
        title: "Hyperkalemia",
        subtitle: "Serum K⁺ > 5.0 mEq/L",
        nclexTags: fluidTagsFinish,
        definition: AttributedProse(
            "Hyperkalemia is a serum potassium level above the normal range of 3.5–5.0 mEq/L. It is a common, potentially life-threatening electrolyte derangement most often seen in patients with acute or chronic kidney disease, on RAAS inhibitors, or with massive cellular release (rhabdomyolysis, tumor lysis, hemolysis). Levels above 6.5 mEq/L or with ECG changes are an ACLS-level emergency.",
            citationIDs: ["openrn_healthalt_finish", "aha_cpr_ecc_finish"]
        ),
        pathophysiology: AttributedProse(
            "Potassium is the principal intracellular cation. Serum potassium reflects only a tiny fraction of total body potassium, but small changes have major effects on cardiac and neuromuscular excitability. Hyperkalemia depolarizes cell membranes, slowing cardiac conduction and producing characteristic ECG changes that progress to arrhythmia and cardiac arrest.",
            citationIDs: ["openrn_healthalt_finish"]
        ),
        presentation: [
            AttributedBullet("Often asymptomatic until cardiac changes occur — ECG may be the first finding.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Muscle weakness, cramps, paresthesias.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Nausea, vomiting, diarrhea.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Palpitations, lightheadedness from arrhythmia.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Severe: ascending paralysis, respiratory failure, sudden cardiac death.", citationIDs: ["openrn_healthalt_finish"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum potassium >5.0 mEq/L confirmed on a non-hemolyzed sample (hemolysis falsely elevates result).", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("ECG progression — peaked T waves → prolonged PR → loss of P waves → wide QRS → sine wave → ventricular fibrillation/asystole.", citationIDs: ["aha_cpr_ecc_finish", "openrn_healthalt_finish"]),
            AttributedBullet("Workup for cause — renal function, urine output, medication review, CK if rhabdomyolysis suspected, uric acid and phosphate if tumor lysis suspected.", citationIDs: ["openrn_healthalt_finish"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous cardiac monitoring; STAT 12-lead ECG.", citationIDs: ["aha_cpr_ecc_finish"]),
            AttributedBullet("Hemodynamics — BP, HR, mental status.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Strict intake/output; assess renal function (recent BUN, creatinine, eGFR).", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Medication review — ACE-I, ARB, spironolactone, NSAIDs, trimethoprim, beta-blockers, digoxin (caution with calcium administration).", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Repeat sample to rule out pseudo-hyperkalemia from hemolysis.", citationIDs: ["openrn_healthalt_finish"])
        ],
        commonInterventions: [
            AttributedBullet("Stabilize the cardiac membrane — calcium gluconate 1–2 g IV over 5–10 minutes (does not lower K, just stabilizes the heart).", citationIDs: ["aha_cpr_ecc_finish", "openrn_healthalt_finish"]),
            AttributedBullet("Shift K intracellularly — insulin (regular 10 units IV) + dextrose (D50W 25–50 g IV) to prevent hypoglycemia; albuterol 10–20 mg nebulized; sodium bicarbonate if acidotic.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Remove K from the body — sodium polystyrene sulfonate or patiromer (slow), loop diuretics if euvolemic, dialysis if refractory or in established renal failure.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Hold offending medications — ACE-I, ARB, spironolactone, NSAIDs.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Treat the underlying cause — fluid resuscitation, treat AKI, manage rhabdomyolysis or tumor lysis.", citationIDs: ["openrn_healthalt_finish"])
        ],
        watchFor: [
            AttributedBullet("Sudden cardiac arrest from VF or asystole — be prepared to defibrillate.", citationIDs: ["aha_cpr_ecc_finish"]),
            AttributedBullet("Recurrence after initial treatment — insulin/dextrose and albuterol shift K intracellularly but do not remove it; without follow-on removal therapy, K rebounds.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Hypoglycemia from insulin administration — give dextrose with insulin, monitor glucose hourly for several hours.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Calcium-digoxin interaction — IV calcium can precipitate digoxin toxicity arrhythmia; use cautiously in digitalized patients except in life-threatening hyperkalemia.", citationIDs: ["openrn_healthalt_finish"])
        ],
        citations: [openrnHealthAltFinish, ahaCpr],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Diagnosis: Hyponatremia

public enum HyponatremiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hyponatremia",
        title: "Hyponatremia",
        subtitle: "Serum Na⁺ < 135 mEq/L",
        nclexTags: fluidTagsFinish,
        definition: AttributedProse(
            "Hyponatremia is a serum sodium concentration below 135 mEq/L. It is the most common electrolyte abnormality in hospitalized patients. Severity is classified by both the level and the rate of change — chronic mild hyponatremia is often well-tolerated, but acute or severe hyponatremia (especially <120 mEq/L) can cause cerebral edema, seizures, and death.",
            citationIDs: ["openrn_healthalt_finish"]
        ),
        pathophysiology: AttributedProse(
            "Hyponatremia almost always reflects relative water excess rather than absolute sodium deficiency. Categorized by volume status: hypovolemic (true sodium loss exceeding water loss — diuretics, vomiting, diarrhea, third-spacing), euvolemic (water retention without sodium loss — SIADH, hypothyroidism, glucocorticoid deficiency), or hypervolemic (water retention exceeding sodium retention — heart failure, cirrhosis, nephrotic syndrome).",
            citationIDs: ["openrn_healthalt_finish"]
        ),
        presentation: [
            AttributedBullet("Often asymptomatic in mild or chronic cases (Na 130–135).", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Headache, nausea, vomiting, malaise.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Confusion, lethargy, restlessness, gait disturbance.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Seizures, coma, respiratory arrest in severe acute hyponatremia.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Symptoms correlate more with rate of fall than with absolute level.", citationIDs: ["openrn_healthalt_finish"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum sodium <135 mEq/L; severe <120 mEq/L.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Determine tonicity — measure serum osmolality. True hyponatremia is hypotonic (<275 mOsm/kg). Pseudo-hyponatremia (normal osmolality) and hyperglycemic hyponatremia (high osmolality) are different categories.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Assess volume status (clinical exam, urine sodium, urine osmolality) to categorize hypovolemic / euvolemic / hypervolemic.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Workup for cause — TFTs, cortisol, urine studies, medication review.", citationIDs: ["openrn_healthalt_finish"])
        ],
        priorityAssessments: [
            AttributedBullet("Mental status, neurologic exam — orientation, gait, reflexes, seizure precautions if Na <125.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Volume status — daily weight, intake/output, JVP, edema, mucous membranes.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Trend serum sodium per protocol — every 2–6 hours during active correction.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Medication review — thiazides, SSRIs, carbamazepine, MDMA, oxytocin, NSAIDs.", citationIDs: ["openrn_healthalt_finish"])
        ],
        commonInterventions: [
            AttributedBullet("Treat underlying cause — fluid resuscitation for hypovolemia, fluid restriction for SIADH, diuresis for hypervolemic.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Severe symptomatic acute hyponatremia (Na <120 with seizures, coma) — hypertonic 3% saline 100 mL bolus, may repeat, with strict monitoring.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Limit correction to 6–8 mEq/L in 24 hours and 18 mEq/L in 48 hours to prevent osmotic demyelination syndrome (formerly central pontine myelinolysis).", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("SIADH — fluid restriction (typically <1 L/day), salt tablets, demeclocycline or vaptans in selected cases.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Discontinue offending medications.", citationIDs: ["openrn_healthalt_finish"])
        ],
        watchFor: [
            AttributedBullet("Osmotic demyelination syndrome (ODS) — irreversible neurologic damage from over-rapid correction of chronic hyponatremia. Symptoms (dysphagia, dysarthria, paralysis) appear days after correction.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Cerebral edema in severe acute hyponatremia — seizures, coma, herniation. Emergency.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Recurrence — if cause is not addressed (chronic SIADH, ongoing diuretic), hyponatremia will recur.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Beer potomania, tea-and-toast diet — solute-poor diet causes inability to excrete free water.", citationIDs: ["openrn_healthalt_finish"])
        ],
        citations: [openrnHealthAltFinish],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Diagnosis: DVT

public enum DVTSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "dvt",
        title: "Deep Vein Thrombosis",
        subtitle: "DVT — venous thromboembolism risk",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .clottingHemostasis
        ),
        definition: AttributedProse(
            "Deep vein thrombosis is the formation of a blood clot in a deep vein, most commonly in the lower extremity (femoral, popliteal, calf veins), but also possible in upper extremity, mesenteric, or cerebral veins. DVT and pulmonary embolism are collectively venous thromboembolism (VTE), a leading preventable cause of in-hospital death.",
            citationIDs: ["openrn_medsurg_finish"]
        ),
        pathophysiology: AttributedProse(
            "Virchow's triad — venous stasis, endothelial injury, and hypercoagulability — drives thrombus formation. Hospitalization, surgery, immobility, malignancy, oral contraceptives, pregnancy, prior VTE, factor V Leiden, and other thrombophilias all contribute.",
            citationIDs: ["openrn_medsurg_finish"]
        ),
        presentation: [
            AttributedBullet("Unilateral leg swelling, pain, warmth, erythema.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Calf tenderness; positive Homan sign (pain on dorsiflexion) is unreliable and not recommended for diagnosis.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Palpable cord along the deep vein.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Up to 50% of DVTs are asymptomatic and present only as PE.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Acute dyspnea, pleuritic chest pain, hypoxia — possible PE; medical emergency.", citationIDs: ["openrn_medsurg_finish"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Wells score for DVT clinical pretest probability stratification.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("D-dimer — useful to RULE OUT in low-pretest-probability patients; not useful in high-pretest-probability patients (proceed directly to imaging).", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Compression ultrasound — first-line imaging; high sensitivity and specificity for proximal DVT.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("CT venography or MRI for inconclusive ultrasound or non-extremity venous beds.", citationIDs: ["openrn_medsurg_finish"])
        ],
        priorityAssessments: [
            AttributedBullet("Affected limb — measure circumference, compare to contralateral side, mark, and trend.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Pain assessment — character, severity, response to elevation.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Distal pulses, capillary refill, sensation, motor function.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Respiratory assessment — rate, work of breathing, SpO2; sudden change suggests PE.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Bleeding precautions if anticoagulated — falls, IV sites, GU, GI.", citationIDs: ["openrn_medsurg_finish"])
        ],
        commonInterventions: [
            AttributedBullet("Anticoagulation — therapeutic-dose enoxaparin or DOAC (apixaban, rivaroxaban) per provider; warfarin for selected patients (mechanical valves, antiphospholipid syndrome).", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Duration typically 3 months for provoked DVT; longer or indefinite for unprovoked or recurrent.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("IVC filter for patients with absolute contraindication to anticoagulation (recent intracranial bleed, active major bleeding) or recurrent PE on adequate anticoagulation.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Limb elevation, gradual ambulation as tolerated.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Compression stockings for symptom relief and post-thrombotic syndrome prevention.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Catheter-directed thrombolysis or thrombectomy for selected severe iliofemoral DVT.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Investigate for underlying cause — malignancy workup if unprovoked, thrombophilia workup in selected patients.", citationIDs: ["openrn_medsurg_finish"])
        ],
        watchFor: [
            AttributedBullet("Pulmonary embolism — sudden dyspnea, chest pain, hypoxia, hemodynamic instability. EMERGENCY.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Phlegmasia cerulea dolens — massive iliofemoral thrombosis with limb ischemia; surgical emergency.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Bleeding from anticoagulation — assess for falls, GI bleed, IV sites; reverse with vitamin K (warfarin), andexanet alfa (apixaban/rivaroxaban), idarucizumab (dabigatran), protamine (heparin/enoxaparin).", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Heparin-induced thrombocytopenia (HIT) — falling platelets after 5–14 days of heparin; switch to argatroban or bivalirudin.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Post-thrombotic syndrome — chronic leg pain, swelling, skin changes after DVT.", citationIDs: ["openrn_medsurg_finish"])
        ],
        citations: [openrnMedSurgFinish],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Diagnosis: Pressure Injury

public enum PressureInjurySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pressure-injury",
        title: "Pressure Injury",
        subtitle: "Stages 1–4, unstageable, deep tissue (NPIAP)",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .basicCareAndComfort,
            priorityConcept: .mobility
        ),
        definition: AttributedProse(
            "A pressure injury is localized damage to the skin and underlying soft tissue, typically over a bony prominence or related to medical devices, caused by intense or prolonged pressure or pressure combined with shear. Pressure injuries are largely preventable and serve as a quality indicator for nursing care.",
            citationIDs: ["openrn_medsurg_finish", "npiap_pressure_injury"]
        ),
        pathophysiology: AttributedProse(
            "Sustained pressure exceeds capillary perfusion pressure, causing local ischemia. Without relief, ischemic injury progresses through inflammation, tissue necrosis, and ulceration. Shear forces (skin moving in opposite direction from underlying tissue) and friction worsen damage. Moisture, malnutrition, immobility, and impaired sensory perception are major risk multipliers.",
            citationIDs: ["openrn_medsurg_finish"]
        ),
        presentation: [
            AttributedBullet("Stage 1 — non-blanchable erythema of intact skin; warmth, firmness or softness compared to surrounding tissue.", citationIDs: ["npiap_pressure_injury"]),
            AttributedBullet("Stage 2 — partial-thickness skin loss with exposed dermis; pink/red moist wound bed; may present as intact or ruptured serum-filled blister.", citationIDs: ["npiap_pressure_injury"]),
            AttributedBullet("Stage 3 — full-thickness skin loss; subcutaneous fat may be visible; granulation tissue and epibole common; slough or eschar may be present but does not obscure the depth.", citationIDs: ["npiap_pressure_injury"]),
            AttributedBullet("Stage 4 — full-thickness loss with exposed bone, tendon, or muscle; tunneling and undermining common.", citationIDs: ["npiap_pressure_injury"]),
            AttributedBullet("Unstageable — full-thickness loss obscured by slough or eschar; cannot determine depth until base is exposed.", citationIDs: ["npiap_pressure_injury"]),
            AttributedBullet("Deep tissue pressure injury — persistent non-blanchable deep red, maroon, or purple discoloration; intact or non-intact skin; localized warmth, firmness, or softness.", citationIDs: ["npiap_pressure_injury"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Visual inspection and palpation per NPIAP staging system; document on admission and at intervals per facility policy.", citationIDs: ["npiap_pressure_injury"]),
            AttributedBullet("Braden scale (or other validated tool) on admission and per facility frequency to identify risk.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Photograph and measure (length × width × depth) any pressure injury identified.", citationIDs: ["openrn_medsurg_finish"])
        ],
        priorityAssessments: [
            AttributedBullet("Skin assessment head-to-toe on admission and per facility schedule (typically every shift on inpatients, more often on at-risk).", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Braden score subscales — sensory perception, moisture, activity, mobility, nutrition, friction/shear; targeted intervention per low-scoring subscale.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Bony prominences — sacrum, heels, ischium, trochanters, occiput, elbows, scapulae.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Medical devices — endotracheal tubes, NGT, oxygen tubing, BiPAP mask, Foley securement, restraints, splints.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Nutritional status — albumin, prealbumin, dietary intake.", citationIDs: ["openrn_medsurg_finish"])
        ],
        commonInterventions: [
            AttributedBullet("Reposition every 2 hours when in bed; every 1 hour when in chair (or per individualized schedule).", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Pressure-redistribution mattress and chair cushion for at-risk patients.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Heel elevation off the bed using pillows or heel-protector boots.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Maintain HOB ≤30° when possible to reduce shear; avoid sliding the patient — use a draw sheet to lift.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Manage moisture — incontinence care, barrier creams, frequent diaper changes.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Optimize nutrition — adequate protein and calories; nutrition consultation for compromised patients.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Wound care per stage — dressings, debridement (sharp, mechanical, autolytic, enzymatic), negative pressure wound therapy for selected wounds.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Address device-related pressure — reposition, pad, alternate sites for tubes and securement devices.", citationIDs: ["openrn_medsurg_finish"])
        ],
        watchFor: [
            AttributedBullet("Wound infection — increased erythema, warmth, drainage, foul odor, fever, leukocytosis. Culture if suspected.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Osteomyelitis in stage 3 or 4 wounds with bone exposure — MRI or bone biopsy for diagnosis; long-term IV antibiotics.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Sepsis from infected pressure injury — hemodynamic deterioration, fever, altered mental status.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Sacral injury can extend to fecal contamination — frequent assessment and protective dressing.", citationIDs: ["openrn_medsurg_finish"]),
            AttributedBullet("Hospital-acquired pressure injury (HAPI) — never event in many systems; document accurate stage on admission to distinguish present-on-admission from HAPI.", citationIDs: ["openrn_medsurg_finish"])
        ],
        citations: [openrnMedSurgFinish, npiap],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Diagnosis: Hypoglycemia

public enum HypoglycemiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hypoglycemia",
        title: "Hypoglycemia",
        subtitle: "Blood glucose < 70 mg/dL",
        nclexTags: glucoseTagsFinish,
        definition: AttributedProse(
            "Hypoglycemia is a blood glucose level below 70 mg/dL (3.9 mmol/L). It is a common, time-critical complication of diabetes treatment and a leading cause of medication-related emergency department visits. Severity is graded — Level 1 (≤70 mg/dL, alert), Level 2 (<54 mg/dL, neuroglycopenic symptoms), Level 3 (severe — requires assistance to recover regardless of value).",
            citationIDs: ["openrn_healthalt_finish"]
        ),
        pathophysiology: AttributedProse(
            "Glucose is the obligate fuel for the brain. When blood glucose falls, counter-regulatory hormones (glucagon, epinephrine, cortisol, growth hormone) attempt to restore it. Adrenergic activation causes the early autonomic symptoms. As glucose continues to fall, neuroglycopenia produces cognitive impairment, seizures, and eventually coma.",
            citationIDs: ["openrn_healthalt_finish"]
        ),
        presentation: [
            AttributedBullet("Adrenergic / autonomic — diaphoresis, tremor, palpitations, tachycardia, anxiety, hunger, pallor.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Neuroglycopenic — headache, confusion, dizziness, behavioral change, blurred vision, slurred speech, weakness.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Severe — seizure, loss of consciousness, focal neurologic deficits mimicking stroke, coma.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Beta-blockers and autonomic neuropathy can blunt the adrenergic warning symptoms — 'hypoglycemic unawareness.'", citationIDs: ["openrn_healthalt_finish"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Whipple triad — symptoms of hypoglycemia + low documented blood glucose + resolution of symptoms with glucose administration. Confirms true hypoglycemia.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Bedside fingerstick is sufficient for treatment — do not delay treatment for venous lab confirmation.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Workup for non-diabetic hypoglycemia — insulin level, C-peptide, sulfonylurea screen, cortisol, ACTH, IGF-2 in selected patients.", citationIDs: ["openrn_healthalt_finish"])
        ],
        priorityAssessments: [
            AttributedBullet("Bedside glucose immediately if hypoglycemia suspected; do not wait for venous draw.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Mental status, ability to swallow safely.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Vital signs — tachycardia is common adrenergic response.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Recent insulin doses, missed meals, increased exercise, recent alcohol intake.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Medication review — sulfonylureas, glinides, insulin; rare causes including drug interactions.", citationIDs: ["openrn_healthalt_finish"])
        ],
        commonInterventions: [
            AttributedBullet("Awake, alert, able to swallow — 15 g of fast-acting carbohydrate (4 oz juice, glucose tablets, regular soda); recheck in 15 minutes; repeat if still <70. Once corrected, give a snack with protein/fat to prevent recurrence.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Unable to swallow safely — IV dextrose: D50W 25 g IV (1 amp) for adults, or D10W 100–250 mL infusion. Recheck glucose in 15 minutes.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("No IV access — glucagon 1 mg IM/SC/IN; effective in 5–15 minutes. Less effective in alcoholic or fasting patients with depleted glycogen.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Sulfonylurea or long-acting insulin overdose — admit for prolonged D10W infusion and serial glucose checks; octreotide for sulfonylurea-induced hypoglycemia.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Identify and address the cause — meal timing, dose adjustment, education.", citationIDs: ["openrn_healthalt_finish"])
        ],
        watchFor: [
            AttributedBullet("Recurrence — long-acting insulin or sulfonylurea overdose causes prolonged hypoglycemia; admit for monitoring.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Aspiration — never give oral glucose to a patient who cannot swallow safely; IV or glucagon instead.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Neurologic deficits resembling stroke — hypoglycemia is reversible; check glucose on every patient with new neurologic symptoms.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Hypoglycemic unawareness — frequent low blood sugars desensitize the warning system; relax glycemic targets briefly to restore awareness.", citationIDs: ["openrn_healthalt_finish"]),
            AttributedBullet("Severe hypoglycemia in an inpatient is a serious quality-and-safety event — RCA, medication review.", citationIDs: ["openrn_healthalt_finish"])
        ],
        citations: [openrnHealthAltFinish],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Reference: PPE Sequence

public enum PPESequenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ppe-sequence",
        title: "PPE donning and doffing sequence",
        subtitle: "CDC standard PPE sequence for clinical care",
        eyebrow: "REFERENCE · INFECTION CONTROL",
        nclexTags: infectionTagsFinish,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "The CDC publishes a standardized sequence for donning and doffing PPE to minimize the risk of contamination during entry, patient care, and exit from an isolation room. The sequence is intentionally counter-intuitive in places — gloves come off first during doffing because they are the most contaminated. Following the sequence reliably is the difference between protecting yourself and bringing pathogens to the next patient.",
                citationIDs: ["cdc_ppe_sequence"]
            )),
            .numberedSteps(title: "DONNING — putting on (clean → patient-ready)", [
                "Hand hygiene before donning.",
                "Gown — fully cover torso from neck to knees, arms to wrists; tie at the back of the neck and waist.",
                "Mask or N95 respirator — secure ties or elastic bands around the head/ears; fit the metal nose band; for N95, perform user seal check (positive and negative pressure).",
                "Eye protection (goggles or face shield) — place over the face and adjust to fit.",
                "Gloves — extend to cover the cuff of the gown."
            ], citationIDs: ["cdc_ppe_sequence"]),
            .numberedSteps(title: "DOFFING — taking off (contaminated → clean)", [
                "Gloves OFF first — the outside is contaminated. Grasp the outside of one glove at the wrist with the other gloved hand and peel off (glove-to-glove). Hold the removed glove in the gloved hand. Slide ungloved fingers under the wrist of the second glove (skin-to-skin). Peel off, enclosing the first glove inside. Discard.",
                "Hand hygiene.",
                "Goggles or face shield OFF — outside is contaminated. Handle by the headband or earpieces only. Discard or place in receptacle for reprocessing.",
                "Gown OFF — outside is contaminated. Unfasten ties (avoiding contact with the front), pull away from the neck and shoulders, turning inside out as it comes off. Roll into a bundle and discard.",
                "Hand hygiene.",
                "Mask or respirator OFF LAST — front is contaminated. Handle ties or elastic only — do not touch the front. Discard.",
                "Hand hygiene."
            ], citationIDs: ["cdc_ppe_sequence"]),
            .bullets(title: "Common errors", [
                AttributedBullet("Touching the front of the mask, face shield, or gown during doffing — recontaminates the hands.", citationIDs: ["cdc_ppe_sequence"]),
                AttributedBullet("Skipping hand hygiene between PPE removal steps — contaminated hands transfer pathogens.", citationIDs: ["cdc_ppe_sequence"]),
                AttributedBullet("Removing the mask first — exposes the face to potentially contaminated hands.", citationIDs: ["cdc_ppe_sequence"]),
                AttributedBullet("Donning PPE inside the patient room — should be donned in the anteroom or just outside.", citationIDs: ["cdc_ppe_sequence"]),
                AttributedBullet("Doffing in the corridor — should be done at the doorway or in the anteroom; never carry contaminated PPE through clean areas.", citationIDs: ["cdc_ppe_sequence"]),
                AttributedBullet("Reusing single-use PPE — discard after one patient encounter unless using a designated extended-use protocol (e.g., extended N95 use during respirator shortage).", citationIDs: ["cdc_ppe_sequence"])
            ])
        ],
        citations: [cdcPPESequence, cdcHandHygieneFinish],
        lastSourceFidelityReview: "2026-05-04"
    )
}
