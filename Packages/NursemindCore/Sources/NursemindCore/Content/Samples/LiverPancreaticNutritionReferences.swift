import Foundation

private let depth7_cirrhosis_nutrition = CitationSource(
    id: "depth7_cirrhosis_nutrition",
    shortName: "Eating, Diet, & Nutrition for Cirrhosis",
    detail: "Malnutrition; meal planning; food safety. Source reviewed June 2023. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/liver-disease/cirrhosis/eating-diet-nutrition",
    lastRetrieved: "2026-09-17"
)

private let depth7_epi_symptoms = CitationSource(
    id: "depth7_epi_symptoms",
    shortName: "Symptoms & Causes for Exocrine Pancreatic Insufficiency",
    detail: "Symptoms and associated conditions. Source reviewed January 2023. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/exocrine-pancreatic-insufficiency/symptoms-causes",
    lastRetrieved: "2026-09-17"
)

private let depth7_epi_treatment = CitationSource(
    id: "depth7_epi_treatment",
    shortName: "Treatment for Exocrine Pancreatic Insufficiency",
    detail: "Pancreatic enzymes; nutritional complications. Source reviewed January 2023. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/exocrine-pancreatic-insufficiency/treatment",
    lastRetrieved: "2026-09-17"
)

private let depth7_epi_nutrition = CitationSource(
    id: "depth7_epi_nutrition",
    shortName: "Eating, Diet, & Nutrition for Exocrine Pancreatic Insufficiency",
    detail: "Malabsorption; individualized nutrition. Source reviewed January 2023. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/exocrine-pancreatic-insufficiency/eating-diet-nutrition",
    lastRetrieved: "2026-09-17"
)

public enum CirrhosisNutritionDailySample {
    public static let entry = ReferenceEntry(
        id: "cirrhosis-nutrition-daily-support",
        title: "Cirrhosis: nutrition and daily food planning",
        subtitle: "Meal patterns, protein needs and food safety",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Recognize nutrition risk", [
                AttributedBullet("Cirrhosis can impair digestion and nutrient absorption. Nausea or vomiting may further reduce food intake.", citationIDs: ["depth7_cirrhosis_nutrition"]),
                AttributedBullet("Dietitian support can help match calories, protein and other nutrients to disease severity and individual needs.", citationIDs: ["depth7_cirrhosis_nutrition"])
            ]),
            .bullets(title: "Limit long fasting periods", [
                AttributedBullet("Cirrhosis changes how the body stores and uses energy. Long periods without food can be a concern.", citationIDs: ["depth7_cirrhosis_nutrition"]),
                AttributedBullet("The care team may recommend smaller, frequent meals and a bedtime snack or early breakfast.", citationIDs: ["depth7_cirrhosis_nutrition"])
            ]),
            .bullets(title: "Use individual dietary instructions", [
                AttributedBullet("Sodium limits may be recommended. Use the person’s prescribed plan instead of applying one limit to everyone.", citationIDs: ["depth7_cirrhosis_nutrition"]),
                AttributedBullet("Review vitamins, herbs and other supplements with the clinician; supplementation depends on identified needs.", citationIDs: ["depth7_cirrhosis_nutrition"])
            ]),
            .bullets(title: "Address food and alcohol safety", [
                AttributedBullet("Raw or undercooked seafood and meat, and unpasteurized dairy products, can cause severe infections in people with cirrhosis.", citationIDs: ["depth7_cirrhosis_nutrition"]),
                AttributedBullet("Alcohol can cause additional liver damage. NIDDK advises complete avoidance of alcohol in cirrhosis.", citationIDs: ["depth7_cirrhosis_nutrition"])
            ])
        ],
        citations: [depth7_cirrhosis_nutrition],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum PancreaticInsufficiencyDailySample {
    public static let entry = ReferenceEntry(
        id: "pancreatic-insufficiency-nutrition-support",
        title: "Pancreatic insufficiency: nutrition support",
        subtitle: "Malabsorption, enzyme timing and follow-up",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Recognize possible malabsorption", [
                AttributedBullet("Exocrine pancreatic insufficiency can cause loose, greasy, foul-smelling stools, bloating, abdominal discomfort and weight loss.", citationIDs: ["depth7_epi_symptoms"]),
                AttributedBullet("It can occur with pancreatitis, cystic fibrosis, pancreatic cancer or pancreatic and upper gastrointestinal surgery.", citationIDs: ["depth7_epi_symptoms"])
            ]),
            .bullets(title: "Connect enzymes with eating", [
                AttributedBullet("Prescribed pancreatic enzyme replacement therapy helps digest food and improve nutrient absorption.", citationIDs: ["depth7_epi_treatment"]),
                AttributedBullet("NIDDK describes taking prescribed enzymes during meals and snacks. Follow the individual product and clinician instructions; this guide does not set doses.", citationIDs: ["depth7_epi_treatment"])
            ]),
            .bullets(title: "Build the nutrition plan", [
                AttributedBullet("A dietitian may recommend smaller, more frequent meals and other changes based on the underlying condition.", citationIDs: ["depth7_epi_nutrition"]),
                AttributedBullet("Alcohol avoidance and smoking cessation may be part of treatment. Food changes should address nutritional needs as well as symptoms.", citationIDs: ["depth7_epi_nutrition"])
            ]),
            .bullets(title: "Review longer-term complications", [
                AttributedBullet("Follow-up may assess malnutrition, low levels of vitamins A, D, E and K, and reduced bone mass.", citationIDs: ["depth7_epi_treatment"]),
                AttributedBullet("Vitamin or other nutrient supplements may be recommended for identified deficits. Discuss supplements with the clinician before starting them.", citationIDs: ["depth7_epi_treatment"])
            ])
        ],
        citations: [depth7_epi_symptoms, depth7_epi_treatment, depth7_epi_nutrition],
        lastSourceFidelityReview: "2026-09-17"
    )
}
