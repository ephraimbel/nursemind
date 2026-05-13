import Foundation

// Curator-model communication entries (batch 2).
// Sources: Open RN Nursing Fundamentals — Communication chapter (CC BY 4.0),
// Open RN Mental Health (CC BY 4.0), AHRQ (public domain), CMS / HHS Office for
// Civil Rights for limited English proficiency (public domain), Studer Group AIDET
// (concept citation only), CPI / verbal de-escalation principles (concept citation).

private let openrnFundamentals = CitationSource(
    id: "openrn_fundamentals_comm",
    shortName: "Open RN Nursing Fundamentals — Communication chapter",
    detail: "Open Resources for Nursing — Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingfundamentals/?s=communication+therapeutic",
    lastRetrieved: "2026-05-04"
)

private let openrnMentalHealth = CitationSource(
    id: "openrn_mental_health",
    shortName: "Open RN Nursing: Mental Health and Community Concepts — Therapeutic Communication",
    detail: "Open Resources for Nursing — Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingmhcc/?s=therapeutic+communication+mental+health",
    lastRetrieved: "2026-05-04"
)

private let aidet = CitationSource(
    id: "aidet_studer",
    shortName: "AIDET communication framework (concept citation)",
    detail: "Studer Group framework — concept reference only; copyrighted training materials not reproduced",
    publisher: "Studer Group",
    license: .factCitationOnly,
    url: "https://studergroup.com/",
    lastRetrieved: "2026-05-04"
)

private let hhsOcr = CitationSource(
    id: "hhs_ocr_lep",
    shortName: "HHS Office for Civil Rights — Limited English Proficiency Guidance",
    detail: "Federal civil rights requirements for language access in healthcare",
    publisher: "U.S. Department of Health and Human Services, Office for Civil Rights",
    license: .publicDomain,
    url: "https://www.hhs.gov/civil-rights/for-individuals/special-topics/limited-english-proficiency/index.html",
    lastRetrieved: "2026-05-04"
)

private let safetyCommTags2 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

private let psychTags = NCLEXTags(
    category: .psychosocialIntegrity,
    subcategory: .psychosocialIntegrity,
    priorityConcept: .mood
)

// MARK: - Therapeutic Communication

public enum TherapeuticCommunicationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "therapeutic-communication",
        title: "Therapeutic communication",
        subtitle: "Patient-centered, purposeful, healing dialogue",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: psychTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Therapeutic communication is purposeful, patient-centered communication that promotes understanding and supports the patient's emotional and physical wellbeing. It is the foundation of the nurse-patient relationship and a fundamental nursing competency. Therapeutic techniques convey acceptance, encourage expression, and help the patient process their experience without imposing the nurse's values or solutions.",
                citationIDs: ["openrn_fundamentals_comm", "openrn_mental_health"]
            )),
            .bullets(title: "Core therapeutic techniques", [
                AttributedBullet("Active listening — full attention, non-verbal acknowledgment, no interrupting.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Open-ended questions — invite expression: 'Tell me about how you've been feeling.'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Restating and reflecting — show you heard: 'It sounds like you're worried about going home alone.'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Clarifying — confirm understanding: 'When you say you're tired, can you tell me what that feels like?'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Silence — gives the patient time to think and respond.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Offering self — your presence is the intervention: 'I'll sit with you for a few minutes.'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Focusing — gently redirect to the relevant topic.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Summarizing — close the conversation by recapping: 'So we've talked about your pain plan and your discharge worries.'", citationIDs: ["openrn_mental_health"])
            ]),
            .bullets(title: "Non-therapeutic responses to AVOID", [
                AttributedBullet("Giving false reassurance: 'Don't worry, everything will be fine.'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Asking 'why' — sounds accusatory; ask 'what' or 'how' instead.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Giving advice — replaces patient autonomy with your judgment.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Disagreeing or arguing — closes the dialogue.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Changing the subject when topics are uncomfortable.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Approving or disapproving — implies your judgment is the standard.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Defending — colleagues, the system, the institution.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Probing — pressing for information the patient is not ready to share.", citationIDs: ["openrn_mental_health"])
            ]),
            .prose(title: "Why it matters", AttributedProse(
                "Therapeutic communication is not a soft skill — it is the mechanism by which most other nursing interventions become possible. Patients who feel heard are more adherent to treatment, more honest about symptoms, more likely to disclose suicidal ideation or substance use, and more satisfied with their care. The therapeutic relationship is itself an intervention.",
                citationIDs: ["openrn_mental_health"]
            ))
        ],
        citations: [openrnFundamentals, openrnMentalHealth],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Active Listening

