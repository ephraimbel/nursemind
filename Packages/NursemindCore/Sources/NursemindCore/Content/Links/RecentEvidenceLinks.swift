import Foundation

extension EntryLinkRegistry {
    static func recentEvidenceDraftLinks() -> [EntryLink] {
#if DEBUG && RECENT_EVIDENCE_REVIEW
        return [
            .init(from: "diagnosis:alzheimer-dementia", to: "drug:donanemab", relation: .seeAlso),
            .init(from: "diagnosis:alzheimer-dementia", to: "lab:plasma-p-tau217-amyloid-ratio", relation: .seeAlso),
            .init(from: "diagnosis:bronchiectasis", to: "drug:brensocatib", relation: .seeAlso),
            .init(from: "diagnosis:ckd", to: "reference:diabetic-kidney-combination-evidence", relation: .seeAlso),
            .init(from: "diagnosis:heart-failure", to: "reference:oral-semaglutide-cardiovascular-evidence", relation: .seeAlso),
            .init(from: "diagnosis:ipf", to: "drug:nerandomilast", relation: .seeAlso),
            .init(from: "diagnosis:postpartum-depression", to: "drug:zuranolone", relation: .seeAlso),
            .init(from: "diagnosis:uti", to: "drug:gepotidacin", relation: .seeAlso),
            .init(from: "drug:acetaminophen", to: "drug:suzetrigine", relation: .seeAlso),
            .init(from: "drug:brensocatib", to: "procedure:airway-clearance-therapy", relation: .seeAlso),
            .init(from: "drug:donanemab", to: "lab:plasma-p-tau217-amyloid-ratio", relation: .seeAlso),
            .init(from: "drug:empagliflozin", to: "reference:diabetic-kidney-combination-evidence", relation: .seeAlso),
            .init(from: "drug:finerenone", to: "reference:diabetic-kidney-combination-evidence", relation: .seeAlso),
            .init(from: "drug:gepotidacin", to: "drug:nitrofurantoin", relation: .seeAlso),
            .init(from: "drug:lenacapavir", to: "reference:lenacapavir-hiv-prevention-evidence", relation: .seeAlso),
            .init(from: "drug:nerandomilast", to: "drug:nintedanib", relation: .seeAlso),
            .init(from: "drug:nerandomilast", to: "drug:pirfenidone", relation: .seeAlso),
            .init(from: "drug:semaglutide", to: "reference:obesity-medication-comparison-evidence", relation: .seeAlso),
            .init(from: "drug:semaglutide", to: "reference:oral-semaglutide-cardiovascular-evidence", relation: .seeAlso),
            .init(from: "drug:sertraline", to: "drug:zuranolone", relation: .seeAlso),
            .init(from: "drug:suzetrigine", to: "reference:pain-scales", relation: .seeAlso),
            .init(from: "drug:tenofovir", to: "reference:lenacapavir-hiv-prevention-evidence", relation: .seeAlso),
            .init(from: "drug:tirzepatide", to: "reference:obesity-medication-comparison-evidence", relation: .seeAlso),
            .init(from: "lab:hba1c", to: "reference:blood-pressure-diabetes-evidence", relation: .seeAlso),
            .init(from: "lab:hba1c", to: "reference:oral-semaglutide-cardiovascular-evidence", relation: .seeAlso),
            .init(from: "lab:potassium", to: "reference:blood-pressure-diabetes-evidence", relation: .seeAlso),
            .init(from: "lab:self-collected-vaginal-hpv-testing", to: "reference:cervical-cancer-screening", relation: .seeAlso),
            .init(from: "lab:self-collected-vaginal-hpv-testing", to: "reference:test-guide-human-papillomavirus-hpv-test", relation: .seeAlso),
            .init(from: "lab:urine-protein-creatinine", to: "reference:diabetic-kidney-combination-evidence", relation: .seeAlso),
            .init(from: "reference:adult-immunization-schedule", to: "reference:rsv-adult-vaccination-evidence", relation: .seeAlso),
            .init(from: "reference:blood-pressure-diabetes-evidence", to: "reference:home-blood-pressure-measurement", relation: .seeAlso),
            .init(from: "reference:obesity-medication-comparison-evidence", to: "reference:test-guide-obesity-screening", relation: .seeAlso),
            .init(from: "reference:rsv-adult-vaccination-evidence", to: "reference:test-guide-respiratory-syncytial-virus-rsv-tests", relation: .seeAlso)
        ]
#else
        return []
#endif
    }
}
