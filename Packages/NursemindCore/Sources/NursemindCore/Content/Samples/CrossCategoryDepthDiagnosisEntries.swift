import Foundation

private let cc_depth_aat = CitationSource(
    id: "cc_depth_aat",
    shortName: "NHLBI — Alpha-1 antitrypsin deficiency",
    detail: "October 2023. Inheritance, pulmonary and hepatic symptoms, blood/genetic testing and treatment overview. No augmentation-therapy dosing. Federal educational text condensed; no images, videos or third-party material. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/alpha-1-antitrypsin-deficiency",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_apnea = CitationSource(
    id: "cc_depth_apnea",
    shortName: "NHLBI — Sleep apnea",
    detail: "January 2025. Central versus obstructive mechanisms and general sleep-apnea symptoms. No inference that airway surgery treats central apnea. Federal educational text condensed; no images, videos or third-party material. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/sleep-apnea",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_apnea_causes = CitationSource(
    id: "cc_depth_apnea_causes",
    shortName: "NHLBI — Sleep apnea — Causes",
    detail: "January 2025. Central-apnea risk factors; obstructive-apnea risk factors not relabeled as central apnea. Federal educational text condensed; no images, videos or third-party material. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/sleep-apnea/causes",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_apnea_diagnosis = CitationSource(
    id: "cc_depth_apnea_diagnosis",
    shortName: "NHLBI — Sleep apnea — Diagnosis",
    detail: "January 2025. Sleep study, sleep diary, medication and altitude history. Federal educational text condensed; no images, videos or third-party material. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/sleep-apnea/diagnosis",
    lastRetrieved: "2026-09-17"
)

public enum CCDepthAlpha1AntitrypsinDeficiencySample {
    public static let entry = DiagnosisEntry(
        id: "alpha-1-antitrypsin-deficiency",
        title: "Alpha-1 antitrypsin deficiency",
        subtitle: "Inherited risk for lung and liver disease",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        definition: AttributedProse("Alpha-1 antitrypsin (AAT) deficiency is an inherited condition that increases the risk of lung and liver disease. AAT is made in the liver and helps protect the lungs. The effect varies: some people have no symptoms, while others develop significant disease.", citationIDs: ["cc_depth_aat"]),
        pathophysiology: AttributedProse("Too little protective AAT leaves the lungs more vulnerable to smoking, dust and pollution and may lead to COPD or bronchiectasis. AAT-related disease can also affect the liver. Inherited changes in the AAT genes influence risk; inheritance alone does not predict the same course for every family member.", citationIDs: ["cc_depth_aat"]),
        presentation: [
            AttributedBullet("Respiratory symptoms can include an ongoing cough, shortness of breath and wheezing. Some patients are initially treated for asthma because the symptoms overlap.", citationIDs: ["cc_depth_aat"]),
            AttributedBullet("Liver involvement may present with jaundice and leg swelling. Rare skin manifestations include painful lumps or patches. Absence of symptoms does not exclude an inherited deficiency.", citationIDs: ["cc_depth_aat"])
        ],
        diagnosticCriteria: [
            AttributedBullet("A blood test measures AAT protein. Genetic testing can confirm the deficiency and identify the gene change; a genetic counselor can help explain testing and its implications.", citationIDs: ["cc_depth_aat"]),
            AttributedBullet("Pulmonary function testing may be used to assess the lungs when COPD is related to AAT deficiency. Family history and personal lung or liver disease help inform the evaluation.", citationIDs: ["cc_depth_aat"])
        ],
        priorityAssessments: [
            AttributedBullet("Review current respiratory symptoms, tobacco exposure, environmental irritants and family history of AAT deficiency or lung and liver disease. Discuss unexplained liver findings along with the respiratory history.", citationIDs: ["cc_depth_aat"])
        ],
        commonInterventions: [
            AttributedBullet("Avoiding smoking, secondhand smoke, dust and pollution helps protect the lungs. COPD care may include inhaled treatment, vaccination, rehabilitation and oxygen when prescribed; selection depends on the clinical assessment.", citationIDs: ["cc_depth_aat"]),
            AttributedBullet("Some people with emphysema receive lifelong augmentation therapy to raise AAT levels and slow lung damage. This is a clinician-selected treatment, not a universal treatment for every low blood level.", citationIDs: ["cc_depth_aat"]),
            AttributedBullet("Genetic counseling can support decisions about testing and family planning. Patients and families may need help understanding carrier status and the variable effect of inherited changes.", citationIDs: ["cc_depth_aat"])
        ],
        watchFor: [
            AttributedBullet("The disease can affect both lung and liver health, so respiratory follow-up alone may not address the full presentation. Report new jaundice, leg swelling or changing respiratory symptoms for evaluation.", citationIDs: ["cc_depth_aat"])
        ],
        citations: [cc_depth_aat],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CCDepthCentralSleepApneaSample {
    public static let entry = DiagnosisEntry(
        id: "central-sleep-apnea",
        title: "Central sleep apnea",
        subtitle: "Sleep-related pauses from impaired breathing signals",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        definition: AttributedProse("Central sleep apnea occurs when the brain does not send the signals needed for breathing during sleep. It differs from obstructive apnea, where the upper airway repeatedly narrows or becomes blocked. A sleep study helps determine the type and severity.", citationIDs: ["cc_depth_apnea", "cc_depth_apnea_diagnosis"]),
        pathophysiology: AttributedProse("Conditions affecting brain control of the airways and chest muscles can disrupt breathing signals. NHLBI lists heart failure, stroke and selected neurological disorders among central-apnea risk factors. Long-term opioid exposure can also interfere with control of breathing during sleep.", citationIDs: ["cc_depth_apnea_causes"]),
        presentation: [
            AttributedBullet("Sleep apnea may be noticed as repeated pauses or gasping during sleep, poor sleep quality or excessive daytime sleepiness. These findings alone do not distinguish central from obstructive events.", citationIDs: ["cc_depth_apnea", "cc_depth_apnea_diagnosis"]),
            AttributedBullet("Poor sleep may affect concentration, memory, decision-making and behavior. The history should include daytime effects rather than focusing only on the overnight breathing description.", citationIDs: ["cc_depth_apnea"])
        ],
        diagnosticCriteria: [
            AttributedBullet("A sleep specialist or sleep center evaluates the pattern with a sleep study. NHLBI describes the study as a way to establish both the apnea type and how serious it is.", citationIDs: ["cc_depth_apnea_diagnosis"]),
            AttributedBullet("A sleep diary can record duration, quality and daytime sleepiness. The clinician may evaluate other contributing conditions and ask about medicines or recent travel to higher altitude.", citationIDs: ["cc_depth_apnea_diagnosis"])
        ],
        priorityAssessments: [
            AttributedBullet("Review opioid medicines and relevant cardiac or neurological history with the care team. These risk factors prompt assessment; they do not establish central apnea without evaluation.", citationIDs: ["cc_depth_apnea_causes", "cc_depth_apnea_diagnosis"]),
            AttributedBullet("Ask about witnessed breathing pauses, sleep quality and daytime functioning, and bring those observations to the sleep evaluation.", citationIDs: ["cc_depth_apnea", "cc_depth_apnea_diagnosis"])
        ],
        commonInterventions: [
            AttributedBullet("Support specialist evaluation and follow-up using the sleep-study findings, medication history and associated conditions. The source distinguishes apnea mechanisms; a general airway-opening treatment overview is not a central-apnea device-selection algorithm.", citationIDs: ["cc_depth_apnea", "cc_depth_apnea_diagnosis"])
        ],
        watchFor: [
            AttributedBullet("Sleep apnea can reduce oxygen delivery during sleep and is associated with serious health problems when untreated. A seemingly acceptable spot oxygen reading does not identify the type of overnight apnea; the sleep study addresses that question.", citationIDs: ["cc_depth_apnea", "cc_depth_apnea_diagnosis"])
        ],
        citations: [cc_depth_apnea, cc_depth_apnea_causes, cc_depth_apnea_diagnosis],
        lastSourceFidelityReview: "2026-09-17"
    )
}