public enum ActiveListeningSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "active-listening",
        title: "Active listening",
        subtitle: "Full presence, full attention, no interruption",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: psychTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Active listening is the deliberate practice of giving a patient your complete attention — verbally, non-verbally, and cognitively — so that they feel heard and understood. It requires setting aside your own agenda, distractions, and the urge to respond, and instead focusing on what the patient is actually saying and what they mean.",
                citationIDs: ["openrn_mental_health"]
            )),
            .bullets(title: "How to do it well", [
                AttributedBullet("Sit at eye level when possible — standing over the patient is intimidating.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Maintain culturally appropriate eye contact.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Lean slightly forward and uncross your arms — open posture signals receptivity.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Put away your phone, tablet, and computer; close the door if appropriate.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Allow silence after the patient stops — they may have more to say.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Use minimal encouragers — nodding, 'mm-hmm,' 'go on.'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Reflect back what you heard before responding: 'It sounds like you're afraid the surgery won't help.'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Resist the urge to interrupt, fix, or move on prematurely.", citationIDs: ["openrn_mental_health"])
            ]),
            .bullets(title: "Common barriers", [
                AttributedBullet("Time pressure — even 2 minutes of true attention beats 10 minutes of distracted listening.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Mentally rehearsing your response while the patient is still speaking.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Documentation — try to listen first, document after.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Personal discomfort with strong emotion — sit with it; you do not have to fix it.", citationIDs: ["openrn_mental_health"])
            ])
        ],
        citations: [openrnMentalHealth, openrnFundamentals],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Therapeutic Silence

