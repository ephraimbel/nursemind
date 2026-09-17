import Foundation

private let renal_hd = CitationSource(
    id: "renal_hd", shortName: "NIDDK — Hemodialysis",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/kidney-disease/kidney-failure/hemodialysis", lastRetrieved: "2026-09-17"
)

private let renal_hd_infection = CitationSource(
    id: "renal_hd_infection", shortName: "CDC — Dialysis access and infection prevention",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "Centers for Disease Control and Prevention", license: .publicDomain,
    url: "https://www.cdc.gov/dialysis-safety/about/index.html", lastRetrieved: "2026-09-17"
)

private let renal_pd = CitationSource(
    id: "renal_pd", shortName: "NIDDK — Peritoneal dialysis",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/kidney-disease/kidney-failure/peritoneal-dialysis", lastRetrieved: "2026-09-17"
)

private let renal_pd_infection = CitationSource(
    id: "renal_pd_infection", shortName: "CDC — Peritoneal dialysis infection prevention",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "Centers for Disease Control and Prevention", license: .publicDomain,
    url: "https://www.cdc.gov/dialysis-safety/hcp/peritoneal-dialysis/index.html", lastRetrieved: "2026-09-17"
)

private let renal_hd_nutrition = CitationSource(
    id: "renal_hd_nutrition", shortName: "NIDDK — Eating and nutrition for hemodialysis",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/kidney-disease/kidney-failure/hemodialysis/eating-nutrition", lastRetrieved: "2026-09-17"
)

private let renal_pd_nutrition = CitationSource(
    id: "renal_pd_nutrition", shortName: "NIDDK — Eating and nutrition for peritoneal dialysis",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/kidney-disease/kidney-failure/peritoneal-dialysis/eating-nutrition", lastRetrieved: "2026-09-17"
)

private let renal_conservative = CitationSource(
    id: "renal_conservative", shortName: "NIDDK — Conservative management for kidney failure",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/kidney-disease/kidney-failure/conservative-management", lastRetrieved: "2026-09-17"
)

private let renal_choices = CitationSource(
    id: "renal_choices", shortName: "NIDDK — Choosing a kidney-failure treatment",
    detail: "Federal health-education prose paraphrased and condensed by NurseMind. Linked third-party material, figures and tables excluded.",
    publisher: "National Institute of Diabetes and Digestive and Kidney Diseases", license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/kidney-disease/kidney-failure/choosing-treatment", lastRetrieved: "2026-09-17"
)

