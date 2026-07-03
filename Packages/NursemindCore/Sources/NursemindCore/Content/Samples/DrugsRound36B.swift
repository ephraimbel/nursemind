import Foundation

// Curator-model drug entries (round 36B — tier-2 by-name gaps, part 2).
// tizanidine (the CYP1A2 trap), meclizine (vertigo staple + Beers), benzonatate
// (the swallow-whole safety story), fosphenytoin (PE-dosing error surface).
// Sources: openFDA SPL (public domain), Open RN Pharmacology (CC BY 4.0),
// ISMP concept citation for fosphenytoin.

private let openfdaR36B = CitationSource(
    id: "openfda_round36b",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-07-03"
)
private let openrnPharmR36B = CitationSource(
    id: "openrn_pharm_round36b",
    shortName: "Open RN Pharmacology + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-07-03"
)
private let ismpR36B = CitationSource(
    id: "ismp_round36b",
    shortName: "ISMP List of High-Alert Medications, 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-07-03"
)

// MARK: - Tizanidine

public enum TizanidineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tizanidine",
        title: "Tizanidine",
        subtitle: "Zanaflex · central muscle relaxant · the ciprofloxacin trap",
        category: "Muscle Relaxant (Alpha-2 Agonist)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Central alpha-2 agonist (dexmedetomidine's oral cousin)"),
            KeyValueRow(key: "Duration", value: "Short — dose to the activity that needs it"),
            KeyValueRow(key: "Contraindicated with", value: "Ciprofloxacin, fluvoxamine (CYP1A2)"),
            KeyValueRow(key: "Monitor", value: "BP, sedation, LFTs")
        ],
        indications: AttributedProse(
            "Spasticity (multiple sclerosis, spinal cord injury) and, in wide practice, painful muscle spasm. Its short duration is a feature: it can be timed to the activities and hours where spasticity costs the most, without round-the-clock sedation.",
            citationIDs: ["openfda_round36b"]
        ),
        mechanism: AttributedProse(
            "Central alpha-2 adrenergic agonism (the same receptor pharmacology as clonidine and dexmedetomidine) reduces excitatory output to motor neurons — less spasticity, with hypotension and sedation as mechanism-based side effects rather than surprises.",
            citationIDs: ["openfda_round36b", "openrn_pharm_round36b"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "2–4 mg PO every 6–8 hours as needed per label; titrate gradually; label maximum 36 mg/day in three divided doses.", citationIDs: ["openfda_round36b"]),
            DosingBlock(label: "Consistency rule", body: "Take consistently with or without food — switching changes absorption enough to matter; capsules and tablets are not interchangeable at steady state.", citationIDs: ["openfda_round36b"]),
            DosingBlock(label: "Renal/hepatic impairment", body: "Reduce; monitor closely.", citationIDs: ["openfda_round36b"])
        ],
        contraindications: AttributedProse(
            "Concurrent ciprofloxacin or fluvoxamine — potent CYP1A2 inhibition multiplies tizanidine levels and causes profound hypotension and sedation.",
            citationIDs: ["openfda_round36b"]
        ),
        warnings: [
            AttributedBullet("The CYP1A2 trap is the classic error: a routine ciprofloxacin prescription for a UTI in a patient on tizanidine produces severe hypotension — the interaction is contraindicated, not merely cautioned.", citationIDs: ["openfda_round36b"]),
            AttributedBullet("Hypotension is dose-related and additive with antihypertensives — check BP with titration.", citationIDs: ["openfda_round36b"]),
            AttributedBullet("Hepatotoxicity — periodic LFTs per label during the first months and with dose increases.", citationIDs: ["openfda_round36b"]),
            AttributedBullet("Abrupt discontinuation after sustained higher doses → rebound hypertension, tachycardia, and spasticity (alpha-2 withdrawal, like clonidine); taper.", citationIDs: ["openfda_round36b"])
        ],
        adverseReactions: AttributedProse(
            "Somnolence, dry mouth, hypotension, dizziness, asthenia, bradycardia, elevated transaminases, hallucinations (uncommon).",
            citationIDs: ["openfda_round36b"]
        ),
        drugInteractions: [
            AttributedBullet("Ciprofloxacin, fluvoxamine — contraindicated (CYP1A2).", citationIDs: ["openfda_round36b"]),
            AttributedBullet("Other CYP1A2 inhibitors (some antiarrhythmics, oral contraceptives) — raise levels; use caution.", citationIDs: ["openfda_round36b"]),
            AttributedBullet("Antihypertensives and clonidine — additive hypotension/bradycardia.", citationIDs: ["openfda_round36b"]),
            AttributedBullet("CNS depressants and alcohol — additive sedation.", citationIDs: ["openfda_round36b"])
        ],
        nursingImplications: [
            AttributedBullet("Cross-check every new antibiotic order against tizanidine — ciprofloxacin is the interaction nurses catch.", citationIDs: ["openrn_pharm_round36b"]),
            AttributedBullet("Orthostatic vitals with initiation and titration; fall precautions.", citationIDs: ["openrn_pharm_round36b"]),
            AttributedBullet("Confirm LFT monitoring is scheduled on chronic therapy.", citationIDs: ["openrn_pharm_round36b"]),
            AttributedBullet("Teach dose-to-activity timing rather than fixed maximal dosing when PRN.", citationIDs: ["openrn_pharm_round36b"])
        ],
        patientTeaching: AttributedProse(
            "Take it the same way every time — always with food or always without. It can drop your blood pressure and make you drowsy, so rise slowly and don't drive until you know its effect. Tell every prescriber you take it: the antibiotic ciprofloxacin must never be combined with it.",
            citationIDs: ["openrn_pharm_round36b"]
        ),
        citations: [openfdaR36B, openrnPharmR36B],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Meclizine

