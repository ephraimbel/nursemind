import Foundation

public enum CeftriaxoneSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_ceftriaxone",
            shortName: "FDA SPL — Ceftriaxone (Rocephin)",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_cephalosporins",
            shortName: "Open RN Nursing Pharmacology — Anti-infectives: Cephalosporins",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "ceftriaxone",
            title: "Ceftriaxone",
            subtitle: "Rocephin · third-generation cephalosporin",
            category: "Antibiotic — Cephalosporin",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "3rd-generation cephalosporin"),
                KeyValueRow(key: "Onset", value: "Bactericidal (rapid)"),
                KeyValueRow(key: "Half-life", value: "5–9 hr (long — once-daily dosing)"),
                KeyValueRow(key: "Penetration", value: "CNS (good — used for meningitis)")
            ],
            indications: AttributedProse(
                "Empiric and targeted therapy for community-acquired pneumonia, complicated UTI, pyelonephritis, meningitis, gonorrhea, intra-abdominal infections, and surgical prophylaxis. Broad gram-positive and gram-negative coverage.",
                citationIDs: ["openfda_ceftriaxone"]
            ),
            mechanism: AttributedProse(
                "Inhibits bacterial cell-wall synthesis by binding penicillin-binding proteins, leading to lysis. Bactericidal.",
                citationIDs: ["openfda_ceftriaxone"]
            ),
            dosing: [
                DosingBlock(label: "Adult IV/IM (typical)", body: "1–2 g once daily; 2 g every 12 hours for meningitis (max 4 g/day).", citationIDs: ["openfda_ceftriaxone"]),
                DosingBlock(label: "Gonorrhea", body: "500 mg IM × 1 dose (1 g if ≥150 kg).", citationIDs: ["openfda_ceftriaxone"]),
                DosingBlock(label: "Surgical prophylaxis", body: "1 g IV within 60 minutes of incision.", citationIDs: ["openfda_ceftriaxone"])
            ],
            contraindications: AttributedProse(
                "Hypersensitivity to ceftriaxone or any cephalosporin. Neonates with hyperbilirubinemia (displaces bilirubin from albumin → kernicterus). Concurrent IV calcium-containing products in neonates (precipitation).",
                citationIDs: ["openfda_ceftriaxone"]
            ),
            warnings: [
                AttributedBullet("Cross-reactivity with penicillin allergy — ~1–10%; severe penicillin allergy is a relative contraindication.", citationIDs: ["openfda_ceftriaxone"]),
                AttributedBullet("Clostridioides difficile colitis — can occur during or up to 2 months after therapy.", citationIDs: ["openfda_ceftriaxone"]),
                AttributedBullet("Hemolytic anemia — rare but reported; monitor CBC in prolonged therapy.", citationIDs: ["openfda_ceftriaxone"]),
                AttributedBullet("Biliary pseudolithiasis — gallbladder sludging on imaging; usually asymptomatic and reversible.", citationIDs: ["openfda_ceftriaxone"])
            ],
            adverseReactions: AttributedProse(
                "Common: diarrhea, injection site pain, rash, eosinophilia, thrombocytosis. Serious: anaphylaxis, C. difficile colitis, severe skin reactions (SJS, TEN, DRESS).",
                citationIDs: ["openfda_ceftriaxone"]
            ),
            drugInteractions: [
                AttributedBullet("Calcium-containing IV solutions (lactated Ringer's) — precipitation; do not co-administer in neonates; in adults, flush the line between.", citationIDs: ["openfda_ceftriaxone"]),
                AttributedBullet("Probenecid — minimal effect (unlike other cephalosporins).", citationIDs: ["openfda_ceftriaxone"]),
                AttributedBullet("Warfarin — possible increased INR; monitor.", citationIDs: ["openfda_ceftriaxone"])
            ],
            nursingImplications: [
                AttributedBullet("Verify allergies — ask specifically about penicillin/cephalosporin reactions and what happened.", citationIDs: ["openrn_pharm_cephalosporins"]),
                AttributedBullet("Reconstitute per protocol; IM doses are painful — consider lidocaine diluent if not contraindicated.", citationIDs: ["openrn_pharm_cephalosporins"]),
                AttributedBullet("IV: infuse over 30 minutes; flush line with saline before and after if calcium-containing fluids are also infusing.", citationIDs: ["openrn_pharm_cephalosporins", "openfda_ceftriaxone"]),
                AttributedBullet("Monitor for new-onset diarrhea — could be C. difficile; do not give antimotility agents until ruled out.", citationIDs: ["openrn_pharm_cephalosporins"]),
                AttributedBullet("Cultures BEFORE first dose when possible; subsequent doses without waiting for results.", citationIDs: ["openrn_pharm_cephalosporins"])
            ],
            patientTeaching: AttributedProse(
                "Complete the full course even if you feel better. Report severe diarrhea, rash, swelling, or breathing difficulty immediately. Tell all providers about your antibiotic course.",
                citationIDs: ["openrn_pharm_cephalosporins"]
            ),
            citations: [openfda, openrn],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
