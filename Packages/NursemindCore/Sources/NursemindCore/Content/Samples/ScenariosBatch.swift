import Foundation

// Curator-model Scenarios — case-study format.
// Source: AHRQ TeamSTEPPS published case scenarios and patient-safety case studies
// (US government work, public domain), CDC sepsis recognition guidance (public domain),
// AHRQ patient-safety primers (public domain).
//
// These scenarios are presented in the AHRQ TeamSTEPPS team-performance teaching format —
// a clinical situation, the team behaviors that did or did not happen, and the lessons
// for safer practice. Per v1_SCOPE.md §3.2, custom NCJMM-structured scenarios are
// CUT from v1; these are based on existing AHRQ public-domain case-study materials.

private let ahrqScenarios = CitationSource(
    id: "ahrq_teamstepps_scenarios",
    shortName: "AHRQ TeamSTEPPS — Patient Safety Case Scenarios",
    detail: "AHRQ TeamSTEPPS course materials and patient-safety case studies",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/teamstepps-program/index.html",
    lastRetrieved: "2026-05-04"
)

private let ahrqPSNet = CitationSource(
    id: "ahrq_psnet",
    shortName: "AHRQ Patient Safety Network — Cases & Commentaries",
    detail: "AHRQ peer-reviewed patient-safety case repository",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://psnet.ahrq.gov/",
    lastRetrieved: "2026-05-04"
)

private let cdcSepsis = CitationSource(
    id: "cdc_sepsis",
    shortName: "CDC Sepsis Recognition and Get Ahead of Sepsis",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/sepsis/index.html",
    lastRetrieved: "2026-05-04"
)

private let scenarioTags = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

// MARK: - Failure to Rescue

