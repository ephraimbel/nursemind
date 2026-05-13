import Foundation

// Curator-model diagnosis entries (round 32 — critical care depth: vent complications + shock + HAE + CIPNM + takotsubo + CRS + fulminant myocarditis).

private let openrnDxR32 = CitationSource(
    id: "openrn_dx_round32",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcDxR32 = CitationSource(
    id: "cdc_dx_round32",
    shortName: "CDC + NHLBI + AHA concept citations",
    publisher: "CDC · NHLBI · AHA",
    license: .publicDomain,
    url: "https://www.cdc.gov/hai/vap/index.html",
    lastRetrieved: "2026-05-13"
)
private let specialtyDxR32 = CitationSource(
    id: "specialty_dx_round32",
    shortName: "SCCM + ACCP + AHA + ESC + ESICM + ATS concept citations",
    publisher: "SCCM · ACCP · AHA · ESC · ESICM · ATS",
    license: .factCitationOnly,
    url: "https://www.sccm.org/Clinical-Resources/",
    lastRetrieved: "2026-05-13"
)

private let respCriticalTagR32 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)
private let cardioCriticalTagR32 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let infectionCriticalTagR32 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection)
private let neuroMuscCriticalTagR32 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .mobility)

public enum VAPSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ventilator-associated-pneumonia",
        title: "Ventilator-associated pneumonia (VAP)",
        subtitle: "HAP in intubated >48h · prevention bundle (HOB elevation + oral chlorhexidine + sedation interruption + DVT/PUD prophylaxis) · empiric anti-MDR · CDC reportable",
        nclexTags: respCriticalTagR32,
        definition: AttributedProse(
            "Hospital-acquired pneumonia developing in patients intubated + mechanically ventilated for ≥48 hours — defined by new/progressive radiographic infiltrate + ≥2 clinical features (fever, leukocytosis/penia, purulent secretions, hypoxemia). Significant morbidity + mortality in ICU. PREVENTION BUNDLE — HOB 30-45°, oral chlorhexidine, daily sedation interruption + SBT, DVT + PUD prophylaxis, subglottic suctioning, cuff pressure 20-30 cm H2O. Empiric antibiotics covering MDR pathogens; de-escalate based on cultures per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "Endotracheal tube bypasses upper airway defenses + provides direct conduit for pathogens; aspiration of oropharyngeal/gastric contents around cuff; biofilm on ETT; impaired mucociliary clearance; sedation reduces cough; supine position promotes aspiration; chronic illness + immunosuppression + antibiotic-altered flora.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("FEVER + LEUKOCYTOSIS / leukopenia, hemodynamic changes, deteriorating gas exchange (worsening PaO2/FiO2 ratio + new oxygen requirements).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("PURULENT TRACHEAL secretions (color change, increased quantity).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("NEW or progressive radiographic INFILTRATE — chest x-ray or CT.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("WORSENING ventilator parameters — increased FiO2 + PEEP requirements, decreased static compliance.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors — duration of mechanical ventilation, supine positioning, neuromuscular blockade, paralytic, sedation, gastric overdistension, NG/OG tubes, reintubation, ARDS, COPD, immunosuppression, prior antibiotics, hospitalization, age >60.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("VAP CRITERIA (CDC/NHSN) — clinical + microbiologic + radiologic; ventilator-associated event (VAE) surveillance framework includes VAC + IVAC + possible/probable VAP.", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — ≥48 hours mechanical ventilation + new/progressive radiographic infiltrate + ≥2 clinical features (fever >38°C or <36°C, WBC >12K or <4K, purulent sputum, worsening oxygenation) per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("RADIOGRAPHIC — chest x-ray or CT showing new/progressive infiltrate; sensitivity limited by atelectasis + ARDS overlap.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MICROBIOLOGIC — quantitative respiratory cultures: ENDOTRACHEAL aspirate (≥10^5 CFU/mL), bronchoalveolar lavage (≥10^4 CFU/mL), protected specimen brush (≥10^3 CFU/mL); semi-quantitative cultures acceptable.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("BIOMARKERS — procalcitonin (variable utility), CRP, lactate (severity).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("VAE surveillance (CDC/NHSN) — ventilator-associated condition (VAC) → infection-related VAC (IVAC) → possible/probable VAP; reportable.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — atelectasis, pulmonary edema, ARDS, pulmonary embolism, drug reaction, alveolar hemorrhage.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("Daily VAP bundle compliance — HOB elevation, oral care, sedation interruption, SBT, DVT/PUD prophylaxis, subglottic suctioning, cuff pressure.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("VAP diagnosis vs alternative cause — comprehensive workup before antibiotics if stable.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Pathogen identification — respiratory cultures, blood cultures, biomarker trends.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Risk stratification — MDR risk (recent antibiotics, prolonged hospitalization, immunosuppression, MDR colonization).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — critical care + ID + pharmacy + respiratory therapy + nursing leadership for bundle compliance.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION BUNDLE — HOB ELEVATION 30-45° (reduces aspiration); ORAL CARE chlorhexidine 0.12% q6-8 hours; DAILY SEDATION INTERRUPTION + spontaneous breathing trials (early extubation); DVT prophylaxis; peptic ulcer disease (PUD) prophylaxis (PPI or H2-blocker); subglottic suctioning ETT (continuous or intermittent); cuff pressure 20-30 cm H2O; closed-circuit suctioning; minimize circuit changes per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("EMPIRIC ANTIBIOTICS — IDSA 2016 guidelines based on MDR risk + severity: low-risk monotherapy with anti-pseudomonal beta-lactam (cefepime, piperacillin-tazobactam) OR carbapenem (meropenem); high-risk + MDR concerns — double anti-pseudomonal coverage + anti-MRSA (vancomycin or linezolid).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("DE-ESCALATE based on cultures + susceptibility; 7 days typical duration (shorter than older 14-21 day standard) per IDSA.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("COMMON MDR pathogens — Pseudomonas aeruginosa, MRSA, Acinetobacter, ESBL Enterobacterales, carbapenem-resistant; institution antibiogram guides empiric.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("SUPPORTIVE — adequate oxygenation (lung-protective ventilation if ARDS), fluid balance, hemodynamic support, nutrition.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("REASSESS daily — antibiotic duration + de-escalation + ventilator weaning + extubation.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary infection control + stewardship.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("MDR PATHOGENS — increasing prevalence; institution antibiogram-driven; antimicrobial stewardship critical.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("BUNDLE COMPLIANCE — daily audit; reducing duration of mechanical ventilation is most impactful prevention.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ALTERNATIVE DIAGNOSIS — atelectasis vs VAP often difficult; aggressive pulmonary toileting + recruitment maneuvers.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MORTALITY — attributable mortality 10-15%; significant ICU length-of-stay + cost.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ASPIRATION risk during weaning + extubation; subsequent reintubation increases VAP recurrence.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ANTIBIOTIC RESISTANCE — repeated VAP risk; de-escalation + appropriate duration; biomarkers (procalcitonin) for treatment duration.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CDC NHSN REPORTING — VAE surveillance + reporting requirements + quality measure.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ICU-ACQUIRED complications — VAP + CLABSI + CAUTI + C. diff + pressure injuries + delirium; integrated prevention bundles.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum VILISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ventilator-induced-lung-injury",
        title: "Ventilator-induced lung injury (VILI)",
        subtitle: "VILI: barotrauma + volutrauma + atelectrauma + biotrauma · prevention with lung-protective ventilation (TV 6 mL/kg PBW + plateau ≤30 + driving pressure ≤15)",
        nclexTags: respCriticalTagR32,
        definition: AttributedProse(
            "Lung injury caused or worsened by mechanical ventilation — four mechanisms: BAROTRAUMA (high pressures), VOLUTRAUMA (high tidal volumes overstretching alveoli), ATELECTRAUMA (cyclical alveolar collapse + reopening), BIOTRAUMA (inflammation propagation from mechanical injury). Prevention with LUNG-PROTECTIVE VENTILATION — tidal volume 6 mL/kg predicted body weight, plateau pressure ≤30 cm H2O, driving pressure (plateau-PEEP) ≤15 cm H2O, adequate PEEP for recruitment, permissive hypercapnia per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "VOLUTRAUMA — alveolar overdistension (transpulmonary pressure too high) → alveolar epithelial + endothelial injury + inflammation; BAROTRAUMA — high airway pressures → alveolar rupture + pneumothorax/pneumomediastinum; ATELECTRAUMA — recurrent alveolar collapse/reopening shear forces → injury; BIOTRAUMA — local injury releases inflammatory mediators systemically → multi-organ dysfunction.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("WORSENING gas exchange — declining PaO2/FiO2 ratio, hypoxemia despite increased FiO2.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("INCREASED ventilator pressures — peak airway pressure + plateau pressure rising.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("DECREASED static compliance — lung becoming stiffer.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("PNEUMOTHORAX (barotrauma) — sudden hemodynamic instability, tracheal deviation, asymmetric breath sounds, hypotension, tachycardia, ECG/imaging.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("RADIOGRAPHIC — new/progressive infiltrates, atelectasis, hyperinflation, pneumothorax/pneumomediastinum/subcutaneous emphysema.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors — ARDS (heterogeneous lung), inappropriate ventilator settings (high tidal volume, low PEEP, high pressures), prolonged mechanical ventilation, baseline lung disease, fluid overload.", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — ventilated patient with worsening oxygenation + compliance + new infiltrates not explained by other causes per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CHEST IMAGING — new infiltrates, hyperinflation, pneumothorax/pneumomediastinum/subcutaneous emphysema; lung ultrasound bedside.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Ventilator measurements — peak airway pressure, plateau pressure, driving pressure (Pplat - PEEP), static compliance (TV/(Pplat-PEEP)), auto-PEEP.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ABG — worsening PaO2/FiO2 ratio + acid-base assessment.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — ARDS progression, ventilator-associated pneumonia, pulmonary edema, atelectasis, pulmonary embolism, pleural effusion.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("Implement LUNG-PROTECTIVE VENTILATION immediately — tidal volume 6 mL/kg PBW, plateau ≤30, driving pressure ≤15.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Daily review of ventilator settings + lung mechanics + driving pressure.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Identify ARDS — Berlin definition, severity stratification, evidence-based interventions.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Recognize complications (pneumothorax) — emergent treatment.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — critical care + respiratory therapy + pulmonology.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("LUNG-PROTECTIVE VENTILATION (ARDSnet) — tidal volume 6 mL/kg predicted body weight (PBW), plateau pressure ≤30 cm H2O, driving pressure (Pplat - PEEP) ≤15 cm H2O, adequate PEEP for recruitment, permissive hypercapnia (pH 7.20-7.45 acceptable) per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ARDS — additional interventions: PRONE POSITIONING ≥16 hours/day for moderate-severe (PaO2/FiO2 <150) per PROSEVA trial; neuromuscular blockade (cisatracurium) for severe early ARDS (ACURASYS trial — controversial); ECMO for refractory.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("OPTIMAL PEEP — recruitment maneuver + PEEP titration; balance recruitment vs overdistension; transpulmonary pressure monitoring in select.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PROMPT recognition + treatment of pneumothorax — chest tube; tension pneumothorax emergent needle decompression.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CONSERVATIVE FLUID strategy — net negative balance in stable ARDS (FACTT trial) reduces ventilator days.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Spontaneous breathing trials + extubation as soon as feasible.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Cuff pressure 20-30 cm H2O; appropriate ETT size; minimize unnecessary suctioning.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Sedation strategy — minimal effective; ABCDEF bundle; daily awakening + breathing trials.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("PNEUMOTHORAX — sudden hemodynamic decompensation; emergent.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PULMONARY EDEMA + ARDS PROGRESSION — fluid management + ECMO consideration.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("DELAYED EXTUBATION — increases VILI + VAP + delirium + ICU-acquired weakness; ABCDEF bundle + daily SBT.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("OVERDISTENSION — driving pressure > 15 + plateau > 30; reduce tidal volume, adjust PEEP.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ATELECTRAUMA — recruitment maneuvers + adequate PEEP; balance with overdistension.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MORTALITY in ARDS — significant; protective ventilation + proning + ECMO + treating underlying cause.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LONG-TERM OUTCOMES — ICU-acquired weakness + cognitive dysfunction + PTSD + functional decline + post-ICU syndrome.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AbdominalCompartmentSyndromeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "abdominal-compartment-syndrome",
        title: "Abdominal compartment syndrome (ACS)",
        subtitle: "Intra-abdominal HTN (IAH) >20 mm Hg + organ dysfunction · trauma + sepsis + post-op + burns · bladder pressure measurement · decompressive laparotomy",
        nclexTags: cardioCriticalTagR32,
        definition: AttributedProse(
            "Sustained intra-abdominal hypertension (IAH) >20 mm Hg with new organ dysfunction. IAH = sustained IAP >12 mm Hg; graded I-IV. Causes — secondary (sepsis, massive fluid resuscitation, ascites, ileus, bleeding) > primary (trauma, surgery, burns, abdominal organ pathology). Diagnosed via bladder pressure measurement. Treatment — medical (sedation, paralysis, NG decompression, diuresis, paracentesis) + surgical decompressive laparotomy with open abdomen per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "Increased intra-abdominal volume → elevated intra-abdominal pressure (IAP) → multi-system effects: CARDIAC (decreased preload + cardiac output, increased afterload), PULMONARY (cephalad diaphragm + atelectasis + decreased compliance + hypercapnia + hypoxemia), RENAL (oliguria/anuria), GI (decreased perfusion + ileus + mucosal ischemia + bacterial translocation), CNS (elevated ICP from venous congestion + decreased cerebral perfusion). Multi-organ failure if untreated.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("TENSE, DISTENDED ABDOMEN — clinical exam unreliable; bladder pressure measurement essential.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("OLIGURIA / ANURIA — renal hypoperfusion despite adequate volume + MAP.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("VENTILATOR — increased peak + plateau pressures, decreased compliance, worsening hypercapnia + hypoxemia.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("HEMODYNAMIC — hypotension + tachycardia + increased CVP/PCWP (paradoxically high despite reduced preload due to compressed vena cava + abdominal contents).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("LACTIC ACIDOSIS — bowel ischemia + decreased cardiac output.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("INCREASED ICP — communicating cause; neurologic deterioration.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors — TRAUMA (abdominal injury, fluid resuscitation, intra-abdominal bleeding), SEPSIS + massive fluid resuscitation, BURNS (large body surface area), POST-SURGICAL (open + closed laparotomy, retroperitoneal hematoma), ASCITES (cirrhotic + malignant), severe ILEUS, PANCREATITIS, intra-abdominal infection.", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BLADDER PRESSURE measurement — gold standard for IAP; instill 25 mL sterile saline via Foley → measure pressure at symphysis pubis with patient supine at end-expiration; convert mm Hg per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("GRADING — Grade I: IAP 12-15 mm Hg; Grade II: 16-20; Grade III: 21-25; Grade IV: >25 mm Hg; ACS = sustained IAP >20 mm Hg + new organ dysfunction.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("IMAGING — abdominal CT for cause (hematoma, bowel obstruction, fluid collections, ileus, organ pathology); ultrasound bedside for ascites.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ABG + lactate + Cr + LFTs — multi-organ dysfunction.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CVP + cardiac output measurements — paradoxically elevated CVP despite reduced preload.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — acute abdomen, gastric distension, paralytic ileus, large ascites without ACS, abdominal aortic aneurysm, mesenteric ischemia.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("RECOGNIZE IAH + ACS — high risk patients should have routine bladder pressure monitoring.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multi-organ dysfunction assessment — renal, pulmonary, cardiac, GI, CNS.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Identify cause + reverse if possible (drain ascites, decompress bowel, evacuate hematoma).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("EMERGENT surgical decompression if medical management fails.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — critical care + general surgery + trauma + transplant.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("MEDICAL MANAGEMENT first (Grade I-III IAH without organ dysfunction): adequate SEDATION + ANALGESIA (reduce muscle tone), NEUROMUSCULAR BLOCKADE (cisatracurium short-term), NG/OG TUBE decompression, RECTAL DECOMPRESSION/COLONIC DECOMPRESSION (neostigmine for Ogilvie pseudo-obstruction), DIURESIS / hemofiltration (volume removal — slow), PARACENTESIS (large-volume drainage if ascites), ENEMAS, MINIMAL ENTERAL FEEDING per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("AVOID volume overload — restrictive fluid resuscitation in at-risk patients; reverse positive fluid balance.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("DECOMPRESSIVE LAPAROTOMY — for ACS unresponsive to medical management (sustained IAP >25 with organ dysfunction OR Grade IV); midline laparotomy + open abdomen + temporary closure (KCI ABThera vacuum-assisted closure preferred); definitive closure after resolution.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("OPEN ABDOMEN management — vacuum-assisted closure, fluid + electrolyte loss compensation, infection control, gradual closure over days-weeks, planned ventral hernia repair later if cannot close.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Treat underlying cause — control hemorrhage, drain fluid collections, treat sepsis, manage burns, treat pancreatitis.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Hemodynamic support — vasopressors, inotropes (note paradoxically elevated CVP misleading).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Renal replacement therapy if AKI develops despite decompression.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Ventilator management — protective lung ventilation; pressures may be falsely elevated due to ACS.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — critical care + general surgery + trauma + GI + nephrology + wound care.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("MORTALITY — high (~40-60%); especially with multi-organ failure; early recognition + intervention critical.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("RECURRENCE — after decompression + temporary closure; bridge to definitive closure carefully.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("OPEN ABDOMEN complications — fistula, infection, fluid + protein loss, prolonged ICU stay, planned ventral hernia.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("REPERFUSION INJURY after decompression — sudden release of mediators + electrolytes; can cause hypotension, arrhythmia, multi-organ dysfunction transient worsening.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("BACTERIAL TRANSLOCATION — bowel mucosal ischemia → sepsis source; prophylactic antibiotics + monitor.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("FLUID OVERLOAD — major contributor; conservative resuscitation strategies prevent.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LONG-TERM SEQUELAE — ventral hernia, ICU-acquired weakness, PTSD, depression, functional decline.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CLINICAL DIAGNOSIS UNRELIABLE — bladder pressure essential in high-risk patients.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ALISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acute-limb-ischemia",
        title: "Acute limb ischemia (ALI)",
        subtitle: "Sudden limb perfusion compromise · 6 P's (pain + pallor + pulseless + paresthesia + poikilothermia + paralysis) · embolism vs thrombosis · time-critical revascularization",
        nclexTags: cardioCriticalTagR32,
        definition: AttributedProse(
            "Sudden decrease in limb perfusion that threatens limb viability — typically presents within 14 days of symptom onset. Causes — embolic (cardiac source — AF, valve, mural thrombus; arterial source — aneurysm, atheromatous plaque), thrombotic (in-situ thrombosis of pre-existing atherosclerotic disease, hypercoagulable states, vascular procedures, dissection), trauma, iatrogenic. Time-critical — irreversible muscle injury within 6 hours, severe within 24 hours. Rutherford classification + emergent revascularization per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "Sudden arterial occlusion → tissue ischemia → muscle injury within 4-6 hours (irreversible after 6+ hours) + nerve injury (especially sensory) within hours + ischemia-reperfusion injury when restored → compartment syndrome + rhabdomyolysis + hyperkalemia + multi-organ dysfunction; embolism typically more proximal occlusion vs thrombosis (longer ischemic segment); embolic ischemia often more severe initially due to less collateral circulation development.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("6 P's — PAIN (sudden severe limb pain, often initial), PALLOR (pale white limb), PULSELESS (absent distal pulses), PARESTHESIA (numbness, tingling — early), POIKILOTHERMIA (cool limb), PARALYSIS (motor weakness — late + ominous).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("BEDSIDE assessment — pulse exam (palpation + Doppler), capillary refill, skin temperature, sensory + motor exam, ankle-brachial index (ABI).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("RUTHERFORD classification — Class I (viable — sensory intact, motor intact, no muscle pain), Class IIa (marginally threatened — mild sensory deficit, no motor deficit, no muscle pain), Class IIb (immediately threatened — sensory loss, mild motor deficit, muscle pain — EMERGENT), Class III (irreversibly damaged — sensory + motor paralysis, muscle rigid, no Doppler, amputation likely).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("EMBOLISM features — sudden onset, no prior claudication, cardiac source identified, contralateral limb pulses present.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("THROMBOSIS features — prior claudication symptoms, gradual progression, bilateral peripheral artery disease, atherosclerotic risk factors.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors — atrial fibrillation, valvular heart disease, recent MI with mural thrombus, peripheral artery disease, hypercoagulable states, vascular procedures, trauma, aortic dissection, popliteal aneurysm.", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — 6 P's + Rutherford classification per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ANKLE-BRACHIAL INDEX (ABI) — absent or <0.4 in severe; may be unreliable in calcified vessels (diabetes, CKD).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("DOPPLER bedside — arterial waveforms; absent monophasic + barely audible suggests severe ischemia.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("DUPLEX ULTRASOUND — confirms location + degree of occlusion + identifies embolism vs thrombosis vs dissection.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CT ANGIOGRAPHY — definitive imaging; precise occlusion location + collaterals + procedural planning; contrast caution in renal impairment.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CONVENTIONAL ANGIOGRAPHY — gold standard; allows simultaneous diagnostic + therapeutic (thrombolysis, thrombectomy).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("WORKUP for source — ECG (atrial fibrillation), echocardiogram (cardiac thrombus + valve), hypercoagulable workup, aorta + popliteal imaging.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LABS — CBC, electrolytes (K), Cr, lactate, CK (rhabdomyolysis), coagulation, type/screen.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — chronic critical limb ischemia, deep vein thrombosis (phlegmasia cerulea dolens), acute compartment syndrome from trauma, vasculitis, dissection.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("EMERGENT vascular surgery consultation — limb viability time-critical.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Rutherford classification — guides intervention urgency + approach.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Immediate IV ANTICOAGULATION — heparin bolus + drip (50-100 U/kg bolus + 18 U/kg/hr; target aPTT 1.5-2.5x baseline).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Pain management, IV access, type + cross-match, NPO for procedure.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Identify source — embolic vs thrombotic; cardiac workup + comprehensive evaluation.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("EMERGENT IV HEPARIN — bolus 50-100 U/kg + drip 18 U/kg/hr titrated to aPTT 1.5-2.5x baseline; prevents thrombus propagation per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("REVASCULARIZATION — emergent for Rutherford IIb + III; options based on lesion + patient: SURGICAL EMBOLECTOMY (Fogarty balloon, especially for cardiac embolism + macrovascular occlusion), CATHETER-DIRECTED THROMBOLYSIS (alteplase, urokinase — for Rutherford IIa + selected IIb; risk of bleeding), PERCUTANEOUS THROMBECTOMY (aspiration, mechanical), SURGICAL BYPASS (for chronic thrombosis with poor inflow + outflow), ENDOVASCULAR (stent + angioplasty for stenotic lesions).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("FASCIOTOMY — for compartment syndrome (suspect for ischemia >4-6 hours OR clinical features); 4-compartment fasciotomy of leg if needed.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("AMPUTATION — Rutherford III (irreversibly damaged tissue, paralysis, no Doppler); life-saving when revascularization not feasible OR will compromise patient survival.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("REPERFUSION SYNDROME — anticipate after revascularization; sudden potassium release, lactic acidosis, myoglobinuria; aggressive K management, alkalinization (bicarbonate), aggressive fluids, calcium gluconate; sometimes hemodialysis if severe; ICU monitoring.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PAIN management — IV opioids; nerve blocks for procedural; avoid NSAIDs (renal + bleeding).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("SOURCE WORKUP + treatment — cardiac source (anticoagulation for atrial fibrillation, valve replacement), aortic source (TEE/CT for dissection), hypercoagulable workup, peripheral artery disease modification.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — vascular surgery + critical care + cardiology + nephrology + wound care + rehabilitation.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("LIMB LOSS / AMPUTATION — mortality + morbidity significant; particularly in irreversible ischemia (Rutherford III).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("COMPARTMENT SYNDROME post-revascularization — emergent fasciotomy; failure to recognize → permanent muscle + nerve injury.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("REPERFUSION INJURY — hyperkalemia + lactic acidosis + rhabdomyolysis + myoglobinuria + AKI + cardiac arrhythmia; aggressive management.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MORTALITY — 10-30% in hospital; cardiac source + age + comorbidities + delayed presentation worse.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("RECURRENT events — anticoagulation + source treatment + cardiovascular risk reduction.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("THROMBOLYSIS bleeding — major + minor; contraindications + monitoring.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CHRONIC LIMB ISCHEMIA — long-term follow-up + secondary prevention + vascular medicine + rehabilitation.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CARDIAC SOURCE — atrial fibrillation anticoagulation, valve replacement, mural thrombus management.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PSYCHOSOCIAL impact — amputation grief + functional decline + caregiver burden.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SubmassivePESample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "submassive-massive-pulmonary-embolism",
        title: "Submassive + massive pulmonary embolism",
        subtitle: "PE risk stratification · massive (hypotension/shock) · submassive (RV dysfunction + biomarkers but normotensive) · thrombolysis selection · ICU + ECMO refractory",
        nclexTags: cardioCriticalTagR32,
        definition: AttributedProse(
            "PE risk stratification — MASSIVE PE: sustained hypotension (SBP <90 × ≥15 min, vasopressor requirement, signs of shock); SUBMASSIVE PE: hemodynamically stable but RIGHT VENTRICULAR DYSFUNCTION (echo, CT signs, BNP elevation, troponin elevation); LOW-RISK PE: hemodynamically stable + no RV dysfunction. SYSTEMIC THROMBOLYSIS (alteplase 100 mg over 2 hours) for massive; controversial for submassive (PEITHO trial — reduced hemodynamic decompensation but increased bleeding). CATHETER-DIRECTED THROMBOLYSIS (lower dose, targeted), THROMBECTOMY, ECMO emerging for submassive + refractory per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "PE causes right ventricular pressure overload + dysfunction → RV failure + reduced LV preload → systemic hypotension. Massive PE causes immediate cardiac arrest from obstructive shock. Submassive — RV strains but hemodynamics maintained initially; can decompensate to massive. Reperfusion improves RV function + reduces chronic thromboembolic pulmonary hypertension (CTEPH) risk; bleeding risk balances thrombolysis benefit.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("MASSIVE PE — sudden hypotension, syncope, shock; cardiac arrest in ~5%.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("SUBMASSIVE PE — dyspnea, chest pain, tachycardia, near-syncope; hemodynamically stable but RV dysfunction signs.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("CLINICAL — sudden dyspnea + tachypnea + tachycardia + chest pain + hypoxemia; non-specific often delayed diagnosis.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("VENOUS THROMBOSIS source — recent DVT, immobility, surgery, malignancy, hypercoagulable state.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("SHOCK INDEX — HR/SBP >0.7 suggestive of significant PE; >1.0 severe.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors — DVT, recent surgery (especially orthopedic), immobility, hospitalization, malignancy, pregnancy + postpartum, hormonal therapy, obesity, smoking, hypercoagulable states, prior VTE, advanced age, COVID-19.", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CT PULMONARY ANGIOGRAPHY (CTPA) — gold standard; identifies thrombus + extent + size; RV dysfunction signs (RV/LV ratio >1.0, IVC dilation, septal flattening) per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ECHO — bedside; RV dilation + dysfunction + tricuspid regurgitation + McConnell sign (RV free-wall hypokinesis with apical sparing) + septal flattening + IVC dilation; for shock + risk stratification.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ECG — sinus tachycardia, S1Q3T3 (classic but uncommon), T-wave inversions in V1-V4, right axis deviation, RBBB.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("BIOMARKERS — BNP/NT-proBNP elevation (RV strain), troponin elevation (RV ischemia + injury); risk stratification.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ABG — hypoxemia + hypocapnia (hyperventilation); A-a gradient widened.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("DVT WORKUP — duplex ultrasound legs.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("RISK STRATIFICATION — PESI score (PE Severity Index), simplified PESI, Bova score, ESC 4-tier risk stratification (high/intermediate-high/intermediate-low/low).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("HYPERCOAGULABLE workup if unprovoked + selected scenarios.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — acute coronary syndrome, aortic dissection, tension pneumothorax, ARDS, pericardial tamponade, severe pneumonia.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("EMERGENT — hemodynamic instability + life threat; rapid diagnosis + risk stratification + treatment.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MASSIVE PE — emergent thrombolysis OR thrombectomy OR ECMO; cardiac arrest support.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("SUBMASSIVE PE — RV dysfunction + biomarker assessment; thrombolysis selection controversial; consider catheter-directed.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PE RESPONSE TEAM (PERT) — multidisciplinary pulmonology + cardiology + critical care + interventional + cardiac surgery for complex cases.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Anticoagulation immediate — even before diagnosis confirmed in high suspicion.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("IMMEDIATE ANTICOAGULATION — IV unfractionated heparin (80 U/kg bolus + 18 U/kg/hr) OR weight-based enoxaparin; titrate aPTT 1.5-2.5x baseline OR anti-Xa levels per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MASSIVE PE — SYSTEMIC THROMBOLYSIS: ALTEPLASE 100 mg IV over 2 hours OR TENECTEPLASE weight-based bolus; if contraindicated → SURGICAL EMBOLECTOMY (cardiothoracic surgery) OR CATHETER-DIRECTED THROMBECTOMY (interventional cardiology/radiology).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("SUBMASSIVE PE — controversial: full-dose systemic thrombolysis (PEITHO trial — reduced decompensation but ICH); CATHETER-DIRECTED THROMBOLYSIS (lower dose alteplase 20-25 mg via pulmonary artery catheter); systemic anticoagulation alone + close monitoring; PE response team consultation.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ECMO — for refractory cardiac arrest OR severe RV failure not responsive to other measures; bridge to recovery or thrombectomy.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("IVC FILTER — for active bleeding precluding anticoagulation OR recurrent PE despite adequate anticoagulation; ideally retrievable.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("HEMODYNAMIC SUPPORT — fluids cautiously (RV preload sensitive — too much worsens RV dysfunction), VASOPRESSORS (norepinephrine first-line), inotropes (dobutamine + milrinone for RV failure), avoid intubation if possible (positive pressure worsens RV failure).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("OXYGEN therapy + non-invasive ventilation if needed; lung-protective ventilation if intubation required.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LONG-TERM ANTICOAGULATION — minimum 3 months; lifelong for unprovoked, malignancy-associated, recurrent, persistent risk factors; DOACs preferred for most (rivaroxaban, apixaban initial use; dabigatran + edoxaban after LMWH lead-in); warfarin alternative; LMWH for malignancy.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("FOLLOW-UP — echocardiogram for RV recovery + chronic thromboembolic pulmonary hypertension (CTEPH) screening (~2-4% of PE patients); cardiopulmonary rehabilitation if functional limitation.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("HEMODYNAMIC DECOMPENSATION — submassive PE can progress; rapid recognition + thrombolysis OR thrombectomy.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CARDIAC ARREST — emergent ACLS + bedside echo + emergent thrombolysis (alteplase 50 mg push) + ECMO.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("THROMBOLYSIS BLEEDING — major (intracranial 2-3%), particularly elderly + uncontrolled HTN + recent surgery/trauma.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("RV DYSFUNCTION — persistent + chronic thromboembolic pulmonary hypertension (CTEPH); long-term echo surveillance.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CTEPH — chronic thromboembolic pulmonary hypertension; surveillance V/Q scan + echo at 3-6 months; if positive — refer for pulmonary endarterectomy assessment.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("RECURRENT VTE — appropriate duration anticoagulation; hypercoagulable workup; risk reduction.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MORTALITY — massive PE 25-65%; submassive 5-25%; low-risk <5%.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LONG-TERM SEQUELAE — chronic dyspnea + functional limitation + CTEPH; rehabilitation + appropriate workup.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PE RESPONSE TEAM coordination — particularly for complex submassive + intermediate-high risk.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ADHFSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acute-decompensated-heart-failure",
        title: "Acute decompensated heart failure (ADHF)",
        subtitle: "Hospitalization for HF symptoms · congestive (wet) vs low-output (cold) profiles · IV diuretics + vasodilators + inotropes per profile · CRT + transplant late",
        nclexTags: cardioCriticalTagR32,
        definition: AttributedProse(
            "Acute exacerbation of heart failure with worsening symptoms (dyspnea, edema, fatigue) requiring hospitalization. Classified by hemodynamic profile — \"wet\" (congested) vs \"dry\" (euvolemic) + \"warm\" (well-perfused) vs \"cold\" (hypoperfused). Treatment based on profile — IV diuretics + vasodilators for wet-warm (most common), inotropes + diuretics for wet-cold, fluids for dry-cold, oral optimization for dry-warm. Long-term — chronic HF GDMT (ARNI/ACE-I/ARB + beta-blocker + MRA + SGLT2-i + diuretics + ICD/CRT + transplant when refractory) per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "Decompensation of chronic heart failure OR de novo ADHF; preserved (HFpEF) vs reduced (HFrEF) ejection fraction. Volume overload → increased preload + pulmonary congestion → orthopnea + dyspnea + edema; reduced cardiac output → cold extremities + hypoperfusion. Triggers — non-adherence (medication + diet + fluid restriction), HTN crisis, ischemia/MI, arrhythmia (atrial fibrillation), infection, anemia, thyroid disease, drugs (NSAIDs, chemotherapy, alcohol), surgery, pregnancy.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("CONGESTIVE (wet) — dyspnea, orthopnea, paroxysmal nocturnal dyspnea, lower extremity edema, weight gain, jugular venous distension, S3 gallop, ascites, hepatomegaly, pleural effusions.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("LOW-OUTPUT (cold) — cool extremities, mottling, decreased urine output, altered mental status, lactic acidosis, narrow pulse pressure, hypotension, weak peripheral pulses.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("PROFILES — A (warm + dry, well-compensated), B (warm + wet, most common ADHF), C (cold + wet, decompensated low-output), L (cold + dry, severe low-output without congestion).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("TRIGGERS — non-adherence, HTN crisis, ACS, arrhythmias, infection, anemia, thyroid, NSAIDs, alcohol, drug toxicity, surgery.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors — chronic HF (HFrEF or HFpEF), CAD, HTN, atrial fibrillation, diabetes, CKD, valvular disease, cardiomyopathy, age.", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — symptoms + signs of decompensation; hemodynamic profile assessment.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("BNP / NT-proBNP — elevation supports diagnosis; cutoffs vary; rule-out value if low.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CHEST X-RAY — pulmonary edema (Kerley B lines, batwing distribution, cardiomegaly), pleural effusions.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ECHO — EF, valves, RV function, pericardium; bedside POCUS for quick assessment.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ECG — ischemia, arrhythmia, hypertrophy, conduction abnormalities.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Lung ultrasound bedside — B-lines (pulmonary edema), pleural effusions; rapid assessment.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LABS — BNP/NT-proBNP, electrolytes, BUN/Cr, LFTs, troponin (rule out ACS), TSH, CBC, lactate (severity).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Hemodynamic monitoring — PA catheter rarely needed; bedside echo + clinical assessment usually sufficient.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — COPD exacerbation, pneumonia, PE, pulmonary fibrosis, anemia, hyperthyroidism.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("Hemodynamic profile — wet/dry + warm/cold guides treatment.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Identify TRIGGER — non-adherence, HTN, ischemia, arrhythmia, infection.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Cardiology + critical care for severe.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Risk stratification — biomarker trends, end-organ function, response to therapy.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Advance care planning + goals of care + heart failure specialists.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("WET-WARM (most common) — IV LOOP DIURETICS (furosemide 2-2.5x outpatient dose IV bolus OR continuous infusion 5-20 mg/h); IV NITROGLYCERIN drip if HTN + pulmonary edema (preload + afterload reduction); ARNI/ACE-I/ARB + beta-blocker + MRA OPTIMIZE; monitor weight + UOP + electrolytes; transition to oral when euvolemic per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("WET-COLD — INOTROPES (dobutamine 2.5-10 mcg/kg/min OR milrinone 0.25-0.75 mcg/kg/min) + DIURETICS + vasopressor for hypotension; consider intra-aortic balloon pump (IABP) OR LVAD OR transplant evaluation.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("DRY-COLD — IV FLUIDS cautiously (small bolus 250-500 mL) + inotropes if hypotensive; sometimes overlooked profile.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("DRY-WARM — optimize OUTPATIENT chronic HF therapy (ARNI/ACE-I/ARB + beta-blocker + MRA + SGLT2-i + diuretics + ICD/CRT); discharge planning.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("VENTILATORY support — NIV (BiPAP) for acute pulmonary edema (often dramatic improvement); intubation if NIV failure OR exhaustion.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ARRHYTHMIA management — atrial fibrillation rate vs rhythm control; ventricular arrhythmias.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ULTRAFILTRATION — for diuretic-resistant fluid overload; some centers.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ADVANCED therapies — left ventricular assist device (LVAD), cardiac transplantation for refractory; palliative care + hospice for end-stage.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("DISCHARGE — diuretic + ARNI/ACE-I/ARB + beta-blocker + MRA + SGLT2-i optimization; cardiac rehabilitation; close follow-up; education + self-monitoring + adherence.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — cardiology + critical care + heart failure specialty + nursing + dietitian + PT/OT + social work + palliative.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("MORTALITY — in-hospital ADHF 4-7%; 1-year post-discharge 25-30%; readmission 20-30% within 30 days.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CARDIOGENIC SHOCK — wet-cold; emergent inotropes + MCS (IABP, Impella, ECMO, LVAD); transplant evaluation.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("DIURETIC RESISTANCE — escalate dose, continuous infusion, add metolazone, ultrafiltration.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CARDIORENAL SYNDROME — Cr rise with diuresis; balance volume + renal function; close monitoring.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("HYPONATREMIA + HYPOKALEMIA + electrolyte derangements — aggressive correction.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ATRIAL FIBRILLATION — common trigger + complication; rate control + anticoagulation.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PALLIATIVE CARE — early integration; advance directives + symptom management + end-of-life decisions.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("READMISSION reduction — patient education + adherence + post-discharge clinic + community resources.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary HF clinic — proven to reduce readmissions + mortality.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AcuteCholangitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "severe-acute-cholangitis",
        title: "Severe acute cholangitis (Tokyo guidelines)",
        subtitle: "Bile duct infection + obstruction + sepsis · CHARCOT TRIAD (fever + RUQ pain + jaundice) + REYNOLDS PENTAD (mental status + shock) · ERCP + antibiotics emergent",
        nclexTags: infectionCriticalTagR32,
        definition: AttributedProse(
            "Bacterial infection of the biliary tract caused by bile duct obstruction (stone, stricture, malignancy, post-ERCP). Classic CHARCOT TRIAD (fever, RUQ pain, jaundice ~70% sensitive); REYNOLDS PENTAD adds altered mental status + shock (severe form). Tokyo Guidelines severity grading — MILD (Grade I — responds to medical therapy), MODERATE (Grade II — failure of medical or local complications), SEVERE (Grade III — organ dysfunction). EMERGENT biliary drainage (ERCP + sphincterotomy + stone extraction or stent OR percutaneous transhepatic) + antibiotics per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "Bile duct obstruction → increased intraductal pressure → bacterial translocation from intestine OR ascending infection → bile-borne bacteremia → SEPSIS. Common pathogens — E. coli, Klebsiella, Enterococcus, Pseudomonas; anaerobes (Bacteroides). Untreated severe cholangitis → multi-organ failure + death within hours-days.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("CHARCOT TRIAD — FEVER (often with rigors), RUQ PAIN, JAUNDICE; ~70% sensitive (many lack triad).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("REYNOLDS PENTAD — Charcot triad + ALTERED MENTAL STATUS + SHOCK; severe disease with multi-organ involvement.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Murphy sign sometimes (especially with concurrent acute cholecystitis); hepatomegaly + tenderness.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("SEPSIS features — tachycardia, hypotension, tachypnea, mental status changes, lactic acidosis, oliguria.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("PRURITUS — chronic biliary obstruction precedes acute event.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("ELDERLY + IMMUNOCOMPROMISED — atypical presentation; less prominent triad; high suspicion needed.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors — choledocholithiasis (CBD stone — most common), benign biliary strictures (PSC, postsurgical), malignant strictures (pancreatic + cholangiocarcinoma), recent ERCP, hepatolithiasis, biliary parasites (Asia, Oriental cholangitis), AIDS cholangiopathy, immunocompromise.", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("TOKYO GUIDELINES 2018 — A. Systemic inflammation (fever >38°C OR shaking chills, lab — WBC <4 or >10K, CRP elevation); B. Cholestasis (jaundice — total bili ≥2 OR abnormal LFTs — ALP, GGT, AST/ALT >1.5x ULN); C. Imaging (biliary dilation OR evidence of etiology — stricture, stone, stent, malignancy); SUSPECTED diagnosis = A + (B OR C); DEFINITE = A + B + C per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("SEVERITY GRADING (Tokyo) — Grade I (mild — no organ dysfunction); Grade II (moderate — meets ≥2 of: WBC >12K, fever >39°C, age ≥75, total bilirubin ≥5, albumin <0.7); Grade III (severe — organ dysfunction in any of cardiovascular, neurologic, respiratory, renal, hepatic, hematologic).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LABS — CBC + CMP + LFTs + lactate + lipase + INR + procalcitonin + blood cultures × 2 sets; biliary cultures during ERCP.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("IMAGING — RUQ ULTRASOUND first (rapid, biliary dilation, gallstones); MRCP (non-invasive, anatomy); EUS for distal CBD stones + cancer staging; ERCP both diagnostic + therapeutic.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — acute cholecystitis (Murphy + RUQ + gallbladder wall thickening), acute hepatitis, liver abscess, pancreatitis, biliary obstruction without infection, pyogenic liver abscess.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("Tokyo Grade III severe — EMERGENT biliary drainage + ICU.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Sepsis bundle — early antibiotics, fluid resuscitation, vasopressors, lactate, source control.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — gastroenterology (ERCP) + interventional radiology (PTC) + general surgery + critical care.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Source identification — stone, stricture, malignancy.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Anticoagulation status + procedural planning.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("EMPIRIC IV ANTIBIOTICS — start within 1 hour of recognition (sepsis bundle); cover Enterobacteriaceae + enterococci + anaerobes (piperacillin-tazobactam OR ceftriaxone + metronidazole OR cefepime + metronidazole OR carbapenem in severe); narrow per cultures; typical duration 5-10 days post-drainage per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("BILIARY DRAINAGE — EMERGENT for Grade III + severe (within 24-48 hours), urgent for Grade II (within 24 hours), elective for Grade I responding to medical therapy; ENDOSCOPIC ERCP — first-line (sphincterotomy + stone extraction OR stent placement); PERCUTANEOUS TRANSHEPATIC (PTC) — alternative if ERCP unavailable or unsuccessful OR proximal obstruction; SURGICAL drainage — rare; reserve for failures.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Sepsis bundle — IV fluid resuscitation 30 mL/kg crystalloid + lactate measurement + vasopressors (norepinephrine first-line) for shock + source control + steroids for refractory shock.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Pain control — IV opioids; avoid NSAIDs (renal, bleeding).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("NPO + IV fluids + supportive ICU care.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Coagulopathy correction — vitamin K + FFP if INR elevated, especially for procedures.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Cholecystectomy — after recovery if cholelithiasis source (laparoscopic typically; same admission OR early interval).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Malignant obstruction — palliative stenting + oncology referral; cancer staging + treatment.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Cancer surveillance + follow-up — primary sclerosing cholangitis (PSC) at increased cholangiocarcinoma risk; AIDS cholangiopathy management.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("SEPTIC SHOCK + multi-organ failure — Grade III + delayed drainage; mortality 10-30%.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("INADEQUATE DRAINAGE — persistent infection + ongoing sepsis; reassess + repeat intervention.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CHOLANGITIS RECURRENCE — incomplete stone removal + persistent obstruction + stent migration/blockage; ongoing management.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PANCREATITIS post-ERCP — ~5%; supportive care + close monitoring.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("BLEEDING post-sphincterotomy — uncommon; transfusion + repeat endoscopy if needed.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PERFORATION post-ERCP — emergent surgery if duodenal/biliary tree perforation.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MALIGNANT obstruction — palliative + cancer evaluation + multidisciplinary oncology.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CHOLANGIOCARCINOMA in PSC — surveillance with MRCP + CA 19-9; concerning lesions biopsy.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Elderly + immunocompromised — atypical presentation + high mortality; high index of suspicion.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BowelPerforationSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bowel-perforation",
        title: "Bowel perforation",
        subtitle: "Surgical emergency · free air on imaging · peptic ulcer + diverticulitis + cancer + ischemia + trauma + iatrogenic · emergent laparotomy + antibiotics",
        nclexTags: infectionCriticalTagR32,
        definition: AttributedProse(
            "Disruption of gastrointestinal wall causing intra-abdominal contamination → peritonitis + sepsis. Causes — peptic ulcer disease (typically gastric or duodenal — anterior perforation), diverticulitis (sigmoid + cecal), bowel obstruction with closed loop, ischemic bowel, cancer (colon + gastric), inflammatory (Crohn's, toxic megacolon, severe colitis), iatrogenic (endoscopic + surgical complications), trauma (penetrating + blunt), foreign body. EMERGENT — surgical exploration + repair + peritoneal lavage + antibiotics + ICU support per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "Bowel wall disruption → gastrointestinal contents enter peritoneal cavity → CHEMICAL peritonitis (acid, bile, enzymes initially) → BACTERIAL peritonitis (within hours, especially with colonic perforation due to dense microbial load) → systemic inflammation + sepsis + multi-organ dysfunction; gas escapes → free air on imaging.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("SUDDEN SEVERE abdominal pain — often constant + severe + worsening with movement.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("PERITONITIS — generalized abdominal rigidity (board-like), severe tenderness, rebound, guarding, decreased bowel sounds, fever, tachycardia.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("SHOULDER PAIN — referred from diaphragmatic irritation by free air or fluid.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("SEPSIS — hypotension, altered mental status, tachycardia, tachypnea, fever, lactic acidosis.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("VOMITING + nausea common.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("HISTORY clues — known peptic ulcer + NSAID/steroid use, diverticulitis history, recent endoscopy/colonoscopy, abdominal trauma, IBD, severe constipation/obstruction symptoms.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors — peptic ulcer disease (H. pylori, NSAIDs, steroids), diverticulitis (age, low-fiber diet), bowel obstruction, IBD (Crohn's, UC severe), ischemic bowel, cancer, recent endoscopic procedures, trauma, foreign body, drug use (cocaine vasoconstriction), elderly + immunocompromised.", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — acute abdomen with peritonitis features in appropriate context per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("UPRIGHT CHEST X-RAY — free air under diaphragm (~70% sensitivity); upright abdominal X-ray; lateral decubitus.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CT ABDOMEN/PELVIS with IV contrast — most sensitive (98%+); identifies free air, free fluid, perforation site, cause (stone, mass, diverticulitis, ischemia).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LABS — CBC (leukocytosis + bandemia), CMP, lactate (severity), lipase (rule out pancreatitis), LFTs, INR/PTT, type/screen, blood cultures × 2.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ABG — metabolic acidosis with lactate elevation in ischemia/sepsis.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Bedside ULTRASOUND — free fluid, abscess.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ENDOSCOPY — typically AVOID in suspected perforation (worsens leak); diagnostic role limited.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — acute cholecystitis, pancreatitis, ruptured AAA, mesenteric ischemia, ectopic pregnancy, ovarian cyst rupture, perforated viscus from foreign body.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("EMERGENT — surgical consult.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Sepsis bundle — IV antibiotics within 1 hour, fluid resuscitation 30 mL/kg, lactate, vasopressors, source control.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("NPO + IV fluids + NG decompression + Foley catheter + IV access.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Operative planning — surgical risk assessment, anesthesia, blood products, ICU.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Anticoagulation status + reversal if needed.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("IMMEDIATE EMPIRIC ANTIBIOTICS — broad-spectrum covering enteric flora: piperacillin-tazobactam OR ceftriaxone + metronidazole OR carbapenem in severe; coverage of gram-positive + gram-negative + anaerobes per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("SEPSIS RESUSCITATION — 30 mL/kg crystalloid initial + vasopressors (norepinephrine) for shock + lactate + blood cultures + procalcitonin trend.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("EMERGENT LAPAROTOMY (or laparoscopy in select stable patients) — exploration + repair (primary closure for small recent perforations, resection + anastomosis OR ostomy for larger/older or with extensive contamination) + peritoneal lavage + drains.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("DAMAGE CONTROL surgery — for unstable patients; abbreviated procedure + temporary abdominal closure (vacuum-assisted) + ICU resuscitation + planned reoperation.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("NG/OG decompression + bowel rest; nutritional support post-operative (early enteral if tolerated).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ICU + hemodynamic monitoring + mechanical ventilation + organ support as needed.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Pain control — IV opioids; multimodal.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("VTE prophylaxis post-stabilization; surgical timing balance with bleeding risk.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PERCUTANEOUS DRAINAGE — for stable patients with localized abscess + sealed perforation (less common — usually requires surgery).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Underlying cause treatment — H. pylori eradication, NSAID discontinuation, diverticulitis management, cancer treatment, IBD management, ischemic bowel revascularization.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — surgery + critical care + ID + GI + radiology + nutrition + wound care.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("MORTALITY — 5-30% depending on cause, delay, age, comorbidities; older + immunocompromised + colonic perforation worse.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ABDOMINAL COMPARTMENT SYNDROME — fluid overload + open abdomen risk; bladder pressure monitoring.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("INTRA-ABDOMINAL ABSCESS — postoperative; percutaneous drainage + antibiotics.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ANASTOMOTIC LEAK — postoperative complication; reoperation + drainage + diversion.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ICU complications — VAP + CLABSI + AKI + delirium + multi-organ failure.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ENTEROCUTANEOUS FISTULA — postoperative; wound care + nutrition + nutritional support.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("SHORT BOWEL syndrome — large resections; specialized GI + nutrition.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("OSTOMY management — counseling + WOCN nursing + reversal planning.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LONG-TERM — incisional hernia, adhesions, bowel obstruction, recurrent perforation if underlying disease persists, chronic pain.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HAEAttackSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hereditary-angioedema-attack",
        title: "Hereditary angioedema (HAE) attack",
        subtitle: "C1-INH deficiency · bradykinin-mediated edema (NOT histamine) · laryngeal/airway emergent · icatibant + C1-INH + ecallantide · NOT responsive to epinephrine + antihistamines",
        nclexTags: infectionCriticalTagR32,
        definition: AttributedProse(
            "Recurrent episodes of subcutaneous/submucosal swelling from C1 esterase inhibitor (C1-INH) deficiency or dysfunction. Three types — Type I (C1-INH quantity low — 85%), Type II (C1-INH dysfunctional but normal quantity — 15%), Type III (estrogen-related, normal C1-INH levels). Attacks last 3-5 days untreated; LARYNGEAL involvement is AIRWAY EMERGENCY. Bradykinin-mediated (NOT histamine — does NOT respond to epinephrine, antihistamines, steroids). Treat with icatibant, C1-INH concentrate, ecallantide, or fresh frozen plasma per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "C1-INH deficiency → uncontrolled kallikrein activity → bradykinin overproduction → bradykinin-mediated vasodilation + vascular permeability + edema. Triggers — trauma, surgery (especially dental), infection, stress, estrogen-containing medications (OCPs, HRT), ACE inhibitors, ARBs, certain medications. Distinct from allergic angioedema (histamine-mediated). Laryngeal involvement can be fatal within hours.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("RECURRENT angioedema attacks — non-pitting subcutaneous/submucosal swelling lasting 3-5 days untreated; non-pruritic.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("CUTANEOUS attacks — face, extremities, genitals; non-pitting, painless or mild discomfort; cosmetic disfiguring.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("LARYNGEAL attacks (~50% lifetime) — voice change, hoarseness, dysphagia, dyspnea, stridor; AIRWAY EMERGENCY; can be fatal within hours.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("ABDOMINAL attacks — severe colicky abdominal pain, nausea, vomiting, diarrhea; mimics acute abdomen; many unnecessary surgeries before HAE diagnosis.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("NO URTICARIA, NO bronchospasm (vs allergic angioedema).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("FAMILY history of similar attacks (autosomal dominant inheritance for types I + II).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("PRODROME — nonspecific (~70% — fatigue, irritability, tingling, erythema marginatum); attack imminent.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors / triggers — dental procedures + surgery (PROPHYLAXIS essential), trauma, infection, stress, estrogens (OCPs, HRT — avoid), ACE-inhibitors + ARBs (avoid), some medications, menstrual cycle, pregnancy (often improves), exertion.", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("C1-INH LEVELS + FUNCTIONAL ASSAY + C4 — Type I (low C1-INH antigen + low C1-INH function + low C4); Type II (normal C1-INH antigen + low C1-INH function + low C4); Type III (normal C1-INH + normal C4 + family history + clinical attacks) — diagnostic per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("C4 LEVEL — typically LOW during + between attacks (consumed by complement activation); screening test.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("C1q LEVEL — distinguishes hereditary from acquired (LOW C1q in acquired HAE with lymphoproliferative disease).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Type III testing — F12 gene mutation; clinical diagnosis when characteristic features + normal C1-INH.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("GENETIC TESTING — SERPING1 gene (C1-INH gene) for confirmation; family screening.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — allergic angioedema (histamine-mediated — urticaria + responds to epinephrine), ACE-inhibitor angioedema (bradykinin-mediated but distinct mechanism), acquired angioedema (lymphoma, autoantibody — low C1q distinguishes), idiopathic.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("AIRWAY assessment — emergent for any laryngeal involvement.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("HAE-specific therapy — NOT responsive to epinephrine + antihistamines + steroids; need specific HAE therapy.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("HAE specialist consultation — immunology, allergy, HAE-specialized.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Patient education — recognize attacks, emergency action plan, prophylaxis for procedures.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Family screening + genetic counseling.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE LARYNGEAL ATTACK — EMERGENT airway management + HAE-specific therapy; intubation if rapid progression; cricothyrotomy backup; ICU.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ACUTE THERAPY OPTIONS — ICATIBANT (Firazyr) 30 mg SC; C1-INH CONCENTRATE (Berinert IV, Ruconest IV); ECALLANTIDE (Kalbitor SC); FRESH FROZEN PLASMA (FFP) when others unavailable per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ABDOMINAL ATTACKS — HAE-specific therapy + IV fluids + IV opioids; resolves with treatment; avoid unnecessary laparotomy.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CUTANEOUS attacks — HAE-specific therapy; can sometimes wait if mild + cosmetically tolerable.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LONG-TERM PROPHYLAXIS — for frequent/severe attacks: LANADELUMAB (Takhzyro) SC q2-4 weeks; BEROTRALSTAT (Orladeyo) oral daily; C1-INH (Cinryze IV q3-4 days OR Haegarda SC); attenuated androgens (danazol — limited use due to side effects).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PROCEDURAL PROPHYLAXIS — for dental + surgical procedures + endoscopy + intubation; C1-INH (1000 units IV) OR fresh frozen plasma OR danazol 24-48 hours before.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("AVOID TRIGGERS — ACE inhibitors + ARBs + ESTROGENS + tPA (in selected); medication reconciliation + counseling.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Patient EDUCATION — recognize attacks, emergency wallet card, when to seek care, prophylaxis for procedures, family planning.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — immunology/allergy/HAE specialist + ENT + GI + OB + emergency medicine awareness; HAE Association resources.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("LARYNGEAL ATTACK FATAL — historic mortality 30-50% before treatment available; modern with prompt treatment <5%; emergent airway management.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MISDIAGNOSIS — many years to correct diagnosis; allergic angioedema treatment fails (no histamine pathway); high index of suspicion in recurrent angioedema + family history.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("UNNECESSARY SURGERY — abdominal attacks mimic acute abdomen; many patients undergo unnecessary laparotomy before HAE diagnosis.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ACE-INHIBITOR + ESTROGEN — major triggers; AVOID in HAE patients; counsel + alert ID bracelet.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("FAMILY SCREENING — autosomal dominant types I + II; screen first-degree relatives + counsel.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PREGNANCY + LACTATION — coordinate with HAE specialist; C1-INH preferred; danazol contraindicated.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PROCEDURAL PROPHYLAXIS — critical for dental + surgery; ER + anesthesia + surgical teams aware of HAE.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PSYCHOSOCIAL — disfiguring + unpredictable; depression + anxiety; counseling + support groups.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("COST + INSURANCE — expensive specialty drugs; manufacturer + foundation assistance programs.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TakotsuboSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "takotsubo-cardiomyopathy",
        title: "Takotsubo cardiomyopathy (stress + apical ballooning syndrome)",
        subtitle: "Acute reversible LV dysfunction · postmenopausal women + emotional/physical stress · APICAL BALLOONING on echo · catecholamine-mediated · supportive · resolves",
        nclexTags: cardioCriticalTagR32,
        definition: AttributedProse(
            "Acute reversible left ventricular dysfunction mimicking acute MI but with NORMAL coronary arteries on angiography. Classic apical ballooning pattern on echocardiogram (apex dyskinetic + base hypercontractile, resembling Japanese octopus pot \"tako-tsubo\"). Predominantly postmenopausal women after emotional or physical stress (death of loved one, severe illness, surgery, exhausting work, drug abuse, withdrawal). Catecholamine-mediated. Treatment supportive; LV function typically recovers within weeks; mortality 1-5% per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "Severe emotional or physical stress → massive sympathetic + catecholamine surge → direct myocardial injury (especially apex due to higher beta-receptor density) + microvascular dysfunction + estrogen-mediated coronary spasm hypothesis (postmenopausal estrogen deficiency contributes). Reversible myocardial stunning + edema; resolves over days-weeks.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("ACUTE chest pain or dyspnea similar to MI; postmenopausal woman; recent emotional or physical stressor.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("ECG — ST elevations (often anterior + diffuse), T-wave inversions (deep + diffuse), QT prolongation; mimics STEMI.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("TROPONIN ELEVATION — typically mild relative to extensive ECG changes + EF reduction; mismatch suggests takotsubo.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("ECHO — APICAL BALLOONING (dyskinetic apex + hypercontractile base) — pathognomonic; variants — midventricular OR reverse takotsubo (basal akinesis + apical hypercontraction); reduced EF.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("LV OUTFLOW TRACT OBSTRUCTION — sometimes present (hypercontractile base + apical akinesis); dynamic obstruction; specific management.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Hemodynamic compromise variable — most stable, some develop cardiogenic shock.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors — POSTMENOPAUSAL WOMEN (90%), emotional stressor (bereavement, severe stress), physical stressor (illness, surgery, sepsis), exogenous catecholamines (drug abuse — cocaine + methamphetamine, ED stimulants), withdrawal from substances, pheochromocytoma, subarachnoid hemorrhage, brain injury.", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MAYO CLINIC CRITERIA — Transient hypokinesis/akinesis/dyskinesis of LV mid + apical segments extending beyond single coronary distribution; absence of obstructive CAD or angiographic evidence of acute plaque rupture; new ECG abnormalities (ST elevation/depression OR T inversion) OR modest troponin elevation; absence of pheochromocytoma + myocarditis per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CORONARY ANGIOGRAPHY — gold standard to exclude obstructive CAD; rule out MI; if EF reduced but coronaries normal → takotsubo OR myocarditis (cardiac MRI helps differentiate).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CARDIAC MRI — confirms wall motion abnormalities + excludes myocarditis (no late gadolinium enhancement vs myocarditis which has LGE); recovery on serial imaging.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ECHO — apical ballooning + LV dysfunction; serial monitoring for recovery (typically 3-4 weeks).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("TROPONIN, BNP/NT-proBNP — elevations but typically less severe than EF reduction would suggest in MI.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Pheochromocytoma workup — metanephrines (especially if no clear stressor + atypical features).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — STEMI, NSTEMI, myocarditis (cardiac MRI distinguishes), pericarditis, pheochromocytoma-induced cardiomyopathy, subarachnoid hemorrhage cardiomyopathy.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("Initial — treat as acute coronary syndrome until ruled out (aspirin, P2Y12, anticoagulation, statin, beta-blocker + cath).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Coronary angiography — definitive (normal coronaries despite ECG/troponin changes).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Echocardiogram + cardiac MRI — confirm + monitor recovery.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Identify trigger — psychiatric assessment, medication review.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Monitor for complications — heart failure, arrhythmias, LV thrombus, hemodynamic compromise.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("SUPPORTIVE — most patients stable + recover spontaneously; standard heart failure care during dysfunction phase per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("HEART FAILURE MANAGEMENT — ACE-I/ARB (or ARNI) + beta-blocker initially (controversial in catecholamine-induced — may not help acutely but supports during recovery); diuretics for congestion; goal-directed HF therapy.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ANTICOAGULATION for LV thrombus risk — apical akinesis + LV thrombus risk; consider anticoagulation (heparin → DOAC/warfarin) for 3 months if LV thrombus + reduced EF + akinesis + atrial fibrillation.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LV OUTFLOW OBSTRUCTION — when present + hemodynamically significant; AVOID INOTROPES + VASODILATORS (worsen obstruction); use BETA-BLOCKERS (esmolol) + vasoconstrictors (phenylephrine); volume + supportive.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CARDIOGENIC SHOCK — 5-10% of takotsubo; INOTROPES generally avoided (worsen catecholamine-mediated injury); LV outflow obstruction precludes inotropes; mechanical support (IABP, Impella, ECMO) for refractory.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Arrhythmia management — atrial fibrillation, ventricular ectopy, QT prolongation; correct electrolytes; cardioversion if needed.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Stress management + counseling — address triggering event; mental health support.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Follow-up echo at 4-12 weeks for recovery; LV function typically normalizes; long-term ECG monitoring + cardiology follow-up.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Substance abuse — counseling + treatment if drugs trigger.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — cardiology + critical care + psychiatry + substance use counseling.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("RECURRENCE — ~5% lifetime risk; same OR different stressor; counsel.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CARDIOGENIC SHOCK — 5-10%; mortality up to 15% in shock; mechanical support for refractory.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LV OUTFLOW OBSTRUCTION — dynamic; avoid inotropes; beta-blocker + volume.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LV THROMBUS — apical akinesis prone; serial echo; anticoagulation if present.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ARRHYTHMIAS — atrial fibrillation, ventricular arrhythmias, QT prolongation; correct electrolytes + AED if needed.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PSYCHIATRIC — trigger often emotional/grief; comprehensive counseling + support.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MISDIAGNOSIS — often initially treated as STEMI before angiography reveals normal coronaries.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MORTALITY — overall 1-5%; cardiogenic shock subset higher.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("FULL RECOVERY EXPECTED — ECG + EF normalize over 3-4 weeks typically; reassure patient + family.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Pheochromocytoma + subarachnoid hemorrhage — exclude in atypical features.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CRSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cytokine-release-syndrome",
        title: "Cytokine release syndrome (CRS)",
        subtitle: "T-cell activation + cytokine cascade · CAR-T + bispecific antibody therapy + checkpoint inhibitors + COVID-19 · TOCILIZUMAB (anti-IL-6R) + steroids · ASTCT grading",
        nclexTags: infectionCriticalTagR32,
        definition: AttributedProse(
            "Systemic inflammatory response from massive T-cell activation + cytokine release — most common with CHIMERIC ANTIGEN RECEPTOR T-CELL (CAR-T) therapy, bispecific T-cell engagers, immune checkpoint inhibitors, COVID-19 (cytokine storm). Severity graded by ASTCT 2019 system (Grade 1-4). Treatment — TOCILIZUMAB (anti-IL-6R monoclonal antibody) ± CORTICOSTEROIDS; supportive ICU + organ support; can progress to immune effector cell-associated neurotoxicity syndrome (ICANS) + multi-organ dysfunction per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "T-cell activation (CAR-T recognition of tumor, bispecific antibody engagement, checkpoint inhibitor release of brakes) → massive cytokine release (IL-6, IFN-γ, TNF-α, IL-1, IL-10, others) → systemic inflammatory cascade → endothelial dysfunction + capillary leak + hypotension + multi-organ dysfunction; bone marrow + hepatic + neurologic involvement; risk of HLH-like syndrome + DIC in severe.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("FEVER ≥38°C — usually first sign; within hours to days of therapy.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("HYPOTENSION — variable severity; responsive to fluids initially, may require vasopressors.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("HYPOXIA — variable; may require oxygen, NIV, intubation.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Constitutional — fatigue, myalgia, arthralgia, headache, anorexia, malaise.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("LABORATORY — elevated CRP + ferritin + IL-6 + D-dimer; cytopenias; hepatic enzyme elevation; coagulopathy in severe.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("ICANS (Immune effector cell-Associated Neurotoxicity Syndrome) — co-occurs or follows CRS; tremor, dysphasia, encephalopathy, seizures, cerebral edema in severe; assessed with ICE score.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("HEMOPHAGOCYTIC LYMPHOHISTIOCYTOSIS (HLH)-like — severe ferritin elevation + cytopenias + multi-organ dysfunction; severe CRS variant.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors — CAR-T cell therapy (especially for B-cell ALL + DLBCL + multiple myeloma), bispecific antibodies (blinatumomab, mosunetuzumab, others), immune checkpoint inhibitors, COVID-19, high tumor burden + lymphocyte expansion + CAR construct.", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ASTCT 2019 GRADING (consensus) — Grade 1: fever ≥38°C; Grade 2: fever + hypotension responding to fluids OR hypoxia requiring low-flow O2; Grade 3: fever + hypotension requiring single vasopressor + hypoxia requiring high-flow O2 OR organ toxicity (Grade 3); Grade 4: fever + hypotension requiring multiple vasopressors OR hypoxia requiring positive pressure ventilation OR organ toxicity (Grade 4) per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LABORATORY — CRP elevation (rapid + significant), FERRITIN elevation, IL-6 elevation if available, D-dimer, fibrinogen (decreased in HLH-like), CBC + diff, CMP, LFTs.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("INFLAMMATORY MARKERS — CRP + ferritin + IL-6 trends correlate with severity + response to therapy.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ICANS ICE SCORE — Immune effector Cell-associated Encephalopathy assessment; 10-point neurologic scale; serial monitoring.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("RULE OUT — infection (blood cultures, urine cultures, CXR, viral PCR), tumor progression, other inflammatory causes; CRS + infection can coexist.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Imaging — chest X-ray + CT for pulmonary involvement + ARDS; brain MRI for ICANS if severe.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — sepsis, transfusion reaction, tumor lysis syndrome, anaphylaxis, infusion reaction.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("EARLY recognition — fever within hours of CAR-T therapy → CRS; broad differential including infection.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Grade severity continuously — escalate care + intervention.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — oncology/hematology + ICU + ID + neurology (ICANS) + pharmacy.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Concomitant ICANS assessment — serial neurologic exams + ICE score.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Infection exclusion — concomitant or alternative diagnosis; cultures + empiric antibiotics if uncertain.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("GRADE 1 (fever alone) — supportive care, fluids, antipyretics, monitor; empiric broad-spectrum antibiotics for fever + cultures pending; TOCILIZUMAB only if persistent ≥24 hours or worsening per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("GRADE 2 (mild hypotension/hypoxia) — TOCILIZUMAB 8 mg/kg IV (max 800 mg) — single dose; repeat in 24 hours if persistent; CORTICOSTEROIDS (dexamethasone 10 mg q6h) if no improvement.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("GRADE 3 (significant hypotension/hypoxia) — TOCILIZUMAB + CORTICOSTEROIDS dexamethasone 10 mg q6h or methylprednisolone 1 mg/kg q12h; ICU + supportive care + vasopressors as needed.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("GRADE 4 (mechanical ventilation, multi-organ failure) — high-dose steroids (methylprednisolone 1000 mg q24h × 3 days then taper) + TOCILIZUMAB + anti-IL-1 (anakinra) + plasmapheresis for HLH-like + ICU full support.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("TOCILIZUMAB (Actemra) — anti-IL-6R monoclonal antibody; FDA-approved for CAR-T-induced CRS; 8 mg/kg IV (max 800 mg); up to 3 additional doses with caution.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ICU SUPPORTIVE care — fluid resuscitation, vasopressors (norepinephrine first-line), mechanical ventilation if needed, renal replacement therapy if AKI, continuous monitoring.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Empiric BROAD-SPECTRUM ANTIBIOTICS — for fever + neutropenia + uncertain etiology; CAR-T patients immunocompromised.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ICANS management — serial ICE score + neurology consultation; corticosteroids (dexamethasone 10 mg q6h) for ICANS Grade 2+; tocilizumab less effective for ICANS (poor BBB penetration); intubation for severe; anakinra for HLH-like + tocilizumab-refractory.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ANAKINRA — anti-IL-1 receptor antagonist; for refractory CRS + HLH-like; off-label use; doses higher than rheumatology.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MULTIDISCIPLINARY — oncology/hematology + ICU + ID + neurology + pharmacy + nursing leadership; CAR-T specialized center.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("SEVERE CRS — multi-organ failure + mortality; ICU + maximal therapy; CAR-T center experience critical.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ICANS (NEUROTOXICITY) — co-occurs OR follows CRS; tocilizumab POOR efficacy (limited BBB penetration); steroids preferred for ICANS; intubation + ICU for severe; cerebral edema rare but devastating.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("HLH-LIKE syndrome — severe ferritin elevation + cytopenias + multi-organ failure; aggressive immunosuppression (steroids + anakinra + plasmapheresis); high mortality.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CONCOMITANT INFECTION — CAR-T + steroid + tocilizumab patients severely immunocompromised; bacterial + viral + fungal opportunistic infections; broad-spectrum coverage + ID consultation.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("TUMOR LYSIS SYNDROME — concurrent risk; aggressive hydration + allopurinol + rasburicase + electrolyte monitoring.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LONG-TERM SEQUELAE — B-cell aplasia from CAR-T → hypogammaglobulinemia → infections (IVIG replacement); ICANS-related cognitive deficits; secondary malignancy risk; secondary T-cell lymphoma; long-term oncology follow-up.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("INFUSION REACTION + ANAPHYLAXIS to tocilizumab + other agents.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("EFFICACY of CAR-T not compromised by appropriate CRS management — does NOT reduce anti-tumor response; treat aggressively.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CAR-T CENTER experience essential — only certified specialized centers can administer CAR-T; specific monitoring + management protocols.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CIPNMSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "critical-illness-polyneuromyopathy",
        title: "Critical illness polyneuropathy + myopathy (CIPNM)",
        subtitle: "ICU-acquired weakness · sepsis + steroids + paralytics + immobility risk · prolonged ventilator weaning · EMG axonal sensorimotor · prevention bundle",
        nclexTags: neuroMuscCriticalTagR32,
        definition: AttributedProse(
            "Acquired neuromuscular dysfunction occurring during critical illness — CRITICAL ILLNESS POLYNEUROPATHY (CIP — axonal sensorimotor neuropathy) + CRITICAL ILLNESS MYOPATHY (CIM — primary myopathy); often overlap = CIPNM. Affects 30-70% of ICU patients ventilated >7 days; presents as profound limb + respiratory muscle weakness + prolonged ventilator weaning. Major contributor to post-ICU syndrome + functional decline. Prevention bundle (ABCDEF) + minimize sedation + early mobilization most effective; no specific treatment per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "Complex multifactorial pathology: SEPSIS-related microvascular dysfunction + immune activation + axonal injury (CIP); muscle protein breakdown + thick filament loss + denervation + atrophy (CIM); contribution of high-dose corticosteroids + neuromuscular blockers (paralytics) + immobilization + hyperglycemia + electrolyte disturbances; prolonged hospitalization perpetuates.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("LIMB WEAKNESS — symmetric, predominantly proximal > distal; flaccid; reduced or absent deep tendon reflexes; difficulty with ADL.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("FACIAL + bulbar weakness — variable; ocular motility usually preserved (distinguishes from GBS, MG).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("RESPIRATORY MUSCLE WEAKNESS — prolonged ventilator weaning + dependence; diaphragmatic dysfunction.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("SENSORY DEFICITS — distal stocking-glove (CIP); usually mild + may not be detectable if patient sedated.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("MUSCLE WASTING — visible atrophy especially after weeks; pressure injuries + contractures.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors — sepsis + multi-organ dysfunction (greatest risk factor), prolonged mechanical ventilation, prolonged ICU stay (>7 days), CORTICOSTEROIDS high-dose, NEUROMUSCULAR BLOCKERS (paralytics), HYPERGLYCEMIA, immobilization, SIRS, parenteral nutrition, advanced age, female, comorbidities.", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — Medical Research Council (MRC) scale assessment of major muscle groups; SCORE <48/60 (out of 60 maximum) suggests ICU-acquired weakness per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ELECTROMYOGRAPHY (EMG) + NERVE CONDUCTION STUDIES — distinguish CIP vs CIM; AXONAL sensorimotor neuropathy (CIP); myopathic features + low compound motor action potentials with normal sensory (CIM); usually combined.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CK — usually normal or mildly elevated; significantly elevated suggests rhabdomyolysis or muscle disease.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MUSCLE BIOPSY — atrophic fibers + thick filament loss + denervation atrophy + necrosis variable; rarely indicated.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Imaging — uncommonly informative; brain MRI to rule out CNS causes if mental status unclear.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — Guillain-Barré (areflexic + autonomic + recent infection + ascending pattern), MG crisis (fluctuating + bulbar + ocular), spinal cord injury, drug-induced (statins, certain antibiotics), neuromuscular junction disorders, central neurologic injury (stroke, anoxic injury).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Functional assessment — ICU mobility scale, sit-to-stand, walking tolerance, ADL.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("Daily neuro exam + MRC strength testing in ICU patients.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — critical care + physical/occupational therapy + neurology + rehabilitation medicine.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Prevention bundle — minimize sedation + early mobilization + appropriate nutrition + glycemic control.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Rule out other causes — drug effects, sedation, electrolyte derangements, CNS pathology.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Rehabilitation planning — early + intensive; post-ICU + post-discharge.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION BUNDLE (ABCDEF) — Assess + manage pain (analgesia first), Both spontaneous awakening + breathing trials, Choice of analgesia + sedation (minimize benzodiazepines), Delirium monitoring + management, Early mobilization + exercise, Family engagement; PADIS guidelines per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MINIMIZE SEDATION — daily sedation interruption (SBT/SAT), prefer non-benzodiazepine sedation (dexmedetomidine, propofol over midazolam), light sedation goal, RASS-driven.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MINIMIZE PARALYTICS — only for specific indications (severe ARDS, intracranial hypertension); train-of-four monitoring; minimize duration.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MINIMIZE CORTICOSTEROIDS — when feasible; balance with treatment of disease.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("EARLY MOBILIZATION — within 24-48 hours of ICU admission as feasible; passive range of motion → active assisted → sitting → standing → ambulation; transferred to PT/OT.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("GLYCEMIC CONTROL — target 140-180 mg/dL; avoid extreme hyperglycemia + hypoglycemia.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("NUTRITIONAL SUPPORT — early enteral nutrition, adequate protein 1.2-2 g/kg/day, micronutrients.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ELECTROLYTE management — K, Mg, phosphate, Ca optimization.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("REHABILITATION — early + intensive; PT/OT/speech in ICU; bridge to acute rehabilitation OR skilled nursing facility OR home with services after discharge; multidisciplinary recovery program.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("NO SPECIFIC PHARMACOTHERAPY proven effective — supportive care + prevention + rehabilitation primary; testosterone + GH controversial.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Post-ICU syndrome management — cognitive + physical + mental health rehabilitation; multidisciplinary recovery clinic.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("PROLONGED VENTILATOR DEPENDENCE — main acute consequence; tracheostomy + weaning trial + long-term acute care.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("FUNCTIONAL DECLINE — long-term + significant; cognitive + physical + mental health sequelae (post-ICU syndrome).", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ICU MORTALITY + 1-year mortality increased — outcomes correlate with severity + age + comorbidities.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("REHABILITATION RECOVERY — gradual over months-years; not always complete; intensive rehabilitation improves.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PSYCHOSOCIAL — depression + anxiety + PTSD common; family burden; counseling + support.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("SECONDARY COMPLICATIONS — pressure injuries, contractures, falls, infections.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("FAMILY engagement + caregiver education + post-discharge follow-up.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Post-ICU CLINIC — multidisciplinary recovery clinic for ICU survivors; addresses cognitive + physical + mental health.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("INCREASING RECOGNITION + ICU LIBERATION INITIATIVE — ABCDEF bundle + SCCM ICU Liberation campaign.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FulminantMyocarditisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "fulminant-myocarditis",
        title: "Fulminant myocarditis",
        subtitle: "Severe acute myocarditis with hemodynamic instability · viral + autoimmune + ICI-related · mechanical circulatory support · biopsy diagnosis · recovers OR transplant",
        nclexTags: cardioCriticalTagR32,
        definition: AttributedProse(
            "Severe form of acute myocarditis with rapidly progressive hemodynamic instability requiring mechanical circulatory support OR resulting in death/transplant. Causes — viral (most common; coxsackie, adenovirus, parvovirus B19, HHV-6, SARS-CoV-2), autoimmune (giant cell, eosinophilic, granulomatous), immune checkpoint inhibitor-related, drug toxicity, sepsis. Multimodal diagnosis (clinical + biomarkers + ECG + echo + cardiac MRI + endomyocardial biopsy). Mechanical circulatory support (IABP, Impella, ECMO, LVAD) often required; 50%+ recover with support; transplant for refractory per primary source.",
            citationIDs: ["specialty_dx_round32", "openrn_dx_round32"]
        ),
        pathophysiology: AttributedProse(
            "Acute inflammatory + immune-mediated myocardial injury → myocyte necrosis + dysfunction + arrhythmia + impaired contractility → cardiogenic shock; viral infections cause direct + immune-mediated injury; autoimmune (giant cell most aggressive; eosinophilic); immune checkpoint inhibitor (anti-PD-1/PD-L1, anti-CTLA-4) blocks immune tolerance → autoimmune myocarditis; outcomes range from full recovery to fatal arrhythmia or progressive heart failure.",
            citationIDs: ["specialty_dx_round32"]
        ),
        presentation: [
            AttributedBullet("ACUTE chest pain, dyspnea, palpitations within days-weeks of viral prodrome OR no clear trigger.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("HEMODYNAMIC INSTABILITY — cardiogenic shock features (hypotension, oliguria, mental status changes, hypoperfusion, lactic acidosis).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("ARRHYTHMIAS — atrial fibrillation, ventricular tachycardia, ventricular fibrillation, complete heart block (especially giant cell + Lyme + sarcoid).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("HEART FAILURE features — pulmonary edema, JVD, S3 gallop, peripheral edema.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("ECG — ST elevations (mimicking STEMI), T wave inversions, atrial or ventricular arrhythmias, AV block (variable).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("TROPONIN ELEVATION — extensive; may rise + fall multiple times.", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("VIRAL PRODROME — fever + URI + GI symptoms in viral myocarditis (preceding 1-4 weeks).", citationIDs: ["openrn_dx_round32"]),
            AttributedBullet("Risk factors — recent viral infection (especially in young adults), autoimmune disease, immune checkpoint inhibitor therapy, drug toxicity (anthracyclines, clozapine), sepsis, sarcoidosis, Chagas disease (Latin America), pregnancy + postpartum (peripartum cardiomyopathy distinct).", citationIDs: ["specialty_dx_round32"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — acute heart failure or arrhythmias + elevated cardiac biomarkers + new wall motion abnormalities per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ECG — wide variety of abnormalities; mimicking ACS in many cases.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("TROPONIN ELEVATION — supports diagnosis but non-specific; trends inform.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ECHO — reduced EF (often <40%), regional or global wall motion abnormalities, pericardial effusion, ventricular thrombus.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CARDIAC MRI — late gadolinium enhancement (LGE) + T2-weighted imaging + edema — characteristic patterns; Lake Louise Criteria for diagnosis; superior to biopsy non-invasively.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ENDOMYOCARDIAL BIOPSY — gold standard for specific etiology; particularly for GIANT CELL myocarditis (rapidly progressive — emergent immunosuppression) + EOSINOPHILIC + SARCOIDOSIS; not always feasible; Dallas criteria.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("CORONARY ANGIOGRAPHY — excludes ACS as alternative explanation; clean coronaries support myocarditis.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("WORKUP for cause — viral PCR panel (rarely diagnostic prospectively), serologies, autoimmune workup, immune checkpoint inhibitor history, drug toxicity assessment.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Differential — acute coronary syndrome (most important to rule out), takotsubo cardiomyopathy, pericarditis, pulmonary embolism, sepsis-induced cardiomyopathy, drug-induced cardiomyopathy.", citationIDs: ["specialty_dx_round32"])
        ],
        priorityAssessments: [
            AttributedBullet("EMERGENT cardiology + cardiac critical care consultation.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Coronary angiography — rule out ACS.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Cardiac MRI + echo + biomarkers + clinical for diagnosis.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Mechanical circulatory support evaluation — IABP, Impella, ECMO availability + capability.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — cardiology + critical care + cardiothoracic surgery + transplant team + heart failure specialty.", citationIDs: ["specialty_dx_round32"])
        ],
        commonInterventions: [
            AttributedBullet("SUPPORTIVE CARE — most patients require ICU + heart failure therapy + arrhythmia management + treatment of underlying cause per primary source.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("HEART FAILURE management — diuretics, ACE-I/ARB/ARNI, beta-blocker (when hemodynamically stable), MRA, SGLT2-i optimization.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ARRHYTHMIA management — anti-arrhythmics + ICD for sustained ventricular arrhythmias (timing controversial — may resolve with treatment OR persistent indication); pacemaker for complete heart block + lower-grade blocks.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("MECHANICAL CIRCULATORY SUPPORT — for cardiogenic shock + hemodynamic instability — INTRA-AORTIC BALLOON PUMP (IABP), IMPELLA (percutaneous LVAD), VENO-ARTERIAL ECMO (most common for fulminant); BRIDGE to recovery OR transplant OR durable LVAD.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ETIOLOGY-SPECIFIC therapy — antiviral (rarely effective), IMMUNOSUPPRESSION for giant cell + eosinophilic + sarcoid + checkpoint inhibitor-related (high-dose steroids + cyclosporine + MMF + rituximab + plasma exchange); discontinue offending drugs.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("IMMUNE CHECKPOINT INHIBITOR myocarditis — high-dose CORTICOSTEROIDS (methylprednisolone 1000 mg IV × 3-5 days, then taper); MYCOPHENOLATE + INFLIXIMAB + IVIG + RITUXIMAB for refractory; discontinue ICI; high mortality.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("HEART TRANSPLANT — for refractory progressive disease + giant cell + non-recovering; bridge with LVAD; transplant evaluation.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("SUPPORTIVE CARE — ICU + multidisciplinary; treat arrhythmias, AKI, infections, multi-organ dysfunction.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("OUTPATIENT FOLLOW-UP — cardiac MRI surveillance + echo + symptom monitoring + chronic heart failure management; gradual exercise progression per cardiology.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("Multidisciplinary — cardiology + critical care + cardiothoracic surgery + transplant + heart failure + rehabilitation.", citationIDs: ["specialty_dx_round32"])
        ],
        watchFor: [
            AttributedBullet("CARDIAC ARREST + sudden death — fulminant myocarditis can cause sudden death; ICU monitoring + CPR + mechanical support.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("DEATH OR TRANSPLANT — ~30% of fulminant myocarditis; mortality + transplant rate vary by cause + access to mechanical support.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("RECOVERY — ~50-60% of fulminant myocarditis recover with mechanical support + supportive care; better prognosis than chronic myocarditis paradoxically.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("GIANT CELL MYOCARDITIS — rapidly progressive + high mortality without aggressive immunosuppression; biopsy critical to identify.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("ICI-RELATED MYOCARDITIS — emergent diagnosis; high-dose steroids + multimodal immunosuppression; mortality 25-50%; discontinue ICI permanently.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("LONG-TERM CARDIOMYOPATHY — persistent LV dysfunction in some; chronic HF management + ICD if sustained reduced EF + sudden death risk.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("REHABILITATION + exercise — gradual progression; cardiac rehabilitation + symptom monitoring.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("RECURRENCE — uncommon but possible; chronic surveillance + risk factor modification.", citationIDs: ["specialty_dx_round32"]),
            AttributedBullet("PSYCHOLOGICAL impact — PTSD + depression + anxiety in patients + families; counseling.", citationIDs: ["specialty_dx_round32"])
        ],
        citations: [openrnDxR32, cdcDxR32, specialtyDxR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}