public enum TherapeuticSilenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "therapeutic-silence",
        title: "Therapeutic silence",
        subtitle: "The space the patient needs to think",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: psychTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Therapeutic silence is the deliberate use of pause and quiet during a conversation to give the patient time to think, formulate a response, process emotion, or simply be present. It is one of the most under-used and most powerful therapeutic techniques in nursing.",
                citationIDs: ["openrn_mental_health"]
            )),
            .bullets(title: "When to use it", [
                AttributedBullet("After asking an open-ended question — give the patient space to think before answering.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("When the patient is processing difficult news — diagnosis, prognosis, loss.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("When the patient is crying — your presence is the comfort; words may not be.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("When the patient is angry — silence allows them to express without escalation.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("After delivering teaching or instructions — gives time to absorb.", citationIDs: ["openrn_mental_health"])
            ]),
            .bullets(title: "How to do it without discomfort", [
                AttributedBullet("Stay physically present — sitting near the patient, calm posture, soft eye contact.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Resist the urge to fill the silence — count slowly to 10 in your head if needed.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Watch non-verbal cues — facial expression, body language, breathing pattern.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("If the silence becomes prolonged and uncomfortable, a gentle prompt is appropriate: 'Take your time.' or 'I'm here whenever you're ready.'", citationIDs: ["openrn_mental_health"])
            ])
        ],
        citations: [openrnMentalHealth],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Open vs Closed Questions

public enum OpenClosedQuestionsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "open-closed-questions",
        title: "Open- vs closed-ended questions",
        subtitle: "Choosing the right tool for the moment",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: psychTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Open-ended questions invite the patient to elaborate; closed-ended questions request a specific piece of information. Both are useful — the skill is choosing the right type for the moment. Most therapeutic interviews lead with open-ended questions and follow up with closed-ended ones to clarify specifics.",
                citationIDs: ["openrn_mental_health"]
            )),
            .keyValueTable(title: "When to use each", [
                KeyValueRow(key: "Open-ended", value: "Building rapport, eliciting story, exploring emotion, assessing understanding."),
                KeyValueRow(key: "Closed-ended", value: "Specific clinical data, time constraints, confirming details, urgent decisions.")
            ]),
            .bullets(title: "Open-ended examples", [
                AttributedBullet("'Tell me about how you've been feeling since the surgery.'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("'What's going on at home that has you worried about discharge?'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("'How would you describe the pain?'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("'What questions do you have for me about the medication?'", citationIDs: ["openrn_mental_health"])
            ]),
            .bullets(title: "Closed-ended examples", [
                AttributedBullet("'Are you having chest pain right now? Yes or no?'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("'What's the date today?'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("'Did you take your medication this morning?'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("'On a 0–10 scale, what is your pain right now?'", citationIDs: ["openrn_mental_health"])
            ]),
            .bullets(title: "Common errors", [
                AttributedBullet("Overusing closed-ended questions — turns the interview into an interrogation and misses what the patient wants to say.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Asking 'why' — sounds accusatory. Replace with 'what' or 'how': 'What do you think is making it worse?' rather than 'Why didn't you take your medicine?'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Stacking multiple questions — 'How are you feeling, are you in pain, are you nauseous?' overwhelms the patient and gets a partial answer.", citationIDs: ["openrn_mental_health"])
            ])
        ],
        citations: [openrnMentalHealth, openrnFundamentals],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Reflection / Restating / Clarifying

public enum ReflectionRestatingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "reflection-restating-clarifying",
        title: "Reflection, restating, clarifying",
        subtitle: "Showing you heard — and checking that you heard right",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: psychTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Reflection, restating, and clarifying are three closely related therapeutic techniques that confirm the patient was heard and verify that you understood correctly. They build trust, slow the conversation, and surface misunderstandings before they cause harm. Each has a slightly different purpose.",
                citationIDs: ["openrn_mental_health"]
            )),
            .keyValueTable(title: "Three techniques compared", [
                KeyValueRow(key: "Restating", value: "Repeat back the patient's main idea in your own words to confirm content."),
                KeyValueRow(key: "Reflecting", value: "Mirror back the emotion, not just the words: 'It sounds like that was frightening.'"),
                KeyValueRow(key: "Clarifying", value: "Ask for explanation when something is unclear: 'When you say you're \"not yourself,\" can you describe that?'")
            ]),
            .bullets(title: "Examples", [
                AttributedBullet("Patient: 'I just don't think this medication is working.' Restating: 'You feel like the medication isn't doing what you hoped.'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Patient: 'I haven't been able to sleep at all since I came home.' Reflecting: 'It sounds exhausting, and maybe a little scary not to be able to rest.'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Patient: 'I just feel off.' Clarifying: 'Can you describe what \"off\" feels like? Is it physical, emotional, both?'", citationIDs: ["openrn_mental_health"])
            ]),
            .bullets(title: "How to do it well", [
                AttributedBullet("Use the patient's own words when possible — substituting medical terms for patient terms can feel dismissive.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Reflect emotion gently — 'It sounds like…' or 'I wonder if…' invites correction without imposing.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("If you reflect wrong, the patient will correct you — that itself is therapeutic; you are still listening.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Avoid parroting word-for-word — that comes across as mechanical. Paraphrase.", citationIDs: ["openrn_mental_health"])
            ])
        ],
        citations: [openrnMentalHealth],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - AIDET