public enum MeclizineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "meclizine",
        title: "Meclizine",
        subtitle: "Antivert · Bonine · vertigo and motion-sickness antihistamine",
        category: "Antihistamine (Antivertigo)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "First-generation H1 antihistamine + anticholinergic"),
            KeyValueRow(key: "Onset", value: "~1 hr; duration 8–24 hr"),
            KeyValueRow(key: "Motion sickness", value: "Take 1 hr BEFORE travel — prevention beats rescue"),
            KeyValueRow(key: "Older adults", value: "Beers-criteria anticholinergic")
        ],
        indications: AttributedProse(
            "Vertigo associated with vestibular disorders, and prevention/treatment of motion sickness. A default first prescription for dizziness — which is exactly why its limits matter: it treats vestibular symptoms, and 'dizziness' that is actually presyncope, arrhythmia, or stroke needs a different conversation.",
            citationIDs: ["openfda_round36b", "openrn_pharm_round36b"]
        ),
        mechanism: AttributedProse(
            "H1 antihistamine with anticholinergic activity — dampens vestibular input and the vomiting-center response to it. The anticholinergic half of the mechanism is also the side-effect profile: dry mouth, blurred vision, retention, confusion.",
            citationIDs: ["openfda_round36b"]
        ),
        dosing: [
            DosingBlock(label: "Vertigo", body: "25–100 mg/day in divided doses per label.", citationIDs: ["openfda_round36b"]),
            DosingBlock(label: "Motion sickness", body: "25–50 mg one hour before departure, repeated every 24 hours as needed per label.", citationIDs: ["openfda_round36b"])
        ],
        contraindications: AttributedProse(
            "Known hypersensitivity. Caution in narrow-angle glaucoma, prostatic hypertrophy/urinary retention, and asthma per label.",
            citationIDs: ["openfda_round36b"]
        ),
        warnings: [
            AttributedBullet("Sedation — additive with alcohol, opioids, benzodiazepines; driving warnings are real.", citationIDs: ["openfda_round36b"]),
            AttributedBullet("Anticholinergic burden in older adults — confusion, retention, constipation, falls; a Beers-criteria drug that frequently rides along unquestioned on vertigo complaints.", citationIDs: ["openrn_pharm_round36b"]),
            AttributedBullet("Symptom masking — suppressing vertigo can delay diagnosis of central causes; new or atypical vertigo deserves assessment, not just a refill.", citationIDs: ["openrn_pharm_round36b"])
        ],
        adverseReactions: AttributedProse(
            "Drowsiness, dry mouth, blurred vision, constipation, urinary retention, confusion (elderly).",
            citationIDs: ["openfda_round36b"]
        ),
        drugInteractions: [
            AttributedBullet("CNS depressants and alcohol — additive sedation.", citationIDs: ["openfda_round36b"]),
            AttributedBullet("Other anticholinergics — additive burden.", citationIDs: ["openfda_round36b"])
        ],
        nursingImplications: [
            AttributedBullet("Characterize the 'dizziness' before medicating — spinning (vestibular) vs. lightheaded-on-standing (orthostatic) vs. unsteady (neurologic) route to different workups.", citationIDs: ["openrn_pharm_round36b"]),
            AttributedBullet("Fall precautions, especially in older adults; review the total anticholinergic load.", citationIDs: ["openrn_pharm_round36b"]),
            AttributedBullet("For motion sickness, teach the before-travel timing — it prevents far better than it rescues.", citationIDs: ["openrn_pharm_round36b"])
        ],
        patientTeaching: AttributedProse(
            "For travel, take it an hour before you leave — it works much better as prevention. It causes drowsiness and dry mouth; skip alcohol and be careful driving. If your dizziness changes character or comes with weakness, vision changes, or trouble speaking, that's an emergency, not a pill adjustment.",
            citationIDs: ["openrn_pharm_round36b"]
        ),
        citations: [openfdaR36B, openrnPharmR36B],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Benzonatate

