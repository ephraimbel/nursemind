import Foundation

// Curator-model drug entries (round 35 — by-name workhorses, part 1).
// Coverage audit vs. top-prescribed + hospital-formulary staples found these
// looked-up-daily drugs missing despite 490+ existing entries: ibuprofen,
// meloxicam, dexamethasone, metoclopramide, prochlorperazine, isosorbide
// mononitrate. Sources: openFDA SPL (public domain), Open RN Pharmacology
// (CC BY 4.0).

private let openfdaR35 = CitationSource(
    id: "openfda_round35",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-07-03"
)
private let openrnPharmR35 = CitationSource(
    id: "openrn_pharm_round35",
    shortName: "Open RN Pharmacology + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-07-03"
)

// MARK: - Ibuprofen

public enum IbuprofenSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ibuprofen",
        title: "Ibuprofen",
        subtitle: "Advil · Motrin · the most-used NSAID",
        category: "NSAID (Propionic Acid)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Nonselective NSAID (COX-1/COX-2)"),
            KeyValueRow(key: "Onset", value: "30–60 min (analgesic)"),
            KeyValueRow(key: "Half-life", value: "~2 hr"),
            KeyValueRow(key: "With food", value: "Reduces GI upset")
        ],
        indications: AttributedProse(
            "Mild-to-moderate pain, fever, and inflammatory conditions (osteoarthritis, rheumatoid arthritis, dysmenorrhea). The most widely used OTC analgesic-antipyretic after acetaminophen — which makes its risks the most widely underestimated.",
            citationIDs: ["openfda_round35"]
        ),
        mechanism: AttributedProse(
            "Reversible nonselective inhibition of COX-1 and COX-2 → reduced prostaglandin synthesis. Analgesia and antipyresis come with the class costs: reduced gastric mucosal protection (COX-1), reduced renal afferent-arteriole dilation, and platelet inhibition.",
            citationIDs: ["openfda_round35", "openrn_pharm_round35"]
        ),
        dosing: [
            DosingBlock(label: "Adult OTC", body: "200–400 mg PO every 4–6 hours as needed; OTC max 1,200 mg/day.", citationIDs: ["openfda_round35"]),
            DosingBlock(label: "Adult prescription", body: "Up to 3,200 mg/day in divided doses for inflammatory conditions per label; lowest effective dose for the shortest duration.", citationIDs: ["openfda_round35"]),
            DosingBlock(label: "Pediatric", body: "Weight-based per label/protocol (not computed here); avoid in infants under 6 months.", citationIDs: ["openfda_round35"])
        ],
        contraindications: AttributedProse(
            "Aspirin-exacerbated respiratory disease (asthma + nasal polyps + aspirin allergy). Peri-CABG pain. Third-trimester pregnancy (premature ductus arteriosus closure). Active GI bleeding.",
            citationIDs: ["openfda_round35"]
        ),
        warnings: [
            AttributedBullet("Boxed warnings (class): cardiovascular thrombotic events (MI, stroke) — risk rises with dose and duration; and GI bleeding, ulceration, and perforation, which can occur without warning symptoms, especially in older adults.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Renal: reduces renal perfusion — AKI risk in dehydration, heart failure, CKD, and with the ACE-inhibitor/ARB + diuretic 'triple whammy.'", citationIDs: ["openfda_round35"]),
            AttributedBullet("Blunts low-dose aspirin's antiplatelet effect when taken beforehand — timing separation per label for cardioprotective aspirin users.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Raises blood pressure and promotes fluid retention — relevant in hypertension and heart failure.", citationIDs: ["openfda_round35"])
        ],
        adverseReactions: AttributedProse(
            "Dyspepsia, nausea, GI bleeding/ulcer, fluid retention, hypertension, AKI, dizziness, rash; rare hepatotoxicity and aseptic meningitis.",
            citationIDs: ["openfda_round35"]
        ),
        drugInteractions: [
            AttributedBullet("Anticoagulants and antiplatelets — additive bleeding risk (GI especially).", citationIDs: ["openfda_round35"]),
            AttributedBullet("ACE inhibitors/ARBs + diuretics — AKI risk; also blunts antihypertensive effect.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Lithium and methotrexate — reduced clearance, toxicity risk.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Low-dose aspirin — competitive COX-1 binding blunts cardioprotection.", citationIDs: ["openfda_round35"])
        ],
        nursingImplications: [
            AttributedBullet("Screen before recommending or giving: renal function, GI bleed history, anticoagulation, heart failure, pregnancy trimester.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Give with food or milk; assess for dark stools, epigastric pain, and unexplained fatigue (bleeding).", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("In hospitalized patients, watch creatinine and urine output — NSAIDs are a common contributor to inpatient AKI.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Count total NSAID exposure across products — patients often combine OTC ibuprofen with prescription NSAIDs unknowingly.", citationIDs: ["openrn_pharm_round35"])
        ],
        patientTeaching: AttributedProse(
            "Take with food, use the lowest dose that works, and don't combine with other NSAIDs like naproxen. If you take daily low-dose aspirin, ask about timing. Stop and call for black stools, stomach pain, or swelling.",
            citationIDs: ["openrn_pharm_round35"]
        ),
        citations: [openfdaR35, openrnPharmR35],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Meloxicam

public enum MeloxicamSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "meloxicam",
        title: "Meloxicam",
        subtitle: "Mobic · once-daily NSAID · COX-2 preferential",
        category: "NSAID (Oxicam)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "NSAID, COX-2 preferential at low dose"),
            KeyValueRow(key: "Dosing rhythm", value: "Once daily"),
            KeyValueRow(key: "Half-life", value: "~15–20 hr"),
            KeyValueRow(key: "Steady state", value: "Days of dosing for full arthritis benefit")
        ],
        indications: AttributedProse(
            "Osteoarthritis and rheumatoid arthritis — a top-prescribed chronic NSAID because once-daily dosing suits long-term arthritis management.",
            citationIDs: ["openfda_round35"]
        ),
        mechanism: AttributedProse(
            "COX inhibition with relative COX-2 preference at the 7.5 mg dose (preference fades at 15 mg) — modestly gentler on the stomach at low dose, but the class renal, cardiovascular, and bleeding risks fully apply.",
            citationIDs: ["openfda_round35", "openrn_pharm_round35"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "7.5 mg PO once daily; may increase to 15 mg once daily (label maximum).", citationIDs: ["openfda_round35"]),
            DosingBlock(label: "Renal caution", body: "Not recommended in advanced renal impairment; lowest dose with monitoring in mild-moderate CKD.", citationIDs: ["openfda_round35"])
        ],
        contraindications: AttributedProse(
            "Aspirin-exacerbated respiratory disease. Peri-CABG pain. Third-trimester pregnancy. Active GI bleeding.",
            citationIDs: ["openfda_round35"]
        ),
        warnings: [
            AttributedBullet("Boxed warnings (class): cardiovascular thrombotic events and serious GI bleeding/ulceration/perforation.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Long half-life means both convenience and slow offset — adverse effects persist for days after stopping.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Renal risk in CKD, dehydration, heart failure, and with ACE-inhibitor/ARB + diuretic combinations.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Chronic-use drug — schedule periodic renal function, blood pressure, and GI-risk review rather than treating it as set-and-forget.", citationIDs: ["openrn_pharm_round35"])
        ],
        adverseReactions: AttributedProse(
            "Dyspepsia, edema, hypertension, GI bleeding, AKI, dizziness, rash.",
            citationIDs: ["openfda_round35"]
        ),
        drugInteractions: [
            AttributedBullet("Anticoagulants/antiplatelets — bleeding; ACE-I/ARB + diuretic — AKI and blunted BP control.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Lithium, methotrexate — reduced clearance.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Other NSAIDs including OTC — no added benefit, added harm; patients on 'Mobic' often don't know it's an NSAID.", citationIDs: ["openrn_pharm_round35"])
        ],
        nursingImplications: [
            AttributedBullet("Medication reconciliation: specifically ask about OTC ibuprofen/naproxen use on top of meloxicam.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Monitor BP, creatinine, and hemoglobin on chronic therapy; assess for GI bleed signs each visit.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Hold per protocol before procedures with bleeding risk, accounting for the long half-life.", citationIDs: ["openrn_pharm_round35"])
        ],
        patientTeaching: AttributedProse(
            "This is a once-a-day anti-inflammatory — an NSAID like ibuprofen, so don't add other NSAIDs on top of it. Take with food. Report black stools, stomach pain, swelling, or decreased urination.",
            citationIDs: ["openrn_pharm_round35"]
        ),
        citations: [openfdaR35, openrnPharmR35],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Dexamethasone

