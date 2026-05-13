import Foundation

// Curator-model cardiovascular drug entries (v1.5 expansion).
// Sources: openFDA SPL (CC0), Open RN Nursing Pharmacology (CC BY 4.0),
// VA PBM monographs (public domain), ISMP high-alert list (concept citation).

private let openfda = CitationSource(
    id: "openfda_cardio2",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_pharm_cardio2",
    shortName: "Open RN Nursing Pharmacology — Cardiovascular Therapy",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
    lastRetrieved: "2026-05-04"
)
private let vaPBM = CitationSource(
    id: "va_pbm_monograph",
    shortName: "VA PBM Drug Monograph (clinician-facing)",
    publisher: "U.S. Department of Veterans Affairs Pharmacy Benefits Management",
    license: .publicDomain,
    url: "https://www.pbm.va.gov/PBM/clinicalguidance/drugmonographs.asp",
    lastRetrieved: "2026-05-04"
)
private let ismp = CitationSource(
    id: "ismp_high_alert_2024",
    shortName: "ISMP List of High-Alert Medications, 2024",
    detail: "Concept citation only — list itself not reproduced",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)

// MARK: - Digoxin

public enum DigoxinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "digoxin",
        title: "Digoxin",
        subtitle: "Lanoxin · cardiac glycoside",
        category: "Cardiac Glycoside",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Cardiac glycoside (positive inotrope, negative chronotrope)"),
            KeyValueRow(key: "Onset", value: "PO 30–120 min · IV 5–30 min"),
            KeyValueRow(key: "Half-life", value: "36–48 hr (longer in renal impairment)"),
            KeyValueRow(key: "Therapeutic level", value: "0.5–2.0 ng/mL (HF target 0.5–0.9)"),
            KeyValueRow(key: "Antidote", value: "Digoxin immune Fab (DigiFab) for severe toxicity")
        ],
        indications: AttributedProse(
            "Mild-to-moderate heart failure (improves symptoms, not mortality) and rate control in chronic atrial fibrillation, particularly in patients with concurrent heart failure.",
            citationIDs: ["openfda_cardio2"]
        ),
        mechanism: AttributedProse(
            "Inhibits Na/K-ATPase → increased intracellular sodium → increased calcium via Na/Ca exchange → increased myocardial contractility (positive inotropy). Also enhances vagal tone → slowed AV nodal conduction (negative chronotropy).",
            citationIDs: ["openfda_cardio2", "openrn_pharm_cardio2"]
        ),
        dosing: [
            DosingBlock(label: "Loading (rate control AFib)", body: "0.25 mg IV every 2 hr × up to 1.5 mg total (per protocol).", citationIDs: ["openfda_cardio2"]),
            DosingBlock(label: "Maintenance (HF/AFib)", body: "0.125–0.25 mg PO daily; reduce in elderly and renal impairment (often 0.0625–0.125 mg).", citationIDs: ["openfda_cardio2"]),
            DosingBlock(label: "Renal adjustment", body: "Dose reduction required when CrCl <50; both dose and frequency may be adjusted.", citationIDs: ["openfda_cardio2"])
        ],
        contraindications: AttributedProse(
            "Ventricular fibrillation, second/third-degree AV block (without pacemaker), known hypersensitivity. Caution in WPW with AFib (can accelerate accessory pathway conduction).",
            citationIDs: ["openfda_cardio2"]
        ),
        warnings: [
            AttributedBullet("Narrow therapeutic window — toxicity can occur even within 'therapeutic' levels in the setting of hypokalemia, hypomagnesemia, or hypercalcemia.", citationIDs: ["openfda_cardio2", "openrn_pharm_cardio2"]),
            AttributedBullet("Hypokalemia and hypomagnesemia potentiate toxicity — replace electrolytes proactively.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Hold and notify provider if apical pulse <60 in adults (<70 in pediatrics, <90 in infants) before each dose.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Renal impairment markedly extends half-life — reduce dose or extend interval.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Many drug interactions — amiodarone, verapamil, quinidine, clarithromycin all raise digoxin levels.", citationIDs: ["openfda_cardio2"])
        ],
        adverseReactions: AttributedProse(
            "Bradycardia, AV block, ventricular arrhythmias (any new arrhythmia in a patient on digoxin = consider toxicity). Anorexia, nausea, vomiting (early toxicity signs). Visual changes — yellow/green halos around lights, blurred vision (classic toxicity). Confusion, weakness in elderly.",
            citationIDs: ["openfda_cardio2", "openrn_pharm_cardio2"]
        ),
        drugInteractions: [
            AttributedBullet("Amiodarone, verapamil, diltiazem, quinidine, clarithromycin, propafenone — raise digoxin levels (often by 50–100%); reduce digoxin dose.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Loop and thiazide diuretics — cause hypokalemia, potentiating digoxin toxicity.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Antacids, cholestyramine, kaolin-pectin — decrease absorption; separate doses.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("St. John's wort — decreases digoxin levels.", citationIDs: ["openrn_pharm_cardio2"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_high_alert_2024"]),
            AttributedBullet("Take APICAL pulse for full minute before each dose; hold if <60 (adults) and notify provider.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Monitor potassium, magnesium, and renal function; replace electrolytes before they precipitate toxicity.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Trough digoxin level drawn 6–8 hours after dose (ideally just before next dose).", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Teach signs of toxicity: anorexia, nausea, visual halos, confusion, palpitations.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Suspected toxicity: hold digoxin, obtain level and ECG, notify provider; severe toxicity (life-threatening arrhythmia, K >5, level >10–15 ng/mL) treated with digoxin immune Fab.", citationIDs: ["openrn_pharm_cardio2"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same time daily. Check your pulse before each dose; do not take if it is below the number your provider gave you. Tell every provider you take digoxin — many other medications interact. Stop and call if you feel nauseated, see yellow/green halos, or have palpitations.",
            citationIDs: ["openrn_pharm_cardio2"]
        ),
        citations: [openfda, openrn, vaPBM, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Amlodipine

public enum AmlodipineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "amlodipine",
        title: "Amlodipine",
        subtitle: "Norvasc · dihydropyridine calcium channel blocker",
        category: "Calcium Channel Blocker",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dihydropyridine CCB (vascular-selective)"),
            KeyValueRow(key: "Onset", value: "Hours; peak 6–12 hr"),
            KeyValueRow(key: "Half-life", value: "30–50 hr (long-acting once-daily)"),
            KeyValueRow(key: "Common combos", value: "With statin (Caduet) or ARB (Exforge)")
        ],
        indications: AttributedProse(
            "Hypertension and chronic stable angina. Vasospastic (Prinzmetal) angina.",
            citationIDs: ["openfda_cardio2"]
        ),
        mechanism: AttributedProse(
            "Blocks L-type calcium channels in vascular smooth muscle → arterial vasodilation → reduced systemic vascular resistance and blood pressure. Minimal direct cardiac effect at therapeutic doses (unlike non-DHP CCBs).",
            citationIDs: ["openfda_cardio2", "openrn_pharm_cardio2"]
        ),
        dosing: [
            DosingBlock(label: "Hypertension/angina (adult)", body: "Initial 2.5–5 mg PO daily; max 10 mg daily.", citationIDs: ["openfda_cardio2"]),
            DosingBlock(label: "Elderly / hepatic impairment", body: "Start 2.5 mg PO daily.", citationIDs: ["openfda_cardio2"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Severe aortic stenosis (relative — vasodilation may worsen gradient).",
            citationIDs: ["openfda_cardio2"]
        ),
        warnings: [
            AttributedBullet("Symptomatic hypotension, especially when adding to other antihypertensives.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Worsening angina or MI on initiation/dose increase (rare, paradoxical).", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Peripheral edema is dose-dependent; common, not allergic — do not increase diuretic, reduce dose or switch.", citationIDs: ["openrn_pharm_cardio2"])
        ],
        adverseReactions: AttributedProse(
            "Peripheral edema (most common, dose-dependent), flushing, headache, dizziness, palpitations, fatigue, gingival hyperplasia (rare).",
            citationIDs: ["openfda_cardio2"]
        ),
        drugInteractions: [
            AttributedBullet("Simvastatin — limit simvastatin dose to 20 mg with amlodipine (rhabdo risk).", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Cyclosporine, tacrolimus — amlodipine can raise their levels.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Grapefruit juice — modest effect (less than diltiazem/verapamil); usually clinically insignificant.", citationIDs: ["openrn_pharm_cardio2"])
        ],
        nursingImplications: [
            AttributedBullet("Monitor BP and HR; hold or notify provider if SBP <90 or symptomatic.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Assess lower extremities for peripheral edema at follow-up; document and report.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Counsel on slow rise from sitting/lying — orthostasis especially in elderly.", citationIDs: ["openrn_pharm_cardio2"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same time daily. Rise slowly to avoid dizziness. Mild ankle swelling is common; report new shortness of breath, weight gain, or chest pain.",
            citationIDs: ["openrn_pharm_cardio2"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Losartan

public enum LosartanSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "losartan",
        title: "Losartan",
        subtitle: "Cozaar · angiotensin II receptor blocker (ARB)",
        category: "ARB",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Angiotensin II type 1 receptor antagonist"),
            KeyValueRow(key: "Onset", value: "Hours; peak BP effect 3–6 weeks"),
            KeyValueRow(key: "Half-life", value: "Active metabolite 6–9 hr"),
            KeyValueRow(key: "Use vs ACEi", value: "Often substituted when ACE inhibitor causes cough or angioedema")
        ],
        indications: AttributedProse(
            "Hypertension. Diabetic nephropathy in type 2 diabetes with proteinuria. Stroke risk reduction in patients with hypertension and LVH. Heart failure (when ACE inhibitor not tolerated).",
            citationIDs: ["openfda_cardio2"]
        ),
        mechanism: AttributedProse(
            "Selectively blocks the angiotensin II type 1 (AT₁) receptor, preventing vasoconstriction and aldosterone-mediated sodium retention. Does not inhibit ACE — bradykinin is not increased, so cough and angioedema are far less common than with ACE inhibitors.",
            citationIDs: ["openfda_cardio2", "openrn_pharm_cardio2"]
        ),
        dosing: [
            DosingBlock(label: "Hypertension", body: "Initial 50 mg PO daily (25 mg if volume-depleted or hepatic impairment); max 100 mg daily.", citationIDs: ["openfda_cardio2"]),
            DosingBlock(label: "Heart failure / nephropathy", body: "Start low and titrate to target as tolerated, monitoring BP, K, and renal function.", citationIDs: ["openfda_cardio2"])
        ],
        contraindications: AttributedProse(
            "Pregnancy (boxed warning — fetal toxicity). Hypersensitivity. Concurrent aliskiren in patients with diabetes.",
            citationIDs: ["openfda_cardio2"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: pregnancy — discontinue immediately when pregnancy detected; risk of fetal renal injury and death.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Hyperkalemia — additive with potassium supplements, K-sparing diuretics, NSAIDs.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Renal impairment — monitor creatinine; reduce or hold if rises significantly.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Hypotension — especially in volume-depleted patients (concurrent diuretic, dehydration).", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Angioedema is rare but reported; far less common than with ACE inhibitors.", citationIDs: ["openrn_pharm_cardio2"])
        ],
        adverseReactions: AttributedProse(
            "Dizziness, hypotension, hyperkalemia, fatigue, mild renal function changes, rarely angioedema. Cough is much less common than with ACE inhibitors.",
            citationIDs: ["openfda_cardio2"]
        ),
        drugInteractions: [
            AttributedBullet("Potassium supplements, K-sparing diuretics (spironolactone, eplerenone) — hyperkalemia.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("NSAIDs — reduced antihypertensive effect and worsened renal function.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Lithium — losartan can raise lithium levels.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("ACE inhibitors and aliskiren — generally avoid combining; risk of hyperkalemia, hypotension, renal injury.", citationIDs: ["openfda_cardio2"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline and follow-up BMP — monitor potassium and creatinine within 1–2 weeks of initiation or dose change.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Confirm not pregnant in any patient of childbearing potential before starting.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Counsel on orthostasis, especially with diuretics.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Counsel against potassium-containing salt substitutes.", citationIDs: ["openrn_pharm_cardio2"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same time daily. Notify provider if you become pregnant or plan to. Avoid potassium-containing salt substitutes. Report swelling of face/tongue, severe dizziness, or muscle weakness.",
            citationIDs: ["openrn_pharm_cardio2"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hydrochlorothiazide

public enum HydrochlorothiazideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "hydrochlorothiazide",
        title: "Hydrochlorothiazide",
        subtitle: "HCTZ · Microzide · thiazide diuretic",
        category: "Thiazide Diuretic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Thiazide diuretic"),
            KeyValueRow(key: "Onset", value: "2 hr; peak 4–6 hr; duration 6–12 hr"),
            KeyValueRow(key: "Site", value: "Distal convoluted tubule"),
            KeyValueRow(key: "Less effective if", value: "CrCl <30 (use loop diuretic instead)")
        ],
        indications: AttributedProse(
            "Hypertension (often first-line per guidelines), edema from heart failure, hepatic cirrhosis, or corticosteroid/estrogen therapy.",
            citationIDs: ["openfda_cardio2"]
        ),
        mechanism: AttributedProse(
            "Inhibits the Na-Cl cotransporter in the distal convoluted tubule → increased sodium and water excretion. Long-term BP reduction also involves vascular effects.",
            citationIDs: ["openfda_cardio2", "openrn_pharm_cardio2"]
        ),
        dosing: [
            DosingBlock(label: "Hypertension", body: "12.5–25 mg PO daily.", citationIDs: ["openfda_cardio2"]),
            DosingBlock(label: "Edema", body: "25–100 mg PO daily or in divided doses.", citationIDs: ["openfda_cardio2"])
        ],
        contraindications: AttributedProse(
            "Anuria. Sulfonamide hypersensitivity (cross-reactivity). Severe renal impairment (largely ineffective).",
            citationIDs: ["openfda_cardio2"]
        ),
        warnings: [
            AttributedBullet("Hypokalemia, hyponatremia, hypomagnesemia, hypercalcemia — monitor electrolytes.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Hyperglycemia and hyperuricemia (gout flare).", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Photosensitivity reactions.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Acute angle-closure glaucoma (rare, idiosyncratic).", citationIDs: ["openfda_cardio2"])
        ],
        adverseReactions: AttributedProse(
            "Electrolyte disturbances (hypoK, hypoNa, hypoMg, hyperCa), hyperglycemia, hyperuricemia/gout, dizziness, hyponatremia (especially in elderly).",
            citationIDs: ["openfda_cardio2"]
        ),
        drugInteractions: [
            AttributedBullet("Lithium — thiazides reduce lithium clearance, raising levels.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Digoxin — hypokalemia from thiazide potentiates digoxin toxicity.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("NSAIDs — reduce diuretic effect.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Other antihypertensives — additive BP lowering.", citationIDs: ["openfda_cardio2"])
        ],
        nursingImplications: [
            AttributedBullet("Monitor electrolytes (especially K, Na) and renal function at baseline and after dose changes.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Take in the morning to avoid nocturia.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Daily weights for edema indications.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Counsel on K-rich foods (banana, orange, leafy greens) or supplementation per provider.", citationIDs: ["openrn_pharm_cardio2"])
        ],
        patientTeaching: AttributedProse(
            "Take in the morning. Rise slowly to avoid dizziness. Eat potassium-rich foods. Use sunscreen. Report severe muscle cramps, weakness, irregular heartbeat, or signs of gout.",
            citationIDs: ["openrn_pharm_cardio2"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Carvedilol

public enum CarvedilolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "carvedilol",
        title: "Carvedilol",
        subtitle: "Coreg · non-selective β-blocker with α₁-blockade",
        category: "Beta-blocker (HF-indicated)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-selective β + α₁ blocker"),
            KeyValueRow(key: "Onset", value: "30 min; peak 1–2 hr"),
            KeyValueRow(key: "Half-life", value: "7–10 hr"),
            KeyValueRow(key: "HF target", value: "25 mg PO BID (50 mg BID if >85 kg)")
        ],
        indications: AttributedProse(
            "Heart failure (mortality benefit), left ventricular dysfunction post-MI, hypertension.",
            citationIDs: ["openfda_cardio2"]
        ),
        mechanism: AttributedProse(
            "Non-selectively blocks β₁ and β₂ receptors plus α₁ receptors. Beta blockade reduces heart rate, contractility, and renin release; alpha blockade causes vasodilation. Net effect in heart failure: reverse remodeling and improved outcomes when titrated slowly.",
            citationIDs: ["openfda_cardio2", "openrn_pharm_cardio2"]
        ),
        dosing: [
            DosingBlock(label: "Heart failure (start)", body: "3.125 mg PO BID × 2 weeks; double every 2 weeks as tolerated to target.", citationIDs: ["openfda_cardio2"]),
            DosingBlock(label: "Heart failure (target)", body: "25 mg PO BID (50 mg BID if patient weighs >85 kg).", citationIDs: ["openfda_cardio2"]),
            DosingBlock(label: "Hypertension", body: "6.25 mg PO BID; titrate to max 25 mg BID.", citationIDs: ["openfda_cardio2"])
        ],
        contraindications: AttributedProse(
            "Decompensated heart failure requiring IV inotropes. Severe bradycardia, second/third-degree AV block (without pacemaker), sick sinus syndrome. Severe hepatic impairment. Bronchial asthma (boxed warning — non-selective).",
            citationIDs: ["openfda_cardio2"]
        ),
        warnings: [
            AttributedBullet("Initiate at low dose; titration during decompensation can worsen heart failure.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Bronchospasm in patients with asthma or COPD — non-selective β-blockade.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Bradycardia, AV block, hypotension; orthostasis from α-blockade.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Mask signs of hypoglycemia in diabetics.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Do NOT abruptly discontinue — taper over 1–2 weeks to avoid rebound ischemia.", citationIDs: ["openfda_cardio2"])
        ],
        adverseReactions: AttributedProse(
            "Bradycardia, hypotension, dizziness, fatigue, weight gain (fluid), worsening HF if up-titrated too fast, hyperglycemia, bronchospasm.",
            citationIDs: ["openfda_cardio2"]
        ),
        drugInteractions: [
            AttributedBullet("Other negative chronotropes (verapamil, diltiazem, digoxin) — additive bradycardia.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Insulin and oral hypoglycemics — masks hypoglycemia symptoms.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Cyclosporine — carvedilol can raise its levels.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Rifampin — reduces carvedilol levels.", citationIDs: ["openfda_cardio2"])
        ],
        nursingImplications: [
            AttributedBullet("Take WITH FOOD — slows absorption and reduces orthostatic hypotension.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Apical pulse for full minute; hold and notify if HR <50 or SBP <90.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Daily weights — report >2 lb/day or 5 lb/week (HF decompensation).", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Counsel on slow rise from sitting/lying to avoid orthostatic hypotension.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Diabetic patients: instruct to check glucose more frequently — carvedilol blunts hypoglycemic warning signs.", citationIDs: ["openrn_pharm_cardio2"])
        ],
        patientTeaching: AttributedProse(
            "Take with food at the same time each day. Do not skip doses or stop suddenly — call your provider. Weigh yourself daily. Report a heart rate below 50, dizziness, swelling, or breathing changes.",
            citationIDs: ["openrn_pharm_cardio2"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Spironolactone

public enum SpironolactoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "spironolactone",
        title: "Spironolactone",
        subtitle: "Aldactone · potassium-sparing diuretic",
        category: "K-Sparing Diuretic / Aldosterone Antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Mineralocorticoid receptor antagonist"),
            KeyValueRow(key: "Onset", value: "Hours; peak diuresis 2–3 days"),
            KeyValueRow(key: "Half-life", value: "1.5 hr (active metabolites longer)"),
            KeyValueRow(key: "Mortality benefit", value: "HFrEF (RALES), severe — added to ACEi/ARNI + β-blocker")
        ],
        indications: AttributedProse(
            "Heart failure with reduced ejection fraction (mortality benefit when added to standard therapy). Edema in cirrhosis with ascites. Resistant hypertension. Primary hyperaldosteronism. Off-label: hirsutism in PCOS, acne.",
            citationIDs: ["openfda_cardio2"]
        ),
        mechanism: AttributedProse(
            "Competitive antagonist at the mineralocorticoid (aldosterone) receptor in the distal nephron → increased sodium and water excretion, retention of potassium and hydrogen. Also blocks aldosterone-mediated cardiac fibrosis (hypothesized mechanism for HF mortality benefit).",
            citationIDs: ["openfda_cardio2", "openrn_pharm_cardio2"]
        ),
        dosing: [
            DosingBlock(label: "Heart failure", body: "12.5–25 mg PO daily; max 50 mg daily.", citationIDs: ["openfda_cardio2"]),
            DosingBlock(label: "Hypertension", body: "25–100 mg PO daily.", citationIDs: ["openfda_cardio2"]),
            DosingBlock(label: "Cirrhosis with ascites", body: "100–400 mg PO daily, often with furosemide.", citationIDs: ["openfda_cardio2"])
        ],
        contraindications: AttributedProse(
            "Hyperkalemia (K >5.0). Anuria, acute renal insufficiency. Addison disease. Concurrent eplerenone or potassium supplementation in renal impairment.",
            citationIDs: ["openfda_cardio2"]
        ),
        warnings: [
            AttributedBullet("Hyperkalemia — most serious adverse effect; risk highest with renal impairment, ACEi/ARB, K supplements.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Gynecomastia in men, menstrual irregularities and breast tenderness in women — anti-androgen effect.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Hyponatremia, dehydration.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Acute kidney injury, especially with concurrent NSAID or volume depletion.", citationIDs: ["openfda_cardio2"])
        ],
        adverseReactions: AttributedProse(
            "Hyperkalemia, gynecomastia, hyponatremia, dizziness, GI upset, menstrual changes, hyperchloremic metabolic acidosis (rare).",
            citationIDs: ["openfda_cardio2"]
        ),
        drugInteractions: [
            AttributedBullet("ACE inhibitors, ARBs, ARNI — additive hyperkalemia (especially in renal impairment).", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Potassium supplements, K-containing salt substitutes — hyperkalemia.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Lithium — spironolactone may raise lithium levels.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("NSAIDs — reduce diuretic effect, worsen renal function.", citationIDs: ["openfda_cardio2"]),
            AttributedBullet("Digoxin — assay interference may falsely elevate digoxin levels.", citationIDs: ["openfda_cardio2"])
        ],
        nursingImplications: [
            AttributedBullet("Monitor K and creatinine within 1 week of initiation, then per provider; HOLD if K >5.0 or creatinine rises significantly.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Counsel against K-rich foods in excess, K-containing salt substitutes, K supplements unless directed.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Daily weights for edema/HF indications.", citationIDs: ["openrn_pharm_cardio2"]),
            AttributedBullet("Address gynecomastia or menstrual changes — common reason for discontinuation; eplerenone is alternative.", citationIDs: ["openrn_pharm_cardio2"])
        ],
        patientTeaching: AttributedProse(
            "Take with food. Avoid potassium salt substitutes and high-potassium supplements. Report breast tenderness or swelling, muscle weakness, palpitations, or unusual fatigue.",
            citationIDs: ["openrn_pharm_cardio2"]
        ),
        citations: [openfda, openrn, vaPBM],
        lastSourceFidelityReview: "2026-05-04"
    )
}
