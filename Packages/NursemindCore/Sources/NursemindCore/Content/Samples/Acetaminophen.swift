import Foundation

public enum AcetaminophenSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_apap",
            shortName: "FDA SPL — Acetaminophen",
            detail: "Generic acetaminophen labeling",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_analgesics",
            shortName: "Open RN Nursing Pharmacology — Analgesics: Non-opioids",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )
        let livertox = CitationSource(
            id: "livertox_apap",
            shortName: "LiverTox — Acetaminophen (NCBI Bookshelf)",
            detail: "NBK547852",
            publisher: "NIH",
            license: .publicDomain,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK547852/",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "acetaminophen",
            title: "Acetaminophen",
            subtitle: "Tylenol · APAP · paracetamol — non-opioid analgesic / antipyretic",
            category: "Non-opioid Analgesic",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Para-aminophenol derivative"),
                KeyValueRow(key: "Onset", value: "30–60 min (PO); 5–15 min (IV)"),
                KeyValueRow(key: "Half-life", value: "2–3 hr"),
                KeyValueRow(key: "Max daily", value: "4 g (3 g if hepatic risk)")
            ],
            indications: AttributedProse(
                "Mild to moderate pain (alone or in combination); fever reduction. Often used as part of multimodal analgesia to reduce opioid requirements.",
                citationIDs: ["openfda_apap"]
            ),
            mechanism: AttributedProse(
                "Inhibits central prostaglandin synthesis and acts on the hypothalamic heat-regulating center, producing analgesia and antipyresis without anti-inflammatory or antiplatelet effects.",
                citationIDs: ["openfda_apap"]
            ),
            dosing: [
                DosingBlock(label: "Adult oral", body: "325–1000 mg every 4–6 hours as needed. Maximum 4 g/day for healthy adults; 3 g/day for those at risk of hepatotoxicity.", citationIDs: ["openfda_apap"]),
                DosingBlock(label: "Adult IV", body: "1000 mg every 6 hours, OR 650 mg every 4 hours (max 4 g/day). Infuse over 15 minutes.", citationIDs: ["openfda_apap"]),
                DosingBlock(label: "Hepatic risk", body: "Reduce maximum daily dose to 3 g (or lower) in chronic liver disease, heavy alcohol use (≥3 drinks/day), or malnutrition.", citationIDs: ["livertox_apap", "openrn_pharm_analgesics"])
            ],
            contraindications: AttributedProse(
                "Severe hepatic impairment or active liver disease. Hypersensitivity to acetaminophen.",
                citationIDs: ["openfda_apap"]
            ),
            warnings: [
                AttributedBullet("Boxed-warning equivalent — hepatotoxicity is the dose-limiting toxicity. Doses exceeding 4 g/day risk acute liver failure; can lead to liver transplant or death.", citationIDs: ["openfda_apap", "livertox_apap"]),
                AttributedBullet("Many combination products (cold, opioid combos) contain acetaminophen — patients can inadvertently exceed 4 g/day. Always reconcile.", citationIDs: ["livertox_apap", "openrn_pharm_analgesics"]),
                AttributedBullet("Severe skin reactions reported — Stevens-Johnson syndrome, TEN, AGEP. Discontinue immediately if rash or mucosal involvement.", citationIDs: ["openfda_apap"]),
                AttributedBullet("Hypersensitivity / anaphylaxis with facial or throat swelling.", citationIDs: ["openfda_apap"])
            ],
            adverseReactions: AttributedProse(
                "Generally well tolerated at therapeutic doses. Rare: rash, nausea. With overdose: hepatotoxicity (usually delayed 24–72 hours), nephrotoxicity (less common).",
                citationIDs: ["openfda_apap"]
            ),
            drugInteractions: [
                AttributedBullet("Warfarin — high-dose chronic acetaminophen may potentiate INR; monitor with sustained use.", citationIDs: ["openfda_apap"]),
                AttributedBullet("Alcohol — additive hepatotoxicity; avoid heavy drinking with chronic use.", citationIDs: ["livertox_apap"]),
                AttributedBullet("Other acetaminophen-containing products — count ALL sources toward the daily limit.", citationIDs: ["openrn_pharm_analgesics"])
            ],
            nursingImplications: [
                AttributedBullet("Reconcile ALL acetaminophen sources — combination products (Percocet, Vicodin, Tylenol PM, cold meds) all count toward 4 g/day.", citationIDs: ["openrn_pharm_analgesics", "livertox_apap"]),
                AttributedBullet("Assess for hepatic risk — chronic alcohol use, liver disease, malnutrition, prolonged fasting.", citationIDs: ["openrn_pharm_analgesics"]),
                AttributedBullet("Monitor pain at peak effect (~30–60 minutes after PO; 1 hour after IV). Document.", citationIDs: ["openrn_pharm_analgesics"]),
                AttributedBullet("Monitor temperature for antipyretic effect; expect ~1°C drop within 1 hour.", citationIDs: ["openrn_pharm_analgesics"]),
                AttributedBullet("In suspected overdose — get an acetaminophen level at 4 hours post-ingestion (or as soon as possible after); plot on Rumack-Matthew nomogram. N-acetylcysteine is the antidote.", citationIDs: ["livertox_apap"]),
                AttributedBullet("Monitor LFTs in patients on chronic high-dose therapy (>2 weeks at near-maximum dose).", citationIDs: ["openrn_pharm_analgesics"])
            ],
            patientTeaching: AttributedProse(
                "Do not exceed 4 grams (4000 mg) per day — that includes Tylenol, combo cold meds, and any opioid combination products. Avoid heavy alcohol use. Report any unexpected rash, yellowing of skin or eyes, or unexplained nausea.",
                citationIDs: ["openrn_pharm_analgesics", "livertox_apap"]
            ),
            citations: [openfda, openrn, livertox],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
