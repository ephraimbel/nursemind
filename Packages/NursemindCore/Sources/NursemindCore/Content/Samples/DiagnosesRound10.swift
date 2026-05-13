import Foundation

// Curator-model diagnosis entries (round 10 expansion — toxidromes, STIs, environmental).
// Sources: Open RN Health Alterations + Mental Health (CC BY 4.0), OpenStax (CC BY 4.0 with AI restriction),
// CDC STI + poisoning + environmental guidance (public domain), AAPCC / WMS / IDSA concept citations.

private let openrnMSr10 = CitationSource(
    id: "openrn_ms_round10",
    shortName: "Open RN Health Alterations / Mental Health",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=toxidrome+STI+heat+hypothermia",
    lastRetrieved: "2026-05-04"
)
private let openstaxR10 = CitationSource(
    id: "openstax_round10",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let cdcDxR10 = CitationSource(
    id: "cdc_dx_round10",
    shortName: "CDC STI Treatment Guidelines + heat / cold guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/std/treatment-guidelines/",
    lastRetrieved: "2026-05-04"
)
private let specialtyDxR10 = CitationSource(
    id: "specialty_dx_round10",
    shortName: "AAPCC / IDSA / WMS guidelines (concept citation)",
    publisher: "AAPCC · IDSA · Wilderness Medical Society",
    license: .factCitationOnly,
    url: "https://aapcc.org/clinical-guidelines",
    lastRetrieved: "2026-05-04"
)

private let toxR10 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)
private let infectionDxR10 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection)
private let envR10 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .fluidElectrolytes)

// MARK: - Anticholinergic Toxicity

