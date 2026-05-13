import Foundation

public enum PantoprazoleSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_pantoprazole",
            shortName: "FDA SPL — Pantoprazole Sodium",
            detail: "PROTONIX I.V. equivalent labeling",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_ppi",
            shortName: "Open RN Nursing Pharmacology — GI: Proton Pump Inhibitors",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "pantoprazole",
            title: "Pantoprazole",
            subtitle: "Protonix · proton pump inhibitor",
            category: "Proton Pump Inhibitor",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Proton pump inhibitor (PPI)"),
                KeyValueRow(key: "Onset", value: "~30 min"),
                KeyValueRow(key: "Half-life", value: "~1 hr (effect lasts >24 hr)"),
                KeyValueRow(key: "Best timing", value: "30 min before breakfast (PO)")
            ],
            indications: AttributedProse(
                "GERD with erosive esophagitis (short-term healing); pathological hypersecretory conditions including Zollinger-Ellison syndrome; stress ulcer prophylaxis in critically ill patients.",
                citationIDs: ["openfda_pantoprazole"]
            ),
            mechanism: AttributedProse(
                "Suppresses gastric acid secretion by covalently binding the (H⁺,K⁺)-ATPase enzyme system at the parietal cell secretory surface — the final step in gastric acid production.",
                citationIDs: ["openfda_pantoprazole"]
            ),
            dosing: [
                DosingBlock(label: "PO (GERD/EE)", body: "40 mg once daily for up to 8 weeks. Take 30 minutes before breakfast.", citationIDs: ["openfda_pantoprazole"]),
                DosingBlock(label: "IV (acute)", body: "40 mg once daily as 2-minute push or 15-minute infusion.", citationIDs: ["openfda_pantoprazole"]),
                DosingBlock(label: "Hypersecretory states", body: "80 mg every 12 hours; titrate per acid output.", citationIDs: ["openfda_pantoprazole"])
            ],
            contraindications: AttributedProse(
                "Known hypersensitivity to pantoprazole, other substituted benzimidazoles (omeprazole, lansoprazole, etc.), or formulation components. Concurrent rilpivirine.",
                citationIDs: ["openfda_pantoprazole"]
            ),
            warnings: [
                AttributedBullet("Clostridioides difficile-associated diarrhea — PPIs increase risk; consider lowest effective dose.", citationIDs: ["openfda_pantoprazole"]),
                AttributedBullet("Hypomagnesemia — reported with prolonged use (≥3 months); monitor magnesium in long-term therapy or diuretic concurrency.", citationIDs: ["openfda_pantoprazole"]),
                AttributedBullet("Bone fracture risk — long-term, multiple-daily-dose therapy associated with osteoporosis-related fractures of hip, wrist, spine.", citationIDs: ["openfda_pantoprazole"]),
                AttributedBullet("Vitamin B12 deficiency — gastric acid is needed for B12 absorption; possible with prolonged use.", citationIDs: ["openfda_pantoprazole"]),
                AttributedBullet("Acute interstitial nephritis — rare; can present any time during therapy. Discontinue if suspected.", citationIDs: ["openfda_pantoprazole"]),
                AttributedBullet("Cutaneous lupus erythematosus, SJS, TEN, DRESS — discontinue if rash plus systemic symptoms.", citationIDs: ["openfda_pantoprazole"])
            ],
            adverseReactions: AttributedProse(
                "Most common (>2%): headache, diarrhea, nausea, abdominal pain, vomiting, flatulence, dizziness, arthralgia.",
                citationIDs: ["openfda_pantoprazole"]
            ),
            drugInteractions: [
                AttributedBullet("Methotrexate — high-dose methotrexate may have delayed elimination with PPIs; consider holding pantoprazole.", citationIDs: ["openfda_pantoprazole"]),
                AttributedBullet("Drugs requiring acidic gastric pH for absorption (ketoconazole, atazanavir, iron salts, ampicillin) — reduced bioavailability.", citationIDs: ["openfda_pantoprazole"]),
                AttributedBullet("Warfarin — increased INR reported in some patients; monitor.", citationIDs: ["openfda_pantoprazole"]),
                AttributedBullet("Clopidogrel — pantoprazole has minimal interaction (unlike omeprazole); generally preferred PPI in dual antiplatelet therapy.", citationIDs: ["openrn_pharm_ppi"])
            ],
            nursingImplications: [
                AttributedBullet("Administer PO 30 minutes before breakfast for maximum effect — PPIs work best on actively secreting parietal cells.", citationIDs: ["openrn_pharm_ppi"]),
                AttributedBullet("Do not crush, split, or chew delayed-release tablets — they're enteric-coated for a reason.", citationIDs: ["openrn_pharm_ppi"]),
                AttributedBullet("IV administration — use a dedicated 1.2-micron filter; do not co-administer with other IV drugs in the same line.", citationIDs: ["openfda_pantoprazole", "openrn_pharm_ppi"]),
                AttributedBullet("Monitor for C. difficile signs — new-onset or worsening diarrhea, fever, abdominal pain. Send stool sample.", citationIDs: ["openrn_pharm_ppi"]),
                AttributedBullet("Long-term therapy: monitor magnesium and vitamin B12 periodically.", citationIDs: ["openrn_pharm_ppi"]),
                AttributedBullet("Reassess indication — PPIs are over-prescribed; deprescribing protocols are common in long-term care.", citationIDs: ["openrn_pharm_ppi"])
            ],
            patientTeaching: AttributedProse(
                "Take 30 minutes before your first meal of the day. Swallow whole — do not crush or split. Notify your provider for new diarrhea, persistent abdominal pain, muscle cramps (low magnesium), or fatigue. Long-term use may slightly increase fracture risk — discuss bone health with your provider.",
                citationIDs: ["openrn_pharm_ppi", "openfda_pantoprazole"]
            ),
            citations: [openfda, openrn],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