public enum AIDETSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "aidet",
        title: "AIDET",
        subtitle: "Acknowledge · Introduce · Duration · Explanation · Thank",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags2,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "AIDET is a five-step communication framework widely used in healthcare to standardize how staff initiate, perform, and conclude patient interactions. It improves patient experience scores and reduces anxiety by setting clear expectations every time a clinician enters a patient encounter.",
                citationIDs: ["aidet_studer"]
            )),
            .keyValueTable(title: "The five steps", [
                KeyValueRow(key: "A — Acknowledge", value: "Greet the patient by name; make eye contact; smile."),
                KeyValueRow(key: "I — Introduce", value: "Your name, role, and credentials; manage up the team if applicable."),
                KeyValueRow(key: "D — Duration", value: "How long the encounter, procedure, or wait will take."),
                KeyValueRow(key: "E — Explanation", value: "What you're going to do, why, and what the patient will experience."),
                KeyValueRow(key: "T — Thank", value: "Thank the patient (and family) for their cooperation, patience, or for choosing your facility.")
            ]),
            .prose(title: "Example", AttributedProse(
                "A: 'Good morning, Mrs. Jenkins.' I: 'I'm Sarah, the nurse taking care of you today — I'm a registered nurse and I'll be your nurse from now until 7pm.' D: 'I'll be in to check on you about every two hours, and I should be able to come right away when you press the call light.' E: 'I'm going to listen to your heart and lungs, check your IV, and we'll go over your morning medications together.' T: 'Thank you for being patient while I get set up.'",
                citationIDs: ["aidet_studer"]
            )),
            .bullets(title: "Why it works", [
                AttributedBullet("Reduces patient anxiety by setting clear expectations.", citationIDs: ["aidet_studer"]),
                AttributedBullet("Builds trust and confidence through consistent introduction of credentials.", citationIDs: ["aidet_studer"]),
                AttributedBullet("Manages perceived wait times — explained waits feel shorter than unexplained waits.", citationIDs: ["aidet_studer"]),
                AttributedBullet("Improves HCAHPS patient experience scores in many published implementations.", citationIDs: ["aidet_studer"])
            ])
        ],
        citations: [aidet],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Verbal De-escalation

public enum VerbalDeescalationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "verbal-deescalation",
        title: "Verbal de-escalation",
        subtitle: "Working safely with an agitated patient",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: psychTags,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Verbal de-escalation is the use of communication, body language, and environmental control to reduce agitation in a distressed or threatening patient before it escalates to physical violence. It is the safest first response to behavioral emergencies — restraint and medication should be reserved for situations where verbal de-escalation has failed and the patient or others are at imminent risk.",
                citationIDs: ["openrn_mental_health"]
            )),
            .bullets(title: "Approach the situation", [
                AttributedBullet("Ensure your own safety first — keep clear access to the door; never let the patient between you and the exit.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Have a colleague nearby; use a buddy system; alert security per facility protocol.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Remove or secure environmental hazards — IV poles, cords, sharp objects, items that can be thrown.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Reduce stimulation — quiet voice, dim lights if possible, fewer people in the room.", citationIDs: ["openrn_mental_health"])
            ]),
            .bullets(title: "Verbal techniques", [
                AttributedBullet("Lower your voice — tempting to match volume, but a calm low voice often de-escalates.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Use short, simple sentences — agitated patients have reduced cognitive bandwidth.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Validate the emotion: 'I can see you're really frustrated. That makes sense.'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Offer realistic choices to restore a sense of control: 'Would you like to sit and talk, or would some water help?'", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Avoid arguing, defending the institution, or reasoning — emotion overrides logic in agitation.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Set clear, calm limits when needed: 'I want to help. I can't do that while you're yelling. Let's lower our voices.'", citationIDs: ["openrn_mental_health"])
            ]),
            .bullets(title: "Body language", [
                AttributedBullet("Open posture — arms uncrossed, hands visible.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Stand at an angle, not directly facing the patient — less confrontational.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Maintain at least an arm's-length distance — closer is threatening, further is dismissive.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Soft eye contact, not staring.", citationIDs: ["openrn_mental_health"])
            ]),
            .bullets(title: "When verbal de-escalation is not enough", [
                AttributedBullet("Imminent danger to self or others — call security and a rapid response/code grey per facility.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Show-of-force as a last verbal step — multiple staff visibly present can sometimes prevent the need for restraint.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Pharmacologic intervention per provider order — least restrictive effective dose.", citationIDs: ["openrn_mental_health"]),
                AttributedBullet("Physical restraint is a last resort — requires provider order, frequent reassessment, and 1:1 monitoring per facility policy.", citationIDs: ["openrn_mental_health"])
            ])
        ],
        citations: [openrnMentalHealth],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Interpreter Use

