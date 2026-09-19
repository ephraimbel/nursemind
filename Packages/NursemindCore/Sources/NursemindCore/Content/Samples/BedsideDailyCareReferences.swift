import Foundation

private let bedside_fluid = CitationSource(
    id: "bedside_fluid",
    shortName: "Open RN — Section 15.6: Applying the nursing process to fluid balance",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals, 2nd edition (2024). Section 15.6: Applying the nursing process to fluid balance. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK610839/",
    lastRetrieved: "2026-09-17"
)

private let bedside_nutrition = CitationSource(
    id: "bedside_nutrition",
    shortName: "Open RN — Section 14.3: Applying the nursing process to nutrition",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals, 2nd edition (2024). Section 14.3: Applying the nursing process to nutrition. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK610830/",
    lastRetrieved: "2026-09-17"
)

private let bedside_sleep = CitationSource(
    id: "bedside_sleep",
    shortName: "Open RN — Section 12.3: Applying the nursing process to sleep and rest",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals, 2nd edition (2024). Section 12.3: Applying the nursing process to sleep and rest. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK610814/",
    lastRetrieved: "2026-09-17"
)

private let bedside_mobility = CitationSource(
    id: "bedside_mobility",
    shortName: "Open RN — Section 13.3: Applying the nursing process to mobility",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals, 2nd edition (2024). Section 13.3: Applying the nursing process to mobility. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK610826/",
    lastRetrieved: "2026-09-17"
)

private let bedside_oral_cdc = CitationSource(
    id: "bedside_oral_cdc",
    shortName: "CDC — Oral health and pneumonia prevention toolkit",
    detail: "March 27, 2024. Assessment and oral-care steps for nonventilated hospitalized patients; original CDC text condensed by NurseMind.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/healthcare-associated-infections/hcp/prevention-healthcare/oral-health-pneumonia-toolkit.html",
    lastRetrieved: "2026-09-17"
)

private let bedside_shea_2022 = CitationSource(
    id: "bedside_shea_2022",
    shortName: "SHEA/IDSA/APIC — Pneumonia prevention, 2022 update",
    detail: "Klompas M et al. Infect Control Hosp Epidemiol. 2022;43:687–713. doi:10.1017/ice.2022.88. Adult oral-care recommendations, manuscript pp. 11 and 14–15. CC BY 4.0; condensed by NurseMind.",
    publisher: "Cambridge University Press / SHEA",
    license: .ccBy4,
    url: "https://stacks.cdc.gov/view/cdc/150381/cdc_150381_DS1.pdf",
    lastRetrieved: "2026-09-17"
)

private let bedside_documentation = CitationSource(
    id: "bedside_documentation",
    shortName: "Open RN — Section 2.5: Documentation",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Fundamentals, 2nd edition (2024). Section 2.5: Documentation. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK610828/",
    lastRetrieved: "2026-09-17"
)

private let bedside_stool_nlm = CitationSource(
    id: "bedside_stool_nlm",
    shortName: "MedlinePlus — Stool collection for calprotectin testing",
    detail: "What happens during a calprotectin stool test? Original NLM collection guidance condensed by NurseMind. Assay-specific kit and laboratory instructions take precedence.",
    publisher: "National Library of Medicine",
    license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/calprotectin-stool-test/",
    lastRetrieved: "2026-09-17"
)

private let bedside_asepsis = CitationSource(
    id: "bedside_asepsis",
    shortName: "Open RN — Section 4.4: Sterile fields",
    detail: "Ernstmeyer K, Christman E, editors. Nursing Skills, 2nd edition (2023). Section 4.4: Sterile fields. Open RN prose adapted and condensed by NurseMind under CC BY 4.0; third-party tables and figures excluded.",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596727/",
    lastRetrieved: "2026-09-17"
)

private let bedside_pics_sccm = CitationSource(
    id: "bedside_pics_sccm",
    shortName: "SCCM — About ICU Liberation",
    detail: "Post-intensive care syndrome and ICU Liberation overview. Original factual summary; no reproduced scale or protocol.",
    publisher: "Society of Critical Care Medicine",
    license: .factCitationOnly,
    url: "https://www.sccm.org/clinical-resources/iculiberation-home/about",
    lastRetrieved: "2026-09-17"
)

