import Foundation

private let icu_depth_ecg = CitationSource(
    id: "icu_depth_ecg", shortName: "Open RN — Interpret Basic ECG, chapter 7",
    detail: "Nursing Advanced Skills (2023), foundational ECG measurement and telemetry prose in sections 7.2–7.3 and 7.8. Adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Section 7.4 tables attributed as StatPearls derivatives, images, videos and treatment algorithms excluded. Source-fidelity check is not independent clinical review.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK594493/", lastRetrieved: "2026-09-17"
)

private let icu_depth_arr_symptoms = CitationSource(
    id: "icu_depth_arr_symptoms", shortName: "NHLBI — Arrhythmia symptoms",
    detail: "Federal health-education prose adapted and condensed by NurseMind; updated March 24, 2022. Symptoms, time course and emergency evaluation. Source-fidelity check is not independent clinical review.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/arrhythmias/symptoms", lastRetrieved: "2026-09-17"
)

private let icu_depth_arr_tests = CitationSource(
    id: "icu_depth_arr_tests", shortName: "NHLBI — Arrhythmia diagnosis",
    detail: "Federal health-education prose adapted and condensed by NurseMind; physical examination, ECG, laboratory and ambulatory monitoring sections. Source-fidelity check is not independent clinical review.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/arrhythmias/diagnosis", lastRetrieved: "2026-09-17"
)

private let icu_depth_qt = CitationSource(
    id: "icu_depth_qt", shortName: "NHLBI — Long QT syndrome",
    detail: "Federal health-education prose adapted and condensed by NurseMind; updated March 24, 2022. Acquired and inherited causes, symptoms, medicines, electrolytes and diagnostic testing; no copied images. Source-fidelity check is not independent clinical review.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/long-qt-syndrome", lastRetrieved: "2026-09-17"
)

