import Foundation

// Curator-model scenarios — AHRQ TeamSTEPPS / PSNet patient-safety case format.
// All citations are license-correct (AHRQ public-domain case repository, CDC
// public-domain, Open RN CC BY 4.0, NIH/NINDS public-domain). Tier-A RN review
// pending pre-launch for high-stakes scenarios (peds DKA, PPH, stroke).

private let ahrqScenarios3 = CitationSource(
    id: "ahrq_teamstepps_scenarios_3",
    shortName: "AHRQ TeamSTEPPS — Patient Safety Case Scenarios",
    detail: "AHRQ TeamSTEPPS course materials and patient-safety case studies",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/teamstepps-program/index.html",
    lastRetrieved: "2026-05-04"
)

private let ahrqPSNet3 = CitationSource(
    id: "ahrq_psnet_3",
    shortName: "AHRQ Patient Safety Network — Cases & Commentaries",
    detail: "AHRQ peer-reviewed patient-safety case repository",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://psnet.ahrq.gov/",
    lastRetrieved: "2026-05-04"
)

private let openrnScenarios = CitationSource(
    id: "openrn_scenarios",
    shortName: "Open RN — Health Alterations clinical reference chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=hyperkalemia+stroke+pediatric+postpartum",
    lastRetrieved: "2026-05-04"
)

private let nindsScenarios = CitationSource(
    id: "ninds_stroke_scenarios",
    shortName: "NIH/NINDS — Know Stroke Campaign (Recognition & Time)",
    publisher: "National Institute of Neurological Disorders and Stroke",
    license: .publicDomain,
    url: "https://www.ninds.nih.gov/health-information/public-education/know-stroke",
    lastRetrieved: "2026-05-04"
)

private let scenarioTags3 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

// MARK: - Pediatric DKA

