import Foundation

public enum AlbuterolSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_albuterol",
            shortName: "FDA SPL — Albuterol Sulfate HFA",
            detail: "108 mcg per actuation (90 mcg base)",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_resp",
            shortName: "Open RN Nursing Pharmacology — Respiratory: Beta-2 Agonists",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "albuterol",
            title: "Albuterol",
            subtitle: "ProAir · Ventolin · Proventil · short-acting β₂-agonist",
            category: "Bronchodilator",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Selective β₂-adrenergic agonist (SABA)"),
                KeyValueRow(key: "Onset", value: "5–15 min (inhaled)"),
                KeyValueRow(key: "Duration", value: "4–6 hr"),
                KeyValueRow(key: "Per puff", value: "90 mcg base / actuation")
            ],
            indications: AttributedProse(
                "Treatment or prevention of bronchospasm in patients ≥4 years with reversible obstructive airway disease (asthma, COPD). Prevention of exercise-induced bronchospasm.",
                citationIDs: ["openfda_albuterol"]
            ),
            mechanism: AttributedProse(
                "Beta-2 adrenergic agonist — relaxes bronchial smooth muscle by stimulating β₂ receptors, increasing intracellular cyclic AMP and producing bronchodilation.",
                citationIDs: ["openfda_albuterol"]
            ),
            dosing: [
                DosingBlock(label: "Inhaler", body: "2 inhalations every 4–6 hours as needed. Some patients may tolerate 1 inhalation every 4 hours.", citationIDs: ["openfda_albuterol"]),
                DosingBlock(label: "Exercise-induced", body: "2 inhalations 15–30 minutes before exercise.", citationIDs: ["openfda_albuterol"]),
                DosingBlock(label: "Nebulizer (adult)", body: "2.5 mg (3 mL of 0.083% solution) via nebulizer every 6–8 hours, or as directed by provider.", citationIDs: ["openfda_albuterol"])
            ],
            contraindications: AttributedProse(
                "Hypersensitivity to albuterol or any ingredient of the formulation.",
                citationIDs: ["openfda_albuterol"]
            ),
            warnings: [
                AttributedBullet("Paradoxical bronchospasm — life-threatening; if it occurs, discontinue immediately and treat with alternative therapy.", citationIDs: ["openfda_albuterol"]),
                AttributedBullet("Increased need or decreased response indicates worsening asthma — reassess plan; albuterol is rescue, not maintenance.", citationIDs: ["openfda_albuterol"]),
                AttributedBullet("Cardiovascular effects — tachycardia, palpitations, hypertension; caution in coronary insufficiency or arrhythmias.", citationIDs: ["openfda_albuterol"]),
                AttributedBullet("Excessive use may be fatal — counsel patients on appropriate use.", citationIDs: ["openfda_albuterol"])
            ],
            adverseReactions: AttributedProse(
                "Most common: throat irritation, upper respiratory inflammation, viral infection, cough, musculoskeletal pain. Tremor, tachycardia, hypokalemia (with high doses), nervousness.",
                citationIDs: ["openfda_albuterol"]
            ),
            drugInteractions: [
                AttributedBullet("Beta-blockers — may block bronchodilatory effects and produce severe bronchospasm.", citationIDs: ["openfda_albuterol"]),
                AttributedBullet("Non-potassium-sparing diuretics — additive hypokalemia risk.", citationIDs: ["openfda_albuterol"]),
                AttributedBullet("MAOIs and tricyclic antidepressants — use with extreme caution; effects may be potentiated.", citationIDs: ["openfda_albuterol"])
            ],
            nursingImplications: [
                AttributedBullet("Assess lung sounds before and after administration; document response.", citationIDs: ["openrn_pharm_resp"]),
                AttributedBullet("Monitor heart rate and blood pressure — tachycardia is expected, palpitations should be reported.", citationIDs: ["openrn_pharm_resp"]),
                AttributedBullet("Check serum potassium with high-dose or frequent use — hypokalemia is a known effect.", citationIDs: ["openrn_pharm_resp"]),
                AttributedBullet("Increased frequency of rescue use signals worsening asthma — escalate care.", citationIDs: ["openrn_pharm_resp", "openfda_albuterol"]),
                AttributedBullet("Teach proper inhaler technique — shake, exhale fully, slow inhale while actuating, hold breath 10 seconds.", citationIDs: ["openrn_pharm_resp"]),
                AttributedBullet("If using inhaled corticosteroid, give albuterol first to open airways, wait ~5 minutes, then steroid.", citationIDs: ["openrn_pharm_resp"])
            ],
            patientTeaching: AttributedProse(
                "Use only as directed — overuse is dangerous. Shake the inhaler before use. Rinse mouth after dosing. If you need rescue inhaler more than 2 days/week, contact your provider — that signals poor asthma control. Carry your inhaler at all times. Keep a peak flow meter and asthma action plan.",
                citationIDs: ["openrn_pharm_resp", "openfda_albuterol"]
            ),
            citations: [openfda, openrn],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
