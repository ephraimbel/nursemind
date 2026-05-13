import Foundation

// Curator-model diagnosis entries.
// Sources: Open RN Medical-Surgical Nursing (CC BY 4.0), Open RN Health Alterations (CC BY 4.0),
// CDC clinical guidance (public domain), and concept citations for major professional society
// guidelines (AHA/ACC, GINA, GOLD, KDIGO, ADA — referenced as fact-citation, not reproduced).

// MARK: - Shared citation sources

private let openrnMedSurg = CitationSource(
    id: "openrn_medsurg_book",
    shortName: "Open RN Advanced Skills — Medical-Surgical chapters",
    detail: "Open Resources for Nursing — Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingadvancedskills/?s=sepsis+diabetes+heart+failure",
    lastRetrieved: "2026-05-04"
)

private let openrnHealthAlterations = CitationSource(
    id: "openrn_health_alterations",
    shortName: "Open RN Health Alterations — Diagnoses & Pathophysiology",
    detail: "Open Resources for Nursing — Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=diagnoses+pathophysiology",
    lastRetrieved: "2026-05-04"
)

private let openstaxMedSurg = CitationSource(
    id: "openstax_medsurg_book",
    shortName: "OpenStax Medical-Surgical Nursing",
    detail: "OpenStax · Rice University",
    publisher: "OpenStax",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/medical-surgical-nursing",
    lastRetrieved: "2026-05-04"
)

private let cdcAFib = CitationSource(
    id: "cdc_afib",
    shortName: "CDC — Atrial Fibrillation",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/heart-disease/about/atrial-fibrillation.html",
    lastRetrieved: "2026-05-04"
)

private let cdcCKD = CitationSource(
    id: "cdc_ckd",
    shortName: "CDC — Chronic Kidney Disease",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/kidney-disease/about/index.html",
    lastRetrieved: "2026-05-04"
)

private let cdcUTI = CitationSource(
    id: "cdc_uti",
    shortName: "CDC — Urinary Tract Infection",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/uti/about/index.html",
    lastRetrieved: "2026-05-04"
)

private let aha = CitationSource(
    id: "aha_acc_guideline",
    shortName: "AHA/ACC clinical guidelines (concept citation)",
    detail: "Professional society clinical practice guidelines — concept reference only",
    publisher: "American Heart Association / American College of Cardiology",
    license: .factCitationOnly,
    url: "https://www.acc.org/Clinical-Topics",
    lastRetrieved: "2026-05-04"
)

private let gold = CitationSource(
    id: "gold_copd",
    shortName: "GOLD COPD Report (concept citation)",
    detail: "Global Strategy for the Diagnosis, Management and Prevention of COPD — concept reference only",
    publisher: "Global Initiative for Chronic Obstructive Lung Disease",
    license: .factCitationOnly,
    url: "https://goldcopd.org/",
    lastRetrieved: "2026-05-04"
)

private let gina = CitationSource(
    id: "gina_asthma",
    shortName: "GINA Asthma Strategy (concept citation)",
    detail: "Global Strategy for Asthma Management and Prevention — concept reference only",
    publisher: "Global Initiative for Asthma",
    license: .factCitationOnly,
    url: "https://ginasthma.org/",
    lastRetrieved: "2026-05-04"
)

private let kdigo = CitationSource(
    id: "kdigo_aki",
    shortName: "KDIGO AKI/CKD Guidelines (concept citation)",
    detail: "KDIGO Clinical Practice Guidelines for AKI and CKD — concept reference only",
    publisher: "Kidney Disease: Improving Global Outcomes",
    license: .factCitationOnly,
    url: "https://kdigo.org/guidelines/",
    lastRetrieved: "2026-05-04"
)

private let ata = CitationSource(
    id: "ata_thyroid",
    shortName: "American Thyroid Association Guidelines (concept citation)",
    detail: "Hypothyroidism / Hyperthyroidism / Thyroid Storm guidelines — concept reference only",
    publisher: "American Thyroid Association",
    license: .factCitationOnly,
    url: "https://www.thyroid.org/professionals/ata-professional-guidelines/",
    lastRetrieved: "2026-05-04"
)

// MARK: - COPD

