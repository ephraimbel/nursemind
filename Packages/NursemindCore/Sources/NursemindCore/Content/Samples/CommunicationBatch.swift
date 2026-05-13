import Foundation

// Curator-model communication entries.
// Source: AHRQ TeamSTEPPS 3.0 Pocket Guide / Course Materials, US government work, public domain.
// https://www.ahrq.gov/teamstepps-program/index.html
// Each entry restructures a standardized AHRQ tool into editorial form with full attribution.

private let ahrqTeamSTEPPS = CitationSource(
    id: "ahrq_teamstepps_v3",
    shortName: "AHRQ TeamSTEPPS 3.0 — Pocket Guide & Course Materials",
    detail: "Team Strategies and Tools to Enhance Performance and Patient Safety",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/teamstepps-program/index.html",
    lastRetrieved: "2026-05-04"
)

private let tjcReadback = CitationSource(
    id: "tjc_npsg_readback",
    shortName: "Joint Commission NPSG.02.03.01 — Verbal Order Read-Back",
    detail: "Concept citation: read-back of verbal/telephone orders is a TJC NPSG",
    publisher: "The Joint Commission",
    license: .factCitationOnly,
    url: "https://www.jointcommission.org/standards/national-patient-safety-goals/",
    lastRetrieved: "2026-05-04"
)

private let safetyCommTags = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

// MARK: CUS

public enum CUSSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cus-assertive",
        title: "CUS — assertive escalation",
        subtitle: "Concerned · Uncomfortable · Safety issue",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "CUS is a three-step assertive language script from AHRQ TeamSTEPPS used to escalate a safety concern when a team member's plan or action does not seem right. It is designed to convey increasing urgency in a way that is professional, clear, and impossible to dismiss. CUS pairs with the Two-Challenge Rule — if the first CUS attempt is ignored, the speaker repeats the concern with stronger language and, if still unaddressed, invokes the chain of command.",
                citationIDs: ["ahrq_teamstepps_v3"]
            )),
            .keyValueTable(title: "The script", [
                KeyValueRow(key: "C", value: "I am Concerned…"),
                KeyValueRow(key: "U", value: "I am Uncomfortable…"),
                KeyValueRow(key: "S", value: "This is a Safety issue.")
            ]),
            .bullets(title: "How to use it", [
                AttributedBullet("Use a calm, firm tone — CUS works because the words themselves carry the escalation, not the volume.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("State the specific concern after each prompt — not just the keyword. Example: 'I am Concerned that her potassium is 6.4 and we have not held the spironolactone.'", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("If the receiver does not acknowledge or address your CUS, escalate up the chain of command — charge nurse, supervisor, rapid response, or attending of record.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Document what you said, to whom, when, and the response. CUS is a patient-safety event whether or not anyone agreed with you.", citationIDs: ["ahrq_teamstepps_v3"])
            ]),
            .prose(title: "Example", AttributedProse(
                "C: 'Dr. Lee, I'm Concerned — Mr. Patel's blood pressure has dropped from 132/78 to 86/48 in the last 30 minutes and his lactate just came back at 4.2.' U: 'I'm Uncomfortable continuing the maintenance fluids without further evaluation.' S: 'This is a Safety issue and I'd like you to come assess him now or authorize me to call rapid response.'",
                citationIDs: ["ahrq_teamstepps_v3"]
            ))
        ],
        citations: [ahrqTeamSTEPPS],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Two-Challenge Rule

