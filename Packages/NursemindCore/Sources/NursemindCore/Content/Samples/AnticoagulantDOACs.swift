import Foundation

// Curator-model DOAC + thrombolytic entries (v1.5 expansion).
// Sources: openFDA SPL (CC0), Open RN Nursing Pharmacology (CC BY 4.0), ISMP high-alert.

private let openfda = CitationSource(
    id: "openfda_doac",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_pharm_doac",
    shortName: "Open RN Nursing Pharmacology — Anticoagulants",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=anticoagulant+warfarin+heparin+doac",
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

// MARK: - Apixaban

public enum ApixabanSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "apixaban",
        title: "Apixaban",
        subtitle: "Eliquis · direct oral factor Xa inhibitor (DOAC)",
        category: "DOAC — Factor Xa Inhibitor",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Direct factor Xa inhibitor"),
            KeyValueRow(key: "Onset", value: "3–4 hours"),
            KeyValueRow(key: "Half-life", value: "~12 hr"),
            KeyValueRow(key: "Reversal", value: "Andexanet alfa (specific) or 4-factor PCC")
        ],
        indications: AttributedProse(
            "Stroke prevention in non-valvular atrial fibrillation. Treatment and secondary prevention of DVT/PE. VTE prophylaxis after hip/knee replacement.",
            citationIDs: ["openfda_doac"]
        ),
        mechanism: AttributedProse(
            "Selective, reversible inhibitor of free and clot-bound factor Xa, blocking thrombin generation and clot formation.",
            citationIDs: ["openfda_doac", "openrn_pharm_doac"]
        ),
        dosing: [
            DosingBlock(label: "Non-valvular AFib", body: "5 mg PO BID. Reduce to 2.5 mg BID if ≥2 of: age ≥80, weight ≤60 kg, creatinine ≥1.5 mg/dL.", citationIDs: ["openfda_doac"]),
            DosingBlock(label: "Acute DVT/PE treatment", body: "10 mg PO BID × 7 days, then 5 mg PO BID × at least 6 months.", citationIDs: ["openfda_doac"]),
            DosingBlock(label: "DVT/PE secondary prevention", body: "2.5 mg PO BID after at least 6 months of treatment.", citationIDs: ["openfda_doac"]),
            DosingBlock(label: "VTE prophylaxis (hip/knee)", body: "2.5 mg PO BID × 35 days (hip) or 12 days (knee).", citationIDs: ["openfda_doac"])
        ],
        contraindications: AttributedProse(
            "Active major bleeding. Hypersensitivity. Mechanical heart valves (DOACs not indicated). Severe hepatic impairment.",
            citationIDs: ["openfda_doac"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: discontinuation increases thrombotic risk — bridge if discontinuation needed for surgery.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Boxed warning: spinal/epidural hematoma — risk with neuraxial anesthesia or LP. Hold per protocol.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Bleeding — major and minor; no routine monitoring is required (unlike warfarin).", citationIDs: ["openfda_doac"]),
            AttributedBullet("Avoid concurrent strong CYP3A4/P-gp inhibitors (ketoconazole, ritonavir) and inducers (rifampin, phenytoin).", citationIDs: ["openfda_doac"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (most common — minor bruising to major hemorrhage), nausea, anemia.",
            citationIDs: ["openfda_doac"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 + P-gp inhibitors (ketoconazole, itraconazole, ritonavir, clarithromycin) — raise apixaban levels significantly; reduce dose or avoid.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Strong CYP3A4/P-gp inducers (rifampin, phenytoin, carbamazepine, St. John's wort) — reduce apixaban levels; avoid combination.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Other anticoagulants, antiplatelets, NSAIDs — additive bleeding.", citationIDs: ["openfda_doac"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification for changes (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Verify renal function and dose-reduction criteria (age, weight, creatinine).", citationIDs: ["openrn_pharm_doac"]),
            AttributedBullet("Hold per institution protocol before invasive procedures (typically 24–48 hours; longer if renal impairment).", citationIDs: ["openrn_pharm_doac"]),
            AttributedBullet("Bleeding precautions; report any unusual bruising, dark/bloody stools, blood in urine, severe headache.", citationIDs: ["openrn_pharm_doac"]),
            AttributedBullet("Reversal: andexanet alfa for life-threatening or uncontrolled bleeding (per protocol); 4-factor PCC alternative.", citationIDs: ["openrn_pharm_doac"]),
            AttributedBullet("No routine INR/aPTT monitoring required; do NOT use INR for DOAC monitoring.", citationIDs: ["openrn_pharm_doac"])
        ],
        patientTeaching: AttributedProse(
            "Take twice daily, about 12 hours apart. Do not stop without talking to your provider — stopping suddenly can cause clots. Tell every provider and dentist before procedures. Bleeding precautions: soft toothbrush, electric razor, fall prevention. Report severe headache, weakness, dark stools, or pink/red urine.",
            citationIDs: ["openrn_pharm_doac"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Rivaroxaban

public enum RivaroxabanSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "rivaroxaban",
        title: "Rivaroxaban",
        subtitle: "Xarelto · direct oral factor Xa inhibitor (DOAC)",
        category: "DOAC — Factor Xa Inhibitor",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Direct factor Xa inhibitor"),
            KeyValueRow(key: "Onset", value: "2–4 hours"),
            KeyValueRow(key: "Half-life", value: "5–9 hr (12 hr in elderly)"),
            KeyValueRow(key: "Food", value: "15 mg and 20 mg doses MUST be taken with food")
        ],
        indications: AttributedProse(
            "Stroke prevention in non-valvular AFib, DVT/PE treatment and secondary prevention, VTE prophylaxis after hip/knee replacement, CAD/PAD secondary prevention (low-dose with aspirin).",
            citationIDs: ["openfda_doac"]
        ),
        mechanism: AttributedProse(
            "Selective direct inhibitor of free and clot-bound factor Xa, preventing thrombin generation.",
            citationIDs: ["openfda_doac"]
        ),
        dosing: [
            DosingBlock(label: "Non-valvular AFib", body: "20 mg PO daily WITH evening meal (15 mg if CrCl 15–50).", citationIDs: ["openfda_doac"]),
            DosingBlock(label: "DVT/PE treatment", body: "15 mg PO BID × 21 days, then 20 mg PO daily for at least 6 months. Take WITH food.", citationIDs: ["openfda_doac"]),
            DosingBlock(label: "DVT/PE secondary prevention", body: "10 mg PO daily after at least 6 months of treatment.", citationIDs: ["openfda_doac"]),
            DosingBlock(label: "VTE prophylaxis (hip/knee)", body: "10 mg PO daily × 35 days (hip) or 12 days (knee).", citationIDs: ["openfda_doac"]),
            DosingBlock(label: "CAD/PAD secondary prevention", body: "2.5 mg PO BID with aspirin 81 mg daily.", citationIDs: ["openfda_doac"])
        ],
        contraindications: AttributedProse(
            "Active major bleeding. Hypersensitivity. Mechanical heart valves. Severe hepatic impairment (Child-Pugh B/C).",
            citationIDs: ["openfda_doac"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: discontinuation increases thrombotic risk.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Boxed warning: spinal/epidural hematoma with neuraxial anesthesia or LP.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Bleeding — major and minor; no routine monitoring.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Renal impairment — avoid if CrCl <15.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Reversal: andexanet alfa or 4-factor PCC for life-threatening bleeding.", citationIDs: ["openfda_doac"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (major and minor), back pain, GI upset, anemia, transient LFT elevation.",
            citationIDs: ["openfda_doac"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 + P-gp inhibitors — raise rivaroxaban; avoid.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Strong CYP3A4 + P-gp inducers — reduce rivaroxaban; avoid.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Other anticoagulants/antiplatelets/NSAIDs — additive bleeding.", citationIDs: ["openfda_doac"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Reinforce: 15 mg and 20 mg doses MUST be taken WITH FOOD for adequate absorption.", citationIDs: ["openrn_pharm_doac"]),
            AttributedBullet("Hold per protocol before procedures (typically 24 hours; longer if renal impairment).", citationIDs: ["openrn_pharm_doac"]),
            AttributedBullet("Verify renal function and dose adjust for AFib indication.", citationIDs: ["openrn_pharm_doac"]),
            AttributedBullet("Bleeding precautions and education.", citationIDs: ["openrn_pharm_doac"])
        ],
        patientTeaching: AttributedProse(
            "Take with the evening meal at the same time each day. Do not stop without provider direction. Tell every provider and dentist before procedures. Report severe headache, dark stools, blood in urine, or unusual bruising.",
            citationIDs: ["openrn_pharm_doac"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Alteplase (tPA)

public enum AlteplaseSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "alteplase",
        title: "Alteplase",
        subtitle: "Activase · Cathflo · tPA — tissue plasminogen activator",
        category: "Thrombolytic",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant tissue plasminogen activator"),
            KeyValueRow(key: "Half-life", value: "~5 minutes (very short)"),
            KeyValueRow(key: "Stroke window", value: "Within 3 hr of onset (extended to 4.5 hr select); door-to-needle target ≤60 min"),
            KeyValueRow(key: "MI/PE", value: "Per institutional protocol")
        ],
        indications: AttributedProse(
            "Acute ischemic stroke (within 3 hours, extended to 4.5 hours in select patients). Acute massive pulmonary embolism with hemodynamic instability. ST-elevation myocardial infarction when PCI not available within 90 minutes. Catheter occlusion (Cathflo — much lower dose).",
            citationIDs: ["openfda_doac"]
        ),
        mechanism: AttributedProse(
            "Recombinant human tissue plasminogen activator binds fibrin in clot and converts plasminogen to plasmin → fibrinolysis (clot dissolution).",
            citationIDs: ["openfda_doac", "openrn_pharm_doac"]
        ),
        dosing: [
            DosingBlock(label: "Acute ischemic stroke", body: "0.9 mg/kg IV (max 90 mg). 10% as bolus over 1 minute, remaining 90% as infusion over 60 minutes.", citationIDs: ["openfda_doac"]),
            DosingBlock(label: "Massive PE", body: "100 mg IV over 2 hours.", citationIDs: ["openfda_doac"]),
            DosingBlock(label: "STEMI (accelerated)", body: "Weight-based — 15 mg bolus, then 0.75 mg/kg over 30 min (max 50 mg), then 0.5 mg/kg over 60 min (max 35 mg). Total ≤100 mg.", citationIDs: ["openfda_doac"]),
            DosingBlock(label: "Catheter clearance (Cathflo)", body: "2 mg in 2 mL instilled into occluded catheter; dwell 30 min – 2 hr; aspirate.", citationIDs: ["openfda_doac"])
        ],
        contraindications: AttributedProse(
            "Active internal bleeding. Recent (within 3 mo) intracranial surgery, head trauma, or stroke. History of intracranial hemorrhage. Suspected aortic dissection. Bleeding diathesis. Severe uncontrolled hypertension (>185/110 — must control before stroke tPA). Recent (within 14 days) major surgery or trauma. Brain tumor / AVM / aneurysm.",
            citationIDs: ["openfda_doac"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: bleeding — most serious complication is intracranial hemorrhage (1–7% in stroke).", citationIDs: ["openfda_doac"]),
            AttributedBullet("Time is brain — every minute of delay in stroke tPA worsens outcomes.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Strict BP control before and during stroke infusion: <185/110 before, <180/105 during and 24 hr after.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Avoid invasive procedures (NG tube, urinary catheter, IM injections, arterial sticks) during and 24 hr after.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Do NOT give antiplatelets or anticoagulants for 24 hours post-tPA in stroke (until repeat head CT clear).", citationIDs: ["openfda_doac"])
        ],
        adverseReactions: AttributedProse(
            "Major bleeding (intracranial in stroke; GI, GU, retroperitoneal, IV sites elsewhere), hypotension, allergic reaction, reperfusion arrhythmias (in MI).",
            citationIDs: ["openfda_doac"]
        ),
        drugInteractions: [
            AttributedBullet("Anticoagulants and antiplatelets — significantly increase bleeding risk.", citationIDs: ["openfda_doac"]),
            AttributedBullet("Nitroglycerin — may reduce alteplase plasma levels.", citationIDs: ["openfda_doac"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Stroke checklist: NIHSS, last-known-well time, BP, glucose, head CT clear of hemorrhage, exclusion criteria reviewed.", citationIDs: ["openrn_pharm_doac"]),
            AttributedBullet("Tight BP control with labetalol or nicardipine drip; HOLD tPA if uncontrolled HTN.", citationIDs: ["openrn_pharm_doac"]),
            AttributedBullet("Q15 min neuro checks during infusion and first 2 hours post; q30 min next 6 hours; q1h next 16 hours.", citationIDs: ["openrn_pharm_doac"]),
            AttributedBullet("Worsening neuro exam, severe headache, hypertension, vomiting → STOP infusion and emergent head CT.", citationIDs: ["openrn_pharm_doac"]),
            AttributedBullet("AVOID: antiplatelets/anticoagulants × 24 hr, NG tube, foley placement, IM injections, arterial sticks, central line if avoidable.", citationIDs: ["openrn_pharm_doac"])
        ],
        patientTeaching: AttributedProse(
            "This is a clot-busting medication for stroke, heart attack, or pulmonary embolism. The biggest risk is bleeding. Tell us right away if you have a sudden severe headache, weakness, vomiting, or any new bleeding.",
            citationIDs: ["openrn_pharm_doac"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}
