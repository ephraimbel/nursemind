import Foundation

private let depth5_gerd_diet = CitationSource(
    id: "depth5_gerd_diet",
    shortName: "Eating, Diet, & Nutrition for GER & GERD",
    detail: "Meal timing and individual dietary triggers; reviewed July 2020. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/acid-reflux-ger-gerd-adults/eating-diet-nutrition",
    lastRetrieved: "2026-09-17"
)

private let depth5_gerd_care = CitationSource(
    id: "depth5_gerd_care",
    shortName: "Treatment for GER & GERD",
    detail: "Lifestyle changes and limits of OTC self-treatment; reviewed July 2020. Drug-selection and procedural-treatment sections excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/acid-reflux-ger-gerd-adults/treatment",
    lastRetrieved: "2026-09-17"
)

private let depth5_gerd_symptoms = CitationSource(
    id: "depth5_gerd_symptoms",
    shortName: "Symptoms & Causes of GER & GERD",
    detail: "Symptoms requiring assessment, including dysphagia, bleeding and weight loss; reviewed July 2020. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/acid-reflux-ger-gerd-adults/symptoms-causes",
    lastRetrieved: "2026-09-17"
)

private let depth5_crohn = CitationSource(
    id: "depth5_crohn",
    shortName: "Eating, Diet, & Nutrition for Crohn’s Disease",
    detail: "Appetite, absorption, food diary and supplements; reviewed July 2024. Referenced textbook material is not reproduced. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/crohns-disease/eating-diet-nutrition",
    lastRetrieved: "2026-09-17"
)

private let depth5_uc = CitationSource(
    id: "depth5_uc",
    shortName: "Eating, Diet, & Nutrition for Ulcerative Colitis",
    detail: "Balanced diet, reduced intake and individualized dietary changes; reviewed September 2020. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/ulcerative-colitis/eating-diet-nutrition",
    lastRetrieved: "2026-09-17"
)

public enum GERDDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "gerd-daily-care-follow-up",
        title: "GERD: daily care and follow-up",
        subtitle: "Meal timing, symptom triggers and limits of self-treatment",
        eyebrow: "REFERENCE · DIGESTIVE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Match changes to the symptom pattern", [
                AttributedBullet("For symptoms at night or while lying down, finishing meals at least three hours before bed may help.", citationIDs: ["depth5_gerd_diet"]),
                AttributedBullet("Ask which foods or drinks seem related to symptoms. Common triggers include coffee, alcohol, mint, high-fat foods and acidic or spicy foods.", citationIDs: ["depth5_gerd_diet"])
            ]),
            .bullets(title: "Use an individualized routine", [
                AttributedBullet("Discuss reducing specific suspected triggers and whether symptoms improve. Diet changes should follow the person’s pattern.", citationIDs: ["depth5_gerd_diet"]),
                AttributedBullet("The clinician may recommend elevating the upper body during sleep, smoking cessation or weight management when appropriate.", citationIDs: ["depth5_gerd_care"])
            ]),
            .bullets(title: "Review ongoing medicine use", [
                AttributedBullet("Persistent symptoms despite OTC medicines need clinical review. Daily antacid use or treatment of severe symptoms should be discussed with the clinician.", citationIDs: ["depth5_gerd_care"]),
                AttributedBullet("Antacids can cause diarrhea or constipation. Report these problems and discuss the risks and benefits of continuing reflux medicines.", citationIDs: ["depth5_gerd_care"])
            ]),
            .bullets(title: "Recognize symptoms needing assessment", [
                AttributedBullet("Trouble or pain with swallowing, persistent vomiting, appetite loss or unexplained weight loss need medical assessment.", citationIDs: ["depth5_gerd_symptoms"]),
                AttributedBullet("Chest pain or signs of gastrointestinal bleeding, including bloody vomit or black tarry stool, may reflect serious illness. Seek medical assessment rather than assuming reflux.", citationIDs: ["depth5_gerd_symptoms"])
            ])
        ],
        citations: [depth5_gerd_diet, depth5_gerd_care, depth5_gerd_symptoms],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum IBDNutritionSupportSample {
    public static let entry = ReferenceEntry(
        id: "ibd-nutrition-follow-up",
        title: "IBD: nutrition and food tolerance",
        subtitle: "Supporting intake in Crohn’s disease and ulcerative colitis",
        eyebrow: "REFERENCE · DIGESTIVE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Understand why intake may fall", [
                AttributedBullet("Crohn’s symptoms can reduce appetite and food intake. Small-intestinal inflammation, some medicines and surgery may also reduce nutrient absorption.", citationIDs: ["depth5_crohn"]),
                AttributedBullet("Ulcerative colitis can reduce appetite and intake as well. Discuss difficulty maintaining a balanced diet with the treating team.", citationIDs: ["depth5_uc"])
            ]),
            .bullets(title: "Review food patterns individually", [
                AttributedBullet("Discuss foods that seem associated with Crohn’s symptoms. The clinician may recommend a food diary to help identify a pattern.", citationIDs: ["depth5_crohn"]),
                AttributedBullet("For ulcerative colitis, a food diary may also help evaluate suspected triggers. Diet changes depend on symptoms and medicines rather than a universal exclusion list.", citationIDs: ["depth5_uc"])
            ]),
            .bullets(title: "Preserve nutritional adequacy", [
                AttributedBullet("Discuss a balanced eating plan that meets nutrient needs. Crohn’s-related malabsorption may require specific supplementation selected by the clinician.", citationIDs: ["depth5_crohn"]),
                AttributedBullet("The ulcerative-colitis team may recommend dietary changes or supplements if intake is inadequate. Ask how the proposed plan addresses the person’s needs.", citationIDs: ["depth5_uc"])
            ]),
            .bullets(title: "Revisit the plan as care changes", [
                AttributedBullet("Review nutrition when Crohn’s symptoms, medicines or surgical history affect eating or absorption. Adequate nutrients help prevent malnutrition.", citationIDs: ["depth5_crohn"]),
                AttributedBullet("Discuss vitamins, supplements and complementary therapies before starting them. These products should be reviewed for safety with the treating clinician.", citationIDs: ["depth5_crohn"])
            ])
        ],
        citations: [depth5_crohn, depth5_uc],
        lastSourceFidelityReview: "2026-09-17"
    )
}
