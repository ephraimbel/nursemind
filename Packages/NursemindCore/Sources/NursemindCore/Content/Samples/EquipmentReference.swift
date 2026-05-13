import Foundation

// Equipment / device reference entries — Open RN Skills (CC BY 4.0), CDC HAI
// prevention bundles (public domain). Tier-A RN review pending pre-launch for
// chest tube and EVD entries (high-stakes invasive devices).

private let openrnSkills = CitationSource(
    id: "openrn_skills",
    shortName: "Open RN — Nursing Skills: Lines, Drains & Devices chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=central+line+arterial+chest+tube",
    lastRetrieved: "2026-05-04"
)

private let cdcCLABSI = CitationSource(
    id: "cdc_clabsi",
    shortName: "CDC — Central Line-Associated Bloodstream Infection (CLABSI) Prevention Bundle",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/intravascular-catheter-related-infection/index.html",
    lastRetrieved: "2026-05-04"
)

// MARK: - Central Venous Catheters

public enum CentralVenousCatheterSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "central-venous-catheter",
        title: "Central venous catheters (CVC)",
        subtitle: "CVC vs PICC vs port — care, dressing, removal",
        eyebrow: "REFERENCE · DEVICES",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        sections: [
            .prose(title: "Why CVC management matters", AttributedProse("Central lines deliver vasoactive drips, parenteral nutrition, and irritant medications that peripheral access can't handle. They also carry CLABSI risk that scales with how the line is accessed and dressed every shift. The CDC central-line bundle reduces CLABSI rates dramatically — most infections are preventable with disciplined care.", citationIDs: ["cdc_clabsi", "openrn_skills"])),
            .keyValueTable(title: "Types and typical uses", [
                KeyValueRow(key: "Non-tunneled CVC (e.g., subclavian, IJ, femoral)", value: "Short-term inpatient: vasopressors, TPN, multiple incompatible drips. Insertion days–weeks. Femoral has highest infection risk."),
                KeyValueRow(key: "PICC (peripherally inserted central catheter)", value: "Days to months. Inserted via basilic/cephalic vein → SVC. Lower CLABSI than central but still central. Outpatient-friendly."),
                KeyValueRow(key: "Implanted port (Port-a-cath)", value: "Long-term intermittent access (chemo, frequent transfusion). Subcutaneous reservoir; access with non-coring (Huber) needle."),
                KeyValueRow(key: "Tunneled (Hickman, Broviac)", value: "Long-term — months to years. Subcutaneous tunnel reduces infection risk. Used in hematology/oncology, dialysis."),
                KeyValueRow(key: "Multi-lumen vs single-lumen", value: "More lumens = more access but more infection risk; choose minimum lumens needed.")
            ]),
            .keyValueTable(title: "Confirmation before first use", [
                KeyValueRow(key: "Tip placement", value: "Confirmed by chest X-ray — tip in distal SVC at SVC/RA junction (cavoatrial junction). Do NOT use until confirmed."),
                KeyValueRow(key: "Femoral lines", value: "Tip in IVC; less commonly require imaging if sterile insertion. Highest infection risk."),
                KeyValueRow(key: "Blood return", value: "Aspirate blood before each first use; flush with NS afterward.")
            ]),
            .bullets(title: "Daily nursing care — CDC central-line bundle", [
                AttributedBullet("Hand hygiene before any line interaction — alcohol-based or soap and water.", citationIDs: ["cdc_clabsi"]),
                AttributedBullet("Scrub the hub: scrub each port with chlorhexidine or alcohol swab for 15 seconds, allow to dry. Every. Single. Time.", citationIDs: ["cdc_clabsi"]),
                AttributedBullet("Maintain a sterile dressing — chlorhexidine gluconate (CHG) sponge dressing if institutional standard. Change every 7 days OR when soiled, loose, or wet.", citationIDs: ["cdc_clabsi"]),
                AttributedBullet("Daily review: \"Is this line still needed?\" — early removal is the single biggest CLABSI prevention intervention.", citationIDs: ["cdc_clabsi"]),
                AttributedBullet("Document daily insertion-site assessment: redness, drainage, tenderness, intactness of dressing.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Do NOT submerge under water (no swimming, no full bath); shower only with waterproof cover.", citationIDs: ["openrn_skills"])
            ]),
            .bullets(title: "Flushing and lock practices", [
                AttributedBullet("Saline flush before AND after each use — pulsatile (push-pause) technique to clear residual.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Volume: typically 10 mL NS for non-tunneled, 5–10 mL for PICC, 10 mL for port (per facility).", citationIDs: ["openrn_skills"]),
                AttributedBullet("Some lumens (e.g., dedicated medication lumen) are heparin-locked when not in use; per protocol.", citationIDs: ["openrn_skills"]),
                AttributedBullet("ALWAYS use 10-mL barrel syringe minimum — smaller syringes generate higher pressures and can rupture catheters.", citationIDs: ["openrn_skills"])
            ]),
            .bullets(title: "Complications — recognize early", [
                AttributedBullet("CLABSI: fever, chills, hypotension associated temporally with line use; hub or insertion-site purulence; positive blood cultures from line and peripheral.", citationIDs: ["cdc_clabsi"]),
                AttributedBullet("Pneumothorax (post-insertion subclavian/IJ): SOB, chest pain, decreased breath sounds, hypoxia.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Catheter occlusion: unable to flush or aspirate. Assess for kinks, position-dependent (have patient turn head, raise arm). Do not force.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Air embolism: sudden chest pain, dyspnea, hypotension after disconnection. Position patient LEFT lateral, head down (Trendelenburg) to trap air; oxygen; call rapid response.", citationIDs: ["openrn_skills"]),
                AttributedBullet("DVT/thrombus: ipsilateral arm/neck swelling for upper-extremity lines.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Line migration: external length increased; tip position may have moved — re-image before use.", citationIDs: ["openrn_skills"])
            ]),
            .numberedSteps(title: "Removal procedure (non-tunneled CVC)", [
                "Verify provider order. Confirm no contraindications (anticoagulation reversed if needed, no active emergency use).",
                "Position patient flat or slight Trendelenburg, ask patient to take a deep breath and hold (Valsalva — prevents air entry into vein).",
                "Remove sutures. Hold at least 5 minutes of firm pressure as catheter is withdrawn.",
                "Apply occlusive dressing (gauze + petroleum-based ointment + tegaderm) — air-tight to prevent late air embolism.",
                "Inspect catheter tip for completeness. Send tip for culture if infection suspected.",
                "Patient lies flat for 30 minutes after removal. Reassess insertion site for hematoma.",
                "Document removal time, tip integrity, patient tolerance, dressing applied."
            ], citationIDs: ["openrn_skills"])
        ],
        citations: [openrnSkills, cdcCLABSI],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Arterial Line