public enum FailureToRescueScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "failure-to-rescue-scenario",
        title: "Failure to rescue",
        subtitle: "Missed deterioration on a med-surg unit",
        eyebrow: "SCENARIO · TEAM PERFORMANCE",
        nclexTags: scenarioTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 68-year-old man, post-op day 2 from open colectomy, is on a medical-surgical unit. Nurses have noted progressive tachycardia and rising respiratory rate over the last 4 hours. The patient appears anxious and reports vague abdominal discomfort. The night-shift nurse documents the vitals but does not call the surgeon, attributing the changes to post-operative pain. The morning nurse picks up the patient and finds him hypotensive, mottled, and confused. Rapid response is called; the patient is transferred to ICU with septic shock from anastomotic leak.",
                citationIDs: ["ahrq_teamstepps_scenarios", "ahrq_psnet"]
            )),
            .bullets(title: "What went wrong — team behaviors", [
                AttributedBullet("Trended vital signs were documented but not interpreted as a pattern. Each individual reading was within facility 'call-the-provider' criteria, but the trajectory was not recognized.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("The nurse's clinical concern (anxious appearance, vague pain) was not communicated upward.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Hand-off did not flag the trend; the morning nurse received vitals as discrete numbers, not as an unfolding clinical picture.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Cognitive bias — early post-op vitals were anchored to 'expected post-operative response' rather than reassessed as new information arrived.", citationIDs: ["ahrq_psnet"])
            ]),
            .bullets(title: "What good team performance would have looked like", [
                AttributedBullet("STEP situation monitoring — recognizing that Status was deteriorating prompts a Huddle.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("CUS escalation — 'I'm Concerned that his heart rate has climbed from 88 to 118 in 4 hours and his respiratory rate is now 24.' Even without meeting criteria, the trend warrants a call.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Use rapid response or charge nurse as a low-threshold consult — early activation prevents arrest.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Hand-off using SBAR with explicit Assessment of trend, not just snapshot vitals.", citationIDs: ["ahrq_teamstepps_scenarios"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Failure to rescue is when deterioration is detectable but not detected, or detected but not acted upon. It is a leading preventable cause of in-hospital mortality. Standardized escalation tools (CUS, Two-Challenge Rule, rapid response systems with empowered nurse activation) and routine situation monitoring (STEP) are the structural protections against it. Trust the trend even when individual numbers are normal.",
                citationIDs: ["ahrq_teamstepps_scenarios", "ahrq_psnet"]
            ))
        ],
        citations: [ahrqScenarios, ahrqPSNet],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sepsis Recognition

public enum SepsisRecognitionScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "sepsis-recognition-scenario",
        title: "Recognizing sepsis early",
        subtitle: "Older adult with subtle presentation",
        eyebrow: "SCENARIO · CLINICAL JUDGMENT",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .perfusion
        ),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "An 82-year-old woman is admitted to a medical floor for community-acquired pneumonia. On day 2 of antibiotics, the day-shift nurse notes that the patient seems more lethargic and 'not herself.' Vitals are within facility criteria — temp 99.6°F, HR 92, BP 110/68, RR 18, SpO2 94% on 2L NC. Family at the bedside say 'she's confused, this isn't her.' The nurse documents 'mild somnolence' and continues routine care. Two hours later, the patient is hypotensive (BP 78/44), tachycardic (HR 122), and minimally responsive. Sepsis bundle is initiated late.",
                citationIDs: ["cdc_sepsis", "ahrq_teamstepps_scenarios"]
            )),
            .bullets(title: "What was missed", [
                AttributedBullet("Older adults frequently present with sepsis WITHOUT fever — confusion, weakness, or altered mental status may be the only sign.", citationIDs: ["cdc_sepsis"]),
                AttributedBullet("Family observation of 'she's not herself' is highly sensitive for early deterioration in older patients with cognitive impairment at baseline.", citationIDs: ["cdc_sepsis"]),
                AttributedBullet("A modest blood pressure drop in a chronically hypertensive patient (110/68 from a baseline of 142/82) is a meaningful change masked by 'normal' absolute numbers.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Borderline SpO2 on supplemental oxygen represents worsening gas exchange.", citationIDs: ["cdc_sepsis"])
            ]),
            .bullets(title: "What good clinical judgment would have done", [
                AttributedBullet("Listen to the family — their pattern recognition for the patient's baseline is unique and reliable.", citationIDs: ["cdc_sepsis"]),
                AttributedBullet("Compare current vitals to baseline trends, not facility absolute thresholds.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Use a sepsis screening tool routinely — qSOFA, MEWS, NEWS2 (any score change is a flag).", citationIDs: ["cdc_sepsis"]),
                AttributedBullet("Notify provider with SBAR plus CUS — 'I'm Concerned because she has a known infection, family says she's confused, her BP is below baseline. I'd like you to come evaluate.'", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Anticipate and prepare — STAT lactate, blood cultures, repeat vitals every 15 minutes, IV access for fluid resuscitation.", citationIDs: ["cdc_sepsis"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Sepsis kills more Americans than breast, prostate, and lung cancer combined, and most deaths follow a window of recognition that was missed. The CDC 'Get Ahead of Sepsis' campaign emphasizes that sepsis often presents as 'something is wrong, I'm not sure what' — particularly in older adults, immunocompromised patients, and those with cognitive baseline. Trust your clinical instinct and the family's. Screen and act early.",
                citationIDs: ["cdc_sepsis", "ahrq_teamstepps_scenarios"]
            ))
        ],
        citations: [cdcSepsis, ahrqScenarios],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hand-off Failure

