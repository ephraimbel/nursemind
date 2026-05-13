import Foundation

// Curator-model lab entries (round 17 — critical care / acid-base / DKA monitoring).

private let openrnLabsR17 = CitationSource(
    id: "openrn_labs_round17",
    shortName: "Open RN Critical Care + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-04"
)
private let specialtyLabsR17 = CitationSource(
    id: "specialty_labs_round17",
    shortName: "SCCM / ADA / IDSA concept citations",
    publisher: "SCCM · ADA · IDSA",
    license: .factCitationOnly,
    url: "https://www.sccm.org/",
    lastRetrieved: "2026-05-04"
)

private let labsTagsR17 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .acidBase
)

public enum ABGR17Sample {
    public static let entry: LabEntry = LabEntry(
        id: "arterial-blood-gas",
        title: "Arterial blood gas (ABG)",
        subtitle: "pH + PaCO2 + PaO2 + HCO3 + BE · acid-base interpretation · oxygenation",
        specimen: "Arterial whole blood (heparinized syringe; ice if delayed analysis)",
        nclexTags: labsTagsR17,
        referenceRanges: [
            ReferenceRangeRow(value: "pH 7.35–7.45", label: "Normal", citationIDs: ["openrn_labs_round17"]),
            ReferenceRangeRow(value: "PaCO2 35–45 mmHg", label: "Normal", citationIDs: ["openrn_labs_round17"]),
            ReferenceRangeRow(value: "PaO2 80–100 mmHg (room air, sea level)", label: "Normal", citationIDs: ["openrn_labs_round17"]),
            ReferenceRangeRow(value: "HCO3 22–26 mEq/L", label: "Normal", citationIDs: ["openrn_labs_round17"]),
            ReferenceRangeRow(value: "Base excess −2 to +2", label: "Normal", citationIDs: ["openrn_labs_round17"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal acid-base + oxygenation",
                summary: "All values within range; no compensation needed. Continue routine monitoring per primary source.",
                nursingActions: [
                    "Document baseline; continue planned care.",
                    "Recheck per clinical change."
                ],
                citationIDs: ["openrn_labs_round17"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Acid-base disturbance with compensation",
                summary: "Identify primary disturbance (4 categories — respiratory acidosis, respiratory alkalosis, metabolic acidosis, metabolic alkalosis); identify compensatory response; treat underlying cause per primary source.",
                nursingActions: [
                    "Determine primary disturbance using stepwise approach (pH first, then primary, then compensation).",
                    "Calculate anion gap if metabolic acidosis (Na − Cl − HCO3); evaluate gap (MUDPILES) vs non-gap (HARDASS).",
                    "Treat underlying cause — sepsis, DKA, renal failure, vomiting, hyperventilation, hypoventilation.",
                    "Adjust ventilator settings if mechanical ventilation."
                ],
                citationIDs: ["openrn_labs_round17", "specialty_labs_round17"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Severe acid-base disturbance + organ failure risk",
                summary: "pH <7.20 OR >7.60; severe hypoxemia (PaO2 <60) on supplemental O2; or rapid trajectory worsening — life-threatening per primary source.",
                nursingActions: [
                    "ICU admission; consider intubation if respiratory failure.",
                    "Identify reversible causes (toxic ingestion, severe DKA, sepsis, severe renal failure, salicylate, methanol).",
                    "Hemodialysis emergent for severe metabolic acidosis from toxin / uremia.",
                    "Vasopressors + fluid resuscitation for hemodynamic compromise."
                ],
                citationIDs: ["specialty_labs_round17"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Respiratory acidosis (high CO2)",
                causes: ["Hypoventilation (sedation, opioid, neuromuscular)", "COPD / asthma exacerbation", "Pneumonia / ARDS", "Chest wall / muscle failure", "Severe obesity / OHS"],
                citationIDs: ["openrn_labs_round17"]
            ),
            CauseGroup(
                title: "Respiratory alkalosis (low CO2)",
                causes: ["Anxiety / pain", "Sepsis / fever", "Pulmonary embolism", "Salicylate toxicity (early)", "High altitude", "Pregnancy", "CNS disease"],
                citationIDs: ["openrn_labs_round17"]
            ),
            CauseGroup(
                title: "Metabolic acidosis with high anion gap (MUDPILES)",
                causes: ["Methanol", "Uremia", "DKA", "Propylene glycol / paraldehyde", "Iron / INH", "Lactate (sepsis, ischemia)", "Ethylene glycol", "Salicylate"],
                citationIDs: ["openrn_labs_round17"]
            ),
            CauseGroup(
                title: "Metabolic acidosis with normal anion gap (HARDASS)",
                causes: ["Hyperalimentation", "Acetazolamide / Addison's", "Renal tubular acidosis", "Diarrhea", "Acid intake", "Spironolactone", "Saline (large-volume NS)"],
                citationIDs: ["openrn_labs_round17"]
            ),
            CauseGroup(
                title: "Metabolic alkalosis",
                causes: ["Vomiting / NG suction", "Diuretic use", "Hypokalemia", "Hyperaldosteronism", "Excess bicarbonate intake", "Milk-alkali syndrome"],
                citationIDs: ["openrn_labs_round17"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — heparinized arterial syringe; expel air bubbles; ice if not analyzed within 30 minutes.", citationIDs: ["openrn_labs_round17"]),
            AttributedBullet("Allen's test before radial puncture; pressure 5+ minutes after puncture (10 minutes if anticoagulated).", citationIDs: ["openrn_labs_round17"]),
            AttributedBullet("Stepwise interpretation — pH (acidemia / alkalemia) → primary (CO2 vs HCO3) → compensation (appropriate?) → anion gap if acidosis per primary source.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("Calculate expected compensation — Winter's formula for metabolic acidosis: PaCO2 = 1.5 × HCO3 + 8 ± 2.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("Trend lactate + base deficit in shock / sepsis — markers of perfusion + resuscitation response.", citationIDs: ["specialty_labs_round17"])
        ],
        watchFor: [
            AttributedBullet("MIXED disorders — common in critical illness; clinical context guides interpretation.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("Severe metabolic acidosis pH <7.10 — bicarbonate controversial; treat underlying cause first.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("RAPID change in PaCO2 — assess ventilator + ETT placement + airway emergency.", citationIDs: ["openrn_labs_round17"]),
            AttributedBullet("Pulse oximetry vs PaO2 — SpO2 cannot detect supranormal PaO2 (oxygen toxicity in chronic CO2 retainers).", citationIDs: ["openrn_labs_round17"])
        ],
        citations: [openrnLabsR17, specialtyLabsR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum VBGSample {
    public static let entry: LabEntry = LabEntry(
        id: "venous-blood-gas",
        title: "Venous blood gas (VBG)",
        subtitle: "pH + PvCO2 + HCO3 · less invasive than ABG · oxygenation NOT reliable",
        specimen: "Venous whole blood (heparinized; central venous preferred for SvO2 / ScvO2)",
        nclexTags: labsTagsR17,
        referenceRanges: [
            ReferenceRangeRow(value: "pH 7.32–7.42 (slightly lower than arterial)", label: "Normal venous", citationIDs: ["openrn_labs_round17"]),
            ReferenceRangeRow(value: "PvCO2 41–51 mmHg (slightly higher than arterial)", label: "Normal venous", citationIDs: ["openrn_labs_round17"]),
            ReferenceRangeRow(value: "HCO3 22–26 mEq/L (similar to arterial)", label: "Normal", citationIDs: ["openrn_labs_round17"]),
            ReferenceRangeRow(value: "PvO2 30–50 mmHg (NOT reflective of arterial oxygenation)", label: "Normal venous (oxygenation NOT reliable)", citationIDs: ["openrn_labs_round17"]),
            ReferenceRangeRow(value: "Central venous SO2 (ScvO2) 65–75% (sepsis target ≥70%)", label: "Normal", citationIDs: ["specialty_labs_round17"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal pH + HCO3",
                summary: "Acid-base balance acceptable; no urgent intervention. Use VBG as surrogate for ABG when arterial sampling not needed for oxygenation per primary source.",
                nursingActions: [
                    "Continue clinical monitoring; serial VBG to track trends.",
                    "If oxygenation question, obtain ABG OR rely on continuous SpO2."
                ],
                citationIDs: ["openrn_labs_round17"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Acidemia or alkalemia on VBG",
                summary: "VBG pH + HCO3 reliably reflect metabolic acid-base status; PvCO2 correlates within 5 mmHg of arterial in most patients (less reliable in shock / VQ mismatch). Trend over time + clinical correlation per primary source.",
                nursingActions: [
                    "Treat underlying cause (DKA, sepsis, GI losses).",
                    "Confirm with ABG if hemodynamic compromise / respiratory failure / when CO2 critical.",
                    "Track lactate (often included on VBG) for perfusion assessment."
                ],
                citationIDs: ["specialty_labs_round17"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Severe acidemia + lactate elevation + ScvO2 abnormality",
                summary: "Septic shock, cardiogenic shock, severe DKA — coordinated resuscitation per Surviving Sepsis / DKA protocols per primary source.",
                nursingActions: [
                    "Rapid IV fluid resuscitation; vasopressors; insulin + fluids for DKA.",
                    "Trend lactate q2–4h during resuscitation; clearance >20% in 6 hours = better prognosis.",
                    "Consider CRRT for severe metabolic acidosis with renal failure."
                ],
                citationIDs: ["specialty_labs_round17"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "VBG over ABG appropriate when",
                causes: ["DKA monitoring", "Sepsis lactate trending", "Suspected metabolic acidosis without respiratory compromise", "Difficult arterial access", "Pediatric (less invasive)"],
                citationIDs: ["specialty_labs_round17"]
            ),
            CauseGroup(
                title: "ABG preferred over VBG when",
                causes: ["Oxygenation needs (PaO2)", "Severe shock (peripheral venous unreliable)", "Mechanical ventilation titration of FiO2 / PEEP", "Severe respiratory acidosis with elevated PvCO2 — confirm with ABG"],
                citationIDs: ["specialty_labs_round17"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — heparinized syringe; deliver promptly; central preferred for ScvO2 monitoring.", citationIDs: ["openrn_labs_round17"]),
            AttributedBullet("Pearl — pH (V) ≈ pH (A) − 0.03 to 0.05; PvCO2 ≈ PaCO2 + 4–8 mmHg; HCO3 essentially equal per primary source.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("Use trend more than single value; correlate with clinical exam + lactate.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("Lactate clearance — guides resuscitation in sepsis (≥20% in 6 hours = better outcome).", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("ScvO2 — surrogate for cardiac output + tissue O2 utilization in sepsis.", citationIDs: ["specialty_labs_round17"])
        ],
        watchFor: [
            AttributedBullet("In SEVERE SHOCK — VBG underestimates arterial CO2; verify with ABG.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("ScvO2 <65% — inadequate O2 delivery; optimize cardiac output / Hgb / SaO2.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("ScvO2 >75% — sepsis with mitochondrial dysfunction OR over-aggressive O2 / high CO; reassess.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("Lactate failing to clear — reassess source control + perfusion.", citationIDs: ["specialty_labs_round17"])
        ],
        citations: [openrnLabsR17, specialtyLabsR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum BetaHydroxybutyrateSample {
    public static let entry: LabEntry = LabEntry(
        id: "beta-hydroxybutyrate",
        title: "Beta-hydroxybutyrate (β-OHB)",
        subtitle: "Primary ketone in DKA · resolution marker · alternative to urine ketones",
        specimen: "Serum or plasma; bedside meter for point-of-care",
        nclexTags: labsTagsR17,
        referenceRanges: [
            ReferenceRangeRow(value: "<0.6 mmol/L", label: "Normal (no significant ketosis)", citationIDs: ["specialty_labs_round17"]),
            ReferenceRangeRow(value: "0.6–1.5 mmol/L", label: "Mild ketosis (consider DKA workup)", citationIDs: ["specialty_labs_round17"]),
            ReferenceRangeRow(value: "1.5–3.0 mmol/L", label: "Moderate ketosis", citationIDs: ["specialty_labs_round17"]),
            ReferenceRangeRow(value: ">3.0 mmol/L", label: "Severe ketosis — DKA likely", citationIDs: ["specialty_labs_round17"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal β-OHB",
                summary: "No significant ketosis; DKA / starvation / alcoholic ketoacidosis less likely. Routine glucose monitoring sufficient per primary source.",
                nursingActions: [
                    "Continue routine diabetes management.",
                    "Counsel sick-day rules in T1DM."
                ],
                citationIDs: ["specialty_labs_round17"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated β-OHB",
                summary: "Active ketosis; check anion gap + pH + glucose; rule out DKA, alcoholic ketoacidosis, starvation ketosis, ketogenic diet, SGLT2 euglycemic DKA per primary source.",
                nursingActions: [
                    "Obtain VBG for pH + HCO3; calculate anion gap; check glucose.",
                    "Treat per cause — IV fluids + insulin + electrolyte replacement for DKA.",
                    "If on SGLT2 inhibitor — consider euglycemic DKA (normal glucose, elevated ketones, AGM acidosis); stop SGLT2.",
                    "Trend β-OHB to track resolution (more sensitive than urine ketones)."
                ],
                citationIDs: ["specialty_labs_round17"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "β-OHB >3.0 + anion gap acidosis",
                summary: "DKA — emergent management with IV insulin + fluids + electrolyte replacement per ADA protocol per primary source.",
                nursingActions: [
                    "ICU / step-down admission per severity.",
                    "IV fluid resuscitation (NS); insulin infusion 0.1 unit/kg/hr; K+ replacement before / during insulin if K+ <5.5; transition to subcutaneous when DKA resolved.",
                    "Trend β-OHB + glucose + anion gap; resolution defined by gap closure + β-OHB <0.6.",
                    "Identify precipitant (infection, missed insulin, MI, pancreatitis)."
                ],
                citationIDs: ["specialty_labs_round17"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "DKA / hyperglycemic crisis",
                causes: ["Type 1 DM with insulin deficiency", "Type 2 DM under stress (severe infection, MI)", "Euglycemic DKA on SGLT2 inhibitor", "New-onset diabetes presenting in DKA"],
                citationIDs: ["specialty_labs_round17"]
            ),
            CauseGroup(
                title: "Non-DKA ketosis",
                causes: ["Alcoholic ketoacidosis", "Starvation / fasting ketosis", "Ketogenic diet (controlled, mild)", "Pregnancy (modestly increased)", "Severe vomiting / inability to tolerate carbs"],
                citationIDs: ["specialty_labs_round17"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — serum or plasma; point-of-care meter increasingly used (similar to glucose meter).", citationIDs: ["openrn_labs_round17"]),
            AttributedBullet("More accurate than urine ketones — measures predominant ketone (β-OHB); urine acetoacetate may persist after recovery, falsely suggesting ongoing ketosis per primary source.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("ADA recommends β-OHB for diagnosis + monitoring DKA resolution (β-OHB <0.6 = resolved) per primary source.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("SGLT2 EUGLYCEMIC DKA — glucose <250 may mask DKA; check β-OHB if AGM acidosis on SGLT2 per primary source.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("Patient self-monitoring — sick-day β-OHB testing in T1DM with home meter.", citationIDs: ["openrn_labs_round17"])
        ],
        watchFor: [
            AttributedBullet("EUGLYCEMIC DKA on SGLT2 — glucose normal but β-OHB elevated + anion gap acidosis; stop drug + treat per primary source.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("ALCOHOLIC KETOACIDOSIS — IV dextrose + thiamine + fluids (not just insulin).", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("DKA resolution criteria — β-OHB <0.6, anion gap <12, pH >7.30, HCO3 >18, ability to tolerate PO; transition to SQ insulin with overlap.", citationIDs: ["specialty_labs_round17"]),
            AttributedBullet("Pregnancy + ketosis — early intervention to prevent fetal harm.", citationIDs: ["specialty_labs_round17"])
        ],
        citations: [openrnLabsR17, specialtyLabsR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}
