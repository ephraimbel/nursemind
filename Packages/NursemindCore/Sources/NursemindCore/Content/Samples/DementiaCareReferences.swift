import Foundation

private let depth3_bathing = CitationSource(
    id: "depth3_bathing",
    shortName: "Alzheimer’s Caregiving: Bathing, Dressing, and Grooming",
    detail: "Bathing preparation, participation, comfort and dressing sections; reviewed July 18, 2024. Adapted from the National Institute on Aging, National Institutes of Health. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute on Aging, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nia.nih.gov/health/bathing-dressing-and-grooming-alzheimers-caregiving-tips",
    lastRetrieved: "2026-09-17"
)

private let depth3_eating = CitationSource(
    id: "depth3_eating",
    shortName: "Tips for Caregivers: Helping People With Alzheimer’s Disease Eat Well",
    detail: "Appetite, mealtime environment and assistance; reviewed June 28, 2024. Adapted from the National Institute on Aging, National Institutes of Health. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute on Aging, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nia.nih.gov/health/alzheimers-caregiving/tips-caregivers-helping-people-alzheimers-disease-eat-well",
    lastRetrieved: "2026-09-17"
)

private let depth3_swallow = CitationSource(
    id: "depth3_swallow",
    shortName: "Dysphagia Tests",
    detail: "Source: MedlinePlus, National Library of Medicine. NLM-authored Medical Tests article: symptoms, screening limits and specialist referral; updated October 1, 2024. Encyclopedia and drug pages excluded. Original federal health-education text adapted and condensed by NurseMind. Images, linked third-party material and source tables excluded.",
    publisher: "National Library of Medicine, National Institutes of Health",
    license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/dysphagia-tests/",
    lastRetrieved: "2026-09-17"
)

private let depth3_communication = CitationSource(
    id: "depth3_communication",
    shortName: "Communicating With Someone Who Has Alzheimer’s Disease",
    detail: "Language changes, verbal and nonverbal communication; reviewed July 11, 2024. Adapted from the National Institute on Aging, National Institutes of Health. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute on Aging, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nia.nih.gov/health/alzheimers-changes-behavior-and-communication/communicating-someone-who-has-alzheimers",
    lastRetrieved: "2026-09-17"
)

private let depth3_wandering = CitationSource(
    id: "depth3_wandering",
    shortName: "Coping With Alzheimer’s Behaviors: Wandering and Getting Lost",
    detail: "Identification, supervision and home safeguards; reviewed July 9, 2024. Locking and confinement instructions are not reproduced. Adapted from the National Institute on Aging, National Institutes of Health. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute on Aging, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nia.nih.gov/health/wandering-and-alzheimers-disease",
    lastRetrieved: "2026-09-17"
)

private let depth3_activities = CitationSource(
    id: "depth3_activities",
    shortName: "Adapting Activities for People With Alzheimer’s Disease",
    detail: "General tips, home activities, outings, visitors and familiar traditions; reviewed July 8, 2024. Adapted from the National Institute on Aging, National Institutes of Health. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute on Aging, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nia.nih.gov/health/alzheimers-caregiving/adapting-activities-people-alzheimers-disease",
    lastRetrieved: "2026-09-17"
)

private let depth3_sleep = CitationSource(
    id: "depth3_sleep",
    shortName: "Managing Sleep Problems in Alzheimer’s Disease",
    detail: "Daytime routine, evening environment and persistent sleep problems; reviewed July 11, 2024. Adapted from the National Institute on Aging, National Institutes of Health. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute on Aging, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nia.nih.gov/health/sleep/managing-sleep-problems-alzheimers-disease",
    lastRetrieved: "2026-09-17"
)

private let depth3_hospital = CitationSource(
    id: "depth3_hospital",
    shortName: "Taking a Person With Alzheimer’s Disease to the Hospital",
    detail: "Preparation, delirium, comfort, participation in care and discharge; reviewed July 8, 2024. Adapted from the National Institute on Aging, National Institutes of Health. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute on Aging, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nia.nih.gov/health/alzheimers-caregiving/taking-person-alzheimers-disease-hospital",
    lastRetrieved: "2026-09-17"
)