public enum AnticholinergicToxSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "anticholinergic-toxicity",
        title: "Anticholinergic toxicity",
        subtitle: "\"Hot, dry, blind, mad\" · TCAs / antihistamines / atropine / Jimson weed",
        nclexTags: toxR10,
        definition: AttributedProse(
            "Toxidrome from blockade of muscarinic acetylcholine receptors. Common causes: TCAs, first-generation antihistamines (diphenhydramine, doxylamine), atropine, scopolamine, oxybutynin, antipsychotics, jimson weed, deadly nightshade, and many over-the-counter sleep aids per primary source.",
            citationIDs: ["openrn_ms_round10", "specialty_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "Muscarinic blockade → reduced parasympathetic activity → mydriasis, anhidrosis, urinary retention, ileus, tachycardia, AMS, hyperthermia.",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("\"HOT as a hare\" — hyperthermia (failed sweating).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("\"DRY as a bone\" — anhidrosis, dry mucous membranes.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("\"BLIND as a bat\" — mydriasis with poor pupillary response, blurred vision.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("\"MAD as a hatter\" — agitation, delirium, hallucinations, picking at clothes.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("\"RED as a beet\" — flushed skin.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("\"FULL as a flask\" — urinary retention.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Tachycardia (often the most consistent vital-sign abnormality), decreased bowel sounds.", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — toxidrome + history of exposure.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("ECG — sinus tachycardia; in TCA overdose look for QRS widening + R-wave in aVR (TCA toxicity).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("CK if rhabdomyolysis suspected; UDS, acetaminophen + salicylate (commonly co-ingested).", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("ABCs; vital signs (especially temperature); telemetry; mental status.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Bladder distension; bowel sounds.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Substance / medication history; co-ingestants common.", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("Supportive — IV fluids, telemetry, BENZODIAZEPINES for agitation (NOT antipsychotics — anticholinergic worsens) per primary source.", citationIDs: ["specialty_dx_round10"]),
            AttributedBullet("Active cooling for hyperthermia.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Foley if urinary retention.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("PHYSOSTIGMINE — antidote for severe anticholinergic toxicity (refractory delirium, severe agitation, seizures); CONTRAINDICATED in TCA overdose (precipitates asystole / seizure) per primary source.", citationIDs: ["specialty_dx_round10"]),
            AttributedBullet("Sodium bicarbonate IV for TCA-overdose QRS prolongation (>100 ms) per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Activated charcoal within 1–2 hours if alert and able to protect airway per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Coordinate poison control consultation.", citationIDs: ["openrn_ms_round10"])
        ],
        watchFor: [
            AttributedBullet("TCA overdose — wide QRS, ventricular dysrhythmia, hypotension, seizures; sodium bicarbonate; AVOID physostigmine.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Severe hyperthermia → rhabdomyolysis, AKI, multiorgan failure.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Older adults — anticholinergic OTC sleep aids and bladder agents are common contributors to delirium / falls; Beers list.", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, specialtyDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cholinergic / Organophosphate Toxicity

public enum CholinergicToxSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cholinergic-toxicity",
        title: "Cholinergic / organophosphate toxicity",
        subtitle: "SLUDGE-BBB · DUMBELS · atropine + pralidoxime + decontamination",
        nclexTags: toxR10,
        definition: AttributedProse(
            "Toxidrome from acetylcholinesterase inhibition (organophosphate insecticides, carbamates, nerve agents like sarin, certain medications such as donepezil overdose, mushrooms). Excess acetylcholine at muscarinic, nicotinic, and CNS receptors per primary source.",
            citationIDs: ["openrn_ms_round10", "specialty_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "Acetylcholinesterase inhibition → accumulation of acetylcholine at synapses → cholinergic crisis. Organophosphates form increasingly irreversible bonds (\"aging\") — pralidoxime efficacy decreases over hours.",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("MUSCARINIC — \"SLUDGE-BBB\": Salivation, Lacrimation, Urination, Defecation, GI cramping, Emesis, Bronchorrhea, Bronchospasm, Bradycardia.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Or \"DUMBELS\": Defecation, Urination, Miosis, Bradycardia / Bronchorrhea / Bronchospasm, Emesis, Lacrimation, Salivation.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("NICOTINIC — fasciculations, weakness, eventually flaccid paralysis (\"DAYS OF THE WEEK\": Mydriasis, Tachycardia, Weakness, Hypertension, Fasciculations).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("CNS — confusion, coma, seizures.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Garlic / petroleum-like odor on breath / clothing in some organophosphates.", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — toxidrome + exposure history.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("RBC / plasma cholinesterase activity if available — confirms.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("ECG, electrolytes, ABG, UDS.", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("DECONTAMINATION first — remove clothing, wash skin; HCP wear PPE; secondary exposure is real per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Airway management — bronchorrhea, bronchospasm, weakness can require intubation; AVOID succinylcholine (ineffective due to AChE inhibition; prolonged paralysis).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Continuous monitoring; bedside seizure precautions.", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("DECONTAMINATION first — protects patient and staff.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("ATROPINE — high doses (start 1–3 mg IV, doubling every 5 minutes until DRYING of pulmonary secretions) per primary source.", citationIDs: ["specialty_dx_round10"]),
            AttributedBullet("PRALIDOXIME (2-PAM) — reactivates AChE before aging; loading 1–2 g IV over 30 min then continuous infusion.", citationIDs: ["specialty_dx_round10"]),
            AttributedBullet("BENZODIAZEPINES for seizures.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Supportive — intubation, ventilation, IV fluids, ICU.", citationIDs: ["openrn_ms_round10"])
        ],
        watchFor: [
            AttributedBullet("Intermediate syndrome — neuromuscular weakness 1–4 days after acute crisis; ventilator support required.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Delayed peripheral neuropathy 1–3 weeks later.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Mass casualty — coordinate with hazmat, public health, poison control.", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, specialtyDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sympathomimetic Toxicity

public enum SympathomimeticToxSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "sympathomimetic-toxicity",
        title: "Sympathomimetic toxicity",
        subtitle: "Cocaine / methamphetamine / MDMA · hyperadrenergic · benzos + cooling",
        nclexTags: toxR10,
        definition: AttributedProse(
            "Toxidrome from excess adrenergic activity from cocaine, amphetamines (including methamphetamine, MDMA, prescription stimulants), bath salts (synthetic cathinones), pseudoephedrine, decongestants, or theophylline / caffeine in massive overdose per primary source.",
            citationIDs: ["openrn_ms_round10", "specialty_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "Excess catecholamine release / reuptake blockade → α and β stimulation → hyperthermia, vasoconstriction, tachycardia, HTN, agitation. Cocaine specifically causes coronary vasospasm and Na-channel blockade.",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("Hyperthermia, hypertension, tachycardia (vs anticholinergic — both have hyperthermia and tachycardia, but sympathomimetic has DIAPHORESIS + hypertension + retained pupillary response, vs anticholinergic dry skin + variable BP + poor pupillary response).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Agitation, paranoia, hallucinations, psychosis.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Mydriasis with PRESERVED pupillary response.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Diaphoresis (vs anticholinergic anhidrosis).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Chest pain — ACS in young patients; aortic dissection, SAH from severe HTN.", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical + UDS (cocaine, amphetamines).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("ECG, troponin (rule out MI in cocaine chest pain), CK (rhabdomyolysis), creatinine, electrolytes.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("CT head if AMS / focal deficit (rule out ICH).", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs (especially temperature); cardiac monitor; mental status.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Hydration, urine output (rhabdomyolysis), electrolytes.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Substance history; co-ingestants; method (insufflated, IV, ingested) — affects duration.", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("BENZODIAZEPINES — first-line for agitation, HTN, tachycardia, seizures (large doses often needed) per primary source.", citationIDs: ["specialty_dx_round10"]),
            AttributedBullet("Active cooling for hyperthermia.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("IV fluids for rhabdomyolysis prevention.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("AVOID PURE β-BLOCKERS in acute cocaine intoxication — unopposed α-adrenergic effect can WORSEN HTN and coronary vasospasm; use combined α/β-blocker (labetalol) or vasodilator (nicardipine, nitroglycerin) per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Cocaine-associated MI — ASA, nitroglycerin, benzos, phentolamine; AVOID β-blockers.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Antipsychotics relatively contraindicated for sedation — lower seizure threshold and impair heat dissipation.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Coordinate poison control.", citationIDs: ["openrn_ms_round10"])
        ],
        watchFor: [
            AttributedBullet("ACUTE MI / AORTIC DISSECTION / ICH from severe HTN — chest pain workup; CT head for neuro deficit.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Severe hyperthermia → rhabdomyolysis, DIC, multiorgan failure; aggressive cooling + benzos.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Stimulant psychosis — may persist after acute intoxication.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Withdrawal CRASH — depression, hypersomnia, increased appetite; suicide risk; supportive.", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, specialtyDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Serotonin Syndrome

public enum SerotoninSyndromeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "serotonin-syndrome",
        title: "Serotonin syndrome",
        subtitle: "SSRI/SNRI/MAOI/triptan/linezolid · clonus + AMS + autonomic instability",
        nclexTags: toxR10,
        definition: AttributedProse(
            "Drug-induced syndrome of serotonergic excess. Most often from combinations of serotonergic agents (SSRIs / SNRIs + MAOI, linezolid, methylene blue, tramadol, fentanyl, triptans, tryptophan, MDMA, dextromethorphan, St. John's wort) per primary source.",
            citationIDs: ["openrn_ms_round10", "specialty_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "Excess serotonin at central + peripheral 5-HT receptors → triad of mental-status changes, neuromuscular hyperactivity (clonus, hyperreflexia), and autonomic hyperactivity. Onset typically within 24 hours of new agent or dose change.",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("Mental status — agitation, delirium, restlessness, anxiety.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Neuromuscular — CLONUS (especially lower-extremity inducible / spontaneous), HYPERREFLEXIA (lower > upper), tremor, rigidity.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Autonomic — diaphoresis, hyperthermia, tachycardia, HTN, mydriasis, diarrhea.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Severe — temperature >41°C, severe muscle rigidity, multi-organ failure.", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Hunter Serotonin Toxicity Criteria — recent serotonergic agent + ANY of: spontaneous clonus; inducible clonus + (agitation OR diaphoresis); ocular clonus + (agitation OR diaphoresis); tremor + hyperreflexia; hypertonia + temperature >38°C + (ocular OR inducible clonus) per primary source.", citationIDs: ["specialty_dx_round10"]),
            AttributedBullet("Distinguish from NMS — serotonin syndrome onset is FAST (hours), reflexes HYPER, dilated pupils; NMS is SLOW (days), reflexes NORMAL or DECREASED, lead-pipe rigidity.", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs (temperature critical); telemetry; neuro exam (clonus / reflexes).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Medication reconciliation — recent additions / dose increases of serotonergic agents.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Rhabdomyolysis screen (CK, urine myoglobin); renal function.", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("STOP all serotonergic agents.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Supportive — IV fluids, active cooling, telemetry.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("BENZODIAZEPINES for agitation, neuromuscular hyperactivity, autonomic instability per primary source.", citationIDs: ["specialty_dx_round10"]),
            AttributedBullet("CYPROHEPTADINE PO/NG for moderate-severe cases (12 mg loading then 2 mg q2h or 8 mg q6h) per primary source.", citationIDs: ["specialty_dx_round10"]),
            AttributedBullet("INTUBATION + non-depolarizing neuromuscular blockade for severe rigidity / hyperthermia (>41°C) — DO NOT use succinylcholine if rhabdo per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("AVOID antipsychotics (lower seizure threshold, impair heat dissipation, may worsen).", citationIDs: ["openrn_ms_round10"])
        ],
        watchFor: [
            AttributedBullet("HYPERTHERMIA >41°C → severe rhabdomyolysis, DIC, multi-organ failure; PARALYZE + intubate per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("AKI from rhabdomyolysis; IV fluids; consider bicarbonate.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Resolution typically within 24–72 hours after offending agent stopped.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Resume serotonergic agents only with careful selection and gap; counsel about combinations.", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, specialtyDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Neuroleptic Malignant Syndrome

public enum NMSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "nms",
        title: "Neuroleptic malignant syndrome (NMS)",
        subtitle: "Antipsychotic adverse · LEAD-PIPE rigidity · slow onset · stop neuroleptic + supportive",
        nclexTags: toxR10,
        definition: AttributedProse(
            "Life-threatening idiosyncratic reaction to dopamine antagonists (antipsychotics, metoclopramide, prochlorperazine) or rapid withdrawal of dopamine agonists (Parkinson's medications). Tetrad of mental-status change, lead-pipe muscle rigidity, hyperthermia, autonomic instability per primary source.",
            citationIDs: ["openrn_ms_round10", "specialty_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "D2 receptor blockade in striatum and hypothalamus → hyperthermia, rigidity, autonomic dysregulation. Onset typically days-weeks after starting / increasing antipsychotic.",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("Hyperthermia (often >40°C).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("LEAD-PIPE rigidity (uniform increased tone), bradyreflexia (vs serotonin syndrome — hyperreflexia / clonus).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Altered mental status — agitation, confusion, stupor, coma.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Autonomic instability — diaphoresis, labile BP, tachycardia, tachypnea.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Onset over 1–3 days (vs serotonin syndrome over hours).", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — recent antipsychotic + tetrad; CK markedly elevated (often >10,000), leukocytosis, transaminitis.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Distinguish from serotonin syndrome (timing, reflexes, pupils) and malignant hyperthermia (anesthesia trigger).", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs (especially temperature); neuro exam (rigidity); CK, renal function, electrolytes, ABG.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Medication review — antipsychotics, antiemetics (metoclopramide, prochlorperazine), Parkinson's withdrawal.", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("STOP offending agent (or restart Parkinson's medications if NMS-like syndrome from withdrawal) per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("ICU-level supportive care — aggressive cooling, IV fluids, ventilation.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("BENZODIAZEPINES for agitation; consider DANTROLENE for severe rigidity / hyperthermia (same agent as MH); BROMOCRIPTINE or AMANTADINE (dopamine agonist) for severe cases per primary source.", citationIDs: ["specialty_dx_round10"]),
            AttributedBullet("Treat rhabdomyolysis — IV fluids, monitor renal function, consider bicarbonate.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Mortality reduced significantly with prompt recognition and supportive care.", citationIDs: ["openrn_ms_round10"])
        ],
        watchFor: [
            AttributedBullet("RHABDOMYOLYSIS / AKI — most common complication; aggressive fluids.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Aspiration pneumonia, DVT / PE.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("After resolution, restart antipsychotic only with caution — wait ≥2 weeks, lower potency / dose, slow titration; recurrence risk per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Consider clozapine for high-risk patients needing antipsychotic post-NMS (lower D2 affinity).", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, specialtyDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Syphilis

public enum SyphilisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "syphilis",
        title: "Syphilis",
        subtitle: "Treponema pallidum · staged disease · penicillin first-line",
        nclexTags: infectionDxR10,
        definition: AttributedProse(
            "Sexually transmitted infection caused by the spirochete Treponema pallidum. Stages: primary (chancre), secondary (rash, mucosal lesions, condyloma lata), latent (asymptomatic but seropositive), tertiary (gummas, cardiovascular, neurosyphilis). Congenital transmission to fetus per primary source.",
            citationIDs: ["openrn_ms_round10", "cdc_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "T. pallidum invades through mucous membranes / abrasions → systemic dissemination. Untreated, evolves through stages over years. Congenital syphilis from maternal transmission can cause fetal demise, severe newborn disease.",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("Primary (3 weeks) — painless chancre at site of inoculation; regional lymphadenopathy.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Secondary (6 weeks–6 months) — diffuse rash (palms / soles characteristic), mucous patches, condyloma lata, fever, lymphadenopathy, hepatitis.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Latent — asymptomatic, seropositive (early <1 yr; late >1 yr).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Tertiary (years later) — gummas, cardiovascular syphilis (aortitis), neurosyphilis (tabes dorsalis, general paresis, Argyll Robertson pupil).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Congenital — early (hepatosplenomegaly, rash, snuffles, bone changes); late (Hutchinson teeth, mulberry molars, saddle nose).", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Non-treponemal screen (RPR or VDRL) — quantitative; titer falls with treatment; can be falsely positive in autoimmune disease, pregnancy, IDU.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Treponemal confirmatory (FTA-ABS, TP-PA) — remains positive lifelong.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Reverse-sequence algorithm — treponemal first, then RPR if positive (used by many labs).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Lumbar puncture for suspected neurosyphilis (CSF VDRL).", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("Skin / genital exam; lymph nodes; neurologic exam; cardiac exam.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Sexual / partner history; testing of partners; STI co-infection screen (HIV, gonorrhea, chlamydia, hepatitis B/C).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Pregnancy — universal syphilis screening at first prenatal visit per CDC; rescreen high-risk in 3rd trimester per primary source.", citationIDs: ["cdc_dx_round10"])
        ],
        commonInterventions: [
            AttributedBullet("PRIMARY / SECONDARY / EARLY LATENT — Benzathine penicillin G 2.4 million units IM single dose per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("LATE LATENT / TERTIARY — Benzathine penicillin G 2.4 million units IM weekly × 3 weeks per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("NEUROSYPHILIS — Aqueous crystalline penicillin G 18–24 million units/day IV continuous OR 3–4 million units IV every 4 hours × 10–14 days per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("PCN-allergic non-pregnant — doxycycline 100 mg PO BID × 14 days (early) or 28 days (late).", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("PCN-allergic PREGNANT — DESENSITIZE and use penicillin (no acceptable alternative for fetal protection) per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Partner notification + treatment per state law; reportable disease.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Re-test serology at 6 and 12 months — 4-fold drop in titer = adequate response per primary source.", citationIDs: ["cdc_dx_round10"])
        ],
        watchFor: [
            AttributedBullet("JARISCH-HERXHEIMER reaction — fever, chills, myalgia, hypotension within 24 hr of treatment from spirochete lysis; supportive care; counsel patient pre-treatment.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Congenital syphilis — emergent IV penicillin G; pediatric infectious-disease consult.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Reportable to public health; partner services per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("HIV co-infection common — test all syphilis patients for HIV and offer PrEP.", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, cdcDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Gonorrhea

public enum GonorrheaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "gonorrhea",
        title: "Gonorrhea",
        subtitle: "Neisseria gonorrhoeae · IM ceftriaxone · resistance trend",
        nclexTags: infectionDxR10,
        definition: AttributedProse(
            "STI caused by Neisseria gonorrhoeae. Common manifestations: urethritis (M), cervicitis (F), pharyngitis, proctitis, conjunctivitis, disseminated gonococcal infection (skin / joint / sepsis). Pregnancy → ophthalmia neonatorum per primary source.",
            citationIDs: ["openrn_ms_round10", "cdc_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "Gram-negative diplococcus that adheres to mucosal epithelium. Resistance has progressively eliminated penicillins, fluoroquinolones, and reduced cephalosporin susceptibility — ceftriaxone IM remains first-line.",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("Male — purulent urethral discharge, dysuria; epididymitis; often symptomatic.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Female — often ASYMPTOMATIC or mild cervicitis (mucopurulent discharge, intermenstrual bleeding); PID complications.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Pharyngitis, proctitis (proctitis can be severe in MSM).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Disseminated gonococcal infection (DGI) — fever, polyarthralgia, pustular skin lesions, septic arthritis, tenosynovitis.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Conjunctivitis — purulent; in newborns, sight-threatening ophthalmia neonatorum.", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("NAAT (nucleic acid amplification test) — sensitive + specific; urine, vaginal swab, urethral swab, rectal, pharyngeal per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Culture — when antibiotic susceptibility is needed (treatment failure, suspected resistance).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Co-test for chlamydia (high co-infection rate).", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("Genital / pelvic exam; assess for PID in female; testicular exam in male.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Pharyngeal / rectal examination + testing per exposure history.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Pregnancy testing in reproductive-age females; HIV / syphilis / hepatitis screening.", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("CEFTRIAXONE 500 mg IM single dose (1 g if ≥150 kg) per CDC 2021 update — INCREASED from prior 250 mg per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("If chlamydia not excluded — add doxycycline 100 mg PO BID × 7 days per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("PCN / cephalosporin allergic — gentamicin 240 mg IM + azithromycin 2 g PO single dose per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("DGI — IV ceftriaxone 1 g daily × 7+ days per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Test of cure — pharyngeal infection only (re-test 7–14 days); not routinely needed for genital/rectal per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Partner treatment — expedited partner therapy where legal; reportable disease.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Newborn — single-dose ceftriaxone IM/IV for prophylaxis if maternal infection; treatment of confirmed disease per primary source.", citationIDs: ["cdc_dx_round10"])
        ],
        watchFor: [
            AttributedBullet("DISSEMINATED GONOCOCCAL INFECTION (DGI) — fever, polyarthralgia, skin pustules; admit and treat IV; rule out endocarditis / meningitis (rare).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("PELVIC INFLAMMATORY DISEASE — fever, abdominal pain, cervical motion tenderness; complications include tubal infertility, ectopic pregnancy.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Reinfection — counsel about safe sex, partner treatment, condom use, PrEP for HIV per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Resistance — emerging cephalosporin resistance; coordinate with public health if treatment failure suspected.", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, cdcDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Chlamydia

public enum ChlamydiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "chlamydia",
        title: "Chlamydia trachomatis infection",
        subtitle: "Most common reportable STI · doxycycline first-line · screen sexually active <25 F",
        nclexTags: infectionDxR10,
        definition: AttributedProse(
            "Most common reportable STI in the U.S. Caused by C. trachomatis serovars D-K (genital), L1-L3 (LGV), A-C (trachoma — eye). Often asymptomatic, especially in females; complications include PID and tubal infertility per primary source.",
            citationIDs: ["openrn_ms_round10", "cdc_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "Obligate intracellular bacterium. Asymptomatic in ~70% of infected females and 50% of males. Untreated genital infection ascends → endometritis, salpingitis, PID, tubal scarring.",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("Often asymptomatic; mucopurulent cervicitis / urethritis when symptomatic.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Female — vaginal discharge, intermenstrual or postcoital bleeding, dysuria.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Male — urethral discharge (less purulent than gonorrhea), dysuria; epididymitis.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Proctitis (rectal exposure); pharyngitis (less commonly symptomatic).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Reactive arthritis (Reiter syndrome) — classic triad of arthritis, urethritis, conjunctivitis.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("LGV (L1-L3) — initial painless ulcer + later inguinal lymphadenopathy / proctitis (more common in MSM).", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("NAAT — gold standard; vaginal swab, urethral swab, urine first-catch, rectal, pharyngeal per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Annual screening for sexually active women <25 (or older with risk factors), pregnant women per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Co-test for gonorrhea, screen HIV / syphilis.", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("Sexual history; pregnancy status.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("PID symptoms — fever, cervical motion tenderness, adnexal tenderness; severe → admit.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Pelvic exam, NAAT collection.", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("DOXYCYCLINE 100 mg PO BID × 7 days — FIRST-LINE per CDC 2021 (replaces single-dose azithromycin) per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Pregnancy — azithromycin 1 g PO single dose (doxycycline contraindicated) per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("LGV — doxycycline 100 mg PO BID × 21 days per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Test of cure not routinely needed (except pregnancy 4 weeks after treatment); RE-TEST in 3 months for reinfection per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Partner treatment — expedited partner therapy where legal; reportable disease.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Counsel safer sex, condoms, PrEP if eligible per primary source.", citationIDs: ["openrn_ms_round10"])
        ],
        watchFor: [
            AttributedBullet("PID and tubal infertility — most common complications; treat promptly.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Reinfection within months is common; rescreen at 3 months.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Ophthalmia neonatorum — neonatal conjunctivitis from maternal infection; erythromycin ophthalmic per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Newborn pneumonia — from maternal infection; respiratory symptoms 1–3 months of life.", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, cdcDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Genital Herpes

public enum GenitalHerpesSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "genital-herpes",
        title: "Genital herpes (HSV-1 / HSV-2)",
        subtitle: "Recurrent vesicular lesions · suppressive antiviral · neonatal risk",
        nclexTags: infectionDxR10,
        definition: AttributedProse(
            "Lifelong sexually transmitted infection caused by herpes simplex virus type 1 or 2. Characterized by primary outbreak followed by recurrences. HSV-2 traditionally genital, HSV-1 oral / genital (proportion of genital cases caused by HSV-1 has risen) per primary source.",
            citationIDs: ["openrn_ms_round10", "cdc_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "Infection of mucocutaneous surfaces → latency in sensory ganglia → reactivation precipitated by stress, illness, immunosuppression, hormonal changes.",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("Primary outbreak — clusters of painful vesicles → ulcers; tender lymphadenopathy; constitutional symptoms (fever, malaise); can take 2–3 weeks to heal.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Recurrent outbreaks — typically less severe and shorter; prodrome (tingling, burning) precedes lesions.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Asymptomatic shedding — common; transmits even between outbreaks.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Atypical — fissures, erythema, urinary retention from sacral neuropathy.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Severe / disseminated in immunocompromised; herpetic whitlow on fingers; herpes gladiatorum in athletes.", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("PCR of vesicle / ulcer swab — most sensitive; identifies HSV-1 vs HSV-2 per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Type-specific serology (IgG) for assessment of risk in established relationships and prior exposure assessment.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Tzanck smear — historic; less used now.", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("Skin / genital exam; assess severity and number of lesions.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Pregnancy status — first-time outbreak in 3rd trimester is high-risk for neonatal transmission.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Co-screen for HIV / syphilis / other STIs; mental-health support.", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("PRIMARY OUTBREAK — acyclovir 400 mg PO TID × 7–10 days, OR valacyclovir 1 g PO BID × 7–10 days, OR famciclovir 250 mg PO TID × 7–10 days per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("EPISODIC RECURRENCE — initiate within 24 hours of prodrome; valacyclovir 500 mg PO BID × 3 days OR 1 g daily × 5 days per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("DAILY SUPPRESSIVE — valacyclovir 500 mg PO daily (1 g if ≥10 outbreaks/year) — REDUCES outbreaks AND transmission to partners by ~50% per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Pregnancy — suppressive valacyclovir 500 mg BID from 36 weeks until delivery in patients with recurrent genital herpes (reduces shedding and need for cesarean) per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Cesarean delivery if active genital lesions or prodrome at labor.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Symptomatic — sitz baths, oral analgesics, topical lidocaine; counsel about sexual transmission and partner testing.", citationIDs: ["openrn_ms_round10"])
        ],
        watchFor: [
            AttributedBullet("NEONATAL HSV — devastating (encephalitis, disseminated disease); IV acyclovir 60 mg/kg/day × 14–21 days; primary maternal infection at delivery is highest risk per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("HERPES ENCEPHALITIS — fever, AMS, focal neuro deficit; CSF PCR; IV acyclovir; mortality without treatment.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Disseminated HSV in immunocompromised — IV acyclovir; isolation per facility.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Mental-health impact — disclosure stress; counsel and refer.", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, cdcDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - PID

public enum PIDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pid",
        title: "Pelvic inflammatory disease (PID)",
        subtitle: "Ascending genital infection · ceftriaxone + doxycycline + metronidazole",
        nclexTags: infectionDxR10,
        definition: AttributedProse(
            "Polymicrobial infection of the upper female genital tract — endometritis, salpingitis, tubo-ovarian abscess, peritonitis. Most often from ascending Neisseria gonorrhoeae or Chlamydia trachomatis with anaerobic and other vaginal flora overgrowth per primary source.",
            citationIDs: ["openrn_ms_round10", "cdc_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "Lower-tract STI ascends through cervix → endometrium → fallopian tubes → peritoneum. Inflammation can lead to tubal scarring → infertility, ectopic pregnancy, chronic pelvic pain.",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("Pelvic / lower abdominal pain (often bilateral, dull or crampy).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Cervical motion tenderness, adnexal tenderness, uterine tenderness on bimanual.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Fever, abnormal vaginal discharge, intermenstrual bleeding, dyspareunia, dysuria.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Severe — RUQ pain (Fitz-Hugh-Curtis perihepatitis), tubo-ovarian abscess (palpable adnexal mass).", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Empirical CDC criteria — sexually active female + uterine, adnexal, or cervical motion tenderness without other apparent cause; supportive findings include fever, mucopurulent discharge, elevated WBC / ESR / CRP, positive STI test per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Pelvic US — adnexal complex mass / hydrosalpinx, tubo-ovarian abscess.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("NAAT for gonorrhea, chlamydia; HIV / syphilis screen; pregnancy test.", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs (sepsis screen); pelvic exam; pregnancy status.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("STI history, IUD presence, recent pelvic instrumentation.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Severity — outpatient vs inpatient; tubo-ovarian abscess requires admission.", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("OUTPATIENT — ceftriaxone 500 mg IM single dose + doxycycline 100 mg PO BID × 14 days + metronidazole 500 mg PO BID × 14 days per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("INPATIENT — IV ceftriaxone (or cefotetan / cefoxitin) + doxycycline + metronidazole; transition to oral after improvement; total 14 days per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Tubo-ovarian abscess — IV antibiotics + drainage / surgery per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Partner treatment within last 60 days (or most recent if longer); reportable disease.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("IUD — generally CAN remain; reassess at 48–72 hr; remove if no improvement per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Reassess in 72 hours; counsel safe sex, condom use, follow-up testing.", citationIDs: ["openrn_ms_round10"])
        ],
        watchFor: [
            AttributedBullet("TUBO-OVARIAN ABSCESS — admit, IV antibiotics, image-guided drainage; emergent surgery for rupture or hemodynamic instability.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("ECTOPIC PREGNANCY — must be excluded in any reproductive-age female with pelvic pain.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("CHRONIC sequelae — infertility, ectopic risk, chronic pelvic pain.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Fitz-Hugh-Curtis (perihepatitis) — RUQ pain mimics cholecystitis; usually responds to PID treatment.", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, cdcDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Latent TB Infection (LTBI)

public enum LTBISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ltbi",
        title: "Latent TB infection (LTBI)",
        subtitle: "Asymptomatic + positive screen · treat to prevent reactivation",
        nclexTags: infectionDxR10,
        definition: AttributedProse(
            "Asymptomatic infection with Mycobacterium tuberculosis demonstrated by positive screen (TST or IGRA) without active disease. ~5–10% lifetime risk of reactivation; treatment dramatically reduces that risk per primary source.",
            citationIDs: ["openrn_ms_round10", "cdc_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "Inhalation of M. tuberculosis → containment by host immune system → bacilli persist within granulomas. Reactivation occurs when immunity wanes (HIV, advanced age, malnutrition, immunosuppression, diabetes).",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("ASYMPTOMATIC — by definition; no active TB symptoms.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Identified through screening — TST induration ≥5 / 10 / 15 mm depending on risk category, OR IGRA positive.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Normal CXR (no active disease).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Negative sputum / symptoms screen.", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("TST (Mantoux) — read 48–72 hours; induration thresholds: ≥5 mm in HIV/immunocompromised/recent contact/CXR fibrotic, ≥10 mm in higher-risk groups (incarcerated, healthcare worker, immigrant from high-prevalence country, child <5, IDU), ≥15 mm in low-risk per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("IGRA (interferon-gamma release assay — QuantiFERON, T-SPOT) — preferred in BCG-vaccinated, when single visit needed.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Rule out ACTIVE TB before treating LTBI — symptom screen + CXR mandatory per primary source.", citationIDs: ["cdc_dx_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("CXR; symptom screen (cough >3 weeks, fever, night sweats, weight loss, hemoptysis).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("HIV testing (universal in LTBI per primary source).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Hepatitis B / C, alcohol use, baseline LFTs (depending on regimen).", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("Preferred regimens (CDC 2020 update — short-course preferred over 9-month INH where feasible) per primary source:", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("3HP — once-weekly INH (15 mg/kg max 900) + rifapentine × 12 weeks (DOT or self-administered) per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("4R — rifampin daily × 4 months per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("3HR — INH + rifampin daily × 3 months per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Alternative — INH daily × 6–9 months (longer regimen — less preferred but may be needed if rifamycin contraindicated).", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Pyridoxine 25–50 mg daily co-administered with INH-containing regimens (prevent peripheral neuropathy) per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Baseline + monthly LFTs; counsel on hepatotoxicity warning signs and alcohol avoidance.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Coordinate with public health; not airborne-isolation as latent ≠ contagious.", citationIDs: ["openrn_ms_round10"])
        ],
        watchFor: [
            AttributedBullet("HEPATOTOXICITY (any regimen with rifamycin or INH) — counsel on jaundice, fatigue, abdominal pain; STOP and notify per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Reactivation to active TB — fever, cough, night sweats, weight loss, hemoptysis; sputum AFB; isolation if active.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Drug interactions with rifamycin — significantly REDUCES levels of OCPs, anticoagulants, antiretrovirals; counsel on contraception and reconcile.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Counsel that TB is reportable; coordinate with public health; partner contacts may need screening per primary source.", citationIDs: ["cdc_dx_round10"])
        ],
        citations: [openrnMSr10, cdcDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Heat Stroke

public enum HeatStrokeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "heat-stroke",
        title: "Heat stroke",
        subtitle: "Core temp >40°C + CNS dysfunction · COOL FIRST · classic vs exertional",
        nclexTags: envR10,
        definition: AttributedProse(
            "Severe hyperthermia (core body temperature typically >40°C / 104°F) with central-nervous-system dysfunction. Two forms: classic (elderly, sedentary, hot weather) and exertional (athletes, soldiers, laborers in heat) per primary source.",
            citationIDs: ["openrn_ms_round10", "specialty_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "Failure of thermoregulation → systemic inflammation, cytokine release, endothelial damage, multi-organ dysfunction (rhabdomyolysis, AKI, ARDS, DIC, hepatic failure, cerebral injury).",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("Core temperature >40°C / 104°F (rectal or esophageal — most accurate).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("CNS dysfunction — confusion, ataxia, seizure, coma (key feature distinguishing from heat exhaustion).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Tachycardia, tachypnea, hypotension; classic — hot dry skin (anhidrosis); exertional — often diaphoretic.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Rhabdomyolysis (especially exertional) — dark urine, muscle pain.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("End-organ — AKI, hepatic failure, DIC, ARDS, MI.", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — hyperthermia + CNS dysfunction + appropriate setting.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Labs — CBC, BMP, LFTs, CK, INR, lactate, ABG, urine myoglobin.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Differential — sepsis, thyroid storm, anticholinergic / sympathomimetic / serotonin / NMS / malignant hyperthermia.", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous core temperature monitoring (rectal probe).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("ABCs; hemodynamic / cardiac monitor.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Renal / hepatic / coagulation function.", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("COOL FIRST, transport second — every minute of hyperthermia worsens injury.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("EXERTIONAL — COLD WATER IMMERSION (ice bath) is most effective; cool to 38.9°C / 102°F, then stop to avoid overshoot per primary source.", citationIDs: ["specialty_dx_round10"]),
            AttributedBullet("CLASSIC (elderly) — evaporative cooling (mist + fan) preferred (cold water poorly tolerated); ice packs to groin / axilla / neck.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Stop active cooling at ~38.6–39°C to prevent overshoot hypothermia.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("IV fluids per provider; benzodiazepines for shivering (which generates heat).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("ICU monitoring — anticipate AKI, rhabdo, DIC, hepatic failure.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Antipyretics (acetaminophen, NSAIDs) NOT effective in heat stroke (no hypothalamic set-point shift like fever) per primary source.", citationIDs: ["openrn_ms_round10"])
        ],
        watchFor: [
            AttributedBullet("MULTI-ORGAN FAILURE within hours — AKI, DIC, ARDS, hepatic; ICU support.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Long-term neurologic deficits possible from prolonged hyperthermia.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Prevention — hydration, acclimatization, work-rest cycles in heat, recognition of risk factors (medications, chronic disease, age extremes); counsel community per primary source.", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, specialtyDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hypothermia

public enum HypothermiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hypothermia",
        title: "Hypothermia",
        subtitle: "Core temp <35°C · staged severity · gradual rewarming",
        nclexTags: envR10,
        definition: AttributedProse(
            "Core body temperature <35°C / 95°F. Severity: mild (32–35°C / 90–95°F), moderate (28–32°C), severe (<28°C). Risk factors include exposure, intoxication, age extremes, hypothyroidism, sepsis, immersion per primary source.",
            citationIDs: ["openrn_ms_round10", "specialty_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "Cold exposure overcomes thermoregulation → metabolic slowdown, cardiac depression, coagulopathy, AMS. \"Afterdrop\" can occur during rewarming as cold peripheral blood returns to core.",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("Mild (32–35°C) — shivering, tachycardia, tachypnea, vasoconstriction, mild AMS.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Moderate (28–32°C) — shivering STOPS, bradycardia, J-wave (Osborn) on ECG, decreased LOC, paradoxical undressing.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Severe (<28°C) — coma, ventricular dysrhythmia / asystole, fixed dilated pupils, may appear dead but resuscitable.", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Core temperature — esophageal probe or low-reading rectal thermometer; many standard thermometers do not read below 34°C.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("ECG — J-wave (Osborn), bradycardia, AFib, dysrhythmias.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Labs — glucose (often low), lactate, ABG, electrolytes, coags, CK.", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("Core temperature; cardiac rhythm; glucose; circulation.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Trauma assessment if relevant; co-ingestants (alcohol common).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("\"NOT DEAD UNTIL WARM AND DEAD\" — continue resuscitation while rewarming.", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("Remove from cold environment; remove wet clothing; gentle handling (rough handling can precipitate VFib).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Mild — passive rewarming (blankets, warm room, warm fluids PO if alert).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Moderate — active external rewarming (warm air blanket / Bair Hugger) + warm IV fluids (40–42°C).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Severe — active CORE rewarming — warm IV fluids, warmed humidified air, warm peritoneal / bladder / pleural lavage; ECMO is most effective for arrest per primary source.", citationIDs: ["specialty_dx_round10"]),
            AttributedBullet("Defibrillate VFib at 200 J — if no response after 1 shock, continue CPR and rewarm to >30°C before further attempts.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("AVOID antiarrhythmics during severe hypothermia (ineffective at low temperatures).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Treat hypoglycemia, electrolyte imbalances, underlying cause.", citationIDs: ["openrn_ms_round10"])
        ],
        watchFor: [
            AttributedBullet("AFTERDROP — paradoxical drop in core temperature during rewarming as cold peripheral blood returns; expect and continue rewarming.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("VENTRICULAR FIBRILLATION at <30°C — handle gently; resuscitation may be prolonged.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Dramatic recovery possible even after prolonged hypothermic arrest (especially cold-water immersion and pediatrics).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Frostbite assessment; rewarm tissues only when refreezing is not a risk.", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, specialtyDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bacterial Vaginosis

public enum BVSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bv",
        title: "Bacterial vaginosis (BV)",
        subtitle: "Polymicrobial dysbiosis · fishy odor · Amsel / Nugent · metronidazole",
        nclexTags: infectionDxR10,
        definition: AttributedProse(
            "Polymicrobial overgrowth of anaerobic vaginal flora (Gardnerella, Prevotella, Mobiluncus) with loss of protective lactobacilli. Most common cause of vaginal discharge in reproductive-age women per primary source.",
            citationIDs: ["openrn_ms_round10", "cdc_dx_round10"]
        ),
        pathophysiology: AttributedProse(
            "Disruption of normal lactobacillus-dominated vaginal flora → anaerobic overgrowth → elevated vaginal pH → characteristic odor and discharge. Not classified as STI but associated with sexual activity.",
            citationIDs: ["openrn_ms_round10"]
        ),
        presentation: [
            AttributedBullet("Thin, gray-white discharge that COATS the vaginal walls.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("FISHY ODOR — particularly after intercourse (alkaline semen + amines released by anaerobes).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("MILD irritation; usually no significant inflammation or itching (vs candida or trichomoniasis).", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("~50% of women with BV are asymptomatic.", citationIDs: ["openrn_ms_round10"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Amsel criteria (≥3 of 4): thin gray-white discharge; vaginal pH >4.5; positive whiff test (KOH + amine odor); CLUE CELLS on saline wet mount per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Nugent score (Gram-stain) — research / lab gold standard.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("NAAT for BV pathogens — increasingly used; combined panels for BV / candida / trichomoniasis.", citationIDs: ["openrn_ms_round10"])
        ],
        priorityAssessments: [
            AttributedBullet("Pelvic exam; assess for STI co-infection, pregnancy.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Risk factors — multiple partners, douching, IUD, antibiotic use, smoking.", citationIDs: ["openrn_ms_round10"])
        ],
        commonInterventions: [
            AttributedBullet("METRONIDAZOLE 500 mg PO BID × 7 days OR metronidazole 0.75% gel intravaginal × 5 days OR clindamycin 2% cream intravaginal × 7 days per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Pregnancy — same regimens; metronidazole or clindamycin per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Counsel — AVOID alcohol with metronidazole (disulfiram-like reaction); separate by 24–72 hr per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Recurrent BV (≥3 episodes / year) — extended treatment + suppressive intravaginal metronidazole 2× weekly per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Partner treatment NOT routinely recommended (no evidence of benefit) per primary source.", citationIDs: ["cdc_dx_round10"]),
            AttributedBullet("Counsel against douching; evidence is mixed for probiotics.", citationIDs: ["openrn_ms_round10"])
        ],
        watchFor: [
            AttributedBullet("Pregnancy — BV associated with preterm birth, PROM, postpartum endometritis; treat symptomatic; screening asymptomatic mixed evidence per primary source.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Increased HIV / STI acquisition risk with BV.", citationIDs: ["openrn_ms_round10"]),
            AttributedBullet("Recurrence is common (~50% within 1 year); long-term suppression for refractory cases.", citationIDs: ["openrn_ms_round10"])
        ],
        citations: [openrnMSr10, cdcDxR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}
