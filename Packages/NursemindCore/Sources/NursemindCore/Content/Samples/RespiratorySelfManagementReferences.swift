import Foundation

private let depth4_asthma_plan = CitationSource(
    id: "depth4_asthma_plan",
    shortName: "Asthma: Treatment and Action Plan",
    detail: "Create an asthma action plan, inhaler technique and symptoms during activity or sleep; updated April 17, 2024. Drug-selection algorithms and reliever-only treatment claims excluded. Source: National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services. Web-page prose adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Heart, Lung, and Blood Institute, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/asthma/treatment-action-plan",
    lastRetrieved: "2026-09-17"
)

private let depth4_asthma_daily = CitationSource(
    id: "depth4_asthma_daily",
    shortName: "Asthma: Managing Asthma",
    detail: "Home monitoring, triggers and physical activity; updated April 17, 2024. Linked handouts and COVID risk statements excluded. Source: National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services. Web-page prose adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Heart, Lung, and Blood Institute, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/asthma/living-with",
    lastRetrieved: "2026-09-17"
)

public enum AsthmaDailyPlanDepthSample {
    public static let entry = ReferenceEntry(
        id: "asthma-action-plan-daily-support",
        title: "Asthma: using the daily action plan",
        subtitle: "Monitoring, triggers and follow-up teaching",
        eyebrow: "REFERENCE · RESPIRATORY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Start with the person’s written plan", [
                AttributedBullet("An asthma action plan is developed with the treating clinician. It specifies medicines, timing, triggers, responses to worsening symptoms and emergency contacts.", citationIDs: ["depth4_asthma_plan"]),
                AttributedBullet("Check that the person knows when the plan calls for contacting the clinician or obtaining emergency care. Review how to use the prescribed inhaler correctly.", citationIDs: ["depth4_asthma_plan"])
            ]),
            .bullets(title: "Make monitoring useful", [
                AttributedBullet("Keep a record of asthma problems and bring it to follow-up. Discuss changes rather than relying only on how the person feels during the visit.", citationIDs: ["depth4_asthma_daily"]),
                AttributedBullet("If peak-flow monitoring is included, practice the technique taught by the clinician and record results. Compare them using the person’s plan.", citationIDs: ["depth4_asthma_daily"])
            ]),
            .bullets(title: "Address relevant exposures", [
                AttributedBullet("Review actual triggers at home and work, such as smoke, mold, animal allergens or air pollution. Plan ways to reduce those exposures.", citationIDs: ["depth4_asthma_daily"]),
                AttributedBullet("Tell the clinician about all medicines taken. Some medicines can worsen breathing in susceptible people with asthma.", citationIDs: ["depth4_asthma_daily"])
            ]),
            .bullets(title: "Review sleep and activity", [
                AttributedBullet("Frequent waking with asthma symptoms or difficulty staying active can indicate poor control. Raise these problems with the treating team.", citationIDs: ["depth4_asthma_plan"]),
                AttributedBullet("Exercise remains part of healthy living. Ask the clinician how to stay active safely rather than stopping activity because symptoms sometimes occur.", citationIDs: ["depth4_asthma_daily"])
            ])
        ],
        citations: [depth4_asthma_plan, depth4_asthma_daily],
        lastSourceFidelityReview: "2026-09-17"
    )
}
