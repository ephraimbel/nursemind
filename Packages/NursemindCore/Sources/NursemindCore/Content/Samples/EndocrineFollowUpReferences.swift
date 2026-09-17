import Foundation

private let depth7_adrenal_treatment = CitationSource(
    id: "depth7_adrenal_treatment",
    shortName: "Treatment for Adrenal Insufficiency & Addison’s Disease",
    detail: "Treatment during illness, surgery and injury; pregnancy dose claims excluded. Source reviewed September 2018. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/endocrine-diseases/adrenal-insufficiency-addisons-disease/treatment",
    lastRetrieved: "2026-09-17"
)

private let depth7_adrenal_facts = CitationSource(
    id: "depth7_adrenal_facts",
    shortName: "Definition & Facts of Adrenal Insufficiency & Addison’s Disease",
    detail: "Adrenal crisis recognition; medical identification; emergency preparation. Source reviewed September 2018. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/endocrine-diseases/adrenal-insufficiency-addisons-disease/definition-facts",
    lastRetrieved: "2026-09-17"
)

private let depth7_thyroid = CitationSource(
    id: "depth7_thyroid",
    shortName: "Hypothyroidism (Underactive Thyroid)",
    detail: "Symptoms; treatment follow-up; nutrition and pregnancy contact. Source reviewed March 2021. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/endocrine-diseases/hypothyroidism",
    lastRetrieved: "2026-09-17"
)

public enum AdrenalIllnessPreparationSample {
    public static let entry = ReferenceEntry(
        id: "adrenal-insufficiency-illness-preparation",
        title: "Adrenal insufficiency: illness preparation",
        subtitle: "Emergency recognition and an individualized care plan",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes),
        sections: [
            .bullets(title: "Recognize urgent illness", [
                AttributedBullet("Severe infection or diarrhea, or vomiting that prevents retention of corticosteroid tablets, requires immediate medical attention. These situations can lead to adrenal crisis.", citationIDs: ["depth7_adrenal_treatment"]),
                AttributedBullet("Illness, injury and surgery can change steroid requirements. The clinician supplies the individual adjustment plan; this guide does not provide a dose multiplier.", citationIDs: ["depth7_adrenal_treatment"])
            ]),
            .bullets(title: "Know crisis warning signs", [
                AttributedBullet("Sudden severe back, abdominal or leg pain, vomiting, diarrhea, marked weakness, confusion or loss of consciousness may signal adrenal crisis. Emergency assessment is needed.", citationIDs: ["depth7_adrenal_facts"]),
                AttributedBullet("Adrenal crisis can be life-threatening. Emergency medication preparation complements urgent medical care; it does not replace assessment.", citationIDs: ["depth7_adrenal_facts"])
            ]),
            .bullets(title: "Prepare emergency identification", [
                AttributedBullet("Medical-alert identification or an emergency card can communicate adrenal insufficiency when the person cannot explain it.", citationIDs: ["depth7_adrenal_facts"]),
                AttributedBullet("NIDDK advises carrying prescribed emergency corticosteroid injection supplies and ensuring family or friends know when and how to use them.", citationIDs: ["depth7_adrenal_facts"])
            ]),
            .bullets(title: "Prepare for procedures and recovery", [
                AttributedBullet("Surgery under general anesthesia may require intravenous hormone replacement until oral treatment is possible. Discuss the plan with the treating team before surgery.", citationIDs: ["depth7_adrenal_treatment"]),
                AttributedBullet("The clinician adjusts treatment back toward the usual regimen as illness or injury resolves. Recovery instructions are part of the plan.", citationIDs: ["depth7_adrenal_treatment"])
            ])
        ],
        citations: [depth7_adrenal_treatment, depth7_adrenal_facts],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HypothyroidFollowUpSample {
    public static let entry = ReferenceEntry(
        id: "hypothyroidism-treatment-follow-up",
        title: "Hypothyroidism: treatment follow-up",
        subtitle: "Medicine continuity, monitoring and nutrition questions",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation),
        sections: [
            .bullets(title: "Keep symptoms in context", [
                AttributedBullet("Fatigue, cold intolerance and weight changes can occur with hypothyroidism, but symptoms alone do not establish the diagnosis.", citationIDs: ["depth7_thyroid"]),
                AttributedBullet("Blood tests and clinical assessment help evaluate thyroid function and the cause of symptoms.", citationIDs: ["depth7_thyroid"])
            ]),
            .bullets(title: "Support medicine continuity", [
                AttributedBullet("Thyroid hormone replacement controls hypothyroidism when taken as prescribed. Do not stop it without discussing the plan with the clinician.", citationIDs: ["depth7_thyroid"]),
                AttributedBullet("Excess thyroid replacement can cause harm, including atrial fibrillation or bone loss; symptom changes do not justify unsupervised dose changes.", citationIDs: ["depth7_thyroid"])
            ]),
            .bullets(title: "Keep monitoring on the plan", [
                AttributedBullet("Blood testing follows treatment initiation and dose changes. The clinician uses results to adjust therapy and arrange ongoing checks.", citationIDs: ["depth7_thyroid"]),
                AttributedBullet("Notify the clinician promptly if pregnancy occurs because thyroid replacement needs may change.", citationIDs: ["depth7_thyroid"])
            ]),
            .bullets(title: "Review iodine exposure", [
                AttributedBullet("Excess iodine, including iodine supplements or large amounts of seaweed, can worsen some autoimmune thyroid disorders.", citationIDs: ["depth7_thyroid"]),
                AttributedBullet("Discuss supplements and iodine-containing cough medicines with the care team. Pregnancy-related iodine needs require individualized advice.", citationIDs: ["depth7_thyroid"])
            ])
        ],
        citations: [depth7_thyroid],
        lastSourceFidelityReview: "2026-09-17"
    )
}
