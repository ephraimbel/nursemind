import Foundation

// Curator-model communication entries (batch 3) — the hard conversations.
// Audit-confirmed gaps: SPIKES existed only as a scenario bullet; death
// notification, chain-of-command escalation, error disclosure, incivility,
// and family presence during resuscitation had no dedicated entries.
// Sources: Open RN Nursing Fundamentals + Mental Health (CC BY 4.0), AHRQ
// TeamSTEPPS / CANDOR / PSNet (public domain), SPIKES (concept citation only).

private let openrnFund3 = CitationSource(
    id: "openrn_fundamentals_c3",
    shortName: "Open RN Nursing Fundamentals — Communication & Grief chapters",
    detail: "Open Resources for Nursing — Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingfundamentals/",
    lastRetrieved: "2026-07-03"
)

private let openrnMH3 = CitationSource(
    id: "openrn_mhcc_c3",
    shortName: "Open RN Nursing: Mental Health and Community Concepts",
    detail: "Open Resources for Nursing — Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingmhcc/",
    lastRetrieved: "2026-07-03"
)

private let ahrqTeamSTEPPSc3 = CitationSource(
    id: "ahrq_teamstepps_c3",
    shortName: "AHRQ TeamSTEPPS — Mutual Support & Advocacy modules",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/teamstepps-program/index.html",
    lastRetrieved: "2026-07-03"
)

private let ahrqCANDOR = CitationSource(
    id: "ahrq_candor_c3",
    shortName: "AHRQ CANDOR — Communication and Optimal Resolution Toolkit",
    detail: "Structured, honest communication after harm events",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/patient-safety/settings/hospital/candor/index.html",
    lastRetrieved: "2026-07-03"
)

private let ahrqPSNetC3 = CitationSource(
    id: "ahrq_psnet_c3",
    shortName: "AHRQ Patient Safety Network — Disruptive Behavior & Disclosure primers",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://psnet.ahrq.gov/",
    lastRetrieved: "2026-07-03"
)

private let spikesConcept = CitationSource(
    id: "spikes_baile_2000",
    shortName: "SPIKES protocol (Baile et al., 2000) — concept citation",
    detail: "Six-step protocol for delivering bad news; concept reference only",
    publisher: "The Oncologist",
    license: .factCitationOnly,
    url: "https://doi.org/10.1634/theoncologist.5-4-302",
    lastRetrieved: "2026-07-03"
)

private let mocSafetyTags3 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

private let psychTags3 = NCLEXTags(
    category: .psychosocialIntegrity,
    subcategory: .psychosocialIntegrity,
    priorityConcept: .mood
)

// MARK: - Breaking serious news (SPIKES)

