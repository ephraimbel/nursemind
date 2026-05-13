import Foundation

public enum AmiodaroneSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_amiodarone",
            shortName: "FDA SPL — Amiodarone Hydrochloride (Pacerone)",
            detail: "SET ID: 02f4a736-63ed-4ad4-a1f1-b21a71e928bd",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_antiarrhythmics",
            shortName: "Open RN Nursing Pharmacology — Antiarrhythmic Medications",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )
        let aha = CitationSource(
            id: "aha_acls_amiodarone",
            shortName: "AHA ACLS — Amiodarone in cardiac arrest (paraphrased)",
            detail: "300 mg IV/IO bolus for shock-refractory VF/pulseless VT, may repeat 150 mg",
            publisher: "American Heart Association",
            license: .factCitationOnly,
            url: "https://cpr.heart.org/en/resuscitation-science/cpr-and-ecc-guidelines",
            lastRetrieved: "2026-05-03"
        )
        let ismp = CitationSource(
            id: "ismp_high_alert_2024",
            shortName: "ISMP List of High-Alert Medications in Acute Care, 2024",
            detail: "Concept citation — IV antiarrhythmics are an ISMP high-alert class",
            publisher: "Institute for Safe Medication Practices",
            license: .factCitationOnly,
            url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "amiodarone",
            title: "Amiodarone",
            subtitle: "Pacerone · Cordarone · class III antiarrhythmic",
            category: "Antiarrhythmic",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Class III antiarrhythmic"),
                KeyValueRow(key: "Onset", value: "Immediate (IV); days–weeks (PO)"),
                KeyValueRow(key: "Half-life", value: "~58 days (very long)"),
                KeyValueRow(key: "Toxicity profile", value: "Pulm, hepatic, thyroid, ocular, skin")
            ],
            indications: AttributedProse(
                "Treatment of documented, life-threatening recurrent ventricular fibrillation and hemodynamically unstable ventricular tachycardia in adults unresponsive to or intolerant of alternative therapy.",
                citationIDs: ["openfda_amiodarone"]
            ),
            mechanism: AttributedProse(
                "Class III antiarrhythmic that blocks sodium, potassium, and calcium channels and exerts noncompetitive sympathetic antagonism, prolonging the cardiac action potential and refractoriness in all tissues.",
                citationIDs: ["openfda_amiodarone"]
            ),
            dosing: [
                DosingBlock(label: "PO loading", body: "800–1600 mg/day until therapeutic response (typically 1–3 weeks). Divide doses ≥1000 mg/day. Administer with food.", citationIDs: ["openfda_amiodarone"]),
                DosingBlock(label: "PO maintenance", body: "After loading: stepdown to 600–800 mg/day for one month, then reduce to 400 mg/day maintenance.", citationIDs: ["openfda_amiodarone"]),
                DosingBlock(label: "ACLS — VF/pulseless VT", body: "300 mg IV/IO bolus; may repeat 150 mg once. (Per AHA ACLS guidance — paraphrased.)", citationIDs: ["aha_acls_amiodarone"])
            ],
            contraindications: AttributedProse(
                "Cardiogenic shock; sick sinus syndrome, second/third-degree AV block, bradycardia with syncope (without pacemaker); known hypersensitivity to amiodarone, iodine, or product components.",
                citationIDs: ["openfda_amiodarone"]
            ),
            warnings: [
                AttributedBullet("Boxed warning: pulmonary, hepatic, and cardiac toxicity. Use only in life-threatening arrhythmias.", citationIDs: ["openfda_amiodarone"]),
                AttributedBullet("Pulmonary toxicity (interstitial pneumonitis, fibrosis) — up to 17% incidence; baseline and surveillance chest imaging and PFTs.", citationIDs: ["openfda_amiodarone"]),
                AttributedBullet("Hepatic injury — transaminase elevations, can be life-threatening; monitor LFTs.", citationIDs: ["openfda_amiodarone"]),
                AttributedBullet("Worsened arrhythmia or Torsade de Pointes — correct hypokalemia and hypomagnesemia first.", citationIDs: ["openfda_amiodarone"]),
                AttributedBullet("Visual impairment / optic neuropathy — may cause permanent blindness; corneal microdeposits common.", citationIDs: ["openfda_amiodarone"]),
                AttributedBullet("Thyroid abnormalities — hypothyroidism (~10%) and hyperthyroidism (~2%); baseline and periodic TSH.", citationIDs: ["openfda_amiodarone"]),
                AttributedBullet("Photosensitivity / blue-gray skin discoloration with prolonged use.", citationIDs: ["openfda_amiodarone"])
            ],
            adverseReactions: AttributedProse(
                "Common: nausea, vomiting, hypotension, bradycardia, visual disturbances, photosensitivity, tremor, dizziness. Serious: pulmonary fibrosis, hepatotoxicity, thyroid dysfunction, peripheral neuropathy.",
                citationIDs: ["openfda_amiodarone"]
            ),
            drugInteractions: [
                AttributedBullet("QT-prolonging drugs (other antiarrhythmics, lithium, fluoroquinolones, macrolides, azoles, ondansetron) — increased Torsade de Pointes risk; avoid concurrent use.", citationIDs: ["openfda_amiodarone"]),
                AttributedBullet("Negative chronotropes (digoxin, β-blockers, verapamil, diltiazem) — additive bradycardia and AV block.", citationIDs: ["openfda_amiodarone"]),
                AttributedBullet("Warfarin — potentiates anticoagulation; reduce warfarin dose by ⅓–½ and monitor INR closely.", citationIDs: ["openfda_amiodarone"]),
                AttributedBullet("Digoxin — increases digoxin level by ~70% within 24 hours; reduce dose by half or discontinue.", citationIDs: ["openfda_amiodarone"])
            ],
            nursingImplications: [
                AttributedBullet("Continuous cardiac monitoring with IV use; check baseline 12-lead EKG for QT.", citationIDs: ["openrn_pharm_antiarrhythmics"]),
                AttributedBullet("Two-nurse independent verification before IV administration (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
                AttributedBullet("Hypotension is common with IV bolus — slow the rate or stop and notify provider.", citationIDs: ["openrn_pharm_antiarrhythmics"]),
                AttributedBullet("Use a 0.22-micron filter for IV infusions and central line if running >2 hours (incompatibility with PVC).", citationIDs: ["openrn_pharm_antiarrhythmics"]),
                AttributedBullet("Baseline and periodic monitoring: chest X-ray, PFTs, LFTs, TSH, ophthalmologic exam.", citationIDs: ["openrn_pharm_antiarrhythmics", "openfda_amiodarone"]),
                AttributedBullet("Counsel about photosensitivity — sunscreen and protective clothing; effects persist for months after discontinuation due to long half-life.", citationIDs: ["openrn_pharm_antiarrhythmics"]),
                AttributedBullet("If on warfarin or digoxin — anticipate dose reductions; monitor INR and digoxin levels closely.", citationIDs: ["openrn_pharm_antiarrhythmics"])
            ],
            patientTeaching: AttributedProse(
                "Take with food. Wear sunscreen and protective clothing — photosensitivity can persist for months. Report shortness of breath, persistent cough (pulmonary toxicity), yellowing of skin or eyes (hepatic), unexplained vision changes, or symptoms of thyroid dysfunction (weight changes, heat/cold intolerance, palpitations). Effects persist long after stopping.",
                citationIDs: ["openrn_pharm_antiarrhythmics", "openfda_amiodarone"]
            ),
            citations: [openfda, openrn, aha, ismp],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
