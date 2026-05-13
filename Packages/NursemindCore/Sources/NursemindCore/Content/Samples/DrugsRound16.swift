import Foundation

// Curator-model drug entries (round 16 — toxicology antidotes + TB + HIV + dermatology + ophthalmology).
// Sources: openFDA SPL (CC0), Open RN Pharmacology (CC BY 4.0), AACT / IDSA / DHHS / AAD / AAO concept citations.

private let openfdaR16 = CitationSource(
    id: "openfda_round16",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR16 = CitationSource(
    id: "openrn_pharm_round16",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=toxicology+TB+HIV+derm+eye",
    lastRetrieved: "2026-05-04"
)
private let specialtyR16 = CitationSource(
    id: "specialty_round16",
    shortName: "AACT / IDSA / DHHS / AAD / AAO concept citations",
    publisher: "AACT · IDSA · DHHS · AAD · AAO",
    license: .factCitationOnly,
    url: "https://www.acmt.net/clinical-guidelines/",
    lastRetrieved: "2026-05-04"
)

public enum HighDoseGlucagonSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "glucagon-bb-toxicity",
        title: "Glucagon (high-dose, β-blocker / CCB toxicity)",
        subtitle: "GlucaGen · 5–10 mg IV bolus · cAMP-independent inotropy · vomiting common",
        category: "Toxicology antidote (high-dose glucagon)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Pancreatic hormone / cyclic AMP elevator"),
            KeyValueRow(key: "Indications", value: "Beta-blocker overdose; calcium channel blocker overdose (adjunctive)"),
            KeyValueRow(key: "Notable", value: "Vomiting common — protect airway"),
            KeyValueRow(key: "Adjuncts", value: "Calcium, atropine, vasopressors, high-dose insulin / euglycemic, lipid emulsion, pacing")
        ],
        indications: AttributedProse(
            "Adjunctive treatment of beta-blocker or calcium channel blocker overdose with bradycardia / hypotension refractory to atropine, calcium, fluids per primary source.",
            citationIDs: ["openfda_round16", "specialty_round16"]
        ),
        mechanism: AttributedProse(
            "Activates myocardial glucagon receptors → cAMP-independent positive inotropy + chronotropy → bypasses adrenergic blockade. Also stimulates hepatic glycogenolysis (hyperglycemia).",
            citationIDs: ["openfda_round16"]
        ),
        dosing: [
            DosingBlock(label: "Bolus", body: "5–10 mg IV bolus over 1–2 minutes (adult); 50 mcg/kg pediatric per primary source.", citationIDs: ["specialty_round16"]),
            DosingBlock(label: "Infusion", body: "2–10 mg/hr titrated to BP / HR per primary source.", citationIDs: ["specialty_round16"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; pheochromocytoma (catecholamine surge); insulinoma (rebound hypoglycemia); chronic hypoglycemia (low glycogen stores) per primary source.",
            citationIDs: ["openfda_round16"]
        ),
        warnings: [
            AttributedBullet("VOMITING common — high aspiration risk; airway protection / antiemetic.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Hyperglycemia — monitor + treat.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Tachyphylaxis — diminishing response with continued infusion.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Adjuncts often required — atropine, calcium chloride, vasopressors, high-dose insulin / euglycemic therapy, lipid emulsion, pacing, ECMO.", citationIDs: ["specialty_round16"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting (very common at high dose), hyperglycemia, hypokalemia, headache, hypersensitivity.",
            citationIDs: ["openfda_round16"]
        ),
        drugInteractions: [
            AttributedBullet("Beta-blockers — antagonized by glucagon (intended for therapy).", citationIDs: ["openfda_round16"]),
            AttributedBullet("Indomethacin — may inhibit glucagon's hyperglycemic effect.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Warfarin — glucagon may potentiate effect; INR monitoring.", citationIDs: ["openfda_round16"])
        ],
        nursingImplications: [
            AttributedBullet("Toxicology + cardiology consultation; ICU admission.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Continuous cardiac monitoring + arterial line; airway protection.", citationIDs: ["openrn_pharm_round16"]),
            AttributedBullet("Antiemetic before bolus; positioning for aspiration prevention.", citationIDs: ["openrn_pharm_round16"]),
            AttributedBullet("Concurrent glucose / insulin / calcium / vasopressors per protocol.", citationIDs: ["specialty_round16"])
        ],
        patientTeaching: AttributedProse(
            "This medicine is given in critical care for severe overdose of certain heart medications. You may feel nauseated or vomit. We're watching your heart, blood pressure, and breathing closely.",
            citationIDs: ["openrn_pharm_round16"]
        ),
        citations: [openfdaR16, openrnPharmR16, specialtyR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PhysostigmineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "physostigmine",
        title: "Physostigmine",
        subtitle: "Tertiary AChE inhibitor · anticholinergic toxicity · seizure / asystole risk",
        category: "Toxicology antidote (cholinesterase inhibitor)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Tertiary amine acetylcholinesterase inhibitor (crosses BBB)"),
            KeyValueRow(key: "Indications", value: "Pure anticholinergic toxicity with severe agitation / hallucinations"),
            KeyValueRow(key: "Notable", value: "DO NOT use in TCA overdose (asystole / seizure); confirm pure anticholinergic"),
            KeyValueRow(key: "Onset", value: "Reversal within 5–15 minutes")
        ],
        indications: AttributedProse(
            "Treatment of severe anticholinergic toxicity with agitation, delirium, hallucinations + classic toxidrome (mydriasis, anhidrosis, tachycardia, hyperthermia, urinary retention) per primary source.",
            citationIDs: ["openfda_round16", "specialty_round16"]
        ),
        mechanism: AttributedProse(
            "Reversibly inhibits acetylcholinesterase → increases ACh at synapses → reverses central + peripheral anticholinergic blockade (crosses BBB unlike neostigmine).",
            citationIDs: ["openfda_round16"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "0.5–2 mg IV slow push over ≥5 minutes (max 1 mg/min); may repeat after 10–15 minutes per primary source.", citationIDs: ["specialty_round16"]),
            DosingBlock(label: "Pediatric", body: "0.02 mg/kg IV slow (max 0.5 mg/dose); not first-line in peds without toxicology.", citationIDs: ["specialty_round16"])
        ],
        contraindications: AttributedProse(
            "TCA overdose (asystole / seizure / death reported); cocaine / sympathomimetic toxicity; reactive airway disease; mechanical bowel / urinary obstruction; gangrene per primary source.",
            citationIDs: ["openfda_round16"]
        ),
        warnings: [
            AttributedBullet("DO NOT USE in TCA overdose — risk of asystole + seizure death per primary source.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Cholinergic crisis — bradycardia, asystole, bronchospasm, seizures; have atropine + airway support.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Confirm PURE anticholinergic before use; if any doubt about mixed ingestion, supportive care + benzodiazepines first per primary source.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Reactive airway disease — bronchospasm risk.", citationIDs: ["openfda_round16"])
        ],
        adverseReactions: AttributedProse(
            "Cholinergic excess — diaphoresis, salivation, lacrimation, miosis, bradycardia, abdominal cramping, vomiting, diarrhea, urinary urgency; bronchospasm; seizures (overdose).",
            citationIDs: ["openfda_round16"]
        ),
        drugInteractions: [
            AttributedBullet("Atropine — antidote for cholinergic crisis from physostigmine; have at bedside.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Succinylcholine — physostigmine prolongs neuromuscular blockade.", citationIDs: ["openfda_round16"])
        ],
        nursingImplications: [
            AttributedBullet("Toxicology + cardiology consultation before use; cardiac monitoring + atropine at bedside.", citationIDs: ["specialty_round16"]),
            AttributedBullet("ECG before administration — rule out QRS widening / TCA features.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Slow IV push — too rapid → seizures, bradycardia.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Reverses agitation but not all anticholinergic features (urinary retention, hyperthermia).", citationIDs: ["openrn_pharm_round16"])
        ],
        patientTeaching: AttributedProse(
            "This medicine reverses certain types of poisoning that cause severe confusion. You may feel sweaty, salivate, or have an upset stomach as it takes effect. We're watching your heart and breathing closely.",
            citationIDs: ["openrn_pharm_round16"]
        ),
        citations: [openfdaR16, openrnPharmR16, specialtyR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum EthambutolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ethambutol",
        title: "Ethambutol",
        subtitle: "Bacteriostatic · TB · OPTIC NEURITIS dose-dependent · monthly visual checks",
        category: "Antimycobacterial",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Bacteriostatic antimycobacterial"),
            KeyValueRow(key: "Indications", value: "Active TB (RIPE intensive phase); MAC pulmonary infection"),
            KeyValueRow(key: "Notable", value: "Optic neuritis — dose-dependent + reversible if caught early"),
            KeyValueRow(key: "Visual", value: "Baseline + monthly visual acuity + color vision (red-green)")
        ],
        indications: AttributedProse(
            "Component of intensive-phase therapy for active TB (with INH, rifampin, pyrazinamide); component of MAC pulmonary disease therapy per primary source.",
            citationIDs: ["openfda_round16", "specialty_round16"]
        ),
        mechanism: AttributedProse(
            "Inhibits arabinosyl transferase → blocks arabinogalactan synthesis (cell wall) → bacteriostatic against M. tuberculosis + M. avium complex.",
            citationIDs: ["openfda_round16"]
        ),
        dosing: [
            DosingBlock(label: "Active TB", body: "15–25 mg/kg PO daily (max 1.6 g) for first 2 months per primary source.", citationIDs: ["openfda_round16"]),
            DosingBlock(label: "Renal", body: "Reduce dose / extend interval in CKD (renally cleared); monitor levels in dialysis.", citationIDs: ["openfda_round16"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; severe optic neuritis from ethambutol; children too young to report visual changes (relative) per primary source.",
            citationIDs: ["openfda_round16"]
        ),
        warnings: [
            AttributedBullet("OPTIC NEURITIS — dose-dependent; usually reversible if caught early; baseline + monthly visual acuity + color discrimination (red-green) per primary source.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Dose adjustment in CKD — accumulation worsens optic neuritis.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Hyperuricemia — gout flares; monitor uric acid in susceptible patients.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Hepatotoxicity less than INH but additive in TB regimens; monitor.", citationIDs: ["openfda_round16"])
        ],
        adverseReactions: AttributedProse(
            "Visual changes (acuity, color), peripheral neuropathy, headache, hyperuricemia + gout flare, GI upset, transaminitis.",
            citationIDs: ["openfda_round16"]
        ),
        drugInteractions: [
            AttributedBullet("Aluminum-containing antacids — reduce absorption; separate by 2+ hours.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Hepatotoxic drugs — additive in TB regimen; monitor LFTs.", citationIDs: ["specialty_round16"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline visual acuity + color vision (red-green); monthly throughout therapy.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Counsel — STOP and call for blurred vision, color changes, or vision loss; usually reversible.", citationIDs: ["openrn_pharm_round16"]),
            AttributedBullet("Renal dose adjustment per labeling; monitor uric acid + LFTs.", citationIDs: ["openfda_round16"]),
            AttributedBullet("DOT + adherence support throughout TB treatment.", citationIDs: ["specialty_round16"])
        ],
        patientTeaching: AttributedProse(
            "Get a baseline eye exam before starting and tell us right away about any changes in your vision — blurred vision, trouble seeing red and green colors, or new blind spots. Vision usually returns if we stop the medicine early.",
            citationIDs: ["openrn_pharm_round16"]
        ),
        citations: [openfdaR16, openrnPharmR16, specialtyR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PyrazinamideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "pyrazinamide",
        title: "Pyrazinamide",
        subtitle: "Bactericidal in acidic environment · TB · hepatotoxicity + hyperuricemia",
        category: "Antimycobacterial",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Bactericidal antimycobacterial (active in acidic environment)"),
            KeyValueRow(key: "Indications", value: "Active TB (intensive phase × 2 months)"),
            KeyValueRow(key: "Notable", value: "Hepatotoxicity (additive with INH); hyperuricemia (gout flares); arthralgia"),
            KeyValueRow(key: "Avoid", value: "Severe hepatic disease, acute gout")
        ],
        indications: AttributedProse(
            "Intensive-phase therapy for active tuberculosis (with INH, rifampin, ethambutol — RIPE × 2 months) per primary source.",
            citationIDs: ["openfda_round16", "specialty_round16"]
        ),
        mechanism: AttributedProse(
            "Prodrug activated to pyrazinoic acid in acidic environment of caseating granulomas → disrupts membrane transport + acidifies cytoplasm → bactericidal against semi-dormant M. tuberculosis.",
            citationIDs: ["openfda_round16"]
        ),
        dosing: [
            DosingBlock(label: "Active TB", body: "20–25 mg/kg PO daily (max 2 g) for 2 months intensive phase per primary source.", citationIDs: ["openfda_round16"]),
            DosingBlock(label: "Renal / hepatic", body: "Reduce dose in CKD (3 × weekly); avoid in severe hepatic impairment.", citationIDs: ["openfda_round16"])
        ],
        contraindications: AttributedProse(
            "Severe hepatic disease; acute gout; hypersensitivity per primary source.",
            citationIDs: ["openfda_round16"]
        ),
        warnings: [
            AttributedBullet("Hepatotoxicity — additive with INH; baseline + monthly LFTs; discontinue if symptomatic / severe per primary source.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Hyperuricemia → gout flares; arthralgia common (non-gouty); colchicine / NSAID for symptoms.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Pregnancy — Category C (used internationally; some US guidelines avoid first trimester) per primary source.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Photosensitivity — counsel sun protection.", citationIDs: ["openfda_round16"])
        ],
        adverseReactions: AttributedProse(
            "Hepatotoxicity, hyperuricemia, arthralgia, GI upset, photosensitivity, rash, sideroblastic anemia (rare).",
            citationIDs: ["openfda_round16"]
        ),
        drugInteractions: [
            AttributedBullet("Other hepatotoxic drugs (INH, rifampin, alcohol, acetaminophen) — additive risk.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Allopurinol / colchicine — for hyperuricemic symptoms.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Probenecid — antagonizes uric-acid-lowering effect.", citationIDs: ["openfda_round16"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + monthly LFTs; uric acid; counsel hepatotoxicity signs.", citationIDs: ["specialty_round16"]),
            AttributedBullet("DOT for adherence; complete intensive phase 2 months.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Counsel arthralgia management with NSAIDs / acetaminophen (limit acetaminophen — additive hepatotox).", citationIDs: ["openrn_pharm_round16"]),
            AttributedBullet("Sun protection due to photosensitivity.", citationIDs: ["openrn_pharm_round16"])
        ],
        patientTeaching: AttributedProse(
            "Take this medicine for the full 2 months even if you feel better. You may have joint aches — let us know and we can help. Avoid alcohol. Tell us right away about yellow eyes / skin, dark urine, severe stomach pain. Use sunscreen and protective clothing — your skin may burn more easily.",
            citationIDs: ["openrn_pharm_round16"]
        ),
        citations: [openfdaR16, openrnPharmR16, specialtyR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum EfavirenzSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "efavirenz",
        title: "Efavirenz",
        subtitle: "NNRTI · HIV · CNS / psych side effects · CYP3A4 inducer · Cat D / pregnancy caution",
        category: "Non-nucleoside reverse transcriptase inhibitor (NNRTI)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "NNRTI"),
            KeyValueRow(key: "Indications", value: "HIV-1 (combination ART)"),
            KeyValueRow(key: "Notable", value: "CNS / psychiatric effects; vivid dreams; bedtime dosing"),
            KeyValueRow(key: "Pregnancy", value: "Category D — first trimester avoid; can be used in 2nd / 3rd")
        ],
        indications: AttributedProse(
            "Treatment of HIV-1 in adults + pediatrics ≥3 months in combination with other antiretrovirals; older first-line regimens; INSTI-based regimens now preferred per primary source.",
            citationIDs: ["openfda_round16", "specialty_round16"]
        ),
        mechanism: AttributedProse(
            "Non-competitive inhibitor of HIV-1 reverse transcriptase → inhibits viral replication. Does NOT bind HIV-2 RT (only HIV-1).",
            citationIDs: ["openfda_round16"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "600 mg PO at bedtime on empty stomach (high-fat meals increase exposure → toxicity) per primary source.", citationIDs: ["openfda_round16"]),
            DosingBlock(label: "Pediatric", body: "Weight-based 100–600 mg/day per labeling.", citationIDs: ["openfda_round16"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; concurrent strong CYP3A4 substrates (voriconazole, midazolam, triazolam, ergot, pimozide) per primary source.",
            citationIDs: ["openfda_round16"]
        ),
        warnings: [
            AttributedBullet("CNS / psychiatric effects — dizziness, headache, insomnia, vivid dreams, depression, suicidality, psychosis (especially in mental health history) per primary source.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Hepatotoxicity — caution in HBV / HCV co-infection; LFT monitoring.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Pregnancy — Category D; avoid in 1st trimester (NTD signal); 2nd / 3rd acceptable; switch to safer ART when possible.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Lipid abnormalities — TG / LDL elevations.", citationIDs: ["openfda_round16"]),
            AttributedBullet("CYP3A4 induction → reduces effectiveness of OCPs, methadone, warfarin, statins per primary source.", citationIDs: ["openfda_round16"])
        ],
        adverseReactions: AttributedProse(
            "Vivid dreams, dizziness, headache, insomnia, fatigue, rash (frequent), elevated lipids, transaminitis, depression, gynecomastia.",
            citationIDs: ["openfda_round16"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 substrates — multiple contraindications (per labeling).", citationIDs: ["openfda_round16"]),
            AttributedBullet("OCPs — reduced efficacy; alternative contraception.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Methadone — lower levels → withdrawal; dose increase often needed.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Warfarin — variable effect; INR monitoring.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Rifampin — CYP induction; dose adjustment per primary source.", citationIDs: ["specialty_round16"])
        ],
        nursingImplications: [
            AttributedBullet("Bedtime dosing on empty stomach minimizes CNS effects + reduces toxicity from high-fat meal absorption.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Screen baseline mental health; counsel transient CNS effects 2–4 weeks; suicide risk assessment.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Monitor LFTs, lipids, viral load, CD4.", citationIDs: ["openrn_pharm_round16"]),
            AttributedBullet("Counsel reliable contraception (CYP3A4 induction); pregnancy planning.", citationIDs: ["openrn_pharm_round16"])
        ],
        patientTeaching: AttributedProse(
            "Take at bedtime on an empty stomach to reduce side effects. You may have vivid dreams or feel dizzy in the first 2–4 weeks — this usually improves. Tell us right away about depression, thoughts of self-harm, or severe rash. Use reliable birth control besides the pill — this medicine can make pills less effective.",
            citationIDs: ["openrn_pharm_round16"]
        ),
        citations: [openfdaR16, openrnPharmR16, specialtyR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum CabotegravirLASample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cabotegravir-la",
        title: "Cabotegravir LA + rilpivirine LA (Cabenuva)",
        subtitle: "Long-acting injectable · HIV · monthly or every-2-month IM · adherence + injection-site reactions",
        category: "Long-acting injectable INSTI + NNRTI (combination)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "INSTI (cabotegravir) + NNRTI (rilpivirine)"),
            KeyValueRow(key: "Indications", value: "HIV-1 maintenance (virally suppressed adults + adolescents)"),
            KeyValueRow(key: "Schedule", value: "Initial monthly × 2, then every 2 months; or monthly throughout"),
            KeyValueRow(key: "Critical", value: "Long PK tail — virologic failure if missed; TDF/FTC bridge if delays")
        ],
        indications: AttributedProse(
            "HIV-1 maintenance in virologically suppressed adults + adolescents on stable ART without resistance to either component per primary source.",
            citationIDs: ["openfda_round16", "specialty_round16"]
        ),
        mechanism: AttributedProse(
            "Cabotegravir — INSTI (similar to dolutegravir). Rilpivirine — NNRTI. Combined IM depot maintains therapeutic plasma levels for ~1–2 months.",
            citationIDs: ["openfda_round16"]
        ),
        dosing: [
            DosingBlock(label: "Initiation", body: "Optional 1-month oral lead-in (cabotegravir 30 mg + rilpivirine 25 mg PO daily) before injection per primary source.", citationIDs: ["openfda_round16"]),
            DosingBlock(label: "Loading IM injection", body: "Cabotegravir 600 mg + rilpivirine 900 mg IM gluteal × 1.", citationIDs: ["openfda_round16"]),
            DosingBlock(label: "Maintenance", body: "Cabotegravir 400 mg + rilpivirine 600 mg IM monthly OR cabotegravir 600 mg + rilpivirine 900 mg every 2 months per primary source.", citationIDs: ["openfda_round16"]),
            DosingBlock(label: "Missed dose", body: "Oral bridge cabotegravir 30 mg + rilpivirine 25 mg daily until next injection; consult labeling.", citationIDs: ["specialty_round16"])
        ],
        contraindications: AttributedProse(
            "Concurrent strong CYP3A4 inducers (rifampin, rifabutin, anticonvulsants, St. John's wort) per primary source.",
            citationIDs: ["openfda_round16"]
        ),
        warnings: [
            AttributedBullet("Long PK tail — virologic failure + INSTI / NNRTI resistance if missed without bridge per primary source.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Injection-site reactions — pain, induration; usually mild but persistent.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Hypersensitivity — discontinue if rash + systemic symptoms.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Hepatotoxicity — caution in HBV / HCV co-infection.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Depression / suicidal ideation reported.", citationIDs: ["openfda_round16"])
        ],
        adverseReactions: AttributedProse(
            "Injection-site reactions (very common), headache, pyrexia, fatigue, GI upset, sleep disturbance, rash, weight gain.",
            citationIDs: ["openfda_round16"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inducers — CONTRAINDICATED (loss of virologic control).", citationIDs: ["openfda_round16"]),
            AttributedBullet("Polyvalent cations — separate from oral bridge per dolutegravir-like rules.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Other ART regimens — coordinate transition carefully.", citationIDs: ["specialty_round16"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm virologic suppression + no resistance before starting; HBV / HCV serology.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Inject deep IM gluteal (ventrogluteal preferred); separate sites for two products.", citationIDs: ["openrn_pharm_round16"]),
            AttributedBullet("Track injection schedule — system / patient reminders; oral bridge for delays.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Monitor — viral load, CD4, LFTs; counsel signs of failure (rebound viremia, weight loss).", citationIDs: ["openrn_pharm_round16"])
        ],
        patientTeaching: AttributedProse(
            "Come on time for every injection — missing or being late can cause your HIV to come back and become harder to treat. Your provider will plan oral medicine if you must miss one. Expect some soreness at the injection site for a few days. Tell us about rash, fever, depression, or feeling unwell.",
            citationIDs: ["openrn_pharm_round16"]
        ),
        citations: [openfdaR16, openrnPharmR16, specialtyR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum IsotretinoinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "isotretinoin",
        title: "Isotretinoin",
        subtitle: "Vitamin A retinoid · severe acne · iPLEDGE REMS · teratogen Category X",
        category: "Retinoid (severe nodular acne)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Retinoid (vitamin A derivative)"),
            KeyValueRow(key: "Indications", value: "Severe recalcitrant nodular acne; refractory to abx + topical"),
            KeyValueRow(key: "Boxed", value: "Teratogen (Cat X); iPLEDGE REMS required"),
            KeyValueRow(key: "Adjuncts", value: "Lipid panel, LFTs; CBC; pregnancy tests in iPLEDGE")
        ],
        indications: AttributedProse(
            "Treatment of severe recalcitrant nodular acne unresponsive to standard therapy including systemic antibiotics per primary source.",
            citationIDs: ["openfda_round16", "specialty_round16"]
        ),
        mechanism: AttributedProse(
            "Vitamin A derivative → reduces sebaceous gland size + sebum production + abnormal keratinization + Cutibacterium acnes activity → durable remission of severe acne.",
            citationIDs: ["openfda_round16"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "0.5–1 mg/kg/day PO divided BID with food × 16–20 weeks; cumulative dose target 120–150 mg/kg per primary source.", citationIDs: ["openfda_round16"]),
            DosingBlock(label: "Pediatric", body: "Same weight-based dosing; not approved <12 years.", citationIDs: ["openfda_round16"])
        ],
        contraindications: AttributedProse(
            "Pregnancy / planning pregnancy (Category X — iPLEDGE program); breastfeeding; vitamin A toxicity; severe hepatic impairment; severe hyperlipidemia per primary source.",
            citationIDs: ["openfda_round16"]
        ),
        warnings: [
            AttributedBullet("BOXED — teratogen; iPLEDGE REMS — registration, two negative pregnancy tests, two contraception methods, monthly pregnancy testing per primary source.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Hyperlipidemia + transaminitis — baseline + periodic monitoring per primary source.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Depression / suicidal ideation — controversial association; assess + counsel per primary source.", citationIDs: ["openfda_round16"]),
            AttributedBullet("IBD — possible association (data conflicting).", citationIDs: ["openfda_round16"]),
            AttributedBullet("Pseudotumor cerebri — avoid combined with tetracyclines per primary source.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Mucocutaneous — cheilitis, dry skin, conjunctivitis; nosebleeds; photosensitivity.", citationIDs: ["openfda_round16"])
        ],
        adverseReactions: AttributedProse(
            "Cheilitis, dry skin / mucous membranes, photosensitivity, hyperlipidemia, transaminitis, headache, arthralgia, depression, dry eyes, nosebleeds, hair changes.",
            citationIDs: ["openfda_round16"]
        ),
        drugInteractions: [
            AttributedBullet("Tetracyclines — pseudotumor cerebri; avoid combination.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Vitamin A supplements — additive hypervitaminosis A; avoid.", citationIDs: ["openfda_round16"]),
            AttributedBullet("OCPs — counsel two methods of contraception per iPLEDGE.", citationIDs: ["specialty_round16"])
        ],
        nursingImplications: [
            AttributedBullet("iPLEDGE registration — patient + prescriber + pharmacy; monthly pregnancy tests + counseling per primary source.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Baseline + monthly lipids + LFTs + pregnancy test (iPLEDGE).", citationIDs: ["specialty_round16"]),
            AttributedBullet("Counsel mucocutaneous care — lip balm, moisturizer, sunscreen; avoid waxing / laser / tattoos during therapy + 6 months after.", citationIDs: ["openrn_pharm_round16"]),
            AttributedBullet("Mental health screen + ongoing assessment.", citationIDs: ["specialty_round16"]),
            AttributedBullet("Counsel donor restrictions — no blood donation during therapy + 1 month after (teratogenicity).", citationIDs: ["openfda_round16"])
        ],
        patientTeaching: AttributedProse(
            "This medication will clear severe acne but you must follow strict precautions — you cannot become pregnant during therapy or for 1 month after, and must use two reliable forms of birth control. Get pregnancy tests every month. Use lip balm, moisturizer, and sunscreen daily — your skin and lips will be very dry. Avoid vitamin A supplements and tetracycline antibiotics. Tell us about depression or thoughts of self-harm immediately. Don't donate blood while taking this medication or for 1 month after.",
            citationIDs: ["openrn_pharm_round16"]
        ),
        citations: [openfdaR16, openrnPharmR16, specialtyR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum TimololEyeSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "timolol-eye",
        title: "Timolol (ophthalmic)",
        subtitle: "Topical β-blocker · glaucoma · systemic absorption — bradycardia + bronchospasm",
        category: "Topical ophthalmic beta-blocker",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-selective topical β-blocker"),
            KeyValueRow(key: "Indications", value: "Open-angle glaucoma + ocular hypertension"),
            KeyValueRow(key: "Notable", value: "Systemic absorption — bradycardia, bronchospasm, fatigue, depression"),
            KeyValueRow(key: "Schedule", value: "1 drop affected eye(s) BID")
        ],
        indications: AttributedProse(
            "Reduction of intraocular pressure in open-angle glaucoma + ocular hypertension; combination drops with prostaglandins or CAIs per primary source.",
            citationIDs: ["openfda_round16", "specialty_round16"]
        ),
        mechanism: AttributedProse(
            "Non-selective β-adrenergic antagonist → decreases aqueous humor production from ciliary body → lowers IOP by 20–25%.",
            citationIDs: ["openfda_round16"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "1 drop 0.25–0.5% into affected eye(s) BID per primary source.", citationIDs: ["openfda_round16"]),
            DosingBlock(label: "Gel-forming (Timoptic-XE)", body: "1 drop daily.", citationIDs: ["openfda_round16"])
        ],
        contraindications: AttributedProse(
            "Asthma / severe COPD; sinus bradycardia; second/third-degree AV block; overt heart failure; cardiogenic shock per primary source.",
            citationIDs: ["openfda_round16"]
        ),
        warnings: [
            AttributedBullet("Systemic β-blockade — bradycardia, bronchospasm, hypotension, masked hypoglycemia, fatigue, depression — significant absorption from eye drops per primary source.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Caution in COPD / asthma history (even non-active).", citationIDs: ["openfda_round16"]),
            AttributedBullet("Heart failure / heart block — assess cardiac history before initiation.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Sexual dysfunction; central effects (depression, mood).", citationIDs: ["specialty_round16"]),
            AttributedBullet("Children — closer monitoring; small body mass + significant systemic absorption.", citationIDs: ["openfda_round16"])
        ],
        adverseReactions: AttributedProse(
            "Ocular irritation, dry eye, blurred vision; systemic — bradycardia, hypotension, bronchospasm, fatigue, depression, sexual dysfunction.",
            citationIDs: ["openfda_round16"]
        ),
        drugInteractions: [
            AttributedBullet("Systemic β-blockers — additive bradycardia + hypotension.", citationIDs: ["openfda_round16"]),
            AttributedBullet("CCBs (verapamil, diltiazem) — additive bradycardia + heart block.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Catecholamine-depleting drugs (reserpine) — additive hypotension.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Insulin — masked hypoglycemia; counsel.", citationIDs: ["openrn_pharm_round16"])
        ],
        nursingImplications: [
            AttributedBullet("Nasolacrimal occlusion ×1 minute after instillation — reduces systemic absorption ~67%.", citationIDs: ["openrn_pharm_round16"]),
            AttributedBullet("Screen for asthma / COPD / heart failure / heart block before initiation.", citationIDs: ["openfda_round16"]),
            AttributedBullet("Monitor BP / HR / pulmonary status; counsel signs of bradycardia / wheezing.", citationIDs: ["openrn_pharm_round16"]),
            AttributedBullet("Diabetic patients — counsel about masked hypoglycemia symptoms (fewer sympathetic warnings).", citationIDs: ["specialty_round16"])
        ],
        patientTeaching: AttributedProse(
            "Use one drop twice daily as directed. Press your finger gently on the inner corner of your eye for one minute after putting in the drop — this keeps the medicine in your eye and out of your bloodstream. Tell us about slow heart rate, breathing trouble, fatigue, or depression. If you have diabetes, you may not feel low blood sugar warnings as well.",
            citationIDs: ["openrn_pharm_round16"]
        ),
        citations: [openfdaR16, openrnPharmR16, specialtyR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}
