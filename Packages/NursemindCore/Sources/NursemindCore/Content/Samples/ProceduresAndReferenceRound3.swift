import Foundation

// Curator-model procedure + reference entries (round 3 expansion).
// Sources: OpenStax Clinical Nursing Skills (CC BY 4.0 with display restriction),
// Open RN Skills (CC BY 4.0), CDC (public domain), AABB / AHA / IDSA / Joint Commission
// concept citations.

private let openstaxSkR3 = CitationSource(
    id: "openstax_skills_round3",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let openrnSkR3 = CitationSource(
    id: "openrn_skills_round3",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=procedure+technique+skill",
    lastRetrieved: "2026-05-04"
)
private let cdcR3 = CitationSource(
    id: "cdc_round3",
    shortName: "CDC clinical and infection-control guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let aabbConcept = CitationSource(
    id: "aabb_round3",
    shortName: "AABB Standards (concept citation)",
    publisher: "Association for the Advancement of Blood & Biotherapies",
    license: .factCitationOnly,
    url: "https://www.aabb.org/standards-accreditation/standards",
    lastRetrieved: "2026-05-04"
)
private let ahaR3 = CitationSource(
    id: "aha_round3",
    shortName: "AHA ACLS / advanced airway algorithms (concept citation)",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://cpr.heart.org/",
    lastRetrieved: "2026-05-04"
)

private let safetyR3 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let pharmR3 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)
private let mgmtR3 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety)

// MARK: - Endotracheal Intubation Assist

