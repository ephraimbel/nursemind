import Foundation

private let du_depth_bph = CitationSource(
    id: "du_depth_bph", shortName: "NIDDK — Enlarged prostate",
    detail: "June 2024. Symptoms, medicine contributors, evaluation, conservative care, treatment categories, postoperative catheter and complications. No independent prescribing or screening schedule. Original NIDDK federal educational prose adapted and condensed by NurseMind. Images, videos, third-party publications in the bibliography and procedural dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/prostate-problems/prostate-enlargement-benign-prostatic-hyperplasia", lastRetrieved: "2026-09-17"
)

private let du_depth_prostate_tests = CitationSource(
    id: "du_depth_prostate_tests", shortName: "NIDDK — Prostate tests",
    detail: "March 2023. PSA limitations only: false results and elevated PSA from cancer or benign conditions. No claim that PSA or digital rectal examination rules out cancer; no screening or prostate-massage instructions. Original NIDDK federal educational prose adapted and condensed by NurseMind. Images, videos, third-party publications in the bibliography and procedural dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/diagnostic-tests/prostate", lastRetrieved: "2026-09-17"
)

private let du_depth_hematuria = CitationSource(
    id: "du_depth_hematuria", shortName: "NIDDK — Blood in the urine",
    detail: "October 2022. Visible and microscopic blood, causes, symptom history, repeat testing, menstruation contamination and cause-directed follow-up. Original NIDDK federal educational prose adapted and condensed by NurseMind. Images, videos, third-party publications in the bibliography and procedural dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/hematuria-blood-urine", lastRetrieved: "2026-09-17"
)

private let du_depth_retention_symptoms = CitationSource(
    id: "du_depth_retention_symptoms", shortName: "NIDDK — Urinary retention symptoms",
    detail: "December 2019. Acute and chronic symptom patterns and immediate evaluation for inability to urinate or severe abdominal pain. No catheter insertion or irrigation instructions. Original NIDDK federal educational prose adapted and condensed by NurseMind. Images, videos, third-party publications in the bibliography and procedural dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/urinary-retention/symptoms-causes", lastRetrieved: "2026-09-17"
)