public enum ArterialLineSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "arterial-line-management",
        title: "Arterial line management",
        subtitle: "Zeroing, square-wave test, troubleshooting, removal",
        eyebrow: "REFERENCE · DEVICES",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        sections: [
            .prose(title: "Why an art line", AttributedProse("Arterial lines provide continuous beat-to-beat blood pressure (more accurate than cuff in shock, on vasopressors, or in arrhythmia) and easy ABG sampling without repeat sticks. They are not without risk — limb ischemia, infection, and inaccurate readings from technical errors are real. Most art-line problems are setup or maintenance issues.", citationIDs: ["openrn_skills"])),
            .keyValueTable(title: "Common insertion sites", [
                KeyValueRow(key: "Radial (most common)", value: "Verify Allen test (collateral ulnar circulation) before insertion; lowest infection risk"),
                KeyValueRow(key: "Femoral", value: "Reliable in cardiac arrest / shock; higher infection risk; immobilizes patient"),
                KeyValueRow(key: "Brachial", value: "Used when radial unsuccessful; small risk of nerve injury"),
                KeyValueRow(key: "Dorsalis pedis / posterior tibial", value: "Pediatric or when other sites unavailable")
            ]),
            .numberedSteps(title: "Zeroing the transducer (every shift, after any disconnection)", [
                "Position transducer at the level of the phlebostatic axis (4th intercostal space, mid-axillary line) — represents level of right atrium.",
                "Open transducer to atmosphere by turning stopcock off to patient and removing cap.",
                "Press \"zero\" on the bedside monitor — wait for confirmation message.",
                "Re-cap stopcock and turn back on to patient.",
                "Document zero time and waveform appearance.",
                "Zero anytime: shift change, after position change, after equipment change, when reading seems off."
            ], citationIDs: ["openrn_skills"]),
            .numberedSteps(title: "Square-wave test (assess damping)", [
                "Activate the fast-flush valve (pull tab on flush device) for 1 second.",
                "Observe waveform: should square off at the top, flush briefly, then drop sharply with 1–2 oscillations before returning to baseline arterial waveform.",
                "1–2 oscillations after flush = optimally damped (correct).",
                "More than 2 oscillations = under-damped (reads falsely high systolic, falsely low diastolic). Causes: long tubing, air bubbles, hyperdynamic circulation. Action: shorten tubing, check for bubbles.",
                "Slow return without oscillation = over-damped (reads falsely low systolic, falsely high diastolic, narrow pulse pressure). Causes: kinks, clots, low pressure bag, loose connections. Action: aspirate at three-way stopcock, flush, check connections, replace pressure bag (300 mmHg)."
            ], citationIDs: ["openrn_skills"]),
            .keyValueTable(title: "Troubleshooting reference", [
                KeyValueRow(key: "Flat line / no waveform", value: "Confirm cable connections, transducer position, monitor settings, line patency; rule out catheter dislodgement"),
                KeyValueRow(key: "Damped (low/sluggish) waveform", value: "Air bubbles, kinks, clot at tip, low pressure bag, loose stopcock"),
                KeyValueRow(key: "Over-shooting / under-damped", value: "Excessive tubing, small air bubbles, transducer off-level"),
                KeyValueRow(key: "BP doesn't match cuff", value: "Re-zero. Compare manual cuff in same arm. Off by >10 mmHg consistently → recheck transducer level and zero"),
                KeyValueRow(key: "Cannot draw blood", value: "Check stopcock position, tubing for kinks, line clots; do NOT force flush"),
                KeyValueRow(key: "Cool / pale / pulseless distal limb", value: "EMERGENT — line is causing distal ischemia; remove and notify provider")
            ]),
            .bullets(title: "Daily nursing care", [
                AttributedBullet("Assess insertion site every shift: warmth, color, pulses distal to site, capillary refill.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Confirm pressure bag inflated to 300 mmHg — keeps system patent and continuously flushed.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Confirm flush solution per protocol (typically NS; some institutions use heparinized saline 1–2 units/mL).", citationIDs: ["openrn_skills"]),
                AttributedBullet("Set monitor alarms (high/low BP, disconnect, mean) appropriate for patient — never silenced for convenience.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Limit unnecessary disconnections; use closed-system blood-draw setup if drawing for labs from line.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Discard volume per protocol when drawing labs (typically 5–10 mL waste before specimen) to avoid dilution.", citationIDs: ["openrn_skills"])
            ]),
            .bullets(title: "Removal", [
                AttributedBullet("Per provider order. Stop infusions through the line.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Direct pressure for at least 5 minutes (10+ minutes for femoral, longer if anticoagulated).", citationIDs: ["openrn_skills"]),
                AttributedBullet("Apply firm pressure dressing; assess every 15 minutes for first hour for hematoma or bleeding.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Verify intact catheter tip. Document time of removal, pressure duration, tolerance.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Femoral: bedrest 4–6 hours flat; reassess pulses distal to site.", citationIDs: ["openrn_skills"])
            ])
        ],
        citations: [openrnSkills],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Chest Tube Drainage

