import Foundation

public enum OndansetronSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_ondansetron",
            shortName: "FDA SPL — Ondansetron (Zofran)",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_antiemetics",
            shortName: "Open RN Nursing Pharmacology — GI: Antiemetics",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "ondansetron",
            title: "Ondansetron",
            subtitle: "Zofran · 5-HT₃ receptor antagonist",
            category: "Antiemetic",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Selective 5-HT₃ receptor antagonist"),
                KeyValueRow(key: "Onset", value: "30 min (PO); ~10 min (IV)"),
                KeyValueRow(key: "Half-life", value: "3–6 hr"),
                KeyValueRow(key: "Watch for", value: "QT prolongation")
            ],
            indications: AttributedProse(
                "Prevention and treatment of nausea and vomiting associated with chemotherapy, radiotherapy, postoperative nausea and vomiting (PONV), and pregnancy hyperemesis (off-label).",
                citationIDs: ["openfda_ondansetron"]
            ),
            mechanism: AttributedProse(
                "Selectively blocks serotonin (5-HT₃) receptors in the chemoreceptor trigger zone and on vagal afferent terminals in the gut, preventing emetic stimulus transmission.",
                citationIDs: ["openfda_ondansetron"]
            ),
            dosing: [
                DosingBlock(label: "PONV (adult)", body: "4 mg IV/IM × 1 dose, given as a single 2-minute IV push or IM injection. Or 16 mg PO 1 hour before anesthesia.", citationIDs: ["openfda_ondansetron"]),
                DosingBlock(label: "Chemotherapy (adult)", body: "8 mg PO twice daily, OR 8 mg IV 30 min before chemo, then 8 mg IV every 8 hours × 1–2 days.", citationIDs: ["openfda_ondansetron"]),
                DosingBlock(label: "Maximum single IV dose", body: "16 mg per FDA labeling change — 32 mg single doses are NO LONGER recommended due to QT prolongation risk.", citationIDs: ["openfda_ondansetron"])
            ],
            contraindications: AttributedProse(
                "Concurrent use of apomorphine — causes profound hypotension and loss of consciousness. Hypersensitivity to ondansetron or other 5-HT₃ antagonists.",
                citationIDs: ["openfda_ondansetron"]
            ),
            warnings: [
                AttributedBullet("QT prolongation and Torsades de Pointes — dose-dependent. Avoid in congenital long QT and uncorrected hypokalemia/hypomagnesemia.", citationIDs: ["openfda_ondansetron"]),
                AttributedBullet("Serotonin syndrome — when given with other serotonergic drugs (SSRIs, SNRIs, MAOIs, tramadol, fentanyl).", citationIDs: ["openfda_ondansetron"]),
                AttributedBullet("Masking of progressive ileus or gastric distention — does not stimulate gastric or intestinal peristalsis.", citationIDs: ["openfda_ondansetron"]),
                AttributedBullet("Hepatic impairment — reduce dose; do not exceed 8 mg/day total in severe impairment.", citationIDs: ["openfda_ondansetron"])
            ],
            adverseReactions: AttributedProse(
                "Common: headache (10–27%), constipation (5–11%), diarrhea, fatigue, dizziness. Rare but serious: QT prolongation, anaphylaxis, severe skin reactions.",
                citationIDs: ["openfda_ondansetron"]
            ),
            drugInteractions: [
                AttributedBullet("Apomorphine — contraindicated.", citationIDs: ["openfda_ondansetron"]),
                AttributedBullet("Other QT-prolonging drugs (amiodarone, fluoroquinolones, methadone, antipsychotics) — additive risk; avoid or monitor EKG.", citationIDs: ["openfda_ondansetron"]),
                AttributedBullet("Serotonergic drugs (SSRIs, SNRIs, MAOIs, tramadol, fentanyl) — serotonin syndrome risk.", citationIDs: ["openfda_ondansetron"])
            ],
            nursingImplications: [
                AttributedBullet("Obtain baseline EKG if possible in patients with cardiac risk factors or on other QT-prolonging drugs; monitor for QT prolongation.", citationIDs: ["openrn_pharm_antiemetics"]),
                AttributedBullet("Verify potassium and magnesium are within normal limits before administration in cardiac risk patients.", citationIDs: ["openrn_pharm_antiemetics"]),
                AttributedBullet("Push IV slowly over 2 minutes — faster administration increases QT effects.", citationIDs: ["openfda_ondansetron"]),
                AttributedBullet("Assess pain, nausea, and bowel function regularly — ondansetron can mask ileus.", citationIDs: ["openrn_pharm_antiemetics"]),
                AttributedBullet("Counsel patients on constipation — ondansetron is constipating; encourage hydration and fiber.", citationIDs: ["openrn_pharm_antiemetics"]),
                AttributedBullet("Identify pregnancy — ondansetron crosses the placenta; weigh benefits/risks for hyperemesis.", citationIDs: ["openrn_pharm_antiemetics"])
            ],
            patientTeaching: AttributedProse(
                "Take as scheduled for prevention; can be taken with or without food. Increase water and fiber to prevent constipation. Report headache that doesn't resolve, palpitations, fainting, or facial swelling. If on antidepressants, tell your provider — interaction risk.",
                citationIDs: ["openrn_pharm_antiemetics"]
            ),
            citations: [openfda, openrn],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
