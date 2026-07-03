import Foundation

// Curator-model drug entries (round 35B — by-name workhorses, part 2).
// Fills audited gaps: diazepam, alprazolam, clonazepam (lorazepam existed but
// the other everyday benzodiazepines did not), standalone epinephrine for
// anaphylaxis/arrest (only drips existed), NPH insulin (glargine/lispro/
// regular existed), and ticagrelor (modern ACS dual-antiplatelet standard).
// Sources: openFDA SPL (public domain), Open RN Pharmacology (CC BY 4.0),
// ISMP high-alert list (concept citation). Tier-A review flagged for
// epinephrine concentration-safety content.

private let openfdaR35B = CitationSource(
    id: "openfda_round35b",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-07-03"
)
private let openrnPharmR35B = CitationSource(
    id: "openrn_pharm_round35b",
    shortName: "Open RN Pharmacology + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-07-03"
)
private let ismpR35B = CitationSource(
    id: "ismp_round35b",
    shortName: "ISMP List of High-Alert Medications, 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-07-03"
)

// MARK: - Diazepam

public enum DiazepamSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "diazepam",
        title: "Diazepam",
        subtitle: "Valium · long-acting benzodiazepine · seizures, withdrawal, spasm",
        category: "Benzodiazepine (Long-Acting)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Long-acting benzodiazepine"),
            KeyValueRow(key: "Onset", value: "IV 1–5 min; PO 15–60 min"),
            KeyValueRow(key: "Half-life", value: "20–50 hr; active metabolites extend to ~100 hr"),
            KeyValueRow(key: "Accumulates", value: "Elderly, hepatic impairment, repeated dosing")
        ],
        indications: AttributedProse(
            "Status epilepticus and acute repetitive seizures (IV; rectal gel for out-of-hospital clusters), alcohol withdrawal, skeletal muscle spasm, anxiety disorders, and procedural premedication.",
            citationIDs: ["openfda_round35b"]
        ),
        mechanism: AttributedProse(
            "Potentiates GABA-A chloride conductance — anticonvulsant, anxiolytic, muscle-relaxant, and sedative effects. Very lipophilic: fast into the brain (good for seizures), then redistributes out quickly (single-dose seizure control is short-lived even though the drug lingers in the body for days via active metabolites).",
            citationIDs: ["openfda_round35b", "openrn_pharm_round35b"]
        ),
        dosing: [
            DosingBlock(label: "Status epilepticus (adult reference)", body: "5–10 mg IV at a controlled rate per protocol, repeatable per protocol; rectal gel weight-banded per label for community use.", citationIDs: ["openfda_round35b"]),
            DosingBlock(label: "Anxiety / muscle spasm", body: "2–10 mg PO two to four times daily per label.", citationIDs: ["openfda_round35b"]),
            DosingBlock(label: "Elderly / hepatic impairment", body: "Start low, titrate slowly — metabolite accumulation makes standard doses oversedating.", citationIDs: ["openfda_round35b"])
        ],
        contraindications: AttributedProse(
            "Acute narrow-angle glaucoma. Significant respiratory insufficiency without support. Myasthenia gravis (relative). Hypersensitivity.",
            citationIDs: ["openfda_round35b"]
        ),
        warnings: [
            AttributedBullet("Boxed warnings: combined use with opioids (profound sedation, respiratory depression, death) and the class abuse/dependence/withdrawal warning.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("IV administration: give slowly — rapid push causes hypotension, respiratory depression, and thrombophlebitis; airway equipment nearby for seizure dosing.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("The long-metabolite tail means 'yesterday's doses' are still active — stacked PRNs accumulate invisibly.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Beers-criteria drug in older adults — falls, delirium, and fracture risk; short-acting alternatives or non-benzodiazepine strategies preferred.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Never stop abruptly after sustained use — withdrawal includes seizures; taper per protocol.", citationIDs: ["openfda_round35b"])
        ],
        adverseReactions: AttributedProse(
            "Sedation, ataxia, confusion, anterograde amnesia, hypotension and respiratory depression (IV), paradoxical agitation (children, elderly), dependence.",
            citationIDs: ["openfda_round35b"]
        ),
        drugInteractions: [
            AttributedBullet("Opioids and other CNS depressants — additive respiratory depression (boxed).", citationIDs: ["openfda_round35b"]),
            AttributedBullet("CYP3A4/2C19 inhibitors — raise levels and prolong effect.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Alcohol — additive depression; also the context of much diazepam use (withdrawal) — clarify timing.", citationIDs: ["openrn_pharm_round35b"])
        ],
        nursingImplications: [
            AttributedBullet("For IV use: slow administration, continuous observation, SpO2 monitoring, and airway readiness.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Fall precautions and sedation assessment — count the cumulative benzodiazepine load across the MAR, not just the last dose.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("In withdrawal protocols, chart against the severity score so dosing stays symptom-triggered.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Flag long-term outpatient use for taper planning — abrupt inpatient discontinuation of home benzodiazepines causes preventable withdrawal.", citationIDs: ["openrn_pharm_round35b"])
        ],
        patientTeaching: AttributedProse(
            "This medication causes drowsiness — no driving until you know how it affects you, and never combine it with alcohol or opioid pain medicines. If you've taken it regularly, don't stop suddenly; we'll taper it together.",
            citationIDs: ["openrn_pharm_round35b"]
        ),
        citations: [openfdaR35B, openrnPharmR35B, ismpR35B],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Alprazolam

public enum AlprazolamSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "alprazolam",
        title: "Alprazolam",
        subtitle: "Xanax · short-acting benzodiazepine · highest misuse profile",
        category: "Benzodiazepine (Short-Acting)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Short-acting benzodiazepine"),
            KeyValueRow(key: "Onset", value: "PO ~30 min; peak 1–2 hr"),
            KeyValueRow(key: "Half-life", value: "~11 hr"),
            KeyValueRow(key: "Signature problem", value: "Interdose rebound + misuse potential")
        ],
        indications: AttributedProse(
            "Anxiety disorders and panic disorder. Among the most-prescribed psychotropics in the U.S. — and among the most misused, which shapes every nursing consideration around it.",
            citationIDs: ["openfda_round35b"]
        ),
        mechanism: AttributedProse(
            "GABA-A potentiation with fast onset and short duration — properties that make it effective for panic and simultaneously reinforce dependence: rapid relief teaches redosing, and the short half-life creates rebound anxiety between doses that mimics the underlying disorder.",
            citationIDs: ["openfda_round35b", "openrn_pharm_round35b"]
        ),
        dosing: [
            DosingBlock(label: "Anxiety", body: "0.25–0.5 mg PO three times daily per label, titrated; extended-release available for panic disorder.", citationIDs: ["openfda_round35b"]),
            DosingBlock(label: "Discontinuation", body: "Taper slowly per label (dose reductions no faster than the labeled schedule) — abrupt cessation risks seizures and severe rebound.", citationIDs: ["openfda_round35b"]),
            DosingBlock(label: "Elderly / hepatic impairment", body: "Reduced doses; consider whether a benzodiazepine is appropriate at all (Beers criteria).", citationIDs: ["openfda_round35b"])
        ],
        contraindications: AttributedProse(
            "Concurrent strong CYP3A4 inhibitors per label (ketoconazole, itraconazole). Acute narrow-angle glaucoma. Hypersensitivity.",
            citationIDs: ["openfda_round35b"]
        ),
        warnings: [
            AttributedBullet("Boxed warnings: use with opioids (respiratory depression, death) and abuse/misuse/addiction — alprazolam is the benzodiazepine most associated with misuse and overdose deaths in combination with opioids.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Interdose withdrawal — anxiety that spikes before each dose looks like worsening disease and drives dose escalation; recognize the pattern.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Physical dependence develops within weeks at therapeutic doses; discontinuation requires a structured taper.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Beers-criteria drug in older adults — falls, cognitive impairment, fracture.", citationIDs: ["openrn_pharm_round35b"])
        ],
        adverseReactions: AttributedProse(
            "Sedation, memory impairment, ataxia, dependence, rebound/interdose anxiety, withdrawal (including seizures) on abrupt discontinuation.",
            citationIDs: ["openfda_round35b"]
        ),
        drugInteractions: [
            AttributedBullet("Opioids, alcohol, other CNS depressants — additive respiratory depression (boxed).", citationIDs: ["openfda_round35b"]),
            AttributedBullet("CYP3A4 inhibitors (azoles, some macrolides, ritonavir) — raise levels substantially; inducers lower them.", citationIDs: ["openfda_round35b"])
        ],
        nursingImplications: [
            AttributedBullet("Reconcile home benzodiazepine use on admission and continue or taper deliberately — abrupt inpatient discontinuation of chronic alprazolam causes withdrawal, including seizures.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Screen for concurrent opioid prescriptions and alcohol use at every encounter.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Assess whether escalating 'anxiety' is interdose rebound; report the pattern rather than just medicating it.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Falls and sedation precautions, especially in older adults.", citationIDs: ["openrn_pharm_round35b"])
        ],
        patientTeaching: AttributedProse(
            "This works quickly and wears off quickly, which is exactly why it must be used carefully — take it only as prescribed, never with alcohol or opioid pain medicines, and never stop it suddenly after regular use. Long-term anxiety treatment usually pairs it with, or replaces it by, daily medicines and therapy.",
            citationIDs: ["openrn_pharm_round35b"]
        ),
        citations: [openfdaR35B, openrnPharmR35B, ismpR35B],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Clonazepam

