import Foundation

private let depth8_bone_overview = CitationSource(
    id: "depth8_bone_overview",
    shortName: "Osteoporosis: Overview, Symptoms, & Causes",
    detail: "Overview; symptoms; functional effects. Source reviewed December 2022. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/osteoporosis",
    lastRetrieved: "2026-09-17"
)

private let depth8_bone_care = CitationSource(
    id: "depth8_bone_care",
    shortName: "Osteoporosis: Diagnosis, Treatment, & Steps to Take",
    detail: "Assessment; daily support; individualized follow-up; medication regimens excluded. Source reviewed December 2022. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/osteoporosis/diagnosis-treatment-and-steps-to-take",
    lastRetrieved: "2026-09-17"
)

private let depth8_oa_overview = CitationSource(
    id: "depth8_oa_overview",
    shortName: "Osteoarthritis: Overview, Symptoms, & Causes",
    detail: "Overview; symptoms; functional effects. Source reviewed September 2023. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/osteoarthritis",
    lastRetrieved: "2026-09-17"
)

private let depth8_oa_care = CitationSource(
    id: "depth8_oa_care",
    shortName: "Osteoarthritis: Diagnosis, Treatment, & Steps to Take",
    detail: "Assessment; daily support; individualized follow-up; medication regimens excluded. Source reviewed September 2023. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/osteoarthritis/diagnosis-treatment-and-steps-to-take",
    lastRetrieved: "2026-09-17"
)

private let depth8_gout_overview = CitationSource(
    id: "depth8_gout_overview",
    shortName: "Gout: Overview, Symptoms, & Causes",
    detail: "Overview; symptoms; functional effects. Source reviewed December 2023. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/gout",
    lastRetrieved: "2026-09-17"
)

private let depth8_gout_care = CitationSource(
    id: "depth8_gout_care",
    shortName: "Gout: Diagnosis, Treatment, & Steps to Take",
    detail: "Assessment; daily support; individualized follow-up; medication regimens excluded. Source reviewed December 2023. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/gout/diagnosis-treatment-and-steps-to-take",
    lastRetrieved: "2026-09-17"
)

private let depth8_scl_overview = CitationSource(
    id: "depth8_scl_overview",
    shortName: "Scleroderma: Overview, Symptoms, & Causes",
    detail: "Overview; symptoms; functional effects. Source reviewed September 2023. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/scleroderma",
    lastRetrieved: "2026-09-17"
)

private let depth8_scl_care = CitationSource(
    id: "depth8_scl_care",
    shortName: "Scleroderma: Diagnosis, Treatment, & Steps to Take",
    detail: "Assessment; daily support; individualized follow-up; medication regimens excluded. Source reviewed September 2023. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded.",
    publisher: "National Institute of Arthritis and Musculoskeletal and Skin Diseases; National Institutes of Health",
    license: .publicDomain,
    url: "https://www.niams.nih.gov/health-topics/scleroderma/diagnosis-treatment-and-steps-to-take",
    lastRetrieved: "2026-09-17"
)