public enum ChestTubeSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "chest-tube-drainage",
        title: "Chest tube drainage system",
        subtitle: "3-chamber system, monitoring, troubleshooting, accidental events",
        eyebrow: "REFERENCE · DEVICES",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        sections: [
            .prose(title: "Why chest tubes are nurse-managed", AttributedProse("Chest tube drainage systems remove air, fluid, or blood from the pleural space, restore negative intrapleural pressure, and re-expand the lung. The 3-chamber system is well-engineered but unforgiving — kinks, clamps, or disconnections can cause tension pneumothorax in minutes. Knowing what each chamber does and what 'normal' looks like is the safety net.", citationIDs: ["openrn_skills"])),
            .keyValueTable(title: "Three-chamber system", [
                KeyValueRow(key: "Chamber 1 — Collection", value: "Closest to patient. Drains fluid/blood from pleural space. Calibrated. Document amount, color, consistency every shift (or hourly if active bleed)."),
                KeyValueRow(key: "Chamber 2 — Water seal", value: "Acts as one-way valve; air leaves pleural space but cannot return. Should bubble briefly with cough or expiration in early phase, then settle. Continuous bubbling = AIR LEAK."),
                KeyValueRow(key: "Chamber 3 — Suction control", value: "Wet system: water column to set pressure (typically -20 cmH₂O); dry system: regulator dial. Gentle bubbling in wet system shows working suction; dial in dry system."),
                KeyValueRow(key: "Tidaling in water seal", value: "Up-down movement of water with respirations is NORMAL — shows lung is connected to system. Stops when lung re-expanded or tubing kinked.")
            ]),
            .bullets(title: "Routine monitoring every shift (or hourly if unstable)", [
                AttributedBullet("Assess respiratory status: rate, depth, breath sounds bilaterally, SpO₂, work of breathing.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Inspect insertion site: dressing intact (occlusive — usually petrolatum gauze + tape), no subcutaneous emphysema (palpate for crepitus), no drainage around tube.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Document drainage: amount (mL), color (sero-sang → serous typical post-op course; bright red = active bleed concern), consistency.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Mark drainage level on collection chamber with time at each shift change.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Verify suction: gentle bubble in wet system or dial setting in dry; pressure setting matches order.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Tubing: no dependent loops (drainage pools and stops flow), no kinks, all connections taped or banded.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Check for tidaling — confirms lung connection.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Check for air leak: ask patient to cough — bubbling in water seal during cough only is small/resolving leak; continuous bubbling is concerning.", citationIDs: ["openrn_skills"])
            ]),
            .keyValueTable(title: "When to worry — drainage volume and character", [
                KeyValueRow(key: "Sudden gush >100 mL/hr fresh blood", value: "Active bleeding — call provider. Possible pulmonary or vascular injury."),
                KeyValueRow(key: ">200 mL/hr × 2–3 hr OR >1 L total acutely", value: "Operative re-exploration may be needed."),
                KeyValueRow(key: "Sudden cessation of drainage in active disease", value: "Tubing clog or kink, NOT necessarily resolution. Investigate."),
                KeyValueRow(key: "Foul odor / purulent drainage", value: "Empyema or infection."),
                KeyValueRow(key: "Bubbling that suddenly stops in setting of injury", value: "Lung re-expanded, OR tubing occluded — assess work of breathing carefully.")
            ]),
            .keyValueTable(title: "Clamping — when (and when NOT)", [
                KeyValueRow(key: "Generally DO NOT clamp", value: "Risk of tension pneumothorax — air can't escape during expiration"),
                KeyValueRow(key: "Brief clamp OK for", value: "Air-leak assessment (per provider order); changing drainage system; checking for resolution before removal (per protocol)"),
                KeyValueRow(key: "ALWAYS UNCLAMP IMMEDIATELY", value: "Increased SOB, decreased SpO₂, increasing tachycardia, tracheal deviation away from affected side, hypotension")
            ]),
            .numberedSteps(title: "Accidental dislodgement — patient end (chest)", [
                "STAY with patient. Do NOT leave to find supplies.",
                "Cover the wound IMMEDIATELY with petrolatum gauze (or any sterile occlusive dressing) — taped on three sides only (creates flutter valve so air can escape but not enter).",
                "Call for help. Have someone bring chest tube replacement supplies and a new drainage system.",
                "Assess patient's respiratory status continuously — watch for tension pneumothorax signs.",
                "Notify provider for re-insertion.",
                "Document time of dislodgement, immediate intervention, patient response."
            ], citationIDs: ["openrn_skills"]),
            .numberedSteps(title: "Accidental disconnection — drain end (system)", [
                "Submerge the patient end of the disconnected tubing in 1 inch of sterile saline or water — recreates a temporary water seal.",
                "Do NOT clamp the chest tube.",
                "Call for help and a new sterile drainage system.",
                "Assess patient's respiratory status continuously.",
                "Replace drainage system using sterile technique."
            ], citationIDs: ["openrn_skills"]),
            .bullets(title: "Removal — typically by provider, nurse-assisted", [
                AttributedBullet("Patient takes a deep breath and holds (Valsalva) at the moment tube is removed — prevents air entry.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Apply occlusive petroleum gauze dressing immediately.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Post-removal CXR per protocol to confirm no recurrent pneumothorax.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Reassess respiratory status frequently for 24 hours after removal.", citationIDs: ["openrn_skills"])
            ])
        ],
        citations: [openrnSkills],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - External Ventricular Drain