public enum BreakingSeriousNewsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "breaking-serious-news",
        title: "Breaking serious news (SPIKES)",
        subtitle: "Setting · Perception · Invitation · Knowledge · Empathy · Strategy",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: psychTags3,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "SPIKES is a six-step structure for delivering serious news — a new cancer diagnosis, a devastating prognosis, an unexpected complication. The provider usually leads the disclosure itself, but the nurse is in the room before, during, and long after: assessing what the patient understood, catching the questions that surface an hour later, and carrying the emotional follow-through. Knowing the structure makes the nurse an active participant in the conversation rather than a bystander to it.",
                citationIDs: ["spikes_baile_2000", "openrn_fundamentals_c3"]
            )),
            .bullets(title: "The six steps", [
                AttributedBullet("S — Setting: privacy, everyone seated, tissues within reach, phones silenced, the right people present (ask the patient who they want), and enough uninterrupted time. Getting the room wrong undermines everything said in it.", citationIDs: ["spikes_baile_2000"]),
                AttributedBullet("P — Perception: before telling, ask. 'What have you been told about your results so far?' reveals understanding, denial, and the gap the conversation must cross.", citationIDs: ["spikes_baile_2000"]),
                AttributedBullet("I — Invitation: ask how much the patient wants to know. 'Some people want every detail; others want the headline and their family handles the rest. What do you prefer?'", citationIDs: ["spikes_baile_2000"]),
                AttributedBullet("K — Knowledge: warn, then tell, plainly. 'I'm afraid I have serious news.' Then short sentences, no jargon, no euphemisms, information in small pieces with pauses to check understanding.", citationIDs: ["spikes_baile_2000"]),
                AttributedBullet("E — Empathy: name and validate the emotion before returning to information. 'I can see this is overwhelming.' Silence and presence do more here than any fact.", citationIDs: ["spikes_baile_2000", "openrn_fundamentals_c3"]),
                AttributedBullet("S — Strategy and summary: end with a concrete next step — the follow-up appointment, the referral, who will call and when. Serious news without a plan abandons the patient inside it.", citationIDs: ["spikes_baile_2000"])
            ]),
            .bullets(title: "The nurse's role around the conversation", [
                AttributedBullet("Before: make sure the setting actually happens — flag it if the provider is about to disclose in a hallway or with the roommate's TV on.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("During: watch the patient's comprehension, not just the provider's delivery; note where they stopped absorbing.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("After: patients retain a fraction of what follows bad news. Return, sit, and ask 'What is your understanding of what the team told you?' — then fill gaps or route questions back to the provider.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Avoid false reassurance ('everything will be fine') and premature cheerleading — validated emotion, honest presence, and a clear plan are the therapeutic tools.", citationIDs: ["openrn_mhcc_c3"]),
                AttributedBullet("Document what was disclosed, by whom, who was present, and the patient's response — continuity depends on the next shift knowing what this patient has been told.", citationIDs: ["openrn_fundamentals_c3"])
            ]),
            .prose(title: "Why it matters", AttributedProse(
                "How serious news is delivered changes what patients remember, whether they trust the team, and how they cope with what follows. Structure is not coldness — it is the discipline that keeps the conversation about the patient's needs instead of the clinician's discomfort.",
                citationIDs: ["spikes_baile_2000", "openrn_fundamentals_c3"]
            ))
        ],
        citations: [spikesConcept, openrnFund3, openrnMH3],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Death notification and bereavement

public enum DeathNotificationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "death-notification-bereavement",
        title: "Death notification and bereavement care",
        subtitle: "Say 'died' — clarity is a kindness",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: psychTags3,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Telling a family that their person has died, and caring for them in the hours that follow, is among the most consequential communication a nurse participates in. Families remember these minutes for the rest of their lives — the words used, who sat with them, whether they were rushed. The clinical work of the death is small; the human work is the shift.",
                citationIDs: ["openrn_fundamentals_c3"]
            )),
            .bullets(title: "The notification itself", [
                AttributedBullet("Use the words 'died' or 'death.' Euphemisms — 'passed on,' 'didn't make it,' 'lost him' — create genuine confusion in shock and force the family to ask the unbearable question twice.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Private room, everyone seated, no barriers between you and the family; identify yourself and confirm who they are to the patient before anything else.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("A brief warning shot, then the fact, then silence: 'I'm so sorry — I have very hard news. Despite everything the team did, John died a few minutes ago.' Then stop talking and let the reaction happen.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Answer questions honestly and simply; 'I don't know, but I will find out' is a complete answer. Avoid clinical play-by-play unless asked.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Expect the full range — silence, wailing, anger, physical collapse, disbelief. None of it is directed at you; all of it is normal acute grief.", citationIDs: ["openrn_mhcc_c3"])
            ]),
            .bullets(title: "The hours after", [
                AttributedBullet("Offer time with the body, and prepare the room first: lines and devices per policy (and per medical examiner status), the patient clean and covered, lighting soft, chairs at the bedside. Families should see a person, not a procedure site.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Ask about religious, spiritual, and cultural needs rather than assuming — rituals around the body, who may touch it, timing requirements for burial. Chaplaincy is a call away and covers all traditions.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Know what is protocol before the family asks: medical-examiner criteria (unexpected deaths, deaths within 24 hours of admission, falls, procedures) may restrict what can be removed or touched.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Organ and tissue donation is raised by the trained requestor per federal/organizational process — not improvised at the bedside. The nurse's role is timely referral and supporting whatever the family decides.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Give the family a concrete next-steps path — belongings, death certificate, funeral home contact — in writing when possible; nothing said aloud in acute grief is reliably retained.", citationIDs: ["openrn_mhcc_c3"]),
                AttributedBullet("Debrief yourself and your colleagues — deaths accumulate. Using the unit's support structures is professionalism, not weakness.", citationIDs: ["openrn_mhcc_c3"])
            ]),
            .prose(title: "Why it matters", AttributedProse(
                "Bereaved families rarely remember the resuscitation pharmacology; they remember whether someone said the true word, sat down, and treated their person's body with tenderness. Complicated grief is shaped in part by how the death was communicated. This is nursing care where the patient is the family.",
                citationIDs: ["openrn_fundamentals_c3", "openrn_mhcc_c3"]
            ))
        ],
        citations: [openrnFund3, openrnMH3],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Chain of command escalation

