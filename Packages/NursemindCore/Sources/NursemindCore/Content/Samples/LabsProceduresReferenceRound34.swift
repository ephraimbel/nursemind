import Foundation

// Curator-model labs + procedures + references (round 34 — Safe & Effective Care: therapeutic drug monitoring + safety procedures + delegation/ethics references).

private let openrnLPRR34 = CitationSource(
    id: "openrn_lpr_round34",
    shortName: "Open RN Nursing Skills + Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcLPRR34 = CitationSource(
    id: "cdc_lpr_round34",
    shortName: "CDC + NIOSH + OSHA + NIH concept citations",
    publisher: "CDC · NIOSH · OSHA · NIH",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLPRR34 = CitationSource(
    id: "specialty_lpr_round34",
    shortName: "ANA + IDSA + ISMP + USP + Joint Commission fact citations",
    publisher: "ANA · IDSA · ISMP · USP · Joint Commission",
    license: .factCitationOnly,
    url: "https://www.nursingworld.org/",
    lastRetrieved: "2026-05-13"
)

private let tdmTagsR34 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .pharmacologicalAndParenteralTherapies,
    priorityConcept: .safety
)
private let toxLabTagsR34 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .physiologicalAdaptation,
    priorityConcept: .gasExchange
)
private let safetyProcTagsR34 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .safetyAndInfectionControl,
    priorityConcept: .safety
)
private let mocTagsR34 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

// MARK: - LABS