public enum HandoffFailureScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "handoff-failure-scenario",
        title: "Hand-off failure",
        subtitle: "Missing information at change of shift",
        eyebrow: "SCENARIO · COMMUNICATION",
        nclexTags: scenarioTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A patient with new atrial fibrillation is started on a heparin drip on the night shift. The night nurse hands off to the day nurse with a brief verbal report: 'She's the AFib in 412 — heparin is running, aPTT was checked an hour ago, results not back yet.' The day nurse takes the assignment. Two hours later, the aPTT result comes back at 120 seconds (supratherapeutic) — but in the chart, not flagged at hand-off. The day nurse, occupied with two new admissions, does not check the result for another two hours. The patient develops melena and a hemoglobin drop of 2 g/dL.",
                citationIDs: ["ahrq_teamstepps_scenarios", "ahrq_psnet"]
            )),
            .bullets(title: "Hand-off gaps", [
                AttributedBullet("Pending lab results on a high-alert medication infusion were not flagged as time-critical follow-up.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Hand-off was not interactive — no read-back, no Q (questions) step.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("No explicit closed-loop on the pending result — who would be responsible to check, by when, and what the action threshold was.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Day nurse's competing priorities (admissions) deferred a critical follow-up without escalation.", citationIDs: ["ahrq_teamstepps_scenarios"])
            ]),
            .bullets(title: "What good hand-off would have included", [
                AttributedBullet("I-PASS or SBARQ structure — Illness severity, Patient summary, Action list (with explicit pending items and time frames), Situation awareness, Synthesis by receiver.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Pending aPTT explicitly named with: result expected in 30 minutes, target range, action threshold (hold for >100, reduce dose for >80).", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Read-back from the receiving nurse: 'I'll check the aPTT in 30 minutes and follow the protocol if it's elevated.'", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("If competing priorities make follow-up unsafe, the day nurse should have asked for a buddy or escalated to the charge nurse to assign coverage.", citationIDs: ["ahrq_teamstepps_scenarios"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "The Joint Commission has identified communication breakdown as a root cause in over 60% of sentinel events. Hand-offs are the highest-risk transitions of care because the receiving clinician inherits responsibility without context. Structured hand-off (I-PASS, SBARQ, or facility equivalent) with explicit attention to pending results and action thresholds is a structural protection. Pending labs on high-alert drips should NEVER be casually mentioned — they are critical action items that must be acknowledged and assigned with a time frame.",
                citationIDs: ["ahrq_teamstepps_scenarios", "ahrq_psnet"]
            ))
        ],
        citations: [ahrqScenarios, ahrqPSNet],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Code Blue Team Performance

public enum CodeBlueTeamScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "code-blue-team-scenario",
        title: "Code blue team performance",
        subtitle: "Roles, call-outs, closed-loop in resuscitation",
        eyebrow: "SCENARIO · TEAM PERFORMANCE",
        nclexTags: scenarioTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 56-year-old woman on a telemetry unit goes into ventricular fibrillation. The nurse calls a code. Multiple responders arrive in the room — primary nurse, rapid response, ICU nurse, respiratory therapist, two physicians, two more nurses for compressions, pharmacy. Within 90 seconds the room is crowded and chaotic. Compressions are interrupted multiple times for rhythm checks. An order for 1 mg of epi is shouted but not directed at anyone; two responders both reach for the epi. The defibrillator is charged but no one calls 'clear.' First shock is delayed.",
                citationIDs: ["ahrq_teamstepps_scenarios"]
            )),
            .bullets(title: "Team breakdowns", [
                AttributedBullet("No identified team leader — orders not directed; everyone trying to act on every order.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Crowded room — too many responders without designated roles increases noise and reduces efficiency.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Open-loop communication — orders given to no one in particular; no read-back; no confirmation of action.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Compressions interrupted longer than necessary — every second of pause reduces survival.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Safety practices (clear before shock) not vocalized.", citationIDs: ["ahrq_teamstepps_scenarios"])
            ]),
            .bullets(title: "What good code performance looks like", [
                AttributedBullet("First-arriving senior clinician declares team leader role: 'I'm running the code.'", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Roles assigned by name: 'Maria, compressions. Sam, IV access. Pat, airway. Carl, defib. Mira, scribe.' Everyone else steps back unless called in.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Closed-loop on every order: 'Push 1 mg epi.' / 'Pushing 1 mg epi — in.' Sender confirms.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Call-outs of vital information: 'Compressions on. Pulse check at 90 seconds. Epi at 4 minutes.'", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Loud safety vocalization before shock: 'Charging — clear top, clear bottom, oxygen away — shocking now!'", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Compression pauses limited to ≤10 seconds for pulse check or rhythm analysis.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Debrief after the event — what worked, what to do differently, what support team members need.", citationIDs: ["ahrq_teamstepps_scenarios"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Code blue outcomes are determined as much by team coordination as by clinical decisions. AHRQ TeamSTEPPS, AHA Resuscitation, and the airline-industry crew resource management literature converge on the same elements: declared leadership, named roles, closed-loop communication, vocalized safety steps, and structured debrief. Practicing these at every code, including mock codes and high-fidelity simulation, reliably saves lives.",
                citationIDs: ["ahrq_teamstepps_scenarios"]
            ))
        ],
        citations: [ahrqScenarios],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Medication Near-Miss Caught by Speak-Up

