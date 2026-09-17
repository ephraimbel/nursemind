import Foundation

private let depth6_sudden_hearing = CitationSource(
    id: "depth6_sudden_hearing",
    shortName: "Sudden Deafness",
    detail: "Recognition of sudden hearing loss as a medical emergency; updated September 14, 2018. Drug treatment and audiometric diagnostic thresholds excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Institute on Deafness and Other Communication Disorders; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nidcd.nih.gov/health/sudden-deafness",
    lastRetrieved: "2026-09-17"
)

private let depth6_tinnitus = CitationSource(
    id: "depth6_tinnitus",
    shortName: "Tinnitus",
    detail: "Symptoms, diagnosis, sound therapy, counseling and limits of supplements; updated May 1, 2023. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Institute on Deafness and Other Communication Disorders; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nidcd.nih.gov/health/tinnitus",
    lastRetrieved: "2026-09-17"
)

private let depth6_stroke_warning = CitationSource(
    id: "depth6_stroke_warning",
    shortName: "Signs and Symptoms of Stroke",
    detail: "Sudden symptoms and immediate emergency response; May 19, 2026. Treatment windows, mnemonic graphics and treatment eligibility excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/stroke/signs-symptoms/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth6_balance = CitationSource(
    id: "depth6_balance",
    shortName: "Balance Disorders",
    detail: "Symptom history, medicine contributors, vestibular rehabilitation and daily fall prevention; updated March 6, 2018. Diagnostic maneuvers and medicine selection excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Institute on Deafness and Other Communication Disorders; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nidcd.nih.gov/health/balance-disorders",
    lastRetrieved: "2026-09-17"
)

private let depth6_smell = CitationSource(
    id: "depth6_smell",
    shortName: "Smell Disorders",
    detail: "Evaluation, reduced hazard detection, eating changes and emotional effects; updated July 31, 2023. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Institute on Deafness and Other Communication Disorders; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nidcd.nih.gov/health/smell-disorders",
    lastRetrieved: "2026-09-17"
)

private let depth6_taste = CitationSource(
    id: "depth6_taste",
    shortName: "Taste Disorders",
    detail: "Assessment, oral health, medicine review and food adaptations; updated July 31, 2023. Home diagnostic tests and supplement regimens excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Institute on Deafness and Other Communication Disorders; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nidcd.nih.gov/health/taste-disorders",
    lastRetrieved: "2026-09-17"
)

