import Foundation

// Curator-model drug entries (round 17 — critical care anesthesia + endocrine + ID + cardiac).

private let openfdaR17 = CitationSource(
    id: "openfda_round17",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR17 = CitationSource(
    id: "openrn_pharm_round17",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=anesthesia+critical+care",
    lastRetrieved: "2026-05-04"
)
private let specialtyR17 = CitationSource(
    id: "specialty_round17",
    shortName: "ASA / SCCM / ADA / IDSA concept citations",
    publisher: "ASA · SCCM · ADA · IDSA",
    license: .factCitationOnly,
    url: "https://www.asahq.org/standards-and-guidelines",
    lastRetrieved: "2026-05-04"
)

public enum PropofolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "propofol",
        title: "Propofol",
        subtitle: "Diprivan · GABA-A enhancer · ICU + procedural sedation · hypotension + PRIS",
        category: "IV anesthetic / sedative",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "GABA-A enhancing IV sedative"),
            KeyValueRow(key: "Indications", value: "ICU sedation, procedural sedation, induction of anesthesia"),
            KeyValueRow(key: "Notable", value: "Lipid emulsion (egg / soy / glycerol); tracks calories"),
            KeyValueRow(key: "Watch", value: "Hypotension, bradycardia, propofol-related infusion syndrome (PRIS)")
        ],
        indications: AttributedProse(
            "Induction + maintenance of anesthesia, ICU sedation in mechanically ventilated patients, procedural sedation per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        mechanism: AttributedProse(
            "Allosteric activation of GABA-A receptors → CNS depression. Rapid onset (<60 sec), short duration (5–10 min) — context-sensitive half-time short for short infusions, longer with prolonged use.",
            citationIDs: ["openfda_round17"]
        ),
        dosing: [
            DosingBlock(label: "ICU sedation", body: "5–50 mcg/kg/min IV titrated to RASS goal per primary source.", citationIDs: ["openfda_round17"]),
            DosingBlock(label: "Induction", body: "1–2.5 mg/kg IV; lower in elderly / hemodynamically unstable.", citationIDs: ["openfda_round17"]),
            DosingBlock(label: "Procedural", body: "0.5–1 mg/kg IV bolus, repeat 0.25–0.5 mg/kg PRN.", citationIDs: ["openfda_round17"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to egg, soy, glycerol, or sulfite components; pregnancy + breastfeeding (relative); pediatric ICU sedation (FDA does not approve <18 for ICU use due to PRIS risk) per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        warnings: [
            AttributedBullet("Hypotension + cardiac depression — cautious in hypovolemia, elderly, septic shock.", citationIDs: ["openfda_round17"]),
            AttributedBullet("PROPOFOL-RELATED INFUSION SYNDROME (PRIS) — high doses (>4 mg/kg/hr) >48 hours; metabolic acidosis, rhabdomyolysis, cardiac failure, AKI; mortality high; switch sedative if suspected per primary source.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Lipid emulsion — adds 1.1 kcal/mL; track caloric intake; check triglycerides q72h on chronic infusion.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Apnea / respiratory depression — only by clinicians trained in airway management.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Injection site pain — pretreat with lidocaine or use larger vein.", citationIDs: ["openrn_pharm_round17"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension, apnea, bradycardia, injection site pain, hypertriglyceridemia, allergic reactions, green urine (rare), pancreatitis (rare).",
            citationIDs: ["openfda_round17"]
        ),
        drugInteractions: [
            AttributedBullet("Other sedatives / opioids — additive CNS + respiratory depression.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Vasopressors — often required during induction in unstable patients.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Theophylline + other antagonists — may reduce sedation.", citationIDs: ["openfda_round17"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous cardiac + SpO2 + capnography monitoring; resuscitation equipment available.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Aseptic technique — propofol supports microbial growth; discard within 12 hours of opening; new tubing q12h per primary source.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Daily sedation interruption (SAT) per ICU protocol if not contraindicated.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Track calories from lipid load; trend triglycerides on prolonged infusion.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Switch to alternative if PRIS suspected (rising lactate, AKI, rhabdo, refractory bradycardia).", citationIDs: ["specialty_round17"])
        ],
        patientTeaching: AttributedProse(
            "This medication is given through your IV to keep you sedated while on the ventilator or during a procedure. You will be unconscious, and we will monitor your breathing and heart closely.",
            citationIDs: ["openrn_pharm_round17"]
        ),
        citations: [openfdaR17, openrnPharmR17, specialtyR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum SugammadexSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sugammadex",
        title: "Sugammadex",
        subtitle: "Bridion · selective rocuronium / vecuronium reversal · rapid + complete · bradycardia",
        category: "Selective NMBD reversal agent",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Modified γ-cyclodextrin"),
            KeyValueRow(key: "Indications", value: "Reversal of rocuronium- or vecuronium-induced neuromuscular blockade"),
            KeyValueRow(key: "Notable", value: "Reverses even DEEP block (vs neostigmine which requires partial recovery)"),
            KeyValueRow(key: "Watch", value: "Bradycardia (occasionally severe), anaphylaxis, OCP failure × 7 days post-dose")
        ],
        indications: AttributedProse(
            "Reversal of neuromuscular blockade induced by rocuronium or vecuronium in adults + pediatrics ≥2 years per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        mechanism: AttributedProse(
            "Selective γ-cyclodextrin encapsulates rocuronium / vecuronium in plasma → free drug pulled from neuromuscular junction → rapid + complete reversal regardless of depth.",
            citationIDs: ["openfda_round17"]
        ),
        dosing: [
            DosingBlock(label: "Routine reversal", body: "2 mg/kg IV (TOF reappearance T2) or 4 mg/kg IV (deep block, post-tetanic count 1–2).", citationIDs: ["openfda_round17"]),
            DosingBlock(label: "Immediate reversal", body: "16 mg/kg IV after 1.2 mg/kg rocuronium induction (rescue from CICO scenarios) per primary source.", citationIDs: ["openfda_round17"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to sugammadex; pediatric use <2 years per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        warnings: [
            AttributedBullet("Bradycardia — occasional severe; have atropine + vasopressors available per primary source.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Anaphylaxis / hypersensitivity — risk in repeat exposures.", citationIDs: ["openfda_round17"]),
            AttributedBullet("OCP failure — sugammadex binds progestins; counsel additional contraception × 7 days post-dose per primary source.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Coagulation effects — modest aPTT / PT prolongation; clinical bleeding rare.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Renal — caution in severe CKD; not recommended <30 mL/min CrCl per primary source.", citationIDs: ["openfda_round17"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, bradycardia, hypotension, headache, anaphylaxis (rare).",
            citationIDs: ["openfda_round17"]
        ),
        drugInteractions: [
            AttributedBullet("Hormonal contraceptives (especially progestin-only) — sugammadex binds; counsel non-hormonal backup × 7 days.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Toremifene + flucloxacillin + fusidic acid — may displace; clinical relevance limited.", citationIDs: ["openfda_round17"])
        ],
        nursingImplications: [
            AttributedBullet("Train of four (TOF) monitor before + after dosing; verify TOF >0.9 + sustained 5-second head lift before extubation per primary source.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Bradycardia preparation — atropine + glycopyrrolate; cardiac monitoring.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Counsel female patients of reproductive age — non-hormonal contraception × 7 days.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Avoid in severe renal impairment; choose alternative reversal (neostigmine + glycopyrrolate).", citationIDs: ["specialty_round17"])
        ],
        patientTeaching: AttributedProse(
            "We're giving this to reverse the muscle relaxant from your surgery so you can breathe and move on your own. If you take birth control pills, use a backup method of contraception for 7 days.",
            citationIDs: ["openrn_pharm_round17"]
        ),
        citations: [openfdaR17, openrnPharmR17, specialtyR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum NeostigmineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "neostigmine",
        title: "Neostigmine",
        subtitle: "AChE inhibitor · NMBD reversal + myasthenia · ALWAYS with anticholinergic for bradycardia",
        category: "Acetylcholinesterase inhibitor (NMBD reversal)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Quaternary AChE inhibitor"),
            KeyValueRow(key: "Indications", value: "Non-depolarizing NMBD reversal (with anticholinergic); myasthenia gravis"),
            KeyValueRow(key: "Notable", value: "Crosses BBB poorly (vs physostigmine); paired with glycopyrrolate or atropine"),
            KeyValueRow(key: "Watch", value: "Bradycardia, secretions, bronchospasm, GI cramping")
        ],
        indications: AttributedProse(
            "Reversal of non-depolarizing neuromuscular blockade after partial spontaneous recovery (TOF count ≥2); treatment of myasthenia gravis; treatment of postoperative ileus / urinary retention (selected) per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        mechanism: AttributedProse(
            "Reversibly inhibits acetylcholinesterase → ACh accumulates at neuromuscular junction → competes with NMBDs at nicotinic ACh receptors → reverses block. Quaternary structure limits CNS penetration.",
            citationIDs: ["openfda_round17"]
        ),
        dosing: [
            DosingBlock(label: "NMBD reversal (adult)", body: "0.04–0.07 mg/kg IV (max 5 mg) WITH glycopyrrolate 0.2 mg per 1 mg neostigmine OR atropine 0.4 mg per 1 mg neostigmine per primary source.", citationIDs: ["openfda_round17"]),
            DosingBlock(label: "Myasthenia gravis", body: "0.5–2.5 mg PO every 3–6 hours; pyridostigmine more commonly used.", citationIDs: ["openfda_round17"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; mechanical bowel / urinary obstruction; peritonitis per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        warnings: [
            AttributedBullet("BRADYCARDIA / asystole — ALWAYS pair with anticholinergic (glycopyrrolate or atropine) per primary source.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Bronchospasm — caution in reactive airway disease.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Cholinergic crisis if overdose — distinguish from myasthenic crisis (Tensilon test historic).", citationIDs: ["openfda_round17"]),
            AttributedBullet("Less effective for deep block (TOF <2 twitches) — sugammadex superior in deep block per primary source.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Recurarization risk if reversed too early before NMBD elimination.", citationIDs: ["specialty_round17"])
        ],
        adverseReactions: AttributedProse(
            "Bradycardia, increased secretions, salivation, lacrimation, abdominal cramping, nausea, bronchospasm.",
            citationIDs: ["openfda_round17"]
        ),
        drugInteractions: [
            AttributedBullet("Glycopyrrolate / atropine — required co-administration to prevent muscarinic effects.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Beta-blockers — additive bradycardia.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Aminoglycosides + clindamycin — can prolong NMBD effect; reversal may need higher doses.", citationIDs: ["openfda_round17"])
        ],
        nursingImplications: [
            AttributedBullet("Verify TOF count ≥2 before reversal; confirm TOF >0.9 + sustained head lift before extubation per primary source.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Co-administer anticholinergic in same syringe / immediately preceding to prevent bradycardia.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Continuous cardiac monitoring; have atropine + epinephrine + airway support available.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Monitor secretions + airway after reversal; suction PRN.", citationIDs: ["openrn_pharm_round17"])
        ],
        patientTeaching: AttributedProse(
            "We're giving this medication to help your muscles work again after surgery. You may feel some saliva or stomach cramping briefly, which is normal and goes away.",
            citationIDs: ["openrn_pharm_round17"]
        ),
        citations: [openfdaR17, openrnPharmR17, specialtyR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum DantroleneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "dantrolene",
        title: "Dantrolene",
        subtitle: "Ryanodex / Dantrium · MH antidote · ryanodine receptor blocker · NMS adjunct",
        category: "Muscle relaxant / MH antidote",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Skeletal muscle relaxant (ryanodine receptor antagonist)"),
            KeyValueRow(key: "Indications", value: "Malignant hyperthermia (MH); neuroleptic malignant syndrome (NMS); chronic spasticity"),
            KeyValueRow(key: "Notable", value: "Stock at any anesthetizing location per ASA / MHAUS; supply 36 vials minimum"),
            KeyValueRow(key: "Watch", value: "Hepatotoxicity (chronic use), tissue necrosis if extravasation")
        ],
        indications: AttributedProse(
            "Treatment of malignant hyperthermia (acute crisis + post-event) — first-line antidote. Off-label — neuroleptic malignant syndrome, severe serotonin syndrome / sympathomimetic hyperthermia. Chronic — spasticity in MS, CP, SCI per primary source.",
            citationIDs: ["openfda_round17", "specialty_round17"]
        ),
        mechanism: AttributedProse(
            "Blocks ryanodine receptor (RyR1) on sarcoplasmic reticulum → reduces Ca2+ release into muscle cytoplasm → reduces sustained muscle contraction + heat generation in MH crisis.",
            citationIDs: ["openfda_round17"]
        ),
        dosing: [
            DosingBlock(label: "MH crisis", body: "Initial 2.5 mg/kg IV bolus; repeat q5–10 min until reversal of crisis (max 10 mg/kg in 24 hours, sometimes higher); continue 1 mg/kg q4–6h × 24–48 hours per primary source.", citationIDs: ["specialty_round17"]),
            DosingBlock(label: "Reconstitution", body: "Ryanodex — single 250 mg vial per 5 mL sterile water (faster); Dantrium — 20 mg per 60 mL sterile water (slower; mix multiple vials).", citationIDs: ["specialty_round17"]),
            DosingBlock(label: "Spasticity (chronic)", body: "Start 25 mg PO daily; titrate to 100 mg QID max; monitor LFTs.", citationIDs: ["openfda_round17"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; chronic use in active hepatic disease per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        warnings: [
            AttributedBullet("HEPATOTOXICITY — fatal cases on chronic oral therapy; baseline + periodic LFTs; acute IV use rarely associated.", citationIDs: ["openfda_round17"]),
            AttributedBullet("TISSUE NECROSIS if extravasated — high pH; large central or large peripheral vein for IV; extravasation per protocol.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Drowsiness, weakness, dizziness — caution with CNS depressants.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Reconstitution can be slow (Dantrium) — Ryanodex is preferred for crisis (single vial, fast).", citationIDs: ["specialty_round17"])
        ],
        adverseReactions: AttributedProse(
            "Drowsiness, weakness, dizziness, GI upset, hepatotoxicity (chronic), photosensitivity, pleural effusion / pericarditis (chronic).",
            citationIDs: ["openfda_round17"]
        ),
        drugInteractions: [
            AttributedBullet("Other CNS depressants — additive sedation.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Verapamil — life-threatening hyperkalemia + cardiac depression in MH context; AVOID combination per primary source.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Estrogens — additive hepatotoxicity.", citationIDs: ["openfda_round17"])
        ],
        nursingImplications: [
            AttributedBullet("MH cart at every anesthetizing location with 36 vials Dantrium / 3 vials Ryanodex + reconstitution supplies per MHAUS.", citationIDs: ["specialty_round17"]),
            AttributedBullet("MH crisis — call MHAUS hotline (1-800-MH-HYPER); discontinue triggering agents; cooling; treat hyperkalemia; ICU.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Multiple staff for rapid reconstitution (Dantrium); use central or large peripheral line.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Continue dantrolene q4–6h × 24–48 hours after MH crisis; monitor for recrudescence.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Counsel chronic patients about LFT monitoring + sedation + contraception (estrogen interaction).", citationIDs: ["openrn_pharm_round17"])
        ],
        patientTeaching: AttributedProse(
            "If you take this for muscle stiffness, get blood tests for your liver as scheduled. Tell us about yellow eyes / skin, dark urine, severe fatigue. After a malignant hyperthermia event, you must wear medical-alert ID and tell every anesthesia provider.",
            citationIDs: ["openrn_pharm_round17"]
        ),
        citations: [openfdaR17, openrnPharmR17, specialtyR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum EsmololSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "esmolol",
        title: "Esmolol",
        subtitle: "Brevibloc · ultra-short β1 blocker · 9-min half-life · ICU + thyroid storm",
        category: "Ultra-short-acting selective β1-adrenergic blocker",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Cardioselective β1 blocker (IV only)"),
            KeyValueRow(key: "Indications", value: "Atrial fib / SVT rate control; intra-op HTN / tachycardia; thyroid storm; perioperative β-blockade"),
            KeyValueRow(key: "Notable", value: "Onset <1 min; t½ ~9 min — easily titratable, useful in unstable patients"),
            KeyValueRow(key: "Watch", value: "Hypotension, bradycardia, heart block, bronchospasm")
        ],
        indications: AttributedProse(
            "Acute rate control of supraventricular arrhythmias; intraoperative + postoperative hypertension + tachycardia; adjunct in thyroid storm; perioperative β-blockade per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        mechanism: AttributedProse(
            "Cardioselective β1-adrenergic antagonist → reduced HR + contractility + AV conduction. Hydrolyzed by RBC esterases (not hepatic) → ultra-short half-life ~9 minutes; offset within 20–30 minutes of stopping infusion.",
            citationIDs: ["openfda_round17"]
        ),
        dosing: [
            DosingBlock(label: "Loading + maintenance", body: "Loading 500 mcg/kg IV over 1 minute; maintenance 50 mcg/kg/min IV; titrate every 4 minutes by 50 mcg/kg/min (max 200–300 mcg/kg/min) per primary source.", citationIDs: ["openfda_round17"])
        ],
        contraindications: AttributedProse(
            "Severe sinus bradycardia / SA block; second/third-degree AV block; cardiogenic shock; decompensated HF; severe asthma per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        warnings: [
            AttributedBullet("HYPOTENSION + BRADYCARDIA — common; reduce or stop infusion; rapid offset.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Heart block — pre-existing conduction disease; ECG monitoring.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Bronchospasm in asthma / COPD — cardioselective at low doses but β2 effect at higher; alternative if severe airway disease.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Mask hypoglycemia in diabetics.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Local irritation at IV site; central line preferred for prolonged infusion.", citationIDs: ["openrn_pharm_round17"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension, bradycardia, dizziness, nausea, infusion site reaction.",
            citationIDs: ["openfda_round17"]
        ),
        drugInteractions: [
            AttributedBullet("Other β-blockers / CCBs (verapamil, diltiazem) — additive bradycardia + heart block.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Catecholamine-depleting drugs — additive hypotension.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Insulin — masked hypoglycemia warnings.", citationIDs: ["openfda_round17"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous cardiac + arterial line monitoring; ICU-level care.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Titrate carefully — modest dose changes can produce big BP / HR changes.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Concentrated solutions central line; dilute peripheral.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Transition to oral β-blocker before stopping if chronic therapy needed.", citationIDs: ["specialty_round17"])
        ],
        patientTeaching: AttributedProse(
            "We're giving this to control your heart rate and blood pressure during this critical care period. The medication wears off within 20–30 minutes after we stop it.",
            citationIDs: ["openrn_pharm_round17"]
        ),
        citations: [openfdaR17, openrnPharmR17, specialtyR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PhentolamineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "phentolamine",
        title: "Phentolamine",
        subtitle: "Regitine · α1+α2 blocker · pheochromocytoma + vasopressor extravasation + hypertensive crisis",
        category: "Non-selective α-adrenergic blocker",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-selective competitive α-adrenergic antagonist"),
            KeyValueRow(key: "Indications", value: "Pheochromocytoma HTN crisis; vasopressor extravasation; cocaine / sympathomimetic HTN; MAOI-tyramine reactions"),
            KeyValueRow(key: "Extravasation", value: "5–10 mg in 10 mL NS infiltrated SQ around extravasation site within 12 hours"),
            KeyValueRow(key: "Watch", value: "Hypotension, reflex tachycardia, MI / arrhythmia in CAD")
        ],
        indications: AttributedProse(
            "Treatment of hypertensive emergency from pheochromocytoma / cocaine / sympathomimetic / MAOI-tyramine; treatment of vasopressor extravasation injury; perioperative pheochromocytoma management per primary source.",
            citationIDs: ["openfda_round17", "specialty_round17"]
        ),
        mechanism: AttributedProse(
            "Competitive non-selective α1- + α2-adrenergic blockade → vasodilation + reduced peripheral resistance + reflex tachycardia (no β1 protection unlike selective α1 blockers).",
            citationIDs: ["openfda_round17"]
        ),
        dosing: [
            DosingBlock(label: "HTN crisis", body: "5–15 mg IV bolus; repeat as needed every 5–10 min per primary source.", citationIDs: ["openfda_round17"]),
            DosingBlock(label: "Vasopressor extravasation", body: "5–10 mg in 10 mL NS infiltrated SQ around extravasation site (multiple small injections) within 12 hours of event per primary source.", citationIDs: ["specialty_round17"]),
            DosingBlock(label: "Pheo preoperative", body: "Phenoxybenzamine PO preferred for 7–14 days α-blockade; phentolamine for intraop crisis.", citationIDs: ["specialty_round17"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; recent MI; coronary insufficiency / angina (relative) per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        warnings: [
            AttributedBullet("Reflex tachycardia + arrhythmias — caution in CAD / older patients.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Hypotension — IV bolus dosing; have IV fluids + Trendelenburg ready.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Should be used with β-blocker for pheochromocytoma BP control AFTER α-blockade established (not before — unopposed α causes severe HTN).", citationIDs: ["specialty_round17"]),
            AttributedBullet("Extravasation rescue — distinguish phentolamine (α-mediated extravasation: norepi, dopamine, phenylephrine) from terbutaline (vasopressin extravasation).", citationIDs: ["specialty_round17"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension, reflex tachycardia, dizziness, flushing, GI upset, headache, MI / arrhythmia in susceptible patients.",
            citationIDs: ["openfda_round17"]
        ),
        drugInteractions: [
            AttributedBullet("Sympathomimetics (epinephrine, ephedrine) — phentolamine reverses vasopressor effect; use vasopressin or phenylephrine instead.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Sildenafil / tadalafil — additive hypotension; avoid combination.", citationIDs: ["openfda_round17"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous cardiac + BP monitoring; arterial line for HTN crisis.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Vasopressor extravasation — recognize within 12 hours; phentolamine SQ infiltration with small needle (27G); document.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Pre-operative pheochromocytoma — confirm α-blockade established before β-blockade; high-sodium diet + fluids.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Have IV fluids + reverse Trendelenburg available for hypotension.", citationIDs: ["openrn_pharm_round17"])
        ],
        patientTeaching: AttributedProse(
            "We're giving this to lower very high blood pressure or to prevent tissue damage from a leaked IV medication. Tell us if you feel lightheaded, have chest pain, or feel your heart racing.",
            citationIDs: ["openrn_pharm_round17"]
        ),
        citations: [openfdaR17, openrnPharmR17, specialtyR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum OctreotideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "octreotide",
        title: "Octreotide",
        subtitle: "Sandostatin · somatostatin analog · variceal bleed + sulfonylurea hypoglycemia + carcinoid",
        category: "Somatostatin analog",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic somatostatin analog"),
            KeyValueRow(key: "Indications", value: "Variceal hemorrhage; sulfonylurea-induced hypoglycemia; carcinoid / VIPoma; acromegaly"),
            KeyValueRow(key: "Notable", value: "IV / SQ; LAR depot for chronic conditions"),
            KeyValueRow(key: "Watch", value: "Bradycardia, hyperglycemia / hypoglycemia, gallstone formation")
        ],
        indications: AttributedProse(
            "Acute variceal hemorrhage; refractory sulfonylurea-induced hypoglycemia; carcinoid / VIPoma symptom control; acromegaly; high-output GI fistula / dumping syndrome / chemotherapy-induced diarrhea per primary source.",
            citationIDs: ["openfda_round17", "specialty_round17"]
        ),
        mechanism: AttributedProse(
            "Binds somatostatin receptors (SST2, SST5) → inhibits release of GH, insulin, glucagon, gastrin, VIP, serotonin, motilin → reduces splanchnic blood flow + GI hormone secretion + portal pressure.",
            citationIDs: ["openfda_round17"]
        ),
        dosing: [
            DosingBlock(label: "Variceal bleed", body: "50 mcg IV bolus then 50 mcg/hr infusion × 3–5 days per primary source.", citationIDs: ["specialty_round17"]),
            DosingBlock(label: "Sulfonylurea hypoglycemia", body: "50–100 mcg SQ q6h × 24–48 hours plus dextrose support per primary source.", citationIDs: ["specialty_round17"]),
            DosingBlock(label: "Carcinoid", body: "100–600 mcg/day SQ divided BID-QID; LAR 20 mg IM monthly maintenance.", citationIDs: ["openfda_round17"]),
            DosingBlock(label: "Acromegaly", body: "50–500 mcg SQ TID; LAR 10–30 mg IM monthly.", citationIDs: ["openfda_round17"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        warnings: [
            AttributedBullet("Bradycardia + arrhythmia — monitor cardiac rhythm.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Glucose dysregulation — hyperglycemia OR hypoglycemia depending on context; monitor closely.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Cholelithiasis — biliary sludge / gallstone formation with chronic use; periodic gallbladder ultrasound.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Hypothyroidism — chronic use; monitor TSH.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Injection site reactions; rare anaphylaxis.", citationIDs: ["openfda_round17"])
        ],
        adverseReactions: AttributedProse(
            "GI upset, abdominal pain, diarrhea or constipation, bradycardia, hypothyroidism (chronic), hyperglycemia, hypoglycemia, gallstones, injection-site reaction.",
            citationIDs: ["openfda_round17"]
        ),
        drugInteractions: [
            AttributedBullet("Cyclosporine — reduced levels; monitor.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Insulin / oral hypoglycemics — adjusted dosing in diabetics.", citationIDs: ["openfda_round17"])
        ],
        nursingImplications: [
            AttributedBullet("Variceal bleed — concurrent endoscopy + abx prophylaxis (ceftriaxone) + transfusion + ICU per primary source.", citationIDs: ["specialty_round17"]),
            AttributedBullet("SU hypoglycemia — continue dextrose IV + frequent finger sticks + octreotide SQ; admission required per primary source.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Chronic — gallbladder ultrasound at baseline + periodically; TSH monitoring.", citationIDs: ["openfda_round17"]),
            AttributedBullet("LAR — IM gluteal; counsel on pain at injection site.", citationIDs: ["openrn_pharm_round17"])
        ],
        patientTeaching: AttributedProse(
            "If you self-inject this, learn the right technique and rotate sites. Tell us about right-upper-belly pain (gallstones), high or low blood sugars, or slow heart rate.",
            citationIDs: ["openrn_pharm_round17"]
        ),
        citations: [openfdaR17, openrnPharmR17, specialtyR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum TenecteplaseSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tenecteplase",
        title: "Tenecteplase (TNK)",
        subtitle: "TNKase · single-bolus thrombolytic · STEMI + acute ischemic stroke",
        category: "Thrombolytic (recombinant tissue plasminogen activator)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Genetically modified t-PA — fibrin-specific thrombolytic"),
            KeyValueRow(key: "Indications", value: "STEMI; acute ischemic stroke (off-label, increasingly used)"),
            KeyValueRow(key: "Notable", value: "Single weight-based bolus (vs alteplase infusion); easier administration"),
            KeyValueRow(key: "Boxed-equivalent", value: "Bleeding (intracranial most feared); strict eligibility criteria")
        ],
        indications: AttributedProse(
            "Acute ST-elevation myocardial infarction (STEMI) when timely PCI not feasible. Off-label / increasingly used in acute ischemic stroke (within 4.5 hours of onset; equivalent or superior to alteplase per recent trials) per primary source.",
            citationIDs: ["openfda_round17", "specialty_round17"]
        ),
        mechanism: AttributedProse(
            "Fibrin-specific recombinant t-PA variant → binds fibrin → converts plasminogen to plasmin → fibrinolysis. Genetic modifications (TNK substitution) extend half-life + improve fibrin specificity vs native t-PA.",
            citationIDs: ["openfda_round17"]
        ),
        dosing: [
            DosingBlock(label: "STEMI", body: "Weight-based single IV bolus over 5 seconds — <60 kg: 30 mg; 60–69: 35 mg; 70–79: 40 mg; 80–89: 45 mg; ≥90: 50 mg per primary source.", citationIDs: ["openfda_round17"]),
            DosingBlock(label: "Stroke (off-label)", body: "0.25 mg/kg IV bolus (max 25 mg) over 5 seconds — emerging standard per primary source.", citationIDs: ["specialty_round17"])
        ],
        contraindications: AttributedProse(
            "Active internal bleeding; recent intracranial / spinal surgery / trauma (3 months); intracranial neoplasm / AVM / aneurysm; severe uncontrolled HTN; recent stroke (3 months); known bleeding diathesis; severe hepatic disease per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        warnings: [
            AttributedBullet("BLEEDING — intracranial hemorrhage most feared (1–6%); strict eligibility checklist before administration per primary source.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Reocclusion risk — concurrent antiplatelets (aspirin + clopidogrel) + heparin per ACS protocol.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Cholesterol embolization (rare).", citationIDs: ["openfda_round17"]),
            AttributedBullet("Hypersensitivity / anaphylactoid — angioedema; orolingual edema can be fatal in stroke patients on ACEi.", citationIDs: ["openfda_round17"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (GI, GU, intracranial, infusion site), reperfusion arrhythmias, hypotension, allergic reactions.",
            citationIDs: ["openfda_round17"]
        ),
        drugInteractions: [
            AttributedBullet("Antiplatelets + anticoagulants — additive bleeding risk; balanced per ACS / stroke protocols.", citationIDs: ["specialty_round17"]),
            AttributedBullet("ACE inhibitors — orolingual angioedema risk in stroke setting.", citationIDs: ["openfda_round17"])
        ],
        nursingImplications: [
            AttributedBullet("Strict eligibility checklist — STEMI / stroke criteria; INR, platelets, blood pressure < threshold.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Two large-bore IVs; arterial line; cardiac monitoring; resuscitation cart.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Continuous BP monitoring during + 24 hours after; treat HTN aggressively per stroke protocol.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Avoid arterial / venous sticks for 24 hours; minimize invasive procedures; pressure dressing if needed.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Monitor for neuro change, GI bleeding, hematuria, gum bleeding; serial neuro exam.", citationIDs: ["openrn_pharm_round17"])
        ],
        patientTeaching: AttributedProse(
            "We're giving this to dissolve a clot in your heart or brain. The most serious risk is bleeding — we'll watch you closely. Tell us right away about any new headache, weakness, or visible bleeding.",
            citationIDs: ["openrn_pharm_round17"]
        ),
        citations: [openfdaR17, openrnPharmR17, specialtyR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum CaspofunginSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "caspofungin",
        title: "Caspofungin",
        subtitle: "Cancidas · echinocandin antifungal · invasive Candida + Aspergillus salvage",
        category: "Echinocandin antifungal",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Echinocandin (β-1,3-glucan synthase inhibitor)"),
            KeyValueRow(key: "Indications", value: "Invasive candidiasis; empirical fungal therapy in neutropenic fever; refractory aspergillosis"),
            KeyValueRow(key: "Notable", value: "First-line for invasive Candida; once-daily IV; no PO formulation"),
            KeyValueRow(key: "Watch", value: "Hepatic adjustment in moderate impairment")
        ],
        indications: AttributedProse(
            "Treatment of invasive candidiasis (candidemia, abdominal abscess, peritonitis); empirical antifungal in neutropenic fever; refractory invasive aspergillosis per primary source.",
            citationIDs: ["openfda_round17", "specialty_round17"]
        ),
        mechanism: AttributedProse(
            "Inhibits β-1,3-D-glucan synthase → disrupts fungal cell wall synthesis → fungicidal against Candida spp.; fungistatic against Aspergillus.",
            citationIDs: ["openfda_round17"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "Loading 70 mg IV × 1, then 50 mg IV daily; reduce to 35 mg daily in moderate hepatic impairment per primary source.", citationIDs: ["openfda_round17"]),
            DosingBlock(label: "Pediatric (3 months–17 years)", body: "70 mg/m² loading, then 50 mg/m² daily.", citationIDs: ["openfda_round17"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        warnings: [
            AttributedBullet("Hepatic — dose reduction in moderate impairment; monitor LFTs.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Hypersensitivity / anaphylaxis — rare but reported.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Histamine-mediated infusion reactions — flushing, rash, hypotension; slow infusion + premedicate if previous.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Limited activity vs Cryptococcus, Fusarium, Mucorales — choose alternative.", citationIDs: ["specialty_round17"])
        ],
        adverseReactions: AttributedProse(
            "Phlebitis, headache, GI upset, transaminitis, fever, infusion reactions.",
            citationIDs: ["openfda_round17"]
        ),
        drugInteractions: [
            AttributedBullet("Cyclosporine — caspofungin levels increase + transaminitis; close monitoring.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Rifampin / phenytoin / efavirenz / dexamethasone — reduce caspofungin levels; consider increasing daily dose.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Tacrolimus — caspofungin reduces tacrolimus levels.", citationIDs: ["openfda_round17"])
        ],
        nursingImplications: [
            AttributedBullet("IV only; reconstitute per labeling; protect from light; daily infusion 60 minutes.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Baseline + periodic LFTs; coordinate with hepatology if dose adjustment needed.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Slow infusion if histamine reactions; antihistamine pretreatment as needed.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Monitor effect — clinical response + clearance of cultures.", citationIDs: ["specialty_round17"])
        ],
        patientTeaching: AttributedProse(
            "We're giving this medicine through your IV once a day for an invasive fungal infection. Tell us about flushing, hives, breathing trouble, or yellow eyes / skin.",
            citationIDs: ["openrn_pharm_round17"]
        ),
        citations: [openfdaR17, openrnPharmR17, specialtyR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum CisatracuriumSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cisatracurium",
        title: "Cisatracurium",
        subtitle: "Nimbex · benzylisoquinolinium NMBD · Hofmann elimination · ICU + ARDS paralysis",
        category: "Non-depolarizing neuromuscular blocker (intermediate-duration)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-depolarizing benzylisoquinolinium NMBD"),
            KeyValueRow(key: "Indications", value: "Operative + ICU paralysis; ARDS deep sedation in selected patients"),
            KeyValueRow(key: "Notable", value: "Hofmann elimination — no organ-dependent metabolism; preferred in renal / hepatic failure"),
            KeyValueRow(key: "Watch", value: "Histamine release minimal; awareness if inadequate sedation")
        ],
        indications: AttributedProse(
            "Skeletal muscle relaxation during surgery + mechanical ventilation. Preferred NMBD in renal / hepatic failure due to organ-independent elimination per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        mechanism: AttributedProse(
            "Competitive antagonist at nicotinic ACh receptors at neuromuscular junction → flaccid paralysis. Cleared by Hofmann elimination (spontaneous degradation at body pH + temperature) — independent of liver / kidney.",
            citationIDs: ["openfda_round17"]
        ),
        dosing: [
            DosingBlock(label: "Intubation", body: "0.15–0.2 mg/kg IV; onset 2–3 min; duration 45–60 min.", citationIDs: ["openfda_round17"]),
            DosingBlock(label: "ICU infusion (ARDS / refractory ventilation)", body: "1–3 mcg/kg/min IV titrated to TOF 1–2/4 per primary source.", citationIDs: ["specialty_round17"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to benzylisoquinolinium NMBDs per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        warnings: [
            AttributedBullet("AWARENESS UNDER PARALYSIS — patient cannot communicate distress; ENSURE adequate sedation before + during paralysis per primary source.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Prolonged paralysis after extended infusion — laudanosine accumulation (CNS effects, theoretical seizure risk).", citationIDs: ["openfda_round17"]),
            AttributedBullet("Critical illness myopathy / neuropathy — risk increases with duration + concurrent steroids.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Hypothermia + acidosis prolong duration.", citationIDs: ["openfda_round17"])
        ],
        adverseReactions: AttributedProse(
            "Bradycardia, hypotension (modest, less than atracurium), bronchospasm (rare), prolonged paralysis after extended infusion.",
            citationIDs: ["openfda_round17"]
        ),
        drugInteractions: [
            AttributedBullet("Aminoglycosides + clindamycin + magnesium — potentiate NMBD; recurarization.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Volatile anesthetics (sevoflurane, isoflurane) — potentiate NMBD; reduce dose.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Anticonvulsants (chronic phenytoin, carbamazepine) — induce metabolism (less relevant for cisatracurium given Hofmann).", citationIDs: ["openfda_round17"])
        ],
        nursingImplications: [
            AttributedBullet("ENSURE adequate sedation + analgesia BEFORE paralytic — patient cannot signal distress.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Continuous TOF monitoring; titrate to 1–2/4 twitches; reassess q4h.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Daily SAT (sedation interruption) per protocol if not contraindicated.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Eye care, DVT prophylaxis, pressure injury prevention, oral care, repositioning during paralysis.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Reverse with sugammadex (NOT effective for cisatracurium) OR neostigmine + glycopyrrolate (NOT for benzylisoquinolinium typically — Hofmann does the clearing) per primary source.", citationIDs: ["specialty_round17"])
        ],
        patientTeaching: AttributedProse(
            "This medication paralyzes your muscles temporarily so we can keep you on the ventilator. You will be sedated and asleep so you don't feel anything. We monitor you very closely.",
            citationIDs: ["openrn_pharm_round17"]
        ),
        citations: [openfdaR17, openrnPharmR17, specialtyR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum KetamineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ketamine",
        title: "Ketamine",
        subtitle: "NMDA antagonist · RSI / procedural sedation / refractory pain · sub-anesthetic for depression",
        category: "NMDA receptor antagonist (dissociative anesthetic)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Phencyclidine-derivative NMDA antagonist"),
            KeyValueRow(key: "Indications", value: "RSI / induction; procedural sedation; analgesia (sub-dissociative); refractory pain / depression"),
            KeyValueRow(key: "Notable", value: "Hemodynamic stability — preserves BP / HR (vs propofol drop)"),
            KeyValueRow(key: "Watch", value: "Emergence reactions, hypertension, laryngospasm, bladder cystitis (chronic abuse)")
        ],
        indications: AttributedProse(
            "Induction of anesthesia / RSI (especially in shock); procedural sedation; analgesia (sub-dissociative IV bolus / infusion); refractory chronic pain; treatment-resistant depression (off-label, esketamine FDA-approved separately) per primary source.",
            citationIDs: ["openfda_round17", "specialty_round17"]
        ),
        mechanism: AttributedProse(
            "Non-competitive NMDA receptor antagonist → dissociative anesthesia. Sympathomimetic effects via NE reuptake inhibition → preserved or increased BP / HR. Bronchodilation via anticholinergic + sympathomimetic effects.",
            citationIDs: ["openfda_round17"]
        ),
        dosing: [
            DosingBlock(label: "RSI / induction", body: "1–2 mg/kg IV (0.5 mg/kg if shock); rapid onset within 1 minute per primary source.", citationIDs: ["specialty_round17"]),
            DosingBlock(label: "Procedural sedation", body: "0.5–1 mg/kg IV with 0.25–0.5 mg/kg redoses.", citationIDs: ["specialty_round17"]),
            DosingBlock(label: "Sub-dissociative analgesia", body: "0.1–0.3 mg/kg IV bolus OR 0.1–0.4 mg/kg/hr infusion per primary source.", citationIDs: ["specialty_round17"]),
            DosingBlock(label: "IM (no IV access)", body: "4–6 mg/kg IM; useful in agitated or pediatric patients.", citationIDs: ["openfda_round17"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; severe hypertension / aortic dissection (relative); psychosis (relative — emergence) per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        warnings: [
            AttributedBullet("EMERGENCE REACTIONS — vivid dreams, hallucinations, dysphoria; reduce by quiet environment + co-benzodiazepine in adults per primary source.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Hypertension + tachycardia — caution in CAD / aortic dissection.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Increased ICP debate — not a strict contraindication in head trauma per current evidence.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Laryngospasm — uncommon; airway readiness.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Hypersalivation — pretreat with glycopyrrolate or atropine if concern.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Bladder cystitis with chronic abuse / high-dose chronic use.", citationIDs: ["openfda_round17"])
        ],
        adverseReactions: AttributedProse(
            "Emergence dysphoria, hypertension, tachycardia, laryngospasm, hypersalivation, vomiting, dissociation, vivid dreams.",
            citationIDs: ["openfda_round17"]
        ),
        drugInteractions: [
            AttributedBullet("Other sedatives — additive depression; benzodiazepine reduces emergence reactions.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Sympathomimetics — additive HTN.", citationIDs: ["openfda_round17"]),
            AttributedBullet("MAOIs — caution; theoretical hypertensive crisis.", citationIDs: ["openfda_round17"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous monitoring — cardiac, SpO2, capnography, BP; airway readiness.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Quiet recovery environment; low stimulation reduces emergence reactions.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Hypersalivation — pretreat with glycopyrrolate (preferred over atropine — non-CNS) if concerned.", citationIDs: ["specialty_round17"]),
            AttributedBullet("Counsel patients about possible vivid dreams + dissociation feelings.", citationIDs: ["openrn_pharm_round17"])
        ],
        patientTeaching: AttributedProse(
            "This medication will quickly put you into a sleep-like state for the procedure. You may have vivid dreams as you wake up; this is normal and goes away. Tell us if you feel anxious or scared as you recover.",
            citationIDs: ["openrn_pharm_round17"]
        ),
        citations: [openfdaR17, openrnPharmR17, specialtyR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PioglitazoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "pioglitazone",
        title: "Pioglitazone",
        subtitle: "Actos · TZD · insulin sensitizer · HF + bladder cancer + fracture risk",
        category: "Thiazolidinedione (TZD) — insulin sensitizer",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Thiazolidinedione (PPAR-γ agonist)"),
            KeyValueRow(key: "Indications", value: "Type 2 diabetes (adjunct or monotherapy)"),
            KeyValueRow(key: "Boxed", value: "May cause / worsen heart failure"),
            KeyValueRow(key: "Watch", value: "Bladder cancer signal (long-term use), bone fractures, edema, weight gain")
        ],
        indications: AttributedProse(
            "Treatment of type 2 diabetes mellitus as adjunct to diet + exercise; insulin sensitizer with durable A1c reduction per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        mechanism: AttributedProse(
            "Activates peroxisome proliferator-activated receptor gamma (PPAR-γ) → improved insulin sensitivity in adipose, muscle, liver → reduced hepatic glucose production + improved peripheral glucose disposal.",
            citationIDs: ["openfda_round17"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "15 mg PO daily; titrate to 30 mg or 45 mg max per primary source.", citationIDs: ["openfda_round17"]),
            DosingBlock(label: "With insulin / sulfonylurea", body: "Reduce dose of partner drug to limit hypoglycemia.", citationIDs: ["openfda_round17"])
        ],
        contraindications: AttributedProse(
            "NYHA class III / IV heart failure; active bladder cancer; severe hepatic impairment; pregnancy (relative) per primary source.",
            citationIDs: ["openfda_round17"]
        ),
        warnings: [
            AttributedBullet("BOXED — may cause / worsen heart failure; AVOID in HF, especially NYHA III/IV per primary source.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Bladder cancer signal — small risk increase with prolonged use; AVOID in active bladder cancer; counsel hematuria per primary source.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Fracture risk — increased in women; counsel falls + osteoporosis screening.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Edema + weight gain — fluid retention; especially with insulin.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Hepatotoxicity — rare; baseline + periodic LFTs.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Macular edema — rare; vision changes.", citationIDs: ["openfda_round17"])
        ],
        adverseReactions: AttributedProse(
            "Edema, weight gain, mild anemia (dilutional), bone fractures (especially women), hepatotoxicity (rare), macular edema (rare), bladder cancer signal.",
            citationIDs: ["openfda_round17"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP2C8 inhibitors (gemfibrozil) — increase pioglitazone levels; reduce dose.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Strong CYP2C8 inducers (rifampin) — reduce levels.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Insulin / sulfonylureas — additive hypoglycemia + edema.", citationIDs: ["openfda_round17"])
        ],
        nursingImplications: [
            AttributedBullet("Screen HF + bladder cancer history + family fracture / osteoporosis at baseline.", citationIDs: ["openfda_round17"]),
            AttributedBullet("Monitor weight, edema, dyspnea (HF signs); hematuria; visual changes.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Baseline + periodic LFTs.", citationIDs: ["openfda_round17"]),
            AttributedBullet("A1c response slow — 12 weeks for full effect.", citationIDs: ["openrn_pharm_round17"]),
            AttributedBullet("Counsel diet, exercise, foot care; coordinate with diabetes educator.", citationIDs: ["specialty_round17"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth daily. It takes about 3 months to see the full effect on blood sugar. Tell us about new shortness of breath, swelling, sudden weight gain, blood in your urine, or vision changes. This medicine can affect your bones — eat enough calcium + vitamin D + ask about bone-density screening.",
            citationIDs: ["openrn_pharm_round17"]
        ),
        citations: [openfdaR17, openrnPharmR17, specialtyR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}
