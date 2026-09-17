import Foundation

private let ip_depth_cre = CitationSource(
    id: "ip_depth_cre", shortName: "CDC — CRE infection control",
    detail: "December 17, 2025; laboratory alerts, acute-care and nursing-home precautions, overseas healthcare history and transfer communication. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention", license: .publicDomain,
    url: "https://www.cdc.gov/cre/hcp/infection-control/index.html", lastRetrieved: "2026-09-17"
)

public enum IPDepthCreBedsideTransferPrecautionsSample {
    public static let entry = ReferenceEntry(
        id: "cre-bedside-transfer-precautions", title: "CRE: bedside and transfer precautions",
        subtitle: "Laboratory alerts, healthcare history and containment", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .infection),
        sections: [
            .bullets(title: "Recognize why the result matters", [
                AttributedBullet("Carbapenem-resistant Enterobacterales can cause difficult-to-treat infections and spread between healthcare facilities. Identification should prompt communication with clinical and infection-prevention staff, not just addition of an organism name to the chart.", citationIDs: ["ip_depth_cre"]),
                AttributedBullet("Resistance mechanisms matter. CDC highlights increasing NDM-producing CRE and recommends including NDM testing in laboratory workflows; medicines effective against some other CRE may not be effective against these organisms.", citationIDs: ["ip_depth_cre"])
            ]),
            .bullets(title: "Connect laboratory and clinical teams", [
                AttributedBullet("Ensure that a new CRE result reaches the responsible clinical and infection-prevention teams promptly. When local testing is unavailable, the laboratory and health department can arrange support through the CDC Antimicrobial Resistance Laboratory Network.", citationIDs: ["ip_depth_cre"]),
                AttributedBullet("Follow the facility’s detection, tracking and reporting process. The nursing role includes recognizing that a pending characterization result or an outside-facility report may need attention before routine transfer arrangements proceed.", citationIDs: ["ip_depth_cre"])
            ]),
            .bullets(title: "Use precautions for the setting", [
                AttributedBullet("CDC recommends isolation and Contact Precautions for affected patients in acute care. Nursing homes may use Enhanced Barrier Precautions or isolation with Contact Precautions depending on the situation.", citationIDs: ["ip_depth_cre"]),
                AttributedBullet("Maintain hand hygiene, appropriate protective equipment and environmental cleaning throughout care. Precaution selection belongs to the facility’s infection-prevention process and should be communicated clearly to staff providing direct and indirect care.", citationIDs: ["ip_depth_cre"])
            ]),
            .bullets(title: "Ask about recent healthcare abroad", [
                AttributedBullet("At admission, assess for overnight hospitalization or an invasive procedure in another country within the preceding six months. CDC recommends screening and pre-emptive isolation for patients with this history.", citationIDs: ["ip_depth_cre"]),
                AttributedBullet("Communicate that history promptly through the admission and infection-prevention workflow. A patient may need precautions while screening is arranged; do not wait for an overseas record to arrive before reporting the exposure history.", citationIDs: ["ip_depth_cre"])
            ]),
            .bullets(title: "Keep the receiving team informed", [
                AttributedBullet("Before transfer, notify the receiving facility about CRE infection or colonization and other known multidrug-resistant organisms. Provide the current precaution plan and available organism or resistance information.", citationIDs: ["ip_depth_cre"]),
                AttributedBullet("Use the facility’s infection-control transfer process so the information accompanies the patient across departments and organizations. Infection-prevention planning should account for the receiving setting’s ability to continue the required measures.", citationIDs: ["ip_depth_cre"])
            ]),
            .bullets(title: "Support coordinated prevention", [
                AttributedBullet("CDC recommends working with public health to assess ongoing transmission and participating in regional and facility prevention efforts. Follow the resulting screening and containment plan rather than creating an independent bedside clearance rule.", citationIDs: ["ip_depth_cre"]),
                AttributedBullet("Antibiotic stewardship is part of prevention. Communicate treatment questions and available resistance information to the prescribing and pharmacy teams; this reference does not select an antibiotic or infer susceptibility from the CRE label alone.", citationIDs: ["ip_depth_cre"])
            ])
        ],
        citations: [ip_depth_cre],
        lastSourceFidelityReview: "2026-09-17"
    )
}