public enum ExternalVentricularDrainSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "external-ventricular-drain",
        title: "External ventricular drain (EVD)",
        subtitle: "Leveling, drainage, ICP monitoring, emergencies",
        eyebrow: "REFERENCE · DEVICES",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .neurologicalRegulation),
        sections: [
            .prose(title: "Why an EVD is high-stakes", AttributedProse("EVDs do two things at once: drain CSF to control intracranial pressure, and transduce ICP for continuous monitoring. The system is exquisitely position-dependent — a wrong level for 5 minutes can cause over-drainage with catastrophic herniation. EVDs require constant nurse vigilance and crystal-clear protocols.", citationIDs: ["openrn_skills"])),
            .keyValueTable(title: "Common EVD indications", [
                KeyValueRow(key: "Hydrocephalus (acute or chronic)", value: "Communicating or obstructive — drains CSF to relieve pressure"),
                KeyValueRow(key: "Subarachnoid hemorrhage (SAH)", value: "Drains bloody CSF; monitors ICP; reduces vasospasm risk"),
                KeyValueRow(key: "Intraventricular hemorrhage (IVH)", value: "Drains blood/CSF; can administer intraventricular tPA per protocol"),
                KeyValueRow(key: "Traumatic brain injury (TBI)", value: "ICP monitoring; CSF drainage as one of the second-tier ICP interventions"),
                KeyValueRow(key: "Tumor / mass effect with hydrocephalus", value: "Temporizing measure pre-resection")
            ]),
            .keyValueTable(title: "Leveling — the most important nursing task", [
                KeyValueRow(key: "Reference point", value: "Tragus of the ear (external auditory meatus) — represents Foramen of Monro"),
                KeyValueRow(key: "Standard order", value: "Level transducer at tragus; drain at provider-ordered height (e.g., +10, +15, +20 cmH₂O above tragus)"),
                KeyValueRow(key: "Position changes", value: "RE-LEVEL after every patient position change. ANY change. Even raising HOB."),
                KeyValueRow(key: "Higher drain level = less drainage", value: "Drain is higher than tragus → CSF must reach that height to drain → less CSF removed"),
                KeyValueRow(key: "Lower drain level = more drainage (DANGER)", value: "Drain below tragus → CSF drains by gravity → over-drainage risk → catastrophic")
            ]),
            .bullets(title: "Hourly nursing assessment", [
                AttributedBullet("Neuro check: GCS, pupils (size, reactivity), motor strength bilateral, follow commands.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Vital signs — Cushing's triad (hypertension, bradycardia, irregular respirations) is herniation imminent.", citationIDs: ["openrn_skills"]),
                AttributedBullet("ICP reading from transducer: confirm waveform character; document mean ICP and CPP if monitored.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Drainage: amount per hour, color (clear or yellow normal; bloody or cloudy abnormal), consistency.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Insertion site: dressing intact, no CSF leak around catheter, no signs of infection.", citationIDs: ["openrn_skills"]),
                AttributedBullet("System integrity: no kinks, all connections secure, transducer level confirmed at tragus, drain at ordered height.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Stopcock positions: open to drain when ordered, open to transducer when measuring ICP. Rotate as ordered for accurate readings.", citationIDs: ["openrn_skills"])
            ]),
            .bullets(title: "Watch-fors", [
                AttributedBullet("Sudden ICP elevation (>20 mmHg sustained) — herniation risk; assess for cause (suctioning, position, agitation, hypoxia, hypercarbia).", citationIDs: ["openrn_skills"]),
                AttributedBullet("Cushing's triad — late, ominous; act NOW.", citationIDs: ["openrn_skills"]),
                AttributedBullet("New focal neuro deficit (motor, pupil, LOC change) — bleed, stroke, herniation.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Loss of CSF drainage when expected — clog, kinking, or system error. Investigate without lowering drain.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Cloudy or bloody CSF where it was clear — infection or new bleed.", citationIDs: ["openrn_skills"]),
                AttributedBullet("CSF leak around catheter at scalp — potential infection portal.", citationIDs: ["openrn_skills"])
            ]),
            .bullets(title: "Emergencies — clamp the drain immediately for", [
                AttributedBullet("Patient transport (e.g., to CT scan, to OR) — clamp before any movement; provider order required.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Suspected over-drainage (sudden severe headache, collapse of ventricles on imaging, falling ICP below ordered threshold).", citationIDs: ["openrn_skills"]),
                AttributedBullet("Drain accidentally lowered below tragus level briefly — clamp, re-level, notify provider.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Suspicious CSF change (cloudy, bloody) pending culture/imaging.", citationIDs: ["openrn_skills"])
            ]),
            .bullets(title: "Sterile-technique reminders", [
                AttributedBullet("Closed system — minimize accessing for sampling; sterile technique when CSF sampling is required.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Daily review: \"Does this patient still need the EVD?\" — every day with the team. Long-term EVDs have rising infection risk.", citationIDs: ["openrn_skills"]),
                AttributedBullet("CSF cultures per protocol (e.g., daily or every 48 hr) — early infection detection.", citationIDs: ["openrn_skills"]),
                AttributedBullet("Document everything. Every level, every change, every reading. EVD documentation is legally and clinically critical.", citationIDs: ["openrn_skills"])
            ])
        ],
        citations: [openrnSkills],
        lastSourceFidelityReview: "2026-05-04"
    )
}