public enum ChainOfCommandSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "chain-of-command-escalation",
        title: "Escalating up the chain of command",
        subtitle: "When the answer doesn't match the patient in front of you",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: mocSafetyTags3,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Chain-of-command escalation is the formal pathway a nurse uses when a patient-safety concern is not resolved at the first level — a provider who won't come to the bedside, an order that seems dangerous, a deteriorating patient nobody is acting on. It is not insubordination and not a complaint process; it is a patient-safety mechanism the organization requires you to use, and its existence protects both the patient and the nurse who invokes it.",
                citationIDs: ["ahrq_teamstepps_c3", "openrn_fundamentals_c3"]
            )),
            .bullets(title: "When to invoke it", [
                AttributedBullet("You've used CUS and the Two-Challenge Rule with the responsible provider and the concern remains unaddressed.", citationIDs: ["ahrq_teamstepps_c3"]),
                AttributedBullet("The provider cannot be reached within a timeframe the patient's condition tolerates.", citationIDs: ["ahrq_teamstepps_c3"]),
                AttributedBullet("You are directed to do something you believe is unsafe or outside your scope — declining and escalating is the professional standard, not a workplace conflict.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("The patient is deteriorating and the current plan isn't responding to that fact — rapid response teams exist precisely as a parallel escalation lane and require no one's permission.", citationIDs: ["ahrq_teamstepps_c3"])
            ]),
            .bullets(title: "How to do it well", [
                AttributedBullet("Know your ladder before you need it — typically: bedside nurse → charge nurse → house supervisor/nurse manager → attending of record or service chief → hospital administration on call. Rapid response runs alongside at any point for clinical deterioration.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Escalate the concern, not the person: 'I need help resolving a safety concern' lands differently than a complaint, and keeps the pathway usable tomorrow.", citationIDs: ["ahrq_teamstepps_c3"]),
                AttributedBullet("Bring data, in SBAR form, at every level — the vital-sign trend, the order in question, what you asked for, what was said. Each rung should hear the same clean story.", citationIDs: ["ahrq_teamstepps_c3"]),
                AttributedBullet("Stay with the patient while someone else climbs the ladder when the situation is acute — delegation of the phone tree is part of the skill.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Document contemporaneously: times, names, exactly what you communicated, and responses. This is care documentation, not evidence-gathering — but it is also both.", citationIDs: ["openrn_fundamentals_c3"])
            ]),
            .prose(title: "Why it matters", AttributedProse(
                "Root-cause analyses of preventable deaths repeatedly find a nurse who was right, early, and unheard — and who stopped one rung too low. The chain of command converts individual worry into organizational action. Using it is not going over someone's head; it is doing your job all the way to the end.",
                citationIDs: ["ahrq_teamstepps_c3", "ahrq_psnet_c3"]
            ))
        ],
        citations: [ahrqTeamSTEPPSc3, ahrqPSNetC3, openrnFund3],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Error disclosure

