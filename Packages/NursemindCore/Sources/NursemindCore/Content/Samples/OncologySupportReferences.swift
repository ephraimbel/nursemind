import Foundation

private let support_fatigue_nci = CitationSource(
    id: "support_fatigue_nci",
    shortName: "Cancer Fatigue",
    detail: "Assessment, contributing conditions and symptom management; updated September 20, 2024. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/treatment/side-effects/fatigue",
    lastRetrieved: "2026-09-17"
)

private let support_neuropathy_nci = CitationSource(
    id: "support_neuropathy_nci",
    shortName: "Nerve Problems (Peripheral Neuropathy) and Cancer Treatment",
    detail: "Sensory, motor and autonomic symptoms; injury prevention and clinical communication. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/treatment/side-effects/nerve-problems",
    lastRetrieved: "2026-09-17"
)

private let support_cognition_nci = CitationSource(
    id: "support_cognition_nci",
    shortName: "Memory or Concentration Problems and Cancer Treatment",
    detail: "Cognitive changes and practical supports; reviewed January 26, 2023. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/treatment/side-effects/memory",
    lastRetrieved: "2026-09-17"
)

private let support_mouth_nci = CitationSource(
    id: "support_mouth_nci",
    shortName: "Mouth and Throat Problems: Cancer Treatment Side Effects",
    detail: "Oral complications, dental preparation, eating difficulties and reporting symptoms. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/treatment/side-effects/mouth-throat",
    lastRetrieved: "2026-09-17"
)

private let support_diarrhea_nci = CitationSource(
    id: "support_diarrhea_nci",
    shortName: "Diarrhea and Cancer Treatment",
    detail: "Causes, assessment questions and supportive care; updated May 16, 2025. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/treatment/side-effects/diarrhea",
    lastRetrieved: "2026-09-17"
)

private let support_constipation_nci = CitationSource(
    id: "support_constipation_nci",
    shortName: "Constipation and Cancer Treatment",
    detail: "Baseline bowel pattern, contributing factors, supportive care and complications. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/treatment/side-effects/constipation",
    lastRetrieved: "2026-09-17"
)

private let support_lymphedema_nci = CitationSource(
    id: "support_lymphedema_nci",
    shortName: "Lymphedema",
    detail: "Symptoms, early assessment, skin protection and specialist-guided management. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/treatment/side-effects/lymphedema",
    lastRetrieved: "2026-09-17"
)

private let support_fertility_female_nci = CitationSource(
    id: "support_fertility_female_nci",
    shortName: "Female Fertility and Cancer Treatment",
    detail: "Pre-treatment discussion, preservation methods, treatment timing and contraception. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/treatment/side-effects/fertility-women",
    lastRetrieved: "2026-09-17"
)

private let support_fertility_male_nci = CitationSource(
    id: "support_fertility_male_nci",
    shortName: "Male Fertility and Cancer Treatment",
    detail: "Pre-treatment discussion, sperm banking and contraception; updated May 14, 2025. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/treatment/side-effects/fertility-men",
    lastRetrieved: "2026-09-17"
)

private let support_sexual_female_nci = CitationSource(
    id: "support_sexual_female_nci",
    shortName: "Sexual Health Issues in Women with Cancer",
    detail: "Symptoms, individualized precautions and specialist support; reviewed December 29, 2022. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/treatment/side-effects/sexuality-women",
    lastRetrieved: "2026-09-17"
)

private let support_sexual_male_nci = CitationSource(
    id: "support_sexual_male_nci",
    shortName: "Sexual Health Issues in Men with Cancer",
    detail: "Symptoms, individualized precautions and specialist support; reviewed December 29, 2022. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/treatment/side-effects/sexuality-men",
    lastRetrieved: "2026-09-17"
)

private let support_bodyimage_nci = CitationSource(
    id: "support_bodyimage_nci",
    shortName: "How Cancer Affects Your Self-Image and Sexuality",
    detail: "Body-image and coping sections; updated March 29, 2023. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/coping/self-image",
    lastRetrieved: "2026-09-17"
)

