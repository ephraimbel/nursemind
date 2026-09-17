import Foundation

private let workflow_lab_results = CitationSource(
    id: "workflow_lab_results", shortName: "MedlinePlus — Understanding lab results",
    detail: "NLM-authored medical-test information, paraphrased and condensed by NurseMind; third-party linked content excluded.",
    publisher: "National Library of Medicine", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/how-to-understand-your-lab-results/", lastRetrieved: "2026-09-17"
)

private let workflow_fda_tests = CitationSource(
    id: "workflow_fda_tests", shortName: "FDA — Tests used in clinical care",
    detail: "FDA educational information on laboratory test purposes and interpretation, paraphrased and condensed by NurseMind.",
    publisher: "U.S. Food and Drug Administration", license: .publicDomain,
    url: "https://www.fda.gov/medical-devices/in-vitro-diagnostics/tests-used-clinical-care", lastRetrieved: "2026-09-17"
)

private let workflow_lab_prep = CitationSource(
    id: "workflow_lab_prep", shortName: "MedlinePlus — Preparing for a lab test",
    detail: "NLM-authored medical-test information, paraphrased and condensed by NurseMind; third-party linked content excluded.",
    publisher: "National Library of Medicine", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/how-to-prepare-for-a-lab-test/", lastRetrieved: "2026-09-17"
)

private let workflow_fasting = CitationSource(
    id: "workflow_fasting", shortName: "MedlinePlus — Fasting for a blood test",
    detail: "NLM-authored medical-test information, paraphrased and condensed by NurseMind; third-party linked content excluded.",
    publisher: "National Library of Medicine", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/fasting-for-a-blood-test/", lastRetrieved: "2026-09-17"
)

private let workflow_outcomes = CitationSource(
    id: "workflow_outcomes", shortName: "Open RN — Outcome identification",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals 2e, section 4.5. ©2024 WisTech Open, CC BY 4.0. Open RN prose paraphrased and condensed by NurseMind; proprietary classifications, quoted standards, tables and illustrations excluded.",
    publisher: "Open Resources for Nursing", license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingfundamentals/chapter/4-5-outcome-identification/", lastRetrieved: "2026-09-17"
)

private let workflow_evaluation = CitationSource(
    id: "workflow_evaluation", shortName: "Open RN — Evaluation",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals 2e, section 4.8. ©2024 WisTech Open, CC BY 4.0. Open RN prose paraphrased and condensed by NurseMind; quoted standards, classifications and illustrations excluded.",
    publisher: "Open Resources for Nursing", license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingfundamentals/chapter/4-8-evaluation/", lastRetrieved: "2026-09-17"
)