public enum TinnitusCopingSupportSample {
    public static let entry = ReferenceEntry(
        id: "tinnitus-assessment-coping-support",
        title: "Tinnitus: assessment and coping support",
        subtitle: "Describing symptoms and reducing their daily impact",
        eyebrow: "REFERENCE · SPECIALTY DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .sensoryPerception),
        sections: [
            .bullets(title: "Recognize sudden hearing loss", [
                AttributedBullet("Sudden hearing loss, with or without tinnitus, needs immediate medical assessment. NIDCD describes sudden deafness as a medical emergency; do not assume the cause is earwax or allergies.", citationIDs: ["depth6_sudden_hearing"])
            ]),
            .bullets(title: "Describe the sound and its impact", [
                AttributedBullet("Record when the sound began, whether it affects one or both ears and whether it pulses with the heartbeat. Include effects on sleep, concentration and mood.", citationIDs: ["depth6_tinnitus"]),
                AttributedBullet("Review noise exposure, hearing changes, ear symptoms and medicines. Earwax, infection, hearing loss and medication effects are among possible contributors.", citationIDs: ["depth6_tinnitus"])
            ]),
            .bullets(title: "Support appropriate assessment", [
                AttributedBullet("Primary care can assess potential contributors and arrange ENT or audiology review. A hearing assessment may be part of the evaluation.", citationIDs: ["depth6_tinnitus"]),
                AttributedBullet("Pulsating tinnitus may need imaging to investigate a structural or vascular cause. Report this pattern rather than assuming all tinnitus has the same explanation.", citationIDs: ["depth6_tinnitus"])
            ]),
            .bullets(title: "Discuss symptom-support options", [
                AttributedBullet("Sound from a bedside generator, fan or similar device may help relaxation and sleep. Hearing aids may help when hearing loss accompanies tinnitus.", citationIDs: ["depth6_tinnitus"]),
                AttributedBullet("Counseling and cognitive behavioral therapy can reduce distress and improve coping. The goal is to reduce the impact on daily life.", citationIDs: ["depth6_tinnitus"])
            ]),
            .bullets(title: "Set realistic expectations", [
                AttributedBullet("No medicine specifically treats tinnitus itself. Clinicians may treat associated anxiety, depression or sleep problems when appropriate.", citationIDs: ["depth6_tinnitus"]),
                AttributedBullet("Vitamins, herbs and supplements advertised as tinnitus cures have not been proven effective. Discuss persistent symptoms and their impact with the healthcare team.", citationIDs: ["depth6_tinnitus"])
            ])
        ],
        citations: [depth6_tinnitus, depth6_sudden_hearing],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum BalanceSymptomSafetySample {
    public static let entry = ReferenceEntry(
        id: "balance-symptom-history-safety",
        title: "Balance problems: symptom history and safety",
        subtitle: "Recognizing urgent changes and supporting safe daily activity",
        eyebrow: "REFERENCE · SPECIALTY DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .sensoryPerception),
        sections: [
            .bullets(title: "Separate sudden warning symptoms", [
                AttributedBullet("Sudden trouble walking, dizziness or loss of balance can be a stroke warning sign. Other signs include new vision changes, one-sided weakness, speech difficulty or a severe unexplained headache.", citationIDs: ["depth6_stroke_warning"]),
                AttributedBullet("CDC advises calling 911 immediately for stroke signs and noting when symptoms began. Symptoms that resolve still need immediate medical attention.", citationIDs: ["depth6_stroke_warning"])
            ]),
            .bullets(title: "Build a useful symptom history", [
                AttributedBullet("Describe spinning, faintness or unsteadiness; when it occurs; episode duration; and associated hearing changes, tinnitus or headache. Include falls and their circumstances.", citationIDs: ["depth6_balance"]),
                AttributedBullet("Review prescription medicines, over-the-counter products and supplements. Medicines, blood-pressure changes, inner-ear problems and other conditions can contribute.", citationIDs: ["depth6_balance"])
            ]),
            .bullets(title: "Adapt everyday activity", [
                AttributedBullet("Discuss whether driving is safe and how to manage stairs, bathing and exercise. Avoid walking in darkness when dizzy.", citationIDs: ["depth6_balance"]),
                AttributedBullet("Appropriate footwear, needed walking aids and environmental changes such as handrails can reduce injury risk.", citationIDs: ["depth6_balance"])
            ]),
            .bullets(title: "Follow the identified cause", [
                AttributedBullet("An ENT clinician, audiologist or other specialist may help determine the cause. Treatment for one balance disorder is not interchangeable with treatment for another.", citationIDs: ["depth6_balance"]),
                AttributedBullet("Vestibular rehabilitation can provide an individualized plan when symptoms persist. Some medicines used for dizziness or nausea cause drowsiness.", citationIDs: ["depth6_balance"])
            ])
        ],
        citations: [depth6_stroke_warning, depth6_balance],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum SmellTasteDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "smell-taste-safety-nutrition",
        title: "Smell and taste changes: safety and nutrition",
        subtitle: "Supporting intake and recognizing reduced hazard detection",
        eyebrow: "REFERENCE · SPECIALTY DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .sensoryPerception),
        sections: [
            .bullets(title: "Clarify what changed", [
                AttributedBullet("Describe reduced, absent or distorted smells and odors sensed without an external source. Include recent illness, head injury, chemical exposure and medicine changes.", citationIDs: ["depth6_smell"]),
                AttributedBullet("Loss of smell can make familiar foods seem flavorless. Assessment may include an ENT examination, history and supervised smell testing.", citationIDs: ["depth6_smell"])
            ]),
            .bullets(title: "Recognize safety and nutrition effects", [
                AttributedBullet("Reduced smell can interfere with detecting smoke, gas leaks and spoiled food. Include this loss of warning information in home-safety discussions.", citationIDs: ["depth6_smell"]),
                AttributedBullet("Changes in appetite and food enjoyment may lead to weight loss or gain. Excess salt added for flavor can complicate conditions such as hypertension or kidney disease.", citationIDs: ["depth6_smell"])
            ]),
            .bullets(title: "Support food enjoyment", [
                AttributedBullet("Try varied food colors and textures and permitted herbs or spices. Avoid compensating by adding extra sugar or salt.", citationIDs: ["depth6_taste"]),
                AttributedBullet("Oral hygiene and dental assessment matter. Dental problems and some medicines may contribute to altered taste.", citationIDs: ["depth6_taste"])
            ]),
            .bullets(title: "Coordinate evaluation and support", [
                AttributedBullet("Medication changes belong with the prescriber; do not stop a medicine independently because taste has changed. Treating an underlying condition may help.", citationIDs: ["depth6_taste"]),
                AttributedBullet("Some changes improve, while persistent symptoms may need counseling and practical adaptation. Discuss loss of intake, weight changes or emotional distress with the clinician.", citationIDs: ["depth6_taste"])
            ])
        ],
        citations: [depth6_smell, depth6_taste],
        lastSourceFidelityReview: "2026-09-17"
    )
}
