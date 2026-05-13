import Foundation

// Curator-model procedure + reference entries (round 5 expansion).
// Sources: Open RN Skills + Mental Health (CC BY 4.0), OpenStax Clinical Nursing Skills
// (CC BY 4.0 with AI restriction), CDC (public domain), ISMP / Joint Commission /
// Columbia Lighthouse Project / TJC concept citations.

private let openrnSkR5 = CitationSource(
    id: "openrn_skills_round5",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=skill+technique+culture+IV",
    lastRetrieved: "2026-05-04"
)
private let openrnMHr5p = CitationSource(
    id: "openrn_mh_round5_proc",
    shortName: "Open RN Mental Health Nursing — safety + assessment",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingmhcc/?s=safety+suicide+restraints+assessment",
    lastRetrieved: "2026-05-04"
)
private let openstaxSkR5p = CitationSource(
    id: "openstax_skills_round5",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let cdcR5p = CitationSource(
    id: "cdc_round5_proc",
    shortName: "CDC clinical / infection-control guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let columbiaConceptR5 = CitationSource(
    id: "columbia_concept_round5",
    shortName: "Columbia Suicide Severity Rating Scale (C-SSRS) — concept citation",
    publisher: "Columbia Lighthouse Project · Columbia University",
    license: .factCitationOnly,
    url: "https://cssrs.columbia.edu/",
    lastRetrieved: "2026-05-04"
)
private let ismpRefR5 = CitationSource(
    id: "ismp_ref_round5",
    shortName: "ISMP List of High-Alert Medications (concept citation)",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)

private let safetyR5 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let psychSafetyR5 = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety)
private let pharmRefR5 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)

// MARK: - Suicide Precautions / 1:1 Sit

