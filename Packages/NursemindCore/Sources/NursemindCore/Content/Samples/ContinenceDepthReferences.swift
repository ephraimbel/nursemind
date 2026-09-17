import Foundation

private let depth3_fecal_assessment = CitationSource(
    id: "depth3_fecal_assessment",
    shortName: "Diagnosis of Fecal Incontinence",
    detail: "History, symptom patterns and stool diary; reviewed July 2017. Original federal health-education text adapted and condensed by NurseMind. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/bowel-control-problems-fecal-incontinence/diagnosis",
    lastRetrieved: "2026-09-17"
)

private let depth3_fecal_support = CitationSource(
    id: "depth3_fecal_support",
    shortName: "Treatment of Fecal Incontinence",
    detail: "Daily coping, skin care, food diary, bowel training and specialist-supported pelvic floor care; reviewed July 2017. Medicines, devices and surgical regimens excluded. Original federal health-education text adapted and condensed by NurseMind. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/bowel-control-problems-fecal-incontinence/treatment",
    lastRetrieved: "2026-09-17"
)

private let depth3_retention = CitationSource(
    id: "depth3_retention",
    shortName: "Symptoms & Causes of Urinary Retention",
    detail: "Acute versus chronic symptoms, urgent assessment, causes and postoperative context; reviewed December 2019. Original federal health-education text adapted and condensed by NurseMind. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/urinary-retention/symptoms-causes",
    lastRetrieved: "2026-09-17"
)

private let depth3_retention_tests = CitationSource(
    id: "depth3_retention_tests",
    shortName: "Diagnosis of Urinary Retention",
    detail: "History, postvoid residual measurement and tests selected to investigate cause; reviewed December 2019. Original federal health-education text adapted and condensed by NurseMind. Images, linked third-party material and source tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases, National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/urinary-retention/diagnosis",
    lastRetrieved: "2026-09-17"
)

public enum FecalContinenceDepthSample {
    public static let entry = ReferenceEntry(
        id: "fecal-incontinence-support",
        title: "Fecal incontinence: assessment and support",
        subtitle: "Bowel patterns, skin comfort and practical daily care",
        eyebrow: "REFERENCE · CONTINENCE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Describe the pattern without blame", [
                AttributedBullet("Ask when stool leakage began, how often it happens and how much is lost. Distinguish urgency that cannot be deferred from leakage without awareness, and ask whether it is liquid stool, solid stool or mucus.", citationIDs: ["depth3_fecal_assessment"]),
                AttributedBullet("Include usual bowel habits, constipation or diarrhea, recent illness or injury, childbirth history and how symptoms affect daily life. A bowel-control problem needs assessment rather than an assumption that absorbent products are the only option.", citationIDs: ["depth3_fecal_assessment"])
            ]),
            .bullets(title: "Use a bowel diary to guide assessment", [
                AttributedBullet("A stool diary can show the timing of bowel movements and leakage, stool consistency, urgency and associated food intake. Share the record with the treating team to help identify patterns.", citationIDs: ["depth3_fecal_assessment"]),
                AttributedBullet("Food-related patterns differ between people. Record what and how much was eaten or drunk alongside symptoms before eliminating foods; a clinician or dietitian can help interpret the pattern.", citationIDs: ["depth3_fecal_support"])
            ]),
            .bullets(title: "Protect skin and dignity", [
                AttributedBullet("Clean the anal area after a bowel movement or leakage, keep the skin dry and change soiled clothing or absorbent products promptly. Persistent skin irritation warrants review.", citationIDs: ["depth3_fecal_support"]),
                AttributedBullet("Moisture-barrier products can protect irritated skin; ask the care team which product is appropriate. Breathable clothing and absorbent products that move moisture away from skin may improve comfort.", citationIDs: ["depth3_fecal_support"]),
                AttributedBullet("For outings, plan access to a bathroom and carry clean clothing and cleansing supplies. These supports can make daily activity more manageable while the cause is assessed and treated.", citationIDs: ["depth3_fecal_support"])
            ]),
            .bullets(title: "Support the individualized bowel plan", [
                AttributedBullet("Treatment depends on the cause. Dietary changes, bowel training, pelvic floor exercises or biofeedback may be part of a clinician-directed plan; not every person needs the same approach.", citationIDs: ["depth3_fecal_support"]),
                AttributedBullet("Bowel training may use planned toilet opportunities, such as after meals. Improvement can take time. Pelvic floor or biofeedback work should include instruction so the intended muscles and coordination are addressed.", citationIDs: ["depth3_fecal_support"])
            ])
        ],
        citations: [depth3_fecal_assessment, depth3_fecal_support],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum UrinaryRetentionDepthSample {
    public static let entry = ReferenceEntry(
        id: "urinary-retention-recognition",
        title: "Urinary retention: recognition and assessment",
        subtitle: "Acute inability to void, chronic leakage and postvoid residual",
        eyebrow: "REFERENCE · CONTINENCE CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Recognize a need for immediate assessment", [
                AttributedBullet("A sudden inability to urinate, particularly with an urgent need to void, lower abdominal swelling or severe pain, may indicate acute urinary retention. Inability to urinate or severe abdominal pain needs immediate medical assessment.", citationIDs: ["depth3_retention"]),
                AttributedBullet("Chronic retention can develop gradually with few symptoms. The absence of severe pain does not exclude incomplete bladder emptying.", citationIDs: ["depth3_retention"])
            ]),
            .bullets(title: "Look beyond the presence of urine output", [
                AttributedBullet("Small frequent voids, hesitancy, a slow stream, an urge soon after voiding or leakage without warning can occur with chronic retention. Passing some urine does not establish that the bladder emptied.", citationIDs: ["depth3_retention"]),
                AttributedBullet("Report persistent emptying difficulties for clinical review. Retention can arise from an obstruction or from inadequate bladder contraction; symptoms alone do not establish the cause.", citationIDs: ["depth3_retention"])
            ]),
            .bullets(title: "Collect the relevant context", [
                AttributedBullet("Ask about onset, urinary and bowel habits, intake, previous operations, catheter use, prostate problems, and pregnancy or childbirth history where relevant. Include all prescription and OTC medicines.", citationIDs: ["depth3_retention_tests"]),
                AttributedBullet("Medicines that can contribute include anticholinergics, some antihistamines or decongestants, and opioids. Constipation, neurologic disease and urinary outlet problems are other possible contributors for the treating team to assess.", citationIDs: ["depth3_retention"]),
                AttributedBullet("After surgery, anesthesia may reduce awareness of a full bladder, while fluids, swelling or pelvic procedures can contribute to retention. Include postoperative timing and new symptoms in the handoff.", citationIDs: ["depth3_retention"])
            ]),
            .bullets(title: "Understand the role of measurement", [
                AttributedBullet("A postvoid residual measures urine left in the bladder after urination, using ultrasound or a catheter. It contributes to assessment alongside history and examination; this guide does not set a catheterization threshold.", citationIDs: ["depth3_retention_tests"]),
                AttributedBullet("The clinician may select urine or blood tests, imaging, urodynamics or cystoscopy to investigate the cause and associated problems. Explain the purpose of the tests ordered for this person rather than implying everyone needs the same workup.", citationIDs: ["depth3_retention_tests"])
            ])
        ],
        citations: [depth3_retention, depth3_retention_tests],
        lastSourceFidelityReview: "2026-09-17"
    )
}
