import Foundation

private let depth5_hbv_care = CitationSource(
    id: "depth5_hbv_care",
    shortName: "Treatment of Hepatitis B",
    detail: "Chronic hepatitis B follow-up, liver checks and medicine review; January 12, 2024. Acute-treatment generalizations and fixed monitoring intervals excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/hepatitis-b/treatment/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth5_hbv_prevention = CitationSource(
    id: "depth5_hbv_prevention",
    shortName: "Hepatitis B Prevention and Control",
    detail: "Transmission, household prevention and vaccination discussions; January 31, 2025. Age-based schedules and perinatal algorithms excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/hepatitis-b/prevention/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth5_hcv_care = CitationSource(
    id: "depth5_hcv_care",
    shortName: "Clinical Care of Hepatitis C",
    detail: "Pretreatment assessment, HBV reactivation, medicine interactions and reinfection prevention; January 31, 2025. The page’s abbreviated cure-timing wording is not used; completion-based timing is sourced separately. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/hepatitis-c/hcp/clinical-care/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth5_hcv_support = CitationSource(
    id: "depth5_hcv_support",
    shortName: "Treatment of Hepatitis C",
    detail: "Linkage to treatment, vaccination discussions and ongoing care with cirrhosis; December 20, 2023. Numerical cure rates and generic treatment durations excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/hepatitis-c/treatment/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth5_hcv_svr = CitationSource(
    id: "depth5_hcv_svr",
    shortName: "HCV Guidance: Monitoring Before, During and After Treatment",
    detail: "Recommended monitoring: quantitative HCV RNA at 12 or more weeks after completion to document SVR; live guidance retrieved September 17, 2026. No claim that this is the only confirmation pathway; guidance also discusses selected earlier assessment. Clinical facts paraphrased by NurseMind; no source text, tables or algorithms reproduced. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "American Association for the Study of Liver Diseases and Infectious Diseases Society of America",
    license: .factCitationOnly,
    url: "https://www.hcvguidelines.org/guidance/monitoring-patients-who-are-starting-hcv-treatment-are-on-treatment-or-have-completed-therapy/",
    lastRetrieved: "2026-09-17"
)

private let depth5_tb_basics = CitationSource(
    id: "depth5_tb_basics",
    shortName: "About Inactive Tuberculosis",
    detail: "Inactive versus active disease and evaluation after a positive infection test; January 16, 2025. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/tb/about/inactive-tuberculosis.html",
    lastRetrieved: "2026-09-17"
)

private let depth5_tb_care = CitationSource(
    id: "depth5_tb_care",
    shortName: "Treatment for Latent Tuberculosis Infection",
    detail: "Treatment considerations, monthly clinical monitoring, adverse-reaction teaching, completion support and post-treatment documentation; April 17, 2025. Regimen tables, pediatric doses and liver-test stopping thresholds excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/tb/hcp/treatment/latent-tuberculosis-infection.html",
    lastRetrieved: "2026-09-17"
)

private let depth5_hiv_adherence = CitationSource(
    id: "depth5_hiv_adherence",
    shortName: "HIV Treatment Adherence",
    detail: "Importance of medication adherence, appointments and ongoing monitoring; reviewed January 13, 2025. Source table not reproduced. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "National Institutes of Health, Office of AIDS Research",
    license: .publicDomain,
    url: "https://hivinfo.nih.gov/understanding-hiv/fact-sheets/hiv-treatment-adherence",
    lastRetrieved: "2026-09-17"
)

private let depth5_hiv_plan = CitationSource(
    id: "depth5_hiv_plan",
    shortName: "Following an HIV Treatment Regimen: Steps Before and After Starting Medicines",
    detail: "Daily routines, medicine review, adherence barriers, reminders, travel and refill planning; reviewed January 14, 2025. Generic missed-dose timing excluded. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "National Institutes of Health, Office of AIDS Research",
    license: .publicDomain,
    url: "https://hivinfo.nih.gov/understanding-hiv/fact-sheets/following-hiv-treatment-regimen-steps-take-and-after-starting-hiv",
    lastRetrieved: "2026-09-17"
)

