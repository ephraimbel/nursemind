import Foundation

private let depth5_lupus = CitationSource(
    id: "depth5_lupus",
    shortName: "Systemic Lupus Erythematosus: Diagnosis, Treatment, and Steps to Take",
    detail: "Living with lupus, follow-up, supplements and pregnancy planning; reviewed October 2022. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/lupus/diagnosis-treatment-and-steps-to-take",
    lastRetrieved: "2026-09-17"
)

private let depth5_sjogren = CitationSource(
    id: "depth5_sjogren",
    shortName: "Sjögren’s Disease: Diagnosis, Treatment, and Steps to Take",
    detail: "Eye and mouth care, medication contributors and emotional support; reviewed June 2024. Drug regimens and eyelid-cleanser recipes excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/sjogrens-disease/diagnosis-treatment-and-steps-to-take",
    lastRetrieved: "2026-09-17"
)

private let depth5_fibromyalgia = CitationSource(
    id: "depth5_fibromyalgia",
    shortName: "Fibromyalgia: Diagnosis, Treatment, and Steps to Take",
    detail: "Exercise, fatigue, sleep, pacing and behavioral support; reviewed May 2024. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/fibromyalgia/diagnosis-treatment-and-steps-to-take",
    lastRetrieved: "2026-09-17"
)

public enum LupusDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "lupus-daily-care-follow-up",
        title: "Lupus: daily care and follow-up",
        subtitle: "Sun protection, symptom changes and treatment continuity",
        eyebrow: "REFERENCE · AUTOIMMUNE & PAIN CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .cellularRegulation),
        sections: [
            .bullets(title: "Discuss changing symptoms", [
                AttributedBullet("Increased tiredness, joint swelling, pain or a new rash can accompany a flare. Share changes with the treating team.", citationIDs: ["depth5_lupus"]),
                AttributedBullet("Keep follow-up visits even when symptoms settle. Monitoring addresses disease activity and treatment effects, which may change over time.", citationIDs: ["depth5_lupus"])
            ]),
            .bullets(title: "Reduce avoidable triggers", [
                AttributedBullet("Sun exposure can trigger lupus activity. Protective clothing, a hat and sunscreen are useful parts of the daily plan.", citationIDs: ["depth5_lupus"]),
                AttributedBullet("Discuss a suitable exercise routine and balanced diet. Smoking cessation supports cardiovascular health, an important concern in lupus.", citationIDs: ["depth5_lupus"])
            ]),
            .bullets(title: "Protect treatment continuity", [
                AttributedBullet("Review OTC medicines, herbs and supplements before starting them because interactions can occur. Discuss changes before stopping prescribed treatment.", citationIDs: ["depth5_lupus"]),
                AttributedBullet("Discuss pregnancy plans early with the lupus team. Some medicines are incompatible with pregnancy and require clinician-led planning.", citationIDs: ["depth5_lupus"])
            ]),
            .bullets(title: "Support participation and coping", [
                AttributedBullet("Flexible hours, a more comfortable work area or help with tasks can support participation when symptoms interfere.", citationIDs: ["depth5_lupus"]),
                AttributedBullet("Support groups, communication with family, enjoyable activities and stress-management approaches may help with the emotional burden of lupus.", citationIDs: ["depth5_lupus"])
            ])
        ],
        citations: [depth5_lupus],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum SjogrenDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "sjogren-eye-mouth-support",
        title: "Sjögren’s disease: eye and mouth care",
        subtitle: "Dryness, dental protection and coordinated follow-up",
        eyebrow: "REFERENCE · AUTOIMMUNE & PAIN CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .sensoryPerception),
        sections: [
            .bullets(title: "Reduce eye irritation", [
                AttributedBullet("Protect eyes from smoke, drafts and wind. Wraparound glasses or side shields can help reduce exposure.", citationIDs: ["depth5_sjogren"]),
                AttributedBullet("Report irritating eye drops to the eye-care team. Product choice, including preservatives, matters when drops are used frequently.", citationIDs: ["depth5_sjogren"])
            ]),
            .bullets(title: "Protect teeth and oral comfort", [
                AttributedBullet("Brush with fluoride toothpaste and clean between teeth. Arrange regular dental review and ask whether additional fluoride treatment is appropriate.", citationIDs: ["depth5_sjogren"]),
                AttributedBullet("Sugar-free gum or candy may stimulate saliva. Discuss a practical mouth-moistening plan when dryness affects comfort.", citationIDs: ["depth5_sjogren"]),
                AttributedBullet("Oral burning, soreness or white patches need assessment by the doctor or dentist; these can be signs of thrush.", citationIDs: ["depth5_sjogren"])
            ]),
            .bullets(title: "Review other sources of dryness", [
                AttributedBullet("Review medicines with the treating clinician because some can worsen eye and mouth dryness. Avoid making independent medication changes.", citationIDs: ["depth5_sjogren"]),
                AttributedBullet("Moisturizers can help dry skin, and a suitable balm can protect dry lips. Raise persistent dryness at follow-up.", citationIDs: ["depth5_sjogren"])
            ]),
            .bullets(title: "Coordinate continued support", [
                AttributedBullet("Continue eye, dental and medical follow-up. Discuss fatigue and emotional effects, and consider support groups or counseling when helpful.", citationIDs: ["depth5_sjogren"])
            ])
        ],
        citations: [depth5_sjogren],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum FibromyalgiaDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "fibromyalgia-sleep-pacing-support",
        title: "Fibromyalgia: sleep, pacing and activity",
        subtitle: "Practical support for fatigue and daily function",
        eyebrow: "REFERENCE · AUTOIMMUNE & PAIN CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        sections: [
            .bullets(title: "Build activity gradually", [
                AttributedBullet("Discuss an exercise plan before starting. Begin at a manageable level and increase gradually; walking, cycling or water-based activity may be useful.", citationIDs: ["depth5_fibromyalgia"]),
                AttributedBullet("A physical therapist or exercise physiologist can tailor activity when pain and fatigue make starting difficult.", citationIDs: ["depth5_fibromyalgia"])
            ]),
            .bullets(title: "Avoid using all energy at once", [
                AttributedBullet("Pace tasks through the day. Trying to finish everything during a better period can leave symptoms worse afterward.", citationIDs: ["depth5_fibromyalgia"]),
                AttributedBullet("Treatment often combines medicines, activity and behavioral approaches. Improvement may be gradual and should be reviewed with the team.", citationIDs: ["depth5_fibromyalgia"])
            ]),
            .bullets(title: "Make sleep routines consistent", [
                AttributedBullet("Keep regular sleep and wake times. Aim for a quiet, dark, comfortable bedroom and reserve the bed for sleep.", citationIDs: ["depth5_fibromyalgia"]),
                AttributedBullet("Wind down before bedtime; screens, late work or exercise may interfere. Discuss caffeine, nicotine and alcohol when reviewing sleep difficulties.", citationIDs: ["depth5_fibromyalgia"])
            ]),
            .bullets(title: "Connect pain care with support", [
                AttributedBullet("Cognitive behavioral therapy can teach skills for managing pain. This may be used alongside other treatments.", citationIDs: ["depth5_fibromyalgia"]),
                AttributedBullet("Support groups and counseling can help with emotional difficulties. Persistent sleep problems may also need a sleep specialist’s assessment.", citationIDs: ["depth5_fibromyalgia"])
            ])
        ],
        citations: [depth5_fibromyalgia],
        lastSourceFidelityReview: "2026-09-17"
    )
}
