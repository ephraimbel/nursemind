import Foundation

private let ip_depth_cath_before = CitationSource(
    id: "ip_depth_cath_before", shortName: "NHLBI — Preparing for cardiac catheterization",
    detail: "March 24, 2022; history, medication instructions, preprocedure tests and planning. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/cardiac-catheterization/preparing", lastRetrieved: "2026-09-17"
)

private let ip_depth_cath_during = CitationSource(
    id: "ip_depth_cath_during", shortName: "NHLBI — During cardiac catheterization",
    detail: "March 24, 2022; procedure expectations, risks, access-site hemostasis and immediate monitoring. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/cardiac-catheterization/during", lastRetrieved: "2026-09-17"
)

private let ip_depth_cath_after = CitationSource(
    id: "ip_depth_cath_after", shortName: "NHLBI — Recovery from cardiac catheterization",
    detail: "March 24, 2022; access-site care, follow-up, concerning symptoms and emergency signs. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/cardiac-catheterization/recovery", lastRetrieved: "2026-09-17"
)

private let ip_depth_heart_procedures = CitationSource(
    id: "ip_depth_heart_procedures", shortName: "NHLBI — Heart treatments and procedures",
    detail: "Cardioversion section only: planned electrical cardioversion, anesthesia, monitoring, clot risk and recovery. Emergency defibrillation wording and shock-energy protocols excluded. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/heart-treatments-procedures", lastRetrieved: "2026-09-17"
)

private let ip_depth_surgery = CitationSource(
    id: "ip_depth_surgery", shortName: "NHLBI — Heart surgery recovery",
    detail: "June 1, 2022; hospital observation, incision care, recovery symptoms, medicines, follow-up and cardiac rehabilitation. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/heart-surgery/recovery", lastRetrieved: "2026-09-17"
)

