import Foundation

private let icu_depth_vent = CitationSource(
    id: "icu_depth_vent", shortName: "NHLBI — Ventilator support: what to expect",
    detail: "Federal patient-education prose adapted and condensed by NurseMind; updated March 24, 2022. Sections on monitoring, ongoing care and ventilator removal. Images and third-party animations excluded. Source-fidelity check is not independent clinical review.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/ventilator/what-to-expect", lastRetrieved: "2026-09-17"
)

private let icu_depth_pva_cpg = CitationSource(
    id: "icu_depth_pva_cpg", shortName: "AARC — Patient–ventilator assessment (2024)",
    detail: "Goodfellow et al. Respir Care. 2024;69:1042–1054. doi:10.4187/respcare.12007. Brief original paraphrase of assessment recommendations; no copied table, figure or algorithm. Source-fidelity check is not independent clinical review.",
    publisher: "American Association for Respiratory Care / Daedalus Enterprises", license: .factCitationOnly,
    url: "https://www.aarc.org/wp-content/uploads/2024/10/patient-ventilator-assessment-aarc-cpg.pdf", lastRetrieved: "2026-09-17"
)

private let icu_depth_pva = CitationSource(
    id: "icu_depth_pva", shortName: "Costa et al. — Patient–ventilator asynchronies",
    detail: "Costa V, Cidade JP, Medeiros I, Póvoa P. J Clin Med. 2025;14(1):214. doi:10.3390/jcm14010214. Sections 4–5; adult invasive ventilation narrative review, not a treatment guideline. Adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Figures and proposed treatment algorithm excluded. Source-fidelity check is not independent clinical review.",
    publisher: "The authors; Journal of Clinical Medicine / MDPI", license: .ccBy4,
    url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11721790/", lastRetrieved: "2026-09-17"
)

private let icu_depth_risks = CitationSource(
    id: "icu_depth_risks", shortName: "NHLBI — Risks of ventilator support",
    detail: "Federal patient-education prose adapted and condensed by NurseMind; updated March 24, 2022. Infection, pressure injury, respiratory muscle weakness and airway complications; no images or linked third-party material. Source-fidelity check is not independent clinical review.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/ventilator/risks", lastRetrieved: "2026-09-17"
)

private let icu_depth_sbt = CitationSource(
    id: "icu_depth_sbt", shortName: "AARC — Spontaneous breathing trials (2024)",
    detail: "Roberts et al. doi:10.4187/respcare.11735. AARC-hosted 2024 accepted guideline; recommendations and distinction between a successful SBT and extubation. Brief original paraphrase; no reproduced table or algorithm. Source-fidelity check is not independent clinical review.",
    publisher: "American Association for Respiratory Care / Daedalus Enterprises", license: .factCitationOnly,
    url: "https://www.aarc.org/wp-content/uploads/2023/11/CPG2024SpontaneousBreathingTrial.pdf", lastRetrieved: "2026-09-17"
)

private let icu_depth_oxygen = CitationSource(
    id: "icu_depth_oxygen", shortName: "Open RN — Oxygen Therapy, chapter 11",
    detail: "Nursing Skills, 2nd edition (2023), sections 11.2–11.6. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and linked third-party material excluded. Source-fidelity check is not independent clinical review.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596733/", lastRetrieved: "2026-09-17"
)

public enum ICUDepthVentilatorBedsideAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "ventilator-bedside-assessment", title: "Ventilator bedside assessment",
        subtitle: "Patient, airway, support settings and ongoing care", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Start with the patient", [
                AttributedBullet("Nurses, respiratory therapists and clinicians assess the person receiving ventilation together. Respiratory examination, blood gases and imaging help evaluate how well support is working and whether the breathing tube remains appropriately positioned.", citationIDs: ["icu_depth_vent"])
            ]),
            .bullets(title: "Review lung-protective support", [
                AttributedBullet("AARC recommends assessment of tidal volume, plateau pressure, PEEP and auto-PEEP, with tidal volume documented relative to predicted body weight. Driving pressure and oxygen concentration also warrant review. These checks inform the respiratory team’s prescribed settings.", citationIDs: ["icu_depth_pva_cpg"])
            ]),
            .bullets(title: "Check airway and interface", [
                AttributedBullet("The assessment includes airway position and securement, skin condition, humidification and cuff pressure measured with a manometer. An inflated pilot balloon alone does not measure cuff pressure.", citationIDs: ["icu_depth_pva_cpg"])
            ]),
            .bullets(title: "Observe synchrony", [
                AttributedBullet("Look at the patient and the ventilator at the same time. Discomfort, coughing, visible respiratory effort and pressure or flow changes can suggest mismatch between patient effort and delivered breaths. The displayed respiratory rate may miss ineffective efforts.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Include daily care", [
                AttributedBullet("An endotracheal tube limits speech and oral intake. Communication aids, pain and comfort assessment, nutrition support and secretion management remain part of care. Explain procedures even when the person cannot answer aloud.", citationIDs: ["icu_depth_vent"])
            ]),
            .bullets(title: "Track complications", [
                AttributedBullet("Ventilator support carries risks including pneumonia, lung injury, pneumothorax, immobility-related skin injury and respiratory muscle weakness. New distress, changing oxygen needs or signs of infection deserve timely team evaluation; a routine equipment check cannot exclude these problems.", citationIDs: ["icu_depth_risks"])
            ])
        ],
        citations: [icu_depth_vent, icu_depth_pva_cpg, icu_depth_pva, icu_depth_risks],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthVentilatorWaveformObservationSample {
    public static let entry = ReferenceEntry(
        id: "ventilator-waveform-observation", title: "Ventilator waveforms: observation",
        subtitle: "Recognizing timing changes in pressure and flow", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Observe two things together", [
                AttributedBullet("Pressure and flow curves are most useful when watched alongside the patient’s effort. Note which part of the breathing cycle contains a change: the start of inspiration, continued inspiratory flow, transition to expiration or the expiratory period.", citationIDs: ["icu_depth_pva"]),
                AttributedBullet("A pattern can have more than one explanation. Interpretation requires training, the ventilator mode and the clinical context; this guide describes observations to communicate rather than automated waveform diagnosis.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Look for a delayed or missed breath", [
                AttributedBullet("A negative pressure deflection can reflect an inspiratory effort. A delay before delivered flow suggests trigger delay; an effort without a delivered breath can indicate ineffective triggering. Small expiratory-flow deflections may accompany these efforts.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Look for extra machine breaths", [
                AttributedBullet("Autotriggering means a delivered breath is not initiated by the patient’s inspiratory effort. Leaks, circuit water or cardiac oscillations can contribute. Comparing chest or abdominal movement with the screen helps identify a possible mismatch.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Recognize breath stacking", [
                AttributedBullet("Two consecutive machine breaths with little intervening expiration can represent double triggering. In some patients the first machine breath triggers a subsequent patient effort, termed reverse triggering. These mechanisms require expert differentiation because their management differs.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Notice the end of inspiration", [
                AttributedBullet("Premature cycling ends machine inspiration while the patient is still trying to inhale. Delayed cycling continues machine inspiration after the patient wants to exhale. Both can produce discomfort and characteristic pressure or flow distortions.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Communicate without guessing settings", [
                AttributedBullet("Describe the timing, recurrence, patient effort and ventilator mode to the respiratory therapist or clinician. Treatment depends on the cause; changing sedation or ventilator settings without identifying that cause can miss the actual mismatch.", citationIDs: ["icu_depth_pva"])
            ])
        ],
        citations: [icu_depth_pva],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthPatientVentilatorAsynchronyRecognitionSample {
    public static let entry = ReferenceEntry(
        id: "patient-ventilator-asynchrony-recognition", title: "Patient–ventilator asynchrony",
        subtitle: "Trigger, cycling and flow mismatch at the bedside", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Define the mismatch", [
                AttributedBullet("Asynchrony occurs when the timing or amount of ventilator assistance does not match the patient’s respiratory demand. It can increase discomfort and wasted breathing effort and is associated with prolonged ventilation. A narrative review describes mechanisms; it is not a stand-alone treatment protocol.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Assess comfort and effort", [
                AttributedBullet("Ask an awake person whether breaths arrive when needed and whether a breath feels too short, too long or insufficient. Observe anxiety, pain, coughing, tachypnea and chest or abdominal movement while reviewing pressure and flow curves.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Consider trigger problems", [
                AttributedBullet("A weak effort, an insensitive trigger or intrinsic PEEP can prevent an intended breath from triggering the ventilator. Conversely, a leak or circuit disturbance can generate a machine breath without a true patient effort. These are different problems despite an apparently abnormal respiratory rate.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Consider cycling and flow", [
                AttributedBullet("Early or late cycling creates a mismatch at the transition from inspiration to expiration. Flow starvation means delivered inspiratory flow is below demand; flow overshoot provides flow too rapidly. Visible discomfort and waveform changes help direct expert assessment.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Recognize high-risk patterns", [
                AttributedBullet("Double triggering and breath stacking can increase the delivered volume before adequate expiration. Reverse triggering may occur during deep sedation and controlled ventilation. Deeper sedation is not a universal answer to a mismatch.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Reassess after the team responds", [
                AttributedBullet("The clinician and respiratory therapist address the identified mechanism, which may involve the patient’s condition, circuit or support settings. Reassess comfort, effort and waveform patterns afterward; report persisting or recurrent mismatch.", citationIDs: ["icu_depth_pva"])
            ])
        ],
        citations: [icu_depth_pva],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthAutoPeepAndIneffectiveTriggeringSample {
    public static let entry = ReferenceEntry(
        id: "auto-peep-and-ineffective-triggering", title: "Auto-PEEP and ineffective triggering",
        subtitle: "Air trapping, missed efforts and assessment boundaries", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Understand intrinsic pressure", [
                AttributedBullet("Dynamic hyperinflation can create intrinsic positive end-expiratory pressure, also called auto-PEEP. It can occur with obstructive disease such as COPD or asthma and when there is inadequate time for expiration. This pressure adds to the workload of initiating the next breath.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Connect pressure to a missed breath", [
                AttributedBullet("The patient must overcome both intrinsic pressure and the ventilator’s trigger requirement. An inspiratory effort may therefore be delayed or fail to produce a delivered breath. A machine rate can underestimate the total number of patient efforts.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Look for relevant observations", [
                AttributedBullet("Watch for patient effort without a matching machine breath, small negative pressure changes and deflections in expiratory flow. Compare the bedside examination with the ventilator screen. A single curve does not establish the cause of difficult triggering.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Know other explanations", [
                AttributedBullet("Ineffective triggering can also reflect weak respiratory muscles, over-assistance or a trigger that requires excessive effort. Leaks may contribute to delayed triggering. These alternatives matter because the appropriate adjustment is mechanism dependent.", citationIDs: ["icu_depth_pva"])
            ]),
            .bullets(title: "Bring findings to the respiratory team", [
                AttributedBullet("AARC recommends assessing both set PEEP and auto-PEEP. Interpret these measurements with the respiratory therapist or clinician; observed difficulty triggering does not determine an appropriate PEEP adjustment by itself.", citationIDs: ["icu_depth_pva_cpg"])
            ]),
            .bullets(title: "Avoid a single-setting solution", [
                AttributedBullet("Management depends on obstruction, expiratory time, respiratory drive, assistance and muscle function. This reference does not prescribe changes to PEEP, respiratory rate, sedation or bronchodilator therapy; use the responsible team’s assessment and orders.", citationIDs: ["icu_depth_pva"])
            ])
        ],
        citations: [icu_depth_pva, icu_depth_pva_cpg],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthVentilatorLiberationObservationSample {
    public static let entry = ReferenceEntry(
        id: "ventilator-liberation-observation", title: "Ventilator liberation: nursing observations",
        subtitle: "Readiness, breathing-trial tolerance and extubation planning", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Understand a trial of less support", [
                AttributedBullet("As the condition requiring ventilation improves, the team assesses whether the person can breathe with less assistance. A weaning trial may succeed or may need to be repeated later. Readiness changes with recovery; a prior unsuccessful trial is not a permanent outcome.", citationIDs: ["icu_depth_vent"])
            ]),
            .bullets(title: "Know the readiness assessment", [
                AttributedBullet("SBT readiness includes improvement in the cause of respiratory failure, adequate oxygenation, hemodynamic stability and ability to initiate an inspiratory effort. AARC suggests that an RSBI calculation is not required to determine readiness.", citationIDs: ["icu_depth_sbt"])
            ]),
            .bullets(title: "Clarify the trial plan", [
                AttributedBullet("AARC supports a standardized daily approach. Trials may use or omit pressure support; oxygen concentration should not be increased simply for the trial. Follow the prescribed trial and local stopping criteria, with the respiratory therapist and responsible clinician.", citationIDs: ["icu_depth_sbt"])
            ]),
            .bullets(title: "Observe breathing and response", [
                AttributedBullet("Track respiratory rate and effort, chest movement, accessory muscle use, alertness, discomfort and oxygenation. Record the support in use with those observations; a saturation value without device context gives an incomplete description of respiratory status.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Separate trial success from tube removal", [
                AttributedBullet("Passing an SBT does not establish extubation readiness. Weak cough or substantial secretions can prevent safe tube removal despite adequate spontaneous breathing. The team separately evaluates airway protection and secretion management.", citationIDs: ["icu_depth_sbt"])
            ]),
            .bullets(title: "Prepare ongoing observation", [
                AttributedBullet("After the team removes the endotracheal tube, a sore throat or hoarse voice may occur. Continue reassessment and the prescribed recovery plan; tube removal does not end the need for respiratory observation.", citationIDs: ["icu_depth_vent"])
            ])
        ],
        citations: [icu_depth_vent, icu_depth_sbt, icu_depth_oxygen],
        lastSourceFidelityReview: "2026-09-17"
    )
}