public enum ErrorDisclosureSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "error-disclosure",
        title: "Error disclosure to patients and families",
        subtitle: "Honesty after harm — the CANDOR approach",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: mocSafetyTags3,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "When care causes harm, patients are owed a prompt, honest account — what happened, what it means for them, and what will change. AHRQ's CANDOR process (Communication and Optimal Resolution) structures this: early acknowledgment, ongoing communication as facts emerge, support for the patient and family, and support for the involved clinicians. Disclosure is an organizational process the nurse participates in — not a solo confession and not something to improvise at the bedside.",
                citationIDs: ["ahrq_candor_c3"]
            )),
            .bullets(title: "What the nurse does — and doesn't — own", [
                AttributedBullet("Immediate clinical duty comes first: stabilize and monitor the patient, then report the event through the incident system and to the provider/charge nurse promptly.", citationIDs: ["ahrq_candor_c3", "openrn_fundamentals_c3"]),
                AttributedBullet("Be honest in the moment without speculating: 'Something happened with your medication that shouldn't have. We're looking into exactly what occurred, and the team will sit down with you.' Never pretend nothing happened — patients almost always know.", citationIDs: ["ahrq_candor_c3"]),
                AttributedBullet("The formal disclosure conversation is typically led by the provider/disclosure-trained leaders with the nurse participating — timing, attendees, and content are coordinated, not ad hoc.", citationIDs: ["ahrq_candor_c3"]),
                AttributedBullet("Empathy is always safe: 'I am so sorry this happened to you' expresses care. Assigning blame, guessing at causes, or promising outcomes of the review is where informal disclosure goes wrong.", citationIDs: ["ahrq_candor_c3"]),
                AttributedBullet("Document facts — what occurred, assessments, notifications, interventions — in the chart; the incident report itself stays out of the chart per policy.", citationIDs: ["openrn_fundamentals_c3"])
            ]),
            .bullets(title: "The just-culture frame", [
                AttributedBullet("Most errors are system failures wearing a person's badge — look-alike vials, interruption-dense med passes, gaps in verification design. Reporting exists to fix systems, not to catalog blame.", citationIDs: ["ahrq_psnet_c3"]),
                AttributedBullet("Honest disclosure and robust reporting rise and fall together: units where errors are hidden from patients also hide them from the systems that could prevent recurrence.", citationIDs: ["ahrq_candor_c3", "ahrq_psnet_c3"]),
                AttributedBullet("The involved clinician is CANDOR's 'second victim' — debriefing and peer support after a harm event are part of the protocol, and using them protects your future patients too.", citationIDs: ["ahrq_candor_c3"])
            ]),
            .prose(title: "Why it matters", AttributedProse(
                "Families who receive prompt, honest disclosure report less anger and more trust — and organizations with structured disclosure programs learn faster from their failures. The instinct to minimize or stay silent protects no one: not the patient, who senses it; not the nurse, who carries it; and not the next patient, who inherits the unfixed system.",
                citationIDs: ["ahrq_candor_c3", "ahrq_psnet_c3"]
            ))
        ],
        citations: [ahrqCANDOR, ahrqPSNetC3, openrnFund3],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Workplace incivility and bullying