public enum SuicidePrecautionsSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "suicide-precautions",
        title: "Suicide precautions / 1:1 observation",
        subtitle: "Constant observation · environmental safety · documentation",
        nclexTags: psychSafetyR5,
        indications: AttributedProse(
            "Patient with active suicidal ideation, plan, intent, or recent attempt; high acute or chronic suicide risk; per provider order or facility protocol after risk assessment (e.g., C-SSRS).",
            citationIDs: ["openrn_mh_round5_proc"]
        ),
        contraindications: AttributedProse(
            "None when clinically indicated. Discontinuation requires provider order and updated risk assessment per primary source.",
            citationIDs: ["openrn_mh_round5_proc"]
        ),
        equipment: [
            AttributedBullet("Trained staff member (RN, mental-health tech, or sitter per facility) for continuous observation.", citationIDs: ["openrn_mh_round5_proc"]),
            AttributedBullet("Documentation tool (paper or electronic) for q15-min behavior observation per facility.", citationIDs: ["openrn_mh_round5_proc"]),
            AttributedBullet("Means-reduction supplies — secure container for personal items, hospital gown, paper meal trays, no plastic bags, no shoelaces, no drawstrings, no electrical cords.", citationIDs: ["openrn_mh_round5_proc"]),
            AttributedBullet("Quiet, low-stimulation environment; visual line of sight to patient at all times.", citationIDs: ["openrn_mh_round5_proc"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order and level of observation (1:1 line-of-sight, arm's length, video monitor only is generally NOT acceptable for active SI per primary source).", citationIDs: ["openrn_mh_round5_proc"]),
            AttributedBullet("Conduct documented suicide risk assessment (C-SSRS or facility tool) at admission and shift change.", citationIDs: ["openrn_mh_round5_proc"]),
            AttributedBullet("Search and remove harmful items — sharp objects, medications, lighters, shoelaces, drawstrings, belts, cords, glass, plastic bags, mirrors (if removable).", citationIDs: ["openrn_mh_round5_proc"]),
            AttributedBullet("Inventory and secure personal belongings; document.", citationIDs: ["openrn_mh_round5_proc"]),
            AttributedBullet("Educate patient and family on the precautions and rationale; obtain therapeutic alliance.", citationIDs: ["openrn_mh_round5_proc"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Maintain continuous visual contact", body: "Sitter remains within line of sight (or arm's length per order) at ALL TIMES — including bathroom, shower, sleep. Door of bathroom remains open or sitter accompanies patient with privacy considerations balanced against safety per facility.", citationIDs: ["openrn_mh_round5_proc"]),
            ProcedureStep(number: 2, title: "Document observation per facility protocol", body: "Most facilities require q15-min behavior documentation (location, mood, activity, statements). Document any concerning behavior or statements verbatim.", citationIDs: ["openrn_mh_round5_proc"]),
            ProcedureStep(number: 3, title: "Engage therapeutically", body: "Use sitting time to build rapport. Active listening, validate feelings, do not minimize. Avoid arguing about reasons to live; do not promise confidentiality about safety information per primary source.", citationIDs: ["openrn_mh_round5_proc"]),
            ProcedureStep(number: 4, title: "Mealtime safety", body: "Use paper or plastic utensils per facility protocol; remove glass and breakable items; supervise during eating.", citationIDs: ["openrn_mh_round5_proc"]),
            ProcedureStep(number: 5, title: "Medication administration", body: "Confirm patient swallows oral medications (look in mouth, under tongue) per primary source — \"cheeking\" risk for hoarding.", citationIDs: ["openrn_mh_round5_proc"]),
            ProcedureStep(number: 6, title: "Visitor management", body: "Visitors are screened by staff; bags inspected; no harmful items brought in. Educate visitors on precautions.", citationIDs: ["openrn_mh_round5_proc"]),
            ProcedureStep(number: 7, title: "Shift handoff", body: "Direct hand-off between sitters at the bedside; never leave patient unobserved during transition. Update suicide risk assessment.", citationIDs: ["openrn_mh_round5_proc"])
        ],
        postProcedure: [
            AttributedBullet("Reassess risk daily and at significant change; provider order required to discontinue or step down level of observation.", citationIDs: ["openrn_mh_round5_proc"]),
            AttributedBullet("Develop safety plan with patient prior to discharge or step-down — warning signs, internal coping strategies, social contacts, professional contacts, lethal means counseling.", citationIDs: ["openrn_mh_round5_proc"])
        ],
        documentation: [
            AttributedBullet("Q15-min observation log with location, behavior, statements, mood; sitter signatures.", citationIDs: ["openrn_mh_round5_proc"]),
            AttributedBullet("Suicide risk assessment at admission, shift change, significant change, discharge.", citationIDs: ["openrn_mh_round5_proc"]),
            AttributedBullet("Safety plan in chart prior to step-down or discharge.", citationIDs: ["openrn_mh_round5_proc"])
        ],
        watchFor: [
            AttributedBullet("INPATIENT SUICIDE — most often by hanging from any anchor point with cord-like material; environment scan should be exhaustive.", citationIDs: ["openrn_mh_round5_proc"]),
            AttributedBullet("Sudden calm or improvement after severe distress can be a warning sign — patient may have decided on a plan.", citationIDs: ["openrn_mh_round5_proc"]),
            AttributedBullet("Discharge is a high-risk period — most post-discharge suicides occur within 30 days; ensure follow-up appointment within 7 days per primary source.", citationIDs: ["openrn_mh_round5_proc"])
        ],
        citations: [openrnMHr5p, columbiaConceptR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pediatric IV Start

public enum PediatricIVStartSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "pediatric-iv-start",
        title: "Pediatric IV start (peripheral)",
        subtitle: "Site selection · pain control · stabilization · family-centered",
        nclexTags: safetyR5,
        indications: AttributedProse(
            "Need for IV fluids, medications, blood sampling, or contrast administration in an infant or child. Site, gauge, and technique are adjusted to age, body habitus, and clinical urgency.",
            citationIDs: ["openrn_skills_round5", "openstax_skills_round5"]
        ),
        contraindications: AttributedProse(
            "Avoid the affected limb in: ipsilateral mastectomy / lymph-node dissection (rare in peds), AV fistula, fracture, infection / cellulitis, recent surgery. Avoid multiple attempts in the same limb without re-assessment.",
            citationIDs: ["openrn_skills_round5"]
        ),
        equipment: [
            AttributedBullet("IV catheter — gauge selected by indication (24G most common in infants/small children; 22G for older children; 18–20G for trauma/transfusion/contrast per primary source).", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Topical anesthetic — EMLA (lidocaine-prilocaine) ≥30 min, LMX (lidocaine 4%) ≥20 min, or vapocoolant spray immediately per primary source.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Tourniquet sized for child; saline flush; T-connector or extension tubing primed; transparent dressing; skin prep (chlorhexidine for ≥2 mo, povidone-iodine alternative for <2 mo per primary source).", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Stabilization aids — armboard, securement device, soft restraints; nonpharmacologic comfort — sucrose pacifier (<6 mo), distraction toys, music, parent presence.", citationIDs: ["openrn_skills_round5"])
        ],
        preProcedure: [
            AttributedBullet("Verify order and indication; check allergies (chlorhexidine, latex, adhesive).", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Family-centered explanation appropriate to developmental level — \"a small straw to give your medicine\" — avoid loaded words like \"big needle.\"", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Apply topical anesthetic over 1–2 likely sites at least 20–30 minutes prior when not emergent.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Two-person hold or distraction by Child Life when available; second clinician for stabilization in infants.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Site selection — infants: scalp, dorsal hand, dorsal foot, antecubital (in that priority varies by facility); children: dorsal hand, forearm, antecubital. Avoid dominant hand and feet in walkers.", citationIDs: ["openrn_skills_round5"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene + don gloves", body: "Hand hygiene per primary source; clean gloves.", citationIDs: ["openrn_skills_round5"]),
            ProcedureStep(number: 2, title: "Apply tourniquet and identify vein", body: "Apply tourniquet 3–5 inches above selected site; gently palpate for bouncy vein. Transilluminator or ultrasound for difficult access per primary source.", citationIDs: ["openrn_skills_round5"]),
            ProcedureStep(number: 3, title: "Cleanse and air-dry", body: "Cleanse with friction × 30 sec; allow to air-dry COMPLETELY (residual antiseptic causes burning, hemolysis, false readings).", citationIDs: ["openrn_skills_round5"]),
            ProcedureStep(number: 4, title: "Insert at shallow angle", body: "Stretch skin distally with non-dominant hand. Enter at 10–20° angle (shallower in infants). Watch for blood return in flash chamber.", citationIDs: ["openrn_skills_round5"]),
            ProcedureStep(number: 5, title: "Advance catheter, retract needle", body: "Once flash seen, advance catheter off the needle into the vein; retract needle into safety device. Release tourniquet.", citationIDs: ["openrn_skills_round5"]),
            ProcedureStep(number: 6, title: "Confirm patency, secure", body: "Attach primed T-connector; flush with 1–3 mL saline (smaller syringe for infants — small syringes generate higher pressure but volume is the goal); confirm no resistance, no swelling, no pain. Secure with transparent dressing; armboard if needed; date and time the dressing.", citationIDs: ["openrn_skills_round5"]),
            ProcedureStep(number: 7, title: "Comfort + reunite with caregiver", body: "Praise and comfort; bandage or sticker per facility. Return to caregiver; document.", citationIDs: ["openrn_skills_round5"])
        ],
        postProcedure: [
            AttributedBullet("Hourly site assessment (newer facilities standard q1h for peds) — site, swelling, redness, pain, dressing intact, T-connector secure per primary source.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Limit attempts — facility policy typically allows ≤2 attempts per clinician before re-evaluating with team / vascular access service.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Document attempts, location, gauge, time, comfort measures used, who held, family present.", citationIDs: ["openrn_skills_round5"])
        ],
        documentation: [
            AttributedBullet("Site, gauge, attempt count, anesthetic used, assistance, family-centered care, patient response, time, who removed.", citationIDs: ["openrn_skills_round5"])
        ],
        watchFor: [
            AttributedBullet("Infiltration / extravasation — common in peds; very small extravasation can cause big tissue injury (especially with vasoactive drugs, hypertonic fluids, calcium). Stop, aspirate, antidote per protocol, elevate, photograph for documentation.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Phlebitis — redness, tenderness, palpable cord; remove and rotate.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Air embolism — rare; ensure tubing and connections primed and tight.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Procedural trauma / needle phobia — minimize attempts, use child life, family presence, anesthetic, and distraction; establish vascular access service consults early in difficult patients.", citationIDs: ["openrn_skills_round5"])
        ],
        citations: [openrnSkR5, openstaxSkR5p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Wound Culture Collection

public enum WoundCultureSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "wound-culture",
        title: "Wound culture collection",
        subtitle: "Levine technique · representative tissue · aerobic + anaerobic",
        nclexTags: safetyR5,
        indications: AttributedProse(
            "Suspected wound infection — purulence, increasing erythema, warmth, induration, foul odor, dehiscence, fever, systemic signs of infection. Cultures inform antibiotic selection per primary source.",
            citationIDs: ["openrn_skills_round5", "openstax_skills_round5"]
        ),
        contraindications: AttributedProse(
            "Routine surveillance cultures of clinically uninfected wounds are not recommended — colonization vs infection is a clinical distinction. Do NOT culture eschar — the surface is not representative of underlying infection per primary source.",
            citationIDs: ["openrn_skills_round5"]
        ),
        equipment: [
            AttributedBullet("Sterile saline (no preservatives), sterile gauze, sterile swab with transport media (Amies or Stuart), or biopsy/aspirate kit per provider order.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Sterile gloves, mask if MDRO suspected, eye protection if splash risk.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Specimen labels, requisition (note antibiotic on board, anatomic site).", citationIDs: ["openrn_skills_round5"])
        ],
        preProcedure: [
            AttributedBullet("Verify order — aerobic, anaerobic, fungal, AFB; specify wound type and location.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Hand hygiene; explain procedure; provide privacy and pain control.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Pre-medicate for pain 30 min before per primary source.", citationIDs: ["openrn_skills_round5"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Don PPE", body: "Hand hygiene; gloves (sterile if culture from sterile tissue), mask, eye protection per facility.", citationIDs: ["openrn_skills_round5"]),
            ProcedureStep(number: 2, title: "Cleanse the wound surface", body: "Irrigate with sterile saline to remove surface exudate, debris, and topical antimicrobials per primary source — surface contaminants are NOT what we are culturing.", citationIDs: ["openrn_skills_round5"]),
            ProcedureStep(number: 3, title: "Identify viable tissue", body: "Identify clean, healing, granulation tissue (not slough, not eschar). The Levine technique cultures viable tissue to reflect organisms invading the wound bed.", citationIDs: ["openrn_skills_round5"]),
            ProcedureStep(number: 4, title: "Apply Levine technique with swab", body: "Press swab over a 1-cm² area of clean granulation tissue with enough pressure to express tissue fluid; rotate the swab while pressing for ~5 seconds. Avoid touching wound edges or skin.", citationIDs: ["openrn_skills_round5"]),
            ProcedureStep(number: 5, title: "Place in transport media", body: "Insert swab into transport tube; close securely. For anaerobic cultures use anaerobic transport media; for biopsy or aspirate, place in sterile saline-free container per microbiology lab.", citationIDs: ["openrn_skills_round5"]),
            ProcedureStep(number: 6, title: "Label and send", body: "Label at the bedside with patient identifiers, site, type of culture, antibiotics on board, time. Transport to lab promptly.", citationIDs: ["openrn_skills_round5"])
        ],
        postProcedure: [
            AttributedBullet("Apply ordered dressing; document wound assessment (size, depth, undermining, exudate, surrounding skin) per primary source.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Reassess for systemic signs of infection — vitals, mental status, glucose in diabetics.", citationIDs: ["openrn_skills_round5"])
        ],
        documentation: [
            AttributedBullet("Date / time, site, wound description, technique (Levine swab vs biopsy / aspirate), patient tolerance, antibiotic on board, specimen disposition.", citationIDs: ["openrn_skills_round5"])
        ],
        watchFor: [
            AttributedBullet("Surface swab without irrigation = contamination; results may not guide therapy.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Tissue biopsy or fluid aspirate is the GOLD STANDARD when feasible — especially for deep / chronic / failed-treatment wounds per primary source.", citationIDs: ["openrn_skills_round5"]),
            AttributedBullet("Document antibiotics on board — partial treatment can lead to false-negative cultures.", citationIDs: ["openrn_skills_round5"])
        ],
        citations: [openrnSkR5, openstaxSkR5p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Mental Status Exam (MSE) Reference

public enum MentalStatusExamSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "mental-status-exam",
        title: "Mental status exam (MSE)",
        subtitle: "Structured assessment of cognition, mood, thought, perception, behavior",
        eyebrow: "REFERENCE · ASSESSMENT",
        nclexTags: psychSafetyR5,
        sections: [
            .prose(title: "Purpose", AttributedProse(
                "The mental status exam is a structured snapshot of the patient's current psychological functioning. Components are observed during the interview and recorded across discrete domains. The MSE is an OBSERVATION, not a history.",
                citationIDs: ["openrn_mh_round5_proc"]
            )),
            .keyValueTable(title: "Appearance", [
                KeyValueRow(key: "Grooming / hygiene", value: "Disheveled, clean, malodorous, makeup excessive"),
                KeyValueRow(key: "Dress", value: "Appropriate to setting/weather, eccentric, inappropriate"),
                KeyValueRow(key: "Apparent age", value: "Younger / older than stated age"),
                KeyValueRow(key: "Posture / eye contact", value: "Slumped, rigid, agitated; sustained, avoidant, intense")
            ]),
            .keyValueTable(title: "Behavior / Motor activity", [
                KeyValueRow(key: "Activity level", value: "Calm, agitated, restless, psychomotor retardation"),
                KeyValueRow(key: "Movements", value: "Tics, tremor, mannerisms, posturing, dyskinesia, akathisia"),
                KeyValueRow(key: "Cooperation", value: "Cooperative, guarded, hostile, withdrawn")
            ]),
            .keyValueTable(title: "Speech", [
                KeyValueRow(key: "Rate", value: "Normal, pressured, slowed"),
                KeyValueRow(key: "Volume", value: "Normal, loud, soft, mumbled"),
                KeyValueRow(key: "Rhythm / fluency", value: "Fluent, dysarthric, stuttering, latency to response")
            ]),
            .keyValueTable(title: "Mood and Affect", [
                KeyValueRow(key: "Mood (subjective)", value: "Patient's report — \"I feel sad / hopeless / fine\""),
                KeyValueRow(key: "Affect (objective)", value: "Range, intensity, congruence with mood and content"),
                KeyValueRow(key: "Affect descriptors", value: "Euthymic, dysphoric, anxious, irritable, labile, blunted, flat, restricted, congruent / incongruent")
            ]),
            .keyValueTable(title: "Thought process", [
                KeyValueRow(key: "Linear / goal-directed", value: "Normal — flows logically to a point"),
                KeyValueRow(key: "Circumstantial", value: "Eventually arrives but with detours"),
                KeyValueRow(key: "Tangential", value: "Wanders, never returns"),
                KeyValueRow(key: "Loose associations / flight of ideas", value: "Disconnected jumps; rapid topic shifts"),
                KeyValueRow(key: "Word salad / blocking", value: "Severe disorganization; sudden stop in speech")
            ]),
            .keyValueTable(title: "Thought content", [
                KeyValueRow(key: "Suicidal / homicidal ideation", value: "ALWAYS ASK directly — current SI/HI, plan, intent, means, prior attempts"),
                KeyValueRow(key: "Delusions", value: "Persecutory, grandiose, somatic, religious, referential"),
                KeyValueRow(key: "Obsessions / compulsions", value: "Recurrent intrusive thoughts; repetitive behaviors"),
                KeyValueRow(key: "Phobias / preoccupations", value: "Specific fears or recurring focus")
            ]),
            .keyValueTable(title: "Perception", [
                KeyValueRow(key: "Hallucinations", value: "Auditory (most common in schizophrenia), visual (more common in delirium / drug effects), tactile (\"meth bugs,\" alcohol withdrawal), olfactory / gustatory (consider seizure)"),
                KeyValueRow(key: "Illusions", value: "Misperceptions of real stimuli"),
                KeyValueRow(key: "Depersonalization / derealization", value: "Self / surroundings feel unreal")
            ]),
            .keyValueTable(title: "Cognition", [
                KeyValueRow(key: "Orientation", value: "Person, place, time, situation"),
                KeyValueRow(key: "Attention / concentration", value: "Days of week backward, serial 7s, spell WORLD backward"),
                KeyValueRow(key: "Memory", value: "Immediate (3-word recall), recent (current events), remote (historical)"),
                KeyValueRow(key: "Abstract thinking", value: "Proverb interpretation, similarities / differences"),
                KeyValueRow(key: "Bedside cognitive screen", value: "MoCA, MMSE, Mini-Cog, AD8 per facility")
            ]),
            .keyValueTable(title: "Insight and Judgment", [
                KeyValueRow(key: "Insight", value: "Awareness of illness — full, partial, absent"),
                KeyValueRow(key: "Judgment", value: "Decision-making appropriate to circumstance — assess via current and recent behaviors")
            ]),
            .bullets(title: "Documentation tips", [
                AttributedBullet("Use direct quotes for delusions / hallucinations / SI: \"the TV is sending me messages\"; \"I want to be dead.\"", citationIDs: ["openrn_mh_round5_proc"]),
                AttributedBullet("Note ABSENCES too: \"Denies SI/HI/AVH at this time.\"", citationIDs: ["openrn_mh_round5_proc"]),
                AttributedBullet("Pair MSE with vital signs, fingerstick glucose, and medication review when AMS — rule out medical causes of altered MSE.", citationIDs: ["openrn_mh_round5_proc"])
            ])
        ],
        citations: [openrnMHr5p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - C-SSRS Suicide Assessment Overview

public enum CSSRSSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "c-ssrs-overview",
        title: "Columbia C-SSRS overview",
        subtitle: "Suicide ideation + behavior screening · evidence-based · concept reference",
        eyebrow: "REFERENCE · SUICIDE RISK",
        nclexTags: psychSafetyR5,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "The Columbia Suicide Severity Rating Scale (C-SSRS) is a structured questionnaire developed by the Columbia Lighthouse Project (Columbia University). It is widely used in clinical, research, and community settings to identify and stratify suicide risk. THIS IS A CONCEPT REFERENCE — administer the official scale per institutional license.",
                citationIDs: ["columbia_concept_round5"]
            )),
            .keyValueTable(title: "Five core ideation questions (lifetime / past month)", [
                KeyValueRow(key: "1. Wish to be dead", value: "Have you wished you were dead or wished you could go to sleep and not wake up?"),
                KeyValueRow(key: "2. Non-specific active suicidal thoughts", value: "Have you actually had any thoughts of killing yourself?"),
                KeyValueRow(key: "3. Active SI with method (no plan, no intent)", value: "Have you been thinking about how you might do this?"),
                KeyValueRow(key: "4. Active SI with intent (no specific plan)", value: "Have you had these thoughts and had some intention of acting on them?"),
                KeyValueRow(key: "5. Active SI with plan and intent", value: "Have you started to work out or worked out the details of how to kill yourself? Do you intend to carry out this plan?")
            ]),
            .keyValueTable(title: "Behavior questions", [
                KeyValueRow(key: "Actual attempt", value: "Have you ever made a suicide attempt? When was the most recent?"),
                KeyValueRow(key: "Interrupted attempt", value: "Has anyone or anything stopped you from making an attempt?"),
                KeyValueRow(key: "Aborted attempt", value: "Did you start to make an attempt but stop yourself?"),
                KeyValueRow(key: "Preparatory acts / behavior", value: "Have you taken any steps toward making a suicide attempt?"),
                KeyValueRow(key: "Non-suicidal self-injurious behavior", value: "Have you engaged in self-harm without intent to die?")
            ]),
            .keyValueTable(title: "Risk stratification (general framework)", [
                KeyValueRow(key: "High risk", value: "\"Yes\" to question 4 or 5 (intent) OR any behavior in past 3 months"),
                KeyValueRow(key: "Moderate risk", value: "\"Yes\" to question 3 (method without plan/intent) OR behavior >3 months ago"),
                KeyValueRow(key: "Low risk", value: "\"Yes\" only to questions 1 or 2"),
                KeyValueRow(key: "Always pair with clinical judgment", value: "Risk factors (prior attempts, access to means, substance use, recent loss, hopelessness) and protective factors")
            ]),
            .bullets(title: "Nursing actions when administering", [
                AttributedBullet("Use the OFFICIAL scale per facility license; do not paraphrase questions — wording is validated.", citationIDs: ["columbia_concept_round5"]),
                AttributedBullet("Ask in private, calmly, without judgment; normalize the questions (\"these are questions we ask everyone\").", citationIDs: ["openrn_mh_round5_proc"]),
                AttributedBullet("Document responses VERBATIM and risk level; communicate to provider promptly when moderate or high.", citationIDs: ["openrn_mh_round5_proc"]),
                AttributedBullet("Develop or update safety plan; lethal means counseling for patients with home access to firearms or stockpiled medications.", citationIDs: ["openrn_mh_round5_proc"]),
                AttributedBullet("Re-administer at admission, shift change, significant change, and discharge.", citationIDs: ["openrn_mh_round5_proc"])
            ]),
            .prose(title: "Evidence base", AttributedProse(
                "The C-SSRS is endorsed by the FDA, CDC, SAMHSA, Joint Commission, US military, and many state and national systems. Validation includes use in MDD trials, ED screening, primary care, schools, and corrections. ASKING about suicide does NOT plant the idea — multiple meta-analyses show direct screening reduces risk by enabling intervention.",
                citationIDs: ["columbia_concept_round5"]
            ))
        ],
        citations: [columbiaConceptR5, openrnMHr5p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ISMP High-Alert Medications

public enum ISMPHighAlertSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ismp-high-alert",
        title: "ISMP high-alert medications",
        subtitle: "Drugs with heightened risk of significant harm when used in error",
        eyebrow: "REFERENCE · MEDICATION SAFETY",
        nclexTags: pharmRefR5,
        sections: [
            .prose(title: "What this list represents", AttributedProse(
                "The Institute for Safe Medication Practices (ISMP) publishes lists of medications that bear a heightened risk of significant patient harm when used in error. ISMP recommends that organizations build extra safeguards (independent double-checks, standardized concentrations, smart-pump limits, automatic stop orders) for these drugs. THIS IS A CONCEPT REFERENCE per primary source — consult ISMP's current published list for the authoritative inventory.",
                citationIDs: ["ismp_ref_round5"]
            )),
            .keyValueTable(title: "Acute care — categories of drugs ISMP includes", [
                KeyValueRow(key: "Adrenergic agonists / antagonists IV", value: "epinephrine, norepinephrine, phenylephrine, vasopressin; esmolol, labetalol IV"),
                KeyValueRow(key: "Anesthetics, including local anesthetics", value: "propofol, ketamine, lidocaine IV, bupivacaine epidural"),
                KeyValueRow(key: "Antiarrhythmics IV", value: "amiodarone, lidocaine IV, sotalol IV"),
                KeyValueRow(key: "Antithrombotics", value: "heparin, LMWH, warfarin, DOACs (apixaban, rivaroxaban, dabigatran, edoxaban), thrombolytics, glycoprotein IIb/IIIa inhibitors"),
                KeyValueRow(key: "Chemotherapy", value: "Parenteral and oral; high-risk regimens require independent verification"),
                KeyValueRow(key: "Dextrose hypertonic ≥20%", value: "Concentrated solutions for parenteral use"),
                KeyValueRow(key: "Insulin (all routes)", value: "Subcutaneous, IV; concentration matters (U-100, U-300, U-500); pediatrics especially"),
                KeyValueRow(key: "Moderate / minimal sedation agents", value: "midazolam IV, oral sedation"),
                KeyValueRow(key: "Narcotics / opioids — IV, transdermal, oral concentrated", value: "morphine, hydromorphone, fentanyl, methadone, oxycodone concentrate, hydrocodone-APAP"),
                KeyValueRow(key: "Neuromuscular blocking agents", value: "rocuronium, vecuronium, succinylcholine — paralytics; ALWAYS in mechanically ventilated patients only"),
                KeyValueRow(key: "Parenteral nutrition", value: "TPN — concentration, osmolarity, line type"),
                KeyValueRow(key: "Sodium chloride ≥0.9%", value: "Hypertonic — 3% NaCl for hyponatremia, central line preferred"),
                KeyValueRow(key: "Sterile water for injection ≥100 mL", value: "Hypotonic; risk of hemolysis if administered as bolus")
            ]),
            .keyValueTable(title: "Specific drugs ISMP separately calls out", [
                KeyValueRow(key: "Epoprostenol", value: "Pulmonary HTN; abrupt discontinuation = fatal"),
                KeyValueRow(key: "Insulin U-500", value: "5x concentrated; never use as U-100 substitute; volume doses written in INSULIN UNITS not mL"),
                KeyValueRow(key: "Magnesium sulfate IV", value: "Pre-eclampsia, refractory asthma, torsades; cardiopulmonary monitoring"),
                KeyValueRow(key: "Methotrexate (oral non-oncologic)", value: "WEEKLY dosing in RA, psoriasis, etc.; daily-dosing errors are deadly"),
                KeyValueRow(key: "Oxytocin IV", value: "Labor augmentation; uterine tachysystole + fetal distress"),
                KeyValueRow(key: "Nitroprusside IV", value: "Cyanide toxicity at high doses or prolonged use; light-protect"),
                KeyValueRow(key: "Potassium chloride IV ≥0.5 mEq/mL", value: "Never IV push; concentration limit; central line for high concentrations"),
                KeyValueRow(key: "Promethazine IV", value: "Severe tissue injury with extravasation; preferred IM or PO"),
                KeyValueRow(key: "Vasopressin IV", value: "Septic shock, post-op vasoplegia; potent vasoconstriction"),
                KeyValueRow(key: "Lithium PO", value: "Narrow therapeutic index; toxicity precipitated by NSAIDs, dehydration"),
                KeyValueRow(key: "Clozapine PO", value: "REMS-required ANC monitoring; severe neutropenia / myocarditis")
            ]),
            .bullets(title: "Standard safeguards for high-alert drugs", [
                AttributedBullet("Independent DOUBLE-CHECK by two qualified clinicians (insulin, heparin, opioid PCA, chemo, paralytics, TPN, vasopressors per facility).", citationIDs: ["ismp_ref_round5"]),
                AttributedBullet("Smart-pump dose-error reduction with hard limits; standardized concentrations.", citationIDs: ["ismp_ref_round5"]),
                AttributedBullet("Tall-man lettering for look-alike names (HYDROmorphone vs morPHINE; vinBLAStine vs vinCRIStine).", citationIDs: ["ismp_ref_round5"]),
                AttributedBullet("Automatic stop dates and forced re-orders for high-risk drugs (paralytics, vasopressors, chemotherapy).", citationIDs: ["ismp_ref_round5"]),
                AttributedBullet("Patient education and look-back on every transition of care.", citationIDs: ["ismp_ref_round5"])
            ])
        ],
        citations: [ismpRefR5, openrnSkR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

