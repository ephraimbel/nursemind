import Foundation

// Curator-model procedure entries (round 40 — everyday-technique gaps).
// Audit of 144 existing procedures found high-frequency skills missing: IV
// push medication, enteral medication via feeding tube, intraosseous access,
// transcutaneous pacing, arterial blood gas sampling, and the surgical
// time-out. Non-directive throughout (technique, safety, and monitoring — no
// patient-specific dose math per Apple 1.4.2). Sources: OpenStax Clinical
// Nursing Skills (CC BY 4.0 with AI restriction), Open RN Nursing Skills
// (CC BY 4.0), CDC public domain, ISMP + AHA + Joint Commission concept
// citations.

private let openstaxR40 = CitationSource(
    id: "openstax_skills_r40",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/1-introduction",
    lastRetrieved: "2026-07-03"
)
private let openrnSkillsR40 = CitationSource(
    id: "openrn_skills_r40",
    shortName: "Open RN Nursing Skills",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-07-03"
)
private let ismpR40 = CitationSource(
    id: "ismp_r40",
    shortName: "ISMP safe-practice guidance (concept citation)",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/",
    lastRetrieved: "2026-07-03"
)
private let ahaR40 = CitationSource(
    id: "aha_acls_r40",
    shortName: "AHA ACLS/PALS algorithms (concept citation)",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://cpr.heart.org/",
    lastRetrieved: "2026-07-03"
)
private let tjcR40 = CitationSource(
    id: "tjc_up_r40",
    shortName: "The Joint Commission Universal Protocol (concept citation)",
    publisher: "The Joint Commission",
    license: .factCitationOnly,
    url: "https://www.jointcommission.org/",
    lastRetrieved: "2026-07-03"
)
private let cdcR40 = CitationSource(
    id: "cdc_r40",
    shortName: "CDC infection-prevention guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-07-03"
)

private let medSafetyTags40 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)
private let reductionTags40 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .safety)
private let perfusionTags40 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let gasExchangeTags40 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange)

// MARK: - IV push medication

