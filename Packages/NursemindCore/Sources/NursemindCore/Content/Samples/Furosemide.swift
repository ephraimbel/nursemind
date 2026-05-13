import Foundation

public enum FurosemideSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_furosemide",
            shortName: "FDA Structured Product Labeling — Furosemide",
            detail: "SET ID: 01a5f094-b473-4e46-9e61-69d5ec6dd766",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_diuretics",
            shortName: "Open RN Nursing Pharmacology — Diuretics chapter",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )
        let openstax = CitationSource(
            id: "openstax_pharm_diuretics",
            shortName: "OpenStax Pharmacology for Nurses — Loop Diuretics",
            publisher: "OpenStax · Rice University",
            license: .ccBy4WithAIRestriction,
            url: "https://openstax.org/books/pharmacology/pages/1-introduction",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "furosemide",
            title: "Furosemide",
            subtitle: "Lasix · loop diuretic",
            category: "Loop Diuretic",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Loop diuretic"),
                KeyValueRow(key: "Onset", value: "5 min (IV); 30–60 min (PO)"),
                KeyValueRow(key: "Duration", value: "2 hr (IV); 6–8 hr (PO)"),
                KeyValueRow(key: "Half-life", value: "~2 hours")
            ],
            indications: AttributedProse(
                "Treatment of edema associated with congestive heart failure, cirrhosis, and renal disease; management of hypertension in adults.",
                citationIDs: ["openfda_furosemide"]
            ),
            mechanism: AttributedProse(
                "Inhibits sodium and chloride reabsorption in the proximal and distal tubules and the loop of Henle.",
                citationIDs: ["openfda_furosemide"]
            ),
            dosing: [
                DosingBlock(
                    label: "Oral edema",
                    body: "Initial 20–80 mg as a single dose; may increase by 20–40 mg every 6–8 hours; maximum 600 mg/day for severe cases.",
                    citationIDs: ["openfda_furosemide"]
                ),
                DosingBlock(
                    label: "Hypertension",
                    body: "Initial 80 mg, typically 40 mg twice daily; adjust per response.",
                    citationIDs: ["openfda_furosemide"]
                )
            ],
            contraindications: AttributedProse(
                "Furosemide tablets are contraindicated in patients with anuria and in patients with a history of hypersensitivity to furosemide.",
                citationIDs: ["openfda_furosemide"]
            ),
            warnings: [
                AttributedBullet("Boxed warning: furosemide is a potent diuretic which, if given in excessive amounts, can lead to a profound diuresis with water and electrolyte depletion.", citationIDs: ["openfda_furosemide"]),
                AttributedBullet("Excessive diuresis may cause dehydration, circulatory collapse, and thrombosis.", citationIDs: ["openfda_furosemide"]),
                AttributedBullet("Hypokalemia risk — monitor for signs of electrolyte imbalance.", citationIDs: ["openfda_furosemide"]),
                AttributedBullet("Ototoxicity risk with rapid IV injection or in renal impairment; hearing impairment and deafness have been reported.", citationIDs: ["openfda_furosemide"]),
                AttributedBullet("Hypersensitivity to sulfonamides — possible cross-sensitivity (furosemide has a sulfonamide group).", citationIDs: ["openfda_furosemide"])
            ],
            adverseReactions: AttributedProse(
                "Common: diarrhea, nausea, vomiting, anorexia, hypotension, tinnitus, hyperglycemia, hypokalemia.",
                citationIDs: ["openfda_furosemide"]
            ),
            drugInteractions: [
                AttributedBullet("Aminoglycosides and ethacrynic acid — additive ototoxicity; avoid combination.", citationIDs: ["openfda_furosemide"]),
                AttributedBullet("ACE inhibitors and ARBs — risk of severe hypotension, especially with first dose.", citationIDs: ["openfda_furosemide"]),
                AttributedBullet("Lithium — reduced lithium clearance, risk of toxicity.", citationIDs: ["openfda_furosemide"]),
                AttributedBullet("NSAIDs — may reduce diuretic and antihypertensive efficacy.", citationIDs: ["openfda_furosemide"])
            ],
            nursingImplications: [
                AttributedBullet("Monitor strict intake and output; expect rapid diuresis (1–2 L) within first 30–60 minutes after IV.", citationIDs: ["openrn_pharm_diuretics", "openstax_pharm_diuretics"]),
                AttributedBullet("Daily weights at the same time, same scale, same clothing — most reliable measure of fluid status.", citationIDs: ["openrn_pharm_diuretics"]),
                AttributedBullet("Monitor electrolytes — especially potassium, magnesium, sodium, and chloride; hypokalemia can precipitate digoxin toxicity.", citationIDs: ["openrn_pharm_diuretics", "openstax_pharm_diuretics"]),
                AttributedBullet("Monitor blood pressure (lying and standing) and heart rate; assess for orthostatic hypotension.", citationIDs: ["openrn_pharm_diuretics"]),
                AttributedBullet("Administer IV slowly — no faster than 4 mg/min — to reduce ototoxicity risk.", citationIDs: ["openrn_pharm_diuretics"]),
                AttributedBullet("Time PO doses early in the day to avoid nocturia.", citationIDs: ["openrn_pharm_diuretics"]),
                AttributedBullet("Assess for muscle cramps, weakness, irregular pulse — signs of hypokalemia.", citationIDs: ["openrn_pharm_diuretics"])
            ],
            patientTeaching: AttributedProse(
                "Take in the morning to avoid sleep disruption from urination. Rise slowly from sitting or lying to avoid dizziness. Eat potassium-rich foods (bananas, oranges, potatoes) unless restricted. Report rapid weight gain, severe dizziness, hearing changes, or muscle cramps. Wear sunscreen — increased photosensitivity.",
                citationIDs: ["openrn_pharm_diuretics", "openstax_pharm_diuretics"]
            ),
            citations: [openfda, openrn, openstax],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