public enum ICUDepthTelemetrySignalQualitySample {
    public static let entry = ReferenceEntry(
        id: "telemetry-signal-quality", title: "Telemetry: signal quality and artifact",
        subtitle: "Electrode contact, clinical correlation and readable recordings", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Know what telemetry provides", [
                AttributedBullet("Telemetry transmits a continuous electrical recording for remote monitoring. It can support recognition of rhythm changes, but the display must be interpreted by trained staff with the person’s clinical condition. An automated rhythm label is not a complete assessment.", citationIDs: ["icu_depth_ecg"])
            ]),
            .bullets(title: "Recognize a possible artifact", [
                AttributedBullet("Movement, muscle activity and poor electrode contact can introduce artifact that resembles abnormal electrical activity. Compare the tracing with the person and review whether activity or electrode disruption occurred when the pattern changed.", citationIDs: ["icu_depth_ecg"])
            ]),
            .bullets(title: "Assess the person before explaining the screen", [
                AttributedBullet("Assess the patient and pulse when an unexpected rhythm appears. Electrical activity on a monitor does not by itself demonstrate adequate perfusion. A person who is unresponsive or deteriorating needs immediate clinical response rather than prolonged troubleshooting of electrodes.", citationIDs: ["icu_depth_ecg"])
            ]),
            .bullets(title: "Restore a readable signal", [
                AttributedBullet("Inspect electrode contact and lead connections when the recording is unclear. Correct signal problems according to the monitoring system and facility procedure, then reassess the tracing. Do not dismiss a persistent abnormality solely because artifact was initially suspected.", citationIDs: ["icu_depth_ecg"])
            ]),
            .bullets(title: "Use a systematic rhythm review", [
                AttributedBullet("Once the tracing is readable, review rate, regularity, P waves, the relationship between P waves and QRS complexes, and measured intervals. Describe the observed features instead of relying only on the monitor’s diagnostic label.", citationIDs: ["icu_depth_ecg"])
            ]),
            .bullets(title: "Preserve clinical context", [
                AttributedBullet("Record whether a rhythm change coincided with palpitations, dyspnea, dizziness, fainting, chest discomfort or fatigue. Some arrhythmias cause no symptoms; absence of symptoms does not prove that the recording is normal.", citationIDs: ["icu_depth_arr_symptoms"])
            ])
        ],
        citations: [icu_depth_ecg, icu_depth_arr_symptoms],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthEcgRateAndIntervalReviewSample {
    public static let entry = ReferenceEntry(
        id: "ecg-rate-and-interval-review", title: "ECG: rate, regularity and intervals",
        subtitle: "A consistent adult rhythm-review sequence", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Establish rate and regularity", [
                AttributedBullet("Review the spacing between successive R waves across the available tracing. A six-second strip can estimate ventricular rate by counting QRS complexes and multiplying by ten; a brief sample may not represent a highly variable rhythm. Atrial and ventricular rates may differ.", citationIDs: ["icu_depth_ecg"])
            ]),
            .bullets(title: "Review atrial activity", [
                AttributedBullet("Identify P waves when visible, compare their shape and spacing, and assess their relationship to QRS complexes. Look for P waves without a following QRS or QRS complexes without an identifiable preceding P wave. Record the observation before assigning a rhythm name.", citationIDs: ["icu_depth_ecg"])
            ]),
            .bullets(title: "Measure conduction intervals", [
                AttributedBullet("Measure the PR interval from the beginning of the P wave to the beginning of the QRS complex. Measure QRS duration across the ventricular complex. Comparing these measurements and their consistency helps characterize atrioventricular conduction and ventricular activation.", citationIDs: ["icu_depth_ecg"])
            ]),
            .bullets(title: "Keep QRS width in context", [
                AttributedBullet("A wide QRS can occur with ventricular rhythms or altered conduction such as bundle branch block. Electrolyte changes can also affect the tracing. Width alone does not identify the rhythm or determine its treatment.", citationIDs: ["icu_depth_ecg"])
            ]),
            .bullets(title: "Review repolarization", [
                AttributedBullet("The QT interval runs from the beginning of the QRS to the end of the T wave and varies with heart rate. A corrected QT accounts for rate; use a consistent measurement method and clinical interpretation rather than treating every displayed QT value as directly comparable.", citationIDs: ["icu_depth_ecg"])
            ]),
            .bullets(title: "Connect the tracing to the patient", [
                AttributedBullet("Interpret the rate, atrial activity, QRS and intervals together with symptoms and perfusion. A systematic rhythm review supports communication, but bedside instability requires immediate assessment regardless of whether a precise rhythm label has been established.", citationIDs: ["icu_depth_ecg"])
            ])
        ],
        citations: [icu_depth_ecg],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthRhythmChangeBedsideAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "rhythm-change-bedside-assessment", title: "Rhythm change: bedside assessment",
        subtitle: "Symptoms, timing, pulse and diagnostic context", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Ask about the experience", [
                AttributedBullet("Arrhythmias may cause a racing, fluttering, pounding or skipped-beat sensation, but some cause no noticeable symptoms. Ask what the person felt, when it began and whether it is ongoing or intermittent.", citationIDs: ["icu_depth_arr_symptoms"])
            ]),
            .bullets(title: "Look for accompanying symptoms", [
                AttributedBullet("Chest discomfort, shortness of breath, dizziness, fainting, weakness, fatigue or confusion can accompany an arrhythmia. Serious symptoms require urgent clinical evaluation; symptom severity and change from baseline matter alongside the displayed rate.", citationIDs: ["icu_depth_arr_symptoms"])
            ]),
            .bullets(title: "Assess pulse and cardiovascular findings", [
                AttributedBullet("The clinical evaluation includes pulse, heart rate and rhythm, heart sounds and examination for other conditions that may contribute. Communicate the findings with the time of the tracing rather than sending a rhythm name without patient context.", citationIDs: ["icu_depth_arr_tests"])
            ]),
            .bullets(title: "Confirm electrical information", [
                AttributedBullet("Check that electrodes and leads provide a readable signal. Compare the monitor with bedside findings, then review rate, regularity, P waves and QRS relationships systematically. Artifact and a true rhythm disturbance can both require attention.", citationIDs: ["icu_depth_ecg"])
            ]),
            .bullets(title: "Understand the ordered workup", [
                AttributedBullet("An ECG is a common diagnostic test. Blood tests may assess electrolytes and thyroid function. When symptoms are intermittent, a Holter or other event monitor may help capture an episode that a brief resting ECG misses.", citationIDs: ["icu_depth_arr_tests"])
            ]),
            .bullets(title: "Make the handoff useful", [
                AttributedBullet("Describe onset, duration, recurring symptoms and whether episodes occur with activity or at rest. Include associated fainting, chest symptoms or breathlessness. A report that the patient feels well should accompany, rather than replace, the objective findings.", citationIDs: ["icu_depth_arr_symptoms"])
            ])
        ],
        citations: [icu_depth_arr_symptoms, icu_depth_arr_tests, icu_depth_ecg],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthQtIntervalMonitoringContextSample {
    public static let entry = ReferenceEntry(
        id: "qt-interval-monitoring-context", title: "QT interval: monitoring context",
        subtitle: "Rate correction, medicines, electrolytes and symptom history", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Understand the measurement", [
                AttributedBullet("The QT interval includes ventricular depolarization and repolarization, measured from the start of the QRS to the end of the T wave. Its duration changes with heart rate; QTc is a rate-corrected value. Interpretation requires the tracing and clinical context.", citationIDs: ["icu_depth_ecg"])
            ]),
            .bullets(title: "Distinguish a finding from a diagnosis", [
                AttributedBullet("Long QT syndrome can be inherited or acquired. Diagnosis considers history, medicines, family history, symptoms and electrical testing. A single displayed number does not substitute for that evaluation, and QT measurements can vary over time.", citationIDs: ["icu_depth_qt"])
            ]),
            .bullets(title: "Review relevant exposures and conditions", [
                AttributedBullet("Some antibiotics, antidepressants and antihistamines can affect cardiac ion channels. Conditions associated with low potassium, magnesium or calcium, including substantial vomiting or diarrhea, can increase long-QT risk. Review the medication list and ordered laboratory results with the responsible team.", citationIDs: ["icu_depth_qt"])
            ]),
            .bullets(title: "Ask about relevant history", [
                AttributedBullet("Fainting, seizures, unexplained near drowning or a family history of sudden death can be clinically relevant. Events may occur with physical or emotional stress or during sleep. These details support evaluation even if the current person has no symptoms.", citationIDs: ["icu_depth_qt"])
            ]),
            .bullets(title: "Understand follow-up testing", [
                AttributedBullet("Evaluation may include repeated ECGs, ambulatory monitoring, electrolyte and thyroid testing, and genetic testing when indicated. The choice depends on the clinician’s assessment; this guide does not define a universal QT cutoff or a replacement schedule for electrolytes.", citationIDs: ["icu_depth_qt"])
            ]),
            .bullets(title: "Keep treatment decisions individualized", [
                AttributedBullet("Treatment may involve medicines, activity advice, a device or other interventions according to the underlying condition. Communicate potential medicine or electrolyte concerns promptly; do not independently stop prescribed therapy or infer a treatment from QT duration alone.", citationIDs: ["icu_depth_qt"])
            ])
        ],
        citations: [icu_depth_ecg, icu_depth_qt],
        lastSourceFidelityReview: "2026-09-17"
    )
}
