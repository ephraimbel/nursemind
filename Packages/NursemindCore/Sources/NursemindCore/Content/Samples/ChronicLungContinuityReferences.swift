import Foundation

private let depth6_bronch_clearance = CitationSource(
    id: "depth6_bronch_clearance",
    shortName: "Bronchiectasis: Treatment",
    detail: "Chest physical therapy and airway-clearance techniques; updated October 29, 2023. Drug regimens, antibiotic durations and head-down positioning instructions excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/bronchiectasis/treatment",
    lastRetrieved: "2026-09-17"
)

private let depth6_bronch_symptoms = CitationSource(
    id: "depth6_bronch_symptoms",
    shortName: "Bronchiectasis: Symptoms",
    detail: "Daily symptoms and changes with exacerbations; updated October 27, 2023. Diagnostic time thresholds excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/bronchiectasis/symptoms",
    lastRetrieved: "2026-09-17"
)

private let depth6_bronch_daily = CitationSource(
    id: "depth6_bronch_daily",
    shortName: "Bronchiectasis: Living With",
    detail: "Ongoing care, infection prevention, activity and emotional health; updated October 29, 2023. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/bronchiectasis/living-with",
    lastRetrieved: "2026-09-17"
)

private let depth6_ipf_daily = CitationSource(
    id: "depth6_ipf_daily",
    shortName: "Pulmonary Fibrosis: Living With",
    detail: "Individual progression, follow-up, monitoring, daily activity and emotional support; updated March 24, 2022. No acute-treatment or oxygen-titration protocol. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/idiopathic-pulmonary-fibrosis/living-with",
    lastRetrieved: "2026-09-17"
)

private let depth6_ph_daily = CitationSource(
    id: "depth6_ph_daily",
    shortName: "Pulmonary Hypertension: Living With",
    detail: "Follow-up, monitoring, activity, travel and pregnancy discussions; updated March 24, 2022. No treatment-selection or pregnancy-management algorithm. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/pulmonary-hypertension/living-with",
    lastRetrieved: "2026-09-17"
)

private let depth6_ph_symptoms = CitationSource(
    id: "depth6_ph_symptoms",
    shortName: "Pulmonary Hypertension: Symptoms",
    detail: "Symptom changes and emergency assessment for chest pain with shortness of breath; updated March 24, 2022. Original federal health-education prose adapted and condensed by NurseMind. Images, logos, videos, formatted handouts and linked third-party material excluded.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health; U.S. Department of Health and Human Services",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/pulmonary-hypertension/symptoms",
    lastRetrieved: "2026-09-17"
)

