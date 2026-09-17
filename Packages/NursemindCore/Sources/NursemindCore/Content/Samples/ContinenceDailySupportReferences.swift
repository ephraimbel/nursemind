import Foundation

private let continence_symptoms = CitationSource(
    id: "continence_symptoms", shortName: "NIDDK — Bladder control symptoms and causes",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/bladder-control-problems/symptoms-causes", lastRetrieved: "2026-09-17"
)

private let continence_assessment = CitationSource(
    id: "continence_assessment", shortName: "NIDDK — Assessing bladder control problems",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/bladder-control-problems/diagnosis", lastRetrieved: "2026-09-17"
)

private let continence_support = CitationSource(
    id: "continence_support", shortName: "NIDDK — Bladder control treatments and support",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/bladder-control-problems/treatment", lastRetrieved: "2026-09-17"
)

private let continence_diversion = CitationSource(
    id: "continence_diversion", shortName: "NIDDK — Urinary diversion",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/urologic-diseases/urinary-diversion", lastRetrieved: "2026-09-17"
)

private let bowel_ostomy_daily = CitationSource(
    id: "bowel_ostomy_daily", shortName: "NIDDK — After bowel ostomy surgery",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/ostomy-surgery-bowel/after", lastRetrieved: "2026-09-17"
)

private let bowel_ostomy_changes = CitationSource(
    id: "bowel_ostomy_changes", shortName: "NIDDK — Bowel ostomy complications",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/digestive-diseases/ostomy-surgery-bowel/complications", lastRetrieved: "2026-09-17"
)

