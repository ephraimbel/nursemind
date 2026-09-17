import Foundation

private let depth4_ra = CitationSource(
    id: "depth4_ra",
    shortName: "Rheumatoid Arthritis: Diagnosis, Treatment, and Steps to Take",
    detail: "Living with rheumatoid arthritis: rest, activity, joint protection, adaptive equipment and emotional support; reviewed November 2022. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/rheumatoid-arthritis/diagnosis-treatment-and-steps-to-take",
    lastRetrieved: "2026-09-17"
)

private let depth4_hip = CitationSource(
    id: "depth4_hip",
    shortName: "Hip Replacement Surgery",
    detail: "Preparing for surgery and what to expect after surgery; reviewed August 2023. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/hip-replacement-surgery",
    lastRetrieved: "2026-09-17"
)

private let depth4_hip_home = CitationSource(
    id: "depth4_hip_home",
    shortName: "Hip Replacement Surgery: Steps to Take",
    detail: "Life after surgery, exercise and preventing falls; reviewed August 2023. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/hip-replacement-surgery/diagnosis-treatment-and-steps-to-take",
    lastRetrieved: "2026-09-17"
)

private let depth4_eczema = CitationSource(
    id: "depth4_eczema",
    shortName: "Atopic Dermatitis: Diagnosis, Treatment, and Steps to Take",
    detail: "Living with atopic dermatitis, bathing, moisturizers and clinician-supervised bleach baths and wet wraps; reviewed November 2022. Vaccine statements and treatment regimens excluded. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/atopic-dermatitis/diagnosis-treatment-and-steps-to-take",
    lastRetrieved: "2026-09-17"
)

private let depth4_psoriasis = CitationSource(
    id: "depth4_psoriasis",
    shortName: "Psoriasis: Diagnosis, Treatment, and Steps to Take",
    detail: "Assessment, skin care, triggers, sunlight and emotional support; reviewed October 2023. Medication regimens excluded. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/psoriasis/diagnosis-treatment-and-steps-to-take",
    lastRetrieved: "2026-09-17"
)

