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
