import Foundation

private let rh_depth_itp = CitationSource(
    id: "rh_depth_itp", shortName: "NHLBI — Immune thrombocytopenia",
    detail: "July 24, 2025. Bleeding, diagnostic assessment, individualized treatment and splenectomy risks. Incorrect oral-route grouping of romiplostim is excluded; no drug dosing or transfusion threshold. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/immune-thrombocytopenia", lastRetrieved: "2026-09-17"
)

private let rh_depth_platelet_living = CitationSource(
    id: "rh_depth_platelet_living", shortName: "NHLBI — Living with platelet disorders",
    detail: "March 24, 2022. Bleeding and infection reporting, medicine review, injury prevention and dental care. No blanket instruction to stop prescribed antiplatelet treatment. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/platelet-disorders/living-with", lastRetrieved: "2026-09-17"
)

private let rh_depth_aplastic = CitationSource(
    id: "rh_depth_aplastic", shortName: "NHLBI — Aplastic anemia",
    detail: "March 24, 2022. Bone-marrow failure, symptoms, causes, individualized treatment and ongoing surveillance. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/anemia/aplastic-anemia", lastRetrieved: "2026-09-17"
)

private let rh_depth_anemia_diagnosis = CitationSource(
    id: "rh_depth_anemia_diagnosis", shortName: "NHLBI — Anemia diagnosis",
    detail: "December 18, 2025. History, CBC components and cause-focused testing. Reference-range tables and the source’s overbroad high-hemoglobin anemia wording excluded. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/anemia/diagnosis", lastRetrieved: "2026-09-17"
)

private let rh_depth_hemolytic = CitationSource(
    id: "rh_depth_hemolytic", shortName: "NHLBI — Hemolytic anemia",
    detail: "March 24, 2022. Red-cell destruction, causes, testing, treatment options and complications. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/anemia/hemolytic-anemia", lastRetrieved: "2026-09-17"
)

private let rh_depth_anemia_symptoms = CitationSource(
    id: "rh_depth_anemia_symptoms", shortName: "NHLBI — Anemia symptoms",
    detail: "Anemia symptom assessment; fatigue, breathlessness, headache, dizziness and fainting. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/anemia/symptoms", lastRetrieved: "2026-09-17"
)

private let rh_depth_b12 = CitationSource(
    id: "rh_depth_b12", shortName: "NHLBI — Vitamin B12 deficiency anemia",
    detail: "March 24, 2022. Neurologic symptoms, absorption risks, testing, replacement and recovery. Numerical diagnostic/intake tables and pediatric claims excluded. Original federal educational prose adapted and condensed by NurseMind. Images, videos, third-party reference texts and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/anemia/vitamin-b12-deficiency-anemia", lastRetrieved: "2026-09-17"
)

