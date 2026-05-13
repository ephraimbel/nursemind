import Foundation

public enum LisinoprilSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_lisinopril",
            shortName: "FDA SPL — Lisinopril",
            detail: "ACE inhibitor labeling",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_ace",
            shortName: "Open RN Nursing Pharmacology — Cardiovascular: ACE inhibitors",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "lisinopril",
            title: "Lisinopril",
            subtitle: "Prinivil · Zestril · ACE inhibitor",
            category: "ACE Inhibitor",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "ACE inhibitor"),
                KeyValueRow(key: "Onset", value: "1 hr"),
                KeyValueRow(key: "Half-life", value: "12 hr"),
                KeyValueRow(key: "Hallmark side effect", value: "Dry, persistent cough")
            ],
            indications: AttributedProse(
                "Hypertension, heart failure (adjunct), and reduction of cardiovascular events post-MI. Lowers blood pressure and reduces risk of strokes and myocardial infarctions.",
                citationIDs: ["openfda_lisinopril"]
            ),
            mechanism: AttributedProse(
                "ACE inhibitor — decreases plasma angiotensin II and aldosterone secretion, reducing vasoconstriction and sodium/water retention.",
                citationIDs: ["openfda_lisinopril"]
            ),
            dosing: [
                DosingBlock(label: "Initial", body: "5 mg daily (with concurrent diuretic) or 10 mg daily as monotherapy.", citationIDs: ["openfda_lisinopril"]),
                DosingBlock(label: "Maintenance", body: "Range 10–80 mg daily; titrate based on BP response.", citationIDs: ["openfda_lisinopril"]),
                DosingBlock(label: "Maximum", body: "80 mg daily.", citationIDs: ["openfda_lisinopril"])
            ],
            contraindications: AttributedProse(
                "Hypersensitivity to lisinopril or other ACE inhibitors. History of ACE-inhibitor-related angioedema. Hereditary or idiopathic angioedema. Concurrent neprilysin inhibitor (sacubitril) use. Aliskiren in patients with diabetes.",
                citationIDs: ["openfda_lisinopril"]
            ),
            warnings: [
                AttributedBullet("Boxed warning: fetal toxicity — discontinue when pregnancy is detected. Risk of injury and death to the developing fetus, especially second/third trimester.", citationIDs: ["openfda_lisinopril"]),
                AttributedBullet("Angioedema (face, lips, tongue, larynx, intestines) — higher incidence in Black patients. Discontinue immediately if it occurs.", citationIDs: ["openfda_lisinopril"]),
                AttributedBullet("Excessive hypotension and syncope, especially in volume-depleted patients.", citationIDs: ["openfda_lisinopril"]),
                AttributedBullet("Hyperkalemia — especially in renal impairment, diabetes, or with concurrent K-sparing diuretics or potassium supplements.", citationIDs: ["openfda_lisinopril"]),
                AttributedBullet("Acute kidney injury risk in renal artery stenosis or with NSAID concurrency.", citationIDs: ["openfda_lisinopril"])
            ],
            adverseReactions: AttributedProse(
                "Most common: dizziness (~7%), headache (~5%), persistent dry cough (~4%), fatigue, orthostatic effects, hyperkalemia.",
                citationIDs: ["openfda_lisinopril"]
            ),
            drugInteractions: [
                AttributedBullet("NSAIDs (incl. COX-2) — deteriorate renal function and reduce antihypertensive effect.", citationIDs: ["openfda_lisinopril"]),
                AttributedBullet("Dual RAS blockade (ARBs, direct renin inhibitors) — increased hyperkalemia and AKI risk; generally avoid.", citationIDs: ["openfda_lisinopril"]),
                AttributedBullet("Potassium-sparing diuretics, potassium supplements — significant serum potassium elevation.", citationIDs: ["openfda_lisinopril"]),
                AttributedBullet("Lithium — increased lithium levels and toxicity risk; monitor.", citationIDs: ["openfda_lisinopril"])
            ],
            nursingImplications: [
                AttributedBullet("Check BP before each dose; hold and notify provider if SBP <90 (or per parameter).", citationIDs: ["openrn_pharm_ace"]),
                AttributedBullet("Monitor potassium at baseline and periodically — especially in renal impairment, diabetes, or K-supplementation.", citationIDs: ["openrn_pharm_ace"]),
                AttributedBullet("Monitor BUN and creatinine — first-dose AKI is a known risk in volume depletion.", citationIDs: ["openrn_pharm_ace"]),
                AttributedBullet("Assess for angioedema with each dose, especially first dose — face/lip/tongue swelling, throat tightness, dyspnea. Discontinue immediately if present.", citationIDs: ["openrn_pharm_ace", "openfda_lisinopril"]),
                AttributedBullet("First-dose hypotension — give first dose at bedtime when possible; ensure patient is volume-replete.", citationIDs: ["openrn_pharm_ace"]),
                AttributedBullet("Counsel about persistent dry cough — common, may require ARB substitution if intolerable.", citationIDs: ["openrn_pharm_ace"])
            ],
            patientTeaching: AttributedProse(
                "Take at the same time each day. Rise slowly to avoid dizziness. Avoid potassium salt substitutes and high-K supplements. Report swelling of face/lips/tongue, persistent cough, dizziness on standing, signs of pregnancy. Avoid NSAIDs without provider guidance.",
                citationIDs: ["openrn_pharm_ace", "openfda_lisinopril"]
            ),
            citations: [openfda, openrn],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