public enum LabResultInterpretationSample {
    public static let entry = ReferenceEntry(
        id: "reading-lab-results", title: "Reading laboratory results",
        subtitle: "Reference intervals, trends, positive results and uncertainty", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .safety),
        sections: [
            .bullets(title: "Start with the clinical question", [
                AttributedBullet("Clarify why the test was ordered: screening before symptoms, investigating a concern, monitoring a condition or assessing treatment response. The same result may carry different meaning in each setting.", citationIDs: ["workflow_fda_tests"]),
                AttributedBullet("Some tests measure the amount of a substance; others detect whether something is present. A result may provide a specific clue or only general information that leads to further investigation.", citationIDs: ["workflow_fda_tests"])
            ]),
            .bullets(title: "Read the interval and units", [
                AttributedBullet("Use the reference interval printed on the report. Methods, units and population ranges differ between laboratories; a number copied from another source may not be comparable.", citationIDs: ["workflow_lab_results"]),
                AttributedBullet("An out-of-range result does not always indicate illness, and an in-range result does not always exclude it. Review symptoms and the reason for testing.", citationIDs: ["workflow_lab_results"])
            ]),
            .bullets(title: "Understand result labels", [
                AttributedBullet("Positive means the test detected its target; negative means it did not. Neither automatically resolves the clinical question. Inconclusive results may need repeat or additional testing.", citationIDs: ["workflow_lab_results"]),
                AttributedBullet("False-positive and false-negative results are possible. Unexpected results should be interpreted with the clinical team.", citationIDs: ["workflow_lab_results"])
            ]),
            .bullets(title: "Compare trends in context", [
                AttributedBullet("Previous results can help reveal change, but interpretation must include the medical history, current health and other examinations or tests. An isolated laboratory flag is not a diagnosis.", citationIDs: ["workflow_fda_tests"]),
                AttributedBullet("Food, medicines, preparation and laboratory techniques may influence results. Include these factors when reviewing a surprising change, so that repeat testing or a change in the care plan can be considered in context.", citationIDs: ["workflow_fda_tests"])
            ]),
            .bullets(title: "Explain the next step", [
                AttributedBullet("Explain uncertainty plainly: additional testing may be needed. Persistent symptoms still matter even when a result falls within its reference interval.", citationIDs: ["workflow_lab_results"])
            ])
        ],
        citations: [workflow_fda_tests, workflow_lab_results],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum LaboratoryTestPreparationSample {
    public static let entry = ReferenceEntry(
        id: "laboratory-test-preparation", title: "Preparing for laboratory tests",
        subtitle: "Fasting, medicines, preparation errors and patient questions", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .safety),
        sections: [
            .bullets(title: "Confirm the actual instructions", [
                AttributedBullet("Many tests need no special preparation. Others require a particular diet, timing or activity restriction. Review the instructions for the ordered test rather than applying one preparation rule to every blood or urine sample.", citationIDs: ["workflow_lab_prep"]),
                AttributedBullet("Clarify the purpose of the test and any instructions the patient does not understand before the collection day. Preparation can influence the reliability of the result.", citationIDs: ["workflow_lab_prep"])
            ]),
            .bullets(title: "Review medicines and supplements", [
                AttributedBullet("Ask about prescription and over-the-counter medicines, vitamins, herbal products and other supplements. Some can change test results.", citationIDs: ["workflow_lab_prep"]),
                AttributedBullet("Patients should not stop medicines on their own. Questions about taking, delaying or withholding a dose must be clarified with the responsible clinician using the actual test instructions.", citationIDs: ["workflow_lab_prep"])
            ]),
            .bullets(title: "When fasting is requested", [
                AttributedBullet("Confirm the specified fasting duration. Plain water is generally allowed for a fasting blood test, while coffee, juice and other drinks can affect results; use the supplied instructions for the planned testing.", citationIDs: ["workflow_fasting"]),
                AttributedBullet("During the requested fast, avoid chewing gum, smoking and exercise. An early appointment can make fasting easier by placing much of it overnight.", citationIDs: ["workflow_fasting"]),
                AttributedBullet("Do not recommend fasting when it was not requested. Unnecessary fasting can also change results. If another procedure has different restrictions, clarify the combined instructions rather than using this blood-test guide as permission to drink.", citationIDs: ["workflow_fasting"])
            ]),
            .bullets(title: "If preparation was not followed", [
                AttributedBullet("Ask what happened without blame and inform the laboratory or ordering clinician. Even a small departure from the instructions may matter. The team can decide whether to proceed or reschedule.", citationIDs: ["workflow_lab_prep"]),
                AttributedBullet("Test-specific instructions may also address alcohol, foods, strenuous activity or timing. Do not assume that fasting is the only relevant preparation.", citationIDs: ["workflow_lab_prep"])
            ]),
            .bullets(title: "After a fasting collection", [
                AttributedBullet("Patients may feel light-headed after a fasting blood draw. When the test is complete and no other restriction applies, food and drink can resume; having a snack available may help with planning.", citationIDs: ["workflow_fasting"]),
                AttributedBullet("Before leaving, clarify any remaining preparation or medication questions with the team. A fasting instruction alone is not a medication-management plan.", citationIDs: ["workflow_fasting"])
            ])
        ],
        citations: [workflow_lab_prep, workflow_fasting],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum NursingCarePlanEvaluationSample {
    public static let entry = ReferenceEntry(
        id: "nursing-care-plan-evaluation", title: "Nursing care plans and reassessment",
        subtitle: "Individual goals, observable outcomes and evaluating response", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "Make the plan individual", [
                AttributedBullet("Build goals with the patient and, when appropriate, family and the interprofessional team. Include the person’s priorities, values, preferences and current ability to participate.", citationIDs: ["workflow_outcomes"]),
                AttributedBullet("A broad goal describes the direction of care. An expected outcome describes an observable patient response and when it will be evaluated. Choose the outcome before deciding how to pursue it.", citationIDs: ["workflow_outcomes"])
            ]),
            .bullets(title: "Make outcomes measurable", [
                AttributedBullet("Include one clear outcome in each statement so that success can be judged separately. Use an observable behavior or measurement instead of vague terms such as better or adequate.", citationIDs: ["workflow_outcomes"]),
                AttributedBullet("Make the outcome achievable and relevant to the person’s condition and resources. Consider barriers such as pain, limited mobility, access to support and understanding of the plan.", citationIDs: ["workflow_outcomes"]),
                AttributedBullet("Choose a realistic time frame for the setting and condition. A short-term hospital goal and a longer-term community goal may require different evaluation intervals; there is no single schedule for every plan.", citationIDs: ["workflow_outcomes"])
            ]),
            .bullets(title: "Evaluate the response", [
                AttributedBullet("Compare reassessment findings with the expected outcome and its time frame. Record whether it was met, partly met or not met, with the observations that support that judgment.", citationIDs: ["workflow_evaluation"]),
                AttributedBullet("Completing an intervention and achieving an outcome are different observations. Evaluation asks whether the patient’s condition or ability changed in the intended way.", citationIDs: ["workflow_evaluation"])
            ]),
            .bullets(title: "When progress is limited", [
                AttributedBullet("Review changes in the patient’s condition, unexpected events, barriers to implementation and whether the original goal was realistic. Reconsider whether the planned interventions address the current priority.", citationIDs: ["workflow_evaluation"]),
                AttributedBullet("Revise the goal, time frame or interventions when the findings show that the plan is no longer appropriate. New priorities may require an updated plan before the original review time.", citationIDs: ["workflow_evaluation"])
            ]),
            .bullets(title: "Keep reassessment continuous", [
                AttributedBullet("New assessment findings, conversations with the team and updated diagnostic results can all change the evaluation. Bring those observations into the plan rather than waiting for a routine documentation interval.", citationIDs: ["workflow_evaluation"]),
                AttributedBullet("Document the reassessment, progress toward outcomes and changes to the plan in the clinical record. Evaluation should guide the next cycle of care rather than close the process permanently.", citationIDs: ["workflow_evaluation"])
            ])
        ],
        citations: [workflow_outcomes, workflow_evaluation],
        lastSourceFidelityReview: "2026-09-17"
    )
}
