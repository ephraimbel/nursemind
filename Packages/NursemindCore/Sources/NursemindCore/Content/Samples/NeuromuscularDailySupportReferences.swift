import Foundation

private let depth7_pd = CitationSource(
    id: "depth7_pd",
    shortName: "Parkinson’s Disease",
    detail: "Symptoms; lifestyle changes and supportive therapies. Source revision date not stated in retrieved text. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Neurological Disorders and Stroke; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.ninds.nih.gov/current-research/focus-disorders/parkinsons-disease-research/parkinsons-disease-challenges-progress-and-promise",
    lastRetrieved: "2026-09-17"
)

private let depth7_als = CitationSource(
    id: "depth7_als",
    shortName: "Amyotrophic Lateral Sclerosis (ALS)",
    detail: "Publication 25-NS-916, pages 9–10: rehabilitation, communication, nutrition, breathing and caregiver support. Published March 2025. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Neurological Disorders and Stroke; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.ninds.nih.gov/sites/default/files/2025-05/NINDS_ALS_Booklet_Digital-508c.pdf",
    lastRetrieved: "2026-09-17"
)

private let depth7_gbs = CitationSource(
    id: "depth7_gbs",
    shortName: "Guillain-Barré Syndrome",
    detail: "Supportive care; rehabilitation; long-term outlook. Source revision date not stated in retrieved text. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Neurological Disorders and Stroke; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.ninds.nih.gov/health-information/disorders/guillain-barre-syndrome",
    lastRetrieved: "2026-09-17"
)

private let depth7_neuropathy = CitationSource(
    id: "depth7_neuropathy",
    shortName: "Peripheral Neuropathy",
    detail: "Symptoms; diagnosis; supportive treatment and pain management. Source revision date not stated in retrieved text. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Neurological Disorders and Stroke; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.ninds.nih.gov/health-information/disorders/peripheral-neuropathy",
    lastRetrieved: "2026-09-17"
)

