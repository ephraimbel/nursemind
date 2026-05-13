import Foundation

// Curator-model procedure + reference entries (round 4 expansion).
// Sources: Open RN Nursing Skills (CC BY 4.0), OpenStax Clinical Nursing Skills
// (CC BY 4.0 with AI restriction), CDC ACIP (public domain), AAP / ADA / Joint
// Commission concept citations.

private let openrnSkR4 = CitationSource(
    id: "openrn_skills_round4",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=skill+technique",
    lastRetrieved: "2026-05-04"
)
private let openstaxSkR4 = CitationSource(
    id: "openstax_skills_round4",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let cdcAcipR4 = CitationSource(
    id: "cdc_acip_round4",
    shortName: "CDC ACIP — Recommended Immunization Schedules",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/vaccines/schedules/",
    lastRetrieved: "2026-05-04"
)
private let openrnNutR4 = CitationSource(
    id: "openrn_nutrition_round4",
    shortName: "Open RN Nutrition",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nutrition/",
    lastRetrieved: "2026-05-04"
)
private let adaConceptR4 = CitationSource(
    id: "ada_concept_round4",
    shortName: "ADA Standards of Care in Diabetes (concept citation)",
    publisher: "American Diabetes Association",
    license: .factCitationOnly,
    url: "https://professional.diabetes.org/standards-of-care",
    lastRetrieved: "2026-05-04"
)

private let safetyR4 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let mobilityR4 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility)
private let elimR4 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .elimination)
private let infectionR4 = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .infection)
private let nutritionR4 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition)
private let pharmR4 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .glucoseRegulation)

// MARK: - Heel Stick (Newborn)