public enum DUDepthBphSymptomTreatmentFollowUpSample {
    public static let entry = ReferenceEntry(
        id: "bph-symptom-treatment-follow-up", title: "BPH: symptom assessment and treatment follow-up",
        subtitle: "Bladder emptying, medicines, conservative care and procedures", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Assess symptoms as well as prostate size", [
                AttributedBullet("Benign prostatic hyperplasia is noncancerous enlargement of the prostate. Compression of the urethra can make the bladder work harder and eventually contribute to incomplete emptying.", citationIDs: ["du_depth_bph"]),
                AttributedBullet("A large prostate may cause few symptoms, while a smaller enlargement may cause substantial difficulty. Ask about hesitancy, weak or interrupted flow, dribbling, urgency, frequency, nighttime urination and the effect on daily life.", citationIDs: ["du_depth_bph"])
            ]),
            .bullets(title: "Review contributors and competing causes", [
                AttributedBullet("Cold and cough products containing decongestants or antihistamines, as well as some tranquilizers, antidepressants or diuretics, can worsen urinary symptoms. Include over-the-counter products in the medicine history.", citationIDs: ["du_depth_bph"]),
                AttributedBullet("Urinary symptoms may also reflect infection, prostatitis, bladder problems or prostate cancer. Report symptoms for assessment rather than assuming that a prior BPH diagnosis explains every new change.", citationIDs: ["du_depth_bph"])
            ]),
            .bullets(title: "Recognize urgent urinary problems", [
                AttributedBullet("Prompt evaluation is needed when the person cannot urinate at all, has blood in the urine, has severe lower abdominal or urinary-tract pain, or has painful urgent and frequent urination with fever and chills.", citationIDs: ["du_depth_bph"]),
                AttributedBullet("Possible complications of BPH include urinary retention, repeated infection, bladder stones and kidney disease. These concerns should be communicated during follow-up rather than treated solely as inconvenience from aging.", citationIDs: ["du_depth_bph"])
            ]),
            .bullets(title: "Understand the evaluation and PSA limits", [
                AttributedBullet("Evaluation combines the medical and family history, examination and selected tests such as urinalysis, urodynamics, cystoscopy, ultrasound or prostate tests. Describe onset, frequency, previous infections, medicines and usual fluid, caffeine and alcohol intake.", citationIDs: ["du_depth_bph"])
            ]),
            .bullets(title: "Interpret prostate testing in context", [
                AttributedBullet("An elevated prostate-specific antigen, or PSA, can occur with prostate cancer or with noncancerous problems such as BPH or prostatitis. PSA testing can produce false-positive and false-negative results.", citationIDs: ["du_depth_prostate_tests"]),
                AttributedBullet("The clinician considers the result and its trend alongside the rest of the evaluation. A PSA value alone does not establish the cause of urinary symptoms or exclude cancer.", citationIDs: ["du_depth_prostate_tests"])
            ]),
            .bullets(title: "Support the selected conservative plan", [
                AttributedBullet("When symptoms have little effect on quality of life, watchful waiting with follow-up may be appropriate. Advice may include regular activity, avoiding prolonged holding of urine and changing the timing of evening fluids.", citationIDs: ["du_depth_bph"]),
                AttributedBullet("Reducing alcohol or caffeine may help symptoms. Discuss the individual plan and medicine contributors with the clinician rather than independently stopping treatment or imposing a fixed daily fluid restriction.", citationIDs: ["du_depth_bph"])
            ]),
            .bullets(title: "Explain treatment categories and monitoring", [
                AttributedBullet("Prescribed options include alpha blockers that relax outlet muscles, medicines that reduce prostate growth and other selected agents. Procedures can widen the urinary passage or remove obstructing prostate tissue when indicated.", citationIDs: ["du_depth_bph"]),
                AttributedBullet("Treatment depends on symptom burden, response and complications. Report adverse effects and persistent difficulty urinating so the clinician can reassess the plan; this guide does not choose a drug, dose or operation.", citationIDs: ["du_depth_bph"])
            ]),
            .bullets(title: "Review recovery after a BPH procedure", [
                AttributedBullet("Swelling after surgery may make urination difficult, and a temporary Foley catheter may be needed. Bladder spasms, urinary urgency or leakage can occur and should be discussed with the surgical team.", citationIDs: ["du_depth_bph"]),
                AttributedBullet("Potential complications include infection, blood or clots in urine, difficult urination, scar-related narrowing and sexual problems. Review the expected recovery, catheter plan and follow-up; symptoms can recur and may require further treatment.", citationIDs: ["du_depth_bph"])
            ])
        ],
        citations: [du_depth_bph, du_depth_prostate_tests],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DUDepthHematuriaAssessmentFollowUpSample {
    public static let entry = ReferenceEntry(
        id: "hematuria-assessment-follow-up", title: "Hematuria: assessment and diagnostic follow-up",
        subtitle: "Visible blood, specimen context and cause-focused evaluation", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Distinguish visible and microscopic blood", [
                AttributedBullet("Gross hematuria is visible blood in the urine; microscopic hematuria is detected by testing even when the urine looks normal. Visible blood may make urine pink, red or brown.", citationIDs: ["du_depth_hematuria"]),
                AttributedBullet("A small amount of blood can change urine color. Microscopic hematuria often has no symptoms, and gross hematuria may also be painless, so pain and color alone do not establish the seriousness or cause.", citationIDs: ["du_depth_hematuria"])
            ]),
            .bullets(title: "Ask about clots and urinary flow", [
                AttributedBullet("Blood clots can be painful to pass or can block urinary flow. Ask about clots, bladder or back pain and whether urine is passing, rather than documenting color alone.", citationIDs: ["du_depth_hematuria"]),
                AttributedBullet("An assessment for hematuria includes the medical history, physical examination and urinalysis. Communicate associated symptoms and the course of the bleeding so the clinician can choose the next evaluation.", citationIDs: ["du_depth_hematuria"])
            ]),
            .bullets(title: "Escalate possible acute retention", [
                AttributedBullet("Inability to urinate or severe abdominal pain requires immediate medical assessment. Acute urinary retention may also cause an urgent need to void and lower abdominal swelling, and can be life threatening.", citationIDs: ["du_depth_retention_symptoms"]),
                AttributedBullet("A person may also have chronic incomplete emptying with few symptoms, small frequent voids or leakage. These patterns need clinical evaluation; passing small amounts of urine does not establish that the bladder is emptying normally.", citationIDs: ["du_depth_retention_symptoms"])
            ]),
            .bullets(title: "Review possible causes without assuming one", [
                AttributedBullet("Causes include urinary infection or inflammation, stones, trauma, a recent urinary procedure, BPH and vigorous exercise. Kidney disease, urinary-tract cancer and bleeding disorders are other possible explanations.", citationIDs: ["du_depth_hematuria"]),
                AttributedBullet("Medicines such as blood thinners, aspirin and some antibiotics are relevant to the history. A medicine exposure or recent procedure does not, by itself, establish why blood is present; the clinician evaluates the underlying cause.", citationIDs: ["du_depth_hematuria"])
            ]),
            .bullets(title: "Account for specimen context", [
                AttributedBullet("Urinalysis checks a sample for blood, and repeat testing may be needed to confirm the finding. Menstrual blood can contaminate a specimen and create an apparent urinary finding.", citationIDs: ["du_depth_hematuria"]),
                AttributedBullet("When a specimen was collected during menstruation, the clinician may request another sample afterward. Record the collection context and follow the requested repeat-testing plan rather than dismissing or diagnosing hematuria from context alone.", citationIDs: ["du_depth_hematuria"])
            ]),
            .bullets(title: "Explain additional testing", [
                AttributedBullet("Depending on the findings, evaluation may include blood tests, urinary-tract ultrasound, CT or MRI, cystoscopy or kidney biopsy. These studies answer different questions about the kidneys, bladder and urinary pathway.", citationIDs: ["du_depth_hematuria"]),
                AttributedBullet("Cystoscopy views the urethra and bladder, while a kidney biopsy examines kidney tissue microscopically. Explain the purpose of the ordered test and which service will review its result.", citationIDs: ["du_depth_hematuria"])
            ]),
            .bullets(title: "Connect follow-up with the identified cause", [
                AttributedBullet("Treatment addresses the cause of hematuria. Some people do not need treatment when evaluation finds no serious underlying condition; others need care directed at infection, stones, kidney disease or another identified problem.", citationIDs: ["du_depth_hematuria"]),
                AttributedBullet("NIDDK has not identified a diet that causes or prevents hematuria. Do not substitute a dietary remedy for completing the recommended assessment and review of results.", citationIDs: ["du_depth_hematuria"])
            ])
        ],
        citations: [du_depth_hematuria, du_depth_retention_symptoms],
        lastSourceFidelityReview: "2026-09-17"
    )
}
