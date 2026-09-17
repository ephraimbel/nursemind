import Foundation

private let work_fatigue_niosh = CitationSource(
    id: "work_fatigue_niosh",
    shortName: "Fatigue and Work",
    detail: "Effects on attention, reaction time and judgment; July 14, 2026. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "CDC / National Institute for Occupational Safety and Health",
    license: .publicDomain,
    url: "https://www.cdc.gov/niosh/fatigue/about/index.html",
    lastRetrieved: "2026-09-17"
)

private let work_fatigue_tips_niosh = CitationSource(
    id: "work_fatigue_tips_niosh",
    shortName: "Managing Fatigue During Times of Crisis: Guidance for Nurses, Managers, and Other Healthcare Workers",
    detail: "Practical fatigue management for workers and managers; April 2, 2020. Crisis-specific staffing limits are not reproduced. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "CDC / National Institute for Occupational Safety and Health",
    license: .publicDomain,
    url: "https://www.cdc.gov/niosh/bulletin/2020/fatigue-crisis.html",
    lastRetrieved: "2026-09-17"
)

private let work_fit_niosh = CitationSource(
    id: "work_fit_niosh",
    shortName: "Fit Testing",
    detail: "Tight-fitting respirators, model-specific testing, repeat testing and facial hair; February 3, 2025. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "CDC / National Institute for Occupational Safety and Health",
    license: .publicDomain,
    url: "https://www.cdc.gov/niosh/ppe/respirators/fit-testing.html",
    lastRetrieved: "2026-09-17"
)

private let work_seal_niosh = CitationSource(
    id: "work_seal_niosh",
    shortName: "Filtering out Confusion: User Seal Check",
    detail: "DHHS (NIOSH) Publication 2018-130; pages 1–2. Manufacturer-specific seal checks and limits. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "CDC / National Institute for Occupational Safety and Health",
    license: .publicDomain,
    url: "https://www.cdc.gov/niosh/docs/2018-130/pdfs/2018-130.pdf",
    lastRetrieved: "2026-09-17"
)

private let work_violence_niosh = CitationSource(
    id: "work_violence_niosh",
    shortName: "Violence and Work",
    detail: "Definition and physical and psychological effects; December 2, 2024. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "CDC / National Institute for Occupational Safety and Health",
    license: .publicDomain,
    url: "https://www.cdc.gov/niosh/violence/index.html",
    lastRetrieved: "2026-09-17"
)

private let work_violence_hospital_niosh = CitationSource(
    id: "work_violence_hospital_niosh",
    shortName: "Violence: Occupational Hazards in Hospitals",
    detail: "DHHS (NIOSH) Publication 2002-101; printed pages 5–9, safety, reporting and employer prevention. Historical statistics and case reports are excluded. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "CDC / National Institute for Occupational Safety and Health",
    license: .publicDomain,
    url: "https://www.cdc.gov/niosh/docs/2002-101/pdfs/2002-101.pdf",
    lastRetrieved: "2026-09-17"
)

private let work_cleaning_niosh = CitationSource(
    id: "work_cleaning_niosh",
    shortName: "Protecting Workers Who Use Cleaning Chemicals",
    detail: "OSHA–NIOSH Infosheet 2012-126; pages 1–2, hazards, safety data sheets, training, ventilation and protective equipment. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "CDC / National Institute for Occupational Safety and Health",
    license: .publicDomain,
    url: "https://www.cdc.gov/niosh/docs/2012-126/pdfs/2012-126.pdf",
    lastRetrieved: "2026-09-17"
)

private let work_wellbeing_niosh = CitationSource(
    id: "work_wellbeing_niosh",
    shortName: "Talking About Mental Health at Work",
    detail: "Resources, confidentiality, peer support and respectful language; August 5, 2024. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "CDC / National Institute for Occupational Safety and Health",
    license: .publicDomain,
    url: "https://www.cdc.gov/niosh/healthcare/impactwellbeing/talking.html",
    lastRetrieved: "2026-09-17"
)