public enum DexamethasoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "dexamethasone",
        title: "Dexamethasone",
        subtitle: "Decadron · potent long-acting corticosteroid · everywhere in the hospital",
        category: "Corticosteroid (Long-Acting)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Glucocorticoid, long-acting"),
            KeyValueRow(key: "Relative potency", value: "~25× hydrocortisone; minimal mineralocorticoid effect"),
            KeyValueRow(key: "Biologic duration", value: "36–72 hr"),
            KeyValueRow(key: "Signature uses", value: "Cerebral/airway edema · antiemetic · croup · COVID")
        ],
        indications: AttributedProse(
            "One of the most versatile hospital drugs: cerebral edema (tumor-associated), airway edema and croup, chemotherapy-induced nausea prophylaxis, severe inflammatory and allergic states, COVID-19 requiring oxygen per protocol, adrenal insufficiency regimens, and diagnostic suppression testing.",
            citationIDs: ["openfda_round35", "openrn_pharm_round35"]
        ),
        mechanism: AttributedProse(
            "Binds glucocorticoid receptors and alters gene transcription — broadly suppressing inflammatory cytokines, stabilizing capillary membranes (the edema effect), and modulating immune function. Long tissue half-life allows once-daily or single-dose regimens; near-absent mineralocorticoid activity means little sodium/fluid effect relative to hydrocortisone.",
            citationIDs: ["openfda_round35"]
        ),
        dosing: [
            DosingBlock(label: "Range", body: "Highly indication-dependent — from a single dose (croup, antiemetic) to scheduled courses (cerebral edema, COVID) per label and protocol.", citationIDs: ["openfda_round35"]),
            DosingBlock(label: "Route", body: "PO bioavailability is excellent; IV and PO doses are essentially equivalent for most uses.", citationIDs: ["openfda_round35"]),
            DosingBlock(label: "Stopping", body: "Short courses can stop abruptly; prolonged therapy requires tapering to let the suppressed adrenal axis recover.", citationIDs: ["openfda_round35"])
        ],
        contraindications: AttributedProse(
            "Systemic fungal infection. Live vaccines during significant immunosuppression. Known hypersensitivity.",
            citationIDs: ["openfda_round35"]
        ),
        warnings: [
            AttributedBullet("Hyperglycemia — expect it, especially in diabetics; glucose monitoring is part of every steroid course.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Immunosuppression and infection masking — fever may be blunted and inflammation hidden; a steroid-treated patient can look better than they are.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Psychiatric effects — insomnia, agitation, euphoria, and frank steroid psychosis; dose-related and worth warning patients about.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Adrenal (HPA-axis) suppression with prolonged use — abrupt discontinuation risks adrenal crisis; stress-dose needs during illness/surgery.", citationIDs: ["openfda_round35"]),
            AttributedBullet("GI ulceration risk rises when combined with NSAIDs; consider gastric protection per protocol.", citationIDs: ["openfda_round35"])
        ],
        adverseReactions: AttributedProse(
            "Hyperglycemia, insomnia, mood changes, increased appetite, mild fluid retention, immunosuppression, delayed wound healing, myopathy, osteoporosis and avascular necrosis with chronic use, perineal burning with rapid IV push.",
            citationIDs: ["openfda_round35"]
        ),
        drugInteractions: [
            AttributedBullet("NSAIDs — additive GI ulcer risk.", citationIDs: ["openfda_round35"]),
            AttributedBullet("CYP3A4 inducers/inhibitors alter levels; dexamethasone itself induces CYP3A4 (lowers levels of many drugs).", citationIDs: ["openfda_round35"]),
            AttributedBullet("Insulin/oral hypoglycemics — doses often need upward adjustment during therapy.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Live vaccines — avoid during significant immunosuppression.", citationIDs: ["openfda_round35"])
        ],
        nursingImplications: [
            AttributedBullet("Monitor glucose on every steroid course, diabetic or not; anticipate insulin adjustments.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Give morning doses when scheduled once daily — mirrors cortisol rhythm and protects sleep.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Watch for infection with muted signs; treat new fever seriously.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Know whether the course is short (stop) or prolonged (taper), and teach the difference — patients famously stop steroids wrong.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Give IV push slowly — rapid administration causes intense perineal burning the patient will report memorably.", citationIDs: ["openrn_pharm_round35"])
        ],
        patientTeaching: AttributedProse(
            "Take it in the morning with food. It can raise blood sugar, affect sleep, and change mood — tell us if those become significant. If you've been on it more than a couple of weeks, never stop it suddenly.",
            citationIDs: ["openrn_pharm_round35"]
        ),
        citations: [openfdaR35, openrnPharmR35],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Metoclopramide

