import Foundation

// Curator-model scenarios — AHRQ TeamSTEPPS / PSNet patient-safety case format.
// Batch 4 targets the Management of Care gap (prioritization, delegation) plus
// classic deterioration archetypes not yet covered (anaphylaxis, transfusion
// reaction, opioid oversedation, hypoglycemia, covert hemorrhage, PE, suicide
// risk, chest tube emergency). All citations license-correct (AHRQ public
// domain, Open RN CC BY 4.0). Tier-A RN review pending pre-publication for the
// emergency-response scenarios (anaphylaxis, transfusion reaction, chest tube).

private let ahrqScenarios4 = CitationSource(
    id: "ahrq_teamstepps_scenarios_4",
    shortName: "AHRQ TeamSTEPPS — Patient Safety Case Scenarios",
    detail: "AHRQ TeamSTEPPS course materials and patient-safety case studies",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/teamstepps-program/index.html",
    lastRetrieved: "2026-07-03"
)

private let ahrqPSNet4 = CitationSource(
    id: "ahrq_psnet_4",
    shortName: "AHRQ Patient Safety Network — Cases & Commentaries",
    detail: "AHRQ peer-reviewed patient-safety case repository",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://psnet.ahrq.gov/",
    lastRetrieved: "2026-07-03"
)

private let openrnScenarios4 = CitationSource(
    id: "openrn_scenarios_4",
    shortName: "Open RN — Nursing Fundamentals & Health Alterations chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingfundamentals/",
    lastRetrieved: "2026-07-03"
)

private let openrnManagement = CitationSource(
    id: "openrn_management_4",
    shortName: "Open RN — Nursing Management & Professional Concepts",
    detail: "Delegation, supervision, and prioritization frameworks",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingmanagement/",
    lastRetrieved: "2026-07-03"
)

private let mocTags = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

// MARK: - Prioritization: four patients, one nurse

