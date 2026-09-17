import Foundation

private let du_depth_cystoscopy = CitationSource(
    id: "du_depth_cystoscopy", shortName: "NIDDK — Cystoscopy and ureteroscopy",
    detail: "July 2021. Purpose, anesthesia, urine testing, recovery, stent symptoms and urgent reporting. No universal fluid target, antibiotic prescription or stent removal deadline. Conflicting one-day/two-day symptom persistence wording is resolved using the source’s earlier reporting advice. Original NIDDK federal educational prose adapted and condensed by NurseMind. Images, videos, third-party publications in the bibliography and procedural dose tables excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases; NIH", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/diagnostic-tests/cystoscopy-ureteroscopy", lastRetrieved: "2026-09-17"
)

public enum DUDepthCystoscopyUreteroscopyPreparationRecoverySample {
    public static let entry = ReferenceEntry(
        id: "cystoscopy-ureteroscopy-preparation-recovery", title: "Cystoscopy and ureteroscopy: nursing support",
        subtitle: "Urinary tract examination, recovery and temporary stents", eyebrow: "REFERENCE · ADULT NURSING CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .bullets(title: "Distinguish the two examinations", [
                AttributedBullet("Cystoscopy examines the urethra and bladder. Ureteroscopy uses a longer, narrower instrument to examine the ureters and the lining of the kidney’s collecting area.", citationIDs: ["du_depth_cystoscopy"]),
                AttributedBullet("The clinician may investigate blood in the urine, obstruction, repeated infections or other urinary symptoms, and may also remove a stone, treat abnormal tissue or obtain a biopsy. Confirm the examination and any planned treatment.", citationIDs: ["du_depth_cystoscopy"])
            ]),
            .bullets(title: "Review urine testing and preparation", [
                AttributedBullet("The team may request a urine sample to look for infection before the procedure. Review current medicines, allergies and the anesthesia plan; an identified urinary infection may require treatment first.", citationIDs: ["du_depth_cystoscopy"]),
                AttributedBullet("Instructions about food, fluids, emptying the bladder and medicine adjustments vary. A simple office cystoscopy may need little preparation, while an examination under anesthesia has a different preparation and transport plan.", citationIDs: ["du_depth_cystoscopy"])
            ]),
            .bullets(title: "Explain bladder filling and anesthesia", [
                AttributedBullet("Sterile saline fills the bladder to improve the view during cystoscopy. Filling may cause discomfort or the urge to urinate; the clinician can remove some fluid during the examination.", citationIDs: ["du_depth_cystoscopy"]),
                AttributedBullet("Local anesthetic may be used for the urethra, while sedation or general anesthesia is often used for ureteroscopy or more involved procedures. The care team monitors vital signs during the encounter.", citationIDs: ["du_depth_cystoscopy"])
            ]),
            .bullets(title: "Check voiding before discharge", [
                AttributedBullet("Before leaving, the patient is asked to try to urinate so the team can confirm that urination is possible. Review the specific restrictions on rest, driving and physical activity.", citationIDs: ["du_depth_cystoscopy"]),
                AttributedBullet("Mild burning, small amounts of blood, urinary urgency or mild bladder or kidney-area discomfort may occur. NIDDK advises contacting the team if these problems last beyond a day, or earlier for severe pain, severe bleeding or inability to urinate.", citationIDs: ["du_depth_cystoscopy"])
            ]),
            .bullets(title: "Explain a temporary ureteral stent", [
                AttributedBullet("A stent may be left after ureteroscopy to keep urine draining while swelling resolves. It can cause bladder or kidney-area discomfort and frequent or urgent urination while it remains in place.", citationIDs: ["du_depth_cystoscopy"]),
                AttributedBullet("The duration varies, and cystoscopy may be needed for removal. Confirm the individual removal or follow-up plan; this reference does not provide instructions for manipulating or removing a stent.", citationIDs: ["du_depth_cystoscopy"])
            ]),
            .bullets(title: "Identify symptoms needing prompt assessment", [
                AttributedBullet("Seek care promptly for inability to urinate with a full-bladder sensation, bright red urine or clots, fever with or without chills, or severe discomfort. These findings should not be attributed automatically to a stent.", citationIDs: ["du_depth_cystoscopy"]),
                AttributedBullet("Possible complications include infection, abnormal bleeding, injury, urinary retention, scarring and anesthesia-related problems. Persistent or worsening symptoms require contact with the treating service.", citationIDs: ["du_depth_cystoscopy"])
            ]),
            .bullets(title: "Review the home-care instructions", [
                AttributedBullet("The clinician may recommend specific comfort measures, fluids or medicines after the procedure. Use that individualized plan rather than a fixed fluid quantity or routine antibiotic course for every patient.", citationIDs: ["du_depth_cystoscopy"]),
                AttributedBullet("If biopsy, stone treatment or a stent was part of the procedure, review the corresponding next step with the urology team. Rest, driving and activity instructions depend on the intervention and anesthesia used.", citationIDs: ["du_depth_cystoscopy"])
            ])
        ],
        citations: [du_depth_cystoscopy],
        lastSourceFidelityReview: "2026-09-17"
    )
}
