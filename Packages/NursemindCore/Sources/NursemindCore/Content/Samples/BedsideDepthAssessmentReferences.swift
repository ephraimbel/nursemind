import Foundation

private let bedside_depth_neuro = CitationSource(
    id: "bedside_depth_neuro", shortName: "Open RN — Neurological Assessment",
    detail: "Nursing Skills, 2nd edition (2023). Sections 6.3–6.5, history, mental status, pupils, motor and sensory assessment. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and learning activities excluded. Separately attributed noncommercial or no-derivatives material excluded; permitted text adaptations are credited below. No reproduced copyrighted scoring instrument, diagnostic algorithm, painful-stimulus technique or GCS numerical bounds from the source. Source-fidelity review is not independent clinical approval.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596731/", lastRetrieved: "2026-09-17"
)

private let bedside_depth_fluid = CitationSource(
    id: "bedside_depth_fluid", shortName: "Open RN — Fluids and Electrolytes",
    detail: "Nursing Fundamentals, 2nd edition (2024). Section 15.6, applying the nursing process: history, examination, weights, intake/output and reassessment. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and learning activities excluded. Separately attributed noncommercial or no-derivatives material excluded; permitted text adaptations are credited below. StatPearls-derived fluid and acid-base passages and third-party treatment guidance outside 15.6 excluded. No fluid-resuscitation formula or electrolyte replacement regimen. Source-fidelity review is not independent clinical approval.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK610839/", lastRetrieved: "2026-09-17"
)

public enum BedsideDepthSerialNeurologicalAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "serial-neurological-assessment", title: "Neurological checks: serial bedside assessment",
        subtitle: "Baseline, mental status, pupils, movement and change over time", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Establish the reason and baseline", [
                AttributedBullet("Review why neurological observation is required, the ordered frequency and the person’s usual cognitive, sensory and motor function. Ask about prior neurological conditions, current symptoms, medicines and recent changes in daily function.", citationIDs: ["bedside_depth_neuro"]),
                AttributedBullet("Record a clear initial examination rather than relying only on the word normal. Serial assessment is most useful when the next examination can be compared with specific observations of consciousness, speech, pupils, movement and sensation.", citationIDs: ["bedside_depth_neuro"])
            ]),
            .bullets(title: "Describe consciousness and orientation", [
                AttributedBullet("Observe whether the person is awake spontaneously, responds to voice, or requires further assessment under the trained examination protocol. Note the quality and consistency of interaction, not simply whether the eyes are open.", citationIDs: ["bedside_depth_neuro"]),
                AttributedBullet("Assess orientation to person, place and time using appropriate questions and document the actual difficulties. Confusion, reduced attention and a change in responsiveness require comparison with baseline and the patient’s clinical context.", citationIDs: ["bedside_depth_neuro"])
            ]),
            .bullets(title: "Assess speech and understanding", [
                AttributedBullet("Observe speech clarity, word finding, ability to express needs and understanding of simple requests. Distinguish what the person says from what they appear to understand, and report a new difficulty in either area.", citationIDs: ["bedside_depth_neuro"]),
                AttributedBullet("Account for communication needs and the person’s usual language when assessing cognition. An assessment should describe observed behavior and limitations instead of assigning a neurological conclusion from a short or incomplete conversation.", citationIDs: ["bedside_depth_neuro"])
            ]),
            .bullets(title: "Examine pupil findings", [
                AttributedBullet("Assess pupil size, symmetry and reaction to light using the approved technique. Compare the two eyes and previous findings; record the actual observation rather than only documenting a familiar abbreviation.", citationIDs: ["bedside_depth_neuro"]),
                AttributedBullet("An unexpected change in size or reactivity needs prompt evaluation with the rest of the examination. Pupil findings are one part of neurological assessment and do not alone determine the diagnosis or prognosis.", citationIDs: ["bedside_depth_neuro"])
            ]),
            .bullets(title: "Compare movement on both sides", [
                AttributedBullet("Observe spontaneous movement and assess strength using the facility’s standardized method. Compare the right and left sides, including upper and lower limbs, and note any difficulty following the requested movement.", citationIDs: ["bedside_depth_neuro"]),
                AttributedBullet("Describe weakness, asymmetry and change from baseline precisely. A movement that is limited by pain or inability to understand the task needs that context in the record; the reason the examination is incomplete should remain visible.", citationIDs: ["bedside_depth_neuro"])
            ]),
            .bullets(title: "Assess sensation and safe coordination", [
                AttributedBullet("Ask about numbness, tingling or altered sensation and compare findings on both sides when testing is appropriate. Report a new sensory change with its location and associated motor or functional findings.", citationIDs: ["bedside_depth_neuro"]),
                AttributedBullet("Coordination, balance and gait assessment depend on the patient’s condition and ability to participate safely. Use assistance and fall precautions as indicated rather than asking an unstable patient to walk solely to complete a checklist.", citationIDs: ["bedside_depth_neuro"])
            ]),
            .bullets(title: "Recognize deterioration promptly", [
                AttributedBullet("New reduced consciousness, speech difficulty, unequal strength or other acute focal change requires prompt escalation through the facility’s emergency or stroke-assessment pathway. Repeat observations and clear timing support the team’s assessment but should not delay urgent help.", citationIDs: ["bedside_depth_neuro"]),
                AttributedBullet("Compare the whole examination with prior findings and communicate the specific change. A total score or general description can obscure which function changed; retain the underlying observations used in any local assessment tool.", citationIDs: ["bedside_depth_neuro"])
            ]),
            .bullets(title: "Document a usable trend", [
                AttributedBullet("Record assessment time, level of consciousness, orientation, speech, pupils, movement and relevant sensory findings. Include examination limitations and the reason a component could not be assessed.", citationIDs: ["bedside_depth_neuro"]),
                AttributedBullet("Hand off new findings, the time they were recognized, notifications and the current monitoring plan. Reassess after care or a change in condition as required so the record shows the trajectory rather than isolated examination labels.", citationIDs: ["bedside_depth_neuro"])
            ])
        ],
        citations: [bedside_depth_neuro],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum BedsideDepthFluidVolumeAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "fluid-volume-assessment", title: "Fluid volume: interpreting bedside trends",
        subtitle: "History, weights, intake/output and signs of excess or deficit", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Identify the relevant risks", [
                AttributedBullet("Review oral and enteral intake, recent vomiting or diarrhea, surgery, trauma, chronic disease and medicines. Kidney disease and heart failure can increase the risk of fluid excess, while diuretics and gastrointestinal losses can contribute to deficit and electrolyte imbalance.", citationIDs: ["bedside_depth_fluid"]),
                AttributedBullet("Ask about the person’s usual weight, intake, urine pattern and symptoms. Verify chart information with the patient or caregiver when possible; an inaccurate baseline can make a real change harder to recognize.", citationIDs: ["bedside_depth_fluid"])
            ]),
            .bullets(title: "Look for findings of possible deficit", [
                AttributedBullet("Assess thirst, dry mucous membranes, weakness, dizziness and changes in urine output alongside blood pressure, pulse and mental status. A falling pressure with a faster, weak pulse may accompany fluid deficit and needs clinical assessment.", citationIDs: ["bedside_depth_fluid"]),
                AttributedBullet("Older adults may have a reduced thirst response and limited ability to obtain fluids because of decreased mobility. Assess access to drinks and usual intake alongside observed findings, and report deterioration through the facility’s escalation process.", citationIDs: ["bedside_depth_fluid"])
            ]),
            .bullets(title: "Look for findings of possible excess", [
                AttributedBullet("Assess swelling, weight change, breathing difficulty, lung sounds, blood pressure and pulse quality. Crackles may be heard first in the posterior lower lung fields, and increasing edema or respiratory symptoms should prompt reassessment.", citationIDs: ["bedside_depth_fluid"]),
                AttributedBullet("Interpret these findings with the patient’s history and ongoing treatment. A new respiratory change needs prompt attention; documentation of a positive fluid balance alone does not establish the cause of breathlessness.", citationIDs: ["bedside_depth_fluid"])
            ]),
            .bullets(title: "Make weight measurements comparable", [
                AttributedBullet("Use the same scale, a consistent time of day and similar clothing for serial weights. Check whether measurement conditions changed before interpreting an apparent gain or loss. Accurate daily weights help identify fluid changes that a single examination may miss.", citationIDs: ["bedside_depth_fluid"]),
                AttributedBullet("Report a meaningful rapid change together with the interval and other findings. Compare the weight trend with measured intake and output rather than treating either record as a complete assessment by itself.", citationIDs: ["bedside_depth_fluid"])
            ]),
            .bullets(title: "Reconcile intake and output", [
                AttributedBullet("Review the completeness of the intake and output record over a defined period. Include the relevant sources of administered fluid and measured losses, and communicate missing measurements or collection problems that make the balance uncertain.", citationIDs: ["bedside_depth_fluid"]),
                AttributedBullet("Compare urine trends with the person’s baseline and clinical status. Reduced output requires assessment and reporting according to the ordered parameters and institutional protocol; it should not automatically trigger an independent fluid prescription.", citationIDs: ["bedside_depth_fluid"])
            ]),
            .bullets(title: "Use laboratory results as part of the picture", [
                AttributedBullet("Review ordered electrolytes, kidney-function studies and other relevant results with the physical examination, weight and intake/output trend. Changes may support a concern but require interpretation in the patient’s overall clinical context.", citationIDs: ["bedside_depth_fluid"]),
                AttributedBullet("Report important abnormalities and associated symptoms promptly. Fluid, electrolyte and acid-base status can change rapidly, so the responsible team determines repeat testing and treatment rather than relying on an earlier stable result.", citationIDs: ["bedside_depth_fluid"])
            ]),
            .bullets(title: "Evaluate the response to the plan", [
                AttributedBullet("After prescribed interventions, reassess symptoms, vital signs, lung sounds, edema, urine output and relevant laboratory trends. Evaluate whether the intended outcome is occurring and whether new signs of imbalance have appeared.", citationIDs: ["bedside_depth_fluid"]),
                AttributedBullet("Document the response rather than only the amount of fluid given or removed. Ongoing observation helps the team adjust the care plan when the original approach is not producing the expected result.", citationIDs: ["bedside_depth_fluid"])
            ]),
            .bullets(title: "Communicate the trend clearly", [
                AttributedBullet("A useful report includes risk factors, what changed, when it changed, weight and output trends, examination findings and available laboratory results. State uncertainties such as an unmeasured loss or a different weighing method.", citationIDs: ["bedside_depth_fluid"]),
                AttributedBullet("At handoff, include the active fluid plan, ordered monitoring and unresolved concerns. The next nurse should be able to continue a comparable assessment and recognize worsening status without reconstructing the entire shift.", citationIDs: ["bedside_depth_fluid"])
            ])
        ],
        citations: [bedside_depth_fluid],
        lastSourceFidelityReview: "2026-09-17"
    )
}
