import Foundation

public enum LorazepamSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_lorazepam",
            shortName: "FDA SPL — Lorazepam (Ativan)",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_benzos",
            shortName: "Open RN Nursing Pharmacology — CNS: Benzodiazepines",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )
        let ismp = CitationSource(
            id: "ismp_high_alert_2024",
            shortName: "ISMP List of High-Alert Medications in Acute Care, 2024",
            detail: "IV/IM benzodiazepines are an ISMP high-alert class",
            publisher: "Institute for Safe Medication Practices",
            license: .factCitationOnly,
            url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "lorazepam",
            title: "Lorazepam",
            subtitle: "Ativan · benzodiazepine",
            category: "Benzodiazepine",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Benzodiazepine — GABA-A potentiator"),
                KeyValueRow(key: "Onset", value: "1–5 min (IV); 30–60 min (PO)"),
                KeyValueRow(key: "Duration", value: "6–8 hr"),
                KeyValueRow(key: "Reversal", value: "Flumazenil (with caution)")
            ],
            indications: AttributedProse(
                "Anxiety, status epilepticus (first-line for active seizures), alcohol withdrawal, procedural sedation, ICU sedation, premedication for anesthesia.",
                citationIDs: ["openfda_lorazepam"]
            ),
            mechanism: AttributedProse(
                "Enhances the inhibitory effect of GABA at the GABA-A receptor, increasing chloride channel opening and producing CNS depression — anxiolysis, sedation, anticonvulsant, and amnesic effects.",
                citationIDs: ["openfda_lorazepam"]
            ),
            dosing: [
                DosingBlock(label: "Anxiety (PO)", body: "1–2 mg every 6–8 hours as needed; max ~10 mg/day.", citationIDs: ["openfda_lorazepam"]),
                DosingBlock(label: "Status epilepticus (IV)", body: "4 mg slow IV push (over 2 minutes); may repeat once after 5–10 minutes if seizures persist.", citationIDs: ["openfda_lorazepam"]),
                DosingBlock(label: "Alcohol withdrawal (CIWA-driven)", body: "1–4 mg PO/IV every 1–2 hours per CIWA-Ar score; titrate to RASS 0 and CIWA <8.", citationIDs: ["openrn_pharm_benzos"])
            ],
            contraindications: AttributedProse(
                "Hypersensitivity to benzodiazepines or polyethylene glycol/propylene glycol (parenteral). Acute narrow-angle glaucoma. Severe respiratory insufficiency.",
                citationIDs: ["openfda_lorazepam"]
            ),
            warnings: [
                AttributedBullet("Boxed warning: concomitant opioid use can result in profound sedation, respiratory depression, coma, and death — reserve for patients with no alternatives.", citationIDs: ["openfda_lorazepam"]),
                AttributedBullet("Respiratory depression — especially with IV/IM use, elderly, or with other CNS depressants. Have airway equipment available.", citationIDs: ["openfda_lorazepam"]),
                AttributedBullet("Paradoxical reactions — agitation, aggression, especially in elderly and pediatric patients.", citationIDs: ["openfda_lorazepam"]),
                AttributedBullet("Dependence and withdrawal — risk increases with duration and dose; taper to discontinue. Withdrawal can include life-threatening seizures.", citationIDs: ["openfda_lorazepam"]),
                AttributedBullet("Propylene glycol toxicity with high-dose continuous infusion (>10 mg/hr × hours) — metabolic acidosis, hyperosmolality, AKI. Monitor osmolar gap.", citationIDs: ["openrn_pharm_benzos"])
            ],
            adverseReactions: AttributedProse(
                "Common: sedation, dizziness, weakness, ataxia, confusion (especially in elderly), amnesia. Less common: respiratory depression, hypotension, paradoxical agitation.",
                citationIDs: ["openfda_lorazepam"]
            ),
            drugInteractions: [
                AttributedBullet("Opioids and other CNS depressants (alcohol, antihistamines, antipsychotics) — additive sedation and respiratory depression.", citationIDs: ["openfda_lorazepam"]),
                AttributedBullet("Probenecid and valproic acid — increase lorazepam levels.", citationIDs: ["openfda_lorazepam"]),
                AttributedBullet("Theophylline and aminophylline — may reduce lorazepam's sedative effect.", citationIDs: ["openfda_lorazepam"])
            ],
            nursingImplications: [
                AttributedBullet("Two-nurse independent verification for IV doses (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
                AttributedBullet("Have airway equipment, oxygen, and bag-valve-mask available before IV administration.", citationIDs: ["openrn_pharm_benzos"]),
                AttributedBullet("Push slowly — no faster than 2 mg/min (and no faster than the patient's respiratory rate can handle).", citationIDs: ["openrn_pharm_benzos", "openfda_lorazepam"]),
                AttributedBullet("Monitor RR, SpO2, BP, and LOC continuously during and 15 min after IV doses.", citationIDs: ["openrn_pharm_benzos"]),
                AttributedBullet("Use a sedation scale (RASS for ICU) — titrate to ordered target, not 'asleep.'", citationIDs: ["openrn_pharm_benzos"]),
                AttributedBullet("Continuous infusion: monitor for propylene glycol toxicity if running >10 mg/hr × multiple hours — check osmolar gap, lactate, creatinine daily.", citationIDs: ["openrn_pharm_benzos"]),
                AttributedBullet("Fall precautions for older adults — benzodiazepines are on the Beers list; high fall risk.", citationIDs: ["openrn_pharm_benzos"])
            ],
            patientTeaching: AttributedProse(
                "Avoid alcohol and other sedatives. Do not stop suddenly — withdrawal can be severe. Avoid driving until you know how it affects you. Inform all providers about lorazepam, especially before surgery. Older adults: discuss fall risk and consider non-benzodiazepine alternatives.",
                citationIDs: ["openrn_pharm_benzos"]
            ),
            citations: [openfda, openrn, ismp],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