public enum IntubationAssistSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "intubation-assist",
        title: "Endotracheal intubation assist (RN role)",
        subtitle: "RSI prep · drugs ready · tube placement confirmation",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        indications: AttributedProse(
            "Failure to oxygenate, ventilate, or protect the airway. Includes respiratory failure, decreased LOC (typically GCS ≤8), severe shock, anticipated clinical course (e.g., severe sepsis, ARDS, status epilepticus, severe TBI), upper airway obstruction.",
            citationIDs: ["openstax_skills_round3", "aha_round3"]
        ),
        contraindications: AttributedProse(
            "Patient refusal in non-emergent situation. Severe upper-airway obstruction may require surgical airway. Awake fiberoptic technique for difficult airway / unstable cervical spine.",
            citationIDs: ["openrn_skills_round3"]
        ),
        equipment: [
            AttributedBullet("Bag-valve mask attached to oxygen 15 L/min, oral and nasal airways, suction (Yankauer + soft suction).", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Laryngoscope (with multiple blade sizes — Macintosh and Miller); video laryngoscope when available.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Endotracheal tubes — typical 7.0–7.5 women, 7.5–8.0 men; smaller and larger sizes available; stylet, 10 mL syringe, water-soluble lubricant.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("End-tidal CO2 (capnography) — colorimetric or waveform; waveform preferred.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Securement device or tape; oral bite block.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("RSI medications drawn and labeled (per provider): induction (etomidate, ketamine, propofol), paralytic (succinylcholine, rocuronium), sedation (midazolam, propofol, fentanyl) for post-intubation.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Difficult airway equipment available — bougie, supraglottic airway (LMA, iGel), surgical cricothyrotomy kit.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Ventilator at bedside, ICU bed prepared.", citationIDs: ["openstax_skills_round3"])
        ],
        preProcedure: [
            AttributedBullet("ENSURE provider order and emergent indication confirmed.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("VITAL signs, IV access × 2 (large-bore), continuous cardiac monitor, pulse ox, BP cuff, arterial line if available.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("PRE-OXYGENATE — 100% NRB or BVM with PEEP for at least 3 minutes (denitrogenation); apneic oxygenation via NC at 15 L/min during attempt.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("POSITION — sniffing position (head/neck flexed, head extended); ramped position in obese.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Verify NPO status; place NG tube if recently fed (or accept aspiration risk in true emergency).", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Verify allergies, weight, recent labs.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Briefing — '7 P's of RSI': Preparation, Pre-oxygenation, Pretreatment (uncommon now), Paralysis with induction, Positioning, Placement with proof, Post-intubation management.", citationIDs: ["openstax_skills_round3"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Standby drugs and equipment", body: "Confirm with provider all RSI drugs labeled and at bedside. Confirm BVM functions, suction works, ETT cuff intact (test with 10 mL air, then deflate). Have backup ETT one size smaller. Stylet inserted into ETT and bent into hockey-stick shape.", citationIDs: ["openstax_skills_round3"]),
            ProcedureStep(number: 2, title: "Administer induction and paralytic per provider", body: "On provider command, push induction agent (e.g., etomidate 0.3 mg/kg over 30 sec) followed by paralytic (succinylcholine 1.5 mg/kg or rocuronium 1.2 mg/kg) per provider. Document time of paralytic — onset 30–60 sec.", citationIDs: ["openstax_skills_round3"]),
            ProcedureStep(number: 3, title: "Apply BURP / cricoid pressure if requested", body: "BURP (Backward, Upward, Rightward Pressure on thyroid cartilage) improves view if needed. Cricoid pressure debated; release at provider's request.", citationIDs: ["openstax_skills_round3"]),
            ProcedureStep(number: 4, title: "Pass tube and inflate cuff", body: "Provider passes tube under direct vision. Once placed, inflate cuff with 5–10 mL air; remove stylet. Hold tube firmly in place until secured.", citationIDs: ["openstax_skills_round3"]),
            ProcedureStep(number: 5, title: "Confirm placement (multiple methods)", body: "PRIMARY: waveform CAPNOGRAPHY (positive ETCO2 over multiple breaths is gold standard). SECONDARY: bilateral chest rise, equal breath sounds in both axillae, NO sounds over epigastrium, mist in tube, pulse ox stability/improvement. CXR within 30 min — verify tube tip 2–4 cm above carina.", citationIDs: ["openstax_skills_round3", "aha_round3"]),
            ProcedureStep(number: 6, title: "Secure tube + initiate ventilation", body: "Secure tube at depth (~21 cm at lip in women, 23 cm in men). Connect to ventilator at provider settings. Initiate post-intubation sedation (propofol or fentanyl + midazolam drip) — paralytic alone without sedation is awareness without movement; CRITICAL.", citationIDs: ["openstax_skills_round3"]),
            ProcedureStep(number: 7, title: "Post-intubation orders", body: "Place OG tube (NOT NG if facial trauma), foley if not already, head of bed 30°, ICU transfer, post-intubation CXR, ventilator settings labeled, sedation goals (RASS), pain assessment (CPOT/BPS), DVT prophylaxis, GI prophylaxis, oral care q4h.", citationIDs: ["openstax_skills_round3"])
        ],
        postProcedure: [
            AttributedBullet("Continuous capnography, SpO2, cardiac monitor.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Sedation and analgesia drips with RASS goal (typically -2 to 0).", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("HOB ≥30° (VAP prevention bundle).", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Re-confirm tube depth at handoff and after any movement.", citationIDs: ["openstax_skills_round3"])
        ],
        documentation: [
            AttributedBullet("Time, indication, RSI medications + doses, intubator, attempts, tube size, tube depth at lip, cuff pressure, confirmation methods, vital signs throughout, complications.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Post-CXR results and any tube adjustment.", citationIDs: ["openstax_skills_round3"])
        ],
        watchFor: [
            AttributedBullet("ESOPHAGEAL INTUBATION — ABSENT capnography; must recognize and remove tube immediately; ventilate with BVM and reattempt.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("RIGHT MAINSTEM intubation — unilateral right breath sounds; pull back tube 1–2 cm and reassess.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Hypotension post-induction — etomidate is hemodynamically neutral; propofol drops BP; fluid + pressors as needed.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Hypoxia during attempt — abort, BVM ventilate; second attempt only after re-pre-oxygenation.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Cannot intubate / cannot oxygenate — declare difficult airway emergency; supraglottic airway or surgical airway.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("PARALYZED + UNDERSEDATED PATIENT — awareness; ALWAYS continuous sedation/analgesia after long-acting paralytic.", citationIDs: ["openstax_skills_round3"])
        ],
        citations: [openstaxSkR3, openrnSkR3, ahaR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Lumbar Puncture Assist

public enum LumbarPunctureAssistSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "lumbar-puncture-assist",
        title: "Lumbar puncture assist (RN role)",
        subtitle: "Setup · positioning · post-LP monitoring",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        indications: AttributedProse(
            "Suspected meningitis or encephalitis. Suspected subarachnoid hemorrhage with negative/equivocal CT. Diagnostic for MS, GBS, idiopathic intracranial hypertension (also therapeutic — measure opening pressure). Therapeutic — repeated LPs in pseudotumor cerebri. Intrathecal medication or chemotherapy.",
            citationIDs: ["openrn_skills_round3"]
        ),
        contraindications: AttributedProse(
            "Increased intracranial pressure with mass effect — risk of herniation; obtain head CT first if focal deficits, papilledema, immunocompromised, recent CNS disease, AMS. Coagulopathy / thrombocytopenia (<50K, INR >1.4 — relative). Skin infection at lumbar site. Spinal cord compression / mass.",
            citationIDs: ["openrn_skills_round3"]
        ),
        equipment: [
            AttributedBullet("LP tray (sterile gloves, drapes, antiseptic, syringes, lidocaine, manometer, spinal needles in multiple gauges (typically 20–22 G), 4 collection tubes, gauze).", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Local anesthetic (1% lidocaine 5–10 mL) — if not in tray.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Specimen tubes labeled 1–4.", citationIDs: ["openstax_skills_round3"]),
            AttributedBullet("Sharps container; supplies for dressing.", citationIDs: ["openstax_skills_round3"])
        ],
        preProcedure: [
            AttributedBullet("Verify INDICATION and rule-out (CT) per provider; verify coags, platelets, allergy.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Informed consent obtained by provider.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("HAVE patient void.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Position — LATERAL DECUBITUS with knees pulled up to chest (fetal), back at edge of bed, head flexed. Alternatively SITTING UP leaning over bedside table for opening pressure (cannot measure pressure in lateral).", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Identify L3-L4 or L4-L5 interspace (level of iliac crests).", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Cardiac monitor, SpO2, baseline neuro exam.", citationIDs: ["openrn_skills_round3"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Position and reassure", body: "Help patient assume position, support head/knees, encourage relaxation, talk through procedure. Anxious patients tense up; relaxed musculature widens interspaces.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 2, title: "Sterile prep + drape", body: "Provider opens tray, wears sterile gloves; nurse can pour antiseptic onto field if requested.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 3, title: "Local anesthesia + needle insertion", body: "Provider injects lidocaine, then advances spinal needle. Patient may feel pressure; reassure.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 4, title: "Opening pressure measurement", body: "Provider attaches manometer when CSF flows; record opening pressure (normal 6–25 cmH2O in adults). Patient must be lateral with legs uncurled to give an accurate reading at this point.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 5, title: "Collect CSF", body: "4 tubes (~1–2 mL each). Standard sends: Tube 1 cell count, Tube 2 protein/glucose, Tube 3 Gram stain + culture (some labs use Tube 4 for this), Tube 4 cell count again (RBC clearance differentiates traumatic tap vs SAH). Label and send promptly.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 6, title: "Closing pressure (if therapeutic LP)", body: "If CSF removed for therapeutic indication (pseudotumor), measure closing pressure.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 7, title: "Apply pressure + dressing", body: "Apply gauze with pressure for 1–2 min, then small adhesive dressing.", citationIDs: ["openrn_skills_round3"])
        ],
        postProcedure: [
            AttributedBullet("Bed rest 1–2 hours flat (debated — some evidence does not show benefit for headache prevention).", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Encourage hydration (oral or IV).", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Vital signs and neuro check at 30 min and 1 hr.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Assess for post-LP headache — positional, frontal, worse with sitting/standing; treat with hydration, caffeine, blood patch if persistent.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Send all CSF specimens promptly; communicate critical results to provider.", citationIDs: ["openrn_skills_round3"])
        ],
        documentation: [
            AttributedBullet("Time, position, opening pressure, volume of CSF removed, closing pressure (if therapeutic), tube labels, patient tolerance, vital signs.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Post-procedure neuro check, headache, leg numbness, leakage at site.", citationIDs: ["openrn_skills_round3"])
        ],
        watchFor: [
            AttributedBullet("HERNIATION — sudden severe headache, decreased LOC, posturing, fixed pupil; emergency. Higher risk with mass effect; CT first.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Post-LP headache — ~10–30%; positional; treat as above. Consider blood patch if >24–48 hr severe.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Bleeding — hematoma, especially in coagulopathic patients.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Infection — meningitis from contaminated procedure (rare).", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Traumatic tap — RBCs in tube 1 should clear by tube 4 (suggests traumatic, not SAH).", citationIDs: ["openrn_skills_round3"])
        ],
        citations: [openstaxSkR3, openrnSkR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Continuous Bladder Irrigation (CBI)

public enum CBISample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "continuous-bladder-irrigation",
        title: "Continuous bladder irrigation (CBI)",
        subtitle: "3-way Foley · sterile saline · clot prevention post-TURP",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .elimination),
        indications: AttributedProse(
            "Prevent or treat clot formation in bladder — most commonly post-transurethral resection of prostate (TURP), bladder tumor resection, gross hematuria. May also be used to instill medications.",
            citationIDs: ["openrn_skills_round3"]
        ),
        contraindications: AttributedProse(
            "Bladder rupture or recent perforation. Untreated UTI (relative — antibiotics first when possible). Hypersensitivity to instilled solution.",
            citationIDs: ["openrn_skills_round3"]
        ),
        equipment: [
            AttributedBullet("3-way (triple lumen) Foley catheter (typically already placed by surgeon).", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Sterile irrigation solution (typically 0.9% NS in 3-L bags) on IV pole.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Sterile irrigation tubing.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Drainage bag (large-volume — 4 L), backup bag.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Sterile gloves; clean gloves.", citationIDs: ["openrn_skills_round3"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order — solution, rate (continuous gravity vs titrated to clear), duration.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Hand hygiene; explain procedure to patient.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Inspect catheter and confirm placement — third lumen for irrigation.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Position patient supine for spike of bag.", citationIDs: ["openrn_skills_round3"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Spike bag and prime tubing", body: "Hang sterile irrigation bag on pole. Spike with sterile irrigation tubing; prime to remove air. Close clamp.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 2, title: "Connect to irrigation port", body: "Connect tubing to irrigation port (third lumen) of Foley using sterile technique.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 3, title: "Confirm drainage bag is large-volume + open", body: "Drainage bag must be larger volume than typical (4 L); ensure clamp open; consider double bag system to allow replacement without interrupting flow.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 4, title: "Open irrigation clamp + titrate", body: "Open clamp; titrate rate to keep urine LIGHT PINK — too clear means waste; too dark/clotted means inadequate.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 5, title: "Track strict I&O", body: "ACCURATE NET output = total drainage MINUS total irrigation infused. Subtract on flowsheet hourly. Clots that block drainage cause bladder distention — assess.", citationIDs: ["openrn_skills_round3"])
        ],
        postProcedure: [
            AttributedBullet("Hourly assessment — urine color, output > input by ≥30 mL/hr (otherwise clot or kink).", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Bladder palpation if output drops — distention suggests obstruction.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Pain assessment — bladder spasms common; treat with belladonna and opium suppository, oxybutynin.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Hand-irrigation with 60-mL syringe and sterile NS (per facility protocol) to clear clots if drainage stops; never force.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Discontinue per provider when urine clear and clot-free for set period.", citationIDs: ["openrn_skills_round3"])
        ],
        documentation: [
            AttributedBullet("Time, solution, rate, urine character (color, clots), input vs output, net urine output, bladder spasms, interventions.", citationIDs: ["openrn_skills_round3"])
        ],
        watchFor: [
            AttributedBullet("BLADDER DISTENTION from outflow obstruction — pain, decreased output, palpable bladder; requires urgent intervention to prevent rupture and bleeding.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Hyponatremia from absorption of hypotonic irrigation (rare with NS) — TURP syndrome; monitor Na if symptomatic.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Bleeding — bright red, brisk; clot formation; notify surgeon. Increased drainage of bright red blood (>500 mL/hr) is concerning.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Infection — UTI / sepsis risk increased with prolonged catheterization; assess for fever, change in urine character.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Air in tubing / kinks — interrupt flow; correct immediately.", citationIDs: ["openrn_skills_round3"])
        ],
        citations: [openstaxSkR3, openrnSkR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Postmortem Care

public enum PostmortemCareSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "postmortem-care",
        title: "Postmortem care",
        subtitle: "Compassionate care after death · family · documentation",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood),
        indications: AttributedProse(
            "Care of the body and family after a patient's death. Process: pronouncement, family time, body preparation, documentation, transfer arrangements. Care must remain dignified — the patient is no longer ours but their family's, and the experience leaves a lasting impression on the family.",
            citationIDs: ["openrn_skills_round3"]
        ),
        contraindications: AttributedProse(
            "Coroner / medical examiner cases (homicide, suicide, suspicious, work-related, unattended death, certain in-hospital deaths within 24 hours of admission) — DO NOT remove tubes, IVs, or anything that could be evidence; consult facility policy and notify the medical examiner.",
            citationIDs: ["openrn_skills_round3"]
        ),
        equipment: [
            AttributedBullet("Postmortem care kit (typically: ID tags, body bag, gauze, washcloth, supplies for cleansing).", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Personal possessions inventory list.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Death certificate paperwork (per facility).", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Patient gown or family-requested clothing.", citationIDs: ["openrn_skills_round3"])
        ],
        preProcedure: [
            AttributedBullet("Pronouncement of death by provider (or per state / facility, by experienced RN where authorized) — document time of death, lack of pulse, lack of respirations, lack of response to stimuli.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("OFFER FAMILY TIME with the patient before any body preparation — they may want privacy, prayers, last touches; do not rush.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Notify chaplaincy / spiritual care per family wishes.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Confirm no autopsy / coroner's case before removing tubes (if coroner case, leave everything in place).", citationIDs: ["openrn_skills_round3"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene + standard precautions", body: "Don gloves, gown if soiling expected. Body fluids may continue to leak.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 2, title: "Allow family time as desired", body: "Stay nearby but allow privacy. Offer water, tissues, chairs. Be present without filling silence; bear witness.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 3, title: "Remove tubes and devices (NOT in coroner's cases)", body: "If not coroner's case: remove IVs, central lines, foley, NG, ET tube (if not already), drains. Document removal. Leave in place if coroner's case.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 4, title: "Bathe and prepare the body", body: "Cleanse blood, secretions, body fluids. Remove jewelry per family wishes (or document and bag with belongings). Place clean gown or family-provided clothing.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 5, title: "Position the body", body: "Supine with arms at sides, head slightly elevated. Close eyes and mouth (gently — gauze under chin if needed). Place dentures if patient wore them and family wants. Place absorbent pad under buttocks.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 6, title: "Apply ID tags + transport", body: "Two ID tags — one on body (toe or wrist), one on body bag. Some facilities use three. Confirm against MRN. Body bag if for morgue / funeral home transfer.", citationIDs: ["openrn_skills_round3"]),
            ProcedureStep(number: 7, title: "Inventory and release possessions", body: "Inventory all personal possessions; have family take possessions (with witness) or list and lock per facility.", citationIDs: ["openrn_skills_round3"])
        ],
        postProcedure: [
            AttributedBullet("Notify funeral home per family wishes.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Organ / tissue donation referral — federal law requires notification of organ procurement organization (OPO) for ALL deaths; OPO determines suitability; do not raise donation without OPO involvement (per facility).", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Documentation — time of death, pronouncing provider, family present, religious / spiritual rites observed, possessions disposition, transport.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Self-care — these are emotionally heavy; debrief with team; access EAP.", citationIDs: ["openrn_skills_round3"])
        ],
        documentation: [
            AttributedBullet("Pronouncement details, family at bedside, religious/spiritual observances, lines/devices removed (or left for coroner), possessions inventory, transport disposition, donation referral, deceased person's identification.", citationIDs: ["openrn_skills_round3"])
        ],
        watchFor: [
            AttributedBullet("CORONER'S CASE — leave tubes/lines/clothing as-is; do not bathe; preserve all evidence per facility policy. Includes: deaths within 24 hr of admission, suspicious circumstances, suicide, homicide, work-related, MVAs, unattended.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("ORGAN DONATION — federal law requires OPO notification; OPO speaks with family in select cases. Nurse should not initiate the donation conversation independently in most settings.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Cultural/religious practices — some traditions require specific positioning, washing rituals, family-only handling, no clothing changes; ASK and respect.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Family grief — anticipatory grief may have been ongoing; complicated grief; refer to bereavement services.", citationIDs: ["openrn_skills_round3"]),
            AttributedBullet("Compassion fatigue in nursing staff — debrief; this is not 'just a body' in any culture.", citationIDs: ["openrn_skills_round3"])
        ],
        citations: [openstaxSkR3, openrnSkR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Crash Cart Contents

public enum CrashCartSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "crash-cart-contents",
        title: "Crash cart contents",
        subtitle: "What's where · standardized layout · daily check",
        eyebrow: "REFERENCE · CODE BLUE",
        nclexTags: safetyR3,
        sections: [
            .prose(title: "Purpose", AttributedProse(
                "A standardized mobile cart with all medications, equipment, and supplies needed for adult resuscitation. Contents vary by facility but follow ACLS-driven principles. Daily checks (signed log) ensure expired medications are replaced and equipment functions.",
                citationIDs: ["aha_round3"]
            )),
            .keyValueTable(title: "TOP — defibrillator and monitor", [
                KeyValueRow(key: "Defibrillator/monitor", value: "Biphasic 360 J max (manual + AED capability), pads (adult + pediatric), gel as backup, paddles where present"),
                KeyValueRow(key: "Capnography", value: "Waveform end-tidal CO₂ for tube confirmation and CPR quality"),
                KeyValueRow(key: "Backup batteries / power cord", value: "Verify charged; plug in when stationary"),
                KeyValueRow(key: "Pacing pads", value: "Transcutaneous pacing capability")
            ]),
            .keyValueTable(title: "DRAWER 1 — Code drugs (ACLS)", [
                KeyValueRow(key: "Epinephrine 1:10,000 (1 mg/10 mL)", value: "Push for cardiac arrest q3–5 min"),
                KeyValueRow(key: "Amiodarone 150 mg / 3 mL", value: "300 mg loading for VF/pVT (uses 2 vials)"),
                KeyValueRow(key: "Lidocaine 100 mg", value: "Alternative to amiodarone"),
                KeyValueRow(key: "Atropine 1 mg / 10 mL", value: "Symptomatic bradycardia; max 3 mg"),
                KeyValueRow(key: "Adenosine 6 mg / 2 mL", value: "SVT; 6 mg then 12 mg"),
                KeyValueRow(key: "Magnesium sulfate 1 g / 2 mL", value: "Torsades, severe asthma; 1–2 g IV"),
                KeyValueRow(key: "Calcium chloride 10% (1 g / 10 mL)", value: "Hyperkalemia, calcium-channel-blocker overdose"),
                KeyValueRow(key: "Sodium bicarbonate 50 mEq / 50 mL", value: "Severe acidosis, hyperK, TCA overdose")
            ]),
            .keyValueTable(title: "DRAWER 2 — Reversal / second-line", [
                KeyValueRow(key: "Naloxone 0.4 mg/mL", value: "Opioid overdose"),
                KeyValueRow(key: "Flumazenil 0.1 mg/mL", value: "Benzodiazepine reversal"),
                KeyValueRow(key: "Dextrose 50% 25 g / 50 mL", value: "Hypoglycemia rescue"),
                KeyValueRow(key: "Glucagon 1 mg", value: "Hypoglycemia, β-blocker overdose"),
                KeyValueRow(key: "Vasopressin 20 units / mL", value: "Vasopressor (older ACLS algorithm; some carts retain)"),
                KeyValueRow(key: "Diltiazem 25 mg / 5 mL", value: "Rate control AFib"),
                KeyValueRow(key: "Metoprolol 5 mg / 5 mL", value: "Rate control"),
                KeyValueRow(key: "Furosemide 40 mg / 4 mL", value: "Acute pulmonary edema"),
                KeyValueRow(key: "Nitroglycerin SL tabs or spray", value: "Angina, hypertensive emergency"),
                KeyValueRow(key: "Epinephrine 1:1,000 (1 mg/mL)", value: "Anaphylaxis IM 0.3–0.5 mg")
            ]),
            .keyValueTable(title: "DRAWER 3 — Airway", [
                KeyValueRow(key: "BVM with PEEP valve, oxygen tubing", value: "Bag-valve-mask"),
                KeyValueRow(key: "Oral and nasal airways", value: "Multiple sizes"),
                KeyValueRow(key: "Endotracheal tubes", value: "Sizes 6.0–8.5 typical"),
                KeyValueRow(key: "Stylets, 10 mL syringe, lubricant", value: "ETT placement"),
                KeyValueRow(key: "Laryngoscope handles + blades", value: "Mac and Miller in multiple sizes; check bulbs/batteries"),
                KeyValueRow(key: "Supraglottic airways (LMA, iGel)", value: "Difficult-airway backup"),
                KeyValueRow(key: "Bougie", value: "Difficult airway"),
                KeyValueRow(key: "End-tidal CO₂ detector", value: "Colorimetric or attach to capnography"),
                KeyValueRow(key: "Suction (Yankauer, soft catheters)", value: "Connected and tested")
            ]),
            .keyValueTable(title: "DRAWER 4 — IV access + infusion", [
                KeyValueRow(key: "IV catheters", value: "Multiple gauges (14, 16, 18, 20, 22)"),
                KeyValueRow(key: "Tourniquet, antiseptic, gauze", value: "Standard IV start supplies"),
                KeyValueRow(key: "IO needle (EZ-IO drill + needles)", value: "When IV access fails"),
                KeyValueRow(key: "Saline flushes", value: "10 mL syringes prefilled"),
                KeyValueRow(key: "IV tubing (macro, micro, extension sets)", value: "Various"),
                KeyValueRow(key: "IV fluids", value: "0.9% NS 1 L bags, LR 1 L; D5W"),
                KeyValueRow(key: "Infusion pump", value: "Often outside the cart but accessible")
            ]),
            .keyValueTable(title: "DRAWER 5 — Procedure / specialty", [
                KeyValueRow(key: "Central-line kit", value: "Triple-lumen + Cordis introducer"),
                KeyValueRow(key: "Arterial line kit", value: "20-G needle, transducer"),
                KeyValueRow(key: "Cricothyrotomy kit", value: "Surgical airway emergency"),
                KeyValueRow(key: "Pericardiocentesis tray", value: "Tamponade emergency"),
                KeyValueRow(key: "Chest tube tray", value: "Pneumothorax / hemothorax")
            ]),
            .bullets(title: "Daily-check responsibilities", [
                AttributedBullet("Lock/seal intact (un-broken seal = full cart available).", citationIDs: ["aha_round3"]),
                AttributedBullet("Defibrillator self-test passed; battery green; pads not expired; capnography functional.", citationIDs: ["aha_round3"]),
                AttributedBullet("Suction connected and functioning.", citationIDs: ["aha_round3"]),
                AttributedBullet("Oxygen tank ≥1500 psi if portable.", citationIDs: ["aha_round3"]),
                AttributedBullet("Sign and date log; document any restocks.", citationIDs: ["aha_round3"])
            ]),
            .prose(title: "After every code", AttributedProse(
                "Restock immediately. Replace defibrillator pads if used. Reseal cart only when complete and double-checked by a second nurse. Submit code-summary documentation. Hold a brief debrief — what worked, what didn't, what to change.",
                citationIDs: ["aha_round3"]
            ))
        ],
        citations: [openrnSkR3, ahaR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Massive Transfusion Protocol

public enum MTPSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "massive-transfusion-protocol",
        title: "Massive Transfusion Protocol (MTP)",
        subtitle: "1:1:1 ratio · trauma + OB hemorrhage + GI bleed",
        eyebrow: "REFERENCE · HEMORRHAGE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .perfusion),
        sections: [
            .prose(title: "When to activate", AttributedProse(
                "Anticipated transfusion of ≥10 units PRBCs in 24 hours OR ≥4 units in 1 hour OR life-threatening hemorrhage. Common settings: severe trauma, postpartum hemorrhage, GI bleed, ruptured aneurysm, intraoperative.",
                citationIDs: ["aabb_round3"]
            )),
            .keyValueTable(title: "1:1:1 ratio (modern standard)", [
                KeyValueRow(key: "PRBCs : FFP : Platelets", value: "1:1:1 (one unit each per cooler/round)"),
                KeyValueRow(key: "Rationale", value: "Mimics whole blood; reduces dilutional coagulopathy; PROPPR trial supports vs 1:1:2"),
                KeyValueRow(key: "Cryoprecipitate", value: "Add for fibrinogen <150 (target >150–200)"),
                KeyValueRow(key: "Calcium", value: "Replace — citrate in stored blood chelates calcium → hypocalcemia / coagulopathy")
            ]),
            .keyValueTable(title: "Activation triggers (any)", [
                KeyValueRow(key: "ABC score ≥2", value: "Penetrating mechanism, SBP ≤90, HR ≥120, free fluid on FAST"),
                KeyValueRow(key: "Shock Index >1.0", value: "HR ÷ SBP — early shock predictor"),
                KeyValueRow(key: "Lactate >4", value: "Severe shock"),
                KeyValueRow(key: "Active bleeding + 1:4 ratio falling", value: "Hemodynamic instability despite resuscitation"),
                KeyValueRow(key: "Provider judgment", value: "Trumps any score")
            ]),
            .numberedSteps(title: "Activation steps", [
                "Provider activates MTP via blood bank hotline.",
                "Send labeled type & cross-match specimens; uncrossmatched O-neg available immediately.",
                "Establish two large-bore IVs (16 G or larger) or central access; arterial line; foley.",
                "Blood bank prepares serial 'coolers' typically containing: 6 PRBC + 6 FFP + 1 apheresis platelet (or per facility) every 15–30 min.",
                "Administer through warmer/rapid infuser; monitor vitals continuously.",
                "Send labs every 30–60 min: CBC, fibrinogen, INR/PTT, ionized calcium, BMP, ABG/lactate.",
                "Transfuse cryoprecipitate when fibrinogen <150 (typically 10 units per round if available).",
                "Treat hypocalcemia — calcium gluconate or calcium chloride per ionized Ca.",
                "Keep patient WARM — passive warmer, blankets, room temperature.",
                "Surgical / interventional source control IS the definitive intervention — MTP is a bridge, not a treatment.",
                "Tranexamic acid (TXA) 1 g IV within 3 hours of injury (trauma) or PPH onset."
            ], citationIDs: ["aabb_round3"]),
            .keyValueTable(title: "Lethal triad of trauma", [
                KeyValueRow(key: "Hypothermia", value: "<36°C — impairs coagulation; warm aggressively"),
                KeyValueRow(key: "Acidosis", value: "Lactate / pH — impairs coagulation, vasopressors"),
                KeyValueRow(key: "Coagulopathy", value: "Dilutional + consumptive; managed with FFP, platelets, cryo, TXA")
            ]),
            .bullets(title: "Common complications", [
                AttributedBullet("Hypocalcemia (citrate-mediated) — replace IV calcium.", citationIDs: ["aabb_round3"]),
                AttributedBullet("Hyperkalemia — old PRBCs hemolyze and release K; check BMP.", citationIDs: ["aabb_round3"]),
                AttributedBullet("TRALI / TACO — pulmonary edema; differentiate; supportive care.", citationIDs: ["aabb_round3"]),
                AttributedBullet("Coagulopathy — FFP, cryo, platelets per labs.", citationIDs: ["aabb_round3"]),
                AttributedBullet("Hypothermia — feeds the cycle; warm.", citationIDs: ["aabb_round3"]),
                AttributedBullet("Transfusion reactions — see transfusion-reaction entry.", citationIDs: ["aabb_round3"])
            ]),
            .prose(title: "Deactivation", AttributedProse(
                "Hemodynamically stable, source controlled, lab parameters improving. Notify blood bank. Document all units, complications, response. Debrief team. Submit incident report per facility hemovigilance.",
                citationIDs: ["aabb_round3"]
            ))
        ],
        citations: [openrnSkR3, aabbConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Common Antidotes Reference

public enum CommonAntidotesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "common-antidotes",
        title: "Common antidotes reference",
        subtitle: "Drug → reversal · who to call · where it lives",
        eyebrow: "REFERENCE · TOXICOLOGY",
        nclexTags: pharmR3,
        sections: [
            .keyValueTable(title: "Anticoagulants", [
                KeyValueRow(key: "Warfarin", value: "Vitamin K (PO/IV slow); 4-factor PCC (Kcentra) for major bleeding; FFP if PCC unavailable"),
                KeyValueRow(key: "Heparin (UFH)", value: "Protamine sulfate 1 mg per 100 units heparin (max 50 mg single dose); slow IV over 10 min"),
                KeyValueRow(key: "LMWH (enoxaparin)", value: "Protamine partially reverses (~60%); 1 mg per 1 mg enoxaparin if within 8 hr"),
                KeyValueRow(key: "Apixaban / Rivaroxaban / Edoxaban", value: "Andexanet alfa (Andexxa) for life-threatening; 4-factor PCC alternative"),
                KeyValueRow(key: "Dabigatran", value: "Idarucizumab (Praxbind) 5 g IV for life-threatening")
            ]),
            .keyValueTable(title: "Sedatives / opioids", [
                KeyValueRow(key: "Opioids (heroin, fentanyl, oxycodone)", value: "Naloxone 0.4–4 mg IV/IM/IN; repeat q2–3 min; expect higher/repeat doses for fentanyl"),
                KeyValueRow(key: "Benzodiazepines (lorazepam, midazolam, diazepam)", value: "Flumazenil 0.2 mg IV (rare use; not in chronic users — seizure risk)"),
                KeyValueRow(key: "Cisatracurium / vecuronium / rocuronium (neuromuscular blockade)", value: "Sugammadex 16 mg/kg IV (rocuronium/vecuronium ONLY; not cisatracurium); neostigmine + glycopyrrolate alternative")
            ]),
            .keyValueTable(title: "Toxicologic emergencies", [
                KeyValueRow(key: "Acetaminophen overdose", value: "N-acetylcysteine (NAC) — 21-hour IV protocol or 72-hour oral"),
                KeyValueRow(key: "Salicylate (aspirin) overdose", value: "Sodium bicarbonate (urinary alkalinization), hemodialysis if severe"),
                KeyValueRow(key: "TCA overdose", value: "Sodium bicarbonate IV (for QRS widening, dysrhythmias)"),
                KeyValueRow(key: "β-blocker overdose", value: "Glucagon 5–10 mg IV bolus then drip; calcium; high-dose insulin therapy"),
                KeyValueRow(key: "Calcium-channel-blocker overdose", value: "Calcium gluconate or chloride; high-dose insulin therapy; glucagon"),
                KeyValueRow(key: "Digoxin toxicity", value: "Digoxin immune Fab (DigiFab) for life-threatening arrhythmia, K >5, level >10–15"),
                KeyValueRow(key: "Iron overdose", value: "Deferoxamine"),
                KeyValueRow(key: "Methanol / ethylene glycol", value: "Fomepizole (4-MP); thiamine + folate (methanol); pyridoxine (ethylene glycol); hemodialysis"),
                KeyValueRow(key: "Methemoglobinemia", value: "Methylene blue (NOT in G6PD deficiency)"),
                KeyValueRow(key: "Carbon monoxide", value: "100% oxygen (high-flow NRB); hyperbaric for severe"),
                KeyValueRow(key: "Cyanide", value: "Hydroxocobalamin (Cyanokit) 5 g IV; sodium thiosulfate"),
                KeyValueRow(key: "Organophosphate / nerve agent", value: "Atropine + pralidoxime (2-PAM)"),
                KeyValueRow(key: "Isoniazid (INH)", value: "Pyridoxine (B6) gram-for-gram match"),
                KeyValueRow(key: "Sulfonylurea overdose", value: "Octreotide (suppresses insulin release); IV dextrose"),
                KeyValueRow(key: "Local anesthetic systemic toxicity (LAST)", value: "Intralipid 20% (IV lipid emulsion)")
            ]),
            .keyValueTable(title: "Endocrine / metabolic emergencies", [
                KeyValueRow(key: "Hypoglycemia", value: "Dextrose 50% 25 g IV (or D25W 0.5 g/kg in peds); glucagon 1 mg IM/SC if no IV"),
                KeyValueRow(key: "Hyperkalemia (cardiac toxicity)", value: "Calcium gluconate (membrane stabilization), then insulin/D50, albuterol, kayexalate, dialysis"),
                KeyValueRow(key: "Magnesium overdose / toxicity", value: "Calcium gluconate 1 g IV"),
                KeyValueRow(key: "Adrenal crisis", value: "Hydrocortisone 100 mg IV q6–8h"),
                KeyValueRow(key: "Hyperthermia (malignant, NMS)", value: "Dantrolene; supportive cooling; discontinue trigger drug")
            ]),
            .keyValueTable(title: "Allergic / toxicologic emergencies", [
                KeyValueRow(key: "Anaphylaxis", value: "Epinephrine 0.3–0.5 mg IM (1:1,000); airway, IV fluids, antihistamines, steroids"),
                KeyValueRow(key: "Snake envenomation (US — pit viper)", value: "CroFab antivenom"),
                KeyValueRow(key: "Coral snake", value: "Antivenin (Micrurus fulvius) — limited availability"),
                KeyValueRow(key: "Spider (black widow)", value: "Antivenin (limited availability); analgesia, calcium controversial"),
                KeyValueRow(key: "Stingray", value: "Hot water immersion (toxin protein-based; heat denatures)")
            ]),
            .bullets(title: "Practical pearls", [
                AttributedBullet("Activate POISON CONTROL — 1-800-222-1222 (US); always call early.", citationIDs: ["openrn_skills_round3"]),
                AttributedBullet("Many antidotes have very narrow utility windows — speed matters (NAC < 8 hr ideal, naloxone immediate, antivenoms within hours).", citationIDs: ["openrn_skills_round3"]),
                AttributedBullet("Some 'antidotes' have significant adverse effects — flumazenil precipitates seizures in chronic benzo users; naloxone causes severe withdrawal; protamine causes hypotension/anaphylaxis.", citationIDs: ["openrn_skills_round3"]),
                AttributedBullet("Decontamination — activated charcoal effective within 1 hour for some ingestions; whole-bowel irrigation for sustained-release; gastric lavage rarely indicated.", citationIDs: ["openrn_skills_round3"]),
                AttributedBullet("Document overdose intent — counseling and psychiatric evaluation are part of management.", citationIDs: ["openrn_skills_round3"])
            ])
        ],
        citations: [openrnSkR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Lab Tube Colors / Order of Draw

public enum LabTubeColorsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "lab-tube-colors",
        title: "Lab tube colors and order of draw",
        subtitle: "CLSI standardized · prevent additive carryover",
        eyebrow: "REFERENCE · SPECIMEN COLLECTION",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .safety),
        sections: [
            .prose(title: "Why order of draw matters", AttributedProse(
                "Different vacutainer tubes contain different additives (anticoagulants, clot activators, gels). If drawn out of order, additive can be carried into the next tube and alter the result (e.g., EDTA carryover into chemistry tube falsely lowers calcium and falsely elevates potassium). The standardized CLSI order of draw prevents this.",
                citationIDs: ["openrn_skills_round3"]
            )),
            .keyValueTable(title: "Order of draw — venipuncture (CLSI)", [
                KeyValueRow(key: "1. Blood culture bottles", value: "Always first — minimize contamination"),
                KeyValueRow(key: "2. Light blue (sodium citrate)", value: "Coagulation (PT/INR, aPTT, fibrinogen, D-dimer); FILL TO LINE"),
                KeyValueRow(key: "3. Red / red-and-gray (SST)", value: "Serum chemistry, blood bank (red), serology"),
                KeyValueRow(key: "4. Gold / tiger-top (SST gel)", value: "Serum chemistry"),
                KeyValueRow(key: "5. Green (heparin)", value: "Plasma chemistry, ammonia, ionized calcium"),
                KeyValueRow(key: "6. Lavender / purple (EDTA)", value: "CBC, type & screen, HbA1c, ESR"),
                KeyValueRow(key: "7. Pink (EDTA)", value: "Blood bank specifically"),
                KeyValueRow(key: "8. Gray (sodium fluoride / oxalate)", value: "Lactate (preferred), glucose tolerance, alcohol")
            ]),
            .keyValueTable(title: "Specialty tubes (less common)", [
                KeyValueRow(key: "Royal blue (no additive or trace EDTA)", value: "Trace metals (lead, copper, zinc, mercury)"),
                KeyValueRow(key: "Yellow (ACD)", value: "DNA / paternity / HLA"),
                KeyValueRow(key: "Black (sodium citrate, 4:1 ratio)", value: "ESR (less common)"),
                KeyValueRow(key: "Tan", value: "Lead testing")
            ]),
            .keyValueTable(title: "Volume and inversion requirements", [
                KeyValueRow(key: "Coag (light blue)", value: "Fill to line (citrate ratio 9:1); under-fill alters PT/PTT"),
                KeyValueRow(key: "Most additive tubes", value: "Invert 8–10 times immediately to mix"),
                KeyValueRow(key: "EDTA (lavender/pink)", value: "Invert 8 times; clotted samples reject"),
                KeyValueRow(key: "Heparin (green)", value: "Invert 8 times; over-mixing or timing affects results"),
                KeyValueRow(key: "Serum tubes (red, SST)", value: "Allow 30 min to clot before centrifuge")
            ]),
            .bullets(title: "Common errors and consequences", [
                AttributedBullet("EDTA carryover (lavender into chemistry) — falsely high K, falsely low Ca.", citationIDs: ["openrn_skills_round3"]),
                AttributedBullet("Under-filled citrate (blue) — falsely prolonged PT/PTT.", citationIDs: ["openrn_skills_round3"]),
                AttributedBullet("Hemolyzed sample — falsely high K, LDH, AST; redraw.", citationIDs: ["openrn_skills_round3"]),
                AttributedBullet("Tube drawn from line with heparin running — falsely abnormal PT/PTT; draw from separate stick OR discard waste.", citationIDs: ["openrn_skills_round3"]),
                AttributedBullet("Prolonged tourniquet >1 min — increases K, lactate, calcium (hemolysis).", citationIDs: ["openrn_skills_round3"]),
                AttributedBullet("Specimen sent to wrong lab / cold-vs-warm transport — affects ammonia, blood gas, lactate.", citationIDs: ["openrn_skills_round3"])
            ]),
            .keyValueTable(title: "Specimen-handling pearls", [
                KeyValueRow(key: "Ammonia", value: "Collect on ICE, transport immediately to lab"),
                KeyValueRow(key: "Lactate", value: "Gray top preferred; if green/heparin, transport immediately"),
                KeyValueRow(key: "Cold agglutinins", value: "Keep at body temperature (no ice)"),
                KeyValueRow(key: "Blood culture", value: "Two sets, two sites, before antibiotics; aerobic first then anaerobic"),
                KeyValueRow(key: "Type & screen / crossmatch", value: "Strict ID — two-patient identifiers + bedside label; mislabel can be fatal")
            ]),
            .prose(title: "When unsure", AttributedProse(
                "Call the lab. They would rather answer your question than reject your specimen. Mis-drawn specimens delay care and require redraw — keep a quick-reference card on the unit.",
                citationIDs: ["openrn_skills_round3"]
            ))
        ],
        citations: [openrnSkR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}
