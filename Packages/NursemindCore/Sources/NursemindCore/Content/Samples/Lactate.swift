import Foundation

public enum LactateSample {
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
        let sep1 = CitationSource(
            id: "cms_sep1_2024",
            shortName: "CMS SEP-1 (Severe Sepsis and Septic Shock Bundle)",
            detail: "Lactate ≥2 elevated; ≥4 critical, indicates septic shock with hypotension despite fluid resuscitation",
            publisher: "Centers for Medicare & Medicaid Services",
            license: .publicDomain,
            url: "https://www.cms.gov/medicare/quality/measures/inpatient-hospital",
            lastRetrieved: "2026-05-03"
        )
        let ssc = CitationSource(
            id: "ssc_2021_pmc",
            shortName: "Surviving Sepsis Campaign 2021 (PMC OA)",
            detail: "Evans L, et al. Crit Care Med 2021. Lactate-guided resuscitation in adult sepsis",
            publisher: "Society of Critical Care Medicine",
            license: .ccBy4,
            url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8486643/",
            lastRetrieved: "2026-05-03"
        )

        return LabEntry(
            id: "lactate",
            title: "Lactate",
            subtitle: "Serum / plasma · metabolic",
            specimen: "Serum or plasma (gray-top tube preferred for stability)",
            nclexTags: NCLEXTags(
                category: .physiologicalIntegrity,
                subcategory: .reductionOfRiskPotential,
                priorityConcept: .perfusion
            ),
            referenceRanges: [
                ReferenceRangeRow(value: "< 2.0 mmol/L",   label: "Normal",   citationIDs: ["openrn_lab_ranges", "openstax_clinical_lab_values"]),
                ReferenceRangeRow(value: "2.0 – 4.0 mmol/L", label: "Elevated", citationIDs: ["cms_sep1_2024"]),
                ReferenceRangeRow(value: "> 4.0 mmol/L",   label: "Critical", citationIDs: ["cms_sep1_2024", "ssc_2021_pmc"])
            ],
            interpretationTiers: [
                InterpretationTier(
                    severity: .normal,
                    label: "Normal (< 2.0)",
                    summary: "Adequate tissue perfusion and oxygenation.",
                    nursingActions: [],
                    citationIDs: ["openrn_lab_ranges"]
                ),
                InterpretationTier(
                    severity: .high,
                    label: "Elevated (2.0–4.0)",
                    summary: "May reflect early tissue hypoperfusion, sepsis, hypoxia, or recent strenuous activity. Trend matters more than single value.",
                    nursingActions: [
                        "Reassess perfusion: MAP, mental status, capillary refill, urine output",
                        "Confirm IV access and patency",
                        "Anticipate repeat lactate in 2–4 hours per facility sepsis protocol",
                        "Notify provider; consider sepsis screen if not already done"
                    ],
                    citationIDs: ["cms_sep1_2024", "ssc_2021_pmc"]
                ),
                InterpretationTier(
                    severity: .critical,
                    label: "Critical (> 4.0)",
                    summary: "Reflects significant tissue hypoperfusion. Per Surviving Sepsis Campaign, lactate > 4 with infection plus hypotension despite fluid resuscitation defines septic shock.",
                    nursingActions: [
                        "Notify provider immediately",
                        "Reassess perfusion (MAP, mental status, capillary refill, urine output)",
                        "Confirm IV access — ideally two large-bore PIVs or central line",
                        "Anticipate fluid resuscitation (30 mL/kg crystalloid in first 3 hours per Surviving Sepsis)",
                        "Anticipate vasopressor initiation if MAP doesn't respond to fluids",
                        "Repeat lactate in 2–4 hours to trend response"
                    ],
                    citationIDs: ["ssc_2021_pmc", "cms_sep1_2024"]
                )
            ],
            commonCauses: [
                CauseGroup(
                    title: "Type A — hypoxic / hypoperfusion",
                    causes: [
                        "Sepsis / septic shock",
                        "Cardiogenic shock",
                        "Hypovolemic shock",
                        "Severe anemia or hypoxemia",
                        "Cardiac arrest"
                    ],
                    citationIDs: ["openrn_lab_ranges", "ssc_2021_pmc"]
                ),
                CauseGroup(
                    title: "Type B — non-hypoxic",
                    causes: [
                        "Liver failure",
                        "Metformin or isoniazid toxicity",
                        "DKA",
                        "Malignancy",
                        "Beta-2 agonist excess (e.g., albuterol)"
                    ],
                    citationIDs: ["openrn_lab_ranges"]
                )
            ],
            nursingActions: [
                AttributedBullet("Verify specimen handling — lactate continues to be produced in vitro; transport on ice if delayed.", citationIDs: ["openrn_lab_ranges"]),
                AttributedBullet("Avoid prolonged tourniquet time during draw — local ischemia falsely elevates lactate.", citationIDs: ["openrn_lab_ranges"]),
                AttributedBullet("Trend the value over hours, not single readings — lactate clearance is the perfusion signal.", citationIDs: ["ssc_2021_pmc"])
            ],
            watchFor: nil,
            citations: [openrn, openstax, sep1, ssc],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