public enum RHDepthImmuneThrombocytopeniaFollowUpSample {
    public static let entry = ReferenceEntry(
        id: "immune-thrombocytopenia-follow-up", title: "Immune thrombocytopenia: nursing follow-up",
        subtitle: "Bleeding recognition, treatment review and everyday precautions", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Connect platelet loss with the clinical picture", [
                AttributedBullet("Immune thrombocytopenia, or ITP, develops when immune activity destroys platelets and may also reduce their production. Low platelets can make bleeding harder to stop, although some people have no obvious symptoms.", citationIDs: ["rh_depth_itp"]),
                AttributedBullet("The course and treatment need vary. Adult disease may persist for years, while some people only require observation; the platelet number must be considered with symptoms and the clinician’s assessment.", citationIDs: ["rh_depth_itp"])
            ]),
            .bullets(title: "Ask about visible and less visible bleeding", [
                AttributedBullet("Look for new petechiae, larger areas of skin discoloration, hematomas, nose or gum bleeding, blood in urine or stool, and heavy menstrual bleeding. Ask directly because some bleeding may not be visible during a routine examination.", citationIDs: ["rh_depth_itp"]),
                AttributedBullet("Bleeding can also contribute to tiredness, pallor or dizziness from anemia. Describe the site and pattern to the treating team. Uncontrollable bleeding that does not stop with pressure requires immediate medical attention.", citationIDs: ["rh_depth_itp"])
            ]),
            .bullets(title: "Understand the diagnostic follow-up", [
                AttributedBullet("The evaluation includes history, examination and blood tests such as a complete blood count and blood smear. Selected patients may need bone-marrow testing or assessment for an associated infection or immune condition.", citationIDs: ["rh_depth_itp"]),
                AttributedBullet("These tests help distinguish ITP from other causes of a low platelet count. Confirm the ordered follow-up and avoid presenting every low platelet result as a diagnosis of ITP.", citationIDs: ["rh_depth_itp"])
            ]),
            .bullets(title: "Review the individualized treatment plan", [
                AttributedBullet("Treatment may include medicines that reduce immune destruction or support platelet production. Some people need other interventions, while mild cases may be monitored without active treatment.", citationIDs: ["rh_depth_itp"]),
                AttributedBullet("Corticosteroids can raise platelet counts but have important adverse effects, particularly with prolonged use. Review the actual prescribed plan and new concerns with the team; this reference does not define a drug sequence, route or dose.", citationIDs: ["rh_depth_itp"])
            ]),
            .bullets(title: "Reduce avoidable injury and medicine risks", [
                AttributedBullet("Review over-the-counter products, supplements and herbal remedies with the clinical team. Aspirin and ibuprofen can interfere with platelet function or increase bleeding risk; clarify their suitability before using them.", citationIDs: ["rh_depth_platelet_living"]),
                AttributedBullet("Choose physical activities and everyday safety measures that limit injury, following the clinician’s advice. Tell the dentist and procedural team about the platelet disorder and current medicines before invasive care; do not independently stop prescribed cardiovascular medicines.", citationIDs: ["rh_depth_platelet_living"])
            ]),
            .bullets(title: "Plan infection precautions after splenectomy", [
                AttributedBullet("Some patients undergo spleen removal as part of treatment. This can increase infection risk, and the team may plan vaccines, preventive medicines and teaching about infection symptoms.", citationIDs: ["rh_depth_itp"]),
                AttributedBullet("Make sure the individual prevention and contact plan is understood before care transitions. New infection concerns should reach the treating team promptly, and vaccination or prophylaxis decisions need the actual clinical history.", citationIDs: ["rh_depth_itp"])
            ]),
            .bullets(title: "Maintain surveillance beyond symptom improvement", [
                AttributedBullet("Ongoing appointments and laboratory tests help monitor platelet levels and complications. Bleeding can appear suddenly or develop over time, so a previously reassuring result does not remove the need to report a new symptom.", citationIDs: ["rh_depth_platelet_living"]),
                AttributedBullet("Report fever or other infection symptoms, especially after spleen removal. Continue routine oral hygiene and dental care to help avoid gum problems and more invasive treatment later.", citationIDs: ["rh_depth_platelet_living"])
            ])
        ],
        citations: [rh_depth_itp, rh_depth_platelet_living],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum RHDepthAplasticAnemiaNursingSupportSample {
    public static let entry = ReferenceEntry(
        id: "aplastic-anemia-nursing-support", title: "Aplastic anemia: nursing support and follow-up",
        subtitle: "Bone-marrow failure, infection, bleeding and treatment continuity", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Recognize that more than red cells are affected", [
                AttributedBullet("Aplastic anemia is bone-marrow failure in which the marrow cannot produce enough new blood cells. It can develop rapidly or gradually and range from milder disease to a serious illness.", citationIDs: ["rh_depth_aplastic"]),
                AttributedBullet("The name should not narrow assessment to fatigue alone. Persistent infections and easy bruising or bleeding are also important features to communicate during nursing follow-up.", citationIDs: ["rh_depth_aplastic"])
            ]),
            .bullets(title: "Track the presenting symptom pattern", [
                AttributedBullet("Ask about fatigue, infections that last unusually long, and new bleeding or bruising. Record how these problems affect function and whether they are new or changing.", citationIDs: ["rh_depth_aplastic"]),
                AttributedBullet("Symptoms and treatment needs vary, so communicate the observed pattern to the hematology team. The person’s experience and clinical assessment remain important alongside laboratory monitoring.", citationIDs: ["rh_depth_aplastic"])
            ]),
            .bullets(title: "Explain blood and marrow testing", [
                AttributedBullet("A complete blood count measures red cells, white cells and platelets. Hemoglobin, hematocrit and red-cell size contribute to the anemia assessment, while the full blood count gives information about other cell types.", citationIDs: ["rh_depth_anemia_diagnosis"]),
                AttributedBullet("Bone-marrow aspiration and biopsy evaluate the marrow and its cell production. If these are ordered, explain the procedural plan and arrange result follow-up rather than assuming that a CBC identifies the cause by itself.", citationIDs: ["rh_depth_anemia_diagnosis"])
            ]),
            .bullets(title: "Review possible exposures and causes", [
                AttributedBullet("Damage to blood-forming stem cells can be associated with certain medicines, including chemotherapy, and with environmental toxins or chemicals. Rarely, the condition is inherited.", citationIDs: ["rh_depth_aplastic"]),
                AttributedBullet("Provide the treating team with the medication and exposure history. Any changes to prescribed medicines or steps to avoid an exposure should follow the clinical evaluation rather than an assumption that one product caused the marrow failure.", citationIDs: ["rh_depth_aplastic"])
            ]),
            .bullets(title: "Clarify the treatment and surveillance plan", [
                AttributedBullet("Treatment may include transfusion support, medicines that reduce immune injury or stimulate blood-cell production, and blood or marrow transplantation in selected patients. The team chooses the approach for the individual condition.", citationIDs: ["rh_depth_aplastic"]),
                AttributedBullet("Regular follow-up also screens for other serious blood disorders. Ask which appointments and tests are due and who will coordinate care when treatment involves more than one service.", citationIDs: ["rh_depth_aplastic"])
            ]),
            .bullets(title: "Support prevention and reporting", [
                AttributedBullet("Immune-suppressing treatment makes infection prevention particularly important. Review the team’s prevention instructions and vaccination plan, and communicate infection concerns and changes in bleeding or fatigue.", citationIDs: ["rh_depth_aplastic"]),
                AttributedBullet("Untreated severe disease can lead to serious complications, including bleeding and heart problems. This guide supports ongoing assessment and communication; the hematology team supplies individualized urgent-contact criteria and treatment decisions.", citationIDs: ["rh_depth_aplastic"])
            ])
        ],
        citations: [rh_depth_aplastic, rh_depth_anemia_diagnosis],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum RHDepthHemolyticAnemiaFollowUpSample {
    public static let entry = ReferenceEntry(
        id: "hemolytic-anemia-follow-up", title: "Hemolytic anemia: assessment and follow-up",
        subtitle: "Red-cell destruction, cause-focused testing and monitoring", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Explain what hemolysis means", [
                AttributedBullet("Hemolytic anemia occurs when red blood cells are destroyed faster than they can be replaced. The illness may develop quickly or slowly and can be mild or severe.", citationIDs: ["rh_depth_hemolytic"]),
                AttributedBullet("This is a mechanism of anemia with several possible causes. A diagnosis of hemolysis does not by itself identify a medicine, infection or inherited disorder as the explanation.", citationIDs: ["rh_depth_hemolytic"])
            ]),
            .bullets(title: "Assess symptoms and function", [
                AttributedBullet("Anemia can cause weakness, fatigue, shortness of breath, headache, dizziness or fainting. Some people with mild anemia have few symptoms; yellowing of the skin may also occur in some forms of anemia.", citationIDs: ["rh_depth_anemia_symptoms"]),
                AttributedBullet("Describe the symptom trajectory and effect on activity to the clinical team. Symptoms alone do not determine the hemoglobin level or cause, so follow the ordered evaluation rather than interpreting appearance in isolation.", citationIDs: ["rh_depth_anemia_symptoms"])
            ]),
            .bullets(title: "Review the relevant history", [
                AttributedBullet("Possible causes include immune conditions, infections, inherited blood disorders, certain medicines, marrow disorders and complications of transfusion. The spleen or liver may be enlarged.", citationIDs: ["rh_depth_hemolytic"]),
                AttributedBullet("Communicate current medicines, known blood conditions and relevant recent treatment when the team evaluates the anemia. Different causes require different management; a history item is a clue for assessment, not proof of causation.", citationIDs: ["rh_depth_hemolytic"])
            ]),
            .bullets(title: "Understand the investigation plan", [
                AttributedBullet("Evaluation includes physical examination and blood tests. Depending on the suspected cause, urine testing, marrow testing or genetic testing may also be needed.", citationIDs: ["rh_depth_hemolytic"]),
                AttributedBullet("Confirm which results are pending and who will review them. These investigations help the clinician determine the cause and seriousness of red-cell destruction and select an appropriate treatment plan.", citationIDs: ["rh_depth_hemolytic"])
            ]),
            .bullets(title: "Connect treatment with the underlying cause", [
                AttributedBullet("Some mild cases do not require active treatment. Other patients may need medicines, blood transfusions, spleen surgery or blood and marrow transplantation, depending on the cause and clinical severity.", citationIDs: ["rh_depth_hemolytic"]),
                AttributedBullet("When a medicine or another health condition contributes to hemolysis, the clinician may change the treatment of that cause. Do not independently stop a prescribed medicine or assume that every hemolytic anemia needs the same therapy.", citationIDs: ["rh_depth_hemolytic"])
            ]),
            .bullets(title: "Monitor the ongoing response", [
                AttributedBullet("Serious hemolytic anemia that is not controlled can strain the heart and contribute to rhythm problems, heart enlargement or heart failure. Follow symptoms and the team’s laboratory monitoring during care.", citationIDs: ["rh_depth_hemolytic"]),
                AttributedBullet("Communicate persistent or worsening concerns and clarify the next follow-up step. Improvement after an intervention should be evaluated with the treatment plan rather than treated as proof that the underlying cause has resolved.", citationIDs: ["rh_depth_hemolytic"])
            ])
        ],
        citations: [rh_depth_hemolytic, rh_depth_anemia_symptoms],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum RHDepthVitaminB12DeficiencyFollowUpSample {
    public static let entry = ReferenceEntry(
        id: "vitamin-b12-deficiency-follow-up", title: "Vitamin B12 deficiency: nursing follow-up",
        subtitle: "Neurologic findings, absorption risks and treatment continuity", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Connect blood and neurologic effects", [
                AttributedBullet("Vitamin B12 supports healthy red-cell production and normal brain and nerve function. Deficiency can cause anemia with fatigue, breathlessness or dizziness, and may also produce neurologic problems.", citationIDs: ["rh_depth_b12"]),
                AttributedBullet("Ask about tingling, altered sensation, walking difficulty, slower thinking, memory or mood changes. Neurologic concerns deserve assessment along with the blood results rather than being dismissed as unrelated to the deficiency.", citationIDs: ["rh_depth_b12"])
            ]),
            .bullets(title: "Review intake and absorption separately", [
                AttributedBullet("Low intake is one possible cause, but impaired absorption is important. Pernicious anemia involves a lack of intrinsic factor, a stomach protein needed for B12 absorption. Stomach or intestinal surgery and some digestive diseases also increase risk.", citationIDs: ["rh_depth_b12"]),
                AttributedBullet("The same food advice will not correct every cause. Review the person’s digestive history and dietary pattern so the clinician can distinguish inadequate intake from a problem absorbing the vitamin.", citationIDs: ["rh_depth_b12"])
            ]),
            .bullets(title: "Include medicines and associated conditions", [
                AttributedBullet("Long-term use of certain acid-suppressing medicines or metformin can affect B12 absorption. Some autoimmune conditions, pancreatic disease and intestinal disorders also increase the likelihood of deficiency.", citationIDs: ["rh_depth_b12"]),
                AttributedBullet("Include prescribed and nonprescription medicines in the history. A risk factor may prompt evaluation, but it does not authorize stopping an effective medicine without a discussion with the treating clinician.", citationIDs: ["rh_depth_b12"])
            ]),
            .bullets(title: "Explain what testing can and cannot establish", [
                AttributedBullet("The evaluation may include a complete blood count, hemoglobin and a blood B12 measurement. Results need interpretation with symptoms and the clinical history; NHLBI notes that deficiency can sometimes be present despite a result within the reported normal range.", citationIDs: ["rh_depth_b12"]),
                AttributedBullet("Persistent neurologic symptoms or an unclear result should be discussed with the clinician. This reference does not use one universal laboratory cutoff to diagnose or exclude deficiency.", citationIDs: ["rh_depth_b12"])
            ]),
            .bullets(title: "Clarify the replacement plan", [
                AttributedBullet("Replacement may be given by mouth, nasal route or injection depending on the cause and severity. Some people need long-term or lifelong treatment, and more serious anemia may require additional support.", citationIDs: ["rh_depth_b12"]),
                AttributedBullet("Review the exact prescribed route and follow-up instructions. Feeling less tired does not establish that replacement can stop, particularly when the cause of poor absorption remains present.", citationIDs: ["rh_depth_b12"])
            ]),
            .bullets(title: "Make food teaching relevant to the cause", [
                AttributedBullet("Food sources include meat, fish, eggs, dairy products and foods fortified with B12, including some cereals and plant-based milk substitutes. Discuss choices that fit the person’s eating pattern.", citationIDs: ["rh_depth_b12"]),
                AttributedBullet("Nutrition changes may support the treatment plan, but a problem absorbing B12 may still require prescribed replacement. The clinician determines the appropriate intake and therapy rather than applying a standard supplement dose to everyone.", citationIDs: ["rh_depth_b12"])
            ]),
            .bullets(title: "Follow recovery over time", [
                AttributedBullet("Some symptoms take months to improve, and established nerve or brain effects may not fully resolve even with treatment. Record changes in sensation, walking, cognition and daily function as well as fatigue.", citationIDs: ["rh_depth_b12"]),
                AttributedBullet("Maintain the planned follow-up and report persistent or worsening concerns. Early assessment and treatment matter because some neurologic complications can become permanent.", citationIDs: ["rh_depth_b12"])
            ])
        ],
        citations: [rh_depth_b12],
        lastSourceFidelityReview: "2026-09-17"
    )
}
