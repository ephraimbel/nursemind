import Foundation

// Curator-model continuous-infusion (drip) entries — batch 3.
// Fills the audited gaps in the titratable-infusion library: inodilation
// (milrinone), modern ICU sedation (dexmedetomidine, midazolam), HIT
// anticoagulation (argatroban, bivalirudin), and antiarrhythmic infusion
// (lidocaine). Sources: openFDA SPL (CC0), Open RN Nursing Pharmacology
// (CC BY 4.0), ISMP high-alert list (concept citation). All dosing is
// reference information from labeling — never directive. Tier-A RN review
// pre-publication (all entries: ISMP high-alert or HIT-critical).

private let openfda3 = CitationSource(
    id: "openfda_drips3",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-07-03"
)
private let openrn3 = CitationSource(
    id: "openrn_pharm_drips3",
    shortName: "Open RN Nursing Pharmacology — Critical Care",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-07-03"
)
private let ismp3 = CitationSource(
    id: "ismp_high_alert_2024_b3",
    shortName: "ISMP List of High-Alert Medications, 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-07-03"
)

// MARK: - Milrinone

public enum MilrinoneDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "milrinone-drip",
        title: "Milrinone (continuous infusion)",
        subtitle: "Inodilator — decompensated heart failure, cardiogenic shock",
        category: "Inodilator (PDE3 Inhibitor)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Phosphodiesterase-3 inhibitor"),
            KeyValueRow(key: "Effect", value: "Inotropy + vasodilation (\"inodilator\")"),
            KeyValueRow(key: "Half-life", value: "~2.3 hr (longer than catecholamines)"),
            KeyValueRow(key: "Clearance", value: "Renal — accumulates in kidney injury")
        ],
        indications: AttributedProse(
            "Short-term IV therapy for acutely decompensated heart failure with low cardiac output. Cardiogenic shock as an inotrope when beta-receptor pathways are blunted (e.g., chronic beta-blocker therapy). Right-ventricular failure and pulmonary hypertension settings per specialist direction.",
            citationIDs: ["openfda_drips3", "openrn_pharm_drips3"]
        ),
        mechanism: AttributedProse(
            "Inhibits phosphodiesterase-3, raising intracellular cAMP independent of beta receptors — increases contractility while relaxing vascular smooth muscle. The result is higher cardiac output with lower filling pressures and afterload, at the cost of vasodilation-driven hypotension.",
            citationIDs: ["openfda_drips3", "openrn_pharm_drips3"]
        ),
        dosing: [
            DosingBlock(label: "Loading (label; often omitted)", body: "50 mcg/kg IV over 10 minutes. Many institutions skip the load to avoid hypotension, especially in marginal blood pressure.", citationIDs: ["openfda_drips3", "openrn_pharm_drips3"]),
            DosingBlock(label: "Continuous infusion", body: "0.25–0.75 mcg/kg/min titrated to hemodynamic response.", citationIDs: ["openfda_drips3"]),
            DosingBlock(label: "Renal impairment", body: "Reduce infusion rate per label nomogram — clearance falls with creatinine clearance and the drug accumulates.", citationIDs: ["openfda_drips3"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Severe obstructive aortic or pulmonic valvular disease (vasodilation worsens the gradient).",
            citationIDs: ["openfda_drips3"]
        ),
        warnings: [
            AttributedBullet("Ventricular arrhythmias — PDE3 inhibition is arrhythmogenic; continuous ECG monitoring is mandatory and new ectopy is a report-now finding.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Hypotension — vasodilation can outpace the inotropic benefit, particularly with the loading dose or hypovolemia.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Long half-life for a titratable drug — effects (good and bad) persist for hours after rate changes or discontinuation, unlike catecholamines that fade in minutes.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Renal accumulation — a stable rate can become an overdose as kidney function declines; reassess with every creatinine.", citationIDs: ["openfda_drips3"])
        ],
        adverseReactions: AttributedProse(
            "Ventricular ectopy and arrhythmias, hypotension, headache, supraventricular arrhythmias, thrombocytopenia (uncommon).",
            citationIDs: ["openfda_drips3"]
        ),
        drugInteractions: [
            AttributedBullet("Other vasodilators and antihypertensives — additive hypotension.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Diuretics — hypovolemia amplifies the hypotensive response.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Catecholamine inotropes — additive arrhythmia risk; combinations are deliberate specialist choices.", citationIDs: ["openrn_pharm_drips3"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification at start, rate change, and bag change (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024_b3"]),
            AttributedBullet("Continuous ECG and frequent BP (arterial line common); report new ventricular ectopy and sustained hypotension immediately.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Track urine output and creatinine — dose lives downstream of the kidneys.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Anticipate slow offset: after weaning, keep monitoring — the drug is still working for hours.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("In shock states, expect milrinone to be paired with a vasopressor if MAP falls — know the plan before titrating.", citationIDs: ["openrn_pharm_drips3"])
        ],
        patientTeaching: AttributedProse(
            "This medication helps your heart pump more strongly while relaxing your blood vessels. You will be on continuous monitors; tell your nurse about palpitations, dizziness, or lightheadedness right away.",
            citationIDs: ["openrn_pharm_drips3"]
        ),
        citations: [openfda3, openrn3, ismp3],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Dexmedetomidine

public enum DexmedetomidineDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "dexmedetomidine-drip",
        title: "Dexmedetomidine (continuous infusion)",
        subtitle: "Precedex · alpha-2 agonist — cooperative ICU sedation",
        category: "Sedative (Alpha-2 Agonist)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective central alpha-2 agonist"),
            KeyValueRow(key: "Signature", value: "Sedation without respiratory depression"),
            KeyValueRow(key: "Onset", value: "~5–10 min; peak ~15–30 min"),
            KeyValueRow(key: "Half-life", value: "~2 hr")
        ],
        indications: AttributedProse(
            "Sedation of intubated and mechanically ventilated ICU patients, and sedation of non-intubated patients before/during procedures. Favored where arousable, cooperative sedation and preserved respiratory drive matter — including ventilator weaning and extubation windows.",
            citationIDs: ["openfda_drips3", "openrn_pharm_drips3"]
        ),
        mechanism: AttributedProse(
            "Selective agonism of central alpha-2 receptors in the locus coeruleus produces sedation resembling natural sleep, with analgesic-sparing effects and sympatholysis — reduced norepinephrine outflow explains both the calm and the hemodynamic side effects (bradycardia, hypotension).",
            citationIDs: ["openfda_drips3", "openrn_pharm_drips3"]
        ),
        dosing: [
            DosingBlock(label: "Loading (often omitted in ICU)", body: "1 mcg/kg over 10 minutes per label; many ICUs skip the load — it drives bradycardia and hypotension.", citationIDs: ["openfda_drips3", "openrn_pharm_drips3"]),
            DosingBlock(label: "Maintenance", body: "0.2–0.7 mcg/kg/hr per label, titrated to sedation goal (RASS); institutional protocols may titrate higher.", citationIDs: ["openfda_drips3", "openrn_pharm_drips3"]),
            DosingBlock(label: "Duration", body: "Labeled for ≤24 hr; longer use is common in practice per institutional protocol, with withdrawal-type effects (hypertension, tachycardia, agitation) reported after prolonged infusion.", citationIDs: ["openfda_drips3"])
        ],
        contraindications: AttributedProse(
            "No absolute label contraindications beyond hypersensitivity; use caution in advanced heart block, severe bradycardia, and hypovolemia.",
            citationIDs: ["openfda_drips3"]
        ),
        warnings: [
            AttributedBullet("Bradycardia and hypotension — the dominant adverse effects, especially with loading doses, hypovolemia, high vagal tone, or concurrent AV-nodal agents; asystole has been reported.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Transient hypertension during loading (peripheral alpha-2 vasoconstriction before central sympatholysis) — usually managed by slowing the load.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Not an amnestic at light levels and not reliable as a sole agent for deep sedation — patients are rousable by design; pair the sedation target to the clinical need.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Withdrawal phenomena after prolonged infusion — taper per protocol rather than stopping abruptly.", citationIDs: ["openfda_drips3"])
        ],
        adverseReactions: AttributedProse(
            "Bradycardia, hypotension, transient hypertension (loading), dry mouth, nausea; respiratory depression is notably absent at labeled doses.",
            citationIDs: ["openfda_drips3"]
        ),
        drugInteractions: [
            AttributedBullet("Beta-blockers, digoxin, amiodarone, diltiazem — additive bradycardia/AV block.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Other sedatives, opioids, anesthetics — additive sedative effect; reduce co-administered agents as needed.", citationIDs: ["openfda_drips3"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification at start, rate change, and bag change (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024_b3"]),
            AttributedBullet("Continuous ECG, BP, and SpO2; treat trending bradycardia as titration information, not background noise.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Assess with RASS on schedule; expect a patient who rouses to voice and follows commands at goal — that's the drug working, not failing.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Useful through extubation because respiratory drive is preserved — coordinate the sedation plan with the weaning plan.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("After days of use, taper per protocol and watch for rebound hypertension, tachycardia, and agitation.", citationIDs: ["openfda_drips3"])
        ],
        patientTeaching: AttributedProse(
            "This medication keeps you calm and comfortable but lets you wake easily when we speak to you — being rousable is expected and safe. Tell us about dizziness or feeling your heart beat slowly.",
            citationIDs: ["openrn_pharm_drips3"]
        ),
        citations: [openfda3, openrn3, ismp3],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Midazolam

public enum MidazolamDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "midazolam-drip",
        title: "Midazolam (continuous infusion)",
        subtitle: "Versed · benzodiazepine — ICU sedation, status epilepticus",
        category: "Benzodiazepine Sedative",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Short-acting benzodiazepine"),
            KeyValueRow(key: "Onset", value: "2–5 min IV"),
            KeyValueRow(key: "Half-life", value: "~3 hr single dose; effective duration extends markedly with infusion"),
            KeyValueRow(key: "Metabolite", value: "Active, renally cleared — accumulates in kidney injury")
        ],
        indications: AttributedProse(
            "Continuous sedation of mechanically ventilated patients (typically when deeper sedation is required or other agents are unsuitable). Refractory status epilepticus per neurocritical protocols. Procedural sedation as intermittent dosing.",
            citationIDs: ["openfda_drips3", "openrn_pharm_drips3"]
        ),
        mechanism: AttributedProse(
            "Potentiates GABA-A receptor chloride conductance — sedation, anxiolysis, amnesia, and anticonvulsant effect, with dose-dependent respiratory depression. Lipophilic: fast in, but tissue stores and an active renally-cleared metabolite make it slow out after prolonged infusion.",
            citationIDs: ["openfda_drips3", "openrn_pharm_drips3"]
        ),
        dosing: [
            DosingBlock(label: "ICU sedation (intubated)", body: "Loading 0.01–0.05 mg/kg IV, then 0.02–0.1 mg/kg/hr titrated to sedation goal.", citationIDs: ["openfda_drips3"]),
            DosingBlock(label: "Status epilepticus", body: "Per neurocritical/institutional protocol — bolus followed by titrated infusion, typically with continuous EEG guidance.", citationIDs: ["openrn_pharm_drips3"]),
            DosingBlock(label: "Renal impairment / prolonged use", body: "Expect accumulation of the active metabolite; sedation may persist days after discontinuation.", citationIDs: ["openfda_drips3"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Acute narrow-angle glaucoma. Use without airway support in severe respiratory insufficiency.",
            citationIDs: ["openfda_drips3"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: respiratory depression and arrest, particularly with opioids or other CNS depressants — the combination drives most benzodiazepine deaths in hospitals.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Delirium association — prolonged benzodiazepine sedation is linked with more ICU delirium and longer ventilation than non-benzodiazepine strategies; many protocols reserve it for specific indications.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Accumulation — obesity, renal impairment, and long infusions extend wake-up unpredictably; 'off the drip' is not 'out of the patient.'", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Tolerance and withdrawal — taper after prolonged use; abrupt discontinuation risks agitation and seizures.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Flumazenil reversal is hazardous in dependent patients and prolonged infusions — it can precipitate seizures; airway support is the primary rescue.", citationIDs: ["openfda_drips3"])
        ],
        adverseReactions: AttributedProse(
            "Respiratory depression, hypotension (especially hypovolemic patients), prolonged sedation, delirium, paradoxical agitation (more common at age extremes), phlebitis.",
            citationIDs: ["openfda_drips3"]
        ),
        drugInteractions: [
            AttributedBullet("Opioids, propofol, other CNS depressants — additive respiratory and hemodynamic depression.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("CYP3A4 inhibitors (azoles, macrolides, protease inhibitors) — raise midazolam levels substantially.", citationIDs: ["openfda_drips3"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification at start, rate change, and bag change (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024_b3"]),
            AttributedBullet("Continuous SpO2 and capnography per policy, RASS on schedule, and daily sedation interruption per protocol — this drug punishes set-and-forget.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Screen for delirium (e.g., CAM-ICU) — emerging delirium is a reason to revisit the sedation strategy with the team.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Chart cumulative exposure context (renal function, days of infusion) and expect delayed emergence; communicate it forward at handoff.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("In status epilepticus, coordinate with EEG monitoring — the sedation target is seizure control, not a RASS number.", citationIDs: ["openrn_pharm_drips3"])
        ],
        patientTeaching: AttributedProse(
            "This medication keeps you deeply relaxed and usually prevents memory of the period while you need it. As you recover, we will lower it gradually; grogginess can linger and is expected.",
            citationIDs: ["openrn_pharm_drips3"]
        ),
        citations: [openfda3, openrn3, ismp3],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Argatroban

public enum ArgatrobanDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "argatroban-drip",
        title: "Argatroban (continuous infusion)",
        subtitle: "Direct thrombin inhibitor — anticoagulation in HIT",
        category: "Anticoagulant (Direct Thrombin Inhibitor)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Direct thrombin inhibitor (DTI)"),
            KeyValueRow(key: "Niche", value: "Anticoagulation when heparin is forbidden (HIT)"),
            KeyValueRow(key: "Half-life", value: "~40–50 min"),
            KeyValueRow(key: "Clearance", value: "Hepatic — reduce in liver impairment"),
            KeyValueRow(key: "Reversal", value: "None — stop the drip; short half-life is the safety net")
        ],
        indications: AttributedProse(
            "Prophylaxis or treatment of thrombosis in heparin-induced thrombocytopenia (HIT), and anticoagulation during PCI in patients with or at risk of HIT. In HIT, all heparin exposure stops — including flushes and coated lines — and a DTI carries the anticoagulation.",
            citationIDs: ["openfda_drips3", "openrn_pharm_drips3"]
        ),
        mechanism: AttributedProse(
            "Binds directly and reversibly to the thrombin active site — inhibits fibrin formation, platelet activation, and clot-bound thrombin without requiring antithrombin, and without any cross-reactivity with HIT antibodies.",
            citationIDs: ["openfda_drips3"]
        ),
        dosing: [
            DosingBlock(label: "HIT (label)", body: "2 mcg/kg/min initial infusion, titrated to aPTT 1.5–3× baseline (not to exceed label maximum); no bolus.", citationIDs: ["openfda_drips3"]),
            DosingBlock(label: "Hepatic impairment / critical illness", body: "Reduced starting rates per label and institutional protocol (commonly 0.5–1.2 mcg/kg/min) — hepatic clearance falls in liver disease, heart failure, and multiorgan dysfunction.", citationIDs: ["openfda_drips3"]),
            DosingBlock(label: "Monitoring", body: "aPTT at baseline and ~2 hr after start and after every rate change, then per protocol once stable.", citationIDs: ["openfda_drips3"])
        ],
        contraindications: AttributedProse(
            "Overt major bleeding. Hypersensitivity.",
            citationIDs: ["openfda_drips3"]
        ),
        warnings: [
            AttributedBullet("Bleeding is the singular hazard — there is no reversal agent; management is stopping the infusion and supportive care, relying on the short half-life.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Argatroban elevates the INR independent of warfarin effect — during transition to warfarin, standard INR targets mislead; follow the label/institutional co-therapy conversion process.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Hepatic impairment prolongs effect substantially — starting-rate reduction is not optional.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("In HIT, the platelet count is the disease marker — continue trending it, and remember thrombosis (not bleeding) is what kills untreated HIT patients.", citationIDs: ["openrn_pharm_drips3"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (any site — GI, GU, access sites, intracranial), hypotension, fever, diarrhea; allergic reactions uncommon.",
            citationIDs: ["openfda_drips3"]
        ),
        drugInteractions: [
            AttributedBullet("Other anticoagulants and antiplatelets — additive bleeding; heparin must be fully discontinued before starting.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Warfarin — combined INR elevation complicates conversion; use the label's co-therapy interpretation guidance.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Thrombolytics — markedly increased bleeding risk.", citationIDs: ["openfda_drips3"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification at start, rate change, and bag change (ISMP high-alert antithrombotic).", citationIDs: ["ismp_high_alert_2024_b3"]),
            AttributedBullet("Purge heparin from the patient's world: flushes, pre-filled syringes, heparin-coated catheters, and any standing orders — HIT means zero exposure.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Draw aPTTs on time — the titration is only as good as the lab cadence; chart rate changes against results.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Bleeding surveillance every shift: neuro checks, urine/stool/drain appearance, access sites, hemoglobin trend.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Trend platelets — recovery supports the HIT diagnosis and shapes the transition plan to an oral agent.", citationIDs: ["openrn_pharm_drips3"])
        ],
        patientTeaching: AttributedProse(
            "You developed a reaction to heparin, so we are using a different blood thinner that works immediately and wears off quickly. Tell us right away about any bleeding, new bruising, dark stools, or headaches.",
            citationIDs: ["openrn_pharm_drips3"]
        ),
        citations: [openfda3, openrn3, ismp3],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Bivalirudin

public enum BivalirudinDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "bivalirudin-drip",
        title: "Bivalirudin (continuous infusion)",
        subtitle: "Angiomax · direct thrombin inhibitor — PCI, HIT alternative",
        category: "Anticoagulant (Direct Thrombin Inhibitor)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Direct thrombin inhibitor (DTI)"),
            KeyValueRow(key: "Half-life", value: "~25 min (normal renal function)"),
            KeyValueRow(key: "Clearance", value: "Proteolysis + renal — adjust for kidney function"),
            KeyValueRow(key: "Reversal", value: "None — stop infusion; effect fades fastest of the DTIs")
        ],
        indications: AttributedProse(
            "Anticoagulation during percutaneous coronary intervention (PCI), including patients with or at risk of HIT. Off-label continuous infusion for HIT anticoagulation per institutional protocol, particularly when renal-based dosing is preferred over hepatic (argatroban).",
            citationIDs: ["openfda_drips3", "openrn_pharm_drips3"]
        ),
        mechanism: AttributedProse(
            "Bivalent direct thrombin inhibitor — binds both the active site and exosite of thrombin, inhibiting free and clot-bound thrombin. No antithrombin dependence, no HIT antibody cross-reactivity, and a very short half-life driven partly by thrombin itself cleaving the drug.",
            citationIDs: ["openfda_drips3"]
        ),
        dosing: [
            DosingBlock(label: "PCI (label)", body: "0.75 mg/kg IV bolus, then 1.75 mg/kg/hr for the duration of the procedure; post-procedure continuation per label/protocol.", citationIDs: ["openfda_drips3"]),
            DosingBlock(label: "HIT (institutional, off-label)", body: "Lower continuous rates titrated to aPTT per protocol (commonly starting near 0.15 mg/kg/hr with renal adjustment).", citationIDs: ["openrn_pharm_drips3"]),
            DosingBlock(label: "Renal impairment", body: "Reduce infusion rate per label as GFR falls; effect prolongs in kidney injury and dialysis.", citationIDs: ["openfda_drips3"])
        ],
        contraindications: AttributedProse(
            "Active major bleeding. Hypersensitivity.",
            citationIDs: ["openfda_drips3"]
        ),
        warnings: [
            AttributedBullet("Bleeding without a reversal agent — as with all DTIs, management is discontinuation and support; the ~25-minute half-life is the built-in rescue.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Renal function is the dose: unlike argatroban's hepatic story, bivalirudin accumulates as GFR falls — a creatinine bump is a rate conversation.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Acute stent thrombosis has been observed after primary PCI when infusion stops early — post-procedure infusion decisions belong to the interventional team.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("aPTT correlates with effect for infusion titration per protocol; point-of-care ACT is used in the cath lab.", citationIDs: ["openrn_pharm_drips3"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (access site most common post-PCI), hypotension, back pain, nausea, headache; thrombocytopenia is not an expected effect.",
            citationIDs: ["openfda_drips3"]
        ),
        drugInteractions: [
            AttributedBullet("Other anticoagulants, antiplatelets, thrombolytics — additive bleeding risk (often deliberate in PCI regimens; know the intended combination).", citationIDs: ["openfda_drips3"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification at start, rate change, and bag change (ISMP high-alert antithrombotic).", citationIDs: ["ismp_high_alert_2024_b3"]),
            AttributedBullet("Post-PCI: femoral/radial access site checks on schedule — hematoma, retroperitoneal bleeding signs (back/flank pain, hypotension), distal pulses.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("For HIT use: same zero-heparin discipline as argatroban — flushes, coated lines, everything.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Time labs to the titration protocol and re-verify rate against the current weight and renal function.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Because offset is fast, unexplained loss of anticoagulation effect (clotted lines, new thrombosis signs) should prompt an infusion-integrity check — pump, line, and site.", citationIDs: ["openrn_pharm_drips3"])
        ],
        patientTeaching: AttributedProse(
            "This blood thinner works immediately and leaves your system quickly once stopped. Tell us right away about bleeding, swelling or pain at your catheter site, or back pain.",
            citationIDs: ["openrn_pharm_drips3"]
        ),
        citations: [openfda3, openrn3, ismp3],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Lidocaine (antiarrhythmic infusion)

public enum LidocaineDripSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lidocaine-drip",
        title: "Lidocaine (continuous infusion)",
        subtitle: "Class Ib antiarrhythmic — ventricular arrhythmias",
        category: "Antiarrhythmic (Class Ib)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Class Ib sodium-channel blocker"),
            KeyValueRow(key: "Onset", value: "Rapid IV"),
            KeyValueRow(key: "Clearance", value: "Hepatic, flow-dependent — reduce in liver disease, heart failure, shock, elderly"),
            KeyValueRow(key: "Toxicity pattern", value: "CNS first, cardiac second")
        ],
        indications: AttributedProse(
            "Ventricular arrhythmias (VT, post-arrest ectopy) as an alternative to amiodarone per ACLS-era and institutional protocols. Historically used post-MI; current use is targeted, not prophylactic.",
            citationIDs: ["openfda_drips3", "openrn_pharm_drips3"]
        ),
        mechanism: AttributedProse(
            "Blocks fast sodium channels preferentially in depolarized and ischemic ventricular tissue, suppressing automaticity and re-entry with minimal effect on normal conduction — which is why it treats ventricular arrhythmias without much impact on atrial ones.",
            citationIDs: ["openfda_drips3"]
        ),
        dosing: [
            DosingBlock(label: "Bolus (reference)", body: "1–1.5 mg/kg IV; repeat smaller boluses per protocol to a cumulative label maximum.", citationIDs: ["openfda_drips3"]),
            DosingBlock(label: "Continuous infusion", body: "1–4 mg/min, titrated to arrhythmia control.", citationIDs: ["openfda_drips3"]),
            DosingBlock(label: "Reduced clearance states", body: "Heart failure, hepatic disease, shock, and advanced age lower clearance — lower rates and heightened toxicity surveillance; serum levels for infusions beyond ~24 hr per protocol.", citationIDs: ["openfda_drips3"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to amide local anesthetics. Severe SA/AV/intraventricular block without a pacemaker. Stokes-Adams and Wolff-Parkinson-White syndromes per label.",
            citationIDs: ["openfda_drips3"]
        ),
        warnings: [
            AttributedBullet("CNS toxicity is the early-warning system, in rough order: perioral numbness, metallic taste, tinnitus, lightheadedness, visual changes, slurred speech, confusion, tremor — then seizures. Any of these is a stop-and-call finding.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Cardiac toxicity follows CNS: bradycardia, heart block, hypotension, and at extremes cardiovascular collapse.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("The infusion outlives the liver's headroom — toxicity often appears after 12–24 hours of a 'stable' rate as levels quietly climb, especially in low-output states.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Elderly patients manifest confusion as the presenting sign — easily misread as ICU delirium; check the infusion before blaming the environment.", citationIDs: ["openrn_pharm_drips3"])
        ],
        adverseReactions: AttributedProse(
            "Drowsiness, dizziness, perioral paresthesia, tinnitus, confusion, tremor, seizures, bradycardia, hypotension, heart block.",
            citationIDs: ["openfda_drips3"]
        ),
        drugInteractions: [
            AttributedBullet("Beta-blockers and cimetidine — reduce hepatic blood flow/metabolism, raising lidocaine levels.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Other antiarrhythmics — additive conduction effects.", citationIDs: ["openfda_drips3"]),
            AttributedBullet("Amiodarone — pharmacodynamic overlap and elevated levels reported.", citationIDs: ["openfda_drips3"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification at start, rate change, and bag change (ISMP high-alert IV antiarrhythmic).", citationIDs: ["ismp_high_alert_2024_b3"]),
            AttributedBullet("Continuous ECG — document rhythm response; the drip exists to suppress a specific arrhythmia, so chart whether it is.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Scheduled neuro checks aimed at early toxicity: ask about numbness around the mouth, ringing ears, and new confusion — the patient reports toxicity before the monitor shows it.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Flag reduced-clearance physiology (HF, liver disease, shock, age) on the kardex and anticipate serum levels for infusions beyond ~24 hr.", citationIDs: ["openrn_pharm_drips3"]),
            AttributedBullet("Seizure response readiness — suction and airway equipment at hand; toxicity seizures are managed per protocol after stopping the infusion.", citationIDs: ["openrn_pharm_drips3"])
        ],
        patientTeaching: AttributedProse(
            "This medication calms an irregular heart rhythm. Tell your nurse immediately about numbness or tingling around your mouth, ringing in your ears, or feeling unusually confused — those are signs we need to adjust it.",
            citationIDs: ["openrn_pharm_drips3"]
        ),
        citations: [openfda3, openrn3, ismp3],
        lastSourceFidelityReview: "2026-07-03"
    )
}
