import Foundation

public enum NaloxoneSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_naloxone",
            shortName: "FDA SPL — Naloxone Hydrochloride (generic)",
            detail: "Standalone naloxone for opioid overdose reversal",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_reversal",
            shortName: "Open RN Nursing Pharmacology — Opioid Reversal Agents",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )
        let cdcOpioid = CitationSource(
            id: "cdc_naloxone_2024",
            shortName: "CDC — Lifesaving Naloxone (clinician resources)",
            publisher: "Centers for Disease Control and Prevention",
            license: .publicDomain,
            url: "https://www.cdc.gov/stop-overdose/caring/naloxone.html",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "naloxone",
            title: "Naloxone",
            subtitle: "Narcan · Kloxxado · opioid receptor antagonist",
            category: "Opioid Reversal",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Pure opioid antagonist"),
                KeyValueRow(key: "Onset", value: "1–2 min (IV); 2–5 min (IM/IN)"),
                KeyValueRow(key: "Duration", value: "30–90 min (shorter than most opioids)"),
                KeyValueRow(key: "Critical caveat", value: "Re-dosing often required")
            ],
            indications: AttributedProse(
                "Complete or partial reversal of opioid depression, including respiratory depression, induced by natural and synthetic opioids. Used for known or suspected opioid overdose.",
                citationIDs: ["openfda_naloxone", "cdc_naloxone_2024"]
            ),
            mechanism: AttributedProse(
                "Pure opioid receptor antagonist — competitively displaces opioids at mu, kappa, and delta receptors, reversing respiratory depression and sedation.",
                citationIDs: ["openfda_naloxone"]
            ),
            dosing: [
                DosingBlock(label: "IV / IM / SC (adult)", body: "0.4 mg to 2 mg. May repeat every 2–3 minutes if needed; if no response after 10 mg total, reconsider diagnosis.", citationIDs: ["openfda_naloxone"]),
                DosingBlock(label: "Intranasal (Narcan)", body: "4 mg in one nostril; may repeat in the other nostril every 2–3 minutes until response or EMS arrival.", citationIDs: ["cdc_naloxone_2024"]),
                DosingBlock(label: "Continuous infusion", body: "If repeat doses needed: titrate continuous infusion at 2/3 of the effective bolus dose per hour, adjust to maintain response.", citationIDs: ["openfda_naloxone"])
            ],
            contraindications: AttributedProse(
                "Known hypersensitivity to naloxone. (No absolute contraindications in life-threatening opioid overdose.)",
                citationIDs: ["openfda_naloxone"]
            ),
            warnings: [
                AttributedBullet("Acute opioid withdrawal — agitation, vomiting, lacrimation, tachycardia, hypertension; can be severe in chronic users. Anticipate and protect airway.", citationIDs: ["openfda_naloxone"]),
                AttributedBullet("Recurrence of respiratory depression — naloxone's duration is shorter than most opioids; PATIENT MUST BE OBSERVED for resedation. Always call 911.", citationIDs: ["cdc_naloxone_2024", "openfda_naloxone"]),
                AttributedBullet("Cardiac instability — pulmonary edema, ventricular arrhythmias, cardiac arrest reported with abrupt reversal.", citationIDs: ["openfda_naloxone"]),
                AttributedBullet("Less effective for partial agonists (buprenorphine) and synthetic opioids (fentanyl, carfentanil) — repeat doses likely required.", citationIDs: ["cdc_naloxone_2024"])
            ],
            adverseReactions: AttributedProse(
                "Common: opioid withdrawal symptoms (sweating, agitation, GI distress, tachycardia). Less common: hypertension, dysrhythmias, pulmonary edema (with rapid reversal).",
                citationIDs: ["openfda_naloxone"]
            ),
            drugInteractions: [
                AttributedBullet("Active opioids — naloxone reverses their effects (intended). Watch for resedation when naloxone wears off.", citationIDs: ["openfda_naloxone"]),
                AttributedBullet("Buprenorphine — naloxone may be less effective due to high-affinity opioid binding; may need higher or repeated doses.", citationIDs: ["cdc_naloxone_2024"])
            ],
            nursingImplications: [
                AttributedBullet("Confirm respiratory depression — RR <12, hypoxia, sedation — before administration. Naloxone in non-overdose causes severe withdrawal.", citationIDs: ["openrn_pharm_reversal"]),
                AttributedBullet("Titrate to respiratory recovery, not full alertness — goal is RR ≥10 with adequate ventilation; over-reversal causes severe withdrawal.", citationIDs: ["openrn_pharm_reversal"]),
                AttributedBullet("Continuous monitoring: vital signs every 15 min × 1 hr, then every 30 min. Pulse oximetry, cardiac monitor.", citationIDs: ["openrn_pharm_reversal"]),
                AttributedBullet("Anticipate re-dosing — naloxone duration (~30–90 min) is shorter than most opioids; resedation likely.", citationIDs: ["openrn_pharm_reversal", "cdc_naloxone_2024"]),
                AttributedBullet("Have airway equipment, oxygen, and bag-valve-mask at bedside.", citationIDs: ["openrn_pharm_reversal"]),
                AttributedBullet("After fentanyl or other synthetics, expect to give multiple doses. Continuous infusion may be required.", citationIDs: ["openrn_pharm_reversal", "cdc_naloxone_2024"]),
                AttributedBullet("Counsel: opioid users at risk of overdose should have take-home naloxone; train family/friends in administration.", citationIDs: ["cdc_naloxone_2024"])
            ],
            patientTeaching: AttributedProse(
                "If you or a loved one uses opioids (prescription or otherwise), keep naloxone available. Always call 911 — naloxone wears off and the person may stop breathing again. Position on the side to protect the airway. After reversal, the person may experience withdrawal — agitation, vomiting, body aches; that is expected.",
                citationIDs: ["cdc_naloxone_2024", "openrn_pharm_reversal"]
            ),
            citations: [openfda, openrn, cdcOpioid],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
