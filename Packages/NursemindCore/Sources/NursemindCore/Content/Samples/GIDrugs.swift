import Foundation

// Curator-model GI drug entries (v1.5 expansion).
// Sources: openFDA SPL (CC0), Open RN Nursing Pharmacology (CC BY 4.0).

private let openfda = CitationSource(
    id: "openfda_gi",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_pharm_gi",
    shortName: "Open RN Nursing Pharmacology — Gastrointestinal",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=gastrointestinal+ppi+antiemetic",
    lastRetrieved: "2026-05-04"
)

// MARK: - Polyethylene Glycol (MiraLAX)

public enum PolyethyleneGlycolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "polyethylene-glycol",
        title: "Polyethylene Glycol 3350",
        subtitle: "MiraLAX · GoLYTELY (high-volume) · osmotic laxative",
        category: "Osmotic Laxative",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Osmotic laxative (non-absorbable polymer)"),
            KeyValueRow(key: "Onset (constipation)", value: "1–3 days"),
            KeyValueRow(key: "Onset (bowel prep)", value: "1–4 hours"),
            KeyValueRow(key: "Routes", value: "PO; bowel prep solutions PO")
        ],
        indications: AttributedProse(
            "Occasional constipation (low-volume MiraLAX). Bowel preparation prior to colonoscopy or surgery (high-volume electrolyte solutions: GoLYTELY, NuLYTELY).",
            citationIDs: ["openfda_gi"]
        ),
        mechanism: AttributedProse(
            "Non-absorbable, osmotically active polymer holds water in the colon, softening stool and stimulating peristalsis. Electrolyte-containing prep solutions also prevent fluid/electrolyte shifts during cleansing.",
            citationIDs: ["openfda_gi", "openrn_pharm_gi"]
        ),
        dosing: [
            DosingBlock(label: "Constipation (MiraLAX)", body: "17 g (1 capful) dissolved in 8 oz water/juice once daily; effect in 1–3 days.", citationIDs: ["openfda_gi"]),
            DosingBlock(label: "Bowel prep (4 L PEG-ELS)", body: "240 mL every 10 min until 4 L consumed (or split-dose: 2 L evening before, 2 L morning of procedure).", citationIDs: ["openfda_gi"]),
            DosingBlock(label: "Bowel prep (low-volume)", body: "Per product label (varies — Suprep, MoviPrep, Plenvu).", citationIDs: ["openfda_gi"])
        ],
        contraindications: AttributedProse(
            "Bowel obstruction or perforation, ileus, gastric retention, megacolon, severe ulcerative colitis. Hypersensitivity.",
            citationIDs: ["openfda_gi"]
        ),
        warnings: [
            AttributedBullet("Aspiration risk — bowel prep should be sipped with patient upright; use NG tube only with extreme caution.", citationIDs: ["openfda_gi"]),
            AttributedBullet("Electrolyte abnormalities and dehydration with excessive use or in patients with renal impairment.", citationIDs: ["openfda_gi"]),
            AttributedBullet("Mallory-Weiss tears reported with vigorous vomiting.", citationIDs: ["openfda_gi"])
        ],
        adverseReactions: AttributedProse(
            "Bloating, cramping, nausea, vomiting (with bowel prep), abdominal distension, anal irritation.",
            citationIDs: ["openfda_gi"]
        ),
        drugInteractions: [
            AttributedBullet("Oral medications taken within 1 hour of bowel prep may not be absorbed.", citationIDs: ["openfda_gi"])
        ],
        nursingImplications: [
            AttributedBullet("Bowel prep: ensure clear liquid diet; chilled solution or flavorings improve tolerability.", citationIDs: ["openrn_pharm_gi"]),
            AttributedBullet("Hold solid foods 12–24 hours before colonoscopy per facility protocol.", citationIDs: ["openrn_pharm_gi"]),
            AttributedBullet("Monitor electrolytes if patient has renal impairment, CHF, or risk for fluid shifts.", citationIDs: ["openrn_pharm_gi"]),
            AttributedBullet("Reassure that effluent should become clear yellow — that confirms adequate prep.", citationIDs: ["openrn_pharm_gi"])
        ],
        patientTeaching: AttributedProse(
            "Drink the prep on the schedule given — split-dose works better than the night before alone. Stay near a bathroom. Sip slowly. Stay hydrated with clear liquids. Tell the GI team if you cannot tolerate the prep — alternatives exist.",
            citationIDs: ["openrn_pharm_gi"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Promethazine

public enum PromethazineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "promethazine",
        title: "Promethazine",
        subtitle: "Phenergan · phenothiazine antiemetic / antihistamine",
        category: "Antiemetic / H1 Antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Phenothiazine — H1 antagonist with anticholinergic and dopaminergic effects"),
            KeyValueRow(key: "Onset", value: "PO/PR 20 min · IM 20 min · IV 5 min"),
            KeyValueRow(key: "Half-life", value: "~12 hr"),
            KeyValueRow(key: "Boxed warning", value: "Severe tissue injury with IV — extravasation/intra-arterial; deep IM preferred")
        ],
        indications: AttributedProse(
            "Nausea and vomiting (post-op, motion sickness, chemo as alternative). Allergic conditions, pruritus. Sedation. Adjunct to opioid analgesia.",
            citationIDs: ["openfda_gi"]
        ),
        mechanism: AttributedProse(
            "H1 receptor antagonist with additional anticholinergic, antidopaminergic, and sedative properties.",
            citationIDs: ["openfda_gi", "openrn_pharm_gi"]
        ),
        dosing: [
            DosingBlock(label: "Nausea/vomiting (adult)", body: "12.5–25 mg PO/IM/PR every 4–6 hours; IV 6.25–12.5 mg deeply diluted, given slowly.", citationIDs: ["openfda_gi"]),
            DosingBlock(label: "Allergy", body: "25 mg PO at bedtime or 12.5 mg PO before meals and at bedtime.", citationIDs: ["openfda_gi"]),
            DosingBlock(label: "Pediatric (≥2 years)", body: "0.25–1 mg/kg PO/IM/PR every 4–6 hours; max 25 mg/dose.", citationIDs: ["openfda_gi"])
        ],
        contraindications: AttributedProse(
            "CHILDREN <2 YEARS — boxed warning, fatal respiratory depression. Comatose patients. Hypersensitivity to phenothiazines.",
            citationIDs: ["openfda_gi"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: severe tissue injury — necrosis and gangrene from IV infiltration, intra-arterial injection, or perivascular leak. Deep IM is preferred; if IV, use large patent vein, dilute well, infuse slowly.", citationIDs: ["openfda_gi"]),
            AttributedBullet("Boxed warning: contraindicated in children <2 — fatal respiratory depression reported.", citationIDs: ["openfda_gi"]),
            AttributedBullet("CNS depression — additive with opioids, benzos, alcohol.", citationIDs: ["openfda_gi"]),
            AttributedBullet("Anticholinergic effects in elderly — confusion, urinary retention, falls.", citationIDs: ["openfda_gi"]),
            AttributedBullet("EPS, NMS reported (phenothiazine class effect).", citationIDs: ["openfda_gi"])
        ],
        adverseReactions: AttributedProse(
            "Sedation (very common), dizziness, dry mouth, blurred vision, urinary retention, constipation, hypotension, EPS, paradoxical excitement (children), tissue necrosis (with IV).",
            citationIDs: ["openfda_gi"]
        ),
        drugInteractions: [
            AttributedBullet("Opioids, benzodiazepines, alcohol — additive sedation and respiratory depression.", citationIDs: ["openfda_gi"]),
            AttributedBullet("Anticholinergics — additive effects (delirium, retention).", citationIDs: ["openfda_gi"]),
            AttributedBullet("MAOIs — prolonged anticholinergic effects.", citationIDs: ["openfda_gi"])
        ],
        nursingImplications: [
            AttributedBullet("IM is preferred — deep IM into a large muscle. If IV, use the LARGEST patent IV available, dilute in 10–20 mL NS, infuse over 10–15 min, NEVER push undiluted.", citationIDs: ["openrn_pharm_gi"]),
            AttributedBullet("STOP the infusion immediately if patient reports burning or pain at IV site — possible extravasation or intra-arterial injection.", citationIDs: ["openrn_pharm_gi"]),
            AttributedBullet("Avoid in patients <2 years — alternative antiemetic.", citationIDs: ["openrn_pharm_gi"]),
            AttributedBullet("Fall precautions for elderly; avoid in dementia (anticholinergic burden).", citationIDs: ["openrn_pharm_gi"]),
            AttributedBullet("Counsel patients to avoid driving and alcohol.", citationIDs: ["openrn_pharm_gi"])
        ],
        patientTeaching: AttributedProse(
            "This medication causes drowsiness — do not drive or drink alcohol. Rise slowly. Report any pain or burning at an IV site immediately. Use sugar-free gum for dry mouth.",
            citationIDs: ["openrn_pharm_gi"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Docusate Sodium

public enum DocusateSodiumSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "docusate-sodium",
        title: "Docusate Sodium",
        subtitle: "Colace · stool softener (surfactant)",
        category: "Stool Softener",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Surfactant stool softener"),
            KeyValueRow(key: "Onset", value: "1–3 days"),
            KeyValueRow(key: "Routes", value: "PO, rectal"),
            KeyValueRow(key: "Common pairing", value: "With opioid analgesia for prevention of constipation")
        ],
        indications: AttributedProse(
            "Prevention or treatment of constipation, especially in patients who should avoid straining (post-MI, post-op, hemorrhoids). Often paired with opioid analgesia.",
            citationIDs: ["openfda_gi"]
        ),
        mechanism: AttributedProse(
            "Anionic surfactant that lowers stool surface tension, allowing water and fat to penetrate and soften stool.",
            citationIDs: ["openfda_gi", "openrn_pharm_gi"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "100 mg PO BID or 50–300 mg PO daily.", citationIDs: ["openfda_gi"]),
            DosingBlock(label: "Pediatric", body: "Per provider — varies by age and weight.", citationIDs: ["openfda_gi"])
        ],
        contraindications: AttributedProse(
            "Bowel obstruction, severe abdominal pain, intestinal perforation, undiagnosed abdominal pain.",
            citationIDs: ["openfda_gi"]
        ),
        warnings: [
            AttributedBullet("Limited efficacy — recent evidence questions docusate's effectiveness compared with placebo for hospitalized patients; consider osmotic or stimulant laxative if unresponsive.", citationIDs: ["openrn_pharm_gi"]),
            AttributedBullet("Should not be used long-term without evaluation of underlying cause.", citationIDs: ["openfda_gi"])
        ],
        adverseReactions: AttributedProse(
            "Mild GI upset, throat irritation (with liquid forms), rare rash.",
            citationIDs: ["openfda_gi"]
        ),
        drugInteractions: [
            AttributedBullet("Mineral oil — docusate increases mineral oil absorption (avoid combo).", citationIDs: ["openfda_gi"])
        ],
        nursingImplications: [
            AttributedBullet("Encourage fluid intake — works by water penetration; dehydrated patients respond poorly.", citationIDs: ["openrn_pharm_gi"]),
            AttributedBullet("Pair with stimulant laxative (senna) when constipation is opioid-related — softener alone often inadequate.", citationIDs: ["openrn_pharm_gi"]),
            AttributedBullet("Encourage activity and dietary fiber when feasible.", citationIDs: ["openrn_pharm_gi"])
        ],
        patientTeaching: AttributedProse(
            "Take with a full glass of water. Drink fluids throughout the day. If no result in 2–3 days, talk to your provider — a different laxative may be needed.",
            citationIDs: ["openrn_pharm_gi"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}
