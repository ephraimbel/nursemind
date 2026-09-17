import Foundation

private let cc_depth_protein_urine = CitationSource(
    id: "cc_depth_protein_urine",
    shortName: "MedlinePlus — Protein in urine",
    detail: "Purpose, transient proteinuria and repeat testing. Original NLM article only; bibliography excluded. Original NLM medical-test prose; no A.D.A.M., AHFS or third-party bibliography content used. Source-fidelity review is not independent clinical approval.",
    publisher: "National Library of Medicine; NIH",
    license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/protein-in-urine/",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_uric_collection = CitationSource(
    id: "cc_depth_uric_collection",
    shortName: "MedlinePlus — Uric acid test — 24-hour urine collection",
    detail: "The five collection steps under What happens during a uric acid test, plus medicine preparation. Collection method adapted with the specific test and laboratory instructions retained. Original NLM medical-test prose; no A.D.A.M., AHFS or third-party bibliography content used. Source-fidelity review is not independent clinical approval.",
    publisher: "National Library of Medicine; NIH",
    license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/uric-acid-test/",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_peak_flow = CitationSource(
    id: "cc_depth_peak_flow",
    shortName: "NHLBI — Asthma — Living with",
    detail: "Current asthma monitoring and individualized action-plan context. Federal educational text condensed; no images, videos or third-party material. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/asthma/living-with",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_asthma_attack = CitationSource(
    id: "cc_depth_asthma_attack",
    shortName: "NHLBI — Asthma attacks",
    detail: "Urgent symptoms and emergency help when reliever treatment is ineffective. Federal educational text condensed; no images, videos or third-party material. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/asthma/attacks",
    lastRetrieved: "2026-09-17"
)

private let cc_depth_peak_technique = CitationSource(
    id: "cc_depth_peak_technique",
    shortName: "NHLBI EPR-3 — Peak flow technique, Figure 3–11",
    detail: "August 2007, printed page 122 (PDF page 30). Only mechanical measurement technique and best-of-three recording adapted; older medication and zone algorithms excluded. Original federal figure text, no third-party illustrations. Source-fidelity review is not independent clinical approval.",
    publisher: "National Heart, Lung, and Blood Institute; NIH",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/files/docs/guidelines/05_sec3_comp2.pdf",
    lastRetrieved: "2026-09-17"
)

public enum CCDepth24HourUrineCollectionSample {
    public static let entry = ProcedureEntry(
        id: "24-hour-urine-collection",
        title: "24-hour urine collection",
        subtitle: "Timed collection, complete sampling and laboratory handling",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .elimination),
        indications: AttributedProse("Timed urine collection measures substances excreted over a full day. NLM describes it for urine uric acid, including kidney-stone evaluation, and selected protein assessments because excretion may vary during the day. The specific ordered test determines preparation and handling.", citationIDs: ["cc_depth_uric_collection", "cc_depth_protein_urine"]),
        equipment: [
            AttributedBullet("Use the special collection container supplied by the laboratory and its written collection and storage instructions. The NLM uric-acid method uses refrigeration or a cooler with ice during collection.", citationIDs: ["cc_depth_uric_collection"])
        ],
        preProcedure: [
            AttributedBullet("Confirm the start time specified by the provider and the method for returning the specimen. Explain that all urine over the collection period is needed, not only a small sample from selected voids.", citationIDs: ["cc_depth_uric_collection"]),
            AttributedBullet("Review medicines and supplements with the provider; aspirin and niacin can affect uric-acid results. Medication changes require that discussion rather than an automatic hold for collection.", citationIDs: ["cc_depth_uric_collection"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Start with an empty bladder", body: "At the agreed start time, urinate into the toilet without collecting that urine. Write down the time; it starts the collection period.", citationIDs: ["cc_depth_uric_collection"]),
            ProcedureStep(number: 2, title: "Collect every subsequent void", body: "Collect all urine into the supplied container for the next 24 hours, following the laboratory’s instructions.", citationIDs: ["cc_depth_uric_collection"]),
            ProcedureStep(number: 3, title: "Maintain the required storage", body: "For the cited NLM method, keep the container refrigerated or in a cooler with ice during collection. Follow the supplied test-specific handling instructions.", citationIDs: ["cc_depth_uric_collection"]),
            ProcedureStep(number: 4, title: "Finish at the full interval", body: "At 24 hours after the start, try to urinate and include that final void. This completes the timed collection.", citationIDs: ["cc_depth_uric_collection"]),
            ProcedureStep(number: 5, title: "Return the specimen", body: "Return the complete container to the provider’s office or laboratory as instructed.", citationIDs: ["cc_depth_uric_collection"])
        ],
        postProcedure: [
            AttributedBullet("The care team interprets the result for the substance ordered. Uric-acid and urine-protein findings have different meanings; an abnormal result may require additional testing to establish its cause.", citationIDs: ["cc_depth_uric_collection", "cc_depth_protein_urine"])
        ],
        documentation: [
            AttributedBullet("Retain the recorded start time and the end of the collection period with the specimen information. Accurate timing and collecting all urine are part of the source method.", citationIDs: ["cc_depth_uric_collection"])
        ],
        watchFor: [
            AttributedBullet("A timed collection is different from a single clean-catch sample. Ensure the patient understands which method was ordered and the collection and storage instructions supplied for it.", citationIDs: ["cc_depth_protein_urine", "cc_depth_uric_collection"])
        ],
        citations: [cc_depth_protein_urine, cc_depth_uric_collection],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CCDepthPeakFlowMeasurementSample {
    public static let entry = ProcedureEntry(
        id: "peak-flow-measurement",
        title: "Peak flow measurement",
        subtitle: "Meter technique and the best-of-three reading",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        indications: AttributedProse("A peak flow meter measures how quickly air moves out of the lungs. It can support asthma monitoring when included in the individual’s care plan. The readings are used with symptom recognition and the clinician’s written action plan.", citationIDs: ["cc_depth_peak_technique", "cc_depth_peak_flow"]),
        equipment: [
            AttributedBullet("Use the patient’s peak flow meter and a diary or other place to record results. Ask a nurse or clinician to demonstrate the technique and check that the patient can repeat it.", citationIDs: ["cc_depth_peak_technique"])
        ],
        preProcedure: [
            AttributedBullet("Know the personal best and the clinician’s action-plan ranges. People of the same height, weight and sex may have different personal-best results; another person’s reading is not the treatment target.", citationIDs: ["cc_depth_peak_technique"]),
            AttributedBullet("Review the monitoring schedule and symptoms with the care team. The measurement technique below is from the federal EPR-3 teaching figure; medicine changes follow the current individualized plan.", citationIDs: ["cc_depth_peak_technique", "cc_depth_peak_flow"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Reset", body: "Move the indicator to the bottom of the numbered scale.", citationIDs: ["cc_depth_peak_technique"]),
            ProcedureStep(number: 2, title: "Position and inhale", body: "Stand up and take a deep breath that fills the lungs completely.", citationIDs: ["cc_depth_peak_technique"]),
            ProcedureStep(number: 3, title: "Seal the mouthpiece", body: "Close the lips around the mouthpiece and keep the tongue out of the opening.", citationIDs: ["cc_depth_peak_technique"]),
            ProcedureStep(number: 4, title: "Blow once", body: "Blow out as hard and as fast as possible in one blow. Note the reading. If coughing or a technique error occurs, repeat the attempt instead of recording that result.", citationIDs: ["cc_depth_peak_technique"]),
            ProcedureStep(number: 5, title: "Repeat and retain the best", body: "Repeat the sequence two more times. Record the best of the three successful blows in the asthma diary.", citationIDs: ["cc_depth_peak_technique"])
        ],
        postProcedure: [
            AttributedBullet("Compare the reading with the individual action plan and review accompanying symptoms. The care team uses these observations to assess control and whether the treatment plan needs review.", citationIDs: ["cc_depth_peak_technique", "cc_depth_peak_flow"])
        ],
        documentation: [
            AttributedBullet("Record the best reading in the diary according to the agreed monitoring schedule. Bring the record and meter to follow-up so technique and the action plan can be reviewed.", citationIDs: ["cc_depth_peak_technique", "cc_depth_peak_flow"])
        ],
        watchFor: [
            AttributedBullet("NHLBI advises emergency help when asthma medicines are not relieving an attack or breathing remains very hard. Do not make repeated meter attempts a prerequisite for seeking help with severe symptoms.", citationIDs: ["cc_depth_asthma_attack"])
        ],
        citations: [cc_depth_peak_flow, cc_depth_asthma_attack, cc_depth_peak_technique],
        lastSourceFidelityReview: "2026-09-17"
    )
}
