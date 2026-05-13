import Foundation

// Curator-model sample. Every clinical claim ties back to a CitationSource.
// No clinical content was authored by NurseMind. Sourcing details:
// - openFDA SPL (CC0 / public domain)
// - Open RN Nursing Pharmacology Ch. 4 (CC BY 4.0)
// - OpenStax Pharmacology for Nurses §22.3 Shock Drugs (CC BY 4.0 — library display only;
//   AI corpus use pending OpenStax permission, see CONTENT_SOURCING.md §2.6)

public enum NorepinephrineSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_norepinephrine",
            shortName: "FDA Structured Product Labeling — Norepinephrine Bitartrate",
            detail: "SET ID: 0ea48ab6-e166-df31-b132-70ef982a2d02",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_ch4",
            shortName: "Open RN Nursing Pharmacology, 2nd ed. — Ch. 4: Autonomic Nervous System",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595003/",
            lastRetrieved: "2026-05-03"
        )
        let openstax = CitationSource(
            id: "openstax_pharm_22_3",
            shortName: "OpenStax Pharmacology for Nurses — §22.3: Shock Drugs",
            detail: "Barbour-Taylor T, Mueller (Sabato) L, Paris D, Weaver D · May 2024",
            publisher: "OpenStax · Rice University",
            license: .ccBy4WithAIRestriction,
            url: "https://openstax.org/books/pharmacology/pages/22-3-shock-drugs",
            lastRetrieved: "2026-05-03"
        )
        let ismp = CitationSource(
            id: "ismp_high_alert_2024",
            shortName: "ISMP List of High-Alert Medications in Acute Care Settings, 2024",
            detail: "Concept citation only — list itself not reproduced",
            publisher: "Institute for Safe Medication Practices",
            license: .factCitationOnly,
            url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "norepinephrine",
            title: "Norepinephrine",
            subtitle: "Levophed · norepinephrine bitartrate",
            category: "Vasopressor",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "α/β adrenergic agonist (catecholamine)"),
                KeyValueRow(key: "Onset", value: "Immediate"),
                KeyValueRow(key: "Half-life", value: "2–3 minutes"),
                KeyValueRow(key: "How supplied", value: "4 mg / 4 mL (1 mg/mL)")
            ],
            indications: AttributedProse(
                "Norepinephrine bitartrate injection is indicated to raise blood pressure in adult patients with severe, acute hypotension.",
                citationIDs: ["openfda_norepinephrine"]
            ),
            mechanism: AttributedProse(
                "Norepinephrine is a peripheral vasoconstrictor (alpha-adrenergic action) and an inotropic stimulator of the heart and dilator of coronary arteries (beta-adrenergic action). It is used in clients with critically low blood pressure. Alpha-1 stimulation causes smooth muscle contraction → vasoconstriction; beta-1 receptors in the heart respond with increased rate and force of contraction.",
                citationIDs: ["openfda_norepinephrine", "openrn_pharm_ch4", "openstax_pharm_22_3"]
            ),
            dosing: [
                DosingBlock(
                    label: "Initial",
                    body: "0.25 mL to 0.375 mL (8 mcg to 12 mcg of base) per minute, adjusted to maintain systolic blood pressure of 80–100 mmHg.",
                    citationIDs: ["openfda_norepinephrine"]
                ),
                DosingBlock(
                    label: "Maintenance",
                    body: "0.0625 mL to 0.125 mL (2 mcg to 4 mcg of base) per minute.",
                    citationIDs: ["openfda_norepinephrine"]
                ),
                DosingBlock(
                    label: "Dilution",
                    body: "Dilute prior to use in 1,000 mL of 5% dextrose injection or 5% dextrose with sodium chloride.",
                    citationIDs: ["openfda_norepinephrine"]
                ),
                DosingBlock(
                    label: "Discontinuation",
                    body: "Reduce infusion rate gradually upon discontinuation.",
                    citationIDs: ["openfda_norepinephrine"]
                )
            ],
            contraindications: AttributedProse(
                "None listed per FDA labeling. Open RN guidance adds that norepinephrine is contraindicated for use in fingers, toes, ears, nose, or genitalia when used with local anesthetic due to vasoconstrictive action.",
                citationIDs: ["openfda_norepinephrine", "openrn_pharm_ch4"]
            ),
            warnings: [
                AttributedBullet("Tissue ischemia and extravasation may cause necrosis. Phentolamine, an alpha-adrenergic antagonist, is the reversal agent. If extravasation occurs, immediately stop IV administration and follow agency policy.", citationIDs: ["openfda_norepinephrine", "openrn_pharm_ch4"]),
                AttributedBullet("Hypotension after abrupt discontinuation — taper, do not stop suddenly.", citationIDs: ["openfda_norepinephrine"]),
                AttributedBullet("Cardiac arrhythmias.", citationIDs: ["openfda_norepinephrine"]),
                AttributedBullet("Allergic reactions with sulfite sensitivity.", citationIDs: ["openfda_norepinephrine"]),
                AttributedBullet("Avoid infusions into the veins of the leg in the elderly or in patients with occlusive vascular disease.", citationIDs: ["openfda_norepinephrine"]),
                AttributedBullet("Administer with caution to the elderly and those with preexisting cardiovascular disease.", citationIDs: ["openrn_pharm_ch4"])
            ],
            adverseReactions: AttributedProse(
                "Most common: hypertension and bradycardia. Others: anxiety, headache, respiratory difficulty, pulmonary edema, extravasation necrosis, tissue ischemia in clients who are hypovolemic, gangrene in clients with occlusive or thrombotic vascular disease (in high doses), rebound hypotension after discontinuation, decreased insulin sensitivity / hyperglycemia.",
                citationIDs: ["openfda_norepinephrine", "openstax_pharm_22_3"]
            ),
            drugInteractions: [
                AttributedBullet("MAOIs or tricyclic antidepressants — severe, prolonged hypertension.", citationIDs: ["openfda_norepinephrine", "openstax_pharm_22_3"]),
                AttributedBullet("Halogenated anesthetics — ventricular tachycardia or fibrillation.", citationIDs: ["openfda_norepinephrine", "openstax_pharm_22_3"]),
                AttributedBullet("Caffeine — food interaction.", citationIDs: ["openstax_pharm_22_3"]),
                AttributedBullet("Norepinephrine can decrease insulin sensitivity.", citationIDs: ["openfda_norepinephrine"])
            ],
            nursingImplications: [
                AttributedBullet("Place client on continuous cardiac monitoring.", citationIDs: ["openstax_pharm_22_3"]),
                AttributedBullet("Monitor heart rate frequently.", citationIDs: ["openstax_pharm_22_3"]),
                AttributedBullet("Monitor level of consciousness.", citationIDs: ["openstax_pharm_22_3"]),
                AttributedBullet("Have resuscitative equipment available.", citationIDs: ["openstax_pharm_22_3"]),
                AttributedBullet("Assess the IV site frequently for signs of extravasation.", citationIDs: ["openstax_pharm_22_3"]),
                AttributedBullet("Correct hypovolemia before giving norepinephrine.", citationIDs: ["openstax_pharm_22_3"]),
                AttributedBullet("If extravasation occurs, immediately stop IV administration and follow agency policy; phentolamine is the reversal agent.", citationIDs: ["openrn_pharm_ch4"]),
                AttributedBullet("Monitor blood pressure, heart rate, and respiratory rate closely; if blood pressure increases sharply, give rapid-acting vasodilators per provider order.", citationIDs: ["openrn_pharm_ch4"]),
                AttributedBullet("Monitor blood glucose in clients with diabetes — adrenergic agents can cause hyperglycemia via beta-2 activation.", citationIDs: ["openrn_pharm_ch4"]),
                AttributedBullet("Provide drug education and instruct the client to alert the healthcare team of any status changes or IV site discomfort.", citationIDs: ["openstax_pharm_22_3"])
            ],
            patientTeaching: AttributedProse(
                "Alert the healthcare team of any status changes or IV site discomfort or pain.",
                citationIDs: ["openstax_pharm_22_3"]
            ),
            citations: [openfda, openrn, openstax, ismp],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
