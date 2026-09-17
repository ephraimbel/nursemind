import Foundation

private let icu_depth_oxygen = CitationSource(
    id: "icu_depth_oxygen", shortName: "Open RN — Oxygen Therapy, chapter 11",
    detail: "Nursing Skills, 2nd edition (2023), sections 11.2–11.6. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and linked third-party material excluded. Source-fidelity check is not independent clinical review.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596733/", lastRetrieved: "2026-09-17"
)

private let icu_depth_fda = CitationSource(
    id: "icu_depth_fda", shortName: "FDA — Pulse oximeters",
    detail: "Federal device information, use limitations and skin-pigmentation concerns. Adapted and condensed by NurseMind. Regulatory draft guidance is not represented as a finalized clinical standard. Source-fidelity check is not independent clinical review.",
    publisher: "U.S. Food and Drug Administration", license: .publicDomain,
    url: "https://www.fda.gov/medical-devices/products-and-medical-procedures/pulse-oximeters", lastRetrieved: "2026-09-17"
)

private let icu_depth_pva_cpg = CitationSource(
    id: "icu_depth_pva_cpg", shortName: "AARC — Patient–ventilator assessment (2024)",
    detail: "Goodfellow et al. Respir Care. 2024;69:1042–1054. doi:10.4187/respcare.12007. Brief original paraphrase of assessment recommendations; no copied table, figure or algorithm. Source-fidelity check is not independent clinical review.",
    publisher: "American Association for Respiratory Care / Daedalus Enterprises", license: .factCitationOnly,
    url: "https://www.aarc.org/wp-content/uploads/2024/10/patient-ventilator-assessment-aarc-cpg.pdf", lastRetrieved: "2026-09-17"
)

private let icu_depth_vent = CitationSource(
    id: "icu_depth_vent", shortName: "NHLBI — Ventilator support: what to expect",
    detail: "Federal patient-education prose adapted and condensed by NurseMind; updated March 24, 2022. Sections on monitoring, ongoing care and ventilator removal. Images and third-party animations excluded. Source-fidelity check is not independent clinical review.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/ventilator/what-to-expect", lastRetrieved: "2026-09-17"
)

