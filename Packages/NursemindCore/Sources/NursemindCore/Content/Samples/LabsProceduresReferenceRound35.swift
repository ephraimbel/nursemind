import Foundation

// Curator-model labs + procedures + references (round 35 — Safe & Effective Care: toxicology screens + safety processes + HIPAA + patient rights + mandatory reporting + RCA).

private let openrnLPRR35 = CitationSource(
    id: "openrn_lpr_round35",
    shortName: "Open RN Nursing Skills + Mental Health",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcLPRR35 = CitationSource(
    id: "cdc_lpr_round35",
    shortName: "CDC + AHRQ + HHS + NIH concept citations",
    publisher: "CDC · AHRQ · HHS · NIH",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLPRR35 = CitationSource(
    id: "specialty_lpr_round35",
    shortName: "ANA + AHA + ACEP + ISMP + Joint Commission + USPSTF fact citations",
    publisher: "ANA · AHA · ACEP · ISMP · Joint Commission · USPSTF",
    license: .factCitationOnly,
    url: "https://www.jointcommission.org/",
    lastRetrieved: "2026-05-13"
)

private let tdmLabTagsR35 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .pharmacologicalAndParenteralTherapies,
    priorityConcept: .safety
)
private let toxLabTagsR35 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .safetyAndInfectionControl,
    priorityConcept: .safety
)
private let safetyProcTagsR35 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)
private let mocRefTagsR35 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)
private let safetyRefTagsR35 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .safetyAndInfectionControl,
    priorityConcept: .safety
)

// MARK: - LABS

