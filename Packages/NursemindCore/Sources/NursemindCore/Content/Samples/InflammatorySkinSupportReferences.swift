import Foundation

private let depth6_hs_overview = CitationSource(
    id: "depth6_hs_overview",
    shortName: "Hidradenitis Suppurativa: Overview, Symptoms and Causes",
    detail: "Noncontagious inflammation, hygiene misconceptions, drainage and scarring; reviewed June 2022. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/hidradenitis-suppurativa-hs",
    lastRetrieved: "2026-09-17"
)

private let depth6_hs_daily = CitationSource(
    id: "depth6_hs_daily",
    shortName: "Hidradenitis Suppurativa: Diagnosis, Treatment and Steps to Take",
    detail: "Individualized follow-up, comfort and emotional support; reviewed June 2022. Counts of approved biologics, medicine selection and bleach-bath recipes excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/hidradenitis-suppurativa-hs/diagnosis-treatment-and-steps-to-take",
    lastRetrieved: "2026-09-17"
)

public enum HidradenitisDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "hidradenitis-daily-skin-support",
        title: "Hidradenitis suppurativa: daily skin support",
        subtitle: "Comfort, drainage, follow-up and emotional health",
        eyebrow: "REFERENCE · SPECIALTY DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .painComfort),
        sections: [
            .bullets(title: "Explain the condition without blame", [
                AttributedBullet("Hidradenitis suppurativa is a chronic inflammatory condition involving painful skin bumps and tunnels. It is not contagious and is not caused by poor hygiene.", citationIDs: ["depth6_hs_overview"]),
                AttributedBullet("Lesions may drain, scar or form persistent open areas. Common sites include the axillae, groin, buttocks and areas beneath the breasts.", citationIDs: ["depth6_hs_overview"])
            ]),
            .bullets(title: "Support comfort", [
                AttributedBullet("Keep affected areas clean and choose comfortable clothing. Warm compresses may help comfort.", citationIDs: ["depth6_hs_daily"]),
                AttributedBullet("Special measures such as bleach baths should be discussed with the clinician. This guide does not supply a dilution recipe or substitute for individual instructions.", citationIDs: ["depth6_hs_daily"])
            ]),
            .bullets(title: "Maintain follow-up", [
                AttributedBullet("Early treatment can help manage symptoms and reduce new lesions. More extensive or difficult disease may need dermatology care.", citationIDs: ["depth6_hs_daily"]),
                AttributedBullet("Treatment depends on lesion severity, extent and complications. Discuss persistent pain and daily limitations with the treating clinician.", citationIDs: ["depth6_hs_daily"])
            ]),
            .bullets(title: "Include broader support", [
                AttributedBullet("Offer support for smoking cessation and healthy weight when relevant. These are parts of care, without assigning blame for the condition.", citationIDs: ["depth6_hs_daily"]),
                AttributedBullet("Counseling and patient support groups may help with the emotional burden. Invite discussion of how symptoms affect quality of life.", citationIDs: ["depth6_hs_daily"])
            ])
        ],
        citations: [depth6_hs_overview, depth6_hs_daily],
        lastSourceFidelityReview: "2026-09-17"
    )
}
