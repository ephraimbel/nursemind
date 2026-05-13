import Foundation

public enum VancomycinSample {
    public static let entry: DrugEntry = {
        let openfda = CitationSource(
            id: "openfda_vancomycin",
            shortName: "FDA SPL — Vancomycin Hydrochloride",
            detail: "SET ID: 00946db3-d6c5-4534-a870-1ec6e63eda43",
            publisher: "openFDA Drug Label API",
            license: .cc0,
            url: "https://api.fda.gov/drug/label.json",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_pharm_antibiotics",
            shortName: "Open RN Nursing Pharmacology — Anti-infectives: Glycopeptides",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
            lastRetrieved: "2026-05-03"
        )

        return DrugEntry(
            id: "vancomycin",
            title: "Vancomycin",
            subtitle: "Vancocin · glycopeptide antibiotic",
            category: "Antibiotic — Glycopeptide",
            isHighAlert: false,
            quickReference: [
                KeyValueRow(key: "Class", value: "Glycopeptide antibiotic"),
                KeyValueRow(key: "Onset", value: "Bactericidal (slow)"),
                KeyValueRow(key: "Half-life", value: "4–11 hr (longer in renal impairment)"),
                KeyValueRow(key: "Therapeutic trough", value: "10–20 mcg/mL")
            ],
            indications: AttributedProse(
                "Treatment of serious or severe infections caused by susceptible strains of methicillin-resistant Staphylococcus aureus (MRSA) and other gram-positive organisms. Oral form for Clostridioides difficile-associated colitis.",
                citationIDs: ["openfda_vancomycin"]
            ),
            mechanism: AttributedProse(
                "Bactericidal — inhibits bacterial cell-wall biosynthesis and disrupts bacterial membrane permeability.",
                citationIDs: ["openfda_vancomycin"]
            ),
            dosing: [
                DosingBlock(label: "IV (typical adult)", body: "500 mg every 6 hours OR 1 g every 12 hours. Infuse over at least 60 minutes (rate ≤10 mg/min) — faster infusion causes red-man syndrome.", citationIDs: ["openfda_vancomycin"]),
                DosingBlock(label: "Weight-based dosing", body: "Modern protocols use 15–20 mg/kg actual body weight every 8–12 hours, adjusted by trough levels and renal function.", citationIDs: ["openrn_pharm_antibiotics"]),
                DosingBlock(label: "PO — C. difficile", body: "125–500 mg by mouth four times daily for 10 days. Oral vancomycin is not absorbed systemically.", citationIDs: ["openfda_vancomycin"])
            ],
            contraindications: AttributedProse(
                "Known hypersensitivity to vancomycin.",
                citationIDs: ["openfda_vancomycin"]
            ),
            warnings: [
                AttributedBullet("Nephrotoxicity — risk increases with elevated trough levels, prolonged therapy, or concurrent nephrotoxic drugs.", citationIDs: ["openfda_vancomycin"]),
                AttributedBullet("Ototoxicity — transient or permanent hearing loss; greatest risk in elderly, renal impairment, or with aminoglycoside concurrency.", citationIDs: ["openfda_vancomycin"]),
                AttributedBullet("Infusion reactions / red-man syndrome — flushing, pruritus, hypotension from histamine release with rapid infusion. Slow the rate, give antihistamine, do not confuse with allergy.", citationIDs: ["openfda_vancomycin"]),
                AttributedBullet("Severe dermatologic reactions — TEN, SJS, DRESS, AGEP — discontinue immediately if suspected.", citationIDs: ["openfda_vancomycin"]),
                AttributedBullet("C. difficile-associated diarrhea (paradoxically) can occur with parenteral vancomycin and present months after therapy.", citationIDs: ["openfda_vancomycin"])
            ],
            adverseReactions: AttributedProse(
                "Common: infusion-related reactions (red-man, hypotension, urticaria), nephrotoxicity, ototoxicity, neutropenia, phlebitis, anaphylaxis.",
                citationIDs: ["openfda_vancomycin"]
            ),
            drugInteractions: [
                AttributedBullet("Aminoglycosides — synergistic gram-positive coverage, but additive nephrotoxicity and ototoxicity. Monitor renal function and audiology.", citationIDs: ["openfda_vancomycin"]),
                AttributedBullet("Anesthetic agents — increased erythema and histamine-like flushing; anaphylactoid reactions reported.", citationIDs: ["openfda_vancomycin"]),
                AttributedBullet("Other nephrotoxic drugs (amphotericin B, cisplatin, polymyxin B, IV contrast) — monitor renal function more frequently.", citationIDs: ["openfda_vancomycin"])
            ],
            nursingImplications: [
                AttributedBullet("Use a central line or large peripheral vein when possible — vancomycin is a vesicant; phlebitis is common.", citationIDs: ["openrn_pharm_antibiotics"]),
                AttributedBullet("Infuse over AT LEAST 60 minutes (1 hour for 1 g, 90 min for 1.5 g). Rapid infusion → red-man syndrome.", citationIDs: ["openfda_vancomycin", "openrn_pharm_antibiotics"]),
                AttributedBullet("Obtain trough level (immediately before next dose) per protocol — typically before 4th dose. Goal 10–20 mcg/mL for most infections; 15–20 for serious MRSA.", citationIDs: ["openrn_pharm_antibiotics"]),
                AttributedBullet("Monitor BUN, creatinine, urine output — daily during therapy; more often if elevated baseline or other nephrotoxic drugs.", citationIDs: ["openrn_pharm_antibiotics"]),
                AttributedBullet("Monitor for ototoxicity — tinnitus, vertigo, hearing changes; report immediately.", citationIDs: ["openrn_pharm_antibiotics"]),
                AttributedBullet("If red-man occurs: STOP infusion, slow rate, give diphenhydramine per provider, restart at slower rate. NOT a true allergy.", citationIDs: ["openrn_pharm_antibiotics"]),
                AttributedBullet("Oral vancomycin (for C. diff) is NOT systemically absorbed — does not require trough monitoring.", citationIDs: ["openrn_pharm_antibiotics"])
            ],
            patientTeaching: AttributedProse(
                "Report ringing in the ears, hearing changes, dizziness, decreased urine output, severe diarrhea, or rash. Complete the full course even if you feel better. Maintain adequate hydration.",
                citationIDs: ["openrn_pharm_antibiotics"]
            ),
            citations: [openfda, openrn],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