public enum NursingShiftFatigueReferenceSample {
    public static let entry = ReferenceEntry(
        id: "nursing-shift-work-fatigue",
        title: "Shift-work fatigue in nursing",
        subtitle: "Recognition, sleep protection and workplace support",
        eyebrow: "REFERENCE · NURSING WORKPLACE HEALTH",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
        sections: [
            .bullets(title: "Recognize impaired function", [
                AttributedBullet("Night work, extended hours, stress and demanding tasks can contribute to fatigue. Effects include slower reactions, reduced attention, poorer short-term memory and impaired judgment.", citationIDs: ["work_fatigue_niosh"]),
                AttributedBullet("Watch for repeated yawning, difficulty concentrating, poor communication, emotional changes or flawed reasoning in yourself and colleagues. A coworker check-in can help identify a problem early.", citationIDs: ["work_fatigue_tips_niosh"])
            ]),
            .bullets(title: "Protect rest and recovery", [
                AttributedBullet("Prioritize sleep between shifts and reduce competing obligations when possible. A consistent wind-down routine and a dark, quiet, cool sleeping environment can support rest.", citationIDs: ["work_fatigue_tips_niosh"]),
                AttributedBullet("Avoid caffeine close to planned sleep. Strategically timed naps and breaks can help reduce fatigue when allowed by workplace arrangements; they do not remove the need for adequate recovery.", citationIDs: ["work_fatigue_tips_niosh"])
            ]),
            .bullets(title: "Use the workplace safety process", [
                AttributedBullet("Tell the manager when fatigue makes work unsafe. Managers should provide a clear way to report fatigue, monitor staff and arrange breaks and recovery opportunities.", citationIDs: ["work_fatigue_tips_niosh"]),
                AttributedBullet("Preventing fatigue requires employers and workers to identify its causes and use preventive strategies together. Individual sleep habits alone cannot resolve unsafe scheduling or workload.", citationIDs: ["work_fatigue_niosh"])
            ])
        ],
        citations: [work_fatigue_niosh, work_fatigue_tips_niosh],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum RespiratorFitSealReferenceSample {
    public static let entry = ReferenceEntry(
        id: "respirator-fit-and-seal-check",
        title: "Respirator fit testing and seal checks",
        subtitle: "Two different checks for reliable respiratory protection",
        eyebrow: "REFERENCE · NURSING WORKPLACE HEALTH",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .infection),
        sections: [
            .bullets(title: "Confirm the correct fit test", [
                AttributedBullet("A fit test checks whether a particular tight-fitting respirator fits the wearer. Fit varies by model and size; passing with one model does not establish fit with another.", citationIDs: ["work_fit_niosh"]),
                AttributedBullet("NIOSH describes testing before workplace use, annually, when changing models or sizes, and after physical changes that can affect fit, including facial or dental changes.", citationIDs: ["work_fit_niosh"])
            ]),
            .bullets(title: "Check the seal every time", [
                AttributedBullet("Perform the manufacturer’s user seal check each time the respirator is put on. This checks the current donning; it does not replace a qualitative or quantitative fit test.", citationIDs: ["work_seal_niosh"]),
                AttributedBullet("Different respirators require different seal-check methods. Use the instructions for that model rather than assuming that one positive- or negative-pressure technique fits every device.", citationIDs: ["work_seal_niosh"]),
                AttributedBullet("If leakage persists after adjustment, another fit-tested model or size may be needed. A respirator that cannot seal should not be treated as providing the expected protection.", citationIDs: ["work_seal_niosh"])
            ]),
            .bullets(title: "Address barriers through the program", [
                AttributedBullet("Facial hair must not interfere with a tight-fitting face seal or valve. Discuss suitable alternatives with the respiratory-protection program when the required fit cannot be achieved.", citationIDs: ["work_fit_niosh"]),
                AttributedBullet("Loose-fitting powered respirators with hoods do not require a face seal or fit testing, but tight-fitting powered models do. Selection should match the work task and the workplace program.", citationIDs: ["work_fit_niosh"])
            ])
        ],
        citations: [work_fit_niosh, work_seal_niosh],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum WorkplaceViolenceReferenceSample {
    public static let entry = ReferenceEntry(
        id: "nursing-workplace-violence",
        title: "Workplace violence: prevention and support",
        subtitle: "Recognizing threats, leaving danger and reporting incidents",
        eyebrow: "REFERENCE · NURSING WORKPLACE HEALTH",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
        sections: [
            .bullets(title: "Recognize the hazard", [
                AttributedBullet("Workplace violence includes threats, verbal abuse and physical assault while at work or on duty. Harm may be psychological as well as physical.", citationIDs: ["work_violence_niosh"]),
                AttributedBullet("Be alert to threatening gestures, escalating anger or a weapon. Know the local emergency signaling system and how to reach security before an incident occurs.", citationIDs: ["work_violence_hospital_niosh"])
            ]),
            .bullets(title: "Maintain access to help", [
                AttributedBullet("Keep an open exit path and avoid being isolated with a person who poses a threat. Use a calm manner, acknowledge feelings and avoid crowding, sudden movement or matching threats.", citationIDs: ["work_violence_hospital_niosh"]),
                AttributedBullet("If the situation cannot be defused quickly, remove yourself and call security. Follow the facility’s response plan and trained role; this overview does not teach physical restraint or disarming.", citationIDs: ["work_violence_hospital_niosh"])
            ]),
            .bullets(title: "Report and improve the system", [
                AttributedBullet("Report violent incidents through the organization’s process. Employers should support open reporting and offer counseling after a threat or assault.", citationIDs: ["work_violence_hospital_niosh"]),
                AttributedBullet("Prevention combines staffing, environmental design, alarms, training and response procedures. Direct-care staff should help identify hazards and evaluate the program.", citationIDs: ["work_violence_hospital_niosh"])
            ])
        ],
        citations: [work_violence_niosh, work_violence_hospital_niosh],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum CleaningChemicalExposureReferenceSample {
    public static let entry = ReferenceEntry(
        id: "workplace-cleaning-chemical-safety",
        title: "Cleaning-chemical safety at work",
        subtitle: "Product hazards, protective equipment and exposure information",
        eyebrow: "REFERENCE · NURSING WORKPLACE HEALTH",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
        sections: [
            .bullets(title: "Know the product and its hazards", [
                AttributedBullet("Cleaning chemicals can irritate skin, eyes and airways, cause burns, or trigger asthma. Risk depends on the chemical, concentration, ventilation, application and potential for splashes or inhalation.", citationIDs: ["work_cleaning_niosh"]),
                AttributedBullet("Read the label and safety data sheet before use. The sheet identifies hazards, protective equipment, first-aid information and spill procedures. A green product label does not by itself establish that a chemical is harmless.", citationIDs: ["work_cleaning_niosh"])
            ]),
            .bullets(title: "Use the trained method", [
                AttributedBullet("Receive training before handling hazardous products. Follow the specified dilution, storage and application method, and keep containers labeled with their contents and hazards.", citationIDs: ["work_cleaning_niosh"]),
                AttributedBullet("Use the required gloves, eye protection or respiratory protection and maintain effective ventilation. Protective equipment needs depend on the product and task.", citationIDs: ["work_cleaning_niosh"]),
                AttributedBullet("Never mix cleaning chemicals. In particular, mixing bleach with ammonia can release dangerous gases and cause severe lung injury.", citationIDs: ["work_cleaning_niosh"])
            ]),
            .bullets(title: "Be prepared for exposure", [
                AttributedBullet("Know how to access the safety data sheet and the workplace spill procedure. First aid and cleanup precautions should come from the specific product information and trained response process.", citationIDs: ["work_cleaning_niosh"]),
                AttributedBullet("Do not use cleaning chemicals to wash hands. Wash after handling them and before eating or drinking; workplace cleaning stations and training should support this practice.", citationIDs: ["work_cleaning_niosh"])
            ])
        ],
        citations: [work_cleaning_niosh],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum NursingMentalHealthSupportReferenceSample {
    public static let entry = ReferenceEntry(
        id: "nursing-mental-health-support",
        title: "Mental-health support for nurses",
        subtitle: "Peer connection, confidential resources and workplace culture",
        eyebrow: "REFERENCE · NURSING WORKPLACE HEALTH",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .mood),
        sections: [
            .bullets(title: "Make support easier to access", [
                AttributedBullet("Healthcare workers can experience burnout and moral injury, including distress after witnessing or participating in events that conflict with their moral values. Addressing underlying workplace causes starts with leadership.", citationIDs: ["work_wellbeing_niosh"]),
                AttributedBullet("Ask human resources, a union representative or a trusted colleague which mental-health benefits, employee assistance programs and peer-support options are available.", citationIDs: ["work_wellbeing_niosh"])
            ]),
            .bullets(title: "Clarify privacy and choice", [
                AttributedBullet("Check confidentiality and disclosure rules before using an employee assistance program or other service. Do not assume all workplace resources have identical privacy terms.", citationIDs: ["work_wellbeing_niosh"]),
                AttributedBullet("Seeking help should not be treated as weakness. Use respectful language that centers the person and avoids stigmatizing labels.", citationIDs: ["work_wellbeing_niosh"])
            ]),
            .bullets(title: "Build a support network", [
                AttributedBullet("Check in with colleagues and make time for an honest conversation. Identify trusted people who understand the work and can offer support during difficult periods.", citationIDs: ["work_wellbeing_niosh"]),
                AttributedBullet("Support can also come from an outside colleague, friend, family member, counselor, therapist or support group. A person who does not feel supported at work can still develop connections elsewhere.", citationIDs: ["work_wellbeing_niosh"]),
                AttributedBullet("Peer conversations can help normalize seeking assistance. Continue to identify workplace causes and available professional resources instead of making wellbeing solely an individual responsibility.", citationIDs: ["work_wellbeing_niosh"])
            ])
        ],
        citations: [work_wellbeing_niosh],
        lastSourceFidelityReview: "2026-09-17"
    )
}
