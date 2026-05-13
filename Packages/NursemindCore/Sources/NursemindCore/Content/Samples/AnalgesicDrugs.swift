import Foundation

private let openfda = CitationSource(
    id: "openfda_generic",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-03"
)
private let openrn = CitationSource(
    id: "openrn_pharm_pain",
    shortName: "Open RN Nursing Pharmacology — Analgesics",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
    lastRetrieved: "2026-05-03"
)
private let ismp = CitationSource(
    id: "ismp_high_alert_2024",
    shortName: "ISMP List of High-Alert Medications, 2024",
    detail: "IV opioids are an ISMP high-alert class",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-03"
)

// MARK: - Fentanyl

public enum FentanylSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "fentanyl",
        title: "Fentanyl",
        subtitle: "Sublimaze · synthetic opioid",
        category: "Opioid Analgesic",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic mu-opioid agonist"),
            KeyValueRow(key: "Onset", value: "1–2 min (IV); 7–15 min (IM)"),
            KeyValueRow(key: "Duration", value: "30–60 min (single IV dose)"),
            KeyValueRow(key: "Potency", value: "~100× morphine"),
            KeyValueRow(key: "Reversal", value: "Naloxone (often multiple doses needed)")
        ],
        indications: AttributedProse(
            "Procedural sedation analgesia, perioperative analgesia, ICU sedation (continuous infusion), severe acute pain, breakthrough cancer pain (transmucosal forms).",
            citationIDs: ["openfda_generic"]
        ),
        mechanism: AttributedProse(
            "High-affinity mu-opioid receptor agonist with rapid onset and short duration after single dose; very lipid soluble.",
            citationIDs: ["openfda_generic"]
        ),
        dosing: [
            DosingBlock(label: "IV bolus (analgesia)", body: "25–100 mcg every 30–60 minutes as needed (typical adult).", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Procedural sedation", body: "0.5–1 mcg/kg IV; titrate.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Continuous infusion (ICU)", body: "0.7–10 mcg/kg/hr; titrate to RASS goal.", citationIDs: ["openfda_generic"])
        ],
        contraindications: AttributedProse(
            "Severe respiratory depression, paralytic ileus, MAOI use within 14 days, hypersensitivity.",
            citationIDs: ["openfda_generic"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: addiction, abuse, life-threatening respiratory depression, accidental ingestion (esp. patches), CNS depressants concomitantly.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Chest wall rigidity with rapid IV push — give slowly; have neuromuscular blocker available for severe cases.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Bradycardia is more common than with morphine (vagal effect).", citationIDs: ["openfda_generic"]),
            AttributedBullet("Transdermal patches: 12-hour onset; not for acute pain or opioid-naive patients.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Synthetic opioids (incl. illicit fentanyl) drive overdose deaths; naloxone may need repeat doses.", citationIDs: ["openrn_pharm_pain"])
        ],
        adverseReactions: AttributedProse(
            "Common: respiratory depression, sedation, nausea, vomiting, bradycardia, hypotension, urinary retention, constipation. Less common but classic: chest wall rigidity, opioid-induced hyperalgesia.",
            citationIDs: ["openfda_generic"]
        ),
        drugInteractions: [
            AttributedBullet("Benzodiazepines + fentanyl — profound respiratory depression; avoid concurrent use when possible.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Serotonergic drugs (SSRIs, SNRIs, MAOIs, ondansetron) — serotonin syndrome.", citationIDs: ["openfda_generic"]),
            AttributedBullet("CYP3A4 inhibitors (azoles, macrolides, ritonavir) — increase fentanyl levels.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification of IV doses (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Push slowly (over 1–2 min) to avoid chest wall rigidity.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Continuous SpO2 and respiratory monitoring; hold for RR <12 and notify provider.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Have naloxone immediately available; expect to need multiple doses for fentanyl reversal.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Patches: do not cut, do not apply heat (heating pad, hot bath increases absorption → overdose). Confirm old patch removed before applying new.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Bowel regimen for prolonged use.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Sedation scale assessment (POSS or similar) at peak effect.", citationIDs: ["openrn_pharm_pain"])
        ],
        patientTeaching: AttributedProse(
            "Avoid alcohol and other sedatives. Patches: never cut; remove old before applying new; keep away from heat sources, children, and pets. Carry naloxone if at home use. Bowel regimen — opioids cause constipation.",
            citationIDs: ["openrn_pharm_pain"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Hydromorphone (Dilaudid)

public enum HydromorphoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "hydromorphone",
        title: "Hydromorphone",
        subtitle: "Dilaudid · semi-synthetic opioid",
        category: "Opioid Analgesic",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Mu-opioid agonist"),
            KeyValueRow(key: "Onset", value: "5 min (IV); 15–30 min (PO)"),
            KeyValueRow(key: "Duration", value: "3–4 hr"),
            KeyValueRow(key: "Potency", value: "~7× morphine"),
            KeyValueRow(key: "Reversal", value: "Naloxone")
        ],
        indications: AttributedProse(
            "Moderate to severe pain when alternative treatments are inadequate. Often substituted for morphine in renal impairment (no active metabolites).",
            citationIDs: ["openfda_generic"]
        ),
        mechanism: AttributedProse("Mu-opioid receptor agonist.", citationIDs: ["openfda_generic"]),
        dosing: [
            DosingBlock(label: "IV", body: "0.2–1 mg every 2–3 hours as needed; opioid-naive start at 0.2 mg.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Oral", body: "2–4 mg every 4–6 hours as needed.", citationIDs: ["openfda_generic"])
        ],
        contraindications: AttributedProse("Significant respiratory depression, severe asthma, paralytic ileus, MAOI use, hypersensitivity.", citationIDs: ["openfda_generic"]),
        warnings: [
            AttributedBullet("Boxed warning: addiction, abuse, respiratory depression, neonatal opioid withdrawal, CNS depressants.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Highly potent — wrong-dose errors are sentinel events. 1 mg of hydromorphone ≈ 7 mg of morphine.", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Often confused with morphine on order/label — confirm strength.", citationIDs: ["openrn_pharm_pain"])
        ],
        adverseReactions: AttributedProse("Sedation, nausea, vomiting, constipation, respiratory depression, urinary retention, pruritus.", citationIDs: ["openfda_generic"]),
        drugInteractions: [
            AttributedBullet("Benzodiazepines/CNS depressants — additive respiratory depression.", citationIDs: ["openfda_generic"]),
            AttributedBullet("MAOIs, serotonergic drugs — serotonin syndrome.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Confirm right drug — Dilaudid orders are often confused with morphine. Always verify strength.", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Same monitoring as morphine — RR, SpO2, sedation scale at peak effect (5 min IV, 30 min PO).", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Have naloxone available.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Bowel regimen.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Preferred over morphine in renal impairment (no neurotoxic active metabolite like morphine-6-glucuronide).", citationIDs: ["openrn_pharm_pain"])
        ],
        patientTeaching: AttributedProse("Take only as prescribed. This is much stronger than common pain meds — do not double up if a dose feels weak; call provider. Avoid alcohol and sedatives. Bowel regimen.", citationIDs: ["openrn_pharm_pain"]),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Ketorolac (Toradol)

public enum KetorolacSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ketorolac",
        title: "Ketorolac",
        subtitle: "Toradol · NSAID",
        category: "NSAID",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-selective NSAID"),
            KeyValueRow(key: "Onset", value: "10 min (IV); 30–45 min (PO)"),
            KeyValueRow(key: "Duration", value: "4–6 hr"),
            KeyValueRow(key: "Max duration", value: "5 days TOTAL across all routes")
        ],
        indications: AttributedProse(
            "Short-term (≤5 days) management of moderately severe acute pain that requires analgesia at the opioid level. Often used post-op as opioid-sparing analgesic.",
            citationIDs: ["openfda_generic"]
        ),
        mechanism: AttributedProse("Non-selective COX inhibitor — reduces prostaglandin synthesis.", citationIDs: ["openfda_generic"]),
        dosing: [
            DosingBlock(label: "IV/IM (adult <65)", body: "30 mg IV/IM every 6 hours; max 120 mg/day.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Adult ≥65 / renal impairment / <50 kg", body: "15 mg IV/IM every 6 hours; max 60 mg/day.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Oral", body: "10 mg every 4–6 hours as transition dose; max 40 mg/day.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "TOTAL DURATION", body: "5 days max combined IV + IM + PO. Longer use → AKI, GI bleed risk.", citationIDs: ["openfda_generic"])
        ],
        contraindications: AttributedProse(
            "Active or history of GI bleeding/peptic ulcer, advanced renal impairment or volume depletion, bleeding diathesis, neuraxial use, before/during major surgery, third trimester pregnancy, breastfeeding, hypersensitivity to NSAIDs (esp. ASA-induced asthma).",
            citationIDs: ["openfda_generic"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: GI bleeding, perforation, ulceration risk; cardiovascular thrombotic events; AKI.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Renal: NSAIDs reduce renal blood flow; risk of AKI in elderly, volume-depleted, ACE/ARB users.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Bleeding: inhibits platelet function; avoid in major surgery, active bleeding.", citationIDs: ["openfda_generic"]),
            AttributedBullet("5-day max — rigidly enforced. AKI rate increases significantly beyond.", citationIDs: ["openfda_generic"])
        ],
        adverseReactions: AttributedProse("GI upset, bleeding, AKI, hypertension, edema, drowsiness, headache.", citationIDs: ["openfda_generic"]),
        drugInteractions: [
            AttributedBullet("Anticoagulants/antiplatelets — additive bleeding.", citationIDs: ["openfda_generic"]),
            AttributedBullet("ACE/ARB + diuretic — triple whammy AKI.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Lithium — toxicity.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Methotrexate — toxicity.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("Track total duration across all routes — do NOT exceed 5 days combined.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Check renal function (BUN, Cr) at baseline and during therapy.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Assess for GI bleeding signs — coffee-ground emesis, melena, abdominal pain.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Hold for active bleeding, recent major surgery (per surgeon).", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Use lower dose in elderly, low body weight, or any renal impairment.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Excellent opioid-sparing effect — track pain scores to demonstrate efficacy.", citationIDs: ["openrn_pharm_pain"])
        ],
        patientTeaching: AttributedProse("Take with food. Do not exceed 5 days. Stop and call provider for stomach pain, black/bloody stools, decreased urine, severe headache.", citationIDs: ["openrn_pharm_pain"]),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Gabapentin

public enum GabapentinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "gabapentin",
        title: "Gabapentin",
        subtitle: "Neurontin · GABA analog (anticonvulsant + neuropathic pain)",
        category: "Anticonvulsant / Neuropathic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "GABA analog (binds α2δ subunit of voltage-gated Ca²⁺ channel)"),
            KeyValueRow(key: "Onset", value: "Days–weeks for full effect"),
            KeyValueRow(key: "Half-life", value: "5–7 hr"),
            KeyValueRow(key: "Renal adjustment", value: "Yes — significantly reduce in CrCl <60")
        ],
        indications: AttributedProse(
            "Postherpetic neuralgia, partial seizures (adjunct), neuropathic pain (off-label, very common), restless leg syndrome.",
            citationIDs: ["openfda_generic"]
        ),
        mechanism: AttributedProse("Modulates calcium influx by binding the α2δ subunit of voltage-gated calcium channels — reduces neuronal hyperexcitability.", citationIDs: ["openfda_generic"]),
        dosing: [
            DosingBlock(label: "Initiation", body: "300 mg PO at bedtime day 1; 300 mg twice daily day 2; 300 mg three times daily day 3.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Maintenance (PHN)", body: "1800–3600 mg/day in 3 divided doses.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Renal adjust", body: "Reduce dose by 50–75% based on CrCl; substantially reduced in dialysis patients.", citationIDs: ["openfda_generic"])
        ],
        contraindications: AttributedProse("Hypersensitivity to gabapentin.", citationIDs: ["openfda_generic"]),
        warnings: [
            AttributedBullet("Sedation, dizziness — fall risk especially in elderly.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Suicidal thoughts/behavior — class warning for antiepileptics; monitor mood.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Respiratory depression with concurrent opioids or in COPD/sleep apnea — recognized concern especially in elderly.", citationIDs: ["openfda_generic"]),
            AttributedBullet("DRESS syndrome — rare but serious; rash + systemic symptoms warrants discontinuation.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Misuse potential — controlled substance in some states; sedating in combination with opioids/alcohol.", citationIDs: ["openfda_generic"])
        ],
        adverseReactions: AttributedProse("Common: somnolence, dizziness, ataxia, peripheral edema, fatigue. Serious: DRESS, anaphylaxis, suicidal ideation.", citationIDs: ["openfda_generic"]),
        drugInteractions: [
            AttributedBullet("Opioids — additive respiratory depression and sedation.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Alcohol and other CNS depressants — additive sedation.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Antacids — reduce absorption; separate by 2 hours.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("Titrate up over days to limit sedation and dizziness.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Fall precautions, especially first few doses.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Adjust for renal function — overdose causes profound sedation.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Do NOT stop abruptly — taper to avoid withdrawal seizures (in epilepsy use).", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Assess mood — monitor for suicidal ideation as a class effect.", citationIDs: ["openrn_pharm_pain"]),
            AttributedBullet("Counsel about combining with opioids — additive respiratory risk.", citationIDs: ["openrn_pharm_pain"])
        ],
        patientTeaching: AttributedProse("May cause drowsiness/dizziness — avoid driving until you know how it affects you. Do not stop suddenly. Take antacids 2 hours apart. Avoid alcohol. Report rash, mood changes, severe drowsiness.", citationIDs: ["openrn_pharm_pain"]),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-03"
    )
}