public enum HeelStickSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "heel-stick-newborn",
        title: "Heel stick (newborn capillary blood)",
        subtitle: "Capillary specimen · newborn screen / glucose / bilirubin",
        nclexTags: safetyR4,
        indications: AttributedProse(
            "Capillary blood collection in neonates and infants for newborn metabolic screening, point-of-care glucose, bilirubin, blood gas, electrolytes, or other small-volume tests when venipuncture is not appropriate.",
            citationIDs: ["openrn_skills_round4", "openstax_skills_round4"]
        ),
        contraindications: AttributedProse(
            "Avoid heel stick in: infants with peripheral cyanosis or poor perfusion, edematous heels, prior puncture sites that have not healed, very-low-birth-weight infants requiring large-volume sampling. Do NOT puncture the central or posterior heel — risk of bone, nerve, and tendon injury.",
            citationIDs: ["openrn_skills_round4"]
        ),
        equipment: [
            AttributedBullet("Automated incision lancet sized for infant weight (\"newborn,\" \"preemie,\" or \"infant\" device per primary source).", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Alcohol prep pad (or chlorhexidine per facility for blood culture).", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Sterile gauze, adhesive bandage suitable for infant skin.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Specimen collection device — newborn screen filter card (Guthrie card), capillary tubes, or microcontainer per test ordered.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Warm pack or pre-warmed cloth (heel warming) to enhance blood flow.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Gloves and PPE per standard precautions.", citationIDs: ["openrn_skills_round4"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order and infant identity using two identifiers per primary source.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Educate caregiver on rationale, expected discomfort, and pain-management strategies (skin-to-skin, breastfeeding, sucrose pacifier per facility).", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Apply heel warmer for 3–5 minutes to enhance perfusion.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Position infant supine or held by caregiver; expose foot.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Identify the LATERAL or MEDIAL plantar surface of the heel — never the posterior or central heel.", citationIDs: ["openrn_skills_round4"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene + don gloves", body: "Hand hygiene per primary source; don clean gloves.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 2, title: "Cleanse site and allow to dry", body: "Cleanse selected lateral or medial plantar heel surface with alcohol; allow to air dry COMPLETELY (residual alcohol causes hemolysis and inaccurate glucose readings).", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 3, title: "Position lancet and activate", body: "Hold the foot dorsiflexed, supporting the heel; place lancet flat against lateral or medial heel and activate per device instructions. Do not squeeze the heel before puncture.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 4, title: "Wipe first drop, collect specimen", body: "Wipe away the FIRST drop of blood (contains tissue fluid). Collect remaining drops onto filter card circles (saturate from one side per primary source) or into capillary tube/microcontainer. Do NOT milk or scrape — gentle intermittent pressure only.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 5, title: "Apply pressure and bandage", body: "Apply gauze with gentle pressure until bleeding stops. Apply small bandage; ensure not too tight around foot.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 6, title: "Comfort + offer feeding", body: "Return infant to caregiver; encourage breastfeeding or non-nutritive sucking. Re-assess perfusion of foot.", citationIDs: ["openrn_skills_round4"])
        ],
        postProcedure: [
            AttributedBullet("Label specimen at the bedside per primary source — never pre-label or post-label away from infant.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Air-dry filter card horizontally; do not stack until dry.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Reassess heel for swelling, bruising, or persistent bleeding 30 minutes post-procedure.", citationIDs: ["openrn_skills_round4"])
        ],
        documentation: [
            AttributedBullet("Date / time, site (lateral vs medial), test ordered, infant tolerance, comfort measures used, specimen disposition.", citationIDs: ["openrn_skills_round4"])
        ],
        watchFor: [
            AttributedBullet("BONE INJURY (calcaneal osteomyelitis) — risk if puncture is too deep or in central/posterior heel; choose correct lancet for infant weight.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Burns from heel warmer — never use microwave-heated packs; check temperature (per primary source ≤40 °C / 104 °F).", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Hemolyzed specimen → falsely elevated potassium; cleanse-dry-don't-milk technique reduces hemolysis.", citationIDs: ["openrn_skills_round4"])
        ],
        citations: [openrnSkR4, openstaxSkR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ambulatory Aid Teaching (Crutches / Walker / Cane)

public enum AmbulatoryAidTeachingSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "ambulatory-aid-teaching",
        title: "Ambulatory aid teaching — crutches, walker, cane",
        subtitle: "Sizing · weight-bearing · stairs · safe gait",
        nclexTags: mobilityR4,
        indications: AttributedProse(
            "Patient discharge or post-injury teaching for use of crutches, walker, or cane to support safe ambulation while protecting the injured limb. Choice depends on weight-bearing status (PWB, TTWB, NWB), strength, balance, and cognition.",
            citationIDs: ["openrn_skills_round4", "openstax_skills_round4"]
        ),
        contraindications: AttributedProse(
            "Severe upper-extremity weakness or injury contraindicates crutches and standard walker (consider platform walker). Significant cognitive impairment may require caregiver-assisted ambulation rather than independent device use.",
            citationIDs: ["openrn_skills_round4"]
        ),
        equipment: [
            AttributedBullet("Properly sized device — axillary crutches OR forearm crutches OR standard/wheeled walker OR single-point or quad cane.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Non-skid footwear; gait belt for initial training.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Tape measure, weight-bearing order from provider, prior PT recommendation if available.", citationIDs: ["openrn_skills_round4"])
        ],
        preProcedure: [
            AttributedBullet("Verify weight-bearing order: NWB (none), TTWB (toe-touch), PWB (partial — % weight specified), WBAT (as tolerated), FWB (full).", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Assess upper-extremity strength, balance (sitting and standing), pain, orthostatic vitals, cognition, footwear.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Apply gait belt for initial trial.", citationIDs: ["openrn_skills_round4"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Crutches — sizing", body: "Patient stands with shoes; crutch tip ~6 in / 15 cm lateral and 2 in / 5 cm anterior to foot. Crutch top 2–3 finger-widths (1.5–2 in) BELOW the axilla — weight is borne on the HANDS, not the axilla. Hand grips set so elbows flex ~30°. Axillary pressure → brachial nerve injury.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 2, title: "Walker — sizing", body: "Patient stands with shoes inside walker; top of walker reaches the wrist crease when arms are at the sides. Elbows flex ~15–30° when grasping handles.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 3, title: "Cane — sizing + side", body: "Top of cane reaches the wrist crease with arm at side. Hold cane on the STRONG side (opposite the affected leg). Advance cane and weak leg together; then advance strong leg.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 4, title: "Crutch gaits", body: "NWB → 3-point gait (both crutches + non-weight-bearing leg, then strong leg). PWB → 3-point modified or 2-point (advance opposite crutch + leg simultaneously). Fully weight-bearing → 4-point (slow, stable). Swing-through is fastest but advanced.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 5, title: "Stairs", body: "\"UP with the GOOD, DOWN with the BAD.\" Going UP — strong leg first, then bring crutches/weak leg up. Going DOWN — crutches and weak leg first, then strong leg. Use handrail when available; one crutch under arm, other in opposite hand.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 6, title: "Sitting and standing with assistive device", body: "Back up to chair until backs of legs touch; reach back for armrests with both hands; lower slowly. To stand, push up with both arms from armrests; do NOT use crutches/walker to push up.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 7, title: "Walker gait pattern", body: "Lift walker (or roll if wheeled), advance ~6–8 in / 15–20 cm; step weak leg into walker; then strong leg. Keep walker flat on the floor and stay INSIDE the walker frame. Do not use walker on stairs.", citationIDs: ["openrn_skills_round4"])
        ],
        postProcedure: [
            AttributedBullet("Demonstrate AND have patient teach-back the gait pattern, sizing checks, and stair rule before discharge.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Provide written discharge instructions; arrange home PT or follow-up per provider.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Reinforce home safety — remove rugs, clear walking paths, install grab bars, use night-lights.", citationIDs: ["openrn_skills_round4"])
        ],
        documentation: [
            AttributedBullet("Device prescribed, sizing, weight-bearing status, gait pattern observed, distance ambulated, stability, pain, education provided, teach-back results.", citationIDs: ["openrn_skills_round4"])
        ],
        watchFor: [
            AttributedBullet("AXILLARY (CRUTCH) PALSY — patient leaning on axillary pad → brachial-plexus / radial-nerve injury. Reinforce weight on HANDS.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("FALL — orthostatic, pain, weakness, fatigue, slick footwear; teach to sit and rest before fatigue.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Cane on WRONG side → unstable gait; reinforce strong-side use.", citationIDs: ["openrn_skills_round4"])
        ],
        citations: [openrnSkR4, openstaxSkR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bladder Scan (Portable Ultrasound)

public enum BladderScanSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "bladder-scan",
        title: "Bladder scan (portable ultrasound)",
        subtitle: "Non-invasive post-void residual · retention assessment",
        nclexTags: elimR4,
        indications: AttributedProse(
            "Non-invasive measurement of bladder volume — post-void residual (PVR) assessment, retention screening, evaluation of voiding complaints, urgency to determine catheterization need (post-op, post-epidural, post-anesthesia, neurogenic bladder).",
            citationIDs: ["openrn_skills_round4", "openstax_skills_round4"]
        ),
        contraindications: AttributedProse(
            "Open abdominal wounds over scan area, recent abdominal surgery with sutures or drains over the scan window, advanced pregnancy (gravid uterus interferes with reading). Obesity and ascites may reduce accuracy.",
            citationIDs: ["openrn_skills_round4"]
        ),
        equipment: [
            AttributedBullet("Portable bladder scanner with charged battery and clean transducer.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Ultrasound gel.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Disinfectant wipes for transducer per facility / manufacturer.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Tissue or towel; gloves.", citationIDs: ["openrn_skills_round4"])
        ],
        preProcedure: [
            AttributedBullet("Confirm provider order or facility protocol (\"PVR after voiding\" is a common nursing-driven order set).", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Provide privacy; explain procedure (painless, similar to obstetric ultrasound).", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Position patient supine with abdomen exposed from umbilicus to symphysis pubis.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Verify gender setting on the scanner (some devices) — affects calculation in patients with prior hysterectomy per primary source.", citationIDs: ["openrn_skills_round4"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene + don gloves", body: "Hand hygiene per primary source; don clean gloves.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 2, title: "Apply gel", body: "Apply a generous amount of ultrasound gel ~1 in (2.5 cm) above the symphysis pubis in the midline.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 3, title: "Position transducer", body: "Place transducer over the gel, midline, with the device icon (often a head) pointing toward the patient's head. Aim slightly toward the symphysis pubis (caudally, ~10° angle).", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 4, title: "Scan + adjust for centering", body: "Press SCAN. Aim transducer until the bladder is centered in the crosshairs on the screen. Re-scan if centering is off — a non-centered scan UNDERESTIMATES volume.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 5, title: "Record reading", body: "Note volume in mL. Repeat once or twice and use highest reading per primary source.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 6, title: "Clean and store", body: "Wipe gel from patient. Clean transducer with disinfectant per manufacturer. Plug scanner into charger.", citationIDs: ["openrn_skills_round4"])
        ],
        postProcedure: [
            AttributedBullet("Compare to facility / provider threshold — typical retention thresholds prompting straight catheterization range from 300–500 mL post-void per primary source / facility policy.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Reassess for urgency, distension, pain; trend serial PVRs if retention is being managed.", citationIDs: ["openrn_skills_round4"])
        ],
        documentation: [
            AttributedBullet("Date / time, indication, volume, position, patient response, action taken (straight cath, recheck, notify provider).", citationIDs: ["openrn_skills_round4"])
        ],
        watchFor: [
            AttributedBullet("FALSE LOW reading — off-center scan, body habitus, pelvic surgery; if clinical suspicion of retention persists despite a low reading, escalate or use catheterization.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Acute retention — distended bladder, pain, agitation; do not delay catheterization waiting on imaging.", citationIDs: ["openrn_skills_round4"])
        ],
        citations: [openrnSkR4, openstaxSkR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Mechanical Lift (Hoyer / Sit-to-Stand)

public enum MechanicalLiftSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "mechanical-lift",
        title: "Mechanical lift use (Hoyer / sit-to-stand)",
        subtitle: "Safe patient handling · two-person · sling sizing",
        nclexTags: mobilityR4,
        indications: AttributedProse(
            "Safe transfer of dependent patients between bed, chair, commode, or stretcher when manual transfer would risk patient or staff injury. Standard for non-weight-bearing, partially-weight-bearing-with-impaired-balance, very heavy, post-stroke, or sedated patients.",
            citationIDs: ["openrn_skills_round4", "openstax_skills_round4"]
        ),
        contraindications: AttributedProse(
            "Sit-to-stand lift requires patient to bear at least partial weight, follow commands, and have adequate trunk strength — do NOT use sit-to-stand for fully dependent or unconscious patients (use full-body sling). Avoid lifts with unstable spinal injury until cleared.",
            citationIDs: ["openrn_skills_round4"]
        ),
        equipment: [
            AttributedBullet("Mechanical lift — full-body (Hoyer-style) OR sit-to-stand — with charged battery, intact frame.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Properly sized sling — full-body U-sling or commode-cut for full lift; vest sling for sit-to-stand. Inspect for fraying or damage.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Two trained staff (one to operate, one to guide).", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Destination prepared — chair locked, bed at correct height.", citationIDs: ["openrn_skills_round4"])
        ],
        preProcedure: [
            AttributedBullet("Assess patient — weight (verify lift weight capacity), cognition, weight-bearing, pain, lines/tubes, skin integrity.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Explain procedure; obtain cooperation as able.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Inspect lift — battery charge, brake, hooks, sling.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Two-person check before any lift (verify sling attachment, lock wheels at appropriate moments).", citationIDs: ["openrn_skills_round4"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Position sling under patient", body: "FULL-BODY: log-roll patient side-to-side and tuck sling beneath; ensure top edge is at shoulders, leg straps under thighs (cross or do not cross per facility — typically CROSS leg straps for women / DO NOT cross for men with catheter to protect skin per primary source).", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 2, title: "Position lift", body: "Open the legs of the lift base for stability; roll lift over the bed (full lift) or in front of patient (sit-to-stand). Lower the boom; attach sling loops to hooks per length-coded loops (\"head loops in upper hook, leg loops in lower hook\" per device).", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 3, title: "Slowly raise patient — verify before clearing bed", body: "Raise just until sling is taut and patient's weight is supported. STOP. Verify all attachments, sling positioning, no pinching, lines clear. Then continue raising until patient is just clear of the bed.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 4, title: "Transfer slowly", body: "UNLOCK wheels of the LIFT (chair brakes stay locked). One staff member pushes lift; second guides patient and prevents swinging. Move slowly across short distances.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 5, title: "Position over destination", body: "Position lift over chair / bed / commode; lower patient slowly. Guide hips into seat. Verify patient is centered and stable before unhooking.", citationIDs: ["openrn_skills_round4"]),
            ProcedureStep(number: 6, title: "Unhook and assess", body: "Unhook sling loops. Sling typically remains under patient (or remove if going to bed for skin integrity per primary source). Assess comfort, position, lines. Unlock chair/bed wheels appropriately for patient mobility.", citationIDs: ["openrn_skills_round4"])
        ],
        postProcedure: [
            AttributedBullet("Plug lift into charger when not in use.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Inspect skin under sling at next routine assessment — pressure-injury risk.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("Document tolerance and any difficulties.", citationIDs: ["openrn_skills_round4"])
        ],
        documentation: [
            AttributedBullet("Type of lift, sling size, two-person assist, destination, tolerance, lines/tubes intact post-transfer.", citationIDs: ["openrn_skills_round4"])
        ],
        watchFor: [
            AttributedBullet("FALL during transfer — lift moves while sling not fully attached or wheels not locked at the right moment; STOP and fix before continuing.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("LINES / TUBES PULLED — central line, foley, IV, surgical drains; one staff dedicated to guarding lines.", citationIDs: ["openrn_skills_round4"]),
            AttributedBullet("SKIN INJURY from sling edges or pressure under sling left in place; reassess at next turn / repositioning.", citationIDs: ["openrn_skills_round4"])
        ],
        citations: [openrnSkR4, openstaxSkR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Adult Vaccine Schedule (CDC ACIP)

public enum AdultVaccineScheduleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "adult-vaccine-schedule",
        title: "Adult vaccine schedule (CDC ACIP)",
        subtitle: "Routine recommendations · age-based · catch-up notes",
        eyebrow: "REFERENCE · IMMUNIZATIONS",
        nclexTags: infectionR4,
        sections: [
            .prose(title: "Source", AttributedProse(
                "CDC's Advisory Committee on Immunization Practices (ACIP) publishes the annual Recommended Adult Immunization Schedule. The summary below reflects routine recommendations for adults at standard risk; CONSULT the current CDC schedule for risk-stratified recommendations, contraindications, and updates per primary source.",
                citationIDs: ["cdc_acip_round4"]
            )),
            .keyValueTable(title: "Routine adult vaccines (per CDC ACIP)", [
                KeyValueRow(key: "Influenza (annual)", value: "All adults ≥6 months, every season per primary source"),
                KeyValueRow(key: "Tdap / Td", value: "Tdap once for adults; then Td or Tdap booster every 10 years; Tdap every pregnancy (27–36 weeks) per primary source"),
                KeyValueRow(key: "MMR", value: "Adults born 1957 or later without immunity: 1–2 doses; healthcare workers and certain risk groups: 2 doses"),
                KeyValueRow(key: "Varicella", value: "Adults without immunity: 2-dose series (4–8 weeks apart)"),
                KeyValueRow(key: "Zoster (RZV / Shingrix)", value: "Adults ≥50 (and ≥19 if immunocompromised) — 2 doses 2–6 months apart per primary source"),
                KeyValueRow(key: "HPV", value: "Routine through age 26; shared decision-making age 27–45 per primary source"),
                KeyValueRow(key: "Pneumococcal (PCV/PPSV)", value: "Adults ≥65 OR younger with risk factors — current ACIP options include PCV20 alone or PCV15 + PPSV23 per primary source"),
                KeyValueRow(key: "COVID-19", value: "Per current CDC/ACIP recommendation, updated periodically — verify before administering"),
                KeyValueRow(key: "RSV", value: "Adults ≥75; adults 60–74 at increased risk; pregnancy (32–36 weeks during RSV season) per primary source"),
                KeyValueRow(key: "Hep A / Hep B", value: "Routine for at-risk adults; HepB universally recommended ages 19–59 per primary source"),
                KeyValueRow(key: "Meningococcal (MenACWY, MenB)", value: "Risk-based — asplenia, complement deficiency, college students, military, travel")
            ]),
            .keyValueTable(title: "Live vaccines — caution", [
                KeyValueRow(key: "Live attenuated", value: "MMR, varicella, zoster (Zostavax — phased out), live attenuated influenza (LAIV), yellow fever, oral typhoid, rotavirus"),
                KeyValueRow(key: "Avoid in", value: "Pregnancy; severe immunocompromise (HIV CD4 <200, transplant on calcineurin inhibitors, high-dose steroids per primary source)"),
                KeyValueRow(key: "Spacing", value: "If giving multiple live vaccines on the same day → administer same day; otherwise space ≥4 weeks per primary source")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Verify allergy and contraindication history before administering — anaphylaxis to a prior dose or component is an absolute contraindication.", citationIDs: ["cdc_acip_round4"]),
                AttributedBullet("Provide and document Vaccine Information Statement (VIS) — required by federal law before each vaccine.", citationIDs: ["cdc_acip_round4"]),
                AttributedBullet("Use IM deltoid for most adult vaccines; use SubQ for MMR and varicella per primary source.", citationIDs: ["cdc_acip_round4"]),
                AttributedBullet("Document in state immunization registry (IIS) per state law.", citationIDs: ["cdc_acip_round4"]),
                AttributedBullet("Educate on common reactions (sore arm, low-grade fever, fatigue 24–48 h) and warning signs (anaphylaxis, persistent high fever).", citationIDs: ["cdc_acip_round4"])
            ]),
            .prose(title: "Pregnancy notes", AttributedProse(
                "INDICATED in pregnancy: inactivated influenza, Tdap (every pregnancy 27–36 wk), RSV (32–36 wk during season). CONTRAINDICATED in pregnancy: live vaccines (MMR, varicella, LAIV, zoster). HepB is safe; HPV is generally deferred. COVID-19 vaccination is recommended in pregnancy per current ACIP guidance.",
                citationIDs: ["cdc_acip_round4"]
            ))
        ],
        citations: [cdcAcipR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pediatric Vaccine Schedule (CDC ACIP)

public enum PediatricVaccineScheduleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pediatric-vaccine-schedule",
        title: "Pediatric vaccine schedule (CDC ACIP)",
        subtitle: "Birth through 18 · routine timing · catch-up principles",
        eyebrow: "REFERENCE · IMMUNIZATIONS",
        nclexTags: infectionR4,
        sections: [
            .prose(title: "Source", AttributedProse(
                "CDC's Advisory Committee on Immunization Practices (ACIP) publishes the annual Recommended Child and Adolescent Immunization Schedule (birth through 18 years). The summary below reflects routine recommendations; CONSULT the current CDC schedule for catch-up scheduling, special populations, and contraindications per primary source.",
                citationIDs: ["cdc_acip_round4"]
            )),
            .keyValueTable(title: "Birth–6 months", [
                KeyValueRow(key: "Hep B", value: "Birth, 1–2 mo, 6–18 mo (3 doses)"),
                KeyValueRow(key: "RV (rotavirus, oral live)", value: "2 mo, 4 mo (± 6 mo per brand) — DO NOT START after 15 weeks"),
                KeyValueRow(key: "DTaP", value: "2, 4, 6 mo"),
                KeyValueRow(key: "Hib", value: "2, 4, (6) mo per brand"),
                KeyValueRow(key: "PCV", value: "2, 4, 6 mo"),
                KeyValueRow(key: "IPV (polio)", value: "2, 4 mo"),
                KeyValueRow(key: "Influenza", value: "Annual starting 6 mo; 2 doses first season"),
                KeyValueRow(key: "RSV (nirsevimab or maternal vaccine)", value: "Per current ACIP — passive immunization in RSV season")
            ]),
            .keyValueTable(title: "12 months–18 months", [
                KeyValueRow(key: "MMR", value: "1st dose 12–15 mo (live)"),
                KeyValueRow(key: "Varicella", value: "1st dose 12–15 mo (live)"),
                KeyValueRow(key: "Hep A", value: "2-dose series starting 12 mo, 6 mo apart"),
                KeyValueRow(key: "DTaP, Hib, PCV", value: "Booster doses 12–15 mo"),
                KeyValueRow(key: "IPV", value: "Booster 6–18 mo")
            ]),
            .keyValueTable(title: "4–6 years", [
                KeyValueRow(key: "DTaP", value: "5th dose"),
                KeyValueRow(key: "IPV", value: "4th dose"),
                KeyValueRow(key: "MMR", value: "2nd dose"),
                KeyValueRow(key: "Varicella", value: "2nd dose"),
                KeyValueRow(key: "Influenza", value: "Annual")
            ]),
            .keyValueTable(title: "11–18 years", [
                KeyValueRow(key: "Tdap", value: "Once, age 11–12"),
                KeyValueRow(key: "HPV", value: "Routine 11–12 (can start at 9); 2-dose if <15, 3-dose if ≥15 per primary source"),
                KeyValueRow(key: "MenACWY", value: "1st dose 11–12, booster 16"),
                KeyValueRow(key: "MenB", value: "Shared decision-making 16–23"),
                KeyValueRow(key: "Influenza, COVID-19", value: "Annual / per current recommendation")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Verify scheduled vaccines from state IIS; reconcile with parent record.", citationIDs: ["cdc_acip_round4"]),
                AttributedBullet("Provide VIS for each vaccine — required by federal law (NCVIA).", citationIDs: ["cdc_acip_round4"]),
                AttributedBullet("Use vastus lateralis IM for infants <12 mo; deltoid IM for older children/adolescents per primary source.", citationIDs: ["cdc_acip_round4"]),
                AttributedBullet("Comfort measures — breastfeeding during injection, sucrose, distraction, simultaneous administration to limit visits per primary source.", citationIDs: ["cdc_acip_round4"]),
                AttributedBullet("Educate caregivers — common reactions (low-grade fever, irritability, sore site); warning signs (high fever, persistent crying >3 h, anaphylaxis).", citationIDs: ["cdc_acip_round4"])
            ]),
            .prose(title: "Contraindications + precautions", AttributedProse(
                "Anaphylaxis to a prior dose or vaccine component is an absolute contraindication. Live vaccines (MMR, varicella, RV, LAIV) are contraindicated in severe immunocompromise. Encephalopathy within 7 days of pertussis is a contraindication to further pertussis-containing vaccine. Moderate or severe acute illness is a precaution — defer until improved per primary source.",
                citationIDs: ["cdc_acip_round4"]
            ))
        ],
        citations: [cdcAcipR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Therapeutic Diets

public enum TherapeuticDietsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "therapeutic-diets",
        title: "Therapeutic diets",
        subtitle: "Indications · examples · nursing notes",
        eyebrow: "REFERENCE · NUTRITION",
        nclexTags: nutritionR4,
        sections: [
            .prose(title: "Purpose", AttributedProse(
                "Therapeutic diets modify the texture, consistency, calorie content, or nutrient distribution of standard intake to support a clinical condition. Diet orders are placed by providers and managed by RDs; nurses verify, educate, and monitor tolerance.",
                citationIDs: ["openrn_nutrition_round4"]
            )),
            .keyValueTable(title: "Texture-modified diets", [
                KeyValueRow(key: "NPO", value: "Nothing by mouth — pre-op, post-op, severe N/V, dysphagia work-up, decreased LOC"),
                KeyValueRow(key: "Clear liquid", value: "Transparent fluids (broth, gelatin, apple juice, tea, popsicles); short-term post-op or pre-procedure; not nutritionally complete"),
                KeyValueRow(key: "Full liquid", value: "Adds milk, cream soups, ice cream, pudding; transition between clear and soft"),
                KeyValueRow(key: "Pureed", value: "Smooth, no chewing; severe dysphagia, oropharyngeal surgery"),
                KeyValueRow(key: "Mechanical soft / dental soft", value: "Easy-to-chew foods, ground meats; missing teeth, mild chewing difficulty"),
                KeyValueRow(key: "Dysphagia diets (IDDSI levels)", value: "International Dysphagia Diet Standardization Initiative — Level 0 thin liquids → Level 7 regular; SLP recommends per primary source"),
                KeyValueRow(key: "Regular / general", value: "No restrictions")
            ]),
            .keyValueTable(title: "Cardiac / metabolic diets", [
                KeyValueRow(key: "Low sodium (e.g., 2 g Na)", value: "HF, HTN, cirrhosis with ascites, CKD; avoid added salt, processed meats, canned soups"),
                KeyValueRow(key: "Heart-healthy / DASH", value: "HTN, CAD prevention; emphasizes fruits, vegetables, whole grains, lean protein, low saturated fat"),
                KeyValueRow(key: "Diabetic / consistent-carbohydrate", value: "DM; consistent grams of carbs per meal; coordinates with insulin per primary source"),
                KeyValueRow(key: "Low cholesterol / low fat", value: "Pancreatitis, gallbladder disease, hyperlipidemia"),
                KeyValueRow(key: "Renal", value: "CKD/dialysis — restrict K, phosphorus, sodium, sometimes protein and fluid; individualized by RD")
            ]),
            .keyValueTable(title: "GI / hepatic diets", [
                KeyValueRow(key: "Low fiber / low residue", value: "Acute IBD flare, post-op bowel surgery, diverticulitis acute phase"),
                KeyValueRow(key: "High fiber", value: "Constipation, diverticulosis (between flares), IBS-C, colon cancer prevention"),
                KeyValueRow(key: "Gluten-free", value: "Celiac disease — strict avoidance of wheat, rye, barley"),
                KeyValueRow(key: "Lactose-restricted", value: "Lactose intolerance"),
                KeyValueRow(key: "Hepatic encephalopathy", value: "Adequate protein with branched-chain amino acids; avoid severe protein restriction per primary source"),
                KeyValueRow(key: "FODMAP", value: "IBS — supervised elimination/reintroduction")
            ]),
            .keyValueTable(title: "Other clinical diets", [
                KeyValueRow(key: "Low potassium", value: "Hyperkalemia, CKD on dialysis (avoid bananas, oranges, potatoes, tomatoes per primary source)"),
                KeyValueRow(key: "Neutropenic / low microbial", value: "Severe immunocompromise — avoid raw fruits/veg, undercooked meats/eggs, soft cheeses per primary source"),
                KeyValueRow(key: "Tyramine-restricted", value: "MAOI therapy — avoid aged cheese, cured meats, fermented soy, draft beer, fava beans, soy sauce per primary source"),
                KeyValueRow(key: "Vitamin K-consistent", value: "Warfarin — keep intake stable, not necessarily restricted; AVOID dramatic changes"),
                KeyValueRow(key: "High calorie / high protein", value: "Wound healing, malnutrition, cachexia, burns")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Verify diet order on EVERY tray before serving — wrong-diet errors are common.", citationIDs: ["openrn_nutrition_round4"]),
                AttributedBullet("Confirm swallow status per SLP / provider for any patient with dysphagia risk before advancing.", citationIDs: ["openrn_nutrition_round4"]),
                AttributedBullet("Monitor intake (% meal eaten); communicate poor intake to provider/RD.", citationIDs: ["openrn_nutrition_round4"]),
                AttributedBullet("Educate patient and family on diet rationale, allowed/avoided foods, and how to maintain at home.", citationIDs: ["openrn_nutrition_round4"]),
                AttributedBullet("Coordinate with RD for individualized counseling, especially for renal, diabetic, and oncology patients.", citationIDs: ["openrn_nutrition_round4"])
            ])
        ],
        citations: [openrnNutR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sliding Scale Insulin

public enum SlidingScaleInsulinSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "sliding-scale-insulin",
        title: "Sliding scale insulin (correctional dosing)",
        subtitle: "Concept · ADA caution · safer alternatives",
        eyebrow: "REFERENCE · DIABETES",
        nclexTags: pharmR4,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Sliding scale insulin (SSI) refers to administering rapid- or short-acting insulin in pre-set doses based on the patient's current point-of-care blood glucose, without a true basal-bolus structure. Historically common for inpatient hyperglycemia, SSI alone is now considered LESS effective than scheduled basal-bolus + correction in most hospitalized patients per primary source.",
                citationIDs: ["ada_concept_round4", "openrn_skills_round4"]
            )),
            .keyValueTable(title: "Typical orders use one of these scales (FACILITY-SPECIFIC)", [
                KeyValueRow(key: "Low scale", value: "Insulin-sensitive — older adults, CKD, low body weight; smaller doses"),
                KeyValueRow(key: "Moderate scale", value: "Most general medical patients"),
                KeyValueRow(key: "High scale", value: "Insulin-resistant — obese, on steroids, type 2 with high TDD")
            ]),
            .keyValueTable(title: "Example moderate scale (illustrative — DO NOT use without verifying facility order set)", [
                KeyValueRow(key: "BG <70 mg/dL", value: "HOLD insulin; treat hypoglycemia per protocol"),
                KeyValueRow(key: "BG 70–150", value: "0 units"),
                KeyValueRow(key: "BG 151–200", value: "2 units rapid-acting"),
                KeyValueRow(key: "BG 201–250", value: "4 units"),
                KeyValueRow(key: "BG 251–300", value: "6 units"),
                KeyValueRow(key: "BG 301–350", value: "8 units"),
                KeyValueRow(key: "BG 351–400", value: "10 units"),
                KeyValueRow(key: "BG >400", value: "Notify provider; per protocol")
            ]),
            .bullets(title: "Why basal-bolus is preferred (per ADA)", [
                AttributedBullet("SSI alone reacts to hyperglycemia AFTER it occurs — basal-bolus PREVENTS it by matching insulin to anticipated needs.", citationIDs: ["ada_concept_round4"]),
                AttributedBullet("RABBIT 2 trial (Umpierrez et al.) showed basal-bolus reduced glycemic variability, lower mean BG, and fewer complications than SSI alone in non-ICU patients.", citationIDs: ["ada_concept_round4"]),
                AttributedBullet("Current ADA standard for hospital hyperglycemia: scheduled basal + nutritional + correction insulin; SSI alone discouraged for most patients per primary source.", citationIDs: ["ada_concept_round4"])
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Verify the ORDER SET on this patient — facility scales differ; never extrapolate.", citationIDs: ["openrn_skills_round4"]),
                AttributedBullet("Check BG within ~30 min before meals (or per protocol); coordinate with meal delivery so insulin and food align.", citationIDs: ["openrn_skills_round4"]),
                AttributedBullet("Hold or reduce insulin if patient is NPO, has held a meal, has acute kidney injury, or is hypoglycemic.", citationIDs: ["openrn_skills_round4"]),
                AttributedBullet("Recheck BG within 15 min of treating hypoglycemia (15-15 rule per primary source: 15 g fast carb, recheck in 15 min, repeat if <70).", citationIDs: ["openrn_skills_round4"]),
                AttributedBullet("Document — BG value, units administered, site rotated, time of last meal, time and route.", citationIDs: ["openrn_skills_round4"])
            ]),
            .prose(title: "Watch for", AttributedProse(
                "Hypoglycemia is the most common adverse event with insulin; double-check dose with a second nurse for high-alert insulin per ISMP. Pump and infusion errors are sentinel events; verify rates and concentrations at every handoff. Communicate persistent BG >250 or <70 to the provider for orders to revise the scale or transition to basal-bolus per ADA.",
                citationIDs: ["ada_concept_round4", "openrn_skills_round4"]
            ))
        ],
        citations: [openrnSkR4, adaConceptR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}
