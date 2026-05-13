import Foundation

// Curator-model drug entries (round 32 — critical care depth: inotropes + DTIs + HTN crisis IV + antidotes + HAE + rFVIIa + antiarrhythmic).

private let openfdaR32 = CitationSource(
    id: "openfda_round32",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-05-13"
)
private let openrnPharmR32 = CitationSource(
    id: "openrn_pharm_round32",
    shortName: "Open RN Pharmacology + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-13"
)
private let specialtyR32 = CitationSource(
    id: "specialty_round32",
    shortName: "SCCM + ACCP + AHA + ESC + ESICM concept citations",
    publisher: "SCCM · ACCP · AHA · ESC · ESICM",
    license: .factCitationOnly,
    url: "https://www.sccm.org/Clinical-Resources/",
    lastRetrieved: "2026-05-13"
)
private let ismpR32 = CitationSource(
    id: "ismp_round32",
    shortName: "ISMP High-Alert Medications 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-13"
)

public enum MilrinoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "milrinone",
        title: "Milrinone (Primacor)",
        subtitle: "PDE-3 inhibitor inodilator · ADHF + cardiogenic shock + bridge to transplant · BOXED arrhythmia · increased mortality long-term · BP-dependent",
        category: "PDE-3 inhibitor inotrope-vasodilator (inodilator) — ADHF + cardiogenic shock + bridge to transplant",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Phosphodiesterase-3 (PDE-3) inhibitor → increases cAMP in myocardium (inotropy) + vascular smooth muscle (vasodilation) → \"inodilator\""),
            KeyValueRow(key: "Use", value: "Acute decompensated heart failure (ADHF) bridge therapy, cardiogenic shock + low cardiac output state, weaning from cardiopulmonary bypass, pulmonary hypertension acute therapy, bridge to LVAD/transplant"),
            KeyValueRow(key: "Dose", value: "Loading 50 mcg/kg IV over 10 minutes (often skipped to avoid hypotension), then 0.25-0.75 mcg/kg/min IV continuous infusion; renal dose adjust"),
            KeyValueRow(key: "Monitor", value: "Continuous ECG (arrhythmia risk), continuous BP (hypotension), renal function, electrolytes, signs of hypoperfusion + response (lactate, urine output, mentation)"),
            KeyValueRow(key: "Watch", value: "BOXED — ventricular arrhythmias + INCREASED MORTALITY long-term in chronic HF; HYPOTENSION (avoid loading if borderline BP); renal accumulation; thrombocytopenia; HIGH-ALERT")
        ],
        indications: AttributedProse(
            "Acute decompensated heart failure with low cardiac output + relatively preserved BP; cardiogenic shock as inodilator (combines inotropy + reduces afterload); bridge therapy to LVAD or transplant; weaning from cardiopulmonary bypass after cardiac surgery; pulmonary hypertension acute reduction; right heart failure especially with pulmonary hypertension per primary source.",
            citationIDs: ["specialty_round32", "openfda_round32"]
        ),
        mechanism: AttributedProse(
            "Selectively inhibits phosphodiesterase isoenzyme III → prevents cAMP breakdown → increased intracellular cAMP → MYOCARDIAL inotropy (increased Ca2+ influx + contractility) + VASCULAR smooth muscle vasodilation (arterial + venous) → INCREASED CARDIAC OUTPUT + DECREASED preload + afterload. Mechanism is INDEPENDENT of beta-receptors (useful in beta-blocked patients).",
            citationIDs: ["openfda_round32"]
        ),
        dosing: [
            DosingBlock(label: "Initial loading (often skipped)", body: "50 mcg/kg IV over 10 minutes; SKIP loading dose in hypotensive patients OR add concomitant vasopressor; loading causes transient hypotension per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Maintenance infusion", body: "0.25-0.75 mcg/kg/min IV continuous infusion; titrate to clinical response + cardiac output + BP; usual maintenance 0.375-0.5 mcg/kg/min.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Renal adjustment", body: "CrCl 40-50: 0.43 mcg/kg/min; CrCl 30-40: 0.38 mcg/kg/min; CrCl 20-30: 0.33 mcg/kg/min; CrCl 10-20: 0.28 mcg/kg/min; CrCl <10: 0.23 mcg/kg/min; significant accumulation in renal impairment.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Pediatric (post-cardiac surgery)", body: "50 mcg/kg loading IV + 0.25-0.75 mcg/kg/min infusion; per pediatric cardiac intensive care protocols.", citationIDs: ["specialty_round32"]),
            DosingBlock(label: "Duration", body: "Short-term IV use only — typically days to weeks bridge; chronic infusion outpatient very rare due to mortality concerns.", citationIDs: ["openfda_round32"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to milrinone; severe aortic OR pulmonic valvular disease (worsens with afterload reduction); severe hypovolemia (worsens hypotension).",
            citationIDs: ["openfda_round32"]
        ),
        warnings: [
            AttributedBullet("VENTRICULAR ARRHYTHMIAS — significant risk (~10%); continuous ECG; correct hypokalemia + hypomagnesemia; reduce dose or discontinue for sustained arrhythmias.", citationIDs: ["openfda_round32"]),
            AttributedBullet("INCREASED MORTALITY — chronic outpatient infusion + ADHF discharge associated with increased mortality (PROMISE trial); reserve for short-term bridge OR end-of-life palliation.", citationIDs: ["specialty_round32"]),
            AttributedBullet("HYPOTENSION — common; avoid loading dose if borderline BP; titrate slowly; concomitant vasopressor (norepinephrine, phenylephrine) often needed.", citationIDs: ["openfda_round32"]),
            AttributedBullet("THROMBOCYTOPENIA — uncommon but reported; monitor CBC.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HEPATIC + RENAL excretion — accumulates in renal impairment.", citationIDs: ["openfda_round32"]),
            AttributedBullet("ELECTROLYTE imbalance — hypokalemia + hypomagnesemia worsen arrhythmia risk; aggressive replacement.", citationIDs: ["openfda_round32"]),
            AttributedBullet("VOLUME STATUS — adequate preload essential; concomitant diuresis OR hypovolemia worsens hypotension.", citationIDs: ["openfda_round32"]),
            AttributedBullet("PREGNANCY — Category C; limited data; reserve.", citationIDs: ["openfda_round32"])
        ],
        adverseReactions: AttributedProse(
            "Ventricular arrhythmias (PVCs, NSVT, VT), supraventricular tachycardia, hypotension, headache, hypokalemia, tremor, chest pain, thrombocytopenia.",
            citationIDs: ["openfda_round32"]
        ),
        drugInteractions: [
            AttributedBullet("OTHER POSITIVE INOTROPES (dobutamine, epinephrine, isoproterenol) — additive effects; titrate carefully when combining.", citationIDs: ["openfda_round32"]),
            AttributedBullet("VASOPRESSORS (norepinephrine, phenylephrine, vasopressin) — commonly combined for blood pressure support during milrinone; useful synergistic strategy.", citationIDs: ["specialty_round32"]),
            AttributedBullet("VASODILATORS (nitroglycerin, nitroprusside) — additive hypotension; caution.", citationIDs: ["openfda_round32"]),
            AttributedBullet("CYP-independent metabolism — minimal drug-drug pharmacokinetic interactions.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Diuretics — additive volume depletion + electrolyte imbalance; aggressive K + Mg replacement.", citationIDs: ["openfda_round32"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive cardiac assessment, ECG, BP, electrolytes (K, Mg, Ca), renal function, volume status, vasopressor + diuretic plans.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Dedicated IV LINE for continuous infusion; central line preferred for vesicant + extravasation; arterial line for continuous BP.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Continuous CARDIAC MONITORING — telemetry q15 min during titration, q1 hour stable; correct K to >4.0 + Mg to >2.0; report sustained VT/VF.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Continuous BP monitoring — arterial line preferred; MAP target ≥65; concomitant vasopressor commonly needed.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Hemodynamic assessment — CO/CI via PA catheter OR non-invasive (FloTrac, NICOM); UOP + lactate + mentation + skin temp.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Weaning + transition — when patient stabilizes, gradually wean milrinone over hours-days; bridge to oral therapy OR LVAD OR transplant.", citationIDs: ["specialty_round32"]),
            AttributedBullet("End-of-life palliation — sometimes used for symptomatic relief in advanced HF NOT candidates for transplant; ethical + family discussions.", citationIDs: ["specialty_round32"]),
            AttributedBullet("HOME inotrope (rare) — palliative; coordinate with hospice + HF cardiology + nursing.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Multidisciplinary — cardiology + critical care + cardiac surgery + heart transplant team.", citationIDs: ["specialty_round32"])
        ],
        patientTeaching: AttributedProse(
            "This IV medicine helps your heart pump stronger. We monitor your heart rhythm, blood pressure, and electrolytes very closely. It's typically used for short periods to bridge to other treatments or recovery. Tell us about palpitations, chest pain, dizziness. We may need to add other medications to support your blood pressure.",
            citationIDs: ["openrn_pharm_round32"]
        ),
        citations: [openfdaR32, openrnPharmR32, specialtyR32, ismpR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BivalirudinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "bivalirudin",
        title: "Bivalirudin (Angiomax)",
        subtitle: "Direct thrombin inhibitor (DTI) · PCI + HIT · short half-life ~25 min · renal dose adjust · CrCl-based titration · less bleeding than heparin in some scenarios",
        category: "Direct thrombin inhibitor (DTI) — PCI + HIT alternative anticoagulation",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Direct thrombin inhibitor (DTI) — synthetic 20-amino-acid peptide; reversibly inhibits free + clot-bound thrombin"),
            KeyValueRow(key: "Use", value: "Percutaneous coronary intervention (PCI); heparin-induced thrombocytopenia (HIT) anticoagulation; cardiopulmonary bypass alternative when heparin contraindicated"),
            KeyValueRow(key: "Dose", value: "PCI: 0.75 mg/kg IV bolus + 1.75 mg/kg/h infusion during procedure; HIT: 0.15-0.2 mg/kg/h infusion (no bolus); renal dose adjust"),
            KeyValueRow(key: "Monitor", value: "aPTT (target 1.5-2.5x baseline for non-PCI use), ACT (>300 sec PCI), renal function, bleeding"),
            KeyValueRow(key: "Watch", value: "BLEEDING (major complication, no specific antidote — supportive + fresh whole blood/FFP/cryo + factor VIIa rare); RENAL ACCUMULATION (~20% renal); short half-life (~25 min) advantage; HIGH-ALERT")
        ],
        indications: AttributedProse(
            "Percutaneous coronary intervention (PCI) — anticoagulation during procedure as alternative to heparin or bivalirudin/heparin combination; HEPARIN-INDUCED THROMBOCYTOPENIA (HIT) — alternative anticoagulation; cardiopulmonary bypass anticoagulation when heparin contraindicated; rare off-label for VTE / ACS in HIT patients per primary source.",
            citationIDs: ["specialty_round32", "openfda_round32"]
        ),
        mechanism: AttributedProse(
            "Synthetic 20-amino-acid peptide direct thrombin inhibitor — binds both catalytic site + substrate recognition site of thrombin → REVERSIBLE inhibition of THROMBIN-MEDIATED activities (fibrin formation, platelet activation, factor V/VIII/XI activation). Unlike heparin/LMWH, inhibits both FREE + CLOT-BOUND thrombin (heparin only inhibits free thrombin). NO heparin-induced thrombocytopenia risk.",
            citationIDs: ["openfda_round32"]
        ),
        dosing: [
            DosingBlock(label: "PCI", body: "0.75 mg/kg IV BOLUS + 1.75 mg/kg/hr IV infusion during procedure; continue infusion up to 4 hours post-PCI (some protocols extend per clinical scenario) per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "HIT anticoagulation", body: "0.15-0.2 mg/kg/hr IV infusion (NO bolus); titrate to aPTT 1.5-2.5x baseline.", citationIDs: ["specialty_round32"]),
            DosingBlock(label: "Cardiopulmonary bypass", body: "1 mg/kg IV bolus + 2.5 mg/kg/hr infusion + 50 mg in CPB circuit prime; titrate to ACT >2.5x baseline.", citationIDs: ["specialty_round32"]),
            DosingBlock(label: "Renal adjustment", body: "PCI: CrCl 30-59 — full bolus + 1.4 mg/kg/hr (~20% reduction); CrCl <30 — 1.0 mg/kg/hr; HD-dependent — 0.25 mg/kg/hr; significant renal accumulation per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Hepatic", body: "No specific dose adjustment.", citationIDs: ["openfda_round32"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to bivalirudin or any component; active major bleeding; uncontrolled severe hypertension; recent CNS bleeding; intracranial neoplasm; aneurysm.",
            citationIDs: ["openfda_round32"]
        ),
        warnings: [
            AttributedBullet("BLEEDING — major risk; NO specific antidote (unlike heparin which has protamine); supportive care, fresh whole blood, FFP, cryoprecipitate, recombinant factor VIIa in catastrophic; dialysis can remove ~25%.", citationIDs: ["specialty_round32"]),
            AttributedBullet("RENAL ACCUMULATION — ~20% renal elimination; significant prolongation with renal impairment; dose adjust + extended monitoring; HD-dependent patients require specific protocols.", citationIDs: ["openfda_round32"]),
            AttributedBullet("SHORT HALF-LIFE (~25 min, ~3-5 hours in dialysis-dependent) — advantage for fast on/off control vs longer-acting alternatives.", citationIDs: ["openfda_round32"]),
            AttributedBullet("THROMBOCYTOPENIA — rare in bivalirudin (unlike heparin); CBC monitoring routine.", citationIDs: ["openfda_round32"]),
            AttributedBullet("ANAPHYLAXIS — rare reports; observe; epinephrine + supportive care.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HIT ALTERNATIVE — bivalirudin commonly used in HIT-positive patients requiring PCI or anticoagulation; argatroban + fondaparinux + DOAC alternatives based on clinical scenario.", citationIDs: ["specialty_round32"]),
            AttributedBullet("PCI POST-PROCEDURE THROMBOSIS — slight increase compared to heparin alone in some studies; balance bleeding vs thrombosis.", citationIDs: ["specialty_round32"]),
            AttributedBullet("INTRACRANIAL HEMORRHAGE risk — particularly elderly + concurrent antiplatelet therapy.", citationIDs: ["openfda_round32"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (major + minor), thrombocytopenia (rare), hypotension, back pain, nausea, headache, hypertension, anaphylaxis (rare).",
            citationIDs: ["openfda_round32"]
        ),
        drugInteractions: [
            AttributedBullet("CONCURRENT ANTICOAGULANTS — heparin, warfarin, DOACs — additive bleeding; sequence carefully.", citationIDs: ["openfda_round32"]),
            AttributedBullet("CONCURRENT ANTIPLATELETS — aspirin, P2Y12 inhibitors, GP IIb/IIIa inhibitors — used in PCI; additive bleeding; protocol-driven.", citationIDs: ["openfda_round32"]),
            AttributedBullet("NSAIDs — increased bleeding risk; caution.", citationIDs: ["openfda_round32"]),
            AttributedBullet("PROTAMINE — does NOT reverse bivalirudin (unlike heparin); supportive care if bleeding.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Drugs causing thrombocytopenia — uncommon to combine.", citationIDs: ["openfda_round32"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — CBC + platelet count + INR + aPTT + Cr + active bleeding assessment + recent surgery/procedures + concomitant anticoagulants/antiplatelets.", citationIDs: ["specialty_round32"]),
            AttributedBullet("PCI dosing — IV bolus + infusion during cath; ACT monitoring intra-procedurally; collaborate with interventional cardiology.", citationIDs: ["specialty_round32"]),
            AttributedBullet("HIT use — calculate dose based on weight + renal function; titrate to aPTT 1.5-2.5x baseline q4-6 hours initially.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Bleeding monitoring — vital signs, IV sites, urine/stool, neurologic exam (intracranial); CBC + INR + aPTT serial; emergent hemorrhage protocol if major bleed.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Renal function — recheck CrCl during therapy; adjust dose as kidney function changes; significant accumulation with renal impairment.", citationIDs: ["openfda_round32"]),
            AttributedBullet("NO ANTIDOTE — supportive measures for bleeding; consider FFP + cryoprecipitate + factor concentrates + emergent dialysis if catastrophic; communicate to ED + procedural teams.", citationIDs: ["specialty_round32"]),
            AttributedBullet("DISCONTINUATION — short half-life allows fast off-time; for invasive procedures hold 4-6 hours (longer in renal impairment).", citationIDs: ["specialty_round32"]),
            AttributedBullet("HIT MANAGEMENT — discontinue ALL heparin (including flushes) + start non-heparin anticoagulation (bivalirudin, argatroban, fondaparinux); transition to warfarin/DOAC after platelet recovery; hematology consultation.", citationIDs: ["specialty_round32"])
        ],
        patientTeaching: AttributedProse(
            "This IV blood thinner is used during certain heart procedures or as an alternative for people who can't have heparin. Watch for bleeding (gums, bruising, blood in urine/stool, severe headache, vision changes). Tell every provider that you've received this medicine. Frequent bloodwork.",
            citationIDs: ["openrn_pharm_round32"]
        ),
        citations: [openfdaR32, openrnPharmR32, specialtyR32, ismpR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ArgatrobanSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "argatroban",
        title: "Argatroban",
        subtitle: "Direct thrombin inhibitor (DTI) · HIT 1st-line · hepatic elimination (RENAL SAFE) · prolongs INR transiently · IV infusion · transition to warfarin",
        category: "Direct thrombin inhibitor (DTI) — HIT first-line + renal failure safe",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic direct thrombin inhibitor (DTI) — reversibly inhibits free + clot-bound thrombin"),
            KeyValueRow(key: "Use", value: "Heparin-induced thrombocytopenia (HIT) — first-line; HIT-positive patients undergoing PCI; suspected HIT with thrombosis"),
            KeyValueRow(key: "Dose", value: "Standard HIT: 2 mcg/kg/min IV continuous infusion; titrate to aPTT 1.5-3x baseline; HEPATIC IMPAIRMENT 0.5 mcg/kg/min; PCI: 350 mcg/kg bolus + 25 mcg/kg/min infusion (titrate ACT 300-450 sec)"),
            KeyValueRow(key: "Monitor", value: "aPTT 1.5-3x baseline + Cr + LFTs + ACT (PCI); INR transient elevation during transition to warfarin"),
            KeyValueRow(key: "Watch", value: "BLEEDING (no antidote); HEPATIC clearance (NOT renal — preferred in renal failure); transient INR elevation during warfarin overlap (don't discontinue argatroban until INR adjusted for argatroban effect); HIGH-ALERT")
        ],
        indications: AttributedProse(
            "HEPARIN-INDUCED THROMBOCYTOPENIA (HIT) — first-line anticoagulation; HIT-positive patients undergoing PCI; suspected HIT with thrombosis pending confirmation; alternative when heparin contraindicated; renal failure HIT patients (hepatic clearance avoids renal accumulation) per primary source.",
            citationIDs: ["specialty_round32", "openfda_round32"]
        ),
        mechanism: AttributedProse(
            "Small synthetic peptide direct thrombin inhibitor — reversibly binds catalytic site of thrombin → inhibits both FREE + CLOT-BOUND thrombin → prevents fibrin formation + platelet activation + factor V/VIII/XI activation. HEPATIC metabolism + biliary excretion (renal accumulation NOT a concern, unlike bivalirudin).",
            citationIDs: ["openfda_round32"]
        ),
        dosing: [
            DosingBlock(label: "Adult HIT", body: "2 mcg/kg/min IV continuous infusion; titrate q2 hours by 0.5-1 mcg/kg/min based on aPTT to target 1.5-3x baseline per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Hepatic impairment / ICU", body: "0.5 mcg/kg/min initial; titrate slowly; hepatic clearance reduced in hepatic dysfunction, sepsis, multi-organ failure.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "PCI", body: "350 mcg/kg IV BOLUS + 25 mcg/kg/min infusion; titrate to ACT 300-450 seconds; commonly used in HIT-positive patients needing cath.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Renal", body: "NO dose adjustment for renal impairment (hepatic clearance) — major advantage in renal failure HIT.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Transition to warfarin", body: "Start warfarin when platelet count recovered (>150K) + INR stabilized; OVERLAP with argatroban; argatroban transiently elevates INR — must achieve INR target adjusted for argatroban effect (rule of thumb continue argatroban until INR 4 on overlap, then stop; recheck INR 4-6 hours after argatroban discontinuation to confirm therapeutic on warfarin alone).", citationIDs: ["specialty_round32"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to argatroban; severe overt active bleeding.",
            citationIDs: ["openfda_round32"]
        ),
        warnings: [
            AttributedBullet("BLEEDING — major risk; NO specific antidote; supportive care, fresh whole blood, FFP, cryoprecipitate, recombinant factor VIIa for catastrophic; dialysis ineffective (hepatic clearance).", citationIDs: ["specialty_round32"]),
            AttributedBullet("HEPATIC IMPAIRMENT — reduced clearance; reduced dose (0.5 mcg/kg/min); ICU patients + sepsis + multi-organ failure also slower clearance.", citationIDs: ["openfda_round32"]),
            AttributedBullet("INR ELEVATION transient — during overlap with warfarin; do NOT discontinue argatroban based on INR alone — use specific protocols (continue argatroban until INR >4 on overlap, recheck after stopping; chromogenic Factor X assay alternative).", citationIDs: ["specialty_round32"]),
            AttributedBullet("HEPARIN-INDUCED THROMBOCYTOPENIA management — STOP all heparin (including flushes), confirm with HIT antibody testing (PF4-IgG ELISA + functional serotonin release assay), platelet recovery indicator of treatment success.", citationIDs: ["specialty_round32"]),
            AttributedBullet("ANAPHYLAXIS — rare.", citationIDs: ["openfda_round32"]),
            AttributedBullet("THROMBOCYTOPENIA persists initially during transition — platelet count normalization may take days-weeks.", citationIDs: ["specialty_round32"]),
            AttributedBullet("PREGNANCY — Category B; preferred when DTI needed; data limited but no major teratogenic signal.", citationIDs: ["openfda_round32"]),
            AttributedBullet("CARDIOPULMONARY BYPASS — alternative to heparin in HIT-positive patients; specialized protocols + experienced perfusionist.", citationIDs: ["specialty_round32"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (major + minor), hypotension, fever, sepsis-related issues, cardiac arrest, ventricular tachycardia, pain, nausea, atrial fibrillation.",
            citationIDs: ["openfda_round32"]
        ),
        drugInteractions: [
            AttributedBullet("OTHER ANTICOAGULANTS — heparin (discontinue completely in HIT), warfarin (overlap during transition), DOACs (sequential not concurrent), antiplatelets (additive bleeding) — careful management.", citationIDs: ["openfda_round32"]),
            AttributedBullet("THROMBOLYTICS — additive bleeding risk; avoid concurrent.", citationIDs: ["openfda_round32"]),
            AttributedBullet("NSAIDs — increased bleeding; caution.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HEPATIC ENZYME INDUCERS / INHIBITORS — minimal effect on argatroban metabolism.", citationIDs: ["openfda_round32"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — CBC + platelet count + INR + aPTT + LFTs + Cr + active bleeding assessment + HIT antibody panel pending.", citationIDs: ["specialty_round32"]),
            AttributedBullet("HIT recognition — 4Ts score (timing, thrombocytopenia, thrombosis, other causes); discontinue ALL heparin (including flushes, lines, dialysis circuits); start argatroban.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Titration — aPTT q2 hours initially → q4-6 hours stable; target 1.5-3x baseline; adjust by 0.5-1 mcg/kg/min increments.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Renal failure HIT — argatroban first-line (hepatic clearance); bivalirudin alternative with renal dose adjustment.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Bleeding monitoring — vital signs, IV sites, urine/stool, neurologic exam; emergent hemorrhage protocol if major bleed.", citationIDs: ["specialty_round32"]),
            AttributedBullet("WARFARIN TRANSITION — start when platelets recovered (>150K usually); OVERLAP 4-5 days minimum; argatroban transient INR elevation requires specific overlap protocols (rule of thumb continue until INR >4, then stop, recheck INR 4-6 hours later to confirm therapeutic on warfarin alone); alternative — chromogenic Factor X assay >40% indicates therapeutic warfarin.", citationIDs: ["specialty_round32"]),
            AttributedBullet("DOAC transition — direct switch after argatroban discontinuation (no overlap needed for some); coordinate with hematology.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Duration of anticoagulation — depends on HIT severity, thrombosis, thrombosis location; typically 3-6 months minimum.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Hematology + critical care multidisciplinary management; HIT registry for severe cases.", citationIDs: ["specialty_round32"])
        ],
        patientTeaching: AttributedProse(
            "This IV blood thinner treats heparin-induced low platelets (HIT). We replace heparin completely with this medicine. Tell every provider you cannot have heparin or LMWH (Lovenox). Watch for bleeding. Eventually we'll switch you to a pill blood thinner (warfarin or DOAC). Frequent bloodwork.",
            citationIDs: ["openrn_pharm_round32"]
        ),
        citations: [openfdaR32, openrnPharmR32, specialtyR32, ismpR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CangrelorSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cangrelor",
        title: "Cangrelor (Kengreal)",
        subtitle: "IV P2Y12 antiplatelet · PCI bridge in oral antiplatelet-naive · rapid onset (2 min) + offset (1 hour) · alternative to oral loading · bleeding risk",
        category: "IV P2Y12 inhibitor — PCI antiplatelet bridge",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Direct reversible P2Y12 receptor antagonist — IV antiplatelet"),
            KeyValueRow(key: "Use", value: "Adjunct to PCI in patients NOT pre-treated with oral P2Y12 inhibitor (clopidogrel, prasugrel, ticagrelor); bridge therapy during procedures requiring rapid on/off antiplatelet effect"),
            KeyValueRow(key: "Dose", value: "30 mcg/kg IV bolus + 4 mcg/kg/min infusion for procedure duration (≥2 hours OR procedure end + 2 hours, whichever longer); transition to oral P2Y12 inhibitor"),
            KeyValueRow(key: "Monitor", value: "Bleeding, hemostasis, transition to oral P2Y12 inhibitor"),
            KeyValueRow(key: "Watch", value: "RAPID ON (2 minutes) + RAPID OFF (1-hour half-life); BLEEDING (no antidote — supportive); transition to oral P2Y12 inhibitor at end of infusion (timing important — ticagrelor: start during infusion or anytime; clopidogrel/prasugrel: at end of infusion); avoid combining with oral P2Y12 inhibitor during infusion")
        ],
        indications: AttributedProse(
            "Adjunct to PCI in adult patients NOT pre-treated with oral P2Y12 inhibitor — rapid IV antiplatelet effect; useful when oral pretreatment not feasible (emergent ACS without time, unable to take oral, contraindications); bridge in patients needing antiplatelet effect during invasive procedures per primary source.",
            citationIDs: ["specialty_round32", "openfda_round32"]
        ),
        mechanism: AttributedProse(
            "Direct reversible competitive antagonist of P2Y12 receptor on platelets → blocks ADP-mediated platelet aggregation → rapid onset (within 2 minutes) + rapid offset (~1 hour terminal half-life; ~60 minutes for platelet function recovery). Unlike clopidogrel/prasugrel/ticagrelor which are oral + prolonged effect, cangrelor provides PROCEDURAL antiplatelet effect.",
            citationIDs: ["openfda_round32"]
        ),
        dosing: [
            DosingBlock(label: "Adult PCI", body: "30 mcg/kg IV BOLUS pre-procedure + 4 mcg/kg/min infusion for procedure duration; continue infusion for AT LEAST 2 hours OR until end of procedure (whichever is longer) per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Transition to oral P2Y12", body: "TICAGRELOR — can start during cangrelor infusion or anytime; CLOPIDOGREL or PRASUGREL — start AT END of cangrelor infusion (don't overlap; antiplatelet effect of oral loading delayed if given during cangrelor).", citationIDs: ["specialty_round32"]),
            DosingBlock(label: "Renal / hepatic", body: "No specific dose adjustment; minimal pharmacokinetic effect.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Pediatric", body: "Limited; not routine.", citationIDs: ["openfda_round32"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to cangrelor; significant active bleeding.",
            citationIDs: ["openfda_round32"]
        ),
        warnings: [
            AttributedBullet("BLEEDING — major + minor; NO specific antidote; supportive care + platelet transfusion limited efficacy during infusion (continuously inhibits platelets) but effective after discontinuation.", citationIDs: ["specialty_round32"]),
            AttributedBullet("HYPERSENSITIVITY — rare; anaphylaxis reported; discontinue + treat.", citationIDs: ["openfda_round32"]),
            AttributedBullet("TRANSITION TIMING critical — ticagrelor can be loaded during infusion; clopidogrel/prasugrel must be given at end of infusion (active metabolite generation blocked by cangrelor during infusion); coordinate carefully.", citationIDs: ["specialty_round32"]),
            AttributedBullet("BLEEDING risk increased with concurrent anticoagulation (heparin, bivalirudin) + thrombolytics + NSAIDs.", citationIDs: ["openfda_round32"]),
            AttributedBullet("PCI complication management — emergent surgery may be needed; rapid offset (~60 minutes) allows hemostasis.", citationIDs: ["openfda_round32"]),
            AttributedBullet("PREGNANCY — Category C; limited data.", citationIDs: ["openfda_round32"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (major + minor), dyspnea (~7%), hypotension, hematuria, vomiting.",
            citationIDs: ["openfda_round32"]
        ),
        drugInteractions: [
            AttributedBullet("ORAL P2Y12 INHIBITORS during infusion — DON'T combine clopidogrel or prasugrel (cangrelor blocks active metabolite binding); ticagrelor OK during.", citationIDs: ["openfda_round32"]),
            AttributedBullet("ANTICOAGULANTS (heparin, bivalirudin, enoxaparin, fondaparinux) — additive bleeding; protocol-driven.", citationIDs: ["openfda_round32"]),
            AttributedBullet("ASPIRIN — used concurrently per PCI protocols; additive bleeding.", citationIDs: ["openfda_round32"]),
            AttributedBullet("GP IIb/IIIa INHIBITORS — generally avoided concurrent.", citationIDs: ["openfda_round32"]),
            AttributedBullet("NSAIDs + thrombolytics — increased bleeding.", citationIDs: ["openfda_round32"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — CBC + platelet count + INR + active bleeding assessment + concomitant anticoagulants/antiplatelets + current P2Y12 status + planned oral P2Y12 + indication.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Bolus + infusion — pre-PCI bolus, infusion through procedure, continue ≥2 hours OR end of procedure.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Transition timing — coordinate with interventional cardiology + pharmacy; ticagrelor flexible, clopidogrel/prasugrel end-of-infusion only.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Bleeding monitoring — vital signs, IV sites, vascular access site, urine; immediate intervention for major bleeding.", citationIDs: ["openfda_round32"]),
            AttributedBullet("EMERGENCY SURGERY during infusion — discontinue immediately; effect dissipates in ~60 minutes; platelet transfusion has limited utility during infusion but effective after stop.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Counsel — purpose (procedural antiplatelet), short-acting, transition plan, watch for bleeding.", citationIDs: ["openrn_pharm_round32"]),
            AttributedBullet("Comparison — oral P2Y12 effect persists 3-5 days after discontinuation (irreversible binding for clopidogrel/prasugrel); cangrelor reverses in ~60 minutes (rapid bridge advantage).", citationIDs: ["specialty_round32"]),
            AttributedBullet("Selection — emergent PCI in oral antiplatelet-naive, oral inability, bridge for surgery; not for chronic outpatient use.", citationIDs: ["specialty_round32"])
        ],
        patientTeaching: AttributedProse(
            "This IV antiplatelet works during your heart procedure. It works fast and wears off fast. Watch for bleeding from your IV sites, gums, or in urine/stool. We'll transition you to a daily antiplatelet pill after the procedure.",
            citationIDs: ["openrn_pharm_round32"]
        ),
        citations: [openfdaR32, openrnPharmR32, specialtyR32, ismpR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ClevidipineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "clevidipine",
        title: "Clevidipine (Cleviprex)",
        subtitle: "Ultra-short-acting IV dihydropyridine CCB · perioperative + acute HTN crisis · LIPID EMULSION (egg/soy allergy) · rapid titration · 1-min half-life",
        category: "Ultra-short-acting IV calcium channel blocker — perioperative + acute HTN",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Third-generation IV dihydropyridine calcium channel blocker — arteriolar vasodilator; ultra-short half-life (~1 minute)"),
            KeyValueRow(key: "Use", value: "Perioperative blood pressure management; acute hypertension crisis (including aortic dissection management adjunct); ICU + ED setting"),
            KeyValueRow(key: "Dose", value: "1-2 mg/h IV infusion; titrate q90 seconds by doubling rate; maximum 21 mg/h; ultra-short half-life allows rapid adjustment"),
            KeyValueRow(key: "Monitor", value: "Continuous BP (arterial line ideal); HR, lipid status (formulation is lipid emulsion); volume status"),
            KeyValueRow(key: "Watch", value: "LIPID EMULSION (10% as Intralipid) — contraindicated in egg/soy allergy + lipid disorders; reflex tachycardia rare (vs other DHP); HYPOTENSION at high doses; only IV use; HIGH-ALERT")
        ],
        indications: AttributedProse(
            "Perioperative blood pressure management (pre + intra + post-operative); acute hypertension crisis (urgency + emergency); aortic dissection BP control (often combined with beta-blocker for HR/contractility); other ICU + ED scenarios requiring rapid BP titration per primary source.",
            citationIDs: ["specialty_round32", "openfda_round32"]
        ),
        mechanism: AttributedProse(
            "Third-generation dihydropyridine calcium channel blocker — selectively blocks L-type calcium channels in vascular smooth muscle → arteriolar vasodilation → reduced systemic vascular resistance + afterload → reduced BP. Ultra-short half-life (~1 minute) due to rapid metabolism by blood + tissue esterases (independent of liver + kidney function — useful in organ failure). Formulated as 0.5 mg/mL in lipid emulsion (Intralipid-like).",
            citationIDs: ["openfda_round32"]
        ),
        dosing: [
            DosingBlock(label: "Initial + titration", body: "Initial 1-2 mg/h IV continuous infusion; titrate by DOUBLING rate every 90 seconds; approaching goal, increase by smaller increments per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Maintenance + maximum", body: "Most patients respond to 4-6 mg/h; maximum 21 mg/h; chronic use limited by lipid emulsion volume (~1000 mL/24h at 21 mg/h).", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Renal / hepatic", body: "No dose adjustment (esterase metabolism independent of liver + kidney).", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Pediatric", body: "Limited; not routinely recommended.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Lipid considerations", body: "Lipid emulsion 0.2 g fat/mL; ~1000 mL/24h at high doses; monitor triglycerides + lipid status; reduce other lipid sources (TPN, propofol) — combination limit lipid total.", citationIDs: ["openfda_round32"])
        ],
        contraindications: AttributedProse(
            "EGG OR SOY allergy / severe; defective lipid metabolism (acute pancreatitis with hyperlipidemia, primary hyperlipidemia); severe aortic stenosis; pregnancy (limited data, Category C).",
            citationIDs: ["openfda_round32"]
        ),
        warnings: [
            AttributedBullet("LIPID EMULSION — formulation is lipid emulsion (Intralipid-similar); CONTRAINDICATED in egg/soy allergy + defective lipid metabolism; monitor triglycerides + lipid status with prolonged or high-dose infusion.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HYPOTENSION — common with rapid titration + high doses; arterial line monitoring; titrate carefully.", citationIDs: ["openfda_round32"]),
            AttributedBullet("REFLEX TACHYCARDIA — uncommon (advantage vs other DHP); cardiology consultation if significant; beta-blocker may be added.", citationIDs: ["openfda_round32"]),
            AttributedBullet("AORTIC DISSECTION management — combine with BETA-BLOCKER (esmolol) FIRST for HR + contractility control, then add vasodilator (clevidipine, nicardipine, or nitroprusside); HR target <60.", citationIDs: ["specialty_round32"]),
            AttributedBullet("HEART FAILURE — caution; can worsen with negative inotropy (less than other CCBs); monitor.", citationIDs: ["openfda_round32"]),
            AttributedBullet("REFLEX hypertension after discontinuation — rare; if persistent, transition to oral antihypertensive.", citationIDs: ["openfda_round32"]),
            AttributedBullet("SHAKE WELL — emulsion can settle; visible separation requires discarding.", citationIDs: ["openfda_round32"]),
            AttributedBullet("DEDICATED IV LINE — central or large peripheral preferred; lipid emulsion can affect other medications.", citationIDs: ["openfda_round32"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension, headache, nausea, vomiting, atrial fibrillation, reflex tachycardia (rare), hyperglycemia (from lipid).",
            citationIDs: ["openfda_round32"]
        ),
        drugInteractions: [
            AttributedBullet("OTHER ANTIHYPERTENSIVES — additive hypotension; titrate carefully.", citationIDs: ["openfda_round32"]),
            AttributedBullet("BETA-BLOCKERS — useful combination in aortic dissection (clevidipine + esmolol); additive bradycardia + HF caution.", citationIDs: ["openfda_round32"]),
            AttributedBullet("PROPOFOL — also lipid emulsion; cumulative lipid load; monitor triglycerides.", citationIDs: ["openfda_round32"]),
            AttributedBullet("LIPID-CONTAINING TPN — additive lipid load; reduce other lipids.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Other DHP CCBs — additive vasodilation.", citationIDs: ["openfda_round32"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — BP supine + standing, arterial line if available, HR, lipid panel, egg/soy allergy assessment, current antihypertensives, indication.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Arterial line PREFERRED for continuous BP monitoring + rapid titration.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Titration q90 seconds — double rate; approach goal carefully; reduce rate increments as nearing target.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Lipid monitoring — triglycerides + lipid panel at baseline + q24-48 hours if prolonged infusion + high dose; reduce other lipids (propofol, TPN lipid emulsion).", citationIDs: ["openfda_round32"]),
            AttributedBullet("Egg/soy allergy — ALWAYS screen; ALTERNATIVE (nicardipine, esmolol, nitroprusside, labetalol) if positive.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Aortic dissection PROTOCOL — beta-blocker (esmolol) first for HR <60 + contractility, then vasodilator (clevidipine, nicardipine, nitroprusside) for BP <120; specialty management.", citationIDs: ["specialty_round32"]),
            AttributedBullet("DEDICATED IV LINE — central or large peripheral; do NOT mix with other medications; flush before/after.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Shake well before use; discard if visibly separated.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Counsel — BP control rapid + reversible; monitor for hypotension symptoms (dizziness, syncope, palpitations).", citationIDs: ["openrn_pharm_round32"])
        ],
        patientTeaching: AttributedProse(
            "This IV medicine lowers your blood pressure quickly. We adjust the dose precisely; it works within minutes and stops working when we stop the infusion. Tell us about egg or soy allergies (the medicine is in a milky-white liquid like nutrition fluid). Tell us about dizziness, palpitations, severe headache.",
            citationIDs: ["openrn_pharm_round32"]
        ),
        citations: [openfdaR32, openrnPharmR32, specialtyR32, ismpR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FenoldopamSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "fenoldopam",
        title: "Fenoldopam (Corlopam)",
        subtitle: "Selective DA-1 agonist · acute HTN + RENAL VASODILATION · improves renal perfusion + diuresis · alternative to nitroprusside in renal-compromised · NO sulfite",
        category: "Selective dopamine D1 agonist — acute HTN with renal protection",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective dopamine D1 receptor agonist — peripheral arteriolar vasodilation + renal vasodilation + natriuresis"),
            KeyValueRow(key: "Use", value: "Acute hypertensive crisis; preferred when renal protection desired (CKD, contrast nephropathy prophylaxis — controversial); alternative to nitroprusside in renal impairment"),
            KeyValueRow(key: "Dose", value: "Initial 0.025-0.05 mcg/kg/min IV continuous infusion; titrate q15 minutes by 0.05-0.1 mcg/kg/min; max 1.6 mcg/kg/min; no loading dose"),
            KeyValueRow(key: "Monitor", value: "Continuous BP, HR, urine output, electrolytes (especially K — promotes kaliuresis), intraocular pressure (in glaucoma)"),
            KeyValueRow(key: "Watch", value: "REFLEX TACHYCARDIA (common — may add beta-blocker); HYPOKALEMIA (kaliuresis); HEADACHE; INCREASED INTRAOCULAR PRESSURE (avoid in glaucoma)")
        ],
        indications: AttributedProse(
            "Acute hypertensive crisis — preferred when renal preservation desired (CKD baseline + concerns about worsening with conventional agents); contrast-induced nephropathy prophylaxis (controversial efficacy); aortic dissection management when nitroprusside contraindicated; alternative when other IV agents contraindicated per primary source.",
            citationIDs: ["specialty_round32", "openfda_round32"]
        ),
        mechanism: AttributedProse(
            "Selective dopamine D1 receptor agonist — peripheral arteriolar vasodilation (reduces SVR) + RENAL VASODILATION (improves renal blood flow) + natriuresis + diuresis. NO sympathomimetic / beta-agonist activity (unlike low-dose dopamine for renal effect, which has D1 activity but also alpha + beta agonism). Half-life ~5-10 minutes — rapid onset + offset for titration.",
            citationIDs: ["openfda_round32"]
        ),
        dosing: [
            DosingBlock(label: "Initial", body: "0.025-0.05 mcg/kg/min IV continuous infusion; NO loading dose; titrate q15 minutes by 0.05-0.1 mcg/kg/min increments per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Maintenance + maximum", body: "Most patients respond to 0.1-0.3 mcg/kg/min; maximum 1.6 mcg/kg/min.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Renal / hepatic", body: "No dose adjustment for renal impairment; severe hepatic — caution.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Pediatric", body: "Limited; specialist guidance.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Discontinuation", body: "Gradual taper as oral antihypertensive becomes effective; rebound hypertension rare.", citationIDs: ["openfda_round32"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to fenoldopam; SULFITE allergy (formulations contained sulfite — newer formulations may not; verify); intraocular pressure elevation / glaucoma; tachyarrhythmias.",
            citationIDs: ["openfda_round32"]
        ),
        warnings: [
            AttributedBullet("REFLEX TACHYCARDIA — common; may add beta-blocker if symptomatic + chronic; usually not problematic.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HYPOKALEMIA — kaliuretic effect; monitor K + supplement; correct before titration.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HEADACHE — common; usually transient.", citationIDs: ["openfda_round32"]),
            AttributedBullet("INTRAOCULAR PRESSURE elevation — caution in glaucoma + ocular hypertension; monitor.", citationIDs: ["openfda_round32"]),
            AttributedBullet("SULFITE allergy — older formulations contained sulfite; verify with newer; alternative agent if positive.", citationIDs: ["openfda_round32"]),
            AttributedBullet("ANGINA / ischemia — caution in coronary artery disease (rapid vasodilation could decrease coronary perfusion in critical stenosis).", citationIDs: ["openfda_round32"]),
            AttributedBullet("HYPOTENSION — at higher doses; titrate carefully.", citationIDs: ["openfda_round32"]),
            AttributedBullet("ACUTE KIDNEY INJURY prevention — controversial role in contrast nephropathy prophylaxis; data limited; rarely used for this.", citationIDs: ["specialty_round32"]),
            AttributedBullet("PREGNANCY — Category B; limited data; risk-benefit.", citationIDs: ["openfda_round32"])
        ],
        adverseReactions: AttributedProse(
            "Headache, flushing, nausea, hypotension, tachycardia, hypokalemia, increased intraocular pressure, dizziness, anxiety, ECG changes.",
            citationIDs: ["openfda_round32"]
        ),
        drugInteractions: [
            AttributedBullet("BETA-BLOCKERS — sometimes added to counter reflex tachycardia.", citationIDs: ["openfda_round32"]),
            AttributedBullet("OTHER ANTIHYPERTENSIVES — additive hypotension; titrate.", citationIDs: ["openfda_round32"]),
            AttributedBullet("DIURETICS — additive volume + electrolyte effects.", citationIDs: ["openfda_round32"]),
            AttributedBullet("DOPAMINERGIC drugs — minimal interactions (selective D1).", citationIDs: ["openfda_round32"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — BP supine + standing, HR + ECG, electrolytes (especially K), Cr, sulfite allergy assessment, glaucoma history, current antihypertensives, indication.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Continuous BP monitoring — arterial line preferred; titrate q15 minutes.", citationIDs: ["openfda_round32"]),
            AttributedBullet("K MONITORING — kaliuresis; supplement to maintain K >4.0; especially with concurrent diuretics.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HR monitoring — reflex tachycardia common; beta-blocker if symptomatic; usually well-tolerated.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Counsel — headache common but transient; report severe headache, vision changes (IOP elevation), chest pain, palpitations.", citationIDs: ["openrn_pharm_round32"]),
            AttributedBullet("Special use — renal protection in CKD + acute HTN; contrast nephropathy prophylaxis (controversial); aortic dissection alternative; specialty selection.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Alternative IV agents — nicardipine + clevidipine + labetalol + nitroprusside (caution renal) + esmolol (mainly HR) + hydralazine (preeclampsia + pregnancy) + enalaprilat (ACE-I IV).", citationIDs: ["specialty_round32"]),
            AttributedBullet("Discontinuation — gradual taper as oral antihypertensive effective; bridge therapy.", citationIDs: ["openfda_round32"])
        ],
        patientTeaching: AttributedProse(
            "This IV medicine lowers blood pressure and is gentle on your kidneys. Watch for headache (common early), dizziness, fast heart rate. Tell us about glaucoma. We adjust the dose carefully. Eventually we'll switch to oral blood pressure pills.",
            citationIDs: ["openrn_pharm_round32"]
        ),
        citations: [openfdaR32, openrnPharmR32, specialtyR32, ismpR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NesiritideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "nesiritide",
        title: "Nesiritide (Natrecor)",
        subtitle: "Recombinant BNP · ADHF symptom relief · arterial + venous vasodilation + natriuresis · ASCEND-HF inconclusive · limited use due to renal + mortality concerns",
        category: "Recombinant BNP analog — ADHF symptom relief (limited use)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant human B-type natriuretic peptide (BNP) — synthetic equivalent of endogenous BNP"),
            KeyValueRow(key: "Use", value: "Acute decompensated heart failure (ADHF) — IV adjunct to diuretics for symptomatic relief; limited use due to renal + mortality concerns in earlier trials (subsequent ASCEND-HF showed neutral mortality but limited efficacy)"),
            KeyValueRow(key: "Dose", value: "2 mcg/kg IV bolus (often skipped) + 0.01 mcg/kg/min IV infusion; titration limited (consider increase to 0.03 mcg/kg/min if needed); duration typically 24-48 hours"),
            KeyValueRow(key: "Monitor", value: "Continuous BP, HR, urine output, BNP (interferes with assay), Cr, electrolytes, response (dyspnea, weight)"),
            KeyValueRow(key: "Watch", value: "HYPOTENSION (limits use); ACUTE KIDNEY INJURY (worse renal outcomes in some studies); LIMITED EFFICACY vs diuretic + nitroglycerin alone; LIMITED ROLE in modern ADHF management; BNP assay interference")
        ],
        indications: AttributedProse(
            "Acute decompensated heart failure (ADHF) — IV adjunct for symptom relief (dyspnea, fluid overload) in patients not responding adequately to diuretics + standard therapy. Limited use in modern practice — ASCEND-HF trial showed no improvement in clinical outcomes vs placebo; renal concerns + cost-effectiveness questions; primarily superseded by better diuretic strategies + IV nitrates per primary source.",
            citationIDs: ["specialty_round32", "openfda_round32"]
        ),
        mechanism: AttributedProse(
            "Recombinant human BNP — same 32-amino-acid peptide as endogenous BNP produced by cardiac myocytes in response to volume + pressure overload. Binds NPR-A (natriuretic peptide receptor A) → activates guanylyl cyclase → increased cGMP → arterial + venous vasodilation (reduces preload + afterload) + natriuresis + diuresis + suppression of RAAS + sympathetic + endothelin systems. Theoretically ideal for ADHF; clinical efficacy disappointing.",
            citationIDs: ["openfda_round32"]
        ),
        dosing: [
            DosingBlock(label: "Initial", body: "2 mcg/kg IV BOLUS (often omitted to reduce hypotension) + 0.01 mcg/kg/min IV continuous infusion per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Titration", body: "If response inadequate + tolerable BP, may increase by 0.005 mcg/kg/min q3 hours to maximum 0.03 mcg/kg/min; titration uncommon in practice.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Duration", body: "Typically 24-48 hours; longer use uncommon; transition to oral diuretic + standard heart failure therapy.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Renal / hepatic", body: "No specific adjustment; severe renal/hepatic — caution; may worsen renal function.", citationIDs: ["openfda_round32"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to nesiritide; cardiogenic shock; SBP <90 mm Hg; severe valvular stenosis (worsens afterload reduction effect).",
            citationIDs: ["openfda_round32"]
        ),
        warnings: [
            AttributedBullet("HYPOTENSION — common (~30%); SBP <90 limits use; pre-treatment hydration + concurrent diuresis caution; bolus often skipped.", citationIDs: ["openfda_round32"]),
            AttributedBullet("ACUTE KIDNEY INJURY — initial concerns from VMAC trial; ASCEND-HF showed no significant difference; still caution + monitor Cr.", citationIDs: ["openfda_round32"]),
            AttributedBullet("LIMITED CLINICAL BENEFIT — ASCEND-HF showed no improvement in mortality + hospitalization vs placebo; symptomatic improvement modest; cost questions.", citationIDs: ["specialty_round32"]),
            AttributedBullet("BNP ASSAY INTERFERENCE — circulates as labeled BNP; interferes with diagnostic BNP measurement during + immediately after; use NT-proBNP instead for monitoring.", citationIDs: ["openfda_round32"]),
            AttributedBullet("VALVULAR STENOSIS — caution; afterload reduction can worsen forward flow.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HYPOPERFUSION — careful in cardiogenic shock or hypotension.", citationIDs: ["openfda_round32"]),
            AttributedBullet("BRADYCARDIA — uncommon; usually clinical insignificant.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HEADACHE + NAUSEA — common.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Limited role — most heart failure specialists now prefer optimization of diuretics + IV nitroglycerin + standard therapies.", citationIDs: ["specialty_round32"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension, headache, nausea, vomiting, abdominal pain, bradycardia, AKI (controversial), dizziness, increased creatinine.",
            citationIDs: ["openfda_round32"]
        ),
        drugInteractions: [
            AttributedBullet("ACE-I + ARBs — additive hypotension + AKI risk; coordinate.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Diuretics — additive volume depletion + electrolytes.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Other vasodilators (nitrates, hydralazine) — additive hypotension.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Beta-blockers — additive bradycardia rare.", citationIDs: ["openfda_round32"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — BP supine + standing, HR, weight, BNP/NT-proBNP, electrolytes (K, Mg, Na), Cr, comprehensive ADHF assessment.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Continuous BP monitoring — arterial line if available; hold/reduce if SBP <90; SBP target individualized.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Renal function — Cr q12 hours; hold/reduce if rising; balance with clinical response.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Diuresis monitoring — UOP target, weight loss, fluid balance, BUN/Cr trends.", citationIDs: ["openfda_round32"]),
            AttributedBullet("BNP measurement — falsely elevated during + immediately after nesiritide; use NT-proBNP for monitoring (not affected) OR baseline only.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Limited role — typically reserved for diuretic-resistant ADHF + still responsive to vasodilation; transition to oral therapy quickly.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Alternative ADHF management — aggressive IV loop diuretics (furosemide drip, bolus dosing strategies), IV nitroglycerin (especially low-output + HTN), inotropes (dobutamine, milrinone) if low CO, ultrafiltration for diuretic-resistant.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Multidisciplinary HF team — cardiology + critical care + advanced HF.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Discharge planning — optimize chronic HF therapy, education, follow-up, advance directives.", citationIDs: ["specialty_round32"])
        ],
        patientTeaching: AttributedProse(
            "This IV medicine helps relieve heart failure symptoms by relaxing blood vessels. We monitor your blood pressure + kidneys carefully. Tell us about dizziness, severe headache, decreased urine output. After this, we'll adjust your daily heart failure medicines.",
            citationIDs: ["openrn_pharm_round32"]
        ),
        citations: [openfdaR32, openrnPharmR32, specialtyR32, ismpR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IsoproterenolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "isoproterenol",
        title: "Isoproterenol (Isuprel)",
        subtitle: "Non-selective beta-1 + beta-2 agonist · BRADYCARDIA (atropine-refractory) + AV block bridge to pacing · torsades · refractory asthma · arrhythmia/MI risk",
        category: "Non-selective beta-agonist — bradycardia bridge to pacing + atypical uses",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-selective beta-1 + beta-2 adrenergic agonist; no alpha activity"),
            KeyValueRow(key: "Use", value: "Bradycardia + AV block atropine-refractory (BRIDGE to pacing); refractory torsades de pointes (increases heart rate to suppress pause-dependent arrhythmias); refractory bronchospasm (rare now); status asthmaticus historical"),
            KeyValueRow(key: "Dose", value: "Initial 2-10 mcg/min IV continuous infusion; titrate to clinical response (HR + clinical); maximum ~20 mcg/min"),
            KeyValueRow(key: "Monitor", value: "Continuous ECG, BP, HR + rhythm, symptoms; transcutaneous/transvenous pacing setup"),
            KeyValueRow(key: "Watch", value: "MYOCARDIAL ISCHEMIA / MI (increased oxygen demand); arrhythmias (PVCs, VT, VF); HYPOTENSION (beta-2 vasodilation reduces SVR despite beta-1 inotropy); use limited to bridge or specific indications; HIGH-ALERT")
        ],
        indications: AttributedProse(
            "BRADYCARDIA + AV BLOCK atropine-refractory — bridge to transcutaneous/transvenous pacing; REFRACTORY TORSADES DE POINTES (with hypomagnesemia correction + magnesium sulfate) — increases heart rate to suppress pause-dependent arrhythmias; REFRACTORY BRONCHOSPASM (historical — better selective beta-2 agonists available); cardiac transplant denervated heart bradycardia per primary source.",
            citationIDs: ["specialty_round32", "openfda_round32"]
        ),
        mechanism: AttributedProse(
            "Non-selective beta-1 + beta-2 adrenergic agonist; NO alpha activity. BETA-1 → INCREASED heart rate (positive chronotrope) + contractility (positive inotrope) + AV conduction. BETA-2 → bronchodilation + vasodilation (decreased SVR). Net hemodynamic effects — increased CO + HR + contractility, decreased SVR + diastolic BP, increased pulse pressure.",
            citationIDs: ["openfda_round32"]
        ),
        dosing: [
            DosingBlock(label: "Adult bradycardia / TdP", body: "Initial 2-10 mcg/min IV continuous infusion; titrate to clinical response (target HR 60-100 in bradycardia, suppress pauses in TdP); maximum ~20 mcg/min per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Refractory bronchospasm (rare)", body: "Initial 0.5-1 mcg/min IV; titrate to clinical response + tolerable HR; maximum 5 mcg/min usually.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Cardiac transplant denervated heart", body: "Specialty use; 2-5 mcg/min typically.", citationIDs: ["specialty_round32"]),
            DosingBlock(label: "Pediatric", body: "0.05-2 mcg/kg/min; per pediatric cardiac intensive care.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Duration", body: "Short-term IV use only; bridge to definitive therapy (pacing, treatment of underlying cause).", citationIDs: ["openfda_round32"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to isoproterenol; tachyarrhythmias or tachycardia precipitated by cardiac glycosides; angina pectoris; ventricular arrhythmias requiring inotropic therapy.",
            citationIDs: ["openfda_round32"]
        ),
        warnings: [
            AttributedBullet("MYOCARDIAL ISCHEMIA — increased oxygen demand + reduced diastolic perfusion pressure; risk of MI especially in CAD; avoid in ACS unless benefit clearly outweighs.", citationIDs: ["openfda_round32"]),
            AttributedBullet("ARRHYTHMIAS — PVCs, VT, VF; continuous ECG monitoring; reduce/discontinue for sustained arrhythmias.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HYPOTENSION — beta-2 vasodilation can decrease SVR; despite beta-1 inotropy net diastolic + sometimes MAP reduction.", citationIDs: ["openfda_round32"]),
            AttributedBullet("TACHYCARDIA — primary effect; can be excessive; titrate to clinical response.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HYPOKALEMIA — beta-2 mediated intracellular K shift; monitor + supplement.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HYPERGLYCEMIA — beta-2 effect; monitor; rarely significant.", citationIDs: ["openfda_round32"]),
            AttributedBullet("LIMITED USE in modern practice — better alternatives for most indications (selective beta-2 for bronchospasm, pacing for bradycardia, dobutamine for inotropy with less beta-2 effect).", citationIDs: ["specialty_round32"]),
            AttributedBullet("PREGNANCY — Category C; use only if benefit outweighs risk.", citationIDs: ["openfda_round32"]),
            AttributedBullet("DIABETIC PATIENTS — hyperglycemia; monitor.", citationIDs: ["openfda_round32"])
        ],
        adverseReactions: AttributedProse(
            "Tachycardia, palpitations, arrhythmias, angina, hypotension, headache, tremor, sweating, nausea, anxiety, hypokalemia, hyperglycemia.",
            citationIDs: ["openfda_round32"]
        ),
        drugInteractions: [
            AttributedBullet("BETA-BLOCKERS — antagonize isoproterenol; coordinate management.", citationIDs: ["openfda_round32"]),
            AttributedBullet("OTHER SYMPATHOMIMETICS (epinephrine, norepinephrine, dopamine, dobutamine) — additive effects; titrate.", citationIDs: ["openfda_round32"]),
            AttributedBullet("INHALATIONAL ANESTHETICS (halothane, sevoflurane) — sensitize myocardium to catecholamine arrhythmias; caution.", citationIDs: ["openfda_round32"]),
            AttributedBullet("DIGOXIN — additive arrhythmia risk.", citationIDs: ["openfda_round32"]),
            AttributedBullet("TRICYCLIC ANTIDEPRESSANTS — potentiate effects.", citationIDs: ["openfda_round32"]),
            AttributedBullet("MAOIs — caution.", citationIDs: ["openfda_round32"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive cardiac assessment, ECG (baseline rhythm + any conduction abnormalities), BP, ABG/electrolytes (K), comprehensive medications + indications.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Dedicated IV LINE for continuous infusion; central line preferred.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Continuous ECG monitoring — pacing setup (transcutaneous + transvenous) on standby for bradycardia bridge; arrhythmia surveillance.", citationIDs: ["specialty_round32"]),
            AttributedBullet("BP monitoring — arterial line preferred; recognize beta-2 hypotension despite chronotropic effect.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Underlying cause assessment — bradycardia (medications — beta-blockers, CCBs, digoxin; ischemia; metabolic — hypothermia, hypothyroid, hyperkalemia; toxic — opioids; vagal); treat reversible.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Bridge to PACING — transcutaneous + transvenous; consult cardiology + electrophysiology; isoproterenol limited duration.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Torsades management — magnesium sulfate 2 g IV FIRST; correct K + magnesium; isoproterenol for refractory pause-dependent torsades AFTER magnesium.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Counsel — palpitations + tremor + anxiety expected from beta-agonist effect; report chest pain, severe palpitations, syncope.", citationIDs: ["openrn_pharm_round32"]),
            AttributedBullet("Alternative bradycardia bridges — TRANSCUTANEOUS pacing, dopamine drip (5-20 mcg/kg/min), epinephrine drip (2-10 mcg/min), atropine repeated; transcutaneous pacing usually preferred over isoproterenol.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Cardiac transplant — denervated heart doesn't respond to atropine; isoproterenol useful for chronotropic support.", citationIDs: ["specialty_round32"])
        ],
        patientTeaching: AttributedProse(
            "This IV medicine speeds up your heart rate when it's too slow or treats certain heart rhythms. You may feel palpitations, tremor, anxiety. Tell us about chest pain, severe palpitations, or feeling like you might pass out. This is short-term — we plan to address the underlying problem (pacemaker, treat cause).",
            citationIDs: ["openrn_pharm_round32"]
        ),
        citations: [openfdaR32, openrnPharmR32, specialtyR32, ismpR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DigoxinImmuneFabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "digoxin-immune-fab",
        title: "Digoxin immune Fab (DigiFab)",
        subtitle: "Antidote for digoxin OD · ovine-derived Fab fragments · binds + neutralizes digoxin · arrhythmias + hyperkalemia + bradyarrhythmias · expensive · hyperkalemia management",
        category: "Digoxin antidote — Fab fragment antibody",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Ovine-derived antigen-binding fragments (Fab) of antibodies specific for digoxin"),
            KeyValueRow(key: "Use", value: "Life-threatening digoxin toxicity — severe hyperkalemia >5 mEq/L attributable to digoxin, life-threatening arrhythmias (VT, VF, severe bradycardia, high-grade AV block, asystole), serum digoxin level >10 ng/mL adult OR >5 ng/mL pediatric, ingested dose >10 mg adult OR >4 mg pediatric, end-organ dysfunction"),
            KeyValueRow(key: "Dose", value: "Calculate based on serum digoxin level OR ingested dose; commonly 5-10 vials empirically for severe; each vial = 40 mg neutralizes 0.5 mg digoxin; IV infusion over 30 minutes (faster if cardiac arrest)"),
            KeyValueRow(key: "Monitor", value: "ECG continuous, K + Cr + magnesium, repeat digoxin level meaningless after Fab (total elevated, free reduced); clinical response"),
            KeyValueRow(key: "Watch", value: "RAPID REVERSAL of toxicity (minutes-hours); REBOUND hypokalemia (sudden K shift back to intracellular); HYPERSENSITIVITY rare (ovine source); EXPENSIVE; HEART FAILURE worsening as digoxin effect reverses; HIGH-ALERT")
        ],
        indications: AttributedProse(
            "Life-threatening digoxin toxicity — severe hyperkalemia >5 mEq/L attributable to digoxin (digoxin causes Na-K-ATPase inhibition → potassium efflux), life-threatening cardiac arrhythmias from digoxin (VT, VF, severe bradycardia, high-grade AV block, asystole, refractory to standard ACLS), serum digoxin level >10 ng/mL adult or >5 ng/mL pediatric, ingested dose >10 mg adult or >4 mg pediatric, end-organ dysfunction. Less severe — symptomatic + persistent toxicity per primary source.",
            citationIDs: ["specialty_round32", "openfda_round32"]
        ),
        mechanism: AttributedProse(
            "Ovine-derived antibodies against digoxin generated by immunizing sheep, then digesting + purifying Fab fragments. Smaller Fab fragments (vs whole antibodies) reduce immunogenicity + allow rapid tissue penetration. Fab binds digoxin in blood + tissue with extremely high affinity → reverses digoxin binding to Na-K-ATPase → restores normal function → REVERSES arrhythmias + hyperkalemia + clinical toxicity. Digoxin-Fab complex eliminated renally (caution in renal failure).",
            citationIDs: ["openfda_round32"]
        ),
        dosing: [
            DosingBlock(label: "Calculation from serum digoxin level", body: "Number of vials = serum digoxin (ng/mL) × patient weight (kg) / 100 per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Calculation from ingested dose", body: "Number of vials = ingested dose (mg) × 0.8 (bioavailability) / 0.5 (digoxin neutralized per vial).", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Empiric for severe toxicity (unknown level)", body: "Adult: 10-20 vials IV; pediatric: 5-10 vials; smaller doses (3-6 vials) for less severe acute toxicity per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Acute ingestion (unknown amount)", body: "Adult: 5-10 vials; can repeat dose if symptoms persist; experienced toxicologist consultation.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Cardiac arrest", body: "IV bolus over 1-2 minutes; rapid administration acceptable for arrest situations.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Pediatric", body: "Weight-based calculation; same formula as adult.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Administration", body: "Reconstitute each vial in 4 mL sterile water → dilute in 0.9% NaCl; IV infusion over 30 minutes via 0.22-micron filter (filter not required for arrest); IV push over 1-2 minutes acceptable for cardiac arrest.", citationIDs: ["openfda_round32"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to ovine proteins (sheep allergy); use with caution + alternative if available, but life-threatening digoxin toxicity often requires use despite mild allergy.",
            citationIDs: ["openfda_round32"]
        ),
        warnings: [
            AttributedBullet("RAPID REVERSAL of toxicity — minutes to hours; ECG normalization, K reduction, clinical improvement.", citationIDs: ["openfda_round32"]),
            AttributedBullet("REBOUND HYPOKALEMIA — sudden K shift back to intracellular; monitor + supplement K aggressively after Fab; can drop rapidly.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HYPERSENSITIVITY / ALLERGIC REACTION — rare; ovine protein source; observe for anaphylaxis; minor reactions more common.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HEART FAILURE WORSENING — as digoxin effect reversed, underlying HF symptoms may worsen; manage with standard HF therapy.", citationIDs: ["specialty_round32"]),
            AttributedBullet("ATRIAL FIBRILLATION rate may increase — digoxin was rate-controlling; alternative AV nodal agent needed.", citationIDs: ["specialty_round32"]),
            AttributedBullet("EXPENSIVE — ~$3000-5000 per vial; consult toxicology + pharmacy.", citationIDs: ["openfda_round32"]),
            AttributedBullet("RENAL ELIMINATION — caution in renal failure (slow clearance); hemodialysis ineffective for digoxin-Fab complex.", citationIDs: ["openfda_round32"]),
            AttributedBullet("DIGOXIN LEVEL after Fab — measurement misleading (immunoassay measures total digoxin including bound + free); clinical assessment + ECG primary.", citationIDs: ["openfda_round32"]),
            AttributedBullet("PEDIATRIC + GERIATRIC — adjust based on weight; consult.", citationIDs: ["openfda_round32"])
        ],
        adverseReactions: AttributedProse(
            "Heart failure exacerbation, atrial fibrillation, rapid ventricular response, hypokalemia, mild allergic reactions, fever, anaphylaxis (rare).",
            citationIDs: ["openfda_round32"]
        ),
        drugInteractions: [
            AttributedBullet("DIGOXIN level interpretation — after Fab, immunoassay measures total digoxin (bound + free); meaningless; clinical assessment + ECG primary.", citationIDs: ["openfda_round32"]),
            AttributedBullet("BETA-BLOCKERS, CALCIUM CHANNEL BLOCKERS — alternative AV nodal agents for rate control after Fab.", citationIDs: ["specialty_round32"]),
            AttributedBullet("OTHER cardiac glycosides (digitoxin, other plant glycosides like oleander, foxglove, lily of valley) — cross-react with Fab to varying degrees.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Diuretics — caution rebound hypokalemia + electrolytes.", citationIDs: ["openfda_round32"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive cardiac assessment, ECG (baseline rhythm + AV block, arrhythmias), K + Cr + magnesium + Na + glucose, serum digoxin level (pretreatment), ingested dose history if known, allergies (especially sheep/ovine).", citationIDs: ["specialty_round32"]),
            AttributedBullet("Toxicology consultation — Poison Control Center 1-800-222-1222; specialty pharmacy access for Fab.", citationIDs: ["specialty_round32"]),
            AttributedBullet("CONTINUOUS ECG monitoring — anticipate rapid reversal; treat arrhythmias as per ACLS; pacing setup standby.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Continuous K monitoring — initial hyperkalemia from digoxin → rebound HYPOKALEMIA after Fab; supplement aggressively after Fab; recheck q1-2 hours initially.", citationIDs: ["openfda_round32"]),
            AttributedBullet("ADMINISTRATION — reconstitute + dilute as labeled; 30-minute IV infusion via 0.22-micron filter (push over 1-2 minutes acceptable for cardiac arrest); observe for hypersensitivity.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Heart failure management — as digoxin effect reversed, underlying HF may worsen; have IV diuretics + alternative HF therapies available.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Atrial fibrillation rate control — digoxin was rate-controlling; alternative AV nodal agent (beta-blocker, CCB, amiodarone) may be needed.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Renal function monitoring — Fab + digoxin complex renally eliminated; caution in renal failure; hemodialysis NOT effective for digoxin-Fab.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Cost discussion + appropriate use — expensive; reserve for life-threatening toxicity per criteria; consult toxicology.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Post-treatment — observe 24-48 hours for recurrence (especially if renal impairment slows elimination); long-term cardiology follow-up for underlying HF + atrial fibrillation management.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Plant glycoside ingestions — oleander, foxglove, lily of valley — Fab partially effective; toxicology consultation.", citationIDs: ["specialty_round32"])
        ],
        patientTeaching: AttributedProse(
            "This medicine reverses dangerous levels of digoxin (heart medicine). It works fast — your heart rhythm and potassium will normalize within hours. We monitor your potassium carefully because it can drop after treatment. Your underlying heart condition still needs treatment — we'll plan alternative medicines.",
            citationIDs: ["openrn_pharm_round32"]
        ),
        citations: [openfdaR32, openrnPharmR32, specialtyR32, ismpR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IcatibantSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "icatibant",
        title: "Icatibant (Firazyr)",
        subtitle: "Selective bradykinin B2 receptor antagonist · HEREDITARY ANGIOEDEMA (HAE) acute attack · 30 mg SC · self-administer · NO ACE-inhibitor angioedema indication",
        category: "Bradykinin B2 antagonist — HAE acute attack",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective competitive bradykinin B2 receptor antagonist"),
            KeyValueRow(key: "Use", value: "ACUTE attacks of hereditary angioedema (HAE) types I + II in adults + adolescents ≥12 years; subcutaneous self-administration possible"),
            KeyValueRow(key: "Dose", value: "30 mg (3 mL) subcutaneous in ABDOMEN; if inadequate response or symptoms recur after 6 hours, can repeat up to 2 additional doses (90 mg/24 hours maximum)"),
            KeyValueRow(key: "Monitor", value: "Attack response (symptom resolution typically within 2-4 hours), injection site, laryngeal involvement (airway emergency)"),
            KeyValueRow(key: "Watch", value: "LARYNGEAL ATTACK requires airway management + IV access; INJECTION site reactions; NOT for ACE-inhibitor-induced angioedema (mechanism different); coordinate with HAE specialist")
        ],
        indications: AttributedProse(
            "ACUTE attacks of hereditary angioedema (HAE) types I + II — bradykinin-mediated swelling from C1-INH deficiency or dysfunction. Provides rapid symptom resolution. Not indicated for acquired angioedema, ACE-inhibitor-induced angioedema, or other mechanisms (different mechanisms — histamine vs bradykinin). Self-administered if patient trained; medical setting for airway involvement per primary source.",
            citationIDs: ["specialty_round32", "openfda_round32"]
        ),
        mechanism: AttributedProse(
            "Synthetic decapeptide selective competitive antagonist at bradykinin B2 receptors. In HAE, C1-INH deficiency → uncontrolled kallikrein activation → bradykinin overproduction → bradykinin-mediated vasodilation + vascular permeability + edema. Icatibant BLOCKS B2 receptor binding → reverses bradykinin effects → resolves angioedema. Specific for bradykinin mechanism (HAE) but NOT effective for histamine-mediated (allergic) angioedema.",
            citationIDs: ["openfda_round32"]
        ),
        dosing: [
            DosingBlock(label: "Adult + adolescent (≥12 years)", body: "30 mg (3 mL) SC injection in ABDOMEN per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Repeat doses", body: "If inadequate response or symptoms recur after 6 hours, can give additional 30 mg SC; up to 2 additional doses in 24 hours (maximum 90 mg/24 hours).", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Self-administration", body: "Adult patients can be trained for self-administration; first dose in medical setting; subsequent home; specific abdominal subcutaneous technique.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Pediatric (<12 years)", body: "Not FDA-approved; specialist consultation.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Renal / hepatic", body: "No specific adjustment.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Pregnancy", body: "Limited data; risk-benefit; coordinate HAE specialist.", citationIDs: ["openfda_round32"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to icatibant.",
            citationIDs: ["openfda_round32"]
        ),
        warnings: [
            AttributedBullet("LARYNGEAL ATTACK — life-threatening airway emergency; medical setting + airway preparation (intubation kit, surgical airway); icatibant + supportive + alternative HAE therapies (C1-INH concentrate, ecallantide) if no response.", citationIDs: ["specialty_round32"]),
            AttributedBullet("INJECTION SITE reactions — common (~97%); erythema, swelling, pain, warmth, itching, burning, induration; usually mild + transient.", citationIDs: ["openfda_round32"]),
            AttributedBullet("NOT for ACE-inhibitor angioedema — different mechanism (bradykinin too but different receptor activation pattern); ACE-I angioedema typically managed with discontinuation + supportive care; some specialists use icatibant off-label for severe ACE-I angioedema (limited evidence).", citationIDs: ["specialty_round32"]),
            AttributedBullet("MISSED ATTACKS — gradual reduction in symptoms over hours; rebound 6+ hours later possible; repeat dose if recurrence.", citationIDs: ["openfda_round32"]),
            AttributedBullet("OTHER ANGIOEDEMA TYPES — histamine-mediated (allergic, drug-induced) — NOT responsive to icatibant; use epinephrine + antihistamines + steroids; acquired angioedema (C1-INH deficiency from lymphoma + autoantibodies) — limited efficacy.", citationIDs: ["specialty_round32"]),
            AttributedBullet("LATE ATTACK RECURRENCE — within 6-24 hours; have backup doses + alternative HAE therapy.", citationIDs: ["specialty_round32"]),
            AttributedBullet("ABDOMINAL ATTACK — severe abdominal pain, nausea, vomiting; differentiate from acute abdomen; icatibant effective.", citationIDs: ["specialty_round32"]),
            AttributedBullet("PRE-DENTAL + PRE-PROCEDURAL prophylaxis — short-term prophylaxis with C1-INH or attenuated androgens; long-term prophylaxis with lanadelumab + berotralstat + C1-INH; coordinate.", citationIDs: ["specialty_round32"])
        ],
        adverseReactions: AttributedProse(
            "Injection site reactions, headache, fever, dizziness, fatigue, nausea, abdominal pain.",
            citationIDs: ["openfda_round32"]
        ),
        drugInteractions: [
            AttributedBullet("OTHER HAE therapies — sometimes combined; specialist guidance.", citationIDs: ["openfda_round32"]),
            AttributedBullet("ACE INHIBITORS — increased angioedema risk; avoid in HAE patients (counsel).", citationIDs: ["openfda_round32"]),
            AttributedBullet("Hormonal contraceptives (estrogens) — can trigger HAE attacks; coordinate with HAE specialist.", citationIDs: ["specialty_round32"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — HAE diagnosis confirmation (C1-INH level + function + C4 level), attack history, frequency, severity, triggers, current prophylaxis (lanadelumab, berotralstat, C1-INH, attenuated androgens), allergies.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Patient + family education — recognize attacks (laryngeal — emergent; abdominal; cutaneous), trigger avoidance (trauma, surgery, hormonal, stress, infection, ACE-I), self-administration technique, when to seek emergency care.", citationIDs: ["openrn_pharm_round32"]),
            AttributedBullet("HAE emergency action plan — laryngeal involvement → 911 + airway protection + icatibant SC; abdominal → icatibant + IV fluids + analgesics; cutaneous → icatibant; have backup doses + alternative HAE therapy.", citationIDs: ["specialty_round32"]),
            AttributedBullet("SC injection technique — ABDOMEN; rotate sites; injection over 30 seconds; cold pack pre-injection helps; observe.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Alternative HAE acute therapies — C1-INH CONCENTRATE (Berinert, Cinryze IV; Haegarda SC for prophylaxis); ECALLANTIDE (Kalbitor SC); FRESH FROZEN PLASMA in resource-limited; specialty pharmacy + insurance.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Long-term prophylaxis — LANADELUMAB (Takhzyro SC q2-4 weeks); BEROTRALSTAT (Orladeyo oral daily); C1-INH (Cinryze IV q3-4 days, Haegarda SC); attenuated androgens (danazol — limited use due to side effects); coordinate.", citationIDs: ["specialty_round32"]),
            AttributedBullet("HAE specialist + immunology multidisciplinary care; HAE Association resources; emergency wallet card.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Pregnancy + lactation — coordinate; some HAE therapies safer than others (C1-INH preferred); icatibant data limited.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Cost + insurance — expensive specialty drug; manufacturer assistance programs.", citationIDs: ["specialty_round32"])
        ],
        patientTeaching: AttributedProse(
            "This shot treats HAE attacks. Give 30 mg in your belly when an attack starts. If laryngeal (throat) swelling — go to ER + use this. If symptoms return after 6 hours, give another shot (up to 3 in 24 hours). Have backup doses + emergency wallet card. Avoid ACE inhibitors. Tell us about pregnancy + planning. Call us about repeat attacks for prophylaxis options.",
            citationIDs: ["openrn_pharm_round32"]
        ),
        citations: [openfdaR32, openrnPharmR32, specialtyR32, ismpR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum RecombinantFactorVIIaSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "recombinant-factor-viia",
        title: "Recombinant factor VIIa (NovoSeven RT)",
        subtitle: "Hemophilia A/B with inhibitors · congenital factor VII deficiency · Glanzmann thrombasthenia · OFF-LABEL trauma + intracranial bleed · THROMBOTIC risk",
        category: "Recombinant coagulation factor — hemophilia inhibitors + off-label catastrophic bleeding",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant activated coagulation factor VII (rFVIIa)"),
            KeyValueRow(key: "Use", value: "Hemophilia A + B with inhibitors against factor VIII/IX; congenital factor VII deficiency; Glanzmann thrombasthenia with refractoriness to platelets; OFF-LABEL — life-threatening hemorrhage (trauma, intracerebral hemorrhage, postpartum hemorrhage, surgical) — controversial"),
            KeyValueRow(key: "Dose", value: "Hemophilia inhibitor: 90 mcg/kg IV q2-3 hours initially; congenital factor VII deficiency: 15-30 mcg/kg q4-6 hours; trauma off-label: highly variable, often 90-200 mcg/kg; route IV"),
            KeyValueRow(key: "Monitor", value: "Hemostasis, thromboembolic events, response, factor activity (when applicable)"),
            KeyValueRow(key: "Watch", value: "THROMBOSIS — arterial + venous (MI, stroke, PE, DVT); EFFICACY vs RISK debate especially off-label; EXPENSIVE; HIGH-ALERT")
        ],
        indications: AttributedProse(
            "Hemophilia A or B with INHIBITORS against factor VIII or IX (bleeding episodes + surgical prophylaxis); congenital factor VII deficiency; Glanzmann thrombasthenia (platelet GP IIb/IIIa deficiency) with refractoriness to platelet transfusions; OFF-LABEL — life-threatening hemorrhage (trauma, intracerebral hemorrhage, postpartum hemorrhage, surgical, cardiac surgery, ECMO, refractory bleeding) — controversial use due to thrombotic risks per primary source.",
            citationIDs: ["specialty_round32", "openfda_round32"]
        ),
        mechanism: AttributedProse(
            "Recombinant activated factor VII (rFVIIa) — same protein as endogenous activated VII. Binds to TISSUE FACTOR exposed at injury site → activates factor X → thrombin generation → fibrin clot. Therapeutic doses also directly activate factor X on platelet surface (independent of tissue factor) → high-dose thrombin burst → restores hemostasis despite hemophilia or other coagulopathy. Half-life ~2-3 hours requires frequent dosing.",
            citationIDs: ["openfda_round32"]
        ),
        dosing: [
            DosingBlock(label: "Hemophilia A/B with inhibitors", body: "90 mcg/kg IV bolus every 2-3 hours until hemostasis; can extend interval after hemostasis (every 4-6 hours then less frequently) per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Congenital factor VII deficiency", body: "15-30 mcg/kg IV every 4-6 hours; less frequent dosing typically.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Glanzmann thrombasthenia", body: "90 mcg/kg IV every 2 hours during bleeding; refractory to platelets.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Off-label catastrophic bleeding", body: "Highly variable — 90-200 mcg/kg IV bolus; repeat once if needed; protocol-driven; specialty consultation; controversial.", citationIDs: ["specialty_round32"]),
            DosingBlock(label: "Pediatric", body: "Same weight-based dosing; pediatric hematology consultation.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Administration", body: "Reconstitute lyophilized powder with sterile water; IV bolus over 2-5 minutes typically; immediate use after reconstitution.", citationIDs: ["openfda_round32"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to rFVIIa, mouse, hamster, or bovine proteins; severe thrombotic disease; relative — DIC, recent thrombotic event, severe atherosclerosis with active ischemia.",
            citationIDs: ["openfda_round32"]
        ),
        warnings: [
            AttributedBullet("THROMBOSIS — arterial (MI, stroke) + venous (DVT, PE) + arterial catheter thrombosis + intracardiac thrombus; risk especially elderly + atherosclerotic + immobile + DIC + concurrent prothrombotic factors; counsel + monitor.", citationIDs: ["openfda_round32"]),
            AttributedBullet("EFFICACY DEBATE — off-label trauma + ICH + PPH use highly debated; randomized trials (CONTROL, FAST, CRASH-2 era) showed limited mortality benefit + increased thrombosis; current TXA preferred for trauma + PPH.", citationIDs: ["specialty_round32"]),
            AttributedBullet("CONCURRENT activated factors (prothrombin complex concentrate, FEIBA — activated PCC) — increased thrombosis; avoid combinations.", citationIDs: ["openfda_round32"]),
            AttributedBullet("HEMOPHILIA inhibitor management — rFVIIa is one option; FEIBA (activated prothrombin complex concentrate) alternative; emicizumab (Hemlibra — subcutaneous bispecific antibody for prophylaxis); coordinate hematology.", citationIDs: ["specialty_round32"]),
            AttributedBullet("ANAPHYLAXIS — rare; treat as standard.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Hemostasis assessment — clinical primary; some labs measure thromboelastography (TEG, ROTEM) for response.", citationIDs: ["specialty_round32"]),
            AttributedBullet("EXPENSIVE — ~$5000-10,000 per dose; coordinate hematology + pharmacy.", citationIDs: ["specialty_round32"]),
            AttributedBullet("PREGNANCY — Category C; use only if benefit outweighs risk.", citationIDs: ["openfda_round32"]),
            AttributedBullet("LIVER DISEASE — caution; thrombosis risk + altered hemostasis.", citationIDs: ["openfda_round32"])
        ],
        adverseReactions: AttributedProse(
            "Thrombosis (arterial + venous), MI, stroke, pulmonary embolism, DVT, headache, hypertension, fever, nausea, anaphylaxis (rare).",
            citationIDs: ["openfda_round32"]
        ),
        drugInteractions: [
            AttributedBullet("ACTIVATED COAGULATION products — FEIBA, prothrombin complex concentrate — additive thrombosis; avoid concurrent.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Antifibrinolytics (TXA, aminocaproic acid) — sometimes combined for hemostasis; specialty.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Concurrent anticoagulants — usually reversed/avoided.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Hormonal therapies — additive thrombosis.", citationIDs: ["openfda_round32"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive bleeding assessment, factor levels + inhibitor titer, CBC, INR/PT/aPTT, fibrinogen, type/screen + match, thrombotic history, current anticoagulation, allergies.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Hematology consultation — bleeding disorder management, inhibitor titer, factor levels, alternative therapies (FEIBA, emicizumab for prophylaxis).", citationIDs: ["specialty_round32"]),
            AttributedBullet("Bleeding monitoring — clinical assessment + vital signs + Hgb + lactate; serial response to therapy.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Thrombosis surveillance — clinical assessment for VTE/MI/stroke, D-dimer trend, ECG for cardiac, vascular access patency.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Off-label use considerations — risk-benefit, hospital protocols, hematology consult, alternatives (TXA + standard hemostasis + factor concentrates + PCC + cryoprecipitate + platelets + FFP).", citationIDs: ["specialty_round32"]),
            AttributedBullet("Long-term hemophilia management — factor replacement (factor VIII or IX) for non-inhibitor patients; inhibitor patients — rFVIIa or FEIBA episodic + emicizumab prophylaxis (changing landscape); rituximab + IVIG for inhibitor eradication.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Pediatric hematology — multidisciplinary care.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Reconstitution + administration — sterile water reconstitute; IV bolus 2-5 minutes; immediate use; dispose of unused.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Counsel patient + family — bleeding action plan, when to call, signs of clotting (chest pain, dyspnea, leg swelling), follow-up.", citationIDs: ["openrn_pharm_round32"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps stop bleeding when your body can't form clots normally. It works fast but increases clot risk. Tell us about chest pain, breathlessness, leg pain/swelling, sudden weakness, slurred speech (clot signs). For hemophilia + inhibitors, we plan long-term — alternative therapies like emicizumab for prevention.",
            citationIDs: ["openrn_pharm_round32"]
        ),
        citations: [openfdaR32, openrnPharmR32, specialtyR32, ismpR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LidocaineIVAntiarrhythmicSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lidocaine-iv-antiarrhythmic",
        title: "Lidocaine IV antiarrhythmic",
        subtitle: "Class IB Na+ channel blocker · ventricular tachycardia + VF · ACLS adjunct · cardiac arrest second-line vs amiodarone · CNS + cardiac toxicity at high doses",
        category: "Class IB antiarrhythmic — VT/VF + cardiac arrest",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Class IB sodium channel blocker — selective for depolarized + ischemic tissue + Purkinje fibers"),
            KeyValueRow(key: "Use", value: "Ventricular tachycardia (VT) + ventricular fibrillation (VF) — ACLS adjunct or alternative to amiodarone; suppression of frequent PVCs (rarely used now); lidocaine + amiodarone refractory shockable arrest"),
            KeyValueRow(key: "Dose", value: "Loading 1-1.5 mg/kg IV bolus (max 3 mg/kg total); repeat 0.5-0.75 mg/kg q5-10 min if needed; maintenance 1-4 mg/min IV continuous infusion"),
            KeyValueRow(key: "Monitor", value: "ECG, blood pressure, mental status (CNS toxicity), serum levels (target 1.5-5 mg/L if monitoring, toxicity >9)"),
            KeyValueRow(key: "Watch", value: "CNS TOXICITY (perioral numbness, tinnitus, confusion → seizures); CARDIAC toxicity (bradycardia, AV block, hypotension); HEPATIC clearance — reduce dose in hepatic dysfunction; AMIODARONE preferred for stable wide-complex tachycardia; HIGH-ALERT")
        ],
        indications: AttributedProse(
            "Ventricular tachycardia (VT) — stable + unstable; ventricular fibrillation (VF) — ACLS adjunct after defibrillation; cardiac arrest from shockable rhythms — alternative or adjunct to amiodarone; perioperative ventricular arrhythmia prophylaxis (less common now); suppression of frequent PVCs in selected (rarely used due to CAST trial concerns showing increased mortality in prophylactic use post-MI) per primary source.",
            citationIDs: ["specialty_round32", "openfda_round32"]
        ),
        mechanism: AttributedProse(
            "Class IB sodium channel blocker — preferentially binds to sodium channels in depolarized (especially ischemic) cardiac tissue → slows phase 0 depolarization + shortens action potential duration + refractory period. Selective for ventricular tissue including Purkinje fibers; minimal effect on normal atrial tissue. Less proarrhythmic than Class IA + IC. Local anesthetic mechanism — different application.",
            citationIDs: ["openfda_round32"]
        ),
        dosing: [
            DosingBlock(label: "Adult VT/VF", body: "Loading 1-1.5 mg/kg IV bolus over 1-2 minutes; repeat 0.5-0.75 mg/kg q5-10 minutes if needed (total maximum 3 mg/kg loading); maintenance 1-4 mg/min IV continuous infusion per primary source.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Cardiac arrest (refractory VF/pulseless VT)", body: "1-1.5 mg/kg IV bolus; can repeat 0.5-0.75 mg/kg q5-10 minutes (max 3 mg/kg cumulative); follow with infusion if return of spontaneous circulation; AMIODARONE 300 mg IV bolus alternative (often preferred).", citationIDs: ["specialty_round32"]),
            DosingBlock(label: "Maintenance infusion", body: "1-4 mg/min IV; reduce to 1-2 mg/min in hepatic dysfunction, CHF, elderly, severe trauma; titrate based on response + side effects.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Hepatic adjustment", body: "Reduce loading + maintenance by ~50% in significant hepatic dysfunction; lidocaine extensively hepatically metabolized.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "CHF / hypoperfusion", body: "Reduce dose; reduced hepatic blood flow + clearance.", citationIDs: ["openfda_round32"]),
            DosingBlock(label: "Pediatric", body: "1 mg/kg IV bolus; maintenance 20-50 mcg/kg/min; pediatric resuscitation consultation.", citationIDs: ["openfda_round32"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to lidocaine or amide-type local anesthetics; severe SA, AV, or intraventricular block (without pacemaker); Adams-Stokes syndrome; Wolff-Parkinson-White syndrome with antegrade AP conduction (relative).",
            citationIDs: ["openfda_round32"]
        ),
        warnings: [
            AttributedBullet("CNS TOXICITY — perioral numbness, tinnitus, vertigo, confusion, lightheadedness → SEIZURES → respiratory depression → coma; dose-dependent + serum level-dependent; stop infusion + supportive care + benzodiazepine for seizures.", citationIDs: ["openfda_round32"]),
            AttributedBullet("CARDIAC TOXICITY — bradycardia, sinus arrest, AV block, asystole, ventricular arrhythmia paradoxically, hypotension; particularly with high doses + hepatic dysfunction + CHF.", citationIDs: ["openfda_round32"]),
            AttributedBullet("SERUM LEVELS — target therapeutic 1.5-5 mg/L; toxicity >9 mg/L common but variable; monitor in prolonged infusion + hepatic dysfunction.", citationIDs: ["openfda_round32"]),
            AttributedBullet("PROARRHYTHMIA — uncommon vs Class IA + IC; CAST trial showed increased mortality with prophylactic use post-MI; rarely used prophylactically now.", citationIDs: ["specialty_round32"]),
            AttributedBullet("HEPATIC IMPAIRMENT — significantly reduced clearance; reduce dose; serum level monitoring.", citationIDs: ["openfda_round32"]),
            AttributedBullet("BETA-BLOCKERS — reduce lidocaine clearance (~30%); reduce dose with concurrent.", citationIDs: ["openfda_round32"]),
            AttributedBullet("AMIODARONE preferred for stable wide-complex tachycardia + cardiac arrest in modern ACLS protocols (2020); lidocaine secondary or alternative; both reasonable.", citationIDs: ["specialty_round32"]),
            AttributedBullet("ELDERLY — increased toxicity risk; reduce dose; close monitoring.", citationIDs: ["openfda_round32"]),
            AttributedBullet("ACIDOSIS — increases lidocaine toxicity (free fraction); correct.", citationIDs: ["openfda_round32"]),
            AttributedBullet("MALIGNANT HYPERTHERMIA — historically associated; avoid in susceptible patients.", citationIDs: ["openfda_round32"])
        ],
        adverseReactions: AttributedProse(
            "Bradycardia, hypotension, AV block, dizziness, confusion, seizures, respiratory depression, perioral numbness, tinnitus, drowsiness, nausea.",
            citationIDs: ["openfda_round32"]
        ),
        drugInteractions: [
            AttributedBullet("BETA-BLOCKERS — reduce lidocaine clearance + additive cardiac toxicity.", citationIDs: ["openfda_round32"]),
            AttributedBullet("CIMETIDINE — reduces lidocaine clearance; avoid concurrent.", citationIDs: ["openfda_round32"]),
            AttributedBullet("AMIODARONE — additive cardiac toxicity; coordinate.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Class IB ANTIARRHYTHMICS (mexiletine, tocainide) — additive Na channel blockade.", citationIDs: ["openfda_round32"]),
            AttributedBullet("OPIOIDS + SEDATIVES — additive CNS depression.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Class IA + IC antiarrhythmics — additive proarrhythmia; avoid combinations.", citationIDs: ["openfda_round32"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive cardiac assessment, ECG (baseline + rhythm strip), BP, mental status, hepatic function, comorbidities, comprehensive medications, lidocaine + amide anesthetic allergies.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Continuous ECG + BP monitoring — telemetry; arterial line ideal for severe cases; immediate intervention for arrhythmia worsening + bradycardia + hypotension.", citationIDs: ["openfda_round32"]),
            AttributedBullet("CNS toxicity monitoring — perioral numbness, tinnitus, confusion early signs; STOP infusion + supportive care + benzodiazepine if seizures.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Serum levels — target 1.5-5 mg/L; check in prolonged infusion + hepatic dysfunction + clinical concerns.", citationIDs: ["openfda_round32"]),
            AttributedBullet("Hepatic + cardiac function — reduce dose appropriately; close monitoring.", citationIDs: ["openfda_round32"]),
            AttributedBullet("ACLS protocols — VF/pulseless VT — defibrillation + epinephrine + AMIODARONE 300 mg IV bolus or LIDOCAINE 1-1.5 mg/kg IV bolus; coordinate with code team; ROSC + maintenance infusion.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Stable wide-complex tachycardia — synchronized cardioversion vs amiodarone vs lidocaine; specialty consultation.", citationIDs: ["specialty_round32"]),
            AttributedBullet("Counsel — purpose, common side effects (CNS — tingling, dizziness), report severe symptoms.", citationIDs: ["openrn_pharm_round32"]),
            AttributedBullet("Long-term management — implantable cardioverter-defibrillator (ICD) for recurrent VT/VF, ablation for monomorphic VT, antiarrhythmic medications (amiodarone, sotalol, mexiletine), reversible cause treatment (electrolytes, ischemia, drugs, cardiomyopathy).", citationIDs: ["specialty_round32"]),
            AttributedBullet("Local anesthetic uses — separate dose limits + concerns; not interchangeable with antiarrhythmic dosing.", citationIDs: ["openfda_round32"])
        ],
        patientTeaching: AttributedProse(
            "This IV medicine treats dangerous heart rhythms from the lower chambers. We monitor your heart rhythm + brain function closely. Tell us about numbness around mouth, ringing in ears, confusion, dizziness — early signs of side effects. After this, we'll address why the rhythm happened — sometimes needing a defibrillator (ICD) for prevention.",
            citationIDs: ["openrn_pharm_round32"]
        ),
        citations: [openfdaR32, openrnPharmR32, specialtyR32, ismpR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}