public enum MetoclopramideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "metoclopramide",
        title: "Metoclopramide",
        subtitle: "Reglan · prokinetic antiemetic · the boxed tardive-dyskinesia warning",
        category: "Prokinetic / Antiemetic (D2 Antagonist)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dopamine (D2) antagonist + prokinetic"),
            KeyValueRow(key: "Boxed warning", value: "Tardive dyskinesia — limit therapy ≤12 weeks"),
            KeyValueRow(key: "Onset", value: "PO 30–60 min; IV 1–3 min"),
            KeyValueRow(key: "Renal", value: "Dose-adjust — renally cleared")
        ],
        indications: AttributedProse(
            "Diabetic gastroparesis, GERD refractory to usual care, prevention of chemotherapy- and postoperative nausea/vomiting, and (with other agents) migraine cocktails in the ED.",
            citationIDs: ["openfda_round35"]
        ),
        mechanism: AttributedProse(
            "Central D2 antagonism in the chemoreceptor trigger zone (antiemetic) plus peripheral cholinergic enhancement of gastric motility (prokinetic) — it empties the stomach and quiets the nausea center at once. The same central dopamine blockade produces its movement-disorder side effects.",
            citationIDs: ["openfda_round35", "openrn_pharm_round35"]
        ),
        dosing: [
            DosingBlock(label: "Gastroparesis", body: "10 mg PO up to four times daily, 30 minutes before meals and at bedtime, per label.", citationIDs: ["openfda_round35"]),
            DosingBlock(label: "IV antiemetic", body: "10 mg IV per protocol; infuse slowly — rapid push provokes intense akathisia.", citationIDs: ["openfda_round35"]),
            DosingBlock(label: "Renal impairment / elderly", body: "Reduce dose; accumulation drives movement side effects.", citationIDs: ["openfda_round35"])
        ],
        contraindications: AttributedProse(
            "GI obstruction, perforation, or hemorrhage (prokinesis is harmful). Pheochromocytoma (hypertensive crisis). Seizure disorders. Parkinson's disease (worsens it). History of tardive dyskinesia or metoclopramide-induced dystonia.",
            citationIDs: ["openfda_round35"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: tardive dyskinesia — potentially irreversible involuntary movements; risk rises with duration and cumulative dose. Treatment beyond 12 weeks is explicitly discouraged by the label.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Acute dystonic reactions — especially young adults and children; frightening but treatable (diphenhydramine per protocol).", citationIDs: ["openfda_round35"]),
            AttributedBullet("Akathisia — an intense inner restlessness patients describe as unbearable; slow the IV rate and report it, don't chart it as anxiety.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Neuroleptic malignant syndrome (rare) and depression/suicidality with longer use.", citationIDs: ["openfda_round35"])
        ],
        adverseReactions: AttributedProse(
            "Drowsiness, restlessness/akathisia, fatigue, diarrhea, EPS/dystonia, hyperprolactinemia (galactorrhea, menstrual change), tardive dyskinesia with prolonged use.",
            citationIDs: ["openfda_round35"]
        ),
        drugInteractions: [
            AttributedBullet("Antipsychotics — additive dopamine blockade and EPS risk.", citationIDs: ["openfda_round35"]),
            AttributedBullet("CNS depressants — additive sedation.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Alters absorption of other drugs by speeding gastric emptying.", citationIDs: ["openfda_round35"])
        ],
        nursingImplications: [
            AttributedBullet("Screen the history for Parkinson's, seizures, and bowel obstruction before the first dose — the contraindication list is where this drug's errors live.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Give IV doses slowly; observe for dystonia and akathisia, and know the rescue (diphenhydramine per protocol).", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Track duration — flag any course drifting toward the 12-week boxed limit.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Watch older adults for early involuntary movements (tongue, face) — the reversible window for stopping is early.", citationIDs: ["openrn_pharm_round35"])
        ],
        patientTeaching: AttributedProse(
            "Take it 30 minutes before meals. Report restlessness, muscle spasms of the face or neck, or any involuntary movements right away — especially tongue or facial movements, which we take seriously.",
            citationIDs: ["openrn_pharm_round35"]
        ),
        citations: [openfdaR35, openrnPharmR35],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Prochlorperazine

public enum ProchlorperazineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "prochlorperazine",
        title: "Prochlorperazine",
        subtitle: "Compazine · phenothiazine antiemetic · migraine-cocktail regular",
        category: "Antiemetic (Phenothiazine)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Phenothiazine D2 antagonist"),
            KeyValueRow(key: "Routes", value: "PO · IM · IV · PR"),
            KeyValueRow(key: "Signature risk", value: "EPS/dystonia, akathisia — young adults especially"),
            KeyValueRow(key: "Peds", value: "Contraindicated under 2 years or under 20 lb")
        ],
        indications: AttributedProse(
            "Severe nausea and vomiting, and a standard component of ED migraine cocktails. Historically labeled for anxiety and psychosis, but modern use is almost entirely antiemetic.",
            citationIDs: ["openfda_round35"]
        ),
        mechanism: AttributedProse(
            "Dopamine D2 blockade in the chemoreceptor trigger zone, with anticholinergic, antihistaminic, and alpha-blocking side activity — the receptor spread explains both its effectiveness and its side-effect mix (sedation, hypotension, movement effects).",
            citationIDs: ["openfda_round35", "openrn_pharm_round35"]
        ),
        dosing: [
            DosingBlock(label: "Adult antiemetic", body: "5–10 mg PO/IM three to four times daily per label; 25 mg PR twice daily; IV per protocol, administered slowly.", citationIDs: ["openfda_round35"]),
            DosingBlock(label: "Elderly", body: "Start low — sedation, hypotension, and EPS are all amplified.", citationIDs: ["openfda_round35"])
        ],
        contraindications: AttributedProse(
            "Children under 2 years or under 20 lb. Comatose or severely CNS-depressed states. Pediatric surgery antiemesis. Phenothiazine hypersensitivity.",
            citationIDs: ["openfda_round35"]
        ),
        warnings: [
            AttributedBullet("Acute dystonia and akathisia — the classic scenario is the young adult in the ED with a stiff neck, deviated eyes, or unbearable restlessness after the migraine cocktail; treatable with diphenhydramine per protocol.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Orthostatic hypotension with IV/IM routes — administer slowly, rise-with-care afterward.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Class boxed warning: increased mortality in elderly patients with dementia-related psychosis.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Lowers seizure threshold; NMS possible (rare); QT effects at high dose.", citationIDs: ["openfda_round35"])
        ],
        adverseReactions: AttributedProse(
            "Sedation, dizziness, orthostatic hypotension, dystonia, akathisia, dry mouth, blurred vision, urinary retention, photosensitivity; tardive dyskinesia with chronic use.",
            citationIDs: ["openfda_round35"]
        ),
        drugInteractions: [
            AttributedBullet("CNS depressants — additive sedation.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Other dopamine blockers (metoclopramide, antipsychotics) — additive EPS.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Anticholinergics — additive burden, especially in older adults.", citationIDs: ["openfda_round35"])
        ],
        nursingImplications: [
            AttributedBullet("Warn patients about restlessness and muscle-spasm reactions before giving — a pre-warned patient reports early instead of suffering silently.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("IV slowly, patient supine; orthostatic checks before first ambulation.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Avoid stacking with metoclopramide — duplicate dopamine blockade, duplicate EPS risk.", citationIDs: ["openrn_pharm_round35"])
        ],
        patientTeaching: AttributedProse(
            "This controls severe nausea. It can make you sleepy and dizzy when standing — get up slowly. Tell us immediately about muscle stiffness, spasms, or a feeling that you can't sit still.",
            citationIDs: ["openrn_pharm_round35"]
        ),
        citations: [openfdaR35, openrnPharmR35],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Isosorbide mononitrate

public enum IsosorbideMononitrateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "isosorbide-mononitrate",
        title: "Isosorbide mononitrate",
        subtitle: "Imdur · daily long-acting nitrate · prevention, not rescue",
        category: "Nitrate (Long-Acting)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Organic nitrate, long-acting"),
            KeyValueRow(key: "Role", value: "Angina prophylaxis — NOT for acute attacks"),
            KeyValueRow(key: "Key concept", value: "Nitrate-free interval prevents tolerance"),
            KeyValueRow(key: "Absolute interaction", value: "PDE5 inhibitors — profound hypotension")
        ],
        indications: AttributedProse(
            "Prevention of angina in chronic coronary disease. The long-acting daily counterpart to sublingual nitroglycerin: it prevents episodes; it does not treat one in progress.",
            citationIDs: ["openfda_round35"]
        ),
        mechanism: AttributedProse(
            "Nitric-oxide donor → venodilation (reduced preload) with modest arterial effect at higher doses → lower myocardial oxygen demand. Continuous exposure exhausts the effect (nitrate tolerance), which is why dosing is engineered to leave a daily nitrate-free window.",
            citationIDs: ["openfda_round35", "openrn_pharm_round35"]
        ),
        dosing: [
            DosingBlock(label: "Extended-release", body: "30–60 mg PO once daily in the morning; may titrate to 120 mg (label maximum 240 mg) — once-daily ER dosing builds in the overnight nitrate-free interval.", citationIDs: ["openfda_round35"]),
            DosingBlock(label: "Immediate-release", body: "20 mg twice daily given 7 hours apart (e.g., 8 AM and 3 PM) — the asymmetric schedule exists specifically to create the nitrate-free interval.", citationIDs: ["openfda_round35"])
        ],
        contraindications: AttributedProse(
            "Concurrent PDE5 inhibitors (sildenafil, tadalafil, vardenafil) or riociguat — life-threatening hypotension. Nitrate hypersensitivity.",
            citationIDs: ["openfda_round35"]
        ),
        warnings: [
            AttributedBullet("The PDE5 interaction is the lethal one — ask every patient, every admission, without embarrassment; patients don't volunteer it.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Tolerance: around-the-clock dosing makes the drug stop working; protect the nitrate-free interval rather than 'fixing' breakthrough symptoms by adding doses.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Headache is common and typically fades with continued use — it signals the drug is working; treat it, don't stop the nitrate abruptly.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Hypotension, especially with volume depletion, alcohol, or other vasodilators.", citationIDs: ["openfda_round35"])
        ],
        adverseReactions: AttributedProse(
            "Headache (very common early), dizziness, flushing, orthostatic hypotension, occasional reflex tachycardia.",
            citationIDs: ["openfda_round35"]
        ),
        drugInteractions: [
            AttributedBullet("PDE5 inhibitors / riociguat — contraindicated.", citationIDs: ["openfda_round35"]),
            AttributedBullet("Antihypertensives, alcohol — additive hypotension.", citationIDs: ["openfda_round35"])
        ],
        nursingImplications: [
            AttributedBullet("Clarify the rescue plan: the patient still needs sublingual nitroglycerin for acute chest pain — this drug won't help an attack.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Teach and preserve the dosing schedule that creates the nitrate-free interval; don't 'even out' the 7-hours-apart IR schedule to 12.", citationIDs: ["openrn_pharm_round35"]),
            AttributedBullet("Orthostatic precautions early in therapy; monitor BP with other vasodilators on board.", citationIDs: ["openrn_pharm_round35"])
        ],
        patientTeaching: AttributedProse(
            "This daily medicine prevents chest pain; it does not stop an attack — keep your fast-acting nitroglycerin with you. Never use erectile-dysfunction medicines while on nitrates. Early headaches usually fade; take the doses exactly on the schedule we set.",
            citationIDs: ["openrn_pharm_round35"]
        ),
        citations: [openfdaR35, openrnPharmR35],
        lastSourceFidelityReview: "2026-07-03"
    )
}
