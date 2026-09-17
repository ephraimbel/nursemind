import Foundation

private let icu_depth_bls = CitationSource(
    id: "icu_depth_bls", shortName: "AHA — Adult Basic Life Support (2025)",
    detail: "2025 CPR/ECC Guidelines, Part 7, recognition, compression quality and ventilation sections. Brief original factual paraphrase; no reproduced algorithm or figure. Adult educational reference; not certification or a patient-specific order. Source-fidelity check is not independent clinical review.",
    publisher: "American Heart Association", license: .factCitationOnly,
    url: "https://cpr.heart.org/en/resuscitation-science/cpr-and-ecc-guidelines/adult-basic-life-support", lastRetrieved: "2026-09-17"
)

private let icu_depth_als = CitationSource(
    id: "icu_depth_als", shortName: "AHA — Adult Advanced Life Support (2025)",
    detail: "2025 CPR/ECC Guidelines, Part 9, advanced airway, physiologic monitoring and termination-of-resuscitation limitations. Brief original factual paraphrase; no copied algorithm, dosage table or image. Source-fidelity check is not independent clinical review.",
    publisher: "American Heart Association", license: .factCitationOnly,
    url: "https://cpr.heart.org/en/resuscitation-science/cpr-and-ecc-guidelines/adult-advanced-life-support", lastRetrieved: "2026-09-17"
)

private let icu_depth_post = CitationSource(
    id: "icu_depth_post", shortName: "AHA — Post–Cardiac Arrest Care (2025)",
    detail: "2025 CPR/ECC Guidelines, Part 11, initial assessment, temperature control and neuroprognostication. Brief original factual paraphrase; no copied algorithm or figure. Source-fidelity check is not independent clinical review.",
    publisher: "American Heart Association", license: .factCitationOnly,
    url: "https://cpr.heart.org/en/resuscitation-science/cpr-and-ecc-guidelines/post-cardiac-arrest-care", lastRetrieved: "2026-09-17"
)

private let icu_depth_recovery = CitationSource(
    id: "icu_depth_recovery", shortName: "NHLBI — Life after cardiac arrest",
    detail: "Federal patient-education prose adapted and condensed by NurseMind. Follow-up, treatment continuity and cardiac rehabilitation; extraneous sickle-cell sentence in stress section excluded. Source-fidelity check is not independent clinical review.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/node/93988", lastRetrieved: "2026-09-17"
)

