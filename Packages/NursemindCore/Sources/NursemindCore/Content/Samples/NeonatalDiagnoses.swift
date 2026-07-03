import Foundation

// Curator-model neonatal diagnosis entries — the prematurity-complications
// cluster. Audit found term-newborn conditions well covered (bronchiolitis,
// neonatal sepsis, jaundice, neonatal hypoglycemia) but the classic sequelae
// of prematurity had no dedicated entries. Per Apple 1.4.2, no patient-
// specific dose math — recognition, supportive nursing care, and family
// education only. Sources: Open RN Maternal-Newborn (CC BY 4.0), CDC public
// domain, AAP concept citations. Tier-A RN review pending (all neonatal
// high-acuity content).

private let openrnNeo = CitationSource(
    id: "openrn_neonatal",
    shortName: "Open RN Maternal-Newborn Nursing — Newborn Complications",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/maternal/",
    lastRetrieved: "2026-07-03"
)
private let cdcNeo = CitationSource(
    id: "cdc_neonatal",
    shortName: "CDC Reproductive & Infant Health guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/reproductivehealth/",
    lastRetrieved: "2026-07-03"
)
private let aapNeo = CitationSource(
    id: "aap_neonatal_concept",
    shortName: "AAP Clinical Practice Guidelines (concept citation only)",
    publisher: "American Academy of Pediatrics",
    license: .factCitationOnly,
    url: "https://www.aap.org/en/practice-management/practice-guidance/",
    lastRetrieved: "2026-07-03"
)

private let neoRespTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)
private let neoNeuroTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation)
private let neoPerfusionTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let neoSafetyTags = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)

// MARK: - Neonatal respiratory distress syndrome (RDS)

