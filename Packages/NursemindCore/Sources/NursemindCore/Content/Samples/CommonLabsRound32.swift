import Foundation

// Curator-model lab entries (round 32 — critical care monitoring: ACT, TEG/ROTEM, capnography).

private let openrnLabsR32 = CitationSource(
    id: "openrn_labs_round32",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLabsR32 = CitationSource(
    id: "specialty_labs_round32",
    shortName: "SCCM + ACCP + AHA concept citations",
    publisher: "SCCM · ACCP · AHA",
    license: .factCitationOnly,
    url: "https://www.sccm.org/Clinical-Resources/",
    lastRetrieved: "2026-05-13"
)

private let labsTagsR32 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .perfusion
)

public enum ActivatedClottingTimeSample {
    public static let entry: LabEntry = LabEntry(
        id: "activated-clotting-time",
        title: "Activated clotting time (ACT)",
        subtitle: "Point-of-care heparin titration · PCI + cardiopulmonary bypass + ECMO + CRRT · whole blood · result in minutes · target depends on procedure",
        specimen: "Whole blood (1-2 mL); cartridge-based point-of-care; minimum manipulation; result within 1-3 minutes",
        nclexTags: labsTagsR32,
        referenceRanges: [
            ReferenceRangeRow(value: "Normal ACT 80-130 seconds (varies by device)", label: "Without anticoagulant; baseline reference for procedure planning", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "PCI target ACT >250-300 seconds", label: "Heparin anticoagulation during PCI; bivalirudin can also be measured by ACT; institution-specific targets", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "Cardiopulmonary bypass target ACT >400-480 seconds", label: "Higher target during CPB to prevent clotting in extracorporeal circuit", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "ECMO target ACT 180-220 seconds", label: "Lower target than CPB; balance anticoagulation with bleeding risk; institution-specific", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "CRRT target ACT 160-220 seconds", label: "Continuous renal replacement therapy heparin anticoagulation; institution-specific", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "Post-procedure goal — return to baseline", label: "Hemostasis + sheath removal + recovery; protamine reversal in cardiac surgery (1 mg per 100 units heparin)", citationIDs: ["specialty_labs_round32"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "At goal ACT",
                summary: "ACT within target range for ongoing procedure — heparin or DTI anticoagulation appropriate per primary source.",
                nursingActions: [
                    "Continue current heparin/DTI infusion rate.",
                    "Recheck ACT every 30 minutes during PCI/intervention, every 15-30 minutes during CPB, every 4-6 hours during ECMO/CRRT.",
                    "Document ACT trend + clinical bleeding assessment + circuit appearance (ECMO/CRRT).",
                    "Coordinate procedural team and pharmacy."
                ],
                citationIDs: ["specialty_labs_round32"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Above goal — bleeding risk",
                summary: "ACT above target — excessive anticoagulation; bleeding risk; reduce or hold heparin/DTI infusion per primary source.",
                nursingActions: [
                    "Hold or reduce heparin/DTI infusion rate.",
                    "Assess for active bleeding — IV sites, vascular access, mucosa, urine, stool, neurologic.",
                    "Recheck ACT after intervention.",
                    "PROTAMINE reversal if heparin + significant bleeding (1 mg protamine per 100 units heparin given in past 2-3 hours, slower if needed; maximum 50 mg/dose); CAUTION — protamine itself can cause hypotension + anaphylaxis + bradycardia; slow administration; protamine does NOT reverse bivalirudin or argatroban.",
                    "Transfusion (FFP, cryoprecipitate, platelets) per clinical needs."
                ],
                citationIDs: ["specialty_labs_round32"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Below goal — clotting risk",
                summary: "ACT below target — insufficient anticoagulation; risk of clotting in circuit OR thromboembolism per primary source.",
                nursingActions: [
                    "Increase heparin/DTI infusion rate OR give additional bolus per protocol.",
                    "Check circuit (ECMO/CRRT) for clots; inspect cardiac/vascular access sites.",
                    "Recheck ACT in 30-60 minutes after dose adjustment.",
                    "Assess for HEPARIN-INDUCED THROMBOCYTOPENIA (HIT) if heparin-resistant — sudden requirement for higher doses, falling platelet count, thrombosis.",
                    "Alternative anticoagulant (bivalirudin, argatroban) for confirmed/suspected HIT.",
                    "Coordinate hematology + procedural teams."
                ],
                citationIDs: ["specialty_labs_round32"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Above goal ACT (over-anticoagulation)",
                causes: ["Excessive heparin dose or rate", "Reduced heparin clearance (hepatic dysfunction)", "Concurrent anticoagulants (DOACs, warfarin)", "Liver disease (reduced antithrombin synthesis)", "Hemodilution (decreased coagulation factors)", "Hypothermia"],
                citationIDs: ["specialty_labs_round32"]
            ),
            CauseGroup(
                title: "Below goal ACT (under-anticoagulation)",
                causes: ["Inadequate heparin dose or rate", "Heparin resistance (heparin-induced thrombocytopenia, antithrombin deficiency, sepsis, malignancy)", "Increased clearance", "Thrombosis (consumption)", "Pre-existing coagulopathy reversed", "Switching anticoagulants without adequate transition"],
                citationIDs: ["specialty_labs_round32"]
            )
        ],
        nursingActions: [
            AttributedBullet("Point-of-care testing — bedside cartridge-based devices (Hemochron, i-STAT); rapid result (1-3 minutes); minimal training required.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("Frequency based on indication — every 30 minutes during PCI, every 15-30 minutes during CPB, every 4-6 hours during ECMO/CRRT, more frequent during dose adjustments.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("Target ranges vary by procedure + device + institution — verify institutional protocols.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("aPTT alternative — for IV heparin infusion not associated with extracorporeal circuit; ACT preferred for procedural anticoagulation due to faster turnaround.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("Anti-Xa levels — alternative for heparin monitoring; not used during PCI/CPB/ECMO/CRRT (slow turnaround); used for LMWH monitoring.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("HEPARIN-INDUCED THROMBOCYTOPENIA (HIT) — heparin resistance + falling platelets + new thrombosis; 4Ts score; alternative anticoagulant (bivalirudin, argatroban, fondaparinux).", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("BIVALIRUDIN monitoring — ACT during PCI; aPTT for non-PCI use; chromogenic Factor X assay alternative.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("ARGATROBAN monitoring — aPTT primarily (1.5-3x baseline); transient INR elevation during warfarin transition (specific protocols).", citationIDs: ["specialty_labs_round32"])
        ],
        watchFor: [
            AttributedBullet("MASSIVE BLEEDING from over-anticoagulation — emergent; protamine for heparin reversal (cautiously); supportive for bivalirudin/argatroban; transfusion.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("PROTAMINE REACTIONS — hypotension, anaphylaxis, bradycardia; slow administration; especially with rapid administration; pulmonary HTN crisis; rare but serious.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("HEPARIN-INDUCED THROMBOCYTOPENIA (HIT) — heparin resistance + falling platelets + new thrombosis; switch to non-heparin anticoagulant + hematology.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("CIRCUIT CLOTTING (ECMO/CRRT) — under-anticoagulation; visible clots; falling circuit performance; circuit change if necessary.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("LABORATORY ALTERNATIVES — when ACT-related concerns, use aPTT or anti-Xa or chromogenic Factor X based on context.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("INSTITUTION-SPECIFIC protocols — verify targets + cadence + device-specific.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("Bleeding risk + thrombosis balance — clinical assessment + lab integration.", citationIDs: ["specialty_labs_round32"])
        ],
        citations: [openrnLabsR32, specialtyLabsR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ViscoelasticTestingSample {
    public static let entry: LabEntry = LabEntry(
        id: "viscoelastic-testing",
        title: "Viscoelastic testing (TEG + ROTEM)",
        subtitle: "Whole blood point-of-care coagulation · trauma + cardiac surgery + cirrhosis + obstetric · components — clot initiation + amplification + strength + lysis · goal-directed transfusion",
        specimen: "Whole blood; bedside point-of-care; results 10-30 minutes; thromboelastography (TEG) or rotational thromboelastometry (ROTEM); specialized cartridges for specific tests",
        nclexTags: labsTagsR32,
        referenceRanges: [
            ReferenceRangeRow(value: "R time (TEG) or CT (ROTEM) — clot initiation", label: "Reaction time/clotting time prolonged → factor deficiency or anticoagulant present → FFP or cryoprecipitate may be needed", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "K time (TEG) or CFT (ROTEM) — clot kinetics", label: "Time for clot to reach specific firmness; prolonged → fibrinogen + factor deficiency → cryoprecipitate", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "Alpha angle — clot formation rate", label: "Rate of clot strengthening; reduced → fibrinogen + factor deficiency", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "Maximum amplitude (MA) or MCF — clot strength", label: "Reduced → low platelets or platelet dysfunction → platelet transfusion or DDAVP", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "LY30 — clot lysis 30 min", label: "Elevated >3% → hyperfibrinolysis → TXA or other antifibrinolytic", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "Heparin-specific TEG/ROTEM (heparinase TEG/ROTEM)", label: "Identifies heparin effect; useful in heparin-treated patients (ECMO, CPB)", citationIDs: ["specialty_labs_round32"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal viscoelastic profile",
                summary: "Hemostasis grossly intact — usually no transfusion indicated; clinical bleeding evaluation continues per primary source.",
                nursingActions: [
                    "Continue current management; reassess if bleeding persists or worsens.",
                    "Document baseline.",
                    "Recheck in 30-60 minutes if dynamic clinical situation."
                ],
                citationIDs: ["specialty_labs_round32"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Abnormal pattern — targeted product replacement",
                summary: "Abnormal pattern indicates specific deficiency — guides goal-directed product replacement (vs traditional 'shotgun' transfusion of 1:1:1 FFP:platelets:RBC) per primary source.",
                nursingActions: [
                    "Long R time / prolonged CT (factor deficiency) → FFP 10-15 mL/kg + cryoprecipitate if fibrinogen low.",
                    "Low MA / MCF (platelet/fibrinogen deficiency) → platelets 1 unit per 10 kg + cryoprecipitate or fibrinogen concentrate.",
                    "Low alpha angle (fibrinogen deficiency) → cryoprecipitate 1 unit per 10 kg or fibrinogen concentrate 25-50 mg/kg.",
                    "Elevated LY30 (hyperfibrinolysis) → TXA 1-2 g IV + reassess.",
                    "Heparin effect → reverse with protamine if heparin given.",
                    "Recheck TEG/ROTEM after product administration to assess response.",
                    "Multidisciplinary — anesthesia + surgery + critical care + hematology + transfusion medicine."
                ],
                citationIDs: ["specialty_labs_round32"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Factor deficiency (long R/CT)",
                causes: ["Massive blood loss + consumption", "Liver disease (reduced synthesis)", "DIC (consumption)", "Anticoagulants (warfarin, DOACs)", "Heparin (use heparinase TEG to identify)", "Dilutional from crystalloid resuscitation", "Severe vitamin K deficiency"],
                citationIDs: ["specialty_labs_round32"]
            ),
            CauseGroup(
                title: "Fibrinogen deficiency (low alpha, low MA)",
                causes: ["Postpartum hemorrhage (early hypofibrinogenemia)", "DIC (consumption)", "Massive transfusion (dilution)", "Cardiac surgery + CPB", "Cirrhosis", "Drug effects"],
                citationIDs: ["specialty_labs_round32"]
            ),
            CauseGroup(
                title: "Platelet dysfunction (low MA with normal alpha)",
                causes: ["Thrombocytopenia", "Antiplatelet drugs (aspirin, clopidogrel, prasugrel, ticagrelor)", "Uremia", "Liver disease", "Hypothermia", "DIC", "Vasculitis"],
                citationIDs: ["specialty_labs_round32"]
            ),
            CauseGroup(
                title: "Hyperfibrinolysis (elevated LY30)",
                causes: ["Trauma (shock + acidosis + hypothermia)", "DIC", "Cardiac surgery + CPB", "Obstetric emergencies", "Snake bite", "Liver disease", "Heat stroke", "Malignancy"],
                citationIDs: ["specialty_labs_round32"]
            )
        ],
        nursingActions: [
            AttributedBullet("POINT-OF-CARE — bedside device; results within 10-30 minutes; guides goal-directed transfusion in real time.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("TRAUMA + CARDIAC SURGERY — reduce blood product usage + improve outcomes vs traditional standard coagulation tests (PT, aPTT, fibrinogen, platelet count).", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("OBSTETRIC EMERGENCIES — postpartum hemorrhage; early hypofibrinogenemia common; guides cryoprecipitate + TXA.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("CIRRHOSIS + LIVER FAILURE — better assessment than INR (rebalanced hemostasis); guides procedural risk + transfusion.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("MASSIVE TRANSFUSION protocols — increasingly include TEG/ROTEM for goal-directed product replacement; institution-specific.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("HEPARIN-SPECIFIC tests — heparinase TEG/ROTEM identifies heparin contribution; useful in ECMO + CPB + heparin-treated patients.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("DOACs interference — direct oral anticoagulants may falsely prolong; awareness in interpretation.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("Multidisciplinary — trauma + anesthesia + surgery + critical care + hematology + transfusion medicine.", citationIDs: ["specialty_labs_round32"])
        ],
        watchFor: [
            AttributedBullet("HYPERFIBRINOLYSIS — trauma + obstetric + cardiac surgery + DIC; TXA effective within hours of trauma (CRASH-2 trial); recognize early.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("DIC pattern — consumption + hyperfibrinolysis; complex; treat underlying cause + product replacement based on TEG/ROTEM.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("MASSIVE TRANSFUSION — 1:1:1 ratio (FFP:platelets:RBC) traditional; TEG/ROTEM-guided goal-directed alternative; consider in protocols.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("RESPONSE to product replacement — repeat TEG/ROTEM to confirm correction.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("INTERPRETATION CHALLENGES — direct oral anticoagulants, hypothermia, severe acidosis (lethal triad); device-specific calibration.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("INSTITUTIONAL adoption + protocol development — training + experience essential.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("PROCEDURAL RISK ASSESSMENT — cirrhotic patients undergoing procedures; guidance better than INR.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("Cost-effectiveness — appropriate use reduces blood product overuse + improves outcomes.", citationIDs: ["specialty_labs_round32"])
        ],
        citations: [openrnLabsR32, specialtyLabsR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CapnographyEtCO2Sample {
    public static let entry: LabEntry = LabEntry(
        id: "capnography-etco2",
        title: "Capnography (end-tidal CO2 / etCO2)",
        subtitle: "Non-invasive continuous CO2 monitoring · intubation confirmation + ventilation + cardiac arrest CPR feedback + procedural sedation safety · waveform interpretation",
        specimen: "Continuous exhaled CO2 measurement; mainstream (in-line) or sidestream (sampling line) capnograph; integrated with monitor; normal etCO2 35-45 mm Hg (closely correlates with PaCO2)",
        nclexTags: labsTagsR32,
        referenceRanges: [
            ReferenceRangeRow(value: "Normal etCO2 35-45 mm Hg", label: "Reflects PaCO2 (typically 2-5 mm Hg lower due to dead space); normal ventilation + perfusion", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "Low etCO2 (<35) — hyperventilation", label: "Anxiety, pain, fever, sepsis, DKA, salicylate toxicity, intracranial pressure (compensatory)", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "Low etCO2 (<20) — severe + concerning", label: "Pulmonary embolism (V/Q mismatch), cardiac arrest (no perfusion), severe shock, esophageal intubation (no etCO2 wave)", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "High etCO2 (>45) — hypoventilation", label: "Hypoventilation (sedation, opioids, neurological), increased CO2 production (fever, sepsis, malignant hyperthermia, thyroid storm), COPD/asthma exacerbation, equipment malfunction (rebreathing)", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "Sudden etCO2 drop", label: "Cardiac arrest, severe hypotension, massive pulmonary embolism, accidental extubation, circuit disconnection, ventilator malfunction", citationIDs: ["specialty_labs_round32"]),
            ReferenceRangeRow(value: "CPR — etCO2 target >10-20 mm Hg", label: "Adequate chest compressions (correlates with cardiac output); abrupt rise to >35-45 suggests ROSC", citationIDs: ["specialty_labs_round32"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal capnography",
                summary: "Normal etCO2 (35-45 mm Hg) with normal waveform — adequate ventilation, perfusion, and ETT placement per primary source.",
                nursingActions: [
                    "Continue current ventilation parameters.",
                    "Monitor for changes — sudden alterations indicate clinical change.",
                    "Document baseline + trend."
                ],
                citationIDs: ["specialty_labs_round32"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Sudden etCO2 drop — emergent",
                summary: "Sudden etCO2 drop to zero or very low — life-threatening situation requiring immediate intervention per primary source.",
                nursingActions: [
                    "EMERGENT — assess ETT placement (esophageal? extubated? dislodged?), circuit (disconnection? leak?), ventilator function.",
                    "Cardiac arrest? — initiate CPR + ACLS.",
                    "Massive pulmonary embolism? — emergent cardiology + thrombolysis OR thrombectomy.",
                    "Hypotension/shock? — fluid resuscitation + vasopressors.",
                    "Reconfirm ETT placement with bilateral breath sounds, chest rise, capnograph waveform reappearance after manual ventilation.",
                    "If esophageal intubation — remove + reintubate via tracheal route immediately."
                ],
                citationIDs: ["specialty_labs_round32"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Abnormal etCO2 — investigate cause",
                summary: "Persistent abnormal etCO2 — investigate cause + adjust ventilation, treat underlying condition per primary source.",
                nursingActions: [
                    "HIGH etCO2 — increase minute ventilation (TV, rate), assess for COPD/asthma exacerbation, hypermetabolic state, equipment rebreathing.",
                    "LOW etCO2 from hyperventilation — assess cause (anxiety, pain, sepsis, ICP); reduce minute ventilation if iatrogenic.",
                    "LOW etCO2 from low perfusion — assess hemodynamics + fluid + vasopressors.",
                    "Waveform analysis — phase II (expiratory upstroke), phase III (alveolar plateau), phase IV (inspiratory downstroke); abnormal patterns suggest specific issues.",
                    "Correlate with ABG; etCO2-PaCO2 gradient widens in V/Q mismatch.",
                    "Continuous monitoring + serial ABG when changes."
                ],
                citationIDs: ["specialty_labs_round32"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Low etCO2 (hyperventilation OR low perfusion)",
                causes: ["Hyperventilation (anxiety, pain, fever, sepsis, DKA, salicylate toxicity, increased ICP)", "Massive pulmonary embolism (V/Q mismatch)", "Cardiac arrest (no perfusion)", "Hypotension/shock", "ETT dislodgement or esophageal intubation", "Ventilator settings (excessive minute ventilation)", "Circuit leak", "Equipment malfunction (sampling line obstruction)"],
                citationIDs: ["specialty_labs_round32"]
            ),
            CauseGroup(
                title: "High etCO2 (hypoventilation OR increased CO2 production)",
                causes: ["Hypoventilation (oversedation, opioids, neuromuscular blockade, neurologic injury)", "Increased CO2 production (fever, sepsis, malignant hyperthermia, thyroid storm, exercise)", "COPD/asthma exacerbation", "Equipment rebreathing (CO2 absorber malfunction)", "Inadequate minute ventilation in ARDS"],
                citationIDs: ["specialty_labs_round32"]
            ),
            CauseGroup(
                title: "Capnography uses",
                causes: ["INTUBATION confirmation — gold standard for correct ETT placement (waveform + persistence)", "CPR feedback — etCO2 >10-20 mm Hg indicates adequate compressions, abrupt rise >35-45 suggests ROSC", "Procedural sedation safety — detects apnea + hypoventilation early (before SpO2 drops)", "Ventilator management — minute ventilation, weaning, ARDS, COPD/asthma", "Pulmonary embolism diagnostic adjunct (high D-dimer with low etCO2)", "Sleep + post-anesthesia monitoring", "Pediatric + neonatal applications"],
                citationIDs: ["specialty_labs_round32"]
            )
        ],
        nursingActions: [
            AttributedBullet("INTUBATION CONFIRMATION — etCO2 is GOLD STANDARD; persistent waveform after 5+ breaths confirms tracheal placement; absence + esophageal placement.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("MAINSTREAM vs SIDESTREAM — mainstream in-line (real-time, no delay; cumbersome with adults), sidestream sampling line (delay; can be used with non-intubated patients via nasal cannula); most ICU + OR use mainstream.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("CARDIAC ARREST CPR — etCO2 monitoring during compressions; >10-20 mm Hg correlates with adequate compressions; abrupt rise >35 suggests ROSC; <10 after 20 minutes of high-quality CPR poor prognostic indicator.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("PROCEDURAL SEDATION SAFETY — non-intubated patients receiving sedation; detects apnea + hypoventilation before SpO2 drops; opioid use detection.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("VENTILATOR MANAGEMENT — guides minute ventilation adjustment; weaning trials; ARDS lung-protective ventilation; COPD permissive hypercapnia targeting.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("etCO2-PaCO2 GRADIENT — normal 2-5 mm Hg; widens with V/Q mismatch (PE, ARDS, COPD), shunt; useful for monitoring without serial ABG.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("WAVEFORM ANALYSIS — phase II (expiratory upstroke), phase III (alveolar plateau — flat in normal, sloping in COPD), phase IV (inspiratory downstroke); specific patterns suggest underlying issues.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("Limitations — etCO2 correlates with PaCO2 but not equal; large alveolar dead space + reduced perfusion + COPD widen gradient; ABG needed for definitive PaCO2.", citationIDs: ["specialty_labs_round32"])
        ],
        watchFor: [
            AttributedBullet("ESOPHAGEAL INTUBATION — absence of persistent etCO2 waveform after ≥5 breaths confirms; emergent reintubation.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("ACCIDENTAL EXTUBATION — sudden loss of etCO2 waveform; emergent reintubation.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("CIRCUIT DISCONNECTION + leak — sudden etCO2 changes; check connections, alarms.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("MASSIVE PE — sudden etCO2 drop with hemodynamic instability; emergent workup + thrombolysis OR thrombectomy.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("CARDIAC ARREST — etCO2 drops dramatically; ACLS + monitor for ROSC (abrupt rise).", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("MALIGNANT HYPERTHERMIA — sudden + rapid etCO2 rise with hyperthermia + muscle rigidity; emergent dantrolene + supportive.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("PROCEDURAL SEDATION — apnea detection earlier than SpO2; counsel + early intervention; especially with opioids.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("HOSPITALIZED OPIOID-NAIVE patients — capnography monitoring during opioid administration reduces respiratory complications.", citationIDs: ["specialty_labs_round32"]),
            AttributedBullet("Pediatric + neonatal — adapted equipment; same principles.", citationIDs: ["specialty_labs_round32"])
        ],
        citations: [openrnLabsR32, specialtyLabsR32],
        lastSourceFidelityReview: "2026-05-13"
    )
}
