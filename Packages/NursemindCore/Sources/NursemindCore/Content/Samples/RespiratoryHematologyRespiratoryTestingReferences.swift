import Foundation

private let rh_depth_pft = CitationSource(
    id: "rh_depth_pft", shortName: "MedlinePlus — Lung function tests",
    detail: "Medical Tests. Test purpose, preparation, test experience, monitoring and interpretation limits. The source’s erroneous carbon-dioxide wording in the diffusion section is excluded; no predicted-value equations reproduced. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Library of Medicine; NIH", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/lung-function-tests/", lastRetrieved: "2026-09-17"
)

private let rh_depth_lung_tests = CitationSource(
    id: "rh_depth_lung_tests", shortName: "NHLBI — Tests for lung disease",
    detail: "October 4, 2024. Spirometry, lung volumes, diffusion capacity, FeNO and bronchoscopy sections. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/lung-tests", lastRetrieved: "2026-09-17"
)

public enum RHDepthPulmonaryFunctionTestingSupportSample {
    public static let entry = ReferenceEntry(
        id: "pulmonary-function-testing-support", title: "Pulmonary function tests: nursing preparation",
        subtitle: "Spirometry, lung volumes, diffusion and exercise testing", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Identify the question behind the test", [
                AttributedBullet("Pulmonary function tests measure different aspects of breathing: airflow, lung volume and transfer of oxygen into the blood. They may help diagnose or monitor lung disease, assess treatment response or evaluate lung function before surgery.", citationIDs: ["rh_depth_pft"]),
                AttributedBullet("Verify which test is planned. Spirometry, a lung-volume study, diffusion testing and an exercise test involve different maneuvers; one familiar test name should not be used for all of them.", citationIDs: ["rh_depth_pft"])
            ]),
            .bullets(title: "Check preparation and medicine instructions", [
                AttributedBullet("The testing team provides instructions about meals, smoking, alcohol, caffeine and heavy exercise. Comfortable, loose clothing helps the person perform the breathing maneuvers.", citationIDs: ["rh_depth_pft"]),
                AttributedBullet("Some inhaled medicines may need to be paused for a specified interval, depending on the test’s purpose. Confirm the actual instructions with the clinician or laboratory; patients should not independently stop their medicines.", citationIDs: ["rh_depth_pft"])
            ]),
            .bullets(title: "Explain spirometry and repeat measurements", [
                AttributedBullet("During spirometry, the person takes a deep breath and blows forcefully through a mouthpiece connected to a measuring device. The test measures how much air is exhaled and how quickly it leaves the lungs.", citationIDs: ["rh_depth_lung_tests"]),
                AttributedBullet("The team may repeat measurements after an inhaled medicine that opens the airways. This comparison helps assess the response to that medicine; the clinician interprets it with the rest of the evaluation.", citationIDs: ["rh_depth_lung_tests"])
            ]),
            .bullets(title: "Distinguish volume and diffusion studies", [
                AttributedBullet("Lung-volume testing measures how much air the lungs can hold. It may use a clear-walled enclosed booth or a special gas-breathing method, so the experience can differ from simple spirometry.", citationIDs: ["rh_depth_lung_tests"]),
                AttributedBullet("Diffusion-capacity testing evaluates gas transfer from the inhaled air into blood. A blood sample for hemoglobin may also be needed. Explain the requested test without substituting a pulse-oximeter reading for these measurements.", citationIDs: ["rh_depth_lung_tests"])
            ]),
            .bullets(title: "Prepare for exercise-based assessment", [
                AttributedBullet("A six-minute walk test assesses function while the person walks under observation. The team follows heart rate, oxygen levels and symptoms, and may compare breathlessness, fatigue and blood pressure before and after.", citationIDs: ["rh_depth_pft"]),
                AttributedBullet("Cardiopulmonary exercise testing uses a bicycle or treadmill with breathing and cardiovascular monitoring. The team changes the workload and asks about symptoms; serious symptoms are a reason for the testing team to stop the test.", citationIDs: ["rh_depth_pft"])
            ]),
            .bullets(title: "Support comfort and participation", [
                AttributedBullet("Forceful breathing can cause coughing, lightheadedness or fatigue. Some people are anxious about the enclosed booth used for lung-volume testing. Tell the testing team about symptoms or concerns so they can support the examination.", citationIDs: ["rh_depth_pft"]),
                AttributedBullet("A good seal around the mouthpiece is part of the testing technique. MedlinePlus advises wearing dentures for these tests because they can help the lips close around the mouthpiece.", citationIDs: ["rh_depth_pft"])
            ]),
            .bullets(title: "Keep interpretation within the clinical context", [
                AttributedBullet("Results are interpreted using the appropriate reference information and the person’s clinical history. Abnormal testing can suggest airflow obstruction or reduced lung capacity, but does not by itself name the exact disease.", citationIDs: ["rh_depth_pft"]),
                AttributedBullet("Explain what additional review is planned and who will discuss the results. A follow-up visit may connect the findings with symptoms, other investigations and the treatment plan; avoid independently changing inhalers from a single result.", citationIDs: ["rh_depth_pft"])
            ])
        ],
        citations: [rh_depth_pft, rh_depth_lung_tests],
        lastSourceFidelityReview: "2026-09-17"
    )
}
