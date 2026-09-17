import Foundation

private let depth6_sickle_daily = CitationSource(
    id: "depth6_sickle_daily",
    shortName: "Living With Sickle Cell Disease",
    detail: "Individual pain plans, access barriers, triggers and routine follow-up; updated August 22, 2024. Drug selection, pregnancy medication advice and pediatric spleen-examination instructions excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/sickle-cell-disease/living-with",
    lastRetrieved: "2026-09-17"
)

private let depth6_sickle_urgent = CitationSource(
    id: "depth6_sickle_urgent",
    shortName: "Sickle Cell Disease: Symptoms",
    detail: "When to seek emergency medical care; updated August 20, 2024. Recognition and escalation only, without treatment orders. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/sickle-cell-disease/symptoms",
    lastRetrieved: "2026-09-17"
)

private let depth6_bleeding_daily = CitationSource(
    id: "depth6_bleeding_daily",
    shortName: "Bleeding Disorders: Living With",
    detail: "Routine care, treatment-response monitoring, activity, procedure preparation, medicine review and reproductive care; updated August 7, 2023. Factor-replacement dosing and pediatric protocols excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/bleeding-disorders/living-with",
    lastRetrieved: "2026-09-17"
)

private let depth6_thal_treatment = CitationSource(
    id: "depth6_thal_treatment",
    shortName: "Thalassemia: Treatment",
    detail: "Variation in transfusion needs, iron-chelation purpose and medicine-specific adverse effects; updated June 1, 2022. Doses, transfusion intervals, treatment selection and cure claims excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/thalassemia/treatment",
    lastRetrieved: "2026-09-17"
)

private let depth6_thal_daily = CitationSource(
    id: "depth6_thal_daily",
    shortName: "Thalassemia: Living With",
    detail: "Iron overload, follow-up testing, splenectomy-related infection risk and care transitions; updated June 1, 2022. Fixed monitoring intervals excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/thalassemia/living-with",
    lastRetrieved: "2026-09-17"
)