public enum MedicationNearMissScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "medication-near-miss-scenario",
        title: "Medication near-miss caught by speak-up",
        subtitle: "When the most junior person on the team prevents the error",
        eyebrow: "SCENARIO · TEAM PERFORMANCE",
        nclexTags: scenarioTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "An OR resident verbally orders 'heparin 5,000 units IV bolus' for a patient about to begin a vascular procedure. The new graduate nurse, 4 weeks off orientation, has just reviewed the heparin protocol and recalls that the standard bolus for this procedure is typically calculated by weight (typically 80 units/kg, equating to ~6,400 units for this 80 kg patient) but has seen 5,000 units used as a flat dose in some institutions. She hesitates — the dose is plausible, the resident is senior, the room is busy. She remembers the Two-Challenge Rule from her orientation. She speaks up: 'Doctor, I want to verify — heparin 5,000 units bolus, not weight-based?' The resident looks up: 'Wait — actually, it's 80 per kilo. Make it 6,400 units. Good catch.'",
                citationIDs: ["ahrq_teamstepps_scenarios"]
            )),
            .bullets(title: "What worked", [
                AttributedBullet("Nurse's clinical knowledge — she had reviewed the protocol and noticed the deviation.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Psychological safety — the team culture allowed a junior team member to question a senior physician without fear of being humiliated.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Two-Challenge Rule — the nurse used a structured assertive language (verifying as a question, not accusing) to surface the concern.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Provider response — the resident heard the question, reconsidered, and corrected. He thanked the nurse rather than dismissing her.", citationIDs: ["ahrq_teamstepps_scenarios"])
            ]),
            .bullets(title: "What this scenario teaches about culture", [
                AttributedBullet("Hierarchy is the most common reason errors are not caught at the bedside. The same nurse on the same day in a punitive culture stays silent and the wrong dose is given.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Senior clinicians model speak-up culture by their response to challenges. Saying 'good catch' rather than 'I had it under control' creates the safety net the next time.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("CUS, Two-Challenge Rule, and check-back are tools that make speaking up easier — they give the junior team member a script and a structure that does not require improvising.", citationIDs: ["ahrq_teamstepps_scenarios"]),
                AttributedBullet("Document the near-miss anonymously through the institutional reporting system — these data drive system fixes (forcing functions in the EHR, protocol clarification).", citationIDs: ["ahrq_teamstepps_scenarios"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "The most common and most preventable serious medication errors are the ones where someone on the team noticed a problem but did not speak up. Building a culture where the most junior nurse in the room can challenge the most senior physician — and where that physician thanks them for it — is the single most effective intervention against medication harm. AHRQ TeamSTEPPS' assertive-language tools (CUS, Two-Challenge, DESC) are not soft skills; they are patient-safety infrastructure.",
                citationIDs: ["ahrq_teamstepps_scenarios"]
            ))
        ],
        citations: [ahrqScenarios],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Wrong-Site Surgery Near-Miss

public enum WrongSiteSurgeryScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "wrong-site-surgery-scenario",
        title: "Wrong-site surgery near-miss",
        subtitle: "Universal Protocol catches a marking error",
        eyebrow: "SCENARIO · TEAM PERFORMANCE",
        nclexTags: scenarioTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A patient is scheduled for arthroscopic right knee surgery. The surgeon marks the knee in the pre-op holding area. The patient is taken to the OR, draped, and positioned. As the team begins the time-out, the circulating nurse reads aloud: 'Patient John Smith, date of birth, MRN, procedure: arthroscopic LEFT knee.' The room pauses. The surgeon looks at the consent — it says left. The marked knee is the right. The surgeon checks the imaging — left knee on imaging, right knee marked. The team stops, identifies the source of the discrepancy (consent and imaging both say left; the surgeon mismarked when distracted by a phone call), repositions the patient, re-marks, and proceeds with the correct site.",
                citationIDs: ["ahrq_teamstepps_scenarios", "ahrq_psnet"]
            )),
            .bullets(title: "What the Universal Protocol prevented", [
                AttributedBullet("A surgeon's site mark is fallible — distraction, fatigue, or simple error happens. The mark is a tool, not a guarantee.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("The pre-procedure verification process catches errors that escape the marking step.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("The time-out — performed actively by the team, not as a checkbox — surfaces inconsistencies that any single team member might have missed.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("The circulating nurse reading the procedure ALOUD forces verification against the consent and imaging.", citationIDs: ["ahrq_psnet"])
            ]),
            .bullets(title: "Universal Protocol — the three steps", [
                AttributedBullet("Pre-procedure verification — confirm the patient's identity, the planned procedure, the site, and consent before the patient enters the OR.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Site marking — mark the procedure site visibly with the surgeon's initials, with the patient awake when possible.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Time-out — immediately before the procedure, the team pauses, all activity stops, and the circulating nurse leads verbal verification of patient, procedure, site, side, position, and any special considerations.", citationIDs: ["ahrq_psnet"])
            ]),
            .bullets(title: "What good time-outs look like", [
                AttributedBullet("Active — every team member participates and verbally agrees.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Read aloud from the consent and imaging, not from memory or the schedule.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("All activity pauses — no draping, no instrument counts, no music, no side conversations.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Discrepancies are surfaced immediately and resolved before incision.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Any team member can stop the time-out for clarification.", citationIDs: ["ahrq_psnet"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Wrong-site, wrong-procedure, wrong-patient surgery is a never event. The Universal Protocol is the structural defense against it, and it works when every step is performed actively by an empowered team. The most dangerous time-out is the one performed mechanically, with the team focused on the next task. Treat the time-out as the most important 60 seconds of the case.",
                citationIDs: ["ahrq_psnet", "ahrq_teamstepps_scenarios"]
            ))
        ],
        citations: [ahrqPSNet, ahrqScenarios],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Diagnostic Anchoring

public enum DiagnosticAnchoringScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "diagnostic-anchoring-scenario",
        title: "Diagnostic anchoring",
        subtitle: "When 'we already know what this is' becomes dangerous",
        eyebrow: "SCENARIO · CLINICAL JUDGMENT",
        nclexTags: scenarioTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 32-year-old woman with a known history of migraines comes to the emergency department complaining of severe headache, the worst of her life. She has come in twice before for migraines and was diagnosed and discharged on both occasions. The triage nurse documents 'history of migraines, here for headache' and the patient is placed in a fast-track room. The covering provider examines her briefly, prescribes ibuprofen and IV fluids, and documents 'migraine, recurrent.' Three hours later, the nurse rechecks vitals and notes the patient is now somnolent, with photophobia, nuchal rigidity, and a BP of 180/110. CT is performed and reveals a subarachnoid hemorrhage.",
                citationIDs: ["ahrq_psnet"]
            )),
            .bullets(title: "Cognitive errors at play", [
                AttributedBullet("Anchoring bias — the previous diagnosis (migraine) anchored the team's thinking; new information was forced to fit the existing diagnosis.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Premature closure — a diagnosis was assigned before a thorough evaluation, and alternative explanations were not considered.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Availability bias — recent similar presentations made the team more likely to assume the same etiology this time.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Hand-off vulnerability — by the time the second nurse reassessed, hours had passed without a fresh look.", citationIDs: ["ahrq_psnet"])
            ]),
            .bullets(title: "Red flags in headache that should override anchoring", [
                AttributedBullet("'Worst headache of my life' — classic for subarachnoid hemorrhage.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Sudden onset (thunderclap) — peak severity within seconds to minutes.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Headache different in quality from prior headaches.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Associated neurologic findings — focal weakness, vision changes, altered mental status.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Nuchal rigidity, photophobia.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Headache with fever — meningitis or encephalitis.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Onset after age 50 with no prior headache history.", citationIDs: ["ahrq_psnet"])
            ]),
            .bullets(title: "Cognitive forcing functions", [
                AttributedBullet("'Worst-first' rule — for any chief complaint, briefly consider the worst-case diagnosis and what would rule it out.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Re-evaluate when the patient changes — every new vital sign, new symptom, or new lab result is an opportunity to reconsider.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Use a decision-aid for high-stakes presentations — the Ottawa SAH Rule for headache; HEART for chest pain; Wells for VTE.", citationIDs: ["ahrq_psnet"]),
                AttributedBullet("Speak up when the picture is changing — CUS escalation gives nurses a structured way to flag deterioration that the provider may not yet have seen.", citationIDs: ["ahrq_psnet"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Diagnostic error is a leading cause of preventable harm in healthcare. Cognitive bias — particularly anchoring on a known diagnosis — is the most common contributor. Building cognitive forcing functions into routine practice (worst-first reasoning, decision aids, structured re-evaluation, empowered nurse escalation) is the antidote. A patient's previous diagnosis is a starting point, not a conclusion.",
                citationIDs: ["ahrq_psnet"]
            ))
        ],
        citations: [ahrqPSNet],
        lastSourceFidelityReview: "2026-05-04"
    )
}
