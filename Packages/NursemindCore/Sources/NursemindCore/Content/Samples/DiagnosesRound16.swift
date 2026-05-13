import Foundation

// Curator-model diagnosis entries (round 16 — toxicology + dermatology + ID).

private let openrnDxR16 = CitationSource(
    id: "openrn_dx_round16",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=toxicology+dermatology+TB+RMSF",
    lastRetrieved: "2026-05-04"
)
private let specialtyDxR16 = CitationSource(
    id: "specialty_dx_round16",
    shortName: "AACT / IDSA / AAD / ATS guidelines (concept citation)",
    publisher: "AACT · IDSA · AAD · ATS",
    license: .factCitationOnly,
    url: "https://www.acmt.net/clinical-guidelines/",
    lastRetrieved: "2026-05-04"
)

private let toxR16 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .safety)
private let dermR16 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)
private let idR16 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)

public enum TCAToxicitySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tca-toxicity",
        title: "Tricyclic antidepressant (TCA) overdose",
        subtitle: "Anticholinergic + Na-channel blockade · QRS widening + ventricular arrhythmias · sodium bicarb",
        nclexTags: toxR16,
        definition: AttributedProse(
            "Acute toxicity from tricyclic antidepressant ingestion (amitriptyline, nortriptyline, doxepin, imipramine, clomipramine, etc.) — historically common cause of suicide-attempt mortality. Combination of anticholinergic, sodium-channel blockade, α-1 antagonism, and serotonergic effects per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "Cardiac sodium-channel blockade (similar to class IA antiarrhythmics) → wide QRS, ventricular arrhythmias, hypotension. Anticholinergic toxicity → delirium, seizures, mydriasis, urinary retention, hyperthermia. α-1 blockade → vasodilation. Serotonin reuptake inhibition → seizures.",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("Cardiac — wide QRS (>100 ms), prolonged QTc, R wave in aVR >3 mm, ventricular arrhythmias, hypotension.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("CNS — agitation, delirium, hallucinations, seizures, coma; pupillary mydriasis.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Anticholinergic toxidrome — dry mouth, hot dry skin, urinary retention, hyperthermia, decreased bowel sounds.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Acidosis — metabolic + respiratory (worsens cardiac toxicity).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Onset rapid — clinical deterioration possible 1–4 hours after ingestion.", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECG — QRS >100 ms predicts seizures + arrhythmias; R wave aVR >3 mm or R/S aVR >0.7 supports TCA toxicity per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("ABG — track acidosis trend; reflects cardiac toxicity.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Acetaminophen + salicylate co-ingestion screen (universal).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("TCA quant level — confirmatory but slow + not always actionable; clinical management per primary source.", citationIDs: ["specialty_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous cardiac monitoring + serial ECGs; arrhythmia readiness.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Airway / breathing — intubation often required for AMS / seizures.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Toxicology consultation; psychiatric evaluation post-stabilization.", citationIDs: ["specialty_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("SODIUM BICARBONATE IV — first-line for QRS widening / arrhythmia / hypotension; 1–2 mEq/kg bolus then infusion to keep serum pH 7.45–7.55 per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Activated charcoal within 1–2 hours of ingestion if airway protected (no syrup of ipecac).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("IV fluids + vasopressors (norepinephrine preferred) for hypotension.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Benzodiazepines for seizures; AVOID phenytoin (worsens cardiac toxicity); AVOID class IA / IC antiarrhythmics per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Magnesium sulfate for refractory ventricular arrhythmias.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Lipid emulsion 20% — refractory cardiotoxicity; venoarterial ECMO in extremis.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("AVOID physostigmine — risk of asystole + seizures.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Continuous ICU monitoring 24+ hours; observation if asymptomatic + ECG normal at 6 hours.", citationIDs: ["specialty_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("Sudden cardiac arrest — even after stabilization; minimum 24 hour observation.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Seizures — benzodiazepines first-line; AVOID phenytoin per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Aspiration — frequent with reduced consciousness + anticholinergic ileus.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Mental health follow-up — intentional overdose; safety planning + admission.", citationIDs: ["openrn_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum BetaBlockerToxSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "beta-blocker-toxicity",
        title: "Beta-blocker toxicity",
        subtitle: "Bradycardia + hypotension · refractory to atropine · high-dose insulin / glucagon · lipid emulsion",
        nclexTags: toxR16,
        definition: AttributedProse(
            "Acute toxicity from beta-blocker overdose (propranolol, metoprolol, atenolol, carvedilol, etc.). Severity varies by agent — propranolol is most lethal due to lipophilic CNS penetration + sodium-channel blockade per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "β1 blockade → reduced HR + contractility + AV conduction. β2 blockade → bronchospasm + hypoglycemia. Propranolol — Na-channel blockade + CNS penetration → seizures + arrhythmias. Sotalol — K-channel blockade → torsades.",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("Bradycardia, hypotension, AV block (1st-3rd degree), reduced contractility / cardiogenic shock.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Hypoglycemia (especially in children + diabetics on insulin/sulfonylurea).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Bronchospasm (asthma/COPD), wheezing.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Propranolol — seizures, wide QRS (Na-channel block), AMS, coma.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Sotalol — QT prolongation + torsades de pointes.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Onset 1–6 hours; sustained-release products longer (12–24 hours).", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECG — bradycardia, AV block, QRS widening (propranolol), QT prolongation (sotalol).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Glucose, ABG (acidosis), lactate, electrolytes.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Co-ingestion screen — universal acetaminophen + salicylate + TCA.", citationIDs: ["openrn_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous cardiac monitoring; transcutaneous pacing + ECMO availability.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Airway / breathing; mental status; perfusion (lactate trend).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Toxicology + cardiology consultation.", citationIDs: ["specialty_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("ATROPINE — first attempt (often inadequate at high overdose).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("HIGH-DOSE GLUCAGON — 5–10 mg IV bolus then 2–10 mg/hr infusion (cAMP-independent inotropy) per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("HIGH-DOSE INSULIN / EUGLYCEMIC therapy — 1 unit/kg bolus + 0.5–10 units/kg/hr with concurrent dextrose; positive inotropy independent of adrenergic system per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("CALCIUM (1–3 g calcium chloride or 3–9 g calcium gluconate IV) — adjunctive; especially if CCB co-ingestion.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("VASOPRESSORS — norepinephrine, epinephrine for refractory hypotension.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("LIPID EMULSION 20% — for severe refractory toxicity from lipophilic agents (propranolol, carvedilol) per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Sodium bicarbonate for propranolol QRS widening (Na-channel block).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Magnesium for sotalol-induced torsades.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Pacing / ECMO / intra-aortic balloon pump for refractory cardiogenic shock.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Activated charcoal within 1–2 hours; whole-bowel irrigation for sustained-release ingestion.", citationIDs: ["specialty_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("Sustained-release / extended-release — delayed peak; observation 24+ hours.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Hypoglycemia (especially in children) — frequent glucose monitoring.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Co-ingestion with CCB — synergistic; aggressive therapy.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Mental health follow-up — intentional overdose.", citationIDs: ["openrn_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum CCBToxicitySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ccb-toxicity",
        title: "Calcium channel blocker toxicity",
        subtitle: "Bradycardia + vasodilation · HYPERGLYCEMIA · high-dose insulin / euglycemic backbone",
        nclexTags: toxR16,
        definition: AttributedProse(
            "Acute toxicity from calcium channel blocker overdose (verapamil, diltiazem, amlodipine, nifedipine, etc.). Verapamil + diltiazem most lethal (cardiac); dihydropyridines mainly cause hypotension via vasodilation per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "L-type calcium channel blockade in cardiac myocytes (verapamil, diltiazem) → reduced HR + contractility + AV block. In pancreatic β-cells → reduced insulin release + hyperglycemia. In vascular smooth muscle (dihydropyridines) → vasodilation + hypotension.",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("Bradycardia, AV block, hypotension, cardiogenic shock (verapamil, diltiazem).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Reflex tachycardia (early, with dihydropyridines) → progressive hypotension.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("HYPERGLYCEMIA — characteristic; correlates with severity per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("AMS, coma, seizures (severe), end-organ hypoperfusion (lactic acidosis, AKI).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Sustained-release products — delayed peak (12–24 hours); prolonged toxicity.", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECG — bradycardia, AV block, junctional rhythms; rarely QRS / QT changes.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Hyperglycemia + lactate trends — markers of severity.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("ABG, electrolytes (hyperkalemia in severe), creatinine, lipase.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Universal co-ingestion screen.", citationIDs: ["openrn_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous cardiac monitoring; pacing + ECMO availability.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Glucose monitoring (paradoxical hyperglycemia); lactate trend.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Toxicology + cardiology + ICU consultation.", citationIDs: ["specialty_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("HIGH-DOSE INSULIN / EUGLYCEMIC THERAPY — backbone — 1 unit/kg bolus then 0.5–10 units/kg/hr with concurrent dextrose D10–D50 + frequent glucose / K+ monitoring per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("CALCIUM — 1–3 g calcium chloride or 3–9 g gluconate IV; repeat boluses; monitor for hypercalcemia.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("ATROPINE for bradycardia; pacing if refractory.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("VASOPRESSORS — norepinephrine, epinephrine, vasopressin for refractory hypotension.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("HIGH-DOSE GLUCAGON — adjunctive 5–10 mg bolus + 2–10 mg/hr infusion.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("LIPID EMULSION 20% — refractory cardiogenic shock from lipophilic agents (verapamil, amlodipine, nifedipine) per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Methylene blue + ECMO — extreme refractory cases.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Activated charcoal + whole-bowel irrigation (sustained-release products).", citationIDs: ["specialty_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("Hypoglycemia from high-dose insulin — frequent monitoring + dextrose support per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Hypokalemia from insulin therapy — monitor + replete cautiously (don't overcorrect during high-dose insulin).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Sustained-release / amlodipine — prolonged toxicity, delayed peak; observation 24–48 hours.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Mental health follow-up — intentional overdose.", citationIDs: ["openrn_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum LithiumToxicitySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "lithium-toxicity",
        title: "Lithium toxicity",
        subtitle: "Narrow therapeutic · neurologic + cardiac · HEMODIALYSIS for severe",
        nclexTags: toxR16,
        definition: AttributedProse(
            "Acute (overdose), acute-on-chronic, or chronic (most common — therapy with reduced clearance). Severity: mild 1.5–2.5, moderate 2.5–3.5, severe >3.5 mEq/L. Chronic toxicity at lower levels may be more dangerous than acute at higher per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "Lithium replaces sodium intracellularly + interferes with neurotransmitter release. Renally cleared; reduced clearance from dehydration, NSAIDs, ACEi, thiazides, salt restriction → toxicity. Long half-life prolongs toxicity even after stopping.",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("Mild — fine tremor, GI upset, polyuria, fatigue.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Moderate — coarse tremor, ataxia, hyperreflexia, slurred speech, confusion, fasciculations.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Severe — myoclonus, seizures, AMS, coma, hyperthermia, AKI, cardiac arrhythmias, cardiovascular collapse.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Chronic — neurologic symptoms predominate even at modestly elevated levels; \"SILENT\" lithium toxicity in elderly.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Cardiac — bradycardia, AV block, T-wave inversions, QT prolongation.", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum lithium level — q4–6h until trending down; trough recommended; level alone doesn't define severity (clinical correlation) per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("BUN / creatinine, electrolytes, glucose, TSH; ECG.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Recent intake history + duration of therapy; dehydration / drug interactions.", citationIDs: ["openrn_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("Neurologic exam serial — tremor, ataxia, mental status.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Volume status, urine output, renal function.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("ECG + cardiac monitoring; coordinate hemodialysis decision early.", citationIDs: ["specialty_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("STOP lithium immediately; review concurrent meds (NSAIDs, ACEi, thiazides, ARBs).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("AGGRESSIVE IV NS — restore renal clearance; avoid overcorrection of hyponatremia.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Hemodialysis — for severe toxicity (level >4, AMS / seizures / cardiac toxicity), or chronic toxicity with renal dysfunction per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("CRRT considered for hemodynamically unstable.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Activated charcoal NOT effective (lithium not adsorbed).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Whole-bowel irrigation — selected sustained-release ingestions.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Continuous cardiac + ICU monitoring; treat seizures with benzodiazepines.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Repeat levels post-dialysis (rebound from intracellular re-equilibration possible).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Psychiatric consultation; consider regimen change post-recovery.", citationIDs: ["openrn_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("CHRONIC TOXICITY in elderly — mild level + severe symptoms; low threshold for HD.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("REBOUND post-dialysis — repeat levels; may need additional sessions.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Persistent neurologic deficits — \"SILENT\" syndrome of irreversible lithium-induced neurotoxicity (SILENT) per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Diabetes insipidus — chronic Li causes nephrogenic DI; manage fluid + sodium carefully.", citationIDs: ["openrn_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum OrganophosphateSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "organophosphate-poisoning",
        title: "Organophosphate / carbamate poisoning",
        subtitle: "Cholinergic crisis · DUMBELS / SLUDGE · atropine + pralidoxime",
        nclexTags: toxR16,
        definition: AttributedProse(
            "Acute toxicity from organophosphate (pesticides, nerve agents) or carbamate exposure → irreversible (OP — aging) or reversible (carbamate) cholinesterase inhibition. Significant occupational + intentional exposures; nerve agents (sarin, VX) are weaponized OPs per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "Inhibits acetylcholinesterase → ACh accumulates at muscarinic + nicotinic + CNS synapses → cholinergic crisis. OPs irreversibly bind enzyme (\"aging\") if not given pralidoxime in time; carbamates spontaneously hydrolyze.",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("Muscarinic — DUMBELS — Diarrhea, Urination, Miosis, Bradycardia/Bronchospasm/Bronchorrhea, Emesis, Lacrimation, Salivation. (Or SLUDGE-M.)", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Nicotinic — fasciculations, weakness, paralysis, tachycardia (overrides muscarinic), HTN.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("CNS — agitation, seizures, coma, respiratory failure (death from bronchorrhea + paralysis).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Intermediate syndrome — paralysis 24–96 hours post-exposure; cranial nerves + proximal muscles + respiratory.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Delayed peripheral neuropathy — weeks-months after; OP-induced.", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — toxidrome + exposure history.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("RBC AChE + plasma pseudocholinesterase — both reduced; RBC AChE more accurate; not always rapidly available.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("ECG — bradycardia, QT prolongation possible.", citationIDs: ["openrn_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("AIRWAY — copious secretions; suction ready; intubation often needed.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Decontamination — full skin / clothing removal + wash; protect responders with PPE per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Toxicology consultation; nerve-agent considerations if mass casualty.", citationIDs: ["specialty_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("ATROPINE — antidote for muscarinic crisis; 2–5 mg IV q3–5 min until DRYING of secretions (not just HR / pupils); doses can exceed 100 mg per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("PRALIDOXIME (2-PAM) — reverses OP-AChE binding before aging; 30 mg/kg IV bolus then 8 mg/kg/hr infusion; effective for OPs (NOT carbamates — already reversible) per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Benzodiazepines for seizures + agitation; midazolam 5–10 mg IV.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Decontamination — water + soap; consider activated charcoal if ingested + airway protected.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Mechanical ventilation for respiratory failure; PEEP for bronchorrhea + bronchospasm.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Continuous cardiac + ICU monitoring; serial AChE if available.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Avoid succinylcholine — prolonged paralysis from cholinesterase inhibition.", citationIDs: ["specialty_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("INTERMEDIATE SYNDROME — 24–96 hours post-exposure; paralysis without prior muscarinic crisis warning; respiratory monitoring extended.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("DELAYED NEUROPATHY — weeks-months; supportive care.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("DECONTAMINATION FAILURES — secondary exposure of healthcare workers; full PPE + isolation.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Mass casualty / nerve agent — public-health response; antidotes pre-positioned (Mark 1 / DuoDote autoinjectors).", citationIDs: ["specialty_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum SalicylateToxSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "salicylate-toxicity",
        title: "Salicylate (aspirin) toxicity",
        subtitle: "Mixed acid-base · tinnitus + hyperventilation · alkalinization + DIALYSIS",
        nclexTags: toxR16,
        definition: AttributedProse(
            "Acute or chronic toxicity from aspirin / methyl salicylate / bismuth subsalicylate ingestion. Chronic poisoning in elderly often missed (mimics dementia / sepsis). Mixed acid-base derangement is hallmark per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "Stimulates respiratory center (early) → respiratory alkalosis. Uncouples oxidative phosphorylation → metabolic acidosis (lactate, ketones). Direct GI mucosal injury, platelet dysfunction, hypoglycemia, hyperthermia, pulmonary edema (non-cardiogenic).",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("Early — tinnitus / hearing loss, hyperventilation (Kussmaul), nausea / vomiting, fever.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Mixed acid-base — primary respiratory ALKALOSIS + primary metabolic ACIDOSIS (anion gap).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Severe — AMS / coma / seizures, pulmonary edema, hyperthermia, AKI, cardiac arrhythmias.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Children — predominantly metabolic acidosis (no respiratory alkalosis predominance); rapid deterioration.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Chronic in elderly — confusion, hyperventilation, dehydration; missed often.", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Salicylate level — peak 6–12 hours post-ingestion; serial q2h until decreasing; >100 mg/dL severe per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("ABG — mixed disorder; pH variable.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Glucose, electrolytes, BUN/Cr, lactate, ketones; PT/INR (decreased fibrinogen).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Urine pH; chest X-ray (pulmonary edema).", citationIDs: ["openrn_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("Mental status; ABG / serial salicylate levels; volume status.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Identify enteric-coated / Pepto-Bismol / oil of wintergreen ingestion (delayed / prolonged).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Coordinate hemodialysis decisions early.", citationIDs: ["specialty_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("URINARY ALKALINIZATION — sodium bicarbonate IV bolus then infusion to keep urine pH 7.5–8.0; serum pH 7.45–7.55; promotes ionized salicylate elimination per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("AGGRESSIVE IV FLUIDS — replace volume, restore perfusion; avoid hyponatremia.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("HEMODIALYSIS — level >100 mg/dL acute / >40 mg/dL chronic with symptoms; AMS / seizures; renal failure; severe acidosis; pulmonary edema; rising level despite alkalinization per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Glucose — generous; salicylates cause CSF hypoglycemia even with normal serum glucose; D5 in IV fluids.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("POTASSIUM repletion — required for effective alkalinization; hypokalemia → urine acidification.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Activated charcoal within 1–2 hours of ingestion; multi-dose may be useful for sustained-release.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("AVOID intubation if possible — apnea / hypoventilation worsens acidosis; if needed, hyperventilate to maintain pre-intubation respiratory alkalosis per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Vitamin K for prolonged INR (severe ingestion).", citationIDs: ["specialty_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("INTUBATION RISK — acidosis worsens dramatically; ventilate aggressively if intubated.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("CHRONIC TOXICITY in elderly — diagnostic delay common; check salicylate level in confused elderly with hyperventilation.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Pulmonary edema (non-cardiogenic) — may need positive-pressure ventilation.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Mental health follow-up — intentional overdose.", citationIDs: ["openrn_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum COPoisoningSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "carbon-monoxide-poisoning",
        title: "Carbon monoxide poisoning",
        subtitle: "Hypoxia at cellular level · 100% O2 · HBO for severe · pulse-ox falsely normal",
        nclexTags: toxR16,
        definition: AttributedProse(
            "Toxicity from inhaled CO (smoke, faulty furnaces, motor exhaust, charcoal indoors). Common in winter, fires, suicide attempts. CO has 200× higher affinity for hemoglobin than O2 → tissue hypoxia + cellular toxicity per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "Carboxyhemoglobin (COHb) shifts oxyhemoglobin curve LEFT + reduces O2-carrying capacity. CO also binds cytochrome oxidase → impairs oxidative phosphorylation. Delayed neurologic sequelae (DNS) 2–40 days post-exposure.",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("Mild — headache (most common), nausea, dizziness, fatigue, flu-like (often misdiagnosed).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Moderate — confusion, syncope, chest pain, dyspnea.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Severe — coma, seizures, AMS, cardiac ischemia / arrhythmia, lactic acidosis.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Cherry-red skin — late finding, postmortem; not reliable.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Multiple household members with similar symptoms — high suspicion for shared CO source.", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CO-OXIMETRY (arterial or venous) — measures COHb directly; standard pulse oximetry is FALSELY NORMAL (cannot distinguish COHb from O2Hb) per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Smokers — baseline 5–10%; non-smokers 0–3%; COHb >25% severe; >40% can be lethal.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("ABG — metabolic acidosis (lactate); PaO2 normal (dissolved O2 normal).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("ECG, troponin — cardiac ischemia.", citationIDs: ["openrn_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("Remove from CO source; pre-hospital high-flow O2 via NRB.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Mental status, cardiac symptoms, pregnancy.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Coordinate hyperbaric oxygen (HBO) therapy decision early.", citationIDs: ["specialty_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("100% O2 via NRB — first-line; reduces CO half-life from 4–6 hours (room air) to ~1 hour per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("HYPERBARIC OXYGEN (HBO) — for severe — coma, seizures, AMS, cardiac ischemia, COHb >25% (or >15% in pregnancy), pH <7.1, persistent symptoms after 4 hours of 100% O2 per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("HBO reduces incidence of delayed neurologic sequelae per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Treat associated injuries (burns, smoke inhalation), cyanide co-poisoning (consider hydroxocobalamin).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Cardiac monitoring; troponin.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Pregnancy — fetal COHb higher + slower clearance; lower threshold for HBO per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Ensure home CO source identified + remediated; CO detector education.", citationIDs: ["openrn_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("DELAYED NEUROLOGIC SEQUELAE (DNS) — 2–40 days post-exposure; cognitive / mood / motor changes; counsel + follow-up.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Cyanide co-toxicity in fires — hydroxocobalamin administration.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Pulse oximetry falsely normal — do not trust normal SpO2.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Pregnancy — fetal harm from CO is significant; HBO lower threshold.", citationIDs: ["specialty_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum APAPToxicitySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "apap-toxicity",
        title: "Acetaminophen (APAP) overdose",
        subtitle: "NAPQI hepatotoxicity · Rumack-Matthew nomogram · NAC antidote",
        nclexTags: toxR16,
        definition: AttributedProse(
            "Acute or chronic toxicity from acetaminophen ingestion → most common cause of acute liver failure in US. Treatable if recognized early. Toxic dose >150 mg/kg or >7.5 g acutely; chronic overuse with risk factors at lower doses per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "APAP normally metabolized by glucuronidation/sulfation; small amount → CYP2E1 → NAPQI (toxic) → conjugated by glutathione (GSH). Overdose depletes GSH → NAPQI binds hepatocyte proteins → centrilobular necrosis. NAC restores GSH.",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("Stage 1 (0–24 hr) — asymptomatic OR mild GI (nausea, vomiting, diaphoresis); often normal labs.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Stage 2 (24–72 hr) — RUQ pain, transaminitis (AST > ALT typically), prolonged INR.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Stage 3 (72–96 hr) — peak hepatic injury — fulminant hepatic failure, encephalopathy, coagulopathy, AKI, lactic acidosis, hypoglycemia, sepsis.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Stage 4 (4–14 days) — recovery OR multi-organ failure / death; transplant evaluation if criteria met.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Chronic / staggered — variable presentation; can have severe injury without acute spike.", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("APAP level — at 4 hours post-ingestion (or earliest available); plot on RUMACK-MATTHEW nomogram for treatment line per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("LFTs (AST, ALT, total bilirubin), INR, glucose, BUN/Cr, lactate, ABG.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Universal salicylate + ASA + co-ingestion screen.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("KING'S COLLEGE CRITERIA — for transplant referral (pH <7.3 OR INR >6.5 + creatinine >3.4 + grade 3-4 encephalopathy).", citationIDs: ["specialty_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("Time + amount of ingestion (acute vs staggered); concurrent products (combination meds).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Mental status, hemodynamics, glucose, coagulation.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Toxicology + hepatology + transplant team consultation.", citationIDs: ["specialty_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("N-ACETYLCYSTEINE (NAC) — antidote; effective when started within 8 hours; benefit persists even at 24–72 hours per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("IV NAC — 21-hour 3-bag protocol — 150 mg/kg over 1 hour, then 50 mg/kg over 4 hours, then 100 mg/kg over 16 hours per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("PO NAC — 72-hour protocol — 140 mg/kg loading, then 70 mg/kg q4h × 17 doses (rotten-egg taste).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Decision to treat — APAP level on Rumack-Matthew above treatment line; treat empirically if level pending + high risk.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Activated charcoal within 1–2 hours of ingestion; concurrent with NAC OK.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Supportive care — IV fluids, dextrose for hypoglycemia, FFP / Vit K for coagulopathy (if bleeding).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Liver transplant — King's College criteria; coordinate early.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Mental health follow-up; safety planning.", citationIDs: ["openrn_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("DELAYED HEPATIC INJURY — even with normal early labs; NAC maximally effective <8 hours post-ingestion; treat now per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("STAGGERED / CHRONIC INGESTION — nomogram doesn't apply; treat based on labs + clinical.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("ANAPHYLACTOID reactions to IV NAC — slow rate; antihistamine; do not stop NAC.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("FULMINANT FAILURE — transplant referral early per King's College.", citationIDs: ["openrn_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum CellulitisDermSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cellulitis-derm",
        title: "Cellulitis",
        subtitle: "Skin + subQ infection · group A strep + S. aureus · cephalexin / TMP-SMX",
        nclexTags: dermR16,
        definition: AttributedProse(
            "Acute bacterial infection of skin + subcutaneous tissue, usually caused by Streptococcus pyogenes (most common) or Staphylococcus aureus (including MRSA). Erysipelas is a more superficial form with sharp demarcation per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "Bacterial entry through skin breach (trauma, tinea, eczema, lymphedema, IV access) → spread through dermis + subcutaneous tissue → inflammation → erythema, warmth, edema, pain.",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("Acute onset spreading erythema, warmth, tenderness, edema; ill-defined borders.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Fever, chills, fatigue (systemic involvement).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Lymphangitic streaks, regional lymphadenopathy.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Lower extremities most common (chronic edema, tinea pedis); mark borders to track progression.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Erysipelas — sharply demarcated, raised, indurated; typically face / ears / lower extremity.", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis — typical appearance + risk factors; cultures rarely productive (skin only); blood cultures if systemic / immunocompromised per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("CBC / inflammatory markers — variable; not necessary for uncomplicated.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Imaging — ultrasound / CT to rule out abscess, necrotizing infection, DVT (mimics).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Differentiate from VENOUS STASIS (chronic, bilateral, no fever) and DVT.", citationIDs: ["openrn_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("Mark erythema borders for tracking; document portal of entry.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Severity — afebrile + minimal systemic = outpatient; fever, hypotension, rapid progression, tissue necrosis = admission.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Comorbidities — diabetes, lymphedema, immunosuppression, IVDU.", citationIDs: ["openrn_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("Outpatient (non-purulent, no MRSA risk) — cephalexin 500 mg PO QID OR dicloxacillin × 5–10 days per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Outpatient + MRSA risk (IVDU, prior MRSA, abscess) — TMP-SMX OR doxycycline × 5–10 days; add to GAS coverage if needed.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Severe / inpatient — IV cefazolin OR vancomycin (MRSA-suspected) per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Erysipelas — penicillin V / amoxicillin (almost always GAS).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Elevation of affected limb; analgesia; treat tinea pedis (common portal of entry).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Drain abscess (incision + drainage); culture purulent material.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Recurrent — long-term penicillin prophylaxis; address lymphedema; aggressive tinea treatment.", citationIDs: ["specialty_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("NECROTIZING FASCIITIS — pain out of proportion, rapid progression, systemic toxicity, skin necrosis / bullae / crepitus → emergent surgical debridement + broad-spectrum abx per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Staph toxic shock; group A strep STSS — multi-system toxicity.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Septic arthritis / osteomyelitis if joint involvement.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Diabetic foot infections — multi-organism, often bone involvement.", citationIDs: ["openrn_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum HerpesZosterSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "herpes-zoster-shingles",
        title: "Herpes zoster (shingles)",
        subtitle: "VZV reactivation · dermatomal vesicular rash · antiviral within 72 hours · post-herpetic neuralgia",
        nclexTags: dermR16,
        definition: AttributedProse(
            "Reactivation of varicella-zoster virus latent in dorsal root ganglia → painful vesicular dermatomal rash. Lifetime risk ~30%; rises with age + immunosuppression. Post-herpetic neuralgia (PHN) is most common chronic complication per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "Primary varicella → virus establishes latency in sensory ganglia → reactivation when cell-mediated immunity wanes (age, stress, immunosuppression) → travels along sensory nerve → vesicular rash in single dermatome (occasionally crosses midline).",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("Prodrome — pain, paresthesia, pruritus, allodynia 1–3 days before rash.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("DERMATOMAL grouped vesicles on erythematous base; usually unilateral, does not cross midline; thoracic > lumbar > cervical > trigeminal.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Vesicles → pustules → crusts over 7–10 days.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Constitutional — fever, headache, fatigue (mild).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("HZ ophthalmicus (V1) — Hutchinson sign (nasal tip lesions); sight-threatening; emergent ophthalmology.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Ramsay Hunt — facial nerve + ear vesicles + paralysis + tinnitus + vertigo.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Disseminated zoster — >2 dermatomes / visceral involvement → immunocompromised; airborne precautions.", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — typical dermatomal vesicular eruption; PCR of vesicle fluid confirms in atypical / severe cases.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("DFA / Tzanck no longer routine.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("HIV testing if zoster in young adult / atypical / disseminated per primary source.", citationIDs: ["specialty_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("Onset of rash — antiviral effective if started ≤72 hours.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Eye involvement (V1 / Hutchinson sign) → emergent ophthalmology.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Pain severity (PHN risk); immunocompromised status.", citationIDs: ["openrn_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("VALACYCLOVIR 1 g PO TID × 7 days OR famciclovir 500 mg TID × 7 days OR acyclovir 800 mg 5×/day × 7–10 days; START WITHIN 72 HOURS of rash onset for benefit per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Severe / disseminated / immunocompromised — IV acyclovir 10 mg/kg q8h (renal adjust) per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Pain control — acetaminophen, NSAIDs, gabapentin, opioids if severe.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Adjunctive corticosteroids — controversial; may reduce acute pain; not for routine.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Eye involvement — emergent ophthalmology; topical antivirals; specialty management.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Vaccination AFTER recovery — Shingrix (recombinant zoster vaccine) — 2-dose series prevents recurrence per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Standard precautions for localized; airborne / contact for disseminated or immunocompromised hosts; avoid exposure to seronegative pregnant + immunocompromised contacts until crusted.", citationIDs: ["openrn_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("POST-HERPETIC NEURALGIA — pain >90 days post-rash; treat with gabapentin / pregabalin / TCA / lidocaine patch / capsaicin per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("HZ OPHTHALMICUS — keratitis, uveitis, retinitis; sight-threatening; emergent ophthalmology.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("DISSEMINATED ZOSTER — immunocompromised; airborne precautions; IV acyclovir.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("HZ in young / disseminated → screen for HIV / underlying immunosuppression.", citationIDs: ["specialty_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AtopicDermatitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "eczema-atopic",
        title: "Atopic dermatitis (eczema)",
        subtitle: "Pruritic chronic relapsing dermatitis · atopy · emollients + topical steroid · dupilumab",
        nclexTags: dermR16,
        definition: AttributedProse(
            "Chronic relapsing inflammatory skin disorder characterized by pruritus + eczematous lesions in age-typical distribution. Strong association with atopic march (asthma, allergic rhinitis, food allergy). 90% present before age 5 per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "Skin barrier dysfunction (filaggrin gene defects) + Th2-skewed immune response (IL-4, IL-13, IL-31) → dry skin, increased water loss, allergen / microbe penetration → inflammation + pruritus → scratch-itch cycle.",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("PRURITUS — hallmark; intense, often disrupts sleep.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Infants — face, scalp, extensor surfaces; spares diaper area.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Children / adults — flexural surfaces (antecubital, popliteal, neck, wrists, ankles).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Acute — erythematous papulovesicles + weeping + crusting; chronic — lichenification + hyperpigmentation + thickening.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Personal / family atopy (asthma, allergic rhinitis, food allergy).", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — pruritus + typical morphology + age-appropriate distribution + chronic / relapsing course + atopic history per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Biopsy rarely needed.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Allergy testing — selective; for severe / refractory / suspected food allergy.", citationIDs: ["openrn_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity — body surface area + intensity (SCORAD / EASI in research); QoL impact.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Triggers — environmental, fragrances, fabrics, foods (selected); stress; xerosis.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Secondary infection — impetigo, eczema herpeticum, severe Staph colonization.", citationIDs: ["openrn_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("EMOLLIENTS — daily, generously, immediately after bathing; thick (Cetaphil, CeraVe, Eucerin, petroleum) per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("TOPICAL CORTICOSTEROIDS — first-line for flares; potency matched to body area + severity (low-potency on face / folds; mid-high on trunk / limbs); short-term per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Topical calcineurin inhibitors (tacrolimus, pimecrolimus) — steroid-sparing; face / folds; eyelids.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Topical PDE4 inhibitor (crisaborole) and topical JAK inhibitor (ruxolitinib) — newer steroid-sparing options.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Oral antihistamines (sedating) for pruritus / sleep; non-sedating if itch-related.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("DUPILUMAB (anti-IL-4Rα) — moderate-severe refractory; SQ injection; FDA-approved adults + pediatrics ≥6 months per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Oral JAK inhibitors (upadacitinib, abrocitinib) — moderate-severe; black box warnings shared with other JAKi.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Phototherapy (NB-UVB) for moderate-severe.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Bleach baths 0.005% × 2/week — reduces Staph load + flare severity; counsel safe technique.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Trigger avoidance — fragrance-free products, soft fabrics, cool environment; stress management.", citationIDs: ["openrn_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("ECZEMA HERPETICUM — eczema + monomorphic punched-out vesicles + fever + systemic symptoms; emergent IV acyclovir + hospital admission per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("BACTERIAL SUPERINFECTION — Staph aureus colonization → impetigo / cellulitis; topical / oral abx as needed.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Steroid atrophy — face, folds, prolonged use; rotate to non-steroidal alternatives.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Mental health impact — sleep disruption, anxiety, depression; treat holistically.", citationIDs: ["openrn_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum DRESSSyndromeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "dress-syndrome",
        title: "DRESS syndrome",
        subtitle: "Severe drug reaction · rash + fever + eos + organ involvement · stop offender + steroids",
        nclexTags: dermR16,
        definition: AttributedProse(
            "Drug Reaction with Eosinophilia and Systemic Symptoms — severe delayed (2–8 weeks) hypersensitivity reaction to medications. Mortality ~10%. Common offenders — anticonvulsants (lamotrigine, carbamazepine, phenytoin), allopurinol, sulfonamides, vancomycin, dapsone, minocycline per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "Genetic susceptibility (HLA alleles) + drug-specific T-cell response + reactivation of HHV-6 / HHV-7 / EBV → systemic inflammation + organ infiltration.",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("Onset 2–8 weeks after drug initiation (longer than other severe cutaneous adverse reactions).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Fever (>38°C); diffuse maculopapular rash (often >50% BSA); facial edema (especially periorbital).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("LYMPHADENOPATHY — generalized.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("HEMATOLOGIC — eosinophilia (>1500), atypical lymphocytes, leukopenia, thrombocytopenia.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("ORGAN INVOLVEMENT — hepatitis (most common, sometimes fatal), nephritis, pneumonitis, myocarditis, encephalitis, thyroiditis.", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("RegiSCAR criteria — drug exposure 2–8 weeks before; ≥3 of: hospitalization, fever, lymphadenopathy, eosinophilia / atypical lymphocytes, organ involvement, skin involvement >50% per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Labs — CBC + differential (eosinophilia + atypical lymph), LFTs, BUN/Cr, urinalysis, troponin, TSH; HHV-6 serology; HLA testing in selected drugs.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Differentiate from SJS/TEN (mucocutaneous, faster), AGEP (pustular, faster), staph TSS, viral infection.", citationIDs: ["openrn_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify culprit drug (timing 2–8 weeks); cross-reactivity with similar agents.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Organ involvement — LFTs, creatinine, troponin, TSH; serial monitoring.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Severity — RegiSCAR scoring; ICU admission if hepatic / cardiac / renal involvement.", citationIDs: ["specialty_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("STOP CULPRIT DRUG immediately; document permanent allergy; counsel cross-reactivity (especially aromatic anticonvulsants).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("SYSTEMIC CORTICOSTEROIDS — prednisone 0.5–1 mg/kg/day; slow taper over 6–8 weeks (rapid taper → relapse) per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Severe / refractory — pulse methylprednisolone, IVIG, cyclosporine; specialty consultation.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Supportive — IV fluids, electrolytes, organ-specific support; ICU for severe.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Topical corticosteroids + emollients for skin.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Avoid additional drugs from same class (cross-reactivity).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Endocrine follow-up (autoimmune thyroiditis, T1DM 3–6 months post-recovery).", citationIDs: ["specialty_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("FATAL HEPATITIS — most common cause of death; trend LFTs aggressively.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("MYOCARDITIS — chest pain, ECG changes, troponin elevation; cardiac MRI.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("STEROID TAPER RELAPSE — slow taper; close follow-up.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("LATE AUTOIMMUNE — thyroiditis, T1DM, vitiligo, lupus 3–6 months after; long-term follow-up.", citationIDs: ["specialty_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum ActiveTBSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tb-active",
        title: "Active tuberculosis (pulmonary)",
        subtitle: "M. tuberculosis · cough + B symptoms · airborne isolation · RIPE × 2 + RI × 4",
        nclexTags: idR16,
        definition: AttributedProse(
            "Active disease from Mycobacterium tuberculosis — most commonly pulmonary; can affect any organ. Diagnosis based on positive AFB smear / culture / NAAT + clinical / radiographic findings. Public health priority — DOT therapy + contact tracing per primary source.",
            citationIDs: ["openrn_dx_round16", "specialty_dx_round16"]
        ),
        pathophysiology: AttributedProse(
            "Inhalation of droplet nuclei → primary infection in lung → containment by cell-mediated immunity (95%) → latent infection. Reactivation when immunity wanes (HIV, immunosuppression, steroids, biologics, age) → active disease.",
            citationIDs: ["openrn_dx_round16"]
        ),
        presentation: [
            AttributedBullet("Cough >3 weeks (often productive, sometimes hemoptysis).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("B symptoms — fever, night sweats, weight loss, fatigue.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Chest X-ray — apical / posterior infiltrates, cavities, miliary pattern, hilar adenopathy.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Extrapulmonary — lymphadenitis (scrofula), pleuritis, pericarditis, meningitis, GU, bone (Pott's).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Risk factors — HIV, foreign-born from high-prevalence countries, homelessness, IV drug use, healthcare workers, prison, recent contact.", citationIDs: ["openrn_dx_round16"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Sputum × 3 — AFB smear, culture, NAAT (rapid). NAAT confirms TB + rifampin resistance per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Drug susceptibility testing — phenotypic + genotypic (Xpert MTB/RIF, line probe).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Chest imaging — XR + CT for cavitation, lymphadenopathy.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Test for HIV; LTBI screening of contacts.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("IGRA (QuantiFERON, T-SPOT) or TST — exposure / latent infection (NOT active disease confirmation).", citationIDs: ["specialty_dx_round16"])
        ],
        priorityAssessments: [
            AttributedBullet("AIRBORNE ISOLATION — N95, negative-pressure room until on therapy + smear-negative × 3 (or per facility).", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("Public health notification (mandatory reporting); contact tracing.", citationIDs: ["openrn_dx_round16"]),
            AttributedBullet("HIV testing; pregnancy testing; baseline LFTs / CBC / vision.", citationIDs: ["specialty_dx_round16"])
        ],
        commonInterventions: [
            AttributedBullet("RIPE × 2 months intensive phase — rifampin + INH + pyrazinamide + ethambutol per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Continuation phase × 4 months — rifampin + INH (RI); 7 months if cavitary + positive 2-month culture.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("DIRECTLY OBSERVED THERAPY (DOT) — gold standard for adherence; reduces resistance + treatment failure per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("PYRIDOXINE (B6) 25–50 mg daily with INH (prevents peripheral neuropathy).", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("MDR-TB / XDR-TB — extended regimens (bedaquiline, linezolid, clofazimine, fluoroquinolones, etc.) ≥18 months; specialty management per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Steroids — adjunctive for tuberculous meningitis + pericarditis per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("HIV co-infection — coordinate ART (drug interactions with rifampin); IRIS risk; specialty management.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("Latent TB infection — INH 6–9 months OR 3HP (INH + rifapentine weekly × 12 weeks) OR rifampin × 4 months.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("BCG vaccine — limited use in US; adolescent boost protocols vary internationally.", citationIDs: ["specialty_dx_round16"])
        ],
        watchFor: [
            AttributedBullet("DRUG-INDUCED HEPATOTOXICITY — INH + RIF + PZA additive; baseline + monthly LFTs; discontinue if severe per primary source.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("MDR / XDR — late diagnosis, treatment failure; resistance testing essential.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("PREGNANCY — RIPE generally safe (PZA debated); monitor closely.", citationIDs: ["specialty_dx_round16"]),
            AttributedBullet("HIV co-infection — IRIS within first 3 months of ART; aggressive monitoring.", citationIDs: ["specialty_dx_round16"])
        ],
        citations: [openrnDxR16, specialtyDxR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}
