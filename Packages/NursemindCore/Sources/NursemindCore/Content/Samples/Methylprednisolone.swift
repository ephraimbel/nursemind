import Foundation

public enum MethylprednisoloneSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_methylpred",
            shortName: "FDA SPL — Methylprednisolone Sodium Succinate (Solu-Medrol)",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_corticosteroids",
            shortName: "Open RN Nursing Pharmacology — Corticosteroids",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "methylprednisolone",
            title: "Methylprednisolone",
            subtitle: "Solu-Medrol · Medrol · synthetic corticosteroid",
            category: "Corticosteroid",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Glucocorticoid"),
                KeyValueRow(key: "Onset", value: "Rapid (IV); 1–2 hr (PO)"),
                KeyValueRow(key: "Half-life", value: "Biological 18–36 hr"),
                KeyValueRow(key: "Equivalency", value: "4 mg = ~5 mg prednisone")
            ],
            indications: AttributedProse(
                "Anti-inflammatory and immunosuppressive in COPD/asthma exacerbation, allergic reactions/anaphylaxis (adjunct), autoimmune flares, transplant rejection, severe inflammation, spinal cord injury (controversial), septic shock with refractory hypotension.",
                citationIDs: ["openfda_methylpred"]
            ),
            mechanism: AttributedProse(
                "Synthetic glucocorticoid that suppresses inflammation and immune response by inhibiting phospholipase A₂, reducing prostaglandin and leukotriene production, and inhibiting cytokine release.",
                citationIDs: ["openfda_methylpred"]
            ),
            dosing: [
                DosingBlock(label: "COPD/asthma exacerbation", body: "40–125 mg IV every 6 hours initially, then taper. Or PO prednisone equivalent for outpatient bursts.", citationIDs: ["openrn_pharm_corticosteroids"]),
                DosingBlock(label: "Severe allergic reaction", body: "125 mg IV; repeat every 6 hours as needed.", citationIDs: ["openfda_methylpred"]),
                DosingBlock(label: "Septic shock (per Surviving Sepsis)", body: "200 mg/day IV (commonly hydrocortisone 50 mg q6h substituted) — for vasopressor-refractory septic shock.", citationIDs: ["openrn_pharm_corticosteroids"])
            ],
            contraindications: AttributedProse(
                "Systemic fungal infections (untreated). Live or live-attenuated vaccines (when on immunosuppressive doses). Hypersensitivity.",
                citationIDs: ["openfda_methylpred"]
            ),
            warnings: [
                AttributedBullet("Hyperglycemia — can be marked, especially in diabetics. Monitor glucose.", citationIDs: ["openfda_methylpred"]),
                AttributedBullet("Adrenal suppression — taper after >7–14 days of therapy; abrupt discontinuation can cause adrenal crisis.", citationIDs: ["openfda_methylpred"]),
                AttributedBullet("Infection masking and increased risk — fever, classic signs of infection may be absent.", citationIDs: ["openfda_methylpred"]),
                AttributedBullet("Peptic ulcer disease, GI bleeding — give with PPI in high-risk patients or chronic use.", citationIDs: ["openfda_methylpred"]),
                AttributedBullet("Psychiatric effects — mood changes, insomnia, psychosis, especially at high doses.", citationIDs: ["openfda_methylpred"]),
                AttributedBullet("Osteoporosis, immunosuppression with chronic use — calcium, vitamin D, bone density monitoring.", citationIDs: ["openfda_methylpred"])
            ],
            adverseReactions: AttributedProse(
                "Common: hyperglycemia, fluid retention, weight gain, increased appetite, mood changes, insomnia, GI upset. Long-term: adrenal suppression, osteoporosis, cushingoid features, cataracts, immunosuppression.",
                citationIDs: ["openfda_methylpred"]
            ),
            drugInteractions: [
                AttributedBullet("NSAIDs — additive GI bleeding risk.", citationIDs: ["openfda_methylpred"]),
                AttributedBullet("Live vaccines — contraindicated during immunosuppressive doses.", citationIDs: ["openfda_methylpred"]),
                AttributedBullet("Anticoagulants — variable effect; monitor INR.", citationIDs: ["openfda_methylpred"]),
                AttributedBullet("CYP3A4 inducers (rifampin, phenytoin) — reduce steroid efficacy.", citationIDs: ["openfda_methylpred"])
            ],
            nursingImplications: [
                AttributedBullet("Check glucose at baseline and during therapy — sliding scale insulin often needed.", citationIDs: ["openrn_pharm_corticosteroids"]),
                AttributedBullet("Daily weight, I&O, BP — fluid retention is common.", citationIDs: ["openrn_pharm_corticosteroids"]),
                AttributedBullet("Monitor for signs of infection — temperature alone is unreliable; assess WBC, vitals, mental status.", citationIDs: ["openrn_pharm_corticosteroids"]),
                AttributedBullet("Give with food or H2-blocker/PPI to reduce GI irritation.", citationIDs: ["openrn_pharm_corticosteroids"]),
                AttributedBullet("Never abruptly discontinue after >2 weeks of systemic therapy — taper per protocol.", citationIDs: ["openrn_pharm_corticosteroids", "openfda_methylpred"]),
                AttributedBullet("Mood and sleep assessment — high-dose steroids can cause significant mood changes; counsel patient and family.", citationIDs: ["openrn_pharm_corticosteroids"])
            ],
            patientTeaching: AttributedProse(
                "Take with food. Do not stop suddenly — taper as directed. Carry medical identification (steroid dependent). Report fever, chills, weight gain, vision changes, severe mood changes, black or bloody stools. Avoid live vaccines. Monitor blood glucose if diabetic.",
                citationIDs: ["openrn_pharm_corticosteroids"]
            ),
            citations: [openfda, openrn],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
