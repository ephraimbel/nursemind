import Foundation

private let depth5_ic_care = CitationSource(
    id: "depth5_ic_care",
    shortName: "Treatment of Interstitial Cystitis",
    detail: "Lifestyle, individual fluid needs, bladder training and pelvic floor therapy; reviewed July 2024. Medicines and procedural regimens excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/interstitial-cystitis-bladder-pain-syndrome/treatment",
    lastRetrieved: "2026-09-17"
)

private let depth5_ic_diet = CitationSource(
    id: "depth5_ic_diet",
    shortName: "Eating, Diet, & Nutrition for Interstitial Cystitis",
    detail: "Symptom-linked food diary and dietitian planning; reviewed July 2024. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/interstitial-cystitis-bladder-pain-syndrome/eating-diet-nutrition",
    lastRetrieved: "2026-09-17"
)

public enum BladderPainDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "interstitial-cystitis-daily-support",
        title: "Interstitial cystitis: daily symptom support",
        subtitle: "Food patterns, fluid planning and pelvic floor care",
        eyebrow: "REFERENCE · BLADDER CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Track response to the care plan", [
                AttributedBullet("Treatment is individualized, and several approaches may be tried before symptoms improve. Share changes in pain, urgency and frequency with the clinician.", citationIDs: ["depth5_ic_care"]),
                AttributedBullet("The team may use symptom questionnaires to monitor response. Discuss how symptoms affect daily life while reviewing treatment.", citationIDs: ["depth5_ic_care"])
            ]),
            .bullets(title: "Review food and fluid patterns", [
                AttributedBullet("A food diary may reveal individual triggers. Coffee, citrus, spicy foods and some other products bother some people, but patterns differ.", citationIDs: ["depth5_ic_diet"]),
                AttributedBullet("A dietitian can help plan around identified triggers while preserving suitable meals. Avoid assuming that every possible trigger must be removed.", citationIDs: ["depth5_ic_diet"]),
                AttributedBullet("Agree on fluid intake with the clinician according to health, activity and climate. Hydration advice should fit the individual.", citationIDs: ["depth5_ic_care"])
            ]),
            .bullets(title: "Match pelvic floor care to the problem", [
                AttributedBullet("A specialist physical therapist may help relax and stretch tight pelvic floor muscles. With IC symptoms, avoid unsupervised strengthening exercises such as Kegels.", citationIDs: ["depth5_ic_care"]),
                AttributedBullet("Bladder training may be part of the professional care plan. Discuss how it should be used rather than inventing a schedule.", citationIDs: ["depth5_ic_care"])
            ]),
            .bullets(title: "Support everyday participation", [
                AttributedBullet("Walking, gentle stretching, stress-management techniques and support from others may help with symptoms and coping. Discuss medicine or supplement changes before use.", citationIDs: ["depth5_ic_care"])
            ])
        ],
        citations: [depth5_ic_care, depth5_ic_diet],
        lastSourceFidelityReview: "2026-09-17"
    )
}
