import Foundation

public enum MorphineSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_morphine",
            shortName: "FDA Structured Product Labeling — Morphine Sulfate",
            detail: "Ascend Laboratories, LLC",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_opioids",
            shortName: "Open RN Nursing Pharmacology — Opioid Analgesics chapter",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )
        let openstax = CitationSource(
            id: "openstax_pharm_opioids",
            shortName: "OpenStax Pharmacology for Nurses — Opioid Analgesics",
            publisher: "OpenStax · Rice University",
            license: .ccBy4WithAIRestriction,
            url: "https://openstax.org/books/pharmacology/pages/1-introduction",
            lastRetrieved: "2026-05-03"
        )
        let ismp = CitationSource(
            id: "ismp_high_alert_2024",
            shortName: "ISMP List of High-Alert Medications in Acute Care, 2024",
            detail: "Concept citation only — opioids are an ISMP high-alert class",
            publisher: "Institute for Safe Medication Practices",
            license: .factCitationOnly,
            url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "morphine",
            title: "Morphine",
            subtitle: "morphine sulfate · opioid analgesic",
            category: "Opioid Analgesic",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Mu-opioid receptor agonist"),
                KeyValueRow(key: "Onset", value: "5–10 min (IV); 30 min (PO)"),
                KeyValueRow(key: "Duration", value: "3–5 hours"),
                KeyValueRow(key: "Reversal", value: "Naloxone")
            ],
            indications: AttributedProse(
                "Management of acute pain in adults and pediatric patients ≥50 kg, and chronic pain in adults, when severe enough to require an opioid analgesic and for which alternative treatments are inadequate.",
                citationIDs: ["openfda_morphine"]
            ),
            mechanism: AttributedProse(
                "Mu-opioid receptor agonist producing analgesia through binding in CNS pain pathways.",
                citationIDs: ["openfda_morphine"]
            ),
            dosing: [
                DosingBlock(
                    label: "Initial (oral)",
                    body: "15–30 mg every 4 hours as needed.",
                    citationIDs: ["openfda_morphine"]
                ),
                DosingBlock(
                    label: "Titration",
                    body: "Titrate based on individual response; use lowest effective dose for shortest duration consistent with goals.",
                    citationIDs: ["openfda_morphine"]
                ),
                DosingBlock(
                    label: "Discontinuation",
                    body: "Do not abruptly discontinue in physically dependent patients — taper gradually to avoid withdrawal.",
                    citationIDs: ["openfda_morphine"]
                )
            ],
            contraindications: AttributedProse(
                "Significant respiratory depression; acute or severe asthma in unmonitored settings; concurrent MAOI use or within 14 days of stopping; gastrointestinal obstruction including paralytic ileus; hypersensitivity to morphine.",
                citationIDs: ["openfda_morphine"]
            ),
            warnings: [
                AttributedBullet("Boxed warning: addiction, abuse, and misuse; respiratory depression; accidental ingestion; CNS depressant interactions; neonatal opioid withdrawal syndrome.", citationIDs: ["openfda_morphine"]),
                AttributedBullet("Life-threatening respiratory depression may occur, especially during initiation or after dose increase.", citationIDs: ["openfda_morphine"]),
                AttributedBullet("Concurrent use with benzodiazepines or other CNS depressants risks profound sedation, respiratory depression, coma, and death.", citationIDs: ["openfda_morphine"]),
                AttributedBullet("Opioid-induced hyperalgesia is possible — paradoxical increase in pain sensitivity.", citationIDs: ["openfda_morphine"]),
                AttributedBullet("Risk of severe hypotension, especially in volume-depleted patients.", citationIDs: ["openfda_morphine"])
            ],
            adverseReactions: AttributedProse(
                "Most common: constipation, nausea, somnolence, lightheadedness, dizziness, sedation, vomiting, sweating.",
                citationIDs: ["openfda_morphine"]
            ),
            drugInteractions: [
                AttributedBullet("Benzodiazepines and CNS depressants — increased overdose risk; avoid concurrent use when possible.", citationIDs: ["openfda_morphine"]),
                AttributedBullet("Serotonergic drugs — risk of serotonin syndrome.", citationIDs: ["openfda_morphine"]),
                AttributedBullet("MAOIs — contraindicated within 14 days.", citationIDs: ["openfda_morphine"]),
                AttributedBullet("Mixed agonist/antagonist or partial-agonist opioids — may reduce analgesic effect; avoid.", citationIDs: ["openfda_morphine"]),
                AttributedBullet("P-glycoprotein inhibitors — may double morphine exposure.", citationIDs: ["openfda_morphine"])
            ],
            nursingImplications: [
                AttributedBullet("Assess pain (intensity, character, location, duration) before and after administration; reassess at peak effect.", citationIDs: ["openrn_pharm_opioids", "openstax_pharm_opioids"]),
                AttributedBullet("Monitor respiratory rate, depth, and oxygen saturation; hold for RR <12 and notify provider.", citationIDs: ["openrn_pharm_opioids", "openstax_pharm_opioids"]),
                AttributedBullet("Monitor level of consciousness using a sedation scale (e.g., POSS, RASS) at peak effect.", citationIDs: ["openrn_pharm_opioids"]),
                AttributedBullet("Have naloxone (reversal agent) immediately available; administer 0.4–2 mg IV/IM/SC for opioid-induced respiratory depression.", citationIDs: ["openrn_pharm_opioids"]),
                AttributedBullet("Two-nurse independent verification for high-risk doses (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
                AttributedBullet("Initiate bowel regimen — opioid-induced constipation is near-universal with continued use.", citationIDs: ["openrn_pharm_opioids", "openstax_pharm_opioids"]),
                AttributedBullet("Assess for orthostatic hypotension; instruct patient to change positions slowly.", citationIDs: ["openrn_pharm_opioids"]),
                AttributedBullet("Monitor for urinary retention, especially in older adults.", citationIDs: ["openrn_pharm_opioids"])
            ],
            patientTeaching: AttributedProse(
                "Take only as prescribed; do not crush, chew, or break extended-release products. Avoid alcohol and other sedating medications. Report severe drowsiness, slowed breathing, confusion, or chest pain. Use caution with driving until the response to morphine is known. Store securely — accidental ingestion by children can be fatal.",
                citationIDs: ["openrn_pharm_opioids", "openstax_pharm_opioids"]
            ),
            citations: [openfda, openrn, openstax, ismp],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
