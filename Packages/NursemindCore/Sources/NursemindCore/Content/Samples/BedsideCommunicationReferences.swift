import Foundation

private let bedside_hearing_nia = CitationSource(
    id: "bedside_hearing_nia",
    shortName: "NIA — Hearing loss in older adults",
    detail: "Reviewed January 19, 2023. Communication and assistance sections; original NIH text condensed by NurseMind.",
    publisher: "National Institute on Aging",
    license: .publicDomain,
    url: "https://www.nia.nih.gov/health/hearing-and-hearing-loss/hearing-loss-common-problem-older-adults",
    lastRetrieved: "2026-09-17"
)

private let bedside_sensory = CitationSource(
    id: "bedside_sensory",
    shortName: "Open RN — Section 7.3: Applying the nursing process to sensory function",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals, 2nd edition (2024). Section 7.3: Applying the nursing process to sensory function. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK610833/",
    lastRetrieved: "2026-09-17"
)

private let bedside_vision_nei = CitationSource(
    id: "bedside_vision_nei",
    shortName: "NEI — Vision rehabilitation",
    detail: "Vision rehabilitation services, assistive technology, and daily activities; original NIH text condensed by NurseMind.",
    publisher: "National Eye Institute",
    license: .publicDomain,
    url: "https://www.nei.nih.gov/eye-health-information/vision-rehabilitation",
    lastRetrieved: "2026-09-17"
)

private let bedside_aphasia_nidcd = CitationSource(
    id: "bedside_aphasia_nidcd",
    shortName: "NIDCD — Aphasia",
    detail: "Communication and rehabilitation sections; original NIH text condensed by NurseMind.",
    publisher: "National Institute on Deafness and Other Communication Disorders",
    license: .publicDomain,
    url: "https://www.nidcd.nih.gov/health/aphasia",
    lastRetrieved: "2026-09-17"
)

private let bedside_culture = CitationSource(
    id: "bedside_culture",
    shortName: "Open RN — Sections 3.7–3.8: Cultural assessment and responsive care",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals, 2nd edition (2024). Sections 3.7–3.8: Cultural assessment and responsive care. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK610841/",
    lastRetrieved: "2026-09-17"
)

private let bedside_spiritual = CitationSource(
    id: "bedside_spiritual",
    shortName: "Open RN — Section 18.4: Applying the nursing process to spirituality",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals, 2nd edition (2024). Section 18.4: Applying the nursing process to spirituality. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK610827/",
    lastRetrieved: "2026-09-17"
)

private let bedside_communication = CitationSource(
    id: "bedside_communication",
    shortName: "Open RN — Section 2.3: Therapeutic communication",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals, 2nd edition (2024). Section 2.3: Therapeutic communication. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK610828/",
    lastRetrieved: "2026-09-17"
)

private let bedside_rehab_sccm = CitationSource(
    id: "bedside_rehab_sccm",
    shortName: "SCCM — Rehabilitation professionals in ICU Liberation",
    detail: "Functional baseline, multidisciplinary rehabilitation, and communication during critical illness. Original factual summary.",
    publisher: "Society of Critical Care Medicine",
    license: .factCitationOnly,
    url: "https://www.sccm.org/blog/icu-liberation-the-role-of-rehabilitation-professionals",
    lastRetrieved: "2026-09-17"
)

