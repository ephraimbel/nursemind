import Foundation

private let du_depth_liver_biopsy = CitationSource(
    id: "du_depth_liver_biopsy", shortName: "NIDDK — Liver biopsy",
    detail: "August 2019. Biopsy routes, clotting assessment, preparation, positioning, observation, activity and warning signs. Older educational source; no coagulation thresholds, transfusion triggers or universal observation schedule. Original NIDDK federal educational prose adapted and condensed by NurseMind. Images, videos, third-party publications in the bibliography and procedural dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/diagnostic-tests/liver-biopsy", lastRetrieved: "2026-09-17"
)

public enum DUDepthLiverBiopsyPreparationRecoverySample {
    public static let entry = ReferenceEntry(
        id: "liver-biopsy-preparation-recovery", title: "Liver biopsy: preparation and recovery",
        subtitle: "Biopsy routes, bleeding surveillance and follow-up", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Connect the biopsy with the clinical question", [
                AttributedBullet("A liver biopsy provides tissue for microscopic examination. It may help diagnose a condition that blood tests or imaging have not clarified, assess liver damage, guide treatment or evaluate treatment response.", citationIDs: ["du_depth_liver_biopsy"]),
                AttributedBullet("The tissue report is separate from imaging or blood-test results. Explain why the team needs a tissue sample and how the result will be used in follow-up.", citationIDs: ["du_depth_liver_biopsy"])
            ]),
            .bullets(title: "Confirm which biopsy route is planned", [
                AttributedBullet("A percutaneous biopsy passes a needle through the abdominal skin. A transjugular biopsy reaches the liver through a catheter placed in the jugular vein; a biopsy can also be obtained during another operation.", citationIDs: ["du_depth_liver_biopsy"]),
                AttributedBullet("The clinician may choose the transjugular route when clotting problems or ascites make a percutaneous approach less suitable. Confirm the planned route because the puncture site, positioning and recovery instructions differ.", citationIDs: ["du_depth_liver_biopsy"])
            ]),
            .bullets(title: "Review clotting assessment and medicines", [
                AttributedBullet("The team may obtain clotting tests and imaging before the biopsy. Review allergies and all medicines, including blood thinners, aspirin, NSAIDs, diabetes medicines and supplements.", citationIDs: ["du_depth_liver_biopsy"]),
                AttributedBullet("The clinician decides whether medicines need adjustment or additional measures are necessary for a clotting problem. This guide does not set a platelet or coagulation threshold or authorize a transfusion before biopsy.", citationIDs: ["du_depth_liver_biopsy"])
            ]),
            .bullets(title: "Prepare for positioning and recovery", [
                AttributedBullet("For a percutaneous biopsy, the patient may lie on the back with the right arm above the head and briefly hold the breath when asked. Local anesthetic is used, and sedation or pain medicine may also be given.", citationIDs: ["du_depth_liver_biopsy"]),
                AttributedBullet("The transjugular approach uses a neck access site and imaging guidance. Follow the procedural team’s fasting instructions and arrange the ride home; preparation and food restrictions vary by approach.", citationIDs: ["du_depth_liver_biopsy"])
            ]),
            .bullets(title: "Observe pain and the circulation", [
                AttributedBullet("Recovery includes lying down and repeated vital-sign assessment according to the procedural plan. Mild right upper abdominal or right shoulder discomfort can occur, but all post-biopsy pain should be reported to the team.", citationIDs: ["du_depth_liver_biopsy"]),
                AttributedBullet("Severe or persistent pain, low blood pressure or a rapid heartbeat can signal internal bleeding. Escalate these findings promptly rather than treating shoulder or abdominal pain as automatically expected.", citationIDs: ["du_depth_liver_biopsy"])
            ]),
            .bullets(title: "Recognize other urgent symptoms", [
                AttributedBullet("NIDDK advises prompt medical care for biopsy-site bleeding, pain, redness or swelling; dizziness, fainting or weakness; fever; nausea or vomiting; or abdominal swelling.", citationIDs: ["du_depth_liver_biopsy"]),
                AttributedBullet("Chest, shoulder or abdominal pain, difficulty breathing, a racing heartbeat or bloody or black tarry stool also require evaluation. Complications can include bleeding, infection, pneumothorax or injury to another organ.", citationIDs: ["du_depth_liver_biopsy"])
            ]),
            .bullets(title: "Review activity and tissue-result follow-up", [
                AttributedBullet("The discharge plan specifies when normal activity and lifting can resume. Restrictions vary with the biopsy route and clinical situation, so use the team’s instructions rather than one universal schedule.", citationIDs: ["du_depth_liver_biopsy"]),
                AttributedBullet("A pathologist examines the liver tissue, and results usually take several days or longer. Confirm who will review the report and how the patient can obtain help for symptoms before that appointment.", citationIDs: ["du_depth_liver_biopsy"])
            ])
        ],
        citations: [du_depth_liver_biopsy],
        lastSourceFidelityReview: "2026-09-17"
    )
}
