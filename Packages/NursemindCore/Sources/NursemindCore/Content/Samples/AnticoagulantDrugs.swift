import Foundation

// Shared citations for the anticoagulant cluster
private let openfda = CitationSource(
    id: "openfda_generic",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-03"
)
private let openrn = CitationSource(
    id: "openrn_pharm_anticoag",
    shortName: "Open RN Nursing Pharmacology — Anticoagulant Therapy",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
    lastRetrieved: "2026-05-03"
)
private let ismp = CitationSource(
    id: "ismp_high_alert_2024",
    shortName: "ISMP List of High-Alert Medications, 2024",
    detail: "Anticoagulants are an ISMP high-alert class",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-03"
)

// MARK: - Warfarin

public enum WarfarinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "warfarin",
        title: "Warfarin",
        subtitle: "Coumadin · Jantoven · vitamin K antagonist",
        category: "Oral Anticoagulant",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Vitamin K antagonist"),
            KeyValueRow(key: "Onset", value: "3–5 days for full effect"),
            KeyValueRow(key: "Half-life", value: "20–60 hr"),
            KeyValueRow(key: "Reversal", value: "Vitamin K, FFP, 4-factor PCC"),
            KeyValueRow(key: "Goal INR", value: "2.0–3.0 (most uses); 2.5–3.5 mech mitral valve")
        ],
        indications: AttributedProse(
            "Prevention and treatment of venous thrombosis and pulmonary embolism; thromboembolism prophylaxis in atrial fibrillation, mechanical heart valves, and post-MI; reduction of stroke risk in valvular and nonvalvular AFib.",
            citationIDs: ["openfda_generic"]
        ),
        mechanism: AttributedProse(
            "Inhibits the vitamin-K-dependent synthesis of clotting factors II, VII, IX, and X, plus proteins C and S — slowing the extrinsic and intrinsic clotting cascade.",
            citationIDs: ["openfda_generic"]
        ),
        dosing: [
            DosingBlock(label: "Initiation", body: "5 mg PO daily for 2 days, then adjust based on INR. Lower dose (2.5 mg) for elderly, malnourished, hepatic impairment, or concurrent interacting drugs.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Maintenance", body: "2–10 mg PO daily based on INR; same time daily.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Bridging", body: "Often co-administered with heparin/LMWH for 5+ days during initiation until INR therapeutic for 24 hours.", citationIDs: ["openrn_pharm_anticoag"])
        ],
        contraindications: AttributedProse(
            "Pregnancy (boxed warning — fetal/embryo toxicity), hemorrhagic tendencies, recent CNS/eye surgery, malignant hypertension, untreated HTN, regional anesthesia with bleeding risk, hypersensitivity.",
            citationIDs: ["openfda_generic"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: bleeding can be fatal — major bleeding risk increases with INR >4 and concurrent antiplatelets.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Pregnancy: warfarin embryopathy with first-trimester exposure; do not use in pregnancy.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Skin necrosis and gangrene — rare; typically days 3–10 of therapy in patients with protein C/S deficiency.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Diet matters: vitamin-K-rich foods (kale, spinach, broccoli, Brussels sprouts) reduce effect — keep intake CONSISTENT, not zero.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Many drug interactions — antibiotics, amiodarone, fluconazole, NSAIDs, SSRIs all alter INR.", citationIDs: ["openfda_generic"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (mild bruising to major hemorrhage), purple-toe syndrome, skin necrosis (rare), warfarin-induced osteoporosis (long-term).",
            citationIDs: ["openfda_generic"]
        ),
        drugInteractions: [
            AttributedBullet("Amiodarone — increases INR markedly; reduce warfarin dose by ⅓–½.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Antibiotics (fluoroquinolones, metronidazole, sulfa, macrolides) — increase INR via flora and CYP effects.", citationIDs: ["openfda_generic"]),
            AttributedBullet("NSAIDs and SSRIs — additive bleeding risk.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Vitamin K, rifampin, carbamazepine — DECREASE INR.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification of dose at initiation and any change (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Monitor INR daily during initiation, then weekly to monthly once stable.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Bleeding precautions: soft toothbrush, electric razor, pad placement, no IM injections, no rectal temps.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Patient education on consistent vitamin K intake, NOT avoidance.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Reconcile new medications with provider/pharmacy — almost everything interacts.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Reversal: vitamin K (PO/IV depending on urgency) for non-life-threatening; 4-factor PCC for major bleeding.", citationIDs: ["openrn_pharm_anticoag"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same time daily. Keep your vitamin K intake consistent — same amount of greens each week. Avoid alcohol excess. Use a soft toothbrush. Tell every provider you're on warfarin before any procedure. Wear a medical ID bracelet. Report any unusual bruising, dark or bloody stools, severe headache, or pink/red urine immediately.",
            citationIDs: ["openrn_pharm_anticoag"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Aspirin (proper antiplatelet monograph)

public enum AspirinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "aspirin",
        title: "Aspirin",
        subtitle: "ASA · acetylsalicylic acid · antiplatelet / NSAID",
        category: "Antiplatelet",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "COX-1/COX-2 inhibitor (irreversible)"),
            KeyValueRow(key: "Antiplatelet effect", value: "81 mg daily (lifetime of platelet, 7–10 days)"),
            KeyValueRow(key: "Onset", value: "20–30 min (chewed in ACS)"),
            KeyValueRow(key: "Reye risk", value: "Avoid in children with viral illness")
        ],
        indications: AttributedProse(
            "Secondary prevention of cardiovascular events (MI, stroke, ACS), acute MI / ACS (162–325 mg chewed), stroke (non-hemorrhagic) prophylaxis, antiplatelet therapy after PCI, anti-inflammatory and antipyretic at higher doses.",
            citationIDs: ["openfda_generic"]
        ),
        mechanism: AttributedProse(
            "Irreversibly inhibits platelet COX-1 → blocks thromboxane A₂ synthesis → reduced platelet aggregation. Effect lasts the lifetime of the platelet (7–10 days).",
            citationIDs: ["openfda_generic"]
        ),
        dosing: [
            DosingBlock(label: "Antiplatelet (chronic)", body: "81 mg PO daily.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Acute MI / ACS", body: "162–325 mg chewed and swallowed at first suspicion of ACS — non-enteric-coated for fastest absorption.", citationIDs: ["openrn_pharm_anticoag"]),
            DosingBlock(label: "Anti-inflammatory", body: "650–1000 mg every 4–6 hours; max 4 g/day.", citationIDs: ["openfda_generic"])
        ],
        contraindications: AttributedProse(
            "Active GI bleeding or peptic ulcer, hypersensitivity (esp. asthma triad — Samter's), bleeding disorders, children with viral illness (Reye's risk), severe hepatic or renal impairment.",
            citationIDs: ["openfda_generic"]
        ),
        warnings: [
            AttributedBullet("GI bleeding — consider PPI co-prescription in long-term high-risk patients.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Reye's syndrome in children with viral illness — NEVER give aspirin to a child with chicken pox or flu-like illness.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Aspirin-exacerbated respiratory disease (Samter's triad: asthma, nasal polyps, ASA sensitivity) — can trigger severe bronchospasm.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Tinnitus is an early sign of salicylate toxicity.", citationIDs: ["openrn_pharm_anticoag"])
        ],
        adverseReactions: AttributedProse(
            "Common: GI upset, dyspepsia, occult GI blood loss, easy bruising. Less common: tinnitus (salicylism), allergic reactions, bronchospasm.",
            citationIDs: ["openfda_generic"]
        ),
        drugInteractions: [
            AttributedBullet("Other anticoagulants and antiplatelets (warfarin, DOACs, clopidogrel, heparin) — additive bleeding.", citationIDs: ["openfda_generic"]),
            AttributedBullet("NSAIDs (ibuprofen) — may compete for COX-1 binding; take aspirin first or 8 hours apart.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Methotrexate — aspirin reduces clearance, increases toxicity.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("In suspected ACS: 162–325 mg CHEWED (not swallowed whole) for fastest platelet inhibition.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Hold 7–10 days before elective surgery (per surgeon) — irreversible platelet effect.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Take with food to reduce GI upset.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Counsel against giving to children/teens with febrile viral illness.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Tinnitus or hearing changes can indicate salicylate toxicity at higher doses.", citationIDs: ["openrn_pharm_anticoag"])
        ],
        patientTeaching: AttributedProse(
            "Take with food. Do not chew enteric-coated aspirin (defeats the coating). Tell every provider/dentist you're on aspirin. Avoid combining with ibuprofen unless directed. Stop and call provider for black stools, severe headache, ringing in ears, or unusual bruising.",
            citationIDs: ["openrn_pharm_anticoag"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Clopidogrel

public enum ClopidogrelSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "clopidogrel",
        title: "Clopidogrel",
        subtitle: "Plavix · P2Y12 antiplatelet",
        category: "Antiplatelet",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "P2Y12 platelet receptor inhibitor"),
            KeyValueRow(key: "Onset", value: "2 hr (with loading dose)"),
            KeyValueRow(key: "Half-life of effect", value: "Lifetime of platelet (7–10 days)"),
            KeyValueRow(key: "Common combo", value: "DAPT with aspirin post-PCI")
        ],
        indications: AttributedProse(
            "Reduction of MI and stroke in patients with ACS (with or without PCI), recent MI, recent ischemic stroke, established peripheral arterial disease. Dual antiplatelet therapy (with aspirin) post-stent placement.",
            citationIDs: ["openfda_generic"]
        ),
        mechanism: AttributedProse(
            "Irreversibly blocks the P2Y12 ADP receptor on platelets, preventing ADP-mediated activation and aggregation.",
            citationIDs: ["openfda_generic"]
        ),
        dosing: [
            DosingBlock(label: "Loading dose (ACS/PCI)", body: "300–600 mg PO × 1.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Maintenance", body: "75 mg PO daily.", citationIDs: ["openfda_generic"])
        ],
        contraindications: AttributedProse(
            "Active pathological bleeding (peptic ulcer, intracranial hemorrhage). Hypersensitivity to clopidogrel.",
            citationIDs: ["openfda_generic"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: reduced effectiveness in CYP2C19 poor metabolizers — some institutions genotype.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Bleeding risk — additive with other antiplatelets and anticoagulants.", citationIDs: ["openfda_generic"]),
            AttributedBullet("TTP (thrombotic thrombocytopenic purpura) — rare but life-threatening.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Hold 5–7 days before elective surgery (per surgeon).", citationIDs: ["openfda_generic"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (most common), bruising, GI upset, rash, rare TTP.",
            citationIDs: ["openfda_generic"]
        ),
        drugInteractions: [
            AttributedBullet("PPIs — omeprazole inhibits CYP2C19; pantoprazole has minimal interaction (preferred PPI).", citationIDs: ["openfda_generic"]),
            AttributedBullet("Other antiplatelets and anticoagulants — additive bleeding.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm DAPT plan (clopidogrel + aspirin) is intentional — common error to drop one prematurely after PCI.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Bleeding precautions per facility.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Verify hold timing before procedures (typically 5–7 days for elective surgery).", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Pantoprazole preferred over omeprazole if PPI is needed.", citationIDs: ["openrn_pharm_anticoag"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same time daily. Do NOT stop without talking to your cardiologist — stopping early after a stent can cause clot in the stent. Bleeding precautions. Tell every provider before procedures.",
            citationIDs: ["openrn_pharm_anticoag"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Enoxaparin (Lovenox)

public enum EnoxaparinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "enoxaparin",
        title: "Enoxaparin",
        subtitle: "Lovenox · low-molecular-weight heparin (LMWH)",
        category: "Anticoagulant — LMWH",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "LMWH (factor Xa preferential)"),
            KeyValueRow(key: "Onset", value: "3–5 hr (SC)"),
            KeyValueRow(key: "Half-life", value: "4.5–7 hr"),
            KeyValueRow(key: "Renal dose adjustment", value: "Yes — caution if CrCl <30")
        ],
        indications: AttributedProse(
            "Prophylaxis and treatment of DVT/PE, ACS (NSTEMI/unstable angina), bridging in atrial fibrillation around procedures.",
            citationIDs: ["openfda_generic"]
        ),
        mechanism: AttributedProse(
            "Binds antithrombin III; preferentially inhibits factor Xa (more so than IIa unlike unfractionated heparin), with more predictable pharmacokinetics.",
            citationIDs: ["openfda_generic"]
        ),
        dosing: [
            DosingBlock(label: "DVT/PE prophylaxis", body: "40 mg SC once daily (or 30 mg SC twice daily for orthopedic surgery).", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "DVT/PE treatment", body: "1 mg/kg SC every 12 hours OR 1.5 mg/kg SC once daily.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "ACS (unstable angina/NSTEMI)", body: "1 mg/kg SC every 12 hours, with aspirin.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Renal impairment (CrCl <30)", body: "Reduce treatment dose to 1 mg/kg SC once daily; use lab monitoring.", citationIDs: ["openfda_generic"])
        ],
        contraindications: AttributedProse(
            "Active major bleeding, history of HIT (cross-reacts with unfractionated heparin), hypersensitivity to heparin or pork.",
            citationIDs: ["openfda_generic"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: spinal/epidural hematoma risk with neuraxial anesthesia or lumbar puncture; hold per facility protocol.", citationIDs: ["openfda_generic"]),
            AttributedBullet("HIT — though lower risk than UFH, can occur. Monitor platelets.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Renal impairment — accumulates; dose-adjust and consider anti-Xa monitoring.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Bleeding — major bleeding risk.", citationIDs: ["openfda_generic"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding, injection site pain/bruising, anemia (with prolonged use), thrombocytopenia, elevated LFTs.",
            citationIDs: ["openfda_generic"]
        ),
        drugInteractions: [
            AttributedBullet("Other anticoagulants/antiplatelets — additive bleeding.", citationIDs: ["openfda_generic"]),
            AttributedBullet("NSAIDs — additive bleeding.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Inject deep SC at 90° angle in love handle — pinch and don't aspirate, don't expel air bubble in pre-filled syringe.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Rotate sites; do not rub after injection.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Monitor platelets and CBC; bleeding precautions.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Hold 24 hours before invasive procedures (12 hours for prophylactic dose); confirm with provider.", citationIDs: ["openrn_pharm_anticoag"]),
            AttributedBullet("Reversal: protamine partially reverses enoxaparin (~60% — less effective than for UFH).", citationIDs: ["openrn_pharm_anticoag"])
        ],
        patientTeaching: AttributedProse(
            "Inject in your love-handle area; rotate sites. Don't rub the site. The pre-filled syringe air bubble is intentional — do not expel. Bleeding precautions. Tell all providers.",
            citationIDs: ["openrn_pharm_anticoag"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-03"
    )
}