public enum TwoChallengeRuleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "two-challenge-rule",
        title: "Two-Challenge Rule",
        subtitle: "Speak up — at least twice",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "The Two-Challenge Rule, from AHRQ TeamSTEPPS, empowers any team member to assertively voice a safety concern at least two times to ensure it has been heard. The first challenge is a question or assertion. If it is dismissed or unacknowledged, the second challenge restates the concern more forcefully. If still unaddressed, the team member is obligated to take stronger action — escalate up the chain of command or use a stop-the-line mechanism.",
                citationIDs: ["ahrq_teamstepps_v3"]
            )),
            .bullets(title: "How to use it", [
                AttributedBullet("Challenge 1 — voice the concern as a question or assertion: 'Doctor, are we sure that's the right dose? The order says 10 mg but the protocol is 1 mg.'", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("If ignored or dismissed: Challenge 2 — repeat the concern more directly: 'I need to stop and verify this dose before I administer. The order does not match the protocol.'", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("If still unaddressed: take stronger action — call charge nurse, pharmacist, supervisor, or rapid response. Do not administer or proceed with the action in question until resolved.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Document each challenge, to whom, the response, and your action.", citationIDs: ["ahrq_teamstepps_v3"])
            ]),
            .prose(title: "Why two", AttributedProse(
                "Single challenges are easy to dismiss as a misunderstanding or a junior colleague's deference. A second challenge signals 'this is not a misunderstanding — I have a reasoned concern' and triggers a structural pause for the receiving clinician to actually engage with the question rather than reflexively dismiss it.",
                citationIDs: ["ahrq_teamstepps_v3"]
            ))
        ],
        citations: [ahrqTeamSTEPPS],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Check-Back / Closed-Loop Communication

public enum CheckBackSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "check-back",
        title: "Check-back — closed-loop communication",
        subtitle: "Sender · Receiver · Sender confirms",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Check-back is the AHRQ TeamSTEPPS closed-loop communication technique used to verify that information sent has been received and interpreted correctly. The sender initiates a message; the receiver acknowledges and repeats back the critical content; the sender confirms the read-back was accurate. Check-back is the operational form of the Joint Commission's read-back requirement for verbal and telephone orders.",
                citationIDs: ["ahrq_teamstepps_v3", "tjc_npsg_readback"]
            )),
            .keyValueTable(title: "Three steps", [
                KeyValueRow(key: "1. Sender", value: "Initiates the message — names the receiver, states the order/information clearly."),
                KeyValueRow(key: "2. Receiver", value: "Acknowledges receipt and repeats back the message verbatim."),
                KeyValueRow(key: "3. Sender", value: "Confirms 'that's correct' or corrects the read-back.")
            ]),
            .bullets(title: "Where to use it", [
                AttributedBullet("Verbal or telephone medication orders (TJC NPSG requirement).", citationIDs: ["tjc_npsg_readback"]),
                AttributedBullet("Critical lab values reported by the lab — repeat the value back, then document time, value, and reporter.", citationIDs: ["ahrq_teamstepps_v3", "tjc_npsg_readback"]),
                AttributedBullet("Code blue / rapid response — every order spoken out loud is repeated back by the executor before action.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Hand-off — the receiver of the hand-off reads back key items (allergies, code status, drips, isolation).", citationIDs: ["ahrq_teamstepps_v3"])
            ]),
            .prose(title: "Example", AttributedProse(
                "Provider: 'Give 4 mg ondansetron IV push.' Nurse: 'Ondansetron 4 mg, IV push — confirming.' Provider: 'That's correct.'",
                citationIDs: ["ahrq_teamstepps_v3"]
            ))
        ],
        citations: [ahrqTeamSTEPPS, tjcReadback],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Call-Out

public enum CallOutSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "call-out",
        title: "Call-Out",
        subtitle: "Broadcast critical information to the team",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Call-Out, from AHRQ TeamSTEPPS, is a strategy used to communicate critical or important information to all team members simultaneously. It is most useful in high-acuity, dynamic situations — codes, rapid responses, traumas, deliveries — where the team leader needs everyone to share the same situational picture and to anticipate the next step. The structure is intentionally short and unambiguous so that information is understood the first time.",
                citationIDs: ["ahrq_teamstepps_v3"]
            )),
            .bullets(title: "How to use it", [
                AttributedBullet("Direct the call-out to a specific person when possible: 'Maria, what's the rhythm?'", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("State observable facts in short phrases: 'BP 78 over 40. Sats 88 percent on 6 liters. Patient unresponsive.'", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Anticipate next steps for the team: 'Next pulse check in 90 seconds. Epi at 4 minutes.'", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Pair with Check-back for any orders that follow: 'Push 1 mg of epi.' / 'Pushing 1 mg epi — in.'", citationIDs: ["ahrq_teamstepps_v3"])
            ]),
            .prose(title: "Example — code blue", AttributedProse(
                "Team leader: 'Compressions on. Pulse check in 2 minutes. Airway, drop an OPA and bag. Maria — IV access. Sam — draw up 1 mg epi. Rhythm at next pulse check.' Each call-out is short, names a person, names an action.",
                citationIDs: ["ahrq_teamstepps_v3"]
            ))
        ],
        citations: [ahrqTeamSTEPPS],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: DESC script