public enum VancomycinTDMSample {
    public static let entry: LabEntry = LabEntry(
        id: "vancomycin-aud-trough-monitoring",
        title: "Vancomycin therapeutic drug monitoring (AUC/MIC + trough)",
        subtitle: "Narrow therapeutic index · MRSA infection · AUC-guided monitoring preferred (400-600 mg·h/L) · trough monitoring (10-20 mcg/mL) when AUC unavailable · nephrotoxicity + ototoxicity",
        specimen: "Serum",
        nclexTags: tdmTagsR34,
        referenceRanges: [
            ReferenceRangeRow(value: "AUC24 400-600 mg·h/L (MRSA serious infection)", label: "Target (AUC-guided)", citationIDs: ["specialty_lpr_round34"]),
            ReferenceRangeRow(value: "Trough 10-15 mcg/mL (general)", label: "Target trough (general)", citationIDs: ["specialty_lpr_round34"]),
            ReferenceRangeRow(value: "Trough 15-20 mcg/mL (CNS, endocarditis, severe pneumonia)", label: "Target trough (serious MRSA)", citationIDs: ["specialty_lpr_round34"]),
            ReferenceRangeRow(value: "Trough >20 mcg/mL", label: "Toxic (nephrotoxicity risk)", citationIDs: ["specialty_lpr_round34"]),
            ReferenceRangeRow(value: "Peak 25-40 mcg/mL (rarely measured)", label: "Peak (legacy)", citationIDs: ["specialty_lpr_round34"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Therapeutic AUC24 400-600 mg·h/L",
                summary: "Optimal MRSA exposure with minimized nephrotoxicity; per IDSA/ASHP 2020 guidelines AUC-guided monitoring preferred over trough-only.",
                nursingActions: [
                    "Continue current regimen",
                    "Reassess AUC after dose change or significant clinical change",
                    "Monitor renal function 2-3 times weekly during therapy"
                ],
                citationIDs: ["specialty_lpr_round34"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Subtherapeutic (AUC <400 OR trough <10)",
                summary: "Risk of treatment failure + resistance development; dose increase or interval shortening needed.",
                nursingActions: [
                    "Notify provider for dose adjustment",
                    "Reassess level + clinical response",
                    "Pharmacy + ID consult"
                ],
                citationIDs: ["specialty_lpr_round34"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated (AUC 600-800 OR trough 20-25)",
                summary: "Increased nephrotoxicity risk; hold or reduce dose; monitor renal function closely.",
                nursingActions: [
                    "Hold or reduce next dose",
                    "Daily Cr; UA + urine output",
                    "Pharmacy consult for redose"
                ],
                citationIDs: ["specialty_lpr_round34"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Toxic (trough >25 mcg/mL OR rising Cr)",
                summary: "HOLD vancomycin + intensive renal monitoring + alternative agent consideration (linezolid, daptomycin, ceftaroline).",
                nursingActions: [
                    "HOLD next dose immediately",
                    "Notify provider + pharmacy urgently",
                    "Q6-12H Cr + UA + urine output",
                    "Audiometric eval if persistent + ototoxicity symptoms",
                    "Consider alternative MRSA agent"
                ],
                citationIDs: ["specialty_lpr_round34"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Subtherapeutic levels",
                causes: ["Inadequate loading dose (often >25-30 mg/kg needed)", "Hyperdynamic/septic patient with increased clearance", "Renal hyperfiltration in young patients", "Drug interactions (rifampin)", "Concurrent dialysis without dose adjustment"],
                citationIDs: ["specialty_lpr_round34"]
            ),
            CauseGroup(
                title: "Supratherapeutic/toxic levels",
                causes: ["Concurrent nephrotoxins (aminoglycosides, IV contrast, NSAIDs, ACE-I, loop diuretics)", "Acute kidney injury developing during therapy", "Inadequate dose adjustment for declining renal function", "Drug-drug interaction (piperacillin-tazobactam may increase AKI risk)", "Obesity using actual vs adjusted body weight"],
                citationIDs: ["specialty_lpr_round34"]
            )
        ],
        nursingActions: [
            AttributedBullet("Order TROUGH 30 min before next dose at steady state (after 4-5 doses for most patients); AUC-based monitoring with first-dose level + 24h level (Bayesian software).", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Daily Cr + BUN + urine output during therapy; baseline + serial; concomitant nephrotoxin avoidance.", citationIDs: ["openrn_lpr_round34"]),
            AttributedBullet("Audiometric monitoring if therapy >2 weeks OR concurrent ototoxin OR high doses.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Assess for \"red man syndrome\" (flushing, pruritus, hypotension from histamine release) — slow infusion + diphenhydramine + reduce rate.", citationIDs: ["openrn_lpr_round34"]),
            AttributedBullet("Coordinate with pharmacy + ID specialty; clinical decision support; institutional protocols.", citationIDs: ["specialty_lpr_round34"])
        ],
        watchFor: [
            AttributedBullet("Nephrotoxicity — rising Cr, decreased urine output; ~5-15% of patients; reversible if caught early; permanent injury if untreated.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Ototoxicity — hearing loss + tinnitus (high-frequency first); permanent; audiometry monitoring in high-risk.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("DRESS + Stevens-Johnson + linear IgA dermatosis — rare hypersensitivity reactions; discontinue.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Thrombocytopenia + neutropenia — rare; CBC monitoring.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Vancomycin resistance + VRE — increasing concern; appropriate use + de-escalation when culture results available.", citationIDs: ["specialty_lpr_round34"])
        ],
        citations: [openrnLPRR34, cdcLPRR34, specialtyLPRR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CarboxyhemoglobinSample {
    public static let entry: LabEntry = LabEntry(
        id: "carboxyhemoglobin",
        title: "Carboxyhemoglobin (COHb) — CO poisoning",
        subtitle: "Carbon monoxide poisoning · co-oximetry · pulse ox UNRELIABLE (reads CO as O2) · hyperbaric oxygen therapy for severe · serial monitoring",
        specimen: "Arterial or venous blood (co-oximetry)",
        nclexTags: toxLabTagsR34,
        referenceRanges: [
            ReferenceRangeRow(value: "<2% (nonsmoker), <5% (smoker)", label: "Normal", citationIDs: ["specialty_lpr_round34"]),
            ReferenceRangeRow(value: "10-20%", label: "Mild-moderate poisoning (headache, nausea, dyspnea)", citationIDs: ["specialty_lpr_round34"]),
            ReferenceRangeRow(value: "20-40%", label: "Moderate (confusion, dizziness, syncope)", citationIDs: ["specialty_lpr_round34"]),
            ReferenceRangeRow(value: "40-60%", label: "Severe (coma, seizure, arrhythmia)", citationIDs: ["specialty_lpr_round34"]),
            ReferenceRangeRow(value: ">60%", label: "Critical (cardiopulmonary arrest, death)", citationIDs: ["specialty_lpr_round34"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "<2% nonsmoker / <5% smoker",
                summary: "Baseline; rules out significant CO poisoning if symptoms present.",
                nursingActions: ["Evaluate alternative diagnoses if symptoms persist"],
                citationIDs: ["specialty_lpr_round34"]
            ),
            InterpretationTier(
                severity: .high,
                label: "10-25% mild-moderate",
                summary: "Mild-moderate CO poisoning; 100% O2 via non-rebreather; serial assessment.",
                nursingActions: [
                    "100% oxygen via non-rebreather mask immediately",
                    "Continuous SpO2 monitoring — REMEMBER pulse ox unreliable in CO poisoning",
                    "Co-oximetry serial Q1-2 hours",
                    "Neurologic assessment + symptoms monitoring",
                    "Identify + remove from CO source"
                ],
                citationIDs: ["specialty_lpr_round34"]
            ),
            InterpretationTier(
                severity: .critical,
                label: ">25% OR pregnant OR loss of consciousness OR cardiac",
                summary: "Severe CO poisoning; CONSIDER HYPERBARIC OXYGEN THERAPY (chamber); intubation + ICU + neurologic + cardiac assessment.",
                nursingActions: [
                    "Intubation + mechanical ventilation with 100% O2",
                    "ICU admission + continuous monitoring",
                    "HYPERBARIC OXYGEN THERAPY consultation (3 atm chambers, 90-120 min)",
                    "Cardiac monitoring + serial troponin + ECG",
                    "Neuro exam serial; consider CT head",
                    "Pregnancy + cardiovascular disease + age >50 → lower threshold for HBO"
                ],
                citationIDs: ["specialty_lpr_round34"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Sources of CO",
                causes: ["Smoke inhalation (fire victims)", "Faulty heating systems (furnace, water heater)", "Generators + portable heaters indoor", "Vehicle exhaust (suicide attempts, garage)", "Industrial exposure (welding, methylene chloride paint stripper metabolite)", "Charcoal grills + camping stoves indoor"],
                citationIDs: ["specialty_lpr_round34"]
            )
        ],
        nursingActions: [
            AttributedBullet("DO NOT TRUST pulse oximetry — measures hemoglobin oxygen saturation but cannot distinguish O2 from CO; SpO2 may be \"normal\" despite severe poisoning; ORDER CO-OXIMETRY.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("100% O2 via non-rebreather + remove from CO source IMMEDIATELY upon suspicion.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Serial co-oximetry Q1-2 hours; CO half-life on 100% O2 ~80 min vs ~320 min on room air.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Identify all exposed individuals — household members + co-workers + pets; coordinate evaluation.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Neurologic assessment serial — risk of delayed neuropsychiatric sequelae (DNS) 2-40 days post-exposure (memory + cognitive + behavioral changes).", citationIDs: ["specialty_lpr_round34"])
        ],
        watchFor: [
            AttributedBullet("Cardiac toxicity — ischemia + arrhythmia + cardiomyopathy; serial ECG + troponin.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Neurologic — coma + seizure + altered mental status; delayed neuropsychiatric sequelae 2-40 days post.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Pregnancy — fetal harm even with mild maternal CO; lower threshold for HBO.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Concurrent cyanide poisoning in fire victims — empiric hydroxocobalamin or sodium thiosulfate may be indicated.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Long-term — cognitive + memory + behavioral assessment; neuropsychological testing.", citationIDs: ["specialty_lpr_round34"])
        ],
        citations: [openrnLPRR34, cdcLPRR34, specialtyLPRR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MethemoglobinSample {
    public static let entry: LabEntry = LabEntry(
        id: "methemoglobinemia-monitoring",
        title: "Methemoglobin (MetHb) — methemoglobinemia",
        subtitle: "Oxidized hemoglobin (Fe3+) cannot carry O2 · cyanosis with NORMAL PaO2 · METHYLENE BLUE antidote · ABG pulse ox discordance",
        specimen: "Arterial or venous blood (co-oximetry)",
        nclexTags: toxLabTagsR34,
        referenceRanges: [
            ReferenceRangeRow(value: "<1-2%", label: "Normal", citationIDs: ["specialty_lpr_round34"]),
            ReferenceRangeRow(value: "10-20%", label: "Mild (cyanosis + mild symptoms)", citationIDs: ["specialty_lpr_round34"]),
            ReferenceRangeRow(value: "20-50%", label: "Moderate (dyspnea + tachycardia + headache + altered mental status)", citationIDs: ["specialty_lpr_round34"]),
            ReferenceRangeRow(value: "50-70%", label: "Severe (severe cyanosis + coma + arrhythmia + seizures)", citationIDs: ["specialty_lpr_round34"]),
            ReferenceRangeRow(value: ">70%", label: "Critical (cardiovascular collapse, death)", citationIDs: ["specialty_lpr_round34"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "<2%",
                summary: "Normal range; rules out methemoglobinemia.",
                nursingActions: ["Evaluate alternative diagnoses for cyanosis"],
                citationIDs: ["specialty_lpr_round34"]
            ),
            InterpretationTier(
                severity: .high,
                label: "10-30% mild-moderate",
                summary: "Methemoglobinemia present; remove offending agent; methylene blue indication varies (≥20-30% with symptoms typically).",
                nursingActions: [
                    "REMOVE offending agent (drug, chemical, dye)",
                    "100% O2 — may not reverse but supportive",
                    "Pulse ox UNRELIABLE — order co-oximetry",
                    "ABG — PaO2 may be normal despite hypoxia",
                    "Methylene blue 1-2 mg/kg IV if symptomatic OR MetHb ≥20-30%"
                ],
                citationIDs: ["specialty_lpr_round34"]
            ),
            InterpretationTier(
                severity: .critical,
                label: ">30% with symptoms OR cardiopulmonary instability",
                summary: "Severe methemoglobinemia; emergent METHYLENE BLUE 1-2 mg/kg IV over 5-30 min; ICU monitoring; supportive.",
                nursingActions: [
                    "METHYLENE BLUE 1-2 mg/kg IV over 5-30 minutes (1% solution)",
                    "Repeat dose if no response in 1 hour",
                    "100% O2 + cardiac monitor + ICU admission",
                    "G6PD STATUS — methylene blue contraindicated in G6PD deficiency (hemolysis); ASCORBIC ACID 1 g IV alternative",
                    "Exchange transfusion or hyperbaric O2 for severe refractory"
                ],
                citationIDs: ["specialty_lpr_round34"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Drug-induced methemoglobinemia",
                causes: ["Topical anesthetics — BENZOCAINE (esp. sprays for transesophageal echo), LIDOCAINE, prilocaine, PROCAINE", "DAPSONE (commonly), NITRATES + nitroglycerin, SULFONAMIDES, PHENAZOPYRIDINE (Pyridium), nitrous oxide", "Industrial — aniline dyes, nitrobenzenes, naphthalene, well water with nitrates (infants)"],
                citationIDs: ["specialty_lpr_round34"]
            ),
            CauseGroup(
                title: "Inherited methemoglobinemia",
                causes: ["Cytochrome b5 reductase deficiency (autosomal recessive)", "Hemoglobin M variants (autosomal dominant)"],
                citationIDs: ["specialty_lpr_round34"]
            )
        ],
        nursingActions: [
            AttributedBullet("Recognize classic discordance — cyanosis (chocolate-brown blood) with normal PaO2 + low SpO2 (unreliable); ORDER CO-OXIMETRY.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("REMOVE offending agent immediately — discontinue medication, decontaminate skin, decontaminate environment.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("100% O2 via non-rebreather — does not directly reverse but supports tissue oxygenation.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("METHYLENE BLUE 1-2 mg/kg IV over 5-30 minutes for symptomatic OR ≥20-30%; verify G6PD status (hemolysis risk in deficiency).", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Ascorbic acid 1-2 g IV alternative in G6PD deficiency OR refractory cases.", citationIDs: ["specialty_lpr_round34"])
        ],
        watchFor: [
            AttributedBullet("METHYLENE BLUE CAUTION — serotonin syndrome with SSRI/SNRI/MAOI (methylene blue is MAOI); discontinue or avoid concurrent serotonergic agents.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("HEMOLYSIS — methylene blue contraindicated in G6PD deficiency; consider ascorbic acid alternative.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("BENZOCAINE SPRAYS — boxed warning; particularly for TEE + bronchoscopy + intubation; avoid in infants <2 years (FDA contraindication).", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("DAPSONE chronic methemoglobinemia — adjust dose; ascorbic acid prophylaxis.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Refractory cases — exchange transfusion or hyperbaric oxygen consultation.", citationIDs: ["specialty_lpr_round34"])
        ],
        citations: [openrnLPRR34, cdcLPRR34, specialtyLPRR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

// MARK: - PROCEDURES

public enum HazardousDrugHandlingSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "hazardous-drug-handling-usp-800",
        title: "Hazardous drug handling (USP <800>)",
        subtitle: "Chemotherapy + targeted therapy + cytotoxic + reproductive hazard drugs · PPE + closed-system transfer devices (CSTDs) · spill kit + decontamination · USP <800> compliance",
        nclexTags: safetyProcTagsR34,
        indications: AttributedProse(
            "Safe handling of hazardous drugs (HDs) per USP <800> standards — chemotherapy + immunomodulators + biologics with carcinogenic, teratogenic, reproductive, or genotoxic potential; NIOSH HD list defines Group 1 (antineoplastic) + Group 2 (non-antineoplastic with HD criteria) + Group 3 (primary reproductive toxicity). Applies to receipt + storage + compounding + administration + disposal + spill management + occupational exposure prevention per primary source.",
            citationIDs: ["specialty_lpr_round34"]
        ),
        contraindications: AttributedProse(
            "Pregnancy + planning pregnancy + breastfeeding (handling restrictions per institutional policy); active eczema or skin breakdown on hands; medical conditions precluding PPE use.",
            citationIDs: ["specialty_lpr_round34"]
        ),
        equipment: [
            AttributedBullet("PPE — chemo-rated double gloves (nitrile, ASTM D6978 tested), CHEMO-RATED gown (impermeable, polyethylene-coated polypropylene), N95 OR PAPR respirator for spills, eye protection + face shield.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Closed-system transfer device (CSTD) — vial adapters, syringe + bag interfaces; prevent aerosol + spill during preparation + administration; significantly reduce occupational exposure.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Spill kit — chemo-rated PPE, absorbent pads, scoops, disposal bags labeled \"Hazardous\", warning signs, decontamination solutions.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Biological safety cabinet (BSC) Class II Type B2 OR compounding aseptic containment isolator (CACI) for sterile compounding; negative pressure room.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Hazardous waste containers — yellow chemo containers; sharps containers; trace HD trash; bulk HD waste; specific disposal protocols.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Surface decontamination — sodium hypochlorite or sodium thiosulfate for platinum; alcohol; specific protocols per drug class.", citationIDs: ["specialty_lpr_round34"])
        ],
        preProcedure: [
            AttributedBullet("HD risk assessment — identify all hazardous drugs; categorize per NIOSH list; institutional list maintained.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Medical surveillance — annual health assessment for HD-handling personnel; reproductive consultation if pregnancy + planning + breastfeeding.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Annual training + competency demonstration — handling, PPE, CSTD, spill response.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("PPE inspection + don in correct sequence (gown → respirator → eyewear → inner gloves → outer gloves over gown cuff).", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Verify CSTD function + integrity before use.", citationIDs: ["specialty_lpr_round34"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Receipt + storage", body: "Inspect packaging for damage; isolate HD storage from non-HDs; negative pressure room for storage; signage; secondary containment of liquids.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 2, title: "Compounding (sterile + non-sterile)", body: "Use BSC Class II Type B2 or CACI in negative pressure room; CSTDs for transfers; PPE per USP <800>; minimize aerosolization; document compounding.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 3, title: "Transport + delivery", body: "Sealed leak-proof primary container; secondary impact-resistant container; \"Hazardous Drug\" labeling; chain of custody documentation.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 4, title: "Administration", body: "Don PPE (gown + double gloves + eyewear + respirator if aerosolization possible); use CSTD; spill mat under access site; prime tubing with non-drug solution; deliver with smart pump; CSTD throughout.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 5, title: "Spill response", body: "Evacuate area + post warning signs; don chemo-rated PPE; contain spill with absorbent pads from outside-in; collect with scoop; decontaminate area with sodium hypochlorite + then sodium thiosulfate (platinum) + then alcohol; double-bag waste in chemo containers; document; medical surveillance for exposed personnel.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 6, title: "Disposal", body: "Trace HD (gloves, gowns, IV bags after administration) — yellow chemo container; bulk HD waste (unused drug, expired) — different stream; sharps — chemo sharps containers; bulk waste pickup by licensed disposal vendor.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 7, title: "Doffing PPE", body: "Remove in correct sequence (outer gloves → eyewear → gown → respirator → inner gloves) to minimize self-contamination; hand hygiene after.", citationIDs: ["specialty_lpr_round34"])
        ],
        postProcedure: [
            AttributedBullet("Hand hygiene + skin assessment for contamination.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Document HD handling + any incidents + spills in occupational health record.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Environmental surface monitoring — wipe samples for HD residue; institutional schedule.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Medical surveillance — annual + after exposure incidents; biological monitoring in selected.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Patient handling — universal precautions × 48 hours post-chemo (excretions); family education.", citationIDs: ["specialty_lpr_round34"])
        ],
        documentation: [
            AttributedBullet("HD list + risk assessment + institutional policies; annual review.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Training records + competency annually.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Spill records + medical surveillance + occupational exposure.", citationIDs: ["specialty_lpr_round34"])
        ],
        watchFor: [
            AttributedBullet("Occupational exposure — skin contact, inhalation, ingestion, needlesticks; medical surveillance + biological monitoring.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Reproductive harm — teratogenic + mutagenic + cytotoxic effects on personnel; pregnancy + planning + breastfeeding counseling.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Long-term carcinogenic risk — case-control studies show elevated rates in HD-handling personnel; minimize exposure.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Spill management — sodium thiosulfate for platinum agents; specific protocols.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Patient excretion handling — chemo metabolites in body fluids; universal precautions × 48 hours.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("USP <800> compliance — Joint Commission + state regulatory + institutional accreditation requirements.", citationIDs: ["specialty_lpr_round34"])
        ],
        citations: [openrnLPRR34, cdcLPRR34, specialtyLPRR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MedicationReconciliationSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "medication-reconciliation",
        title: "Medication reconciliation",
        subtitle: "Comprehensive med list comparison · admission + transfer + discharge · Joint Commission National Patient Safety Goal · prevent ADEs at transitions · multidisciplinary",
        nclexTags: safetyProcTagsR34,
        indications: AttributedProse(
            "Comprehensive medication reconciliation at all care transitions — admission, transfer between units/levels of care, discharge; Joint Commission National Patient Safety Goal 03.06.01; reduces medication errors at transitions which account for 50-66% of all ADEs. Process — compare current home medications + hospital medication orders → identify + resolve discrepancies → educate patient/family + transition document per primary source.",
            citationIDs: ["specialty_lpr_round34"]
        ),
        contraindications: AttributedProse(
            "None — applies to all patients at all care transitions; modifications for cognitive impairment + language barriers + complex regimens.",
            citationIDs: ["specialty_lpr_round34"]
        ),
        equipment: [
            AttributedBullet("Best Possible Medication History (BPMH) tool — structured medication interview template.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Access to electronic health record + pharmacy claims data + outpatient records (Surescripts, RxHub).", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Discrepancy log + resolution tracking.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Multilingual education materials + interpreter services.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Discharge medication list template + patient-friendly format.", citationIDs: ["specialty_lpr_round34"])
        ],
        preProcedure: [
            AttributedBullet("Establish primary information source — patient + family + caregiver + bottles + medication list + outside pharmacy + previous records.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Prepare environment — private interview area + adequate time (often 20-45 minutes for complex patients).", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Engage interpreter services for non-English speakers.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Review available pharmacy + EHR + previous records before patient interview.", citationIDs: ["specialty_lpr_round34"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Best Possible Medication History (BPMH)", body: "Structured interview — Have you taken any medications today? Are you currently taking prescription medications? Over-the-counter? Vitamins, herbal supplements? Inhalers? Eye drops? Patches? Injections? Birth control? For each — name, strength, dose, route, frequency, last dose, indication, prescriber; clarify adherence patterns + recent changes.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 2, title: "Compare medications", body: "Compare BPMH against active hospital orders OR discharge orders → identify discrepancies — omission (home med not continued/restarted), commission (hospital med given that shouldn't be), wrong dose/route/frequency, duplication, drug interaction.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 3, title: "Reconcile + resolve", body: "Document each discrepancy + resolution + rationale; coordinate with prescriber for clarification; intentional vs unintentional discrepancies distinguished; correct orders.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 4, title: "Communicate at transition", body: "Update patient record + communication tool + handoff document; sign-off + accountability.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 5, title: "Discharge education", body: "Patient-friendly medication list — name + indication (\"what it's for\") + dose + frequency + special instructions + side effects + when to call; medication reconciliation discharge summary; teach-back methodology; family/caregiver involvement.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 6, title: "Post-discharge follow-up", body: "Outpatient provider notification + medication reconciliation continuity; pharmacy + clinic follow-up; readmission risk assessment.", citationIDs: ["specialty_lpr_round34"])
        ],
        postProcedure: [
            AttributedBullet("Document reconciliation + discrepancies + resolution in chart.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Patient/family education + teach-back verification.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Communication to outpatient provider + pharmacy + home health.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Quality improvement tracking + readmission rates + ADE reduction.", citationIDs: ["specialty_lpr_round34"])
        ],
        documentation: [
            AttributedBullet("BPMH + discrepancies + resolution at each transition.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Patient + family education + teach-back.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Communication to outpatient providers + pharmacy.", citationIDs: ["specialty_lpr_round34"])
        ],
        watchFor: [
            AttributedBullet("Patient/family unable to provide complete history — engage outpatient pharmacy + previous records + family.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Complex regimens with multiple specialists — coordinate care + identify primary prescriber.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("OTC + supplements often missed — specifically ask; clinically significant interactions (warfarin + St John's wort, etc.).", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Recent medication changes (new prescription, dose changes, discontinuation) — high-risk for discrepancy.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("High-risk patients — elderly, polypharmacy (≥5 meds), multiple comorbidities, frequent admissions, cognitive impairment.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Joint Commission NPSG compliance + accreditation impact.", citationIDs: ["specialty_lpr_round34"])
        ],
        citations: [openrnLPRR34, cdcLPRR34, specialtyLPRR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ForensicEvidenceSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "forensic-evidence-chain-of-custody",
        title: "Forensic evidence collection + chain of custody",
        subtitle: "Sexual assault, domestic violence, gunshot wound, suspicious death, intoxication · evidence preservation + chain of custody · multidisciplinary · legal admissibility",
        nclexTags: safetyProcTagsR34,
        indications: AttributedProse(
            "Forensic evidence collection in healthcare settings — sexual assault evidence collection (SAFE/SANE programs), domestic violence + IPV evidence, gunshot wound + injury evidence, suspicious deaths, drug-facilitated assault, child + elder abuse, motor vehicle accident BAC. Chain of custody preserves evidence admissibility in legal proceedings. SANE-trained nurses ideal; institutional protocols + state laws + multidisciplinary (forensic + law enforcement + social services + legal) per primary source.",
            citationIDs: ["specialty_lpr_round34"]
        ),
        contraindications: AttributedProse(
            "Patient refusal (rights vs reporting laws balance); medical instability precluding examination; lack of consent for non-emergent evidence collection.",
            citationIDs: ["specialty_lpr_round34"]
        ),
        equipment: [
            AttributedBullet("Sexual Assault Evidence Collection Kit (SAEK) — sealed kit with swabs + slides + envelopes + clothing bags; institutional or state-provided; SANE programs.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Camera for injury documentation (consistent angle, scale ruler, identification, dated).", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Body diagrams + injury documentation forms.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Specimen collection — bloodtubes, urine cups, swabs (oral, vaginal, anal), trace evidence collection, hair samples.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Chain of custody forms + tamper-evident seals + labels.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Refrigerator/freezer for evidence storage with restricted access.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Multilingual patient information + advocacy resources.", citationIDs: ["specialty_lpr_round34"])
        ],
        preProcedure: [
            AttributedBullet("Patient consent + autonomy — informed about evidence collection process + reporting requirements + advocacy options; cannot proceed without consent except mandatory reporting (child abuse, elder abuse).", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Advocate engagement — sexual assault advocate, domestic violence advocate, social services, victim support.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Medical stabilization first — emergent care takes precedence over evidence collection; coordinate.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Time-sensitivity — sexual assault evidence collection optimal within 72-96 hours (variable by state) for DNA evidence; tox screen for drug-facilitated assault.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Document chronology + witnesses + chain of evidence-holders.", citationIDs: ["specialty_lpr_round34"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Patient interview", body: "Detailed history of event — time, location, perpetrator, force/coercion, body parts involved, ejaculation, condom use, washing/showering/changing clothes after; symptoms + injuries; sensitive empathic interview; allow patient pace; document verbatim quotes.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 2, title: "Physical examination", body: "Thorough body assessment with consent + photograph injuries (with consent + ruler + identifier); document size + color + pattern; head-to-toe assessment + genital + pelvic exam; speculum + bimanual; oral exam + anal exam; document all findings on body diagram.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 3, title: "Evidence collection", body: "Follow SAEK or institutional protocol — clothing (bag separately, paper not plastic), swabs (oral, vaginal, anal per protocol; air-dry), pubic hair combings, fingernail scrapings, blood specimens, urine for tox screen, trace evidence; air-dry all samples before sealing.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 4, title: "Documentation + chain of custody", body: "Document each evidence item — type + body site + collection time + collector name; tamper-evident sealing; chain of custody log — each person handling evidence + time + signature; preserve unbroken chain for legal admissibility.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 5, title: "Medical treatment + prophylaxis", body: "STI prophylaxis (CDC guidelines), HIV PEP (consider per exposure risk), pregnancy prevention (emergency contraception within 72-120 hours), hepatitis B vaccine + HBIG, tetanus, wound care + injury management; trauma support.", citationIDs: ["specialty_lpr_round34"]),
            ProcedureStep(number: 6, title: "Reporting + referral", body: "Mandatory reporting (child abuse + elder abuse + suspicious death); law enforcement notification with patient consent (sexual assault + adult IPV — patient choice in many jurisdictions); social services + advocacy + counseling + follow-up; safe discharge plan.", citationIDs: ["specialty_lpr_round34"])
        ],
        postProcedure: [
            AttributedBullet("Evidence storage — locked refrigerator/freezer with restricted access until transfer to law enforcement.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Patient discharge with safety plan + advocacy contacts + medical follow-up + counseling.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Follow-up STI screening + pregnancy testing + counseling + medical care.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Court testimony potential — preserve original documentation + photographs; nurse may be called as witness.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Mental health support for nurse + team — secondary trauma + vicarious traumatization.", citationIDs: ["specialty_lpr_round34"])
        ],
        documentation: [
            AttributedBullet("Comprehensive chronology + interview verbatim quotes + history.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Injury documentation — body diagrams + photographs + descriptive.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Evidence collection log + chain of custody forms.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Medical treatment + prophylaxis + follow-up plan.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Reporting + advocacy + safety planning.", citationIDs: ["specialty_lpr_round34"])
        ],
        watchFor: [
            AttributedBullet("Chain of custody breaks — destroy evidence admissibility; meticulous documentation.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Patient autonomy + consent — balance with mandatory reporting laws (child/elder abuse).", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Safety planning — domestic violence + repeat victimization risk + lethality assessment.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Cultural sensitivity + trauma-informed care + LGBTQ+ considerations.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("Secondary trauma in healthcare workers — institutional support + counseling.", citationIDs: ["specialty_lpr_round34"]),
            AttributedBullet("SANE-trained nurses + multidisciplinary forensic teams ideal; community hospitals lacking — transfer or telemedicine consultation.", citationIDs: ["specialty_lpr_round34"])
        ],
        citations: [openrnLPRR34, cdcLPRR34, specialtyLPRR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

// MARK: - REFERENCES

public enum DelegationScopeSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "delegation-scope-of-practice",
        title: "Delegation + scope of practice",
        subtitle: "5 Rights of Delegation · RN/LPN/UAP scope · NCSBN + state board guidelines · supervision + accountability · safe + effective patient care",
        eyebrow: "REFERENCE · MANAGEMENT OF CARE",
        nclexTags: mocTagsR34,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Delegation is the transfer of responsibility for performing a selected nursing task in a selected situation to a competent individual while retaining accountability for the outcome. Effective delegation maximizes care delivery in resource-constrained environments while maintaining safety. NCSBN + ANA define standards; state Nurse Practice Acts define legal scope of practice — vary by state. RN has highest accountability + cannot delegate nursing judgment, assessment, education, or care of unstable patients per primary source.",
                citationIDs: ["specialty_lpr_round34"]
            )),
            .keyValueTable(title: "5 Rights of Delegation (NCSBN)", [
                KeyValueRow(key: "RIGHT TASK", value: "Within scope of practice of the delegatee; routine, predictable, low-risk task; not requiring nursing judgment"),
                KeyValueRow(key: "RIGHT CIRCUMSTANCE", value: "Stable patient; appropriate environment; resources available; emergency situations are NOT appropriate for delegation"),
                KeyValueRow(key: "RIGHT PERSON", value: "Competent delegatee with verified training + skills + experience for the task"),
                KeyValueRow(key: "RIGHT DIRECTION/COMMUNICATION", value: "Clear, specific instructions; expected outcome; timeframe; what to report back + when; available to delegatee"),
                KeyValueRow(key: "RIGHT SUPERVISION/EVALUATION", value: "Monitor performance; intervene if needed; evaluate outcome; provide feedback; continuous accountability")
            ]),
            .keyValueTable(title: "Scope of practice — typical roles", [
                KeyValueRow(key: "RN (Registered Nurse)", value: "Nursing assessment + judgment + planning + evaluation + complex skills (IV med admin, blood admin, complex wound care, education, care coordination); CAN delegate but RETAINS ACCOUNTABILITY; manages unstable patients"),
                KeyValueRow(key: "LPN/LVN (Licensed Practical/Vocational Nurse)", value: "Provides specific care within RN-developed plan; many states allow oral meds, some IV meds, dressing changes, sterile procedures (varies); cannot perform initial assessment + nursing diagnosis; manages stable patients; CAN delegate to UAP in some states"),
                KeyValueRow(key: "UAP / CNA / PCT (Unlicensed)", value: "Basic care under RN/LPN direction — vital signs (stable), bathing, transfers, ambulation, feeding, I/O measurement, simple wound care, ROM; CANNOT administer medications (with some exceptions) + assessments + interpretation"),
                KeyValueRow(key: "Cannot delegate (RN scope)", value: "Nursing assessment + nursing diagnosis + planning + evaluation + patient education + administration of IV push medications + management of unstable patients + clinical decision-making")
            ]),
            .bullets(title: "Effective delegation principles", [
                AttributedBullet("Know the delegatee's competencies + scope of practice + experience; verify training for specific tasks.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Match task complexity to delegatee skill level + patient stability.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Clear communication of WHAT + WHEN + HOW + WHO TO REPORT TO + WHAT TO REPORT BACK.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Provide adequate supervision based on delegatee skill + patient acuity; remain available.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Encourage delegatee to ask questions + report concerns; create psychologically safe environment.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Document delegation when appropriate; record outcomes + feedback.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Accept accountability — RN remains accountable for patient outcomes regardless of delegation.", citationIDs: ["specialty_lpr_round34"])
            ]),
            .bullets(title: "Inappropriate delegation examples", [
                AttributedBullet("Asking UAP to assess pain or interpret pain assessment.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Asking UAP to provide patient education or discharge teaching.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Asking LPN to start initial IV in a deteriorating patient (assessment + judgment).", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Asking new nurse to take care of unstable ICU patient without preceptor.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Delegating to anyone in an emergency situation requiring rapid nursing judgment.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Asking UAP to perform sterile procedure they have not been trained for.", citationIDs: ["specialty_lpr_round34"])
            ]),
            .bullets(title: "Prioritization frameworks (when delegating + managing care)", [
                AttributedBullet("ABC (Airway → Breathing → Circulation) for acute deterioration + emergencies.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Maslow's Hierarchy — physiological (food, water, oxygen) > safety > love/belonging > esteem > self-actualization.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Acute vs Chronic — acute changes typically take priority over chronic stable conditions.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Safety > Comfort > Health Promotion — safety-related issues require immediate action.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Unexpected vs Expected — unexpected findings need urgent assessment.", citationIDs: ["specialty_lpr_round34"])
            ]),
            .bullets(title: "Communication tools", [
                AttributedBullet("SBAR (Situation-Background-Assessment-Recommendation) — structured handoff + clinical communication.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("ISBAR or I-PASS — variations adding Identify + Patient Summary + Action items + Situation Awareness.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Read-back / Repeat-back — verification of verbal orders + critical information.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Closed-loop communication — speaker → listener acknowledgment → speaker confirms understanding.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Universal Protocol time-out + huddles + multidisciplinary rounds.", citationIDs: ["specialty_lpr_round34"])
            ])
        ],
        citations: [openrnLPRR34, cdcLPRR34, specialtyLPRR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum InformedConsentSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "informed-consent-framework",
        title: "Informed consent",
        subtitle: "Capacity + voluntariness + disclosure · elements + exceptions · special populations · cultural + linguistic competence · documentation",
        eyebrow: "REFERENCE · MANAGEMENT OF CARE",
        nclexTags: mocTagsR34,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Informed consent is a legal + ethical requirement protecting patient autonomy — process by which a competent patient makes a voluntary, knowing decision about their healthcare. Required for surgical procedures, invasive procedures, blood transfusions, research, sterilization, withholding life-sustaining treatment, restraints (varies by state). RN role primarily WITNESSES the signature + confirms understanding; PROVIDER (physician, dentist, advanced practice nurse) is responsible for the actual informed consent process per primary source.",
                citationIDs: ["specialty_lpr_round34"]
            )),
            .keyValueTable(title: "Required elements of informed consent", [
                KeyValueRow(key: "1. CAPACITY", value: "Patient has decision-making capacity — understands information, appreciates situation, reasons about options, communicates choice; varies for different decisions"),
                KeyValueRow(key: "2. VOLUNTARINESS", value: "Decision is free from coercion, manipulation, undue influence; consent given without pressure"),
                KeyValueRow(key: "3. DISCLOSURE", value: "Full disclosure of: diagnosis, nature + purpose of proposed treatment, risks + benefits + likelihood, reasonable alternatives, prognosis without treatment, who will perform"),
                KeyValueRow(key: "4. UNDERSTANDING", value: "Patient demonstrates understanding through teach-back, ability to articulate the procedure + risks + alternatives"),
                KeyValueRow(key: "5. CONSENT/DECISION", value: "Patient signs consent form OR explicitly accepts (informed assent for minors); right to refuse + change mind")
            ]),
            .keyValueTable(title: "Exceptions to informed consent", [
                KeyValueRow(key: "EMERGENCY", value: "Life-threatening situation when patient cannot consent (unconscious, incapacitated) + no surrogate available; implied consent for life-saving care"),
                KeyValueRow(key: "WAIVER", value: "Patient explicitly waives consent (\"do whatever the doctor thinks\"); document"),
                KeyValueRow(key: "THERAPEUTIC PRIVILEGE", value: "Provider may withhold information that would harm patient (rare; limited application); document carefully"),
                KeyValueRow(key: "INCOMPETENCE", value: "Patient lacks decision-making capacity; legal surrogate decision-maker (healthcare proxy, court-appointed guardian, family per state hierarchy)"),
                KeyValueRow(key: "MINOR", value: "Generally parent/guardian consents; emancipated minors + mature minors + reproductive health + mental health may have separate consent rights (varies by state)")
            ]),
            .bullets(title: "Nursing role + responsibilities", [
                AttributedBullet("WITNESS — confirm patient signed voluntarily + appeared to understand; not legally responsible for the disclosure itself.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("VERIFY UNDERSTANDING — teach-back method; ask patient to explain what they understand; identify gaps in understanding.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("ADVOCATE — if patient does not understand, has questions, or appears coerced, notify provider before signing.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("REFUSAL — patient has right to refuse + withdraw consent at any time; document refusal + reasons + alternatives.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("DOCUMENTATION — signed consent form in chart; nursing note documenting witness + verification of understanding + any concerns.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("INTERPRETER SERVICES — for non-English speakers + hearing impaired; trained medical interpreter required; family interpreters discouraged.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("CULTURAL SENSITIVITY — religious + cultural beliefs may affect decisions; respect autonomy.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("HEALTH LITERACY — assess + adapt communication; verify understanding without judgment.", citationIDs: ["specialty_lpr_round34"])
            ]),
            .keyValueTable(title: "Special populations", [
                KeyValueRow(key: "Children + minors", value: "Parent/guardian consents; child >7 years should provide assent; emancipated minors (married, military, court-emancipated, financially independent) can consent; mature minor doctrine + reproductive + mental health rights vary by state"),
                KeyValueRow(key: "Incapacitated adults", value: "Healthcare proxy + advance directive + court-appointed guardian + family hierarchy (spouse > adult children > parents > siblings) — varies by state"),
                KeyValueRow(key: "Pregnancy", value: "Pregnant patient retains decision-making; fetal interests do not override maternal autonomy (with rare exceptions)"),
                KeyValueRow(key: "Mental illness", value: "Capacity may be intact + retain decision-making rights; severe psychosis or impaired judgment may require evaluation; psychiatric advance directives"),
                KeyValueRow(key: "Cognitive impairment + dementia", value: "Capacity varies by decision + may fluctuate; involve family + surrogate; document assessment of capacity for specific decision"),
                KeyValueRow(key: "Substance use", value: "Intoxicated patient may lack capacity acutely; reassess when sober; complex situations")
            ]),
            .bullets(title: "Implications + dilemmas", [
                AttributedBullet("Refusing life-saving treatment — patient with capacity can refuse; document discussion + alternatives + risks.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Jehovah's Witness + blood refusal — preferences documented in advance; alternatives explored; respect autonomy.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Coercion by family — assess patient separately; advocate for patient voice; involve ethics committee + social work + risk management.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Withholding/withdrawing life-sustaining treatment — separate consent + discussion; family + interdisciplinary + spiritual care; goal-concordant care.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Research consent — additional protections; IRB oversight + informed consent process distinct from clinical care.", citationIDs: ["specialty_lpr_round34"])
            ])
        ],
        citations: [openrnLPRR34, cdcLPRR34, specialtyLPRR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}


public enum NursingEthicsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "nursing-ethics-framework",
        title: "Nursing ethics framework",
        subtitle: "ANA Code of Ethics · 4 principles (autonomy/beneficence/non-maleficence/justice) · ethical decision-making + dilemmas · advocacy + moral distress",
        eyebrow: "REFERENCE · MANAGEMENT OF CARE",
        nclexTags: mocTagsR34,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Nursing ethics provides the moral framework for nursing practice — guiding decisions when values conflict, balancing patient rights with clinical realities, advocating for vulnerable patients. ANA Code of Ethics for Nurses (2015 revision) is the foundational ethical document. Four classical principles + recognition of moral distress + emerging frameworks (relational ethics, justice + equity, ethical leadership). Nurses face ethical challenges daily — end-of-life care, autonomy vs paternalism, resource allocation, professional boundaries, social determinants per primary source.",
                citationIDs: ["specialty_lpr_round34"]
            )),
            .keyValueTable(title: "Four classical principles of biomedical ethics", [
                KeyValueRow(key: "AUTONOMY", value: "Respect for self-determination; patient's right to make decisions about own care free from coercion; informed consent + advance directives are expressions"),
                KeyValueRow(key: "BENEFICENCE", value: "Doing good; promoting wellbeing; active interventions to benefit patient; positive duty"),
                KeyValueRow(key: "NON-MALEFICENCE", value: "\"First do no harm\"; refraining from actions that harm; avoiding unnecessary risks; classic medical principle"),
                KeyValueRow(key: "JUSTICE", value: "Fair distribution of healthcare benefits + burdens; equity in access; social determinants; resource allocation; addressing healthcare disparities")
            ]),
            .bullets(title: "ANA Code of Ethics for Nurses — 9 provisions", [
                AttributedBullet("Provision 1 — Respect for human dignity + worth + uniqueness regardless of circumstances.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Provision 2 — Primary commitment is to the patient (individual, family, group, community, population).", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Provision 3 — Promotes + advocates for patient health + safety + rights.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Provision 4 — Authority + accountability + responsibility for individual nursing practice + delegation.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Provision 5 — Duties to self + others — self-care + continuing competence + personal growth.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Provision 6 — Maintains + improves ethical work environment + practice + working conditions.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Provision 7 — Advancing the profession through research + practice + policy.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Provision 8 — Collaborating with others to protect human rights + promote health diplomacy.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Provision 9 — Profession articulates + maintains values + integrity through professional organizations.", citationIDs: ["specialty_lpr_round34"])
            ]),
            .keyValueTable(title: "Other key ethical concepts", [
                KeyValueRow(key: "FIDELITY", value: "Faithfulness + keeping promises + commitments; nurse-patient relationship + therapeutic boundaries"),
                KeyValueRow(key: "VERACITY", value: "Truth-telling; honesty in communication; not deceiving patients"),
                KeyValueRow(key: "CONFIDENTIALITY", value: "Protecting patient information; HIPAA-regulated; limited exceptions for safety + reporting + clinical care"),
                KeyValueRow(key: "PRIVACY", value: "Right to control personal information + bodily exposure; respect during care + procedures"),
                KeyValueRow(key: "ADVOCACY", value: "Speaking for + supporting patient interests + needs; particularly for vulnerable; central nursing role"),
                KeyValueRow(key: "PATERNALISM", value: "Acting in believed best interest, overriding patient autonomy; ethically problematic except specific cases"),
                KeyValueRow(key: "DOUBLE EFFECT", value: "Permissible to act with intended good effect even with foreseen but unintended bad effect (palliative sedation, blood transfusion refusal)")
            ]),
            .bullets(title: "Ethical dilemmas in nursing practice", [
                AttributedBullet("End-of-life care — withholding/withdrawing treatment; futile care; family conflict; cultural + religious differences.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Autonomy vs beneficence — patient refusing life-saving treatment; cognitive impairment + capacity questions.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Justice + resource allocation — ICU bed allocation, transplant prioritization, social determinants impact on care.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Truth-telling — diagnosis disclosure (cancer, terminal illness); family requests to withhold information.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Confidentiality — STI partner notification, child + elder abuse, public health duty to report.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Professional boundaries — patient relationships, gifts, dual relationships, social media.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Conscientious objection — nurse's right to opt out of procedures (abortion, MAID) vs duty to patient.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Whistleblowing — reporting unsafe practices + colleague concerns; institutional protection.", citationIDs: ["specialty_lpr_round34"])
            ]),
            .bullets(title: "Ethical decision-making framework", [
                AttributedBullet("IDENTIFY the ethical issue + competing values + stakeholders.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("GATHER information — clinical facts + patient values + relevant laws + institutional policies.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("CONSIDER options + consequences for each stakeholder.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("APPLY ethical principles + framework + Code of Ethics.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("DELIBERATE with team + ethics committee + family + patient.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("ACT on chosen decision; document reasoning + outcomes.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("EVALUATE outcomes + learn for future similar situations.", citationIDs: ["specialty_lpr_round34"])
            ]),
            .bullets(title: "Moral distress + resilience", [
                AttributedBullet("MORAL DISTRESS — psychological response when nurse knows the ethically right action but is constrained from acting on it; common in end-of-life care, futile care, resource limitations.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Symptoms — frustration, anger, guilt, anxiety, depression, burnout, withdrawal; cumulative residue; can lead to leaving nursing.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Recognition + acknowledgment + naming experiences.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Institutional support — moral resilience programs + ethics consultation + peer support + debriefing + counseling.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Personal resilience — self-care + mindfulness + spiritual practice + advocacy + connecting with values.", citationIDs: ["specialty_lpr_round34"]),
                AttributedBullet("Schwartz Rounds + Schwartz Center Compassion in Action — interdisciplinary forums for difficult cases + emotional impact.", citationIDs: ["specialty_lpr_round34"])
            ])
        ],
        citations: [openrnLPRR34, cdcLPRR34, specialtyLPRR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}
