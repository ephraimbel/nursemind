import Foundation

private let depth9_noro_about = CitationSource(
    id: "depth9_noro_about",
    shortName: "About Norovirus",
    detail: "Symptoms; dehydration; spread; supportive treatment. Page dated April 24, 2024. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/norovirus/about/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_noro_control = CitationSource(
    id: "depth9_noro_control",
    shortName: "Norovirus: Healthcare Outbreak Recommendations",
    detail: "2011 guideline summary: patient placement; hand hygiene; PPE; environmental cleaning; staff exclusion. Page dated March 21, 2024. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/norovirus-guidelines/summary-recommendations.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_noro_lab = CitationSource(
    id: "depth9_noro_lab",
    shortName: "Laboratory Testing for Norovirus",
    detail: "RT-qPCR; antigen-test limitations; whole-stool specimens; outbreak reporting. Page dated April 24, 2024. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/norovirus/php/laboratories/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_noro_prevent = CitationSource(
    id: "depth9_noro_prevent",
    shortName: "How to Prevent Norovirus",
    detail: "Illness and food handling; soap-and-water hygiene; contaminated linen handling. Page dated January 13, 2025. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/norovirus/prevention/index.html",
    lastRetrieved: "2026-09-17"
)

public enum NorovirusHealthcareOutbreakSample {
    public static let entry = ReferenceEntry(
        id: "norovirus-healthcare-outbreak-care",
        title: "Norovirus — healthcare outbreak care",
        subtitle: "Vomiting clusters, dehydration, precautions & reporting",
        eyebrow: "REFERENCE · INFECTION PREVENTION",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .infection),
        sections: [
            .bullets(title: "Recognize the clinical pattern", [
                AttributedBullet("Norovirus commonly causes abrupt vomiting, diarrhea, nausea and abdominal pain. It is a gastroenteritis virus, not the influenza virus despite the term “stomach flu.”", citationIDs: ["depth9_noro_about"]),
                AttributedBullet("Symptoms often begin 12–48 hours after exposure and improve within 1–3 days. Clinical recovery does not mean shedding has immediately stopped.", citationIDs: ["depth9_noro_about"])
            ]),
            .bullets(title: "Assess fluid-loss consequences", [
                AttributedBullet("Reduced urine, dry mouth and dizziness on standing suggest dehydration. Older adults and people with other illnesses may become seriously dehydrated.", citationIDs: ["depth9_noro_about"]),
                AttributedBullet("Treatment is supportive: oral rehydration can help mild dehydration, while severe dehydration may need hospital-based intravenous fluids. Antibiotics do not treat norovirus.", citationIDs: ["depth9_noro_about"])
            ]),
            .bullets(title: "Use outbreak precautions promptly", [
                AttributedBullet("Place symptomatic patients on Contact Precautions in a single room when possible. Do not wait for laboratory confirmation to begin outbreak controls.", citationIDs: ["depth9_noro_control"]),
                AttributedBullet("During outbreaks, continue Contact Precautions at least 48 hours after symptoms resolve. Infection prevention may extend this for patients with complex medical conditions.", citationIDs: ["depth9_noro_control"])
            ]),
            .bullets(title: "Protect hands and clothing", [
                AttributedBullet("Wear gown and gloves for contact with suspected or confirmed cases. During outbreaks, wash with soap and water after patient care or contact.", citationIDs: ["depth9_noro_control"]),
                AttributedBullet("Add a surgical mask and eye protection, or a full face shield, when splashes are anticipated, particularly with vomiting. Select PPE for the exposure.", citationIDs: ["depth9_noro_control"])
            ]),
            .bullets(title: "Collect useful specimens", [
                AttributedBullet("Whole stool is the preferred clinical specimen. RT-qPCR is the preferred diagnostic method; confirm collection requirements with the laboratory or outbreak-response team.", citationIDs: ["depth9_noro_lab"]),
                AttributedBullet("Antigen enzyme immunoassays have lower sensitivity. They should not replace RT-qPCR in outbreak investigations or be relied on for a single sporadic case.", citationIDs: ["depth9_noro_lab"])
            ]),
            .bullets(title: "Clean beyond the visible spill", [
                AttributedBullet("Increase cleaning of high-touch areas and shared equipment. Use a facility-approved product with an EPA norovirus claim and observe the labeled contact time.", citationIDs: ["depth9_noro_control"]),
                AttributedBullet("Handle stool- or vomit-soiled laundry carefully without shaking it. Wear gloves and wash hands after handling contaminated items.", citationIDs: ["depth9_noro_prevent"])
            ]),
            .bullets(title: "Coordinate unit and staff response", [
                AttributedBullet("Limit nonessential movement and notify receiving areas before transfer. Infection prevention directs cohorting, visitor restrictions and any changes to group activities.", citationIDs: ["depth9_noro_control"]),
                AttributedBullet("Ill staff should be excluded for at least 48 hours after symptoms stop. Follow occupational-health and outbreak policies for return to work.", citationIDs: ["depth9_noro_control"])
            ]),
            .bullets(title: "Communicate beyond the bedside", [
                AttributedBullet("Report suspected healthcare gastroenteritis outbreaks through the facility to the appropriate health department. Laboratory identification supports investigation but should not delay notification.", citationIDs: ["depth9_noro_lab"]),
                AttributedBullet("For home teaching, emphasize soap-and-water handwashing and avoiding food preparation or care of others while ill and for at least 48 hours afterward.", citationIDs: ["depth9_noro_prevent"])
            ])
        ],
        citations: [depth9_noro_about, depth9_noro_control, depth9_noro_lab, depth9_noro_prevent],
        lastSourceFidelityReview: "2026-09-17"
    )
}