public enum PrioritizationScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "prioritization-scenario",
        title: "Prioritization — four patients, one nurse",
        subtitle: "Who do you see first, and why the loudest need isn't the greatest",
        eyebrow: "SCENARIO · MANAGEMENT OF CARE",
        nclexTags: mocTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A night-shift nurse takes handoff on four patients: (1) a COPD patient on 2L home O2 with SpO2 88% — charted baseline 88–90%; (2) a post-op day 1 hip replacement reporting pain 8/10, whose family is at the desk asking for the nurse; (3) an NSTEMI patient on a heparin infusion who the off-going nurse mentions 'seemed a little sweaty' at final rounds; (4) a stable cellulitis patient due for a scheduled antibiotic. The nurse goes to the hip patient first — the family is present and frustrated. Forty minutes later, the monitor tech calls: the NSTEMI patient has ST changes and is now diaphoretic with chest pressure 6/10. Rapid response; the patient goes emergently to cath lab.",
                citationIDs: ["ahrq_psnet_4", "openrn_management_4"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("The squeaky wheel set the priority. Family presence and audible complaints are real pressures, but they are not acuity. Pain 8/10 in a stable post-op patient is urgent — not emergent.", citationIDs: ["openrn_management_4"]),
                AttributedBullet("'Seemed a little sweaty' in an active cardiac patient was a red-flag handoff cue that never got a bedside assessment. New diaphoresis in ACS is ischemia until proven otherwise.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("The COPD patient's SpO2 88% was correctly deprioritized — chronic abnormal at baseline beats acute change nowhere. The error wasn't seeing patient 1 last; it was seeing patient 3 late.", citationIDs: ["openrn_management_4"]),
                AttributedBullet("No first-round eyeball sweep. A 60-second doorway assessment of all four patients before settling into any room would have caught the diaphoresis immediately.", citationIDs: ["ahrq_teamstepps_scenarios_4"])
            ]),
            .bullets(title: "A framework that works", [
                AttributedBullet("ABCs first, then acute-over-chronic, then unstable-over-stable, then actual-over-potential problems. A patient with a possible new ischemic change outranks severe pain in a stable patient.", citationIDs: ["openrn_management_4"]),
                AttributedBullet("Distinguish 'abnormal' from 'abnormal FOR THIS PATIENT.' SpO2 88% at a COPD patient's documented baseline is expected; new diaphoresis on a heparin drip is not.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Round on every patient within the first hour — a brief look, monitor check, and 'anything new?' before deep work begins anywhere.", citationIDs: ["openrn_management_4"]),
                AttributedBullet("Treat vague handoff cues ('seemed off,' 'a little sweaty') as assignments, not color commentary. Ask the off-going nurse: when, compared to what, and did anyone assess it?", citationIDs: ["ahrq_teamstepps_scenarios_4"]),
                AttributedBullet("Delegate the deliverable pain response — the CNA can reposition and provide comfort measures while the nurse assesses the cardiac patient, then returns to medicate.", citationIDs: ["openrn_management_4"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Prioritization failures rarely look like negligence in the moment — they look like responsiveness. The nurse who goes straight to the loudest request feels attentive. The discipline is running the acuity sort first: airway-breathing-circulation, acute over chronic, unstable over stable — and doing a rapid first-hour sweep of every assigned patient before any single room absorbs you.",
                citationIDs: ["openrn_management_4", "ahrq_psnet_4"]
            ))
        ],
        citations: [ahrqScenarios4, ahrqPSNet4, openrnScenarios4, openrnManagement],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Delegation: the task that wasn't delegable

public enum DelegationScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "delegation-scenario",
        title: "Delegation — the task that wasn't delegable",
        subtitle: "Five rights of delegation, learned the hard way",
        eyebrow: "SCENARIO · MANAGEMENT OF CARE",
        nclexTags: mocTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A med-surg nurse with a heavy assignment asks a CNA to 'get the new post-op up to the chair' — a patient six hours out from abdominal surgery who has not yet ambulated. The CNA, experienced and willing, gets the patient to the edge of the bed alone. On standing, the patient goes pale, says 'I don't feel right,' and slides to the floor in a near-syncope. No injury on exam, but an incident report follows. The review finds the first post-op ambulation was never assessed by the RN: no orthostatic check, no pain/sedation review, no evaluation of whether this patient could safely transfer.",
                citationIDs: ["ahrq_psnet_4", "openrn_management_4"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("First post-op ambulation is an assessment-dependent activity. Assessment cannot be delegated — the RN needed to evaluate readiness before anyone moved the patient.", citationIDs: ["openrn_management_4"]),
                AttributedBullet("The instruction was vague: 'get them up' carried no parameters — no 'dangle first, check how they feel, two-person assist, stop if dizzy.'", citationIDs: ["openrn_management_4"]),
                AttributedBullet("Right circumstance failed: a first mobilization after anesthesia and blood loss is not a routine transfer, even though 'up to the chair' sounds like one.", citationIDs: ["openrn_management_4"]),
                AttributedBullet("No closed loop. The CNA never confirmed what to watch for or when to stop and report; the RN never followed up before the attempt.", citationIDs: ["ahrq_teamstepps_scenarios_4"])
            ]),
            .bullets(title: "The five rights of delegation, applied", [
                AttributedBullet("Right task — routine, repetitive, within the delegatee's scope, and not requiring nursing judgment mid-task. First post-op ambulation fails this test; subsequent stable ambulations may pass it.", citationIDs: ["openrn_management_4"]),
                AttributedBullet("Right circumstance — stable patient, predictable outcome. Fresh post-op with unassessed orthostatic status is neither.", citationIDs: ["openrn_management_4"]),
                AttributedBullet("Right person — match the task to this delegatee's demonstrated competence, not their general experience.", citationIDs: ["openrn_management_4"]),
                AttributedBullet("Right direction — specific, clear, with limits: what to do, what to watch for, when to stop, what to report, by when.", citationIDs: ["openrn_management_4"]),
                AttributedBullet("Right supervision — check progress, be available, evaluate the outcome. Delegation transfers the task, never the accountability.", citationIDs: ["openrn_management_4"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Delegation is a clinical skill, not a workload valve. The question is never 'is the CNA capable' — it's 'does this task, for this patient, right now, require nursing assessment or judgment?' If yes, the RN goes. The five rights turn that judgment into a repeatable checklist, and the closed-loop instruction — task, limits, red flags, report-back — is what makes delegation safe on a real unit.",
                citationIDs: ["openrn_management_4", "ahrq_psnet_4"]
            ))
        ],
        citations: [ahrqScenarios4, ahrqPSNet4, openrnScenarios4, openrnManagement],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Anaphylaxis: first dose

public enum AnaphylaxisScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "anaphylaxis-scenario",
        title: "Anaphylaxis — five minutes into the first dose",
        subtitle: "Why the nurse stays in the room, and epinephrine comes first",
        eyebrow: "SCENARIO · MED-SURG",
        nclexTags: mocTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 45-year-old admitted for cellulitis is started on a first-ever dose of IV piperacillin-tazobactam. The nurse hangs the infusion and moves on to the next room. Ten minutes later the patient rings: itching palms, then a tight throat and audible wheeze by the time the nurse arrives. The nurse stops the infusion, then leaves the room to page the provider from the nursing station. By the time orders come back, the patient is hypotensive with facial swelling. Rapid response is called; epinephrine is given IM per the facility's anaphylaxis protocol, followed by fluids, and the patient stabilizes after a brief ICU stay.",
                citationIDs: ["ahrq_psnet_4", "openrn_scenarios_4"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("First doses of high-risk IV antibiotics warrant early bedside observation. The first minutes of a first dose are exactly when severe reactions declare themselves.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("The nurse left a deteriorating airway alone to make a phone call. Stopping the infusion was right; leaving was not — call for help from the room.", citationIDs: ["ahrq_teamstepps_scenarios_4"]),
                AttributedBullet("Escalation ran through routine channels (page and wait) while the patient progressed from urticaria to airway involvement — that trajectory is a rapid-response trigger in itself.", citationIDs: ["ahrq_teamstepps_scenarios_4"]),
                AttributedBullet("Epinephrine was delayed. Antihistamines and steroids are adjuncts; epinephrine per protocol is the first-line treatment for anaphylaxis, and delay is the most common fatal error.", citationIDs: ["openrn_scenarios_4"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Know the pattern: skin symptoms plus any airway, breathing, or circulation involvement after an exposure = anaphylaxis. Two-system involvement doesn't need to wait for hypotension.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Stop the infusing agent, keep the line, stay with the patient, and activate help from the bedside — call light, phone in the room, or shout for a colleague.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Epinephrine IM per facility protocol as the immediate priority, positioned supine with legs elevated unless airway compromise dictates otherwise.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Anticipate the sequence: high-flow oxygen, IV fluids for hypotension, adjunct antihistamine/steroid orders, and continuous monitoring for biphasic recurrence over the following hours.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Afterward: allergy documented prominently, band applied, pharmacy notified — the next nurse should never be able to repeat the exposure.", citationIDs: ["ahrq_teamstepps_scenarios_4"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Anaphylaxis rewards the nurse who assumes the worst early. Itching after a new IV antibiotic is a stop-and-stay moment, not a note-and-move-on moment. The core sequence — stop the trigger, stay with the patient, summon help to the bedside, epinephrine first per protocol — outperforms every workflow that starts with leaving the room.",
                citationIDs: ["openrn_scenarios_4", "ahrq_psnet_4"]
            ))
        ],
        citations: [ahrqScenarios4, ahrqPSNet4, openrnScenarios4],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Transfusion reaction

public enum TransfusionReactionScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "transfusion-reaction-scenario",
        title: "Transfusion reaction — the verification that got skipped",
        subtitle: "Two-person checks exist because this is how it fails",
        eyebrow: "SCENARIO · MED-SURG",
        nclexTags: mocTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "Two units of PRBCs arrive on a busy evening for two different patients on the same hallway. The assigned nurse can't find a second RN free, verifies the first unit alone 'to save time,' and hangs it. Fifteen minutes in, the patient develops fever, chills, flank pain, and dark urine. The nurse stops the transfusion, disconnects the blood tubing at the hub, runs normal saline through new tubing, and calls a rapid response. Re-verification at the bedside reveals the unit was crossmatched for the other patient. The patient survives an acute hemolytic reaction with a short ICU stay for monitoring and aggressive hydration.",
                citationIDs: ["ahrq_psnet_4", "openrn_scenarios_4"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Independent two-person verification at the bedside was skipped. Every element — patient ID band, unit number, blood type, expiration, crossmatch record — exists to catch exactly this swap.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Two units for two patients arriving together is a known high-risk setup; the moment demanded more verification rigor, not less.", citationIDs: ["ahrq_psnet_4"]),
                AttributedBullet("Workload pressure was allowed to compress a safety-critical step. 'I couldn't find a second nurse' is a staffing escalation, not a permission slip.", citationIDs: ["ahrq_teamstepps_scenarios_4"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Two qualified staff verify at the bedside, against the patient's ID band, every time — no exceptions, no verifying at the nursing station.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Stay with the patient for the initial portion of the transfusion and run it slowly at first — most acute hemolytic reactions declare within the first 15 minutes.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("At the first sign of reaction: stop the transfusion, disconnect the blood at the hub, keep the line open with normal saline on NEW tubing — never flush the old line, which delivers more of the offending unit.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Recheck identifiers, notify the provider and blood bank, return the unit and tubing to the blood bank, and collect post-reaction labs and urine per protocol.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Monitor urine output closely afterward — hemolysis threatens the kidneys, and output is the bedside window on that risk.", citationIDs: ["openrn_scenarios_4"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Transfusion verification is one of the few nursing rituals where the failure mode is immediate and potentially lethal — and where the safeguard costs ninety seconds. The two-person bedside check is not bureaucracy; it is the last line between a labeling error anywhere upstream and a hemolytic reaction. When the unit can't staff the check, the transfusion waits, not the verification.",
                citationIDs: ["openrn_scenarios_4", "ahrq_psnet_4"]
            ))
        ],
        citations: [ahrqScenarios4, ahrqPSNet4, openrnScenarios4],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Opioid oversedation

public enum OpioidOversedationScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "opioid-oversedation-scenario",
        title: "Opioid oversedation — 'sleeping comfortably' at 2 AM",
        subtitle: "Sedation level predicts respiratory depression before the monitor does",
        eyebrow: "SCENARIO · POST-OP",
        nclexTags: mocTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 58-year-old man — BMI 38, suspected untreated sleep apnea — is post-op day 0 from a laparoscopic procedure, receiving IV opioids for pain overnight. At the 02:00 rounds the nurse finds him snoring loudly and documents 'sleeping comfortably.' At 04:00 the CNA reports she couldn't rouse him for vitals; RR is 7 and shallow, SpO2 82%. Rapid response: stimulation, oxygen, and naloxone per protocol reverse the picture. The review notes his sedation had been deepening across three assessments while pain scores were charted as 'unable to assess — asleep.'",
                citationIDs: ["ahrq_psnet_4", "openrn_scenarios_4"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Loud snoring in an opioid-medicated patient with probable OSA was read as comfort. Snoring is partial airway obstruction — in this context, a warning sign.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Sedation level wasn't formally assessed. Increasing sedation precedes respiratory depression; a structured sedation scale trended across the night would have flagged the drift hours earlier.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("'Unable to assess — asleep' hid the finding. A patient who cannot be roused enough to rate pain is not asleep; that is an assessment result, and an alarming one.", citationIDs: ["ahrq_psnet_4"]),
                AttributedBullet("High-risk features — obesity, suspected OSA, first post-op night, parenteral opioids — never triggered enhanced monitoring such as continuous pulse oximetry or capnography per policy.", citationIDs: ["openrn_scenarios_4"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Assess sedation with a structured scale every time opioids are given and at intervals after; escalating sedation means hold further opioids and notify the provider before the respiratory rate ever falls.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Count respirations for a full minute in opioid-medicated sleepers, watching depth and pattern, not just rate.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Flag high-risk patients (OSA or suspected OSA, obesity, opioid-naïve, concurrent sedatives, first 24 post-op hours) for continuous monitoring per facility policy.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Arousability is the assessment: a patient rousable only to vigorous stimulation is oversedated regardless of the numbers on the monitor.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Know the reversal pathway before you need it — where naloxone lives, what the protocol authorizes, and that resedation after reversal requires continued close observation.", citationIDs: ["openrn_scenarios_4"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Opioid deaths on hospital wards almost never happen without hours of warning — the warning is sedation. Respiratory depression is the late finding; the drift from drowsy to difficult-to-rouse is the early one. 'Sleeping comfortably' is only a safe note when the nurse has verified the patient can be roused. In a high-risk body habitus on a first post-op night, snoring is a sign to assess, not a sound of success.",
                citationIDs: ["openrn_scenarios_4", "ahrq_psnet_4"]
            ))
        ],
        citations: [ahrqScenarios4, ahrqPSNet4, openrnScenarios4],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Hypoglycemia in the NPO patient

public enum HypoglycemiaScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "hypoglycemia-npo-scenario",
        title: "Hypoglycemia — insulin given, breakfast never came",
        subtitle: "NPO status and scheduled insulin are a standing collision",
        eyebrow: "SCENARIO · MED-SURG",
        nclexTags: mocTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 66-year-old woman with type 2 diabetes is NPO after midnight for a morning endoscopy. The day-shift nurse, following the MAR, gives her full scheduled morning insulin dose at 07:30. The procedure is delayed; no tray arrives. At 10:15 the CNA finds her diaphoretic, trembling, and confused. Point-of-care glucose: 38 mg/dL. Because she is NPO and now confused, oral treatment is unsafe; IV dextrose is given per the hypoglycemia protocol and she recovers fully. The chart review finds no order clarification was requested and no glucose check was done between the insulin dose and the event.",
                citationIDs: ["ahrq_psnet_4", "openrn_scenarios_4"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Scheduled insulin was given to an NPO patient without clarifying the order. NPO status plus mealtime insulin is a classic mismatch that requires a provider decision, not MAR autopilot.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("No glucose monitoring bridged the gap. An insulin-dosed patient with no intake needs scheduled checks — the three-hour silence was the second failure.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Procedure delay was nobody's trigger. When the schedule slipped, no one reassessed what the slip meant for a medicated, fasting diabetic.", citationIDs: ["ahrq_teamstepps_scenarios_4"]),
                AttributedBullet("Early adrenergic signs (diaphoresis, tremor) had likely been present before confusion set in — but nobody was looking, because nobody expected the problem.", citationIDs: ["openrn_scenarios_4"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Treat NPO + scheduled insulin/oral hypoglycemics as an automatic clarification: many protocols hold or reduce doses for fasting patients — the provider decides, the nurse queries.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("If any insulin is given to a fasting patient, set explicit glucose-check times and know your protocol's thresholds.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Know both arms of treatment: fast-acting oral carbohydrate with recheck for the awake patient who can safely swallow; IV dextrose (or glucagon without IV access) per protocol when NPO, unsafe to swallow, or altered.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Recheck after treating — hypoglycemia recurs, especially with longer-acting agents on board and continued fasting.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("When procedures slip, sweep your list for time-sensitive collisions: insulin, anticoagulation timing, antibiotics — delay changes the plan for medicated patients.", citationIDs: ["ahrq_teamstepps_scenarios_4"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Hypoglycemia in the hospital is usually iatrogenic and usually preventable — the collision of insulin, interrupted intake, and an unwatched gap. The MAR says what was ordered yesterday; the nurse's job is noticing that today's NPO status has made yesterday's order unsafe. Confusion, diaphoresis, and tremor in any diabetic patient means glucose first — check before you rationalize.",
                citationIDs: ["openrn_scenarios_4", "ahrq_psnet_4"]
            ))
        ],
        citations: [ahrqScenarios4, ahrqPSNet4, openrnScenarios4],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Covert post-op hemorrhage

public enum CovertHemorrhageScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "covert-hemorrhage-scenario",
        title: "Post-op hemorrhage — the bleed the drain didn't show",
        subtitle: "Trends beat thresholds: shock declares itself in heart rate first",
        eyebrow: "SCENARIO · POST-OP",
        nclexTags: mocTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 74-year-old woman is post-op day 0 from a hip arthroplasty. Across the evening shift her heart rate trends 78 → 96 → 118 while systolic BP drifts from 132 to 108 — every value inside the 'notify if' thresholds on the order set. The surgical drain shows scant output, charted as reassuring. She becomes restless and asks repeatedly to be repositioned; urine output falls below 25 mL/hr. The night nurse, receiving handoff, looks at the trends together, notes the thigh is visibly swollen and tense compared to the other side, and calls a rapid response. Hemoglobin has dropped 4 g/dL from post-op baseline; she returns to the OR for evacuation of a large hematoma and control of bleeding.",
                citationIDs: ["ahrq_psnet_4", "openrn_scenarios_4"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Each vital sign was judged against a static threshold instead of its own trajectory. A heart rate climbing 40 points across a shift is an alarm even when no single value crosses the line.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Scant drain output was read as absence of bleeding. Drains clot and fail; blood also hides in the thigh compartment, the abdomen, or the retroperitoneum without external evidence.", citationIDs: ["ahrq_psnet_4"]),
                AttributedBullet("Restlessness and repeated repositioning requests were treated as discomfort. Agitation and a sense of unease are early cerebral hypoperfusion signs — classically dismissed.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Falling urine output — the kidney's report on perfusion — wasn't connected to the rising heart rate until handoff.", citationIDs: ["openrn_scenarios_4"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Trend vitals across the whole shift and say the trend out loud at handoff: 'HR has climbed 40 points since 15:00' lands differently than 'HR 118.'", citationIDs: ["ahrq_teamstepps_scenarios_4"]),
                AttributedBullet("In post-op patients, tachycardia is hemorrhage until proven otherwise. BP holds until compensation fails — falling pressure is a late sign, especially in patients on beta-blockers whose heart rate response is blunted.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Assess the surgical site region, not just the drain: compare limb girth, feel for tenseness, look at dressings and dependent areas where blood pools.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Track urine output as a perfusion vital sign; a sustained fall demands explanation.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Escalate on the cluster — tachycardia + restlessness + oliguria + falling BP is shock physiology, and the right call is a rapid response with labs and the surgeon notified, not another hour of observation.", citationIDs: ["ahrq_teamstepps_scenarios_4"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Hypovolemic shock is a story told in trends: the heart compensates loudly (rate) while the pressure holds quietly, the kidneys go silent, and the patient gets restless before they get obtunded. Order-set thresholds catch catastrophes; nurses catch trajectories. The drain is one data point — the patient is the rest.",
                citationIDs: ["openrn_scenarios_4", "ahrq_psnet_4"]
            ))
        ],
        citations: [ahrqScenarios4, ahrqPSNet4, openrnScenarios4],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Pulmonary embolism

public enum PulmonaryEmbolismScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pe-scenario",
        title: "Pulmonary embolism — 'anxiety' on post-op day 2",
        subtitle: "Never sedate unexplained dyspnea",
        eyebrow: "SCENARIO · POST-OP",
        nclexTags: mocTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 61-year-old man, post-op day 2 from knee arthroplasty, stands for his morning walk and abruptly develops shortness of breath, sharp chest pain on inspiration, and visible distress — 'something is really wrong.' HR 124, RR 30, SpO2 84% on room air. He has a history of anxiety, and his home anxiolytic is on the MAR. The nurse initially frames the episode as a panic attack and considers giving the PRN anxiolytic, but the pleuritic pain and the hypoxia don't fit — she sits him upright, applies oxygen, and calls a rapid response instead. CT angiography confirms bilateral segmental pulmonary emboli; anticoagulation is started and he recovers.",
                citationIDs: ["ahrq_psnet_4", "openrn_scenarios_4"]
            )),
            .bullets(title: "What almost went wrong", [
                AttributedBullet("The anxiety history nearly wrote the story. Diagnostic anchoring on a psychiatric label is one of the most common fatal errors in PE — the patient's fear is data, not noise.", citationIDs: ["ahrq_psnet_4"]),
                AttributedBullet("Sedating unexplained dyspnea blunts the respiratory drive of a patient who is compensating for a perfusion defect — the anxiolytic could have been the fatal intervention.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("The setup was textbook: recent orthopedic surgery, relative immobility, first sustained ambulation — the classic moment a DVT embolizes.", citationIDs: ["openrn_scenarios_4"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Sudden dyspnea + pleuritic chest pain + tachycardia + hypoxia in a post-op patient is PE until proven otherwise. A sense of impending doom belongs on that list, not under 'anxiety.'", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Immediate actions: sit the patient up, apply oxygen, get full vitals, stay with them, and activate rapid response — this is not a wait-for-the-provider-callback situation.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Do not ambulate further, and anticipate the workup: EKG, continuous monitoring, IV access, imaging per provider — while watching for deterioration toward obstructive shock.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Distinguish anxiety from hypoxia with data: panic rarely drops SpO2 to 84% or produces pleuritic pain. When findings conflict with the convenient explanation, trust the findings.", citationIDs: ["ahrq_psnet_4"]),
                AttributedBullet("Prevention is the other half: VTE prophylaxis compliance, early mobilization, and mechanical prophylaxis actually in place — not hanging on the bed rail.", citationIDs: ["openrn_scenarios_4"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "PE kills by masquerade. Its favorite disguise is anxiety, and its favorite victims are patients whose charts offer a psychiatric explanation for their terror. The rule that saves lives is simple: unexplained dyspnea never gets a sedative — it gets oxygen, an upright position, a full set of vitals, and a rapid response. Anchor on physiology, not on history.",
                citationIDs: ["openrn_scenarios_4", "ahrq_psnet_4"]
            ))
        ],
        citations: [ahrqScenarios4, ahrqPSNet4, openrnScenarios4],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Suicide risk on a medical unit

public enum SuicideRiskScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "suicide-risk-scenario",
        title: "Suicide risk — the sitter who got pulled",
        subtitle: "Psychiatric safety on a medical floor is a nursing responsibility",
        eyebrow: "SCENARIO · PSYCHOSOCIAL",
        nclexTags: NCLEXTags(
            category: .psychosocialIntegrity,
            subcategory: .psychosocialIntegrity,
            priorityConcept: .mood
        ),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 34-year-old woman is admitted to med-surg after an intentional overdose, medically stabilized and awaiting an inpatient psychiatric bed. She is on continuous 1:1 observation. Mid-shift, staffing runs short and the sitter is reassigned to a confused fall-risk patient 'for an hour,' with the plan to check on her every 15 minutes. On the second check, the nurse finds the patient in the bathroom attempting to fashion a ligature from oxygen tubing left coiled on the wall outlet. She is physically unharmed. The event review finds the room was never swept for risks after admission: tubing, a metal utensil from a meal tray, and unsecured belongings were all present.",
                citationIDs: ["ahrq_psnet_4", "openrn_scenarios_4"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Continuous observation was downgraded by staffing pressure, not by clinical reassessment. 1:1 for suicide risk is a safety order — changing it is a provider decision, not a scheduling one.", citationIDs: ["ahrq_psnet_4"]),
                AttributedBullet("Fifteen-minute checks are not equivalent protection: a determined attempt takes minutes. Intermittent checks are for lower-risk tiers, assigned by assessment.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("The environment was never made safe. Medical floors are full of ligature and ingestion risks that psychiatric units design out — the sweep has to be deliberate.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("No one had reassessed her suicidal ideation since the ED. Risk is dynamic — medical stabilization does not mean psychological stabilization.", citationIDs: ["openrn_scenarios_4"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Treat the observation level as an order: if staffing cannot support it, escalate to the charge nurse and house supervisor — the answer is finding a sitter, not thinning the watch.", citationIDs: ["ahrq_teamstepps_scenarios_4"]),
                AttributedBullet("Environmental safety sweep on arrival and every shift: remove or secure tubing, cords, sharps, glass, belts, plastic bags, and medication sources; belongings searched per policy.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Ask directly and regularly: 'Are you having thoughts of killing yourself right now?' Direct language does not plant the idea — it opens the door and is the standard of care.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Use a structured screening tool per facility policy and document the risk level, the plan it maps to, and the reassessment schedule.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Handoff the risk explicitly — observation level, last assessment, environmental status, and what the patient has said — so the watch never silently degrades between shifts.", citationIDs: ["ahrq_teamstepps_scenarios_4"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Suicide risk on a medical unit is a patient-safety emergency wearing an unfamiliar uniform. The medical floor lacks the designed-out environment of a psych unit, so the protection is procedural: an observation level treated as inviolable, a room deliberately made safe, direct assessment language, and explicit handoffs. Staffing pressure will always argue for shortcuts; the sitter at that bedside is the intervention.",
                citationIDs: ["openrn_scenarios_4", "ahrq_psnet_4"]
            ))
        ],
        citations: [ahrqScenarios4, ahrqPSNet4, openrnScenarios4],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Chest tube emergency

public enum ChestTubeEmergencyScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "chest-tube-emergency-scenario",
        title: "Chest tube emergency — dislodged during transport",
        subtitle: "Two different emergencies, two different first moves",
        eyebrow: "SCENARIO · PROCEDURAL",
        nclexTags: mocTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 47-year-old man with a chest tube for a traumatic pneumothorax is being moved to radiology. During the bed transfer the tubing catches on the side rail, and the tube pulls completely out of the chest wall. The transporter freezes; the accompanying nurse immediately covers the insertion site with the gloved palm, calls for help, and asks a colleague to bring the vented occlusive dressing from the bedside emergency kit. The dressing is taped on three sides per policy, oxygen is applied, and the patient is monitored closely for tension physiology while the provider is paged emergently. A new tube is placed; the patient does well.",
                citationIDs: ["ahrq_psnet_4", "openrn_scenarios_4"]
            )),
            .bullets(title: "Why the details matter", [
                AttributedBullet("Tube pulled OUT of the chest: cover the site immediately — many policies specify a dressing occlusive on three sides so air can escape but not enter, guarding against converting the pneumothorax into a tension pneumothorax.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Tube DISCONNECTED from the drainage system (still in the chest) is the other emergency, with a different move: submerge the tube's open end in sterile water to restore a water seal while the system is replaced.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Confusing the two responses — occluding a tube that's still in the chest with a clamp, or leaving a chest-wall hole open — is the classic error the emergency kit exists to prevent.", citationIDs: ["ahrq_psnet_4"]),
                AttributedBullet("Transport is the highest-risk moment for any tube or line. The snag on the side rail was foreseeable; routing and securing lines before moving is the prevention.", citationIDs: ["ahrq_teamstepps_scenarios_4"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Emergency supplies live at the bedside of every chest tube patient and travel with them: the occlusive dressing, sterile water, and spare drainage connections per facility policy.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Before any transport: trace every tube from patient to device, secure slack, assign who watches the lines during the move.", citationIDs: ["ahrq_teamstepps_scenarios_4"]),
                AttributedBullet("After any chest tube event, watch for tension physiology: escalating dyspnea, tracheal deviation, absent breath sounds on the affected side, distended neck veins, falling BP — a needle-decompression-level emergency.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Routine vigilance makes emergencies rare: monitor for tidaling, document output trends, avoid dependent loops, and never clamp a bubbling tube without an order.", citationIDs: ["openrn_scenarios_4"]),
                AttributedBullet("Everyone on the transport team — including non-nursing staff — should know the one sentence that matters: 'if anything pulls loose, stop and call; don't pull, push, or clamp.'", citationIDs: ["ahrq_teamstepps_scenarios_4"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Chest tube emergencies are rehearsal-dependent: the correct response takes seconds and the wrong one creates a tension pneumothorax. The pairing to memorize is out-of-the-chest → occlusive dressing vented per policy; disconnected-from-the-system → water seal. Keep the kit at the bedside, trace the lines before every move, and treat transport as the procedure it is.",
                citationIDs: ["openrn_scenarios_4", "ahrq_psnet_4"]
            ))
        ],
        citations: [ahrqScenarios4, ahrqPSNet4, openrnScenarios4],
        lastSourceFidelityReview: "2026-07-03"
    )
}