public enum HearingLossCommunicationSample {
    public static let entry = ReferenceEntry(
        id: "hearing-loss-communication",
        title: "Communicating with hearing loss",
        subtitle: "Positioning, quieter conversations and working hearing aids",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .sensoryPerception),
        sections: [
            .bullets(title: "Ask what works", [
                AttributedBullet("Ask how the patient prefers to communicate and which ear or device works best. Difficulty hearing can be mistaken for inattention or confusion.", citationIDs: ["bedside_hearing_nia"]),
                AttributedBullet("Check access to usual hearing aids and whether they function. Include hearing needs in the assessment of the person’s usual sensory abilities.", citationIDs: ["bedside_sensory"])
            ]),
            .bullets(title: "Make speech easier to understand", [
                AttributedBullet("Face the person in good light so facial cues remain visible. Reduce background noise and have one person speak at a time.", citationIDs: ["bedside_hearing_nia"]),
                AttributedBullet("Speak clearly at a reasonable pace. Shouting can distort speech; if a message is missed, rephrase it instead of simply repeating it louder.", citationIDs: ["bedside_hearing_nia"]),
                AttributedBullet("Use a quieter location when possible and ask what additional assistance would help. Include the patient directly in the conversation.", citationIDs: ["bedside_hearing_nia"])
            ]),
            .bullets(title: "Support continuity", [
                AttributedBullet("Document the hearing limitation and the communication supports that help. Share these needs during care transitions so access to information does not depend on one staff member noticing the problem.", citationIDs: ["bedside_sensory"])
            ])
        ],
        citations: [bedside_hearing_nia, bedside_sensory],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum LowVisionBedsideSupportSample {
    public static let entry = ReferenceEntry(
        id: "low-vision-bedside-support",
        title: "Low vision at the bedside",
        subtitle: "Accessible surroundings, information and daily activities",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .sensoryPerception),
        sections: [
            .bullets(title: "Establish usable vision", [
                AttributedBullet("Ask about usual vision, recent change, glasses and the activities that are difficult. Assess the person’s functional needs rather than assuming all visual impairment is the same.", citationIDs: ["bedside_sensory"]),
                AttributedBullet("Keep usual visual aids available and consider their condition and usefulness. Missing sensory aids can affect orientation, participation and safety.", citationIDs: ["bedside_sensory"])
            ]),
            .bullets(title: "Adapt the environment", [
                AttributedBullet("Address lighting and environmental hazards, and help the patient locate needed objects and assistance. Include visual needs in the fall-prevention plan.", citationIDs: ["bedside_sensory"]),
                AttributedBullet("Vision rehabilitation can use magnification, task lighting, reading supports and technologies such as screen readers. The useful combination depends on the person’s tasks and remaining vision.", citationIDs: ["bedside_vision_nei"])
            ]),
            .bullets(title: "Support independence", [
                AttributedBullet("Vision rehabilitation addresses daily activities, practical skills and adjustment to vision loss. Discuss access through the eye-care or rehabilitation team when daily function remains limited.", citationIDs: ["bedside_vision_nei"]),
                AttributedBullet("Document the patient’s preferred supports and current assistance needs. Reassess when visual symptoms or the ability to manage bedside activities changes.", citationIDs: ["bedside_sensory"])
            ])
        ],
        citations: [bedside_sensory, bedside_vision_nei],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum AphasiaCommunicationSupportSample {
    public static let entry = ReferenceEntry(
        id: "aphasia-communication-support",
        title: "Communication support for aphasia",
        subtitle: "Time, adult language and alternative ways to express needs",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .cognition),
        sections: [
            .bullets(title: "Understand the communication difficulty", [
                AttributedBullet("Aphasia can affect speaking, understanding language, reading and writing. The pattern and severity differ between people, so do not assume that the ability to speak predicts every other language ability.", citationIDs: ["bedside_aphasia_nidcd"]),
                AttributedBullet("Speech-language assessment helps identify useful communication approaches and rehabilitation needs.", citationIDs: ["bedside_aphasia_nidcd"])
            ]),
            .bullets(title: "Make the exchange manageable", [
                AttributedBullet("Use short, clear sentences and a natural adult conversational style. Reduce competing noise and give enough time for a response.", citationIDs: ["bedside_aphasia_nidcd"]),
                AttributedBullet("Include the person in conversations and decisions. Avoid repeatedly correcting speech or completing every sentence before the person has time to respond.", citationIDs: ["bedside_aphasia_nidcd"]),
                AttributedBullet("Support expression through gestures, drawing, pictures, writing or a communication device when useful. Encourage the method that works for the individual.", citationIDs: ["bedside_aphasia_nidcd"])
            ]),
            .bullets(title: "Help others communicate consistently", [
                AttributedBullet("Family participation and practice with everyday communication can support rehabilitation. Share successful approaches with the care team and care partners.", citationIDs: ["bedside_aphasia_nidcd"]),
                AttributedBullet("Aphasia support is about access to communication; difficulty finding words should not remove the person from the conversation about their own care.", citationIDs: ["bedside_aphasia_nidcd"])
            ])
        ],
        citations: [bedside_aphasia_nidcd],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CulturalPreferencesAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "cultural-preferences-assessment",
        title: "Cultural preferences in nursing care",
        subtitle: "Individual priorities, family roles and practical accommodation",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety),
        sections: [
            .bullets(title: "Ask the individual", [
                AttributedBullet("Culturally responsive care begins with the patient’s own beliefs, preferences and experience. Membership in a cultural or religious group does not establish that every member wants the same care.", citationIDs: ["bedside_culture"]),
                AttributedBullet("Invite the patient to explain practices or concerns that may affect care. Listen without judgment and recognize that the nurse’s own assumptions can shape an interaction.", citationIDs: ["bedside_culture"])
            ]),
            .bullets(title: "Make preferences practical", [
                AttributedBullet("Explore food preferences, personal-care practices and the role the patient wants family or other support people to have.", citationIDs: ["bedside_culture"]),
                AttributedBullet("Ask about beliefs or routines that matter during illness and hospitalization. Discuss desired accommodations rather than treating a preference as an obstacle.", citationIDs: ["bedside_culture"]),
                AttributedBullet("When a preference conflicts with the proposed plan, seek a collaborative accommodation that preserves safe care. Explain the concern and involve the patient in considering alternatives.", citationIDs: ["bedside_culture"])
            ]),
            .bullets(title: "Follow through", [
                AttributedBullet("Include relevant preferences in the individualized care plan and communicate them to the team.", citationIDs: ["bedside_culture"]),
                AttributedBullet("Revisit assumptions and ask whether the arrangement meets the patient’s needs. Cultural assessment is an ongoing conversation, not a demographic checklist.", citationIDs: ["bedside_culture"])
            ])
        ],
        citations: [bedside_culture],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum SpiritualSupportSample {
    public static let entry = ReferenceEntry(
        id: "spiritual-support-in-hospital",
        title: "Spiritual support in hospital",
        subtitle: "Patient-led support, meaning and access to spiritual care",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety),
        sections: [
            .bullets(title: "Let the patient set the direction", [
                AttributedBullet("Spiritual needs can involve meaning, hope, connection or religious practice. Ask whether the patient wants to discuss sources of strength or concerns during illness.", citationIDs: ["bedside_spiritual"]),
                AttributedBullet("Respect a decision not to discuss spirituality. Support should reflect the patient’s beliefs and preferences rather than the nurse’s beliefs.", citationIDs: ["bedside_spiritual"])
            ]),
            .bullets(title: "Offer the support requested", [
                AttributedBullet("Listen attentively to fears, grief and questions about meaning. Quiet presence can be helpful without offering explanations for why the illness occurred.", citationIDs: ["bedside_spiritual"]),
                AttributedBullet("Ask whether privacy, a quiet space, access to a spiritual practice or contact with a chosen support person would help.", citationIDs: ["bedside_spiritual"]),
                AttributedBullet("Offer access to a chaplain or the patient’s preferred spiritual representative when desired. Do not assume that every patient wants religious support.", citationIDs: ["bedside_spiritual"])
            ]),
            .bullets(title: "Respect boundaries", [
                AttributedBullet("Ask permission before forms of support such as touch or participation in a spiritual practice.", citationIDs: ["bedside_spiritual"]),
                AttributedBullet("Communicate the support the patient requests and reassess whether it is helpful. Spiritual care remains individualized as the person’s condition and concerns change.", citationIDs: ["bedside_spiritual"])
            ])
        ],
        citations: [bedside_spiritual],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum LimitedSpeechCommunicationSample {
    public static let entry = ReferenceEntry(
        id: "communication-when-speech-is-limited",
        title: "Communication when speech is limited",
        subtitle: "Alternative communication during intubation, weakness or illness",
        eyebrow: "REFERENCE · COMMUNICATION",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .sensoryPerception),
        sections: [
            .bullets(title: "Create a way to participate", [
                AttributedBullet("Critical illness can leave a person unable to communicate needs effectively. Rehabilitation and respiratory professionals can help identify communication supports suited to the patient’s abilities.", citationIDs: ["bedside_rehab_sccm"]),
                AttributedBullet("Assess the ability to understand, hear, see and use the hands before choosing a communication method. Reduce background noise and allow time to respond.", citationIDs: ["bedside_communication"])
            ]),
            .bullets(title: "Offer workable alternatives", [
                AttributedBullet("Consider writing, gestures, pictures or a communication board. The available method needs to match the patient’s language, vision and movement.", citationIDs: ["bedside_communication"]),
                AttributedBullet("Use short questions and check that the intended message was understood. Yes-or-no responses may be unreliable in some language disorders, so verify rather than assuming agreement.", citationIDs: ["bedside_communication"])
            ]),
            .bullets(title: "Keep the exchange patient-led", [
                AttributedBullet("Acknowledge frustration and continue addressing the patient directly. Give enough time for an attempt instead of immediately speaking for the person.", citationIDs: ["bedside_communication"]),
                AttributedBullet("Coordinated rehabilitation can address fatigue, functional limitations and communication needs together. Reevaluate the approach as participation changes.", citationIDs: ["bedside_rehab_sccm"])
            ])
        ],
        citations: [bedside_communication, bedside_rehab_sccm],
        lastSourceFidelityReview: "2026-09-17"
    )
}
