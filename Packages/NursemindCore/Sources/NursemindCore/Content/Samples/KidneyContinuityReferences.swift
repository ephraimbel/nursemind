import Foundation

private let depth3_medicines = CitationSource(
    id: "depth3_medicines",
    shortName: "Keeping Kidneys Safe: Smart Choices about Medicines",
    detail: "Pharmacist review, NSAIDs, dehydration and individualized illness planning; reviewed June 2018. Original federal health-education text adapted and condensed by NurseMind. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/kidney-disease/keeping-kidneys-safe",
    lastRetrieved: "2026-09-17"
)

private let depth3_transplant = CitationSource(
    id: "depth3_transplant",
    shortName: "Kidney Transplant",
    detail: "Transplant team, discharge medicines, follow-up blood tests, rejection and infection symptoms, side effects and nutrition; reviewed January 2018. Historical insurance rules and numerical thresholds excluded. Original federal health-education text adapted and condensed by NurseMind. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/kidney-disease/kidney-failure/kidney-transplant",
    lastRetrieved: "2026-09-17"
)

public enum KidneyMedicationContinuitySample {
    public static let entry = ReferenceEntry(
        id: "kidney-medication-safety",
        title: "Kidney care: medication safety",
        subtitle: "OTC products, NSAIDs and an individualized illness plan",
        eyebrow: "REFERENCE · KIDNEY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety),
        sections: [
            .bullets(title: "Make the medicine review complete", [
                AttributedBullet("Include prescriptions, over-the-counter products, vitamins and herbal supplements when reviewing medicines with a person at risk for kidney injury. A pharmacist can check the combined list for kidney-related concerns and interactions.", citationIDs: ["depth3_medicines"]),
                AttributedBullet("Encourage the person to bring a current list or the actual containers to visits. Using one pharmacy or a connected pharmacy system can help the pharmacist see the complete regimen.", citationIDs: ["depth3_medicines"])
            ]),
            .bullets(title: "Recognize hidden NSAIDs", [
                AttributedBullet("Nonsteroidal anti-inflammatory drugs, including ibuprofen and naproxen, may harm kidneys with prolonged use and can contribute to acute kidney injury during dehydration or low blood pressure.", citationIDs: ["depth3_medicines"]),
                AttributedBullet("NSAIDs may be included in combination cold or pain products. Check active ingredients rather than relying on a product’s brand name, and ask a clinician or pharmacist which pain or fever options are appropriate.", citationIDs: ["depth3_medicines"])
            ]),
            .bullets(title: "Plan for illness before it occurs", [
                AttributedBullet("Vomiting, diarrhea, fever or reduced fluid intake can lead to dehydration. Discuss in advance what the person should do if illness or poor intake occurs while taking medicines that affect the kidneys.", citationIDs: ["depth3_medicines"]),
                AttributedBullet("The individual illness plan should identify which medicines, if any, to pause, when to contact the clinician and when to restart. Avoid giving a universal medication-hold list.", citationIDs: ["depth3_medicines"]),
                AttributedBullet("Blood-pressure medicines such as ACE inhibitors or ARBs can protect kidneys in the prescribed setting. A dehydration concern is a reason to obtain individualized advice, not to permanently stop a beneficial treatment.", citationIDs: ["depth3_medicines"])
            ]),
            .bullets(title: "Connect teaching to the follow-up plan", [
                AttributedBullet("Encourage questions when buying an OTC medicine or supplement and before making illness-related changes. Clarify how and when each medicine should be taken, including the agreed restart instructions.", citationIDs: ["depth3_medicines"])
            ])
        ],
        citations: [depth3_medicines],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum KidneyTransplantContinuitySample {
    public static let entry = ReferenceEntry(
        id: "kidney-transplant-follow-up",
        title: "Kidney transplant: ongoing care",
        subtitle: "Medicines, surveillance, infection concerns and practical support",
        eyebrow: "REFERENCE · KIDNEY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        sections: [
            .bullets(title: "Explain why follow-up continues", [
                AttributedBullet("A transplant treats kidney failure but requires ongoing care. Anti-rejection medicines help prevent the immune system from attacking the donated kidney, and regular follow-up remains necessary even when the person feels well.", citationIDs: ["depth3_transplant"]),
                AttributedBullet("The transplant coordinator is a key contact for appointments and teaching. Pharmacy, dietetics and social work also help address the daily demands of transplant care.", citationIDs: ["depth3_transplant"])
            ]),
            .bullets(title: "Make the medication routine workable", [
                AttributedBullet("Before discharge, check that the person understands the purpose and timing of each prescribed medicine. Anti-rejection medicines are taken every day; other medicines may be prescribed to reduce infection risk.", citationIDs: ["depth3_transplant"]),
                AttributedBullet("Discuss side effects, access to prescriptions and difficulty following the schedule with the transplant team. The pharmacist can help prevent unsafe medicine combinations, and the social worker can help identify assistance when cost is a barrier.", citationIDs: ["depth3_transplant"])
            ]),
            .bullets(title: "Use tests as well as symptoms", [
                AttributedBullet("Arrange the planned blood tests and follow-up visits. Rejection can begin before symptoms are felt, and blood tests help the team identify changes in kidney function.", citationIDs: ["depth3_transplant"]),
                AttributedBullet("New swelling or higher blood pressure may reflect a problem that needs review. The transplant clinician determines whether additional assessment, a biopsy or medicine changes are needed.", citationIDs: ["depth3_transplant"]),
                AttributedBullet("Surveillance may include blood levels of anti-rejection medicines and kidney and liver function. Long-term treatment can also affect blood pressure, glucose and bone health; report concerns instead of changing the regimen independently.", citationIDs: ["depth3_transplant"])
            ]),
            .bullets(title: "Recognize infection and reassess daily needs", [
                AttributedBullet("Immunosuppression raises infection risk and can mute usual symptoms. Contact the transplant center promptly for feeling unwell, fever, wound drainage, burning with urination or a persistent cough, using the center’s instructions.", citationIDs: ["depth3_transplant"]),
                AttributedBullet("Dietary needs may differ from the pre-transplant dialysis plan. A dietitian can adjust food choices as medicines, laboratory results, weight and blood pressure change.", citationIDs: ["depth3_transplant"])
            ])
        ],
        citations: [depth3_transplant],
        lastSourceFidelityReview: "2026-09-17"
    )
}