public enum UrineDrugScreenSample {
    public static let entry: LabEntry = LabEntry(
        id: "urine-drug-screen",
        title: "Urine drug screen (UDS) — toxicology",
        subtitle: "Point-of-care immunoassay vs confirmatory GC-MS/LC-MS · false positives + false negatives · chain of custody · medical vs forensic testing distinction",
        specimen: "Urine (50-100 mL fresh random)",
        nclexTags: toxLabTagsR35,
        referenceRanges: [
            ReferenceRangeRow(value: "Negative for assayed substances", label: "Normal/negative screen", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "Positive immunoassay → confirm with GC-MS/LC-MS", label: "Presumptive positive (needs confirmation)", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "Confirmed positive by mass spectrometry", label: "True positive", citationIDs: ["specialty_lpr_round35"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative screen",
                summary: "No substances detected at assay cutoffs; does not rule out recent use of substances not on the panel or below detection threshold.",
                nursingActions: [
                    "Continue clinical assessment",
                    "Consider broader testing if clinical suspicion remains (synthetic cannabinoids, novel psychoactives)"
                ],
                citationIDs: ["specialty_lpr_round35"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Presumptive positive (immunoassay)",
                summary: "Substance detected by immunoassay; LIKELY but not definitively present — requires confirmatory mass spectrometry; false positives common (especially cross-reactivity).",
                nursingActions: [
                    "Confirm with GC-MS/LC-MS before clinical or legal action",
                    "Review medication list for known cross-reactivities (PPI/pseudoephedrine/sertraline/quinolones causing false amphetamine, dronabinol causing THC, poppy seeds causing opiates)",
                    "Interpret in clinical context",
                    "Patient discussion with non-judgmental approach"
                ],
                citationIDs: ["specialty_lpr_round35"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Confirmed positive — clinical/legal implications",
                summary: "Substance confirmed; address acute toxicity, dependency, treatment, social services per context; forensic chain of custody if legal.",
                nursingActions: [
                    "Acute management of overdose if symptomatic",
                    "Reversal agents — naloxone for opioids, flumazenil for benzodiazepines (rare)",
                    "Substance use disorder counseling + medication-assisted treatment referral",
                    "Pregnancy — neonatology + OB + social work for newborn drug exposure",
                    "Chain of custody documentation if legal use",
                    "Trauma-informed approach + harm reduction"
                ],
                citationIDs: ["specialty_lpr_round35"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Common UDS panel substances + detection windows",
                causes: ["Amphetamines + methamphetamine — 1-3 days", "Cocaine (benzoylecgonine) — 2-4 days", "Opiates (morphine, codeine) — 1-3 days; oxycodone/fentanyl/methadone need separate testing", "Cannabinoids (THC-COOH) — 3-30+ days (chronic users)", "Benzodiazepines — 1-7 days (some not detected on standard panel)", "Barbiturates — 1-7 days", "PCP — 4-8 days", "Alcohol (EtG/EtS) — 80+ hours; ethanol itself 12-24 hours"],
                citationIDs: ["specialty_lpr_round35"]
            ),
            CauseGroup(
                title: "False positive cross-reactivities",
                causes: ["Amphetamine — pseudoephedrine, PPIs (esp. pantoprazole), bupropion, ranitidine, trazodone, sertraline, labetalol, quinolones (less common newer assays)", "Opiates — poppy seeds, dextromethorphan, quinolones, rifampin", "Benzodiazepines — sertraline (rare), oxaprozin (NSAID)", "Cannabinoids — dronabinol, hemp/CBD products (legal), efavirenz", "PCP — dextromethorphan, ketamine, venlafaxine, tramadol", "Tricyclic antidepressants — carbamazepine, quetiapine"],
                citationIDs: ["specialty_lpr_round35"]
            ),
            CauseGroup(
                title: "Adulteration/tampering signs",
                causes: ["Dilution — temperature <90°F or >100°F, creatinine <20 mg/dL, specific gravity <1.003, color abnormal", "Substitution — temperature out of range, creatinine very low, pH abnormal", "Adulteration — pH <4 or >9, presence of nitrites/chromates/bleach"],
                citationIDs: ["specialty_lpr_round35"]
            )
        ],
        nursingActions: [
            AttributedBullet("Collect fresh random urine specimen 50-100 mL; verify temperature within 4 min (90-100°F); observe collection if forensic.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Chain of custody for legal/forensic — collector identity, time, sealed container, witness, signed transfer documentation.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Patient history — current medications, supplements, recent foods (poppy seeds, hemp), occupational exposures.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Consent + privacy — explain testing purpose; medical testing requires consent except emergencies; forensic may not require consent.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Non-judgmental + trauma-informed approach; substance use disorder is medical condition.", citationIDs: ["openrn_lpr_round35"]),
            AttributedBullet("Confirmatory mass spectrometry before clinical or legal decisions; presumptive positive is NOT definitive.", citationIDs: ["specialty_lpr_round35"])
        ],
        watchFor: [
            AttributedBullet("False positives → wrongful accusation + lost employment + custody issues; demand confirmatory testing.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("False negatives — substance not on panel, below detection, dilute urine, adulteration.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Synthetic cannabinoids (K2, spice), novel psychoactives, fentanyl analogs — often not detected on standard panels; specialized testing needed.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Methadone, oxycodone, fentanyl — not detected on standard opiate panel; require specific tests.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Newborn drug exposure screening — meconium or umbilical cord more sensitive than urine; institutional policies on consent + reporting.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("CONFIDENTIALITY — 42 CFR Part 2 (substance use disorder records) more stringent than HIPAA; specific consents required for sharing.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Stigma + bias — avoid; results inform clinical care + recovery; do not document judgmentally.", citationIDs: ["openrn_lpr_round35"])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BloodAlcoholLevelSample {
    public static let entry: LabEntry = LabEntry(
        id: "blood-alcohol-level",
        title: "Blood alcohol level (BAL/BAC)",
        subtitle: "Ethanol serum/whole blood · clinical vs legal cutoffs · chain of custody for forensic · withdrawal risk assessment · pediatric + pregnancy considerations",
        specimen: "Serum or whole blood (avoid alcohol-containing skin prep — use povidone-iodine NOT chlorhexidine alcohol)",
        nclexTags: toxLabTagsR35,
        referenceRanges: [
            ReferenceRangeRow(value: "0 mg/dL (no ethanol detected)", label: "Normal", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "<50 mg/dL (<0.05%)", label: "Mild impairment in non-tolerant", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "80-100 mg/dL (0.08-0.10%)", label: "LEGAL LIMIT for driving in most US states", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "200-300 mg/dL (0.20-0.30%)", label: "Severe impairment, vomiting, ataxia", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "300-400 mg/dL (0.30-0.40%)", label: "Coma, respiratory depression risk", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: ">400 mg/dL (>0.40%)", label: "Potentially fatal", citationIDs: ["specialty_lpr_round35"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "BAL undetectable",
                summary: "No ethanol detected; does not rule out other intoxicants.",
                nursingActions: [
                    "Assess for other substances if intoxication suspected",
                    "Consider withdrawal if patient has history of heavy use"
                ],
                citationIDs: ["specialty_lpr_round35"]
            ),
            InterpretationTier(
                severity: .high,
                label: "BAL 100-300 mg/dL",
                summary: "Moderate intoxication; assess for respiratory depression + aspiration + injury (falls/trauma); plan for safe discharge or admission.",
                nursingActions: [
                    "Airway + aspiration precautions (lateral recovery position)",
                    "Vital signs + neuro checks Q15-30 min",
                    "Glucose check (hypoglycemia in heavy drinkers + chronic malnutrition)",
                    "Thiamine 100 mg IV BEFORE glucose (Wernicke prevention)",
                    "Assess for concurrent trauma + intoxication-related injury",
                    "Safe disposition — sober adult + safe transportation; NOT alone if disoriented"
                ],
                citationIDs: ["specialty_lpr_round35"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "BAL >300 mg/dL OR respiratory depression",
                summary: "Severe alcohol poisoning; ICU monitoring; airway protection; risk of fatal respiratory depression + aspiration; chronic users may be deceptively alert at high levels.",
                nursingActions: [
                    "Airway management — intubation for GCS ≤8 OR airway compromise",
                    "Continuous monitoring — VS, SpO2, capnography, telemetry",
                    "Thiamine 100 mg IV + glucose for hypoglycemia + magnesium + folate",
                    "IV fluids — hydration; avoid hypotonic in heavy drinkers (cerebral edema risk)",
                    "Alcohol withdrawal anticipation — CIWA-Ar score; benzodiazepines (lorazepam IV); seizure precautions",
                    "Comprehensive trauma evaluation",
                    "Detect coingestants (acetaminophen, opioids, benzodiazepines)"
                ],
                citationIDs: ["specialty_lpr_round35"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated BAL",
                causes: ["Acute alcohol intoxication", "Alcohol use disorder + heavy chronic consumption", "Pediatric — accidental ingestion (mouthwash, hand sanitizer, vanilla extract)", "Methanol/ethylene glycol coingestion — high osmolar gap + acidosis (specific testing needed)", "Isopropyl alcohol — different toxicity pattern", "Ketosis (DKA, starvation) — elevated isopropanol from acetone reduction"],
                citationIDs: ["specialty_lpr_round35"]
            ),
            CauseGroup(
                title: "Forensic + legal contexts",
                causes: ["Suspected DUI/DWI", "Workplace injury with alcohol involvement", "Custody disputes", "Probation violation", "Underage drinking"],
                citationIDs: ["specialty_lpr_round35"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen collection — venipuncture site prep with PROVIDONE-IODINE (NOT alcohol or chlorhexidine alcohol — falsely elevates BAL).", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Chain of custody for forensic — collector + witness identification, sealed container, signed transfer documentation, secure storage; DO NOT proceed with forensic testing without proper protocol.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Consent — medical testing requires consent except emergency life-threatening; forensic testing requires either consent OR warrant (Birchfield v. North Dakota requires warrant for blood test for routine DUI in most circumstances).", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Document — collection time, last drink time, recent intake, medications.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Withdrawal assessment — CIWA-Ar starting 6-24h after last drink; prophylactic benzodiazepines + thiamine + supportive.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Non-judgmental + trauma-informed; substance use disorder is medical condition; harm reduction approach.", citationIDs: ["openrn_lpr_round35"])
        ],
        watchFor: [
            AttributedBullet("Tolerance — chronic heavy drinkers may have BAL 300+ and appear normal; do NOT assume safe to discharge based on appearance.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Withdrawal anticipation — 6-24h post last drink; delirium tremens at 72-96h; seizures + death possible without treatment.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Wernicke encephalopathy + Korsakoff syndrome — thiamine deficiency; ALWAYS give thiamine 100 mg IV BEFORE glucose; high-dose for prophylaxis.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Coingestants — acetaminophen + opioids + benzodiazepines + methanol/ethylene glycol; broaden toxicology workup.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Pediatric — accidental ingestion of household alcohol products; hypoglycemia + seizures + coma + death.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Pregnancy — fetal alcohol spectrum disorders (FASD); even single binge can cause damage; counseling + referral.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Legal — DUI/DWI testing has specific protocols; chain of custody + warrant requirements; consult risk management + legal counsel.", citationIDs: ["specialty_lpr_round35"])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NarrowTherapeuticIndexTDMSample {
    public static let entry: LabEntry = LabEntry(
        id: "tdm-narrow-therapeutic-index",
        title: "Therapeutic drug monitoring — narrow therapeutic index reference",
        subtitle: "Digoxin, lithium, phenytoin, aminoglycosides, valproic acid, theophylline, carbamazepine · trough/peak/AUC · steady state · drug-drug interactions",
        specimen: "Serum (trough — just before next dose; peak — drug-specific timing)",
        nclexTags: tdmLabTagsR35,
        referenceRanges: [
            ReferenceRangeRow(value: "DIGOXIN: 0.5-2.0 ng/mL (HF: 0.5-0.9 preferred; AF: up to 2.0)", label: "Therapeutic", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "LITHIUM: 0.6-1.2 mEq/L (maintenance); 0.8-1.2 acute mania", label: "Therapeutic", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "PHENYTOIN: total 10-20 mcg/mL; free 1-2 mcg/mL", label: "Therapeutic", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "VALPROIC ACID: 50-100 mcg/mL", label: "Therapeutic", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "CARBAMAZEPINE: 4-12 mcg/mL", label: "Therapeutic", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "THEOPHYLLINE: 10-20 mcg/mL", label: "Therapeutic", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "GENTAMICIN/TOBRAMYCIN: peak 5-10 mcg/mL, trough <2 mcg/mL (traditional); extended-interval 0.5-2 mcg/mL trough", label: "Therapeutic", citationIDs: ["specialty_lpr_round35"]),
            ReferenceRangeRow(value: "VANCOMYCIN: trough 10-20 mcg/mL OR AUC 400-600 mg·h/L (preferred)", label: "Therapeutic", citationIDs: ["specialty_lpr_round35"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Therapeutic range",
                summary: "Drug levels in target range; continue current regimen with periodic monitoring per drug + clinical status.",
                nursingActions: [
                    "Continue regimen + periodic monitoring (frequency varies by drug)",
                    "Reassess after dose change OR clinical change OR renal function change OR new drug-drug interaction"
                ],
                citationIDs: ["specialty_lpr_round35"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Subtherapeutic",
                summary: "Treatment failure risk; reassess adherence, absorption, dosing schedule, interactions; dose escalation as appropriate.",
                nursingActions: [
                    "Verify adherence + missed doses",
                    "Check timing of last dose relative to draw",
                    "Review interactions (induction of metabolism)",
                    "Notify provider for dose adjustment"
                ],
                citationIDs: ["specialty_lpr_round35"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Supratherapeutic / approaching toxic",
                summary: "Hold next dose, reduce future doses, monitor for toxicity symptoms; consider drug-drug interactions causing elevation.",
                nursingActions: [
                    "Hold or reduce next dose per provider",
                    "Assess for toxicity symptoms",
                    "Review concomitant drugs for interactions",
                    "Renal/hepatic function assessment",
                    "Re-check level after appropriate interval"
                ],
                citationIDs: ["specialty_lpr_round35"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Toxic level + symptoms",
                summary: "Drug toxicity; hold drug; supportive care + drug-specific antidote/treatment; ICU as needed.",
                nursingActions: [
                    "HOLD drug",
                    "Cardiac monitor + serial assessments",
                    "Digoxin toxicity — digoxin immune Fab (Digibind/DigiFab); correct hypoK + hypoMg",
                    "Lithium toxicity — IV fluids; hemodialysis for level >4 or neurologic; AVOID nephrotoxins + thiazides + NSAIDs",
                    "Phenytoin toxicity — slow infusion; AVOID rapid loading (cardiac arrhythmia); supportive",
                    "Aminoglycoside — hold; renal monitoring; audiometry baseline + serial",
                    "Vancomycin — hold; alternative agent if persistent toxicity"
                ],
                citationIDs: ["specialty_lpr_round35"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated levels (TOXICITY risk)",
                causes: ["Dose escalation without redose monitoring", "Renal function decline — most drugs cleared renally", "Hepatic dysfunction — drugs metabolized by liver", "Drug-drug interactions (CYP inhibitors, P-glycoprotein inhibitors, OAT/OCT effects)", "Volume depletion + AKI in critically ill", "Digoxin — hypoK, hypoMg, hypothyroidism, age + amiodarone + verapamil + spironolactone + macrolides", "Lithium — dehydration, low Na, NSAIDs, ACE-I/ARB, thiazides, age", "Phenytoin — hypoalbuminemia (free vs total), CYP2C9/19 inhibitors", "Aminoglycoside — renal impairment + concurrent nephrotoxins"],
                citationIDs: ["specialty_lpr_round35"]
            ),
            CauseGroup(
                title: "Causes of low levels (treatment failure)",
                causes: ["Non-adherence (most common)", "Drug-drug interactions reducing absorption/levels (induction of metabolism)", "Subtherapeutic dosing", "Drug-food interactions", "Genetic polymorphisms (CYP variants)", "Increased clearance in hyperdynamic/septic patients", "Drug-disease interactions"],
                citationIDs: ["specialty_lpr_round35"]
            ),
            CauseGroup(
                title: "Timing of drug levels (steady state)",
                causes: ["Steady state typically 4-5 half-lives after initiation or dose change", "Trough — just before next dose (most TDM)", "Peak — drug-specific (aminoglycosides 30 min after IV, 1 hr post oral)", "Random level — interpretation difficult; ideally trough", "Stat level — toxicity suspected (interpret with clinical context, may not represent steady state)"],
                citationIDs: ["specialty_lpr_round35"]
            )
        ],
        nursingActions: [
            AttributedBullet("Verify TIMING — most TDM is TROUGH just before next dose; document last dose time + draw time.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Steady state required — 4-5 half-lives; interpret early levels cautiously.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Renal + hepatic function correlation — most narrow-therapeutic drugs cleared via these routes.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Drug-drug interaction screening — pharmacy + clinical decision support; especially CYP3A4 + P-gp inhibitors.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Pharmacy consultation for complex cases (Bayesian PK modeling for vancomycin AUC; aminoglycoside extended interval).", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Patient education — adherence + consistent timing + interactions; counsel on toxicity signs.", citationIDs: ["openrn_lpr_round35"])
        ],
        watchFor: [
            AttributedBullet("Digoxin — N/V, anorexia, fatigue, visual changes (yellow-green halos), arrhythmia; Fab fragments antidote.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Lithium — tremor, confusion, ataxia, hyperreflexia → coma, seizures, death; dialysis for severe.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Phenytoin — nystagmus, ataxia, drowsiness → arrhythmia; AVOID rapid IV (hypotension + cardiac collapse).", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Aminoglycoside — nephrotoxicity + ototoxicity (often permanent); audiometry + renal function.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Vancomycin — nephrotoxicity, ototoxicity, infusion reactions (red man); AUC-guided monitoring preferred per IDSA/ASHP 2020.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Valproic acid + carbamazepine — hepatotoxicity, hematologic toxicity, hyponatremia (CBZ).", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Theophylline — narrow window; tachycardia, seizures, arrhythmias; outdated drug, levels rarely needed now.", citationIDs: ["specialty_lpr_round35"])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

// MARK: - PROCEDURES

public enum RapidResponseTeamActivationSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "rapid-response-team-activation",
        title: "Rapid response team (RRT) activation",
        subtitle: "Early intervention for clinical deterioration · ANY healthcare worker can activate · MEWS/NEWS triggers · structured handoff (SBAR) · prevents code blue + ICU transfer",
        nclexTags: safetyProcTagsR35,
        indications: AttributedProse(
            "Rapid response team (RRT) — multidisciplinary team responding to early signs of patient deterioration BEFORE cardiopulmonary arrest. Reduces in-hospital cardiac arrests + ICU transfers + mortality when implemented effectively. Joint Commission National Patient Safety Goal — \"the right care, in the right place, at the right time\". ANY healthcare worker (RN, CNA, family member, patient) can activate without authorization in mature programs (\"Condition H\" or family-activated rapid response) per primary source.",
            citationIDs: ["specialty_lpr_round35"]
        ),
        contraindications: AttributedProse(
            "None — RRT activation is a safety mechanism that errs on the side of intervention; \"better to activate unnecessarily than fail to activate when needed\". Cultural barriers (staff fear of judgment) should be addressed institutionally.",
            citationIDs: ["specialty_lpr_round35"]
        ),
        equipment: [
            AttributedBullet("Crash cart + airway equipment + AED/defibrillator available to RRT team.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Smart phones / pagers for team activation; institutional protocols + dial number.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Monitoring equipment — portable monitor + pulse ox + BP + telemetry.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("IV access supplies + medications per protocol.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Documentation tools — RRT call sheet + SBAR template + post-event review form.", citationIDs: ["specialty_lpr_round35"])
        ],
        preProcedure: [
            AttributedBullet("Recognize trigger criteria — institutional protocol typically includes: RR <8 or >30, SpO2 <90%, HR <40 or >130, SBP <90 or >180, sustained drop in BP/HR, new altered mental status, new chest pain, seizure, agitation, hemorrhage, decreased UOP, family concern.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Many institutions use Modified Early Warning Score (MEWS) or National Early Warning Score (NEWS) — composite score with score-based triggers.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Don't wait — activate at first concerning sign; do not delay for additional workup.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Initial bedside actions before team arrives — verify ABC, position appropriately, administer O2, IV access, vital signs, focused assessment.", citationIDs: ["specialty_lpr_round35"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Activate", body: "Call RRT per institutional protocol (typically pager OR dedicated phone number); identify location + reason in 1-2 sentences. Continue bedside care while waiting.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 2, title: "Bedside care while waiting", body: "ABC assessment + intervention; oxygen if hypoxic; position; IV access; full set of vital signs; brief focused exam; chart review for context.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 3, title: "SBAR handoff", body: "Situation: \"This is RN [name] on [unit]. Patient [name + age + key dx]; I'm concerned about [issue]\". Background: brief medical history + admit reason. Assessment: vital signs + findings + your interpretation. Recommendation: \"I think we need [specific action]\" OR \"Please come evaluate immediately\".", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 4, title: "Team collaborative response", body: "RRT (typically critical care RN + respiratory therapist + sometimes hospitalist/intensivist) evaluates; nurse continues care; team makes decisions about interventions + disposition.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 5, title: "Disposition decision", body: "Stay on unit with new orders + close monitoring; transfer to step-down/intermediate care; transfer to ICU; emergent procedures; family communication.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 6, title: "Documentation", body: "RRT call sheet + nursing notes + SBAR documentation + interventions + disposition + family notification + provider notification.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 7, title: "Post-event debrief", body: "Team debrief immediately + formal review within 24-48 hours; identify what worked + opportunities for improvement; learning loop.", citationIDs: ["specialty_lpr_round35"])
        ],
        postProcedure: [
            AttributedBullet("Close monitoring continues — frequent vital signs + reassessment + clinical judgment.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Family notification + communication.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Post-event review + RCA if patient deteriorated despite RRT.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Staff debrief + emotional support; second-victim awareness.", citationIDs: ["openrn_lpr_round35"])
        ],
        documentation: [
            AttributedBullet("RRT call sheet + time of activation + triggering criteria + interventions + disposition.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Nursing notes — chronology + observations + interventions + outcomes.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Vital signs + assessments + medication administration.", citationIDs: ["specialty_lpr_round35"])
        ],
        watchFor: [
            AttributedBullet("CULTURAL barriers — staff fear of judgment, hierarchy, \"crying wolf\" concerns; institutional support + education + leadership tone.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("FAILURE TO ACTIVATE — delay leads to cardiopulmonary arrest + worse outcomes; \"failure to rescue\" metric tracked.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("OVER-ACTIVATION is OK — better than under; institutional culture should support.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Family-activated rapid response — \"Condition H\" + similar programs (Josie King story); family concerns sometimes catch what staff miss.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Track metrics — calls + outcomes + arrest rates + mortality + ICU transfers; quality improvement loop.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Deteriorating patient — escalate to code blue if cardiopulmonary arrest develops; do not delay.", citationIDs: ["specialty_lpr_round35"])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CodeBlueResponseSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "code-blue-response",
        title: "Code blue / in-hospital cardiac arrest response",
        subtitle: "ACLS-driven CPR + defibrillation · clear role assignment · structured leadership · medications + airway · post-arrest care · family presence · debrief",
        nclexTags: safetyProcTagsR35,
        indications: AttributedProse(
            "Code blue — in-hospital cardiopulmonary arrest requiring activation of advanced cardiovascular life support (ACLS) response team. Sudden cardiac arrest in hospital has historical survival to discharge ~25%; quality of CPR + early defibrillation + post-arrest care are key determinants. Established institutional protocols + ACLS guidelines (AHA 2020 update) provide framework. ANY clinical staff who recognizes arrest activates code per primary source.",
            citationIDs: ["specialty_lpr_round35"]
        ),
        contraindications: AttributedProse(
            "Confirmed DNR/DNAR orders; valid advance directive specifying no CPR; signs of irreversible death (decapitation, rigor mortis, dependent lividity, decomposition). Verify DNR status BEFORE initiating compressions if any uncertainty.",
            citationIDs: ["specialty_lpr_round35"]
        ),
        equipment: [
            AttributedBullet("Crash cart — defibrillator/AED, airway equipment (BVM, ETT, laryngoscope, OPA/NPA), ACLS medications (epinephrine, amiodarone, lidocaine, atropine, calcium, magnesium, sodium bicarbonate), IV/IO supplies.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Continuous capnography + cardiac monitor + suction.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Backboard or hard surface for effective compressions; mechanical CPR device (LUCAS) in some institutions.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Documentation tools — code documentation sheet + clock with second hand visible to team.", citationIDs: ["specialty_lpr_round35"])
        ],
        preProcedure: [
            AttributedBullet("Recognize arrest — unresponsive + no breathing/agonal breathing + no pulse (≤10 sec pulse check); CALL FOR HELP + activate code via emergency button/phone.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Begin CPR immediately — 30:2 compression:ventilation single rescuer; continuous compressions with advanced airway; depth 2-2.4 inches; rate 100-120/min; minimize interruptions.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Apply defibrillator/AED + analyze rhythm + shock if indicated.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Role assignment as team arrives — leader, airway, compressions, recorder, medication, family liaison.", citationIDs: ["specialty_lpr_round35"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "ACTIVATE + initiate CPR", body: "Recognize arrest, call for help, activate code, begin compressions at rate 100-120/min depth 2-2.4 in; minimize interruptions; rotate compressor every 2 minutes.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 2, title: "Defibrillate if shockable rhythm", body: "Apply defib/AED; analyze; if VF or pulseless VT → shock (biphasic 120-200 J or per manufacturer); resume CPR immediately for 2 minutes; reassess.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 3, title: "Airway management", body: "BVM with high-flow O2; advanced airway (ETT, supraglottic) when feasible; capnography to verify placement + CPR quality (PETCO2 >10 mmHg target; ROSC may show sudden rise).", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 4, title: "Medications per ACLS algorithm", body: "Epinephrine 1 mg IV/IO every 3-5 minutes (after 2nd shock in shockable; ASAP in non-shockable). Amiodarone 300 mg IV/IO bolus then 150 mg for refractory VF/pulseless VT (or lidocaine alternative). Atropine NOT routinely indicated. Reverse causes (H's + T's).", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 5, title: "Identify + treat reversible causes (H's + T's)", body: "Hs — Hypovolemia, Hypoxia, H+ (acidosis), Hyper/Hypokalemia, Hypothermia. Ts — Tension pneumothorax, Tamponade, Toxins, Thrombosis (PE/MI). Address as identified — fluids, intubation, calcium/bicarbonate, decompression, pericardiocentesis, thrombolytics.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 6, title: "Family presence", body: "Family presence during resuscitation increasingly supported (AHA + ENA); designated staff supports family; offers choice; integrate when feasible.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 7, title: "ROSC + post-arrest care", body: "If ROSC achieved → targeted temperature management (32-36°C × 24 hr per current evidence), oxygenation (SpO2 92-98%, PaCO2 35-45 normocarbic), hemodynamic support, etiology workup (cardiac cath, CTA, EEG), neurologic + multi-organ support, ICU.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 8, title: "Termination + debrief", body: "Decision to terminate based on team leader judgment + futility + reversibility + duration; family discussion + spiritual care + organ donation consideration. Debrief immediately + formal review; emotional support for team.", citationIDs: ["specialty_lpr_round35"])
        ],
        postProcedure: [
            AttributedBullet("ROSC achieved — ICU transfer + post-arrest bundle (TTM, oxygenation goals, BP support, etiology workup, neurologic monitoring).", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Death — family support + chaplaincy + organ donation consideration + autopsy decision + post-mortem care.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Team debrief — what worked, what didn't, emotional impact, role review; institutional review for QI.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Second-victim support for involved staff; institutional EAP + peer support.", citationIDs: ["openrn_lpr_round35"]),
            AttributedBullet("Document comprehensively — code documentation sheet + nursing notes + medications + interventions + outcomes.", citationIDs: ["specialty_lpr_round35"])
        ],
        documentation: [
            AttributedBullet("Code documentation sheet — chronology + interventions + medications + defibrillation + rhythm strips + outcomes.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Vital signs + assessments + decisions + family communication.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Provider notification + escalation + transfers + final disposition.", citationIDs: ["specialty_lpr_round35"])
        ],
        watchFor: [
            AttributedBullet("DNR/DNAR verification before initiating compressions if any uncertainty — emergency may permit if status unclear, but verify ASAP.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Slow code / show code — UNETHICAL; either provide full resuscitation or comfort care; transparent goals-of-care conversation.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("CPR quality is paramount — depth, rate, recoil, minimal interruptions; capnography feedback.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Family presence during resuscitation — increasingly supported with designated support staff.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Reversible causes — H's + T's — must address; without addressing, ROSC unlikely sustained.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Post-arrest care quality is significant survival predictor — TTM + hemodynamic management + neuro support.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Team training — ACLS certification + simulation + mock codes + leadership development.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Survivor neurologic outcomes vary; CPC scoring; family communication essential.", citationIDs: ["specialty_lpr_round35"])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum RootCauseAnalysisSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "root-cause-analysis-process",
        title: "Root cause analysis (RCA) process",
        subtitle: "Multidisciplinary systematic review of safety events · Joint Commission requirement for sentinel events · just culture · Fishbone + 5 Whys + Swiss cheese · action plan",
        nclexTags: safetyProcTagsR35,
        indications: AttributedProse(
            "Root cause analysis (RCA) — structured, multidisciplinary process for identifying underlying causes of safety events, errors, and adverse outcomes; goal is system improvement, NOT individual blame. Joint Commission requires RCA within 45 days for sentinel events; institutional policies may require for other events. Effective RCA prevents recurrence + drives organizational learning. Just culture framework — distinguish human error (system redesign), at-risk behavior (coaching), reckless behavior (discipline) per primary source.",
            citationIDs: ["specialty_lpr_round35"]
        ),
        contraindications: AttributedProse(
            "Premature blame-fixing; closed/punitive culture preventing transparent participation; insufficient time or resources for thorough review; lack of leadership commitment.",
            citationIDs: ["specialty_lpr_round35"]
        ),
        equipment: [
            AttributedBullet("RCA team — multidisciplinary (involved staff + leadership + risk management + quality + clinical experts + sometimes patient/family).", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Event documentation — chart review + incident reports + interviews + photographs + equipment + system logs.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Analytical tools — Fishbone (Ishikawa) diagram, 5 Whys, Swiss cheese model (Reason), fault tree analysis, timelines.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Meeting space + facilitator + minute-taker + electronic collaboration tools.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Action plan template + accountability assignments + follow-up review schedule.", citationIDs: ["specialty_lpr_round35"])
        ],
        preProcedure: [
            AttributedBullet("Event reporting — institutional reporting system; risk management notification.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Preserve evidence — original medication container + labels + IV bag + equipment + chart; chain of custody.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Sentinel event determination — Joint Commission criteria (death, permanent harm, severe temporary harm, wrong site/patient surgery, infant abduction, severe medication errors, etc.).", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Team selection — diverse multidisciplinary representation; involved staff included with psychological safety; facilitator trained in RCA methodology.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Just culture framework — emphasize learning, not blame; encourage transparent participation.", citationIDs: ["specialty_lpr_round35"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Initiate within 45 days (sentinel) or institutional timeframe", body: "Charter team + define scope + clarify goals + emphasize blame-free environment.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 2, title: "Chronological reconstruction", body: "Build detailed timeline of event — what happened in what sequence + who was involved + what tools/systems involved; verify accuracy with multiple sources (chart, interviews, records, logs).", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 3, title: "Identify proximate causes", body: "Immediate causes — what directly led to the event (the active failure or unsafe act).", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 4, title: "Apply 5 Whys + Fishbone", body: "5 Whys — ask \"why\" 5 times to drill from proximate cause to root cause (technique: ask why each time you think you have an answer). Fishbone (Ishikawa) — categorize contributing factors by major branches (People, Process, Equipment, Environment, Materials, Management).", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 5, title: "Swiss cheese model (Reason)", body: "Identify how multiple system defenses (\"slices of Swiss cheese\") had aligned holes allowing event to occur; address ALL contributing layers, not just last one.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 6, title: "Root cause identification", body: "Underlying systemic, organizational, or human-factors causes; verify that addressing root cause(s) would have prevented event.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 7, title: "Action plan development", body: "SMART recommendations — Specific, Measurable, Achievable, Relevant, Time-bound; assign accountability + deadline + follow-up; address root cause(s) at system level (technology, process, training, environment, policy).", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 8, title: "Implementation + monitoring + sustainability", body: "Implement recommendations + measure outcomes + adjust as needed; verify sustained improvement; share learning organizationally.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 9, title: "Disclosure + transparency", body: "Patient + family disclosure per institutional policy; risk management + legal consultation; communication may include apology + plan.", citationIDs: ["specialty_lpr_round35"]),
            ProcedureStep(number: 10, title: "Submit to regulators", body: "Joint Commission sentinel event reporting (optional); CMS adverse event; state-required reporting; documentation per institutional policy.", citationIDs: ["specialty_lpr_round35"])
        ],
        postProcedure: [
            AttributedBullet("Action plan implementation + monitoring outcomes + sustainability over months/years.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Share learning organizationally — case studies + grand rounds + simulation + training updates.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Second-victim support for involved staff; institutional EAP + peer support + counseling.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Patient + family disclosure + ongoing communication + support; goal-concordant care.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Quality improvement cycle — RCA → action plan → measurement → refinement → systemic change.", citationIDs: ["specialty_lpr_round35"])
        ],
        documentation: [
            AttributedBullet("RCA report — chronology + analysis + root causes + action plan + responsible parties + timeline.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Team meetings + decisions + recommendations + follow-up.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Implementation + outcomes + sustained changes.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Regulatory + accreditation reporting as applicable.", citationIDs: ["specialty_lpr_round35"])
        ],
        watchFor: [
            AttributedBullet("BLAME FIXING — undermines just culture + discourages future reporting; transparent learning culture is goal.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Action plans that don't address root cause — recurrence likely.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Just culture algorithm — distinguish: HUMAN ERROR (slip/lapse) → coach + system redesign; AT-RISK behavior (drift, taking shortcuts) → coach + behavior change; RECKLESS behavior (conscious disregard for substantial risk) → discipline.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("SECOND VICTIM phenomenon — involved staff suffer significant psychological impact; institutional support essential.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Recommendations should target HIGH-RELIABILITY interventions — forcing functions + automation + standardization > weak interventions (education, reminders).", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Track outcomes — without measurement, action plans drift; quality dashboards + leading + lagging indicators.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Patient + family inclusion — increasingly supported; respects autonomy + adds perspective.", citationIDs: ["specialty_lpr_round35"]),
            AttributedBullet("Confidentiality — RCA results may have legal protection (state peer review statutes); risk management + legal consultation.", citationIDs: ["specialty_lpr_round35"])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

// MARK: - REFERENCES

public enum HIPAAFrameworkSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "hipaa-privacy-rule-framework",
        title: "HIPAA + patient confidentiality",
        subtitle: "Privacy Rule + Security Rule · PHI definition + use + disclosure · 18 identifiers · breach notification · social media · exceptions + minimum necessary",
        eyebrow: "REFERENCE · MANAGEMENT OF CARE",
        nclexTags: mocRefTagsR35,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Health Insurance Portability and Accountability Act (HIPAA, 1996) governs use + disclosure of Protected Health Information (PHI) in healthcare. The HIPAA Privacy Rule establishes national standards; Security Rule addresses electronic PHI (ePHI). Civil + criminal penalties for violations ($100-$50K per violation; up to $1.5M/year cap; criminal penalties for malicious violations). Healthcare workers must understand minimum necessary use, authorization requirements, and breach response per primary source.",
                citationIDs: ["specialty_lpr_round35"]
            )),
            .keyValueTable(title: "Protected Health Information (PHI) — 18 identifiers", [
                KeyValueRow(key: "Direct identifiers", value: "Names, addresses, dates (birth/death/admission/discharge), phone, fax, email, SSN, MRN, account numbers, license/certificate numbers, vehicle/device identifiers, URLs, IPs, biometric, photographs"),
                KeyValueRow(key: "Geographic", value: "Address smaller than state, ZIP code (unless de-identified per Safe Harbor)"),
                KeyValueRow(key: "Combination data", value: "Even non-identifying data may become PHI if combination identifies individual (small rural town + rare condition + age)"),
                KeyValueRow(key: "Deidentified data", value: "Safe Harbor — remove all 18 identifiers; OR Expert Determination — statistician certifies low risk of re-identification")
            ]),
            .keyValueTable(title: "Use vs disclosure — Treatment, Payment, Operations (TPO)", [
                KeyValueRow(key: "TPO (Treatment, Payment, Operations)", value: "PHI may be used/disclosed for these purposes without specific authorization; clinical care, billing, quality improvement, training, business operations"),
                KeyValueRow(key: "Authorization required", value: "Most other uses — marketing, research (with exceptions), psychotherapy notes, fundraising, employer (with exceptions); written + specific + revocable"),
                KeyValueRow(key: "Required disclosures", value: "Patient request to see own records (right to access), required by law (court order, public health), HHS investigation"),
                KeyValueRow(key: "Permitted disclosures (without auth)", value: "Public health (communicable disease, child abuse, FDA reporting), law enforcement (limited circumstances + court order), workers compensation, organ donation, research with IRB approval + minimum necessary"),
                KeyValueRow(key: "MINIMUM NECESSARY", value: "Only use/disclose minimum PHI needed for purpose; default principle except for treatment + patient request + required disclosures")
            ]),
            .bullets(title: "Common HIPAA violations to avoid", [
                AttributedBullet("Discussing patients in public areas — elevators, cafeterias, hallways; LISTEN OUT for risk.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Looking at family member/friend/celebrity records without legitimate clinical reason (\"snooping\") — most common HIPAA violation + automatic termination + criminal in many cases.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Sharing login credentials + leaving workstation logged in + writing passwords down.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Disclosing PHI to family members without patient authorization — exception if patient incapacitated + reasonable to believe family in best interest.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Faxing/emailing PHI to wrong recipient — verify before sending; encrypted email.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Photographs of patients without authorization — including with patient's own phone shared inappropriately.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Social media — NEVER post about patients, even \"de-identified\"; case studies for education require formal de-identification + sometimes patient consent.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Mobile devices + USB drives — encryption + remote wipe + institutional MDM; lost device = breach.", citationIDs: ["specialty_lpr_round35"])
            ]),
            .keyValueTable(title: "Breach notification (HITECH Act expansion)", [
                KeyValueRow(key: "What is a breach", value: "Unauthorized acquisition/access/use/disclosure of PHI compromising security or privacy"),
                KeyValueRow(key: "Patient notification", value: "Within 60 days of discovery; written notice describing breach, types of info involved, steps taken, recommendation"),
                KeyValueRow(key: "HHS notification (small breach)", value: "<500 affected — annual log to HHS by Feb of following year"),
                KeyValueRow(key: "HHS notification (large breach)", value: "≥500 affected — immediate notification to HHS + local media + posted on \"HHS Wall of Shame\""),
                KeyValueRow(key: "Encryption safe harbor", value: "Encrypted PHI lost (e.g., laptop stolen) — NOT a breach if encryption per HHS standards")
            ]),
            .bullets(title: "Special situations", [
                AttributedBullet("Mental health + substance use disorder records — 42 CFR Part 2 substance use records have HIGHER protection than HIPAA; specific consents required.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Minor patients — varies by state + by topic (reproductive, mental health, substance use often confidential from parents); know your state.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Genetic information — GINA Act provides additional protections for genetic info disclosure.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Death — PHI protections continue 50 years after death.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Disaster/emergency response — HHS may waive some HIPAA provisions for public health emergencies.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Public health reporting — communicable disease, child abuse, elder abuse, gunshot wounds, etc.; mandatory + protected.", citationIDs: ["specialty_lpr_round35"])
            ]),
            .bullets(title: "Patient rights under HIPAA", [
                AttributedBullet("RIGHT TO ACCESS — patient can request copies of own records; institution must provide within 30 days.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO AMEND — patient can request correction of inaccurate records; institution decides + documents.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO ACCOUNTING OF DISCLOSURES — patient can request list of disclosures (with exceptions for TPO).", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO REQUEST RESTRICTIONS — patient can request limited disclosures; institution may or may not agree (must agree to restriction from health plans if patient pays out of pocket).", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO CONFIDENTIAL COMMUNICATIONS — patient can request alternative communication methods/locations.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO COMPLAIN — to institution OR to HHS Office for Civil Rights; protected from retaliation.", citationIDs: ["specialty_lpr_round35"])
            ])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PatientRightsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "patient-bill-of-rights",
        title: "Patient rights + informed refusal",
        subtitle: "Patient Bill of Rights · autonomy · capacity · refusal of treatment · AMA discharge · religious/cultural objections · ethics consultation",
        eyebrow: "REFERENCE · MANAGEMENT OF CARE",
        nclexTags: mocRefTagsR35,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Patient rights — foundational ethical + legal framework protecting patient autonomy + dignity in healthcare. Hospital admission triggers Patient Bill of Rights (American Hospital Association + state laws + institutional policies). Includes rights to information, participation in care decisions, refusal of treatment, privacy, complaint resolution, and continuity of care. Nurses are first-line advocates for patient rights; conflicts with institutional/clinical preferences require respectful dialogue + ethics consultation per primary source.",
                citationIDs: ["specialty_lpr_round35"]
            )),
            .bullets(title: "Core patient rights", [
                AttributedBullet("RIGHT TO INFORMATION — diagnosis + prognosis + treatment options + risks + benefits + alternatives + costs; in language patient understands; interpreter services for non-English speakers.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO PARTICIPATE — in decisions about care; informed consent process; right to refuse OR withdraw consent at any time.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO REFUSE TREATMENT — including life-sustaining treatment if competent; document risks + consequences + patient understanding; provide alternatives.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO PRIVACY + CONFIDENTIALITY — HIPAA framework; chaperone for sensitive exams; private discussions.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO BE TREATED WITH DIGNITY + RESPECT — regardless of race, gender, sexual orientation, religion, disability, age, immigration status, ability to pay.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO ACCESS RECORDS — own records + amend + restrict per HIPAA.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO ADVANCE DIRECTIVES — execute + have honored.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO COMPLAIN — to facility + state department + federal agencies; protected from retaliation.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO TRANSFER + CONTINUITY OF CARE — appropriate transfer to another facility; receiving facility must accept (EMTALA-related).", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RIGHT TO ETHICS CONSULTATION — patient or family request triggers institutional ethics committee review.", citationIDs: ["specialty_lpr_round35"])
            ]),
            .keyValueTable(title: "Capacity assessment", [
                KeyValueRow(key: "4 components of decision-making capacity", value: "(1) Understanding — comprehends information given. (2) Appreciation — applies info to own situation. (3) Reasoning — weighs options. (4) Communication — expresses choice consistently"),
                KeyValueRow(key: "Decision-specific", value: "Capacity is decision-specific + may fluctuate; patient may have capacity for simple decisions but not complex"),
                KeyValueRow(key: "Lack of capacity does not equal incompetence", value: "Competence is legal determination by court; capacity is clinical assessment"),
                KeyValueRow(key: "Common assessment tools", value: "MacArthur Competence Assessment Tool (MacCAT-T), Aid to Capacity Evaluation (ACE); clinical assessment + sometimes psychiatry consult"),
                KeyValueRow(key: "When patient lacks capacity", value: "Look for advance directives → healthcare proxy → state surrogate hierarchy (spouse > adult children > parents > siblings, varies by state) → court-appointed guardian if needed"),
                KeyValueRow(key: "Risk-proportional", value: "Higher-stakes decisions require more rigorous capacity assessment")
            ]),
            .keyValueTable(title: "AMA (Against Medical Advice) discharge", [
                KeyValueRow(key: "Assess capacity", value: "Determine patient has decision-making capacity to refuse treatment + discharge"),
                KeyValueRow(key: "Inform comprehensively", value: "Explain medical condition, recommended treatment, risks of leaving, alternatives, follow-up, when to return"),
                KeyValueRow(key: "Address concerns", value: "Understand why patient wants to leave — pain, anxiety, family/work obligations, distrust, substance use, financial; address what possible"),
                KeyValueRow(key: "Offer alternatives", value: "Partial treatment, outpatient follow-up, prescriptions, return-to-ED instructions"),
                KeyValueRow(key: "Sign AMA form", value: "Document patient + witness signature OR patient's refusal to sign; document verbal acknowledgment"),
                KeyValueRow(key: "Continue care", value: "Provide reasonable interventions + medications + discharge instructions; do NOT punish patient; insurance generally pays (myth that AMA = no coverage)"),
                KeyValueRow(key: "Document objectively", value: "Capacity assessment + information provided + patient understanding + decision + offers + interventions; verbatim quotes")
            ]),
            .bullets(title: "Special considerations", [
                AttributedBullet("Religious refusal — Jehovah's Witnesses + blood transfusion; document advance directive; alternatives (intraoperative cell salvage, EPO, optimize tolerance); respect autonomy.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Minors + refusal — generally parents decide for minors; emancipated minors (married, military, court-emancipated, financially independent) + mature minors may decide; reproductive + mental health rights vary by state.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Court-ordered treatment — psychiatric, communicable disease, dialysis in rare cases; legal process + due process; rarely successful.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Capacity to refuse vs accept — sometimes different thresholds; refusing life-saving care triggers higher scrutiny but should be honored if capacity intact.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Cultural humility — religious + cultural beliefs vary; engage chaplaincy + community resources + cultural brokers; do not impose values.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Language access — interpreter services required; avoid family interpreters except emergency; phone/video interpreters available 24/7.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Ethics consultation — for conflict, complex cases, end-of-life, surrogate disagreement, futility questions; multidisciplinary committee.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Power dynamics — patient may feel pressured to agree; assess voluntariness; private discussions without family.", citationIDs: ["specialty_lpr_round35"])
            ])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MandatoryReportingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "mandatory-reporting-framework",
        title: "Mandatory reporting framework",
        subtitle: "Child abuse · elder abuse · intimate partner violence (varies) · communicable disease · gunshot wounds · animal bites · other reportable",
        eyebrow: "REFERENCE · MANAGEMENT OF CARE",
        nclexTags: mocRefTagsR35,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Mandatory reporting laws require healthcare workers (and other professionals) to report specific situations to designated authorities — regardless of patient consent or HIPAA. Failure to report is a criminal offense + professional license violation. Reporting laws vary by state — know YOUR state's specific requirements. \"Reasonable suspicion\" is the threshold — proof not required + reporter identity legally protected. \"It is better to report a suspicion that proves unfounded than to fail to report a real case\" per primary source.",
                citationIDs: ["specialty_lpr_round35"]
            )),
            .keyValueTable(title: "Categories of mandatory reporting", [
                KeyValueRow(key: "CHILD ABUSE + NEGLECT", value: "ALL 50 states — physical, sexual, emotional abuse + neglect; report to Child Protective Services (CPS); also FDIA/Munchausen, witnessing IPV in some states; threshold is SUSPICION not proof"),
                KeyValueRow(key: "ELDER ABUSE", value: "44 states + DC + Puerto Rico + US Virgin Islands — physical, sexual, emotional, financial abuse + neglect; report to Adult Protective Services (APS); self-neglect mandates vary"),
                KeyValueRow(key: "DEPENDENT ADULT ABUSE", value: "Many states — adults with disabilities or in institutions; report to APS or specific protective agency"),
                KeyValueRow(key: "INTIMATE PARTNER VIOLENCE (IPV)", value: "Varies — most states do NOT mandate reporting of IPV between competent adults (autonomy + safety concerns); some require reporting of injuries from weapons/violence"),
                KeyValueRow(key: "COMMUNICABLE DISEASE", value: "ALL 50 states — specific diseases per CDC list (HIV, syphilis, gonorrhea, chlamydia, TB, hepatitis B+C, measles, mumps, pertussis, COVID, foodborne, etc.); state health department reporting"),
                KeyValueRow(key: "GUNSHOT WOUNDS", value: "ALL 50 states — typically mandate law enforcement notification regardless of patient consent"),
                KeyValueRow(key: "STAB WOUNDS / VIOLENCE", value: "Most states — mandate reporting of injuries from violence + weapons + criminal acts"),
                KeyValueRow(key: "ANIMAL BITES", value: "All states — rabies risk + public health"),
                KeyValueRow(key: "BURNS", value: "Many states — chemical burns + suspicious burns (potential abuse); meth lab exposure"),
                KeyValueRow(key: "IMPAIRED PROFESSIONALS", value: "Many states — substance use, mental illness compromising practice; report to state board"),
                KeyValueRow(key: "FETAL DEMISE + STILLBIRTH", value: "All states — vital records; sometimes additional investigation"),
                KeyValueRow(key: "HUMAN TRAFFICKING (MINORS)", value: "All 50 states — automatic when minor involved; report to law enforcement + CPS"),
                KeyValueRow(key: "HUMAN TRAFFICKING (ADULTS)", value: "Varies — autonomy considerations; resources + advocacy primary; some states mandate reporting of injuries")
            ]),
            .bullets(title: "Reporting process", [
                AttributedBullet("Call designated authority IMMEDIATELY upon reasonable suspicion — not after workup complete; specific hotlines per type (CPS for child abuse, APS for elder, local PD/911 for emergencies, state DOH for communicable disease).", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Provide — patient name, location, nature of concern, observations, source of information; follow up with written report per state requirements.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Document — chronology, observations, who notified, when, response, follow-up; do NOT document supposition or judgment.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Confidentiality — reporter identity legally protected; HIPAA permits disclosure for mandatory reporting.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Liability — good-faith reporting immune from civil liability; failure to report is criminal + license violation.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Patient notification — generally NOT required to inform patient/family of report before making it (especially child abuse — safety + investigation concerns).", citationIDs: ["specialty_lpr_round35"])
            ]),
            .keyValueTable(title: "Special situations", [
                KeyValueRow(key: "Tarasoff duty", value: "Duty to warn identifiable third party if patient makes credible threat (most states); duty to protect via warning, hospitalization, or other reasonable measures"),
                KeyValueRow(key: "Suicide risk", value: "Capacity-permitting voluntary admission; involuntary commitment if imminent risk + lack of capacity (state-specific process)"),
                KeyValueRow(key: "Threats", value: "Threats to identifiable persons + workplace + public figures — Tarasoff applies + law enforcement notification"),
                KeyValueRow(key: "Driving impairment", value: "Some states mandate physician reporting of impaired drivers (epilepsy, dementia, certain conditions); some states permissive"),
                KeyValueRow(key: "Workplace injury", value: "OSHA reporting requirements; workers' compensation"),
                KeyValueRow(key: "Foster care placement", value: "Some states require notification when child placed; ongoing CPS coordination"),
                KeyValueRow(key: "Sexually transmitted infections", value: "Partner notification programs (public health), often voluntary patient or anonymous via health department")
            ]),
            .bullets(title: "Best practices + pitfalls", [
                AttributedBullet("Know YOUR state's requirements — vary significantly; institutional resources + policy + risk management.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Threshold is REASONABLE SUSPICION, not proof or certainty.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Do NOT confront suspected perpetrator + do NOT investigate yourself — leave to authorities.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Trauma-informed disclosure to patient — \"I am required by law to report this; my goal is your safety + connection with resources\".", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Cultural sensitivity — reporting may impact families differently across cultures; mandatory still applies.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Adult autonomy considerations — IPV, self-neglect by capable adults — respect autonomy + provide resources rather than mandate intervention.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Multidisciplinary team — social work + risk management + ethics + child advocacy + APS partnership.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Provide victim resources regardless of whether reporting required — National Domestic Violence Hotline, National Sexual Assault Hotline, National Human Trafficking Hotline, RAINN.", citationIDs: ["specialty_lpr_round35"])
            ])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IncidentReportingJustCultureSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "incident-reporting-just-culture",
        title: "Incident reporting + just culture",
        subtitle: "Sentinel event · near-miss · just culture algorithm · second victim phenomenon · transparency · learning organization",
        eyebrow: "REFERENCE · MANAGEMENT OF CARE",
        nclexTags: mocRefTagsR35,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Incident reporting + just culture — organizational systems that capture safety events for learning + improvement while balancing individual accountability. Just culture (Reason + Marx) distinguishes between human error, at-risk behavior, and reckless behavior — each requiring different responses. Effective incident reporting depends on psychological safety + leadership commitment + transparent learning. Goal is system improvement + harm prevention, NOT blame per primary source.",
                citationIDs: ["specialty_lpr_round35"]
            )),
            .keyValueTable(title: "Event categories", [
                KeyValueRow(key: "SENTINEL EVENT (Joint Commission)", value: "Unexpected occurrence involving death OR permanent harm OR severe temporary harm; specific events automatically sentinel — wrong site/patient surgery, infant abduction, suicide, retained surgical item, severe medication error, perinatal death related to non-elective procedures"),
                KeyValueRow(key: "ADVERSE EVENT", value: "Untoward event that may or may not have caused harm to patient; encompasses sentinel events as subset"),
                KeyValueRow(key: "NEVER EVENT (CMS)", value: "List of 29 preventable adverse events that should NEVER occur — wrong site surgery, retained foreign object, air embolism, mismatched blood, pressure ulcer Stage III/IV in hospital, etc.; non-reimbursable by CMS"),
                KeyValueRow(key: "NEAR-MISS (Close call)", value: "Event that could have caused harm but didn't (caught + corrected before reaching patient); valuable learning opportunity"),
                KeyValueRow(key: "NO HARM EVENT", value: "Event reached patient but no harm occurred (lucky); still requires reporting + analysis"),
                KeyValueRow(key: "HAZARDOUS CONDITION", value: "Defect/unsafe condition that has not yet caused event; opportunity to fix before harm")
            ]),
            .keyValueTable(title: "Just Culture algorithm (Marx)", [
                KeyValueRow(key: "HUMAN ERROR (slip/lapse)", value: "Unintentional error — slip (action different from intended) or lapse (memory failure); response — COACH + SYSTEM REDESIGN; address contributing factors, not punish individual"),
                KeyValueRow(key: "AT-RISK BEHAVIOR (drift)", value: "Intentional behavior involving risk that individual believed acceptable; \"drift\" from safe practice over time; response — COACH + BEHAVIOR CHANGE + remove incentives for risk-taking"),
                KeyValueRow(key: "RECKLESS BEHAVIOR (conscious disregard)", value: "Conscious disregard for substantial + unjustifiable risk; response — DISCIPLINE per institutional policy; rare; distinguished from human error + at-risk by knowing + accepting unjustifiable risk"),
                KeyValueRow(key: "Algorithm questions", value: "1. Was the action intentional? 2. Did the person know risk? 3. Was risk justified? 4. Were procedures available + practical? 5. Would a peer have behaved similarly? — answers guide classification")
            ]),
            .bullets(title: "Effective incident reporting", [
                AttributedBullet("LOW BARRIER + USER-FRIENDLY — easy electronic reporting; anonymous option; <5 minutes; not punitive.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("LEADERSHIP commitment — frequent communication about value + transparency about responses; \"see something, say something\".", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("TIMELY response — feedback to reporter + closure on actions; demonstrates value of reports.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("AGGREGATE + TREND — analyze patterns + system improvements; share learning organizationally.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("NEAR-MISSES particularly valuable — learning without harm; reward reporting culture.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("NO RETALIATION — institutional policy + culture protecting reporters from punishment or career impact.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("PATIENT + FAMILY input — increasingly included; experience of care perspective.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("DASHBOARDS + METRICS — leading (process, near-miss) + lagging (harm, mortality) indicators.", citationIDs: ["specialty_lpr_round35"])
            ]),
            .bullets(title: "Second victim phenomenon", [
                AttributedBullet("Healthcare worker involved in adverse event suffers significant psychological impact — \"second victim\" (patient is first victim).", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Symptoms — guilt, shame, anxiety, depression, PTSD-like, insomnia, intrusive thoughts, withdrawal, career impact.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Stages — chaos, intrusive reflections, restoring personal integrity, enduring inquisition, emotional first-aid, moving on (Scott et al.).", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Recognition + acknowledgment — institutional second-victim support programs (Forsters at Missouri Health, RISE at Hopkins).", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Peer support + EAP + counseling + spiritual care + leadership presence.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Schwartz Rounds — interdisciplinary forums for emotional aspects of care + difficult cases.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Recovery — most return to practice with appropriate support; some leave profession.", citationIDs: ["specialty_lpr_round35"])
            ]),
            .bullets(title: "Disclosure to patients + families", [
                AttributedBullet("TRANSPARENCY — disclose adverse events causing harm; patient + family deserve to know; trust + healing.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("WHEN + WHO — soon after stabilization; senior clinician + lead nurse + risk management; private + unhurried.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("WHAT — factual account of what happened + harm + plan + apology if appropriate (medical apology laws in many states protect from admission of liability).", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("APOLOGY — \"I am sorry this happened\" — distinct from admission of fault; can support healing + reduce litigation.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("FOLLOW-UP — continue communication during investigation; share findings + improvements; demonstrate accountability.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("COMMUNICATION + RESOLUTION (CRP) programs — proactive disclosure + investigation + apology + offers + learning have shown REDUCED litigation + costs (Michigan, Stanford models).", citationIDs: ["specialty_lpr_round35"])
            ])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SentinelNeverEventsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "sentinel-never-events-reference",
        title: "Sentinel events + never events",
        subtitle: "Joint Commission sentinel event list · CMS hospital-acquired conditions (HACs) · Leapfrog never events · reporting timelines · regulatory consequences",
        eyebrow: "REFERENCE · SAFETY",
        nclexTags: safetyRefTagsR35,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Sentinel events + never events — categories of serious preventable adverse events with regulatory + reporting requirements. Joint Commission defines sentinel events (45-day RCA + action plan required for accredited hospitals). CMS publishes Hospital-Acquired Conditions (HACs) list affecting reimbursement (non-payment for never events). National Quality Forum (NQF) maintains Serious Reportable Events list. Understanding categorization helps clinical staff recognize + respond appropriately + drive prevention per primary source.",
                citationIDs: ["specialty_lpr_round35"]
            )),
            .keyValueTable(title: "Joint Commission sentinel events (selected)", [
                KeyValueRow(key: "ALWAYS sentinel (specific events)", value: "Wrong-site/wrong-procedure/wrong-patient surgery; suicide of patient receiving care; unanticipated death of full-term infant; abduction or sexual assault of patient; retained surgical item; severe neonatal jaundice (>30 mg/dL); rape, assault, homicide of patient/visitor/staff"),
                KeyValueRow(key: "Unexpected death or permanent harm", value: "Death not related to natural course of illness OR underlying condition; permanent harm — patient now requires care that was not needed before event"),
                KeyValueRow(key: "Severe temporary harm", value: "Critical injury OR life-threatening event requiring transfer to higher level of care for >24 hours"),
                KeyValueRow(key: "Reporting timeline", value: "Submit to Joint Commission within 60 days; RCA + action plan completed within 45 days; voluntary or required reporting depends on state + circumstance")
            ]),
            .keyValueTable(title: "CMS Hospital-Acquired Conditions (HACs) — selected", [
                KeyValueRow(key: "FOREIGN OBJECT retained after surgery", value: "Sponge, instrument, sharp, etc.; non-reimbursable"),
                KeyValueRow(key: "AIR EMBOLISM", value: "Iatrogenic; non-reimbursable"),
                KeyValueRow(key: "BLOOD INCOMPATIBILITY", value: "ABO mismatch; non-reimbursable"),
                KeyValueRow(key: "PRESSURE ULCERS Stage III/IV", value: "Hospital-acquired; non-reimbursable"),
                KeyValueRow(key: "INJURIES from FALLS + TRAUMA in hospital", value: "Fractures, ICH, etc.; non-reimbursable"),
                KeyValueRow(key: "VASCULAR-CATHETER-ASSOCIATED INFECTION", value: "CLABSI; non-reimbursable"),
                KeyValueRow(key: "CATHETER-ASSOCIATED UTI", value: "CAUTI; non-reimbursable"),
                KeyValueRow(key: "SURGICAL SITE INFECTION", value: "Following CABG, bariatric, orthopedic procedures; non-reimbursable"),
                KeyValueRow(key: "DVT/PE", value: "Following total knee/hip replacement; non-reimbursable"),
                KeyValueRow(key: "POOR GLYCEMIC CONTROL", value: "Hypoglycemic coma, DKA, hyperosmolar coma; non-reimbursable")
            ]),
            .keyValueTable(title: "NQF Serious Reportable Events — categories (29 events)", [
                KeyValueRow(key: "Surgical/invasive procedure", value: "Wrong site/patient/procedure, retained foreign object, intraoperative death of ASA 1 patient, etc."),
                KeyValueRow(key: "Product/device", value: "Use of contaminated drugs/devices, malfunction, intravascular air embolism"),
                KeyValueRow(key: "Patient protection", value: "Discharge to wrong person, patient elopement with death/serious harm, suicide"),
                KeyValueRow(key: "Care management", value: "Medication error with death/severe harm, blood incompatibility, maternal death, hypoglycemic event in setting of care, severe neonatal jaundice"),
                KeyValueRow(key: "Environmental", value: "Electric shock, burn, oxygen/gas confusion, restraint-related death/disability, sexual abuse/assault of patient"),
                KeyValueRow(key: "Radiologic", value: "MRI with metallic foreign body (eg pacemaker)"),
                KeyValueRow(key: "Criminal", value: "Imposter providing care, physical assault of staff/patient/visitor")
            ]),
            .bullets(title: "Response to sentinel event", [
                AttributedBullet("Immediate response — stabilize patient + ensure safety + preserve evidence + notify provider/leadership + risk management.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Disclosure — patient + family informed transparently per institutional policy.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Institutional reporting — within hours per protocol; risk management + nursing + medical leadership.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Regulatory reporting — Joint Commission within 60 days; state requirements vary; CMS adverse event.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("RCA + action plan within 45 days for accredited facilities; multidisciplinary review.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Second-victim support for staff involved; institutional EAP + peer support.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Communication + Resolution Programs — disclosure + apology + offer + learning have shown improved patient + institutional outcomes.", citationIDs: ["specialty_lpr_round35"])
            ]),
            .bullets(title: "Prevention strategies", [
                AttributedBullet("UNIVERSAL PROTOCOL — preop verification + site marking + time-out; reduces wrong-site surgery.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("BCMA + CPOE + smart pumps + clinical decision support — reduce medication errors.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Count protocols + RFID + technology — reduce retained surgical items.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("CLABSI/CAUTI/SSI prevention bundles — hand hygiene, sterile technique, daily review, early removal.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Fall prevention bundles — yellow gown/wristband, bed alarm, scheduled toileting, footwear, family presence.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Pressure injury prevention — risk assessment (Braden), positioning, surface, nutrition, mobility.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Rapid response teams — early intervention for clinical deterioration.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Just culture + incident reporting + RCA — organizational learning.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Quality dashboards + benchmarking + accreditation cycles drive sustained improvement.", citationIDs: ["specialty_lpr_round35"])
            ])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HomeSafetyFallPreventionSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "home-safety-fall-prevention-bundle",
        title: "Home safety + fall prevention bundle",
        subtitle: "Multifactorial fall prevention · CDC STEADI · home environment · medication review · exercise (Otago, tai chi) · vision + footwear · vitamin D",
        eyebrow: "REFERENCE · SAFETY",
        nclexTags: safetyRefTagsR35,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Falls are leading cause of fatal + non-fatal injury in adults ≥65 years — 36 million falls + 32,000 deaths annually in US older adults; cost $50 billion. CDC STEADI (Stopping Elderly Accidents, Deaths, & Injuries) provides comprehensive screening + assessment + intervention framework. Multifactorial intervention (vs single intervention) shown most effective — environmental modifications + medication review + exercise + vision + footwear + vitamin D. Home safety assessment + modifications can prevent ~30% of falls per primary source.",
                citationIDs: ["specialty_lpr_round35"]
            )),
            .keyValueTable(title: "Fall risk factors (modifiable)", [
                KeyValueRow(key: "MEDICATIONS (most modifiable)", value: "Psychotropic (benzodiazepines, hypnotics, antipsychotics, antidepressants), antihypertensives (especially alpha-blockers, multiple), opioids, anticholinergics, multiple meds (polypharmacy ≥4 medications)"),
                KeyValueRow(key: "MEDICAL conditions", value: "Orthostatic hypotension, cardiac arrhythmias, neuropathy, parkinsonism, dementia + cognitive impairment, vision impairment (cataracts, macular degeneration), incontinence, anemia, vitamin D deficiency"),
                KeyValueRow(key: "MOBILITY + STRENGTH", value: "Lower extremity weakness, balance deficits, gait abnormalities, fear of falling, deconditioning, sedentary lifestyle"),
                KeyValueRow(key: "ENVIRONMENT", value: "Loose rugs, poor lighting, clutter, lack of grab bars, slippery surfaces, stairs without railings, raised thresholds, pets underfoot, electrical cords"),
                KeyValueRow(key: "FOOTWEAR", value: "High heels, slippers, backless shoes, smooth-soled, ill-fitting; non-skid soles + supportive recommended"),
                KeyValueRow(key: "BEHAVIORAL", value: "Alcohol use, rushing, multitasking, ignoring assistive devices, refusal of help")
            ]),
            .keyValueTable(title: "CDC STEADI Algorithm", [
                KeyValueRow(key: "STEP 1: Screen", value: "Stay Independent Brochure (12-item Q for older adults) + ask 3 questions: Fell in past year? Unsteady walking? Worry about falling?"),
                KeyValueRow(key: "STEP 2: Assess (if positive screen)", value: "Falls history + medication review + orthostatic VS + visual acuity + foot/footwear + cognitive screen (MoCA/MMSE) + gait/balance (TUG = Timed Up and Go; >12 sec = increased risk)"),
                KeyValueRow(key: "STEP 3: Intervene", value: "Multifactorial — medication reduction/elimination, exercise (Otago, tai chi), vision correction, vitamin D 800-1000 IU daily, home modifications, footwear, education + community resources"),
                KeyValueRow(key: "TUG (Timed Up and Go)", value: "Patient rises from armchair, walks 10 ft, returns, sits — ≥12 seconds indicates fall risk; key screening tool"),
                KeyValueRow(key: "30-Second Chair Stand", value: "Number of times person can rise from chair in 30 sec; age-/sex-normed; lower extremity strength indicator"),
                KeyValueRow(key: "4-Stage Balance Test", value: "Stand feet together, semi-tandem, tandem, single-leg — 10 sec each; balance assessment")
            ]),
            .keyValueTable(title: "Home safety checklist (room-by-room)", [
                KeyValueRow(key: "ALL ROOMS", value: "Adequate lighting (night lights, switches accessible at room entrances), remove clutter + cords, secure rugs (rubber backing or remove), check railings"),
                KeyValueRow(key: "BATHROOM", value: "Grab bars (tub/shower, toilet) — installed in studs not drywall; non-slip mat in tub; raised toilet seat if needed; commode chair; shower chair if needed; warmth"),
                KeyValueRow(key: "BEDROOM", value: "Bed at proper height (knees at 90°); night light; phone within reach; commode at bedside if nocturia; non-slip path to bathroom"),
                KeyValueRow(key: "KITCHEN", value: "Frequently used items at waist level (no climbing/reaching), step stool with handle if needed, spills cleaned immediately, secure mats"),
                KeyValueRow(key: "STAIRS", value: "Handrails on both sides + extending past top + bottom step; contrasting edge marking (especially top + bottom); adequate lighting at top + bottom + switch at both ends; non-slip treads"),
                KeyValueRow(key: "OUTDOORS", value: "Walkways clear of debris/ice/leaves; adequate lighting; handrails on outdoor steps; non-slip surfaces; weather-appropriate footwear; companion or assistive device in adverse conditions")
            ]),
            .bullets(title: "Effective interventions (Cochrane evidence)", [
                AttributedBullet("EXERCISE programs — Otago Exercise Program (home-based strength + balance), Tai Chi (8 forms + balance + flexibility), group exercise (PT-led); 30-50% fall reduction in community-dwelling older adults.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("MEDICATION REVIEW — deprescribing + dose reduction + alternatives; pharmacist + primary care collaboration.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("VITAMIN D 800-1000 IU daily — reduces falls in deficient/insufficient older adults; check 25-OH-vitamin D level.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("VISION — cataract surgery + corrective lenses + avoiding bifocals while ambulating outdoors; ophthalmology referral.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("FOOTWEAR — supportive, low heel, non-skid soles, fitted; avoid bare feet + slippers + flip-flops; podiatry for foot problems.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("ASSISTIVE DEVICES — cane, walker, rollator with proper height + fit; PT for training; reluctance + stigma addressed.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("HOME MODIFICATIONS — comprehensive assessment by OT; addressed environment + behaviors; bundled interventions most effective.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("ORTHOSTATIC HYPOTENSION management — slow position changes, compression stockings, hydration, dose reduction of antihypertensives, midodrine + droxidopa for refractory.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("FEAR OF FALLING — CBT-based interventions, Matter of Balance program, cognitive restructuring; counsels false safety from immobility (increases fall risk).", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("HIP PROTECTORS — limited evidence; uncomfortable; selective use in highest risk (institutionalized + frequent fallers).", citationIDs: ["specialty_lpr_round35"])
            ]),
            .bullets(title: "Pediatric + adult home safety", [
                AttributedBullet("PEDIATRIC — car seat safety (rear-facing until 2+ years), crib safety (firm + flat + back to sleep + no loose items), poison-proofing, gates at stairs, outlet covers, water heater <120°F, drowning prevention (pool, bathtub), pedestrian + bike safety.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("FIRE SAFETY — working smoke alarms (replace batteries seasonal, every 10 yr), carbon monoxide alarms, fire extinguisher accessible, escape plan, no smoking in bed.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("MEDICATION SAFETY — locked or out-of-reach storage, especially with children/curious adults/cognitive impairment.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("FIREARM SAFETY — locked + unloaded + ammunition separate; especially with depression/suicidality + dementia + children.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("KITCHEN SAFETY — turn pot handles inward, supervise cooking with elders, fire safety, hot water + appliance safety.", citationIDs: ["specialty_lpr_round35"])
            ])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BehavioralSafetySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "behavioral-safety-restraint-alternatives",
        title: "Behavioral safety + restraint alternatives",
        subtitle: "Restraint alternatives (least restrictive) · environmental modifications · de-escalation continuum · CMS + Joint Commission requirements · sitter use · trauma-informed care",
        eyebrow: "REFERENCE · SAFETY",
        nclexTags: safetyRefTagsR35,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Restraint use carries significant risks — injury (including death from positional asphyxia), trauma, loss of dignity, delirium worsening, deconditioning, agitation escalation. CMS + Joint Commission require use of LEAST RESTRICTIVE intervention; restraints only when alternatives fail + immediate physical safety threat. Multidisciplinary alternatives strategies often successful — environmental modifications, sitter use, trauma-informed de-escalation, addressing underlying causes (pain, delirium, withdrawal, medication effects) per primary source.",
                citationIDs: ["specialty_lpr_round35"]
            )),
            .keyValueTable(title: "CMS + Joint Commission requirements", [
                KeyValueRow(key: "Restraint definition", value: "Any manual method, physical/mechanical device, material/equipment that immobilizes or reduces ability of patient to move arms, legs, body, head freely"),
                KeyValueRow(key: "Restraint types", value: "Non-violent/non-self-destructive (medical-surgical context) vs violent/self-destructive (behavioral health context); different requirements"),
                KeyValueRow(key: "Order requirements", value: "Physician order required (NP/PA in some states); time-limited (4 hr adult, 2 hr adolescent, 1 hr child for behavioral); face-to-face evaluation within 1 hr for behavioral restraint by qualified practitioner"),
                KeyValueRow(key: "Monitoring", value: "Q15 minute observation for behavioral restraint; nutrition + hydration + toileting; ROM + position changes; vital signs; circulation/skin assessment of restrained extremity"),
                KeyValueRow(key: "Documentation", value: "Order with type + indication + duration + alternatives tried; serial assessments; reasons for continued use"),
                KeyValueRow(key: "Discontinuation", value: "Reassess + discontinue at earliest opportunity; do not extend if safety can be maintained otherwise"),
                KeyValueRow(key: "Death reporting", value: "Sentinel event reporting for any death during restraint use OR within 24 hr of removal OR within 1 week if restraint may have contributed")
            ]),
            .keyValueTable(title: "Restraint alternatives (least restrictive first)", [
                KeyValueRow(key: "ENVIRONMENTAL", value: "Single-room with door alarm; bed/chair alarms (non-restrictive but alerts staff); low bed position; floor mats; appropriate lighting (not too dim/bright); soothing environment (music, dimming, family photos); reduce stimulation if overstimulated"),
                KeyValueRow(key: "SITTER / 1:1 OBSERVATION", value: "Family member OR sitter OR nursing technician; safety + companionship + comfort; significant cost but reduces restraint use; train sitters in de-escalation"),
                KeyValueRow(key: "BEHAVIORAL/PSYCHOLOGICAL", value: "Trauma-informed care; de-escalation continuum; therapeutic communication; redirection; activity engagement (puzzles, books, music, TV); pet therapy; chaplaincy + spiritual care"),
                KeyValueRow(key: "ADDRESS UNDERLYING CAUSE", value: "Pain assessment + treatment; toileting needs (Q1-2H scheduled); thirst/hunger; delirium workup + treatment; medication review (deprescribe sedative/anticholinergic); withdrawal symptoms; sensory aids (glasses, hearing aids, dentures)"),
                KeyValueRow(key: "POSITIONING + EQUIPMENT", value: "Bed in low position; side rails (one bed rail allowed for mobility assistance, not 4 to prevent exit — that's restraint); body pillows; geriatric chair vs bed (allows movement); mobility/transfer aids"),
                KeyValueRow(key: "MEDICATIONS", value: "Use with caution; antipsychotics + benzodiazepines can WORSEN delirium + falls; address pain + withdrawal + delirium specifically; sleep + comfort medications; consult pharmacy")
            ]),
            .bullets(title: "De-escalation continuum (verbal + nonverbal)", [
                AttributedBullet("STAGE 1 — Triggering events + early agitation: identify triggers, soft eye contact + relaxed posture, slow + low voice, simple words, give space (4-6 feet), reduce stimuli, offer help.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("STAGE 2 — Escalation + verbal aggression: validate feelings (\"I can see you're upset\"), active listening, calm respectful tone, offer choices (water, restroom, family contact), do not argue, do not match agitation.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("STAGE 3 — Crisis + imminent risk: prioritize safety; team approach (1 lead, 5 ready for hands-on if needed); position near exit; clear other patients/visitors; medication offered.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("STAGE 4 — Physical intervention (LAST resort): team trained in safe restraint techniques (no choking, avoid prone position, do not block airway, monitor for positional asphyxia); minimum force minimum time; remove restraints as soon as safe.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("STAGE 5 — Recovery + debrief: discuss with patient when ready, validate feelings, learn triggers, plan for prevention; team debrief.", citationIDs: ["specialty_lpr_round35"])
            ]),
            .keyValueTable(title: "Special populations", [
                KeyValueRow(key: "Dementia + delirium", value: "Most restraint use occurs in cognitively impaired; alternatives crucial — sundowning prevention (consistent routine, daytime light, evening dim), reminiscence + reality orientation, music, redirection; AVOID antipsychotics (BBW for elderly with dementia)"),
                KeyValueRow(key: "Substance withdrawal", value: "Symptom-specific protocols (CIWA for alcohol, COWS for opioid); medications to manage withdrawal often reduce agitation; private room + dim lighting"),
                KeyValueRow(key: "Children/adolescents", value: "Family presence + activity engagement + age-appropriate communication; behavioral health + child life specialists; restraint criteria more stringent + face-to-face within 1 hr"),
                KeyValueRow(key: "Mental health acute", value: "Trauma-informed; verbal de-escalation; PRN medications (often oral preferred over injection); peer support; voluntary first; specialized psychiatric units when available"),
                KeyValueRow(key: "Autism + developmental disability", value: "Sensory environment important; familiar staff + caregivers; predictable routine + transitions; communication adaptations; specialized care plans"),
                KeyValueRow(key: "Critical care/ICU", value: "Agitation often from delirium + lines/tubes + immobility; ICU delirium prevention bundle (ABCDEF); often more restraint use; address sedation + sleep + mobility + family")
            ]),
            .bullets(title: "Trauma-informed care principles", [
                AttributedBullet("SAFETY first — physical + emotional; predictable environment + transparent communication.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("TRUSTWORTHINESS + TRANSPARENCY — explain procedures + give choices + honor commitments.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("PEER SUPPORT + COLLABORATION — patient voice + perspective valued.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("EMPOWERMENT + VOICE + CHOICE — patient autonomy maximized; even small choices help.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("CULTURAL + HISTORICAL + GENDER awareness — recognize past trauma + cultural context affects behavior.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("HUMANIZING + DIGNIFYING approach — see person not behavior; maintain respect throughout interventions.", citationIDs: ["specialty_lpr_round35"]),
                AttributedBullet("Restraints can be RE-TRAUMATIZING for survivors of abuse + violence; alternatives prioritized.", citationIDs: ["specialty_lpr_round35"])
            ])
        ],
        citations: [openrnLPRR35, cdcLPRR35, specialtyLPRR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}