public enum PediatricDKAScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "peds-dka-scenario",
        title: "Pediatric DKA — delayed recognition",
        subtitle: "When kids get sicker faster than their numbers do",
        eyebrow: "SCENARIO · PEDS",
        nclexTags: scenarioTags3,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 9-year-old girl with newly-diagnosed type 1 diabetes is admitted from the ED for management of hyperglycemia (BG 480) and ketonuria. On arrival, she is alert, complaining of abdominal pain. The admitting nurse notes Kussmaul respirations (RR 32, deep) but the BP is 102/64 and HR 118 — within facility 'pediatric tachycardia' thresholds for her age band when crying. Insulin drip is started per DKA protocol. Two hours in, a CNA reports the child is 'sleepier.' The nurse attributes this to her being tired, finishes a 4-patient med pass, and returns 30 minutes later to find the child unresponsive, pupils sluggish. Rapid response: cerebral edema. PICU transfer. The child survives with no permanent deficit, but the case becomes a sentinel event review.",
                citationIDs: ["ahrq_psnet_3", "openrn_scenarios"]
            )),
            .bullets(title: "What went wrong — pediatric pitfalls", [
                AttributedBullet("Kussmaul respirations were not recognized as the body's compensation for severe metabolic acidosis. Tachypnea was treated as 'normal post-stress' rather than ominous.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("Vital sign trends were not interpreted in pediatric context. HR 118 in a 9-year-old at rest is concerning even though it's within the upper range of an awake child.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("The CNA's report of 'sleepier' was not treated as a clinical change. Mental status decline in pediatric DKA is the earliest sign of cerebral edema.", citationIDs: ["ahrq_teamstepps_scenarios_3"]),
                AttributedBullet("Fluid replacement may have been too rapid — pediatric DKA fluid resuscitation is deliberately slower than adult to reduce cerebral edema risk (typically not exceeding 1.5–2× maintenance over the first 24 hours).", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("Frequency of neuro checks was insufficient — pediatric DKA standard is hourly neuro assessments minimum during the first 12–24 hr.", citationIDs: ["openrn_scenarios"])
            ]),
            .bullets(title: "What good team performance would have looked like", [
                AttributedBullet("Recognize Kussmaul as a compensation, not a pattern to ignore. Severe acidosis with mental status change = neuro emergency.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("Pediatric DKA-specific protocol: hourly neuro checks (LOC, headache, vision, pupils, motor), strict I&O, sodium-corrected glucose tracking, slow correction of glucose (target 50–100 mg/dL/hr drop, NOT faster).", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("CUS the change: 'I'm Concerned — she's getting sleepier with metabolic acidosis being corrected. I want a provider at the bedside.'", citationIDs: ["ahrq_teamstepps_scenarios_3"]),
                AttributedBullet("Empower CNA's report — concerning observations from any team member trigger reassessment, not dismissal.", citationIDs: ["ahrq_teamstepps_scenarios_3"]),
                AttributedBullet("Have mannitol or 3% saline pre-prepared and immediately accessible per pediatric DKA protocol — cerebral edema treatment cannot wait for pharmacy.", citationIDs: ["openrn_scenarios"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Pediatric DKA is one of the highest-stakes ICU-like situations on a med-surg or step-down unit. Cerebral edema kills or disables ~1% of pediatric DKA admissions, and the warning sign is mental status change — sometimes hours before more dramatic findings. Hourly neuro checks, sodium-corrected glucose trends, and immediate CUS escalation for any LOC change are the safety net. \"She's just sleepy from being sick\" is the wrong default for any DKA patient.",
                citationIDs: ["openrn_scenarios", "ahrq_psnet_3"]
            ))
        ],
        citations: [ahrqScenarios3, ahrqPSNet3, openrnScenarios],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Postpartum Hemorrhage

public enum PostpartumHemorrhageScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pph-scenario",
        title: "Postpartum hemorrhage — quantifying blood loss too late",
        subtitle: "Eyeballed estimates miss the bleed until the patient crashes",
        eyebrow: "SCENARIO · OB",
        nclexTags: scenarioTags3,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 28-year-old G2P2 woman delivers a healthy term infant via uncomplicated vaginal birth. Estimated blood loss in the delivery room is documented as '500 mL.' She is transferred to postpartum 90 minutes later. The receiving nurse notes she is pale and reports 'feeling tired,' attributing both to a long labor. Vital signs: BP 102/58 (down from 124/72 antepartum), HR 112, RR 22. Fundus is 'firm-ish, displaced to right.' The nurse helps her to the bathroom; she stands, says 'I feel dizzy,' and slumps back to the bed. A second nurse pulls back the sheet — the bed pad is saturated and a clot the size of a softball is on the floor. Rapid response. Two units PRBC, oxytocin maximized, methylergonovine given. Patient stabilizes. Quantified blood loss is recalculated: ~1800 mL.",
                citationIDs: ["ahrq_psnet_3", "openrn_scenarios"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Visual estimation of blood loss is consistently inaccurate — typically underestimates by 30–50%. The 500 mL EBL was likely 700–800 mL at delivery alone.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("Tachycardia (HR 112) was the early warning. Pregnancy/postpartum patients often maintain BP until late, then crash. HR is the more sensitive sign.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("'Firm-ish' is not firm. Boggy or displaced fundus + saturating lochia = atony. The displacement to right suggested full bladder — a known atony driver.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("'Feeling tired' and pallor were dismissed as post-labor fatigue. In a postpartum patient with declining vitals, those are hypovolemia until proven otherwise.", citationIDs: ["ahrq_psnet_3"]),
                AttributedBullet("Standing without orthostatic check; the syncope was preventable.", citationIDs: ["openrn_scenarios"])
            ]),
            .bullets(title: "What good team performance would have looked like", [
                AttributedBullet("Quantified blood loss (QBL) instead of visual estimate — weigh pads, drapes, sponges (1 g = 1 mL).", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("Treat any postpartum HR >110 as a red flag, even with normal-looking BP. Trended vitals matter more than discrete values.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("Empty the bladder first when fundus is boggy or displaced — straight cath if needed. Then massage. Then escalate.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("First-time ambulation postpartum: orthostatic vitals, walk with assistance, no further than the chair.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("CUS escalation with the trend: 'I'm Concerned — her HR is 112, BP dropped from 124 to 102, fundus is not firm, lochia heavy. I'm activating the OB rapid response.'", citationIDs: ["ahrq_teamstepps_scenarios_3"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "PPH is the leading cause of preventable maternal death worldwide, and the most common pattern is one of underestimated bleeding compounded by delayed recognition. Quantified blood loss, structured fundal/lochia/vital sign assessment every 15 minutes for the first hour postpartum, and a low threshold for activating uterotonic protocols are the saves. When in doubt, escalate — postpartum patients can lose half their blood volume before classic shock signs appear.",
                citationIDs: ["openrn_scenarios", "ahrq_psnet_3"]
            ))
        ],
        citations: [ahrqScenarios3, ahrqPSNet3, openrnScenarios],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Stroke Alert

public enum StrokeAlertScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "stroke-alert-scenario",
        title: "Stroke alert — clock starts at last known well",
        subtitle: "tPA window vs. real-world delays",
        eyebrow: "SCENARIO · ED",
        nclexTags: scenarioTags3,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 62-year-old woman is brought to the ED at 14:00 by her husband, who reports she 'started slurring her words' at 13:30. Triage notes her smiling face is asymmetric and her right arm drifts when held up. The triage nurse marks her as ESI Level 2 and queues her for a CT. The CT scanner is busy — finishing another patient. Forty-five minutes pass before she's scanned. CT is negative for hemorrhage. tPA is given at 16:45 — 3 hours and 15 minutes from last known well. She survives with significant residual right-arm weakness; the stroke team concludes she likely would have had better recovery with earlier tPA.",
                citationIDs: ["ahrq_psnet_3", "ninds_stroke_scenarios"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("The clock for tPA window starts at LAST KNOWN WELL, not symptom recognition or arrival. Many systems lose hours by mis-anchoring the clock.", citationIDs: ["ninds_stroke_scenarios"]),
                AttributedBullet("Stroke alert was not activated at triage. ESI Level 2 is correct, but stroke alert ladders should bypass routine queueing — straight to CT.", citationIDs: ["ahrq_teamstepps_scenarios_3"]),
                AttributedBullet("CT scanner availability was treated as a fixed constraint. Stroke alerts should bump the scanner queue.", citationIDs: ["ahrq_teamstepps_scenarios_3"]),
                AttributedBullet("NIHSS was not done at the bedside while waiting — assessment and CT request can run in parallel.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("IV access, labs (glucose, coags, CBC), and weight could all have happened in parallel; serial steps cost time.", citationIDs: ["openrn_scenarios"])
            ]),
            .bullets(title: "What good team performance would have looked like", [
                AttributedBullet("BE FAST recognition by triage: Balance, Eyes, Face, Arms, Speech, Time. Any positive sign + symptom onset within 4.5 hr = stroke alert activation.", citationIDs: ["ninds_stroke_scenarios"]),
                AttributedBullet("Door-to-CT goal <25 min, CT-read <45 min, door-to-needle <60 min.", citationIDs: ["ninds_stroke_scenarios"]),
                AttributedBullet("Stroke alert paged immediately on arrival — bypasses normal triage queue, scanner, and lab workflow.", citationIDs: ["ahrq_teamstepps_scenarios_3"]),
                AttributedBullet("Parallel actions: NIHSS at bedside, IV × 2, labs (POC glucose, BMP, coags, CBC, type/screen), weight (for tPA dosing), 12-lead EKG, NPO status. Stroke nurse runs the workflow.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("Last-known-well documented to the minute — interview the witness rigorously. \"When did you last see her acting normally?\"", citationIDs: ["ninds_stroke_scenarios"]),
                AttributedBullet("If thrombectomy candidate (large vessel occlusion suspected by NIHSS ≥6 + cortical signs), parallel CTA and neurointerventional notification.", citationIDs: ["ninds_stroke_scenarios"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Time is brain — every minute, an estimated 1.9 million neurons die during ischemic stroke. Door-to-needle <60 minutes is the system-level metric, but the cultural shift is: stroke alert protocols bypass normal workflows. Rigorously establish last-known-well at the bedside before anything else. Parallel, not serial, is the only acceptable mode.",
                citationIDs: ["ninds_stroke_scenarios", "openrn_scenarios"]
            ))
        ],
        citations: [ahrqScenarios3, ahrqPSNet3, openrnScenarios, nindsScenarios],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hyperkalemia + EKG

public enum HyperkalemiaScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "hyperkalemia-ekg-scenario",
        title: "Hyperkalemia — when the EKG won't wait for the lab",
        subtitle: "Sentinel value vs. trended panel",
        eyebrow: "SCENARIO · MED-SURG",
        nclexTags: scenarioTags3,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 71-year-old man with CKD stage 4 is admitted from the dialysis center after missing yesterday's session. Morning labs return: K+ 7.2, creatinine 6.8, bicarb 18. The lab calls the floor as a critical value at 09:30. The nurse pulls up the chart, notes the patient is 'awake and conversing,' and calls the nephrologist's office; the office puts her on hold. While on hold, the nurse goes to give 09:00 medications to another patient. At 09:50 the patient's monitor alarms — wide complex bradycardia. The nurse sprints back, finds him with peaked T waves on the strip, and pages the rapid response. Calcium gluconate is given, insulin and dextrose, albuterol nebulizer. EKG normalizes. Emergency dialysis is arranged. Patient survives.",
                citationIDs: ["ahrq_psnet_3", "openrn_scenarios"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("K+ 7.2 with CKD is a true emergency — \"awake and conversing\" can deteriorate to V-fib in minutes. Patient appearance does not match potassium-related cardiac risk.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("Telephone tag with nephrology was treated as the next step. The floor protocol should have gotten a provider AT THE BEDSIDE, with rapid response activation if delays.", citationIDs: ["ahrq_teamstepps_scenarios_3"]),
                AttributedBullet("EKG was not obtained immediately on receiving the critical K+ value. The first action for K+ ≥6 should be a 12-lead and continuous monitoring.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("Calcium gluconate was not pre-positioned at the bedside while waiting for orders. Pharmacy delivery times can cost the patient.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("The nurse left the patient to do other med pass — for a critical-value emergency, that's incompatible with safe practice.", citationIDs: ["ahrq_teamstepps_scenarios_3"])
            ]),
            .bullets(title: "What good team performance would have looked like", [
                AttributedBullet("On critical K+ ≥6: stay with the patient, place on continuous cardiac monitor, get a 12-lead EKG within minutes — peaked T waves, widened QRS, prolonged PR are red flags requiring immediate calcium gluconate.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("Activate rapid response (or charge nurse) at the bedside if provider not immediately reachable.", citationIDs: ["ahrq_teamstepps_scenarios_3"]),
                AttributedBullet("Pre-position emergency medications at the bedside — calcium gluconate (membrane stabilization), regular insulin + D50 (intracellular shift), albuterol neb (intracellular shift), kayexalate or patiromer (excretion). Order does matter — calcium first.", citationIDs: ["openrn_scenarios"]),
                AttributedBullet("CUS on the phone if the office hesitates: 'I'm Concerned about a K+ of 7.2 in a CKD patient. I need a provider in the room or I'm activating rapid response.'", citationIDs: ["ahrq_teamstepps_scenarios_3"]),
                AttributedBullet("Notify dialysis early — definitive treatment is removal, not just intracellular shift.", citationIDs: ["openrn_scenarios"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Critical lab values are not just numbers to document and call about — they are clinical emergencies that change the priority of the entire shift. A patient who looks well with K+ 7.2 is one ectopic away from V-fib. EKG-first, calcium gluconate as bridge, dialysis as definitive: that's the algorithm. Anyone who stays calm in the face of potassium ≥6 is dangerous. Move with urgency.",
                citationIDs: ["openrn_scenarios", "ahrq_psnet_3"]
            ))
        ],
        citations: [ahrqScenarios3, ahrqPSNet3, openrnScenarios],
        lastSourceFidelityReview: "2026-05-04"
    )
}