public enum NeonatalRDSDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "neonatal-rds",
        title: "Neonatal respiratory distress syndrome (RDS)",
        subtitle: "Surfactant deficiency of prematurity · the more preterm, the higher the risk",
        nclexTags: neoRespTags,
        definition: AttributedProse(
            "Respiratory distress syndrome (formerly hyaline membrane disease) is a lung disease of prematurity caused by insufficient pulmonary surfactant. It is the most common respiratory cause of distress in preterm infants, and incidence rises steeply the more premature the infant.",
            citationIDs: ["openrn_neonatal", "aap_neonatal_concept"]
        ),
        pathophysiology: AttributedProse(
            "Type II pneumocytes produce surfactant relatively late in gestation. Without enough surfactant, alveolar surface tension is high, alveoli collapse at end-expiration (atelectasis), and the infant must generate enormous pressure to reopen them with every breath. The result is progressive atelectasis, V/Q mismatch, hypoxemia, and respiratory acidosis. Antenatal corticosteroids given to the mother before preterm birth accelerate fetal lung maturity and are a major preventive intervention.",
            citationIDs: ["openrn_neonatal"]
        ),
        presentation: [
            AttributedBullet("Onset within minutes to hours of birth in a preterm infant: tachypnea, grunting, nasal flaring, intercostal/subcostal retractions, cyanosis.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Grunting is the infant's own PEEP — closing the glottis against a collapsing lung; it is an ominous sign of significant disease.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Worsening oxygen requirement over the first hours as atelectasis progresses.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Higher risk: prematurity (especially <34 weeks), infant of a diabetic mother, male sex, cesarean without labor, perinatal asphyxia, second twin.", citationIDs: ["aap_neonatal_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical picture of respiratory distress in a preterm infant plus characteristic chest radiograph (low lung volumes, diffuse ground-glass/reticulogranular pattern, air bronchograms).", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Blood gas: hypoxemia, hypercarbia, respiratory (± metabolic) acidosis.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Distinguish from transient tachypnea of the newborn (self-resolving, term/late-preterm) and neonatal pneumonia/sepsis (may look identical — often treated concurrently).", citationIDs: ["aap_neonatal_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous cardiorespiratory and SpO₂ monitoring; assess work of breathing (grunting, flaring, retractions) as closely as the numbers — effort deteriorates before saturation does.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Target oxygen saturation range per unit protocol — both hypoxia and hyperoxia harm the preterm infant (hyperoxia drives retinopathy of prematurity).", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Thermoregulation — cold stress increases oxygen consumption and worsens acidosis; maintain a neutral thermal environment.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Blood glucose — preterm infants have minimal reserves and high metabolic demand.", citationIDs: ["openrn_neonatal"])
        ],
        commonInterventions: [
            AttributedBullet("Respiratory support along a ladder: supplemental oxygen → CPAP (early CPAP reduces the need for intubation) → mechanical ventilation for failure.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Exogenous surfactant replacement per NICU protocol for infants meeting criteria — administered via endotracheal tube; anticipate rapid improvement in compliance and a need to wean support to avoid overexpansion.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Minimal-handling / clustered care to reduce oxygen consumption; gentle positioning.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Thermoneutral environment (radiant warmer/isolette), IV fluids and glucose, and evaluation/coverage for sepsis while it is being ruled out.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Prevention is antenatal: corticosteroids to the mother for anticipated preterm birth mature fetal lungs and reduce RDS severity.", citationIDs: ["aap_neonatal_concept"])
        ],
        watchFor: [
            AttributedBullet("Air leak (pneumothorax) — sudden desaturation, asymmetric breath sounds, and hemodynamic change, especially after surfactant or on positive pressure.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Progression to respiratory failure requiring escalation of support.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Downstream complications of prematurity and its treatment: bronchopulmonary dysplasia, retinopathy of prematurity, patent ductus arteriosus, intraventricular hemorrhage.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Family support — parents of a distressed preterm newborn need honest, frequent updates and early inclusion in care.", citationIDs: ["openrn_neonatal"])
        ],
        citations: [openrnNeo, aapNeo],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Transient tachypnea of the newborn (TTN)

public enum TransientTachypneaDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "transient-tachypnea-newborn",
        title: "Transient tachypnea of the newborn (TTN)",
        subtitle: "Retained lung fluid · benign and self-limited · a diagnosis of watchful exclusion",
        nclexTags: neoRespTags,
        definition: AttributedProse(
            "TTN is a benign, self-limited cause of respiratory distress in the newborn caused by delayed clearance of fetal lung fluid. It typically presents in term or late-preterm infants and resolves over the first day or two of life.",
            citationIDs: ["openrn_neonatal", "aap_neonatal_concept"]
        ),
        pathophysiology: AttributedProse(
            "During labor and vaginal birth, catecholamine surges and thoracic compression help the lungs switch from fluid secretion to absorption. When that clearance is incomplete — most often after cesarean birth without labor, precipitous delivery, or maternal diabetes — residual fluid in the interstitium and airspaces reduces compliance and causes tachypnea. The fluid reabsorbs over hours, and the tachypnea resolves with it.",
            citationIDs: ["openrn_neonatal"]
        ),
        presentation: [
            AttributedBullet("Tachypnea beginning within the first hours of life — often the dominant sign, with only mild grunting, flaring, or retractions.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Usually a term or late-preterm infant who is otherwise vigorous and pink, or needing only modest oxygen.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Risk factors: cesarean delivery (especially without labor), precipitous birth, maternal diabetes, maternal sedation, male sex.", citationIDs: ["aap_neonatal_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("A diagnosis of exclusion — the danger is anchoring on 'just TTN' while RDS, pneumonia, or sepsis declares itself.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Chest radiograph, when obtained, shows fluid in the fissures, perihilar streaking, and hyperinflation — distinct from the ground-glass pattern of RDS.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Tachypnea that persists beyond roughly the first day, escalates, or is accompanied by rising oxygen needs argues against TTN and for a more serious cause.", citationIDs: ["aap_neonatal_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Serial respiratory assessments: rate, work of breathing, and oxygen requirement trended over hours — improvement supports the diagnosis; worsening refutes it.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Feeding and hydration — a tachypneic infant may not feed safely; watch for the tachypnea threshold at which oral feeding risks aspiration.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Temperature, glucose, and perfusion — because sepsis is on the differential until it isn't.", citationIDs: ["openrn_neonatal"])
        ],
        commonInterventions: [
            AttributedBullet("Supportive care: supplemental oxygen as needed to maintain target saturations, thermoneutral environment, and time.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Feeding support — IV fluids or gavage while the respiratory rate is too high for safe oral feeding; advance to oral feeds as it normalizes.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Sepsis evaluation and empiric coverage while ruling out infection, per unit practice, because the presentations overlap.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Reassurance and updates for the family — most infants are back to room air and full feeds within a day or two.", citationIDs: ["openrn_neonatal"])
        ],
        watchFor: [
            AttributedBullet("The mimics: escalating distress or oxygen need means reconsider RDS, pneumonia, sepsis, pneumothorax, or congenital heart disease.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Feeding intolerance or aspiration risk while the respiratory rate remains high.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Persistence beyond the expected window — TTN that isn't transient isn't TTN.", citationIDs: ["openrn_neonatal"])
        ],
        citations: [openrnNeo, aapNeo],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Bronchopulmonary dysplasia (BPD)

public enum BronchopulmonaryDysplasiaDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bronchopulmonary-dysplasia",
        title: "Bronchopulmonary dysplasia (BPD)",
        subtitle: "Chronic lung disease of prematurity · the cost of the lungs that had to be supported",
        nclexTags: neoRespTags,
        definition: AttributedProse(
            "Bronchopulmonary dysplasia is the chronic lung disease of prematurity, defined by a prolonged oxygen or respiratory-support requirement in a preterm infant (conventionally assessed around 36 weeks postmenstrual age). It is among the most common long-term complications of very preterm birth.",
            citationIDs: ["openrn_neonatal", "aap_neonatal_concept"]
        ),
        pathophysiology: AttributedProse(
            "The immature lung, injured by the very interventions that keep the infant alive — positive-pressure ventilation (volutrauma/barotrauma), oxygen toxicity — plus inflammation and arrested alveolar development, heals into fewer, larger, simplified alveoli and abnormal pulmonary vasculature. The result is impaired gas exchange, increased work of breathing, and airway reactivity that can persist for years.",
            citationIDs: ["openrn_neonatal"]
        ),
        presentation: [
            AttributedBullet("A preterm infant who cannot be weaned off supplemental oxygen or respiratory support on the expected timeline.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Tachypnea, retractions, wheezing, and increased work of breathing; poor weight gain from the caloric cost of breathing.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Episodes of desaturation and increased oxygen need with handling, feeding, or agitation.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Risk factors: extreme prematurity and low birth weight, prolonged mechanical ventilation and oxygen exposure, infection, and patent ductus arteriosus.", citationIDs: ["aap_neonatal_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Defined by the duration and degree of oxygen/respiratory support in a preterm infant assessed at a standard postmenstrual age, graded by severity per consensus definitions.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Chest imaging may show hyperinflation, cystic or coarse interstitial changes; findings support but do not define the diagnosis.", citationIDs: ["openrn_neonatal"])
        ],
        priorityAssessments: [
            AttributedBullet("Respiratory status and oxygen requirement trended over days — the diagnosis and the weaning plan both live in the trajectory.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Growth and nutrition — these infants need extra calories, and poor growth worsens lung recovery; weigh and plot faithfully.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Tolerance of care and feeding — desaturation with handling shapes how care is clustered and paced.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Developmental and neurologic surveillance — BPD travels with the other prematurity complications.", citationIDs: ["aap_neonatal_concept"])
        ],
        commonInterventions: [
            AttributedBullet("Gentle, targeted respiratory support with the lowest effective oxygen and pressure; slow, patient weaning that tolerates small setbacks.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Nutrition optimization — high-calorie feeds and careful fluid balance (these infants are fluid-sensitive); dietitian involvement.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Clustered, developmentally supportive care to minimize oxygen consumption and stress; pace feeds around respiratory tolerance.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Immunization and RSV prevention are especially important — a respiratory infection in a BPD infant can be catastrophic.", citationIDs: ["cdc_neonatal", "aap_neonatal_concept"]),
            AttributedBullet("Family teaching for the frequent home-oxygen and monitoring discharge: equipment, feeding, illness red flags, and follow-up.", citationIDs: ["openrn_neonatal"])
        ],
        watchFor: [
            AttributedBullet("Acute respiratory decompensation with viral infection (especially RSV) — low threshold to escalate.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Pulmonary hypertension as a complication of severe BPD.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Growth failure and feeding difficulty; the work of breathing competes with the calories for growing.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Parental exhaustion around a long NICU stay and a technology-dependent discharge — connect families to support and clear teaching.", citationIDs: ["openrn_neonatal"])
        ],
        citations: [openrnNeo, aapNeo, cdcNeo],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Neonatal abstinence syndrome / NOWS

public enum NeonatalAbstinenceDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "neonatal-abstinence-syndrome",
        title: "Neonatal abstinence syndrome (NAS / NOWS)",
        subtitle: "Withdrawal in the newborn · the low-stimulation, non-judgmental unit is the treatment",
        nclexTags: neoNeuroTags,
        definition: AttributedProse(
            "Neonatal abstinence syndrome — increasingly termed neonatal opioid withdrawal syndrome (NOWS) when opioids are the cause — is a constellation of withdrawal signs in a newborn following in-utero exposure to opioids or other substances. Care is anchored in supportive, non-pharmacologic measures, with pharmacologic treatment reserved for infants whose signs are not controlled by them.",
            citationIDs: ["openrn_neonatal", "aap_neonatal_concept"]
        ),
        pathophysiology: AttributedProse(
            "Substances that cross the placenta (opioids most classically, but also others) produce physiologic dependence in the fetus. After birth the supply stops, and the newborn's immature central and autonomic nervous systems manifest withdrawal — hyperirritability, GI dysfunction, and autonomic instability. Timing of onset depends on the substance's half-life; longer-acting agents produce later onset.",
            citationIDs: ["openrn_neonatal"]
        ),
        presentation: [
            AttributedBullet("Central nervous system: high-pitched cry, irritability, tremors, hypertonia, exaggerated reflexes, disturbed sleep, and — a red flag — seizures.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Gastrointestinal: poor and disorganized feeding, frantic sucking, vomiting, loose stools, poor weight gain.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Autonomic: sweating, nasal stuffiness/sneezing, yawning, fever, mottling, tachypnea.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Onset varies with the exposure — hours to several days after birth; monitoring spans the newborn's first days accordingly.", citationIDs: ["aap_neonatal_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Maternal history and a compatible clinical picture; care is guided by structured assessment of withdrawal severity — traditional scoring (e.g., Finnegan) or function-based approaches (Eat, Sleep, Console).", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Toxicology testing per policy and consent; a nonjudgmental, family-centered stance is part of the standard of care and improves outcomes.", citationIDs: ["openrn_neonatal"])
        ],
        priorityAssessments: [
            AttributedBullet("Serial standardized withdrawal assessment on the unit's schedule, ideally around care and feeding times, so scores reflect function (can the infant eat, sleep, and be consoled?).", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Feeding effectiveness and weight — GI withdrawal plus high caloric demand threatens growth and hydration.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Skin integrity — inconsolable movement causes excoriation of the knees, elbows, and face.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Watch for seizures, which change management urgently.", citationIDs: ["openrn_neonatal"])
        ],
        commonInterventions: [
            AttributedBullet("Non-pharmacologic care is first-line and central: a quiet, dimly lit, low-stimulation environment; swaddling; gentle handling; rooming-in with the parent; skin-to-skin.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Keep the mother-infant dyad together where safe — parental presence and consoling are treatments, and the Eat-Sleep-Console approach reduces pharmacologic treatment and length of stay.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Feeding support — small, frequent feeds; support breastfeeding when not contraindicated (it is encouraged for mothers in treatment per criteria).", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Pharmacologic treatment (per protocol, opioid-based for opioid withdrawal) reserved for infants whose function is not maintained by non-pharmacologic care.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Nonjudgmental family engagement, social work, and discharge planning with follow-up and safe-care support — the stance toward the parent shapes the infant's outcome.", citationIDs: ["openrn_neonatal"])
        ],
        watchFor: [
            AttributedBullet("Seizures — escalate immediately.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Dehydration and poor weight gain from feeding difficulty, vomiting, and loose stools.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Skin breakdown from constant movement.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Stigma as a care hazard — a judgmental environment undermines the parental presence that is itself the therapy.", citationIDs: ["openrn_neonatal"])
        ],
        citations: [openrnNeo, aapNeo],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Hypoxic-ischemic encephalopathy (HIE)

public enum HIEDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "neonatal-hie",
        title: "Hypoxic-ischemic encephalopathy (HIE)",
        subtitle: "Perinatal brain injury · therapeutic hypothermia is time-critical neuroprotection",
        nclexTags: neoNeuroTags,
        definition: AttributedProse(
            "Hypoxic-ischemic encephalopathy is brain injury in the newborn resulting from a perinatal event that reduced oxygen delivery and blood flow to the brain. In moderate-to-severe HIE in eligible infants, therapeutic hypothermia (whole-body or selective head cooling) begun within a narrow window after birth is the established neuroprotective treatment.",
            citationIDs: ["openrn_neonatal", "aap_neonatal_concept"]
        ),
        pathophysiology: AttributedProse(
            "A hypoxic-ischemic insult causes an initial phase of cellular energy failure. After reperfusion, a delayed phase of ongoing injury unfolds over hours to days — excitotoxicity, oxidative stress, inflammation, and programmed cell death. Therapeutic hypothermia works by slowing this secondary cascade, which is why it must be started early: it is protecting the brain that hasn't been injured yet.",
            citationIDs: ["openrn_neonatal"]
        ),
        presentation: [
            AttributedBullet("History of a sentinel perinatal event or evidence of intrapartum compromise (abnormal fetal heart tracing, cord prolapse, abruption, shoulder dystocia, uterine rupture).", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Depressed newborn: low Apgar scores, need for resuscitation, and cord/early blood gas showing significant metabolic acidosis.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Encephalopathy on exam: altered level of consciousness, abnormal tone and reflexes, poor feeding, and — a key finding — seizures.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Multi-organ involvement is common: kidneys, liver, heart, and clotting can all reflect the same global hypoxic insult.", citationIDs: ["openrn_neonatal"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical staging of encephalopathy severity plus evidence of a perinatal hypoxic-ischemic event; eligibility for cooling follows defined criteria (gestational age, timing, degree of encephalopathy).", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Supportive studies: blood gas/lactate, amplitude-integrated or conventional EEG, and MRI (typically after rewarming) to characterize injury.", citationIDs: ["openrn_neonatal"])
        ],
        priorityAssessments: [
            AttributedBullet("Neurologic status — level of alertness, tone, reflexes, and vigilant seizure watch (which may be subtle or subclinical; EEG monitoring is often used).", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("During cooling: continuous core temperature within the tight target range, plus cardiorespiratory monitoring — hypothermia causes expected bradycardia.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Skin integrity during cooling — cold, poorly perfused skin under a cooling device is at risk; inspect and reposition per protocol.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Multi-organ surveillance: urine output (kidney), coagulation and platelets, glucose, and blood pressure/perfusion.", citationIDs: ["openrn_neonatal"])
        ],
        commonInterventions: [
            AttributedBullet("Therapeutic hypothermia for eligible infants started within the defined post-birth window and maintained for the protocol duration, followed by slow, controlled rewarming — rapid rewarming can trigger seizures and rebound injury.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Meticulous supportive care: airway/ventilation, blood pressure and perfusion, glucose and electrolytes, and seizure management per protocol.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Avoid hyperthermia at all costs — elevated temperature worsens outcomes in the injured newborn brain.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Family communication and support — parents face frightening uncertainty about their infant's neurologic future; honest, repeated updates and early bonding within the constraints of cooling.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Coordinate developmental follow-up — outcomes range widely and require structured surveillance.", citationIDs: ["openrn_neonatal"])
        ],
        watchFor: [
            AttributedBullet("Seizures — frequently subclinical; act on EEG and clinical suspicion.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Rewarming complications — rebound seizures, hypotension; go slowly and monitor closely.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Coagulopathy, renal injury, hepatic dysfunction, and glucose instability from multi-organ hypoxic injury.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Cold injury to the skin under cooling equipment.", citationIDs: ["openrn_neonatal"])
        ],
        citations: [openrnNeo, aapNeo],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Intraventricular hemorrhage (IVH)

public enum IntraventricularHemorrhageDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "neonatal-ivh",
        title: "Intraventricular hemorrhage (IVH) of prematurity",
        subtitle: "Fragile germinal-matrix vessels · the first days of life are the high-risk window",
        nclexTags: neoNeuroTags,
        definition: AttributedProse(
            "Intraventricular hemorrhage is bleeding into the brain's ventricular system originating from the fragile germinal matrix, a complication predominantly of preterm and very-low-birth-weight infants. It is graded by severity, and most hemorrhages occur within the first days of life.",
            citationIDs: ["openrn_neonatal", "aap_neonatal_concept"]
        ),
        pathophysiology: AttributedProse(
            "The germinal matrix is a richly vascular, structurally immature region near the ventricles that involutes as gestation advances. Its delicate vessels are exquisitely sensitive to swings in cerebral blood flow and pressure. In the sick preterm infant, fluctuations from hypoxia, hypercarbia, blood-pressure instability, rapid fluid or bicarbonate boluses, pneumothorax, and even handling can rupture them — hence a care philosophy built around stability and gentleness.",
            citationIDs: ["openrn_neonatal"]
        ),
        presentation: [
            AttributedBullet("Often clinically silent, detected on routine screening cranial ultrasound in at-risk preterm infants.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("When symptomatic: a saltatory course (subtle changes in tone, activity, and stability) or, in severe hemorrhage, a catastrophic presentation — sudden deterioration, bulging fontanelle, falling hematocrit, apnea, seizures, and hemodynamic collapse.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Risk factors: extreme prematurity and low birth weight, respiratory distress and its treatment, hemodynamic instability, and the physiologic stresses of the first days of life.", citationIDs: ["aap_neonatal_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Cranial ultrasound (portable, no radiation) is the primary tool, performed on a screening schedule for at-risk infants and repeated to track evolution.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Graded by severity from confined germinal-matrix bleeding through hemorrhage with ventricular dilation and parenchymal involvement — grade informs prognosis and surveillance.", citationIDs: ["openrn_neonatal"])
        ],
        priorityAssessments: [
            AttributedBullet("Neurologic and stability trends: tone, activity, apnea/bradycardia spells, and fontanelle fullness.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Signs of significant hemorrhage: sudden pallor or falling hematocrit, hemodynamic change, seizures, and a tense fontanelle.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("For established IVH: serial head circumference and fontanelle assessment to detect post-hemorrhagic ventricular dilation (hydrocephalus).", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Physiologic stability — the assessment and the prevention are the same: avoid the swings that cause bleeding.", citationIDs: ["openrn_neonatal"])
        ],
        commonInterventions: [
            AttributedBullet("Prevention is the primary intervention: minimal-handling and clustered care, midline head positioning with the head of bed slightly elevated per protocol, and gentle procedures to avoid pressure and flow swings.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Maintain physiologic stability — avoid rapid fluid/bicarbonate boluses, wide swings in blood pressure, hypoxia, and hypercarbia; support antenatal steroids and delayed cord clamping as upstream preventive measures.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Serial cranial ultrasound surveillance for detection and to follow evolution and ventricular size.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("For progressive post-hemorrhagic hydrocephalus, neurosurgical involvement for CSF diversion per protocol.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Developmental follow-up and honest family communication about a prognosis that varies widely by grade.", citationIDs: ["openrn_neonatal"])
        ],
        watchFor: [
            AttributedBullet("Acute deterioration signaling large hemorrhage — apnea, seizures, falling hematocrit, tense fontanelle, hemodynamic instability.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Post-hemorrhagic hydrocephalus — rising head circumference, full fontanelle, sunsetting eyes, apnea.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("The upstream triggers you can influence at the bedside: pain, agitation, and physiologic swings during care.", citationIDs: ["openrn_neonatal"])
        ],
        citations: [openrnNeo, aapNeo],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Retinopathy of prematurity (ROP)

public enum RetinopathyPrematurityDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "retinopathy-prematurity",
        title: "Retinopathy of prematurity (ROP)",
        subtitle: "Abnormal retinal vessel growth · why oxygen targets are guarded so carefully",
        nclexTags: neoSafetyTags,
        definition: AttributedProse(
            "Retinopathy of prematurity is a disorder of developing retinal blood vessels in preterm infants that can progress to abnormal vessel proliferation, retinal detachment, and blindness. It is a leading preventable cause of childhood visual impairment, and screening plus timely treatment prevents most severe outcomes.",
            citationIDs: ["openrn_neonatal", "aap_neonatal_concept"]
        ),
        pathophysiology: AttributedProse(
            "Retinal vascularization is incomplete at preterm birth. After birth, relative hyperoxia and the loss of the intrauterine growth environment first halt normal vessel growth; later, the under-vascularized retina becomes hypoxic and drives disorganized, abnormal neovascularization. Those fragile new vessels can bleed and pull on the retina, causing traction and detachment. This is the concrete reason neonatal oxygen saturation targets are kept within careful bounds — too much oxygen fuels the disease.",
            citationIDs: ["openrn_neonatal"]
        ),
        presentation: [
            AttributedBullet("No outward symptoms — ROP is detected only by dilated retinal examination, which is exactly why screening exists.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Risk is driven by degree of prematurity and low birth weight, and by oxygen exposure and overall illness severity.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Described by zone (how far vessels have grown), stage (severity of abnormal growth), and the presence of 'plus disease' (dilated, tortuous vessels signaling activity).", citationIDs: ["openrn_neonatal"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serial dilated fundoscopic examinations by ophthalmology on a schedule based on gestational age and birth weight, continuing until the retina is mature or disease is treated.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Treatment thresholds are defined by zone/stage/plus disease; the screening program's job is to catch treatable disease before detachment.", citationIDs: ["openrn_neonatal"])
        ],
        priorityAssessments: [
            AttributedBullet("Oxygen saturation kept within the ordered target range with tight alarm limits — avoiding both hypoxia and hyperoxia is direct ROP prevention.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Ensure scheduled eye exams actually happen — track them; a missed exam is a missed window.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Support the infant through the stressful exam: comfort measures, and monitoring for apnea/bradycardia during and after.", citationIDs: ["openrn_neonatal"])
        ],
        commonInterventions: [
            AttributedBullet("Prevention through careful oxygen management is the everyday nursing contribution: maintain targeted saturations, respond to alarms, and avoid unnecessary oxygen swings.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Facilitate the screening program — positioning, comfort, and pupil dilation per protocol; the treatment window depends on the exam cadence.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("For disease meeting thresholds, ophthalmology-directed treatment (laser therapy or anti-VEGF injection per protocol); support the infant peri-procedure.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Family education about the need for continued eye follow-up after discharge — ROP survivors carry lifelong risk of refractive and retinal problems.", citationIDs: ["openrn_neonatal"])
        ],
        watchFor: [
            AttributedBullet("Apnea and bradycardia during and after dilated eye exams.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Missed or delayed screening exams — a systems failure with permanent consequences.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Oxygen saturations drifting above target — a modifiable driver of disease.", citationIDs: ["aap_neonatal_concept"])
        ],
        citations: [openrnNeo, aapNeo],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Patent ductus arteriosus (PDA)

public enum PatentDuctusArteriosusDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "patent-ductus-arteriosus",
        title: "Patent ductus arteriosus (PDA)",
        subtitle: "Fetal shunt that should close · common and consequential in the preterm infant",
        nclexTags: neoPerfusionTags,
        definition: AttributedProse(
            "The ductus arteriosus is a normal fetal vessel connecting the pulmonary artery and aorta that usually closes functionally soon after birth. When it stays open — most commonly and consequentially in preterm infants — a hemodynamically significant patent ductus arteriosus can strain the lungs and heart.",
            citationIDs: ["openrn_neonatal", "aap_neonatal_concept"]
        ),
        pathophysiology: AttributedProse(
            "After birth, rising oxygen and falling prostaglandins normally constrict and close the ductus. In the preterm infant this closure is often delayed. With systemic pressure now higher than pulmonary, blood shunts left-to-right from the aorta into the pulmonary circulation — overcirculating the lungs (worsening respiratory disease) and, in significant shunts, stealing systemic perfusion from the gut, kidneys, and brain during diastole.",
            citationIDs: ["openrn_neonatal"]
        ),
        presentation: [
            AttributedBullet("A murmur (classically continuous/systolic at the left upper sternal border), bounding peripheral pulses, and a widened pulse pressure.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Signs of pulmonary overcirculation: worsening respiratory status or difficulty weaning ventilatory support, tachypnea, and an active precordium.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Signs of systemic steal in a significant shunt: feeding intolerance, poor perfusion, and reduced urine output.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Most common and most significant in preterm infants, and often intertwined with RDS and its management.", citationIDs: ["aap_neonatal_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Echocardiography confirms the ductus, characterizes the shunt direction and size, and assesses hemodynamic significance — the exam that turns a murmur into a management decision.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Clinical significance (not mere presence) drives treatment — many small PDAs close on their own.", citationIDs: ["openrn_neonatal"])
        ],
        priorityAssessments: [
            AttributedBullet("Cardiorespiratory status and perfusion: work of breathing and oxygen/ventilator needs, pulse quality and pulse pressure, capillary refill, and precordial activity.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("End-organ perfusion markers: feeding tolerance, abdominal exam, and urine output — the systemic-steal footprint.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Fluid balance — these infants are fluid-sensitive, and excess fluid worsens the shunt's pulmonary load.", citationIDs: ["openrn_neonatal"])
        ],
        commonInterventions: [
            AttributedBullet("Supportive management first for many infants: judicious fluid management and optimized respiratory support, with close observation for spontaneous closure.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Pharmacologic closure per NICU protocol for a hemodynamically significant PDA (prostaglandin-inhibiting agents), with the nurse monitoring for the agents' renal, platelet, and GI effects.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Procedural closure (surgical ligation or catheter-based device) for a significant PDA that fails or is unsuitable for medical management; peri-procedure support and post-closure monitoring.", citationIDs: ["aap_neonatal_concept"]),
            AttributedBullet("Ongoing thermoregulation, nutrition, and clustered care as for any fragile preterm infant.", citationIDs: ["openrn_neonatal"])
        ],
        watchFor: [
            AttributedBullet("Worsening pulmonary status or inability to wean respiratory support — the shunt announcing significance.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Necrotizing enterocolitis risk from mesenteric steal — watch feeding tolerance and the abdominal exam closely.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Complications of pharmacologic treatment: reduced urine output, bleeding tendency, and GI effects.", citationIDs: ["openrn_neonatal"]),
            AttributedBullet("Signs of heart failure from a large, sustained shunt.", citationIDs: ["openrn_neonatal"])
        ],
        citations: [openrnNeo, aapNeo],
        lastSourceFidelityReview: "2026-07-03"
    )
}