public enum ICUDepthOxygenDeviceBedsideChecksSample {
    public static let entry = ReferenceEntry(
        id: "oxygen-device-bedside-checks", title: "Oxygen devices: bedside checks",
        subtitle: "Delivery system, fit, supply and reassessment", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Confirm the delivery plan", [
                AttributedBullet("Oxygen therapy includes a device, a prescribed flow or oxygen concentration, and an intended oxygenation response. Compare the equipment in use with the current order or emergency protocol; a device name alone does not describe the support being delivered.", citationIDs: ["icu_depth_oxygen"]),
                AttributedBullet("A low-flow nasal cannula and a heated high-flow system are different devices. Increasing the flow on a standard cannula does not turn it into a high-flow system.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Trace the oxygen supply", [
                AttributedBullet("Check that the source is functioning and that tubing is connected, open and not kinked. With a portable cylinder, check the remaining supply; an attached cannula does not prove oxygen is flowing.", citationIDs: ["icu_depth_oxygen"]),
                AttributedBullet("Reassess the oxygen pathway after movement, personal care or a device change. Verify the source, connection and position of the interface as part of that reassessment.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Recognize mask-specific concerns", [
                AttributedBullet("Simple masks have exhalation openings that must remain unobstructed. A nonrebreather relies on an inflated reservoir and functioning valves; reservoir collapse during inspiration warrants an immediate equipment and support assessment.", citationIDs: ["icu_depth_oxygen"]),
                AttributedBullet("A Venturi system uses a device-specific adapter and specified flow to deliver its intended oxygen concentration. Follow the adapter instructions and prescribed settings rather than assuming all masks deliver the same oxygen concentration.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Protect comfort and skin", [
                AttributedBullet("Assess contact points at the ears, nose and cheeks for pressure or irritation. Check fit and tubing tension while maintaining delivery. Dryness and discomfort can reduce tolerance and should be addressed with the care team.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Reassess the person", [
                AttributedBullet("Document the device and settings with respiratory rate, effort, breath sounds, mental status and oxygenation response. A worsening examination deserves prompt escalation even if the device appears correctly assembled.", citationIDs: ["icu_depth_oxygen"]),
                AttributedBullet("Pulse oximetry is an estimate. FDA advises interpreting readings with symptoms; concerns about performance across skin pigmentation reinforce the need for clinical assessment.", citationIDs: ["icu_depth_fda"])
            ])
        ],
        citations: [icu_depth_oxygen, icu_depth_fda],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthOxygenationVersusVentilationSample {
    public static let entry = ReferenceEntry(
        id: "oxygenation-versus-ventilation", title: "Oxygenation versus ventilation",
        subtitle: "Why saturation, carbon dioxide and breathing effort differ", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Separate the processes", [
                AttributedBullet("Ventilation is movement of air into and out of the lungs. Oxygenation also depends on gas reaching the alveoli, transfer into blood, hemoglobin carrying oxygen and circulation delivering it to tissues. An abnormality in one part of this pathway cannot be understood from a single number.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Know what the measurements describe", [
                AttributedBullet("SpO2 estimates hemoglobin oxygen saturation. PaO2 describes oxygen dissolved in arterial blood; PaCO2 reflects carbon dioxide in that blood. These measurements answer different questions.", citationIDs: ["icu_depth_oxygen"]),
                AttributedBullet("An arterial blood gas adds pH and bicarbonate context to oxygen and carbon dioxide results. Interpret them together with the respiratory examination and the support in use, using the facility’s reported ranges.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Recognize carbon dioxide retention", [
                AttributedBullet("Hypercapnia can accompany inadequate ventilation. Headache, confusion, dyspnea and drowsiness may accompany respiratory deterioration; gradual carbon dioxide retention may produce less obvious symptoms.", citationIDs: ["icu_depth_oxygen"]),
                AttributedBullet("BiPAP or invasive ventilation may be required when a person cannot ventilate adequately. Support choice and settings require clinician and respiratory-therapy assessment; this reference does not set treatment targets.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Look beyond an oxygen reading", [
                AttributedBullet("A pulse oximeter does not provide a blood carbon dioxide measurement. A reassuring displayed saturation cannot substitute for assessing breathing and alertness. Symptoms that are serious or worsening require clinical assessment.", citationIDs: ["icu_depth_fda"])
            ]),
            .bullets(title: "Describe the trend clearly", [
                AttributedBullet("A useful respiratory reassessment records the oxygen device, settings, respiratory rate and pattern, accessory muscle use, ability to speak, mental status and response to interventions. Changes over time help the team recognize deterioration and evaluate support.", citationIDs: ["icu_depth_oxygen"])
            ])
        ],
        citations: [icu_depth_oxygen, icu_depth_fda],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthHighFlowNasalCannulaMonitoringSample {
    public static let entry = ReferenceEntry(
        id: "high-flow-nasal-cannula-monitoring", title: "High-flow nasal cannula: monitoring",
        subtitle: "Heated humidification, support requirements and patient response", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Understand the system", [
                AttributedBullet("High-flow nasal cannula delivers heated, humidified oxygen through a dedicated system. It can provide higher flows and controlled oxygen concentrations than a conventional nasal cannula. It is used for patients needing close respiratory observation.", citationIDs: ["icu_depth_oxygen"]),
                AttributedBullet("Respiratory therapists establish the system and collaborate with nursing on ongoing care. Device assembly, prescribed flow and oxygen concentration belong to the care plan and manufacturer instructions.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Read both settings", [
                AttributedBullet("Record flow and oxygen concentration separately. A flow value alone does not describe the oxygen concentration, and the concentration alone does not describe the flow delivered. Compare the current support with the prescribed plan.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Check delivery and tolerance", [
                AttributedBullet("Inspect the cannula position and the supply tubing for disconnection, kinking or pressure on the skin. Assess nasal discomfort, dryness and tolerance; heated humidification is an integral part of this system.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Follow the work of breathing", [
                AttributedBullet("Observe rate and depth, accessory muscle use, chest movement, ability to speak and mental status. Ask about breathlessness and compare with prior assessments. A rising oxygen requirement or worsening examination requires prompt review by the team.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Use oxygen saturation in context", [
                AttributedBullet("Keep symptoms and examination findings alongside the displayed saturation. FDA warns against relying on an oximeter alone and recognizes concerns about accuracy across skin pigmentation. Escalate serious or worsening symptoms.", citationIDs: ["icu_depth_fda"])
            ]),
            .bullets(title: "Close the reassessment loop", [
                AttributedBullet("Document the interface, support settings, oxygenation and respiratory findings before and after changes. Include comfort, skin condition and the response communicated to the provider or respiratory therapist.", citationIDs: ["icu_depth_oxygen"])
            ])
        ],
        citations: [icu_depth_oxygen, icu_depth_fda],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthNoninvasiveVentilationBedsideAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "noninvasive-ventilation-bedside-assessment", title: "Noninvasive ventilation: bedside assessment",
        subtitle: "CPAP, bilevel support, mask tolerance and reassessment", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Distinguish the support", [
                AttributedBullet("CPAP maintains continuous positive airway pressure. Bilevel support uses different inspiratory and expiratory pressure levels. Both use an interface rather than an endotracheal tube; their settings are prescribed and managed with the respiratory team.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Watch the person and interface", [
                AttributedBullet("Observe alertness, respiratory effort and ability to tolerate the mask. Explain the purpose of support and seek a comfortable fit. Ongoing respiratory assessment is essential rather than assuming that placement of the mask has corrected the problem.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Check fit and skin", [
                AttributedBullet("AARC recommends assessing skin around noninvasive interfaces and suggests reviewing the dressing and humidification. Report pressure injury, excessive leak and poor tolerance to the respiratory team.", citationIDs: ["icu_depth_pva_cpg"])
            ]),
            .bullets(title: "Support communication and intake", [
                AttributedBullet("A person using a face mask may be able to speak and swallow, but eating and drinking depend on the healthcare team’s plan. Mask breaks and nutrition need coordination with respiratory support; do not assume that mask ventilation makes oral intake safe.", citationIDs: ["icu_depth_vent"])
            ]),
            .bullets(title: "Recognize insufficient support", [
                AttributedBullet("Noninvasive support may be insufficient in more severe illness, requiring a breathing tube and invasive ventilation. Continued difficulty breathing warrants reassessment of the person and the treatment plan, not simply reassurance that a mask is in place.", citationIDs: ["icu_depth_vent"])
            ]),
            .bullets(title: "Record response and concerns", [
                AttributedBullet("Document the prescribed support, respiratory rate and effort, oxygenation response and tolerance. Include skin findings and communication with the team about deterioration or difficulty sustaining the interface.", citationIDs: ["icu_depth_oxygen"])
            ])
        ],
        citations: [icu_depth_oxygen, icu_depth_pva_cpg, icu_depth_vent],
        lastSourceFidelityReview: "2026-09-17"
    )
}
