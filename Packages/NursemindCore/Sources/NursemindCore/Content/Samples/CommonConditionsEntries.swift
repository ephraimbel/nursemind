import Foundation

// Publication requires independent clinical review; the opt-in flag is for local review only.
enum CommonConditionsDrafts {
    static let entries: [LibraryEntry] = {
#if DEBUG && COMMON_CONDITIONS_REVIEW
        return [
            .diagnosis(entry0),
            .diagnosis(entry1),
            .diagnosis(entry2),
            .reference(entry3),
            .reference(entry4),
            .reference(entry5),
            .diagnosis(entry6),
            .diagnosis(entry7),
            .reference(entry8),
            .reference(entry9),
            .reference(entry10),
            .reference(entry11),
            .reference(entry12),
            .reference(entry13),
            .reference(entry14),
            .reference(entry15),
            .reference(entry16),
            .reference(entry17)
        ]
#else
        return []
#endif
    }()

    static func entryIDs(for topic: String) -> [String] {
#if DEBUG && COMMON_CONDITIONS_REVIEW
        switch topic {
        case "behavioral-health": return ["reference:insomnia-cbt-i-follow-up", "reference:smoking-cessation-treatment-support"]
        case "blood-infection": return ["reference:iron-deficiency-treatment-follow-up"]
        case "cardiovascular": return ["diagnosis:hypertension", "reference:hypertension-medication-follow-up", "diagnosis:dyslipidemia"]
        case "community-home-care": return ["diagnosis:type-2-diabetes", "diagnosis:hypertension", "diagnosis:obesity", "reference:diabetes-sick-day-safety", "reference:hypertension-medication-follow-up", "reference:obesity-long-term-care", "diagnosis:dyslipidemia", "diagnosis:chronic-constipation", "reference:ibs-symptom-follow-up", "reference:insomnia-cbt-i-follow-up", "reference:smoking-cessation-treatment-support", "reference:masld-fibrosis-follow-up", "reference:migraine-prevention-follow-up", "reference:osteoarthritis-treatment-follow-up", "reference:osteoporosis-treatment-continuity", "reference:recurrent-uti-prevention-follow-up"]
        case "endocrine-metabolic": return ["diagnosis:type-2-diabetes", "diagnosis:obesity", "reference:diabetes-sick-day-safety", "reference:obesity-long-term-care", "diagnosis:dyslipidemia", "reference:masld-fibrosis-follow-up"]
        case "gastrointestinal": return ["diagnosis:chronic-constipation", "reference:ibs-symptom-follow-up", "reference:masld-fibrosis-follow-up", "reference:gerd-treatment-reassessment"]
        case "labs-specimens": return ["reference:iron-deficiency-treatment-follow-up"]
        case "medication-transfusion-safety": return ["reference:diabetes-sick-day-safety", "reference:hypertension-medication-follow-up", "reference:migraine-prevention-follow-up", "reference:gerd-treatment-reassessment", "reference:iron-deficiency-treatment-follow-up", "reference:osteoporosis-treatment-continuity"]
        case "musculoskeletal-skin": return ["reference:osteoarthritis-treatment-follow-up", "reference:osteoporosis-treatment-continuity"]
        case "neurological": return ["reference:migraine-prevention-follow-up"]
        case "nutrition-elimination": return ["diagnosis:obesity", "reference:obesity-long-term-care", "diagnosis:chronic-constipation", "reference:ibs-symptom-follow-up", "reference:masld-fibrosis-follow-up", "reference:gerd-treatment-reassessment", "reference:iron-deficiency-treatment-follow-up", "reference:recurrent-uti-prevention-follow-up"]
        case "older-adult-care": return ["reference:osteoarthritis-treatment-follow-up", "reference:osteoporosis-treatment-continuity"]
        case "renal-urinary": return ["reference:recurrent-uti-prevention-follow-up"]
        case "respiratory": return ["reference:smoking-cessation-treatment-support"]
        case "skin-mobility-comfort": return ["reference:osteoarthritis-treatment-follow-up"]
        default: return []
        }
#else
        return []
#endif
    }

#if DEBUG && COMMON_CONDITIONS_REVIEW
    private static let entry0 = DiagnosisEntry(
        id: "type-2-diabetes",
        title: "Type 2 diabetes mellitus",
        subtitle: "Diagnosis, complication surveillance and comprehensive risk reduction",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .glucoseRegulation),
        definition: .init("Type 2 diabetes is chronic hyperglycemia caused by inadequate insulin action and an insulin supply that does not meet the body’s needs. It can be present for years before recognition. Nursing care includes glucose safety, cardiovascular and kidney risk reduction, complication surveillance and support for daily self-management.", citationIDs: ["common_conditions_t2dm"]),
        pathophysiology: .init("Insulin normally helps glucose enter cells. In type 2 diabetes, tissues respond less effectively and the pancreas cannot provide enough insulin to compensate, leaving excess glucose in the circulation. Genetic susceptibility, excess adiposity and physical inactivity can contribute. Over time, diabetes can damage blood vessels, kidneys, eyes and peripheral nerves.", citationIDs: ["common_conditions_t2dm"]),
        presentation: [
            .init("Many people have few symptoms. Possible findings include thirst, frequent urination, fatigue, blurred vision, unexplained weight loss, slow-healing sores and distal numbness or tingling. An absence of thirst or polyuria does not exclude disease; some people first present with an established complication.", citationIDs: ["common_conditions_t2dm"])
        ],
        diagnosticCriteria: [
            .init("For nonpregnant adults, diabetes criteria include laboratory A1C ≥6.5%; fasting plasma glucose ≥126 mg/dL after at least 8 hours without calories; or 2-hour plasma glucose ≥200 mg/dL during a 75-g oral glucose tolerance test. Random plasma glucose ≥200 mg/dL is diagnostic with classic hyperglycemic symptoms or a hyperglycemic crisis.", citationIDs: ["common_conditions_ada_diagnosis"]),
            .init("Without unequivocal symptomatic hyperglycemia, confirmation requires two abnormal results from the same test or different tests. Discordant results require follow-up of the abnormal test. A1C may misrepresent glycemia with altered red-cell turnover or certain hemoglobin variants; plasma glucose criteria are then preferred. CGM is not an established diagnostic test.", citationIDs: ["common_conditions_ada_diagnosis"]),
            .init("Glucose criteria establish diabetes but do not identify its type. ADA recommends standardized islet autoantibody testing when adult features overlap with type 1 diabetes, such as unintentional weight loss, ketoacidosis or a short interval to insulin treatment. Adult age alone does not settle classification.", citationIDs: ["common_conditions_ada_diagnosis"])
        ],
        priorityAssessments: [
            .init("A comprehensive review includes cardiovascular disease and heart-failure history, blood pressure, lipids, kidney function and albuminuria, eye care, neuropathy and foot status. The assessment also addresses oral health, immunizations, psychological well-being and the person’s ability to carry out the treatment plan. Existing complications change follow-up priorities.", citationIDs: ["common_conditions_ada_evaluation"]),
            .init("Ask about food and housing security, insurance, medication cost, transport, preferred language and available support. Difficulty obtaining supplies or taking medicine may reflect access barriers. Coordinated diabetes education, pharmacy support, community resources and appropriate care-partner involvement help make the agreed plan achievable.", citationIDs: ["common_conditions_ada_social"])
        ],
        commonInterventions: [
            .init("The 2026 ADA approach selects treatment around cardiovascular and kidney disease, heart failure, weight goals, hypoglycemia risk, tolerability and access. In established or high-risk atherosclerotic disease, agents with demonstrated cardiovascular benefit may be indicated irrespective of A1C. A glucose result alone does not determine which drug is appropriate.", citationIDs: ["common_conditions_ada_pharmacology"]),
            .init("In SOUL, 9,650 people with type 2 diabetes and atherosclerotic cardiovascular disease, chronic kidney disease or both received oral semaglutide or placebo. Over a median 49.5 months, major cardiovascular events occurred in 12.0% versus 13.8% (hazard ratio 0.86; 95% CI 0.77–0.96). This supports cardiovascular benefit in the studied high-risk population; it does not establish the same absolute benefit for all newly diagnosed adults.", citationIDs: ["common_conditions_soul"]),
            .init("Glucose goals are individualized. Recurrent hypoglycemia, treatment burden, comorbidities and functional limitations can justify a less intensive plan. Nursing follow-up should make low-glucose episodes visible to the treating team and confirm that glucose monitoring, education and medication use match the current agreed goals.", citationIDs: ["common_conditions_ada_goals"])
        ],
        watchFor: [
            .init("Insulin and some insulin-releasing medicines can cause hypoglycemia. Rapid-onset shaking, hunger, palpitations, confusion or impaired speech may precede seizure or unconsciousness; some people have little warning. Severe events require immediate treatment through the emergency plan and subsequent review of the medication regimen.", citationIDs: ["common_conditions_hypoglycemia"]),
            .init("Vomiting, abdominal pain, dehydration, abnormal breathing or altered mental status can indicate a hyperglycemic crisis. Ketoacidosis can also occur in type 2 diabetes, including with SGLT2 inhibitors when glucose is not markedly elevated. These findings need urgent clinical assessment rather than routine outpatient glucose follow-up.", citationIDs: ["common_conditions_crises"])
        ],
        citations: [CommonConditionsSources.t2dm, CommonConditionsSources.ada_diagnosis, CommonConditionsSources.ada_evaluation, CommonConditionsSources.ada_social, CommonConditionsSources.ada_pharmacology, CommonConditionsSources.soul, CommonConditionsSources.ada_goals, CommonConditionsSources.hypoglycemia, CommonConditionsSources.crises],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry1 = DiagnosisEntry(
        id: "hypertension",
        title: "Hypertension in adults",
        subtitle: "Measurement, cardiovascular risk and ongoing nursing assessment",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        definition: .init("Hypertension is persistently excessive pressure within the arteries. It commonly causes no early symptoms but increases the likelihood of cardiovascular, cerebrovascular and kidney injury. Recognition therefore depends on reliable measurement and follow-up, rather than waiting for a headache or other subjective warning.", citationIDs: ["common_conditions_bp_overview"]),
        pathophysiology: .init("Arterial stiffness, inherited susceptibility and the interaction of lifestyle and environmental factors influence blood pressure. Kidney disease, sleep apnea, endocrine disorders and certain medicines can contribute. Dietary sodium, alcohol, inactivity, inadequate sleep and chronic stress are relevant to assessment, while financial and neighborhood conditions can affect the ability to change these exposures.", citationIDs: ["common_conditions_bp_causes"]),
        presentation: [
            .init("Routine hypertension may be discovered during screening in a person who feels well. Complications can involve the heart, brain, kidneys, retina and aorta. The severity of a measured elevation and the presence of new symptoms both matter when deciding how urgently the person needs evaluation.", citationIDs: ["common_conditions_bp_symptoms"])
        ],
        diagnosticCriteria: [
            .init("Adult categories are normal: systolic <120 and diastolic <80 mm Hg; elevated: systolic 120–129 with diastolic <80; stage 1: systolic 130–139 or diastolic 80–89; stage 2: systolic ≥140 or diastolic ≥90. Classification uses the higher category when the two components differ.", citationIDs: ["common_conditions_bp_diagnosis"]),
            .init("A single routine reading is insufficient to establish persistent hypertension. Repeat standardized measurements and consider home or ambulatory results. White-coat hypertension describes higher office pressure than outside the clinic; masked hypertension describes the opposite pattern. Both patterns can change interpretation of apparently reassuring or abnormal office measurements.", citationIDs: ["common_conditions_bp_diagnosis"])
        ],
        priorityAssessments: [
            .init("Measurement preparation includes a correctly sized cuff on the bare upper arm, quiet seated rest, supported arm at heart level and feet on the floor. Recent exercise, smoking, caffeine, talking or a full bladder can distort readings. Technique should be checked before interpreting an unexpected trend.", citationIDs: ["common_conditions_bp_diagnosis"]),
            .init("Medication reconciliation should include nonprescription decongestants, NSAIDs, hormonal medicines and stimulants, as well as prescribed drugs. Explore sleep-apnea symptoms, kidney or thyroid history, alcohol exposure and barriers to taking medicines. A possible contributing drug or condition needs prescriber assessment rather than an assumption of nonadherence.", citationIDs: ["common_conditions_bp_causes"])
        ],
        commonInterventions: [
            .init("The 2025 AHA/ACC guideline generally aims for blood pressure <130/80 mm Hg, with additional considerations for pregnancy, limited life expectancy and institutional care. Medication is recommended at average ≥140/90, or selected averages ≥130/80 with cardiovascular disease, prior stroke, diabetes, CKD or PREVENT 10-year risk ≥7.5%. These are clinical decision thresholds, not automatic nursing medication orders.", citationIDs: ["common_conditions_aha_bp"]),
            .init("Treatment combines an achievable lifestyle plan with prescribed medicines when indicated. DASH-style eating, reduced sodium, appropriate activity, smoking cessation, sleep and alcohol counseling are relevant. ACE inhibitors, ARBs, calcium-channel blockers and thiazide diuretics lower pressure through different mechanisms; comorbid disease and tolerability influence selection.", citationIDs: ["common_conditions_bp_treatment"]),
            .init("BPROAD studied 12,821 adults aged 50 or older with type 2 diabetes and elevated cardiovascular risk in China. A systolic target <120 versus <140 mm Hg reduced major cardiovascular events (hazard ratio 0.79; 95% CI 0.69–0.90) over median 4.2-year follow-up. Symptomatic hypotension and hyperkalemia were more frequent with intensive treatment. The findings require individualized benefit–risk interpretation.", citationIDs: ["common_conditions_bproad"]),
            .init("Long-term care includes regular appointments, review of home readings, medication access and discussion of new diagnoses or side effects. A regimen may need adjustment over time. Reminder systems, refill support and an agreed role for family or community support can help maintain the treatment plan.", citationIDs: ["common_conditions_bp_followup"])
        ],
        watchFor: [
            .init("Sudden focal weakness, speech or vision change, severe chest or back pain, marked breathlessness or a sudden severe headache may signal acute organ injury. These symptoms require emergency assessment, including when blood pressure is very high; the blood-pressure value alone cannot establish the cause.", citationIDs: ["common_conditions_bp_symptoms"]),
            .init("Severe hypertension above 180/120 mm Hg without acute target-organ damage is distinct from hypertensive emergency. The 2025 guideline calls for timely evaluation and oral-treatment management in the outpatient setting for nonpregnant people without acute injury. Suspected organ damage changes urgency and setting; pregnancy requires its own pathway.", citationIDs: ["common_conditions_aha_bp"])
        ],
        citations: [CommonConditionsSources.bp_overview, CommonConditionsSources.bp_causes, CommonConditionsSources.bp_symptoms, CommonConditionsSources.bp_diagnosis, CommonConditionsSources.aha_bp, CommonConditionsSources.bp_treatment, CommonConditionsSources.bproad, CommonConditionsSources.bp_followup],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry2 = DiagnosisEntry(
        id: "obesity",
        title: "Obesity in adults",
        subtitle: "Adiposity, functional impact and evidence-based treatment options",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        definition: .init("Obesity is a chronic, often relapsing disease involving excess adiposity and metabolic, physical or psychosocial complications. Assessment and treatment should use person-centered language and consider health outcomes, function and preferences. Weight management can be an important component of diabetes prevention and treatment, alongside management of glucose and other risks.", citationIDs: ["common_conditions_ada_obesity"]),
        pathophysiology: .init("Body weight reflects interacting biological, behavioral and environmental influences. Genes affect appetite and fat distribution; sleep, stress and some medicines can contribute to weight gain. Food affordability, safe activity space, workplace demands and access to care shape what changes are practical. Endocrine disease and eating disorders may warrant separate evaluation.", citationIDs: ["common_conditions_obesity_causes"]),
        presentation: [
            .init("Associated conditions can include type 2 diabetes, hypertension, cardiovascular disease, sleep apnea, fatty liver disease, osteoarthritis and kidney disease. Symptoms may arise from these complications, such as sleep disruption or limited mobility, rather than from a particular body weight. The assessment should identify the person’s actual health problems.", citationIDs: ["common_conditions_obesity_risks"]),
            .init("Begin with the person’s main concern and ask permission to discuss weight. Explore weight history, eating patterns, activity, prior treatment and possible eating-disorder symptoms without blame. A high BMI should not cause an unrelated symptom to be dismissed or prevent evaluation of another condition.", citationIDs: ["common_conditions_obesity_conversation"])
        ],
        diagnosticCriteria: [
            .init("For adults aged 20 and older, BMI 25–29.9 kg/m² is categorized as overweight and BMI ≥30 as obesity; BMI ≥40 is severe obesity in the NIDDK classification. These adult thresholds are not pediatric growth-chart criteria. BMI combines height and weight and is an indirect measure.", citationIDs: ["common_conditions_obesity_definition"]),
            .init("BMI and waist size do not directly measure body fat or fully describe an individual’s health risk. Interpretation includes age, history, cardiometabolic risks and current health. Weight loss is not automatically the appropriate goal for every adult above a BMI threshold; preventing additional gain may sometimes be a suitable agreed goal.", citationIDs: ["common_conditions_obesity_conversation"])
        ],
        priorityAssessments: [
            .init("Review blood pressure, glucose and lipid status, sleep-apnea symptoms, pain and mobility, and relevant kidney or liver disease. Mood, body image and experiences of weight bias also affect well-being. The same amount of weight change can have different significance depending on the complications being followed.", citationIDs: ["common_conditions_obesity_risks"]),
            .init("Review medicines that can promote weight gain, including some diabetes, psychiatric, seizure and steroid treatments. Their therapeutic benefits remain relevant; identifying an association supports a prescriber discussion about options. Assessment of sleep, food access, stress and physical limitations helps explain barriers that a calorie target alone would miss.", citationIDs: ["common_conditions_obesity_causes"])
        ],
        commonInterventions: [
            .init("A structured program includes an individualized eating plan, appropriate physical activity, repeated behavioral support and a maintenance strategy. A sustainable plan should fit health status, cultural preferences and resources. Physical activity has health benefits even when the scale changes little; progress can include greater endurance or improved daily function.", citationIDs: ["common_conditions_obesity_program"]),
            .init("Prescription weight-management medicines may be considered for adults with BMI ≥30, or ≥27 with weight-related health problems, alongside lifestyle support. Selection depends on medical history, other medicines, likely benefit, adverse effects and cost. Eligibility is not a recommendation for a particular product, and pregnancy or pregnancy planning changes medication suitability.", citationIDs: ["common_conditions_obesity_medications"]),
            .init("SURMOUNT-5 randomized 751 adults with obesity without type 2 diabetes to tirzepatide or semaglutide in an open-label trial. At 72 weeks, mean weight change was −20.2% versus −13.7%; gastrointestinal events were most common, often during escalation. This is a weight-loss comparison in a defined population, not proof of superior cardiovascular outcomes or identical results in diabetes.", citationIDs: ["common_conditions_surmount5"]),
            .init("ADA 2026 recommends tailoring behavioral, medication and metabolic-surgery options to medical history, circumstances and preferences. In people with diabetes, weight and glycemic management are complementary goals. Continued follow-up remains necessary after initial improvement because obesity commonly recurs and treatment needs can change.", citationIDs: ["common_conditions_ada_obesity"])
        ],
        watchFor: [
            .init("Persistent or concerning adverse effects require review against the actual product label and treatment plan. Medication risks differ between products; a general obesity overview cannot supply a universal dose-escalation, stopping or pregnancy plan. Unregulated products and medicine obtained outside an appropriate pharmacy pathway add avoidable uncertainty.", citationIDs: ["common_conditions_obesity_medications"]),
            .init("Eating-disorder symptoms, distress or a treatment plan that the person cannot sustain merit reassessment and appropriate specialist support. Track function and health improvements as well as weight. A setback is a reason to revise goals and resources together, rather than assign blame.", citationIDs: ["common_conditions_obesity_conversation"])
        ],
        citations: [CommonConditionsSources.ada_obesity, CommonConditionsSources.obesity_causes, CommonConditionsSources.obesity_risks, CommonConditionsSources.obesity_conversation, CommonConditionsSources.obesity_definition, CommonConditionsSources.obesity_program, CommonConditionsSources.obesity_medications, CommonConditionsSources.surmount5],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry3 = ReferenceEntry(
        id: "diabetes-sick-day-safety",
        title: "Diabetes sick-day safety",
        subtitle: "A written plan for glucose, ketones, hydration and timely escalation",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .glucoseRegulation),
        sections: [
            .bullets(title: "Why illness changes the plan", [
            .init("Illness-related hormones can raise glucose even when food intake falls. Vomiting or diarrhea may also impair intake and hydration. These competing effects mean a person can develop high or low glucose during the same illness. A usual meal pattern or a single in-range reading does not show that the illness is safe to manage without reassessment.", citationIDs: ["common_conditions_sick_days"]),
            .init("ADA 2026 recommends reassessing glucose-monitoring frequency during illness and adding blood or urine ketone monitoring for people prone to ketosis. The written plan should identify when the treating team must reassess therapy. There is no single medicine-continuation rule suitable for every drug and every illness.", citationIDs: ["common_conditions_ada_goals"])
        ]),
            .bullets(title: "Keep a useful illness record", [
            .init("A sick-day record can track glucose results, temperature, fluid and food intake, and episodes of vomiting or diarrhea. Keep monitoring supplies and accessible food available before illness starts. Changes in alertness or the ability to drink and self-monitor should be communicated along with the glucose readings.", citationIDs: ["common_conditions_sick_days"])
        ]),
            .bullets(title: "Medication review is specific to the illness", [
            .init("Poor oral intake or concern for acute kidney injury can require clinician-directed interruption of metformin or an SGLT2 inhibitor. Significant gastrointestinal illness can affect GLP-1 therapy; heart-failure exacerbation changes the safety of thiazolidinediones. Document which medicine was changed, by whom and the follow-up needed, rather than extending one drug’s advice to the whole regimen.", citationIDs: ["common_conditions_ada_goals"]),
            .init("Basal insulin remains essential for people with type 1 diabetes, including when hospitalized or transitioning between settings. In acute care, SGLT2 inhibitors are avoided with severe illness, ketosis or prolonged fasting. Outpatient and inpatient instructions must be reconciled with the prescriber; this guide does not generate insulin adjustments.", citationIDs: ["common_conditions_ada_hospital"])
        ]),
            .bullets(title: "Recognize deterioration early", [
            .init("SGLT2-associated ketoacidosis may occur with near-normal or only moderately elevated glucose. Nausea, vomiting, abdominal pain, dehydration, deep breathing or altered consciousness require assessment in context. A glucose value that is below the usual marked-hyperglycemia range cannot exclude ketoacidosis; evaluation also considers ketones and acid–base status.", citationIDs: ["common_conditions_crises"]),
            .init("Trouble breathing, inability to keep fluids down, persistent vomiting or diarrhea, or ketones during illness are reasons for urgent contact or emergency assessment under the sick-day plan. Reduced alertness can impair safe self-care. A support person may need to help contact the team or arrange emergency assistance.", citationIDs: ["common_conditions_sick_days"])
        ]),
            .bullets(title: "Prevent low-glucose harm", [
            .init("Eating less while using insulin or insulin-releasing medicines can increase hypoglycemia risk. Review access to a glucose meter and the prescribed low-glucose rescue plan. Confusion, seizure or loss of consciousness represents severe deterioration requiring immediate help; the person may be unable to recognize the problem or treat it independently.", citationIDs: ["common_conditions_hypoglycemia"])
        ]),
            .bullets(title: "Make the plan usable before discharge", [
            .init("A written plan is only useful when the person can obtain supplies, food, medications and help. Assess language, literacy, vision, dexterity and available support as relevant. Arrange diabetes education, pharmacy or community assistance for identified barriers, and confirm how the person can reach the treating team when the usual clinic is closed.", citationIDs: ["common_conditions_ada_social"])
        ])
        ],
        citations: [CommonConditionsSources.sick_days, CommonConditionsSources.ada_goals, CommonConditionsSources.ada_hospital, CommonConditionsSources.crises, CommonConditionsSources.hypoglycemia, CommonConditionsSources.ada_social],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry4 = ReferenceEntry(
        id: "hypertension-medication-follow-up",
        title: "Hypertension medication follow-up",
        subtitle: "Response, tolerability, kidney monitoring and practical continuity",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Connect the prescription to its purpose", [
            .init("Blood-pressure medicines act through different pathways: ACE inhibitors and ARBs reduce vessel constriction, calcium-channel blockers relax vascular muscle, and diuretics increase water and sodium removal. More than one class may be needed. A combination tablet can contain more than one active drug, so reconciliation should identify the actual ingredients and prescribed schedule.", citationIDs: ["common_conditions_bp_treatment"]),
            .init("Follow-up should review current medicines, refill access, reported side effects, new health conditions and the home measurement record. Clarify changes made by different clinicians. Regular checks remain necessary when the person feels well, because absence of symptoms does not show whether long-term treatment is adequate.", citationIDs: ["common_conditions_bp_followup"])
        ]),
            .bullets(title: "Interpret the response with measurement context", [
            .init("The 2025 guideline supports standardized home monitoring paired with frequent team contact. Cuffless smartwatch readings should not substitute for a validated measurement approach. Treatment targets depend on the agreed clinical plan; an isolated reading does not by itself establish the need for a dose change.", citationIDs: ["common_conditions_aha_bp"])
        ]),
            .bullets(title: "Monitor kidney function when indicated", [
            .init("For people with CKD starting or increasing an ACE inhibitor or ARB, KDIGO recommends checking blood pressure, serum creatinine and potassium within 2–4 weeks, with timing informed by baseline kidney function and potassium. This is CKD-specific guidance; higher-risk clinical circumstances may require an earlier plan from the treating team.", citationIDs: ["common_conditions_kdigo"]),
            .init("A creatinine rise greater than 30% within 4 weeks warrants clinical evaluation. KDIGO also emphasizes addressing hyperkalemia where possible rather than reflexively abandoning beneficial RAS inhibition. These findings require prescriber interpretation, including symptoms and reversible causes; the reference does not supply automatic medication hold or restart orders.", citationIDs: ["common_conditions_kdigo"])
        ]),
            .bullets(title: "Capture tolerability as well as the number", [
            .init("Ask about dizziness, fainting, weakness, blurred vision or symptoms after standing. Low pressure can relate to medication effects, dehydration, blood loss or other disease. In older adults, postural or post-meal symptoms can increase fall risk. Document when symptoms occur relative to position, meals and medication use for clinical review.", citationIDs: ["common_conditions_low_bp"]),
            .init("BPROAD illustrates the tradeoff: a lower systolic target reduced cardiovascular events in high-risk adults with type 2 diabetes, but symptomatic hypotension and hyperkalemia occurred more often. Nursing follow-up must therefore track tolerability and ordered laboratory results alongside the pressure trend, rather than treat a lower number as the only outcome.", citationIDs: ["common_conditions_bproad"])
        ]),
            .bullets(title: "Plan continuity and escalation", [
            .init("Agree on who reviews the log, the next appointment and how refills will be obtained. Reminder tools and pharmacy support may help; pregnancy or pregnancy planning must be reported because medication choices may change. New neurologic symptoms, severe chest pain or breathing difficulty need emergency assessment rather than waiting for a scheduled medication review.", citationIDs: ["common_conditions_bp_followup"])
        ])
        ],
        citations: [CommonConditionsSources.bp_treatment, CommonConditionsSources.bp_followup, CommonConditionsSources.aha_bp, CommonConditionsSources.kdigo, CommonConditionsSources.low_bp, CommonConditionsSources.bproad],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry5 = ReferenceEntry(
        id: "obesity-long-term-care",
        title: "Obesity: long-term treatment support",
        subtitle: "Maintenance, treatment burden and outcomes beyond weight",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Set a sustainable follow-up plan", [
            .init("ADA 2026 treats obesity as a chronic condition with possible relapse. For people undergoing active weight-management treatment, it recommends monitoring anthropometric measures at least every 3 months. Follow-up should revisit health goals, treatment response and burden, rather than end as soon as an initial weight target is reached.", citationIDs: ["common_conditions_ada_obesity"]),
            .init("Effective programs include continued support for eating patterns, appropriate activity and maintaining changes. The approach should fit culture, health, preferences and daily resources. Review the proposed maintenance support before enrollment; a program promising dramatic rapid loss without a durable follow-up plan is not equivalent to comprehensive care.", citationIDs: ["common_conditions_obesity_program"])
        ]),
            .bullets(title: "Understand what withdrawal trials show", [
            .init("In SURMOUNT-4, adults without diabetes first received tirzepatide for 36 weeks. The 670 participants then randomized had lost a mean 20.9% of starting weight. Over the next 52 weeks, continued treatment produced an additional 5.5% reduction from randomization weight, while switching to placebo produced 14.0% regain. Those percentages use the randomization weight as the later comparison baseline.", citationIDs: ["common_conditions_surmount4"]),
            .init("This withdrawal design enrolled people who completed the initial treatment period. It supports a maintenance benefit from continued therapy in that selected population, but it does not mean every individual will tolerate ongoing treatment or regain the same amount after stopping. Both groups also received lifestyle support. Access interruptions and adverse effects therefore need an agreed contingency plan.", citationIDs: ["common_conditions_surmount4"])
        ]),
            .bullets(title: "Review tolerability and access", [
            .init("In the 2025 SURMOUNT-5 comparison, gastrointestinal adverse effects were the most frequent events and often appeared during dose escalation. A nursing discussion should capture whether symptoms are affecting eating, drinking or treatment persistence, then connect the person with the prescribing team. The trial’s average weight response cannot replace individual assessment.", citationIDs: ["common_conditions_surmount5"]),
            .init("Cost, insurance coverage, other medicines and adverse effects can influence whether a treatment remains practical. Some people require long-term medication to maintain benefit. Any decision to continue, change or stop a product should include its specific safety information and a follow-up plan; weight regain after discontinuation can occur.", citationIDs: ["common_conditions_obesity_medications"])
        ]),
            .bullets(title: "Measure outcomes that matter to the person", [
            .init("Physical activity can improve health even without a large weight change. Follow-up can examine participation in agreed activities and the ability to sustain nutrition changes, as well as the weight trend. Support should continue when progress slows, with adjustment of the plan to current abilities and resources.", citationIDs: ["common_conditions_obesity_program"]),
            .init("Obesity-related conditions differ in their burden. Sleep apnea, joint pain, diabetes, hypertension and kidney disease may require their own ongoing care even when weight improves. Monitoring should stay connected to those diagnosed conditions and daily function; a lower body weight alone does not demonstrate resolution of every complication.", citationIDs: ["common_conditions_obesity_risks"])
        ])
        ],
        citations: [CommonConditionsSources.ada_obesity, CommonConditionsSources.obesity_program, CommonConditionsSources.surmount4, CommonConditionsSources.surmount5, CommonConditionsSources.obesity_medications, CommonConditionsSources.obesity_risks],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry6 = DiagnosisEntry(
        id: "dyslipidemia",
        title: "Dyslipidemia in adults",
        subtitle: "Lipid patterns, cardiovascular risk and longitudinal treatment assessment",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        definition: .init("Dyslipidemia describes abnormal blood lipids or lipoproteins, including cholesterol and triglycerides. Management aims to reduce atherosclerotic cardiovascular disease (ASCVD) risk over time. The 2026 ACC/AHA guideline considers the lipid pattern, overall risk and duration of exposure when selecting prevention strategies.", citationIDs: ["common_conditions_lipids_2026"]),
        pathophysiology: .init("Excess circulating cholesterol can contribute to plaque accumulation in arteries. Atherosclerosis can affect coronary, carotid and peripheral vessels and eventually cause myocardial infarction, stroke or peripheral artery disease. Follow-up therefore addresses future vascular events as well as whether the laboratory result has improved.", citationIDs: ["common_conditions_lipids_living"]),
        presentation: [
            .init("High LDL cholesterol usually produces no symptoms and is commonly discovered through blood testing. Very high inherited cholesterol may produce skin xanthomas or corneal lipid deposits. Feeling well does not indicate that cholesterol is controlled, and an examination without visible deposits does not replace a lipid panel.", citationIDs: ["common_conditions_lipids_symptoms"])
        ],
        diagnosticCriteria: [
            .init("The lipid panel measures total cholesterol, LDL cholesterol, HDL cholesterol and triglycerides; non-HDL cholesterol is calculated by subtracting HDL from total cholesterol. Review the actual components and the laboratory’s collection instructions, including whether fasting was requested. Diagnosis combines results with medical history, family history and examination.", citationIDs: ["common_conditions_lipids_diagnosis"]),
            .init("For eligible primary-prevention adults, the 2026 guideline uses PREVENT-ASCVD risk estimation. It recommends at least one adult Lp(a) measurement and selective apoB testing; coronary calcium testing can help when a treatment decision remains uncertain. A risk estimate supplements clinical assessment and does not diagnose an acute vascular event.", citationIDs: ["common_conditions_lipids_2026"])
        ],
        priorityAssessments: [
            .init("Ask about family cardiovascular history, diet, activity, current medicines and other vascular risk factors. Document the current treatment list and the context of previous results so the clinician can interpret the lipid pattern alongside potential contributing conditions. A single total-cholesterol number does not describe the entire profile.", citationIDs: ["common_conditions_lipids_diagnosis"]),
            .init("At follow-up, confirm medication use, concerns about adverse effects, planned repeat testing and new health conditions. Reconcile supplements and interacting foods or medicines; grapefruit affects some statins. New muscle pain warrants clinician assessment rather than assuming that every muscle symptom proves permanent statin intolerance.", citationIDs: ["common_conditions_lipids_living"])
        ],
        commonInterventions: [
            .init("Statins reduce cholesterol production in the liver and lower cardiovascular event risk. Healthy eating, activity and weight management remain part of treatment alongside medication. When another disease or medicine contributes to the lipid abnormality, the treating clinician may also address that cause; nursing teaching should reflect the prescribed plan.", citationIDs: ["common_conditions_lipids_treatment"]),
            .init("The 2026 guideline pairs risk-based LDL and non-HDL goals with the percentage LDL reduction. If lifestyle measures and statins are insufficient, options include ezetimibe, bempedoic acid or PCSK9 monoclonal antibodies, selected for the person’s risk and circumstances. LDL lowering alone does not establish identical outcome evidence for every product.", citationIDs: ["common_conditions_lipids_2026"]),
            .init("CLEAR Outcomes (2023) randomized 13,970 statin-intolerant adults with or at high cardiovascular risk to bempedoic acid or placebo. Over a median 40.6 months, the composite of cardiovascular death, nonfatal myocardial infarction, nonfatal stroke or coronary revascularization occurred in 11.7% versus 13.3% (hazard ratio 0.87; 95% CI 0.79–0.96). Gout and gallstones were more frequent; all-cause mortality was not significantly reduced. These results concern the studied population and do not justify replacing tolerated statins automatically.", citationIDs: ["common_conditions_clear_outcomes"])
        ],
        watchFor: [
            .init("Suspected heart attack or stroke requires emergency evaluation rather than waiting for lipid follow-up. Report medication-related symptoms and clarify the next testing date. Patients considering pregnancy need a medication discussion with the prescribing team; treatment changes should be individualized, with the reason and revised plan clearly communicated.", citationIDs: ["common_conditions_lipids_living"])
        ],
        citations: [CommonConditionsSources.lipids_2026, CommonConditionsSources.lipids_living, CommonConditionsSources.lipids_symptoms, CommonConditionsSources.lipids_diagnosis, CommonConditionsSources.lipids_treatment, CommonConditionsSources.clear_outcomes],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry7 = DiagnosisEntry(
        id: "chronic-constipation",
        title: "Chronic constipation in adults",
        subtitle: "Bowel-pattern assessment, reversible causes and refractory-symptom evaluation",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .elimination),
        definition: .init("Constipation includes infrequent bowel movements, hard or lumpy stool, difficult or painful passage, or a sense of incomplete emptying. Persistent symptoms warrant assessment even when stool is passed regularly. Nursing history should describe the person’s usual pattern and the specific difficulty rather than using frequency alone.", citationIDs: ["common_conditions_constipation_symptoms"]),
        pathophysiology: .init("Symptoms may reflect slow colonic transit, impaired pelvic-floor emptying, a functional bowel disorder or several contributors together. Dehydration, reduced activity, inadequate fiber, hypothyroidism, diabetes and neurologic disease can contribute. Opioids, anticholinergics, iron and some calcium-channel blockers can worsen constipation; obstruction is another possible cause.", citationIDs: ["common_conditions_constipation_symptoms"]),
        presentation: [
            .init("Useful observations include symptom duration, bowel frequency, stool appearance, painful evacuation, rectal bleeding and recent weight change. A bowel record collected before the visit can make the pattern clearer. Include abdominal symptoms, current medicines and supplements, prior digestive surgery and family colorectal-cancer history in the assessment.", citationIDs: ["common_conditions_constipation_diagnosis"])
        ],
        diagnosticCriteria: [
            .init("The clinician combines history with examination, including hydration, abdominal distension or tenderness and a rectal examination when indicated. Blood, stool, endoscopic or imaging tests are selected for the clinical question; not every person requires every test. Anorectal manometry and balloon-expulsion testing assess evacuation, while transit studies assess movement through the colon.", citationIDs: ["common_conditions_constipation_diagnosis"]),
            .init("The AGA’s 2026 update advises assessing secondary causes and, for most patients, anorectal function and indicated pelvic-floor biofeedback before calling constipation refractory. Persistent symptoms after an adequate treatment trial require reassessment of the mechanism and treatment actually tried; repeated laxative failure alone does not establish a need for surgery.", citationIDs: ["common_conditions_constipation_aga2026"])
        ],
        priorityAssessments: [
            .init("Review which bowel treatments are actually available and used, alongside diet, activity, toileting habits and medicines that may contribute. A workable routine allows time for evacuation and a response to the urge to defecate. Concerns about a prescribed medicine should be discussed with the clinician before changing it.", citationIDs: ["common_conditions_constipation_treatment"])
        ],
        commonInterventions: [
            .init("Dietary fiber, appropriate fluid intake and regular activity can support bowel function. Scheduled toileting after a meal and comfortable positioning may help. Pelvic-floor biofeedback retrains evacuation when a defecatory disorder is present. Education should explain the purpose of each part of the agreed plan and how its benefit will be assessed.", citationIDs: ["common_conditions_constipation_treatment"]),
            .init("The 2023 AGA/ACG guideline supports polyethylene glycol for adult chronic idiopathic constipation and distinguishes its evidence from weaker recommendations for some alternatives. Prescription options after inadequate response to over-the-counter agents include linaclotide, plecanatide and prucalopride. Treatment choice depends on the cause, tolerability and prescribing assessment; these recommendations do not constitute an obstruction-management plan.", citationIDs: ["common_conditions_constipation_aga2023"]),
            .init("For truly refractory symptoms, the 2026 AGA update emphasizes documenting transit and excluding ongoing pelvic-floor dysfunction before colectomy. Its recommendations are expert best-practice advice, not proof that every advanced intervention benefits every patient. Nursing follow-up can establish whether ordered testing and indicated biofeedback were completed before another escalation discussion.", citationIDs: ["common_conditions_constipation_aga2026"])
        ],
        watchFor: [
            .init("Constipation with persistent abdominal pain, inability to pass gas, vomiting, fever or rectal bleeding needs prompt medical assessment. Unintentional weight loss and symptoms that persist despite self-care also warrant evaluation. These changes should be communicated as new findings rather than attributed automatically to the established bowel pattern.", citationIDs: ["common_conditions_constipation_symptoms"])
        ],
        citations: [CommonConditionsSources.constipation_symptoms, CommonConditionsSources.constipation_diagnosis, CommonConditionsSources.constipation_aga2026, CommonConditionsSources.constipation_treatment, CommonConditionsSources.constipation_aga2023],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry8 = ReferenceEntry(
        id: "ibs-symptom-follow-up",
        title: "IBS: treatment response and follow-up",
        subtitle: "Symptom patterns, dietary trials, gut-directed care and reasons to reassess",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Establish a useful symptom baseline", [
            .init("For an adult with an established irritable bowel syndrome diagnosis, follow-up should describe abdominal pain in relation to defecation, stool frequency and stool appearance. Record which symptoms changed and review medicines, recent infections, diet and stressful events. A change in the bowel pattern deserves assessment in its clinical context.", citationIDs: ["common_conditions_ibs_diagnosis"]),
            .init("IBS treatment may combine dietary change, medicines and psychological therapies. Different symptoms can respond differently: constipation, diarrhea and abdominal pain may require different approaches. Clarify the intended symptom target for the prescribed plan so improvement in one area is not mistaken for resolution of every problem.", citationIDs: ["common_conditions_ibs_treatment"])
        ]),
            .bullets(title: "Dietary trials and nutrition", [
            .init("Soluble fiber may improve IBS symptoms, particularly constipation. Increasing fiber gradually can limit gas and bloating that accompany a sudden increase. Review tolerance during follow-up rather than assuming that a larger amount of any fiber will improve every person’s symptoms; dietitian input can help individualize the approach.", citationIDs: ["common_conditions_ibs_diet"]),
            .init("A low-FODMAP approach is a structured dietary trial to identify symptom-provoking fermentable carbohydrates. NIDDK describes a limited trial followed, when helpful, by gradual food reintroduction. The follow-up discussion should establish what improved and which foods can return; indefinite broad restriction is not the endpoint of that process.", citationIDs: ["common_conditions_ibs_diet"])
        ]),
            .bullets(title: "What a recent dietary trial showed", [
            .init("CARIBS (2024) randomized adults with moderate-to-severe IBS at one Swedish center. Among 294 who began treatment, a clinically meaningful IBS severity-score response at four weeks occurred in 76% receiving low-FODMAP plus traditional dietary advice, 71% receiving a fiber-optimized low-carbohydrate diet and 58% receiving optimized medication. The endpoint was a score reduction of at least 50 points, not cure. The short comparison, single-center setting and open-label medication arm limit generalization; the result does not prescribe a permanent restrictive diet for every patient.", citationIDs: ["common_conditions_ibs_caribs"])
        ]),
            .bullets(title: "Medicines and gut-directed therapies", [
            .init("Medication follow-up should cover the intended benefit, use as prescribed and adverse effects. Treatments used for diarrhea differ from those used for constipation; pain-directed medicines address another target. Persistent symptoms call for a review with the treating clinician rather than unsupervised addition of several products.", citationIDs: ["common_conditions_ibs_treatment"]),
            .init("Cognitive behavioral therapy, gut-directed hypnotherapy and relaxation training are treatment options for IBS symptoms. Explain their symptom-management purpose and help identify an accessible service when they are part of the care plan. Activity, adequate sleep and stress management can also support care alongside other treatments.", citationIDs: ["common_conditions_ibs_treatment"])
        ]),
            .bullets(title: "When the original diagnosis needs reassessment", [
            .init("Rectal bleeding, black tarry stool, anemia or weight loss can point to another disorder and should not be labeled an expected IBS flare. Family history of celiac disease, inflammatory bowel disease or colorectal cancer also changes the assessment. The clinician may select blood, stool or endoscopic tests to investigate these concerns.", citationIDs: ["common_conditions_ibs_diagnosis"])
        ])
        ],
        citations: [CommonConditionsSources.ibs_diagnosis, CommonConditionsSources.ibs_treatment, CommonConditionsSources.ibs_diet, CommonConditionsSources.ibs_caribs],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry9 = ReferenceEntry(
        id: "insomnia-cbt-i-follow-up",
        title: "Insomnia: CBT-I and treatment follow-up",
        subtitle: "Sleep diaries, behavioral treatment, daytime safety and ongoing assessment",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        sections: [
            .bullets(title: "Describe the sleep problem and daytime effect", [
            .init("Assessment includes difficulty falling asleep, awakenings, waking time, symptom duration and daytime functioning. Ask about work-day and day-off schedules, naps, medicines, caffeine, nicotine and alcohol. Snoring or waking with gasping raises a different question from difficulty sleeping alone and should be reported for evaluation.", citationIDs: ["common_conditions_insomnia_diagnosis"]),
            .init("A sleep diary for one to two weeks can document bedtime, waking, naps, daytime sleepiness, exercise and substance use. It helps the clinician identify patterns and compare treatment response. Targeted testing may investigate another sleep disorder or medical contributor; the diary is an assessment aid, not a stand-alone diagnostic test.", citationIDs: ["common_conditions_insomnia_diagnosis"])
        ]),
            .bullets(title: "First-line treatment and access", [
            .init("The 2025 VA/DoD guideline recommends cognitive behavioral therapy for insomnia (CBT-I) and suggests it over medication as first-line treatment. Sleep-hygiene advice alone is insufficient treatment for chronic insomnia. Brief behavioral treatment is an alternative when appropriate; confirm that a referral leads to an actual treatment opportunity.", citationIDs: ["common_conditions_insomnia_va2025"]),
            .init("CBT-I combines cognitive work around sleep-related worry, relaxation, stimulus control and a structured time-in-bed plan. Stimulus control strengthens the association between bed and sleep. The time-in-bed component is adjusted as sleep improves; it is a therapeutic process rather than a general instruction to keep sleeping less.", citationIDs: ["common_conditions_insomnia_treatment"]),
            .init("NHLBI describes in-person, telephone and online delivery by a clinician providing CBT-I. Discuss access and the person’s ability to attend or use the planned format. Supportive habits include a consistent sleep schedule, a quiet dark bedroom and avoiding caffeine, nicotine and alcohol near bedtime. Alcohol can fragment sleep despite initial drowsiness.", citationIDs: ["common_conditions_insomnia_treatment"])
        ]),
            .bullets(title: "Tailor the plan for safety", [
            .init("The 2025 guideline identifies situations requiring adaptation or delay of CBT-I, including excessive daytime sleepiness, nighttime fall risk, bipolar disorder, uncontrolled seizures and acute mental-health symptoms. Sleep restriction can temporarily increase sleepiness. A trained treating professional should tailor the intervention rather than using an unsupervised generic sleep-restriction schedule.", citationIDs: ["common_conditions_insomnia_va2025"]),
            .init("When short-term medication is considered, the guideline emphasizes other sleep disorders, respiratory and cognitive impairment, substance-use history, interactions and a deprescribing plan. It suggests against benzodiazepines, diphenhydramine, trazodone and antipsychotics for chronic insomnia. This is a condition-specific recommendation and does not determine their role for a different indication.", citationIDs: ["common_conditions_insomnia_va2025"])
        ]),
            .bullets(title: "Measure response and reassess", [
            .init("Follow-up should include the sleep diary, daytime concentration, mood, function and medicine adverse effects. Insomnia can increase fall and road-accident risk, so daytime safety matters even when nights seem somewhat better. New or worsening symptoms should reach the treating clinician between scheduled visits.", citationIDs: ["common_conditions_insomnia_living"]),
            .init("Improvement does not necessarily end follow-up. A regular schedule and continued behavioral strategies may remain useful after sleep improves. Clarify the next visit and how to report recurrent symptoms or adverse effects; assess functioning as well as the person’s impression of sleep quality.", citationIDs: ["common_conditions_insomnia_living"])
        ])
        ],
        citations: [CommonConditionsSources.insomnia_diagnosis, CommonConditionsSources.insomnia_va2025, CommonConditionsSources.insomnia_treatment, CommonConditionsSources.insomnia_living],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry10 = ReferenceEntry(
        id: "smoking-cessation-treatment-support",
        title: "Smoking cessation: treatment and follow-up",
        subtitle: "Adult cigarette dependence, counseling, medication support and relapse prevention",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Start with a continuing care plan", [
            .init("Tobacco dependence is a chronic, relapsing condition that often needs repeated treatment and long-term support. Brief advice and continued engagement matter even when someone is not ready to quit. At follow-up, review progress and barriers without treating a return to smoking as a reason to withdraw support.", citationIDs: ["common_conditions_cessation_clinical"]),
            .init("Counseling helps build a quit plan and prepare for stress and urges to smoke. Options include individual or group sessions, telephone coaching and digital support. The US quitline, 1-800-QUIT-NOW, offers free confidential coaching. Confirm that the person knows how to reach the selected service and obtain help between visits.", citationIDs: ["common_conditions_cessation_quit"])
        ]),
            .bullets(title: "Understand the treatment choices", [
            .init("For nonpregnant adults who smoke cigarettes, established treatment includes nicotine replacement, varenicline or bupropion, usually with counseling. Nicotine replacement reduces withdrawal; varenicline partly stimulates nicotine receptors while reducing cigarette reward. Medication choice requires the prescribing team’s assessment of suitability and the person’s preferences.", citationIDs: ["common_conditions_cessation_clinical"]),
            .init("Combination nicotine replacement pairs a long-acting patch with a shorter-acting formulation such as gum or lozenge. The patch provides a steadier background level while the shorter-acting product helps with breakthrough urges. Follow-up should confirm understanding of each product’s role, directions and precautions; this guide does not select a dose or schedule.", citationIDs: ["common_conditions_cessation_combination"]),
            .init("The CDC’s cigarette-cessation medication guidance is not automatically transferable to pregnancy, breastfeeding, adolescents or other tobacco products. These situations require a clinician discussion. For pregnancy, CDC prioritizes behavioral support and describes medication decisions as individualized because evidence about benefits and harms is less certain.", citationIDs: ["common_conditions_cessation_clinical", "common_conditions_cessation_combination"])
        ]),
            .bullets(title: "Withdrawal, triggers and mental health", [
            .init("Common withdrawal experiences include cravings, irritability, restlessness, difficulty concentrating, sleep disturbance and increased appetite. Triggers can involve people, places, routines or emotions associated with smoking. Planning a response to predictable urges, using support and staying active can help; symptoms and coping should be reviewed during follow-up.", citationIDs: ["common_conditions_cessation_withdrawal"]),
            .init("After smoking stops, caffeine remains in the body longer, which can worsen jitteriness or sleep difficulty. Mood changes also warrant attention. Persistent, worsening or unmanageable depression or anxiety needs clinical assessment; thoughts of self-harm require immediate crisis support through 988 or emergency services when danger is immediate.", citationIDs: ["common_conditions_cessation_withdrawal"])
        ]),
            .bullets(title: "Recent study context", [
            .init("A 2025 secondary analysis of a randomized trial examined 6,653 adults with current or past major depressive disorder or no psychiatric disorder. Varenicline, bupropion, nicotine patch or placebo were paired with brief counseling. Moderate-to-severe neuropsychiatric-event risk did not differ by medication within those cohorts; varenicline improved cessation compared with placebo in the current-depression group. The subgroup analysis does not prove absence of individual risk or replace mental-health monitoring.", citationIDs: ["common_conditions_cessation_mdd2025"])
        ]),
            .bullets(title: "Follow-through after a lapse", [
            .init("Repeated attempts are common. Review which triggers, cravings or access problems interfered with the attempt and reconnect the person with support. CDC recommends reassessing progress and considering different treatment strategies with the clinical team. The plan should remain accessible after a lapse, including a clear route back to counseling and treatment review.", citationIDs: ["common_conditions_cessation_clinical"])
        ])
        ],
        citations: [CommonConditionsSources.cessation_clinical, CommonConditionsSources.cessation_quit, CommonConditionsSources.cessation_combination, CommonConditionsSources.cessation_withdrawal, CommonConditionsSources.cessation_mdd2025],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry11 = ReferenceEntry(
        id: "masld-fibrosis-follow-up",
        title: "MASLD: fibrosis assessment and follow-up",
        subtitle: "Metabolic liver disease, noninvasive testing and current MASH treatment evidence",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Clarify what has been established", [
            .init("Fatty liver detected on routine imaging does not by itself establish steatohepatitis or stage fibrosis. Assessment reviews metabolic risks, alcohol exposure and alternative causes of liver disease. Confirm which question the next test addresses: liver fat, evidence of injury, fibrosis risk or a competing diagnosis.", citationIDs: ["common_conditions_masld_diagnosis"]),
            .init("Noninvasive scores use clinical and laboratory data to estimate fibrosis risk. Elastography assesses liver stiffness, which can help evaluate advanced fibrosis. Liver biopsy is reserved for selected diagnostic questions rather than performed for everyone with suspected metabolic dysfunction-associated steatotic liver disease (MASLD).", citationIDs: ["common_conditions_masld_diagnosis"])
        ]),
            .bullets(title: "Interpret fibrosis screening in context", [
            .init("AASLD’s 2023 assessment guidance uses FIB-4 as an initial risk tool, with secondary assessment such as elastography or ELF when appropriate. FIB-4 should not be used during acute illness, has low accuracy below age 35 and needs age-adjusted interpretation in older adults. A screening score alone does not establish a histologic stage.", citationIDs: ["common_conditions_masld_aasld2023"]),
            .init("Normal aminotransferases do not exclude advanced disease. People with diabetes or several metabolic risk factors may need more frequent fibrosis reassessment. Suspected advanced disease or discordant noninvasive results warrants specialist review; established cirrhosis changes care to include liver-cancer and variceal surveillance and assessment for decompensation.", citationIDs: ["common_conditions_masld_aasld2023"])
        ]),
            .bullets(title: "Support the longitudinal plan", [
            .init("Gradual weight reduction when indicated, healthy food choices and physical activity support care; activity can be beneficial even without weight loss. Rapid weight loss and malnutrition may worsen liver disease. Review supplements and herbal products with the treating team because some can injure the liver.", citationIDs: ["common_conditions_masld_lifestyle"]),
            .init("Follow-up can help clarify what nutrition and activity changes are achievable and whether the person is eating adequately. The goal is a sustainable plan with clinical oversight. Supplements marketed for liver health should not displace assessment or the treatment plan; their safety needs the same medication-reconciliation attention as other products.", citationIDs: ["common_conditions_masld_lifestyle"])
        ]),
            .bullets(title: "Recent MASH trial and guidance", [
            .init("ESSENCE (2025) reported a planned 72-week interim analysis of 800 adults with biopsy-defined metabolic dysfunction-associated steatohepatitis (MASH) and stage F2–F3 fibrosis. Semaglutide versus placebo produced steatohepatitis resolution without fibrosis worsening in 62.9% versus 34.3%, and fibrosis improvement without steatohepatitis worsening in 36.8% versus 22.4%. Gastrointestinal adverse events were more frequent. These were histologic endpoints; this interim report did not establish a reduction in liver-related death or decompensation.", citationIDs: ["common_conditions_masld_essence"]),
            .init("AASLD’s November 2025 update, published in a 2026 issue, describes semaglutide treatment selection for MASH with moderate-to-advanced fibrosis after accelerated FDA approval. Selection requires assessment for cirrhosis and other contraindications; liver biopsy is not required for most treatment candidates. The indication does not extend automatically to everyone with fatty liver.", citationIDs: ["common_conditions_masld_aasld2025"]),
            .init("That update emphasizes gastrointestinal tolerance, dehydration-related kidney injury and other treatment-specific risks, with ongoing lifestyle care. It also notes that combining resmetirom with semaglutide for MASH has not been studied. Changes in noninvasive tests can inform follow-up but cannot reliably predict an individual patient’s histologic response.", citationIDs: ["common_conditions_masld_aasld2025"])
        ]),
            .bullets(title: "Recognize possible advanced-disease complications", [
            .init("New jaundice, increasing abdominal or leg swelling, easy bleeding or confusion can accompany worsening cirrhosis and should be reported promptly. Mental-status change or suspected gastrointestinal bleeding calls for urgent assessment. These developments change the follow-up priority beyond routine discussion of liver enzymes or weight.", citationIDs: ["common_conditions_cirrhosis_symptoms"])
        ])
        ],
        citations: [CommonConditionsSources.masld_diagnosis, CommonConditionsSources.masld_aasld2023, CommonConditionsSources.masld_lifestyle, CommonConditionsSources.masld_essence, CommonConditionsSources.masld_aasld2025, CommonConditionsSources.cirrhosis_symptoms],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry12 = ReferenceEntry(
        id: "migraine-prevention-follow-up",
        title: "Migraine: prevention and follow-up",
        subtitle: "Adult headache burden, preventive treatment response and the 2026 guideline",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .neurologicalRegulation),
        sections: [
            .bullets(title: "Describe the burden between visits", [
            .init("Headache assessment combines the history with physical and neurological examination. Record attack frequency, severity, duration, associated symptoms and effects on usual activities. A headache diary can connect attacks with medicine use, sleep, meals, menstrual periods and other possible triggers; the pattern helps the treating clinician reassess the diagnosis and care plan.", citationIDs: ["common_conditions_migraine_ninds"]),
            .init("The 2026 AAN–AHS guideline supports considering prevention when migraine meaningfully affects work or daily activities, including people with four or more migraine days or moderate-to-severe headache days per month. Frequency is one part of the discussion: disability, treatment preferences, adverse effects and access also influence selection.", citationIDs: ["common_conditions_migraine_2026_summary"])
        ]),
            .bullets(title: "Keep treatment roles clear", [
            .init("Acute treatment addresses an attack; preventive treatment aims to reduce future headache burden. The AHS 2024 position statement recognizes CGRP-targeted treatments as a first-line preventive option without requiring unsuccessful trials of older drug classes. This is a clinical position statement, and individual suitability still requires assessment.", citationIDs: ["common_conditions_migraine_ahs2024"]),
            .init("Prevention includes migraine-specific treatments and medicines also used for other conditions. The 2026 guideline emphasizes shared decisions about the evidence, route of administration, side effects and accessibility. A follow-up conversation should establish which medicine is intended for prevention and what benefit the person hopes to achieve in everyday life.", citationIDs: ["common_conditions_migraine_2026_summary"])
        ]),
            .bullets(title: "What the updated guideline covers", [
            .init("The joint guideline was published online in August 2026. Its underlying systematic review searched studies through June 2024, so the publication date is not the evidence-search cutoff. It addresses starting, selecting, monitoring and discontinuing preventive treatment, with separate considerations for medication overuse and specific patient groups.", citationIDs: ["common_conditions_migraine_2026"]),
            .init("Comorbid obesity, hypertension or fibromyalgia, older age, pregnancy and lactation can affect preventive choices. Review changes in these circumstances and treatment-related concerns with the prescribing team. A generic adult prevention plan should not be transferred unchanged to pregnancy or another clinically different situation.", citationIDs: ["common_conditions_migraine_2026"])
        ]),
            .bullets(title: "Trial context and response monitoring", [
            .init("PROGRESS (2023) randomized 778 adults with chronic migraine to two atogepant regimens or placebo for 12 weeks. Mean monthly migraine days declined by 6.9–7.5 days with atogepant and 5.1 days with placebo; constipation and nausea were common adverse effects. This short trial supports preventive efficacy in its studied population, not a cure or equivalent results for every patient.", citationIDs: ["common_conditions_migraine_progress"]),
            .init("Follow-up should compare headache burden and daily functioning with the pretreatment pattern, while reviewing adverse effects and whether the planned treatment is accessible. The 2026 guideline calls for reassessment at appropriate intervals. A partial response or a poorly tolerated medicine can support a new discussion about available preventive options.", citationIDs: ["common_conditions_migraine_2026_summary"])
        ]),
            .bullets(title: "Recognize a changed headache", [
            .init("A sudden severe headache, headache with new weakness or loss of sensation, confusion, loss of consciousness, seizure or breathing difficulty requires urgent assessment. A prior migraine diagnosis does not explain every new headache. Headache after injury, with fever or stiff neck, or with a progressively changing pattern also needs prompt clinical evaluation.", citationIDs: ["common_conditions_migraine_ninds"]),
            .init("Bring all prescription and nonprescription headache medicines into the review, including how often they are used. The current guideline specifically addresses medication overuse alongside prevention. Persistent disability or increasing reliance on acute medicines is information for reassessment, rather than a reason to independently add or escalate a regimen.", citationIDs: ["common_conditions_migraine_2026"])
        ])
        ],
        citations: [CommonConditionsSources.migraine_ninds, CommonConditionsSources.migraine_2026_summary, CommonConditionsSources.migraine_ahs2024, CommonConditionsSources.migraine_2026, CommonConditionsSources.migraine_progress],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry13 = ReferenceEntry(
        id: "gerd-treatment-reassessment",
        title: "GERD: treatment response and reassessment",
        subtitle: "Adult acid suppression, persistent symptoms and appropriate long-term therapy",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Establish what is being treated", [
            .init("Heartburn and regurgitation are common reflux symptoms, but GERD can also involve swallowing difficulty, nausea, cough or hoarseness. Review which symptoms are present and whether they have changed. Medicines and other conditions can contribute; symptoms that persist despite nonprescription treatment deserve clinical reassessment.", citationIDs: ["common_conditions_gerd_symptoms"]),
            .init("Typical symptoms may initially be assessed through medical history and a treatment trial. Testing becomes more relevant when symptoms persist, a complication is suspected or another condition could explain the presentation. Repeated symptoms alone do not establish which reflux mechanism or alternative diagnosis is responsible.", citationIDs: ["common_conditions_gerd_diagnosis"])
        ]),
            .bullets(title: "Follow the agreed treatment plan", [
            .init("PPIs reduce gastric acid and are more effective than H2 blockers at healing reflux-related esophageal injury. Antacids can relieve mild symptoms but are not a substitute for assessment of persistent or severe symptoms. Review the prescribed and nonprescription products together, including their purpose and any adverse effects.", citationIDs: ["common_conditions_gerd_treatment"]),
            .init("Supportive measures include weight management when indicated, smoking cessation, dietary changes and head elevation during sleep. Follow-up can review which measures are practical and whether symptoms are improving. Medication benefits and harms should be discussed with the treating clinician; long-term treatment may be appropriate when the indication remains.", citationIDs: ["common_conditions_gerd_treatment"])
        ]),
            .bullets(title: "Persistent symptoms need a diagnostic question", [
            .init("Upper endoscopy can assess esophageal injury, complications and alternative causes; selected tissue samples may be examined. Reflux monitoring can relate recorded symptoms, meals and sleep to measured acid exposure. Catheter-based testing can also detect nonacid reflux. Clarify what the ordered test is intended to establish and follow its preparation instructions.", citationIDs: ["common_conditions_gerd_diagnosis"]),
            .init("Dysphagia, painful swallowing, unexplained weight loss, persistent vomiting or evidence of gastrointestinal bleeding changes the priority from routine symptom tracking to prompt assessment. Blood or coffee-ground material in vomit and black, tarry stool are concerning findings. Chest pain needs medical evaluation and should not simply be labeled reflux.", citationIDs: ["common_conditions_gerd_symptoms"])
        ]),
            .bullets(title: "Review long-term PPI use deliberately", [
            .init("AGA’s 2022 expert advice recommends documenting and periodically reviewing the PPI indication. A supervised deprescribing discussion is appropriate when there is no continuing indication. The decision should be based on expected benefit and the underlying condition, rather than stopping automatically because of reported associations with adverse outcomes.", citationIDs: ["common_conditions_gerd_deprescribing"]),
            .init("Severe erosive disease, esophageal ulcer or stricture, Barrett’s esophagus and high upper-GI bleeding risk are important reasons that routine discontinuation may be inappropriate. Transient rebound symptoms can occur after stopping long-term therapy. The review should establish who will reassess symptoms and the original indication before changing treatment.", citationIDs: ["common_conditions_gerd_deprescribing"])
        ]),
            .bullets(title: "Recent nonerosive reflux evidence", [
            .init("A 2024 US randomized trial enrolled 772 adults with frequent heartburn and no erosive esophagitis on endoscopy. Over four weeks, about 44%–45% of days were completely heartburn-free in the vonoprazan groups versus 27.7% with placebo. This was the proportion of symptom-free days, not the proportion of patients cured.", citationIDs: ["common_conditions_gerd_vonoprazan"]),
            .init("The subsequent 20-week phase provided active treatment to all groups. It therefore does not supply a continuing placebo comparison or prove superiority to a PPI. The findings apply to the trial’s nonerosive reflux population and do not justify switching every patient with persistent upper-GI symptoms to a different acid suppressant.", citationIDs: ["common_conditions_gerd_vonoprazan"])
        ])
        ],
        citations: [CommonConditionsSources.gerd_symptoms, CommonConditionsSources.gerd_diagnosis, CommonConditionsSources.gerd_treatment, CommonConditionsSources.gerd_deprescribing, CommonConditionsSources.gerd_vonoprazan],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry14 = ReferenceEntry(
        id: "iron-deficiency-treatment-follow-up",
        title: "Iron deficiency: treatment and follow-up",
        subtitle: "Adult anemia evaluation, oral tolerance, repletion response and IV formulation risks",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Confirm the deficiency and its cause", [
            .init("Iron deficiency can precede anemia. Hemoglobin and hematocrit alone do not reliably establish iron status, and ferritin can rise with inflammation. Interpret the blood count, ferritin and other ordered iron measures together with the clinical context; an apparently normal ferritin does not resolve every question about iron availability.", citationIDs: ["common_conditions_iron_ods"]),
            .init("Cause evaluation matters alongside replacement. Relevant histories include heavy menstrual bleeding, gastrointestinal or urinary blood loss, NSAID exposure, restrictive intake, digestive disease and prior stomach or intestinal surgery. Persistent blood loss or impaired absorption can prevent lasting correction even when an iron supplement has been prescribed.", citationIDs: ["common_conditions_iron_nhlbi"])
        ]),
            .bullets(title: "Make oral therapy tolerable and understandable", [
            .init("The AGA 2024 expert review advises oral iron no more than once daily and notes that alternate-day administration may be better tolerated by some people. Ferrous sulfate is inexpensive; no oral formulation has established superiority. Discuss tolerance and response with the prescriber before changing the schedule.", citationIDs: ["common_conditions_iron_aga2024"]),
            .init("Nausea, abdominal discomfort, constipation or diarrhea can interfere with oral therapy. Replenishing iron stores may take months. Follow-up should establish whether the person can take the intended treatment and whether planned blood tests have been completed, rather than assuming symptom improvement alone proves that stores are restored.", citationIDs: ["common_conditions_iron_nhlbi"]),
            .init("Iron can reduce absorption of levothyroxine and levodopa; acid suppression may impair iron absorption in someone already deficient. Medication reconciliation should include supplements and nonprescription products. A pharmacist or prescriber can clarify product-specific spacing and interactions without leaving the person to guess which treatment to omit.", citationIDs: ["common_conditions_iron_ods"])
        ]),
            .bullets(title: "When the response is inadequate", [
            .init("AGA supports considering IV iron when oral treatment is not tolerated, ferritin does not improve with an oral trial or absorption is unlikely to be adequate. Active inflammatory bowel disease and some bariatric procedures warrant particular attention. Reassessment should address continued bleeding, inflammation and absorption rather than simply repeating the same unsuccessful plan.", citationIDs: ["common_conditions_iron_aga2024"]),
            .init("For celiac disease or inflammatory bowel disease, treating the underlying disorder remains part of iron management. AGA emphasizes adherence to the gluten-free diet in celiac disease and effective control of intestinal inflammation in IBD. Replacement and cause-directed treatment answer different problems and may both be necessary.", citationIDs: ["common_conditions_iron_aga2024"])
        ]),
            .bullets(title: "Study context: vitamin C is not a settled requirement", [
            .init("AGA’s 2024 advice favors adding vitamin C, but a 2020 randomized equivalence trial in 440 adults found comparable hemoglobin improvement with iron alone and iron plus vitamin C. Participants were predominantly women at a single Chinese center. The finding challenges a universal need for additional vitamin C, while not settling every population or formulation.", citationIDs: ["common_conditions_iron_vitc", "common_conditions_iron_aga2024"])
        ]),
            .bullets(title: "IV formulations have different safety considerations", [
            .init("PHOSPHARE-IBD, published in a 2023 issue, compared two IV formulations in 97 adults with IBD and iron-deficiency anemia. Hypophosphatemia through day 35 occurred in 8.3% receiving ferric derisomaltose and 51.0% receiving ferric carboxymaltose. Both corrected anemia. This selected trial does not establish the same event rate for every patient or every IV iron product.", citationIDs: ["common_conditions_iron_phosphare"]),
            .init("Fatigue improved in both trial groups but less rapidly with ferric carboxymaltose, and slower improvement was associated with a greater phosphate decline. Persistent fatigue after an infusion should not automatically be attributed to residual iron deficiency. The result supports attention to the exact product and clinician-directed assessment of possible treatment effects.", citationIDs: ["common_conditions_iron_phosphare"])
        ])
        ],
        citations: [CommonConditionsSources.iron_ods, CommonConditionsSources.iron_nhlbi, CommonConditionsSources.iron_aga2024, CommonConditionsSources.iron_vitc, CommonConditionsSources.iron_phosphare],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry15 = ReferenceEntry(
        id: "osteoarthritis-treatment-follow-up",
        title: "Osteoarthritis: pain and treatment follow-up",
        subtitle: "Joint-specific care, functional goals, medication safety and STEP 9 evidence",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility),
        sections: [
            .bullets(title: "Assess function as well as pain", [
            .init("Osteoarthritis involves changes in multiple joint tissues, including cartilage, bone and surrounding structures. Symptoms can include pain with use, brief stiffness after rest, swelling and reduced movement. Joint instability, sleep disruption and difficulty with everyday tasks help describe its impact more fully than a pain number alone.", citationIDs: ["common_conditions_oa_overview"]),
            .init("Ask about specific activities such as walking, stairs, rising from a chair, using the toilet or gripping household objects. Less activity can contribute to muscle weakness and additional joint stress. Tracking the same activities over time gives the care team a practical description of improvement or increasing disability.", citationIDs: ["common_conditions_oa_overview"])
        ]),
            .bullets(title: "Build a sustainable activity plan", [
            .init("Exercise, education and weight management when indicated are core components of care. NIAMS describes strengthening, range-of-motion work, balance activities and low-impact aerobic or water exercise, tailored with the clinician or physical therapist. Progression should account for current ability and tolerance rather than assuming one exercise program suits every joint or patient.", citationIDs: ["common_conditions_oa_care"]),
            .init("Occupational therapy can help with joint protection and daily tasks; appropriately fitted canes, walkers, braces or hand aids can support function. Follow-up should review whether the chosen device can actually be used and whether the activity plan remains achievable. These supports address independence as well as symptom relief.", citationIDs: ["common_conditions_oa_care"])
        ]),
            .bullets(title: "Medication choices depend on the joint and risks", [
            .init("The ACR/Arthritis Foundation guideline strongly supports topical NSAIDs for knee osteoarthritis and recognizes oral NSAIDs and selected intra-articular steroid treatment among pharmacologic options. Recommendations differ for the hand, hip and knee. Selection should account for comorbidities, preferences and treatment burden rather than applying one medication plan to all osteoarthritis.", citationIDs: ["common_conditions_oa_acr"]),
            .init("FDA advises checking the active ingredients in every nonprescription product: pain, cold and combination medicines can duplicate ingredients. Excess acetaminophen can injure the liver, while NSAIDs can contribute to gastrointestinal bleeding or kidney disease in susceptible people. Include these products in the medication review even when they were not prescribed.", citationIDs: ["common_conditions_oa_fda"])
        ]),
            .bullets(title: "Recent obesity and knee-pain trial", [
            .init("STEP 9 (2024) randomized 407 adults with obesity and moderate knee osteoarthritis with at least moderate pain to semaglutide or placebo, alongside diet and activity counseling. At 68 weeks, mean body weight fell 13.7% versus 3.2%; WOMAC pain scores fell 41.7 versus 27.5 points on a 100-point scale. Physical function also improved more with semaglutide.", citationIDs: ["common_conditions_oa_step9"]),
            .init("Treatment discontinuation because of adverse events occurred in 6.7% versus 3.0%, most commonly for gastrointestinal problems. This manufacturer-funded trial studied obesity with symptomatic knee disease. It did not establish cartilage regeneration, prevention of joint replacement or equivalent benefit in people without obesity or with a different affected joint.", citationIDs: ["common_conditions_oa_step9"])
        ]),
            .bullets(title: "Reassess when the pattern changes", [
            .init("Osteoarthritis has no single diagnostic test. Examination, imaging and sometimes blood or joint-fluid testing help assess the problem and exclude other causes such as gout or infection. A changing symptom pattern, locking or giving way deserves reassessment rather than assuming every new limitation comes from established osteoarthritis.", citationIDs: ["common_conditions_oa_care"]),
            .init("When pain and disability persist despite other treatment and joint damage is substantial, surgical assessment may be considered. NIAMS describes decisions that incorporate pain, functional limitation, occupation and overall circumstances. Nursing follow-up can bring the person’s concrete limitations and previous treatment experience into that discussion.", citationIDs: ["common_conditions_oa_care"])
        ])
        ],
        citations: [CommonConditionsSources.oa_overview, CommonConditionsSources.oa_care, CommonConditionsSources.oa_acr, CommonConditionsSources.oa_fda, CommonConditionsSources.oa_step9],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry16 = ReferenceEntry(
        id: "osteoporosis-treatment-continuity",
        title: "Osteoporosis: treatment continuity",
        subtitle: "Adult fracture prevention, denosumab transitions and safety monitoring",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .mobility),
        sections: [
            .bullets(title: "Follow a fracture-prevention plan", [
            .init("Osteoporosis treatment combines medication when indicated with nutrition, safe activity and fall prevention. It also addresses conditions or medicines contributing to bone loss. Review the treatment’s purpose and the planned follow-up assessment; a medicine list alone does not establish that the fracture-prevention plan is being carried out.", citationIDs: ["common_conditions_bone_niams"]),
            .init("Hip and spine DXA can assess bone density and inform fracture risk. Adequate calcium, vitamin D, protein and overall nutrition remain relevant during drug treatment. Physical therapy can tailor strength, balance and movement strategies to reduce strain and support safer daily activity. Supplement amounts require individual assessment rather than automatic escalation.", citationIDs: ["common_conditions_bone_niams"])
        ]),
            .bullets(title: "A treatment pause is drug-specific", [
            .init("Endocrine Society guidance for postmenopausal osteoporosis distinguishes a selected bisphosphonate holiday from denosumab interruption. Bisphosphonate treatment is reassessed after several years; a holiday may be considered in people whose fracture risk has become low or moderate. Those remaining at high risk may need continued treatment.", citationIDs: ["common_conditions_bone_endocrine"]),
            .init("Denosumab effects reverse when treatment is not maintained. The guideline advises against delaying or stopping it without subsequent therapy because bone turnover can rebound, bone density can fall rapidly and fracture risk can rise. Follow-up should identify anticipated missed appointments or treatment changes early enough for the prescribing team to arrange continuity.", citationIDs: ["common_conditions_bone_endocrine"])
        ]),
            .bullets(title: "Advanced kidney disease changes denosumab safety", [
            .init("FDA’s 2024 boxed-warning communication identifies severe hypocalcemia risk with Prolia in advanced chronic kidney disease, especially dialysis and CKD-related mineral and bone disorder. Patient selection, calcium assessment and monitoring require appropriate clinical expertise. A plan to avoid missed treatment must still account for these risks and any change in kidney health.", citationIDs: ["common_conditions_bone_fda"]),
            .init("Severe hypocalcemia may cause tingling, muscle spasms, weakness, confusion, abnormal heart rhythm, fainting or seizures, and may sometimes be asymptomatic. New concerning symptoms require prompt medical assessment; seizures, fainting or an abnormal rhythm can signal an emergency. Symptom checks do not replace the ordered laboratory-monitoring plan.", citationIDs: ["common_conditions_bone_fda"])
        ]),
            .bullets(title: "Newer sequential-treatment evidence", [
            .init("The DST trial’s two-year report appeared online in 2025 and in a 2026 issue. It randomized 101 adults aged at least 50 who had received denosumab for at least two years among continued denosumab and three sequential strategies. The primary outcomes were changes in bone mineral density, rather than a definitive comparison of fracture prevention.", citationIDs: ["common_conditions_bone_dst2026"]),
            .init("Lumbar-spine density declined most with one zoledronate infusion followed by a medication-free year; 22% of that group required rescue zoledronate. The small, open-label Taiwan trial reinforces that a single transition treatment may not fully preserve bone density. It does not establish a universal switching schedule or justify changing an individual regimen without specialist review.", citationIDs: ["common_conditions_bone_dst2026"])
        ]),
            .bullets(title: "Keep falls and reassessment in the plan", [
            .init("Ask about falls, new balance or walking problems and medicines that may increase fall risk. Vision, physical function and the home environment also matter. Ongoing follow-up should connect these concerns with the treating team and the person’s activity plan; preventing falls remains important even when bone-density treatment is continuing.", citationIDs: ["common_conditions_bone_niams"]),
            .init("During a clinician-selected bisphosphonate holiday, fracture risk still requires reassessment. An intervening fracture, a significant density decline or another change in risk may prompt earlier treatment review. The term holiday describes a monitored treatment decision and should not imply that follow-up is unnecessary.", citationIDs: ["common_conditions_bone_endocrine"])
        ])
        ],
        citations: [CommonConditionsSources.bone_niams, CommonConditionsSources.bone_endocrine, CommonConditionsSources.bone_fda, CommonConditionsSources.bone_dst2026],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry17 = ReferenceEntry(
        id: "recurrent-uti-prevention-follow-up",
        title: "Recurrent UTI: prevention and follow-up",
        subtitle: "Adult women, diagnostic reassessment and non-antibiotic prevention evidence",
        eyebrow: "REFERENCE · COMMON CONDITIONS",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Describe episodes before planning prevention", [
            .init("A commonly studied recurrent-UTI pattern is at least two episodes in six months or three in a year. The prevention trials discussed here studied adult women; they do not establish management for children, pregnancy, catheter-associated infection or a new systemic illness. Document the episode history and its clinical context.", citationIDs: ["common_conditions_uti_dmannose"]),
            .init("Assessment combines symptoms, history, examination and appropriate testing. Urinalysis can identify blood and white cells, while urine culture identifies bacteria and helps inform antibiotic treatment. Review prior results alongside symptoms and treatment response; selected recurrent presentations may need imaging or cystoscopy to investigate an underlying cause.", citationIDs: ["common_conditions_uti_diagnosis"])
        ]),
            .bullets(title: "Confirm the current problem", [
            .init("When symptoms and tests do not support a bladder-infection diagnosis, the clinician may investigate another cause instead of prescribing antibiotics. For a confirmed infection, treatment depends on the organism, allergies, illness severity and urinary-tract factors. Persistent or recurrent symptoms need reassessment rather than assuming an earlier prescription still fits.", citationIDs: ["common_conditions_uti_treatment"]),
            .init("Fever or chills, nausea or vomiting, and back, side or groin pain can indicate kidney involvement. These findings call for prompt clinical assessment, even when previous episodes were uncomplicated bladder infections. A prevention discussion should not delay evaluation of a potentially ascending infection or worsening illness.", citationIDs: ["common_conditions_uti_symptoms"])
        ]),
            .bullets(title: "Discuss appropriate prevention options", [
            .init("NIDDK describes adequate fluid intake and complete bladder emptying among supportive measures. Fluid advice must account for heart or kidney disease and other restrictions. Recurrent episodes may also prompt a discussion about spermicide or diaphragm use. These measures are supportive options, not proof that an infection resulted from poor hygiene.", citationIDs: ["common_conditions_uti_treatment"]),
            .init("For perimenopausal or postmenopausal people with repeated bladder infections, vaginal estrogen may be considered by the clinician. It supports the local vaginal environment and beneficial bacteria. Follow-up should clarify the selected approach, its suitability and whether recurrence continues, alongside review of any preventive or acute medicines.", citationIDs: ["common_conditions_uti_treatment"])
        ]),
            .bullets(title: "D-mannose: a negative primary-care trial", [
            .init("A 2024 placebo-controlled trial randomized 598 women with recurrent UTI from 99 UK primary-care centers. Over six months, 51.0% in the D-mannose group and 55.7% in the placebo group contacted ambulatory care for a clinically suspected UTI. The difference was not statistically significant. The trial does not support routinely recommending D-mannose for prevention in this population.", citationIDs: ["common_conditions_uti_dmannose"])
        ]),
            .bullets(title: "Methenamine: interpret noninferiority carefully", [
            .init("ALTAR (2022) randomized 240 adult women requiring prevention to methenamine hippurate or daily antibiotic prophylaxis for 12 months. In the primary modified analysis, symptomatic antibiotic-treated UTI rates were 1.38 versus 0.89 episodes per person-year. The difference met the prespecified noninferiority margin of one additional episode per person-year.", citationIDs: ["common_conditions_uti_altar"]),
            .init("Noninferiority within that margin does not mean the treatments had identical event rates. ALTAR was open-label, allowed treatment crossover and was conducted in UK secondary care. It supports a clinician discussion of a non-antibiotic preventive option, not self-treatment of an active infection or a regimen automatically suitable for every patient.", citationIDs: ["common_conditions_uti_altar"])
        ]),
            .bullets(title: "Close the follow-up loop", [
            .init("Keep the timing of symptoms, available urine results and response to treatment together so the next clinician can reassess the pattern. Further testing should answer a clinical question, such as whether an anatomic problem contributes to recurrence. A test result is interpreted within the presentation rather than replacing the history.", citationIDs: ["common_conditions_uti_diagnosis"])
        ])
        ],
        citations: [CommonConditionsSources.uti_dmannose, CommonConditionsSources.uti_diagnosis, CommonConditionsSources.uti_treatment, CommonConditionsSources.uti_symptoms, CommonConditionsSources.uti_altar],
        lastSourceFidelityReview: "2026-09-19"
    )

#endif
}
