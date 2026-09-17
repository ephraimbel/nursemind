import Foundation

private let ip_depth_biopsy = CitationSource(
    id: "ip_depth_biopsy", shortName: "NIDDK — Kidney biopsy",
    detail: "March 2022 source review; preparation, medication review, procedure expectations, monitoring, warning signs and results. Federal prose adapted and condensed by NurseMind; images, videos, linked third-party material and dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/diagnostic-tests/kidney-biopsy", lastRetrieved: "2026-09-17"
)

public enum IPDepthKidneyBiopsyPreparationRecoverySample {
    public static let entry = ReferenceEntry(
        id: "kidney-biopsy-preparation-recovery", title: "Kidney biopsy: preparation and recovery",
        subtitle: "Medication review, observation, bleeding concerns and results", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Clarify the purpose of the biopsy", [
                AttributedBullet("A kidney biopsy collects small tissue samples for a pathologist to examine. It can help clarify persistent blood or excess protein in urine, impaired kidney function, or a problem affecting a transplanted kidney.", citationIDs: ["ip_depth_biopsy"]),
                AttributedBullet("Blood and urine tests may not explain the cause or extent of injury on their own. The biopsy can show inflammation, scarring or other changes that help the treating team choose a plan; it is not a treatment for every cause of abnormal kidney tests.", citationIDs: ["ip_depth_biopsy"])
            ]),
            .bullets(title: "Review bleeding and medication concerns", [
                AttributedBullet("Review prescribed and nonprescription medicines, vitamins and supplements with the procedural team. Aspirin, NSAIDs and blood thinners can affect bleeding risk, while other medicines may affect sedation or anesthesia.", citationIDs: ["ip_depth_biopsy"]),
                AttributedBullet("Follow explicit instructions about medicine changes rather than independently stopping or restarting treatment. Report allergies and uncontrolled high blood pressure, which can increase bleeding risk after biopsy.", citationIDs: ["ip_depth_biopsy"])
            ]),
            .bullets(title: "Confirm the preparation plan", [
                AttributedBullet("Complete the ordered laboratory and imaging checks, fasting instructions and consent process. Arrange a ride home and clarify whether overnight observation is anticipated. Preparation depends on the method and individual clinical condition.", citationIDs: ["ip_depth_biopsy"]),
                AttributedBullet("Positioning can differ for a native versus transplanted kidney and for other clinical circumstances. Explain the planned position and communicate difficulty tolerating it so the team can arrange an appropriate approach.", citationIDs: ["ip_depth_biopsy"])
            ]),
            .bullets(title: "Explain what the person may experience", [
                AttributedBullet("A percutaneous biopsy commonly uses local anesthetic, imaging guidance and sometimes intravenous sedation. The needle may make a clicking sound, more than one sample may be needed, and the clinician may request a brief breath hold.", citationIDs: ["ip_depth_biopsy"]),
                AttributedBullet("Other biopsy approaches are used when a percutaneous procedure is unsuitable. The individual procedural team explains the chosen method; this educational guide does not teach needle placement or image interpretation.", citationIDs: ["ip_depth_biopsy"])
            ]),
            .bullets(title: "Observe during early recovery", [
                AttributedBullet("Recovery observation includes blood pressure, pulse, urine and assessment for internal bleeding at the biopsy site. The person usually rests lying down for several hours, with discharge or overnight monitoring determined by the team.", citationIDs: ["ip_depth_biopsy"]),
                AttributedBullet("Some local soreness and a small amount of blood-tinged urine can occur. Evaluate the amount, trajectory and accompanying symptoms rather than assuming that all pain or visibly abnormal urine is expected.", citationIDs: ["ip_depth_biopsy"])
            ]),
            .bullets(title: "Recognize warning signs after discharge", [
                AttributedBullet("Seek prompt medical help for inability to urinate, new urinary urgency or burning, dark red or brown urine, blood clots in urine, worsening biopsy-site pain, or redness, swelling, bleeding or drainage at the site.", citationIDs: ["ip_depth_biopsy"]),
                AttributedBullet("Fever, faintness or dizziness also require prompt assessment. Provide the contact instructions before discharge so the person knows how to obtain help instead of waiting for the routine result appointment.", citationIDs: ["ip_depth_biopsy"])
            ]),
            .bullets(title: "Complete the follow-up plan", [
                AttributedBullet("Follow the procedural team’s instructions about activity and lifting as the site heals. NIDDK describes avoiding strenuous activity for two weeks; the individual discharge plan should specify applicable limits and medication restart instructions.", citationIDs: ["ip_depth_biopsy"]),
                AttributedBullet("Results may take several days or longer, with a preliminary report sometimes available sooner when urgently needed. Confirm who will review the result with the person and how the findings will guide further care.", citationIDs: ["ip_depth_biopsy"])
            ])
        ],
        citations: [ip_depth_biopsy],
        lastSourceFidelityReview: "2026-09-17"
    )
}