public enum BronchiectasisDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "bronchiectasis-daily-airway-care",
        title: "Bronchiectasis: daily airway care",
        subtitle: "Clearance routines, symptom changes and ongoing support",
        eyebrow: "REFERENCE · SPECIALTY DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Understand the clearance plan", [
                AttributedBullet("Airway clearance helps move retained mucus so it can be coughed out. Options include breathing and coughing techniques, handheld devices, therapy vests and chest physical therapy.", citationIDs: ["depth6_bronch_clearance"]),
                AttributedBullet("A respiratory therapist can teach the prescribed technique. Chest percussion may also be performed by a trained family member; device choice and technique should fit the person.", citationIDs: ["depth6_bronch_clearance"])
            ]),
            .bullets(title: "Notice changes from usual symptoms", [
                AttributedBullet("Establish the usual cough, sputum and activity tolerance. Increased breathlessness or wheeze can accompany a flare-up.", citationIDs: ["depth6_bronch_symptoms"]),
                AttributedBullet("Include fever, chills, chest discomfort, fatigue and blood in sputum in the symptom history; these can occur with bronchiectasis and its complications.", citationIDs: ["depth6_bronch_symptoms"])
            ]),
            .bullets(title: "Support ongoing care", [
                AttributedBullet("Keep contact with the lung-care team and respiratory therapist. Discuss recommended vaccines and hand hygiene to reduce infection risk.", citationIDs: ["depth6_bronch_daily"]),
                AttributedBullet("Discuss safe activity with the clinician. Avoid smoking, secondhand smoke and irritating fumes; physical activity can also help loosen mucus.", citationIDs: ["depth6_bronch_daily"])
            ]),
            .bullets(title: "Include emotional health", [
                AttributedBullet("Ask how chronic cough and breathlessness affect mood and daily life. Anxiety or depression deserves discussion with the healthcare team.", citationIDs: ["depth6_bronch_daily"]),
                AttributedBullet("Counseling, patient groups and support from family or friends may help. Invite the person to identify the help they would find useful.", citationIDs: ["depth6_bronch_daily"])
            ])
        ],
        citations: [depth6_bronch_clearance, depth6_bronch_symptoms, depth6_bronch_daily],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum IPFDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "ipf-daily-care-follow-up",
        title: "Idiopathic pulmonary fibrosis: daily support",
        subtitle: "Monitoring changes and maintaining daily function",
        eyebrow: "REFERENCE · SPECIALTY DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Plan individualized follow-up", [
                AttributedBullet("IPF progression differs between people and cannot be predicted precisely. Agree on follow-up and a plan for recognizing changes with the lung-care team.", citationIDs: ["depth6_ipf_daily"]),
                AttributedBullet("Monitoring may include lung-function tests, liver tests for medicine effects and selected imaging. The treating team determines which tests are needed and when.", citationIDs: ["depth6_ipf_daily"])
            ]),
            .bullets(title: "Recognize worsening", [
                AttributedBullet("A sudden worsening of symptoms over days or weeks needs prompt contact with the clinician. An IPF exacerbation can be life-threatening even without an obvious trigger.", citationIDs: ["depth6_ipf_daily"]),
                AttributedBullet("Oxygen needs may change as disease progresses. Discuss activity and oxygen requirements with the team rather than assuming the earlier plan still fits.", citationIDs: ["depth6_ipf_daily"])
            ]),
            .bullets(title: "Make daily tasks manageable", [
                AttributedBullet("Pulmonary rehabilitation and appropriate physical activity can support strength and function. Ask about oxygen needs during activity.", citationIDs: ["depth6_ipf_daily"]),
                AttributedBullet("Smaller, more frequent meals may relieve stomach fullness that makes breathing harder. Avoid smoke, dust, chemicals and poor air quality.", citationIDs: ["depth6_ipf_daily"])
            ]),
            .bullets(title: "Support quality of life", [
                AttributedBullet("Fear, low mood, anxiety and sleep problems deserve attention. Counseling, support groups and help from family or friends can be part of care.", citationIDs: ["depth6_ipf_daily"]),
                AttributedBullet("Palliative care can help relieve serious symptoms and improve quality of life. Discuss this support with the treating team.", citationIDs: ["depth6_ipf_daily"])
            ])
        ],
        citations: [depth6_ipf_daily],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum PHFollowUpSupportSample {
    public static let entry = ReferenceEntry(
        id: "pulmonary-hypertension-follow-up-support",
        title: "Pulmonary hypertension: follow-up planning",
        subtitle: "Symptoms, activity, travel and coordinated care",
        eyebrow: "REFERENCE · SPECIALTY DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Follow the cause-specific plan", [
                AttributedBullet("Pulmonary-hypertension care depends on the cause and severity. Continue follow-up for associated heart disease, lung disease or sleep apnea.", citationIDs: ["depth6_ph_daily"]),
                AttributedBullet("The team may monitor walking capacity, heart function, lung function and selected blood tests. Clarify the purpose of each planned assessment.", citationIDs: ["depth6_ph_daily"])
            ]),
            .bullets(title: "Report symptom changes", [
                AttributedBullet("Review changes in breathlessness, dizziness, fainting, fatigue or swelling of the abdomen, legs or feet with the treating team.", citationIDs: ["depth6_ph_symptoms"]),
                AttributedBullet("Chest pain with shortness of breath needs emergency medical assessment. NHLBI advises seeking emergency care because these symptoms may reflect a heart attack or pulmonary embolism.", citationIDs: ["depth6_ph_symptoms"])
            ]),
            .bullets(title: "Prepare for activity and travel", [
                AttributedBullet("Ask the clinician which level of activity is appropriate before starting an exercise program. The plan should reflect the person’s condition.", citationIDs: ["depth6_ph_daily"]),
                AttributedBullet("Discuss flights and high-altitude travel with the clinician in advance. The team can advise about avoiding high-altitude exposure.", citationIDs: ["depth6_ph_daily"])
            ]),
            .bullets(title: "Coordinate longer-term needs", [
                AttributedBullet("Pregnancy can carry serious risks. Discuss pregnancy plans with the treating team in advance so counseling and care can be individualized.", citationIDs: ["depth6_ph_daily"]),
                AttributedBullet("Review recommended vaccines and opportunities for education, counseling or patient support groups. Include how symptoms affect everyday activities.", citationIDs: ["depth6_ph_daily"])
            ])
        ],
        citations: [depth6_ph_daily, depth6_ph_symptoms],
        lastSourceFidelityReview: "2026-09-17"
    )
}