public enum ICUDepthAdultCprQualityReviewSample {
    public static let entry = ReferenceEntry(
        id: "adult-cpr-quality-review", title: "Adult CPR: quality review",
        subtitle: "Recognition, compressions, ventilation and reassessment", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Recognize and activate", [
                AttributedBullet("For an unresponsive adult with absent or abnormal breathing, a healthcare professional checks for a definite pulse for no more than ten seconds. Suspected arrest requires activation of the emergency response and prompt CPR and defibrillator access.", citationIDs: ["icu_depth_bls"])
            ]),
            .bullets(title: "Review compression quality", [
                AttributedBullet("Adult compression quality includes a rate of 100–120/min, depth of at least 5 cm while avoiding more than 6 cm, full recoil and minimal interruptions. Feedback and coordinated team roles can help maintain quality.", citationIDs: ["icu_depth_bls"])
            ]),
            .bullets(title: "Avoid excessive ventilation", [
                AttributedBullet("Ventilation should produce visible chest rise. Both insufficient ventilation and excessive ventilation can be harmful. Use the trained team’s airway technique and resuscitation protocol.", citationIDs: ["icu_depth_bls"])
            ]),
            .bullets(title: "Coordinate the response", [
                AttributedBullet("Timely defibrillation, brief pauses and effective communication support resuscitation. This adult educational review complements current training and the local code process; it does not replace an algorithm or cover pediatric resuscitation.", citationIDs: ["icu_depth_bls"])
            ])
        ],
        citations: [icu_depth_bls],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthResuscitationAirwayCapnographySample {
    public static let entry = ReferenceEntry(
        id: "resuscitation-airway-capnography", title: "Resuscitation airway and capnography",
        subtitle: "Airway confirmation, ventilation and interpretation limits", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Protect compression delivery", [
                AttributedBullet("Advanced airway placement should not create avoidable interruptions in compressions. If placement would interrupt CPR, AHA advises deferring it until initial CPR and defibrillation attempts or return of spontaneous circulation.", citationIDs: ["icu_depth_als"])
            ]),
            .bullets(title: "Confirm and monitor the tube", [
                AttributedBullet("Continuous waveform capnography, together with clinical assessment, is recommended to confirm and monitor endotracheal tube placement. A single clinical sign is insufficient.", citationIDs: ["icu_depth_als"])
            ]),
            .bullets(title: "Coordinate breaths with compressions", [
                AttributedBullet("With an advanced airway during adult CPR, one breath every six seconds may be reasonable while compressions continue. Coordinate ventilation with the resuscitation team and avoid excessive ventilation.", citationIDs: ["icu_depth_als"])
            ]),
            .bullets(title: "Interpret carbon dioxide carefully", [
                AttributedBullet("End-tidal carbon dioxide can inform physiologic assessment, but values depend on multiple factors. A low reading alone must not determine termination of resuscitation. For an intubated adult, any use of an ETCO2 criterion belongs within a multimodal clinical decision; no threshold should guide termination in a nonintubated adult.", citationIDs: ["icu_depth_als"])
            ])
        ],
        citations: [icu_depth_als],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthPostArrestAssessmentPrioritiesSample {
    public static let entry = ReferenceEntry(
        id: "post-arrest-assessment-priorities", title: "After cardiac arrest: assessment priorities",
        subtitle: "Organ support, temperature, neurologic evaluation and continuity", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Reassess after circulation returns", [
                AttributedBullet("Post-arrest care evaluates the cause and ongoing cardiovascular, respiratory and neurologic needs. ECG, echocardiography or CT may contribute according to the clinical situation. Continue documenting rhythm, perfusion and response to support.", citationIDs: ["icu_depth_post"])
            ]),
            .bullets(title: "Follow prescribed organ-support targets", [
                AttributedBullet("Oxygenation, ventilation and blood pressure require active management after return of circulation. AHA recommends avoiding hypotension and maintaining a mean arterial pressure of at least 65 mm Hg; patient-specific management remains with the treating team.", citationIDs: ["icu_depth_post"])
            ]),
            .bullets(title: "Clarify temperature management", [
                AttributedBullet("For adults who remain unresponsive to verbal commands after return of circulation, AHA recommends deliberate temperature control and considers a duration of at least 36 hours reasonable. Verify the ordered target and monitoring plan.", citationIDs: ["icu_depth_post"])
            ]),
            .bullets(title: "Avoid premature neurologic conclusions", [
                AttributedBullet("Seizure evaluation and EEG may be needed. Neurologic prognosis requires multimodal assessment with attention to timing and confounding factors; an early examination or single test should not determine prognosis.", citationIDs: ["icu_depth_post"])
            ]),
            .bullets(title: "Prepare continuity of care", [
                AttributedBullet("Survivors and caregivers need a plan before discharge for follow-up, medicines, the condition that contributed to arrest and any cardioverter device. Cardiac rehabilitation and emotional support can be part of recovery. Identify questions and barriers to discuss with the responsible team.", citationIDs: ["icu_depth_recovery"])
            ])
        ],
        citations: [icu_depth_post, icu_depth_recovery],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthCardiacArrestRecoverySupportSample {
    public static let entry = ReferenceEntry(
        id: "cardiac-arrest-recovery-support", title: "Cardiac arrest recovery: nursing support",
        subtitle: "Follow-up, devices, rehabilitation and caregiver preparation", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Plan with the survivor and caregiver", [
                AttributedBullet("Recovery planning begins before discharge. Survivors remain at risk of another event and need a treatment plan addressing the condition that contributed to the arrest. Include the caregiver in discussions about support at home when the person agrees.", citationIDs: ["icu_depth_recovery"])
            ]),
            .bullets(title: "Review treatment continuity", [
                AttributedBullet("Explain the prescribed medicines and follow-up visits or blood tests. Encourage discussion of medication concerns with the treating team rather than skipped doses or independent changes. New or worsening symptoms between visits should be reported.", citationIDs: ["icu_depth_recovery"])
            ]),
            .bullets(title: "Make device follow-up explicit", [
                AttributedBullet("An implanted or wearable cardioverter helps protect against dangerous rhythms but does not remove the underlying condition. Review the device team’s follow-up, activity instructions and response plan for shocks. Other healthcare providers need to know about the device before procedures.", citationIDs: ["icu_depth_recovery"])
            ]),
            .bullets(title: "Support graded recovery", [
                AttributedBullet("Ask about the prescribed level of physical activity before an exercise program begins. Cardiac rehabilitation provides supervised activity and support; refer questions about readiness, symptoms or progression to the rehabilitation and treating teams.", citationIDs: ["icu_depth_recovery"])
            ]),
            .bullets(title: "Include emotional health", [
                AttributedBullet("Anxiety, depression and fear of a sudden device shock can complicate recovery. Invite discussion of these concerns and connect the person with the clinical team, counseling, peer support or family support according to their preferences.", citationIDs: ["icu_depth_recovery"])
            ]),
            .bullets(title: "Prepare for an emergency", [
                AttributedBullet("NHLBI encourages medical identification and consideration of CPR training for family or other close contacts. Discuss the individual emergency plan and access to trained help. Discharge education should make clear whom to contact for new symptoms and when emergency assistance is needed.", citationIDs: ["icu_depth_recovery"])
            ])
        ],
        citations: [icu_depth_recovery],
        lastSourceFidelityReview: "2026-09-17"
    )
}
