import Foundation

private let rh_depth_pleural_types = CitationSource(
    id: "rh_depth_pleural_types", shortName: "NHLBI — Types of pleural disorders",
    detail: "March 24, 2022. Fluid, air, inflammation and causes of pleural effusion. Copyrighted Nucleus illustration and caption excluded. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/pleural-disorders/types", lastRetrieved: "2026-09-17"
)

private let rh_depth_pleural_symptoms = CitationSource(
    id: "rh_depth_pleural_symptoms", shortName: "NHLBI — Pleural disorder symptoms",
    detail: "March 24, 2022. Adult symptoms and variable presentation. Pediatric growth content excluded. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/pleural-disorders/symptoms", lastRetrieved: "2026-09-17"
)

private let rh_depth_pleural_diagnosis = CitationSource(
    id: "rh_depth_pleural_diagnosis", shortName: "NHLBI — Pleural disorder diagnosis",
    detail: "March 24, 2022. Clinical assessment, imaging, thoracentesis and pleural-fluid testing. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/pleural-disorders/diagnosis", lastRetrieved: "2026-09-17"
)

private let rh_depth_pleural_treatment = CitationSource(
    id: "rh_depth_pleural_treatment", shortName: "NHLBI — Pleural disorder treatment",
    detail: "March 24, 2022. Emergency symptoms, cause-specific care, pleural drainage, indwelling catheters and pleurodesis. No medication doses, drain rates or device manipulation steps. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/pleural-disorders/treatment", lastRetrieved: "2026-09-17"
)

private let rh_depth_pleural_recovery = CitationSource(
    id: "rh_depth_pleural_recovery", shortName: "NHLBI — Pleural disorder recovery",
    detail: "March 24, 2022. Follow-up, underlying lung disease and indwelling-catheter review. Pneumothorax-only travel rules are not applied to all effusions. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/pleural-disorders/recovery", lastRetrieved: "2026-09-17"
)

public enum RHDepthPleuralEffusionFollowUpSample {
    public static let entry = ReferenceEntry(
        id: "pleural-effusion-follow-up", title: "Pleural effusion: ongoing nursing assessment",
        subtitle: "Symptoms, cause-focused testing and drainage follow-up", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Distinguish fluid from other pleural problems", [
                AttributedBullet("A pleural effusion is excess fluid between the lung and chest wall. Pleurisy refers to inflammation of the pleural lining, while pneumothorax describes air in that space. These terms should not be used interchangeably.", citationIDs: ["rh_depth_pleural_types"]),
                AttributedBullet("Fluid may accumulate with inflammation, infection, tumors or injury, or with conditions such as heart, kidney or liver failure. Determining the cause guides treatment; the finding of fluid is not a complete diagnosis of the underlying problem.", citationIDs: ["rh_depth_pleural_types"])
            ]),
            .bullets(title: "Follow the symptom pattern", [
                AttributedBullet("Pleural disorders can cause chest pain that worsens with deep breathing or cough, shortness of breath, cough, fever or fatigue. Some people have few symptoms despite an abnormal finding.", citationIDs: ["rh_depth_pleural_symptoms"]),
                AttributedBullet("Ask how symptoms affect breathing and daily activity, and communicate new or changing findings. The absence of dramatic pain does not establish that an effusion has resolved; follow the clinical and imaging plan.", citationIDs: ["rh_depth_pleural_symptoms"])
            ]),
            .bullets(title: "Understand cause-focused investigations", [
                AttributedBullet("Evaluation may include examination, lung imaging and tests directed at suspected causes. Ultrasound can show pleural fluid and help guide sampling, while other imaging can identify associated lung or chest problems.", citationIDs: ["rh_depth_pleural_diagnosis"]),
                AttributedBullet("Thoracentesis can provide fluid for laboratory analysis, including assessment for infection or cancer. Explain the purpose of the ordered tests and the result-review plan rather than inferring the cause from the drainage color alone.", citationIDs: ["rh_depth_pleural_diagnosis"])
            ]),
            .bullets(title: "Connect treatment to the cause", [
                AttributedBullet("Treatment may involve medicines for an underlying condition or a procedure to remove fluid. A chest tube, repeated drainage, an indwelling pleural catheter or pleurodesis may be considered in different circumstances.", citationIDs: ["rh_depth_pleural_treatment"]),
                AttributedBullet("An indwelling pleural catheter allows ongoing drainage, while pleurodesis aims to limit recurrent accumulation by bringing the pleural surfaces together. The team selects the approach; these options do not share one universal nursing drainage schedule.", citationIDs: ["rh_depth_pleural_treatment"])
            ]),
            .bullets(title: "Continue device and follow-up review", [
                AttributedBullet("If an indwelling pleural catheter remains in place, follow the clinical team’s care and review instructions. Infection can develop around the insertion site, and the clinician determines assessment and treatment when a concern arises.", citationIDs: ["rh_depth_pleural_recovery"]),
                AttributedBullet("Follow-up also addresses the underlying disease and whether further imaging is needed. Include the active drain or catheter plan during care transitions so unresolved symptoms and device needs remain visible.", citationIDs: ["rh_depth_pleural_recovery"])
            ]),
            .bullets(title: "Escalate severe respiratory symptoms", [
                AttributedBullet("Severe chest pain or trouble breathing requires emergency assessment. NHLBI advises calling 911 outside a healthcare facility; use the facility’s urgent response pathway when the person is already receiving inpatient care.", citationIDs: ["rh_depth_pleural_treatment"]),
                AttributedBullet("These symptoms can occur with a serious pleural complication and need prompt evaluation. Do not wait for a routine appointment or manipulate an existing drain independently to try to establish the cause.", citationIDs: ["rh_depth_pleural_treatment"])
            ])
        ],
        citations: [rh_depth_pleural_types, rh_depth_pleural_symptoms, rh_depth_pleural_diagnosis, rh_depth_pleural_treatment, rh_depth_pleural_recovery],
        lastSourceFidelityReview: "2026-09-17"
    )
}