public enum ClonazepamSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "clonazepam",
        title: "Clonazepam",
        subtitle: "Klonopin · long-acting benzodiazepine · panic disorder + seizure syndromes",
        category: "Benzodiazepine (Long-Acting)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Long-acting benzodiazepine"),
            KeyValueRow(key: "Half-life", value: "~30–40 hr"),
            KeyValueRow(key: "Dosing rhythm", value: "Once–twice daily; smoother than alprazolam"),
            KeyValueRow(key: "Dual identity", value: "Anxiolytic and antiseizure medication")
        ],
        indications: AttributedProse(
            "Panic disorder, and seizure disorders (myoclonic, akinetic, and Lennox-Gastaut per label). The long half-life gives steadier coverage with less interdose rebound than short-acting agents — the reason clinicians often transition patients to it during benzodiazepine tapers.",
            citationIDs: ["openfda_round35b"]
        ),
        mechanism: AttributedProse(
            "GABA-A potentiation with a long elimination half-life — stable levels across the day, slower onset of withdrawal, but the same class liabilities of dependence, sedation, and cognitive effect.",
            citationIDs: ["openfda_round35b", "openrn_pharm_round35b"]
        ),
        dosing: [
            DosingBlock(label: "Panic disorder", body: "0.25 mg PO twice daily per label, titrating toward 1 mg/day; higher per response.", citationIDs: ["openfda_round35b"]),
            DosingBlock(label: "Seizure disorders", body: "Individualized per label up to 20 mg/day in divided doses; changes coordinated with the neurologist.", citationIDs: ["openfda_round35b"]),
            DosingBlock(label: "Discontinuation", body: "Gradual taper always — in seizure patients, abrupt cessation can precipitate status epilepticus.", citationIDs: ["openfda_round35b"])
        ],
        contraindications: AttributedProse(
            "Significant hepatic disease. Acute narrow-angle glaucoma. Hypersensitivity.",
            citationIDs: ["openfda_round35b"]
        ),
        warnings: [
            AttributedBullet("Boxed warnings: use with opioids, and abuse/dependence (class).", citationIDs: ["openfda_round35b"]),
            AttributedBullet("As an antiseizure medication it carries the AED class warning for suicidal ideation — mood and behavior monitoring belongs in the plan.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Long half-life accumulation — sedation can build over the first week and in older adults; effects outlast discontinuation by days.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("In seizure patients, never allow doses to be missed or stopped around procedures/NPO without a plan — seizure control is riding on steady levels.", citationIDs: ["openrn_pharm_round35b"])
        ],
        adverseReactions: AttributedProse(
            "Somnolence, ataxia, dizziness, cognitive slowing, depression, hypersalivation (notable in children), dependence; withdrawal seizures on abrupt cessation.",
            citationIDs: ["openfda_round35b"]
        ),
        drugInteractions: [
            AttributedBullet("Opioids, alcohol, CNS depressants — additive respiratory depression (boxed).", citationIDs: ["openfda_round35b"]),
            AttributedBullet("CYP3A4 inhibitors/inducers alter levels; other antiseizure medications interact bidirectionally.", citationIDs: ["openfda_round35b"])
        ],
        nursingImplications: [
            AttributedBullet("Identify which indication the patient takes it for — the seizure patient's clonazepam is not a PRN anxiolytic and must not lapse.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Sedation and fall assessment through the accumulation window; ask about daytime drowsiness and driving.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Screen mood at follow-ups (AED suicidality warning) and reconcile against opioids and alcohol.", citationIDs: ["openrn_pharm_round35b"])
        ],
        patientTeaching: AttributedProse(
            "This longer-acting medication builds a steady level, so take it every day as prescribed — don't skip or double up. Avoid alcohol and opioid pain medicines with it, and never stop suddenly; if it's treating seizures, a missed taper can be dangerous.",
            citationIDs: ["openrn_pharm_round35b"]
        ),
        citations: [openfdaR35B, openrnPharmR35B, ismpR35B],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Epinephrine (anaphylaxis / cardiac arrest)

public enum EpinephrineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "epinephrine",
        title: "Epinephrine (anaphylaxis / cardiac arrest)",
        subtitle: "Two emergencies · two concentrations · the mix-up is the classic fatal error",
        category: "Adrenergic Agonist (Emergency)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Anaphylaxis route", value: "IM, anterolateral thigh — 1 mg/mL concentration"),
            KeyValueRow(key: "Arrest route", value: "IV/IO — 0.1 mg/mL prefilled concentration"),
            KeyValueRow(key: "The error", value: "IV push of the IM concentration — 10× overdose"),
            KeyValueRow(key: "Onset", value: "Minutes (IM); immediate (IV)")
        ],
        indications: AttributedProse(
            "First-line treatment of anaphylaxis (IM), and cardiac arrest per ACLS-era protocols (IV/IO). Also croup (nebulized racemic form — separate entry) and severe asthma per protocol. There is no substitute in anaphylaxis: antihistamines and steroids are adjuncts, not alternatives.",
            citationIDs: ["openfda_round35b", "openrn_pharm_round35b"]
        ),
        mechanism: AttributedProse(
            "Nonselective adrenergic agonist: alpha-1 vasoconstriction reverses hypotension and mucosal edema, beta-1 supports heart rate and contractility, beta-2 bronchodilates and stabilizes mast cells — a mechanism map of exactly what anaphylaxis is doing wrong.",
            citationIDs: ["openfda_round35b"]
        ),
        dosing: [
            DosingBlock(label: "Anaphylaxis (adult reference)", body: "0.3–0.5 mg IM of the 1 mg/mL concentration into the anterolateral thigh, repeatable every 5–15 minutes per protocol; autoinjectors deliver 0.3 mg (adult) / 0.15 mg (pediatric).", citationIDs: ["openfda_round35b"]),
            DosingBlock(label: "Cardiac arrest (ACLS reference)", body: "1 mg IV/IO of the 0.1 mg/mL prefilled concentration every 3–5 minutes per protocol.", citationIDs: ["openfda_round35b"]),
            DosingBlock(label: "The safety rule", body: "Match the concentration to the route every single time — IM concentration (1 mg/mL) never goes IV push.", citationIDs: ["openfda_round35b"])
        ],
        contraindications: AttributedProse(
            "None in anaphylaxis or cardiac arrest — in a true anaphylactic emergency there is no contraindication to epinephrine.",
            citationIDs: ["openfda_round35b"]
        ),
        warnings: [
            AttributedBullet("Concentration confusion is the classic lethal error: pushing the 1 mg/mL (IM) concentration IV delivers a massive overdose — hypertensive crisis, dysrhythmia, myocardial injury. Read the concentration aloud during checks.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Under-dosing through hesitation kills more anaphylaxis patients than epinephrine side effects do — delayed administration is the most consistent factor in fatal anaphylaxis.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Expected effects after IM dosing — tremor, palpitations, pallor, anxiety — are the drug working, not an allergic worsening; pre-warn the patient.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("IV infusion (drip) for refractory anaphylaxis is a separate, titrated therapy — see the epinephrine infusion entry.", citationIDs: ["openrn_pharm_round35b"])
        ],
        adverseReactions: AttributedProse(
            "Tremor, palpitations, tachycardia, anxiety, headache, pallor; at excessive dose or wrong-route administration: severe hypertension, dysrhythmias, pulmonary edema, myocardial ischemia.",
            citationIDs: ["openfda_round35b"]
        ),
        drugInteractions: [
            AttributedBullet("Beta-blockers — may blunt response in anaphylaxis; glucagon per protocol is the classic adjunct in beta-blocked patients.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("MAOIs and TCAs — potentiate pressor effects.", citationIDs: ["openfda_round35b"])
        ],
        nursingImplications: [
            AttributedBullet("Two-person verification of drug, concentration, dose, and route (ISMP high-alert) — even in the emergency, say the concentration out loud.", citationIDs: ["ismp_round35b"]),
            AttributedBullet("Anaphylaxis: give IM without delay, position supine with legs elevated (airway permitting), high-flow oxygen, IV access, and monitor for biphasic recurrence for hours afterward.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Document the time of each dose — the repeat interval decision depends on it.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Before discharge after anaphylaxis: autoinjector prescription, demonstration with a trainer, and teach-back of the two-dose, call-911 plan.", citationIDs: ["openrn_pharm_round35b"])
        ],
        patientTeaching: AttributedProse(
            "Use your autoinjector at the FIRST sign of a serious reaction — do not wait to see if it gets worse. Inject into the outer thigh, through clothing if needed, then call 911 even if you feel better. Shakiness and a racing heart afterward are normal effects of the medicine.",
            citationIDs: ["openrn_pharm_round35b"]
        ),
        citations: [openfdaR35B, openrnPharmR35B, ismpR35B],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Insulin NPH

public enum InsulinNPHSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "insulin-nph",
        title: "Insulin NPH",
        subtitle: "Humulin N · Novolin N · intermediate-acting · the peak is the point",
        category: "Insulin (Intermediate-Acting)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Onset", value: "1–2 hr"),
            KeyValueRow(key: "Peak", value: "4–12 hr (typically ~6–8) — the hypoglycemia window"),
            KeyValueRow(key: "Duration", value: "12–18 hr (up to 24)"),
            KeyValueRow(key: "Appearance", value: "Cloudy — resuspend by rolling, never shake")
        ],
        indications: AttributedProse(
            "Basal insulin coverage in type 1 and type 2 diabetes, usually twice daily or at bedtime, alone or mixed with short-acting insulin. Less used than analog basals in new regimens but still everywhere — affordability keeps NPH clinically common, and its pronounced peak keeps it clinically testable.",
            citationIDs: ["openfda_round35b", "openrn_pharm_round35b"]
        ),
        mechanism: AttributedProse(
            "Regular insulin complexed with protamine — the protamine slows absorption from the subcutaneous depot, creating an intermediate profile with a true peak. That peak is the whole clinical story: unlike peakless analog basals, NPH concentrates its hypoglycemia risk hours after the dose.",
            citationIDs: ["openfda_round35b"]
        ),
        dosing: [
            DosingBlock(label: "Regimens", body: "Individualized per provider — commonly twice daily, or bedtime dosing targeting fasting glucose; frequently mixed with regular/rapid insulin.", citationIDs: ["openfda_round35b"]),
            DosingBlock(label: "Mixing rule", body: "Draw the CLEAR (regular/rapid) insulin first, then the CLOUDY NPH — contaminating the clear vial with protamine blunts its action.", citationIDs: ["openrn_pharm_round35b"]),
            DosingBlock(label: "Suspension", body: "Roll the vial or pen gently until uniformly cloudy before every dose — an unmixed suspension delivers an unpredictable dose.", citationIDs: ["openfda_round35b"])
        ],
        contraindications: AttributedProse(
            "During episodes of hypoglycemia. Hypersensitivity to the formulation.",
            citationIDs: ["openfda_round35b"]
        ),
        warnings: [
            AttributedBullet("The peak is the hazard: a breakfast-time NPH dose peaks mid-afternoon; a dinner dose peaks in the middle of the night. Meals, snacks, and glucose checks are planned around that arithmetic.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("NPO status, held meals, and procedure delays turn a routine NPH dose into a hypoglycemia setup — clarify orders whenever intake changes.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Insulin is a perennial top-of-list high-alert medication — dosing and administration errors are among the most frequent serious medication events in hospitals.", citationIDs: ["ismp_round35b"]),
            AttributedBullet("Hypokalemia — insulin shifts potassium intracellularly.", citationIDs: ["openfda_round35b"])
        ],
        adverseReactions: AttributedProse(
            "Hypoglycemia (concentrated at peak), weight gain, injection-site lipodystrophy with poor rotation, hypokalemia, local allergy (rare).",
            citationIDs: ["openfda_round35b"]
        ),
        drugInteractions: [
            AttributedBullet("Beta-blockers — mask adrenergic hypoglycemia warning signs (tremor, palpitations); sweating persists.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Corticosteroids, thiazides — raise glucose and demand dose adjustments.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Alcohol — unpredictable, often delayed hypoglycemia.", citationIDs: ["openfda_round35b"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification per policy (high-alert); confirm the product — NPH, mixes (70/30), and rapid analogs live side-by-side and look alike.", citationIDs: ["ismp_round35b"]),
            AttributedBullet("Time glucose checks to the peak, not just before meals; know when each patient's NPH will peak on your shift.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Teach and demonstrate: roll to resuspend, clear-before-cloudy mixing, site rotation, and the symptoms-at-peak story.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Bedtime NPH: assess nocturnal hypoglycemia risk — 3 AM checks per protocol when doses change.", citationIDs: ["openrn_pharm_round35b"])
        ],
        patientTeaching: AttributedProse(
            "This insulin is cloudy — roll it gently before each dose, and if you mix it with clear insulin, draw the clear one first. It works hardest 6–8 hours after you inject, so plan meals and watch for low-sugar symptoms in that window, including overnight for evening doses.",
            citationIDs: ["openrn_pharm_round35b"]
        ),
        citations: [openfdaR35B, openrnPharmR35B, ismpR35B],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Ticagrelor

public enum TicagrelorSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ticagrelor",
        title: "Ticagrelor",
        subtitle: "Brilinta · reversible P2Y12 inhibitor · the aspirin-dose rule and the dyspnea surprise",
        category: "Antiplatelet (P2Y12 Inhibitor)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Reversible P2Y12 inhibitor"),
            KeyValueRow(key: "Aspirin rule", value: "Maintain aspirin ≤100 mg/day — higher reduces effectiveness (boxed)"),
            KeyValueRow(key: "Signature side effect", value: "Dyspnea (~1 in 7) without lung pathology"),
            KeyValueRow(key: "Pre-surgery hold", value: "5 days per label")
        ],
        indications: AttributedProse(
            "Dual antiplatelet therapy (with low-dose aspirin) after acute coronary syndrome and PCI/stenting, and for secondary prevention per regimen. Alongside clopidogrel, one of the two P2Y12 backbones of modern ACS care — faster, more consistent inhibition, twice-daily, reversible.",
            citationIDs: ["openfda_round35b"]
        ),
        mechanism: AttributedProse(
            "Reversibly and directly inhibits the platelet P2Y12 ADP receptor — no metabolic activation needed (unlike clopidogrel, whose prodrug activation varies by CYP2C19 genetics). Reversibility means offset within days of stopping; twice-daily dosing means missed doses matter more.",
            citationIDs: ["openfda_round35b", "openrn_pharm_round35b"]
        ),
        dosing: [
            DosingBlock(label: "ACS", body: "180 mg PO loading dose, then 90 mg twice daily (with aspirin 75–100 mg daily) for the first year per label; 60 mg twice daily regimens beyond per indication.", citationIDs: ["openfda_round35b"]),
            DosingBlock(label: "Surgery", body: "Discontinue 5 days before elective surgery per label; decisions after recent stenting belong to cardiology — premature interruption risks stent thrombosis.", citationIDs: ["openfda_round35b"])
        ],
        contraindications: AttributedProse(
            "Active pathological bleeding. History of intracranial hemorrhage. Severe hepatic impairment.",
            citationIDs: ["openfda_round35b"]
        ),
        warnings: [
            AttributedBullet("Boxed warnings: bleeding (as with all antiplatelets — significant, sometimes fatal), and the aspirin-dose rule: maintenance aspirin above 100 mg/day reduces ticagrelor's effectiveness. Patients get this wrong constantly.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Dyspnea in roughly 14% — usually mild, often early, typically without cardiac or pulmonary cause; it drives discontinuation unless patients are warned. New dyspnea still gets evaluated before being attributed to the drug.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Ventricular pauses/bradyarrhythmia early in therapy — caution in advanced conduction disease without a pacemaker.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Stopping early after a stent is the catastrophic error — stent thrombosis presents as MI or death; every hold requires a cardiology conversation.", citationIDs: ["openrn_pharm_round35b"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (any site), dyspnea, bradyarrhythmia/ventricular pauses, elevated uric acid and creatinine.",
            citationIDs: ["openfda_round35b"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (ketoconazole, ritonavir) — avoid, levels rise; strong inducers (rifampin, phenytoin) — avoid, effectiveness falls.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Aspirin above 100 mg/day — boxed effectiveness interaction.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Anticoagulants, NSAIDs — additive bleeding.", citationIDs: ["openfda_round35b"]),
            AttributedBullet("Opioids — delay absorption of oral P2Y12 inhibitors in ACS; relevant to loading timing per protocol.", citationIDs: ["openfda_round35b"])
        ],
        nursingImplications: [
            AttributedBullet("Verify the aspirin dose on the MAR is ≤100 mg — a well-meant 325 mg aspirin order undermines the regimen (boxed).", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Bleeding surveillance and teach-back; twice-daily adherence emphasis — reversibility means missed doses lose protection quickly.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Pre-warn about dyspnea so it's reported, evaluated, and not self-managed by quitting the drug.", citationIDs: ["openrn_pharm_round35b"]),
            AttributedBullet("Flag every procedural hold to cardiology when a stent is in the picture, and document the resume plan.", citationIDs: ["openrn_pharm_round35b"])
        ],
        patientTeaching: AttributedProse(
            "Take it twice a day with your low-dose aspirin — and never take extra or higher-dose aspirin with it. Never stop it on your own after a stent; that can cause a heart attack. Some people notice breathlessness early on — tell us rather than stopping. Watch for unusual bleeding or bruising.",
            citationIDs: ["openrn_pharm_round35b"]
        ),
        citations: [openfdaR35B, openrnPharmR35B, ismpR35B],
        lastSourceFidelityReview: "2026-07-03"
    )
}