public enum COPDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "copd",
        title: "COPD",
        subtitle: "Chronic obstructive pulmonary disease",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .gasExchange
        ),
        definition: AttributedProse(
            "COPD is a chronic, progressive lung disease characterized by persistent airflow limitation that is not fully reversible. It encompasses chronic bronchitis (productive cough for 3 months in 2 consecutive years) and emphysema (alveolar wall destruction with loss of elastic recoil). Smoking is the leading cause; alpha-1 antitrypsin deficiency, occupational exposures, and air pollution are other contributors.",
            citationIDs: ["openrn_medsurg_book", "gold_copd"]
        ),
        pathophysiology: AttributedProse(
            "Chronic inflammation narrows small airways and destroys alveolar attachments. Mucus hypersecretion, ciliary dysfunction, and air trapping cause hyperinflation, increased work of breathing, and impaired gas exchange. Chronic hypoxemia eventually triggers pulmonary vasoconstriction, leading to pulmonary hypertension and cor pulmonale.",
            citationIDs: ["openrn_medsurg_book"]
        ),
        presentation: [
            AttributedBullet("Chronic productive cough — often worse in the morning.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Progressive dyspnea on exertion, eventually at rest.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Wheezing and prolonged expiratory phase.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pursed-lip breathing and tripod positioning during distress.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Barrel chest from chronic hyperinflation.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Use of accessory muscles, clubbing of fingers in advanced disease.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Acute exacerbation: increased dyspnea, increased sputum volume, change in sputum color/purulence.", citationIDs: ["openrn_medsurg_book", "gold_copd"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Spirometry showing post-bronchodilator FEV1/FVC < 0.70 confirms persistent airflow limitation.", citationIDs: ["gold_copd"]),
            AttributedBullet("GOLD severity classified by FEV1 percent predicted.", citationIDs: ["gold_copd"]),
            AttributedBullet("ABG in advanced disease may show hypercapnia (chronic compensated respiratory acidosis with elevated bicarbonate) and hypoxemia.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Chest imaging may show hyperinflation, flattened diaphragms, bullae.", citationIDs: ["openrn_medsurg_book"])
        ],
        priorityAssessments: [
            AttributedBullet("Respiratory rate, work of breathing, accessory muscle use, ability to speak full sentences.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pulse oximetry — these patients often run on chronically low SpO2 (target 88–92%, NOT 95–100%, to avoid blunting hypoxic respiratory drive).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Lung sounds — wheeze, prolonged expiration, diminished breath sounds in hyperinflated regions.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Mental status — confusion or somnolence may signal CO2 retention.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Sputum — color, volume, viscosity; change suggests infection.", citationIDs: ["openrn_medsurg_book"])
        ],
        commonInterventions: [
            AttributedBullet("Controlled oxygen — titrate to SpO2 88–92% (or per provider order). Do NOT default to high-flow O2; risk of CO2 narcosis in chronic CO2 retainers.", citationIDs: ["openrn_medsurg_book", "gold_copd"]),
            AttributedBullet("Bronchodilators — short-acting beta-agonist (albuterol) and short-acting anticholinergic (ipratropium) for acute relief; long-acting bronchodilators for maintenance.", citationIDs: ["gold_copd"]),
            AttributedBullet("Inhaled or systemic corticosteroids for exacerbations.", citationIDs: ["gold_copd"]),
            AttributedBullet("Antibiotics for exacerbations with increased sputum purulence.", citationIDs: ["gold_copd"]),
            AttributedBullet("Pulmonary rehabilitation, smoking cessation counseling, vaccinations (influenza, pneumococcal, COVID).", citationIDs: ["openrn_medsurg_book", "gold_copd"]),
            AttributedBullet("Position upright, encourage pursed-lip breathing, energy-conservation strategies.", citationIDs: ["openrn_medsurg_book"])
        ],
        watchFor: [
            AttributedBullet("CO2 narcosis from over-oxygenation: progressive somnolence, confusion, headache.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Acute respiratory failure: rising PaCO2, falling pH, increasing work of breathing — may require BiPAP or intubation.", citationIDs: ["openrn_medsurg_book", "gold_copd"]),
            AttributedBullet("Right-sided heart failure (cor pulmonale) — peripheral edema, JVD, hepatomegaly in advanced disease.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pneumothorax — sudden sharp pleuritic pain and increased dyspnea in patients with bullous disease.", citationIDs: ["openrn_medsurg_book"])
        ],
        citations: [openrnMedSurg, gold],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Asthma

public enum AsthmaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "asthma",
        title: "Asthma",
        subtitle: "Reversible airway obstruction",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .gasExchange
        ),
        definition: AttributedProse(
            "Asthma is a chronic inflammatory disorder of the airways characterized by recurrent episodes of bronchospasm, mucus production, and airway hyperreactivity. Unlike COPD, the airflow obstruction is largely reversible with treatment. Triggers include allergens, respiratory infections, exercise, cold air, irritants, NSAIDs, and stress.",
            citationIDs: ["openrn_medsurg_book", "gina_asthma"]
        ),
        pathophysiology: AttributedProse(
            "Trigger exposure activates mast cells and eosinophils → release of histamine, leukotrienes, and prostaglandins → smooth muscle bronchoconstriction, airway edema, and thick mucus production. Chronic inflammation causes airway remodeling over time.",
            citationIDs: ["openrn_medsurg_book"]
        ),
        presentation: [
            AttributedBullet("Wheezing — typically expiratory; may be inspiratory and expiratory in severe attacks.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Dyspnea, chest tightness, dry cough (especially at night or early morning).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Prolonged expiratory phase.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Use of accessory muscles, retractions, tripod positioning during attack.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Tachycardia, tachypnea, anxiety.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Severe attack — silent chest (no air movement) is an OMINOUS sign of imminent respiratory failure.", citationIDs: ["openrn_medsurg_book", "gina_asthma"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Spirometry showing reversible airflow obstruction (FEV1 increases ≥12% after bronchodilator).", citationIDs: ["gina_asthma"]),
            AttributedBullet("Peak flow (PEF) measurements — diurnal variability >10% supports asthma diagnosis.", citationIDs: ["gina_asthma"]),
            AttributedBullet("Methacholine challenge testing in select cases.", citationIDs: ["gina_asthma"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity of attack — mild (can speak in sentences), moderate (phrases), severe (single words), life-threatening (silent chest, exhaustion, cyanosis, altered LOC).", citationIDs: ["gina_asthma"]),
            AttributedBullet("Peak flow vs. patient's personal best — green (>80%), yellow (50–80%), red (<50%) zones.", citationIDs: ["gina_asthma"]),
            AttributedBullet("SpO2 — target ≥94% in acute attack.", citationIDs: ["gina_asthma"]),
            AttributedBullet("Lung sounds — wheezing, prolonged expiration; absent breath sounds = severe.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("ABG: early attack shows respiratory alkalosis from hyperventilation; normalizing or rising PaCO2 in a tiring patient signals impending failure.", citationIDs: ["openrn_medsurg_book"])
        ],
        commonInterventions: [
            AttributedBullet("Short-acting beta-2 agonist (albuterol) via nebulizer or MDI with spacer — first-line acute relief.", citationIDs: ["gina_asthma"]),
            AttributedBullet("Inhaled or systemic corticosteroids (prednisone, methylprednisolone) for moderate-to-severe exacerbations.", citationIDs: ["gina_asthma"]),
            AttributedBullet("Ipratropium added to albuterol for severe attacks.", citationIDs: ["gina_asthma"]),
            AttributedBullet("Oxygen titrated to SpO2 ≥94%.", citationIDs: ["gina_asthma"]),
            AttributedBullet("IV magnesium sulfate considered for severe attacks not responding to initial therapy.", citationIDs: ["gina_asthma"]),
            AttributedBullet("Position upright, encourage slow controlled breathing, reduce exposure to trigger.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Education: trigger avoidance, controller vs. rescue inhaler distinction, written asthma action plan, spacer technique.", citationIDs: ["gina_asthma"])
        ],
        watchFor: [
            AttributedBullet("Status asthmaticus — severe asthma not responding to standard therapy; medical emergency.", citationIDs: ["gina_asthma"]),
            AttributedBullet("Silent chest — no audible wheeze because no air is moving. Imminent respiratory arrest.", citationIDs: ["openrn_medsurg_book", "gina_asthma"]),
            AttributedBullet("Rising PaCO2 in a previously tachypneic patient — signals exhaustion and respiratory failure.", citationIDs: ["gina_asthma"]),
            AttributedBullet("Overuse of rescue inhaler (>2 days/week of need) signals poor control and need for controller-medication adjustment.", citationIDs: ["gina_asthma"])
        ],
        citations: [openrnMedSurg, gina],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Acute Kidney Injury (AKI)

public enum AKISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "aki",
        title: "Acute Kidney Injury",
        subtitle: "AKI — pre-renal, intrinsic, post-renal",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .fluidElectrolytes
        ),
        definition: AttributedProse(
            "Acute kidney injury (AKI) is an abrupt decrease in kidney function over hours to days, resulting in retention of nitrogenous waste, fluid, and electrolyte imbalance. KDIGO defines AKI as any of: serum creatinine increase ≥0.3 mg/dL within 48 hours; serum creatinine increase to ≥1.5× baseline within 7 days; or urine output <0.5 mL/kg/hr for 6 hours.",
            citationIDs: ["openrn_medsurg_book", "kdigo_aki"]
        ),
        pathophysiology: AttributedProse(
            "AKI is categorized by location of insult. Pre-renal: decreased renal perfusion (hypovolemia, hypotension, heart failure). Intrinsic: direct kidney damage (acute tubular necrosis from ischemia or nephrotoxins, glomerulonephritis, interstitial nephritis). Post-renal: obstruction to urine flow distal to the kidney (BPH, stones, tumors, blocked Foley).",
            citationIDs: ["openrn_medsurg_book"]
        ),
        presentation: [
            AttributedBullet("Decreased urine output — oliguria (<400 mL/day) or anuria.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Edema — peripheral, periorbital, or pulmonary congestion.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Fatigue, malaise, nausea, anorexia from rising uremic toxins.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Confusion, lethargy in advanced uremia.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pruritus, asterixis in late stages.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Hypertension or hypotension depending on volume status and etiology.", citationIDs: ["openrn_medsurg_book"])
        ],
        diagnosticCriteria: [
            AttributedBullet("KDIGO criteria — see Definition above.", citationIDs: ["kdigo_aki"]),
            AttributedBullet("BUN and creatinine elevated; BUN:creatinine ratio >20:1 suggests pre-renal cause.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Urinalysis — granular casts in ATN, RBC casts in glomerulonephritis, WBC casts in interstitial nephritis.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("FENa <1% suggests pre-renal; >2% suggests intrinsic ATN.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Renal ultrasound to rule out obstruction.", citationIDs: ["openrn_medsurg_book"])
        ],
        priorityAssessments: [
            AttributedBullet("Strict intake and output, hourly if critical.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Daily weight at the same time, on the same scale.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Vital signs and hemodynamic status.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Trends in BUN, creatinine, electrolytes (especially potassium), bicarbonate, phosphate.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Mental status changes — uremic encephalopathy.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Nephrotoxin exposure — review medication list for NSAIDs, aminoglycosides, contrast, ACE-I/ARB combos, vancomycin troughs.", citationIDs: ["openrn_medsurg_book", "kdigo_aki"])
        ],
        commonInterventions: [
            AttributedBullet("Treat underlying cause — fluid resuscitation for pre-renal hypovolemia, relieve obstruction for post-renal, withhold offending nephrotoxin for intrinsic.", citationIDs: ["kdigo_aki", "openrn_medsurg_book"]),
            AttributedBullet("Fluid management — careful balance: enough to perfuse, not so much that it causes pulmonary edema in oliguric kidneys.", citationIDs: ["kdigo_aki"]),
            AttributedBullet("Manage hyperkalemia aggressively (calcium gluconate, insulin + dextrose, sodium bicarbonate, sodium polystyrene sulfonate or patiromer, dialysis if refractory).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Renal-dose all medications — adjust for eGFR; many drugs are nephrotoxic or accumulate in renal failure.", citationIDs: ["kdigo_aki"]),
            AttributedBullet("Renal replacement therapy (dialysis, CRRT) for refractory hyperkalemia, severe acidosis, volume overload, uremic complications, or certain toxin ingestions.", citationIDs: ["kdigo_aki"]),
            AttributedBullet("Nutritional support — adequate protein and calories; renal-specific formulations as indicated.", citationIDs: ["openrn_medsurg_book"])
        ],
        watchFor: [
            AttributedBullet("Hyperkalemia — peaked T waves, widening QRS, sine wave on ECG; can cause cardiac arrest. Most immediately life-threatening complication.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pulmonary edema from fluid overload, especially in oliguric AKI.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Metabolic acidosis with anion gap.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Uremic pericarditis — pericardial friction rub, indication for urgent dialysis.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Progression to chronic kidney disease in 25% of survivors.", citationIDs: ["kdigo_aki"])
        ],
        citations: [openrnMedSurg, kdigo],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Chronic Kidney Disease (CKD)

public enum CKDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ckd",
        title: "Chronic Kidney Disease",
        subtitle: "CKD — staged by eGFR and albuminuria",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .fluidElectrolytes
        ),
        definition: AttributedProse(
            "Chronic kidney disease (CKD) is the progressive, irreversible loss of kidney function over months to years, defined by KDIGO as kidney damage or eGFR <60 mL/min/1.73 m² persisting for ≥3 months. The leading causes in the United States are diabetes and hypertension. Stages G1–G5 are defined by eGFR; stage G5 (eGFR <15) is end-stage renal disease typically requiring dialysis or transplant.",
            citationIDs: ["cdc_ckd", "kdigo_aki"]
        ),
        pathophysiology: AttributedProse(
            "Chronic insult (hyperglycemia, hypertension, glomerular disease, nephrotoxins) causes progressive nephron loss. Surviving nephrons hyperfiltrate to compensate, but eventually scar. Loss of filtration causes retention of nitrogenous waste, electrolyte derangement, anemia (loss of erythropoietin production), bone disease (impaired vitamin D activation, hyperphosphatemia, secondary hyperparathyroidism), and cardiovascular complications.",
            citationIDs: ["cdc_ckd"]
        ),
        presentation: [
            AttributedBullet("Often asymptomatic in early stages — diagnosed by routine lab screening.", citationIDs: ["cdc_ckd"]),
            AttributedBullet("Fatigue, malaise, decreased appetite as uremia advances.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Edema — peripheral, periorbital, anasarca in advanced disease.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Hypertension — both cause and consequence of CKD.", citationIDs: ["cdc_ckd"]),
            AttributedBullet("Pruritus from uremic toxins and phosphate deposition.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pallor (anemia of chronic disease), bruising, poor wound healing.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Bone pain, fractures from CKD-mineral bone disorder.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Late: confusion, seizures, asterixis, pericarditis (uremic emergencies).", citationIDs: ["openrn_medsurg_book"])
        ],
        diagnosticCriteria: [
            AttributedBullet("eGFR <60 mL/min/1.73 m² for ≥3 months OR markers of kidney damage (albuminuria, urine sediment abnormalities, structural abnormalities) for ≥3 months.", citationIDs: ["kdigo_aki"]),
            AttributedBullet("KDIGO stages — G1 (≥90 with damage), G2 (60–89 with damage), G3a (45–59), G3b (30–44), G4 (15–29), G5 (<15 / dialysis).", citationIDs: ["kdigo_aki"]),
            AttributedBullet("Albuminuria — A1 (<30 mg/g), A2 (30–300), A3 (>300).", citationIDs: ["kdigo_aki"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs, daily weights, intake/output if hospitalized.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Trend BUN, creatinine, eGFR, electrolytes (K+, Ca, Phos, Mg, bicarbonate), hemoglobin.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Edema assessment — pitting grade, weight changes.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Vascular access protection — no BP cuffs, IVs, or blood draws on the AV fistula or graft arm.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Medication review — renal dose adjustments; avoid NSAIDs, contrast, nephrotoxic combinations.", citationIDs: ["kdigo_aki"])
        ],
        commonInterventions: [
            AttributedBullet("Slow progression — strict BP control (<130/80), glycemic control in diabetes, ACE-I or ARB to reduce proteinuria, SGLT2 inhibitors per KDIGO.", citationIDs: ["kdigo_aki", "cdc_ckd"]),
            AttributedBullet("Manage anemia — iron supplementation, erythropoiesis-stimulating agents (target Hgb 10–11 g/dL).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Manage CKD-mineral bone disorder — phosphate binders with meals, active vitamin D analogs, calcimimetics for hyperparathyroidism.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Diet — sodium restriction, potassium and phosphate restriction in advanced stages, adequate protein (0.8 g/kg/day in non-dialysis CKD).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Prepare for renal replacement therapy in stages G4–G5 — vascular access creation, transplant evaluation, dialysis modality discussion.", citationIDs: ["kdigo_aki"]),
            AttributedBullet("Vaccinations — pneumococcal, influenza, hepatitis B (especially before dialysis initiation).", citationIDs: ["cdc_ckd"])
        ],
        watchFor: [
            AttributedBullet("Hyperkalemia — particularly with ACE-I/ARB plus K-sparing diuretics or in advanced CKD.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Volume overload, pulmonary edema.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Cardiovascular disease — leading cause of death in CKD.", citationIDs: ["cdc_ckd"]),
            AttributedBullet("Uremic emergencies in advanced disease — pericarditis, encephalopathy, severe acidosis, refractory hyperkalemia or volume overload.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Contrast-induced AKI — hold metformin and minimize contrast in advanced CKD.", citationIDs: ["kdigo_aki"])
        ],
        citations: [cdcCKD, kdigo, openrnMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cirrhosis

public enum CirrhosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cirrhosis",
        title: "Cirrhosis",
        subtitle: "End-stage chronic liver disease",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .cellularRegulation
        ),
        definition: AttributedProse(
            "Cirrhosis is the end stage of chronic liver disease, characterized by widespread fibrosis, regenerative nodules, and disrupted hepatic architecture. The most common causes in the United States are alcohol-associated liver disease, chronic hepatitis C, hepatitis B, and metabolic dysfunction-associated steatohepatitis (MASH).",
            citationIDs: ["openrn_medsurg_book"]
        ),
        pathophysiology: AttributedProse(
            "Repeated hepatocyte injury triggers stellate cell activation, collagen deposition, and scar formation. Loss of hepatocyte mass impairs synthetic function (albumin, clotting factors), detoxification (ammonia, bilirubin), and metabolism. Fibrotic distortion of the liver increases portal venous pressure, leading to varices, ascites, and splenomegaly.",
            citationIDs: ["openrn_medsurg_book"]
        ),
        presentation: [
            AttributedBullet("Compensated cirrhosis is often asymptomatic — found on imaging or labs.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Fatigue, anorexia, weight loss, muscle wasting.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Jaundice, scleral icterus from elevated bilirubin.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Spider angiomas, palmar erythema, gynecomastia (estrogen excess).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Ascites, lower-extremity edema, abdominal distension with caput medusae.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Easy bruising, bleeding gums, prolonged bleeding from procedures (impaired clotting factor synthesis).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Hepatic encephalopathy — confusion, asterixis, fetor hepaticus, sleep-wake reversal.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Acute upper GI bleeding from variceal rupture — hematemesis, melena, hemodynamic instability.", citationIDs: ["openrn_medsurg_book"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Imaging (ultrasound, CT, MRI) showing nodular liver, splenomegaly, ascites.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Liver biopsy is gold standard but often deferred in classic clinical / imaging presentation.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Labs: elevated INR (impaired clotting factor synthesis), low albumin, elevated bilirubin, low platelets (splenic sequestration).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("MELD score (bilirubin, INR, creatinine ± sodium) stratifies severity and guides transplant prioritization.", citationIDs: ["openrn_medsurg_book"])
        ],
        priorityAssessments: [
            AttributedBullet("Mental status — orientation, asterixis, presence of fetor hepaticus.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Bleeding signs — hematemesis, melena, bruising, IV site oozing.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Volume status — daily weight, abdominal girth, lower-extremity edema, JVP.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Skin integrity — jaundice, spider angiomas, pruritus, bruising.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Vital signs and orthostatic changes — early sign of GI bleed or sepsis.", citationIDs: ["openrn_medsurg_book"])
        ],
        commonInterventions: [
            AttributedBullet("Treat underlying cause — alcohol cessation, antiviral therapy for hepatitis B/C, metabolic management for MASH.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Manage ascites — sodium restriction (<2 g/day), diuretics (spironolactone first-line, often combined with furosemide), large-volume paracentesis with albumin replacement for tense ascites.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Hepatic encephalopathy — lactulose (titrated to 2–3 soft stools per day), rifaximin as adjunct.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Variceal prophylaxis — non-selective beta-blocker (propranolol, nadolol) or endoscopic variceal ligation.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Acute variceal bleed — large-bore IV access, volume resuscitation with caution, octreotide IV, urgent endoscopy with banding, prophylactic antibiotics.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Liver transplant evaluation in advanced disease (MELD ≥15).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Avoid hepatotoxic medications (acetaminophen >2 g/day, NSAIDs in ascites/AKI risk, certain herbal supplements).", citationIDs: ["openrn_medsurg_book"])
        ],
        watchFor: [
            AttributedBullet("Spontaneous bacterial peritonitis (SBP) — fever, abdominal pain, worsening ascites, or simply altered mental status. Diagnostic paracentesis is mandatory; treat with empiric antibiotics.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Hepatorenal syndrome — rising creatinine in advanced cirrhosis, often precipitated by SBP, GI bleed, or aggressive diuresis.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Hepatic encephalopathy precipitants — GI bleed, infection, electrolyte disturbance, constipation, sedatives, dietary protein excess.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Hepatocellular carcinoma — screen with ultrasound ± AFP every 6 months in cirrhotic patients.", citationIDs: ["openrn_medsurg_book"])
        ],
        citations: [openrnMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Acute Pancreatitis

public enum AcutePancreatitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acute-pancreatitis",
        title: "Acute Pancreatitis",
        subtitle: "Pancreatic autodigestion",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .painComfort
        ),
        definition: AttributedProse(
            "Acute pancreatitis is sudden inflammation of the pancreas caused by inappropriate activation of pancreatic enzymes within the gland, leading to autodigestion. The two leading causes are gallstones (most common in the U.S.) and chronic alcohol use. Other causes include hypertriglyceridemia, hypercalcemia, ERCP, certain medications, and trauma.",
            citationIDs: ["openrn_medsurg_book"]
        ),
        pathophysiology: AttributedProse(
            "Triggered enzyme activation (especially trypsin) within acinar cells causes proteolysis, edema, hemorrhage, and necrosis of pancreatic tissue. Released enzymes and inflammatory mediators enter the systemic circulation, causing SIRS, third-spacing of fluid, hypovolemia, and potentially multi-organ failure.",
            citationIDs: ["openrn_medsurg_book"]
        ),
        presentation: [
            AttributedBullet("Severe, persistent epigastric pain — often radiating to the back, worse with eating, partially relieved by sitting forward.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Nausea, vomiting that does not relieve the pain.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Fever, tachycardia, hypotension in severe cases (third-spacing).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Abdominal distension and decreased bowel sounds (ileus).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Cullen sign (periumbilical bruising) and Grey-Turner sign (flank bruising) — uncommon but indicate severe hemorrhagic pancreatitis.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Jaundice if biliary obstruction is the cause.", citationIDs: ["openrn_medsurg_book"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Two of three: characteristic abdominal pain; serum lipase or amylase >3× upper limit of normal; characteristic imaging findings.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Lipase is more specific than amylase and remains elevated longer.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("CT or MRI to assess severity, complications (necrosis, pseudocyst), and biliary etiology.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Severity scoring (BISAP, APACHE II, Ranson) helps predict mortality.", citationIDs: ["openrn_medsurg_book"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain — quality, intensity, radiation; trend response to analgesia.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Hemodynamic status — third-spacing causes intravascular depletion despite total-body fluid overload.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Strict intake and output, daily weights.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Respiratory status — pleural effusion and ARDS are common in severe pancreatitis.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Glucose — pancreatic damage can cause hyperglycemia.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Calcium — hypocalcemia from saponification is a marker of severity.", citationIDs: ["openrn_medsurg_book"])
        ],
        commonInterventions: [
            AttributedBullet("Aggressive IV fluid resuscitation — Lactated Ringer's preferred, titrated to perfusion endpoints (urine output, MAP).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pain management — IV opioids (hydromorphone, fentanyl); avoid morphine if concerns about sphincter of Oddi spasm (variable evidence).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("NPO initially; advance to clear liquids and low-fat diet as tolerated. Early enteral nutrition (within 24–72 hours) is preferred over prolonged NPO when feasible.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Antiemetics for nausea/vomiting; nasogastric decompression if persistent ileus or vomiting.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Treat underlying cause — cholecystectomy after gallstone pancreatitis resolves; ERCP if biliary obstruction.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Antibiotics ONLY if infected necrosis or other proven infection — NOT prophylactic in mild cases.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Glucose management with insulin if hyperglycemic.", citationIDs: ["openrn_medsurg_book"])
        ],
        watchFor: [
            AttributedBullet("Pancreatic necrosis with infection — high mortality; suspect with new fever, leukocytosis, or clinical decline.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pseudocyst — usually delayed (weeks); can rupture or become infected.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("ARDS — early respiratory failure from inflammatory mediators.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Hypocalcemia with tetany, Chvostek/Trousseau signs.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Multi-organ dysfunction — leading cause of mortality in severe pancreatitis.", citationIDs: ["openrn_medsurg_book"])
        ],
        citations: [openrnMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - UTI

public enum UTISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "uti",
        title: "Urinary Tract Infection",
        subtitle: "UTI — uncomplicated cystitis to pyelonephritis",
        nclexTags: NCLEXTags(
            category: .safeAndEffectiveCare,
            subcategory: .safetyAndInfectionControl,
            priorityConcept: .infection
        ),
        definition: AttributedProse(
            "A urinary tract infection (UTI) is a bacterial (most commonly E. coli) infection anywhere along the urinary tract. Lower UTI (cystitis) involves the bladder; upper UTI (pyelonephritis) involves the kidney. Catheter-associated UTI (CAUTI) is the most common healthcare-associated infection in the U.S. UTIs are more common in women due to shorter urethral length.",
            citationIDs: ["cdc_uti", "openrn_medsurg_book"]
        ),
        presentation: [
            AttributedBullet("Cystitis: dysuria, urinary frequency, urgency, suprapubic pain, cloudy or malodorous urine.", citationIDs: ["cdc_uti", "openrn_medsurg_book"]),
            AttributedBullet("Pyelonephritis: cystitis symptoms PLUS flank pain, costovertebral angle (CVA) tenderness, fever, chills, nausea, vomiting.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Older adults often present atypically — confusion, falls, anorexia, lethargy may be the only signs.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Catheter-associated UTI may be asymptomatic until systemic — fever, hypotension, sepsis.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Hematuria can occur in any UTI but warrants further evaluation.", citationIDs: ["openrn_medsurg_book"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Urinalysis with positive leukocyte esterase, nitrites, WBCs, and bacteria.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Urine culture is gold standard — typically >100,000 CFU/mL of a uropathogen, though lower thresholds apply in symptomatic patients with classic presentation.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Asymptomatic bacteriuria does NOT require treatment in non-pregnant adults — this is a major source of antibiotic overuse.", citationIDs: ["cdc_uti"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — fever and tachycardia signal possible upper-tract or systemic involvement.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Mental status, especially in older adults.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pain — suprapubic vs. CVA; trend response to therapy.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Urine character — color, clarity, odor; volume per shift.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Catheter assessment — necessity, securement, drainage system integrity, time since insertion.", citationIDs: ["cdc_uti"])
        ],
        commonInterventions: [
            AttributedBullet("Empiric antibiotics per local antibiogram — uncomplicated cystitis often nitrofurantoin, TMP-SMX, or fosfomycin; pyelonephritis often fluoroquinolone or ceftriaxone.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Encourage oral fluids unless contraindicated.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Phenazopyridine for symptomatic dysuria (warn about red-orange urine and stains).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Remove unnecessary indwelling catheters — daily review of necessity per CAUTI bundle.", citationIDs: ["cdc_uti"]),
            AttributedBullet("Education — front-to-back wiping, voiding after intercourse, avoiding bladder irritants, completing the antibiotic course.", citationIDs: ["openrn_medsurg_book"])
        ],
        watchFor: [
            AttributedBullet("Progression from cystitis to pyelonephritis — new fever, flank pain, vomiting.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Urosepsis — hypotension, tachycardia, altered mental status; medical emergency requiring sepsis bundle.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Recurrent UTIs — investigate for structural abnormalities, residual urine, stones, or fistula.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("UTI in pregnancy — screen and treat asymptomatic bacteriuria due to risk of pyelonephritis and preterm labor.", citationIDs: ["openrn_medsurg_book"])
        ],
        citations: [cdcUTI, openrnMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cellulitis

public enum CellulitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cellulitis",
        title: "Cellulitis",
        subtitle: "Bacterial skin and soft tissue infection",
        nclexTags: NCLEXTags(
            category: .safeAndEffectiveCare,
            subcategory: .safetyAndInfectionControl,
            priorityConcept: .infection
        ),
        definition: AttributedProse(
            "Cellulitis is a bacterial infection of the skin and subcutaneous tissue, most commonly caused by Staphylococcus aureus (including MRSA) or Streptococcus pyogenes. It typically occurs after a break in the skin barrier — abrasion, insect bite, surgical wound, or chronic edema with skin maceration.",
            citationIDs: ["openrn_medsurg_book"]
        ),
        presentation: [
            AttributedBullet("Erythema, warmth, edema, and tenderness of affected area.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Poorly demarcated borders (vs. sharply demarcated in erysipelas).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Often unilateral (an important distinguishing feature from venous stasis dermatitis, which is bilateral).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Fever, chills, malaise — particularly in extensive or severe infection.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Lymphangitis (red streaking) and regional lymphadenopathy may be present.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Common sites: lower extremities, especially in patients with venous insufficiency, lymphedema, or diabetes.", citationIDs: ["openrn_medsurg_book"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Primarily clinical diagnosis based on examination.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Blood cultures only if systemic toxicity, immunocompromise, or atypical exposure.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Imaging (ultrasound, CT, MRI) only if abscess, deep infection, or necrotizing fasciitis suspected.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Mark the leading edge with a skin marker on first assessment to track progression.", citationIDs: ["openrn_medsurg_book"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — fever, tachycardia, hypotension suggest systemic involvement.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Affected area — measure and mark borders, document warmth, drainage, fluctuance.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pain — note that pain out of proportion to exam findings is a red flag for necrotizing fasciitis.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Skin breakdown source — wound, ulcer, tinea pedis between toes, IV site.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Distal pulses, sensation, capillary refill — assess for compartment syndrome with severe edema.", citationIDs: ["openrn_medsurg_book"])
        ],
        commonInterventions: [
            AttributedBullet("Antibiotics — oral cephalexin or dicloxacillin for non-purulent; clindamycin or TMP-SMX or doxycycline if MRSA suspected; IV vancomycin or other agents for severe / hospitalized.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Elevate the affected limb to reduce edema.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Warm compresses for comfort.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Address the source — treat tinea pedis, dress wounds, manage chronic edema, control diabetes.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Incision and drainage if abscess present — antibiotics alone insufficient for established abscess.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Education — finish antibiotic course, return precautions, foot/skin care.", citationIDs: ["openrn_medsurg_book"])
        ],
        watchFor: [
            AttributedBullet("Necrotizing fasciitis — rapidly spreading, severe pain out of proportion, dusky/black skin, crepitus, systemic toxicity. Surgical emergency.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Failure to improve in 48–72 hours — consider resistant organism, abscess, alternate diagnosis (DVT, gout, contact dermatitis).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Sepsis — hypotension, tachycardia, altered mental status.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Recurrent cellulitis — investigate for chronic edema, untreated tinea pedis, immunocompromise.", citationIDs: ["openrn_medsurg_book"])
        ],
        citations: [openrnMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Atrial Fibrillation

public enum AtrialFibrillationSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "atrial-fibrillation",
        title: "Atrial Fibrillation",
        subtitle: "AFib — irregularly irregular atrial rhythm",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .perfusion
        ),
        definition: AttributedProse(
            "Atrial fibrillation is the most common sustained cardiac arrhythmia, characterized by chaotic, disorganized atrial electrical activity that produces an irregularly irregular ventricular response. AFib increases the risk of thromboembolic stroke fivefold because stagnant blood in the fibrillating atrium can form clots that embolize.",
            citationIDs: ["cdc_afib", "openrn_medsurg_book"]
        ),
        pathophysiology: AttributedProse(
            "Multiple ectopic foci, often originating from the pulmonary veins, generate chaotic electrical activity in the atria. The AV node receives variable, rapid impulses and conducts a fraction of them, producing an irregularly irregular ventricular response. Loss of organized atrial contraction reduces cardiac output by 15–20% and allows blood to stagnate, predisposing to thrombus formation in the left atrial appendage.",
            citationIDs: ["openrn_medsurg_book"]
        ),
        presentation: [
            AttributedBullet("Palpitations — patients describe a fluttering, irregular, or racing heart.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Fatigue, dyspnea on exertion, decreased exercise tolerance.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Lightheadedness, syncope, or pre-syncope.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Chest discomfort or pressure.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Many patients are asymptomatic — discovered incidentally.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("New-onset stroke symptoms can be the first presentation.", citationIDs: ["cdc_afib"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECG: irregularly irregular rhythm, absent P waves, fibrillatory waves between QRS complexes, variable R-R intervals.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Holter or extended ambulatory monitoring for paroxysmal cases.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Echocardiogram to assess structural disease, atrial size, and presence of thrombus.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Thyroid function (hyperthyroidism is a reversible cause), electrolytes, BNP.", citationIDs: ["openrn_medsurg_book"])
        ],
        priorityAssessments: [
            AttributedBullet("Apical pulse for 60 seconds — pulse deficit (apical > radial) is characteristic.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Continuous cardiac monitoring; trend rate and rhythm.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Hemodynamic stability — BP, mental status, signs of decreased perfusion or heart failure.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Stroke risk — neuro assessment, document baseline.", citationIDs: ["cdc_afib"]),
            AttributedBullet("CHA₂DS₂-VASc score guides anticoagulation decision.", citationIDs: ["aha_acc_guideline"])
        ],
        commonInterventions: [
            AttributedBullet("Rate control — beta-blockers (metoprolol), non-dihydropyridine calcium channel blockers (diltiazem), or digoxin (especially if HF). Target HR <110 (lenient) to <80 (strict).", citationIDs: ["aha_acc_guideline", "openrn_medsurg_book"]),
            AttributedBullet("Rhythm control — antiarrhythmics (amiodarone, flecainide, dofetilide) or electrical cardioversion in selected patients.", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Anticoagulation per CHA₂DS₂-VASc — DOACs (apixaban, rivaroxaban, dabigatran, edoxaban) preferred over warfarin for non-valvular AFib.", citationIDs: ["aha_acc_guideline", "cdc_afib"]),
            AttributedBullet("Cardioversion — consider thromboembolic risk; if AFib >48 hours or unknown duration, anticoagulate ≥3 weeks before OR perform TEE first to rule out atrial thrombus.", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Catheter ablation for selected patients with symptomatic AFib refractory to medical management.", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Treat reversible causes — hyperthyroidism, alcohol, sleep apnea, electrolyte disturbance.", citationIDs: ["openrn_medsurg_book"])
        ],
        watchFor: [
            AttributedBullet("Embolic stroke — CHA₂DS₂-VASc-guided anticoagulation is the most important intervention; many strokes are preventable.", citationIDs: ["cdc_afib"]),
            AttributedBullet("Hemodynamic instability with rapid ventricular response — hypotension, chest pain, heart failure → urgent rate control or cardioversion.", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Bleeding from anticoagulation — assess for falls, GI bleed risk, drug interactions.", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Tachycardia-induced cardiomyopathy in poorly controlled chronic AFib.", citationIDs: ["openrn_medsurg_book"])
        ],
        citations: [cdcAFib, openrnMedSurg, aha],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hypertensive Emergency

public enum HypertensiveEmergencySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hypertensive-emergency",
        title: "Hypertensive Emergency",
        subtitle: "Severe BP elevation with end-organ damage",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .perfusion
        ),
        definition: AttributedProse(
            "Hypertensive emergency is severe blood pressure elevation (typically >180/120 mmHg) accompanied by acute, ongoing end-organ damage — encephalopathy, intracranial hemorrhage, acute coronary syndrome, pulmonary edema, dissection, acute kidney injury, eclampsia. Hypertensive urgency is similar BP elevation WITHOUT end-organ damage; the distinction matters because emergency requires immediate, controlled IV BP reduction in the ICU.",
            citationIDs: ["aha_acc_guideline", "openrn_medsurg_book"]
        ),
        presentation: [
            AttributedBullet("BP typically >180/120 mmHg.", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Encephalopathy — headache, confusion, vision changes, seizures.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Chest pain — ACS or aortic dissection (sharp, tearing pain to back).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Dyspnea, crackles — acute pulmonary edema.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Focal neurologic deficits — stroke or intracerebral hemorrhage.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Decreased urine output, hematuria — AKI.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pregnancy — severe headache, RUQ pain, visual disturbance, BP ≥160/110 may signal eclampsia.", citationIDs: ["openrn_medsurg_book"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BP measurement repeated, both arms, appropriate cuff size.", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Targeted workup based on suspected end-organ involvement: ECG, troponin, BNP, BUN/creatinine, urinalysis, head CT, chest x-ray, CT angiogram for dissection.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pregnancy test in any woman of childbearing age.", citationIDs: ["openrn_medsurg_book"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous BP monitoring (often arterial line in ICU).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Continuous cardiac monitoring.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Frequent neuro checks — pupil response, LOC, motor strength.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Respiratory status — work of breathing, lung sounds, SpO2.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Strict intake/output — assess for AKI.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Pain assessment — particularly chest, back, abdominal pain.", citationIDs: ["openrn_medsurg_book"])
        ],
        commonInterventions: [
            AttributedBullet("Admit to ICU for IV antihypertensive infusion and arterial-line monitoring.", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Goal: reduce MAP by no more than 10–20% in the first hour, then to 160/100 over the next 23 hours. Faster reduction risks watershed ischemia (stroke, MI, blindness).", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Agent selected by end-organ involvement — nicardipine, clevidipine, labetalol, esmolol, nitroglycerin (pulmonary edema, ACS), nitroprusside, hydralazine (eclampsia).", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Ischemic stroke — generally do NOT lower BP unless >185/110 (for tPA candidates) or >220/120; rapid BP reduction worsens ischemia.", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Aortic dissection — aggressive BP and HR reduction (target SBP <120, HR <60); start with beta-blocker BEFORE vasodilator to avoid reflex tachycardia.", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Eclampsia — IV magnesium sulfate for seizure prophylaxis, IV labetalol or hydralazine for BP, urgent delivery.", citationIDs: ["openrn_medsurg_book"])
        ],
        watchFor: [
            AttributedBullet("Over-aggressive BP reduction — watershed ischemia, stroke, MI, AKI, blindness.", citationIDs: ["aha_acc_guideline"]),
            AttributedBullet("Aortic dissection — missed diagnosis carries very high mortality; suspect with severe tearing pain to back, BP differential between arms, mediastinal widening.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Eclampsia in pregnancy — seizures, fetal compromise.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Rebound hypertension after abrupt cessation of clonidine or beta-blocker.", citationIDs: ["aha_acc_guideline"])
        ],
        citations: [openrnMedSurg, aha],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hypothyroidism

public enum HypothyroidismSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hypothyroidism",
        title: "Hypothyroidism",
        subtitle: "Underactive thyroid",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .cellularRegulation
        ),
        definition: AttributedProse(
            "Hypothyroidism is a syndrome of decreased thyroid hormone production resulting in slowed metabolism. Primary hypothyroidism (the most common form) is caused by intrinsic thyroid failure, most often Hashimoto thyroiditis (autoimmune), thyroid surgery, radioiodine ablation, or iodine deficiency. Secondary (pituitary) and tertiary (hypothalamic) hypothyroidism are less common.",
            citationIDs: ["openrn_medsurg_book", "ata_thyroid"]
        ),
        presentation: [
            AttributedBullet("Fatigue, lethargy, cold intolerance.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Weight gain despite unchanged appetite.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Constipation.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Dry skin, brittle hair, hair loss including the lateral third of the eyebrows.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Bradycardia, hypotension, decreased exercise tolerance.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Depression, slowed cognition, memory problems.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Menstrual irregularities, decreased libido.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Periorbital and peripheral edema (myxedema).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Goiter may or may not be present.", citationIDs: ["openrn_medsurg_book"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Primary hypothyroidism: elevated TSH, low free T4.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Subclinical hypothyroidism: elevated TSH, normal free T4.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Anti-thyroid peroxidase (TPO) and anti-thyroglobulin antibodies in Hashimoto.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Lipid panel — hypothyroidism causes hypercholesterolemia.", citationIDs: ["openrn_medsurg_book"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — bradycardia, hypotension, hypothermia.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Mental status — somnolence or worsening cognitive function.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Skin and edema assessment.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Bowel function — constipation, ileus.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Cardiac assessment — pericardial effusion in severe disease.", citationIDs: ["openrn_medsurg_book"])
        ],
        commonInterventions: [
            AttributedBullet("Levothyroxine — oral, taken on an empty stomach 30–60 minutes before food, separated from calcium, iron, and antacids by 4 hours.", citationIDs: ["ata_thyroid", "openrn_medsurg_book"]),
            AttributedBullet("Start low, go slow in older adults and patients with cardiac disease (risk of unmasking angina).", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Recheck TSH 6–8 weeks after dose changes; once stable, every 6–12 months.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Lifelong therapy required — counsel on adherence; sudden discontinuation can precipitate myxedema crisis.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Education — same time daily, same brand if possible (bioequivalence varies), report palpitations or insomnia (over-replacement).", citationIDs: ["openrn_medsurg_book"])
        ],
        watchFor: [
            AttributedBullet("Myxedema coma — life-threatening decompensation: profound hypothermia, bradycardia, hypotension, hypoventilation, altered mental status. Often precipitated by infection, cold exposure, sedatives. ICU-level care.", citationIDs: ["openrn_medsurg_book", "ata_thyroid"]),
            AttributedBullet("Over-replacement (iatrogenic hyperthyroidism) — palpitations, tremor, weight loss, atrial fibrillation, osteoporosis with chronic over-replacement.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Drug interactions — many medications affect levothyroxine absorption or metabolism (PPIs, calcium, iron, estrogen, anticonvulsants).", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Pregnancy — thyroid hormone needs increase; closer TSH monitoring required.", citationIDs: ["ata_thyroid"])
        ],
        citations: [openrnMedSurg, ata],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hyperthyroidism

public enum HyperthyroidismSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hyperthyroidism",
        title: "Hyperthyroidism",
        subtitle: "Overactive thyroid · Graves · thyroid storm",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .cellularRegulation
        ),
        definition: AttributedProse(
            "Hyperthyroidism is a syndrome of excess thyroid hormone production causing hypermetabolism. The most common cause is Graves disease, an autoimmune disorder in which thyroid-stimulating immunoglobulins activate the TSH receptor. Other causes include toxic multinodular goiter, toxic adenoma, thyroiditis (transient), and exogenous thyroid hormone excess.",
            citationIDs: ["openrn_medsurg_book", "ata_thyroid"]
        ),
        presentation: [
            AttributedBullet("Heat intolerance, sweating, warm moist skin.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Weight loss despite increased appetite.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Tachycardia, palpitations, atrial fibrillation.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Tremor, anxiety, irritability, insomnia.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Frequent loose stools or diarrhea.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Hyperreflexia, proximal muscle weakness.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Goiter — diffuse in Graves, nodular in toxic multinodular goiter.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Graves-specific: exophthalmos (proptosis), pretibial myxedema, lid lag.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Older adults often present with apathetic hyperthyroidism — atrial fibrillation, weight loss, depression, without classic adrenergic symptoms.", citationIDs: ["openrn_medsurg_book"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Suppressed TSH with elevated free T4 and/or free T3.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Subclinical hyperthyroidism: low TSH with normal free T4 and T3.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Thyroid receptor antibodies (TRAb) elevated in Graves.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Radioactive iodine uptake scan distinguishes etiology — diffuse uptake in Graves, focal in adenoma, low/absent in thyroiditis.", citationIDs: ["ata_thyroid"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — tachycardia, hypertension, hyperthermia.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Continuous cardiac monitoring if rhythm disturbance present.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Mental status — agitation, anxiety, confusion (particularly older adults).", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Eye assessment in Graves — proptosis, lid lag, vision changes, corneal protection needs.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Weight, intake/output, bowel function.", citationIDs: ["openrn_medsurg_book"])
        ],
        commonInterventions: [
            AttributedBullet("Antithyroid drugs — methimazole (preferred outside first trimester) or propylthiouracil (PTU; first-trimester pregnancy and thyroid storm).", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Beta-blockers (propranolol) for symptomatic relief of adrenergic symptoms.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Definitive treatment options — radioactive iodine ablation or thyroidectomy.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Eye care for Graves ophthalmopathy — lubricating drops, sleeping with head elevated, sunglasses, ophthalmology referral.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Cool environment, light clothing, calorie-dense nutrition during catabolic phase.", citationIDs: ["openrn_medsurg_book"]),
            AttributedBullet("Education — methimazole side effects (agranulocytosis: report fever or sore throat immediately; hepatotoxicity), need for lifelong monitoring after definitive treatment, likely lifelong levothyroxine after radioiodine or thyroidectomy.", citationIDs: ["ata_thyroid"])
        ],
        watchFor: [
            AttributedBullet("Thyroid storm — fever >102°F, tachycardia >140, hypertension or hypotension, GI symptoms, altered mental status, often precipitated by infection, surgery, trauma, or iodine load. Mortality 10–30%. ICU-level care: PTU, beta-blocker, hydrocortisone, iodine (after PTU), cooling, supportive care.", citationIDs: ["openrn_medsurg_book", "ata_thyroid"]),
            AttributedBullet("Atrial fibrillation with rapid ventricular response — manage rate, anticoagulate per CHA₂DS₂-VASc.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Methimazole / PTU agranulocytosis — fever or sore throat warrants immediate CBC and drug discontinuation pending results.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("PTU hepatotoxicity — monitor LFTs.", citationIDs: ["ata_thyroid"]),
            AttributedBullet("Post-thyroidectomy — hypocalcemia (parathyroid injury, watch for tingling, Chvostek/Trousseau, laryngospasm), recurrent laryngeal nerve injury (hoarseness), hematoma compromising airway.", citationIDs: ["openrn_medsurg_book"])
        ],
        citations: [openrnMedSurg, ata],
        lastSourceFidelityReview: "2026-05-04"
    )
}
