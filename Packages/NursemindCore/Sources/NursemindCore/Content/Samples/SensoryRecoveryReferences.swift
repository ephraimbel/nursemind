import Foundation

private let depth4_cataract = CitationSource(
    id: "depth4_cataract",
    shortName: "Cataract Surgery",
    detail: "Preparation, postoperative care and urgent symptoms; updated December 5, 2024. Courtesy: National Eye Institute, National Institutes of Health (NEI/NIH). Original text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Eye Institute, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nei.nih.gov/eye-health-information/eye-conditions-and-diseases/cataracts/cataract-surgery",
    lastRetrieved: "2026-09-17"
)

private let depth4_hearing = CitationSource(
    id: "depth4_hearing",
    shortName: "Hearing Aids",
    detail: "Adjustment, fit, troubleshooting, care and handling; updated October 11, 2022. Device eligibility, pricing and coverage rules excluded. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Institute on Deafness and Other Communication Disorders, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nidcd.nih.gov/health/hearing-aids",
    lastRetrieved: "2026-09-17"
)

public enum CataractRecoveryDepthSample {
    public static let entry = ReferenceEntry(
        id: "cataract-surgery-recovery-teaching",
        title: "Cataract surgery: preparation and recovery",
        subtitle: "Eye protection, follow-up and urgent visual changes",
        eyebrow: "REFERENCE · EYE & HEARING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .sensoryPerception),
        sections: [
            .bullets(title: "Prepare for the procedure", [
                AttributedBullet("Cataract surgery replaces the cloudy lens with an artificial lens. The eye-care team measures the eye and discusses how surgery may improve daily activities.", citationIDs: ["depth4_cataract"]),
                AttributedBullet("Review medicines and the surgeon’s fasting and eye-drop instructions. Any medicine hold should come from the treating team.", citationIDs: ["depth4_cataract"])
            ]),
            .bullets(title: "Arrange practical support", [
                AttributedBullet("Arrange transport home because driving immediately after surgery is unsafe. Confirm the follow-up appointment and the prescribed eye-drop plan.", citationIDs: ["depth4_cataract"]),
                AttributedBullet("The surgeon may recommend a shield or other eye protection. Follow the individual instructions for wearing it.", citationIDs: ["depth4_cataract"])
            ]),
            .bullets(title: "Protect the recovering eye", [
                AttributedBullet("Avoid rubbing the eye. Follow the surgeon’s restrictions on lifting, bending and other activities while healing.", citationIDs: ["depth4_cataract"]),
                AttributedBullet("Mild itching, light sensitivity or temporary blur can occur early. Persistent or worsening problems need review rather than an assumption of normal healing.", citationIDs: ["depth4_cataract"])
            ]),
            .bullets(title: "Know when to contact the eye doctor", [
                AttributedBullet("Contact the eye doctor immediately for vision loss, bad pain that persists, marked redness, or new flashes or floaters.", citationIDs: ["depth4_cataract"]),
                AttributedBullet("Keep scheduled reviews. The eye-care team checks healing and determines whether the glasses prescription needs changing.", citationIDs: ["depth4_cataract"])
            ])
        ],
        citations: [depth4_cataract],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HearingAidCareDepthSample {
    public static let entry = ReferenceEntry(
        id: "hearing-aid-daily-support",
        title: "Hearing aids: daily care and adjustment",
        subtitle: "Handling, fit and practical listening support",
        eyebrow: "REFERENCE · EYE & HEARING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .sensoryPerception),
        sections: [
            .bullets(title: "Set realistic expectations", [
                AttributedBullet("Hearing aids amplify sound but do not restore normal hearing. Adjustment takes practice, and background noise may remain difficult.", citationIDs: ["depth4_hearing"]),
                AttributedBullet("Ask an audiologist about device features that match hearing needs and dexterity. The smallest device may be harder to handle.", citationIDs: ["depth4_hearing"])
            ]),
            .bullets(title: "Practice everyday handling", [
                AttributedBullet("Practice inserting and removing the devices, identifying right and left, and managing batteries or controls with the audiologist.", citationIDs: ["depth4_hearing"]),
                AttributedBullet("Learn how to check performance and manage different listening environments. Consistent use helps the person become accustomed to amplified sound.", citationIDs: ["depth4_hearing"])
            ]),
            .bullets(title: "Investigate discomfort or poor sound", [
                AttributedBullet("Report discomfort or an uncomfortable sense of the voice being blocked. The audiologist can assess fit and settings.", citationIDs: ["depth4_hearing"]),
                AttributedBullet("Whistling can reflect fit, malfunction, earwax or fluid. Seek an assessment instead of assuming that louder amplification will solve it.", citationIDs: ["depth4_hearing"])
            ]),
            .bullets(title: "Protect the equipment", [
                AttributedBullet("Follow cleaning instructions and keep hearing aids away from heat, moisture and hair products. Turn them off when not in use.", citationIDs: ["depth4_hearing"]),
                AttributedBullet("Keep replacement batteries away from children and pets. Ask the audiologist how to maintain the specific hearing aid.", citationIDs: ["depth4_hearing"])
            ])
        ],
        citations: [depth4_hearing],
        lastSourceFidelityReview: "2026-09-17"
    )
}
