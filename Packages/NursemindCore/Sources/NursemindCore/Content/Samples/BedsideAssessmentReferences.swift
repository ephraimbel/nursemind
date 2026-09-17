import Foundation

private let bedside_head = CitationSource(
    id: "bedside_head",
    shortName: "Open RN — Appendix C: Head-to-toe assessment",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Skills, 2nd edition (2023). Appendix C: Head-to-toe assessment. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596715/",
    lastRetrieved: "2026-09-17"
)

private let bedside_history = CitationSource(
    id: "bedside_history",
    shortName: "Open RN — Chapter 2: Health history",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Skills, 2nd edition (2023). Chapter 2: Health history. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596721/",
    lastRetrieved: "2026-09-17"
)

private let bedside_resp = CitationSource(
    id: "bedside_resp",
    shortName: "Open RN — Section 10.3: Respiratory assessment",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Skills, 2nd edition (2023). Section 10.3: Respiratory assessment. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596716/",
    lastRetrieved: "2026-09-17"
)

private let bedside_cardio = CitationSource(
    id: "bedside_cardio",
    shortName: "Open RN — Section 9.3: Cardiovascular assessment",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Skills, 2nd edition (2023). Section 9.3: Cardiovascular assessment. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596723/",
    lastRetrieved: "2026-09-17"
)

private let bedside_abdomen = CitationSource(
    id: "bedside_abdomen",
    shortName: "Open RN — Section 12.3: Gastrointestinal and genitourinary assessment",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Skills, 2nd edition (2023). Section 12.3: Gastrointestinal and genitourinary assessment. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596738/",
    lastRetrieved: "2026-09-17"
)

private let bedside_msk = CitationSource(
    id: "bedside_msk",
    shortName: "Open RN — Section 13.4: Musculoskeletal assessment",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Skills, 2nd edition (2023). Section 13.4: Musculoskeletal assessment. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596714/",
    lastRetrieved: "2026-09-17"
)

private let bedside_skin = CitationSource(
    id: "bedside_skin",
    shortName: "Open RN — Section 14.4: Integumentary assessment",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Skills, 2nd edition (2023). Section 14.4: Integumentary assessment. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596743/",
    lastRetrieved: "2026-09-17"
)

