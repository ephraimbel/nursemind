import Foundation

public enum HeparinSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_heparin",
            shortName: "FDA Structured Product Labeling — Heparin Sodium",
            detail: "SET ID: 02fb700d-a28c-4d45-b78d-382dc0d5986c",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_anticoagulants",
            shortName: "Open RN Nursing Pharmacology — Anticoagulant Therapy chapter",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )
        let openstax = CitationSource(
            id: "openstax_pharm_anticoagulants",
            shortName: "OpenStax Pharmacology for Nurses — Anticoagulants",
            detail: "Barbour-Taylor T, Mueller (Sabato) L, Paris D, Weaver D · 2024",
            publisher: "OpenStax · Rice University",
            license: .ccBy4WithAIRestriction,
            url: "https://openstax.org/books/pharmacology/pages/1-introduction",
            lastRetrieved: "2026-05-03"
        )
        let ismp = CitationSource(
            id: "ismp_high_alert_2024",
            shortName: "ISMP List of High-Alert Medications in Acute Care, 2024",
            detail: "Concept citation only — anticoagulants are an ISMP high-alert class",
            publisher: "Institute for Safe Medication Practices",
            license: .factCitationOnly,
            url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "heparin",
            title: "Heparin",
            subtitle: "heparin sodium · anticoagulant",
            category: "Anticoagulant",
            isHighAlert: true,
            quickReference: [
                KeyValueRow(key: "Class", value: "Indirect thrombin inhibitor"),
                KeyValueRow(key: "Onset", value: "Immediate (IV); 20–60 min (SC)"),
                KeyValueRow(key: "Half-life", value: "1–2 hours"),
                KeyValueRow(key: "Monitoring", value: "aPTT, anti-Xa, platelets")
            ],
            indications: AttributedProse(
                "Prophylaxis and treatment of venous thrombosis and pulmonary embolism. Prevention of postoperative DVT/PE. Atrial fibrillation with embolization. DIC treatment. Prevention of clotting in arterial/cardiac surgery. Anticoagulant use in transfusions, extracorporeal circulation, and dialysis.",
                citationIDs: ["openfda_heparin"]
            ),
            mechanism: AttributedProse(
                "Heparin enhances antithrombin III activity, inhibiting coagulation factors Xa and IIa.",
                citationIDs: ["openfda_heparin"]
            ),
            dosing: [
                DosingBlock(
                    label: "IV bolus + continuous",
                    body: "5,000 units initial bolus, then 20,000–40,000 units per 24 hours by continuous infusion.",
                    citationIDs: ["openfda_heparin"]
                ),
                DosingBlock(
                    label: "Intermittent IV",
                    body: "10,000 units initial; 5,000–10,000 units every 4–6 hours.",
                    citationIDs: ["openfda_heparin"]
                ),
                DosingBlock(
                    label: "Deep subcutaneous",
                    body: "5,000 units IV, then 10,000–20,000 units SC; 8,000–10,000 units every 8 hours, or 15,000–20,000 units every 12 hours.",
                    citationIDs: ["openfda_heparin"]
                )
            ],
            contraindications: AttributedProse(
                "History of heparin-induced thrombocytopenia (HIT/HITTS); hypersensitivity to heparin or pork; inability to monitor coagulation; uncontrolled active bleeding (except in DIC); severe thrombocytopenia.",
                citationIDs: ["openfda_heparin"]
            ),
            warnings: [
                AttributedBullet("Fatal hemorrhages have occurred — use caution in conditions with high bleed risk.", citationIDs: ["openfda_heparin"]),
                AttributedBullet("HIT/HITTS risk — monitor platelet counts, discontinue if platelet count <100,000/mm³.", citationIDs: ["openfda_heparin"]),
                AttributedBullet("Do not use benzyl alcohol-preserved heparin in neonates and infants.", citationIDs: ["openfda_heparin"]),
                AttributedBullet("Hyperkalemia risk — measure potassium before therapy and periodically.", citationIDs: ["openfda_heparin"]),
                AttributedBullet("Avoid intramuscular injection; risk of hematoma at injection site.", citationIDs: ["openfda_heparin"])
            ],
            adverseReactions: AttributedProse(
                "Most common: hemorrhage, thrombocytopenia, HIT/HITTS, injection site irritation, hypersensitivity reactions, elevated aminotransferases.",
                citationIDs: ["openfda_heparin"]
            ),
            drugInteractions: [
                AttributedBullet("NSAIDs, dextran, thienopyridines, dipyridamole — increased bleeding risk.", citationIDs: ["openfda_heparin"]),
                AttributedBullet("Digitalis, tetracyclines, nicotine — may reduce anticoagulant effect.", citationIDs: ["openfda_heparin"]),
                AttributedBullet("IV nitroglycerin — decreases aPTT.", citationIDs: ["openfda_heparin"]),
                AttributedBullet("Antithrombin III — enhances heparin effect.", citationIDs: ["openfda_heparin"])
            ],
            nursingImplications: [
                AttributedBullet("Monitor aPTT (target 1.5–2.5× control) or anti-Xa per facility protocol; check baseline before therapy.", citationIDs: ["openrn_pharm_anticoagulants", "openstax_pharm_anticoagulants"]),
                AttributedBullet("Monitor platelet count at baseline, then periodically; HIT typically appears 5–10 days after exposure.", citationIDs: ["openrn_pharm_anticoagulants"]),
                AttributedBullet("Monitor for bleeding: bruising, hematuria, melena, gum/nose bleeds, occult blood.", citationIDs: ["openrn_pharm_anticoagulants", "openstax_pharm_anticoagulants"]),
                AttributedBullet("Have protamine sulfate available as the reversal agent — 1 mg neutralizes ~100 units of heparin.", citationIDs: ["openrn_pharm_anticoagulants"]),
                AttributedBullet("Two-nurse independent verification of dose and rate before administration (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
                AttributedBullet("Avoid IM injections; apply pressure to venipuncture sites for 5–10 minutes.", citationIDs: ["openrn_pharm_anticoagulants"]),
                AttributedBullet("Rotate SC injection sites; do not aspirate or rub site after injection.", citationIDs: ["openrn_pharm_anticoagulants"])
            ],
            patientTeaching: AttributedProse(
                "Report any unusual bleeding, bruising, blood in urine or stool, severe headache, or signs of stroke immediately. Use a soft toothbrush and electric razor to reduce bleeding risk. Inform all healthcare providers (including dental) about heparin therapy.",
                citationIDs: ["openrn_pharm_anticoagulants", "openstax_pharm_anticoagulants"]
            ),
            citations: [openfda, openrn, openstax, ismp],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