public enum SickleCellDailyPlanningSample {
    public static let entry = ReferenceEntry(
        id: "sickle-cell-everyday-care-planning",
        title: "Sickle cell disease: everyday care and pain planning",
        subtitle: "Follow-up, access to care and recognition of urgent symptoms",
        eyebrow: "REFERENCE · SPECIALTY DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Build the plan before pain increases", [
                AttributedBullet("Develop an individual pain action plan with the treating team before a crisis. Clarify how to access the sickle-cell clinic or emergency department when home measures are insufficient.", citationIDs: ["depth6_sickle_daily"]),
                AttributedBullet("Ask about barriers to obtaining medicines and care. Stigma, bias and poor access can delay treatment and contribute to more severe pain and hospitalization.", citationIDs: ["depth6_sickle_daily"])
            ]),
            .bullets(title: "Support everyday routines", [
                AttributedBullet("Review the prescribed medicine plan, routine visits and recommended vaccines. These remain important between pain episodes.", citationIDs: ["depth6_sickle_daily"]),
                AttributedBullet("Avoid dehydration and extreme or abrupt temperature changes. Discuss suitable activity, sleep and stress management with the healthcare team.", citationIDs: ["depth6_sickle_daily"])
            ]),
            .bullets(title: "Identify symptoms needing urgent care", [
                AttributedBullet("Severe pain, chest pain, breathing difficulty or marked fatigue with dizziness or an irregular heartbeat need immediate medical assessment. New one-sided weakness or trouble speaking, seeing or walking requires emergency response.", citationIDs: ["depth6_sickle_urgent"]),
                AttributedBullet("NHLBI identifies fever above 101.3°F (38.5°C) as requiring immediate medical attention. An erection lasting 4 hours or longer is also an emergency; do not wait for a routine appointment.", citationIDs: ["depth6_sickle_urgent"])
            ]),
            .bullets(title: "Include emotional support", [
                AttributedBullet("Discuss depression, anxiety and stress with the healthcare team. Counseling and support from family or friends may help.", citationIDs: ["depth6_sickle_daily"]),
                AttributedBullet("Use follow-up visits to review how the plan works in everyday life. Continued difficulty reaching care or obtaining medicines needs attention.", citationIDs: ["depth6_sickle_daily"])
            ])
        ],
        citations: [depth6_sickle_daily, depth6_sickle_urgent],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum BleedingDisorderPlanningSample {
    public static let entry = ReferenceEntry(
        id: "bleeding-disorder-procedure-planning",
        title: "Bleeding disorders: procedure and daily-care planning",
        subtitle: "Coordinating dental care, medicines, activity and follow-up",
        eyebrow: "REFERENCE · SPECIALTY DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .clottingHemostasis),
        sections: [
            .bullets(title: "Coordinate before a procedure", [
                AttributedBullet("Tell healthcare professionals and dentists about the bleeding disorder. Discuss the emergency plan with the people who may need to help.", citationIDs: ["depth6_bleeding_daily"]),
                AttributedBullet("Before surgery, coordinate with the treating team about bleeding risks and any planned preventive treatment. The approach depends on the specific disorder and procedure.", citationIDs: ["depth6_bleeding_daily"])
            ]),
            .bullets(title: "Review medicines and treatment response", [
                AttributedBullet("Check prescription and over-the-counter medicines with the clinician or pharmacist. Aspirin and some other pain medicines can increase bleeding risk.", citationIDs: ["depth6_bleeding_daily"]),
                AttributedBullet("Report changes in symptoms or a treatment that seems less effective. With factor replacement, antibodies may reduce treatment response and require specialist testing.", citationIDs: ["depth6_bleeding_daily"])
            ]),
            .bullets(title: "Support activity and joint health", [
                AttributedBullet("Discuss ways to remain active while reducing bleeding risk. The safest activities depend on the person’s condition.", citationIDs: ["depth6_bleeding_daily"]),
                AttributedBullet("Repeated joint bleeding can cause lasting pain and damage. The treating team may coordinate physical therapy and an individualized pain plan.", citationIDs: ["depth6_bleeding_daily"])
            ]),
            .bullets(title: "Keep care coordinated", [
                AttributedBullet("Ongoing follow-up matters even without current symptoms. Hemophilia treatment centers also support people with other bleeding disorders.", citationIDs: ["depth6_bleeding_daily"]),
                AttributedBullet("Heavy menstrual bleeding and pregnancy or postpartum bleeding need specific planning. Hemophilia carriers may have bleeding complications even when other symptoms are limited.", citationIDs: ["depth6_bleeding_daily"])
            ])
        ],
        citations: [depth6_bleeding_daily],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ThalassemiaMonitoringSupportSample {
    public static let entry = ReferenceEntry(
        id: "thalassemia-treatment-monitoring-support",
        title: "Thalassemia: treatment and monitoring support",
        subtitle: "Transfusion needs, iron burden and coordinated follow-up",
        eyebrow: "REFERENCE · SPECIALTY DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation),
        sections: [
            .bullets(title: "Clarify the individual treatment plan", [
                AttributedBullet("Treatment needs vary by thalassemia type and severity. Some carriers need no treatment; others need occasional or regular transfusions.", citationIDs: ["depth6_thal_treatment"]),
                AttributedBullet("Regular transfusions can lead to iron overload. Iron chelation removes excess iron; transfusion and chelation have different purposes.", citationIDs: ["depth6_thal_treatment"])
            ]),
            .bullets(title: "Support medicine monitoring", [
                AttributedBullet("Chelation medicines have different adverse effects and monitoring needs. Review concerns about the prescribed product with the treating team.", citationIDs: ["depth6_thal_treatment"]),
                AttributedBullet("Deferiprone can reduce white-cell counts; deferoxamine can affect vision and hearing. These risks require medicine-specific follow-up rather than one generic monitoring plan.", citationIDs: ["depth6_thal_treatment"])
            ]),
            .bullets(title: "Follow the organ-monitoring plan", [
                AttributedBullet("The team may check iron burden, liver and endocrine function, bone health and the heart. Keep the prescribed schedule for blood tests and imaging.", citationIDs: ["depth6_thal_daily"]),
                AttributedBullet("People using deferoxamine need vision and hearing assessments. Iron overload can affect the heart, liver and endocrine system, making continued follow-up important.", citationIDs: ["depth6_thal_daily"])
            ]),
            .bullets(title: "Plan continuing care", [
                AttributedBullet("Review recommended vaccinations, especially after splenectomy, when infection risk is greater. Discuss nutrition needs and supplements with the clinician.", citationIDs: ["depth6_thal_daily"]),
                AttributedBullet("Begin planning the transition from pediatric to adult services before the transfer. Continued access to the treatment and monitoring team is important.", citationIDs: ["depth6_thal_daily"])
            ])
        ],
        citations: [depth6_thal_treatment, depth6_thal_daily],
        lastSourceFidelityReview: "2026-09-17"
    )
}