public enum AdultHeadToToeAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "adult-head-to-toe-assessment",
        title: "Adult head-to-toe assessment",
        subtitle: "A routine bedside survey with focused follow-up",
        eyebrow: "REFERENCE · ASSESSMENT",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .safety),
        sections: [
            .bullets(title: "Start with the person", [
                AttributedBullet("The routine head-to-toe assessment establishes current findings and changes from baseline. The sequence and depth adapt to the patient and care setting; a focused assessment follows a specific concern.", citationIDs: ["bedside_head"]),
                AttributedBullet("Begin with responsiveness, breathing and overall appearance. An unstable patient needs immediate help through the facility response system before completion of a routine checklist.", citationIDs: ["bedside_head"]),
                AttributedBullet("Identify the patient, explain the examination, provide privacy and ask about pain. Make usual glasses, hearing aids and communication supports available.", citationIDs: ["bedside_head"])
            ]),
            .bullets(title: "Work through the systems", [
                AttributedBullet("Neurologic and sensory: orientation, speech, pupils, movement and sensation; note differences from the known baseline.", citationIDs: ["bedside_head"]),
                AttributedBullet("Cardiorespiratory: vital signs, breathing effort, lung and heart sounds, peripheral pulses and edema. Note oxygen equipment and relevant symptoms.", citationIDs: ["bedside_head"]),
                AttributedBullet("Abdominal and elimination: intake, bowel and bladder concerns, abdominal appearance and sounds. Inspect the skin, pressure areas and sites of lines, tubes and drains.", citationIDs: ["bedside_head"])
            ]),
            .bullets(title: "Finish and communicate", [
                AttributedBullet("Assess mobility and assistance needs. Leave the patient comfortable with the bed low and locked and the call device within reach.", citationIDs: ["bedside_head"]),
                AttributedBullet("Document actual findings and meaningful changes. Abnormal cues require focused assessment and timely communication rather than a default normal-system statement.", citationIDs: ["bedside_head"])
            ])
        ],
        citations: [bedside_head],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum AdultHealthHistorySample {
    public static let entry = ReferenceEntry(
        id: "adult-health-history",
        title: "Adult health history",
        subtitle: "Present concerns, baseline function and the patient’s priorities",
        eyebrow: "REFERENCE · ASSESSMENT",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .safety),
        sections: [
            .bullets(title: "Build a usable history", [
                AttributedBullet("The patient is the primary source of subjective information. Records and care partners can add context; identify the source when information comes from someone else.", citationIDs: ["bedside_history"]),
                AttributedBullet("Begin with the main concern in the patient’s own words, then clarify symptom onset, course and effect on daily life. Give time to answer one question at a time.", citationIDs: ["bedside_history"])
            ]),
            .bullets(title: "Cover the relevant context", [
                AttributedBullet("Explore current and previous illnesses, hospitalizations, injuries and procedures relevant to this visit. Ask what the patient understands about the condition and care plan.", citationIDs: ["bedside_history"]),
                AttributedBullet("Review medication use and allergies, including the reported reaction. Reconcile discrepancies through the organization’s medication-reconciliation process.", citationIDs: ["bedside_history"]),
                AttributedBullet("Ask about usual eating, elimination, sleep, mobility and personal care. Distinguish the current limitation from the person’s usual level of independence.", citationIDs: ["bedside_history"])
            ]),
            .bullets(title: "Make the interview accessible", [
                AttributedBullet("Use a professional interpreter when language assistance is needed. Check whether hearing, vision, discomfort or fatigue affects the interview.", citationIDs: ["bedside_history"]),
                AttributedBullet("Ask which health needs matter most to the patient. Verify uncertain or conflicting history rather than silently carrying forward information from an older record.", citationIDs: ["bedside_history"])
            ])
        ],
        citations: [bedside_history],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum FocusedRespiratoryAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "focused-respiratory-assessment",
        title: "Focused respiratory assessment",
        subtitle: "Symptoms, breathing effort and comparison with baseline",
        eyebrow: "REFERENCE · ASSESSMENT",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Clarify the change", [
                AttributedBullet("Ask about shortness of breath, cough, sputum, chest discomfort and blood in sputum. Establish onset, triggers, usual activity tolerance and whether symptoms are new or worsening.", citationIDs: ["bedside_resp"]),
                AttributedBullet("Review respiratory history and usual oxygen or other respiratory support. Severe breathing difficulty or chest pain takes priority over finishing the interview.", citationIDs: ["bedside_resp"])
            ]),
            .bullets(title: "Look and listen together", [
                AttributedBullet("Observe respiratory rate, depth, rhythm, symmetry and effort. Note accessory-muscle use, retractions, posture, mental status and skin or mucosal color.", citationIDs: ["bedside_resp"]),
                AttributedBullet("Assess oxygen saturation together with the clinical examination and current support. A single device reading does not describe the whole respiratory assessment.", citationIDs: ["bedside_resp"]),
                AttributedBullet("Auscultate on the skin and compare corresponding areas on both sides, including posterior fields when accessible. Describe the location and character of added or diminished sounds.", citationIDs: ["bedside_resp"])
            ]),
            .bullets(title: "Document the context", [
                AttributedBullet("Record the symptoms, breathing pattern, sounds and oxygen equipment present at assessment. Compare with the patient’s baseline and previous findings.", citationIDs: ["bedside_resp"]),
                AttributedBullet("Promptly communicate new respiratory distress or unexpected findings using the local escalation process; do not delay help to complete the routine examination.", citationIDs: ["bedside_resp"])
            ])
        ],
        citations: [bedside_resp],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum FocusedCardiovascularAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "focused-cardiovascular-assessment",
        title: "Focused cardiovascular assessment",
        subtitle: "Symptoms, peripheral perfusion and fluid-related findings",
        eyebrow: "REFERENCE · ASSESSMENT",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Ask about symptoms and function", [
                AttributedBullet("Clarify chest discomfort, palpitations, shortness of breath, dizziness, swelling and recent weight changes. Determine onset, associated symptoms and effect on usual activity.", citationIDs: ["bedside_cardio"]),
                AttributedBullet("Compare current symptoms with the patient’s cardiovascular history and usual function. New chest pain or an acute change in condition needs prompt escalation.", citationIDs: ["bedside_cardio"])
            ]),
            .bullets(title: "Assess circulation", [
                AttributedBullet("Evaluate blood pressure, pulse rate and rhythm, and mental status in context. Inspect skin and mucosal color against the person’s baseline skin tone.", citationIDs: ["bedside_cardio"]),
                AttributedBullet("Compare extremity warmth, peripheral pulses, movement and sensation bilaterally. Include capillary refill and the distribution of edema in the assessment.", citationIDs: ["bedside_cardio"]),
                AttributedBullet("Auscultate heart sounds systematically and describe unexpected sounds. Observe associated breathing findings and activity intolerance.", citationIDs: ["bedside_cardio"])
            ]),
            .bullets(title: "Describe changes precisely", [
                AttributedBullet("Document where swelling or pulse changes occur and whether findings are symmetrical. A specific description supports comparison during reassessment.", citationIDs: ["bedside_cardio"]),
                AttributedBullet("Interpret peripheral findings alongside symptoms and vital-sign trends. Report a new perfusion concern or worsening symptoms rather than relying on a single isolated sign.", citationIDs: ["bedside_cardio"])
            ])
        ],
        citations: [bedside_cardio],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum FocusedAbdominalAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "focused-abdominal-assessment",
        title: "Focused abdominal assessment",
        subtitle: "GI and GU history, examination sequence and new findings",
        eyebrow: "REFERENCE · ASSESSMENT",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Establish the usual pattern", [
                AttributedBullet("Ask about abdominal discomfort, nausea, vomiting, appetite, usual bowel movements and urinary symptoms. Clarify what has changed, relevant surgery and the last bowel movement.", citationIDs: ["bedside_abdomen"]),
                AttributedBullet("Ask about stool or emesis appearance and associated symptoms. New blood in emesis or stool requires prompt clinical communication.", citationIDs: ["bedside_abdomen"])
            ]),
            .bullets(title: "Examine in sequence", [
                AttributedBullet("Provide privacy and position comfortably for an abdominal examination. Inspect contour, symmetry, distention and visible skin changes.", citationIDs: ["bedside_abdomen"]),
                AttributedBullet("Auscultate before palpating because palpation can alter bowel activity. Record the findings and their location rather than inferring a diagnosis from sounds alone.", citationIDs: ["bedside_abdomen"]),
                AttributedBullet("Light palpation assesses tenderness and other superficial findings; examine a tender area last. Deep palpation is an advanced assessment and is not part of every routine nursing examination.", citationIDs: ["bedside_abdomen"])
            ]),
            .bullets(title: "Connect symptoms and observations", [
                AttributedBullet("Consider the abdominal examination with intake, elimination and the patient’s reported symptoms. Describe tenderness, distention and changes from the prior assessment.", citationIDs: ["bedside_abdomen"]),
                AttributedBullet("Document findings and communicate unexpected changes. Use the appropriate focused procedure or condition reference for questions beyond the routine examination.", citationIDs: ["bedside_abdomen"])
            ])
        ],
        citations: [bedside_abdomen],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum MusculoskeletalAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "musculoskeletal-assessment",
        title: "Musculoskeletal assessment",
        subtitle: "Pain, movement, strength and daily function",
        eyebrow: "REFERENCE · ASSESSMENT",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .mobility),
        sections: [
            .bullets(title: "Start with function", [
                AttributedBullet("Ask about joint or muscle pain, weakness, stiffness, swelling and recent injury. Clarify onset, aggravating factors and effects on usual activities.", citationIDs: ["bedside_msk"]),
                AttributedBullet("Establish the person’s usual mobility, assistive devices, fall history and need for help with daily care. A current limitation is most useful when compared with baseline.", citationIDs: ["bedside_msk"])
            ]),
            .bullets(title: "Observe movement safely", [
                AttributedBullet("Inspect posture, alignment, muscle symmetry and joints for visible swelling or changes. Observe gait and balance when appropriate to the patient’s condition.", citationIDs: ["bedside_msk"]),
                AttributedBullet("Assess active range of motion and compare corresponding sides. Support joints during assisted movement and avoid forcing a painful or restricted joint.", citationIDs: ["bedside_msk"]),
                AttributedBullet("Assess strength and note whether pain or another limitation affects performance. Describe the observed movement rather than using weakness as an unexplained label.", citationIDs: ["bedside_msk"])
            ]),
            .bullets(title: "Make findings useful", [
                AttributedBullet("Document the affected location, range-of-motion limitation, asymmetry and effect on transfers or self-care.", citationIDs: ["bedside_msk"]),
                AttributedBullet("Communicate new functional loss, unexpected pain or other abnormal findings. The focused examination complements the separate assessment of assistance and equipment needed for mobility.", citationIDs: ["bedside_msk"])
            ])
        ],
        citations: [bedside_msk],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum SkinAssessmentBeyondWoundsSample {
    public static let entry = ReferenceEntry(
        id: "skin-assessment-beyond-wounds",
        title: "Skin assessment beyond wounds",
        subtitle: "Baseline skin, pressure areas and device-related changes",
        eyebrow: "REFERENCE · ASSESSMENT",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .safety),
        sections: [
            .bullets(title: "Ask before inspecting", [
                AttributedBullet("Ask about itching, pain, rash, dryness, previous skin problems and recent changes in products or exposures. Include the patient’s account of when a change appeared.", citationIDs: ["bedside_skin"]),
                AttributedBullet("Inspect with privacy and adequate lighting. Compare color with the individual’s usual appearance rather than assuming one expected color for all skin tones.", citationIDs: ["bedside_skin"])
            ]),
            .bullets(title: "Include commonly missed areas", [
                AttributedBullet("Observe skin integrity, moisture, texture and temperature. Assess skin folds, between digits and pressure-prone areas as appropriate to the examination.", citationIDs: ["bedside_skin"]),
                AttributedBullet("Include skin associated with medical devices when accessible according to the care plan. Describe localized changes as well as more generalized findings.", citationIDs: ["bedside_skin"]),
                AttributedBullet("Skin turgor becomes less reliable as an isolated hydration finding in older adults. Interpret it with the history and other assessment data.", citationIDs: ["bedside_skin"])
            ]),
            .bullets(title: "Describe, then follow up", [
                AttributedBullet("Record location, extent and appearance of new lesions or breakdown, plus associated discomfort. Use consistent descriptions so subsequent examinations can identify change.", citationIDs: ["bedside_skin"]),
                AttributedBullet("Communicate new skin injury and reassess the care plan. Detailed wound measurement and pressure-injury classification belong in the relevant wound or pressure-injury reference.", citationIDs: ["bedside_skin"])
            ])
        ],
        citations: [bedside_skin],
        lastSourceFidelityReview: "2026-09-17"
    )
}