private let bedside_rehab_sccm = CitationSource(
    id: "bedside_rehab_sccm",
    shortName: "SCCM — Rehabilitation professionals in ICU Liberation",
    detail: "Functional baseline, multidisciplinary rehabilitation, and communication during critical illness. Original factual summary.",
    publisher: "Society of Critical Care Medicine",
    license: .factCitationOnly,
    url: "https://www.sccm.org/blog/icu-liberation-the-role-of-rehabilitation-professionals",
    lastRetrieved: "2026-09-17"
)

private let bedside_alarm_ahrq = CitationSource(
    id: "bedside_alarm_ahrq",
    shortName: "AHRQ PSNet — Alert fatigue",
    detail: "Reviewed December 15, 2024. UC Davis PSNet Editorial Team. Original factual summary; contractor-authored content is not assumed to be public domain.",
    publisher: "AHRQ Patient Safety Network",
    license: .factCitationOnly,
    url: "https://psnet.ahrq.gov/primer/alert-fatigue",
    lastRetrieved: "2026-09-17"
)

public enum FluidBalanceMonitoringSample {
    public static let entry = ReferenceEntry(
        id: "fluid-balance-monitoring",
        title: "Intake, output and daily weights",
        subtitle: "Reliable measurement and interpretation of fluid trends",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes),
        sections: [
            .bullets(title: "Establish context", [
                AttributedBullet("Review intake, losses, medication use and the history of conditions such as kidney disease or heart failure. Fluid balance assessment combines the history with current examination findings.", citationIDs: ["bedside_fluid"]),
                AttributedBullet("Accurate intake and output over the observation period help interpret changes in weight. Assess trends rather than treating a single balance total as a complete description of volume status.", citationIDs: ["bedside_fluid"])
            ]),
            .bullets(title: "Make measurements comparable", [
                AttributedBullet("For daily weights, use the same scale, the same time of day and similar clothing. Differences in measurement conditions can obscure the clinical trend.", citationIDs: ["bedside_fluid"]),
                AttributedBullet("Compare the recorded intake and output with weight changes and the clinical examination. Unexpected or inconsistent findings need verification and clinical follow-up.", citationIDs: ["bedside_fluid"])
            ]),
            .bullets(title: "Look beyond the balance total", [
                AttributedBullet("Assess vital signs, pulse quality, lung sounds, edema, skin and mental status. Consider laboratory findings alongside the bedside assessment.", citationIDs: ["bedside_fluid"]),
                AttributedBullet("Edema can coexist with reduced intravascular volume. Visible swelling alone does not establish that circulating volume is adequate.", citationIDs: ["bedside_fluid"]),
                AttributedBullet("Communicate new breathing difficulty, mental-status change or other signs of worsening imbalance. Monitoring supports the prescribed plan; these observations do not independently determine a fluid or diuretic dose.", citationIDs: ["bedside_fluid"])
            ])
        ],
        citations: [bedside_fluid],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum BedsideNutritionAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "bedside-nutrition-assessment",
        title: "Bedside nutrition assessment",
        subtitle: "Recent intake, weight changes and barriers to eating",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Understand usual and recent intake", [
                AttributedBullet("Ask about the usual eating pattern and what the patient has recently eaten and drunk. A recent intake history adds detail that appetite alone may miss.", citationIDs: ["bedside_nutrition"]),
                AttributedBullet("Explore food preferences, allergies, cultural practices and prescribed dietary changes. Ask about access to food and ability to shop for or prepare meals.", citationIDs: ["bedside_nutrition"])
            ]),
            .bullets(title: "Identify barriers", [
                AttributedBullet("Assess chewing or swallowing difficulty, oral condition and symptoms that interfere with meals. Determine how much help is needed to eat.", citationIDs: ["bedside_nutrition"]),
                AttributedBullet("Review height, weight and the pattern of recent weight change. Consider physical findings and relevant laboratory results together with the intake history.", citationIDs: ["bedside_nutrition"])
            ]),
            .bullets(title: "Connect assessment with the care plan", [
                AttributedBullet("Record the actual intake pattern and specific barriers, such as poor appetite, difficulty swallowing or inability to manage meals independently.", citationIDs: ["bedside_nutrition"]),
                AttributedBullet("Share concerns about inadequate intake or swallowing with the care team so the nutrition plan and appropriate referrals can be evaluated.", citationIDs: ["bedside_nutrition"]),
                AttributedBullet("Reassess whether the plan improves intake and addresses the identified barriers. Therapeutic diet selection is a separate question from identifying why a patient is not eating.", citationIDs: ["bedside_nutrition"])
            ]),
            .bullets(title: "Connect screening with evidence", [
                AttributedBullet("A 2019 meta-analysis included 27 trials and 6,803 medical inpatients who were malnourished or at nutritional risk. It examined oral or enteral nutritional support in noncritically ill patients, not routine supplementation for all hospitalized adults.", citationIDs: ["bedside_evidence_nutrition_study"])
            ]),
            .bullets(title: "Understand the reported outcomes", [
                AttributedBullet("In trials contributing mortality data, deaths occurred in 8.3% of intervention participants and 11.0% of controls; the pooled odds ratio was 0.73, 95% confidence interval 0.56–0.97. Nonelective readmissions were also lower. Odds ratios and absolute event proportions describe different aspects of the result.", citationIDs: ["bedside_evidence_nutrition_study"])
            ]),
            .bullets(title: "Avoid inventing a feeding prescription", [
                AttributedBullet("Protocols and populations differed, and subgroup findings suggested benefit varied with nutritional status and adherence. These results support attention to malnutrition but do not supply a universal calorie, protein or fluid target. ICU, pediatric and disease-specific feeding decisions require their own assessment.", citationIDs: ["bedside_evidence_nutrition_study"])
            ]),
            .bullets(title: "Describe what prevents intake", [
                AttributedBullet("The evidence concerns delivered nutritional support rather than a completed screening form alone. The review reported improvements in energy and protein intake and weight; use those findings as context for a team-based nutrition plan, not as patient-specific treatment targets.", citationIDs: ["bedside_evidence_nutrition_study"])
            ])
        ],
        citations: [bedside_nutrition, BedsideEvidenceSources.nutrition_study],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HospitalSleepSupportSample {
    public static let entry = ReferenceEntry(
        id: "hospital-sleep-support",
        title: "Sleep and rest in hospital",
        subtitle: "Sleep history, environmental barriers and reassessment",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        sections: [
            .bullets(title: "Learn the normal routine", [
                AttributedBullet("Ask about usual bedtime, waking time, sleep quality and daytime alertness. Compare the hospital pattern with the patient’s baseline rather than assuming time in bed equals sleep.", citationIDs: ["bedside_sleep"]),
                AttributedBullet("Explore pain, anxiety, noise, light, temperature, unfamiliar surroundings and interruptions. Review known sleep problems and the patient’s usual strategies.", citationIDs: ["bedside_sleep"])
            ]),
            .bullets(title: "Support rest within the care plan", [
                AttributedBullet("Adjust avoidable light, noise and room discomfort, and support a familiar bedtime routine where practical.", citationIDs: ["bedside_sleep"]),
                AttributedBullet("Coordinate care to reduce unnecessary awakenings when the patient’s monitoring and treatment needs allow. Daytime activity and comfort measures should reflect the individual plan.", citationIDs: ["bedside_sleep"]),
                AttributedBullet("Address reported discomfort and worries with the care team. Sleep support begins with assessment of contributing factors rather than an automatic request for a sedative.", citationIDs: ["bedside_sleep"])
            ]),
            .bullets(title: "Reassess sleep quality", [
                AttributedBullet("Record the patient’s description of rest, observed awakenings and daytime effects. Note snoring or observed pauses in breathing for clinical follow-up.", citationIDs: ["bedside_sleep"]),
                AttributedBullet("Evaluate whether changes improve rest and whether new symptoms need further assessment. Persistent sleep concerns require a plan beyond reducing nighttime noise.", citationIDs: ["bedside_sleep"])
            ]),
            .bullets(title: "What the inpatient research shows", [
                AttributedBullet("A 2024 systematic review included 59 studies with 14,035 hospitalized adults; 28 studies were randomized trials. Environmental changes and relaxation approaches showed signals of benefit, but study methods and sleep measurements varied substantially.", citationIDs: ["bedside_evidence_sleep_study"])
            ]),
            .bullets(title: "Keep uncertainty visible", [
                AttributedBullet("The review found moderate to high risk of bias overall and could not pool interventions into a meta-analysis. Improved self-reported sleep does not establish better recovery or fewer complications. Evidence was insufficient to identify a single standard program for every ward.", citationIDs: ["bedside_evidence_sleep_study"])
            ]),
            .bullets(title: "Plan changes the patient can use", [
                AttributedBullet("Patient partners emphasized acceptability and feasibility. Eye masks or earplugs may be useful for some people; others need staff assistance. Clustering care and reducing light or noise require coordination, with necessary clinical monitoring taking precedence over sleep interventions.", citationIDs: ["bedside_evidence_sleep_study"])
            ]),
            .bullets(title: "Evaluate more than time in bed", [
                AttributedBullet("The authors recommend combining patient-reported sleep with objective measures in future evaluation. Reports of quality, awakenings and daytime effects can describe different aspects of rest. Study findings should not be converted into a promise that one device or relaxation technique will work for everyone.", citationIDs: ["bedside_evidence_sleep_study"])
            ])
        ],
        citations: [bedside_sleep, BedsideEvidenceSources.sleep_study],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum BedsideMobilityAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "bedside-mobility-assessment",
        title: "Bedside mobility assessment",
        subtitle: "Baseline function, current ability and assistance needs",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility),
        sections: [
            .bullets(title: "Establish the starting point", [
                AttributedBullet("Ask about usual activity, independence, devices and help at home. Compare that baseline with current pain, weakness, balance and ability to participate.", citationIDs: ["bedside_mobility"]),
                AttributedBullet("Mobility includes movement in bed, maintaining a seated position, transfers, standing and walking. Document which activities the patient can actually perform.", citationIDs: ["bedside_mobility"])
            ]),
            .bullets(title: "Assess the whole person", [
                AttributedBullet("Assess strength, coordination, range of motion and tolerance of activity as appropriate to the patient’s condition.", citationIDs: ["bedside_mobility"]),
                AttributedBullet("Consider the effects of immobility on respiratory and cardiovascular function, skin, bowel and bladder function, and psychosocial well-being.", citationIDs: ["bedside_mobility"]),
                AttributedBullet("Record assistance and equipment needs rather than a broad label such as ambulatory. A person may perform one activity independently and need help with another.", citationIDs: ["bedside_mobility"])
            ]),
            .bullets(title: "Plan and reassess with the team", [
                AttributedBullet("Use the assessment to individualize mobility goals and collaborate with rehabilitation staff when needed. Reassess tolerance and function as the condition changes.", citationIDs: ["bedside_mobility"]),
                AttributedBullet("The assessment describes current ability; transfer technique and equipment use require the applicable safe-handling procedure and care plan.", citationIDs: ["bedside_mobility"])
            ]),
            .bullets(title: "Evidence for inpatient walking", [
                AttributedBullet("A systematic review of hospital walking programs included 15 unique studies involving adults aged at least 65 years. Seven studies contributed to the main length-of-stay meta-analysis. Walking programs did not produce a statistically significant pooled reduction in length of stay.", citationIDs: ["bedside_evidence_walking"])
            ]),
            .bullets(title: "Choose an outcome that matches the goal", [
                AttributedBullet("Individual studies suggested benefits, but study methods and walking exposure varied. The authors cautioned that length of stay may not capture functional benefit. A non-significant hospital-stay result is not proof that walking has no value, and it does not establish a universal step target.", citationIDs: ["bedside_evidence_walking"])
            ]),
            .bullets(title: "Reassess activity tolerance", [
                AttributedBullet("Review current assistance and weight-bearing orders, then monitor the response to activity. Document symptoms, vital-sign response and actual assistance needs. Reassess dizziness or difficulty tolerating the activity before progressing; safe participation depends on the current assessment, not only the planned goal.", citationIDs: ["bedside_evidence_mobility"])
            ]),
            .bullets(title: "Keep program evidence within scope", [
                AttributedBullet("Only a minority of studies quantified walking dose using steps or distance. The review does not identify an optimal walking prescription for every older inpatient. Critical illness and individual restrictions need their own mobility plan and trained staff support.", citationIDs: ["bedside_evidence_walking"])
            ])
        ],
        citations: [bedside_mobility, BedsideEvidenceSources.walking, BedsideEvidenceSources.mobility],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HospitalOralCareSample {
    public static let entry = ReferenceEntry(
        id: "hospital-oral-care",
        title: "Hospital oral care",
        subtitle: "Oral assessment, brushing, dentures and assistance needs",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .infection),
        sections: [
            .bullets(title: "Assess before care", [
                AttributedBullet("For nonventilated hospitalized patients, assess teeth, gums, tongue, mucosa, dentures, discomfort and ability to perform oral care. Determine whether the person can safely rinse and spit.", citationIDs: ["bedside_oral_cdc"]),
                AttributedBullet("Identify swallowing or aspiration concerns and the assistance, positioning and equipment needed before beginning care.", citationIDs: ["bedside_oral_cdc"])
            ]),
            .bullets(title: "Match care to ability", [
                AttributedBullet("CDC’s toolkit recommends oral care at least twice daily, including toothbrushing. Use a soft toothbrush and an appropriate toothpaste; the approach differs when a patient cannot manage oral fluids.", citationIDs: ["bedside_oral_cdc"]),
                AttributedBullet("Patients who cannot spit may require suction-assisted care by trained staff. Follow the facility plan and product instructions, with attention to avoiding pooled fluid.", citationIDs: ["bedside_oral_cdc"]),
                AttributedBullet("Clean dentures separately with a denture brush and appropriate cleanser; ordinary toothpaste can damage dentures. Label the storage container and follow denture-care instructions.", citationIDs: ["bedside_oral_cdc"])
            ]),
            .bullets(title: "Reassess and document", [
                AttributedBullet("Record mouth findings, care provided, assistance needed and barriers such as pain or refusal. Reassess oral comfort and unresolved problems.", citationIDs: ["bedside_oral_cdc"])
            ]),
            .bullets(title: "Adult mechanical ventilation", [
                AttributedBullet("SHEA/IDSA/APIC’s adult pneumonia-prevention guidance supports daily toothbrushing without routine oral chlorhexidine. Use the relevant ventilated-patient protocol rather than extending a general ward routine to every airway situation.", citationIDs: ["bedside_shea_2022"])
            ]),
            .bullets(title: "Evidence behind toothbrushing", [
                AttributedBullet("A 2024 meta-analysis of 15 randomized trials compared oral care with and without toothbrushing in hospitalized adults. After adjustment for a cluster trial, the effective sample was 2,786. Pneumonia risk was lower with toothbrushing: risk ratio 0.67, 95% confidence interval 0.56–0.81.", citationIDs: ["bedside_evidence_brushing"])
            ]),
            .bullets(title: "Separate ventilated and ward evidence", [
                AttributedBullet("The clearest evidence came from patients receiving invasive mechanical ventilation. Evidence in nonventilated patients was limited and less certain. The overall relative result should not be presented as a guaranteed ward-level benefit or a patient’s personal risk reduction.", citationIDs: ["bedside_evidence_brushing"])
            ]),
            .bullets(title: "Keep research distinct from the care protocol", [
                AttributedBullet("Toothbrushing was also associated with lower ICU mortality and shorter ventilation and ICU stay. Hospital length of stay and antibiotic use did not clearly differ. These findings do not establish that every mouth-care product or antiseptic has the same benefit.", citationIDs: ["bedside_evidence_brushing"])
            ]),
            .bullets(title: "Plan for physical barriers", [
                AttributedBullet("CDC’s nonventilated-patient toolkit includes the oral-health history, pain, dry mouth, dentures and ability to manage oral care. Supplies need to be available, and the assistance plan should account for swallowing difficulty or inability to spit. Reassess barriers rather than recording only that products were supplied.", citationIDs: ["bedside_oral_cdc"])
            ])
        ],
        citations: [bedside_oral_cdc, bedside_shea_2022, BedsideEvidenceSources.brushing],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum NursingDocumentationSample {
    public static let entry = ReferenceEntry(
        id: "nursing-documentation-principles",
        title: "Nursing documentation principles",
        subtitle: "Objective findings, timely charting and response to care",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "Describe what happened", [
                AttributedBullet("Documentation should be factual, objective and professional. Distinguish what the patient reports from what the nurse directly observes or performs.", citationIDs: ["bedside_documentation"]),
                AttributedBullet("Describe findings and behavior specifically. Avoid unsupported conclusions or judgmental labels that do not explain the observation.", citationIDs: ["bedside_documentation"])
            ]),
            .bullets(title: "Keep the record accurate", [
                AttributedBullet("Chart care after it is completed, as promptly as possible. Include the appropriate date, time and author identification; do not document planned care as already performed.", citationIDs: ["bedside_documentation"]),
                AttributedBullet("Document only what was personally assessed or performed, following the organization’s documentation policy.", citationIDs: ["bedside_documentation"]),
                AttributedBullet("Correct errors using the approved process that preserves the original record and its audit trail. Follow policy for late entries rather than making the record appear contemporaneous.", citationIDs: ["bedside_documentation"])
            ]),
            .bullets(title: "Connect findings, action and response", [
                AttributedBullet("DAR organizes a focused note as Data, Action and Response: the relevant findings, the care or communication that followed, and the patient’s response.", citationIDs: ["bedside_documentation"]),
                AttributedBullet("Use the organization’s required format. A structured template supports consistency, but its normal findings must still reflect the assessment actually completed.", citationIDs: ["bedside_documentation"])
            ])
        ],
        citations: [bedside_documentation],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum StoolSampleCollectionSample {
    public static let entry = ReferenceEntry(
        id: "stool-sample-collection",
        title: "Stool sample collection",
        subtitle: "Clean collection and following the laboratory’s kit instructions",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Use the correct instructions", [
                AttributedBullet("Confirm the laboratory’s collection kit and instructions for the ordered stool test. The cited MedlinePlus guidance describes calprotectin collection; other assays may require different containers or handling.", citationIDs: ["bedside_stool_nlm"]),
                AttributedBullet("Explain the collection method before the patient uses the toilet so a sample is not lost or contaminated.", citationIDs: ["bedside_stool_nlm"])
            ]),
            .bullets(title: "Keep the sample separate", [
                AttributedBullet("Collect stool in the clean, dry collection device supplied or specified for the test. Avoid mixing the specimen with urine, toilet water or toilet paper.", citationIDs: ["bedside_stool_nlm"]),
                AttributedBullet("Transfer the amount requested using the kit instructions and close the specimen container securely. Wash hands thoroughly with soap and water after collection.", citationIDs: ["bedside_stool_nlm"])
            ]),
            .bullets(title: "Label and return as instructed", [
                AttributedBullet("Label the container with the required patient information and collection date and time using the facility’s specimen process.", citationIDs: ["bedside_stool_nlm"]),
                AttributedBullet("Follow the laboratory’s return deadline and storage instructions. Do not assume that every stool test uses the same preservative or storage conditions.", citationIDs: ["bedside_stool_nlm"])
            ])
        ],
        citations: [bedside_stool_nlm],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum SterileFieldPrinciplesSample {
    public static let entry = ReferenceEntry(
        id: "sterile-field-principles",
        title: "Aseptic technique and sterile fields",
        subtitle: "Preparation, field boundaries and recognizing contamination",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .infection),
        sections: [
            .bullets(title: "Prepare the field", [
                AttributedBullet("A sterile field protects sterile supplies during a procedure. Prepare a clean, dry working surface and check packaging integrity, expiration information and applicable sterilization indicators.", citationIDs: ["bedside_asepsis"]),
                AttributedBullet("Open supplies close to the time of use. Arrange the work so the field can remain visible and protected during the procedure.", citationIDs: ["bedside_asepsis"])
            ]),
            .bullets(title: "Maintain the boundary", [
                AttributedBullet("Only sterile items contact the sterile field. The outside of packaging and the field’s outer border are not treated as sterile.", citationIDs: ["bedside_asepsis"]),
                AttributedBullet("Keep the field in view and above waist level. Avoid reaching over it or turning away in a way that leaves its condition unobserved.", citationIDs: ["bedside_asepsis"]),
                AttributedBullet("Moisture can allow contamination to pass through a barrier. Avoid splashing and do not assume a wet field remains sterile.", citationIDs: ["bedside_asepsis"])
            ]),
            .bullets(title: "Respond to a break in technique", [
                AttributedBullet("An item that contacts a nonsterile surface is contaminated. Replace affected supplies and reestablish the sterile field when its integrity is compromised.", citationIDs: ["bedside_asepsis"]),
                AttributedBullet("These principles accompany the procedure-specific technique and equipment instructions. Sterile gloves alone do not make surrounding surfaces or touched objects sterile.", citationIDs: ["bedside_asepsis"])
            ])
        ],
        citations: [bedside_asepsis],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum PostICURecoverySample {
    public static let entry = ReferenceEntry(
        id: "post-icu-recovery",
        title: "Recovery after intensive care",
        subtitle: "Post-intensive care syndrome and functional recovery",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .mobility),
        sections: [
            .bullets(title: "Recognize the recovery needs", [
                AttributedBullet("Post-intensive care syndrome, or PICS, describes new or worsened physical, cognitive or mental-health problems after critical illness. Survival and transfer out of the ICU do not necessarily mean return to baseline function.", citationIDs: ["bedside_pics_sccm"])
            ]),
            .bullets(title: "Make the baseline visible", [
                AttributedBullet("Compare current mobility, self-care and cognition with the person’s abilities before illness. Rehabilitation assessment also considers the home environment and available support.", citationIDs: ["bedside_rehab_sccm"])
            ]),
            .bullets(title: "Coordinate recovery", [
                AttributedBullet("Physical, occupational, speech-language and respiratory professionals contribute different expertise. Functional goals and family participation help connect ICU care with recovery needs.", citationIDs: ["bedside_rehab_sccm"]),
                AttributedBullet("ICU Liberation addresses pain, sedation, delirium, mobility and family engagement as connected aspects of critical-care recovery.", citationIDs: ["bedside_pics_sccm"])
            ])
        ],
        citations: [bedside_pics_sccm, bedside_rehab_sccm],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum AlarmFatigueReferenceSample {
    public static let entry = ReferenceEntry(
        id: "alarm-fatigue-and-safety",
        title: "Alarm fatigue and safety",
        subtitle: "Understanding desensitization and improving alarm systems",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
        sections: [
            .bullets(title: "Why alarms lose effectiveness", [
                AttributedBullet("Repeated alerts that rarely require action can desensitize clinicians. Alarm fatigue can contribute to delayed responses or missed important alerts in a busy care environment.", citationIDs: ["bedside_alarm_ahrq"])
            ]),
            .bullets(title: "Treat the pattern as a system problem", [
                AttributedBullet("Effective improvement involves clinicians, organizational leaders and the people who design or configure alert systems. Education alone does not resolve a poorly designed stream of alerts.", citationIDs: ["bedside_alarm_ahrq"]),
                AttributedBullet("Human-factors approaches examine which alerts are useful, how urgency is communicated and whether the alert reaches the appropriate person at the appropriate point in care.", citationIDs: ["bedside_alarm_ahrq"])
            ]),
            .bullets(title: "Use governed improvement", [
                AttributedBullet("Changes to alert design, prioritization and workflow need organizational oversight and evaluation of unintended effects. There is no single universally effective solution.", citationIDs: ["bedside_alarm_ahrq"]),
                AttributedBullet("This reference explains the safety problem and improvement approach; it does not define bedside alarm limits or authorize disabling patient-monitor alarms.", citationIDs: ["bedside_alarm_ahrq"])
            ])
        ],
        citations: [bedside_alarm_ahrq],
        lastSourceFidelityReview: "2026-09-17"
    )
}
