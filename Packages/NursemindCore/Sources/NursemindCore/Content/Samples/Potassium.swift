import Foundation

public enum PotassiumSample {
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
        let aha = CitationSource(
            id: "aha_acls_hyperkalemia",
            shortName: "AHA ACLS — Hyperkalemia management (paraphrased)",
            detail: "K+ ≥6.5 with EKG changes is an ACLS-level emergency",
            publisher: "American Heart Association",
            license: .factCitationOnly,
            url: "https://cpr.heart.org/en/resuscitation-science/cpr-and-ecc-guidelines",
            lastRetrieved: "2026-05-03"
        )
        let openrnMedSurg = CitationSource(
            id: "openrn_medsurg_electrolytes",
            shortName: "Open RN Health Alterations — Fluids & Electrolytes chapter",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK613071/",
            lastRetrieved: "2026-05-03"
        )

        return LabEntry(
            id: "potassium",
            title: "Potassium (K⁺)",
            subtitle: "Serum · electrolyte",
            specimen: "Serum (avoid hemolysis — falsely elevates result)",
            nclexTags: NCLEXTags(
                category: .physiologicalIntegrity,
                subcategory: .reductionOfRiskPotential,
                priorityConcept: .fluidElectrolytes
            ),
            referenceRanges: [
                ReferenceRangeRow(value: "3.5 – 5.0 mEq/L", label: "Normal",       citationIDs: ["openrn_lab_ranges", "openstax_clinical_lab_values"]),
                ReferenceRangeRow(value: "< 3.5 mEq/L",     label: "Hypokalemia",  citationIDs: ["openrn_lab_ranges"]),
                ReferenceRangeRow(value: "< 2.5 mEq/L",     label: "Critical low", citationIDs: ["openrn_medsurg_electrolytes"]),
                ReferenceRangeRow(value: "> 5.0 mEq/L",     label: "Hyperkalemia", citationIDs: ["openrn_lab_ranges"]),
                ReferenceRangeRow(value: "> 6.5 mEq/L",     label: "Critical high", citationIDs: ["aha_acls_hyperkalemia", "openrn_medsurg_electrolytes"])
            ],
            interpretationTiers: [
                InterpretationTier(
                    severity: .low,
                    label: "Hypokalemia (< 3.5)",
                    summary: "Risk of muscle weakness, cardiac arrhythmias (especially with concurrent digoxin), ileus, and respiratory muscle fatigue. EKG: flat T waves, prominent U waves, ST depression.",
                    nursingActions: [
                        "Place on continuous cardiac monitoring",
                        "Assess for muscle weakness, cramps, ileus",
                        "Review medications: diuretics, insulin, beta-2 agonists, corticosteroids",
                        "Anticipate K+ replacement (PO or IV) per protocol",
                        "IV K+ never as a push — typical max rate 10 mEq/hr peripheral, 20 mEq/hr central"
                    ],
                    citationIDs: ["openrn_medsurg_electrolytes"]
                ),
                InterpretationTier(
                    severity: .high,
                    label: "Hyperkalemia (> 5.0)",
                    summary: "Risk of life-threatening cardiac arrhythmias. EKG progression: peaked T waves → prolonged PR → wide QRS → sine wave → asystole.",
                    nursingActions: [
                        "Place on continuous cardiac monitoring; obtain stat 12-lead EKG",
                        "Notify provider; rule out hemolysis (recheck on a clean draw)",
                        "Anticipate calcium gluconate (cardiac membrane stabilization)",
                        "Anticipate insulin + dextrose, beta-2 agonist, sodium bicarbonate (intracellular shift)",
                        "Anticipate sodium polystyrene sulfonate, patiromer, or dialysis (excretion)"
                    ],
                    citationIDs: ["aha_acls_hyperkalemia", "openrn_medsurg_electrolytes"]
                ),
                InterpretationTier(
                    severity: .critical,
                    label: "Critical (> 6.5 with EKG changes)",
                    summary: "ACLS-level emergency — risk of cardiac arrest. Immediate intervention required.",
                    nursingActions: [
                        "Notify provider immediately and call rapid response if needed",
                        "Continuous cardiac monitoring",
                        "Calcium gluconate IV first per ACLS",
                        "Prepare for advanced airway, defibrillator at bedside"
                    ],
                    citationIDs: ["aha_acls_hyperkalemia"]
                )
            ],
            commonCauses: [
                CauseGroup(
                    title: "Causes of hypokalemia",
                    causes: [
                        "Diuretics (loop, thiazide)",
                        "GI losses — vomiting, diarrhea, NG suction",
                        "Insulin therapy (especially DKA treatment)",
                        "Beta-2 agonists (albuterol)",
                        "Cushing syndrome / corticosteroids",
                        "Inadequate dietary intake"
                    ],
                    citationIDs: ["openrn_medsurg_electrolytes"]
                ),
                CauseGroup(
                    title: "Causes of hyperkalemia",
                    causes: [
                        "Acute or chronic kidney disease",
                        "ACE inhibitors / ARBs / spironolactone",
                        "Crush injury, rhabdomyolysis, tumor lysis",
                        "Acidosis (intracellular K+ shifts out)",
                        "Adrenal insufficiency",
                        "Massive transfusion of stored blood"
                    ],
                    citationIDs: ["openrn_medsurg_electrolytes"]
                )
            ],
            nursingActions: [
                AttributedBullet("Check for hemolysis — pseudo-hyperkalemia is common; recheck if the result is unexpected.", citationIDs: ["openrn_lab_ranges"]),
                AttributedBullet("Trend the value alongside renal function (BUN, creatinine) and acid-base status.", citationIDs: ["openrn_medsurg_electrolytes"]),
                AttributedBullet("Hold potassium-sparing diuretics or K+ supplements per provider order if hyperkalemic.", citationIDs: ["openrn_medsurg_electrolytes"])
            ],
            watchFor: [
                AttributedBullet("Coexisting hypomagnesemia — corrects the magnesium first or potassium replacement won't hold.", citationIDs: ["openrn_medsurg_electrolytes"]),
                AttributedBullet("Digoxin — hypokalemia potentiates digoxin toxicity.", citationIDs: ["openrn_medsurg_electrolytes"])
            ],
            citations: [openrn, openstax, aha, openrnMedSurg],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
