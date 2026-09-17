import Foundation

private let rh_depth_bronchoscopy = CitationSource(
    id: "rh_depth_bronchoscopy", shortName: "MedlinePlus — Bronchoscopy and BAL",
    detail: "Medical Tests, August 27, 2024. Preparation, sedation, airway numbness, lavage, risks and results. Public-domain NLM body text only. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Library of Medicine; NIH", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/bronchoscopy-and-bronchoalveolar-lavage-bal/", lastRetrieved: "2026-09-17"
)

private let rh_depth_lung_treatments = CitationSource(
    id: "rh_depth_lung_treatments", shortName: "NHLBI — Lung disease treatments",
    detail: "March 24, 2022. Thoracentesis section: positioning, local anesthesia, symptoms, specimen testing and complications. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/lung-treatments", lastRetrieved: "2026-09-17"
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

public enum RHDepthBronchoscopyPreparationRecoverySample {
    public static let entry = ReferenceEntry(
        id: "bronchoscopy-preparation-recovery", title: "Bronchoscopy and BAL: preparation and recovery",
        subtitle: "Airway examination, specimen collection and recovery teaching", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Clarify the purpose of the examination", [
                AttributedBullet("Bronchoscopy allows the clinician to inspect the airways using a lighted camera passed through the mouth or nose. It may investigate persistent cough, coughing up blood, abnormal imaging or another suspected lung problem.", citationIDs: ["rh_depth_bronchoscopy"]),
                AttributedBullet("The procedure may also remove secretions or a blockage, obtain tissue, or support treatment. Explain the planned purpose and whether sampling or another intervention is expected; the same procedure name can describe different clinical plans.", citationIDs: ["rh_depth_bronchoscopy"])
            ]),
            .bullets(title: "Distinguish lavage from tissue biopsy", [
                AttributedBullet("Bronchoalveolar lavage, or BAL, washes a selected airway area with saline and collects the returned fluid for testing. Cells and microorganisms in this sample may help investigate infection or another lung condition.", citationIDs: ["rh_depth_bronchoscopy"]),
                AttributedBullet("A tissue biopsy and a lavage sample answer different questions. Confirm which samples were obtained and which results are pending so follow-up is not limited to the visual airway examination.", citationIDs: ["rh_depth_bronchoscopy"])
            ]),
            .bullets(title: "Verify preparation instructions", [
                AttributedBullet("The procedural team specifies how long the person should avoid food and drink. Review all medicines with that team because some may need adjustment; the patient should not stop prescribed treatment without explicit instructions.", citationIDs: ["rh_depth_bronchoscopy"]),
                AttributedBullet("Dentures and removable dental appliances may need removal. Explain the planned position and any IV medicine for relaxation, and give the person an opportunity to discuss concerns before the procedure begins.", citationIDs: ["rh_depth_bronchoscopy"])
            ]),
            .bullets(title: "Explain sedation and airway numbing", [
                AttributedBullet("The team may give a sedative through an IV and a numbing medicine in the mouth and throat. The bronchoscope transmits images while the clinician examines the airways and performs the planned sampling or treatment.", citationIDs: ["rh_depth_bronchoscopy"]),
                AttributedBullet("A BAL can be performed during the same examination. Explaining the sequence helps the patient understand why obtaining samples and observing the airway are parts of one encounter, while laboratory interpretation happens afterward.", citationIDs: ["rh_depth_bronchoscopy"])
            ]),
            .bullets(title: "Protect the return to oral intake", [
                AttributedBullet("The mouth and throat may remain numb for several hours. Eating and drinking wait until numbness has resolved and the procedural team’s recovery criteria are met. Do not substitute a fixed clock interval for the individual recovery instructions.", citationIDs: ["rh_depth_bronchoscopy"]),
                AttributedBullet("Sedation may cause drowsiness after the procedure. Arrange an escort or ride home when a sedative was used, and review the discharge instructions before the person leaves.", citationIDs: ["rh_depth_bronchoscopy"])
            ]),
            .bullets(title: "Assess symptoms during recovery", [
                AttributedBullet("Sore throat, cough or hoarseness may occur after bronchoscopy. Serious complications are uncommon but include airway bleeding, infection and pneumothorax. Report concerning changes for clinical evaluation rather than assuming every symptom is irritation from the scope.", citationIDs: ["rh_depth_bronchoscopy"]),
                AttributedBullet("A chest X-ray may be obtained after tissue sampling or when the team needs to check for complications. Explain the purpose of any ordered follow-up imaging; it is not a substitute for assessing how the person is breathing.", citationIDs: ["rh_depth_bronchoscopy"])
            ]),
            .bullets(title: "Complete result follow-up", [
                AttributedBullet("Abnormal findings may reflect an airway growth, narrowing, infection or another lung disorder. The clinician interprets the visual findings and specimen results together with symptoms, history and other tests.", citationIDs: ["rh_depth_bronchoscopy"]),
                AttributedBullet("Make the result-review plan explicit: identify the responsible team and how the patient will learn about laboratory or tissue results. Completion of procedural recovery does not mean the diagnostic evaluation is finished.", citationIDs: ["rh_depth_bronchoscopy"])
            ])
        ],
        citations: [rh_depth_bronchoscopy],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum RHDepthThoracentesisAssessmentRecoverySample {
    public static let entry = ReferenceEntry(
        id: "thoracentesis-assessment-recovery", title: "Thoracentesis: observation and recovery",
        subtitle: "Positioning, symptom reporting, fluid testing and follow-up", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Explain why fluid is being removed", [
                AttributedBullet("Thoracentesis removes excess fluid from the space between the lung and chest wall. It may improve breathing while also providing a sample to help identify the cause of a pleural effusion.", citationIDs: ["rh_depth_lung_treatments"]),
                AttributedBullet("Relieving symptoms and investigating the fluid are related but distinct goals. Confirm the plan with the procedural team and explain that fluid removal alone may not resolve the condition that caused it.", citationIDs: ["rh_depth_lung_treatments"])
            ]),
            .bullets(title: "Support the planned position", [
                AttributedBullet("Many patients sit on the edge of a bed or chair with the head and arms supported on a table. Local anesthetic is used after skin preparation before the clinician places the needle into the pleural space.", citationIDs: ["rh_depth_lung_treatments"]),
                AttributedBullet("Discuss comfort and the ability to maintain the planned position with the team. The procedural clinician determines the approach; this reference supports observation and education rather than needle placement.", citationIDs: ["rh_depth_lung_treatments"])
            ]),
            .bullets(title: "Communicate symptoms during drainage", [
                AttributedBullet("Cough or chest discomfort may occur while fluid is withdrawn. Encourage the person to report these symptoms as they happen so the procedural team can assess tolerance.", citationIDs: ["rh_depth_lung_treatments"]),
                AttributedBullet("Observe the patient as well as the collection process. The treating clinician determines how much fluid to remove and whether a symptom changes the plan; this guide does not establish a universal drainage volume or rate.", citationIDs: ["rh_depth_lung_treatments"])
            ]),
            .bullets(title: "Understand imaging and sampling", [
                AttributedBullet("Ultrasound can identify fluid in the pleural space and guide a thoracentesis. Removed fluid may be examined for infection, cancer or other conditions that can cause fluid or blood to accumulate.", citationIDs: ["rh_depth_pleural_diagnosis"]),
                AttributedBullet("Communicate which studies have been ordered and ensure that the planned sample reaches the laboratory through the local specimen process. The appearance of the fluid alone does not replace the requested testing and clinical interpretation.", citationIDs: ["rh_depth_pleural_diagnosis"])
            ]),
            .bullets(title: "Recognize possible complications", [
                AttributedBullet("Potential complications include pneumothorax, bleeding, bruising, pain and infection. The puncture site receives a small dressing after the needle is removed, and a chest X-ray may be ordered to assess for lung problems.", citationIDs: ["rh_depth_lung_treatments"]),
                AttributedBullet("Report a change in symptoms during recovery to the team, including concerns about breathing, pain or the procedure site. Follow the individual observation and discharge plan rather than assuming that an uncomplicated needle removal ends monitoring.", citationIDs: ["rh_depth_lung_treatments"])
            ]),
            .bullets(title: "Know when respiratory symptoms are urgent", [
                AttributedBullet("NHLBI advises emergency help for severe chest pain or trouble breathing in the setting of a pleural disorder. These symptoms require urgent evaluation; they do not identify one complication by themselves.", citationIDs: ["rh_depth_pleural_treatment"]),
                AttributedBullet("Outside the hospital, the emergency pathway is 911. In the hospital, activate the appropriate urgent response while the team evaluates the patient. Do not wait for scheduled fluid results before escalating severe symptoms.", citationIDs: ["rh_depth_pleural_treatment"])
            ]),
            .bullets(title: "Review the ongoing plan", [
                AttributedBullet("Recovery includes follow-up for the pleural disorder and the underlying cause. The treating team determines the timing of repeat examination and imaging.", citationIDs: ["rh_depth_pleural_recovery"]),
                AttributedBullet("Confirm who will review fluid studies and continued respiratory symptoms. A discharge plan should make the next contact clear, especially when treatment of the underlying lung or other disease remains active.", citationIDs: ["rh_depth_pleural_recovery"])
            ])
        ],
        citations: [rh_depth_lung_treatments, rh_depth_pleural_diagnosis, rh_depth_pleural_treatment, rh_depth_pleural_recovery],
        lastSourceFidelityReview: "2026-09-17"
    )
}
