import Foundation

// Curator-model Scenarios — case-study format (v1.5 expansion).
// Sources: AHRQ TeamSTEPPS public-domain case scenarios, AHRQ PSNet, CDC.

private let ahrq2 = CitationSource(
    id: "ahrq_teamstepps_2",
    shortName: "AHRQ TeamSTEPPS — Patient Safety Case Scenarios",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/teamstepps-program/index.html",
    lastRetrieved: "2026-05-04"
)
private let ahrqPSNet2 = CitationSource(
    id: "ahrq_psnet_2",
    shortName: "AHRQ Patient Safety Network — Cases & Commentaries",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://psnet.ahrq.gov/",
    lastRetrieved: "2026-05-04"
)
private let cdcScen = CitationSource(
    id: "cdc_scen",
    shortName: "CDC clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)

private let safetyScenTags = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety)

// MARK: - Falls Prevention

public enum FallsPreventionScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "falls-prevention-scenario",
        title: "Falls prevention",
        subtitle: "When the bed alarm becomes background noise",
        eyebrow: "SCENARIO · SAFETY",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "An 84-year-old man is admitted with pneumonia and a baseline of mild dementia. His Morse Fall Scale score is 75 (high risk). On day 2, the bed alarm sounds during shift change; staff at the nurse's station are giving handoff. The alarm has gone off four times that shift for benign repositioning. A nurse calls down the hall 'I'll get it,' but is interrupted by another patient's call light. Three minutes later, the man is found on the floor with a hip fracture. He had stood to go to the bathroom unassisted.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            )),
            .bullets(title: "What went wrong — system and team behaviors", [
                AttributedBullet("Alarm fatigue — repeated benign alarms desensitized the team. The fourth alarm was treated like the first three.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Handoff at high-risk time — shift change is statistically the highest-risk window for adverse events; high-risk patients need active monitoring during it.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("No closed-loop communication — 'I'll get it' was never confirmed; when interrupted, no one re-owned the task.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Fall-prevention bundle not activated — bed in low position, call light in reach, non-skid socks, scheduled toileting, hourly rounding all missing.", citationIDs: ["ahrq_psnet_2"])
            ]),
            .bullets(title: "What good practice looks like", [
                AttributedBullet("Active fall-risk identification on every shift — Morse, Hendrich II, or facility-validated tool; results visible at bedside.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Hourly rounding with the 4 P's — Pain, Potty, Position, Possessions — proactively addresses the most common reasons patients get up unassisted.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Bed alarm + immediate room response, not delayed; consider sitter, room change near nursing station, or bed-occupancy sensor for high-risk patients.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Closed-loop communication — explicit handoff of who is going; verbal acknowledgment.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Toileting schedule — proactive every 2 hours during the day; addresses the #1 reason high-risk patients get up.", citationIDs: ["ahrq_teamstepps_2"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Falls are predictable in identified high-risk patients. The system, not the patient, is responsible for the prevention. Bed alarms are a tool, not a strategy — they only work as fast as the response. When alarm fatigue sets in, the protective effect goes to zero. Active rounding, scheduled toileting, and clear ownership beat passive monitoring every time.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            ))
        ],
        citations: [ahrq2, ahrqPSNet2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Rapid Response Activation

public enum RapidResponseScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "rapid-response-scenario",
        title: "When to call rapid response",
        subtitle: "Trusting the gut feeling before criteria are met",
        eyebrow: "SCENARIO · ESCALATION",
        nclexTags: safetyScenTags,
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 62-year-old woman is post-op day 3 from total knee replacement on a med-surg unit. The night nurse notes that her respiratory rate has been 22–24 over the last 2 hours (was 16–18 prior). She is satting 92% on room air. Her vitals don't yet meet the facility's 'call MD' criteria. She tells the nurse 'I just feel a little tired.' The nurse documents and continues routine care. At 0500, she is found in respiratory distress — saturating 84%, RR 32, anxious. CT confirms pulmonary embolism.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            )),
            .bullets(title: "What was missed", [
                AttributedBullet("Trend matters more than threshold — RR climbing from 16 to 24 in a post-op patient is meaningful even if 'within normal limits.'", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Patient's own statement of 'just tired' was minimized; vague symptoms in a post-op orthopedic patient should activate VTE thinking.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("The nurse's own gut sense ('something's off') is one of the most validated rapid-response triggers; published RRT criteria all include 'staff worried.'", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Waiting for absolute thresholds to be crossed delays escalation past the window of best intervention.", citationIDs: ["ahrq_teamstepps_2"])
            ]),
            .bullets(title: "What good escalation looks like", [
                AttributedBullet("Use facility RRT criteria as a FLOOR, not a ceiling — 'staff worried' is a valid criterion in most modern systems.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("CUS escalation: 'I'm Concerned, I'm Uncomfortable, this is a Safety issue.' One short phrase that triggers attention.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Post-op orthopedic + sudden tachypnea or hypoxia → pulmonary embolism until proven otherwise.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Early activation has zero penalty — RRT 'over-call' is encouraged; missed deterioration costs lives.", citationIDs: ["ahrq_teamstepps_2"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Rapid Response Teams exist for exactly this situation: the nurse who sees something off but isn't sure. The cost of an unnecessary RRT is small (a few minutes of a nurse's and provider's time). The cost of a missed RRT is a code, an ICU admission, or death. Modern RRT criteria explicitly include nursing intuition. Trust the trend, trust the gut, escalate early.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            ))
        ],
        citations: [ahrq2, ahrqPSNet2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pain Reassessment

public enum PainReassessmentScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pain-reassessment-scenario",
        title: "Pain reassessment failure",
        subtitle: "When 'medicated for pain' is not the same as 'pain controlled'",
        eyebrow: "SCENARIO · QUALITY",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 34-year-old patient is post-op day 1 from open cholecystectomy. She receives oxycodone 10 mg PO at 0800 for pain rated 8/10. The nurse documents administration and moves on. At 1000, the patient calls — pain is now 9/10 with breakthrough between scheduled doses. She is dyspneic on shallow breathing because of pain, has not used incentive spirometry, and is refusing to ambulate. By day 2, she has atelectasis and a low-grade fever.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Pain reassessment was not performed at the expected interval (typically 30–60 min after oral analgesic, 15 min after IV).", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Documentation focused on 'medication given' rather than 'pain controlled' — these are different outcomes.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Multimodal analgesia not maximized — acetaminophen scheduled, NSAID if appropriate, regional/wound infiltration as adjuncts; opioid alone often inadequate post-op.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Cascade — uncontrolled pain → no IS, no ambulation → atelectasis, VTE risk, prolonged stay.", citationIDs: ["ahrq_teamstepps_2"])
            ]),
            .bullets(title: "What good practice looks like", [
                AttributedBullet("Reassess within 30–60 min of oral analgesic, 15 min of IV; document pain score and patient's report of effect.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Multimodal analgesia — scheduled acetaminophen, regional/local techniques, NSAID when not contraindicated reduce opioid requirements and side effects.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Address barriers to mobility actively — IS coaching, splint with pillow, ambulate with assist post-medication peak.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Functional pain assessment — can the patient deep breathe, cough, ambulate? Functional improvement is the goal, not just numeric score.", citationIDs: ["ahrq_teamstepps_2"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Pain administration is the start, not the end. Reassessment within an evidence-based interval, multimodal therapy, and functional outcome (deep breathing, ambulation, sleep) define success. Uncontrolled post-op pain is the entry point to atelectasis, pneumonia, VTE, prolonged stay, and chronic pain syndromes. The follow-up matters as much as the order.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            ))
        ],
        citations: [ahrq2, ahrqPSNet2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CIWA Monitoring

public enum CIWAMonitoringScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ciwa-monitoring-scenario",
        title: "CIWA-Ar monitoring in alcohol withdrawal",
        subtitle: "Symptom-triggered protocol prevents DTs",
        eyebrow: "SCENARIO · CLINICAL JUDGMENT",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 56-year-old man is admitted from the ED for cellulitis. His chart notes he drinks '6 beers a day' but he denies daily heavy use. The admission nurse defers CIWA assessment because 'he doesn't seem like that kind of patient.' On hospital day 2, he becomes tachycardic, diaphoretic, and tremulous. By day 3, he is hallucinating, agitated, and combative — full delirium tremens. He requires ICU transfer, escalating benzodiazepine doses, and intubation.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            )),
            .bullets(title: "What was missed", [
                AttributedBullet("Risk-stratification bias — assumptions about who 'looks like' a heavy drinker undermined a structured screening.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Self-reported intake is often understated — '6 beers' commonly means more.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("CIWA-Ar protocol exists for prevention — symptom-triggered benzodiazepines started at low scores prevent progression to DTs.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Thiamine, folate, magnesium replacement not initiated proactively in known/suspected alcohol use disorder.", citationIDs: ["ahrq_psnet_2"])
            ]),
            .bullets(title: "What good practice looks like", [
                AttributedBullet("Standardized alcohol screening at admission (AUDIT-C); structured CIWA-Ar protocol if positive.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Symptom-triggered benzodiazepine dosing per CIWA score every 1–4 hours.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Banana bag (thiamine, folate, multivitamin) and electrolyte (Mg, K, phos) replacement on admission for at-risk patients.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Quiet environment, reorientation, fall precautions; AVOID restraints when possible.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Discharge planning includes addiction counseling, MAT (naltrexone, acamprosate), social work — recovery starts in the hospital.", citationIDs: ["ahrq_teamstepps_2"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Delirium tremens has 1–4% mortality with treatment, 15–20% without — and is preventable when withdrawal is identified and treated early with structured protocols. Bias against any patient population (homeless, urban, well-dressed, professional, religious) compromises screening. Structured tools work because they remove the bias. Treat the syndrome aggressively early; it cascades fast.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            ))
        ],
        citations: [ahrq2, ahrqPSNet2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pressure Injury Prevention

public enum PressureInjuryPreventionScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pressure-injury-prevention-scenario",
        title: "Pressure injury prevention in the immobile patient",
        subtitle: "Q2 turning is necessary, not sufficient",
        eyebrow: "SCENARIO · QUALITY",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 76-year-old woman is admitted to ICU with septic shock. She requires norepinephrine and is intubated and sedated. Braden Scale on admission is 11 (high risk). The nurse turns her every 2 hours per protocol but the air mattress is set wrong (firm setting, not pressure-redistribution mode), heels are not offloaded, and the patient is on a basic disposable underpad despite stress incontinence. On day 4, a stage 3 sacral pressure injury and bilateral heel injuries are found.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Q2 turning alone is necessary but not sufficient — pressure-redistribution surface, heel offloading, moisture management, nutrition all matter.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Air mattress set incorrectly — 'firm' mode actually increases pressure under bony prominences; 'pressure redistribution' or 'soft' setting required.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Heels — most commonly injured site after sacrum; require active offloading (heel-elevation devices or pillow under calves) — turning alone does not protect them.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Moisture-associated skin damage compounded — stress incontinence with prolonged underpad contact macerates skin.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Nutrition — sepsis is hypercatabolic; protein + calorie deficiency impairs tissue tolerance.", citationIDs: ["ahrq_teamstepps_2"])
            ]),
            .bullets(title: "What a complete bundle looks like", [
                AttributedBullet("Braden assessment every shift; high-risk → automatic specialty mattress, heel offloaders, scheduled turning, moisture barrier.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Heel offloading — heel boots or pillow under calves to FLOAT heels; check skin every shift.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Verify mattress is on the correct setting; use foam wedges for repositioning.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Moisture management — barrier cream, prompt cleansing after incontinence, breathable underpads.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Nutrition — early enteral feeding when feasible; dietitian consult for malnutrition; protein 1.2–2 g/kg/day.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Daily skin assessment by two nurses (or photo) at high-risk sites — sacrum, heels, occiput, ears, elbows, hips.", citationIDs: ["ahrq_teamstepps_2"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Stage 2+ hospital-acquired pressure injuries are CMS hospital-acquired conditions with quality and reimbursement implications. They are largely preventable with a complete bundle: pressure redistribution surface, heel offloading, scheduled turning, moisture management, nutrition, and daily skin assessment. Q2 turning alone is the most-cited intervention and the most-overestimated. Build the complete bundle.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            ))
        ],
        citations: [ahrq2, ahrqPSNet2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - End-of-life Communication

public enum EndOfLifeScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "end-of-life-scenario",
        title: "End-of-life communication and goals of care",
        subtitle: "Avoiding non-beneficial care through honest conversations",
        eyebrow: "SCENARIO · COMMUNICATION",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "An 81-year-old man with metastatic pancreatic cancer is admitted with an aspiration pneumonia. He has a feeding tube, is on home oxygen, and has had three hospitalizations in the last 4 months. He is 'full code' on admission. His daughter, the surrogate, says 'he'd want everything done.' During shift change, he becomes hypoxic. Code blue is called; CPR continues for 25 minutes; he survives in ICU on a ventilator with multi-organ failure. The family later asks 'why didn't anyone tell us this was coming?'",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            )),
            .bullets(title: "What was missed", [
                AttributedBullet("Goals-of-care conversation never explicitly held — 'full code' was assumed rather than affirmatively chosen with information.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Surrogate had no information about prognosis, what CPR actually involves, what survival looks like with metastatic pancreatic cancer.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Repeated hospitalizations in the prior 4 months were not recognized as a trigger for serious illness conversation.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Palliative care consult not requested despite stage IV disease and high symptom burden.", citationIDs: ["ahrq_psnet_2"])
            ]),
            .bullets(title: "What good communication looks like", [
                AttributedBullet("Surprise question — 'Would I be surprised if this patient died in the next year?' If no → trigger goals-of-care conversation.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("SPIKES protocol or similar structure for breaking bad news (Setting, Perception, Invitation, Knowledge, Empathy, Strategy).", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Specific language about CPR — '85% of CPR in advanced cancer ends in death; survivors are typically on a ventilator with limited recovery.'", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Early palliative care involvement improves quality of life AND survival in metastatic disease.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Document POLST/MOLST or advance directive; communicate clearly across team.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Nurse role: identify the gap, request goals-of-care conversation, support family during decision-making.", citationIDs: ["ahrq_teamstepps_2"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Default care without informed goals-of-care conversation often produces non-beneficial, distressing interventions for patients near end of life — and unrecognized harm to families who later ask 'why.' The nurse's role is to identify the gap, advocate for the conversation, and support the family through it. Early palliative involvement is an evidence-based standard, not a comfort-only consult. Honest communication is the kind care.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            ))
        ],
        citations: [ahrq2, ahrqPSNet2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Recognizing Delirium

public enum RecognizingDeliriumScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "recognizing-delirium-scenario",
        title: "Recognizing hypoactive delirium",
        subtitle: "Quiet patients can be the sickest",
        eyebrow: "SCENARIO · ASSESSMENT",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .cognition),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 79-year-old woman is admitted post-op from a hip fracture repair. The night nurse notes she is 'sleeping comfortably' on each round. The day nurse hands off 'easy patient, just lethargic from surgery.' On day 3, she is found unresponsive. CT shows a small subdural hematoma. Family later reports 'she was acting strange — not herself — for two days but she wasn't agitated so we thought it was OK.'",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            )),
            .bullets(title: "What was missed", [
                AttributedBullet("Hypoactive delirium is the most common form (60% of cases) and the most missed — quiet patients are not flagged.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("CAM screening was not performed despite high risk factors (age, post-op, hip fracture).", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Family observation of 'not herself' is highly sensitive but often dismissed as anxiety.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("'Sleeping comfortably' was decreased LOC, not normal sleep — distinction matters.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Delirium can be the presenting symptom of new neurologic catastrophe — CT was the missed step.", citationIDs: ["ahrq_psnet_2"])
            ]),
            .bullets(title: "What good practice looks like", [
                AttributedBullet("CAM screening every shift in at-risk patients (>65, post-op, ICU, baseline cognitive impairment).", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("Listen to family — 'not herself' is one of the most reliable triggers in older adults.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Distinguish 'sleeping' (rouseable, follows commands) from 'lethargic' (decreased LOC); document precisely.", citationIDs: ["ahrq_teamstepps_2"]),
                AttributedBullet("New altered mental status → reversible cause workup: vitals, glucose, electrolytes, UA, CXR, drug review, head imaging if focal/sudden.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Non-pharmacologic delirium prevention bundle — reorientation, glasses/hearing aids, mobility, sleep, hydration, deliriogenic medication review.", citationIDs: ["ahrq_teamstepps_2"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Hypoactive delirium is invisible to a system that watches for agitation. Active screening, family input, and prompt workup of altered mental status save lives. Quiet patients are not 'easy' — they require deliberate assessment. New AMS in an older patient is a vital sign change, not a personality change.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            ))
        ],
        citations: [ahrq2, ahrqPSNet2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Difficult Family Conversation

public enum DifficultFamilyScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "difficult-family-scenario",
        title: "Difficult family conversation",
        subtitle: "When family expectations diverge from medical reality",
        eyebrow: "SCENARIO · COMMUNICATION",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 68-year-old man is in the ICU with multi-organ failure from septic shock. After 7 days of maximum support, he is not improving. The medical team recommends transition to comfort care. His adult son, who lives out of state and arrived yesterday, says 'we don't give up on him — keep doing everything.' He is angry, distrustful of staff, and accuses the team of 'wanting him to die.' The bedside nurse is afraid of conflict and avoids the room.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            )),
            .bullets(title: "What's actually happening", [
                AttributedBullet("Anticipatory grief presenting as anger — common, predictable, and not personal.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Information asymmetry — son arrived to a situation that the family present has been adjusting to over a week; he is at day 1 of understanding day 7's reality.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Distrust often signals fear — 'are you giving up because of money / because he's old / because you don't care?' may be the underlying question.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Avoidance by bedside team escalates conflict — silence is interpreted as confirmation of bad faith.", citationIDs: ["ahrq_psnet_2"])
            ]),
            .bullets(title: "What good communication looks like", [
                AttributedBullet("NURSE NAME's empathic statement: 'I can hear you love your dad. I'm so sorry you're walking into this. Tell me what you're hoping for.'", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Listen first — what does the family understand, what do they fear, what are they hoping for?", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Family meeting with full team — physician, primary nurse, social work, chaplain, palliative if available; same information, same time, no contradictions.", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Reframe — not 'we are stopping treatment' but 'we are changing the focus of care to what will help him most now.'", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Ask about HIM — what mattered to him, what he would want — shifts decision-making from 'what we're doing to him' to 'what he would choose.'", citationIDs: ["ahrq_psnet_2"]),
                AttributedBullet("Time and pacing — family may need 24–48 hours to integrate; second meeting; allow expression of grief.", citationIDs: ["ahrq_psnet_2"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Difficult family conversations are the work, not the interruption. Anger and distrust at end of life are anticipatory grief, not pathology. The nurse's bedside presence — calm, available, listening — is part of the intervention. Avoidance escalates conflict; presence resolves it. The goal is not to win an argument but to walk with a family through the hardest moment of their life.",
                citationIDs: ["ahrq_teamstepps_2", "ahrq_psnet_2"]
            ))
        ],
        citations: [ahrq2, ahrqPSNet2],
        lastSourceFidelityReview: "2026-05-04"
    )
}
