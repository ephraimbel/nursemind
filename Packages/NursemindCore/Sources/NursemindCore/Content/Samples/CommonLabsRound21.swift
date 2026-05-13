import Foundation

// Curator-model lab entries (round 21 — critical care monitoring labs).

private let openrnLabsR21 = CitationSource(
    id: "openrn_labs_round21",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-12"
)
private let specialtyLabsR21 = CitationSource(
    id: "specialty_labs_round21",
    shortName: "SCCM SSC 2021 + AHA / AACE concept citations",
    publisher: "SCCM · AHA · AACE",
    license: .factCitationOnly,
    url: "https://www.sccm.org/Clinical-Resources/Guidelines",
    lastRetrieved: "2026-05-12"
)

private let labsTagsR21 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .perfusion
)

public enum ScvO2Sample {
    public static let entry: LabEntry = LabEntry(
        id: "scvo2",
        title: "Central / mixed venous oxygen saturation (ScvO2 / SvO2)",
        subtitle: "Marker of oxygen delivery vs consumption · low = inadequate DO2 · high = sepsis / shunt",
        specimen: "Central line venous blood (ScvO2 — superior vena cava) OR pulmonary artery catheter (SvO2 — true mixed venous)",
        nclexTags: labsTagsR21,
        referenceRanges: [
            ReferenceRangeRow(value: "ScvO2 70–80%", label: "Normal central venous saturation", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: "SvO2 65–75%", label: "Normal true mixed venous saturation (PA catheter)", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: "<65% (ScvO2) / <60% (SvO2)", label: "Inadequate oxygen delivery — increase DO2 or reduce demand", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: ">80%", label: "Reduced O2 extraction — sepsis, AV shunt, cyanide toxicity, hypothermia, sedation", citationIDs: ["specialty_labs_round21"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "ScvO2 70-80% (normal)",
                summary: "Adequate oxygen delivery relative to consumption. Tissue extracts ~25-30% of delivered oxygen. Use in conjunction with lactate + clinical perfusion markers per primary source.",
                nursingActions: [
                    "Continue current hemodynamic management.",
                    "Reassess if clinical deterioration despite normal value — ScvO2 can be misleading in distributive shock.",
                    "Trend over time more useful than single value."
                ],
                citationIDs: ["specialty_labs_round21"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Low ScvO2 (<65%) — inadequate DO2",
                summary: "Oxygen delivery insufficient for consumption. Increase DO2 — increase cardiac output (fluid, inotropes), increase hemoglobin (transfuse if <7-8), increase SaO2 (oxygen, ventilation). OR reduce demand — sedation, paralysis, antipyretics per primary source.",
                nursingActions: [
                    "Assess components — preload (fluid responsiveness), contractility (inotrope), hemoglobin, SaO2, work of breathing.",
                    "Address modifiable causes — pain, anxiety, fever, work of breathing increase consumption.",
                    "Notify provider; consider escalation of vasoactive / inotrope; transfusion if Hgb <7 (or 8 in cardiac).",
                    "Sedation, paralysis, mechanical ventilation reduce demand in severe cases."
                ],
                citationIDs: ["specialty_labs_round21"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated ScvO2 (>80%)",
                summary: "Reduced tissue extraction — sepsis (microcirculatory dysfunction + mitochondrial failure), AV shunt, cyanide toxicity, hypothermia, deep sedation, or excessive O2 delivery per primary source.",
                nursingActions: [
                    "Assess clinical state — high ScvO2 in shock = ominous (mitochondrial failure / shunting).",
                    "If septic shock + high ScvO2 + high lactate — focus on perfusion improvement; not just DO2.",
                    "Rule out cyanide toxicity if on nitroprusside.",
                    "Trend with lactate for full picture."
                ],
                citationIDs: ["specialty_labs_round21"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Low ScvO2 (<65%)",
                causes: ["Hypovolemia / decreased preload", "Cardiogenic shock / poor contractility", "Anemia (low Hgb)", "Hypoxemia (low SaO2)", "Increased oxygen consumption — fever, shivering, work of breathing, anxiety, pain"],
                citationIDs: ["specialty_labs_round21"]
            ),
            CauseGroup(
                title: "High ScvO2 (>80%)",
                causes: ["Septic shock (microcirculatory failure)", "Cyanide toxicity (nitroprusside)", "AV shunt", "Hypothermia", "Deep sedation / paralysis", "Cirrhosis (hyperdynamic)", "Sample drawn from contaminated lumen during simultaneous infusion"],
                citationIDs: ["specialty_labs_round21"]
            )
        ],
        nursingActions: [
            AttributedBullet("Central venous catheter (CVC) sample — superior vena cava location preferred; ScvO2 approximates SvO2 within 5% per primary source.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("Draw from distal lumen WITHOUT concurrent infusion through that lumen (contamination).", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("Continuous monitoring via oximetric CVC available — useful for septic shock + cardiac surgery.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("Trend with lactate + clinical perfusion + cardiac output for full hemodynamic picture.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("Address modifiable consumption — pain, fever, work of breathing, anxiety.", citationIDs: ["specialty_labs_round21"])
        ],
        watchFor: [
            AttributedBullet("HIGH ScvO2 IN SHOCK — ominous; suggests mitochondrial dysfunction; focus on source control + lactate clearance.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("EARLY GOAL-DIRECTED THERAPY (EGDT) — historical ProCESS / ProMISe / ARISE trials showed ScvO2-targeted resuscitation NOT superior to standard care; ScvO2 useful as one data point per primary source.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("LOW ScvO2 + LOW lactate — usually pure cardiac / volume issue.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("LOW ScvO2 + HIGH lactate — combined deliv + extraction problems; investigate.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("HIGH ScvO2 + HIGH lactate — sepsis with microcirculatory failure; source control + perfusion.", citationIDs: ["specialty_labs_round21"])
        ],
        citations: [openrnLabsR21, specialtyLabsR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum IonizedCalciumSample {
    public static let entry: LabEntry = LabEntry(
        id: "ionized-calcium",
        title: "Ionized (free) calcium",
        subtitle: "Biologically active calcium · NOT corrected for albumin · check in critical illness, MTP, RRT, pH shifts",
        specimen: "Venous or arterial blood; analyzed quickly (avoid air, prolonged stand)",
        nclexTags: labsTagsR21,
        referenceRanges: [
            ReferenceRangeRow(value: "1.10–1.32 mmol/L (4.4–5.3 mg/dL)", label: "Normal ionized calcium", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: "<1.10 mmol/L", label: "Hypocalcemia — symptomatic if rapid drop or severe", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: "<0.9 mmol/L", label: "Severe hypocalcemia — IV replacement; cardiac risk", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: ">1.32 mmol/L", label: "Hypercalcemia — workup for malignancy, hyperparathyroidism", citationIDs: ["specialty_labs_round21"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal ionized Ca",
                summary: "Biologically active calcium adequate. Total calcium may be misleading (low albumin) — ionized is the gold standard especially in critical illness, hypoalbuminemia, acid-base disturbances per primary source.",
                nursingActions: [
                    "No intervention needed.",
                    "Trend in critical illness, especially during MTP / CRRT / parenteral nutrition."
                ],
                citationIDs: ["specialty_labs_round21"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Hypocalcemia (ionized)",
                summary: "Causes — citrate (massive transfusion, plasmapheresis, CRRT), pancreatitis, hypoparathyroidism, vitamin D deficiency, hypomagnesemia, severe sepsis, alkalosis. Symptoms — paresthesias, Trousseau, Chvostek, tetany, prolonged QT, seizures per primary source.",
                nursingActions: [
                    "IV calcium gluconate 1-2 g IV slow for symptomatic / severe.",
                    "Calcium chloride 0.5-1 g IV for life-threatening (more elemental Ca per dose); only via central line.",
                    "Replete magnesium concurrently — hypomagnesemia causes refractory hypocalcemia.",
                    "ECG monitoring — prolonged QT risk; arrhythmia.",
                    "Address underlying — vitamin D, parathyroid eval, citrate accumulation."
                ],
                citationIDs: ["specialty_labs_round21"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Hypercalcemia (ionized)",
                summary: "Causes — primary hyperparathyroidism, malignancy (most common in hospitalized — PTHrP, lytic bone lesions, vitamin D analogs from lymphoma), vitamin D toxicity, thiazides, immobilization, granulomatous disease per primary source.",
                nursingActions: [
                    "IV NS 200-300 mL/hr — first-line for symptomatic / severe hypercalcemia.",
                    "Calcitonin 4 IU/kg q12h IM/SC — rapid temporary effect.",
                    "Zoledronic acid 4 mg IV — for malignancy-associated; onset 2-4 days.",
                    "Denosumab — alternative for refractory.",
                    "Avoid loop diuretics unless volume overloaded (used to be standard; no longer first-line).",
                    "Workup — PTH, PTHrP, vitamin D, SPEP, imaging for malignancy."
                ],
                citationIDs: ["specialty_labs_round21"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Hypocalcemia",
                causes: ["Citrate (MTP, plasmapheresis, CRRT, blood products)", "Acute pancreatitis", "Hypoparathyroidism (post-thyroidectomy, autoimmune)", "Vitamin D deficiency", "Hypomagnesemia", "Severe sepsis", "Alkalosis (shifts Ca to bound)", "Tumor lysis syndrome", "Rhabdomyolysis"],
                citationIDs: ["specialty_labs_round21"]
            ),
            CauseGroup(
                title: "Hypercalcemia",
                causes: ["Primary hyperparathyroidism (most common outpatient)", "Malignancy (most common inpatient)", "Vitamin D toxicity", "Thiazides", "Immobilization", "Granulomatous disease (sarcoidosis, TB)", "Familial hypocalciuric hypercalcemia"],
                citationIDs: ["specialty_labs_round21"]
            )
        ],
        nursingActions: [
            AttributedBullet("IONIZED is true biologically active calcium — preferred over total in critical illness, hypoalbuminemia, acid-base disturbances per primary source.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("Total calcium correction formula (Ca + 0.8 × [4 − albumin]) is unreliable in critical illness — measure ionized directly.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("pH AFFECTS ionized Ca — acidosis decreases protein binding (raises ionized), alkalosis increases binding (lowers ionized).", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("Citrate in blood products + CRRT chelates calcium — supplement during long courses / massive transfusion.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("Replete MAGNESIUM concurrently — hypomagnesemia causes refractory hypocalcemia.", citationIDs: ["specialty_labs_round21"])
        ],
        watchFor: [
            AttributedBullet("MASSIVE TRANSFUSION — citrate accumulates faster than liver can metabolize; check ionized Ca q4 units pRBC OR more frequently.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("CRRT — citrate anticoagulation requires close monitoring; calcium infusion adjusted to maintain ionized.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("PROLONGED QT FROM HYPOCALCEMIA — torsades risk; replete + cardiac monitoring.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("HYPERCALCEMIA + MALIGNANCY — onco emergency; aggressive hydration + bisphosphonates.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("THYROIDECTOMY — postop hypocalcemia common 24-72 hrs; monitor + replete.", citationIDs: ["specialty_labs_round21"])
        ],
        citations: [openrnLabsR21, specialtyLabsR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum DyshemoglobinSample {
    public static let entry: LabEntry = LabEntry(
        id: "dyshemoglobin-panel",
        title: "Carboxyhemoglobin + methemoglobin (CO-oximetry)",
        subtitle: "Dyshemoglobinemia screen · pulse ox unreliable · smoke inhalation + dapsone + benzocaine · methylene blue antidote",
        specimen: "Venous or arterial blood (CO-oximeter analyzer); falsely normal SpO2 if not screened",
        nclexTags: labsTagsR21,
        referenceRanges: [
            ReferenceRangeRow(value: "COHb <2% (non-smoker) / <10% (smoker)", label: "Normal carboxyhemoglobin", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: "COHb 10-20%", label: "Mild CO exposure — headache, nausea", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: "COHb 20-40%", label: "Moderate — confusion, dyspnea, chest pain", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: "COHb >40%", label: "Severe — coma, seizures, cardiac arrest", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: "MetHb <1.5%", label: "Normal methemoglobin", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: "MetHb 1.5-15%", label: "Mild — cyanosis without respiratory distress", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: "MetHb 15-30%", label: "Moderate — headache, fatigue, anxiety", citationIDs: ["specialty_labs_round21"]),
            ReferenceRangeRow(value: "MetHb >30%", label: "Severe — seizures, coma, acidosis; methylene blue indicated", citationIDs: ["specialty_labs_round21"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal CO-oximetry",
                summary: "Adequate oxygen-carrying capacity. SpO2 reliably reflects oxygenation. Continue routine monitoring.",
                nursingActions: [
                    "No specific intervention needed.",
                    "Screen if suspected exposure (smoke inhalation, occupational, suicide attempt)."
                ],
                citationIDs: ["specialty_labs_round21"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Elevated COHb (CO poisoning)",
                summary: "Carbon monoxide binds Hgb with 200-250× affinity vs O2 → reduced O2-carrying capacity + leftward shift of O2-dissociation curve → tissue hypoxia. Pulse ox FALSELY NORMAL (reads COHb as oxyhgb). Causes — fire smoke, faulty heater, vehicle exhaust, methylene chloride per primary source.",
                nursingActions: [
                    "100% O2 via non-rebreather IMMEDIATELY — reduces CO half-life from ~5 hrs (room air) to ~1 hr.",
                    "Hyperbaric O2 — for COHb >25%, neuro symptoms, pregnant, cardiac involvement, age >36, syncope, exposure >24 hrs.",
                    "Concurrent cyanide poisoning common in smoke inhalation — hydroxocobalamin (Cyanokit) consideration.",
                    "Cardiac monitoring; troponin (CO causes myocardial ischemia).",
                    "ABG for acid-base, lactate, MetHb (cyanide poisoning).",
                    "Pregnant — fetal Hgb has higher CO affinity + slower clearance; longer O2 treatment."
                ],
                citationIDs: ["specialty_labs_round21"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Elevated MetHb (methemoglobinemia)",
                summary: "Iron oxidized from Fe2+ to Fe3+ → cannot bind O2 → functional anemia + cyanosis with brown blood. Causes — dapsone, benzocaine spray, prilocaine, nitric oxide, inhaled NO (excessive), nitrates, sulfa drugs, congenital. Pulse ox UNRELIABLE (~85% regardless of true SaO2) per primary source.",
                nursingActions: [
                    "METHYLENE BLUE 1-2 mg/kg IV over 5 min for MetHb >30% or symptomatic per primary source.",
                    "AVOID methylene blue in G6PD deficiency (worsens hemolysis) — use ascorbic acid or exchange transfusion.",
                    "Discontinue offending agent.",
                    "100% O2; supportive care; cardiac monitoring.",
                    "Repeat MetHb after methylene blue; may repeat dose."
                ],
                citationIDs: ["specialty_labs_round21"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Elevated carboxyhemoglobin",
                causes: ["Fire smoke inhalation", "Faulty home heater / generator", "Vehicle exhaust", "Methylene chloride (paint stripper)", "Tobacco / cannabis smoke (10-15% in heavy smokers)"],
                citationIDs: ["specialty_labs_round21"]
            ),
            CauseGroup(
                title: "Elevated methemoglobin",
                causes: ["Dapsone (most common cause hospitalized)", "Benzocaine spray for endoscopy / dental", "Prilocaine (EMLA)", "Nitric oxide / nitrate", "Sulfonamides", "Phenazopyridine", "Inherited (G6PD, NADH-MetHb reductase deficiency)"],
                citationIDs: ["specialty_labs_round21"]
            )
        ],
        nursingActions: [
            AttributedBullet("PULSE OX UNRELIABLE — measures both oxy + carboxy Hgb as \"oxygenated\"; CO-oximetry distinguishes per primary source.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("Suspect CO poisoning — smoke inhalation, faulty heater, suicide attempt, multiple family members ill in same building.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("Suspect methemoglobinemia — cyanosis despite normal SpO2 / PaO2; brown blood; recent benzocaine / dapsone exposure.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("100% O2 immediately for suspected CO — reduces CO half-life dramatically.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("Concurrent CO + cyanide in smoke inhalation — consider hydroxocobalamin.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("Methylene blue 1-2 mg/kg IV for MetHb — but NOT in G6PD; check before giving.", citationIDs: ["specialty_labs_round21"])
        ],
        watchFor: [
            AttributedBullet("DELAYED NEUROLOGIC SEQUELAE (DNS) — 14-40 days post-CO poisoning; cognitive + extrapyramidal; long-term cognitive testing.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("PREGNANCY + CO — extended O2 (4-5× longer than non-pregnant) due to fetal half-life.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("HYPERBARIC OXYGEN — indicated for moderate-severe; transfer to HBO center if available; balance transfer risks.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("BENZOCAINE-INDUCED methemoglobinemia — FDA warning; black-box; avoid in pediatric / repeat use.", citationIDs: ["specialty_labs_round21"]),
            AttributedBullet("DAPSONE for Pneumocystis prophylaxis — chronic methemoglobinemia; methylene blue if severe.", citationIDs: ["specialty_labs_round21"])
        ],
        citations: [openrnLabsR21, specialtyLabsR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}
