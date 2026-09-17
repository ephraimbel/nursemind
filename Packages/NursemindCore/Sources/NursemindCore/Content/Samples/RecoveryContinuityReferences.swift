import Foundation

private let depth5_sepsis = CitationSource(
    id: "depth5_sepsis",
    shortName: "Managing Recovery from Sepsis",
    detail: "Rehabilitation, home recovery, emotional effects and recurrent infection; September 25, 2025. Original federal health-education prose adapted and condensed by NurseMind. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/sepsis/living-with/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth5_ms = CitationSource(
    id: "depth5_ms",
    shortName: "Multiple Sclerosis-Related Fatigue",
    detail: "Secondary causes of fatigue and managing fatigue; updated July 29, 2026. Page credits an article by Christopher Hollen, MD. National MS Society materials excluded. Clinical facts paraphrased by NurseMind; no source text, tables or algorithms reproduced. Images, videos, linked third-party material and formatted handouts excluded.",
    publisher: "U.S. Department of Veterans Affairs, Multiple Sclerosis Centers of Excellence",
    license: .factCitationOnly,
    url: "https://www.va.gov/MS/LEARN_ABOUT_MULTIPLE_SCLEROSIS/Multiple_Sclerosis_Related_Fatigue.asp",
    lastRetrieved: "2026-09-17"
)

public enum SepsisRecoveryContinuitySample {
    public static let entry = ReferenceEntry(
        id: "sepsis-recovery-support",
        title: "Recovery after sepsis",
        subtitle: "Rebuilding function and recognizing problems after discharge",
        eyebrow: "REFERENCE · RECOVERY & DAILY FUNCTION",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Rebuild everyday activities", [
                AttributedBullet("Rehabilitation may begin with sitting, standing, walking and personal care in hospital. Agree on safe activity progression with the treating team.", citationIDs: ["depth5_sepsis"]),
                AttributedBullet("Set small goals such as dressing or bathing, increase activity gradually and rest when tired. Recovery does not follow one fixed timetable.", citationIDs: ["depth5_sepsis"])
            ]),
            .bullets(title: "Review physical and emotional recovery", [
                AttributedBullet("Ask about weakness, mobility, sleep, appetite, pain and breathlessness. Discuss persistent or concerning symptoms with the healthcare team.", citationIDs: ["depth5_sepsis"]),
                AttributedBullet("Poor concentration, anxiety, low mood or distressing memories can follow sepsis. Include emotional recovery in follow-up rather than focusing only on strength.", citationIDs: ["depth5_sepsis"])
            ]),
            .bullets(title: "Make follow-up useful", [
                AttributedBullet("Record questions, difficulties and milestones before appointments. Family members may help fill gaps in memories of the hospital stay.", citationIDs: ["depth5_sepsis"]),
                AttributedBullet("Ask about recovery clinics or local support. Continued exhaustion, difficulty coping or failure to improve warrant further clinical review.", citationIDs: ["depth5_sepsis"])
            ]),
            .bullets(title: "Act on a new infection", [
                AttributedBullet("Sepsis survivors have a higher risk of another episode. An infection that is worsening or not improving needs immediate medical care.", citationIDs: ["depth5_sepsis"]),
                AttributedBullet("Make sure the assessing clinician knows about the previous sepsis. Discuss the possibility of recurrent sepsis when seeking help.", citationIDs: ["depth5_sepsis"])
            ])
        ],
        citations: [depth5_sepsis],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum MSFatigueDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "multiple-sclerosis-fatigue-support",
        title: "Multiple sclerosis: fatigue support",
        subtitle: "Finding contributors and planning daily activity",
        eyebrow: "REFERENCE · RECOVERY & DAILY FUNCTION",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .neurologicalRegulation),
        sections: [
            .bullets(title: "Look for contributing problems", [
                AttributedBullet("Fatigue in MS may reflect several causes. Pain, spasticity, anxiety or bladder symptoms can disrupt sleep and worsen daytime fatigue.", citationIDs: ["depth5_ms"]),
                AttributedBullet("The clinician may assess sleep apnea, anemia, thyroid problems, diabetes or depression. A medication review may identify sedating effects.", citationIDs: ["depth5_ms"])
            ]),
            .bullets(title: "Notice the daily pattern", [
                AttributedBullet("Record when energy is highest and lowest. Plan demanding activities for better periods and identify tasks someone else could help with.", citationIDs: ["depth5_ms"]),
                AttributedBullet("Heat and exercise that raises body temperature can worsen fatigue. Discuss these patterns when planning activity with the MS team.", citationIDs: ["depth5_ms"])
            ]),
            .bullets(title: "Support activity and rest", [
                AttributedBullet("A physical therapist can help build an achievable exercise plan. Small amounts of regular activity may help rather than waiting for full energy to return.", citationIDs: ["depth5_ms"]),
                AttributedBullet("Review sleep routines and symptoms interrupting sleep. Limiting evening screen time and planning toileting before bed may help.", citationIDs: ["depth5_ms"])
            ]),
            .bullets(title: "Prepare for review", [
                AttributedBullet("Fatigue may interfere with eating; poor nutrition can also worsen fatigue. Discuss practical food access and dietary concerns.", citationIDs: ["depth5_ms"]),
                AttributedBullet("Write down the most important concerns before visits. Primary care and the MS team can work together on an individualized plan.", citationIDs: ["depth5_ms"])
            ])
        ],
        citations: [depth5_ms],
        lastSourceFidelityReview: "2026-09-17"
    )
}