public enum UrinaryContinenceSupportSample {
    public static let entry = ReferenceEntry(
        id: "urinary-continence-support", title: "Urinary continence assessment and support",
        subtitle: "Patterns, bladder diaries, conservative care and dignity", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Describe the problem before labeling it", [
                AttributedBullet("Ask when leakage occurs: with coughing or activity, after a sudden urge, without awareness, or because the person cannot reach a toilet. Include nighttime symptoms and their effect on sleep, activities and quality of life.", citationIDs: ["continence_symptoms"]),
                AttributedBullet("History and examination guide evaluation. Urine tests, selected imaging or bladder-function studies may be needed; the leakage pattern alone does not establish the cause.", citationIDs: ["continence_assessment"])
            ]),
            .bullets(title: "Use a useful bladder diary", [
                AttributedBullet("Record drink timing and amounts, voiding times and amounts, leakage episodes, urgency and what was happening when leakage occurred. A diary helps the clinical team identify patterns and tailor the plan.", citationIDs: ["continence_assessment"])
            ]),
            .bullets(title: "Support an individualized routine", [
                AttributedBullet("Timed voiding or bladder training may be recommended using the diary. Review the agreed schedule and response. Pelvic-floor training should be taught correctly; repeatedly interrupting urine flow is not the exercise routine.", citationIDs: ["continence_support"]),
                AttributedBullet("Discuss fluid timing and amount with the care team. Excessive restriction can cause dehydration. Caffeine or alcohol may worsen leakage, and constipation can contribute to bladder problems; review these factors together.", citationIDs: ["continence_support"])
            ]),
            .bullets(title: "Protect comfort and dignity", [
                AttributedBullet("Absorbent products and appropriate skin cleansers or barriers can reduce the effects of leakage. Ask about embarrassment and social avoidance, and offer support without making continence a prerequisite for participation in daily life.", citationIDs: ["continence_support"])
            ]),
            .bullets(title: "Recognize concerns needing medical review", [
                AttributedBullet("New trouble urinating, pelvic pain or worsening loss of control needs assessment. Inability to pass urine, blood in urine or painful urination warrants prompt medical attention rather than routine bladder training alone.", citationIDs: ["continence_symptoms"])
            ]),
            .bullets(title: "Reassess what matters to the patient", [
                AttributedBullet("Review the diary with the clinician to compare leakage and urgency patterns. If conservative measures do not help, further treatment options can be considered according to the cause and the patient’s goals.", citationIDs: ["continence_support"])
            ])
        ],
        citations: [continence_symptoms, continence_assessment, continence_support],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum UrostomyDailyCareSample {
    public static let entry = ReferenceEntry(
        id: "urostomy-daily-care", title: "Urostomy and urinary diversion care",
        subtitle: "Drainage route, skin protection and problems to report", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Identify the actual diversion", [
                AttributedBullet("An ileal conduit drains continuously into an external pouch. A continent cutaneous reservoir is emptied by catheter; a neobladder connects to the urethra. Confirm the surgical anatomy before applying care instructions.", citationIDs: ["continence_diversion"])
            ]),
            .bullets(title: "Protect the stoma and skin", [
                AttributedBullet("Use hand hygiene before and after care. Gently clean the stoma and surrounding skin with warm water; mild soap may be used, followed by rinsing and drying. Avoid harsh or oily products.", citationIDs: ["continence_diversion"])
            ]),
            .bullets(title: "Maintain the pouching system", [
                AttributedBullet("A well-fitting skin barrier limits leakage and urine contact. Empty the pouch before it becomes heavy, and follow its change schedule. An appropriate night-drainage system can collect urine during sleep.", citationIDs: ["continence_diversion"])
            ]),
            .bullets(title: "Follow the reservoir-specific plan", [
                AttributedBullet("For a continent reservoir or neobladder, follow the team’s emptying and irrigation instructions. Difficulty inserting the prescribed catheter requires immediate contact with the clinical team.", citationIDs: ["continence_diversion"])
            ]),
            .bullets(title: "Report new concerns", [
                AttributedBullet("Fever, chills, back or flank pain, vomiting or other infection symptoms need prompt assessment. Report new skin irritation and leakage for review of fit and care.", citationIDs: ["continence_diversion"])
            ]),
            .bullets(title: "Support life after surgery", [
                AttributedBullet("Discuss supplies, clothing, activity, intimacy and emotional adjustment. The ostomy team can help adapt the routine and connect the patient with support.", citationIDs: ["continence_diversion"])
            ])
        ],
        citations: [continence_diversion],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum BowelOstomyDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "bowel-ostomy-daily-support", title: "Living with a bowel ostomy",
        subtitle: "Output, hydration, pouch fit, food tolerance and adjustment", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Connect anatomy with expected output", [
                AttributedBullet("The amount and location of bowel removed or bypassed affect stool consistency and absorption of water and nutrients. A bypassed lower bowel may still pass mucus. Confirm the person’s operation and expected pattern with the surgical or ostomy team.", citationIDs: ["bowel_ostomy_daily"])
            ]),
            .bullets(title: "Protect the skin and pouch seal", [
                AttributedBullet("The skin barrier protects against intestinal contents. Review pouch fit, emptying, changes and skin care with an ostomy nurse. The appropriate system and routine vary with the stoma and surrounding skin.", citationIDs: ["bowel_ostomy_daily"]),
                AttributedBullet("Leakage, repeated adhesive trauma and infection can all damage peristomal skin. New irritation or persistent leakage warrants assessment of the cause rather than simply continuing the same pouch routine.", citationIDs: ["bowel_ostomy_changes"])
            ]),
            .bullets(title: "Review food and fluid tolerance", [
                AttributedBullet("Many people gradually resume a varied diet. Early restrictions and later food reintroduction should follow the individual recovery plan. A food-and-symptom record can help identify foods associated with gas, diarrhea or discomfort.", citationIDs: ["bowel_ostomy_daily"]),
                AttributedBullet("Dehydration is more likely when the colon has been removed or bypassed. Severe watery output needs prompt review. Nutrient absorption may also be affected when small bowel is removed; discuss nutrition concerns with the team.", citationIDs: ["bowel_ostomy_changes"])
            ]),
            .bullets(title: "Recognize changes that need urgent review", [
                AttributedBullet("Seek prompt medical assessment for heavy or persistent stoma bleeding, a new concerning color change, severe ongoing vomiting, or absent output with cramping and nausea. These can signal complications requiring more than a pouch change.", citationIDs: ["bowel_ostomy_changes"]),
                AttributedBullet("Report new retraction, prolapse, narrowing or a bulge around the stoma. These changes can affect drainage or pouch fit and sometimes reflect a more serious problem.", citationIDs: ["bowel_ostomy_changes"])
            ]),
            .bullets(title: "Support recovery and confidence", [
                AttributedBullet("Discuss travel supplies, body image, intimacy and returning to activity. Lifting or contact-sport restrictions depend on recovery and the surgical plan. Ostomy nurses and peer support can help patients rebuild a workable routine.", citationIDs: ["bowel_ostomy_daily"])
            ])
        ],
        citations: [bowel_ostomy_daily, bowel_ostomy_changes],
        lastSourceFidelityReview: "2026-09-17"
    )
}
