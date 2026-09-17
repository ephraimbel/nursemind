import Foundation

private let depth4_epilepsy = CitationSource(
    id: "depth4_epilepsy",
    shortName: "Managing Epilepsy",
    detail: "Daily self-management, medicines, tracking, sleep and emotional support; May 15, 2024. Third-party program curricula excluded. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/epilepsy/living-with/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth4_therapy = CitationSource(
    id: "depth4_therapy",
    shortName: "Psychotherapies",
    detail: "Choosing a therapist, goals, progress, confidentiality and access; reviewed February 2024. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Institute of Mental Health, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nimh.nih.gov/health/topics/psychotherapies",
    lastRetrieved: "2026-09-17"
)

public enum EpilepsyDailySupportDepthSample {
    public static let entry = ReferenceEntry(
        id: "epilepsy-daily-self-management",
        title: "Epilepsy: everyday self-management",
        subtitle: "Seizure tracking, medicines, sleep and support",
        eyebrow: "REFERENCE · DAILY SUPPORT",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .neurologicalRegulation),
        sections: [
            .bullets(title: "Make the daily plan workable", [
                AttributedBullet("Take antiseizure medicines as prescribed and discuss concerns with the healthcare team. Ask about interactions before adding other medicines or supplements.", citationIDs: ["depth4_epilepsy"]),
                AttributedBullet("Discuss fatigue, memory difficulty or other treatment problems. These can interfere with managing epilepsy and daily activities.", citationIDs: ["depth4_epilepsy"])
            ]),
            .bullets(title: "Track useful information", [
                AttributedBullet("Use a seizure record to identify patterns and possible triggers. Share the record with the treating team.", citationIDs: ["depth4_epilepsy"]),
                AttributedBullet("Raise other health concerns during follow-up. Managing coexisting conditions is part of epilepsy self-management.", citationIDs: ["depth4_epilepsy"])
            ]),
            .bullets(title: "Support healthy routines", [
                AttributedBullet("Prioritize enough sleep, balanced meals and appropriate physical activity. Ask the team how to make exercise safe for the person.", citationIDs: ["depth4_epilepsy"]),
                AttributedBullet("Avoid tobacco and drug misuse, and discuss alcohol with the team. Include stress management in the daily plan.", citationIDs: ["depth4_epilepsy"])
            ]),
            .bullets(title: "Maintain participation and support", [
                AttributedBullet("Epilepsy can affect work, school, transportation and relationships. Ask which barriers are most disruptive and discuss support options.", citationIDs: ["depth4_epilepsy"]),
                AttributedBullet("Self-management education and social support can help build practical skills. Report emotional concerns or persistent stress to the healthcare team.", citationIDs: ["depth4_epilepsy"])
            ])
        ],
        citations: [depth4_epilepsy],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum PsychotherapyPlanningDepthSample {
    public static let entry = ReferenceEntry(
        id: "psychotherapy-preparation-follow-up",
        title: "Psychotherapy: preparation and follow-up",
        subtitle: "Choosing support, agreeing goals and reviewing progress",
        eyebrow: "REFERENCE · DAILY SUPPORT",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood),
        sections: [
            .bullets(title: "Explain what therapy can offer", [
                AttributedBullet("Psychotherapy uses conversations and skills to address troubling emotions, thoughts or behaviors. Treatment may be individual, group-based or combined with medication.", citationIDs: ["depth4_therapy"]),
                AttributedBullet("The approach should fit the person’s needs and condition. An initial healthcare assessment may identify physical contributors to symptoms.", citationIDs: ["depth4_therapy"])
            ]),
            .bullets(title: "Prepare questions for a therapist", [
                AttributedBullet("Ask about credentials, experience with the concern, the proposed approach and the evidence supporting it.", citationIDs: ["depth4_therapy"]),
                AttributedBullet("Discuss comfort and trust with the therapist. Ask how confidentiality works and when information may need to be shared.", citationIDs: ["depth4_therapy"])
            ]),
            .bullets(title: "Make goals and progress explicit", [
                AttributedBullet("Agree on treatment goals, how progress will be evaluated, and the expected appointment schedule and duration.", citationIDs: ["depth4_therapy"]),
                AttributedBullet("If improvement is limited, discuss this openly. The therapist may reconsider the approach or recommend a different form of support.", citationIDs: ["depth4_therapy"])
            ]),
            .bullets(title: "Resolve practical access questions", [
                AttributedBullet("Ask about fees, insurance arrangements and lower-cost options before starting. Availability and coverage vary.", citationIDs: ["depth4_therapy"]),
                AttributedBullet("Discuss whether in-person or remote visits fit the situation. The therapeutic approach and the person’s needs help guide that choice.", citationIDs: ["depth4_therapy"])
            ])
        ],
        citations: [depth4_therapy],
        lastSourceFidelityReview: "2026-09-17"
    )
}
