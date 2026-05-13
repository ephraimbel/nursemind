import Foundation

// Curator-model reversal agents and antidotes (v1.5 expansion).
// Sources: openFDA SPL (CC0), Open RN Nursing Pharmacology (CC BY 4.0), ISMP high-alert
// (concept citation only).

private let openfda = CitationSource(
    id: "openfda_reversal",
    shortName: "FDA SPL — generic labeling (per agent)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_pharm_reversal",
    shortName: "Open RN Nursing Pharmacology — Antidotes and Reversal",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=antidote+reversal+naloxone+protamine",
    lastRetrieved: "2026-05-04"
)
private let ismp = CitationSource(
    id: "ismp_high_alert_2024",
    shortName: "ISMP List of High-Alert Medications, 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)

// MARK: - Vitamin K (Phytonadione)

public enum VitaminKSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "vitamin-k",
        title: "Vitamin K (Phytonadione)",
        subtitle: "Mephyton · AquaMephyton · vitamin K1 — warfarin reversal",
        category: "Antidote — Vitamin",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Fat-soluble vitamin (vitamin K1)"),
            KeyValueRow(key: "Onset", value: "PO 6–10 hr · IV/SC 1–2 hr (effect on INR)"),
            KeyValueRow(key: "Routes", value: "PO, IV (slow), SC; AVOID IM (hematoma)"),
            KeyValueRow(key: "Indication", value: "Warfarin reversal; vitamin K deficiency; neonatal prophylaxis")
        ],
        indications: AttributedProse(
            "Warfarin-induced anticoagulation reversal. Vitamin K deficiency (malabsorption, antibiotic-induced, liver disease). Routine neonatal hemorrhagic disease prevention (single IM dose at birth).",
            citationIDs: ["openfda_reversal"]
        ),
        mechanism: AttributedProse(
            "Co-factor for hepatic synthesis of clotting factors II, VII, IX, X and proteins C and S. Restores activity blocked by warfarin (vitamin K antagonist).",
            citationIDs: ["openfda_reversal", "openrn_pharm_reversal"]
        ),
        dosing: [
            DosingBlock(label: "Warfarin reversal — INR 4.5–10, no bleeding", body: "Hold warfarin; consider 1–2.5 mg PO if high bleeding risk.", citationIDs: ["openfda_reversal"]),
            DosingBlock(label: "Warfarin reversal — INR >10, no bleeding", body: "2.5–5 mg PO; recheck INR in 24 hr.", citationIDs: ["openfda_reversal"]),
            DosingBlock(label: "Warfarin reversal — major bleeding (any INR)", body: "5–10 mg IV slow infusion (over 30 min) PLUS 4-factor PCC (or FFP if PCC unavailable).", citationIDs: ["openfda_reversal"]),
            DosingBlock(label: "Neonatal", body: "0.5–1 mg IM × 1 within first hour of birth.", citationIDs: ["openfda_reversal"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to phytonadione.",
            citationIDs: ["openfda_reversal"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: anaphylactoid reactions (and rare deaths) with IV administration — even with proper dilution. Reserve IV for emergencies and infuse slowly (max 1 mg/min).", citationIDs: ["openfda_reversal"]),
            AttributedBullet("Avoid IM in adults — hematoma risk in coagulopathic patients.", citationIDs: ["openfda_reversal"]),
            AttributedBullet("Effect on INR delayed 6–24 hours — for active major bleeding give PCC concurrently.", citationIDs: ["openfda_reversal"]),
            AttributedBullet("Excess vitamin K can make subsequent re-anticoagulation difficult — give the lowest effective dose.", citationIDs: ["openrn_pharm_reversal"])
        ],
        adverseReactions: AttributedProse(
            "Anaphylactoid reactions with IV (rare but reported), pain at injection site, transient hypotension, dyspnea, flushing, taste alterations.",
            citationIDs: ["openfda_reversal"]
        ),
        drugInteractions: [
            AttributedBullet("Warfarin — antagonizes effect (intended in reversal).", citationIDs: ["openfda_reversal"]),
            AttributedBullet("Bile acid sequestrants — reduce vitamin K absorption.", citationIDs: ["openfda_reversal"])
        ],
        nursingImplications: [
            AttributedBullet("Verify route — PO when possible; IV slow only when active bleeding or rapid reversal needed.", citationIDs: ["openrn_pharm_reversal"]),
            AttributedBullet("Dilute IV in NS or D5W; infuse via pump at max 1 mg/min.", citationIDs: ["openrn_pharm_reversal"]),
            AttributedBullet("Have epinephrine and resuscitation equipment available with IV administration.", citationIDs: ["openrn_pharm_reversal"]),
            AttributedBullet("Recheck INR 6–24 hours after dose; further dosing per provider.", citationIDs: ["openrn_pharm_reversal"]),
            AttributedBullet("Counsel patient that warfarin can usually be restarted at appropriate dose once INR therapeutic again.", citationIDs: ["openrn_pharm_reversal"])
        ],
        patientTeaching: AttributedProse(
            "If you take warfarin, keep your dietary vitamin K (greens) consistent — sudden increases reduce warfarin effect; sudden decreases increase bleeding risk. Tell every provider you take warfarin.",
            citationIDs: ["openrn_pharm_reversal"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Protamine Sulfate

public enum ProtamineSulfateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "protamine-sulfate",
        title: "Protamine Sulfate",
        subtitle: "Heparin reversal agent",
        category: "Antidote — Anticoagulant Reversal",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Cationic protein (binds heparin)"),
            KeyValueRow(key: "Onset", value: "5 minutes (full effect)"),
            KeyValueRow(key: "Reverses", value: "UFH (complete) · LMWH (~60%, partial)"),
            KeyValueRow(key: "Max single dose", value: "50 mg")
        ],
        indications: AttributedProse(
            "Reversal of unfractionated heparin (UFH) anticoagulation in hemorrhage, post-cardiopulmonary bypass, or heparin overdose. Partial reversal of LMWH (enoxaparin).",
            citationIDs: ["openfda_reversal"]
        ),
        mechanism: AttributedProse(
            "Strongly basic protein binds the strongly acidic heparin to form a stable, inactive complex — neutralizes anticoagulant effect.",
            citationIDs: ["openfda_reversal", "openrn_pharm_reversal"]
        ),
        dosing: [
            DosingBlock(label: "UFH reversal", body: "1 mg protamine per 100 units heparin given in the previous 2–3 hours; max 50 mg single dose.", citationIDs: ["openfda_reversal"]),
            DosingBlock(label: "Enoxaparin (LMWH) within 8 hr", body: "1 mg protamine per 1 mg enoxaparin (only ~60% reversal); repeat 0.5 mg per 1 mg if bleeding continues.", citationIDs: ["openfda_reversal"]),
            DosingBlock(label: "Administration", body: "IV slow over 10 minutes — rapid administration causes severe hypotension and bradycardia.", citationIDs: ["openfda_reversal"])
        ],
        contraindications: AttributedProse(
            "Known hypersensitivity. Caution in patients with prior protamine exposure (vasectomized men, prior heart surgery, NPH insulin users — anti-protamine antibodies possible).",
            citationIDs: ["openfda_reversal"]
        ),
        warnings: [
            AttributedBullet("Severe hypotension, bradycardia, pulmonary hypertension — rapid IV administration is the major risk; infuse slowly over 10 minutes.", citationIDs: ["openfda_reversal"]),
            AttributedBullet("Anaphylaxis risk in fish-allergic patients (protamine is derived from salmon sperm), prior protamine exposure (NPH insulin, prior cardiac surgery), and vasectomized males.", citationIDs: ["openfda_reversal"]),
            AttributedBullet("Heparin rebound — reanticoagulation can occur 8–18 hours after CPB despite initial reversal.", citationIDs: ["openfda_reversal"]),
            AttributedBullet("Excess protamine has its own anticoagulant effect — dose to reverse, not exceed.", citationIDs: ["openfda_reversal"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension, bradycardia, pulmonary hypertension, flushing, dyspnea, anaphylaxis (rare), rebound bleeding.",
            citationIDs: ["openfda_reversal"]
        ),
        drugInteractions: [
            AttributedBullet("Heparin — neutralized by intended action.", citationIDs: ["openfda_reversal"])
        ],
        nursingImplications: [
            AttributedBullet("Verify dose calculation — 1 mg per 100 units of UFH given in last 2–3 hr (heparin half-life ~1.5 hr).", citationIDs: ["openrn_pharm_reversal"]),
            AttributedBullet("Infuse SLOWLY over 10 minutes; do not exceed 5 mg/min.", citationIDs: ["openrn_pharm_reversal"]),
            AttributedBullet("Continuous BP and HR monitoring; have resuscitation equipment available.", citationIDs: ["openrn_pharm_reversal"]),
            AttributedBullet("Document allergy history; ask specifically about fish allergy, prior heart surgery, NPH insulin use.", citationIDs: ["openrn_pharm_reversal"]),
            AttributedBullet("Recheck aPTT 5–15 minutes after dose; additional doses may be needed.", citationIDs: ["openrn_pharm_reversal"])
        ],
        patientTeaching: AttributedProse(
            "Reversal medication — used in the moment of bleeding. Tell future providers if you have ever received protamine, NPH insulin, or had heart surgery — these can prime allergic reactions.",
            citationIDs: ["openrn_pharm_reversal"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - N-Acetylcysteine (Acetylcysteine)

public enum NACSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "n-acetylcysteine",
        title: "N-Acetylcysteine",
        subtitle: "Acetadote · Mucomyst · acetaminophen overdose antidote · mucolytic",
        category: "Antidote — Acetaminophen Toxicity / Mucolytic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "N-acetyl L-cysteine — glutathione precursor"),
            KeyValueRow(key: "Onset (toxicity)", value: "Maximum benefit if started within 8 hours of ingestion"),
            KeyValueRow(key: "Routes", value: "IV (toxicity) · PO (toxicity) · nebulized (mucolytic)"),
            KeyValueRow(key: "Half-life", value: "~5 hr")
        ],
        indications: AttributedProse(
            "Acetaminophen overdose (most common indication). Prevention of contrast-induced nephropathy (controversial, declining use). Mucolytic for tenacious secretions in cystic fibrosis, COPD. Off-label: meconium ileus.",
            citationIDs: ["openfda_reversal"]
        ),
        mechanism: AttributedProse(
            "Acetaminophen toxicity: NAC replenishes hepatic glutathione, conjugating the toxic NAPQI metabolite. Mucolytic: free sulfhydryl groups break disulfide bonds in mucus, decreasing viscosity.",
            citationIDs: ["openfda_reversal", "openrn_pharm_reversal"]
        ),
        dosing: [
            DosingBlock(label: "Acetaminophen toxicity (IV — Acetadote 21-hour protocol)", body: "Loading: 150 mg/kg IV in 200 mL D5W over 60 min. Then 50 mg/kg in 500 mL D5W over 4 hr. Then 100 mg/kg in 1000 mL D5W over 16 hr.", citationIDs: ["openfda_reversal"]),
            DosingBlock(label: "Acetaminophen toxicity (PO — 72-hour protocol)", body: "Loading 140 mg/kg PO, then 70 mg/kg PO every 4 hours × 17 doses.", citationIDs: ["openfda_reversal"]),
            DosingBlock(label: "Mucolytic (nebulizer)", body: "3–5 mL of 20% solution OR 6–10 mL of 10% solution every 2–6 hours.", citationIDs: ["openfda_reversal"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity (rare). Caution in active asthma — can precipitate bronchospasm with nebulized form.",
            citationIDs: ["openfda_reversal"]
        ),
        warnings: [
            AttributedBullet("Anaphylactoid reactions with IV — most often with the loading dose. Slow or interrupt infusion; treat with antihistamines/bronchodilator; resume more slowly.", citationIDs: ["openfda_reversal"]),
            AttributedBullet("Bronchospasm with nebulized form — pretreat with bronchodilator in patients with reactive airway disease.", citationIDs: ["openfda_reversal"]),
            AttributedBullet("PO solution has rotten-egg odor and taste — frequent nausea/vomiting; mix with juice or use ondansetron prophylactically.", citationIDs: ["openrn_pharm_reversal"])
        ],
        adverseReactions: AttributedProse(
            "IV: anaphylactoid reaction (flushing, rash, wheeze, angioedema; usually with loading dose). PO: nausea, vomiting, bad taste. Nebulized: bronchospasm, stomatitis, rhinorrhea.",
            citationIDs: ["openfda_reversal"]
        ),
        drugInteractions: [
            AttributedBullet("Activated charcoal — reduces oral NAC absorption; if both given, separate by 1–2 hours.", citationIDs: ["openfda_reversal"]),
            AttributedBullet("Nitroglycerin — NAC may potentiate hypotensive/headache effect.", citationIDs: ["openfda_reversal"])
        ],
        nursingImplications: [
            AttributedBullet("Use the Rumack-Matthew nomogram (or institutional protocol) to determine if NAC is indicated based on serum acetaminophen 4–24 hours post-ingestion.", citationIDs: ["openrn_pharm_reversal"]),
            AttributedBullet("Maximum benefit if started within 8 hours of acetaminophen ingestion — do not delay if level pending and ingestion was significant.", citationIDs: ["openrn_pharm_reversal"]),
            AttributedBullet("Monitor closely during loading dose for anaphylactoid reaction; have epinephrine, antihistamines, bronchodilator at bedside.", citationIDs: ["openrn_pharm_reversal"]),
            AttributedBullet("PO: dilute in juice or carbonated beverage to mask taste; pretreat with antiemetic.", citationIDs: ["openrn_pharm_reversal"]),
            AttributedBullet("Trend LFTs and INR; transplant referral for fulminant liver failure (King's College criteria).", citationIDs: ["openrn_pharm_reversal"])
        ],
        patientTeaching: AttributedProse(
            "After acetaminophen overdose, this medication protects your liver. The taste is unpleasant — we'll mix it with juice. Tell us right away if you feel itchy, flushed, or short of breath. Get follow-up liver labs.",
            citationIDs: ["openrn_pharm_reversal"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}
