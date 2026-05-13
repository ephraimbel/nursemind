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
    id: "openrn_pharm",
    shortName: "Open RN Nursing Pharmacology — relevant chapter",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
    lastRetrieved: "2026-05-03"
)

// MARK: - Levothyroxine

public enum LevothyroxineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "levothyroxine",
        title: "Levothyroxine",
        subtitle: "Synthroid · Levoxyl · synthetic T4",
        category: "Thyroid Hormone",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic T4 (thyroxine)"),
            KeyValueRow(key: "Onset", value: "Days–weeks for clinical effect"),
            KeyValueRow(key: "Half-life", value: "~7 days"),
            KeyValueRow(key: "Take with", value: "Empty stomach, water, 30–60 min before food")
        ],
        indications: AttributedProse("Hypothyroidism replacement therapy, suppression of TSH-dependent thyroid cancer.", citationIDs: ["openfda_generic"]),
        mechanism: AttributedProse("Synthetic T4 — converted peripherally to active T3, regulating metabolism.", citationIDs: ["openfda_generic"]),
        dosing: [
            DosingBlock(label: "Adult initial (otherwise healthy)", body: "1.6 mcg/kg PO daily on empty stomach.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Elderly / cardiac disease", body: "Start 12.5–25 mcg daily; increase by 12.5–25 mcg every 4–6 weeks based on TSH.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Pregnancy", body: "Increased dose requirement (~30%); monitor TSH every 4 weeks.", citationIDs: ["openfda_generic"])
        ],
        contraindications: AttributedProse("Untreated thyrotoxicosis, untreated adrenal insufficiency, acute MI, hypersensitivity.", citationIDs: ["openfda_generic"]),
        warnings: [
            AttributedBullet("Boxed warning: not for weight loss in euthyroid patients — toxicity, including life-threatening, can occur.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Cardiac: in elderly or known CAD, start low to avoid angina, MI, arrhythmia.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Bone density: long-term suppressive doses may decrease BMD.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Many absorption interactions — separate from interacting drugs/foods.", citationIDs: ["openfda_generic"])
        ],
        adverseReactions: AttributedProse("Symptoms of overtreatment: tachycardia, palpitations, weight loss, anxiety, insomnia, heat intolerance.", citationIDs: ["openfda_generic"]),
        drugInteractions: [
            AttributedBullet("Calcium, iron, antacids, PPIs, sucralfate, cholestyramine — reduce absorption; separate by 4 hours.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Soy, walnuts, fiber — reduce absorption.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Warfarin — levothyroxine increases anticoagulant effect.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("Take FIRST THING in morning, on empty stomach, with water, 30–60 min before any food, coffee, or other meds.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Monitor TSH 6–8 weeks after dose change; expect normalization 4–6 weeks.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Monitor for over-replacement: tachycardia, weight loss, anxiety, heat intolerance, atrial fibrillation.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Brand-name substitution can shift TSH — be cautious with switches; recheck TSH after.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Hold and notify provider for chest pain, severe palpitations, new-onset AFib.", citationIDs: ["openrn_pharm"])
        ],
        patientTeaching: AttributedProse("Take same time every morning on empty stomach with full glass of water. Wait 30–60 minutes before food, coffee, calcium, or iron. Do not stop abruptly. Report chest pain, racing heart, or severe weight changes.", citationIDs: ["openrn_pharm"]),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Metformin

public enum MetforminSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "metformin",
        title: "Metformin",
        subtitle: "Glucophage · biguanide — first-line type 2 diabetes",
        category: "Antidiabetic — Biguanide",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Biguanide"),
            KeyValueRow(key: "Onset", value: "Days for clinical glucose effect"),
            KeyValueRow(key: "Half-life", value: "5–6 hr"),
            KeyValueRow(key: "Hold for", value: "Contrast, surgery, AKI")
        ],
        indications: AttributedProse("First-line therapy for type 2 diabetes mellitus; PCOS (off-label).", citationIDs: ["openfda_generic"]),
        mechanism: AttributedProse("Decreases hepatic glucose production, decreases intestinal glucose absorption, improves insulin sensitivity.", citationIDs: ["openfda_generic"]),
        dosing: [
            DosingBlock(label: "Adult initial", body: "500 mg PO twice daily WITH MEALS (or 850 mg once daily).", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Titration", body: "Increase by 500 mg/week to max 2550 mg/day in divided doses.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Renal contraindication", body: "Do NOT start if eGFR <45; discontinue if eGFR <30.", citationIDs: ["openfda_generic"])
        ],
        contraindications: AttributedProse("eGFR <30, acute or chronic metabolic acidosis (incl. DKA), hypersensitivity.", citationIDs: ["openfda_generic"]),
        warnings: [
            AttributedBullet("Boxed warning: lactic acidosis — rare but life-threatening; risk in renal impairment, sepsis, hypoxia, alcoholism.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Hold for IV contrast (48 hours before and after if eGFR <60 or with AKI).", citationIDs: ["openfda_generic"]),
            AttributedBullet("Hold during acute illness causing dehydration or hypoxia.", citationIDs: ["openfda_generic"]),
            AttributedBullet("B12 deficiency with long-term use — periodic screening.", citationIDs: ["openfda_generic"])
        ],
        adverseReactions: AttributedProse("Common: GI upset (diarrhea, bloating, abdominal pain) — usually subsides over weeks. Serious: lactic acidosis, B12 deficiency.", citationIDs: ["openfda_generic"]),
        drugInteractions: [
            AttributedBullet("IV contrast — risk of contrast-induced nephropathy + lactic acidosis; hold per protocol.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Alcohol (heavy) — increased lactic acidosis risk.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Cimetidine, dolutegravir — increase metformin levels.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("Take WITH MEALS to reduce GI side effects.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Hold for any procedure with IV contrast, surgery, or sepsis — restart only when renal function confirmed.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Monitor renal function (eGFR) at baseline, then yearly (more often in elderly or comorbidities).", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Monitor B12 yearly with long-term use.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Watch for lactic acidosis: hyperventilation, abdominal pain, malaise, hypothermia, hypotension. Check lactate.", citationIDs: ["openrn_pharm"])
        ],
        patientTeaching: AttributedProse("Take with meals. Tell every provider before surgery or imaging with contrast. Avoid heavy alcohol. Report severe abdominal pain, deep rapid breathing, severe weakness. GI side effects usually improve in 2–4 weeks.", citationIDs: ["openrn_pharm"]),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Nitroglycerin

public enum NitroglycerinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "nitroglycerin",
        title: "Nitroglycerin",
        subtitle: "NTG · nitrostat · nitroglycerin — vasodilator",
        category: "Antianginal / Vasodilator",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Organic nitrate"),
            KeyValueRow(key: "Onset (SL)", value: "1–3 min"),
            KeyValueRow(key: "Duration (SL)", value: "30–60 min"),
            KeyValueRow(key: "Storage", value: "Light-protected; lose potency over time")
        ],
        indications: AttributedProse("Acute angina (sublingual), chronic angina prophylaxis, acute decompensated heart failure (IV), hypertensive emergency (IV), post-MI.", citationIDs: ["openfda_generic"]),
        mechanism: AttributedProse("Releases nitric oxide → vasodilation, predominantly venous (preload reduction); reduces myocardial oxygen demand.", citationIDs: ["openfda_generic"]),
        dosing: [
            DosingBlock(label: "Sublingual (acute angina)", body: "0.4 mg SL every 5 min × 3 doses; if pain persists after first or doesn't fully resolve, call 911.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Topical paste", body: "1–2 inches every 6–8 hours (with 10–12 hr nitrate-free interval to avoid tolerance).", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "IV", body: "5 mcg/min initial; titrate by 5 mcg/min every 3–5 min to BP/symptom; typical 5–200 mcg/min.", citationIDs: ["openfda_generic"])
        ],
        contraindications: AttributedProse("Concurrent PDE5 inhibitor (sildenafil/tadalafil/vardenafil) within 24–48 hours — severe hypotension. SBP <90, severe anemia, increased ICP, RV infarct, severe aortic stenosis, hypersensitivity.", citationIDs: ["openfda_generic"]),
        warnings: [
            AttributedBullet("PDE5 inhibitors — fatal hypotension; ALWAYS ask about Viagra/Cialis use within 24–48 hours before nitrate.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Right ventricular MI — preload-dependent; nitrates can cause profound hypotension. Get EKG with right-sided leads.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Tolerance develops with continuous use — nitrate-free interval (10–12 hours) needed for chronic therapy.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Headache is common, often dose-limiting; usually subsides with continued use.", citationIDs: ["openfda_generic"])
        ],
        adverseReactions: AttributedProse("Headache (very common), hypotension, dizziness, flushing, reflex tachycardia, methemoglobinemia (rare, with high doses).", citationIDs: ["openfda_generic"]),
        drugInteractions: [
            AttributedBullet("PDE5 inhibitors (sildenafil 24 hr, tadalafil 48 hr) — contraindicated.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Antihypertensives — additive hypotension.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("Always ask about PDE5 inhibitor use BEFORE administering nitrate — even tonight's dose of Viagra makes nitrate dangerous.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Check BP before each SL dose; hold if SBP <90.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("In suspected RV-MI: confirm with right-sided EKG before nitrate; have IV fluids ready.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Counsel about expected headache; treat with acetaminophen.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("SL tablets must be kept in original glass bottle, light-protected; replace every 6 months — lose potency.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Topical paste: wear gloves, rotate sites, remove old paste before new (with old gloves).", citationIDs: ["openrn_pharm"])
        ],
        patientTeaching: AttributedProse("Sit before taking SL nitro — can drop your BP. Take one tablet under tongue at first chest pain; if pain persists 5 minutes, call 911 (don't wait for second dose). Never take with Viagra/Cialis. Keep tablets in original bottle, away from light. Replace every 6 months.", citationIDs: ["openrn_pharm"]),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Diphenhydramine

public enum DiphenhydramineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "diphenhydramine",
        title: "Diphenhydramine",
        subtitle: "Benadryl · first-generation antihistamine",
        category: "Antihistamine (H1)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "First-generation H1 antagonist (anticholinergic)"),
            KeyValueRow(key: "Onset", value: "15 min (PO); immediate (IV)"),
            KeyValueRow(key: "Duration", value: "4–6 hr"),
            KeyValueRow(key: "Beers list", value: "Avoid in older adults")
        ],
        indications: AttributedProse("Allergic reactions (mild–moderate), anaphylaxis adjunct (after epinephrine), motion sickness, transfusion reactions, dystonic reactions, sleep aid (short-term), pre-medication for blood products.", citationIDs: ["openfda_generic"]),
        mechanism: AttributedProse("H1 receptor antagonist; also strongly anticholinergic and crosses BBB → sedation.", citationIDs: ["openfda_generic"]),
        dosing: [
            DosingBlock(label: "Adult", body: "25–50 mg PO/IM/IV every 4–6 hours; max 300 mg/day.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Acute allergic reaction", body: "25–50 mg IV slow push.", citationIDs: ["openfda_generic"])
        ],
        contraindications: AttributedProse("Neonates/premature infants, breastfeeding, narrow-angle glaucoma, BPH with retention, hypersensitivity.", citationIDs: ["openfda_generic"]),
        warnings: [
            AttributedBullet("Anticholinergic effects — confusion, urinary retention, constipation, dry mouth; particularly problematic in elderly (Beers list).", citationIDs: ["openfda_generic"]),
            AttributedBullet("Sedation — fall risk; warn about driving.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Paradoxical excitation in children and elderly.", citationIDs: ["openfda_generic"]),
            AttributedBullet("In anaphylaxis, NEVER substitute for epinephrine — give epi FIRST.", citationIDs: ["openrn_pharm"])
        ],
        adverseReactions: AttributedProse("Sedation, dizziness, dry mouth, urinary retention, constipation, blurred vision, paradoxical excitation in elderly/children.", citationIDs: ["openfda_generic"]),
        drugInteractions: [
            AttributedBullet("CNS depressants — additive sedation.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Other anticholinergics — additive (consider total anticholinergic burden).", citationIDs: ["openfda_generic"]),
            AttributedBullet("MAOIs — prolonged anticholinergic effect.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("In anaphylaxis, give epinephrine FIRST — diphenhydramine is adjunct, not primary.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Avoid in elderly when possible — Beers list; use cetirizine/loratadine for routine allergy.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Fall precautions, especially in elderly.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Push IV slowly (over 1–2 min) to avoid hypotension.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Counsel against use as a chronic sleep aid — tolerance, anticholinergic burden, possible cognitive effects.", citationIDs: ["openrn_pharm"])
        ],
        patientTeaching: AttributedProse("May cause significant drowsiness — do not drive. Avoid alcohol. May cause dry mouth and urinary retention. Older adults: discuss alternatives with provider.", citationIDs: ["openrn_pharm"]),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Atorvastatin

public enum AtorvastatinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "atorvastatin",
        title: "Atorvastatin",
        subtitle: "Lipitor · HMG-CoA reductase inhibitor",
        category: "Statin",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "HMG-CoA reductase inhibitor (statin)"),
            KeyValueRow(key: "Onset (lipid effect)", value: "Days–weeks; 4 weeks for full effect"),
            KeyValueRow(key: "Half-life", value: "14 hr"),
            KeyValueRow(key: "Take with food", value: "Not required; any time of day")
        ],
        indications: AttributedProse("Primary and secondary prevention of atherosclerotic cardiovascular disease; treatment of hyperlipidemia (LDL reduction).", citationIDs: ["openfda_generic"]),
        mechanism: AttributedProse("Inhibits HMG-CoA reductase → decreased hepatic cholesterol synthesis → upregulation of LDL receptors → reduced LDL.", citationIDs: ["openfda_generic"]),
        dosing: [
            DosingBlock(label: "Initial", body: "10–20 mg PO daily; ASCVD high risk: 40–80 mg PO daily.", citationIDs: ["openfda_generic"]),
            DosingBlock(label: "Range", body: "10–80 mg daily.", citationIDs: ["openfda_generic"])
        ],
        contraindications: AttributedProse("Active liver disease, unexplained persistent transaminase elevation, pregnancy, breastfeeding, hypersensitivity.", citationIDs: ["openfda_generic"]),
        warnings: [
            AttributedBullet("Myopathy/rhabdomyolysis — rare; monitor for muscle pain, weakness, and dark urine. Higher risk with concurrent gemfibrozil, niacin, cyclosporine, azoles.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Hepatic — transaminase elevations; baseline LFTs and as clinically indicated.", citationIDs: ["openfda_generic"]),
            AttributedBullet("New-onset diabetes — small absolute increase in risk; benefits typically outweigh.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Pregnancy — contraindicated; counsel women of childbearing age.", citationIDs: ["openfda_generic"])
        ],
        adverseReactions: AttributedProse("Common: myalgia, GI upset, headache. Serious: rhabdomyolysis (rare), hepatotoxicity.", citationIDs: ["openfda_generic"]),
        drugInteractions: [
            AttributedBullet("CYP3A4 inhibitors (azoles, macrolides, ritonavir, grapefruit juice) — increase atorvastatin levels and myopathy risk.", citationIDs: ["openfda_generic"]),
            AttributedBullet("Gemfibrozil, fenofibrate — increased rhabdo risk; avoid combination.", citationIDs: ["openfda_generic"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline lipid panel and LFTs; recheck lipids 4–12 weeks after start/dose change.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Counsel about muscle pain — mild myalgia common; severe pain or dark urine warrants discontinuation and CK check.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Avoid grapefruit juice.", citationIDs: ["openrn_pharm"]),
            AttributedBullet("Verify pregnancy status in women of childbearing age before starting.", citationIDs: ["openrn_pharm"])
        ],
        patientTeaching: AttributedProse("Take any time of day. Avoid grapefruit. Report muscle pain, weakness, or brown/red urine immediately. Continue lifestyle changes (diet, exercise) — statins work best alongside lifestyle. Use contraception in childbearing years.", citationIDs: ["openrn_pharm"]),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-03"
    )
}