public enum OsteoporosisDailyPreventionSample {
    public static let entry = ReferenceEntry(
        id: "osteoporosis-daily-fracture-prevention",
        title: "Osteoporosis: daily fracture prevention",
        subtitle: "Adult mobility, home safety and ongoing bone care",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility),
        sections: [
            .bullets(title: "Recognize the silent risk", [
                AttributedBullet("Osteoporosis may have no symptoms before a fracture. Hip, spine and wrist fractures are common consequences of reduced bone strength.", citationIDs: ["depth8_bone_overview"]),
                AttributedBullet("Fragile bones can fracture after a minor fall or ordinary stresses. Severe back pain, height loss or a newly stooped posture can accompany vertebral fracture.", citationIDs: ["depth8_bone_overview"])
            ]),
            .bullets(title: "Prepare the assessment history", [
                AttributedBullet("Share previous fractures, family history, medicines and illnesses that affect bone health. These details help clinicians assess ongoing risk.", citationIDs: ["depth8_bone_care"]),
                AttributedBullet("Assessment can include height, posture, strength, gait and balance. Bone-density testing can support diagnosis and treatment monitoring.", citationIDs: ["depth8_bone_care"])
            ]),
            .bullets(title: "Support food and medicine continuity", [
                AttributedBullet("Adequate calcium, vitamin D and protein support bone health; poor intake and excessive dieting can increase risk.", citationIDs: ["depth8_bone_overview"]),
                AttributedBullet("Prescribed osteoporosis medicines can help prevent fractures. Nutrition, activity and avoiding smoking remain parts of ongoing care.", citationIDs: ["depth8_bone_overview"])
            ]),
            .bullets(title: "Make movement appropriate", [
                AttributedBullet("An individualized exercise plan can support strength and reduce falls. Discuss safe activity with the clinician or physical therapist.", citationIDs: ["depth8_bone_care"]),
                AttributedBullet("Physical and occupational therapists can help with function and daily tasks. The plan should reflect existing fractures and physical limitations.", citationIDs: ["depth8_bone_care"])
            ]),
            .bullets(title: "Reduce hazards at home", [
                AttributedBullet("Clear cords and clutter, secure loose rugs and improve lighting. Handrails and bathroom grab bars can make movement safer.", citationIDs: ["depth8_bone_care"]),
                AttributedBullet("Keep a phone or emergency-call device accessible. A plan for obtaining help after a fall supports safety at home.", citationIDs: ["depth8_bone_care"])
            ]),
            .bullets(title: "Review changing fall risk", [
                AttributedBullet("Discuss falls, balance problems, vision changes and medicine effects with the care team. These factors can increase fracture risk.", citationIDs: ["depth8_bone_care"]),
                AttributedBullet("Learning about treatment and involving family or support groups can help people participate in ongoing osteoporosis care.", citationIDs: ["depth8_bone_care"])
            ])
        ],
        citations: [depth8_bone_overview, depth8_bone_care],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum OsteoarthritisDailyFunctionSample {
    public static let entry = ReferenceEntry(
        id: "osteoarthritis-daily-function-support",
        title: "Osteoarthritis: daily function",
        subtitle: "Adult movement, task adaptation and symptom follow-up",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility),
        sections: [
            .bullets(title: "Describe functional impact", [
                AttributedBullet("Osteoarthritis affects more than cartilage and can cause pain, swelling and restricted movement. Symptoms and disability differ between people.", citationIDs: ["depth8_oa_overview"]),
                AttributedBullet("Ask how symptoms affect stairs, chair or toilet transfers, walking and gripping objects. These concrete limitations help describe daily burden.", citationIDs: ["depth8_oa_overview"])
            ]),
            .bullets(title: "Include sleep and symptom changes", [
                AttributedBullet("Pain often increases with joint use; advanced disease can also disturb sleep. Short stiffness after inactivity is common.", citationIDs: ["depth8_oa_overview"]),
                AttributedBullet("Fatigue, poor sleep and low mood can accompany the symptom burden. They belong in the discussion of function and quality of life.", citationIDs: ["depth8_oa_overview"])
            ]),
            .bullets(title: "Prepare for clinical reassessment", [
                AttributedBullet("History and examination guide evaluation. Blood tests or joint-fluid testing may investigate other causes, including infection or gout.", citationIDs: ["depth8_oa_care"]),
                AttributedBullet("Early damage may not appear on x-rays. Locking or giving way can prompt additional evaluation rather than assumptions based on prior imaging.", citationIDs: ["depth8_oa_care"])
            ]),
            .bullets(title: "Build tolerable activity", [
                AttributedBullet("Start activity gradually with professional guidance. A balanced plan may include range of motion, strengthening, balance and low-impact exercise.", citationIDs: ["depth8_oa_care"]),
                AttributedBullet("Water exercise can reduce joint loading. Weight management, when appropriate, may also reduce stress on weight-bearing joints.", citationIDs: ["depth8_oa_care"])
            ]),
            .bullets(title: "Adapt daily tasks", [
                AttributedBullet("A cane, walker or gripping aid may improve function. Occupational therapy can help protect joints and conserve energy.", citationIDs: ["depth8_oa_care"]),
                AttributedBullet("Prescribed braces should be fitted by a professional. Reducing repetitive bending and choosing appropriate supports may ease daily tasks.", citationIDs: ["depth8_oa_care"])
            ]),
            .bullets(title: "Keep goals and support visible", [
                AttributedBullet("Follow-up provides a chance to review symptoms and treatment response. Care goals include pain relief, function and participation in daily life.", citationIDs: ["depth8_oa_care"]),
                AttributedBullet("Education classes and support groups may help with coping. Nurse educators and rehabilitation professionals can support understanding and practical self-management.", citationIDs: ["depth8_oa_care"])
            ])
        ],
        citations: [depth8_oa_overview, depth8_oa_care],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum GoutDailyCareFollowUpSample {
    public static let entry = ReferenceEntry(
        id: "gout-daily-care-follow-up",
        title: "Gout: daily care & follow-up",
        subtitle: "Adult flare burden, food choices and treatment continuity",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        sections: [
            .bullets(title: "Describe the flare pattern", [
                AttributedBullet("Gout can cause sudden severe joint pain, warmth and swelling, often at night. It can affect joints beyond the big toe.", citationIDs: ["depth8_gout_overview"]),
                AttributedBullet("Flares may be separated by symptom-free intervals. Increasing flare frequency or persistent lumps called tophi can indicate a growing disease burden.", citationIDs: ["depth8_gout_overview"])
            ]),
            .bullets(title: "Keep diagnosis in context", [
                AttributedBullet("High blood urate does not mean everyone will develop gout. Urate buildup and the clinical pattern are distinct parts of the disease picture.", citationIDs: ["depth8_gout_overview"]),
                AttributedBullet("Other conditions can resemble gout. A new or different painful swollen joint needs clinical assessment rather than automatic attribution to a previous diagnosis.", citationIDs: ["depth8_gout_care"])
            ]),
            .bullets(title: "Support comfort during a flare", [
                AttributedBullet("Resting the affected joint and elevating the limb may help reduce flare-related symptoms.", citationIDs: ["depth8_gout_care"]),
                AttributedBullet("Flare treatment and treatment of the underlying urate burden serve different goals; the clinician individualizes the plan.", citationIDs: ["depth8_gout_care"])
            ]),
            .bullets(title: "Discuss realistic food changes", [
                AttributedBullet("Review alcohol, sugar-sweetened drinks and purine-rich animal foods with the care team when planning dietary changes.", citationIDs: ["depth8_gout_care"]),
                AttributedBullet("Weight management when appropriate and a balanced eating pattern can support broader health as well as gout care.", citationIDs: ["depth8_gout_care"])
            ]),
            .bullets(title: "Support treatment continuity", [
                AttributedBullet("Diet changes alone are insufficient for frequent flares or tophi. Regular use of prescribed urate-lowering medicine is central to prevention.", citationIDs: ["depth8_gout_care"]),
                AttributedBullet("A pharmacist or nurse educator can help clarify the treatment plan; discuss proposed medication changes with the clinician.", citationIDs: ["depth8_gout_care"])
            ]),
            .bullets(title: "Include associated health needs", [
                AttributedBullet("Kidney disease, kidney stones, hypertension and cardiovascular disease are important associated conditions. Follow-up should account for these alongside joint symptoms.", citationIDs: ["depth8_gout_overview"]),
                AttributedBullet("Diuretics and certain other medicines can increase gout risk. A medication history helps clinicians interpret the overall pattern.", citationIDs: ["depth8_gout_overview"])
            ])
        ],
        citations: [depth8_gout_overview, depth8_gout_care],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum SclerodermaDailySupportSample {
    public static let entry = ReferenceEntry(
        id: "scleroderma-daily-system-support",
        title: "Scleroderma: daily support",
        subtitle: "Adult skin, oral care, function and organ follow-up",
        eyebrow: "REFERENCE · DAILY CARE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .cellularRegulation),
        sections: [
            .bullets(title: "Clarify the disease type", [
                AttributedBullet("Localized scleroderma mainly affects skin and underlying tissues. Systemic sclerosis can involve blood vessels and internal organs, so follow-up needs differ.", citationIDs: ["depth8_scl_overview"]),
                AttributedBullet("Systemic disease may involve the lungs, heart, kidneys or digestive tract. Skin changes alone do not describe the full scope of care.", citationIDs: ["depth8_scl_overview"])
            ]),
            .bullets(title: "Maintain skin comfort and warmth", [
                AttributedBullet("Layers, gloves and avoiding cold or wet environments may reduce Raynaud-related symptoms. Moisturizers can help with skin stiffness.", citationIDs: ["depth8_scl_care"]),
                AttributedBullet("Avoid very hot washing and harsh cleaning products; protect skin during household cleaning. Smoking can worsen vascular symptoms.", citationIDs: ["depth8_scl_care"])
            ]),
            .bullets(title: "Support mouth and hand care", [
                AttributedBullet("Dry mouth and a narrowed mouth opening can complicate hygiene. Regular dental care and adapted brushing or flossing tools may help.", citationIDs: ["depth8_scl_care"]),
                AttributedBullet("Mouth pain, sores or loose teeth warrant prompt dental contact. Discuss ways to manage dry mouth with dental and medical clinicians.", citationIDs: ["depth8_scl_care"])
            ]),
            .bullets(title: "Address eating and daily tasks", [
                AttributedBullet("Small, frequent meals may help digestive symptoms. Swallowing difficulty or poor nutrient absorption requires an individualized diet assessment.", citationIDs: ["depth8_scl_care"]),
                AttributedBullet("Physical and occupational therapy can support mobility and daily activities, including hand and jaw function.", citationIDs: ["depth8_scl_care"])
            ]),
            .bullets(title: "Recognize organ-related changes", [
                AttributedBullet("Report new breathlessness, dry cough, unusual fatigue or swollen feet. Lung testing can detect problems before symptoms become obvious.", citationIDs: ["depth8_scl_care"]),
                AttributedBullet("Follow the blood-pressure monitoring plan. A reading higher than usual or new headache or breathlessness needs prompt clinician contact because renal crisis can be serious.", citationIDs: ["depth8_scl_care"])
            ]),
            .bullets(title: "Keep long-term support coordinated", [
                AttributedBullet("Treatment aims to limit progression and relieve symptoms. Ongoing monitoring matters even when the visible skin findings are stable.", citationIDs: ["depth8_scl_overview"]),
                AttributedBullet("The range of possible organ involvement makes a shared account of current symptoms and affected systems useful across follow-up care.", citationIDs: ["depth8_scl_overview"])
            ])
        ],
        citations: [depth8_scl_overview, depth8_scl_care],
        lastSourceFidelityReview: "2026-09-17"
    )
}