public enum InterpreterUseSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "interpreter-use",
        title: "Working with an interpreter",
        subtitle: "Limited English proficiency · qualified medical interpreter",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags2,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "Patients with limited English proficiency (LEP) have a federal civil rights guarantee under Title VI of the Civil Rights Act and Section 1557 of the Affordable Care Act to qualified medical interpreter services at no cost. Using a qualified medical interpreter — not a family member, not a stranger, not a bilingual staff member without medical interpreter training — is both a legal requirement and the standard of care.",
                citationIDs: ["hhs_ocr_lep"]
            )),
            .bullets(title: "Why qualified interpreters (not family or unqualified staff)", [
                AttributedBullet("Medical accuracy — interpreters are trained in medical terminology and ethical standards.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Confidentiality — family members are not bound by HIPAA in the same way.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Consent integrity — informed consent obtained through a family member is at high risk of being incomplete or inaccurate.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Sensitive topics — patients are far less likely to disclose mental health, substance use, intimate partner violence, or sexual health to a family interpreter.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Children should never be used as interpreters except in immediate emergencies.", citationIDs: ["hhs_ocr_lep"])
            ]),
            .bullets(title: "How to work with an interpreter", [
                AttributedBullet("Brief the interpreter on the goals of the conversation before entering the room when possible.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Address the patient directly, not the interpreter — speak to the patient and look at the patient.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Use first-person 'I' statements — 'I'm going to give you a shot' — not 'Tell her I'm going to give her a shot.'", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Speak in short sentences and pause to allow interpretation.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Use plain language — avoid medical jargon, idioms, and slang.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Confirm understanding using teach-back: 'Can you tell me in your own words what you'll do when you get home?'", citationIDs: ["hhs_ocr_lep"])
            ]),
            .bullets(title: "Modes of interpretation", [
                AttributedBullet("In-person — preferred for complex, sensitive, or end-of-life discussions.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Video remote interpretation (VRI) — second-best for most encounters; preserves facial cues.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Telephone — adequate for brief encounters; loses non-verbal information.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Document the interpreter type, language, and (when applicable) interpreter ID in the chart.", citationIDs: ["hhs_ocr_lep"])
            ]),
            .bullets(title: "Common errors", [
                AttributedBullet("Defaulting to a family member 'because it's faster' — legal and clinical risk.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Speaking too long without pausing — interpreter loses parts of the message.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Speaking to the interpreter rather than the patient — diminishes the patient's role.", citationIDs: ["hhs_ocr_lep"]),
                AttributedBullet("Skipping interpreter for 'simple' questions — consent, discharge teaching, medication reconciliation are never simple.", citationIDs: ["hhs_ocr_lep"])
            ])
        ],
        citations: [hhsOcr],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - SBARQ (closing the loop with questions)

public enum SBARQSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "sbarq",
        title: "SBARQ",
        subtitle: "SBAR + Q for Questions",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: safetyCommTags2,
        sections: [
            .prose(title: "What it is", AttributedProse(
                "SBARQ is an extension of the standard SBAR framework that explicitly invites the receiving clinician to ask questions before the call ends. The added Q step is a small change with a meaningful safety effect — it standardizes the moment when misunderstandings would otherwise become missed orders or missed information.",
                citationIDs: ["openrn_fundamentals_comm"]
            )),
            .keyValueTable(title: "Quick template", [
                KeyValueRow(key: "S — Situation", value: "Who you are, who the patient is, what's happening NOW."),
                KeyValueRow(key: "B — Background", value: "Relevant medical history, admit reason, current course."),
                KeyValueRow(key: "A — Assessment", value: "Your clinical assessment, vitals, what you think is going on."),
                KeyValueRow(key: "R — Recommendation", value: "What you need from them — order, evaluation, transfer."),
                KeyValueRow(key: "Q — Questions", value: "'Do you have any questions for me?' Wait for an answer.")
            ]),
            .bullets(title: "Why the Q matters", [
                AttributedBullet("Surfaces missing information before the receiving clinician acts on an incomplete picture.", citationIDs: ["openrn_fundamentals_comm"]),
                AttributedBullet("Catches receiver-side misunderstandings that read-back of orders does not catch.", citationIDs: ["openrn_fundamentals_comm"]),
                AttributedBullet("Sets a culture of two-way communication — the receiver is encouraged to ask, not just acknowledge.", citationIDs: ["openrn_fundamentals_comm"]),
                AttributedBullet("Easy to add to any existing SBAR workflow at no cost.", citationIDs: ["openrn_fundamentals_comm"])
            ])
        ],
        citations: [openrnFundamentals],
        lastSourceFidelityReview: "2026-05-04"
    )
}