public enum IVPushMedicationSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "iv-push-medication",
        title: "IV push (bolus) medication administration",
        subtitle: "Direct IV push · rate is a safety parameter, not a formality",
        nclexTags: medSafetyTags40,
        indications: AttributedProse(
            "Direct intravenous administration of a medication over a defined short interval when rapid onset is needed or the drug is formulated for bolus delivery. The defining safety fact: the push rate is prescribed for a reason — pushing too fast is a leading cause of preventable adverse drug events.",
            citationIDs: ["openstax_skills_r40", "ismp_r40"]
        ),
        contraindications: AttributedProse(
            "Drugs that must be diluted or infused (never bolused) — a look-up-before-you-push rule; some agents cause arrest if pushed. No compatible, patent IV access. Do not push into a line with incompatible infusing fluid without an adequate flush or a separate lumen.",
            citationIDs: ["ismp_r40", "openstax_skills_r40"]
        ),
        equipment: [
            AttributedBullet("The medication in its correct concentration, drawn up and labeled; the reference for the correct push rate.", citationIDs: ["ismp_r40"]),
            AttributedBullet("Two saline flush syringes (before and after), alcohol pads, gloves.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("A watch or timer — the rate is timed, not estimated.", citationIDs: ["ismp_r40"]),
            AttributedBullet("Cardiac monitor when the drug or the patient requires it.", citationIDs: ["openstax_skills_r40"])
        ],
        preProcedure: [
            AttributedBullet("Verify the rights of medication administration and confirm the drug is appropriate for IV push at all — many are not.", citationIDs: ["ismp_r40"]),
            AttributedBullet("Look up the correct push rate and dilution for this specific drug; two-person/independent verification for high-alert agents.", citationIDs: ["ismp_r40"]),
            AttributedBullet("Assess IV patency: no swelling, no pain, brisk blood return or easy flush.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("Check compatibility with any infusing fluid; plan the flush.", citationIDs: ["openstax_skills_r40"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Assess and flush", body: "Perform hand hygiene, don gloves, scrub the port for 15 seconds and let it dry. Assess patency by flushing with normal saline while watching for infiltration.", citationIDs: ["openstax_skills_r40", "cdc_r40"]),
            ProcedureStep(number: 2, title: "Pause an incompatible infusion", body: "If a continuous fluid is running and is incompatible, pause it and flush the line before the medication.", citationIDs: ["openstax_skills_r40"]),
            ProcedureStep(number: 3, title: "Push at the prescribed rate", body: "Administer the medication over the timed interval specified for that drug (e.g., over the full recommended minutes), watching the clock — never 'as fast as it goes.'", citationIDs: ["ismp_r40"]),
            ProcedureStep(number: 4, title: "Observe the patient during the push", body: "Watch the patient and monitor (if applicable) during administration for immediate reactions — the push is not a moment to look away.", citationIDs: ["openstax_skills_r40"]),
            ProcedureStep(number: 5, title: "Flush after at the same rate", body: "Flush with normal saline at the same rate as the medication to clear the remaining drug from the line at the intended speed, then resume any paused infusion.", citationIDs: ["ismp_r40", "openstax_skills_r40"])
        ],
        postProcedure: [
            AttributedBullet("Reassess the patient for therapeutic effect and adverse reaction on the drug's expected timeline.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("Reassess the site for infiltration/phlebitis after the push.", citationIDs: ["openstax_skills_r40"])
        ],
        documentation: [
            AttributedBullet("Drug, dose, concentration, route, actual administration time, and the rate/duration of the push.", citationIDs: ["ismp_r40"]),
            AttributedBullet("Site assessment, patient response, and any reaction.", citationIDs: ["openstax_skills_r40"])
        ],
        watchFor: [
            AttributedBullet("Speed shock — a systemic reaction (flushing, headache, chest tightness, irregular pulse, hypotension) from pushing too fast; stop, support, and notify.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("Extravasation of a vesicant — stop immediately, do not flush, follow the antidote/protocol for that drug.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("Immediate hypersensitivity/anaphylaxis — stop the push, keep the line, and treat per protocol.", citationIDs: ["openstax_skills_r40"])
        ],
        citations: [openstaxR40, openrnSkillsR40, ismpR40],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Enteral medication via feeding tube

public enum EnteralMedicationTubeSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "enteral-medication-tube",
        title: "Medication administration via enteral feeding tube",
        subtitle: "NG/PEG/J-tube meds · separate, flush between, and never crush the wrong tablet",
        nclexTags: medSafetyTags40,
        indications: AttributedProse(
            "Giving medications through an enteral tube (NG, gastrostomy/PEG, jejunostomy) in patients who cannot swallow safely. The technique carries two recurring errors: crushing a formulation that must stay intact, and clogging the tube by not flushing between medications.",
            citationIDs: ["openstax_skills_r40", "ismp_r40"]
        ),
        contraindications: AttributedProse(
            "Extended-release, enteric-coated, and certain other formulations must not be crushed — altering them can cause dose dumping, loss of effect, or mucosal injury; a liquid or alternative agent is needed instead. Confirm tube placement is verified before any administration.",
            citationIDs: ["ismp_r40", "openstax_skills_r40"]
        ),
        equipment: [
            AttributedBullet("Liquid formulations where available; a pill crusher and mortar only for medications confirmed crushable.", citationIDs: ["ismp_r40"]),
            AttributedBullet("Enteral (ENFit) syringes — never IV/parenteral syringes — plus water for flushes per policy.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("The do-not-crush reference for verification.", citationIDs: ["ismp_r40"])
        ],
        preProcedure: [
            AttributedBullet("Verify the rights of administration and check each drug against the do-not-crush list; obtain liquid or alternative forms for anything that can't be crushed.", citationIDs: ["ismp_r40"]),
            AttributedBullet("Verify tube placement per facility method before giving anything.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("Check whether the drug interacts with feeds (e.g., certain drugs bind to enteral nutrition) and whether feeds must be held around the dose.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Position the patient upright (head of bed ≥30–45°) to reduce aspiration risk.", citationIDs: ["openstax_skills_r40"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Prepare medications separately", body: "Crush each crushable tablet to a fine powder and dissolve in water individually, or use the liquid form. Do not mix multiple medications together — they can interact and clog the tube.", citationIDs: ["ismp_r40", "openstax_skills_r40"]),
            ProcedureStep(number: 2, title: "Verify placement and flush first", body: "Confirm tube placement, then flush with water (commonly ~15–30 mL adult, per policy) before the first medication.", citationIDs: ["openstax_skills_r40"]),
            ProcedureStep(number: 3, title: "Give one medication at a time, flushing between", body: "Administer each medication separately, flushing with water between each to prevent interactions and clogging.", citationIDs: ["ismp_r40", "openstax_skills_r40"]),
            ProcedureStep(number: 4, title: "Flush after the last medication", body: "Flush again after the final medication to clear the tube and deliver the full dose.", citationIDs: ["openstax_skills_r40"]),
            ProcedureStep(number: 5, title: "Manage feeds around the doses", body: "Resume enteral feeding after the appropriate interval for any drug that requires feeds held (e.g., specific binding interactions).", citationIDs: ["openrn_skills_r40"])
        ],
        postProcedure: [
            AttributedBullet("Keep the head of bed elevated for the interval per policy to reduce aspiration.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("Track flush volumes as intake, especially in fluid-restricted patients.", citationIDs: ["openrn_skills_r40"])
        ],
        documentation: [
            AttributedBullet("Medications given, tube type, placement verification, flush volumes, and patient position/tolerance.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("Any medication switched to liquid/alternative because it could not be crushed.", citationIDs: ["ismp_r40"])
        ],
        watchFor: [
            AttributedBullet("Tube clogging — flush between meds and after; treat early per policy (warm water), never force with a small syringe against high resistance.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("Aspiration — position upright, verify placement; new coughing/desaturation during administration warrants stopping.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("Loss of effect or toxicity from an inappropriately crushed extended-release/enteric product.", citationIDs: ["ismp_r40"])
        ],
        citations: [openstaxR40, openrnSkillsR40, ismpR40],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Intraosseous access

public enum IntraosseousAccessSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "intraosseous-access",
        title: "Intraosseous (IO) access",
        subtitle: "The bone as a vein · when IV access fails in an emergency",
        nclexTags: perfusionTags40,
        indications: AttributedProse(
            "Rapid vascular access in an emergency (cardiac arrest, shock, critical illness) when peripheral IV access cannot be quickly obtained. The intramedullary space is a non-collapsible network that drains into the central circulation — anything that can be given IV can be given IO.",
            citationIDs: ["aha_acls_r40", "openrn_skills_r40"]
        ),
        contraindications: AttributedProse(
            "Fracture in the target bone; previous IO attempt in the same bone within ~48 hours; infection or burn over the site; inability to identify landmarks; and bone diseases that compromise the marrow space (relative). Choose an alternate site rather than a compromised bone.",
            citationIDs: ["aha_acls_r40", "openrn_skills_r40"]
        ),
        equipment: [
            AttributedBullet("IO insertion device (powered driver or manual needle) with an appropriately sized needle for the site and patient.", citationIDs: ["aha_acls_r40"]),
            AttributedBullet("Skin antiseptic, gloves, stabilizing dressing, primed extension set.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Saline flush, and lidocaine per protocol for the conscious patient (infusion pain).", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Pressure bag or syringe — IO flow often needs pressure to run.", citationIDs: ["aha_acls_r40"])
        ],
        preProcedure: [
            AttributedBullet("This is typically an emergency; identify the site (commonly proximal tibia in adults, with proximal humerus and distal tibia as alternatives) and rule out contraindications quickly.", citationIDs: ["aha_acls_r40"]),
            AttributedBullet("Prep the site with antiseptic if time permits.", citationIDs: ["openrn_skills_r40"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Locate landmarks", body: "Identify the insertion landmark for the chosen bone and stabilize the limb.", citationIDs: ["aha_acls_r40"]),
            ProcedureStep(number: 2, title: "Insert perpendicular to bone", body: "Insert the needle at 90° to the bone surface, advancing (driver or manual) until a sudden loss of resistance signals entry into the marrow space.", citationIDs: ["aha_acls_r40", "openrn_skills_r40"]),
            ProcedureStep(number: 3, title: "Confirm placement", body: "The needle stands upright without support; aspiration of marrow may be possible; and a test flush runs without extravasation into surrounding tissue.", citationIDs: ["openrn_skills_r40"]),
            ProcedureStep(number: 4, title: "Manage infusion pain", body: "In the awake patient, slow lidocaine through the IO per protocol before flushing — IO infusion is intensely painful.", citationIDs: ["openrn_skills_r40"]),
            ProcedureStep(number: 5, title: "Secure and infuse under pressure", body: "Stabilize the needle with the manufacturer's dressing and run fluids/medications under pressure as needed; flush after each medication.", citationIDs: ["aha_acls_r40"])
        ],
        postProcedure: [
            AttributedBullet("IO access is a bridge — transition to definitive IV/central access as soon as the emergency allows; most protocols limit IO dwell time to ~24 hours.", citationIDs: ["aha_acls_r40"]),
            AttributedBullet("Reassess the limb frequently for swelling (extravasation) and compartment signs.", citationIDs: ["openrn_skills_r40"])
        ],
        documentation: [
            AttributedBullet("Site, needle size, placement confirmation, medications/fluids given, and time of insertion and removal.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Patient response and any complications.", citationIDs: ["openrn_skills_r40"])
        ],
        watchFor: [
            AttributedBullet("Extravasation/compartment syndrome — the most important IO complication; a swelling, tense limb means stop and remove.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Dislodgement — the needle is only in bone, not tied down; handle the limb carefully.", citationIDs: ["aha_acls_r40"]),
            AttributedBullet("Infection (osteomyelitis) with prolonged dwell — another reason IO is temporary.", citationIDs: ["openrn_skills_r40"])
        ],
        citations: [openstaxR40, openrnSkillsR40, ahaR40],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Transcutaneous pacing

public enum TranscutaneousPacingSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "transcutaneous-pacing",
        title: "Transcutaneous pacing (TCP)",
        subtitle: "Emergency external pacing for unstable bradycardia · capture is the whole point",
        nclexTags: perfusionTags40,
        indications: AttributedProse(
            "Temporary emergency pacing through the chest wall for symptomatic, unstable bradycardia (hypotension, altered mentation, ischemic chest pain, or heart failure signs) unresponsive to atropine, and as a bridge to transvenous pacing or a pacemaker. It buys time; it is not a destination.",
            citationIDs: ["aha_acls_r40", "openrn_skills_r40"]
        ),
        contraindications: AttributedProse(
            "No absolute contraindications in a peri-arrest unstable bradycardia; severe hypothermia-related bradycardia is a relative caution per protocol. TCP does not treat asystole well and is not a substitute for CPR when indicated.",
            citationIDs: ["aha_acls_r40"]
        ),
        equipment: [
            AttributedBullet("Defibrillator/monitor with a pacing mode and pacing/defibrillation pads.", citationIDs: ["aha_acls_r40"]),
            AttributedBullet("ECG electrodes for rhythm monitoring, and analgesia/sedation per protocol.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Emergency medications and airway equipment at hand.", citationIDs: ["aha_acls_r40"])
        ],
        preProcedure: [
            AttributedBullet("Confirm the bradycardia is symptomatic and unstable; this is a rapid decision in a deteriorating patient.", citationIDs: ["aha_acls_r40"]),
            AttributedBullet("Prepare the patient for discomfort — the muscle contractions are painful; anticipate analgesia/sedation.", citationIDs: ["openrn_skills_r40"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Apply pacing pads", body: "Place pacing pads in the recommended position (anterior-posterior or per device) and attach ECG monitoring leads.", citationIDs: ["aha_acls_r40"]),
            ProcedureStep(number: 2, title: "Set the rate", body: "Select pacing mode and set the pacing rate per protocol (commonly a rate that supports perfusion).", citationIDs: ["aha_acls_r40"]),
            ProcedureStep(number: 3, title: "Increase output to capture", body: "Increase the milliamps gradually until electrical capture appears — a pacer spike followed by a widened QRS on every beat.", citationIDs: ["aha_acls_r40", "openrn_skills_r40"]),
            ProcedureStep(number: 4, title: "Confirm mechanical capture", body: "Verify a pulse that matches the paced rate — feel a femoral pulse (not carotid, which muscle twitch mimics). Electrical capture without a pulse is not helping the patient.", citationIDs: ["aha_acls_r40", "openrn_skills_r40"]),
            ProcedureStep(number: 5, title: "Set a safety margin and sedate", body: "Set output slightly above the capture threshold, and provide analgesia/sedation for the ongoing discomfort.", citationIDs: ["openrn_skills_r40"])
        ],
        postProcedure: [
            AttributedBullet("Continuously monitor for loss of capture; reassess pulse, blood pressure, and mentation.", citationIDs: ["aha_acls_r40"]),
            AttributedBullet("Arrange definitive therapy (transvenous pacing/pacemaker) — TCP is a short-term bridge.", citationIDs: ["aha_acls_r40"])
        ],
        documentation: [
            AttributedBullet("Indication, pad position, set rate, capture threshold (mA), final output, and analgesia/sedation given.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Confirmation of both electrical and mechanical capture, and patient response.", citationIDs: ["aha_acls_r40"])
        ],
        watchFor: [
            AttributedBullet("Failure to capture — the deadliest pitfall: spikes without a matching widened QRS and pulse; increase output, check pads/contact.", citationIDs: ["aha_acls_r40"]),
            AttributedBullet("Mistaking muscle twitch for a pulse — always confirm with a femoral pulse, not the carotid.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Undertreated pain — the patient is awake and the shocks hurt; inadequate analgesia is a common failure.", citationIDs: ["openrn_skills_r40"])
        ],
        citations: [openstaxR40, openrnSkillsR40, ahaR40],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Arterial blood gas sampling

public enum ABGSamplingSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "abg-sampling",
        title: "Arterial blood gas (ABG) sampling",
        subtitle: "Radial artery puncture · the Allen test and the long hold afterward",
        nclexTags: gasExchangeTags40,
        indications: AttributedProse(
            "Sampling arterial blood to assess oxygenation, ventilation, and acid-base status — in respiratory failure, critical illness, and to guide ventilator changes. Whether an RN performs the puncture (vs. respiratory therapy or a provider) is facility- and scope-dependent, but every nurse manages the sample and the site afterward.",
            citationIDs: ["openstax_skills_r40", "openrn_skills_r40"]
        ),
        contraindications: AttributedProse(
            "Inadequate collateral circulation at the radial site (a concern the modified Allen test screens for), local infection, AV fistula in the limb, and severe coagulopathy or anticoagulation (relative — extend the hold and consider risk). Avoid a limb with impaired perfusion.",
            citationIDs: ["openstax_skills_r40", "openrn_skills_r40"]
        ),
        equipment: [
            AttributedBullet("Pre-heparinized ABG syringe, small-gauge needle, antiseptic, gauze, gloves.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("Ice for transport if required by the lab, and a label with collection time and the patient's oxygen/FiO₂.", citationIDs: ["openrn_skills_r40"])
        ],
        preProcedure: [
            AttributedBullet("Perform the modified Allen test (or facility equivalent) to confirm collateral ulnar circulation before a radial puncture.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("Note and document the patient's current oxygen delivery/FiO₂ and ventilator settings — the result is meaningless without them.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Expel excess heparin and any air bubbles from the syringe before drawing.", citationIDs: ["openstax_skills_r40"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Position and palpate", body: "Hyperextend the wrist slightly and palpate the radial artery with two fingers to locate the strongest pulsation.", citationIDs: ["openstax_skills_r40"]),
            ProcedureStep(number: 2, title: "Cleanse and insert", body: "Cleanse the site; insert the needle at roughly 30–45° into the pulsation, bevel up, toward the palpated pulse.", citationIDs: ["openstax_skills_r40"]),
            ProcedureStep(number: 3, title: "Let arterial pressure fill the syringe", body: "Arterial blood typically pulsates into a self-filling ABG syringe under its own pressure — you generally do not pull back the plunger.", citationIDs: ["openstax_skills_r40"]),
            ProcedureStep(number: 4, title: "Withdraw and expel air", body: "Withdraw the needle, expel any air bubbles immediately (they alter results), cap the syringe airtight, and mix gently.", citationIDs: ["openstax_skills_r40"]),
            ProcedureStep(number: 5, title: "Hold firm pressure", body: "Apply firm continuous pressure to the site for at least 5 minutes (longer if anticoagulated) — arterial sites bleed, and the hold is the safety step patients most often shortchange.", citationIDs: ["openstax_skills_r40", "openrn_skills_r40"])
        ],
        postProcedure: [
            AttributedBullet("Transport to the lab promptly per protocol (on ice if required); results degrade with delay.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Reassess the site and distal perfusion (color, warmth, pulse, sensation) after the hold.", citationIDs: ["openstax_skills_r40"])
        ],
        documentation: [
            AttributedBullet("Site, Allen test result, oxygen delivery/FiO₂ and ventilator settings at draw, and duration of pressure held.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Patient tolerance and post-puncture perfusion check.", citationIDs: ["openstax_skills_r40"])
        ],
        watchFor: [
            AttributedBullet("Bleeding/hematoma — the arterial site's signature risk; extend the hold and reassess, especially if anticoagulated.", citationIDs: ["openstax_skills_r40"]),
            AttributedBullet("Distal ischemia — pallor, coolness, numbness, or lost pulse after puncture; escalate.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Pre-analytic error — air bubbles, delay, or unrecorded FiO₂ make the result misleading; the sample handling is part of the accuracy.", citationIDs: ["openrn_skills_r40"])
        ],
        citations: [openstaxR40, openrnSkillsR40, cdcR40],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Surgical time-out (Universal Protocol)

public enum SurgicalTimeOutSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "surgical-time-out",
        title: "Surgical time-out (Universal Protocol)",
        subtitle: "The stop that prevents wrong-patient, wrong-site, wrong-procedure",
        nclexTags: reductionTags40,
        indications: AttributedProse(
            "A mandated pause before any invasive procedure — in the OR and at the bedside — to actively verify the correct patient, correct site, and correct procedure. It is the last barrier against wrong-site/wrong-patient/wrong-procedure events, which are catastrophic and almost entirely preventable.",
            citationIDs: ["tjc_up_r40", "openrn_skills_r40"]
        ),
        contraindications: AttributedProse(
            "None — the time-out is never skipped, including in urgent cases, where an abbreviated verification per protocol still occurs. There is no procedure too small or too fast for verification.",
            citationIDs: ["tjc_up_r40"]
        ),
        equipment: [
            AttributedBullet("The consent form, the marked site, relevant imaging, and the procedure schedule/record for cross-check.", citationIDs: ["tjc_up_r40"]),
            AttributedBullet("All team members physically present and attentive — the human resources are the equipment.", citationIDs: ["openrn_skills_r40"])
        ],
        preProcedure: [
            AttributedBullet("Pre-procedure verification: confirm identity, procedure, and consent, and that all needed documents/images/equipment/implants are present, as the patient moves toward the procedure.", citationIDs: ["tjc_up_r40"]),
            AttributedBullet("Site marking: the site is marked by the person performing the procedure, unambiguously, and visible after prep and draping.", citationIDs: ["tjc_up_r40"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Stop and gain full attention", body: "Immediately before starting, the entire team stops and pauses — no competing tasks. Everyone participates actively.", citationIDs: ["tjc_up_r40"]),
            ProcedureStep(number: 2, title: "Verify correct patient", body: "Confirm patient identity using two identifiers against the consent and record.", citationIDs: ["tjc_up_r40"]),
            ProcedureStep(number: 3, title: "Verify correct site and side", body: "Confirm the correct site and side against the marked site, consent, and imaging — spoken aloud, not assumed.", citationIDs: ["tjc_up_r40"]),
            ProcedureStep(number: 4, title: "Verify correct procedure", body: "Confirm the specific procedure to be performed, and review any concerns (allergies, antibiotic timing, equipment/implant availability, anticipated problems) per checklist.", citationIDs: ["tjc_up_r40"]),
            ProcedureStep(number: 5, title: "Resolve any discrepancy before proceeding", body: "If any team member raises a concern or discrepancy, it is resolved before the procedure begins — anyone can stop the line.", citationIDs: ["tjc_up_r40", "openrn_skills_r40"])
        ],
        postProcedure: [
            AttributedBullet("Document the time-out and participants per policy.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Perform any required counts (sharps, instruments, sponges) at the appropriate points per policy.", citationIDs: ["openrn_skills_r40"])
        ],
        documentation: [
            AttributedBullet("Confirmation that the time-out occurred, who participated, and that patient/site/procedure were verified.", citationIDs: ["tjc_up_r40"]),
            AttributedBullet("Any discrepancy raised and how it was resolved.", citationIDs: ["openrn_skills_r40"])
        ],
        watchFor: [
            AttributedBullet("Perfunctory time-outs — reciting while doing other tasks defeats the purpose; genuine attention is the safety mechanism.", citationIDs: ["tjc_up_r40"]),
            AttributedBullet("Hierarchy silencing concerns — the protocol depends on any member being able to stop the procedure without fear.", citationIDs: ["openrn_skills_r40"]),
            AttributedBullet("Skipping it for 'quick' bedside procedures — bedside line placements and similar are exactly where wrong-patient errors slip in.", citationIDs: ["tjc_up_r40"])
        ],
        citations: [openrnSkillsR40, openstaxR40, tjcR40],
        lastSourceFidelityReview: "2026-07-03"
    )
}
