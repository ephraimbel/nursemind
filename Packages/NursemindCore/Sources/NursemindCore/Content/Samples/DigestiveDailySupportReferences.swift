import Foundation

private let depth4_celiac = CitationSource(
    id: "depth4_celiac",
    shortName: "Eating, Diet, & Nutrition for Celiac Disease",
    detail: "Gluten-free diet, labels, cross-contact, oats and balanced nutrition; reviewed October 2020. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/celiac-disease/eating-diet-nutrition",
    lastRetrieved: "2026-09-17"
)

private let depth4_gastro_diet = CitationSource(
    id: "depth4_gastro_diet",
    shortName: "Eating, Diet, & Nutrition for Gastroparesis",
    detail: "Food tolerance, meal pattern, liquids and individualized dietitian support; reviewed January 2018. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/gastroparesis/eating-diet-nutrition",
    lastRetrieved: "2026-09-17"
)

private let depth4_gastro_symptoms = CitationSource(
    id: "depth4_gastro_symptoms",
    shortName: "Symptoms & Causes of Gastroparesis",
    detail: "Symptoms, medication contributors, dehydration, malnutrition and urgent warning signs; reviewed January 2018. Linked drug monographs excluded. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/gastroparesis/symptoms-causes",
    lastRetrieved: "2026-09-17"
)

public enum CeliacNutritionDepthSample {
    public static let entry = ReferenceEntry(
        id: "celiac-disease-food-planning",
        title: "Celiac disease: everyday food planning",
        subtitle: "Gluten avoidance, cross-contact and balanced nutrition",
        eyebrow: "REFERENCE · DIGESTIVE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Establish the diagnosis and plan", [
                AttributedBullet("Before celiac testing, discuss dietary changes with the clinician: starting a gluten-free diet can affect results. Confirmed celiac disease requires lifelong gluten avoidance.", citationIDs: ["depth4_celiac"]),
                AttributedBullet("A dietitian can help maintain adequate nutrients while changing food choices. Gluten-free packaged foods are not automatically nutritionally balanced.", citationIDs: ["depth4_celiac"])
            ]),
            .bullets(title: "Read beyond the front label", [
                AttributedBullet("Gluten occurs in wheat, barley and rye, including wheat varieties such as spelt and semolina. Barley malt is another source.", citationIDs: ["depth4_celiac"]),
                AttributedBullet("Check ingredients in sauces, seasonings and other processed foods. If the label is unclear, contact the manufacturer rather than assume the product is safe.", citationIDs: ["depth4_celiac"])
            ]),
            .bullets(title: "Prevent cross-contact", [
                AttributedBullet("Gluten can transfer during storage, preparation and serving. Keep gluten-free food separate and discuss preparation practices with whoever handles meals.", citationIDs: ["depth4_celiac"]),
                AttributedBullet("For restaurants or gatherings, ask about ingredients and preparation beforehand; bringing suitable food may help when safe choices are uncertain.", citationIDs: ["depth4_celiac"])
            ]),
            .bullets(title: "Keep meals varied", [
                AttributedBullet("Naturally gluten-free choices include rice, potatoes, fruits and vegetables; added ingredients can change whether a prepared dish is suitable.", citationIDs: ["depth4_celiac"]),
                AttributedBullet("Discuss oats with the dietitian. If included, choose oats labeled gluten-free because cross-contact with gluten-containing grains can occur.", citationIDs: ["depth4_celiac"])
            ])
        ],
        citations: [depth4_celiac],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum GastroparesisNutritionDepthSample {
    public static let entry = ReferenceEntry(
        id: "gastroparesis-nutrition-support",
        title: "Gastroparesis: nutrition and symptom support",
        subtitle: "Food tolerance, hydration and changes needing assessment",
        eyebrow: "REFERENCE · DIGESTIVE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Understand the eating difficulty", [
                AttributedBullet("Early fullness, persistent fullness after meals, nausea, vomiting and poor appetite can interfere with intake. Ask how symptoms affect eating and drinking.", citationIDs: ["depth4_gastro_symptoms"]),
                AttributedBullet("Some medicines can slow stomach emptying or worsen similar symptoms. Include prescription and nonprescription medicines in the clinician’s review.", citationIDs: ["depth4_gastro_symptoms"])
            ]),
            .bullets(title: "Adapt meals with the treating team", [
                AttributedBullet("The clinician may recommend smaller meals more often, with less fat and fiber. Soft, well-cooked foods may be easier to tolerate.", citationIDs: ["depth4_gastro_diet"]),
                AttributedBullet("Discuss hard-to-chew foods, carbonated drinks and alcohol with the dietitian; NIDDK identifies these as possible dietary problems in gastroparesis.", citationIDs: ["depth4_gastro_diet"]),
                AttributedBullet("If solids are poorly tolerated, the team may recommend blended foods or liquid nutrition. A dietitian helps preserve adequate calories and nutrients.", citationIDs: ["depth4_gastro_diet"])
            ]),
            .bullets(title: "Maintain an individualized nutrition plan", [
                AttributedBullet("Review fluid and nutritional needs with the clinician or dietitian. Intake advice should fit the person’s symptoms and prescribed diet.", citationIDs: ["depth4_gastro_diet"]),
                AttributedBullet("When diabetes is present, the meal plan also needs to support glucose management. Coordinate changes with the diabetes team.", citationIDs: ["depth4_gastro_diet"])
            ]),
            .bullets(title: "Escalate changes in condition", [
                AttributedBullet("Severe or persistent sharp abdominal pain, blood or coffee-ground material in vomit, prolonged vomiting, fainting or breathing difficulty require immediate medical assessment.", citationIDs: ["depth4_gastro_symptoms"]),
                AttributedBullet("Report reduced urination, marked thirst, dizziness, unintended weight loss or persistent weakness. These may signal dehydration or inadequate nutrition.", citationIDs: ["depth4_gastro_symptoms"])
            ])
        ],
        citations: [depth4_gastro_diet, depth4_gastro_symptoms],
        lastSourceFidelityReview: "2026-09-17"
    )
}
