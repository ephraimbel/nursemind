import Foundation

private let bedside_depth_cauti = CitationSource(
    id: "bedside_depth_cauti", shortName: "CDC — CAUTI prevention recommendations",
    detail: "2009 guideline summary, CDC webpage March 25, 2024. Sections I–V, appropriate use, sterile insertion, closed-system maintenance, specimen collection and quality improvement. Adapted and condensed federal prose. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention / HICPAC", license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/cauti/summary-of-recommendations.html", lastRetrieved: "2026-09-17"
)

public enum CAUTIBundleSample {
    public static let entry = ReferenceEntry(
        id: "cauti-bundle", title: "CAUTI prevention bundle",
        subtitle: "Indications, closed drainage, specimens and removal review", eyebrow: "REFERENCE · ADULT BEDSIDE CARE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .infection),
        sections: [
            .bullets(title: "Confirm an appropriate indication", [
                AttributedBullet("Indwelling urinary catheters should be used only for an appropriate indication and for the shortest necessary duration. Examples include acute retention or outlet obstruction, accurate output measurement in critically ill patients, selected operations, certain open sacral or perineal wounds, prolonged immobilization and comfort at end of life.", citationIDs: ["bedside_depth_cauti"]),
                AttributedBullet("Incontinence alone is not an indication, and a catheter should not replace routine nursing continence care. Reassess perioperative catheters after surgery; CDC recommends removal as soon as possible, preferably within 24 hours, unless an ongoing indication exists.", citationIDs: ["bedside_depth_cauti"])
            ]),
            .bullets(title: "Consider suitable alternatives", [
                AttributedBullet("Alternatives depend on the clinical problem. External catheters may be appropriate for cooperative male patients without retention or outlet obstruction. Intermittent catheterization is preferable to an indwelling catheter for selected bladder-emptying dysfunction.", citationIDs: ["bedside_depth_cauti"]),
                AttributedBullet("A bladder scanner can help assess urine volume and reduce unnecessary catheterization. Staff need training in its use and cleaning. The choice of an alternative should address the reason for drainage rather than simply replacing one device with another.", citationIDs: ["bedside_depth_cauti"])
            ]),
            .bullets(title: "Use trained, aseptic insertion", [
                AttributedBullet("In acute care, trained personnel insert urinary catheters using aseptic technique and sterile equipment. Hand hygiene is required immediately before and after insertion or manipulation. Appropriate sterile gloves, drapes and supplies help protect the system at placement.", citationIDs: ["bedside_depth_cauti"]),
                AttributedBullet("Unless otherwise indicated, use the smallest bore that permits adequate drainage to reduce urethral trauma. Secure the catheter after insertion to prevent movement and traction. Record the indication, insertion date and time, and who inserted it.", citationIDs: ["bedside_depth_cauti"])
            ]),
            .bullets(title: "Maintain the closed system", [
                AttributedBullet("Maintain a closed drainage system after aseptic insertion. If aseptic technique is breached, a disconnection occurs or leakage develops, CDC recommends replacing both the catheter and collecting system using aseptic technique and sterile equipment. Simply disinfecting and reconnecting the same broken system is not its recommendation.", citationIDs: ["bedside_depth_cauti"]),
                AttributedBullet("Avoid opening the drainage pathway for convenience. During handoff, include any disconnection, leak or concern about asepsis, together with what corrective action occurred, so the next nurse does not mistake a compromised system for an intact one.", citationIDs: ["bedside_depth_cauti"])
            ]),
            .bullets(title: "Keep urine flowing freely", [
                AttributedBullet("Keep the catheter and collecting tubing free from kinks. Maintain the bag below bladder level at all times and off the floor. Check its position after transfers and repositioning rather than assuming that it remained unchanged.", citationIDs: ["bedside_depth_cauti"]),
                AttributedBullet("Empty the bag regularly into a separate clean container for each patient. Prevent splashing and avoid contact between the drainage spigot and the container. Use standard precautions during all manipulation of the catheter and collecting system.", citationIDs: ["bedside_depth_cauti"])
            ]),
            .bullets(title: "Provide routine hygiene and targeted maintenance", [
                AttributedBullet("Routine meatal cleansing during daily bathing is appropriate; antiseptic cleansing solely to prevent CAUTI is not recommended while the catheter remains in place. Do not change catheters or drainage bags at fixed intervals without a clinical indication.", citationIDs: ["bedside_depth_cauti"]),
                AttributedBullet("Routine systemic antibiotics and antimicrobial bladder irrigation are not recommended for CAUTI prevention. Irrigation is generally avoided unless obstruction is anticipated, such as bleeding after selected urologic surgery; prescribed closed continuous irrigation has a separate clinical purpose.", citationIDs: ["bedside_depth_cauti"])
            ]),
            .bullets(title: "Collect a useful urine specimen", [
                AttributedBullet("For a small fresh urine sample for urinalysis or culture, disinfect the needleless sampling port and aspirate aseptically with a sterile syringe or adapter. A sample from stagnant urine in the drainage bag is not an appropriate culture specimen.", citationIDs: ["bedside_depth_cauti"]),
                AttributedBullet("CDC allows aseptic collection from the bag for large-volume special analyses other than culture. Follow the ordered test’s collection and transport instructions. Routine screening for asymptomatic bacteriuria in catheterized patients is not recommended.", citationIDs: ["bedside_depth_cauti"])
            ]),
            .bullets(title: "Review removal and document continuity", [
                AttributedBullet("Use the facility’s daily review or reminder process to identify when the indication has ended. Nurse-directed removal protocols require local authorization and defined criteria. Clamping a catheter before removal is not necessary.", citationIDs: ["bedside_depth_cauti"]),
                AttributedBullet("Document removal date and time and follow the facility’s post-removal voiding and retention assessment process. Quality improvement relies on accurate records of indications, catheter use and infection events, not merely a checked insertion-bundle box.", citationIDs: ["bedside_depth_cauti"])
            ])
        ],
        citations: [bedside_depth_cauti],
        lastSourceFidelityReview: "2026-09-17"
    )
}
