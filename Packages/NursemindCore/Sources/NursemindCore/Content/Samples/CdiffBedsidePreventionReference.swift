import Foundation

private let depth9_cdiff_clinical = CitationSource(
    id: "depth9_cdiff_clinical",
    shortName: "C. difficile: Clinical Overview",
    detail: "Clinical features; colonization and infection; complications; transmission. Page dated April 13, 2026. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/c-diff/hcp/clinical-overview/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_cdiff_control = CitationSource(
    id: "depth9_cdiff_control",
    shortName: "C. difficile: Clinical Guidance",
    detail: "Isolation and Contact Precautions; diagnostic stewardship; environmental cleaning. Page dated May 13, 2026. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/c-diff/hcp/clinical-guidance/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_cdiff_test = CitationSource(
    id: "depth9_cdiff_test",
    shortName: "Clinical Testing for C. difficile",
    detail: "Molecular tests; antigen detection; toxin testing and specimen stability. Page dated March 6, 2024. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/c-diff/hcp/diagnosis-testing/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_hands = CitationSource(
    id: "depth9_hands",
    shortName: "Clinical Safety: Hand Hygiene",
    detail: "ABHS versus soap and water; C. difficile routine care and outbreaks; glove use. Page dated February 27, 2024. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/clean-hands/hcp/clinical-safety/index.html",
    lastRetrieved: "2026-09-17"
)

public enum CdiffBedsidePreventionSample {
    public static let entry = ReferenceEntry(
        id: "c-diff-bedside-infection-prevention",
        title: "C. difficile — bedside infection prevention",
        subtitle: "Diarrhea assessment, testing limits & environmental controls",
        eyebrow: "REFERENCE · INFECTION PREVENTION",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .infection),
        sections: [
            .bullets(title: "Recognize illness and colonization", [
                AttributedBullet("Diarrhea with fever, reduced appetite, nausea or abdominal tenderness can occur with C. difficile infection. Severe disease can involve toxic megacolon, perforation or sepsis.", citationIDs: ["depth9_cdiff_clinical"]),
                AttributedBullet("A positive test alone does not establish symptomatic infection. Colonized patients may carry C. difficile without diarrhea; interpretation requires the clinical picture.", citationIDs: ["depth9_cdiff_clinical"])
            ]),
            .bullets(title: "Begin precautions during evaluation", [
                AttributedBullet("Suspected infectious diarrhea warrants prompt isolation under the facility protocol while the cause is evaluated. A private room with a dedicated toilet is preferred.", citationIDs: ["depth9_cdiff_control"]),
                AttributedBullet("For suspected or confirmed infection, gown and gloves are important even for a brief visit. Spores can move between contaminated surfaces, hands and patients.", citationIDs: ["depth9_cdiff_clinical"])
            ]),
            .bullets(title: "Check whether testing fits", [
                AttributedBullet("Review stool consistency and possible alternative causes, including laxatives, with the treating team. Follow the local diagnostic pathway rather than testing every loose stool automatically.", citationIDs: ["depth9_cdiff_control"]),
                AttributedBullet("Molecular tests detect toxin-producing organisms but can be positive in colonization or diarrhea from another cause. Broad gastrointestinal panels also require clinical interpretation.", citationIDs: ["depth9_cdiff_test"])
            ]),
            .bullets(title: "Protect specimen quality", [
                AttributedBullet("Submit unformed stool through the facility testing pathway; some institutions use a multistep organism-and-toxin algorithm to improve diagnostic specificity.", citationIDs: ["depth9_cdiff_control"]),
                AttributedBullet("Toxin degrades at room temperature. Prompt transport and laboratory-directed storage matter; delayed handling can produce a falsely negative toxin result.", citationIDs: ["depth9_cdiff_test"])
            ]),
            .bullets(title: "Choose hand hygiene appropriately", [
                AttributedBullet("CDC prefers alcohol-based hand sanitizer for most routine clinical care when hands are not visibly soiled, including C. difficile care; gloves remain essential.", citationIDs: ["depth9_hands"]),
                AttributedBullet("Use soap and water for visible soil and after care during C. difficile outbreaks. Follow facility policy; neither method replaces careful glove removal.", citationIDs: ["depth9_hands"])
            ]),
            .bullets(title: "Clean rooms and shared equipment", [
                AttributedBullet("Use dedicated equipment when possible. Daily and terminal cleaning require a C. difficile sporicidal product, such as an EPA List K product.", citationIDs: ["depth9_cdiff_control"]),
                AttributedBullet("Include shared devices and temporary care areas in cleaning plans. Notify the receiving department of C. difficile status and precautions during transfers.", citationIDs: ["depth9_cdiff_control"])
            ]),
            .bullets(title: "Avoid misleading clearance tests", [
                AttributedBullet("CDC recommends Contact Precautions for at least 48 hours after diarrhea resolves; facilities may continue them longer, including through hospitalization.", citationIDs: ["depth9_cdiff_control"]),
                AttributedBullet("Do not use repeat testing as a test of cure after symptoms resolve. Tests can remain positive after recovery.", citationIDs: ["depth9_cdiff_clinical"])
            ]),
            .bullets(title: "Understand assay limitations", [
                AttributedBullet("Glutamate dehydrogenase antigen detects C. difficile but does not establish toxin production. It is usually interpreted with other tests in an institutional algorithm.", citationIDs: ["depth9_cdiff_test"]),
                AttributedBullet("Toxin enzyme immunoassays are less sensitive than molecular testing. A result should be reconciled with symptoms, collection quality and the complete testing algorithm.", citationIDs: ["depth9_cdiff_test"])
            ])
        ],
        citations: [depth9_cdiff_clinical, depth9_cdiff_control, depth9_cdiff_test, depth9_hands],
        lastSourceFidelityReview: "2026-09-17"
    )
}