public enum BenzonatateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "benzonatate",
        title: "Benzonatate",
        subtitle: "Tessalon Perles · swallow whole, every time — the chewed capsule is an airway emergency",
        category: "Antitussive (Peripheral)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Peripheral antitussive (ester local anesthetic relative)"),
            KeyValueRow(key: "Onset", value: "15–20 min; duration 3–8 hr"),
            KeyValueRow(key: "The rule", value: "Swallow whole — never chew, suck, or dissolve"),
            KeyValueRow(key: "Children", value: "Small ingestions can be fatal under age 10")
        ],
        indications: AttributedProse(
            "Symptomatic relief of cough — one of the most-prescribed cough suppressants because it avoids opioid effects. Its entire safety story lives in one instruction: the capsule must be swallowed intact.",
            citationIDs: ["openfda_round36b"]
        ),
        mechanism: AttributedProse(
            "Chemically related to ester local anesthetics (tetracaine family) — anesthetizes stretch receptors in the airways and lung, damping the cough reflex peripherally. Released in the mouth, the same anesthesia hits the oropharynx: numbness, loss of gag and swallow protection, choking, and laryngospasm.",
            citationIDs: ["openfda_round36b"]
        ),
        dosing: [
            DosingBlock(label: "Adults and children over 10", body: "100–200 mg PO three times daily as needed per label; maximum 600 mg/day.", citationIDs: ["openfda_round36b"]),
            DosingBlock(label: "Under 10 years", body: "Not indicated — and accidental ingestion of even one or two capsules has caused deaths in young children; storage counseling is part of prescribing.", citationIDs: ["openfda_round36b"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to benzonatate or related ester anesthetics (PABA-derived, e.g., procaine, tetracaine).",
            citationIDs: ["openfda_round36b"]
        ),
        warnings: [
            AttributedBullet("Chewed, sucked, or dissolved capsules anesthetize the mouth and throat within minutes — choking, aspiration, and laryngospasm; patients treat the soft 'perle' like a lozenge unless told otherwise.", citationIDs: ["openfda_round36b"]),
            AttributedBullet("Pediatric fatality risk: the candy-like capsules attract toddlers, and overdose causes seizures and cardiac arrest rapidly — out of reach, in original packaging.", citationIDs: ["openfda_round36b"]),
            AttributedBullet("Hypersensitivity reactions including bronchospasm and cardiovascular collapse are described, possibly related to the local-anesthetic chemistry.", citationIDs: ["openfda_round36b"])
        ],
        adverseReactions: AttributedProse(
            "Sedation, headache, dizziness, constipation, nausea, pruritus; oropharyngeal anesthesia and choking if the capsule is broken in the mouth; seizures and arrhythmias in overdose.",
            citationIDs: ["openfda_round36b"]
        ),
        drugInteractions: [
            AttributedBullet("CNS depressants — additive sedation.", citationIDs: ["openfda_round36b"])
        ],
        nursingImplications: [
            AttributedBullet("Say the swallow-whole instruction out loud with every dose and every prescription — it is the entire safety profile of this drug.", citationIDs: ["openrn_pharm_round36b"]),
            AttributedBullet("Ask about children in the home and teach storage explicitly.", citationIDs: ["openrn_pharm_round36b"]),
            AttributedBullet("If a patient reports mouth or throat numbness after a dose: NPO, suction ready, observe for airway compromise, and report.", citationIDs: ["openrn_pharm_round36b"])
        ],
        patientTeaching: AttributedProse(
            "Swallow the capsule whole with water — never chew or suck it, or your mouth and throat can go numb enough to make swallowing unsafe. Keep it strictly away from children; even one capsule can seriously harm a small child.",
            citationIDs: ["openrn_pharm_round36b"]
        ),
        citations: [openfdaR36B, openrnPharmR36B],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Fosphenytoin

public enum FosphenytoinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "fosphenytoin",
        title: "Fosphenytoin",
        subtitle: "Cerebyx · IV phenytoin prodrug · dosed in phenytoin equivalents (PE)",
        category: "Antiseizure (Hydantoin Prodrug)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Water-soluble phenytoin prodrug (IV/IM)"),
            KeyValueRow(key: "Dosing unit", value: "mg PE (phenytoin equivalents) — the error surface"),
            KeyValueRow(key: "vs. IV phenytoin", value: "Faster infusion allowed; no purple glove syndrome"),
            KeyValueRow(key: "Monitor", value: "Continuous ECG + BP during and after infusion")
        ],
        indications: AttributedProse(
            "Status epilepticus (second-line, after benzodiazepines) and short-term parenteral seizure coverage when oral phenytoin isn't possible. It exists to fix IV phenytoin's problems: no propylene-glycol vehicle, so it infuses faster with less hypotension and without the tissue necrosis (purple glove syndrome) of extravasated phenytoin.",
            citationIDs: ["openfda_round36b", "openrn_pharm_round36b"]
        ),
        mechanism: AttributedProse(
            "A phosphate ester prodrug converted by phosphatases to phenytoin — sodium-channel stabilization in rapidly firing neurons. Everything downstream (levels, interactions, toxicity) is phenytoin pharmacology; only the infusion experience differs.",
            citationIDs: ["openfda_round36b"]
        ),
        dosing: [
            DosingBlock(label: "The unit rule", body: "Always ordered, dispensed, and charted in mg PE (phenytoin equivalents). Confusing mg PE with mg of fosphenytoin — or double-converting — is the drug's classic serious error.", citationIDs: ["openfda_round36b"]),
            DosingBlock(label: "Status epilepticus (reference)", body: "Loading commonly 15–20 mg PE/kg IV per protocol, at a rate up to 150 mg PE/min per label (about three times faster than phenytoin's limit).", citationIDs: ["openfda_round36b"]),
            DosingBlock(label: "Levels", body: "Measured as phenytoin levels, timed after conversion is complete per protocol; free levels in hypoalbuminemia and renal failure.", citationIDs: ["openfda_round36b"])
        ],
        contraindications: AttributedProse(
            "Sinus bradycardia, SA block, second/third-degree AV block, Adams-Stokes syndrome. Hydantoin hypersensitivity. History of hepatotoxicity from the drug.",
            citationIDs: ["openfda_round36b"]
        ),
        warnings: [
            AttributedBullet("Cardiovascular collapse with rapid administration — the rate ceiling exists for a reason; continuous ECG and BP monitoring during and for the post-infusion window is label-mandated.", citationIDs: ["openfda_round36b"]),
            AttributedBullet("Transient intense paresthesia and groin/perineal itching-burning during infusion is characteristic and benign — slow the rate; pre-warning the patient prevents alarm.", citationIDs: ["openfda_round36b"]),
            AttributedBullet("All phenytoin toxicity applies after conversion: nystagmus → ataxia → confusion as levels climb; gingival hyperplasia and the rest with chronic use.", citationIDs: ["openrn_pharm_round36b"]),
            AttributedBullet("Serious dermatologic reactions (SJS/TEN) and the antiseizure-class suicidality warning carry over from phenytoin.", citationIDs: ["openfda_round36b"])
        ],
        adverseReactions: AttributedProse(
            "Paresthesia and pruritus (infusion), hypotension, bradycardia and arrhythmias with rapid administration, nystagmus, dizziness, ataxia, somnolence; phenytoin chronic effects thereafter.",
            citationIDs: ["openfda_round36b"]
        ),
        drugInteractions: [
            AttributedBullet("Phenytoin's full interaction catalog applies: potent CYP inducer (lowers many drugs — anticoagulants, contraceptives, other AEDs) and its own levels move with inhibitors/inducers.", citationIDs: ["openfda_round36b"]),
            AttributedBullet("Highly protein-bound — interactions and interpretation shift in hypoalbuminemia.", citationIDs: ["openfda_round36b"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification with the unit said aloud — 'milligrams P-E' — at order, pharmacy check, and pump programming (high-alert).", citationIDs: ["ismp_round36b"]),
            AttributedBullet("Continuous cardiac monitoring and frequent BP through the infusion and the post-infusion observation window; slow or pause for hypotension or bradycardia per protocol.", citationIDs: ["openrn_pharm_round36b"]),
            AttributedBullet("Pre-warn about the groin paresthesia; it prevents a mid-infusion panic and an unnecessary stop.", citationIDs: ["openrn_pharm_round36b"]),
            AttributedBullet("Time post-load levels correctly — drawing before conversion completes reads falsely.", citationIDs: ["openrn_pharm_round36b"])
        ],
        patientTeaching: AttributedProse(
            "This IV seizure medicine commonly causes brief, intense tingling or itching — often in the groin — while it runs; it passes quickly and we can slow the rate. You'll be on a heart monitor during the infusion as a standard precaution.",
            citationIDs: ["openrn_pharm_round36b"]
        ),
        citations: [openfdaR36B, openrnPharmR36B, ismpR36B],
        lastSourceFidelityReview: "2026-07-03"
    )
}