public enum RheumatoidFunctionDepthSample {
    public static let entry = ReferenceEntry(
        id: "rheumatoid-arthritis-daily-function",
        title: "Rheumatoid arthritis: daily function",
        subtitle: "Joint protection, pacing and adaptive equipment",
        eyebrow: "REFERENCE · MOBILITY & SKIN CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility),
        sections: [
            .bullets(title: "Balance rest with movement", [
                AttributedBullet("During active inflammation, additional rest may help. Short rest breaks generally support recovery better than prolonged bed rest.", citationIDs: ["depth4_ra"]),
                AttributedBullet("When symptoms allow, activity supports strength, flexibility and mobility. Discuss the exercise plan with the team; water-based activity may reduce joint stress.", citationIDs: ["depth4_ra"])
            ]),
            .bullets(title: "Reduce strain during daily tasks", [
                AttributedBullet("Occupational therapy can help adapt dressing, cooking and other daily activities while protecting joints and conserving energy.", citationIDs: ["depth4_ra"]),
                AttributedBullet("Large handles, zipper pulls, long shoehorns and adapted utensils may make tasks easier. Select aids around the person’s specific difficulty.", citationIDs: ["depth4_ra"])
            ]),
            .bullets(title: "Use supports with professional guidance", [
                AttributedBullet("Discuss splints with the clinician or therapist before use. Physical therapy can help maintain joint movement and function.", citationIDs: ["depth4_ra"]),
                AttributedBullet("Consider household changes that reduce repeated stair use or difficult transfers, including suitable seating or toilet supports.", citationIDs: ["depth4_ra"])
            ]),
            .bullets(title: "Include the whole person in follow-up", [
                AttributedBullet("Stress management, counseling and support from others can help with the burden of rheumatoid arthritis. Ask how symptoms affect sleep and mood.", citationIDs: ["depth4_ra"]),
                AttributedBullet("Keep follow-up visits and ordered monitoring. The team reviews disease activity, treatment effects and associated health concerns.", citationIDs: ["depth4_ra"])
            ])
        ],
        citations: [depth4_ra],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HipReplacementHomeDepthSample {
    public static let entry = ReferenceEntry(
        id: "hip-replacement-home-preparation",
        title: "Hip replacement: preparing for home recovery",
        subtitle: "Practical support, mobility teaching and follow-up",
        eyebrow: "REFERENCE · MOBILITY & SKIN CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility),
        sections: [
            .bullets(title: "Organize help before surgery", [
                AttributedBullet("Discuss the expected recovery plan with the surgeon. Arrange transport for surgery and follow-up, plus help with meals, shopping and laundry.", citationIDs: ["depth4_hip"]),
                AttributedBullet("Ask the team which strengthening exercises are appropriate before surgery and which equipment may be needed afterward.", citationIDs: ["depth4_hip"])
            ]),
            .bullets(title: "Prepare the recovery space", [
                AttributedBullet("Place frequently used items within easy reach. A reacher or clothing with pockets can reduce awkward carrying while using walking aids.", citationIDs: ["depth4_hip"]),
                AttributedBullet("Discuss a shower seat, bathroom grab bars, toilet support and walking aids with the team. Equipment needs depend on the person and home.", citationIDs: ["depth4_hip"]),
                AttributedBullet("Remove loose rugs, cords and clutter; improve night lighting and stair support. Wear secure, nonslip footwear to reduce falls.", citationIDs: ["depth4_hip_home"])
            ]),
            .bullets(title: "Practice the discharge plan", [
                AttributedBullet("Rehabilitation includes safe walking, stairs, use of aids and the prescribed weight-bearing instructions. Clarify these with the surgical and therapy teams.", citationIDs: ["depth4_hip"]),
                AttributedBullet("Before discharge, review incision care, home exercises, allowed activities and follow-up. Some people need additional rehabilitation in a facility.", citationIDs: ["depth4_hip"])
            ]),
            .bullets(title: "Progress according to recovery", [
                AttributedBullet("Recovery varies with health and function before surgery. The therapist and surgeon guide progression as mobility, strength and endurance improve.", citationIDs: ["depth4_hip"]),
                AttributedBullet("Discuss exercise choices after recovery. NIAMS advises avoiding high-impact activities that may injure the replacement joint; the clinician individualizes recommendations.", citationIDs: ["depth4_hip_home"])
            ])
        ],
        citations: [depth4_hip, depth4_hip_home],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum EczemaDailySupportDepthSample {
    public static let entry = ReferenceEntry(
        id: "eczema-daily-skin-care",
        title: "Eczema: daily skin-care support",
        subtitle: "Bathing, moisturizers and the effect on daily life",
        eyebrow: "REFERENCE · MOBILITY & SKIN CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        sections: [
            .bullets(title: "Understand the current burden", [
                AttributedBullet("Ask about itch, affected areas, sleep and activities. Review which products or treatments helped and which appeared to worsen symptoms.", citationIDs: ["depth4_eczema"]),
                AttributedBullet("Discuss possible irritants, including fragranced products, detergents, rough fabrics and tobacco smoke. Triggers vary between people.", citationIDs: ["depth4_eczema"])
            ]),
            .bullets(title: "Make bathing gentler", [
                AttributedBullet("Use lukewarm water with a mild, unscented cleanser or nonsoap option. Pat the skin dry rather than rubbing.", citationIDs: ["depth4_eczema"]),
                AttributedBullet("Apply a cream or ointment while skin remains damp. Some lotions contain ingredients, including alcohol, that may irritate affected skin.", citationIDs: ["depth4_eczema"])
            ]),
            .bullets(title: "Reduce avoidable irritation", [
                AttributedBullet("Avoid overheating and uncomfortable fabrics. A comfortable room temperature and humidity may help limit irritation.", citationIDs: ["depth4_eczema"]),
                AttributedBullet("Scratching and rubbing can worsen eczema. Discuss persistent itching with the treating team when routine care is not enough.", citationIDs: ["depth4_eczema"])
            ]),
            .bullets(title: "Keep additional treatments individualized", [
                AttributedBullet("Bleach baths and wet wraps require clinician guidance and specific instructions. Do not improvise concentrations, timing or application.", citationIDs: ["depth4_eczema"]),
                AttributedBullet("Sleep loss, anxiety and distress deserve follow-up alongside the skin symptoms. Counseling or other support may help.", citationIDs: ["depth4_eczema"])
            ])
        ],
        citations: [depth4_eczema],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum PsoriasisDailySupportDepthSample {
    public static let entry = ReferenceEntry(
        id: "psoriasis-daily-skin-support",
        title: "Psoriasis: daily skin and wellbeing support",
        subtitle: "Comfort, triggers and concerns to raise at follow-up",
        eyebrow: "REFERENCE · MOBILITY & SKIN CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        sections: [
            .bullets(title: "Look beyond the visible plaques", [
                AttributedBullet("Review skin, scalp and nail changes alongside itch, burning and interference with daily activities. Tell the clinician about joint tenderness.", citationIDs: ["depth4_psoriasis"]),
                AttributedBullet("Treatment depends on severity, affected sites, health history and response. Discuss difficulties following the current plan.", citationIDs: ["depth4_psoriasis"])
            ]),
            .bullets(title: "Support skin comfort", [
                AttributedBullet("Use lukewarm baths and mild soap, then moisturize while the skin is damp. Heavier moisturizers can help protect dry skin.", citationIDs: ["depth4_psoriasis"]),
                AttributedBullet("Ask the clinician before increasing sun exposure. Limited exposure may help some people, but too much can worsen psoriasis.", citationIDs: ["depth4_psoriasis"])
            ]),
            .bullets(title: "Identify patterns around flares", [
                AttributedBullet("Stress, cold weather, skin injuries, infections and some medicines may trigger flares. Discuss patterns and recent changes with the team.", citationIDs: ["depth4_psoriasis"]),
                AttributedBullet("Support a balanced diet, smoking cessation and discussion of alcohol use. Lifestyle planning should fit the person’s overall health.", citationIDs: ["depth4_psoriasis"])
            ]),
            .bullets(title: "Address emotional effects", [
                AttributedBullet("Visible skin changes can affect confidence, relationships and emotional wellbeing. Invite the person to discuss these concerns.", citationIDs: ["depth4_psoriasis"]),
                AttributedBullet("Counseling and support groups may help with anxiety or depression associated with psoriasis. Include these needs in follow-up.", citationIDs: ["depth4_psoriasis"])
            ])
        ],
        citations: [depth4_psoriasis],
        lastSourceFidelityReview: "2026-09-17"
    )
}