public enum HemodialysisNursingSupportSample {
    public static let entry = ReferenceEntry(
        id: "hemodialysis-nursing-support", title: "Hemodialysis nursing support",
        subtitle: "Access assessment, treatment tolerance and infection prevention", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Understand the treatment", [
                AttributedBullet("Hemodialysis moves blood through an external filter to remove wastes and excess water. It supports kidney function but does not cure kidney failure. Treatment schedules differ between home and center-based programs.", citationIDs: ["renal_hd"])
            ]),
            .bullets(title: "Identify the access", [
                AttributedBullet("An arteriovenous fistula connects an artery and vein; a graft uses an implanted connecting tube. A central venous catheter reaches a large vein. Confirm the access type before discussing care or infection risk.", citationIDs: ["renal_hd_infection"]),
                AttributedBullet("CDC identifies the lowest access-related infection risk with fistulas, higher risk with grafts, and the highest with central venous catheters. The access decision still depends on the person’s needs and available options.", citationIDs: ["renal_hd_infection"])
            ]),
            .bullets(title: "Assess access changes", [
                AttributedBullet("For a fistula or graft, report loss of the usual vibration, called the thrill, to the dialysis team. Warmth or redness also needs assessment. Clean and protect the access using the dialysis team’s instructions.", citationIDs: ["renal_hd"]),
                AttributedBullet("Check for redness, swelling or unusual drainage. Report a catheter dressing that becomes wet or dirty. Hand hygiene before and after access care is part of protecting the patient, regardless of access type.", citationIDs: ["renal_hd_infection"])
            ]),
            .bullets(title: "Watch treatment tolerance", [
                AttributedBullet("Fluid and chemical shifts can cause cramps, nausea, weakness, dizziness or hypotension. Report these during treatment so the dialysis team can assess and adjust the plan. A displaced needle or disconnected tubing can cause blood loss.", citationIDs: ["renal_hd"])
            ]),
            .bullets(title: "Evaluate recovery and ongoing support", [
                AttributedBullet("Changes in breathlessness, swelling, appetite, energy, weight and laboratory results help the team assess response. The prescribed target weight reflects fluid assessment; it is not a number to independently change after one difficult session.", citationIDs: ["renal_hd"]),
                AttributedBullet("Invite questions about infection prevention and access options. The patient and family should know which access changes to report and how to reach the dialysis service between treatments.", citationIDs: ["renal_hd_infection"])
            ])
        ],
        citations: [renal_hd, renal_hd_infection],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum PeritonealDialysisDailyCareSample {
    public static let entry = ReferenceEntry(
        id: "peritoneal-dialysis-daily-care", title: "Peritoneal dialysis daily care",
        subtitle: "Exchanges, catheter care, effluent changes and home readiness", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .elimination),
        sections: [
            .bullets(title: "Know the prescribed method", [
                AttributedBullet("Peritoneal dialysis uses the abdominal lining to exchange wastes and fluid with dialysis solution. Manual CAPD and automated cycler treatment have different routines. The fill, dwell and drain schedule and solution are prescribed for the individual.", citationIDs: ["renal_pd"])
            ]),
            .bullets(title: "Support a reliable daily routine", [
                AttributedBullet("Training covers equipment, connections, exit-site care and safe exchanges. A trained helper can support sick days. People using a cycler need a plan for power failure, including the manual-exchange method taught by their dialysis team.", citationIDs: ["renal_pd"]),
                AttributedBullet("Plan clean supply storage, adequate space and delivery arrangements before travel. Review how treatment fits sleep, work and family responsibilities; practical barriers can make the prescribed routine difficult to sustain.", citationIDs: ["renal_pd"])
            ]),
            .bullets(title: "Prevent contamination", [
                AttributedBullet("Hand hygiene before handling supplies or the catheter, aseptic exchange technique and routine exit-site care reduce opportunities for infection. Teaching should include continued monitoring and support from the dialysis team.", citationIDs: ["renal_pd_infection"]),
                AttributedBullet("Inspect unused solution for cloudiness or other contamination. Follow the trained connection and masking procedure and the team’s instructions for cleaning the exit site. Use the prescribed supplies and solution.", citationIDs: ["renal_pd"])
            ]),
            .bullets(title: "Recognize possible infection", [
                AttributedBullet("Cloudy drained fluid, abdominal pain or tenderness, fever or chills may indicate peritonitis. New exit-site redness, swelling, pain or drainage may indicate a local infection. These findings require prompt clinical evaluation rather than waiting for a routine visit.", citationIDs: ["renal_pd_infection"]),
                AttributedBullet("Report a new change in effluent appearance even when other symptoms are limited. Describe the change and associated symptoms to the dialysis team; the appearance alone does not establish a diagnosis.", citationIDs: ["renal_pd_infection"])
            ]),
            .bullets(title: "Review effectiveness and other concerns", [
                AttributedBullet("Blood tests and collections of drained dialysate, and sometimes urine, help assess treatment adequacy. New abdominal or groin bulging also warrants review. Prescription changes belong to the kidney-care team.", citationIDs: ["renal_pd"])
            ])
        ],
        citations: [renal_pd, renal_pd_infection],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DialysisNutritionFluidsSample {
    public static let entry = ReferenceEntry(
        id: "dialysis-nutrition-and-fluids", title: "Nutrition and fluids during dialysis",
        subtitle: "Individual plans for hemodialysis and peritoneal dialysis", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Start with the current renal plan", [
                AttributedBullet("A renal dietitian helps match food and fluid intake to treatment and remaining kidney function. Hemodialysis allows fluid and wastes to accumulate between sessions; the individual plan accounts for what treatment removes.", citationIDs: ["renal_hd_nutrition"]),
                AttributedBullet("Peritoneal dialysis runs on a different schedule and can permit a different eating plan. Do not transfer restrictions from a hemodialysis handout to every person receiving peritoneal dialysis.", citationIDs: ["renal_pd_nutrition"])
            ]),
            .bullets(title: "Make fluid intake visible", [
                AttributedBullet("Use the team’s daily fluid goal. Drinks, soups, ice cream, gelatin and other water-containing foods contribute. Review weight change, swelling and breathlessness with the dialysis team when considering fluid balance.", citationIDs: ["renal_hd_nutrition"]),
                AttributedBullet("Fluid overload can also occur during peritoneal dialysis. The dietitian guides intake and the nephrologist adjusts the dialysis prescription. More exchanges or stronger solution are not changes to improvise from a dietary concern.", citationIDs: ["renal_pd_nutrition"])
            ]),
            .bullets(title: "Avoid a universal potassium rule", [
                AttributedBullet("For hemodialysis, potassium-rich foods may need limits chosen with the renal dietitian. Some salt substitutes contain potassium; check the product before suggesting it as a low-sodium alternative.", citationIDs: ["renal_hd_nutrition"]),
                AttributedBullet("Peritoneal dialysis may remove enough potassium that additional dietary potassium is needed. The amount and food choices must follow the patient’s current plan rather than a blanket low-potassium diet.", citationIDs: ["renal_pd_nutrition"])
            ]),
            .bullets(title: "Balance protein, phosphorus and energy", [
                AttributedBullet("Hemodialysis can increase protein needs. Discuss appropriate protein foods and phosphorus limits with the dietitian. Poor appetite needs attention so restrictions do not leave the patient without adequate energy intake.", citationIDs: ["renal_hd_nutrition"]),
                AttributedBullet("Peritoneal dialysis also removes protein, while glucose absorbed from dialysate contributes calories. Review weight and food intake together. Phosphorus can still accumulate, even when other dietary restrictions are less strict.", citationIDs: ["renal_pd_nutrition"])
            ]),
            .bullets(title: "Teach practical food choices", [
                AttributedBullet("Sodium increases thirst. Review packaged foods, condiments and seasoning choices with the patient; identify lower-sodium options they can obtain and enjoy. Supplements should be checked with the renal team rather than added automatically.", citationIDs: ["renal_pd_nutrition"])
            ])
        ],
        citations: [renal_hd_nutrition, renal_pd_nutrition],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum ConservativeKidneyCareSample {
    public static let entry = ReferenceEntry(
        id: "conservative-kidney-care", title: "Conservative care for kidney failure",
        subtitle: "Goals, symptom support and informed treatment choices", eyebrow: "REFERENCE · BEDSIDE NURSING",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "Explain what care continues", [
                AttributedBullet("Conservative kidney management provides ongoing care without dialysis or transplantation. It focuses on quality of life, symptom relief and the person’s priorities. It includes active treatment and support rather than withdrawal of all care.", citationIDs: ["renal_conservative"])
            ]),
            .bullets(title: "Support an informed choice", [
                AttributedBullet("Kidney-failure options include hemodialysis, peritoneal dialysis, transplantation and conservative management. Explore how each could affect daily routines, independence and support needs with the kidney-care team.", citationIDs: ["renal_choices"]),
                AttributedBullet("The decision should reflect the person’s health, expected benefits, burdens and preferences. A nurse can help surface unanswered questions and support discussion with the team and people the patient wants involved.", citationIDs: ["renal_conservative"])
            ]),
            .bullets(title: "Assess symptoms and daily function", [
                AttributedBullet("Discuss nausea, appetite, energy, alertness and emotional concerns. The team may address anemia and other effects of kidney failure while considering the burden of appointments, tests and medicines.", citationIDs: ["renal_conservative"])
            ]),
            .bullets(title: "Coordinate practical support", [
                AttributedBullet("Care may involve nephrology, primary care, nursing, dietetics, pharmacy and social work. Food choices, symptom treatment and support needs should be revisited as health and goals change.", citationIDs: ["renal_conservative"]),
                AttributedBullet("Dialysis options differ in treatment location, schedule, equipment and assistance required. Financial and day-to-day concerns deserve discussion before a decision; the kidney team can help patients compare realistic arrangements.", citationIDs: ["renal_choices"])
            ]),
            .bullets(title: "Clarify future care preferences", [
                AttributedBullet("Palliative support can address physical, emotional and spiritual needs. Hospice may become appropriate near the end of life. Discuss future care preferences and family support as part of an evolving plan, without assuming one prognosis for everyone.", citationIDs: ["renal_conservative"])
            ])
        ],
        citations: [renal_conservative, renal_choices],
        lastSourceFidelityReview: "2026-09-17"
    )
}