public enum IPDepthCardiacCatheterizationPreparationRecoverySample {
    public static let entry = ReferenceEntry(
        id: "cardiac-catheterization-preparation-recovery", title: "Cardiac catheterization: preparation and recovery",
        subtitle: "Medication review, access-site observation and warning signs", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Clarify the planned procedure", [
                AttributedBullet("Cardiac catheterization may investigate a heart problem or support a treatment. Review the planned procedure and the person’s questions, including what may happen during it, expected recovery and whether an overnight stay is anticipated.", citationIDs: ["ip_depth_cath_before"]),
                AttributedBullet("Relevant preparation includes medical and surgical history, allergies and current medicines. Diabetes and kidney disease can affect the preparation plan, so make sure this history reaches the procedural team.", citationIDs: ["ip_depth_cath_before"])
            ]),
            .bullets(title: "Verify individualized preparation instructions", [
                AttributedBullet("Confirm the team’s instructions about eating, drinking and which medicines to take or pause. These decisions depend on the procedure and the person’s health; this guide does not supply a universal fasting or medication-hold interval.", citationIDs: ["ip_depth_cath_before"]),
                AttributedBullet("Ordered tests may include blood counts, chemistry or clotting studies and selected heart tests. Identify what remains outstanding and the purpose of each test instead of assuming that every patient needs the same preprocedure panel.", citationIDs: ["ip_depth_cath_before"])
            ]),
            .bullets(title: "Explain what the patient may experience", [
                AttributedBullet("The team places an IV for medicines that help the person relax or sleep and uses local numbing medicine at the vascular access site. Catheters are guided with X-ray imaging; contrast may be used to show blood flow.", citationIDs: ["ip_depth_cath_during"]),
                AttributedBullet("Discuss the procedure-specific explanation supplied by the team. Bleeding, rhythm changes, contrast reactions, vessel injury and low blood pressure are among possible complications; concerning symptoms during care need prompt attention.", citationIDs: ["ip_depth_cath_during"])
            ]),
            .bullets(title: "Observe the immediate recovery", [
                AttributedBullet("After catheter removal, the access site receives a dressing and a pressure-based method to control bleeding. Recovery observation includes heart rhythm and blood pressure, with the individual access and closure method guiding activity restrictions.", citationIDs: ["ip_depth_cath_during"]),
                AttributedBullet("Review the procedural handoff and the team’s recovery instructions. The person’s prior health and any treatment performed during catheterization influence monitoring and whether discharge or continued hospitalization is appropriate.", citationIDs: ["ip_depth_cath_during"])
            ]),
            .bullets(title: "Recognize concerning access-site changes", [
                AttributedBullet("A small bruise or tenderness can occur, but increasing pain, redness, swelling, drainage or worsening bruising needs assessment. New numbness, weakness, coolness or blue discoloration of the access-side limb also requires immediate contact with the care team.", citationIDs: ["ip_depth_cath_after"]),
                AttributedBullet("NHLBI advises immediate contact for bleeding at the insertion site that does not stop with firm pressure. Explain the discharge emergency pathway and access-site instructions before the person leaves; persistent bleeding should not wait for a routine appointment.", citationIDs: ["ip_depth_cath_after"])
            ]),
            .bullets(title: "Recognize symptoms beyond the puncture site", [
                AttributedBullet("Chest pain, shortness of breath, dizziness, fever or an irregular, very fast or very slow heartbeat after catheterization needs prompt clinical attention. A normal-looking dressing does not explain or exclude these problems.", citationIDs: ["ip_depth_cath_after"]),
                AttributedBullet("NHLBI advises calling 911 for symptoms of a heart attack or stroke. In the hospital, use the urgent clinical response pathway for deterioration rather than treating the concern only as a routine recovery question.", citationIDs: ["ip_depth_cath_after"])
            ]),
            .bullets(title: "Close the loop on discharge care", [
                AttributedBullet("Review the individual plan for lifting, activity, bathing, swimming and access-site care. Confirm follow-up appointments and how to reach the team for questions or new symptoms.", citationIDs: ["ip_depth_cath_after"]),
                AttributedBullet("Explain the prescribed medicines and any required laboratory follow-up, including monitoring when applicable to a blood thinner. The discharge instructions should describe the actual medication plan after any intervention, rather than relying on the preprocedure list.", citationIDs: ["ip_depth_cath_after"])
            ])
        ],
        citations: [ip_depth_cath_before, ip_depth_cath_during, ip_depth_cath_after],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum IPDepthPlannedCardioversionPreparationRecoverySample {
    public static let entry = ReferenceEntry(
        id: "planned-cardioversion-preparation-recovery", title: "Planned cardioversion: preparation and recovery",
        subtitle: "Anesthesia, monitoring, clot-risk discussion and discharge", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Identify the purpose and setting", [
                AttributedBullet("Planned electrical cardioversion uses brief external electrical shocks to restore a normal rhythm in selected arrhythmias, including atrial fibrillation. The cardiology team determines whether the procedure fits the person’s rhythm and overall condition.", citationIDs: ["ip_depth_heart_procedures"]),
                AttributedBullet("This guide covers preparation and recovery for a planned procedure. Explain the purpose using the treating team’s plan and distinguish it from emergency resuscitation training, which has separate indications and procedures.", citationIDs: ["ip_depth_heart_procedures"])
            ]),
            .bullets(title: "Clarify anesthesia and procedure expectations", [
                AttributedBullet("Anesthesia is given through an IV so the person does not feel the electrical shocks. The team places electrodes on the chest and possibly the back and records the heart’s electrical activity during the procedure.", citationIDs: ["ip_depth_heart_procedures"]),
                AttributedBullet("Explain that the team manages monitoring and delivery of the shocks. Medication selection, shock energy and procedural technique belong to the clinical procedure plan; they are not provided by this nursing education guide.", citationIDs: ["ip_depth_heart_procedures"])
            ]),
            .bullets(title: "Discuss the clot-risk plan", [
                AttributedBullet("Cardioversion can dislodge a blood clot and cause a stroke. Blood-thinning medicine before and after the procedure can reduce this risk, and the team determines the individual anticoagulation plan.", citationIDs: ["ip_depth_heart_procedures"]),
                AttributedBullet("Review the prescribed plan and raise questions about missing or unclear instructions with the treating team. This source does not establish one medication schedule or duration for every patient undergoing cardioversion.", citationIDs: ["ip_depth_heart_procedures"])
            ]),
            .bullets(title: "Monitor the recovery period", [
                AttributedBullet("The person usually remains for observation after cardioversion while heart rhythm, blood pressure and possible complications are assessed. A successful rhythm change does not eliminate the need for the planned recovery observation.", citationIDs: ["ip_depth_heart_procedures"]),
                AttributedBullet("Redness or soreness can occur where electrodes contacted the skin, and bruising may occur at the IV site. Report concerns during recovery so the team can distinguish these local effects from other complications.", citationIDs: ["ip_depth_heart_procedures"])
            ]),
            .bullets(title: "Complete discharge arrangements", [
                AttributedBullet("Anesthesia affects the discharge plan: arrange for someone else to drive the person home. The team confirms when the person can leave after recovery monitoring.", citationIDs: ["ip_depth_heart_procedures"]),
                AttributedBullet("Review the actual discharge medicines, particularly the anticoagulation plan when prescribed. Cardioversion has a small risk of worsening an arrhythmia as well as clot-related complications, so unresolved concerns should reach the clinical team before discharge.", citationIDs: ["ip_depth_heart_procedures"])
            ])
        ],
        citations: [ip_depth_heart_procedures],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum IPDepthCardiacSurgeryRecoverySupportSample {
    public static let entry = ReferenceEntry(
        id: "cardiac-surgery-recovery-support", title: "Heart surgery: recovery and nursing support",
        subtitle: "Hospital observation, discharge teaching and rehabilitation", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Understand the transition through hospital care", [
                AttributedBullet("Early recovery after heart surgery commonly involves intensive-care observation, IV treatment and oxygen when needed. As recovery progresses, care continues on a hospital unit before discharge.", citationIDs: ["ip_depth_surgery"]),
                AttributedBullet("The team monitors heart rate, blood pressure, breathing and the surgical incision. Recovery needs depend on the operation and the person’s prior health, so the observation and discharge plan should be individualized.", citationIDs: ["ip_depth_surgery"])
            ]),
            .bullets(title: "Discuss common recovery symptoms", [
                AttributedBullet("Possible recovery problems include incision discomfort, reduced appetite, sleep difficulty, constipation related to pain medicine, and changes in mood or memory. Ask about how these symptoms affect eating, rest and daily function.", citationIDs: ["ip_depth_surgery"]),
                AttributedBullet("Review symptoms with the clinical team and follow the supplied recovery instructions. A list of common effects should help the person describe concerns, rather than become a reason to ignore a new or worsening problem.", citationIDs: ["ip_depth_surgery"])
            ]),
            .bullets(title: "Make incision and complication teaching usable", [
                AttributedBullet("Before discharge, the care team provides instructions about incision care, signs of infection and other complications, and when to call. Check that the person and caregiver understand those instructions and have the appropriate contact details.", citationIDs: ["ip_depth_surgery"]),
                AttributedBullet("Use the actual surgical discharge plan for wound care and reporting criteria. Different operations and recoveries may need different instructions; this reference does not establish a universal dressing method or symptom threshold.", citationIDs: ["ip_depth_surgery"])
            ]),
            .bullets(title: "Reconcile medicines and follow-up", [
                AttributedBullet("Review prescribed medicines and how they fit the postoperative plan. Some patients need blood-thinning treatment depending on their operation and condition; the clinical team determines the specific medicine and monitoring.", citationIDs: ["ip_depth_surgery"]),
                AttributedBullet("Continued checkups may include heart tests or blood tests. Confirm who will review recovery and medication questions, and keep the follow-up plan available during transfer from hospital care to home or rehabilitation.", citationIDs: ["ip_depth_surgery"])
            ]),
            .bullets(title: "Resume activity through the individual plan", [
                AttributedBullet("The discharge instructions should explain when daily activities, driving and work may resume. Recovery time varies with the operation and overall health, so avoid using another patient’s recovery schedule as the expected standard.", citationIDs: ["ip_depth_surgery"]),
                AttributedBullet("Follow the team’s advice about physical activity and other heart-healthy habits, including smoking cessation when relevant. Discuss limitations or difficulty carrying out the plan at follow-up so support can be adjusted.", citationIDs: ["ip_depth_surgery"])
            ]),
            .bullets(title: "Connect recovery with cardiac rehabilitation", [
                AttributedBullet("Cardiac rehabilitation combines supervised exercise with education and counseling to support recovery and heart health. Ask about the recommended program and how the person will access it.", citationIDs: ["ip_depth_surgery"]),
                AttributedBullet("Include rehabilitation and emotional concerns in the ongoing care discussion. Recovery after surgery extends beyond incision healing and includes function, confidence and the ability to follow the long-term treatment plan.", citationIDs: ["ip_depth_surgery"])
            ])
        ],
        citations: [ip_depth_surgery],
        lastSourceFidelityReview: "2026-09-17"
    )
}