public enum HepatitisBContinuitySample {
    public static let entry = ReferenceEntry(
        id: "hepatitis-b-daily-care-prevention",
        title: "Hepatitis B: ongoing care and prevention",
        subtitle: "Liver monitoring, medicine review and household teaching",
        eyebrow: "REFERENCE · INFECTION & FOLLOW-UP",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        sections: [
            .bullets(title: "Explain ongoing follow-up", [
                AttributedBullet("Chronic hepatitis B needs regular liver assessment even when antiviral medicine is not prescribed. Treatment depends on the infection and liver health.", citationIDs: ["depth5_hbv_care"]),
                AttributedBullet("Some people need long-term antiviral treatment. Review the prescribed plan and side effects with the treating team.", citationIDs: ["depth5_hbv_care"])
            ]),
            .bullets(title: "Protect liver health", [
                AttributedBullet("Discuss alcohol use and review medicines or nutritional supplements with the clinician before starting them. Include diet and activity in ongoing care.", citationIDs: ["depth5_hbv_care"]),
                AttributedBullet("Discuss hepatitis A vaccination and testing for hepatitis C and HIV; the clinician may also consider hepatitis D testing.", citationIDs: ["depth5_hbv_care"])
            ]),
            .bullets(title: "Reduce blood and body-fluid exposure", [
                AttributedBullet("HBV can spread through blood, sexual exposure and shared injection equipment. Toothbrushes, razors and contaminated glucose-monitoring equipment can also transmit infection.", citationIDs: ["depth5_hbv_prevention"]),
                AttributedBullet("Avoid sharing items that may carry blood. Discuss household testing and vaccination needs with the healthcare team.", citationIDs: ["depth5_hbv_prevention"])
            ]),
            .bullets(title: "Correct misconceptions", [
                AttributedBullet("HBV is not spread by hugging, coughing, sneezing or sharing utensils. Routine social contact does not require isolation.", citationIDs: ["depth5_hbv_prevention"]),
                AttributedBullet("Pregnancy requires coordinated care because HBV can pass to the baby at birth. Discuss the maternal and infant prevention plan with the obstetric team.", citationIDs: ["depth5_hbv_prevention"])
            ])
        ],
        citations: [depth5_hbv_care, depth5_hbv_prevention],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HepatitisCContinuitySample {
    public static let entry = ReferenceEntry(
        id: "hepatitis-c-treatment-follow-up",
        title: "Hepatitis C: treatment and follow-up",
        subtitle: "Preparing for therapy, confirming response and continued care",
        eyebrow: "REFERENCE · INFECTION & FOLLOW-UP",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        sections: [
            .bullets(title: "Connect diagnosis with treatment", [
                AttributedBullet("Effective oral treatment can cure hepatitis C. Arrange timely discussion with a treating clinician rather than waiting for symptoms to become severe.", citationIDs: ["depth5_hcv_support"]),
                AttributedBullet("Pretreatment care includes assessing liver disease and testing for HBV and HIV. The clinician selects the treatment and monitoring plan.", citationIDs: ["depth5_hcv_care"])
            ]),
            .bullets(title: "Check interactions and coinfection", [
                AttributedBullet("Review prescription medicines, OTC products and herbal supplements before antiviral therapy. Potential interactions need assessment by the treating team.", citationIDs: ["depth5_hcv_svr"]),
                AttributedBullet("Hepatitis B can reactivate during HCV antiviral therapy in people with HBV infection. Review HBV screening and any required monitoring before treatment.", citationIDs: ["depth5_hcv_care"])
            ]),
            .bullets(title: "Confirm treatment response", [
                AttributedBullet("Arrange the prescribed post-treatment HCV RNA test. AASLD/IDSA recommends testing at least 12 weeks after completion to document sustained virologic response, consistent with cure.", citationIDs: ["depth5_hcv_svr"]),
                AttributedBullet("Confirmation timing can be individualized under current guidance, which also describes earlier assessment for selected patients. Follow the treating team’s testing plan.", citationIDs: ["depth5_hcv_svr"])
            ]),
            .bullets(title: "Continue prevention and liver care", [
                AttributedBullet("Cure does not prevent reinfection. Discuss avoiding shared injection equipment and other blood exposure.", citationIDs: ["depth5_hcv_care"]),
                AttributedBullet("Hepatitis C has no protective vaccine. Discuss hepatitis A and B vaccination and liver-health measures. People with cirrhosis still need regular liver follow-up.", citationIDs: ["depth5_hcv_support"])
            ])
        ],
        citations: [depth5_hcv_care, depth5_hcv_support, depth5_hcv_svr],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum LatentTBContinuitySample {
    public static let entry = ReferenceEntry(
        id: "latent-tb-treatment-support",
        title: "Latent TB: treatment support and follow-up",
        subtitle: "Explaining prevention, medicine safety and completion records",
        eyebrow: "REFERENCE · INFECTION & FOLLOW-UP",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        sections: [
            .bullets(title: "Distinguish infection from active disease", [
                AttributedBullet("People with inactive or latent TB have no TB symptoms and cannot spread TB germs. Treatment helps prevent later active disease.", citationIDs: ["depth5_tb_basics"]),
                AttributedBullet("A positive infection test needs clinical evaluation. Active TB disease must be excluded before latent-TB treatment starts.", citationIDs: ["depth5_tb_care"])
            ]),
            .bullets(title: "Prepare for the prescribed regimen", [
                AttributedBullet("Review all medicines and contraception with the clinician: rifamycins have important interactions, including reduced effectiveness of hormonal contraception.", citationIDs: ["depth5_tb_care"]),
                AttributedBullet("CDC recommends at least monthly assessment of adherence, TB symptoms and adverse reactions. Laboratory monitoring is individualized.", citationIDs: ["depth5_tb_care"])
            ]),
            .bullets(title: "Teach the adverse-reaction plan", [
                AttributedBullet("CDC advises stopping TB medicines and seeking immediate medical attention for possible adverse reactions such as jaundice, dark urine, persistent nausea, numbness, visual changes or rash.", citationIDs: ["depth5_tb_care"]),
                AttributedBullet("Rifampin or rifapentine can harmlessly turn body fluids orange and permanently stain contact lenses. Distinguish this expected discoloration from concerning symptoms.", citationIDs: ["depth5_tb_care"])
            ]),
            .bullets(title: "Support completion and future care", [
                AttributedBullet("Use agreed reminders and address transport, cost or language barriers with the TB program. Discuss missed treatment promptly.", citationIDs: ["depth5_tb_care"]),
                AttributedBullet("Keep test, chest-radiograph and treatment records. TB infection tests may remain positive after treatment; new TB symptoms still require assessment.", citationIDs: ["depth5_tb_care"])
            ])
        ],
        citations: [depth5_tb_basics, depth5_tb_care],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HIVAdherenceContinuitySample {
    public static let entry = ReferenceEntry(
        id: "hiv-treatment-continuity-support",
        title: "HIV: supporting treatment continuity",
        subtitle: "Routines, refill planning and barriers to ongoing care",
        eyebrow: "REFERENCE · INFECTION & FOLLOW-UP",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .infection),
        sections: [
            .bullets(title: "Explain the purpose of continued care", [
                AttributedBullet("Adherence includes taking the prescribed HIV regimen and keeping appointments. Ongoing monitoring checks that treatment continues to control the virus.", citationIDs: ["depth5_hiv_adherence"]),
                AttributedBullet("Missed treatment can permit viral multiplication and drug resistance. Discuss difficulties openly so the team can help.", citationIDs: ["depth5_hiv_adherence"])
            ]),
            .bullets(title: "Make the plan fit daily life", [
                AttributedBullet("Ask about swallowing difficulty, side effects, housing, transport, costs and fear of judgment. These barriers deserve practical support.", citationIDs: ["depth5_hiv_plan"]),
                AttributedBullet("Review the person’s routine and obtain written instructions for the actual regimen. Include prescription drugs, OTC products, vitamins and herbs in the interaction review.", citationIDs: ["depth5_hiv_plan"])
            ]),
            .bullets(title: "Prevent avoidable gaps", [
                AttributedBullet("For oral medicines, agreed reminders, an appropriate organizer or a medication diary can help. Choose an approach the person can maintain.", citationIDs: ["depth5_hiv_plan"]),
                AttributedBullet("Plan ahead for travel, weekends and holidays. Refill prescriptions before they run out and keep scheduled medical appointments.", citationIDs: ["depth5_hiv_plan"])
            ]),
            .bullets(title: "Review problems early", [
                AttributedBullet("Report side effects and difficulty following instructions to the treating team. Ask for advice when a dose or appointment is missed.", citationIDs: ["depth5_hiv_plan"]),
                AttributedBullet("Use follow-up visits to revisit barriers and connect with support. HIV treatment is ongoing, so the plan must remain workable over time.", citationIDs: ["depth5_hiv_adherence"])
            ])
        ],
        citations: [depth5_hiv_adherence, depth5_hiv_plan],
        lastSourceFidelityReview: "2026-09-17"
    )
}
