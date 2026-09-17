import Foundation

private let rehab_dysphagia = CitationSource(
    id: "rehab_dysphagia", shortName: "NIDCD — Dysphagia",
    detail: "NIH Publication No. 13-4307, reprinted 2013. Federal explanatory prose paraphrased and condensed by NurseMind; diagrams excluded. Used for swallowing mechanisms and individualized rehabilitation, not treatment protocols.",
    publisher: "National Institute on Deafness and Other Communication Disorders", license: .publicDomain,
    url: "https://www.nidcd.nih.gov/sites/default/files/Documents/health/voice/NIDCD-Dysphagia.pdf", lastRetrieved: "2026-09-17"
)

private let rehab_swallow_tests = CitationSource(
    id: "rehab_swallow_tests", shortName: "MedlinePlus — Dysphagia tests",
    detail: "NLM-authored medical-test information paraphrased and condensed by NurseMind. Linked third-party sources excluded.",
    publisher: "National Library of Medicine", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/dysphagia-tests/", lastRetrieved: "2026-09-17"
)

private let rehab_stroke_practice = CitationSource(
    id: "rehab_stroke_practice", shortName: "NINDS — Stroke recovery and rehabilitation",
    detail: "Federal rehabilitation text paraphrased and condensed by NurseMind. American Stroke Association-attributed introductory material, third-party resources and images excluded.",
    publisher: "National Institute of Neurological Disorders and Stroke", license: .publicDomain,
    url: "https://www.ninds.nih.gov/health-information/stroke/recovery", lastRetrieved: "2026-09-17"
)

private let rehab_stroke_daily = CitationSource(
    id: "rehab_stroke_daily", shortName: "NHLBI — Recovery after stroke",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Heart, Lung, and Blood Institute", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/stroke/recovery", lastRetrieved: "2026-09-17"
)

public enum DysphagiaMealtimeSupportSample {
    public static let entry = ReferenceEntry(
        id: "dysphagia-mealtime-support", title: "Dysphagia assessment and mealtime support",
        subtitle: "Swallowing concerns, testing and the individual feeding plan", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Understand the concern", [
                AttributedBullet("Dysphagia can affect movement of food through the mouth, throat or esophagus. It may limit nutrition and hydration. Material entering the airway can contribute to aspiration pneumonia, and coughing does not always clear it.", citationIDs: ["rehab_dysphagia"])
            ]),
            .bullets(title: "Gather a focused history", [
                AttributedBullet("Ask what is difficult to swallow, when the problem occurs and how long it has been present. Describe problems with food, fluids or saliva and share them with the evaluating clinician.", citationIDs: ["rehab_swallow_tests"])
            ]),
            .bullets(title: "Separate screening from diagnosis", [
                AttributedBullet("A bedside swallow screen identifies risk and may lead to further testing. It does not establish the cause of dysphagia. Screening may itself involve aspiration risk, so it should follow the trained clinical pathway.", citationIDs: ["rehab_swallow_tests"]),
                AttributedBullet("A videofluoroscopic swallow study uses barium and moving X-ray images. FEES uses an endoscope to view swallowing through the nose and throat. The team selects the test according to the clinical question.", citationIDs: ["rehab_swallow_tests"])
            ]),
            .bullets(title: "Use the individual swallowing plan", [
                AttributedBullet("Speech-language pathology assessment may guide food texture, bite size, posture and swallowing strategies. These choices depend on the swallowing problem; a chin-tuck maneuver or thickened fluids is not a universal instruction for every patient.", citationIDs: ["rehab_dysphagia"]),
                AttributedBullet("Some patients benefit from exercises or changes in how food is prepared. If oral intake cannot safely meet needs, the team may consider other nutritional support. Do not treat a feeding technique as proof that swallowing has normalized.", citationIDs: ["rehab_dysphagia"])
            ]),
            .bullets(title: "Prepare for testing and follow-up", [
                AttributedBullet("Check the specific preparation instructions and tell the team about medicines. Patients should not stop medicines independently. Questions about fasting or other preparation must be resolved for the actual test being performed.", citationIDs: ["rehab_swallow_tests"]),
                AttributedBullet("Review continuing difficulty taking enough food and fluids with the team. Swallowing support should address nutritional adequacy as well as the mechanics of an individual swallow.", citationIDs: ["rehab_dysphagia"])
            ])
        ],
        citations: [rehab_dysphagia, rehab_swallow_tests],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum StrokeRecoveryDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "stroke-recovery-daily-support", title: "Stroke recovery and daily nursing support",
        subtitle: "Function, communication, continence, swallowing and adjustment", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility),
        sections: [
            .bullets(title: "Set functional goals", [
                AttributedBullet("Rehabilitation helps people relearn skills and develop ways to work around persistent disability. Repeated, directed practice can support recovery. Goals should connect the rehabilitation plan to activities such as dressing, eating and moving around.", citationIDs: ["rehab_stroke_practice"])
            ]),
            .bullets(title: "Coordinate the rehabilitation team", [
                AttributedBullet("Rehabilitation nurses, physical and occupational therapists, speech-language pathologists, clinicians and psychosocial professionals contribute different skills. Care may continue in an inpatient program, skilled nursing setting, outpatient service or at home.", citationIDs: ["rehab_stroke_practice"]),
                AttributedBullet("Review weakness, balance and ability to manage everyday tasks with physical and occupational therapy. Assistive devices, adapted utensils or home modifications may help; the support needed differs between patients.", citationIDs: ["rehab_stroke_daily"])
            ]),
            .bullets(title: "Include communication and swallowing", [
                AttributedBullet("Language or memory changes can make it difficult to express needs or follow a routine. Speech-language therapy can support communication. Swallowing difficulty also needs assessment and a specific eating plan.", citationIDs: ["rehab_stroke_daily"])
            ]),
            .bullets(title: "Ask about less visible difficulties", [
                AttributedBullet("Bladder and bowel control may change after stroke. Mood, behavior and judgment may also change, and recovery can feel slow or frustrating. Discuss these concerns with the team rather than focusing only on walking ability.", citationIDs: ["rehab_stroke_daily"])
            ]),
            .bullets(title: "Plan the next care setting", [
                AttributedBullet("The care setting should support the person’s rehabilitation and daily needs. Practice can include learning a new approach to a familiar task, such as using one hand, and using communication aids when needed.", citationIDs: ["rehab_stroke_practice"]),
                AttributedBullet("Regular follow-up supports recovery and prevention of another event. New stroke symptoms require emergency assessment. Medication changes and the prevention plan depend on the cause of the original stroke and the treating team.", citationIDs: ["rehab_stroke_daily"])
            ])
        ],
        citations: [rehab_stroke_practice, rehab_stroke_daily],
        lastSourceFidelityReview: "2026-09-17"
    )
}