public enum WorkplaceIncivilitySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "workplace-incivility",
        title: "Incivility, bullying, and the silenced nurse",
        subtitle: "Disruptive behavior is a patient-safety hazard, not a personality clash",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: mocSafetyTags3,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Incivility (rudeness, eye-rolling, public criticism), bullying (repeated, targeted mistreatment with a power gradient), and disruptive behavior from any discipline are not merely unpleasant — they are measurably dangerous. Teams exposed to rudeness perform worse on diagnostic and procedural tasks, and nurses who expect hostility stop calling, stop questioning, and stop escalating. The classic patient-safety case is the nurse who didn't call the notoriously abusive physician at 2 AM.",
                citationIDs: ["ahrq_psnet_c3", "openrn_fundamentals_c3"]
            )),
            .bullets(title: "Recognize the patterns", [
                AttributedBullet("Overt: yelling, insults, public humiliation, throwing instruments, refusing to answer pages.", citationIDs: ["ahrq_psnet_c3"]),
                AttributedBullet("Covert: eye-rolling, exclusion, withholding information, unfair assignments, sabotage-by-silence — the forms most common between nurses.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("'Nurses eat their young' is the cultural alias for new-graduate bullying — normalized hazing is still bullying, and new grads leave units (and the profession) over it.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("The safety signature: staff altering clinical behavior to avoid a person — batching questions, delaying calls, guessing instead of clarifying orders.", citationIDs: ["ahrq_psnet_c3"])
            ]),
            .bullets(title: "What to do — in the moment and after", [
                AttributedBullet("Use DESC for the direct conversation: Describe the specific behavior, Express its effect, Suggest the alternative, state Consequences. Scripted assertion beats improvised confrontation.", citationIDs: ["ahrq_teamstepps_c3"]),
                AttributedBullet("Rehearse short responses in advance ('cognitive rehearsal'): 'I'll continue this conversation when we can speak professionally.' Practiced lines survive adrenaline; improvised ones don't.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Never let hostility gate patient care: if you need the order, the assessment, or the presence, pursue it through the chain of command while the behavior issue is handled separately.", citationIDs: ["ahrq_teamstepps_c3"]),
                AttributedBullet("Document factually and report through the designated pathway — dates, quotes, witnesses. Patterns move organizations; isolated venting doesn't.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("If you witness it, support the target in the moment and afterward — bystander silence is what makes units unsafe to speak up in.", citationIDs: ["ahrq_teamstepps_c3"])
            ]),
            .prose(title: "Why it matters", AttributedProse(
                "Every safety tool in this library — CUS, SBAR, rapid response, chain of command — assumes a nurse willing to use it. Incivility is the solvent that dissolves that willingness. Treating disruptive behavior as a reportable safety hazard, rather than a personal problem to endure, is how units keep their communication tools functional at 2 AM, when they matter most.",
                citationIDs: ["ahrq_psnet_c3", "ahrq_teamstepps_c3"]
            ))
        ],
        citations: [ahrqPSNetC3, ahrqTeamSTEPPSc3, openrnFund3],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Family communication during deterioration and resuscitation

public enum FamilyDuringCrisisSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "family-communication-crisis",
        title: "Talking with families during deterioration and codes",
        subtitle: "Honest uncertainty, structured updates, and family presence",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: psychTags3,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "When a patient deteriorates — a rapid response, an ICU transfer, a code — the family's crisis runs parallel to the patient's, and it is almost always a nurse who carries the communication. The skills are specific: delivering honest uncertainty without false reassurance, updating on a rhythm the family can rely on, and supporting family presence during resuscitation, which professional organizations endorse as an option offered through a dedicated support person.",
                citationIDs: ["openrn_fundamentals_c3", "ahrq_psnet_c3"]
            )),
            .bullets(title: "During acute deterioration", [
                AttributedBullet("Assign the communication: in any prolonged emergency, one person — often the charge nurse, chaplain, or a designated nurse — owns family updates so the family isn't chasing information from whoever exits the room.", citationIDs: ["ahrq_teamstepps_c3"]),
                AttributedBullet("Set an update rhythm and keep it: 'I will come back to you in about 20 minutes even if nothing has changed.' The promise of the next update is itself an intervention against panic.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Use honest uncertainty language: 'He is very sick. The team is doing everything we planned for this situation. I don't know yet how he will respond.' Never promise outcomes; never say 'fine.'", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Translate without minimizing — 'his blood pressure dropped and we're using medication to support it' beats both jargon and vagueness.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("Ask early about decision-makers and documents: who holds healthcare power of attorney, and whether an advance directive exists — before the moment it's needed.", citationIDs: ["openrn_fundamentals_c3"])
            ]),
            .bullets(title: "Family presence during resuscitation", [
                AttributedBullet("Offering family the option to be present during resuscitation is supported by major emergency and critical-care nursing organizations — witnessed resuscitation is associated with less complicated grief and no demonstrated harm to care quality.", citationIDs: ["openrn_fundamentals_c3", "ahrq_psnet_c3"]),
                AttributedBullet("It requires a dedicated facilitator: one staff member stays with the family, explains what they are seeing in real time, and escorts them in and out. Presence without a guide is abandonment at the worst possible moment.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("It is an offer, not an expectation — some families decline, and both choices deserve support. Screen for situations where presence isn't appropriate per policy.", citationIDs: ["openrn_fundamentals_c3"]),
                AttributedBullet("If the code ends in death, the facilitator's role flows directly into bereavement care — the family who witnessed the effort rarely asks 'did they do everything?'", citationIDs: ["openrn_fundamentals_c3"])
            ]),
            .prose(title: "Why it matters", AttributedProse(
                "Families in crisis form their entire judgment of the hospital — and much of their long-term grief trajectory — from how they were spoken to while the outcome was still unknown. A reliable update rhythm, honest uncertainty, and a guided place at the bedside cost the team minutes and change what the family carries for years.",
                citationIDs: ["openrn_fundamentals_c3", "ahrq_psnet_c3"]
            ))
        ],
        citations: [openrnFund3, ahrqTeamSTEPPSc3, ahrqPSNetC3],
        lastSourceFidelityReview: "2026-07-03"
    )
}