public enum ParkinsonDailyFunctionSample {
    public static let entry = ReferenceEntry(
        id: "parkinson-daily-function-support",
        title: "Parkinson disease: daily function support",
        subtitle: "Movement, communication and nonmotor symptoms",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .neurologicalRegulation),
        sections: [
            .bullets(title: "Support movement", [
                AttributedBullet("Slower movement can make washing and dressing take longer. Balance and gait changes increase fall risk.", citationIDs: ["depth7_pd"]),
                AttributedBullet("Physical and occupational therapy can support walking and daily function. Exercise may improve balance, flexibility and strength; a clinician should review new exercise plans.", citationIDs: ["depth7_pd"])
            ]),
            .bullets(title: "Support communication and meals", [
                AttributedBullet("A quiet voice, rapid speech or hesitation can make communication difficult. Speech therapy can support communication.", citationIDs: ["depth7_pd"]),
                AttributedBullet("Chewing and swallowing problems may cause choking, drooling or reduced intake. Speech and swallowing support may be needed.", citationIDs: ["depth7_pd"])
            ]),
            .bullets(title: "Recognize nonmotor symptoms", [
                AttributedBullet("Depression, anxiety, constipation and urinary symptoms are also part of Parkinson disease; care extends beyond tremor.", citationIDs: ["depth7_pd"]),
                AttributedBullet("Blood pressure can fall on standing, causing lightheadedness or fainting. Sleep disruption and daytime sleepiness may also affect daily safety.", citationIDs: ["depth7_pd"])
            ]),
            .bullets(title: "Include nutrition in follow-up", [
                AttributedBullet("Fiber and fluids may help constipation when consistent with the person’s nutrition and fluid plan.", citationIDs: ["depth7_pd"]),
                AttributedBullet("Dietary protein can affect carbidopa-levodopa absorption. Review food and medicine timing with the treating team; this guide gives no protein-restriction regimen.", citationIDs: ["depth7_pd"])
            ])
        ],
        citations: [depth7_pd],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ALSDailyFunctionSample {
    public static let entry = ReferenceEntry(
        id: "als-communication-daily-support",
        title: "ALS: communication and daily support",
        subtitle: "Adaptive care, nutrition and breathing support",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .neurologicalRegulation),
        sections: [
            .bullets(title: "Maintain communication", [
                AttributedBullet("Speech therapy can help preserve communication as speech becomes less clear.", citationIDs: ["depth7_als"]),
                AttributedBullet("Speech-generating devices may use eye tracking. Voice banking records the person’s own voice for possible later use.", citationIDs: ["depth7_als"])
            ]),
            .bullets(title: "Adapt daily activities", [
                AttributedBullet("Physical therapy can support movement, reduce falls and joint discomfort, and maintain independence. Rehabilitation should match individual needs.", citationIDs: ["depth7_als"]),
                AttributedBullet("Occupational therapy can identify feeding, bathing and grooming aids that make self-care easier.", citationIDs: ["depth7_als"])
            ]),
            .bullets(title: "Support nutrition and breathing", [
                AttributedBullet("Dietitians can plan small, nutritious meals when chewing or swallowing becomes difficult. Feeding support requires individualized planning.", citationIDs: ["depth7_als"]),
                AttributedBullet("Breathing-muscle weakness may cause breathlessness during activity, at night or when lying down. Noninvasive ventilation can provide breathing support.", citationIDs: ["depth7_als"])
            ]),
            .bullets(title: "Plan for changing support needs", [
                AttributedBullet("A weakened cough may need assistance to clear secretions. Respiratory support options include prescribed cough-assist devices.", citationIDs: ["depth7_als"]),
                AttributedBullet("Increasing dependence can place substantial demands on caregivers. Home-care services and caregiver support can help sustain care.", citationIDs: ["depth7_als"])
            ])
        ],
        citations: [depth7_als],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum GBSRecoverySupportSample {
    public static let entry = ReferenceEntry(
        id: "guillain-barre-recovery-support",
        title: "Guillain-Barré syndrome: recovery support",
        subtitle: "Rehabilitation, residual symptoms and emotional support",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .neurologicalRegulation),
        sections: [
            .bullets(title: "Keep monitoring needs visible", [
                AttributedBullet("Guillain-Barré syndrome can affect breathing, heart rate and blood pressure. Hospital monitoring helps identify complications as weakness changes.", citationIDs: ["depth7_gbs"]),
                AttributedBullet("Swallowing weakness can cause choking and pneumonia; swallowing support remains relevant during recovery.", citationIDs: ["depth7_gbs"])
            ]),
            .bullets(title: "Rebuild movement", [
                AttributedBullet("Physical rehabilitation helps restore strength and daily function after acute stabilization.", citationIDs: ["depth7_gbs"]),
                AttributedBullet("Therapists may use positioning and limb movement to preserve flexibility. Exercises can target weaker muscles when stronger muscles compensate for them.", citationIDs: ["depth7_gbs"])
            ]),
            .bullets(title: "Adapt home and work tasks", [
                AttributedBullet("Occupational therapy can help a person find new ways to manage everyday activities.", citationIDs: ["depth7_gbs"]),
                AttributedBullet("Vocational therapy and adaptive equipment may help with work demands and persistent functional limitations.", citationIDs: ["depth7_gbs"])
            ]),
            .bullets(title: "Set realistic recovery expectations", [
                AttributedBullet("Recovery varies and may take weeks to years. Some people continue to have weakness, numbness, fatigue or pain.", citationIDs: ["depth7_gbs"]),
                AttributedBullet("Sudden dependence can be emotionally difficult. Counseling and peer support can help people adjust; recovery is not only a strength goal.", citationIDs: ["depth7_gbs"])
            ])
        ],
        citations: [depth7_gbs],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum PeripheralNeuropathyDailySample {
    public static let entry = ReferenceEntry(
        id: "peripheral-neuropathy-daily-support",
        title: "Peripheral neuropathy: daily function and safety",
        subtitle: "Sensory changes, mobility and symptom follow-up",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .neurologicalRegulation),
        sections: [
            .bullets(title: "Describe the pattern", [
                AttributedBullet("Sensory neuropathy can reduce awareness of pain, temperature and limb position. Motor involvement may cause weakness or cramps.", citationIDs: ["depth7_neuropathy"]),
                AttributedBullet("Autonomic involvement can affect sweating, blood pressure and digestion; neuropathy does not always present as painful feet.", citationIDs: ["depth7_neuropathy"])
            ]),
            .bullets(title: "Connect symptoms to daily function", [
                AttributedBullet("Loss of position sense can affect balance, walking and tasks such as fastening buttons.", citationIDs: ["depth7_neuropathy"]),
                AttributedBullet("Appropriate braces or orthopedic footwear can support walking and help prevent foot injuries when motor nerves are affected.", citationIDs: ["depth7_neuropathy"])
            ]),
            .bullets(title: "Support symptom management", [
                AttributedBullet("Nerve pain may worsen at night or occur with light touch, including contact with bedsheets.", citationIDs: ["depth7_neuropathy"]),
                AttributedBullet("Counseling and other behavioral approaches may help with chronic pain and associated anxiety or depression.", citationIDs: ["depth7_neuropathy"])
            ]),
            .bullets(title: "Review contributing factors", [
                AttributedBullet("Evaluation includes medical conditions, medicines, alcohol or toxin exposure, and vitamin deficiencies. Treatment depends on the cause and nerve pattern.", citationIDs: ["depth7_neuropathy"]),
                AttributedBullet("Managing diabetes and other contributing conditions may improve symptoms. Discuss medication changes with the clinician; do not stop treatment independently.", citationIDs: ["depth7_neuropathy"])
            ])
        ],
        citations: [depth7_neuropathy],
        lastSourceFidelityReview: "2026-09-17"
    )
}
