import Foundation

public enum TroponinSample {
    public static let entry: LabEntry = {
        let openrn = CitationSource(
            id: "openrn_lab_ranges",
            shortName: "Open RN Nursing Fundamentals — Reference Ranges Appendix",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK613071/",
            lastRetrieved: "2026-05-03"
        )
        let openstax = CitationSource(
            id: "openstax_clinical_lab_values",
            shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values appendix",
            publisher: "OpenStax · Rice University",
            license: .ccBy4WithAIRestriction,
            url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
            lastRetrieved: "2026-05-03"
        )
        let universalDef = CitationSource(
            id: "fourth_universal_mi_pmc",
            shortName: "Fourth Universal Definition of Myocardial Infarction (PMC OA)",
            detail: "Thygesen K, et al. 2018. Defines MI by troponin rise/fall + ischemic context",
            publisher: "ESC/ACC/AHA/WHF",
            license: .ccBy4,
            url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6188187/",
            lastRetrieved: "2026-05-03"
        )
        let openrnMedSurg = CitationSource(
            id: "openrn_medsurg_cardiac",
            shortName: "Open RN Health Alterations — Cardiac chapter",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )

        return LabEntry(
            id: "troponin",
            title: "Troponin (high-sensitivity)",
            subtitle: "Serum · cardiac biomarker",
            specimen: "Serum or plasma; serial draws (0, 1, 3, or 6 hr per facility protocol)",
            nclexTags: NCLEXTags(
                category: .physiologicalIntegrity,
                subcategory: .physiologicalAdaptation,
                priorityConcept: .perfusion
            ),
            referenceRanges: [
                ReferenceRangeRow(value: "< 14 ng/L (high-sensitivity)", label: "Normal (assay-dependent)", citationIDs: ["openrn_lab_ranges"]),
                ReferenceRangeRow(value: "Above 99th percentile of upper reference limit", label: "Elevated", citationIDs: ["fourth_universal_mi_pmc"]),
                ReferenceRangeRow(value: "Rise/fall pattern with ischemic context", label: "Suggests acute MI", citationIDs: ["fourth_universal_mi_pmc"])
            ],
            interpretationTiers: [
                InterpretationTier(
                    severity: .high,
                    label: "Elevated above upper reference limit",
                    summary: "Indicates myocardial injury. The Fourth Universal Definition of MI requires a rise/fall pattern PLUS at least one ischemic feature (symptoms, EKG changes, imaging) for an MI diagnosis.",
                    nursingActions: [
                        "12-lead EKG immediately if not already done; compare to prior",
                        "Obtain serial troponins per facility protocol (rise/fall is diagnostic)",
                        "Continuous cardiac monitoring",
                        "Assess for chest pain, dyspnea, diaphoresis, nausea — and atypical presentations in women, older adults, diabetics",
                        "Notify provider; anticipate cardiology consult",
                        "Anticipate aspirin, anticoagulation, possible PCI per protocol"
                    ],
                    citationIDs: ["fourth_universal_mi_pmc", "openrn_medsurg_cardiac"]
                )
            ],
            commonCauses: [
                CauseGroup(
                    title: "Acute coronary syndrome",
                    causes: [
                        "STEMI — ST-elevation MI",
                        "NSTEMI — non-ST-elevation MI",
                        "Unstable angina (typically without troponin rise)"
                    ],
                    citationIDs: ["fourth_universal_mi_pmc"]
                ),
                CauseGroup(
                    title: "Non-ACS troponin elevation",
                    causes: [
                        "Heart failure exacerbation",
                        "Pulmonary embolism",
                        "Sepsis with myocardial strain",
                        "Renal failure (delayed clearance — chronic baseline elevation)",
                        "Myocarditis / pericarditis",
                        "Tachyarrhythmias (SVT, AFib with RVR)",
                        "Cardiac contusion (trauma)"
                    ],
                    citationIDs: ["openrn_medsurg_cardiac"]
                )
            ],
            nursingActions: [
                AttributedBullet("Rise/fall pattern is the key signal — single elevated troponins without context don't equal MI.", citationIDs: ["fourth_universal_mi_pmc"]),
                AttributedBullet("Always pair with a 12-lead EKG and symptom assessment.", citationIDs: ["openrn_medsurg_cardiac"]),
                AttributedBullet("In ESRD, baseline troponin is often elevated; trend is more diagnostic than absolute value.", citationIDs: ["openrn_medsurg_cardiac"])
            ],
            watchFor: [
                AttributedBullet("Atypical MI presentations: women, older adults, diabetic patients, post-op patients may present with fatigue, dyspnea, or epigastric pain rather than chest pain.", citationIDs: ["openrn_medsurg_cardiac"])
            ],
            citations: [openrn, openstax, universalDef, openrnMedSurg],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
