import Foundation

private let icu_depth_trach = CitationSource(
    id: "icu_depth_trach", shortName: "Open RN — Tracheostomy Care & Suctioning, chapter 22",
    detail: "Nursing Skills, 2nd edition (2023), assessment and routine care sections 22.2–22.6. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images and linked third-party material excluded; not a tube-replacement protocol. Source-fidelity check is not independent clinical review.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596713/", lastRetrieved: "2026-09-17"
)

private let icu_depth_suction = CitationSource(
    id: "icu_depth_suction", shortName: "AARC — Artificial airway suctioning (2022)",
    detail: "Blakeman et al. Respir Care. 2022;67:258–271. doi:10.4187/respcare.09548. Brief original paraphrase of adult assessment, preoxygenation, saline and depth recommendations; no copied protocol. Source-fidelity check is not independent clinical review.",
    publisher: "American Association for Respiratory Care / Daedalus Enterprises", license: .factCitationOnly,
    url: "https://www.aarc.org/wp-content/uploads/2022/10/cpg-artificial-airway-suctioning.pdf", lastRetrieved: "2026-09-17"
)

private let icu_depth_oxygen = CitationSource(
    id: "icu_depth_oxygen", shortName: "Open RN — Oxygen Therapy, chapter 11",
    detail: "Nursing Skills, 2nd edition (2023), sections 11.2–11.6. Original nursing prose adapted and condensed by NurseMind under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/. Images, videos and linked third-party material excluded. Source-fidelity check is not independent clinical review.",
    publisher: "Open Resources for Nursing (Open RN); Ernstmeyer K, Christman E, editors; Chippewa Valley Technical College", license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK596733/", lastRetrieved: "2026-09-17"
)

private let icu_depth_vent = CitationSource(
    id: "icu_depth_vent", shortName: "NHLBI — Ventilator support: what to expect",
    detail: "Federal patient-education prose adapted and condensed by NurseMind; updated March 24, 2022. Sections on monitoring, ongoing care and ventilator removal. Images and third-party animations excluded. Source-fidelity check is not independent clinical review.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/ventilator/what-to-expect", lastRetrieved: "2026-09-17"
)

private let icu_depth_risks = CitationSource(
    id: "icu_depth_risks", shortName: "NHLBI — Risks of ventilator support",
    detail: "Federal patient-education prose adapted and condensed by NurseMind; updated March 24, 2022. Infection, pressure injury, respiratory muscle weakness and airway complications; no images or linked third-party material. Source-fidelity check is not independent clinical review.",
    publisher: "National Heart, Lung, and Blood Institute; National Institutes of Health", license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/ventilator/risks", lastRetrieved: "2026-09-17"
)