private let depth3_support = CitationSource(
    id: "depth3_support",
    shortName: "Getting Help With Alzheimer’s Caregiving",
    detail: "Home care, home health, meals, adult day services, respite and care managers; reviewed June 28, 2024. Insurance coverage and eligibility claims excluded. Adapted from the National Institute on Aging, National Institutes of Health. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute on Aging, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nia.nih.gov/health/alzheimers-caregiving/getting-help-alzheimers-caregiving",
    lastRetrieved: "2026-09-17"
)

public enum DementiaPersonalCareDepthSample {
    public static let entry = ReferenceEntry(
        id: "dementia-personal-care",
        title: "Dementia: bathing and dressing",
        subtitle: "Preserving participation, privacy and comfort",
        eyebrow: "REFERENCE · DEMENTIA CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .cognition),
        sections: [
            .bullets(title: "Start with the person’s routine", [
                AttributedBullet("Bathing and dressing may become difficult as Alzheimer’s disease progresses. Fear, embarrassment and difficulty following steps can affect participation. Allow extra time and encourage the parts of care the person can still manage.", citationIDs: ["depth3_bathing"]),
                AttributedBullet("Use the person’s familiar bathing time when possible. Explain what is about to happen, keep the interaction calm and protect privacy; rushing can make the experience more difficult.", citationIDs: ["depth3_bathing"])
            ]),
            .bullets(title: "Prepare before beginning", [
                AttributedBullet("Gather towels, a washcloth, cleanser and clean clothing before starting. Keep the room warm and well lit, check that water feels comfortable, and use appropriate nonslip surfaces, grab bars or a shower chair.", citationIDs: ["depth3_bathing"]),
                AttributedBullet("Stay with the person during the bath. Having supplies ready avoids leaving them alone to collect forgotten items.", citationIDs: ["depth3_bathing"])
            ]),
            .bullets(title: "Make washing manageable", [
                AttributedBullet("Invite the person to hold a washcloth or do part of the washing. Explain one part of the task at a time. Cover areas not being washed with a towel when this helps the person feel less exposed.", citationIDs: ["depth3_bathing"]),
                AttributedBullet("If the person becomes upset, pause and try a different approach or a later time. A sponge bath may be more acceptable than a shower. The routine can be adapted to the person’s response.", citationIDs: ["depth3_bathing"]),
                AttributedBullet("Pat the skin dry, including skin folds, and look for rashes or irritated areas while providing care. Report skin changes so the care plan can address them.", citationIDs: ["depth3_bathing"])
            ]),
            .bullets(title: "Simplify dressing without taking over", [
                AttributedBullet("Offer a small choice of suitable clothing and lay garments out in the order they are put on. Hand over one item at a time with a simple cue.", citationIDs: ["depth3_bathing"]),
                AttributedBullet("Comfortable, loose clothing and easy fastenings can reduce frustration. Encourage the person to do what they can and allow time to finish instead of immediately completing the task for them.", citationIDs: ["depth3_bathing"])
            ])
        ],
        citations: [depth3_bathing],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DementiaMealtimeDepthSample {
    public static let entry = ReferenceEntry(
        id: "dementia-mealtime-support",
        title: "Dementia: mealtime support",
        subtitle: "Appetite, independence and swallowing concerns",
        eyebrow: "REFERENCE · DEMENTIA CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Identify what is making eating difficult", [
                AttributedBullet("Poor appetite in Alzheimer’s may reflect medication effects, reduced activity or changes in taste and smell. Ask what the person enjoys, what they can eat comfortably and which parts of obtaining or preparing meals have become difficult.", citationIDs: ["depth3_eating"]),
                AttributedBullet("Arrange familiar foods the person likes and can manage. Smaller meals offered more often may be easier when appetite is limited. Practical help with shopping, prepared meals or meal delivery can address access problems.", citationIDs: ["depth3_eating"])
            ]),
            .bullets(title: "Make meals familiar and unhurried", [
                AttributedBullet("Keep usual meal times and use a familiar eating place when possible. Reduce distracting television or radio noise while keeping meals a pleasant opportunity for company.", citationIDs: ["depth3_eating"]),
                AttributedBullet("Allow enough time to eat. Offer one food at a time if many items are confusing, and use gentle prompts instead of pressure to finish.", citationIDs: ["depth3_eating"])
            ]),
            .bullets(title: "Match help to the person’s ability", [
                AttributedBullet("Encourage self-feeding for as long as the person can participate. If moving the utensil is difficult, gentle hand-over-hand guidance may help while allowing the person to remain involved.", citationIDs: ["depth3_eating"]),
                AttributedBullet("Avoid force-feeding. Appetite can decline in advanced Alzheimer’s, and increasing the amount of assistance does not resolve every reason for reduced intake.", citationIDs: ["depth3_eating"])
            ]),
            .bullets(title: "Separate swallowing concerns from memory difficulties", [
                AttributedBullet("Coughing or gagging during swallowing, a sensation of food sticking, painful swallowing, drooling or weight loss warrant clinical assessment. Swallowing problems can lead to dehydration, malnutrition or aspiration.", citationIDs: ["depth3_swallow"]),
                AttributedBullet("A swallow screen identifies risk; further testing may be needed to understand the problem. Raise concerns with the care team, who may involve a speech-language pathologist or another specialist.", citationIDs: ["depth3_swallow"]),
                AttributedBullet("Food stuck in the airway with difficulty breathing is an emergency: activate emergency help immediately. Routine mealtime assistance does not replace a response to choking.", citationIDs: ["depth3_swallow"])
            ])
        ],
        citations: [depth3_eating, depth3_swallow],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DementiaCommunicationDepthSample {
    public static let entry = ReferenceEntry(
        id: "dementia-communication-support",
        title: "Dementia: communication support",
        subtitle: "Understanding language changes and nonverbal needs",
        eyebrow: "REFERENCE · DEMENTIA CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .cognition),
        sections: [
            .bullets(title: "Understand the communication change", [
                AttributedBullet("Alzheimer’s can affect finding words, understanding their meaning, staying with a conversation and organizing thoughts. Difficulty filtering background noise can further interrupt communication.", citationIDs: ["depth3_communication"]),
                AttributedBullet("A person who learned English as an additional language may understand or use their first language more readily as the disease progresses. Establish which language they currently understand best.", citationIDs: ["depth3_communication"])
            ]),
            .bullets(title: "Create room for a response", [
                AttributedBullet("Use the person’s name, make eye contact and keep your tone calm and matter-of-fact. Notice whether your voice, expression or posture appears tense or impatient.", citationIDs: ["depth3_communication"]),
                AttributedBullet("Reduce competing noise and allow additional response time. Avoid interrupting or answering immediately on the person’s behalf when they can still participate.", citationIDs: ["depth3_communication"])
            ]),
            .bullets(title: "Make questions easier to follow", [
                AttributedBullet("Use a yes-or-no question or a limited choice when a broad question is difficult. If the person does not understand, rephrase with different words rather than repeating the same wording more loudly.", citationIDs: ["depth3_communication"]),
                AttributedBullet("Address the person directly. Avoid baby talk and conversations about them as though they are absent; continue two-way conversation whenever possible.", citationIDs: ["depth3_communication"])
            ]),
            .bullets(title: "Respond to meaning as well as words", [
                AttributedBullet("Pay attention to facial expressions and other nonverbal signs of sadness, frustration or anger. Take concerns seriously even when the person cannot explain them clearly.", citationIDs: ["depth3_communication"]),
                AttributedBullet("Listen without judgment when the person is aware of memory loss and wants to discuss it. During an angry exchange, a familiar pleasant activity or a pause may help; take time to settle your own frustration.", citationIDs: ["depth3_communication"]),
                AttributedBullet("Communication changes can be demanding for care partners. Encourage them to seek support and opportunities for a break instead of expecting one person to manage every interaction alone.", citationIDs: ["depth3_communication"])
            ])
        ],
        citations: [depth3_communication],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DementiaWanderingDepthSample {
    public static let entry = ReferenceEntry(
        id: "dementia-wandering-safety",
        title: "Dementia: wandering safety",
        subtitle: "Supervision, identification and preparation for getting lost",
        eyebrow: "REFERENCE · DEMENTIA CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .safety),
        sections: [
            .bullets(title: "Plan around known wandering", [
                AttributedBullet("A person with Alzheimer’s may leave home or a caregiver and become lost. Ask about previous wandering and ensure the care arrangement provides supervision for someone with a history of leaving unattended.", citationIDs: ["depth3_wandering"]),
                AttributedBullet("Use safeguards even when the home has been adapted. Changes that discourage leaving cannot guarantee that the person will remain safely at home.", citationIDs: ["depth3_wandering"])
            ]),
            .bullets(title: "Make identification usable", [
                AttributedBullet("A carried ID or medical identification bracelet can provide the person’s identity and a care partner’s contact number. If a bracelet is likely to be removed, identification on clothing is another option.", citationIDs: ["depth3_wandering"]),
                AttributedBullet("Keep a recent photo or video available to help police identify the person if they become lost. Discuss the wandering risk with trusted neighbors and local police as part of advance preparation.", citationIDs: ["depth3_wandering"])
            ]),
            .bullets(title: "Reduce unnoticed exits", [
                AttributedBullet("A door-opening chime, alarm or smart doorbell can alert a caregiver when a door opens. Simple signs at exits may also discourage leaving.", citationIDs: ["depth3_wandering"]),
                AttributedBullet("Keep departure cues such as keys, suitcases and coats out of sight when they prompt attempts to leave. A GPS device may help locate the person, alongside identification and supervision.", citationIDs: ["depth3_wandering"])
            ]),
            .bullets(title: "Keep activities and outings supported", [
                AttributedBullet("Plan outings for the time of day when the person functions best and keep them short enough to avoid excessive tiredness. Familiar activities can be adapted to what the person is able to do.", citationIDs: ["depth3_activities"]),
                AttributedBullet("During travel, maintain familiar meal and rest routines where possible, allow breaks and be prepared to shorten the visit. Carry identification in case the person becomes separated from their companion.", citationIDs: ["depth3_activities"])
            ])
        ],
        citations: [depth3_wandering, depth3_activities],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DementiaSleepDepthSample {
    public static let entry = ReferenceEntry(
        id: "dementia-sleep-and-sundowning",
        title: "Dementia: sleep and sundowning",
        subtitle: "Daytime routine, evening comfort and persistent sleep problems",
        eyebrow: "REFERENCE · DEMENTIA CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        sections: [
            .bullets(title: "Describe the pattern", [
                AttributedBullet("Alzheimer’s can cause frequent nighttime waking, excessive daytime sleep or too little sleep overall. Restlessness, irritability and confusion as daylight fades are often called sundowning.", citationIDs: ["depth3_sleep"]),
                AttributedBullet("Ask about the person’s daytime naps, bedtime, awakenings and the effect on the care partner’s sleep. Both the person with Alzheimer’s and the caregiver need restorative rest.", citationIDs: ["depth3_sleep"])
            ]),
            .bullets(title: "Support a consistent day", [
                AttributedBullet("Help the person take part in daily activity or exercise suited to them. Limit late-day dozing and schedule demanding activities, such as bathing, earlier in the day.", citationIDs: ["depth3_sleep"]),
                AttributedBullet("Keep bedtime and waking time consistent, including weekends and travel. A predictable routine may be easier to follow than frequent changes to the schedule.", citationIDs: ["depth3_sleep"])
            ]),
            .bullets(title: "Make evenings easier", [
                AttributedBullet("Reduce noise and use a calm evening routine. Soothing music may help if the person enjoys it. Keep the bedroom comfortable and avoid electronic screens during the bedtime routine.", citationIDs: ["depth3_sleep"]),
                AttributedBullet("Avoid alcohol and caffeine as part of improving sleep. Use nightlights in the bedroom, hall and bathroom so a calmer environment still allows the person to see their way.", citationIDs: ["depth3_sleep"])
            ]),
            .bullets(title: "Know when the pattern needs assessment", [
                AttributedBullet("Persistent sleep problems warrant discussion with the healthcare team. Other medical conditions, medicines and Alzheimer’s-related brain changes can contribute; the team can review medication and nonmedication options.", citationIDs: ["depth3_sleep"]),
                AttributedBullet("A sudden change from usual thinking or behavior needs prompt clinical assessment. Delirium may occur alongside dementia; do not explain a new acute change solely as the person’s usual evening pattern.", citationIDs: ["depth3_hospital"])
            ])
        ],
        citations: [depth3_sleep, depth3_hospital],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DementiaHospitalDepthSample {
    public static let entry = ReferenceEntry(
        id: "dementia-hospital-care",
        title: "Dementia: care during hospitalization",
        subtitle: "Baseline function, comfort, delirium and discharge needs",
        eyebrow: "REFERENCE · DEMENTIA CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .cognition),
        sections: [
            .bullets(title: "Bring the baseline into the handoff", [
                AttributedBullet("Tell the hospital team that the person has Alzheimer’s or another dementia, and describe their usual thinking, communication and daily function. Include what has changed and what helps them feel safe.", citationIDs: ["depth3_hospital"]),
                AttributedBullet("Have a current medication list, relevant health history, contact details and available advance-care documents ready for the clinical team. A familiar care partner can help explain needs the person cannot easily describe.", citationIDs: ["depth3_hospital"])
            ]),
            .bullets(title: "Make the environment understandable", [
                AttributedBullet("Familiar objects and a trusted person’s presence can be reassuring. Explain what is happening in simple language and help maintain familiar routines when the care setting allows.", citationIDs: ["depth3_hospital"]),
                AttributedBullet("Show the person where the bathroom is and explain the call button. Memory loss may make unfamiliar equipment hard to use; coordinate with staff so the person can obtain help when needed.", citationIDs: ["depth3_hospital"])
            ]),
            .bullets(title: "Support comfort and essential daily care", [
                AttributedBullet("When pain is difficult to describe, observe for grimacing, crying, restlessness or refusal to eat. Share these changes with the team so discomfort can be assessed.", citationIDs: ["depth3_hospital"]),
                AttributedBullet("Eating may require help opening packages, choosing food, remembering the meal or using utensils. Discuss the level of assistance with staff so needed support is reliably provided.", citationIDs: ["depth3_hospital"]),
                AttributedBullet("Help the team understand usual walking and toileting abilities. Hospital inactivity can reduce strength; coordinate safe movement and the assistance needed to prevent falls.", citationIDs: ["depth3_hospital"])
            ]),
            .bullets(title: "Notice new confusion and prepare for discharge", [
                AttributedBullet("Report sudden or worsening confusion promptly. Hospitalized people with dementia can develop delirium, including from illness, medicines or dehydration, and the change needs assessment.", citationIDs: ["depth3_hospital"]),
                AttributedBullet("Begin discharge planning early. Care needs may be greater after a hospital stay; discuss equipment, rehabilitation, home services and what the caregiver can realistically provide.", citationIDs: ["depth3_hospital"])
            ])
        ],
        citations: [depth3_hospital],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DementiaActivitiesDepthSample {
    public static let entry = ReferenceEntry(
        id: "dementia-meaningful-activities",
        title: "Dementia: meaningful daily activities",
        subtitle: "Adapting tasks, visits and outings to current abilities",
        eyebrow: "REFERENCE · DEMENTIA CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .cognition),
        sections: [
            .bullets(title: "Choose participation the person can enjoy", [
                AttributedBullet("Alzheimer’s can make it difficult to choose an activity or start a task. Match activities to current abilities and interests, and help the person begin.", citationIDs: ["depth3_activities"]),
                AttributedBullet("Decide what can be done independently and where help is needed. Watch for frustration, simplify the task and let the person observe if watching is more enjoyable.", citationIDs: ["depth3_activities"])
            ]),
            .bullets(title: "Use familiar roles and simple tasks", [
                AttributedBullet("Folding laundry, sorting socks, setting a table or helping with familiar food preparation can provide meaningful participation. Select parts of the task the person can manage successfully.", citationIDs: ["depth3_activities"]),
                AttributedBullet("Music, singing, familiar stories, tending plants or spending time with a pet may be enjoyable. Choose activities the person likes instead of insisting on completing a predetermined task.", citationIDs: ["depth3_activities"])
            ]),
            .bullets(title: "Adapt visits and outings", [
                AttributedBullet("Prepare visitors for changes in memory, behavior and communication. The person may enjoy the company even when they cannot remember a visitor’s name.", citationIDs: ["depth3_activities"]),
                AttributedBullet("Schedule short outings at the person’s best time of day. Avoid letting time away become so long that the person is overtired, and shorten the outing when needed.", citationIDs: ["depth3_activities"]),
                AttributedBullet("For a restaurant visit, a quiet familiar setting at a less crowded time may help. Bring familiar eating supplies and assist with a small choice of preferred foods when the menu is difficult.", citationIDs: ["depth3_activities"])
            ]),
            .bullets(title: "Preserve familiar traditions", [
                AttributedBullet("If meaningful to the person, include familiar music, spiritual practices or family traditions. Home-based participation may be more comfortable than an unfamiliar crowded setting.", citationIDs: ["depth3_activities"]),
                AttributedBullet("During holidays or gatherings, limit the number of visitors at once and provide a quiet place to rest. Keep expectations realistic and include breaks for both the person and the caregiver.", citationIDs: ["depth3_activities"])
            ])
        ],
        citations: [depth3_activities],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DementiaSupportServicesDepthSample {
    public static let entry = ReferenceEntry(
        id: "dementia-home-and-respite-support",
        title: "Dementia: home and respite support",
        subtitle: "Matching practical care needs to community services",
        eyebrow: "REFERENCE · DEMENTIA CARE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "Identify where more help is needed", [
                AttributedBullet("Care needs in Alzheimer’s often exceed what one person can provide. Discuss the daily tasks, supervision and time commitments that have become difficult, and involve the patient and people they want included.", citationIDs: ["depth3_support"]),
                AttributedBullet("A support network may include family, friends, community organizations, faith groups and caregiver groups. Help can be useful early in the disease as well as when care needs increase.", citationIDs: ["depth3_support"])
            ]),
            .bullets(title: "Distinguish services by what they provide", [
                AttributedBullet("Home care aides may help with bathing, dressing, companionship, light housekeeping or errands. These services do not provide skilled medical care.", citationIDs: ["depth3_support"]),
                AttributedBullet("Home health services may provide ordered nursing care or physical, occupational and speech therapy for a specific health need. Clarify which tasks require clinical services when arranging support.", citationIDs: ["depth3_support"]),
                AttributedBullet("Meal delivery can help obtain food but usually does not provide meal preparation or feeding assistance. Confirm whether someone can help the person actually eat the delivered meal.", citationIDs: ["depth3_support"])
            ]),
            .bullets(title: "Make respite practical", [
                AttributedBullet("Adult day services may offer supervised activities, meals, personal care and sometimes transportation. Ask which services the local program provides and whether they meet the person’s needs.", citationIDs: ["depth3_support"]),
                AttributedBullet("Respite offers temporary care at home or in another care setting so the regular caregiver can rest or attend to other responsibilities. The arrangement can range from a brief break to a longer stay.", citationIDs: ["depth3_support"])
            ]),
            .bullets(title: "Check the arrangement before relying on it", [
                AttributedBullet("Before engaging a provider, ask about services, fees, terms, restrictions and references. Check available complaint information or the relevant local oversight agency.", citationIDs: ["depth3_support"]),
                AttributedBullet("A geriatric care manager can help assess needs, plan care and locate services, particularly when family lives far away. The healthcare team and Eldercare Locator can also help identify local options.", citationIDs: ["depth3_support"])
            ])
        ],
        citations: [depth3_support],
        lastSourceFidelityReview: "2026-09-17"
    )
}
