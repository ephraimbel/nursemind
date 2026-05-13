import Foundation

// Curator-model drugs (round 34 — Safe & Effective Care theme: high-alert + reversal agents + K-binders + concentrated electrolytes).

private let openfdaR34 = CitationSource(
    id: "openfda_round34",
    shortName: "FDA SPL labels (DailyMed/openFDA) — R34 panel",
    publisher: "FDA · NLM (DailyMed)",
    license: .publicDomain,
    url: "https://dailymed.nlm.nih.gov/dailymed/",
    lastRetrieved: "2026-05-13"
)
private let openrnPharmR34 = CitationSource(
    id: "openrn_pharm_round34",
    shortName: "Open RN Pharmacology + Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-13"
)
private let ismpR34 = CitationSource(
    id: "ismp_round34",
    shortName: "ISMP high-alert + safe practice fact citations",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/",
    lastRetrieved: "2026-05-13"
)
private let specialtyR34 = CitationSource(
    id: "specialty_round34",
    shortName: "ACC/AHA · ASH · KDIGO · ASRA society fact citations",
    publisher: "ACC · AHA · ASH · KDIGO · ASRA",
    license: .factCitationOnly,
    url: "https://www.acc.org/guidelines/",
    lastRetrieved: "2026-05-13"
)




public enum PotassiumChlorideIVSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "potassium-chloride-iv-concentrated",
        title: "Potassium chloride (IV, concentrated)",
        subtitle: "ISMP TOP-5 HIGH-ALERT · NEVER IV push (fatal cardiac arrest) · ALWAYS diluted + infusion pump + cardiac monitor",
        category: "Electrolyte replacement · essential intracellular cation",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Electrolyte · K+ replacement"),
            KeyValueRow(key: "Use", value: "Hypokalemia treatment + maintenance when oral not feasible; cardiac arrhythmia prevention/treatment (especially digitalis toxicity); DKA + intracellular replacement"),
            KeyValueRow(key: "Dose", value: "ALWAYS DILUTED. Peripheral: max 10 mEq in 100 mL, max rate 10 mEq/hr. Central: up to 40-60 mEq/L, max 20-40 mEq/hr with cardiac monitor + Q1-2H K levels"),
            KeyValueRow(key: "Monitor", value: "K Q1-2H rapid replacement; Mg level (replace first); Cr/BUN; continuous cardiac monitor for >10 mEq/hr OR central OR severe hypoK OR digitalis"),
            KeyValueRow(key: "Watch", value: "HYPERKALEMIA — peaked T → wide QRS → sine wave → V-fib; phlebitis + extravasation tissue damage; NEVER IV push; concentrated KCl WITHDRAWN from clinical floors per ISMP")
        ],
        indications: AttributedProse(
            "Treatment of hypokalemia + maintenance of K balance when oral therapy not feasible; cardiac arrhythmia prevention + treatment (especially in digitalis toxicity); intracellular K replacement in DKA + osmotic diuresis + extracellular shifts. Off-label — torsades de pointes adjunct + post-cardiac surgery per primary source.",
            citationIDs: ["openfda_round34"]
        ),
        mechanism: AttributedProse(
            "Provides exogenous potassium for replacement of cellular + extracellular stores; restores transmembrane K gradient → normal cardiac excitability + skeletal muscle function + nerve transmission.",
            citationIDs: ["openfda_round34"]
        ),
        dosing: [
            DosingBlock(label: "Peripheral routine", body: "10-20 mEq in 100-200 mL diluent (max 40 mEq/L peripheral); max rate 10 mEq/hr; cardiac monitor recommended.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Central urgent", body: "Up to 40-60 mEq/L; max 20-40 mEq/hr; continuous cardiac monitor + Q1-2H K + serum Mg correction.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Maximum", body: "200-400 mEq/24 hours; rarely higher; ICU + cardiac monitor.", citationIDs: ["specialty_round34"]),
            DosingBlock(label: "Oral preferred", body: "40-100 mEq/day in divided doses when feasible; with food + 8 oz water; sustained-release tablets for GI tolerance.", citationIDs: ["openrn_pharm_round34"])
        ],
        contraindications: AttributedProse(
            "Hyperkalemia; severe renal failure (anuric); acute dehydration; heat cramps without first restoring volume; concomitant K-sparing diuretics + ACE-I/ARB without strict monitoring; severe acidosis without correction.",
            citationIDs: ["openfda_round34"]
        ),
        warnings: [
            AttributedBullet("NEVER IV PUSH or BOLUS — fatal cardiac arrest from rapid K shift; ALWAYS DILUTED + infusion pump + verified rate.", citationIDs: ["ismp_round34"]),
            AttributedBullet("ISMP TOP-5 HIGH-ALERT — concentrated KCl WITHDRAWN from clinical floors; pharmacy admixture only; smart pump libraries + alerts; two-RN check.", citationIDs: ["ismp_round34"]),
            AttributedBullet("HYPERKALEMIA — peaked T → wide QRS → sine wave → V-fib + cardiac arrest; emergent calcium + insulin/glucose + dialysis.", citationIDs: ["openfda_round34"]),
            AttributedBullet("PHLEBITIS + EXTRAVASATION — irritating to peripheral veins; CENTRAL access for higher rates + concentrations.", citationIDs: ["openfda_round34"]),
            AttributedBullet("HYPOMAGNESEMIA causes refractory hypokalemia — check + replace Mg first.", citationIDs: ["specialty_round34"]),
            AttributedBullet("RENAL FAILURE + oliguria — reduce dose + close monitoring; avoid in anuria without consultation.", citationIDs: ["openfda_round34"])
        ],
        adverseReactions: AttributedProse(
            "Hyperkalemia (peaked T waves, arrhythmia, cardiac arrest), phlebitis, extravasation tissue damage, pain at infusion site, metabolic acidosis (chloride load), nausea + GI upset (oral).",
            citationIDs: ["openfda_round34"]
        ),
        drugInteractions: [
            AttributedBullet("K-sparing diuretics (spironolactone, eplerenone, amiloride, triamterene) — additive hyperkalemia.", citationIDs: ["openfda_round34"]),
            AttributedBullet("ACE-I + ARB — additive hyperkalemia, especially with renal impairment.", citationIDs: ["openfda_round34"]),
            AttributedBullet("NSAIDs, heparin, cyclosporine, tacrolimus — additive hyperkalemia.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Digoxin — toxicity from low or high K; correlate.", citationIDs: ["openfda_round34"])
        ],
        nursingImplications: [
            AttributedBullet("VERIFY pharmacy-prepared admixture; never bedside dilution; smart pump + cardiac monitor.", citationIDs: ["ismp_round34"]),
            AttributedBullet("Q1-2H K levels for rapid replacement; concurrent Mg replacement.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Central access for rates >10 mEq/hr OR concentration >40 mEq/L.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Site assessment Q1H for phlebitis/extravasation; warm compress + slow rate if discomfort.", citationIDs: ["openfda_round34"])
        ],
        patientTeaching: AttributedProse(
            "We are replacing your potassium through your IV slowly with careful monitoring. Tell us about pain at the IV site, palpitations, dizziness, or muscle weakness. Oral potassium should be taken with food and a full glass of water — do not lie down right after.",
            citationIDs: ["openrn_pharm_round34"]
        ),
        citations: [openfdaR34, openrnPharmR34, ismpR34, specialtyR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HypertonicSalineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "hypertonic-saline-3-percent",
        title: "Hypertonic saline (3% NaCl)",
        subtitle: "Severe symptomatic hyponatremia + cerebral edema · slow correction max 8-12 mEq/L per 24 h · CENTRAL line preferred · ODS prevention",
        category: "Hypertonic crystalloid · Na replacement · osmotic agent",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Hypertonic crystalloid · sodium replacement · osmotic"),
            KeyValueRow(key: "Use", value: "Severe symptomatic hyponatremia (Na <120-125 with neuro symptoms); cerebral edema + increased ICP; SIADH acute"),
            KeyValueRow(key: "Dose", value: "Acute neuro: 100-150 mL 3% NaCl IV bolus over 10-15 min; repeat 1-2x; goal Na +4-6 mEq/L in first hour. ICP: 250-500 mL 3% OR 30-60 mL 23.4%"),
            KeyValueRow(key: "Monitor", value: "Q1-2H Na during correction; cardiac monitor + neuro exam continuous; I/Os; serum + urine osmolality; renal function"),
            KeyValueRow(key: "Watch", value: "OSMOTIC DEMYELINATION SYNDROME (ODS) — irreversible neurologic devastation from rapid correction of CHRONIC hyponatremia; max +8-12 mEq/L per 24 h or +18 per 48 h; relower with D5W/DDAVP if too fast")
        ],
        indications: AttributedProse(
            "Severe symptomatic hyponatremia (Na <120-125) with neurological symptoms (altered mental status, seizures, coma); SIADH-induced acute hyponatremia; cerebral edema + increased ICP (alternative to mannitol); selected trauma/burn resuscitation; 23.4% reserved for ICP bolus per primary source.",
            citationIDs: ["openfda_round34", "specialty_round34"]
        ),
        mechanism: AttributedProse(
            "Hypertonic NaCl creates osmotic gradient — extracts free water from cells (cerebral, systemic) into extracellular space; raises serum Na; reduces brain edema + intracranial pressure.",
            citationIDs: ["specialty_round34"]
        ),
        dosing: [
            DosingBlock(label: "Acute symptomatic hypoNa", body: "100-150 mL 3% NaCl IV bolus over 10-15 min; reassess Na + symptoms; repeat 1-2x as needed; goal +4-6 mEq/L in first hour to relieve symptoms.", citationIDs: ["specialty_round34"]),
            DosingBlock(label: "Maintenance correction", body: "Continuous infusion 0.5-2 mL/kg/hr; max total correction 8-12 mEq/L in 24 hours; 18 mEq/L in 48 hours.", citationIDs: ["specialty_round34"]),
            DosingBlock(label: "ICP/cerebral edema", body: "250-500 mL 3% NaCl OR 30-60 mL 23.4% over 10-30 min; goal serum osmolality 320-340 + Na 145-155.", citationIDs: ["specialty_round34"]),
            DosingBlock(label: "Route", body: "CENTRAL line strongly preferred for prolonged use or higher concentrations; 3% peripheral OK for short bolus; 23.4% CENTRAL only.", citationIDs: ["openfda_round34"])
        ],
        contraindications: AttributedProse(
            "Hypernatremia, hyperchloremia, congestive heart failure, severe renal impairment, asymptomatic chronic hyponatremia (ODS risk from rapid correction).",
            citationIDs: ["openfda_round34"]
        ),
        warnings: [
            AttributedBullet("OSMOTIC DEMYELINATION SYNDROME (ODS) — devastating + irreversible — from overly rapid correction of CHRONIC hyponatremia; dysphagia + paraparesis + coma 1-2 days post-correction.", citationIDs: ["specialty_round34"]),
            AttributedBullet("CHRONIC vs ACUTE distinction critical — chronic (>48 hr) slow correction; acute (<48 hr) can correct more rapidly.", citationIDs: ["specialty_round34"]),
            AttributedBullet("OVERCORRECTION RESCUE — relower Na with D5W ± DDAVP 2-4 mcg SC if too rapid.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Volume overload + CHF + pulmonary edema — especially elderly + cardiomyopathy.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Phlebitis + extravasation + tissue damage; central access preferred.", citationIDs: ["openfda_round34"]),
            AttributedBullet("HIGH-ALERT — verify dose + concentration + route + rate; smart pumps; two-RN check.", citationIDs: ["ismp_round34"])
        ],
        adverseReactions: AttributedProse(
            "Hypernatremia, hyperchloremic acidosis, volume overload, CHF, phlebitis, extravasation tissue damage, coagulopathy/platelet dysfunction at high concentrations, ODS from rapid correction.",
            citationIDs: ["specialty_round34"]
        ),
        drugInteractions: [
            AttributedBullet("Vasopressin/desmopressin — antagonize free water excretion (relower mechanism).", citationIDs: ["specialty_round34"]),
            AttributedBullet("Loop diuretics — synergistic free water clearance.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Other hypertonic solutions — additive osmolarity.", citationIDs: ["specialty_round34"])
        ],
        nursingImplications: [
            AttributedBullet("Q1-2H Na during acute correction; track total mEq/L change per 24 hours.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Continuous cardiac monitor + neuro exam + I/Os strict.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Central line preferred; 3% peripheral for short bolus only; 23.4% CENTRAL only.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Have D5W ± DDAVP ready for overcorrection rescue.", citationIDs: ["specialty_round34"])
        ],
        patientTeaching: AttributedProse(
            "Your sodium is dangerously low and we are correcting it slowly to protect your brain. Family — close monitoring is essential. Long-term we will look for the cause and plan ongoing care.",
            citationIDs: ["openrn_pharm_round34"]
        ),
        citations: [openfdaR34, openrnPharmR34, ismpR34, specialtyR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SPSPolystyreneSulfonateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sodium-polystyrene-sulfonate",
        title: "Sodium polystyrene sulfonate (Kayexalate)",
        subtitle: "Chronic hyperkalemia (NOT emergent) · oral or rectal · slow onset 2-24 h · sodium load · INTESTINAL NECROSIS warning",
        category: "Cation-exchange resin · potassium binder (oral/rectal)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Cation-exchange resin · binds K in GI tract for fecal excretion · exchanges Na for K"),
            KeyValueRow(key: "Use", value: "Hyperkalemia (K >5.5) chronic management; NOT for emergent acute hyperkalemia (slow onset)"),
            KeyValueRow(key: "Dose", value: "Oral 15-30 g in 100-200 mL fluid Q4-6h up to 4x/day; rectal 30-50 g retention enema Q2-6h; onset 2-24 h"),
            KeyValueRow(key: "Monitor", value: "K + Mg + Ca + Na before + after; signs of intestinal injury (pain, distension, bleeding); BP + volume; separate from other oral drugs by 3-6 h"),
            KeyValueRow(key: "Watch", value: "INTESTINAL NECROSIS + perforation BOXED WARNING — especially with sorbitol; AVOID in postop ileus, bowel obstruction, neonates/preterm; sodium load — caution in HF + HTN; constipation common")
        ],
        indications: AttributedProse(
            "Hyperkalemia (K >5.5 mEq/L) for chronic management; most effective in stable CKD patients with persistent hyperkalemia from RAAS inhibitors. NOT for emergent acute hyperkalemia per primary source.",
            citationIDs: ["openfda_round34"]
        ),
        mechanism: AttributedProse(
            "Insoluble cation-exchange resin in intestine — releases Na in exchange for K (and to lesser extent Mg, Ca); K-bound resin excreted in feces; net K removal from body.",
            citationIDs: ["openfda_round34"]
        ),
        dosing: [
            DosingBlock(label: "Oral", body: "15-30 g suspended in 100-200 mL water Q4-6h up to 4 doses/day until K normalized; onset 2-24 h.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Rectal", body: "30-50 g in 100-200 mL retention enema for 30-60 min Q2-6h; emergency option but oral preferred.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Effect", body: "Lowers K ~0.5-1 mEq/L per dose; 1 g SPS ≈ 1 mEq K + 1 mEq Na exchange.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Separation", body: "Separate other oral medications BY 3-6 HOURS — binds many drugs (lithium, levothyroxine).", citationIDs: ["openfda_round34"])
        ],
        contraindications: AttributedProse(
            "Bowel obstruction; postoperative ileus or recent intestinal surgery; severe HTN + volume overload (sodium load); concurrent magnesium hydroxide (binding); pediatric — particularly neonatal/preterm — increased risk of intestinal necrosis.",
            citationIDs: ["openfda_round34"]
        ),
        warnings: [
            AttributedBullet("BOXED WARNING — INTESTINAL NECROSIS + perforation + colonic ischemia — particularly with concurrent sorbitol; AVOID sorbitol coformulation when possible.", citationIDs: ["openfda_round34"]),
            AttributedBullet("NOT FOR EMERGENT acute hyperkalemia — slow onset (2-24 h); combine with rapid-onset treatments (insulin/glucose + calcium + dialysis).", citationIDs: ["specialty_round34"]),
            AttributedBullet("SODIUM LOAD — 1 mEq Na per gram of SPS; volume overload + HTN + HF decompensation risk.", citationIDs: ["openfda_round34"]),
            AttributedBullet("NEWER alternatives (patiromer, sodium zirconium cyclosilicate) increasingly preferred — lower GI risk.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Constipation common — laxatives needed; AVOID sorbitol concurrently.", citationIDs: ["openfda_round34"])
        ],
        adverseReactions: AttributedProse(
            "Intestinal necrosis + perforation (especially with sorbitol), constipation, GI upset, nausea, anorexia, GI ulceration, sodium overload (HTN, edema, HF), hypokalemia, hypomagnesemia, hypocalcemia.",
            citationIDs: ["openfda_round34"]
        ),
        drugInteractions: [
            AttributedBullet("Sorbitol — concurrent intestinal necrosis risk; avoid coformulation when possible.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Magnesium hydroxide + antacids — binds, reduces efficacy + alkalinization risk.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Lithium, levothyroxine, digoxin — binds many oral drugs; separate by 3-6 hours.", citationIDs: ["openfda_round34"]),
            AttributedBullet("K-sparing diuretics + ACE-I/ARB — addresses but doesn't replace optimal RAAS management.", citationIDs: ["specialty_round34"])
        ],
        nursingImplications: [
            AttributedBullet("Verify oral drugs separated by 3-6 hours; review home medications.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Assess for ileus + bowel function before + during therapy.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Monitor K + Mg + Ca + Na + bowel function + volume.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Counsel about constipation + emergent signs (abdominal pain, distension, bleeding).", citationIDs: ["openrn_pharm_round34"])
        ],
        patientTeaching: AttributedProse(
            "This medicine lowers your potassium slowly over hours. Tell us right away about severe abdominal pain, vomiting, or blood in your stool. Take other medications 3-6 hours before or after this dose. Constipation is common — drink fluids and eat fiber.",
            citationIDs: ["openrn_pharm_round34"]
        ),
        citations: [openfdaR34, openrnPharmR34, ismpR34, specialtyR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PatiromerSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "patiromer",
        title: "Patiromer (Veltassa)",
        subtitle: "Chronic hyperkalemia from RAAS inhibition · oral · slow onset 7+ h · no sodium load · enables RAAS continuation",
        category: "Cation-exchange polymer · potassium binder (oral)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Cation-exchange polymer · binds K in GI tract · uses calcium for exchange"),
            KeyValueRow(key: "Use", value: "Hyperkalemia chronic management; enables continued use of evidence-based ACE-I/ARB/MRA in HF + CKD"),
            KeyValueRow(key: "Dose", value: "Start 8.4 g PO daily; titrate by 8.4 g weekly; max 25.2 g once daily; mix powder with water/juice + drink immediately"),
            KeyValueRow(key: "Monitor", value: "K weekly initially + monthly; Mg monthly; renal function; concurrent medication binding"),
            KeyValueRow(key: "Watch", value: "Hypomagnesemia common (~8%); constipation; separate other oral meds by 3 h; expensive ($1500+/month); REFRIGERATE sealed packages; not for emergent")
        ],
        indications: AttributedProse(
            "Hyperkalemia (K >5.0 mEq/L) chronic management; particularly in HF + CKD patients on RAAS inhibitors who would otherwise require RAAS discontinuation; enables continued ACE-I/ARB/MRA per primary source.",
            citationIDs: ["openfda_round34"]
        ),
        mechanism: AttributedProse(
            "Non-absorbable polymer in colon — binds K in exchange for calcium → K-polymer complex excreted in feces; no sodium load; lower GI risk than SPS.",
            citationIDs: ["openfda_round34"]
        ),
        dosing: [
            DosingBlock(label: "Initial", body: "8.4 g PO once daily.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Titration", body: "Increase by 8.4 g weekly as needed; max 25.2 g once daily.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Administration", body: "Mix powder with ~3 oz water (or apple/orange juice); stir + drink immediately; rinse glass + drink rinse; food or fasting OK.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Separation", body: "Separate other oral medications BY 3 HOURS BEFORE OR AFTER.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Storage", body: "REFRIGERATE sealed packages; once mixed, administer immediately.", citationIDs: ["openfda_round34"])
        ],
        contraindications: AttributedProse(
            "Severe constipation; bowel obstruction; abdominal disorders compromising GI motility (relative); severe hypomagnesemia (relative — calcium displaces Mg).",
            citationIDs: ["openfda_round34"]
        ),
        warnings: [
            AttributedBullet("NOT for emergent acute hyperkalemia — slow onset (7+ hours, steady state 1-2 weeks).", citationIDs: ["specialty_round34"]),
            AttributedBullet("HYPOMAGNESEMIA (~8%) — monitor + replace.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Drug binding — separate by 3 hours from other oral medications.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Constipation, diarrhea, nausea common; severe constipation rare.", citationIDs: ["openfda_round34"]),
            AttributedBullet("COST — $1500+/month; insurance preauthorization typically required.", citationIDs: ["specialty_round34"]),
            AttributedBullet("REFRIGERATE sealed packages; do not open until ready to mix.", citationIDs: ["openfda_round34"])
        ],
        adverseReactions: AttributedProse(
            "Constipation, hypomagnesemia, diarrhea, nausea, flatulence, abdominal discomfort, hypokalemia (overcorrection), drug binding interactions.",
            citationIDs: ["openfda_round34"]
        ),
        drugInteractions: [
            AttributedBullet("Levothyroxine, ciprofloxacin, metformin, others — binds many oral drugs; separate by 3 hours.", citationIDs: ["openfda_round34"]),
            AttributedBullet("RAAS inhibitors — patiromer enables continued therapy (intended drug combination).", citationIDs: ["specialty_round34"]),
            AttributedBullet("Magnesium supplements — replace if hypomagnesemia develops.", citationIDs: ["openfda_round34"])
        ],
        nursingImplications: [
            AttributedBullet("Verify oral drug separation 3 hours before/after each dose.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Refrigerate; mix + drink immediately; rinse glass + drink rinse.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Monitor K + Mg trends + RAAS continuation strategy.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Education — adherence + consistent timing + financial assistance referrals.", citationIDs: ["openrn_pharm_round34"])
        ],
        patientTeaching: AttributedProse(
            "This medicine lowers your potassium so you can keep taking your heart medications. Mix with water or juice right before drinking. Take other medicines 3 hours before or after. Tell us about constipation, muscle weakness, or unusual symptoms. Keep the sealed packages in the refrigerator.",
            citationIDs: ["openrn_pharm_round34"]
        ),
        citations: [openfdaR34, openrnPharmR34, ismpR34, specialtyR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SodiumZirconiumCyclosilicateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sodium-zirconium-cyclosilicate",
        title: "Sodium zirconium cyclosilicate (Lokelma)",
        subtitle: "Hyperkalemia · oral · faster onset 1-2 h · selective K binding · small sodium load · use in ED selected · separate other oral drugs by 2 h",
        category: "Inorganic K binder · selective potassium-binding zirconium silicate",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Insoluble inorganic zirconium silicate · selective K binder · exchanges Na for K"),
            KeyValueRow(key: "Use", value: "Hyperkalemia chronic management; faster than other K binders (1-2 h onset); ED-selected acute supplement"),
            KeyValueRow(key: "Dose", value: "Initial 10 g PO TID × 48 hours; maintenance 10 g once daily (range 5-15 g); max 15 g once daily"),
            KeyValueRow(key: "Monitor", value: "K Q24-48 h initially + weekly during titration + monthly maintenance; volume status + edema; renal function"),
            KeyValueRow(key: "Watch", value: "EDEMA (~6-15%) from sodium load (~400 mg/dose) — caution in HF + ESRD; hypokalemia; minimal drug binding interactions (vs SPS, patiromer); separate by 2 h")
        ],
        indications: AttributedProse(
            "Hyperkalemia chronic management; faster onset than patiromer enables more rapid correction + emergency department setting use for mild-moderate hyperkalemia per primary source.",
            citationIDs: ["openfda_round34"]
        ),
        mechanism: AttributedProse(
            "Insoluble inorganic crystalline structure with selective K binding in GI tract; exchanges Na (and H+) for K; selective for K over Mg + Ca (advantage vs SPS, patiromer); minimal binding of other drugs.",
            citationIDs: ["openfda_round34"]
        ),
        dosing: [
            DosingBlock(label: "Initial (acute)", body: "10 g PO TID × 48 hours.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Maintenance", body: "10 g once daily (range 5-15 g); max 15 g once daily.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Administration", body: "Mix powder with ~3 tablespoons (45 mL) water + drink immediately; do not chew; food/fasting OK; onset 1-2 hours.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Separation", body: "Separate other oral medications BY 2 HOURS before or after.", citationIDs: ["openfda_round34"])
        ],
        contraindications: AttributedProse(
            "Bowel obstruction; severe ileus; abdominal pathology compromising GI motility.",
            citationIDs: ["openfda_round34"]
        ),
        warnings: [
            AttributedBullet("EDEMA (~6-15%) — sodium load ~400 mg per 10 g dose; caution in HF + ESRD + volume restriction.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Hypokalemia from overcorrection — monitor.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Minimal drug binding (vs SPS, patiromer) but still separate by 2 hours.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Cost — similar to patiromer ($1500+/month).", citationIDs: ["specialty_round34"]),
            AttributedBullet("Pediatric — limited data; specialty centers.", citationIDs: ["openfda_round34"])
        ],
        adverseReactions: AttributedProse(
            "Edema (sodium load), hypokalemia (overcorrection), constipation, GI upset (less than SPS), drug binding interactions (mild).",
            citationIDs: ["openfda_round34"]
        ),
        drugInteractions: [
            AttributedBullet("Other oral drugs — separate by 2 hours; minimal binding vs SPS/patiromer.", citationIDs: ["openfda_round34"]),
            AttributedBullet("RAAS inhibitors — enables continuation in CKD + HF.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Diuretics — coordinate volume management with sodium load.", citationIDs: ["specialty_round34"])
        ],
        nursingImplications: [
            AttributedBullet("Mix with water (~45 mL); avoid chewing; consistent timing.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Monitor for edema + weight gain + dyspnea (HF decompensation).", citationIDs: ["openfda_round34"]),
            AttributedBullet("Coordinate with diuretic adjustment in fluid-overloaded patients.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Daily K initially; education about RAAS continuation.", citationIDs: ["specialty_round34"])
        ],
        patientTeaching: AttributedProse(
            "This medicine lowers your potassium quickly. Mix with water and drink right away. Take other medicines 2 hours before or after this dose. Report swelling, weight gain, or shortness of breath — there is some salt in this medicine.",
            citationIDs: ["openrn_pharm_round34"]
        ),
        citations: [openfdaR34, openrnPharmR34, ismpR34, specialtyR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NimodipineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "nimodipine",
        title: "Nimodipine",
        subtitle: "SAH vasospasm prevention · ORAL or NG ONLY · NEVER IV (fatal) · 60 mg q4h × 21 days · BLACK BOX route warning",
        category: "Dihydropyridine calcium channel blocker · selective cerebrovascular",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dihydropyridine CCB · selective cerebrovascular vasodilation · neuroprotective in SAH"),
            KeyValueRow(key: "Use", value: "Subarachnoid hemorrhage from ruptured aneurysm — reduces delayed cerebral ischemia from vasospasm"),
            KeyValueRow(key: "Dose", value: "60 mg PO/NG Q4H × 21 days; start within 96 hours of SAH; reduce to 30 mg Q4H for hypotension or cirrhosis"),
            KeyValueRow(key: "Monitor", value: "BP + HR Q1-2H initially + daily; neuro exam serial for vasospasm; LFTs; CYP3A4 interactions"),
            KeyValueRow(key: "Watch", value: "BLACK BOX — NEVER IV (fatal cardiovascular collapse); HYPOTENSION dose-limiting; CYP3A4 interactions (azoles, macrolides, grapefruit) → markedly increase levels; LASA packaging")
        ],
        indications: AttributedProse(
            "Improvement of neurological outcomes in subarachnoid hemorrhage (SAH) from ruptured congenital intracranial aneurysms; reduces severity of delayed cerebral ischemia from vasospasm per primary source.",
            citationIDs: ["openfda_round34"]
        ),
        mechanism: AttributedProse(
            "Lipophilic dihydropyridine CCB with selective cerebrovascular smooth muscle activity → cerebral vasodilation + reduced vasospasm; neuroprotective via reduced Ca-mediated ischemic injury.",
            citationIDs: ["openfda_round34"]
        ),
        dosing: [
            DosingBlock(label: "SAH prophylaxis", body: "60 mg PO or NG every 4 hours × 21 days; start within 96 hours of SAH onset.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Dose reduction", body: "30 mg Q4H for cirrhosis, hypotension, or older age.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "NG administration", body: "Extract liquid from capsule via puncture into syringe (oral solution available); NEVER administer capsule contents via IV route.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Route warning", body: "ORAL or NG ONLY — NEVER IV (FATAL cardiovascular collapse); LASA packaging.", citationIDs: ["ismp_round34"])
        ],
        contraindications: AttributedProse(
            "Severe hepatic dysfunction; concurrent strong CYP3A4 inhibitors (clarithromycin, ketoconazole — increase nimodipine + hypotension); concurrent strong CYP3A4 inducers (rifampin, phenytoin — reduce efficacy).",
            citationIDs: ["openfda_round34"]
        ),
        warnings: [
            AttributedBullet("BLACK BOX — NEVER ADMINISTER IV — FATAL cardiac arrest + cardiovascular collapse + bronchospasm; LASA-prevention packaging.", citationIDs: ["ismp_round34"]),
            AttributedBullet("HYPOTENSION common dose-limiting; reduce dose; cardiac monitor + frequent BP.", citationIDs: ["openfda_round34"]),
            AttributedBullet("CYP3A4 INHIBITORS — clarithromycin, ketoconazole, voriconazole markedly increase nimodipine; AVOID; switch antimicrobial.", citationIDs: ["openfda_round34"]),
            AttributedBullet("GRAPEFRUIT JUICE increases levels — avoid.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Bradycardia + heart block with concurrent beta-blocker or amiodarone.", citationIDs: ["openfda_round34"]),
            AttributedBullet("21-DAY course adherence critical for benefit.", citationIDs: ["specialty_round34"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension, headache, flushing, edema, dizziness, palpitations, bradycardia, GI upset, hepatic enzyme elevation.",
            citationIDs: ["openfda_round34"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, macrolides, protease inhibitors, grapefruit) — avoid or major adjustment.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Strong CYP3A4 inducers (rifampin, carbamazepine, phenytoin) — reduce efficacy; avoid.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Beta-blockers + amiodarone — additive bradycardia/AV block.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Other antihypertensives — additive hypotension.", citationIDs: ["openfda_round34"])
        ],
        nursingImplications: [
            AttributedBullet("VERIFY oral/NG route only — pharmacy + nursing systems prevent inadvertent IV.", citationIDs: ["ismp_round34"]),
            AttributedBullet("BP + HR Q1-2H initially; assess for hypotension + adjust dose.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Serial neuro exam for delayed cerebral ischemia (new deficits, declining LOC).", citationIDs: ["specialty_round34"]),
            AttributedBullet("Screen for CYP3A4 interactions + grapefruit; LFTs baseline + during therapy.", citationIDs: ["openfda_round34"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps protect your brain after a bleed. Take it consistently every 4 hours for 21 days. Avoid grapefruit and grapefruit juice. Tell us about severe headache, dizziness, fainting, or vision changes.",
            citationIDs: ["openrn_pharm_round34"]
        ),
        citations: [openfdaR34, openrnPharmR34, ismpR34, specialtyR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LeucovorinRescueSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "leucovorin-rescue",
        title: "Leucovorin (folinic acid) — high-dose rescue",
        subtitle: "Methotrexate rescue · timing-critical · LASA: leucovorin ≠ levoleucovorin (half dose) · oral not equivalent IV at higher doses",
        category: "Reduced folate · methotrexate antidote · 5-FU enhancer",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Reduced folate (5-formyl-tetrahydrofolate) · bypasses DHFR blockade by methotrexate"),
            KeyValueRow(key: "Use", value: "Methotrexate rescue (HDMTX therapy); folate deficiency; 5-FU enhancement"),
            KeyValueRow(key: "Dose", value: "MTX rescue — 15 mg PO/IM/IV Q6H × 60 hours (10 doses) starting within 24 h of HDMTX; increase for delayed elimination per MTX level"),
            KeyValueRow(key: "Monitor", value: "Serum MTX levels Q12-24H until <0.05 micromol/L; CBC + LFTs + Cr; symptoms (mucositis, GI, renal)"),
            KeyValueRow(key: "Watch", value: "LASA — leucovorin (15 mg) ≠ levoleucovorin (7.5 mg equivalent); oral bioavailability ↓ at higher doses → IV/IM for >40 mg/dose; B12 deficiency masking; allergic reactions rare")
        ],
        indications: AttributedProse(
            "Diminish toxicity + counteract effects of high-dose methotrexate (HDMTX) therapy; reduce serum methotrexate after delayed elimination/nephrotoxicity; folate deficiency (megaloblastic anemia); enhancement of 5-FU antineoplastic activity in colorectal + others; pyrimethamine/trimethoprim folate rescue per primary source.",
            citationIDs: ["openfda_round34", "specialty_round34"]
        ),
        mechanism: AttributedProse(
            "Reduced folate that bypasses dihydrofolate reductase (DHFR) blockade caused by methotrexate; rescues normal cells from DNA synthesis inhibition while cancer cells targeted by MTX experience prolonged exposure; in 5-FU regimens, increases TS-FdUMP-folate ternary complex stability → enhanced antitumor activity.",
            citationIDs: ["openfda_round34"]
        ),
        dosing: [
            DosingBlock(label: "MTX rescue standard", body: "15 mg PO/IM/IV Q6H × 60 hours (10 doses) OR until serum MTX <0.05 micromol/L; start within 24 hours of HDMTX completion.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "MTX rescue escalation", body: "Increase to 50-100 mg Q6H or more for delayed elimination, nephrotoxicity, MTX level >5 micromol/L at 24h, or persistently elevated; nomograms guide.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Folate deficiency", body: "1-5 mg PO daily.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "5-FU enhancement", body: "200 mg/m² IV bolus or infusion; regimen-specific.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Route", body: "PO OK for ≤25 mg dose; IV/IM for >40 mg Q6H (oral bioavailability decreases at higher doses).", citationIDs: ["openfda_round34"])
        ],
        contraindications: AttributedProse(
            "Pernicious anemia (B12 deficiency) — folate masks hematologic improvement without correcting neurologic disease; vitamin B12 deficiency without B12 supplementation; rare hypersensitivity.",
            citationIDs: ["openfda_round34"]
        ),
        warnings: [
            AttributedBullet("LASA — LEUCOVORIN ≠ LEVOLEUCOVORIN; levoleucovorin is L-isomer with half dose equivalence (7.5 mg = 15 mg leucovorin); verify formulation specifically.", citationIDs: ["ismp_round34"]),
            AttributedBullet("MTX rescue is TIME-CRITICAL — start within 24 hours of HDMTX; delayed rescue → severe toxicity + death.", citationIDs: ["specialty_round34"]),
            AttributedBullet("ORAL BIOAVAILABILITY DECREASES at higher doses — IV/IM for >40 mg per dose rescue.", citationIDs: ["openfda_round34"]),
            AttributedBullet("B12 DEFICIENCY masking — check B12 status; folate alone in pernicious anemia → progressive neurologic disease.", citationIDs: ["openfda_round34"]),
            AttributedBullet("5-FU enhancement intentionally increases toxicity — myelosuppression + mucositis + diarrhea.", citationIDs: ["openfda_round34"]),
            AttributedBullet("HIGH-ALERT — rescue protocol verification + serial MTX levels + two-RN check.", citationIDs: ["ismp_round34"])
        ],
        adverseReactions: AttributedProse(
            "Generally well-tolerated; rare allergic reactions (rash, hives, anaphylaxis); rare seizures (pediatric); pulmonary disease + hypotension rare; increases 5-FU toxicity (intended).",
            citationIDs: ["openfda_round34"]
        ),
        drugInteractions: [
            AttributedBullet("Methotrexate — primary intended (rescue).", citationIDs: ["openfda_round34"]),
            AttributedBullet("5-Fluorouracil — synergistic antitumor + enhanced toxicity (intended).", citationIDs: ["openfda_round34"]),
            AttributedBullet("Pyrimethamine + trimethoprim — folate rescue from antifolate effects.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Phenytoin + phenobarbital — folate may reduce anticonvulsant levels.", citationIDs: ["openfda_round34"])
        ],
        nursingImplications: [
            AttributedBullet("Verify formulation (leucovorin vs levoleucovorin) + dose calculation; two-RN check.", citationIDs: ["ismp_round34"]),
            AttributedBullet("Track MTX rescue timing relative to HDMTX completion; Q12-24H MTX levels guide escalation.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Maintain hydration during MTX clearance; alkalinize urine per protocol (sodium bicarbonate).", citationIDs: ["specialty_round34"]),
            AttributedBullet("Monitor for MTX toxicity signs — mucositis, GI, renal, hepatic, hematologic.", citationIDs: ["openfda_round34"])
        ],
        patientTeaching: AttributedProse(
            "This medicine rescues your normal cells from the high-dose chemotherapy. Take every dose on time — this is critical. Tell us about mouth sores, severe nausea, fever, or fatigue. Drink plenty of fluids during your rescue.",
            citationIDs: ["openrn_pharm_round34"]
        ),
        citations: [openfdaR34, openrnPharmR34, ismpR34, specialtyR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ConivaptanSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "conivaptan",
        title: "Conivaptan (Vaprisol)",
        subtitle: "Hospital-IV vasopressin V1A/V2 antagonist · euvolemic/hypervolemic hyponatremia · MAX 4 days · injection reactions · slow correction",
        category: "Vasopressin receptor antagonist (V1A + V2) · aquaretic",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dual V1A + V2 vasopressin antagonist · aquaretic · increases free water excretion"),
            KeyValueRow(key: "Use", value: "Euvolemic + hypervolemic hyponatremia (Na <125) from SIADH + cancer-related + selected HF/cirrhosis"),
            KeyValueRow(key: "Dose", value: "Loading 20 mg IV over 30 min; maintenance 20 mg over 24 h continuous × 1-4 days max; titrate to 40 mg/day for refractory"),
            KeyValueRow(key: "Monitor", value: "Q6-12H Na; vital signs continuous during loading; infusion site (CENTRAL preferred); I/Os strict; CYP3A4 interactions"),
            KeyValueRow(key: "Watch", value: "MAX 4 DAYS hospital therapy; ODS risk if correction >10-12 mEq/L per 24 h; CYP3A4 interactions (azoles, macrolides); central line preferred (injection reactions); alternative — tolvaptan PO for chronic")
        ],
        indications: AttributedProse(
            "Hospital-administered IV treatment for euvolemic + hypervolemic hyponatremia (Na <125 mEq/L) in patients with SIADH; cancer-related SIADH; selected HF + cirrhosis hypervolemic hyponatremia per primary source.",
            citationIDs: ["openfda_round34"]
        ),
        mechanism: AttributedProse(
            "Dual V1A + V2 vasopressin receptor antagonist → blocks renal collecting duct water reabsorption → free water excretion (aquaresis); raises serum Na without affecting electrolyte excretion; minimal effect on intravascular volume.",
            citationIDs: ["openfda_round34"]
        ),
        dosing: [
            DosingBlock(label: "Loading", body: "20 mg IV over 30 minutes (central line preferred).", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Maintenance", body: "20 mg over 24 hours continuous infusion × 1-4 days (max 4 days).", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Refractory", body: "Titrate to 40 mg/day for inadequate response.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Discontinue", body: "When Na reaches 125-130 mEq/L OR symptoms resolve OR 4-day max.", citationIDs: ["openfda_round34"])
        ],
        contraindications: AttributedProse(
            "Hypovolemic hyponatremia; anuria; concurrent strong CYP3A4 inhibitors (ketoconazole, clarithromycin); intolerance to corn syrup (excipient).",
            citationIDs: ["openfda_round34"]
        ),
        warnings: [
            AttributedBullet("MAX 4 DAYS hospital therapy + correction limit + ODS prevention.", citationIDs: ["openfda_round34"]),
            AttributedBullet("OSMOTIC DEMYELINATION SYNDROME (ODS) risk if Na correction >10-12 mEq/L per 24 h; slow correction.", citationIDs: ["specialty_round34"]),
            AttributedBullet("INFUSION SITE REACTIONS — central line preferred; phlebitis + extravasation + tissue damage.", citationIDs: ["openfda_round34"]),
            AttributedBullet("CYP3A4 INTERACTIONS — many drugs (azoles, macrolides, protease inhibitors); check + adjust.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Hypotension + orthostatic — V1A blockade; HF/cirrhosis caution.", citationIDs: ["openfda_round34"]),
            AttributedBullet("HIGH-ALERT — verify diagnosis (euvolemic/hypervolemic, NOT hypovolemic); two-RN check.", citationIDs: ["ismp_round34"])
        ],
        adverseReactions: AttributedProse(
            "Infusion site reactions (phlebitis, extravasation), hypotension, headache, polyuria, thirst, polydipsia, hypokalemia, hyperkalemia or hypernatremia overcorrection, hypersensitivity reactions.",
            citationIDs: ["openfda_round34"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (ketoconazole, clarithromycin) — contraindicated.", citationIDs: ["openfda_round34"]),
            AttributedBullet("CYP3A4 inducers (rifampin, phenytoin) — reduce efficacy.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Other vasopressin antagonists (tolvaptan) — additive aquaresis.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Diuretics — additive volume + electrolyte effects.", citationIDs: ["openfda_round34"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm euvolemic/hypervolemic status (NOT hypovolemic); rule out adrenal/thyroid causes.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Q6-12H Na; track total mEq/L correction over 24 h.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Central line preferred; assess peripheral site Q2H for reactions.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Have D5W ± DDAVP available for overcorrection rescue.", citationIDs: ["specialty_round34"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps your body get rid of extra water to raise your sodium. We give it through a vein in the hospital and watch you closely. Tell us about pain at the IV site, severe thirst, or symptoms changing.",
            citationIDs: ["openrn_pharm_round34"]
        ),
        citations: [openfdaR34, openrnPharmR34, ismpR34, specialtyR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum EvolocumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "evolocumab",
        title: "Evolocumab (Repatha) + PCSK9 inhibitors",
        subtitle: "Refractory hypercholesterolemia + established CV disease + FH · SC q2 weeks or monthly · 50-60% LDL reduction · adjunct to statin · expensive",
        category: "PCSK9 inhibitor · monoclonal antibody lipid-lowering",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Proprotein convertase subtilisin/kexin type 9 (PCSK9) inhibitor monoclonal Ab · enhances LDL receptor recycling"),
            KeyValueRow(key: "Use", value: "Established ASCVD secondary prevention + primary hyperlipidemia + heterozygous + homozygous FH; adjunct to maximal statin"),
            KeyValueRow(key: "Dose", value: "140 mg SC Q2 WEEKS OR 420 mg monthly (3 × 140 mg sequential); HoFH 420 mg Q2 weeks"),
            KeyValueRow(key: "Monitor", value: "Lipid panel 4-12 weeks post initiation + Q3-12 months; ALT/AST baseline; injection site; CV outcomes; statin + ezetimibe continuation"),
            KeyValueRow(key: "Watch", value: "INJECTION REACTIONS (rotate sites, room temp); allergic reactions rare; EXPENSIVE ($14K+/year, insurance preauth); alirocumab + inclisiran alternatives; LDL targets <55-70 mg/dL very-high-risk")
        ],
        indications: AttributedProse(
            "Established cardiovascular disease (secondary prevention — MI, stroke, PAD) for additional CV risk reduction; primary hyperlipidemia + heterozygous familial hypercholesterolemia (HeFH) — adjunct to maximal statin when additional LDL reduction needed; HoFH adjunct therapy per primary source.",
            citationIDs: ["openfda_round34", "specialty_round34"]
        ),
        mechanism: AttributedProse(
            "Fully human monoclonal antibody binds + inhibits PCSK9 → prevents PCSK9-mediated LDL receptor degradation → more LDL receptors on hepatocytes → enhanced LDL-cholesterol clearance from blood → 50-60% additional LDL reduction beyond statin.",
            citationIDs: ["openfda_round34"]
        ),
        dosing: [
            DosingBlock(label: "ASCVD/HeFH", body: "140 mg SC every 2 weeks OR 420 mg monthly (single dose as 3 × 140 mg sequential injections).", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "HoFH", body: "420 mg SC every 2 weeks; OR 420 mg monthly if on LDL apheresis.", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Administration", body: "Refrigerate; allow to warm to room temperature 30+ min before injection; rotate sites (abdomen, thigh, upper arm).", citationIDs: ["openfda_round34"]),
            DosingBlock(label: "Self-injection", body: "Teach + practice with patient; sharps disposal; consistent schedule.", citationIDs: ["openrn_pharm_round34"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to evolocumab or excipients; pregnancy (Category D); breastfeeding (excretion uncertain).",
            citationIDs: ["openfda_round34"]
        ),
        warnings: [
            AttributedBullet("Injection site reactions — local pain, redness, swelling, bruising; rotate sites; room temperature injection.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Allergic reactions + anaphylaxis (rare); hypersensitivity counseling.", citationIDs: ["openfda_round34"]),
            AttributedBullet("EXPENSIVE — $14,000+/year; insurance preauthorization + step therapy typically required.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Pregnancy — Category D; counsel + contraception during therapy.", citationIDs: ["openfda_round34"]),
            AttributedBullet("Neurocognitive effects + diabetes incidence — no causal link confirmed; reassuring data.", citationIDs: ["specialty_round34"]),
            AttributedBullet("CONTINUED statin + ezetimibe + lifestyle critical — PCSK9 is adjunct.", citationIDs: ["specialty_round34"])
        ],
        adverseReactions: AttributedProse(
            "Injection site reactions, URI, influenza-like illness, back pain, allergic reactions (rare), rare anaphylaxis.",
            citationIDs: ["openfda_round34"]
        ),
        drugInteractions: [
            AttributedBullet("Statins + ezetimibe — synergistic LDL lowering (intended combination).", citationIDs: ["specialty_round34"]),
            AttributedBullet("Bempedoic acid + bile acid sequestrants — additive options.", citationIDs: ["specialty_round34"]),
            AttributedBullet("No major drug-drug interactions due to monoclonal Ab mechanism.", citationIDs: ["openfda_round34"])
        ],
        nursingImplications: [
            AttributedBullet("Teach self-injection — refrigeration, warming, site rotation, sharps disposal.", citationIDs: ["openrn_pharm_round34"]),
            AttributedBullet("Verify continued statin + ezetimibe + lifestyle adherence.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Insurance preauthorization + financial assistance navigation.", citationIDs: ["specialty_round34"]),
            AttributedBullet("Pregnancy counseling + contraception.", citationIDs: ["openfda_round34"])
        ],
        patientTeaching: AttributedProse(
            "This medicine lowers your cholesterol when statins alone are not enough. Inject under the skin every 2 weeks or monthly. Keep the pen in the refrigerator and warm to room temperature 30 minutes before injecting. Rotate sites. Continue your other cholesterol medicines and lifestyle changes.",
            citationIDs: ["openrn_pharm_round34"]
        ),
        citations: [openfdaR34, openrnPharmR34, ismpR34, specialtyR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}