public enum DESCScriptSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "desc-script",
        title: "DESC script — conflict resolution",
        subtitle: "Describe · Express · Specify · Consequences",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "DESC, from AHRQ TeamSTEPPS, is a structured conflict-resolution script used when a team member's behavior or decision is creating a safety, workflow, or interpersonal problem. It is intended to be delivered privately and respectfully, focused on observable behavior rather than personality. DESC is a constructive escalation tool — it is designed to preserve the working relationship while making it clear that the behavior must change.",
                citationIDs: ["ahrq_teamstepps_v3"]
            )),
            .keyValueTable(title: "The four steps", [
                KeyValueRow(key: "D — Describe", value: "Describe the specific situation or behavior — observable facts, not interpretations."),
                KeyValueRow(key: "E — Express", value: "Express your concerns about the behavior or its impact."),
                KeyValueRow(key: "S — Specify", value: "Specify the alternative or action you want."),
                KeyValueRow(key: "C — Consequences", value: "State the consequences in terms of patient safety or team performance.")
            ]),
            .bullets(title: "How to deliver it", [
                AttributedBullet("Choose a private setting — never in front of the patient or the rest of the team.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Describe behavior, not personality — 'when verbal orders are given without read-back,' not 'when you are careless.'", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Frame consequences around the patient and team, not around your feelings.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Be willing to listen to the response — DESC opens a conversation; it is not a one-way speech.", citationIDs: ["ahrq_teamstepps_v3"])
            ]),
            .prose(title: "Example", AttributedProse(
                "D: 'When the heparin order was given verbally without a read-back…' E: 'I was concerned because we have had two near-misses on heparin doses on this unit this month.' S: 'Going forward, can we read back any heparin order before I give it?' C: 'It protects the patient and protects both of us if there is ever an audit or an event.'",
                citationIDs: ["ahrq_teamstepps_v3"]
            ))
        ],
        citations: [ahrqTeamSTEPPS],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Brief

public enum BriefSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "team-brief",
        title: "Brief",
        subtitle: "Short planning meeting before a shift, case, or task",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "A Brief, from AHRQ TeamSTEPPS, is a short planning session held before the start of a shift, a case, or a procedure. The purpose is to assemble the team, assign roles, identify the plan, surface anticipated problems, and establish a shared mental model. Briefs typically take 1–3 minutes and are most often led by the charge nurse, attending, or procedural lead.",
                citationIDs: ["ahrq_teamstepps_v3"]
            )),
            .bullets(title: "What to cover", [
                AttributedBullet("Who is on the team and what role each person is playing.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("The plan — patient assignments, case order, procedure steps, expected timeline.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Anticipated problems — high-acuity patients, expected admissions, equipment concerns, staffing gaps.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Communication ground rules — how to escalate, who to call, where the team will huddle if things change.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Explicit invitation: 'Speak up if you see something.' This sets the climate for psychological safety.", citationIDs: ["ahrq_teamstepps_v3"])
            ]),
            .prose(title: "Example — start-of-shift Brief", AttributedProse(
                "'Good morning. We're 5 nurses, 1 tech, 1 charge. Sarah has rooms 1–4 — heads-up that 3 is a chest pain rule-out and may need transfer. Mike has 5–8 — 7 is a fall-risk dementia patient, please use bed alarm. Charge nurse is me, I'll be in the workroom or rounding. We have an admission expected at 10. Pharmacy is short-staffed today, expect delays on stat med pulls. Anything to flag? OK — let's go.'",
                citationIDs: ["ahrq_teamstepps_v3"]
            ))
        ],
        citations: [ahrqTeamSTEPPS],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Huddle

