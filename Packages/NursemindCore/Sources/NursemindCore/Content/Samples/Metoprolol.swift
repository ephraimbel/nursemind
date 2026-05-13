import Foundation

public enum MetoprololSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_metoprolol",
            shortName: "FDA SPL — Metoprolol Tartrate",
            detail: "SET ID: 00de1f16-f979-4dbf-aa60-246ffac8d410",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_betablockers",
            shortName: "Open RN Nursing Pharmacology — Cardiovascular: Beta Blockers",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "metoprolol",
            title: "Metoprolol",
            subtitle: "Lopressor · Toprol-XL · cardioselective beta-blocker",
            category: "Beta-blocker",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Selective β₁-adrenergic antagonist"),
                KeyValueRow(key: "Onset", value: "1–2 hr (PO); 5 min (IV)"),
                KeyValueRow(key: "Half-life", value: "3–7 hr (tartrate)"),
                KeyValueRow(key: "Hold parameters", value: "HR <60, SBP <100 (per provider)")
            ],
            indications: AttributedProse(
                "Treatment of hypertension, angina pectoris, and myocardial infarction. Lowering blood pressure reduces the risk of fatal and non-fatal cardiovascular events.",
                citationIDs: ["openfda_metoprolol"]
            ),
            mechanism: AttributedProse(
                "Selective beta-1-adrenergic receptor blocking agent — reduces heart rate, contractility, and blood pressure.",
                citationIDs: ["openfda_metoprolol"]
            ),
            dosing: [
                DosingBlock(label: "Hypertension", body: "Initial 100 mg daily; effective range 100–450 mg/day.", citationIDs: ["openfda_metoprolol"]),
                DosingBlock(label: "Angina", body: "Initial 100 mg daily in two divided doses; range 100–400 mg/day.", citationIDs: ["openfda_metoprolol"]),
                DosingBlock(label: "MI", body: "50 mg every 6 hours for 48 hours (if tolerated); titrate to 100 mg twice daily. Take with or after meals.", citationIDs: ["openfda_metoprolol"])
            ],
            contraindications: AttributedProse(
                "Severe bradycardia, second/third-degree heart block, cardiogenic shock, systolic BP <100, decompensated heart failure, sick sinus syndrome (without pacemaker), hypersensitivity to product components.",
                citationIDs: ["openfda_metoprolol"]
            ),
            warnings: [
                AttributedBullet("Abrupt cessation may exacerbate myocardial ischemia — taper, do not stop suddenly.", citationIDs: ["openfda_metoprolol"]),
                AttributedBullet("Worsening heart failure possible during titration — monitor for dyspnea, edema, weight gain.", citationIDs: ["openfda_metoprolol"]),
                AttributedBullet("Bronchospastic disease — use lowest possible dose; selective β₁-blockade is dose-dependent.", citationIDs: ["openfda_metoprolol"]),
                AttributedBullet("Pheochromocytoma — use only after alpha-blocker; otherwise unopposed alpha effect can cause severe HTN.", citationIDs: ["openfda_metoprolol"]),
                AttributedBullet("May mask hypoglycemia symptoms (tachycardia, tremor) in diabetics.", citationIDs: ["openfda_metoprolol"])
            ],
            adverseReactions: AttributedProse(
                "Most common: tiredness, dizziness, depression (~5%), shortness of breath, bradycardia, hypotension (~3%), diarrhea, pruritus or rash.",
                citationIDs: ["openfda_metoprolol"]
            ),
            drugInteractions: [
                AttributedBullet("CYP2D6 inhibitors (quinidine, fluoxetine, paroxetine) — double metoprolol concentration; increased β-blockade.", citationIDs: ["openfda_metoprolol"]),
                AttributedBullet("Catecholamine-depleting agents (reserpine, MAOIs) — additive hypotension and bradycardia.", citationIDs: ["openfda_metoprolol"]),
                AttributedBullet("Digoxin, diltiazem, verapamil, clonidine — increased bradycardia and AV block risk.", citationIDs: ["openfda_metoprolol"]),
                AttributedBullet("Epinephrine — patients may be unresponsive to usual doses for anaphylaxis.", citationIDs: ["openfda_metoprolol"])
            ],
            nursingImplications: [
                AttributedBullet("Check apical pulse for full minute before each dose; hold and notify provider if HR <60 (or per facility/provider parameter).", citationIDs: ["openrn_pharm_betablockers"]),
                AttributedBullet("Check BP before each dose; hold and notify provider if SBP <100 (or per parameter).", citationIDs: ["openrn_pharm_betablockers"]),
                AttributedBullet("Monitor for orthostatic hypotension — instruct patient to change positions slowly.", citationIDs: ["openrn_pharm_betablockers"]),
                AttributedBullet("Daily weights in heart failure patients; report >2 lb gain in 24 hours or 5 lb in a week.", citationIDs: ["openrn_pharm_betablockers"]),
                AttributedBullet("Monitor blood glucose more carefully in diabetics — beta-blockade masks adrenergic warning signs.", citationIDs: ["openrn_pharm_betablockers"]),
                AttributedBullet("Never stop abruptly — taper over 1–2 weeks to avoid rebound hypertension and angina.", citationIDs: ["openrn_pharm_betablockers", "openfda_metoprolol"])
            ],
            patientTeaching: AttributedProse(
                "Take with or after meals to maximize absorption. Do not stop suddenly. Rise slowly to avoid dizziness. Monitor pulse before doses if instructed. Report shortness of breath, swelling, weight gain, persistent dizziness, or very slow heart rate. Diabetics: check glucose more often.",
                citationIDs: ["openrn_pharm_betablockers", "openfda_metoprolol"]
            ),
            citations: [openfda, openrn],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