public enum ICUDepthArtificialAirwaySecretionAssessmentSample {
    public static let entry = ReferenceEntry(
        id: "artificial-airway-secretion-assessment", title: "Artificial airway: secretion assessment",
        subtitle: "Indications, tolerance and reassessment around suctioning", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Establish why suction is needed", [
                AttributedBullet("Assess visible or audible secretions, cough effectiveness, respiratory effort, breath sounds and oxygenation. A baseline assessment makes it possible to judge whether secretion removal helps rather than documenting only that suction was performed.", citationIDs: ["icu_depth_trach"])
            ]),
            .bullets(title: "Identify relevant airway findings", [
                AttributedBullet("AARC identifies visible secretions, breath sounds and a sawtooth ventilator waveform as indicators for suctioning in adults with an artificial airway. Use clinical findings to guide assessment of need.", citationIDs: ["icu_depth_suction"])
            ]),
            .bullets(title: "Plan for safe technique", [
                AttributedBullet("Adult artificial-airway suctioning includes preoxygenation and attention to the prescribed technique. Routine saline instillation is generally avoided. Open suction requires sterile technique; deep suction is reserved for situations where shallow suction is ineffective.", citationIDs: ["icu_depth_suction"])
            ]),
            .bullets(title: "Watch tolerance during the procedure", [
                AttributedBullet("Monitor oxygenation, pulse, rhythm when available, breathing pattern, discomfort and bleeding. Worsening respiratory distress during suctioning requires stopping the procedure and obtaining emergency help according to the local response process.", citationIDs: ["icu_depth_trach"])
            ]),
            .bullets(title: "Judge the outcome", [
                AttributedBullet("Reassess air movement, breath sounds, work of breathing and secretion clearance. Lung sounds may not become completely clear; the clinically relevant question is whether airway patency and the patient’s response improved.", citationIDs: ["icu_depth_trach"])
            ]),
            .bullets(title: "Document useful detail", [
                AttributedBullet("Include the indication, secretion amount and character, pre- and post-procedure findings, tolerance and any adverse response. New bleeding, persistent distress or failure to clear secretions warrants communication with the responsible team.", citationIDs: ["icu_depth_trach"])
            ])
        ],
        citations: [icu_depth_trach, icu_depth_suction],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthTracheostomyBedsideSafetyChecksSample {
    public static let entry = ReferenceEntry(
        id: "tracheostomy-bedside-safety-checks", title: "Tracheostomy: bedside safety checks",
        subtitle: "Tube components, patency, skin and communication", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Identify the airway in use", [
                AttributedBullet("Know whether the tube is cuffed or uncuffed and whether it has an inner cannula. The outer tube maintains the airway; an inner cannula may be disposable or reusable. The obturator guides insertion and is removed afterward so the tube is open.", citationIDs: ["icu_depth_trach"]),
                AttributedBullet("Tube design and the person’s airway plan matter. A general care guide cannot supply instructions for changing or replacing every tracheostomy tube.", citationIDs: ["icu_depth_trach"])
            ]),
            .bullets(title: "Maintain a clear inner cannula", [
                AttributedBullet("Secretions can obstruct an inner cannula. Follow the manufacturer and facility instructions for inspection, cleaning or replacement; disposable and reusable components are not managed interchangeably. Assess secretion amount, thickness and cough effectiveness.", citationIDs: ["icu_depth_trach"])
            ]),
            .bullets(title: "Inspect the stoma and securement", [
                AttributedBullet("Observe the surrounding skin for redness, tenderness, drainage and moisture. Keep the prescribed dressing clean and change wet or soiled dressings according to policy. Provide securement support during care to avoid unintended tube movement.", citationIDs: ["icu_depth_trach"])
            ]),
            .bullets(title: "Assess respiratory status", [
                AttributedBullet("Compare work of breathing, breath sounds, oxygenation and secretion clearance with baseline. Airway obstruction and respiratory distress require immediate clinical assessment and the facility’s emergency response, rather than continuing routine care.", citationIDs: ["icu_depth_trach"])
            ]),
            .bullets(title: "Support a way to communicate", [
                AttributedBullet("Speech may be limited by the tracheostomy. Offer writing or other communication aids and allow time for responses. Voice-restoration devices and cuff changes require the speech-language and respiratory team’s individualized assessment.", citationIDs: ["icu_depth_trach"])
            ]),
            .bullets(title: "Document the care and response", [
                AttributedBullet("Record the condition of the stoma, dressing and inner cannula, secretions, respiratory findings and tolerance. Report new skin inflammation, bleeding, worsening breathing or concern about tube position. This guide does not authorize blind reinsertion of a displaced tube.", citationIDs: ["icu_depth_trach"])
            ])
        ],
        citations: [icu_depth_trach],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ICUDepthPostExtubationObservationSample {
    public static let entry = ReferenceEntry(
        id: "post-extubation-observation", title: "After extubation: bedside observation",
        subtitle: "Breathing, voice, comfort and ongoing recovery", eyebrow: "REFERENCE · ADULT CRITICAL CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Keep respiratory assessment active", [
                AttributedBullet("Observe breathing rate and depth, chest movement, effort, oxygenation and alertness. Compare findings with the prior assessment and record any oxygen device and settings. A change in mental status or increasing effort can be important even before a marked saturation change.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Distinguish discomfort from deterioration", [
                AttributedBullet("Sore throat and hoarseness can occur after removal of an endotracheal tube. These symptoms should be assessed and communicated, rather than assuming that every change in voice or breathing is an expected recovery symptom.", citationIDs: ["icu_depth_vent"])
            ]),
            .bullets(title: "Report concerning airway symptoms", [
                AttributedBullet("Endotracheal tubes can injure the vocal cords. NHLBI advises reporting difficulty breathing or talking and a hoarse voice after tube removal. New or worsening respiratory difficulty requires prompt clinical assessment.", citationIDs: ["icu_depth_risks"])
            ]),
            .bullets(title: "Reassess the oxygen pathway", [
                AttributedBullet("If oxygen is prescribed, confirm the correct interface, flow or concentration and functioning supply. Check tubing and skin contact points. Document the person’s response alongside the settings; oxygen delivery is one part of the respiratory assessment.", citationIDs: ["icu_depth_oxygen"])
            ]),
            .bullets(title: "Keep recovery needs visible", [
                AttributedBullet("Ventilator-associated immobility can contribute to weakness and skin injury, and respiratory muscles can become weak during support. Include strength, mobility and skin concerns in ongoing care planning with the team.", citationIDs: ["icu_depth_risks"])
            ]),
            .bullets(title: "Communicate the change in status", [
                AttributedBullet("Report new breathlessness, increasing accessory muscle use, reduced ability to speak, agitation, confusion or worsening oxygenation. Document when the findings appeared, the support in use and the response to assessment or interventions.", citationIDs: ["icu_depth_oxygen"])
            ])
        ],
        citations: [icu_depth_oxygen, icu_depth_vent, icu_depth_risks],
        lastSourceFidelityReview: "2026-09-17"
    )
}
