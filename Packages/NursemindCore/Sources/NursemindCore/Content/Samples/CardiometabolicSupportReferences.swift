import Foundation

private let depth4_cardiac = CitationSource(
    id: "depth4_cardiac",
    shortName: "Heart Attack: Recovery",
    detail: "Cardiac rehabilitation, emotional health and returning to activities; updated March 24, 2022. Source: National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services. Web-page prose adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Heart, Lung, and Blood Institute, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/heart-attack/recovery",
    lastRetrieved: "2026-09-17"
)

private let depth4_bp = CitationSource(
    id: "depth4_bp",
    shortName: "Measuring Your Blood Pressure",
    detail: "Preparation, positioning and self-measured blood pressure; May 12, 2026. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/high-blood-pressure/measure/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth4_cgm = CitationSource(
    id: "depth4_cgm",
    shortName: "Continuous Glucose Monitoring",
    detail: "Sensor function, device differences, limitations and training; reviewed June 2023. Product age limits, sensor lifetimes, pricing and insurance rules excluded. Original federal health-education text adapted and condensed by NurseMind. Images, videos, formatted handouts, linked third-party material and source tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/diabetes/overview/managing-diabetes/continuous-glucose-monitoring",
    lastRetrieved: "2026-09-17"
)

public enum CardiacRehabilitationDepthSample {
    public static let entry = ReferenceEntry(
        id: "cardiac-rehabilitation-recovery",
        title: "Cardiac rehabilitation after a heart attack",
        subtitle: "Exercise, confidence and return to daily life",
        eyebrow: "REFERENCE · HEART & DIABETES CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Explain the purpose", [
                AttributedBullet("Cardiac rehabilitation combines supervised exercise, heart-health education and counseling for stress. Ask the treating team how to enter a suitable program.", citationIDs: ["depth4_cardiac"]),
                AttributedBullet("The rehabilitation team tailors activity to the person’s condition. The setting and duration vary; participation involves more than an exercise handout.", citationIDs: ["depth4_cardiac"])
            ]),
            .bullets(title: "Plan daily activities", [
                AttributedBullet("Clarify when walking, driving, work and sexual activity can resume. Recovery timing depends on the person’s condition and the clinician’s assessment.", citationIDs: ["depth4_cardiac"]),
                AttributedBullet("Continue prescribed medicines and follow-up. Discuss problems completing rehabilitation with the team so the plan can be reconsidered.", citationIDs: ["depth4_cardiac"])
            ]),
            .bullets(title: "Address emotional recovery", [
                AttributedBullet("Fear, anxiety or depression can follow a heart attack. Ask how the person is coping and connect persistent concerns with clinical support.", citationIDs: ["depth4_cardiac"]),
                AttributedBullet("Counseling, support groups and family involvement can support recovery. Include emotional health in follow-up conversations.", citationIDs: ["depth4_cardiac"])
            ]),
            .bullets(title: "Recognize renewed symptoms", [
                AttributedBullet("Another heart attack may feel different from the first. In the community, suspected heart-attack symptoms require calling 911 immediately.", citationIDs: ["depth4_cardiac"]),
                AttributedBullet("Supervised exercise still carries risks, including injury or rhythm problems. Discuss safe activity progression with rehabilitation staff.", citationIDs: ["depth4_cardiac"])
            ])
        ],
        citations: [depth4_cardiac],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HomeBloodPressureDepthSample {
    public static let entry = ReferenceEntry(
        id: "home-blood-pressure-measurement",
        title: "Home blood-pressure measurement",
        subtitle: "Preparation, positioning and a useful measurement log",
        eyebrow: "REFERENCE · HEART & DIABETES CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Prepare for a representative reading", [
                AttributedBullet("Blood pressure often rises without symptoms. Home readings can support care when the person shares them with the healthcare team.", citationIDs: ["depth4_bp"]),
                AttributedBullet("Avoid food or drink for 30 minutes beforehand. Recent caffeine, alcohol, smoking or exercise can affect readings; empty the bladder before measuring.", citationIDs: ["depth4_bp"])
            ]),
            .bullets(title: "Position the person and cuff", [
                AttributedBullet("Rest seated for at least five minutes, with back supported, feet flat and legs uncrossed. Talking during measurement can affect the result.", citationIDs: ["depth4_bp"]),
                AttributedBullet("Support the arm on a table at chest height. Place the cuff snugly against bare skin, rather than over clothing.", citationIDs: ["depth4_bp"])
            ]),
            .bullets(title: "Use a consistent routine", [
                AttributedBullet("Measure at the same time each day when home monitoring is part of the care plan. Confirm the schedule with the healthcare team.", citationIDs: ["depth4_bp"]),
                AttributedBullet("Obtain at least two readings, separated by one to two minutes. Record the readings so the team can review the pattern.", citationIDs: ["depth4_bp"])
            ]),
            .bullets(title: "Connect the log with care", [
                AttributedBullet("Bring the measurement record to appointments. Self-measurement is most useful when paired with support from a healthcare professional.", citationIDs: ["depth4_bp"]),
                AttributedBullet("Review how measurements were taken if readings seem inconsistent: posture, talking, recent activity and a full bladder can change results.", citationIDs: ["depth4_bp"])
            ])
        ],
        citations: [depth4_bp],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CGMEducationDepthSample {
    public static let entry = ReferenceEntry(
        id: "continuous-glucose-monitor-teaching",
        title: "Continuous glucose monitors: everyday use",
        subtitle: "Sensor readings, alerts and device-specific teaching",
        eyebrow: "REFERENCE · HEART & DIABETES CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .glucoseRegulation),
        sections: [
            .bullets(title: "Explain what is measured", [
                AttributedBullet("A CGM estimates glucose in fluid between cells and sends readings to a receiver or compatible phone. Trends help show changes over time.", citationIDs: ["depth4_cgm"]),
                AttributedBullet("Systems differ in how readings are displayed or retrieved. Match teaching to the person’s actual device rather than assuming every CGM works identically.", citationIDs: ["depth4_cgm"])
            ]),
            .bullets(title: "Practice essential device tasks", [
                AttributedBullet("Arrange training on sensor placement, replacement and receiver or phone use. Follow that device’s instructions for any calibration requirements.", citationIDs: ["depth4_cgm"]),
                AttributedBullet("Review the meaning of configured alerts with the diabetes team. Some devices can share readings with an agreed care partner.", citationIDs: ["depth4_cgm"])
            ]),
            .bullets(title: "Keep a backup measurement plan", [
                AttributedBullet("A finger-stick measurement may be needed when accuracy is uncertain or an alert requires confirmation. Keep a glucose meter available.", citationIDs: ["depth4_cgm"]),
                AttributedBullet("Review readings and trends with the treating team to guide the individual diabetes plan. CGM teaching alone does not establish medicine doses.", citationIDs: ["depth4_cgm"])
            ]),
            .bullets(title: "Resolve barriers to continued use", [
                AttributedBullet("Sensor adhesive can irritate skin. Report irritation and difficulties using the equipment to the healthcare team.", citationIDs: ["depth4_cgm"]),
                AttributedBullet("Discuss supply costs, training and replacement needs before starting. Support may be needed to use and maintain the system consistently.", citationIDs: ["depth4_cgm"])
            ])
        ],
        citations: [depth4_cgm],
        lastSourceFidelityReview: "2026-09-17"
    )
}
