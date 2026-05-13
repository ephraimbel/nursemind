import Foundation

// Curator-model drug entries (round 25 — pediatric specialty + CF + congenital).

private let openfdaR25 = CitationSource(
    id: "openfda_round25",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-05-13"
)
private let openrnPharmR25 = CitationSource(
    id: "openrn_pharm_round25",
    shortName: "Open RN Pharmacology + Pediatrics",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-13"
)
private let cdcR25 = CitationSource(
    id: "cdc_round25",
    shortName: "CDC + AAP + CF Foundation concept citations",
    publisher: "CDC · AAP · CFF",
    license: .factCitationOnly,
    url: "https://www.aap.org/en/practice-management/care-delivery-approaches/",
    lastRetrieved: "2026-05-13"
)
private let specialtyR25 = CitationSource(
    id: "specialty_round25",
    shortName: "AAP + CFF + AAOS + AAN pediatric concept citations",
    publisher: "AAP · CFF · AAOS · AAN",
    license: .factCitationOnly,
    url: "https://www.cff.org/medical-professionals/clinical-care-guidelines",
    lastRetrieved: "2026-05-13"
)

public enum CaffeineCitrateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "caffeine-citrate",
        title: "Caffeine citrate (Cafcit)",
        subtitle: "Methylxanthine for apnea of prematurity · NICU first-line · loading + maintenance · long T1/2 in neonates · monitor levels",
        category: "Methylxanthine respiratory stimulant (neonatal)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Methylxanthine — central + peripheral nervous system stimulant + respiratory stimulant"),
            KeyValueRow(key: "Use", value: "Apnea of prematurity (FDA-approved) — preterm infants 28-33 weeks gestation"),
            KeyValueRow(key: "Loading", value: "20 mg/kg IV/PO once"),
            KeyValueRow(key: "Maintenance", value: "5-10 mg/kg/day IV/PO daily, starting 24 hrs after loading"),
            KeyValueRow(key: "Watch", value: "Tachycardia, feeding intolerance, jitteriness; long T1/2 in neonates (~100 hrs); levels usually NOT monitored at standard dose")
        ],
        indications: AttributedProse(
            "Short-term treatment of apnea of prematurity in infants 28-33 weeks gestational age. Reduces apnea + bradycardia events + need for mechanical ventilation; CAP trial showed reduced bronchopulmonary dysplasia + improved long-term neurodevelopmental outcomes per primary source.",
            citationIDs: ["specialty_round25", "openfda_round25"]
        ),
        mechanism: AttributedProse(
            "Methylxanthine — adenosine receptor antagonist + phosphodiesterase inhibitor → CNS stimulation, increased respiratory drive, increased diaphragmatic contractility, bronchodilation. Long T1/2 in neonates (~100 hrs) due to immature hepatic metabolism — once daily dosing.",
            citationIDs: ["openfda_round25"]
        ),
        dosing: [
            DosingBlock(label: "Loading dose", body: "20 mg/kg caffeine citrate IV (over 30 min) OR PO once per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Maintenance dose", body: "5-10 mg/kg/day caffeine citrate IV (over 10 min) OR PO once daily, starting 24 hours after loading per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Caffeine base equivalence", body: "Caffeine citrate 2 mg = caffeine base 1 mg (50% conversion); orders should specify whether citrate or base.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Duration", body: "Typically continued until 32-34 weeks postmenstrual age + 5-7 days apnea-free per primary source.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Renal / hepatic adjustment", body: "Severe impairment — extended dosing intervals; consider levels.", citationIDs: ["openfda_round25"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — seizure disorder, cardiovascular instability, severe NEC (necrotizing enterocolitis), feeding intolerance. Other apnea causes (sepsis, anemia, intracranial hemorrhage, GERD, metabolic) should be ruled out / treated per primary source.",
            citationIDs: ["openfda_round25"]
        ),
        warnings: [
            AttributedBullet("DIFFERENTIATE caffeine citrate vs caffeine base — 2:1 ratio; orders + labels must specify; medication errors common per primary source.", citationIDs: ["openfda_round25"]),
            AttributedBullet("FEEDING INTOLERANCE — gastric distention, residuals; assess + temporarily hold if NEC suspected.", citationIDs: ["openfda_round25"]),
            AttributedBullet("TACHYCARDIA — common; usually well-tolerated; HOLD if HR >180 sustained.", citationIDs: ["openfda_round25"]),
            AttributedBullet("JITTERINESS / restlessness — common; reduce dose if severe.", citationIDs: ["openfda_round25"]),
            AttributedBullet("HYPERGLYCEMIA — possible; monitor glucose.", citationIDs: ["openfda_round25"]),
            AttributedBullet("NEC — caution; some evidence of association; balance benefit-risk in high-risk preterm.", citationIDs: ["specialty_round25"]),
            AttributedBullet("LEVELS — typically NOT routinely monitored at standard 5-10 mg/kg/day; consider if toxicity suspected (target 5-25 mcg/mL).", citationIDs: ["specialty_round25"]),
            AttributedBullet("DISCONTINUATION — typically at 32-34 weeks postmenstrual age; observe for return of apnea × 5-7 days.", citationIDs: ["specialty_round25"])
        ],
        adverseReactions: AttributedProse(
            "Tachycardia, feeding intolerance, gastric residuals, jitteriness, restlessness, hyperglycemia, irritability; rare seizures, NEC, intracranial hemorrhage, dysrhythmia.",
            citationIDs: ["openfda_round25"]
        ),
        drugInteractions: [
            AttributedBullet("Theophylline / aminophylline — additive methylxanthine effects.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Phenobarbital, phenytoin — induce caffeine metabolism; may need higher doses.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Cimetidine, fluconazole — inhibit caffeine metabolism; reduce dose / monitor.", citationIDs: ["openfda_round25"])
        ],
        nursingImplications: [
            AttributedBullet("VERIFY caffeine CITRATE vs BASE in orders — 2:1 ratio; medication error risk; double-check with second nurse.", citationIDs: ["specialty_round25"]),
            AttributedBullet("MONITOR — apnea + bradycardia events, HR (hold if >180), feeding tolerance, glucose, jitteriness, NEC signs.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ASSESS for OTHER causes of apnea — sepsis (CBC, blood culture), anemia (Hgb), GERD, hypoglycemia, ICH, seizures, electrolyte imbalances.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ONCE DAILY dosing; long T1/2 in neonates means stable levels achieved over days.", citationIDs: ["openfda_round25"]),
            AttributedBullet("DISCONTINUE typically at 32-34 weeks postmenstrual age; observe × 5-7 days for apnea recurrence before discharge.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PARENT EDUCATION on apnea + when to call before discharge.", citationIDs: ["specialty_round25"]),
            AttributedBullet("CAP TRIAL outcomes — long-term neurodevelopmental benefit; counsel families.", citationIDs: ["specialty_round25"])
        ],
        patientTeaching: AttributedProse(
            "(Parents) — This is caffeine, used to help your premature baby breathe regularly + reduce pauses in breathing. We give it once daily. Tell us if your baby seems jittery, has trouble feeding, or you notice color changes or breathing pauses. Most babies stop needing it by about 34 weeks of age.",
            citationIDs: ["openrn_pharm_round25"]
        ),
        citations: [openfdaR25, openrnPharmR25, cdcR25, specialtyR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DornaseAlfaSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "dornase-alfa",
        title: "Dornase alfa (Pulmozyme)",
        subtitle: "Recombinant DNase · CF mucolytic · cleaves DNA in CF mucus · once-daily nebulizer · improves PFTs + reduces exacerbations",
        category: "Recombinant human DNase (mucolytic) — CF",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant human deoxyribonuclease (DNase I)"),
            KeyValueRow(key: "Use", value: "Cystic fibrosis (FDA-approved age ≥6 years; off-label younger); reduces sputum viscosity + improves lung function"),
            KeyValueRow(key: "Dose", value: "2.5 mg via nebulizer once daily (BID for selected patients)"),
            KeyValueRow(key: "Watch", value: "Voice changes, pharyngitis, mild chest pain; expensive; lifelong therapy in CF"),
            KeyValueRow(key: "Standard CF therapy", value: "Combine with hypertonic saline + chest physiotherapy + CFTR modulators if eligible")
        ],
        indications: AttributedProse(
            "Cystic fibrosis lung disease (FDA-approved age ≥6 years) — improves FEV1 + reduces respiratory infection / exacerbations. Cleaves extracellular DNA in CF mucus (released from neutrophils) → reduced viscosity + improved mucociliary clearance per primary source.",
            citationIDs: ["specialty_round25", "openfda_round25"]
        ),
        mechanism: AttributedProse(
            "Recombinant human DNase I — selectively cleaves extracellular DNA released from degraded neutrophils that accumulates in CF mucus, contributing to mucus thickness + obstruction. Reduces sputum viscoelasticity + improves clearance + airway function.",
            citationIDs: ["openfda_round25"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "2.5 mg via nebulizer once daily (jet nebulizer with face mask or mouthpiece) per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "BID dosing", body: "Some patients with severe disease may benefit from 2.5 mg BID — provider discretion.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Pediatric (off-label <6 years)", body: "Same 2.5 mg dose; safety + efficacy data emerging.", citationIDs: ["specialty_round25"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to dornase alfa or Chinese hamster ovary cell products. No major contraindications otherwise; CF-specific therapy.",
            citationIDs: ["openfda_round25"]
        ),
        warnings: [
            AttributedBullet("VOICE CHANGES (hoarseness) — most common; usually mild + resolves.", citationIDs: ["openfda_round25"]),
            AttributedBullet("PHARYNGITIS, laryngitis, throat irritation — common.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Mild CHEST PAIN, conjunctivitis, rash — possible.", citationIDs: ["openfda_round25"]),
            AttributedBullet("ALLERGIC reactions — rare; discontinue if severe.", citationIDs: ["openfda_round25"]),
            AttributedBullet("INHALE during normal tidal breathing — face mask or mouthpiece; nebulizer with appropriate output.", citationIDs: ["openfda_round25"]),
            AttributedBullet("STORE in refrigerator; protect from light; once-daily room temp during use.", citationIDs: ["openfda_round25"])
        ],
        adverseReactions: AttributedProse(
            "Voice changes (hoarseness), pharyngitis, laryngitis, rhinitis, chest pain, rash, conjunctivitis, fever, dyspepsia.",
            citationIDs: ["openfda_round25"]
        ),
        drugInteractions: [
            AttributedBullet("No significant drug interactions reported.", citationIDs: ["openfda_round25"]),
            AttributedBullet("CF airway clearance regimen — combine with hypertonic saline, inhaled antibiotics (tobramycin, aztreonam), bronchodilators, CFTR modulators per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("Order matters — bronchodilator → hypertonic saline → dornase alfa → inhaled antibiotics → chest physiotherapy.", citationIDs: ["specialty_round25"])
        ],
        nursingImplications: [
            AttributedBullet("ADMINISTER in CF airway clearance order — bronchodilator first, then hypertonic saline, then dornase alfa, then airway clearance, then inhaled antibiotics.", citationIDs: ["specialty_round25"]),
            AttributedBullet("USE jet nebulizer with appropriate output; tidal breathing; mouthpiece preferred over face mask in older children + adults.", citationIDs: ["specialty_round25"]),
            AttributedBullet("STORE in refrigerator (2-8°C); protect from light; warm to room temperature briefly before use.", citationIDs: ["openfda_round25"]),
            AttributedBullet("MONITOR — FEV1 trend, exacerbation frequency, voice changes, adherence.", citationIDs: ["specialty_round25"]),
            AttributedBullet("CF MULTIDISCIPLINARY care — CF center follow-up regularly; coordinate with respiratory therapy + dietitian + social work.", citationIDs: ["specialty_round25"]),
            AttributedBullet("EXPENSIVE — insurance authorization + assistance programs; address adherence barriers.", citationIDs: ["specialty_round25"]),
            AttributedBullet("CFTR MODULATORS (ivacaftor, lumacaftor-ivacaftor, tezacaftor combos, elexacaftor-tezacaftor-ivacaftor) — newer disease-modifying therapy; eligibility based on CFTR mutation; transformed CF management.", citationIDs: ["specialty_round25"])
        ],
        patientTeaching: AttributedProse(
            "Use this nebulizer once daily (or twice if prescribed). Take it after your bronchodilator + hypertonic saline, before your antibiotic neb + chest therapy. Some hoarseness is normal. Keep it in the refrigerator. This medicine helps thin the mucus + makes it easier to clear. You'll need this every day to maintain lung function.",
            citationIDs: ["openrn_pharm_round25"]
        ),
        citations: [openfdaR25, openrnPharmR25, cdcR25, specialtyR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum RacemicEpinephrineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "racemic-epinephrine",
        title: "Racemic epinephrine (nebulized)",
        subtitle: "Croup + post-extubation stridor · α-mediated mucosal vasoconstriction · OBSERVE 3-4h post-dose · rebound effect",
        category: "Nebulized α + β adrenergic agonist (croup-specific)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Mixture of D + L isomers of epinephrine; nebulized for upper airway"),
            KeyValueRow(key: "Use", value: "Moderate-severe croup (laryngotracheobronchitis); post-extubation stridor; bronchiolitis (limited evidence)"),
            KeyValueRow(key: "Dose", value: "0.5 mL of 2.25% racemic epinephrine in 3 mL NS via nebulizer; OR L-epinephrine 5 mL of 1:1000 (5 mg) nebulized"),
            KeyValueRow(key: "Watch", value: "OBSERVE ≥3-4 hours post-dose for rebound (\"rebound\" largely myth — based on initial concern); dexamethasone PO/IM concurrent")
        ],
        indications: AttributedProse(
            "Moderate-severe croup (Westley score ≥3) — racemic OR L-epinephrine equally effective; post-extubation stridor; severe upper airway edema. NOT effective for asthma / lower airway disease (use albuterol) per primary source.",
            citationIDs: ["specialty_round25", "openfda_round25"]
        ),
        mechanism: AttributedProse(
            "α-adrenergic agonist → vasoconstriction of subglottic mucosal vessels → reduced mucosal edema → improved airway diameter. β2 effects also bronchodilator. Onset within 10 min; duration 1-2 hours.",
            citationIDs: ["openfda_round25"]
        ),
        dosing: [
            DosingBlock(label: "Racemic epinephrine 2.25%", body: "0.5 mL diluted in 3 mL NS via nebulizer per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "L-epinephrine 1:1000 (1 mg/mL)", body: "5 mL undiluted via nebulizer (5 mg) per primary source — equally effective as racemic + cheaper.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "May repeat", body: "Q15-30 min × 2-3 doses for severe; rare to need more than 2 doses.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Pediatric weight-based", body: "Same dosing for all pediatric ages; not weight-adjusted.", citationIDs: ["specialty_round25"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — severe HTN, hyperthyroidism, tachydysrhythmias, halogenated anesthetic use; relative contraindication TOF physiology (hypoxic spell risk from peripheral vasodilation).",
            citationIDs: ["openfda_round25"]
        ),
        warnings: [
            AttributedBullet("OBSERVE ≥3-4 HOURS post-dose — historic concern for \"rebound\" worsening as effect wears off; modern data shows safe discharge after 3-4 hrs of stable observation per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("CONCURRENT DEXAMETHASONE — give 0.6 mg/kg PO/IM (max 16 mg) for ALL moderate-severe croup; reduces need for repeat epinephrine + admission per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("TACHYCARDIA — common; usually transient + tolerated.", citationIDs: ["openfda_round25"]),
            AttributedBullet("PALLOR + tremor + agitation — α-stimulation; transient.", citationIDs: ["openfda_round25"]),
            AttributedBullet("ARRHYTHMIA risk in patients with cardiac disease.", citationIDs: ["openfda_round25"]),
            AttributedBullet("BRONCHIOLITIS — limited evidence; AAP recommends against routine use; reserve for severe.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ADMIT criteria — persistent symptoms after 2-3 doses, accessory muscle use, hypoxia, dehydration, prior admission for croup, age <6 months, social concerns.", citationIDs: ["specialty_round25"])
        ],
        adverseReactions: AttributedProse(
            "Tachycardia, palpitations, pallor, tremor, agitation, hypertension, arrhythmias (rare), local airway irritation.",
            citationIDs: ["openfda_round25"]
        ),
        drugInteractions: [
            AttributedBullet("Halogenated anesthetics — sensitize myocardium to arrhythmia; caution.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Beta-blockers — block β2 + leave unopposed α; minimal effect with nebulized.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Concurrent dexamethasone — synergistic for croup management.", citationIDs: ["specialty_round25"])
        ],
        nursingImplications: [
            AttributedBullet("ASSESS croup severity (Westley score) — mild = dexamethasone alone; moderate-severe = dexamethasone + nebulized epinephrine per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ADMINISTER concurrent DEXAMETHASONE 0.6 mg/kg PO/IM (max 16 mg) — onset 1-6 hrs; reduces severity + repeat doses + admission.", citationIDs: ["specialty_round25"]),
            AttributedBullet("MONITOR — vital signs, work of breathing, stridor at rest, oxygen saturation, mental status during nebulization + 3-4 hrs after.", citationIDs: ["specialty_round25"]),
            AttributedBullet("DISCHARGE CRITERIA — stable × 3-4 hrs after epi, no stridor at rest, ambient oxygen saturation maintained, parents able to identify worsening.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PARENT EDUCATION — symptoms may worsen over next 24-48 hrs; cool mist + humidified air; return for stridor at rest, drooling, severe distress.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ADMIT for persistent symptoms despite treatment, dehydration, age <6 months, social concerns.", citationIDs: ["specialty_round25"]),
            AttributedBullet("EPIGLOTTITIS DIFFERENTIAL — abrupt onset, drooling, sitting tripod, toxic appearance, no cough → DO NOT examine throat; airway emergency.", citationIDs: ["specialty_round25"])
        ],
        patientTeaching: AttributedProse(
            "(Parents) — This breathing treatment helps the swelling in your child's airway. After the treatment, we'll watch your child for several hours. Croup symptoms may come back over the next day or two — keep your child comfortable, give cool mist or take outside in cool air. Return immediately if you see stridor (high-pitched noise) when calm, drooling, severe trouble breathing, or your child looks very sick.",
            citationIDs: ["openrn_pharm_round25"]
        ),
        citations: [openfdaR25, openrnPharmR25, cdcR25, specialtyR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SodiumPolystyreneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sodium-polystyrene",
        title: "Sodium polystyrene sulfonate (Kayexalate, SPS)",
        subtitle: "Cation exchange resin · hyperkalemia · ORAL or PR · BOWEL NECROSIS risk especially with sorbitol · NEWER agents preferred",
        category: "Cation exchange resin (potassium binder)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Cation exchange resin — exchanges Na+ for K+ in GI tract"),
            KeyValueRow(key: "Use", value: "Hyperkalemia (NEWER agents preferred — patiromer, sodium zirconium cyclosilicate); Kayexalate older + concerns about bowel necrosis"),
            KeyValueRow(key: "Dose", value: "15-60 g PO/PR; onset slow (1-2 hours oral, 30-60 min rectal); use with sorbitol controversial / risk"),
            KeyValueRow(key: "Watch", value: "BOWEL NECROSIS especially with sorbitol; sodium overload (ESRD); slow onset — NOT for emergency hyperkalemia"),
            KeyValueRow(key: "Note", value: "AGS Beers + many institutions discourage; NEWER PATIROMER (Veltassa) + LOKELMA (sodium zirconium cyclosilicate) preferred")
        ],
        indications: AttributedProse(
            "Hyperkalemia treatment — historically first-line; now considered older with concerning safety profile (bowel necrosis particularly with sorbitol). NEWER potassium binders (patiromer, sodium zirconium cyclosilicate) preferred per primary source.",
            citationIDs: ["specialty_round25", "openfda_round25"]
        ),
        mechanism: AttributedProse(
            "Cation exchange resin in GI tract — binds K+ in exchange for Na+ → K+ excreted in stool. Effect SLOW (hours); not effective for acute life-threatening hyperkalemia (use calcium + insulin/dextrose + albuterol + dialysis).",
            citationIDs: ["openfda_round25"]
        ),
        dosing: [
            DosingBlock(label: "Oral", body: "15-30 g (1-2 packets) PO with water (without sorbitol if possible) q4-6h; onset 1-2 hrs per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Rectal (retention enema)", body: "30-50 g in water suspension; retain 30-60 min; onset 30-60 min; less effective + uncomfortable.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Sorbitol concern", body: "Historically given with sorbitol to prevent constipation; now AVOID sorbitol due to bowel necrosis risk per primary source.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Pediatric", body: "1 g/kg PO/PR; same concerns; specialty.", citationIDs: ["openfda_round25"])
        ],
        contraindications: AttributedProse(
            "OBSTRUCTION OR PERFORATION SUSPECTED; severe constipation; postoperative bowel; neonates with reduced GI motility; hypersensitivity. CAUTION — concurrent sorbitol (bowel necrosis), severe constipation, recent bowel surgery, ileus, hypotension per primary source.",
            citationIDs: ["openfda_round25"]
        ),
        warnings: [
            AttributedBullet("BOWEL NECROSIS — particularly with concurrent sorbitol; can be fatal; FDA warning per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("SLOW ONSET — NOT for acute life-threatening hyperkalemia; use calcium + insulin/dextrose + albuterol + dialysis for emergency.", citationIDs: ["specialty_round25"]),
            AttributedBullet("SODIUM OVERLOAD — ~1.5 g sodium per 15 g dose; problematic in HF, ESRD, edema.", citationIDs: ["openfda_round25"]),
            AttributedBullet("HYPOMAGNESEMIA, hypocalcemia — also exchanged.", citationIDs: ["openfda_round25"]),
            AttributedBullet("CONSTIPATION + IMPACTION — common; combine with safer laxative (NOT sorbitol) per institutional protocol.", citationIDs: ["openfda_round25"]),
            AttributedBullet("DRUG ABSORPTION INTERFERENCE — separate other oral medications by ≥3 hrs (binds many drugs).", citationIDs: ["openfda_round25"]),
            AttributedBullet("AGS BEERS — potentially inappropriate in elderly per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PATIROMER (Veltassa) + SODIUM ZIRCONIUM CYCLOSILICATE (Lokelma) PREFERRED — better safety + efficacy; allow continuation of RAAS inhibitors in chronic kidney + heart failure patients.", citationIDs: ["specialty_round25"])
        ],
        adverseReactions: AttributedProse(
            "Constipation, fecal impaction, anorexia, nausea, vomiting, hypokalemia (with overuse), sodium retention / fluid overload, hypocalcemia, hypomagnesemia, BOWEL NECROSIS (rare but serious).",
            citationIDs: ["openfda_round25"]
        ),
        drugInteractions: [
            AttributedBullet("ANY ORAL MEDICATION — separates by ≥3 hours (binds many drugs reducing absorption).", citationIDs: ["openfda_round25"]),
            AttributedBullet("ANTACIDS (calcium, magnesium-containing) — exchange + reduced K+ removal; metabolic alkalosis.", citationIDs: ["openfda_round25"]),
            AttributedBullet("LITHIUM — increased excretion.", citationIDs: ["openfda_round25"]),
            AttributedBullet("LEVOTHYROXINE, DIGOXIN — reduced absorption.", citationIDs: ["openfda_round25"])
        ],
        nursingImplications: [
            AttributedBullet("CONSIDER NEWER ALTERNATIVES — patiromer 8.4-25.2 g PO daily OR sodium zirconium cyclosilicate (Lokelma) 10 g PO TID × 48h then 10 g daily — better safety per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("AVOID concurrent sorbitol — bowel necrosis risk.", citationIDs: ["specialty_round25"]),
            AttributedBullet("MONITOR — K+ levels, bowel function, bowel sounds, abdominal pain.", citationIDs: ["specialty_round25"]),
            AttributedBullet("HOLD if abdominal distension, severe constipation, ileus suspected.", citationIDs: ["specialty_round25"]),
            AttributedBullet("EMERGENCY HYPERKALEMIA — DON'T use SPS as monotherapy; use calcium + insulin/dextrose + albuterol + dialysis.", citationIDs: ["specialty_round25"]),
            AttributedBullet("SEPARATE other oral medications by ≥3 hours.", citationIDs: ["openfda_round25"]),
            AttributedBullet("ADDRESS underlying cause of hyperkalemia — RAAS inhibitor, K-sparing diuretic, AKI, rhabdo, tumor lysis.", citationIDs: ["specialty_round25"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps remove extra potassium from your body through your stool. It works slowly. Take it apart from your other medicines (3 hours before / after). Tell us about severe stomach pain, bloating, or no bowel movements. There are newer medicines (patiromer, Lokelma) that may be safer for some patients.",
            citationIDs: ["openrn_pharm_round25"]
        ),
        citations: [openfdaR25, openrnPharmR25, cdcR25, specialtyR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CaptoprilSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "captopril",
        title: "Captopril (Capoten)",
        subtitle: "Original ACE inhibitor · short-acting · pediatric HF + HTN · sublingual for HTN urgency · cough + angioedema + hyperkalemia",
        category: "ACE inhibitor (short-acting)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Angiotensin-converting enzyme (ACE) inhibitor — short-acting"),
            KeyValueRow(key: "Use", value: "HTN; HF; post-MI LV dysfunction; diabetic nephropathy; pediatric HF + HTN (often first-line ACE in peds)"),
            KeyValueRow(key: "Dose (adult)", value: "12.5-50 mg PO BID-TID; max 450 mg/day"),
            KeyValueRow(key: "Pediatric", value: "0.05-0.5 mg/kg PO TID (start low + titrate); max 6 mg/kg/day"),
            KeyValueRow(key: "Watch", value: "Cough (5-20%), angioedema (1%, higher in Black patients), hyperkalemia, AKI, fetal toxicity (Cat D 2nd-3rd trimester)"),
            KeyValueRow(key: "Note", value: "TID dosing in adults usually replaced by once-daily long-acting ACEs (lisinopril, ramipril); captopril retained for pediatric HF + sublingual HTN urgency")
        ],
        indications: AttributedProse(
            "Hypertension (chronic + urgency — sublingual); heart failure (HFrEF mortality benefit); post-myocardial infarction LV dysfunction; diabetic nephropathy; pediatric HF + HTN (often first-line ACE in pediatric due to better dose titration with short-acting + liquid formulation) per primary source.",
            citationIDs: ["specialty_round25", "openfda_round25"]
        ),
        mechanism: AttributedProse(
            "Inhibits angiotensin-converting enzyme (ACE) → reduces angiotensin II + aldosterone → vasodilation + reduced afterload + reduced preload + reduced sodium retention. Also reduces breakdown of bradykinin → cough + angioedema (class effect).",
            citationIDs: ["openfda_round25"]
        ),
        dosing: [
            DosingBlock(label: "Adult HTN", body: "Start 25 mg PO BID-TID; titrate to 50-150 mg/day in 2-3 divided doses; max 450 mg/day per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Adult HF", body: "Start 6.25-12.5 mg PO TID; titrate to 25-50 mg PO TID; max 450 mg/day per primary source.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Adult HTN urgency (sublingual)", body: "12.5-25 mg SL — onset 15-30 min, peak 30-90 min; useful when IV not available.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Pediatric HF", body: "Start 0.1-0.3 mg/kg PO TID; titrate to 0.5-2 mg/kg/dose TID; max 6 mg/kg/day per primary source.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Pediatric HTN", body: "Start 0.3-0.5 mg/kg PO TID; titrate to effect.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Renal adjustment", body: "Reduce dose for CrCl <50; severe renal impairment — close monitoring + alternative.", citationIDs: ["openfda_round25"])
        ],
        contraindications: AttributedProse(
            "PREGNANCY (Category D in 2nd-3rd trimester — fetal renal injury, oligohydramnios, lung hypoplasia, growth restriction); bilateral renal artery stenosis; angioedema history with ACE; anuria; aliskiren co-administration in DM; hypersensitivity per primary source.",
            citationIDs: ["openfda_round25"]
        ),
        warnings: [
            AttributedBullet("PREGNANCY — Category D 2nd-3rd trimester; teratogen; reliable contraception; pregnancy testing.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ANGIOEDEMA — life-threatening; airway emergency; STOP ACE permanently; substitute ARB cautiously (lower angioedema rate); higher risk in Black patients per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("HYPERKALEMIA — common in CKD + DM + concurrent K-sparing diuretics; monitor K+.", citationIDs: ["openfda_round25"]),
            AttributedBullet("ACUTE KIDNEY INJURY — especially in volume depletion, bilateral RAS, NSAIDs concurrent; monitor creatinine 1-2 weeks after start.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PERSISTENT DRY COUGH (5-20%) — bradykinin-mediated; switch to ARB if intolerable.", citationIDs: ["specialty_round25"]),
            AttributedBullet("FIRST-DOSE HYPOTENSION — especially in volume depletion, HF, RAS; start low + supine + monitor.", citationIDs: ["specialty_round25"]),
            AttributedBullet("NEUTROPENIA + AGRANULOCYTOSIS — rare; CBC at baseline + periodically (especially renal failure + autoimmune disease).", citationIDs: ["openfda_round25"]),
            AttributedBullet("PROTEINURIA + nephrotic syndrome — rare; monitor.", citationIDs: ["openfda_round25"])
        ],
        adverseReactions: AttributedProse(
            "Cough (very common), hypotension (especially first dose), hyperkalemia, AKI, angioedema, taste disturbance (loss / metallic), rash, neutropenia (rare), agranulocytosis (rare), proteinuria.",
            citationIDs: ["openfda_round25"]
        ),
        drugInteractions: [
            AttributedBullet("POTASSIUM-sparing diuretics (spironolactone, eplerenone, amiloride), potassium supplements — additive hyperkalemia.", citationIDs: ["openfda_round25"]),
            AttributedBullet("NSAIDs — reduced antihypertensive effect + AKI risk.", citationIDs: ["openfda_round25"]),
            AttributedBullet("LITHIUM — increased levels.", citationIDs: ["openfda_round25"]),
            AttributedBullet("ARBs concurrent — additive RAAS blockade; not recommended (ONTARGET trial — increased adverse events).", citationIDs: ["openfda_round25"]),
            AttributedBullet("ALISKIREN — contraindicated in DM (RAAS dual blockade).", citationIDs: ["openfda_round25"]),
            AttributedBullet("ALLOPURINOL — increased hypersensitivity reactions.", citationIDs: ["openfda_round25"])
        ],
        nursingImplications: [
            AttributedBullet("PEDIATRIC PREFERRED ACE inhibitor — short-acting + liquid formulation allow precise titration in HF + HTN.", citationIDs: ["specialty_round25"]),
            AttributedBullet("BASELINE — BP, K+, BUN/Cr, CBC; recheck K+ + Cr 1-2 weeks after start + dose changes.", citationIDs: ["specialty_round25"]),
            AttributedBullet("FIRST-DOSE — supine; monitor BP × 2-4 hrs; counsel orthostatic precautions.", citationIDs: ["openrn_pharm_round25"]),
            AttributedBullet("ANGIOEDEMA — counsel on facial / lip / tongue / throat swelling; emergent if airway involvement; STOP ACE permanently.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PREGNANCY counseling — reliable contraception; do NOT use 2nd-3rd trimester.", citationIDs: ["specialty_round25"]),
            AttributedBullet("AVOID K supplements + K-sparing diuretics unless K+ low.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ADULT use — short-acting TID dosing largely replaced by once-daily lisinopril / ramipril; captopril retained for pediatrics + HTN urgency SL.", citationIDs: ["specialty_round25"])
        ],
        patientTeaching: AttributedProse(
            "Take this on an empty stomach (food reduces absorption). Stand up slowly to prevent dizziness. A dry cough is a common side effect — call us if bothersome. Tell us right away about face / lip / tongue / throat swelling — this is an emergency. Do NOT take if you might be pregnant. Avoid potassium supplements + salt substitutes.",
            citationIDs: ["openrn_pharm_round25"]
        ),
        citations: [openfdaR25, openrnPharmR25, cdcR25, specialtyR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BeclomethasoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "beclomethasone",
        title: "Beclomethasone inhaled (Qvar, Vanceril)",
        subtitle: "ICS for asthma · pediatric maintenance · spacer + RINSE MOUTH after · growth monitoring · daily use ≠ rescue",
        category: "Inhaled corticosteroid (ICS) — asthma controller",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Inhaled corticosteroid (ICS) — anti-inflammatory"),
            KeyValueRow(key: "Use", value: "Maintenance treatment of asthma in adults + children ≥5 years (FDA); first-line for persistent asthma per GINA"),
            KeyValueRow(key: "Dose", value: "Pediatric 40-80 mcg/inhalation BID; adult 40-320 mcg BID; titrate to symptom control"),
            KeyValueRow(key: "Watch", value: "Oral candidiasis (rinse mouth + spit), dysphonia; growth velocity in pediatric (mild + temporary); HPA axis suppression at high doses"),
            KeyValueRow(key: "Crucial", value: "DAILY use for control — NOT for acute attacks (use SABA / albuterol for rescue)")
        ],
        indications: AttributedProse(
            "Maintenance treatment of asthma — first-line for persistent asthma per GINA + NAEPP guidelines per primary source. Daily use prevents exacerbations + improves lung function + reduces airway inflammation. NOT for acute asthma attack — use albuterol (SABA) or budesonide-formoterol (anti-inflammatory reliever).",
            citationIDs: ["specialty_round25", "openfda_round25"]
        ),
        mechanism: AttributedProse(
            "Topical corticosteroid delivered to airways → reduces inflammation, mucus production, airway hyperresponsiveness. Onset 1-2 weeks for full effect; minimal systemic absorption when used at therapeutic doses with proper technique.",
            citationIDs: ["openfda_round25"]
        ),
        dosing: [
            DosingBlock(label: "Pediatric (≥5 years)", body: "40-80 mcg per inhalation BID; titrate per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Adult", body: "40-160 mcg BID for mild-moderate asthma; up to 320 mcg BID for severe; max 640 mcg/day per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Step-up therapy", body: "Per GINA / NAEPP — increase ICS dose OR add LABA / LAMA / leukotriene modifier / biologics for inadequate control.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Step-down", body: "Reduce after 3-6 months of well-controlled asthma; lowest effective dose to maintain control.", citationIDs: ["specialty_round25"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — active untreated infection (especially TB, herpes simplex of eye), recent ocular HSV, severe milk protein hypersensitivity (DPI formulations).",
            citationIDs: ["openfda_round25"]
        ),
        warnings: [
            AttributedBullet("ORAL CANDIDIASIS (thrush) — common; RINSE MOUTH + SPIT after each use; spacer reduces; nystatin or fluconazole if develops per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("DYSPHONIA (hoarseness) — common; spacer reduces; usually reversible.", citationIDs: ["openfda_round25"]),
            AttributedBullet("GROWTH velocity reduction in pediatric — mild + transient (~1 cm); long-term final adult height minimally affected; lowest effective dose.", citationIDs: ["specialty_round25"]),
            AttributedBullet("HPA AXIS suppression at high doses — mostly with high-dose long-term use; consider stress dose steroid for surgery / severe illness.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ASTHMA EXACERBATION not prevented by acute escalation — patient should have RESCUE inhaler (albuterol) for acute symptoms.", citationIDs: ["specialty_round25"]),
            AttributedBullet("GLAUCOMA + cataracts — long-term use; eye exam periodically.", citationIDs: ["openfda_round25"]),
            AttributedBullet("BONE density reduction with long-term high doses; calcium + vitamin D supplementation; DEXA in selected.", citationIDs: ["openfda_round25"]),
            AttributedBullet("ALLERGIC reactions / anaphylaxis — rare; cross-reactivity with other corticosteroids.", citationIDs: ["openfda_round25"])
        ],
        adverseReactions: AttributedProse(
            "Oral candidiasis, dysphonia, throat irritation, cough, headache, growth velocity reduction (mild, temporary in pediatric), HPA axis suppression (high dose), eye effects (glaucoma, cataracts — long-term).",
            citationIDs: ["openfda_round25"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (ritonavir, ketoconazole) — increase systemic levels; reduce dose / monitor for HPA suppression.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Other corticosteroids — additive HPA suppression.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Compatible with — leukotriene modifiers, LABA, LAMA, biologics in step-up.", citationIDs: ["specialty_round25"])
        ],
        nursingImplications: [
            AttributedBullet("USE SPACER for MDI — improves lung deposition (~50% with vs ~10-20% without); reduces oral candidiasis.", citationIDs: ["specialty_round25"]),
            AttributedBullet("RINSE MOUTH + SPIT after each use — reduces thrush + dysphonia.", citationIDs: ["specialty_round25"]),
            AttributedBullet("DAILY use essential — NOT for rescue; counsel patient + family.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PEDIATRIC growth monitoring — at well visits; mild + reversible; lowest effective dose.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ASTHMA ACTION PLAN — green / yellow / red zones; rescue + maintenance + escalation criteria.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ASSESS technique periodically — many patients have poor technique; refresher essential.", citationIDs: ["specialty_round25"]),
            AttributedBullet("STEP-UP for poor control vs poor adherence — ASK + assess before escalating.", citationIDs: ["specialty_round25"]),
            AttributedBullet("STEP-DOWN after 3-6 months of well-controlled asthma to lowest effective.", citationIDs: ["specialty_round25"])
        ],
        patientTeaching: AttributedProse(
            "Use this every day for asthma control — NOT for sudden attacks. Use a spacer if you can. Rinse your mouth + spit after each use to prevent thrush. Tell us about hoarseness, white spots in your mouth, or eye changes. This works over weeks. For sudden attacks, use your blue albuterol inhaler.",
            citationIDs: ["openrn_pharm_round25"]
        ),
        citations: [openfdaR25, openrnPharmR25, cdcR25, specialtyR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BudesonideNebulizedSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "budesonide-nebulized",
        title: "Budesonide nebulized (Pulmicort Respules)",
        subtitle: "ICS via nebulizer · pediatric asthma + croup · once-twice daily · alternative to MDI for young children",
        category: "Inhaled corticosteroid (nebulizer formulation) — pediatric asthma + croup",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Inhaled corticosteroid (nebulizer formulation)"),
            KeyValueRow(key: "Use", value: "Persistent asthma in children 12 months - 8 years; selected adult; CROUP severe (single-dose alternative to dexamethasone)"),
            KeyValueRow(key: "Asthma dose", value: "0.25-1 mg via nebulizer once or twice daily"),
            KeyValueRow(key: "Croup dose", value: "2 mg via nebulizer single dose"),
            KeyValueRow(key: "Watch", value: "Same as inhaled steroids — oral candidiasis, dysphonia, growth velocity (pediatric); jet nebulizer required (NOT ultrasonic)")
        ],
        indications: AttributedProse(
            "Maintenance treatment of asthma in children 12 months to 8 years (FDA-approved for nebulizer); off-label adult selected; SEVERE croup (single 2 mg nebulized dose alternative when oral / IM dexamethasone not feasible) per primary source.",
            citationIDs: ["specialty_round25", "openfda_round25"]
        ),
        mechanism: AttributedProse(
            "Inhaled corticosteroid — anti-inflammatory in airways; reduces inflammation + mucus + hyperresponsiveness. Nebulized formulation allows administration in young children unable to use MDI / DPI; effective + minimal systemic absorption at therapeutic doses.",
            citationIDs: ["openfda_round25"]
        ),
        dosing: [
            DosingBlock(label: "Pediatric asthma maintenance (12 months-8 years)", body: "0.25 mg-1 mg via nebulizer once or twice daily; start low + titrate per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Croup (severe)", body: "2 mg single dose via nebulizer per primary source.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Adult asthma (off-label)", body: "0.5-2 mg BID; less common; usually MDI / DPI preferred.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Nebulizer requirements", body: "Use JET NEBULIZER with mouthpiece or face mask; ULTRASONIC nebulizer NOT recommended (drug breakdown).", citationIDs: ["openfda_round25"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to budesonide or other corticosteroids. Caution — active untreated infection, recent ocular HSV, severe milk protein hypersensitivity.",
            citationIDs: ["openfda_round25"]
        ),
        warnings: [
            AttributedBullet("ORAL CANDIDIASIS — common; rinse mouth + face after each use (especially with face mask); use mouthpiece if able.", citationIDs: ["specialty_round25"]),
            AttributedBullet("DYSPHONIA — common; usually mild + reversible.", citationIDs: ["openfda_round25"]),
            AttributedBullet("GROWTH velocity reduction in pediatric — mild + temporary; monitor at well visits.", citationIDs: ["specialty_round25"]),
            AttributedBullet("HPA AXIS suppression — mostly high-dose long-term; stress dose for severe illness / surgery.", citationIDs: ["specialty_round25"]),
            AttributedBullet("DELIVERY system — JET nebulizer with mouthpiece or face mask appropriate for age; ultrasonic NOT used; new mesh nebulizers acceptable per primary source.", citationIDs: ["openfda_round25"]),
            AttributedBullet("CROUP — single nebulized dose effective; useful when patient cannot tolerate oral / IM dexamethasone.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ASTHMA EXACERBATION — escalate per asthma action plan; ICS continued through; nebulized SABA + oral steroids as needed.", citationIDs: ["specialty_round25"])
        ],
        adverseReactions: AttributedProse(
            "Oral candidiasis, dysphonia, throat irritation, cough, headache, growth velocity reduction (mild), facial dermatitis (with face mask), eye irritation.",
            citationIDs: ["openfda_round25"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (ritonavir, ketoconazole) — increase systemic levels; HPA suppression risk.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Other corticosteroids — additive HPA suppression.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Compatible with — albuterol nebulized in same neb container; LABA / LAMA via separate device.", citationIDs: ["specialty_round25"])
        ],
        nursingImplications: [
            AttributedBullet("JET NEBULIZER required — NOT ultrasonic (drug degradation).", citationIDs: ["openfda_round25"]),
            AttributedBullet("MOUTHPIECE preferred over face mask when child able — reduces facial steroid contact.", citationIDs: ["specialty_round25"]),
            AttributedBullet("WIPE FACE + RINSE MOUTH after with mask use.", citationIDs: ["specialty_round25"]),
            AttributedBullet("DAILY use for asthma control; nebulizer ~10-15 minutes per session.", citationIDs: ["openrn_pharm_round25"]),
            AttributedBullet("CROUP — single dose; observe for response over hours; combine with racemic epinephrine for severe.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PARENT EDUCATION on nebulizer technique + cleaning; replace mask / mouthpiece per manufacturer.", citationIDs: ["openrn_pharm_round25"]),
            AttributedBullet("COMBINE with albuterol nebulized — administer concurrently in same neb cup (typically albuterol first then budesonide).", citationIDs: ["specialty_round25"])
        ],
        patientTeaching: AttributedProse(
            "(Parents) — Use this nebulizer treatment every day to control your child's asthma. Use a mouthpiece if your child can hold one; otherwise the face mask. Wipe their face + rinse their mouth after — prevents thrush. This is for control, not for sudden attacks. Don't stop suddenly. The treatment takes about 10-15 minutes.",
            citationIDs: ["openrn_pharm_round25"]
        ),
        citations: [openfdaR25, openrnPharmR25, cdcR25, specialtyR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CromolynSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cromolyn",
        title: "Cromolyn sodium (Intal, Crolom)",
        subtitle: "Mast cell stabilizer · prophylactic asthma + allergic conjunctivitis · NO acute relief · 4× daily · safe in pregnancy",
        category: "Mast cell stabilizer",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Mast cell stabilizer"),
            KeyValueRow(key: "Use", value: "Asthma maintenance (less effective than ICS, less commonly used now); allergic conjunctivitis; allergic rhinitis; mastocytosis"),
            KeyValueRow(key: "Dose", value: "Inhaled — 20 mg via nebulizer 4×/day OR MDI 1.6-3.2 mg q6h; ophthalmic 4% drops 1-2 drops 4-6×/day"),
            KeyValueRow(key: "Watch", value: "PROPHYLACTIC only — NO acute relief value; safe in pregnancy; less effective than ICS for asthma")
        ],
        indications: AttributedProse(
            "Asthma maintenance — historically used; LESS EFFECTIVE than ICS + largely replaced by ICS / leukotriene modifiers / SABA-ICS rescue; allergic conjunctivitis (Crolom 4% drops); allergic rhinitis (NasalCrom OTC); mastocytosis (oral); exercise-induced bronchoconstriction (pre-medication) per primary source.",
            citationIDs: ["specialty_round25", "openfda_round25"]
        ),
        mechanism: AttributedProse(
            "Mast cell membrane stabilizer — inhibits degranulation + release of histamine + other mediators. Topical action (no systemic absorption from inhaled or topical). PROPHYLACTIC — must be used regularly to be effective; no acute / rescue effect.",
            citationIDs: ["openfda_round25"]
        ),
        dosing: [
            DosingBlock(label: "Inhaled asthma (nebulizer)", body: "20 mg per nebulizer 4 times daily per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Inhaled asthma (MDI)", body: "1.6-3.2 mg (2 inhalations) q6h per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Ophthalmic (allergic conjunctivitis)", body: "4% drops — 1-2 drops in each eye 4-6× daily per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Intranasal (allergic rhinitis)", body: "1 spray each nostril 3-4× daily per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Mastocytosis (oral)", body: "100-200 mg PO 4× daily; specialty.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Pre-exercise bronchoconstriction", body: "2 inhalations 15-30 min before exercise.", citationIDs: ["specialty_round25"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — acute asthma attack (no rescue effect); severe heart failure (rare reports of arrhythmia); pregnancy generally safe (Category B).",
            citationIDs: ["openfda_round25"]
        ),
        warnings: [
            AttributedBullet("PROPHYLACTIC ONLY — NO acute / rescue effect; counsel patient.", citationIDs: ["specialty_round25"]),
            AttributedBullet("LESS EFFECTIVE than ICS for asthma — not first-line per current GINA / NAEPP guidelines per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("FREQUENT DOSING (4×/day) — adherence challenge.", citationIDs: ["specialty_round25"]),
            AttributedBullet("THROAT IRRITATION + cough on inhalation — common; gargle water if helpful.", citationIDs: ["openfda_round25"]),
            AttributedBullet("ALLERGIC reactions — rare.", citationIDs: ["openfda_round25"]),
            AttributedBullet("PREGNANCY safe — useful when ICS / antihistamines need to be limited; Category B.", citationIDs: ["specialty_round25"])
        ],
        adverseReactions: AttributedProse(
            "Throat irritation, cough on inhalation, unpleasant taste, headache, dizziness, nausea; rare bronchospasm, allergic reactions, eosinophilic pneumonia.",
            citationIDs: ["openfda_round25"]
        ),
        drugInteractions: [
            AttributedBullet("Minimal drug interactions due to limited systemic absorption.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Compatible with — other inhaled meds; albuterol; ICS.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Other allergy treatments (antihistamines, leukotriene modifiers) — additive prophylactic effect.", citationIDs: ["specialty_round25"])
        ],
        nursingImplications: [
            AttributedBullet("PROPHYLACTIC use — must take REGULARLY to be effective.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ICS PREFERRED over cromolyn for asthma maintenance per current guidelines.", citationIDs: ["specialty_round25"]),
            AttributedBullet("USEFUL niches — pregnancy (safe), pediatric (some prefer), ocular allergies (effective), exercise-induced (pre-medication).", citationIDs: ["specialty_round25"]),
            AttributedBullet("ADHERENCE challenge — 4× daily; counsel realistic + alternative if difficult.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ASTHMA ACTION PLAN — combine with rescue inhaler (albuterol) + escalation criteria.", citationIDs: ["specialty_round25"]),
            AttributedBullet("Nebulizer cleaning + technique counseling.", citationIDs: ["openrn_pharm_round25"])
        ],
        patientTeaching: AttributedProse(
            "Use this every day to PREVENT asthma symptoms — it doesn't help during an attack. You need to use it 4 times a day for it to work. Newer medicines (inhaled steroids) usually work better, but this is safe in pregnancy. For sudden attacks, use your rescue inhaler.",
            citationIDs: ["openrn_pharm_round25"]
        ),
        citations: [openfdaR25, openrnPharmR25, cdcR25, specialtyR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IvacaftorSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ivacaftor",
        title: "Ivacaftor (Kalydeco) + CFTR modulators",
        subtitle: "CFTR potentiator · transformed CF · genotype-specific (G551D + others) · ELEX/TEZ/IVA (Trikafta) most patients · expensive · LFT monitor",
        category: "CFTR modulator (potentiator) — cystic fibrosis disease-modifying",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "CFTR potentiator (small molecule disease-modifying)"),
            KeyValueRow(key: "Use", value: "Cystic fibrosis with G551D + 38 other gating + residual function CFTR mutations (ivacaftor monotherapy)"),
            KeyValueRow(key: "Dose", value: "150 mg PO q12h with high-fat meal (improves absorption)"),
            KeyValueRow(key: "Combos", value: "Lumacaftor-ivacaftor (Orkambi) F508del homozygous; tezacaftor-ivacaftor (Symdeko); ELEXACAFTOR-TEZACAFTOR-IVACAFTOR (Trikafta) — eligible for ~90% of CF patients ≥6 yrs"),
            KeyValueRow(key: "Watch", value: "LFTs baseline + periodically; cataracts in pediatric; CYP3A4 interactions; expensive ~$300K/year")
        ],
        indications: AttributedProse(
            "Cystic fibrosis with eligible CFTR mutations — IVACAFTOR (Kalydeco) for G551D + 38 other gating + residual function mutations. Combination products (lumacaftor-ivacaftor, tezacaftor-ivacaftor, ELEXACAFTOR-TEZACAFTOR-IVACAFTOR / Trikafta) for F508del + many more mutations — eligibility expanding per primary source.",
            citationIDs: ["specialty_round25", "openfda_round25"]
        ),
        mechanism: AttributedProse(
            "CFTR (cystic fibrosis transmembrane conductance regulator) modulators improve CFTR protein function. POTENTIATORS (ivacaftor) increase channel open probability of CFTR at cell surface. CORRECTORS (lumacaftor, tezacaftor, elexacaftor) help misfolded CFTR reach cell surface. Combinations address different mutation defects.",
            citationIDs: ["openfda_round25"]
        ),
        dosing: [
            DosingBlock(label: "Ivacaftor monotherapy (Kalydeco)", body: "150 mg PO q12h with high-fat meal per primary source; pediatric ≥4 months 25-75 mg q12h based on weight.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Lumacaftor-ivacaftor (Orkambi)", body: "Lumacaftor 400 mg + ivacaftor 250 mg PO q12h with high-fat meal; F508del homozygous ≥2 years per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Tezacaftor-ivacaftor (Symdeko)", body: "Tezacaftor 100 mg + ivacaftor 150 mg PO AM; ivacaftor 150 mg PO PM; F508del homozygous + selected heterozygous ≥6 years.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Elexacaftor-tezacaftor-ivacaftor (Trikafta)", body: "Elex 100 mg + tez 50 mg + iva 75 mg PO AM; ivacaftor 150 mg PO PM; F508del at least one allele ≥6 years; transformed CF treatment per primary source.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Hepatic adjustment", body: "Reduce dose for moderate-severe hepatic impairment per product label.", citationIDs: ["openfda_round25"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — severe hepatic impairment (dose reduction or avoid); concurrent strong CYP3A4 inducers (rifampin, St. John's wort) reduce efficacy.",
            citationIDs: ["openfda_round25"]
        ),
        warnings: [
            AttributedBullet("HEPATOTOXICITY — LFTs at baseline, monthly × 6 months, then periodically; transient elevations common; severe rare; HOLD if ALT/AST >5× ULN per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("CYP3A4 INTERACTIONS — strong inhibitors (ketoconazole, ritonavir) increase ivacaftor levels (reduce dose); strong inducers (rifampin, St. John's wort) decrease (avoid combination).", citationIDs: ["openfda_round25"]),
            AttributedBullet("PEDIATRIC CATARACTS — non-congenital lens opacities reported; baseline + annual eye exam in pediatric patients per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("HIGH-FAT MEAL — required for absorption (~3-4× higher with fat); counsel patient + family.", citationIDs: ["specialty_round25"]),
            AttributedBullet("RESPIRATORY EVENTS — chest discomfort, wheezing reported with lumacaftor-ivacaftor; usually transient; balance benefits.", citationIDs: ["openfda_round25"]),
            AttributedBullet("BP increase reported — monitor.", citationIDs: ["openfda_round25"]),
            AttributedBullet("EXPENSIVE — Trikafta ~$300,000/year; insurance + manufacturer assistance + CF Foundation resources; access advocacy.", citationIDs: ["specialty_round25"]),
            AttributedBullet("CF MULTIDISCIPLINARY care — CFTR modulators DO NOT replace airway clearance + nutrition + antibiotics; complement them.", citationIDs: ["specialty_round25"])
        ],
        adverseReactions: AttributedProse(
            "Headache, oropharyngeal pain, upper respiratory infection, abdominal pain, diarrhea, dizziness, rash, transaminitis, cataracts (pediatric — non-congenital lens opacities), respiratory chest discomfort, BP elevation.",
            citationIDs: ["openfda_round25"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INHIBITORS (ketoconazole, ritonavir, clarithromycin, itraconazole) — significantly increase ivacaftor; reduce dose to 150 mg twice weekly per primary source.", citationIDs: ["openfda_round25"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS (rifampin, St. John's wort, phenytoin, carbamazepine) — significantly decrease ivacaftor; AVOID concurrent.", citationIDs: ["openfda_round25"]),
            AttributedBullet("MODERATE CYP3A4 INHIBITORS (fluconazole, erythromycin, grapefruit juice) — caution; counsel grapefruit avoidance.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Ivacaftor inhibits CYP3A4 + P-gp — affects other drugs (warfarin, statins, certain immunosuppressants); monitor levels.", citationIDs: ["openfda_round25"])
        ],
        nursingImplications: [
            AttributedBullet("CONFIRM ELIGIBILITY by CFTR genotype — different products for different mutations per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("HIGH-FAT MEAL with each dose — counsel patient + family; absorption is 3-4× higher with fat; non-fat foods inadequate.", citationIDs: ["specialty_round25"]),
            AttributedBullet("BASELINE LFTs + monthly × 6 months → periodically; HOLD if ALT/AST >5× ULN.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PEDIATRIC eye exam baseline + annually for cataracts.", citationIDs: ["specialty_round25"]),
            AttributedBullet("AVOID grapefruit + Seville orange + St. John's wort.", citationIDs: ["specialty_round25"]),
            AttributedBullet("CONTINUE other CF therapies — airway clearance + dornase alfa + hypertonic saline + inhaled abx + nutrition + pancreatic enzymes; CFTR modulators COMPLEMENT not replace.", citationIDs: ["specialty_round25"]),
            AttributedBullet("INSURANCE + financial — manufacturer assistance, CFF compass, foundation resources; access advocacy.", citationIDs: ["specialty_round25"]),
            AttributedBullet("CF CENTER follow-up regularly — multidisciplinary; respiratory, dietitian, social work, GI, endocrine.", citationIDs: ["specialty_round25"])
        ],
        patientTeaching: AttributedProse(
            "Take this twice daily with a high-fat meal (eggs, avocado, peanut butter, butter, cheese, full-fat yogurt) — without enough fat, the medicine doesn't absorb well. Avoid grapefruit + Seville oranges. Get blood tests for liver. (Pediatric) — eye exam yearly. Continue all your other CF treatments. Tell us about yellow skin, dark urine, severe headache, or vision changes. Trikafta has transformed CF for many people; CF Foundation has financial resources.",
            citationIDs: ["openrn_pharm_round25"]
        ),
        citations: [openfdaR25, openrnPharmR25, cdcR25, specialtyR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PancrelipaseSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "pancrelipase",
        title: "Pancrelipase (Creon, Zenpep, Pancreaze)",
        subtitle: "Pancreatic enzyme replacement · CF + chronic pancreatitis · DOSE per LIPASE units/kg/meal · WITH meals + snacks · DON'T crush enteric beads",
        category: "Pancreatic enzyme replacement therapy (PERT)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Pancreatic enzyme replacement (lipase + protease + amylase) — porcine derived"),
            KeyValueRow(key: "Use", value: "Exocrine pancreatic insufficiency — cystic fibrosis (most common), chronic pancreatitis, pancreatectomy, pancreatic cancer"),
            KeyValueRow(key: "Dose", value: "500-2,500 LIPASE units/kg/meal (max 10,000 lipase units/kg/day); half-dose for snacks"),
            KeyValueRow(key: "Watch", value: "Take WITH meals + snacks (fat-containing); SWALLOW WHOLE (don't crush enteric microspheres); fibrosing colonopathy with very high doses; pH-sensitive (works best with PPI)")
        ],
        indications: AttributedProse(
            "Exocrine pancreatic insufficiency (EPI) — cystic fibrosis (>90% of CF patients have EPI), chronic pancreatitis, pancreatectomy, pancreatic cancer, Shwachman-Diamond syndrome. Improves fat absorption + nutritional status + reduces steatorrhea per primary source.",
            citationIDs: ["specialty_round25", "openfda_round25"]
        ),
        mechanism: AttributedProse(
            "Replaces deficient endogenous pancreatic enzymes — lipase (fat digestion), protease (protein digestion), amylase (carbohydrate digestion). Enteric-coated microspheres / minimicrospheres protect from gastric acid → released in alkaline duodenum where they digest food.",
            citationIDs: ["openfda_round25"]
        ),
        dosing: [
            DosingBlock(label: "CF + EPI adult / pediatric ≥4 years", body: "500-2,500 LIPASE units/kg PER MEAL (max 10,000 units/kg/day OR 4,000 units/g dietary fat) per primary source.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Pediatric <4 years", body: "1,000 lipase units/kg/meal start; titrate per nutritional response.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Snacks", body: "Half the meal dose — typically 250-1,250 lipase units/kg/snack.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Adjustment", body: "Titrate to symptoms (steatorrhea, weight gain, bowel movements) + nutritional status; max 10,000 units/kg/day.", citationIDs: ["specialty_round25"]),
            DosingBlock(label: "Infants", body: "Open capsule + sprinkle on acidic food (applesauce); small amounts q feed.", citationIDs: ["openfda_round25"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to pork products (porcine-derived); acute pancreatitis (relative — rest pancreas); high-dose use without monitoring (fibrosing colonopathy risk).",
            citationIDs: ["openfda_round25"]
        ),
        warnings: [
            AttributedBullet("FIBROSING COLONOPATHY — rare; reported in CF patients on high-dose pancrelipase; histopath diagnosis; max dose 10,000 lipase units/kg/day OR 4,000 lipase units/g dietary fat per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ENTERIC MICROSPHERES — DO NOT CRUSH OR CHEW; swallow whole; for inability — open capsule + sprinkle on acidic food (applesauce, pH <5); high-pH foods (milk, formula, ice cream) damage coating.", citationIDs: ["specialty_round25"]),
            AttributedBullet("WITH MEALS + SNACKS — start of meal; sprinkle on first bites if taking sprinkled.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PPI / H2 BLOCKER — concurrent improves enzyme efficacy; gastric acid prematurely activates / damages enteric microspheres.", citationIDs: ["specialty_round25"]),
            AttributedBullet("HYPERURICEMIA + GOUT — purine content of porcine pancreas can elevate uric acid; counsel.", citationIDs: ["openfda_round25"]),
            AttributedBullet("ALLERGIC reactions — porcine protein; rare; cross-reactive with other porcine products.", citationIDs: ["openfda_round25"]),
            AttributedBullet("VIRAL TRANSMISSION concern — historic; modern processes prevent; informed consent.", citationIDs: ["openfda_round25"]),
            AttributedBullet("MULTIPLE PRODUCTS — Creon, Zenpep, Pancreaze, Pertzye, Ultresa, Viokace; NOT interchangeable per FDA; switching requires re-titration.", citationIDs: ["specialty_round25"])
        ],
        adverseReactions: AttributedProse(
            "Abdominal pain, gas, diarrhea, constipation, headache, hyperuricemia, allergic reactions, fibrosing colonopathy (rare, high-dose), oral irritation if microspheres chewed.",
            citationIDs: ["openfda_round25"]
        ),
        drugInteractions: [
            AttributedBullet("PPI / H2 BLOCKERS — improve efficacy by reducing gastric acid breakdown of enteric coating.", citationIDs: ["specialty_round25"]),
            AttributedBullet("CALCIUM / MAGNESIUM antacids — historically thought to reduce efficacy; minimal clinical impact.", citationIDs: ["openfda_round25"]),
            AttributedBullet("IRON — pancreatic enzymes may reduce iron absorption.", citationIDs: ["openfda_round25"])
        ],
        nursingImplications: [
            AttributedBullet("DOSE per LIPASE UNITS — different products have different lipase content per capsule; check carefully.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PRODUCTS NOT INTERCHANGEABLE — switching requires re-titration per FDA per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("WITH MEALS + SNACKS — start of meal; if multiple capsules per meal, take some at start + some midway.", citationIDs: ["specialty_round25"]),
            AttributedBullet("SWALLOW WHOLE — don't crush; for sprinkling — open capsule, sprinkle on small amount of acidic food (applesauce; AVOID milk, formula, ice cream — damage coating).", citationIDs: ["specialty_round25"]),
            AttributedBullet("CONCURRENT PPI / H2 blocker — improves enzyme efficacy.", citationIDs: ["specialty_round25"]),
            AttributedBullet("MONITOR — weight, growth (pediatric), steatorrhea, stool frequency / consistency, fat-soluble vitamin levels (A, D, E, K — supplement).", citationIDs: ["specialty_round25"]),
            AttributedBullet("CF + chronic pancreatitis NUTRITION — high-calorie + high-fat diet; calorie-dense supplements; multivitamin + ADEK.", citationIDs: ["specialty_round25"]),
            AttributedBullet("MAX 10,000 LIPASE UNITS/KG/DAY — fibrosing colonopathy risk; titrate to clinical response.", citationIDs: ["specialty_round25"])
        ],
        patientTeaching: AttributedProse(
            "Take this with EVERY meal + snack — at the START of the meal. Swallow capsules whole. If you can't swallow, open + sprinkle on applesauce (NOT milk or ice cream). The medicine helps you absorb fat + nutrients. Take with the acid-reducing medicine if prescribed — works better. Tell us about severe stomach pain, weight loss, or fatty / oily stools.",
            citationIDs: ["openrn_pharm_round25"]
        ),
        citations: [openfdaR25, openrnPharmR25, cdcR25, specialtyR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LoratadineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "loratadine",
        title: "Loratadine (Claritin)",
        subtitle: "2nd-gen antihistamine · OTC since 2002 · once-daily non-sedating · pediatric ≥6 months · safe in pregnancy",
        category: "Second-generation H1 antihistamine",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Second-generation H1 receptor antagonist — selective peripheral; minimal CNS"),
            KeyValueRow(key: "Use", value: "Allergic rhinitis (seasonal + perennial); chronic urticaria; allergic conjunctivitis"),
            KeyValueRow(key: "Dose", value: "Adult 10 mg PO daily; pediatric (≥6 years) 10 mg daily; (2-5 years) 5 mg daily; (≥6 months) 2.5 mg daily"),
            KeyValueRow(key: "Status", value: "OTC since 2002; available as syrup, chewable, ODT, tablet"),
            KeyValueRow(key: "Watch", value: "Generally well-tolerated; less sedating than 1st-gen; rare drowsiness; safe in pregnancy")
        ],
        indications: AttributedProse(
            "Seasonal + perennial allergic rhinitis (sneezing, rhinorrhea, pruritus, ocular itching); chronic idiopathic urticaria; allergic conjunctivitis. Available OTC since 2002 — first non-sedating antihistamine OTC per primary source.",
            citationIDs: ["specialty_round25", "openfda_round25"]
        ),
        mechanism: AttributedProse(
            "Selective peripheral H1 histamine receptor antagonist — blocks histamine effects (vascular permeability, smooth muscle, sensory nerve stimulation). Limited blood-brain barrier penetration → minimal CNS sedation vs first-generation antihistamines.",
            citationIDs: ["openfda_round25"]
        ),
        dosing: [
            DosingBlock(label: "Adult + pediatric ≥6 years", body: "10 mg PO once daily per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Pediatric 2-5 years", body: "5 mg PO once daily.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Pediatric 6 months-2 years", body: "2.5 mg PO once daily per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Hepatic / renal impairment", body: "Reduce frequency to every other day for severe.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Pregnancy / lactation", body: "Generally safe (Category B); preferred 2nd-gen antihistamine in pregnancy.", citationIDs: ["specialty_round25"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — severe hepatic or renal impairment (extended dosing interval); newborns (<6 months not established).",
            citationIDs: ["openfda_round25"]
        ),
        warnings: [
            AttributedBullet("LESS SEDATING than first-gen antihistamines (diphenhydramine, chlorpheniramine) — non-sedating in most patients; rare drowsiness in some per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("SAFE IN PREGNANCY (Category B) — preferred 2nd-gen antihistamine; loratadine + cetirizine first-line per ACOG.", citationIDs: ["specialty_round25"]),
            AttributedBullet("DAILY USE during allergy season most effective; can be PRN for occasional symptoms.", citationIDs: ["specialty_round25"]),
            AttributedBullet("HEPATIC IMPAIRMENT — extends T1/2; reduce frequency.", citationIDs: ["openfda_round25"]),
            AttributedBullet("DRY MOUTH — most common side effect; usually mild.", citationIDs: ["openfda_round25"]),
            AttributedBullet("HEADACHE — common, mild.", citationIDs: ["openfda_round25"]),
            AttributedBullet("PEDIATRIC paradoxical excitement — rare; counsel.", citationIDs: ["openfda_round25"])
        ],
        adverseReactions: AttributedProse(
            "Headache, somnolence (less than 1st-gen), fatigue, dry mouth, dyspepsia, abdominal pain, photosensitivity (rare), paradoxical excitement (pediatric — rare).",
            citationIDs: ["openfda_round25"]
        ),
        drugInteractions: [
            AttributedBullet("Generally minimal — does not significantly inhibit CYP enzymes.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Strong CYP3A4 inhibitors (ketoconazole, ritonavir, erythromycin) — increase loratadine levels modestly; clinically minimal.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Cimetidine — increases loratadine; clinically modest.", citationIDs: ["openfda_round25"]),
            AttributedBullet("CNS depressants — additive sedation if patient experiencing rare drowsiness.", citationIDs: ["openfda_round25"])
        ],
        nursingImplications: [
            AttributedBullet("DAILY use during allergy season more effective than PRN.", citationIDs: ["specialty_round25"]),
            AttributedBullet("ONCE-DAILY dosing — convenient + good adherence.", citationIDs: ["openrn_pharm_round25"]),
            AttributedBullet("AVOID 1st-gen antihistamines (diphenhydramine) for chronic allergy in elderly + driving — anticholinergic burden + sedation.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PREFERRED in pregnancy — loratadine + cetirizine 2nd-gen are preferred 2nd-gen options in pregnancy.", citationIDs: ["specialty_round25"]),
            AttributedBullet("COMBINATION therapy — add intranasal corticosteroid (fluticasone) for moderate-severe; add olopatadine eye drops for ocular component.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PEDIATRIC dose by age; chewable + ODT + syrup formulations available.", citationIDs: ["openrn_pharm_round25"]),
            AttributedBullet("ALLERGEN AVOIDANCE + nasal saline irrigation as adjunct.", citationIDs: ["specialty_round25"])
        ],
        patientTeaching: AttributedProse(
            "Take this once daily for allergy symptoms. Less sleepy than older allergy medicines. Use during your allergy season for best results. Safe in pregnancy. Combine with a nasal steroid spray if symptoms still bother you. Avoid Benadryl (diphenhydramine) for daily allergy use — it causes drowsiness + isn't safe long-term.",
            citationIDs: ["openrn_pharm_round25"]
        ),
        citations: [openfdaR25, openrnPharmR25, cdcR25, specialtyR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum VigabatrinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "vigabatrin",
        title: "Vigabatrin (Sabril)",
        subtitle: "INFANTILE SPASMS first-line + refractory complex partial · IRREVERSIBLE VISUAL FIELD LOSS (boxed) · REMS · short-term use",
        category: "GABA transaminase inhibitor (antiepileptic)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "GABA transaminase inhibitor — irreversibly inhibits GABA breakdown"),
            KeyValueRow(key: "Use", value: "Infantile spasms in 1 month-2 years (FDA); refractory complex partial seizures in adults + children ≥10 years"),
            KeyValueRow(key: "Dose (infantile spasms)", value: "Start 50 mg/kg/day in 2 divided doses; titrate by 25-50 mg/kg/day every 3 days; max 150 mg/kg/day"),
            KeyValueRow(key: "Watch", value: "BOXED — IRREVERSIBLE VISUAL FIELD LOSS in 30-50% of users; vision testing q3 months; REMS program"),
            KeyValueRow(key: "Duration", value: "Infantile spasms — typically 6 months; longer for refractory epilepsy after careful risk-benefit")
        ],
        indications: AttributedProse(
            "Infantile spasms (West syndrome) in pediatric 1 month-2 years (FDA-approved; first-line per AAN guidelines, alternative to ACTH); refractory complex partial seizures as adjunctive therapy in adults + children ≥10 years (when other AEDs insufficient + benefits outweigh visual risk) per primary source.",
            citationIDs: ["specialty_round25", "openfda_round25"]
        ),
        mechanism: AttributedProse(
            "Irreversible inhibitor of GABA aminotransferase (GABA-T) → increased brain GABA → enhanced inhibitory neurotransmission → seizure suppression. Long-lasting effect even after discontinuation (irreversible enzyme inhibition).",
            citationIDs: ["openfda_round25"]
        ),
        dosing: [
            DosingBlock(label: "Infantile spasms (1 month-2 years)", body: "Start 50 mg/kg/day PO in 2 divided doses; titrate by 25-50 mg/kg/day every 3 days; usual maintenance 100-150 mg/kg/day; max 150 mg/kg/day per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Refractory partial seizures (≥10 years)", body: "Start 1 g/day PO in 2 divided doses; titrate by 500 mg/day weekly; usual maintenance 3 g/day per primary source.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Renal impairment", body: "Reduce dose for CrCl <60-80; severe — significantly reduce.", citationIDs: ["openfda_round25"]),
            DosingBlock(label: "Tuberous sclerosis-associated infantile spasms", body: "VIGABATRIN PARTICULARLY effective; first-line per primary source.", citationIDs: ["specialty_round25"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. RELATIVE — pre-existing visual field defect (carefully assess benefit-risk), pregnancy (Category C — limited data; AED registry), planned eye surgery.",
            citationIDs: ["openfda_round25"]
        ),
        warnings: [
            AttributedBullet("BOXED — IRREVERSIBLE PERMANENT VISION LOSS (visual field defects) — 30-50% of patients; bilateral concentric peripheral field constriction; \"tunnel vision\" possible; cannot be reversed when stops per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("REMS PROGRAM — restricted distribution; prescriber + pharmacy + patient enrollment required; visual field testing required; risk-benefit documentation per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("VISION ASSESSMENT — baseline + every 3 months; difficult in young children — ophthalmology specialist; ERG (electroretinography) for non-cooperative children.", citationIDs: ["specialty_round25"]),
            AttributedBullet("DURATION — infantile spasms — typically 6 months total, then taper if seizure-free; longer use only with refractory + ongoing benefit + risk-benefit assessment.", citationIDs: ["specialty_round25"]),
            AttributedBullet("MRI FINDINGS — increased T2 / DWI signal in basal ganglia / thalamus / brainstem; reversible; usually asymptomatic.", citationIDs: ["openfda_round25"]),
            AttributedBullet("PSYCHIATRIC — depression, suicidality, agitation; AED black-box.", citationIDs: ["openfda_round25"]),
            AttributedBullet("ANEMIA — mild + reversible.", citationIDs: ["openfda_round25"]),
            AttributedBullet("AVOID abrupt discontinuation — taper to prevent rebound seizures.", citationIDs: ["openfda_round25"])
        ],
        adverseReactions: AttributedProse(
            "Visual field constriction / loss (irreversible), drowsiness, fatigue, weight gain, depression, suicidality, MRI brain signal changes (asymptomatic), tremor, hyperactivity (pediatric), anemia, peripheral neuropathy.",
            citationIDs: ["openfda_round25"]
        ),
        drugInteractions: [
            AttributedBullet("Phenytoin — vigabatrin reduces phenytoin levels by 20-30%; monitor levels.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Other AEDs — interactions possible; specialty management.", citationIDs: ["openfda_round25"]),
            AttributedBullet("Oral contraceptives — minimal effect.", citationIDs: ["openfda_round25"])
        ],
        nursingImplications: [
            AttributedBullet("REMS program enrollment — prescriber + pharmacy + patient; cannot dispense without.", citationIDs: ["specialty_round25"]),
            AttributedBullet("BASELINE + Q3-MONTH VISION assessment — ophthalmology; ERG for young children; DOCUMENT per primary source.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PARENT counseling on RISK-BENEFIT — irreversible vision loss possible vs catastrophic seizure / developmental impact of untreated infantile spasms; informed consent thorough.", citationIDs: ["specialty_round25"]),
            AttributedBullet("INFANTILE SPASMS — first-line for tuberous sclerosis-associated; alternative to ACTH for others.", citationIDs: ["specialty_round25"]),
            AttributedBullet("MONITOR — seizure frequency, vision, mood / behavior, weight, neurologic exam.", citationIDs: ["specialty_round25"]),
            AttributedBullet("DURATION — limit to 6 months for infantile spasms then taper if successful; reassess if needing prolonged use.", citationIDs: ["specialty_round25"]),
            AttributedBullet("TAPER discontinuation — never abrupt.", citationIDs: ["specialty_round25"]),
            AttributedBullet("PEDIATRIC NEUROLOGY specialist for diagnosis + management.", citationIDs: ["specialty_round25"])
        ],
        patientTeaching: AttributedProse(
            "(Parents) — This medicine treats your baby's infantile spasms. It works well, but it can cause permanent vision loss in 30-50% of children. We must check your baby's vision every 3 months. We typically use it for 6 months, then stop if seizures are controlled. Tell us about behavior changes, weight changes, or any concerns about vision. The decision to use this is a serious risk-benefit balance — uncontrolled spasms cause severe developmental damage.",
            citationIDs: ["openrn_pharm_round25"]
        ),
        citations: [openfdaR25, openrnPharmR25, cdcR25, specialtyR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}