private let support_survivorship_nci = CitationSource(
    id: "support_survivorship_nci",
    shortName: "Follow-Up Medical Care",
    detail: "Treatment summary, follow-up care plan, new symptoms and late effects; updated December 2, 2024. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/coping/survivorship/follow-up-care",
    lastRetrieved: "2026-09-17"
)

private let support_costs_nci = CitationSource(
    id: "support_costs_nci",
    shortName: "Managing Cancer Costs and Medical Information",
    detail: "Discussing costs, social-work support, insurance explanations and practical barriers; no program-eligibility determination. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://www.cancer.gov/about-cancer/managing-care/track-care-costs",
    lastRetrieved: "2026-09-17"
)

public enum CancerRelatedFatigueReferenceSample {
    public static let entry = ReferenceEntry(
        id: "cancer-related-fatigue",
        title: "Cancer-related fatigue",
        subtitle: "Assessment, daily function and conserving energy",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        sections: [
            .bullets(title: "Recognize the pattern", [
                AttributedBullet("Cancer-related fatigue can occur before, during or after treatment and may persist despite sleep or rest. Ask how tiredness differs from the patient’s usual experience and which daily activities are now difficult.", citationIDs: ["support_fatigue_nci"]),
                AttributedBullet("Assess the timing, severity and effect on concentration, movement, work and self-care. Repeating the same assessment approach helps show whether symptoms are changing.", citationIDs: ["support_fatigue_nci"])
            ]),
            .bullets(title: "Look for contributing problems", [
                AttributedBullet("Review pain, sleep, food intake, fluid losses, emotional distress and other symptoms. Anemia, infection and treatment effects can contribute; fatigue should not automatically be attributed to cancer alone.", citationIDs: ["support_fatigue_nci"]),
                AttributedBullet("A fatigue or activity record can help the team identify patterns around treatment and distinguish helpful strategies from those that worsen exhaustion.", citationIDs: ["support_fatigue_nci"])
            ]),
            .bullets(title: "Support the individual plan", [
                AttributedBullet("Help the patient prioritize meaningful activities during periods of better energy and arrange assistance with demanding tasks. Plan rest without assuming that prolonged daytime sleep will solve the problem.", citationIDs: ["support_fatigue_nci"]),
                AttributedBullet("Discuss a tolerable activity plan with the oncology or rehabilitation team and nutrition support when intake is limited. The appropriate activity depends on the person’s condition.", citationIDs: ["support_fatigue_nci"]),
                AttributedBullet("Encourage contact with the care team when fatigue is severe, persists despite rest or prevents usual activities. Reassess the effect of the agreed plan on function and comfort.", citationIDs: ["support_fatigue_nci"])
            ])
        ],
        citations: [support_fatigue_nci],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CancerPeripheralNeuropathyReferenceSample {
    public static let entry = ReferenceEntry(
        id: "cancer-treatment-neuropathy",
        title: "Peripheral neuropathy during cancer treatment",
        subtitle: "Sensory changes, function and protection from injury",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .sensoryPerception),
        sections: [
            .bullets(title: "Assess more than tingling", [
                AttributedBullet("Some cancer treatments can injure peripheral nerves. Ask about numbness, burning or tingling, reduced temperature sensation and the ability to notice cuts or pressure.", citationIDs: ["support_neuropathy_nci"]),
                AttributedBullet("Assess weakness, balance, hand function and difficulties with buttons or jars. Autonomic symptoms can include dizziness, bowel changes, sweating changes or difficulty emptying the bladder.", citationIDs: ["support_neuropathy_nci"])
            ]),
            .bullets(title: "Reduce preventable injury", [
                AttributedBullet("Discuss supportive footwear, clear walking paths and help with tasks that have become difficult. Reduced sensation can hide injuries, so regular skin checks of hands and feet are useful.", citationIDs: ["support_neuropathy_nci"]),
                AttributedBullet("Protect numb hands from sharp objects and hot cookware. Have someone with normal sensation check bath-water temperature rather than relying on the affected hand or foot.", citationIDs: ["support_neuropathy_nci"]),
                AttributedBullet("Encourage unhurried movement and assistance when balance is impaired. New swallowing or breathing difficulty requires prompt clinical attention.", citationIDs: ["support_neuropathy_nci"])
            ]),
            .bullets(title: "Report symptoms early", [
                AttributedBullet("Tell the oncology team about new or worsening nerve symptoms instead of waiting until the next treatment is completed. Early assessment can help limit complications.", citationIDs: ["support_neuropathy_nci"]),
                AttributedBullet("Document the affected areas and functional impact. Pain treatment and rehabilitation referrals are individualized by the care team; the patient should not change cancer treatment independently.", citationIDs: ["support_neuropathy_nci"])
            ])
        ],
        citations: [support_neuropathy_nci],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CancerCognitiveChangesReferenceSample {
    public static let entry = ReferenceEntry(
        id: "cancer-treatment-cognitive-changes",
        title: "Cognitive changes during cancer treatment",
        subtitle: "Memory, concentration and practical daily supports",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .cognition),
        sections: [
            .bullets(title: "Describe the change", [
                AttributedBullet("Cancer treatment can be associated with difficulty remembering, thinking or concentrating, sometimes called chemo brain. Problems can begin during or after treatment and vary substantially in severity.", citationIDs: ["support_cognition_nci"]),
                AttributedBullet("Ask for examples of tasks that have become harder and whether family members have noticed changes. Report cognitive changes to the care team for assessment.", citationIDs: ["support_cognition_nci"])
            ]),
            .bullets(title: "Consider related factors", [
                AttributedBullet("Poor sleep, fatigue, anxiety, depression and nutrition problems may contribute. Addressing these conditions can be part of the management plan.", citationIDs: ["support_cognition_nci"]),
                AttributedBullet("The oncology team can advise whether specialist assessment, occupational therapy or other support is appropriate when cognition affects daily function.", citationIDs: ["support_cognition_nci"])
            ]),
            .bullets(title: "Make tasks manageable", [
                AttributedBullet("Use a consistent daily routine and schedule demanding tasks for the time of day when concentration is best. Balance activity with rest and nighttime sleep.", citationIDs: ["support_cognition_nci"]),
                AttributedBullet("Written reminders, a calendar, a planner or another familiar reminder system can help organize appointments and important tasks. Keep essential information in an accessible place.", citationIDs: ["support_cognition_nci"]),
                AttributedBullet("Review which symptoms warrant a call and whether the chosen supports actually help. A familiar nickname for the problem does not replace a clinical assessment of new changes.", citationIDs: ["support_cognition_nci"])
            ])
        ],
        citations: [support_cognition_nci],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CancerMouthThroatReferenceSample {
    public static let entry = ReferenceEntry(
        id: "cancer-mouth-throat-care",
        title: "Mouth and throat problems during cancer treatment",
        subtitle: "Mucositis, dryness, taste changes and eating difficulties",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Assess oral function", [
                AttributedBullet("Cancer treatment may cause mouth sores, painful swelling, dryness, taste changes and difficulty chewing or swallowing. Head-and-neck radiation can also affect saliva and dental health.", citationIDs: ["support_mouth_nci"]),
                AttributedBullet("Ask about pain, the ability to eat and drink, and sleep disruption. Check for new sores, white patches, sensitivity or other changes and report them to the oncology team.", citationIDs: ["support_mouth_nci"])
            ]),
            .bullets(title: "Prepare and protect", [
                AttributedBullet("A dental assessment before treatment allows the oncology and dental teams to plan necessary work. During treatment, follow the agreed gentle mouth-care and rinse plan.", citationIDs: ["support_mouth_nci"]),
                AttributedBullet("Use a very soft toothbrush and ask the team whether flossing is appropriate when bleeding risk is increased. Do not assume every usual mouth-care product suits an injured mouth.", citationIDs: ["support_mouth_nci"])
            ]),
            .bullets(title: "Support eating and timely review", [
                AttributedBullet("Soft, moist foods may be easier to tolerate; irritating, coarse or spicy foods can worsen discomfort. Ask the team about pain relief and dryness management.", citationIDs: ["support_mouth_nci"]),
                AttributedBullet("Taste changes may improve with different food choices, cooler foods or nonmetal utensils when food tastes metallic. Dietitian input can help maintain intake.", citationIDs: ["support_mouth_nci"]),
                AttributedBullet("Mouth or throat pain that limits eating, drinking or sleep, or occurs with fever, needs prompt contact with the care team. Poor intake can lead to dehydration or malnutrition.", citationIDs: ["support_mouth_nci"])
            ])
        ],
        citations: [support_mouth_nci],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CancerDiarrheaSupportReferenceSample {
    public static let entry = ReferenceEntry(
        id: "cancer-treatment-diarrhea-support",
        title: "Diarrhea during cancer treatment",
        subtitle: "Baseline stool pattern, hydration and early reporting",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Assess the change from baseline", [
                AttributedBullet("Ask how many stools occurred compared with the patient’s normal pattern, when the change began, and whether stools contain blood or mucus. Include cramping, urgency, fever, dizziness and weight change.", citationIDs: ["support_diarrhea_nci"]),
                AttributedBullet("Review intake and recent treatments, medicines and supplements. Infection, treatment injury and other conditions can cause diarrhea; checkpoint inhibitors can cause inflammatory colitis.", citationIDs: ["support_diarrhea_nci"])
            ]),
            .bullets(title: "Support the treatment plan", [
                AttributedBullet("Encourage early contact with the oncology team because severe diarrhea can cause dehydration and disrupt treatment. Keep a record of stool pattern and associated symptoms for the team.", citationIDs: ["support_diarrhea_nci"]),
                AttributedBullet("Clarify the amount and type of fluids appropriate for the individual. Smaller meals and temporarily modified food choices may help when recommended by the oncology team or dietitian.", citationIDs: ["support_diarrhea_nci"]),
                AttributedBullet("Help keep the perianal area clean and comfortable. Report worsening irritation as well as bowel symptoms.", citationIDs: ["support_diarrhea_nci"])
            ]),
            .bullets(title: "Avoid automatic self-treatment", [
                AttributedBullet("Check with the care team before starting antidiarrheal medicines, probiotics or supplements. Management depends on the cause and severity.", citationIDs: ["support_diarrhea_nci"]),
                AttributedBullet("Blood in stool, fever, dizziness or worsening symptoms should be reported promptly. A presumed treatment side effect still needs assessment; this guide does not assign toxicity grades or direct cancer-drug changes.", citationIDs: ["support_diarrhea_nci"])
            ])
        ],
        citations: [support_diarrhea_nci],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CancerConstipationSupportReferenceSample {
    public static let entry = ReferenceEntry(
        id: "cancer-treatment-constipation-support",
        title: "Constipation during cancer treatment",
        subtitle: "Usual bowel pattern, contributing medicines and complications",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Establish the bowel history", [
                AttributedBullet("Ask about the usual pattern, last bowel movement, stool consistency, straining, discomfort and recent change. Include bloating, nausea, vomiting and difficulty passing stool.", citationIDs: ["support_constipation_nci"]),
                AttributedBullet("Cancer, some treatments, opioids and other medicines can contribute. Reduced activity and changes in eating or drinking may add to the problem.", citationIDs: ["support_constipation_nci"])
            ]),
            .bullets(title: "Use an individualized bowel plan", [
                AttributedBullet("Record bowel movements and response to the prescribed plan. Discuss appropriate fluid intake, regular meals and tolerable activity with the care team.", citationIDs: ["support_constipation_nci"]),
                AttributedBullet("Do not automatically increase fiber: high-fiber foods or supplements can worsen constipation for some people with cancer. Ask whether fiber is appropriate.", citationIDs: ["support_constipation_nci"]),
                AttributedBullet("Use only the bowel medicines and treatments recommended by the oncology team. Suppositories or enemas may cause bleeding, infection or other harm and require explicit clinical direction.", citationIDs: ["support_constipation_nci"])
            ]),
            .bullets(title: "Recognize the need for review", [
                AttributedBullet("Persistent constipation needs assessment to identify its cause and prevent complications. Severe abdominal pain, vomiting or other signs of possible impaction require urgent medical attention.", citationIDs: ["support_constipation_nci"]),
                AttributedBullet("Teach the patient and care partner when and how to contact the team. A diary supports assessment but does not rule out fecal impaction or obstruction.", citationIDs: ["support_constipation_nci"])
            ])
        ],
        citations: [support_constipation_nci],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CancerLymphedemaReferenceSample {
    public static let entry = ReferenceEntry(
        id: "cancer-related-lymphedema",
        title: "Cancer-related lymphedema",
        subtitle: "Early changes, skin protection and specialist support",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .mobility),
        sections: [
            .bullets(title: "Recognize early changes", [
                AttributedBullet("Cancer, surgery or radiation can disrupt lymph flow. Lymphedema can develop during treatment or years later and may involve a limb, the head and neck, the trunk or genital area.", citationIDs: ["support_lymphedema_nci"]),
                AttributedBullet("Ask about heaviness, fullness, tightness, swelling and reduced movement. Compare with the person’s previous symptoms and function, and encourage early clinical assessment.", citationIDs: ["support_lymphedema_nci"])
            ]),
            .bullets(title: "Support the prescribed approach", [
                AttributedBullet("A certified lymphedema therapist or appropriately trained clinician can guide compression, exercise, skin care and lymphatic drainage. Garment fit and technique require individual instruction.", citationIDs: ["support_lymphedema_nci"]),
                AttributedBullet("Protect the skin from cuts, burns and cracking. Discuss suitable activity and skin care with the team rather than assuming swelling should be managed with rest alone.", citationIDs: ["support_lymphedema_nci"]),
                AttributedBullet("Document the location and progression of swelling and its effect on daily tasks. New swelling needs assessment because causes other than lymphedema are possible.", citationIDs: ["support_lymphedema_nci"])
            ]),
            .bullets(title: "Know what needs prompt attention", [
                AttributedBullet("New warmth, tenderness, redness or fever can indicate cellulitis and needs prompt contact with the care team.", citationIDs: ["support_lymphedema_nci"]),
                AttributedBullet("Head-and-neck swelling can affect speaking, swallowing or breathing. Report functional changes promptly; this overview does not provide a compression prescription or massage procedure.", citationIDs: ["support_lymphedema_nci"])
            ])
        ],
        citations: [support_lymphedema_nci],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CancerFertilityCounselingReferenceSample {
    public static let entry = ReferenceEntry(
        id: "cancer-fertility-counseling",
        title: "Fertility conversations before cancer treatment",
        subtitle: "Goals, early referral and treatment-specific planning",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .safety),
        sections: [
            .bullets(title: "Open the conversation early", [
                AttributedBullet("Cancer and its treatment can affect future fertility. The effect depends on the treatment, reproductive anatomy, baseline fertility and other individual factors, and may be temporary or permanent.", citationIDs: ["support_fertility_female_nci"]),
                AttributedBullet("Ask whether having biological children in the future matters to the patient and offer referral before treatment begins when possible. The patient may need help starting this conversation.", citationIDs: ["support_fertility_female_nci"])
            ]),
            .bullets(title: "Describe options without promising outcomes", [
                AttributedBullet("Egg or embryo freezing and selected tissue-preservation approaches may be discussed with a fertility specialist. Availability, suitability, timing, cost and success vary.", citationIDs: ["support_fertility_female_nci"]),
                AttributedBullet("Sperm banking is a common preservation option after puberty. A specialist can discuss alternatives when a sperm sample cannot be produced and explain limitations.", citationIDs: ["support_fertility_male_nci"]),
                AttributedBullet("The oncology and fertility teams coordinate whether a preservation procedure fits the treatment timeline. Do not independently delay cancer treatment to pursue an option.", citationIDs: ["support_fertility_female_nci"])
            ]),
            .bullets(title: "Keep fertility separate from contraception", [
                AttributedBullet("Reduced fertility does not reliably prevent pregnancy. Ask the oncology team about the appropriate contraception and its duration during and after treatment.", citationIDs: ["support_fertility_female_nci"]),
                AttributedBullet("Offer support for questions about cost, access and personal goals. Choosing not to pursue preservation or considering other ways to build a family are also valid personal decisions.", citationIDs: ["support_fertility_male_nci"])
            ])
        ],
        citations: [support_fertility_female_nci, support_fertility_male_nci],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CancerSexualHealthReferenceSample {
    public static let entry = ReferenceEntry(
        id: "cancer-sexual-health-support",
        title: "Sexual health during cancer care",
        subtitle: "Symptoms, intimacy and individualized precautions",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .painComfort),
        sections: [
            .bullets(title: "Invite a private discussion", [
                AttributedBullet("Cancer and treatment may affect interest in sex, comfort and intimacy during or after care. Ask whether the person wants to discuss changes rather than assuming the topic is unimportant.", citationIDs: ["support_sexual_female_nci"]),
                AttributedBullet("Assess pain, vaginal dryness or other genital discomfort, fatigue and emotional concerns. Some effects resolve while others persist and may need specialist support.", citationIDs: ["support_sexual_female_nci"]),
                AttributedBullet("Erection or ejaculation changes may occur after some treatments. Ask about the specific difficulty and its impact; symptoms can also have contributors beyond cancer treatment.", citationIDs: ["support_sexual_male_nci"])
            ]),
            .bullets(title: "Clarify precautions with the oncology team", [
                AttributedBullet("The team should explain whether bleeding or infection risk requires avoiding particular sexual activities and whether barrier protection or contraception is needed.", citationIDs: ["support_sexual_female_nci"]),
                AttributedBullet("Barrier protection may be advised to reduce a partner’s exposure to treatment drugs in body fluids. The instructions and duration depend on the regimen.", citationIDs: ["support_sexual_male_nci"])
            ]),
            .bullets(title: "Support comfort and connection", [
                AttributedBullet("Ask about appropriate treatment for dryness or discomfort rather than recommending hormones or devices without oncology review.", citationIDs: ["support_sexual_female_nci"]),
                AttributedBullet("Referral to a sexual-health specialist, counseling or a support group can help. Include the partner only as the patient wishes and help the patient communicate concerns and preferences.", citationIDs: ["support_sexual_male_nci"])
            ])
        ],
        citations: [support_sexual_female_nci, support_sexual_male_nci],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CancerBodyImageReferenceSample {
    public static let entry = ReferenceEntry(
        id: "cancer-body-image-support",
        title: "Body image after cancer treatment",
        subtitle: "Appearance changes, grief and practical support",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood),
        sections: [
            .bullets(title: "Acknowledge the person’s experience", [
                AttributedBullet("Hair loss, scars, weight changes, limb loss or an ostomy can affect how a person sees their body. Changes that others cannot see can be equally distressing.", citationIDs: ["support_bodyimage_nci"]),
                AttributedBullet("Invite the patient to describe what is difficult and whether the concern affects relationships, clothing, social activity or willingness to leave home. Avoid dismissing a concern because treatment was successful.", citationIDs: ["support_bodyimage_nci"])
            ]),
            .bullets(title: "Offer the support the patient wants", [
                AttributedBullet("Allow space for sadness, anger or grief about losses. A counselor or peer-support group may help the person discuss experiences without pressure to feel positive.", citationIDs: ["support_bodyimage_nci"]),
                AttributedBullet("Ask whether practical support with wigs, clothing, an appropriately fitted prosthesis or skin-care advice would be useful. Preferences vary, including whether to conceal a visible change.", citationIDs: ["support_bodyimage_nci"]),
                AttributedBullet("Discuss comfortable activities and hobbies that support participation and identity. Activity planning should reflect the person’s condition and the care team’s advice.", citationIDs: ["support_bodyimage_nci"])
            ]),
            .bullets(title: "Keep communication open", [
                AttributedBullet("Body-image concerns can affect closeness and sexual interest. Offer a separate conversation or referral if the patient wants help with intimacy.", citationIDs: ["support_bodyimage_nci"]),
                AttributedBullet("Revisit the concern over time. Adjustment may take time, and reassurance alone may not address the practical and emotional effects of treatment.", citationIDs: ["support_bodyimage_nci"])
            ])
        ],
        citations: [support_bodyimage_nci],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CancerSurvivorshipReferenceSample {
    public static let entry = ReferenceEntry(
        id: "cancer-survivorship-care-plan",
        title: "Cancer survivorship care planning",
        subtitle: "Treatment summary, follow-up responsibilities and late effects",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "Make the plan explicit", [
                AttributedBullet("A survivorship care plan combines the cancer treatment summary with recommendations for follow-up care. It may also address emotional, social and financial needs.", citationIDs: ["support_survivorship_nci"]),
                AttributedBullet("Clarify which clinician coordinates oncology follow-up, which clinician provides routine primary care, and how they will share information. Completing treatment does not end routine health-care needs.", citationIDs: ["support_survivorship_nci"])
            ]),
            .bullets(title: "Review the essential information", [
                AttributedBullet("The treatment summary records the diagnosis, treatments, important results, complications and clinicians involved. The patient should know how to access and share these records.", citationIDs: ["support_survivorship_nci"]),
                AttributedBullet("The follow-up plan identifies appointments, needed tests, symptoms to report and possible late effects. Schedules depend on the cancer, treatment and overall health rather than one timetable for every survivor.", citationIDs: ["support_survivorship_nci"])
            ]),
            .bullets(title: "Prepare for life between visits", [
                AttributedBullet("Discuss persistent fatigue, bowel or bladder problems, sexual concerns, cognitive changes, sleep, weight and emotional symptoms. New symptoms do not automatically mean recurrence but still need clinical review.", citationIDs: ["support_survivorship_nci"]),
                AttributedBullet("Review new medicines or supplements and the plan for routine screening and vaccination with the responsible clinicians.", citationIDs: ["support_survivorship_nci"]),
                AttributedBullet("Give clear contact instructions for new or persistent concerns between appointments. Survivorship services, rehabilitation and psychosocial support may help with longer-term needs.", citationIDs: ["support_survivorship_nci"])
            ])
        ],
        citations: [support_survivorship_nci],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CancerFinancialBarriersReferenceSample {
    public static let entry = ReferenceEntry(
        id: "cancer-financial-barriers",
        title: "Financial barriers during cancer care",
        subtitle: "Costs, access concerns and practical referrals",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "Ask about the whole burden", [
                AttributedBullet("Cancer-related financial distress can affect people with or without insurance. Treatment may reduce work capacity while adding medical expenses and household pressures.", citationIDs: ["support_costs_nci"]),
                AttributedBullet("Ask whether medicines, travel, parking, lodging, childcare or time away from work make the plan difficult to follow. Invite the discussion early instead of waiting for an unpaid bill.", citationIDs: ["support_costs_nci"])
            ]),
            .bullets(title: "Connect the right support", [
                AttributedBullet("Hospital social workers, financial counselors and billing staff can help explain costs and explore assistance or payment options. Available support depends on the person’s circumstances.", citationIDs: ["support_costs_nci"]),
                AttributedBullet("Encourage the patient to discuss cost concerns with the clinical team. Medication or treatment changes should be reviewed with that team rather than made independently to save money.", citationIDs: ["support_costs_nci"]),
                AttributedBullet("Insurance staff can explain coverage, copayments, deductibles and other charges. An explanation of benefits describes claim processing and is not itself a bill.", citationIDs: ["support_costs_nci"])
            ]),
            .bullets(title: "Make the next step usable", [
                AttributedBullet("Help the patient identify who to contact for transportation, lodging, medicine assistance or billing questions. A list of organizations is most useful when someone can help navigate it.", citationIDs: ["support_costs_nci"]),
                AttributedBullet("Encourage organized treatment and billing records with help from a trusted person if desired. This reference supports referral and discussion; it does not determine eligibility or guarantee financial assistance.", citationIDs: ["support_costs_nci"])
            ])
        ],
        citations: [support_costs_nci],
        lastSourceFidelityReview: "2026-09-17"
    )
}