public enum HuddleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "team-huddle",
        title: "Huddle",
        subtitle: "Ad-hoc team meeting to re-establish situational awareness",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "A Huddle, from AHRQ TeamSTEPPS, is an ad-hoc planning meeting called when the situation has changed significantly enough that the team needs to re-establish a shared mental model and adjust the plan. Huddles are short — usually 1–2 minutes — and are called by anyone on the team who recognizes that the original plan no longer fits the current reality.",
                citationIDs: ["ahrq_teamstepps_v3"]
            )),
            .bullets(title: "When to call a huddle", [
                AttributedBullet("A patient has acutely deteriorated — the unit needs to redistribute attention.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("A new admission, transfer, or surgical case is changing workload.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Staffing has changed — sick call, float, transfer to higher-acuity unit.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("A safety concern has emerged that affects more than one patient.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Equipment failure, code, or external event (mass casualty, severe weather).", citationIDs: ["ahrq_teamstepps_v3"])
            ]),
            .bullets(title: "How to run one", [
                AttributedBullet("State the trigger in one sentence: 'Bed 7 is going septic. Re-planning.'", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Re-assign — who is taking lead on the deteriorating patient, who is covering their other patients.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Identify what help is needed — rapid response, charge nurse, pharmacy, supervisor.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Set a check-in point: 'Touch base in 15 minutes.'", citationIDs: ["ahrq_teamstepps_v3"])
            ])
        ],
        citations: [ahrqTeamSTEPPS],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Debrief

public enum DebriefSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "team-debrief",
        title: "Debrief",
        subtitle: "Structured review after an event or shift",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "A Debrief, from AHRQ TeamSTEPPS, is an informal review held after a significant event — a code, a difficult case, an end of shift, a near-miss — to identify what went well, what did not, and what should change. Debriefs are designed to improve team performance through learning, not to assign blame. The atmosphere is intentionally non-punitive and structured so that everyone has a voice.",
                citationIDs: ["ahrq_teamstepps_v3"]
            )),
            .bullets(title: "Standard prompts", [
                AttributedBullet("What was the clinical situation and what did we do?", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("What worked well that we want to repeat?", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("What did not work well or felt unsafe?", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("What is one thing we will do differently next time?", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Who needs follow-up — the patient, family, team members, the system (incident report)?", citationIDs: ["ahrq_teamstepps_v3"])
            ]),
            .bullets(title: "Ground rules", [
                AttributedBullet("Behavior, not personality — focus on what happened, not who is at fault.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Everyone speaks — including the most junior person in the room.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Findings stay constructive — actionable change, not blame.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("If patient harm occurred, an incident report and disclosure pathway is separate from — and not replaced by — the debrief.", citationIDs: ["ahrq_teamstepps_v3"])
            ])
        ],
        citations: [ahrqTeamSTEPPS],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: STEP situation monitoring

public enum STEPSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "step-situation-monitoring",
        title: "STEP — situation monitoring",
        subtitle: "Status · Team · Environment · Progress",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "STEP, from AHRQ TeamSTEPPS, is a situation-monitoring framework that prompts a team member to scan four domains and update their mental model of what is going on. STEP is not a single action — it is a habit. Strong teams cycle through STEP repeatedly throughout a shift to catch deterioration, workload imbalance, and environmental hazards before they become events.",
                citationIDs: ["ahrq_teamstepps_v3"]
            )),
            .keyValueTable(title: "Four domains", [
                KeyValueRow(key: "S — Status of the patient", value: "Vitals, mental status, recent labs/imaging, response to treatment, anticipated trajectory."),
                KeyValueRow(key: "T — Team members", value: "Workload, fatigue, stress, skill mix — who is overloaded, who has capacity."),
                KeyValueRow(key: "E — Environment", value: "Equipment, facility resources, isolation status, hazards in the room or on the unit."),
                KeyValueRow(key: "P — Progress toward the goal", value: "What was the plan? Are we on track? Has the goal changed?")
            ]),
            .bullets(title: "How to use it", [
                AttributedBullet("Run through STEP at the start of the shift, after every report received, and any time the situation feels unclear.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Pair with cross-monitoring — share STEP observations with the team during huddles and call-outs.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("If any one domain is off — patient deteriorating, teammate overwhelmed, equipment failing, plan no longer matching the situation — call a Huddle and re-plan.", citationIDs: ["ahrq_teamstepps_v3"])
            ])
        ],
        citations: [ahrqTeamSTEPPS],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: Cross-Monitoring

public enum CrossMonitoringSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cross-monitoring",
        title: "Cross-monitoring",
        subtitle: "Watching teammates' actions to catch errors before they reach the patient",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Cross-monitoring, from AHRQ TeamSTEPPS, is the practice of observing the actions of other team members for the purpose of providing a safety net — not to police or judge, but to catch slips, lapses, and mistakes before they reach the patient. Cross-monitoring is a core function of every team member regardless of seniority. The newest nurse on the unit is expected to cross-monitor the most senior physician, and vice versa.",
                citationIDs: ["ahrq_teamstepps_v3"]
            )),
            .bullets(title: "What to watch for", [
                AttributedBullet("Medication near-misses — wrong drug, wrong dose, wrong route, wrong patient, wrong time.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Procedural slips — wrong site, missed time-out, broken sterile field, bypassed safety check.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Cognitive overload — a teammate juggling too many tasks at once is at high risk for error.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Fatigue and emotional load — bereavement, conflict, illness, end of a long stretch of shifts.", citationIDs: ["ahrq_teamstepps_v3"])
            ]),
            .bullets(title: "How to speak up", [
                AttributedBullet("Use Check-back to verify before action: 'You said 10 mg of morphine — confirming?'", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Use CUS for safety concerns: 'I'm Concerned about that dose — can we double-check?'", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Use the Two-Challenge Rule if your first concern is dismissed.", citationIDs: ["ahrq_teamstepps_v3"]),
                AttributedBullet("Offer task assistance to an overloaded teammate: 'I can hang that bag while you finish the assessment.' This is mutual support — also a TeamSTEPPS tool.", citationIDs: ["ahrq_teamstepps_v3"])
            ])
        ],
        citations: [ahrqTeamSTEPPS],
        lastSourceFidelityReview: "2026-05-04"
    )
}
