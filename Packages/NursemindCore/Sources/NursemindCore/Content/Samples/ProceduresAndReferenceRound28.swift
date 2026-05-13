import Foundation

// Curator-model procedures + reference (round 28 — pulmonary depth: bronch + PFTs + airway clearance + classifications).

private let openrnPRR28 = CitationSource(
    id: "openrn_pr_round28",
    shortName: "Open RN Nursing Skills + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcPRR28 = CitationSource(
    id: "cdc_pr_round28",
    shortName: "CDC + NHLBI guidance",
    publisher: "CDC · NHLBI",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health-topics/all-publications-and-resources/",
    lastRetrieved: "2026-05-13"
)
private let specialtyPRR28 = CitationSource(
    id: "specialty_pr_round28",
    shortName: "ATS + ERS + CHEST + GINA + GOLD + CFF concept citations",
    publisher: "ATS · ERS · CHEST · GINA · GOLD · CFF",
    license: .factCitationOnly,
    url: "https://www.thoracic.org/statements/",
    lastRetrieved: "2026-05-13"
)

private let procTagsR28 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .gasExchange
)
private let refTagsR28 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .gasExchange
)

public enum BronchoscopySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "bronchoscopy",
        title: "Flexible bronchoscopy + BAL + biopsy",
        subtitle: "Diagnostic + therapeutic airway visualization · BAL for infection / ILD · biopsy for cancer · airway clearance · moderate sedation typical",
        nclexTags: procTagsR28,
        indications: AttributedProse(
            "Diagnostic — pulmonary infections (pneumonia, TB, fungal, PCP especially immunocompromised), hemoptysis source, suspected malignancy, interstitial lung disease workup (BAL cell count + cytology), foreign body, airway anatomy. Therapeutic — airway clearance (mucus plugs, atelectasis), foreign body removal, stent placement, tumor debulking, bleeding control per primary source.",
            citationIDs: ["specialty_pr_round28"]
        ),
        contraindications: AttributedProse(
            "Absolute — hemodynamic instability, severe untreatable hypoxemia. Relative — bleeding diathesis (correct INR <1.5, plt >50K), recent MI, unstable arrhythmias, severe pulmonary hypertension, raised intracranial pressure, uncooperative patient.",
            citationIDs: ["specialty_pr_round28"]
        ),
        equipment: [
            AttributedBullet("Flexible video bronchoscope; suction; light source; image processor; recording.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Topical anesthetic — lidocaine 2-4% (nebulized + sprayed + injected via channel); max ~7 mg/kg.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Sedation — midazolam + fentanyl OR propofol (anesthesia involvement); reversal agents available.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Forceps for biopsy, brushes for cytology, BAL syringes + sterile saline, cytology + microbiology containers.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Continuous ECG, SpO2, BP, capnography monitoring; supplemental O2; resuscitation equipment.", citationIDs: ["openrn_pr_round28"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders + consent + indication; review imaging.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("NPO 6-8 hours per institutional protocol.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("LABS — CBC, coagulation studies (INR <1.5, plt >50K-100K for biopsy), CMP.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("HOLD anticoagulants per institutional protocol (warfarin INR <1.5, DOAC 24-48 hours).", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("IV access, supplemental O2, baseline vitals, weight for medication dosing.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Position — supine with head slightly extended OR sitting up.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Topical anesthesia preparation — nebulized lidocaine + lozenges + spray.", citationIDs: ["openrn_pr_round28"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Setup + monitoring", body: "Patient on monitor — ECG, SpO2, BP, capnography; supplemental O2 via nasal cannula or facemask; reassure patient.", citationIDs: ["openrn_pr_round28"]),
            ProcedureStep(number: 2, title: "Sedation + topical anesthesia", body: "Conscious sedation (midazolam 1-2 mg + fentanyl 25-50 mcg) OR anesthesia for deep sedation; topical lidocaine spray oropharynx + lozenges; sometimes nebulized lidocaine.", citationIDs: ["openrn_pr_round28"]),
            ProcedureStep(number: 3, title: "Scope insertion", body: "Bronchoscope via nostril OR mouth (often through laryngeal mask airway / endotracheal tube); advance through nasopharynx, vocal cords; topical lidocaine sprayed through channel at vocal cords + carina.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 4, title: "Systematic airway inspection", body: "Visualize trachea, carina, both main bronchi, lobes; document anatomy, secretions, lesions, bleeding, edema; photograph abnormalities.", citationIDs: ["openrn_pr_round28"]),
            ProcedureStep(number: 5, title: "BAL (bronchoalveolar lavage)", body: "Wedge scope in subsegmental bronchus; instill 100-300 mL sterile saline; suction return; multiple aliquots; send for cytology, cell count + differential, gram stain + culture, AFB, fungal, viral, cytology (malignancy), galactomannan if invasive aspergillus suspected.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 6, title: "Bronchial brushing + biopsy", body: "Bronchoscopic biopsy of lesions, transbronchial biopsy of peripheral lesions, endobronchial ultrasound (EBUS) for nodes; biopsy forceps + cytology brushes; pneumothorax risk with transbronchial.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 7, title: "Therapeutic interventions", body: "Mucus plug removal (suction, saline wash), foreign body extraction (forceps), bleeding control (epinephrine instillation, cold saline, tamponade), stent placement.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 8, title: "Withdrawal + recovery", body: "Remove scope; observe for stridor, dyspnea, bleeding; recovery in monitored unit; NPO until gag reflex returns.", citationIDs: ["openrn_pr_round28"])
        ],
        postProcedure: [
            AttributedBullet("NPO until gag reflex returns (1-2 hours); soft diet first; full diet next day.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("MONITOR — pulse ox, BP, RR, ECG for 2-4 hours post; transbronchial biopsy → chest X-ray 1-2 hours post to rule out pneumothorax.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Sore throat + cough expected; lozenges; minimal hoarseness; resolve within hours.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Watch for HEMOPTYSIS — minor expected (streaky); significant amounts require evaluation.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("PNEUMOTHORAX — most common transbronchial biopsy complication; CXR post; chest tube if symptomatic / >20% pneumothorax.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Discharge after 2-4 hours observation if uncomplicated; no driving × 24 hours after sedation.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Resume anticoagulation per protocol.", citationIDs: ["specialty_pr_round28"])
        ],
        documentation: [
            AttributedBullet("Indication, sedation + topical anesthesia + doses, findings, biopsy sites + number, BAL volumes + return, complications, photographs.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Specimens sent + clinical question for pathology / microbiology.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Recovery + discharge plan + follow-up.", citationIDs: ["openrn_pr_round28"])
        ],
        watchFor: [
            AttributedBullet("PNEUMOTHORAX — risk ~1-3% all bronchs, 3-10% transbronchial biopsy; post-procedure CXR for biopsy; chest tube if symptomatic.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("HEMOPTYSIS — minor streaky common; significant 1-2%; bleeding control with cold saline, epinephrine, tamponade.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("HYPOXEMIA — supplemental O2 essential; may need increased FiO2 or NIV.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("ARRHYTHMIAS — vagally-mediated bradycardia; uncommon ventricular arrhythmias.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("LIDOCAINE TOXICITY — total dose <7 mg/kg; signs are tinnitus, perioral numbness, seizures.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("INFECTION — rare; immunocompromised at risk; antibiotic prophylaxis usually not indicated.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("OVERSEDATION — respiratory depression; reversal agents (flumazenil, naloxone) available.", citationIDs: ["specialty_pr_round28"])
        ],
        citations: [openrnPRR28, cdcPRR28, specialtyPRR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PulmonaryFunctionTestsSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "pulmonary-function-tests",
        title: "Pulmonary function tests (PFTs / spirometry)",
        subtitle: "Spirometry + lung volumes + DLCO · obstruction vs restriction patterns · pre + post bronchodilator · ATS standards · effort-dependent",
        nclexTags: procTagsR28,
        indications: AttributedProse(
            "Diagnostic — distinguish obstructive vs restrictive vs mixed lung disease; quantify severity; assess bronchodilator response (reversibility); preoperative pulmonary risk assessment; disability evaluation. Monitoring — disease progression in COPD, IPF, asthma; response to therapy; transplant candidacy; longitudinal screening (high-risk occupations) per primary source.",
            citationIDs: ["specialty_pr_round28"]
        ),
        contraindications: AttributedProse(
            "Recent MI (<1 month), uncontrolled hypertension, recent eye / chest / abdominal surgery, recent pneumothorax, hemoptysis active, severe hemoptysis history, tuberculosis active (infection control), thoracic aneurysm, severe acute respiratory illness.",
            citationIDs: ["specialty_pr_round28"]
        ),
        equipment: [
            AttributedBullet("Spirometer — calibrated; volume + flow sensors; ATS/ERS calibration standards.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Body plethysmograph for lung volumes (TLC, RV, FRC); alternative — helium dilution or nitrogen washout.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("DLCO equipment — gas mixture (helium, CO, methane) + breath-hold timer.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Nose clips, mouthpieces (disposable), spirometry software for interpretation.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Bronchodilator — albuterol 4 puffs OR nebulized 2.5 mg for post-bronchodilator testing.", citationIDs: ["openrn_pr_round28"])
        ],
        preProcedure: [
            AttributedBullet("HOLD bronchodilators — SABA (albuterol) 4 hours, LABA 12 hours, LAMA 24-48 hours, theophylline 24 hours before testing for diagnostic; some testing intentionally on medications.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("No smoking 1 hour before; no large meal; loose-fitting clothing; rest before.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Patient height + weight + age + sex + race (race-based reference equations updated 2023 — race-neutral preferred).", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Explain procedure — effort-dependent; multiple efforts; coaching essential; minimum 3 acceptable trials.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Review symptoms + medications + clinical question.", citationIDs: ["openrn_pr_round28"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Setup + calibration", body: "Calibrate spirometer per ATS standards; enter patient demographics; explain effort + technique; demonstrate.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 2, title: "Spirometry — FVC maneuver", body: "Mouthpiece; nose clips; deep maximal inspiration; maximal forced exhalation × 6+ seconds; coaching; ≥3 acceptable + ≥2 reproducible trials (FVC + FEV1 within 0.15 L).", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 3, title: "Key measurements", body: "FEV1 (forced expired volume 1 sec), FVC (forced vital capacity), FEV1/FVC ratio (obstruction <0.70 or LLN), peak expiratory flow (PEF), FEF25-75% (small airways).", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 4, title: "Post-bronchodilator testing", body: "Administer albuterol 4 puffs; wait 15 min; repeat spirometry; reversibility = ≥12% AND ≥200 mL increase in FEV1 or FVC.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 5, title: "Lung volumes (body plethysmography)", body: "TLC (total lung capacity), RV (residual volume), FRC (functional residual capacity); restrictive — ↓TLC; obstructive — ↑RV, ↑FRC.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 6, title: "DLCO", body: "Single-breath maneuver with gas mixture; 10-second breath-hold; quantifies alveolar-capillary diffusion; reduced in emphysema, IPF, pulmonary vascular disease, anemia.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 7, title: "Interpretation pattern", body: "OBSTRUCTIVE — ↓FEV1/FVC + ↓FEV1 + normal/↑TLC; RESTRICTIVE — normal/↑FEV1/FVC + ↓TLC + ↓FVC; MIXED — ↓FEV1/FVC + ↓TLC.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 8, title: "Quality assessment", body: "Verify ≥3 acceptable trials with end-of-test plateau ≥1 sec, ≥6 sec FET; reproducibility; ATS quality criteria; coaching for poor effort.", citationIDs: ["specialty_pr_round28"])
        ],
        postProcedure: [
            AttributedBullet("Patient may resume usual medications + activity.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Document — symptoms, effort, results, comparison to predicted + prior; clinical interpretation by pulmonologist.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Plan follow-up — disease severity classification + treatment adjustment.", citationIDs: ["openrn_pr_round28"])
        ],
        documentation: [
            AttributedBullet("Demographics, indication, medications taken / held, FEV1 + FVC + FEV1/FVC + DLCO + lung volumes (% predicted + actual), bronchodilator response, quality of effort.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("PATTERN identification — obstructive (COPD, asthma, bronchiectasis), restrictive (ILD, neuromuscular, obesity, chest wall), mixed.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Comparison to prior + clinical significance.", citationIDs: ["specialty_pr_round28"])
        ],
        watchFor: [
            AttributedBullet("EFFORT-dependent — coaching + repeat trials; submaximal effort underestimates lung function.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("VARIABILITY — day-to-day, time-of-day, exertion before test; standardize.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("RACE-BASED REFERENCE — 2023 controversy; race-neutral GLI Global preferred per ATS / ERS / NIH update.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("OBSTRUCTION severity — mild (FEV1 ≥70%), moderate (50-69%), severe (35-49%), very severe (<35%).", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("BRONCHODILATOR REVERSIBILITY — ≥12% + ≥200 mL FEV1 / FVC increase suggests asthma component but doesn't exclude COPD.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("DLCO — reduced in emphysema, IPF, PAH, anemia; corrected for hemoglobin.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Contraindications — acute MI, eye / chest / abdominal surgery, hemoptysis, pneumothorax recent.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("INFECTION CONTROL — single-use mouthpieces + filters; viral / bacterial transmission risk.", citationIDs: ["specialty_pr_round28"])
        ],
        citations: [openrnPRR28, cdcPRR28, specialtyPRR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AirwayClearanceTherapySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "airway-clearance-therapy",
        title: "Airway clearance therapy (ACT)",
        subtitle: "Cystic fibrosis + bronchiectasis · HFCWO vest + Acapella + PEP · daily lifelong · hypertonic saline + bronchodilators pre · DRAMATIC outcomes",
        nclexTags: procTagsR28,
        indications: AttributedProse(
            "Diseases with impaired mucociliary clearance — cystic fibrosis (CF), non-CF bronchiectasis, primary ciliary dyskinesia (PCD), severe COPD with mucus hypersecretion, post-stroke / post-thoracic surgery with retained secretions. Foundational therapy in CF + bronchiectasis daily; reduces exacerbations + preserves lung function per primary source.",
            citationIDs: ["specialty_pr_round28"]
        ),
        contraindications: AttributedProse(
            "Active hemoptysis (relative — modify technique), pneumothorax, recent chest trauma / surgery, unstable cervical spine, severe coagulopathy (relative), uncooperative patient, severe respiratory failure requiring acute care.",
            citationIDs: ["specialty_pr_round28"]
        ),
        equipment: [
            AttributedBullet("HIGH-FREQUENCY CHEST WALL OSCILLATION (HFCWO) — \"vest\" (SmartVest, MetaNeb, AffloVest); inflatable vest with rapid pressure pulses.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("OSCILLATORY PEP devices — Acapella, Flutter, RC-Cornet; create back-pressure + oscillations.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Standard chest physiotherapy — postural drainage + manual percussion + vibration (still used in pediatrics + selected).", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Autogenic drainage — breathing pattern technique (no equipment needed).", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Hypertonic saline 7% via nebulizer (CF + bronchiectasis); albuterol pre-airway clearance.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Dornase alfa (Pulmozyme) nebulized — CF only; cleaves DNA from neutrophils in sputum.", citationIDs: ["specialty_pr_round28"])
        ],
        preProcedure: [
            AttributedBullet("BRONCHODILATOR — albuterol nebulizer first; opens airways.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("HYPERTONIC SALINE 7% — nebulized; mucus mobilizer; precede airway clearance.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("DORNASE ALFA — CF patients; nebulized; cleaves neutrophil DNA in CF sputum.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Position — typically sitting up or recumbent depending on device + technique.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Education — daily 20-30 min sessions; technique adherence pivotal.", citationIDs: ["openrn_pr_round28"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Pre-treatment medications", body: "Albuterol nebulizer 2.5 mg → 10-15 min wait; hypertonic saline 7% 4 mL nebulized → 15-20 min; dornase alfa 2.5 mg (CF only) → 30 min before airway clearance.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 2, title: "HFCWO vest", body: "Fit vest snug; start low frequency (5-10 Hz) + low pressure; titrate to comfort; 20-30 min sessions; pause every 5 min for huff cough + expectoration.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 3, title: "Oscillatory PEP (Acapella, Flutter)", body: "Slow inhale + breath-hold 2-3 sec + slow exhale through device with pursed lips (creates vibration + back-pressure); 10-15 breaths × multiple sets; cough between sets.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 4, title: "Postural drainage + percussion", body: "Position to drain specific lobes; percuss + vibrate chest wall over affected segments × 3-5 min each; encourage cough + expectoration; multiple positions.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 5, title: "Autogenic drainage", body: "Sequential breathing — small breaths to mobilize peripheral mucus → medium breaths to bring mucus to larger airways → large breaths to clear; \"huff\" cough; technique training.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 6, title: "Huff cough + expectoration", body: "After each technique; deep breath in + open glottis + forced exhale (\"huffing\") to clear airways; expectorate into tissue / container.", citationIDs: ["specialty_pr_round28"]),
            ProcedureStep(number: 7, title: "Post-treatment", body: "Hydration + cough monitoring; document sputum amount + color; clean equipment.", citationIDs: ["openrn_pr_round28"])
        ],
        postProcedure: [
            AttributedBullet("Continue with daily 1-3 sessions depending on disease severity + secretions; lifelong in CF + bronchiectasis.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Equipment cleaning — daily wash with hot soapy water; weekly disinfection; manufacturer guidelines.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Sputum monitoring — color + amount + consistency; reporting changes to providers (purulent or increased volume → potential exacerbation).", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Adherence support — daily routine, family involvement, technology reminders, peer support groups.", citationIDs: ["specialty_pr_round28"])
        ],
        documentation: [
            AttributedBullet("Technique + duration + medications + frequency; tolerability; sputum production + characteristics.", citationIDs: ["openrn_pr_round28"]),
            AttributedBullet("Adherence + barriers + education needs.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("Functional outcomes — exacerbation frequency, hospitalization, FEV1 trends.", citationIDs: ["specialty_pr_round28"])
        ],
        watchFor: [
            AttributedBullet("ADHERENCE — lifelong daily therapy challenging; psychosocial support + simplification + technology assist (smartphone apps).", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("HEMOPTYSIS — minor common; modify technique; consider holding HFCWO during major hemoptysis.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("INFECTION CONTROL — equipment hygiene; biofilms in tubing; bacterial colonization (Pseudomonas, NTM) transmission concern.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("HYPERTONIC SALINE — bronchoconstriction in 10-15%; albuterol pre-treatment; some can't tolerate.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("PNEUMOTHORAX — rare with HFCWO; not contraindicated after recovery from prior pneumothorax.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("CHILDREN — play-based, family involvement, parent + child + RT partnership; gradual escalation.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("CFTR MODULATORS (Trikafta) — may reduce mucus burden but airway clearance still recommended (research evolving).", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("INSURANCE — HFCWO vests expensive; insurance approval + appeals; alternative low-cost techniques available.", citationIDs: ["specialty_pr_round28"]),
            AttributedBullet("FUNCTIONAL OUTCOMES — reduced exacerbations + hospitalization + preserved FEV1; quality of life improvement.", citationIDs: ["specialty_pr_round28"])
        ],
        citations: [openrnPRR28, cdcPRR28, specialtyPRR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PHClassificationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pulmonary-hypertension-classification",
        title: "Pulmonary hypertension classification (WHO Groups 1-5)",
        subtitle: "WHO classification · Group 1 PAH · Group 2 left heart · Group 3 lung disease · Group 4 CTEPH · Group 5 multifactorial · treatment varies",
        eyebrow: "REFERENCE · PULMONARY",
        nclexTags: refTagsR28,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Pulmonary hypertension (PH) is defined hemodynamically as mean pulmonary artery pressure ≥20 mm Hg (updated 2018 definition; previously 25). WHO classifies into 5 groups based on etiology + treatment approach — pivotal as therapies vary dramatically + inappropriate use can worsen outcomes per primary source.",
                citationIDs: ["specialty_pr_round28"]
            )),
            .keyValueTable(title: "Group 1 — Pulmonary arterial hypertension (PAH)", [
                KeyValueRow(key: "Definition", value: "Pre-capillary PH (mPAP ≥20 + PVR ≥2 Wood units + PCWP ≤15) without left heart, lung disease, or chronic thromboembolic cause"),
                KeyValueRow(key: "Subtypes", value: "Idiopathic (IPAH), heritable (BMPR2, ALK1), drug/toxin-induced (fenfluramine, amphetamines, methamphetamine, dasatinib), connective tissue disease (scleroderma — most common), congenital heart disease, portal hypertension (POPH), HIV-associated, schistosomiasis"),
                KeyValueRow(key: "PVOD/PCH", value: "Pulmonary veno-occlusive disease + pulmonary capillary hemangiomatosis — Group 1' (1 prime); contraindicates many PAH therapies (pulmonary edema)"),
                KeyValueRow(key: "Treatment", value: "PAH-specific therapy — ERAs (bosentan, ambrisentan, macitentan), PDE5 inhibitors (sildenafil, tadalafil), sGC stimulator (riociguat), prostacyclin pathway (treprostinil, epoprostenol, selexipag); combination therapy common; lung transplant for advanced")
            ]),
            .keyValueTable(title: "Group 2 — PH due to left heart disease", [
                KeyValueRow(key: "Mechanism", value: "Post-capillary PH from elevated LA pressure backing up; PCWP >15; \"isolated\" or with combined pre + post capillary component (Cpc-PH)"),
                KeyValueRow(key: "Causes", value: "HFpEF (heart failure preserved EF), HFrEF (reduced EF), valvular heart disease (mitral stenosis, aortic stenosis, mitral regurgitation), congenital LV obstruction"),
                KeyValueRow(key: "Treatment", value: "Optimize LEFT HEART therapy (diuresis, vasodilators, valve intervention); do NOT use PAH-specific therapies — paradoxically WORSEN (pulmonary edema risk)"),
                KeyValueRow(key: "Distinguishing", value: "Right heart cath shows PCWP >15; echo + LV function + valves + diastolic function essential")
            ]),
            .keyValueTable(title: "Group 3 — PH due to lung disease + hypoxia", [
                KeyValueRow(key: "Mechanism", value: "Pre-capillary PH from chronic hypoxemia + vascular remodeling"),
                KeyValueRow(key: "Causes", value: "COPD (most common in this group), interstitial lung disease (IPF, NSIP, sarcoidosis, etc.), combined pulmonary fibrosis + emphysema, sleep apnea, high-altitude, chest wall disease, neuromuscular disease"),
                KeyValueRow(key: "Treatment", value: "OPTIMIZE UNDERLYING LUNG DISEASE — bronchodilators, oxygen (LTOT), antifibrotics, CPAP for OSA; DO NOT use PAH therapies routinely (no benefit + may worsen V/Q matching)"),
                KeyValueRow(key: "Trial", value: "AMBITION + others — sildenafil + tadalafil failed in COPD-PH; some research ongoing for severe Group 3 with PAH features")
            ]),
            .keyValueTable(title: "Group 4 — Chronic thromboembolic PH (CTEPH)", [
                KeyValueRow(key: "Mechanism", value: "Persistent thromboembolic obstruction of pulmonary arteries after acute PE; ~2-4% of PE patients develop CTEPH"),
                KeyValueRow(key: "Diagnosis", value: "V/Q SCAN (mismatched perfusion defects) — gold standard screen; CTPA / pulmonary angiography for confirmation + operability"),
                KeyValueRow(key: "Treatment", value: "POTENTIALLY CURATIVE — pulmonary endarterectomy (PEA) for operable proximal disease at expert centers; lifelong anticoagulation; RIOCIGUAT (Adempas) — only FDA-approved medical therapy for inoperable / persistent post-PEA; BALLOON PULMONARY ANGIOPLASTY (BPA) for inoperable"),
                KeyValueRow(key: "Outcomes", value: "PEA — 5-year survival >80% in operable; medical therapy for inoperable improves QOL")
            ]),
            .keyValueTable(title: "Group 5 — PH due to unclear/multifactorial mechanisms", [
                KeyValueRow(key: "Categories", value: "Hematologic (chronic hemolytic anemia, sickle cell, thalassemia, myeloproliferative); Systemic (sarcoidosis, pulmonary Langerhans cell histiocytosis, neurofibromatosis); Metabolic (Gaucher, glycogen storage); Misc (chronic kidney disease on hemodialysis, fibrosing mediastinitis, tumor obstruction)"),
                KeyValueRow(key: "Treatment", value: "Treat underlying disease; PAH-specific therapy rarely beneficial; selected exceptions per expert center evaluation")
            ]),
            .bullets(title: "Diagnostic approach", [
                AttributedBullet("ECHOCARDIOGRAM — screen with estimated PASP + RV function; not diagnostic but suggests PH.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("RIGHT HEART CATHETERIZATION — DEFINITIVE diagnosis + classifies pre vs post capillary PH; mPAP ≥20 + PCWP + PVR + vasoreactivity.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("V/Q SCAN — screen for CTEPH (Group 4) in any patient with unexplained PH; critical not to miss.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("WORKUP for Group 1 — autoimmune (ANA, anti-centromere, Scl-70), HIV, hepatitis (portal HTN), congenital heart disease imaging, family history.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("LUNG DISEASE workup — PFTs + HRCT + sleep study if Group 3 suspected.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("PH expert center referral — early consultation; complex management.", citationIDs: ["specialty_pr_round28"])
            ]),
            .bullets(title: "Treatment principles", [
                AttributedBullet("ACCURATE classification → treatment strategy; misclassification can harm.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Group 1 PAH — PAH-specific therapies; combination + escalation; lung transplant.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Group 2 — LEFT HEART optimization; AVOID PAH therapies.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Group 3 — UNDERLYING LUNG DISEASE optimization; oxygen; PAH therapies rare exception.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Group 4 CTEPH — PEA potentially curative; riociguat + BPA inoperable; lifelong anticoagulation.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Group 5 — treat underlying disease.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Right heart support — diuretics, oxygen, cautious vasodilation; transplant for advanced.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Multidisciplinary care — pulmonary, cardiology, rheumatology, ID, transplant.", citationIDs: ["specialty_pr_round28"])
            ])
        ],
        citations: [openrnPRR28, cdcPRR28, specialtyPRR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ILDClassificationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ild-classification",
        title: "Interstitial lung disease (ILD) classification",
        subtitle: "ATS/ERS classification · idiopathic interstitial pneumonias + autoimmune-ILD + exposure + sarcoidosis · UIP vs NSIP patterns · MDD diagnosis",
        eyebrow: "REFERENCE · PULMONARY",
        nclexTags: refTagsR28,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Interstitial lung diseases (ILDs) are a heterogeneous group of disorders involving the lung interstitium + alveoli. Classification organizes by etiology + pattern. Multidisciplinary discussion (MDD — pulmonologist + radiologist + pathologist) is gold standard for diagnosis. Treatment varies dramatically — antifibrotics for IPF + progressive fibrotic; immunosuppression for autoimmune + cellular patterns per primary source.",
                citationIDs: ["specialty_pr_round28"]
            )),
            .keyValueTable(title: "Idiopathic interstitial pneumonias (IIPs)", [
                KeyValueRow(key: "IPF (idiopathic pulmonary fibrosis)", value: "UIP pattern on HRCT — subpleural + basal honeycombing + reticulation + traction bronchiectasis; antifibrotics (pirfenidone, nintedanib); median survival 3-5 years; transplant for eligible"),
                KeyValueRow(key: "NSIP (nonspecific interstitial pneumonia)", value: "Homogeneous ground-glass + reticulation + traction bronchiectasis; CTD-NSIP common; cellular vs fibrotic subtypes; immunosuppression often effective; better prognosis than IPF"),
                KeyValueRow(key: "COP (cryptogenic organizing pneumonia)", value: "Patchy consolidation + organizing pneumonia pattern; STEROIDS very responsive; relapses common"),
                KeyValueRow(key: "AIP (acute interstitial pneumonia)", value: "Hamman-Rich syndrome — rapidly progressive ARDS-like; histologic DAD; poor prognosis"),
                KeyValueRow(key: "DIP / RBILD (smoking-related)", value: "Desquamative interstitial pneumonia + respiratory bronchiolitis ILD — smoking-related; cessation often improves"),
                KeyValueRow(key: "LIP (lymphocytic interstitial pneumonia)", value: "Associated with Sjögren, autoimmune, HIV; rare"),
                KeyValueRow(key: "PPFE (pleuroparenchymal fibroelastosis)", value: "Pleural + subpleural upper-lobe fibrosis; rare")
            ]),
            .keyValueTable(title: "Autoimmune-ILD / CTD-ILD", [
                KeyValueRow(key: "Scleroderma-ILD", value: "Most common CTD-ILD; NSIP > UIP pattern; mycophenolate mofetil + tocilizumab + nintedanib"),
                KeyValueRow(key: "RA-ILD", value: "UIP > NSIP; cigarette smoking + RF + anti-CCP + male; methotrexate controversial"),
                KeyValueRow(key: "Dermatomyositis / polymyositis", value: "NSIP + COP; anti-Jo-1 antisynthetase syndrome (mechanic hands + arthritis + ILD); MDA5 antibody — RPILD high mortality"),
                KeyValueRow(key: "Sjögren-ILD", value: "NSIP + LIP + COP"),
                KeyValueRow(key: "MCTD-ILD", value: "Mixed connective tissue disease; NSIP"),
                KeyValueRow(key: "Lupus-ILD", value: "Less common; chronic interstitial pneumonia, acute pneumonitis, alveolar hemorrhage"),
                KeyValueRow(key: "Treatment", value: "Immunosuppression — corticosteroids, mycophenolate, azathioprine, cyclophosphamide; rituximab, tocilizumab in severe; antifibrotics for progressive fibrotic phenotype")
            ]),
            .keyValueTable(title: "Hypersensitivity pneumonitis (HP)", [
                KeyValueRow(key: "Acute / subacute", value: "Recurrent flu-like episodes after exposure; ground-glass + centrilobular nodules + mosaic attenuation; antigen avoidance + steroids; reversible"),
                KeyValueRow(key: "Chronic / fibrotic", value: "Peribronchovascular + upper-lobe fibrosis + air-trapping; may mimic IPF; antigen avoidance + steroids + nintedanib for progressive"),
                KeyValueRow(key: "Common antigens", value: "Birds (bird fancier's lung), molds (farmer's lung, malt worker's lung, hot tub lung, suberosis), chemicals (isocyanates), feathers, animal dander"),
                KeyValueRow(key: "Diagnosis", value: "Exposure history, BAL lymphocytosis (>30% with low CD4:CD8), HRCT, serum-specific IgG (variable utility), biopsy if needed")
            ]),
            .keyValueTable(title: "Occupational / environmental ILDs", [
                KeyValueRow(key: "Silicosis", value: "Mining, sandblasting, engineered stone; upper-lobe rounded nodules; eggshell hilar calcification; PMF; TB + cancer risk"),
                KeyValueRow(key: "Asbestosis", value: "Construction, shipyards, military, insulation; bibasilar fibrosis + pleural plaques; mesothelioma + lung cancer risk; latency 20-40 years"),
                KeyValueRow(key: "Coal workers pneumoconiosis", value: "Coal mining; macules + nodules; PMF; black lung disease"),
                KeyValueRow(key: "Berylliosis", value: "Aerospace, electronics, dental; granulomatous; clinically mimics sarcoid"),
                KeyValueRow(key: "Hard metal disease", value: "Cobalt + tungsten; giant cell interstitial pneumonia"),
                KeyValueRow(key: "Other", value: "Drug-induced (amiodarone, methotrexate, nitrofurantoin, bleomycin, chemotherapy, immunotherapy), radiation pneumonitis")
            ]),
            .keyValueTable(title: "Sarcoidosis", [
                KeyValueRow(key: "Stages I-IV", value: "I = hilar adenopathy only; II = adenopathy + parenchymal; III = parenchymal only; IV = fibrosis"),
                KeyValueRow(key: "Extrapulmonary", value: "Lupus pernio (skin), uveitis (eye), CNS, cardiac, hypercalcemia, Lofgren syndrome (acute self-resolving)"),
                KeyValueRow(key: "Diagnosis", value: "BAL CD4:CD8 elevated >3.5, biopsy non-caseating granulomas (rule out TB + fungal first), elevated serum ACE (not specific)"),
                KeyValueRow(key: "Treatment", value: "STEROIDS first-line for symptomatic; methotrexate, azathioprine, hydroxychloroquine for cutaneous; TNF inhibitors for refractory")
            ]),
            .keyValueTable(title: "Other / cystic / smoking-related", [
                KeyValueRow(key: "Lymphangioleiomyomatosis (LAM)", value: "Premenopausal women; cystic lung disease; tuberous sclerosis complex; sirolimus"),
                KeyValueRow(key: "Pulmonary Langerhans cell histiocytosis (PLCH)", value: "Smoking-related; nodules + cysts upper lobes; smoking cessation"),
                KeyValueRow(key: "Birt-Hogg-Dubé", value: "Hereditary; basal cysts + skin fibrofolliculomas + renal cancers"),
                KeyValueRow(key: "Pulmonary alveolar proteinosis (PAP)", value: "Surfactant accumulation; \"crazy paving\" HRCT; whole lung lavage")
            ]),
            .bullets(title: "Diagnostic approach", [
                AttributedBullet("THOROUGH HISTORY — symptoms timeline, occupational + environmental + drug + family + CTD history.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Examination + PFTs (restrictive) + DLCO + 6MWT + SpO2.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("HRCT chest — PATTERN recognition (UIP vs NSIP vs HP vs sarcoid) guides treatment.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Autoimmune workup — ANA + ENA panel + RF + anti-CCP + myositis panel.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("BAL — cell count + differential; lymphocytic in HP + NSIP + sarcoid.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Biopsy when needed — surgical lung biopsy gold standard; transbronchial less yield; new cryobiopsy.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("MULTIDISCIPLINARY DISCUSSION — gold standard for diagnosis.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Genetic testing — familial ILD, hereditary syndromes.", citationIDs: ["specialty_pr_round28"])
            ]),
            .bullets(title: "Treatment principles", [
                AttributedBullet("ETIOLOGY-DIRECTED treatment — immunosuppression for autoimmune, antigen avoidance for HP, antifibrotics for IPF + progressive fibrotic.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("ANTIFIBROTICS (pirfenidone, nintedanib) — IPF; nintedanib also for chronic fibrosing ILD with progressive phenotype.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Immunosuppression — steroids, mycophenolate, azathioprine, cyclophosphamide, rituximab, tocilizumab.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Oxygen therapy, pulmonary rehab, vaccinations, smoking cessation, GERD treatment, mental health.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("LUNG TRANSPLANT — early referral for IPF + selected progressive ILDs.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("PALLIATIVE CARE — early integration, advance care planning, dyspnea management with opioids.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Patient support — Pulmonary Fibrosis Foundation, ATS, ALA resources.", citationIDs: ["specialty_pr_round28"])
            ])
        ],
        citations: [openrnPRR28, cdcPRR28, specialtyPRR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AsthmaStepwiseTherapySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "asthma-step-therapy",
        title: "Asthma stepwise therapy (GINA 2026)",
        subtitle: "Treatment ladder · steps 1-5 · ICS-formoterol SMART · biologic add-on severe · adolescent + adult similar; pediatric distinct",
        eyebrow: "REFERENCE · PULMONARY",
        nclexTags: refTagsR28,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Global Initiative for Asthma (GINA) 2026 step therapy — evidence-based stepwise approach to asthma control. STEP UP for inadequate control; STEP DOWN once control achieved + maintained. Key principle — inhaled corticosteroid (ICS) is foundation; ICS-formoterol (SMART therapy) for as-needed + maintenance is preferred for most adolescent + adults per primary source.",
                citationIDs: ["specialty_pr_round28"]
            )),
            .keyValueTable(title: "GINA 2026 — Tracks 1 + 2 (adolescent + adult)", [
                KeyValueRow(key: "Track 1 (PREFERRED)", value: "ICS-formoterol as needed (steps 1-2) → ICS-formoterol maintenance + as-needed reliever (\"SMART\" / \"MART\") steps 3-5; reduces exacerbations + simpler"),
                KeyValueRow(key: "Track 2 (ALTERNATIVE)", value: "ICS daily + SABA (albuterol) PRN reliever; older paradigm but still effective; if poor adherence to daily ICS")
            ]),
            .keyValueTable(title: "Step 1 (mild infrequent symptoms)", [
                KeyValueRow(key: "Track 1 PREFERRED", value: "Low-dose ICS-formoterol AS NEEDED (e.g., budesonide-formoterol 1 puff PRN); maximum 12 inhalations / day"),
                KeyValueRow(key: "Track 2", value: "Albuterol PRN + consider low-dose ICS PRN (ICS-albuterol fixed-combination FDA-approved)")
            ]),
            .keyValueTable(title: "Step 2 (regular symptoms)", [
                KeyValueRow(key: "Track 1 PREFERRED", value: "Low-dose ICS-formoterol PRN as needed (same regimen as Step 1, frequency higher)"),
                KeyValueRow(key: "Track 2", value: "Daily low-dose ICS + albuterol PRN; alternative: low-dose ICS-LABA"),
                KeyValueRow(key: "Equipotent ICS dose", value: "Beclomethasone 200-500 mcg, budesonide 200-400 mcg, fluticasone 100-250 mcg, mometasone 100-200 mcg daily")
            ]),
            .keyValueTable(title: "Step 3 (uncontrolled on low ICS)", [
                KeyValueRow(key: "Track 1 PREFERRED", value: "Low-dose ICS-formoterol MAINTENANCE + as-needed reliever (SMART / MART)"),
                KeyValueRow(key: "Track 2", value: "Low-dose ICS-LABA daily + albuterol PRN; alternative: medium-dose ICS"),
                KeyValueRow(key: "Considerations", value: "Reconsider trigger avoidance, adherence, inhaler technique, comorbidities (rhinitis, GERD, OSA)")
            ]),
            .keyValueTable(title: "Step 4 (uncontrolled despite step 3)", [
                KeyValueRow(key: "Track 1 PREFERRED", value: "Medium-dose ICS-formoterol maintenance + as-needed reliever (SMART)"),
                KeyValueRow(key: "Track 2", value: "Medium-dose ICS-LABA + albuterol PRN; alternative: high-dose ICS or add LAMA (tiotropium)"),
                KeyValueRow(key: "Add LAMA", value: "Tiotropium for poorly controlled despite ICS-LABA; reduces exacerbations")
            ]),
            .keyValueTable(title: "Step 5 (severe persistent)", [
                KeyValueRow(key: "Track 1 PREFERRED", value: "High-dose ICS-formoterol + biologic; consider LAMA add-on; refer specialist"),
                KeyValueRow(key: "BIOLOGICS", value: "Phenotype-guided — OMALIZUMAB (anti-IgE) for allergic, MEPOLIZUMAB / RESLIZUMAB / BENRALIZUMAB (anti-IL5/IL5R) for eosinophilic, DUPILUMAB (anti-IL4Rα) for Type 2-high, TEZEPELUMAB (anti-TSLP) for any phenotype"),
                KeyValueRow(key: "Last-line", value: "Chronic low-dose oral corticosteroids — limited by side effects; minimize duration + dose"),
                KeyValueRow(key: "Bronchial thermoplasty", value: "Selected severe; specialized centers")
            ]),
            .bullets(title: "Key principles", [
                AttributedBullet("ICS is FOUNDATIONAL — all asthma severity ≥intermittent should receive ICS-based therapy.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("ICS-FORMOTEROL AS-NEEDED + maintenance (SMART) — preferred for most adolescent + adult; reduces exacerbations vs SABA-only or fixed-dose ICS-LABA.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("AVOID SABA-only therapy — increased exacerbations + mortality; even mild asthma should have ICS component.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("STEP UP — for uncontrolled (symptoms >2/week, nighttime awakening, reliever use >2 doses/week, exacerbation).", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("STEP DOWN — after 3 months of good control; reduce ICS dose by ~25-50% q3 months.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("BIOLOGICS for STEP 5 — phenotype + biomarker-guided.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("ADHERENCE + INHALER TECHNIQUE — most common reasons for poor control; revisit at every visit.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("TRIGGER AVOIDANCE + comorbidity management (rhinitis, GERD, OSA, obesity).", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("ASTHMA ACTION PLAN — written plan for daily + worsening management; provided to every patient.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("PEDIATRIC differences — distinct GINA steps for <6 years + 6-11 years; LABA limited in <12 years; biologic approvals age-dependent.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Smoking cessation + vaccinations + occupational considerations.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("ASSESS control + future risk every visit — symptoms + reliever use + lung function + exacerbations + comorbidities.", citationIDs: ["specialty_pr_round28"])
            ])
        ],
        citations: [openrnPRR28, cdcPRR28, specialtyPRR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CFPulmonaryCareSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cf-pulmonary-care",
        title: "Cystic fibrosis pulmonary care",
        subtitle: "CFTR modulators (Trikafta) transformative · airway clearance daily · inhaled nebs · antibiotics · CFF guidelines · multidisciplinary",
        eyebrow: "REFERENCE · PULMONARY",
        nclexTags: refTagsR28,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Cystic fibrosis (CF) — autosomal recessive disease from CFTR gene mutations affecting chloride + bicarbonate transport → thick mucus + multisystem disease. CFTR modulators (especially Trikafta — elexacaftor/tezacaftor/ivacaftor) revolutionized care for ~80%+ of patients with F508del. Foundation therapies — airway clearance, hypertonic saline, dornase alfa, inhaled antibiotics, vaccinations, nutrition, pancreatic enzymes, multidisciplinary care at CF center per primary source.",
                citationIDs: ["specialty_pr_round28"]
            )),
            .keyValueTable(title: "Foundation respiratory therapies", [
                KeyValueRow(key: "Airway clearance therapy (daily)", value: "HFCWO (vest), Acapella / Flutter (oscillatory PEP), autogenic drainage, postural drainage + percussion; 2-4 times daily; lifelong"),
                KeyValueRow(key: "Bronchodilator", value: "Albuterol nebulizer pre-airway clearance + inhaled medications"),
                KeyValueRow(key: "Hypertonic saline 7%", value: "Nebulized 4 mL BID; mucus mobilizer; albuterol pre-treatment for bronchoconstriction"),
                KeyValueRow(key: "Dornase alfa (Pulmozyme)", value: "Nebulized 2.5 mg daily; cleaves neutrophil DNA in CF sputum; CF-specific"),
                KeyValueRow(key: "Inhaled antibiotics (chronic Pseudomonas)", value: "Tobramycin (Tobi, Bethkis) — 300 mg nebulized BID alternating 28-day on/off OR colistin OR aztreonam (Cayston) 75 mg TID alternating"),
                KeyValueRow(key: "Azithromycin", value: "Chronic 250-500 mg PO MWF — anti-inflammatory; reduces exacerbations; QTc monitoring + NTM exclusion"),
                KeyValueRow(key: "Ivacaftor / lumacaftor-ivacaftor", value: "Earlier CFTR modulators; specific mutations; partially replaced by Trikafta")
            ]),
            .keyValueTable(title: "CFTR modulators (transformative)", [
                KeyValueRow(key: "Trikafta / Kaftrio (elexacaftor/tezacaftor/ivacaftor)", value: "≥80% of CF patients with ≥1 F508del or responsive mutation; ages ≥2 years; PO daily + evening ivacaftor; FEV1 improvement ~10-15%; exacerbations ↓~70%; transformative outcomes per primary source"),
                KeyValueRow(key: "Symdeko (tezacaftor/ivacaftor)", value: "Homozygous F508del or specific responsive mutations; older patients on this often switched to Trikafta"),
                KeyValueRow(key: "Kalydeco (ivacaftor)", value: "Gating mutations (G551D, others); ≥6 months age; CFTR potentiator monotherapy"),
                KeyValueRow(key: "Monitoring", value: "LFTs baseline + monthly × 3 months → q3 months; pediatric annual eye exams (cataracts); drug interactions extensive (CYP3A)")
            ]),
            .keyValueTable(title: "Acute exacerbation management", [
                KeyValueRow(key: "Definition", value: "Increased symptoms — cough, sputum, dyspnea, weight loss, hemoptysis, declined FEV1"),
                KeyValueRow(key: "IV antibiotics", value: "2-week courses; coverage based on prior cultures — anti-Pseudomonal (piperacillin-tazobactam, ceftazidime, cefepime, meropenem) + tobramycin / colistin + anti-MRSA (vancomycin, linezolid) as needed"),
                KeyValueRow(key: "Increased airway clearance", value: "Q4 hours; aggressive secretions"),
                KeyValueRow(key: "Nutrition support", value: "High calorie + protein; enteral / parenteral if needed"),
                KeyValueRow(key: "Hospitalization", value: "Frequent in advanced disease; 2-week PICC line courses common")
            ]),
            .keyValueTable(title: "Microbiology + chronic colonization", [
                KeyValueRow(key: "Pseudomonas aeruginosa", value: "Most common chronic colonizer; ERADICATION on first isolation — oral cipro + inhaled tobramycin × 2-3 months; chronic suppressive inhaled antibiotics"),
                KeyValueRow(key: "MRSA", value: "Increasingly common; sputum surveillance; clindamycin + linezolid + vancomycin for exacerbation"),
                KeyValueRow(key: "Burkholderia cepacia complex", value: "Difficult, multi-resistant; transplant candidacy implications; isolation"),
                KeyValueRow(key: "Stenotrophomonas / Achromobacter", value: "Multi-resistant; difficult; TMP-SMX + tetracyclines + other"),
                KeyValueRow(key: "Nontuberculous mycobacteria (NTM)", value: "Mycobacterium abscessus, M. avium complex; chronic + difficult; multi-drug regimens × 18+ months; exclude before chronic azithromycin"),
                KeyValueRow(key: "Aspergillus", value: "ABPA — IgE elevation + bronchiectasis; itraconazole + steroids")
            ]),
            .keyValueTable(title: "Extrapulmonary CF management", [
                KeyValueRow(key: "Pancreatic insufficiency", value: "Pancreatic enzyme replacement (Creon, Zenpep, Pancreaze) with all meals + snacks; ADEK fat-soluble vitamins"),
                KeyValueRow(key: "CF-related diabetes (CFRD)", value: "Increases in adolescence + adulthood; insulin therapy; annual screening with OGTT from age 10"),
                KeyValueRow(key: "Hepatobiliary", value: "Cholestasis, cirrhosis (~5% of adults); ursodiol; HCC surveillance"),
                KeyValueRow(key: "GI", value: "Distal intestinal obstruction syndrome (DIOS), GERD, constipation; oral / NG balanced lavage (polyethylene glycol) for DIOS"),
                KeyValueRow(key: "Fertility", value: "Males >97% infertile (CBAVD); females reduced; assisted reproduction"),
                KeyValueRow(key: "Bone health", value: "Low bone density common; DEXA q1-3 years; vitamin D + calcium + bisphosphonates"),
                KeyValueRow(key: "Mental health", value: "Depression + anxiety increased; routine screening + treatment")
            ]),
            .bullets(title: "Care delivery + outcomes", [
                AttributedBullet("CF CENTER specialty care — multidisciplinary team (pulmonologist + RT + dietitian + social work + nurse coordinator + psychologist); accredited centers.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("INFECTION CONTROL — segregation of patients; no patient-patient contact; cohort by organisms.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("CFTR MUTATION TESTING — establish genotype + modulator eligibility.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("VACCINATIONS — flu, pneumococcal, COVID, pertussis, hepatitis A/B; up-to-date.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("PSYCHOSOCIAL — transition pediatric to adult care; chronic illness management; mental health.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("LUNG TRANSPLANT — for advanced disease (FEV1 <30%, hypercapnia, frequent exacerbations); referral early; bilateral preferred.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("LIFE EXPECTANCY transformation — median predicted survival 50+ years now (vs 30s 2 decades ago) due to modulators + comprehensive care.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("PREGNANCY — increasingly common; CF center coordination; Trikafta + airway clearance + nutrition.", citationIDs: ["specialty_pr_round28"]),
                AttributedBullet("Cystic Fibrosis Foundation — patient resources, accredited centers, research, advocacy.", citationIDs: ["specialty_pr_round28"])
            ])
        ],
        citations: [openrnPRR28, cdcPRR28, specialtyPRR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}
