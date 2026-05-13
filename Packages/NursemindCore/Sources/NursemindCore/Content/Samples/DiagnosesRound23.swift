import Foundation

// Curator-model diagnosis entries (round 23 — obstetric emergencies + maternal-fetal high-risk + B12 deficiency).

private let openrnDxR23 = CitationSource(
    id: "openrn_dx_round23",
    shortName: "Open RN Maternity + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/maternal/",
    lastRetrieved: "2026-05-12"
)
private let cdcDxR23 = CitationSource(
    id: "cdc_dx_round23",
    shortName: "CDC + ACOG concept citations",
    publisher: "CDC · ACOG",
    license: .publicDomain,
    url: "https://www.cdc.gov/maternal-mortality/",
    lastRetrieved: "2026-05-12"
)
private let specialtyDxR23 = CitationSource(
    id: "specialty_dx_round23",
    shortName: "ACOG + SMFM + AHA + ASHEM concept citations",
    publisher: "ACOG · SMFM · AHA · ASH",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-05-12"
)

private let obEmergencyR23 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let obSafetyR23 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .safety)
private let hemR23 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)
private let psychR23 = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood)

public enum AmnioticFluidEmbolismSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "amniotic-fluid-embolism",
        title: "Amniotic fluid embolism (AFE)",
        subtitle: "Catastrophic intrapartum / postpartum · sudden cardiopulmonary collapse + DIC · supportive + MTP · 60-80% mortality",
        nclexTags: obEmergencyR23,
        definition: AttributedProse(
            "Rare catastrophic obstetric emergency — sudden onset of hypoxia + hypotension + coagulopathy during labor, delivery, or immediate postpartum (within 30 min). Incidence ~1 in 8,000-80,000 births. Maternal mortality 20-60% (lower with rapid recognition + supportive care + MTP); accounts for 5-15% of maternal deaths in developed countries per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "Now thought to be ANAPHYLACTOID syndrome of pregnancy (vs pure embolism) — fetal cells / amniotic components enter maternal circulation → mast cell + complement activation → severe immunologic / inflammatory response → pulmonary vasoconstriction + RV failure + LV dysfunction + capillary leak + coagulation cascade activation → DIC.",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("CLASSIC TRIAD — sudden hypoxia / hypotension / coagulopathy in laboring or peripartum patient.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Phase 1 (acute) — sudden dyspnea, hypotension, cyanosis, cardiac arrest, seizure, AMS within minutes.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Phase 2 (DIC) — uncontrolled hemorrhage from incision, IV sites, gums, GU; survivors enter this phase within 1 hour of acute event.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Fetal compromise — non-reassuring FHR; emergency cesarean if maternal cardiopulmonary arrest.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Risk factors — induction of labor, multiparity, advanced maternal age, polyhydramnios, multiple gestation, placental abruption, uterine rupture, cesarean / instrumented delivery, eclampsia (modest associations).", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis — no specific test; criteria — acute hypotension or cardiac arrest + acute hypoxia + coagulopathy + onset during labor, delivery, or within 30 min postpartum + no other clinical condition or potential explanation per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Echocardiogram (if available) — RV dilation, septal flattening; severe RV failure characteristic.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Coag panel — DIC labs (low fibrinogen, high D-dimer, prolonged PT/PTT, low platelets, decreased factors).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Postmortem — fetal squamous cells / mucin in pulmonary vasculature (historical diagnostic).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Differentiate — pulmonary embolism, anaphylaxis, sepsis, transfusion reaction, eclampsia, MI, anesthetic complications.", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("Recognize early — sudden cardiopulmonary collapse in laboring patient → CALL CODE + immediate ACLS.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("FHR + emergency cesarean preparation — perimortem cesarean within 5 min of arrest improves maternal + fetal outcomes per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("DIC labs + MTP activation; OB hemorrhage protocol.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Multidisciplinary — anesthesia, OB, ICU, hematology, neonatology.", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("ACLS — high-quality CPR with LEFT UTERINE DISPLACEMENT (manual or wedge); intubate; vasopressors per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PERIMORTEM CESAREAN — within 4-5 min of cardiac arrest if >20 weeks gestation; improves maternal hemodynamics + fetal survival.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MASSIVE TRANSFUSION PROTOCOL — pRBC + FFP + platelets + cryoprecipitate; fibrinogen replacement; tranexamic acid 1 g IV.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("VASOPRESSORS — norepinephrine first-line; vasopressin + epinephrine adjunct; supportive cardiac output.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("INHALED PULMONARY VASODILATORS — inhaled NO / epoprostenol for severe RV failure.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ECMO — refractory cardiopulmonary failure; case reports of successful recovery.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ICU admission post-resuscitation — TTM + neuro monitoring; coagulopathy correction.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MULTIDISCIPLINARY DEBRIEFING + family support; AFE Foundation patient + family resources.", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("PERIMORTEM CESAREAN within 4-5 min of arrest — most important intervention to improve maternal + fetal outcomes.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("DIC + UNCONTROLLED HEMORRHAGE — most common cause of death in survivors; aggressive transfusion + factor replacement.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("RV FAILURE — primary hemodynamic insult; norepi + dobutamine / milrinone; inhaled vasodilators.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("SURVIVOR neurologic outcomes — anoxic injury depends on duration of arrest + quality of CPR.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PSYCHOLOGICAL impact — family + staff PTSD common; debriefing + counseling.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("AFE FOUNDATION (afesupport.org) — patient + family + provider resources.", citationIDs: ["specialty_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PlacentaAccretaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "placenta-accreta",
        title: "Placenta accreta spectrum (PAS)",
        subtitle: "Abnormal placental adherence · prior cesarean + previa = high risk · MTP + cesarean hysterectomy · MFM + IR + anesthesia",
        nclexTags: obSafetyR23,
        definition: AttributedProse(
            "Spectrum of abnormal placental implantation with invasion into / through uterine wall — accreta (superficial), increta (myometrium), percreta (through serosa to adjacent organs). Major risk for catastrophic hemorrhage at delivery; planned cesarean hysterectomy preferred. Incidence rising with cesarean rates; ~1 in 533-2500 pregnancies per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "Defective decidualization — placenta villi adhere directly to myometrium without intervening decidua → invasion of trophoblast into uterine wall. Risk factors — prior cesarean (most important), prior PAS, advanced maternal age, multiparity, placenta previa, prior uterine surgery (myomectomy, D&C), Asherman syndrome, IVF.",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("Antenatal — usually asymptomatic; suspected on imaging (placenta previa + prior cesarean).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Antepartum bleeding — PAS often coexists with placenta previa; bleeding can be catastrophic.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Intrapartum — failure of placental separation after delivery + heavy bleeding; often discovered at cesarean for placenta previa.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Postpartum — retained placenta + hemorrhage if undiagnosed antenatally.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Severe variants (percreta) — bladder / bowel involvement; hematuria, abdominal pain.", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Ultrasound (gold standard) — multiple findings: placental lacunae (\"swiss cheese\"), loss of clear hypoechoic zone, abnormal uterovesical interface, placental bridging vessels.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MRI (adjunct) — for posterior placenta, distinguishing depth of invasion, bladder / bowel involvement; not always required.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PRENATAL screening — universal for high-risk (prior cesarean + previa, prior PAS, prior placental abnormalities).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("DEFINITIVE diagnosis — pathologic exam after delivery / hysterectomy.", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("Risk stratify — number of prior cesareans + presence of placenta previa.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Antenatal imaging — ultrasound at 18-24 weeks + repeat 28-32 weeks for high-risk.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Multidisciplinary planning — MFM, anesthesia, gyn-onc, urology, IR, blood bank, neonatology.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Patient counseling — risks (hemorrhage, hysterectomy, ICU, transfusion, neonatal morbidity, mortality).", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("PLANNED CESAREAN HYSTERECTOMY at 34-36 weeks (per NIH consensus 2018) — leaves placenta in situ to avoid catastrophic bleeding from manual removal per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PRENATAL CORTICOSTEROIDS at 34-36 weeks — fetal lung maturity given preterm delivery.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MULTIDISCIPLINARY TEAM — MFM, anesthesia (general / combined), gyn-onc / IR / urology, neonatology; CENTER OF EXCELLENCE referral preferred.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("BLOOD PRODUCTS prepared — 4-10 units pRBC + FFP + platelets + cryoprecipitate; cell-saver available.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("INTERVENTIONAL RADIOLOGY — preoperative balloon catheters in internal iliac arteries OR aortic; reduces blood loss.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PERIOPERATIVE — central line, arterial line, large-bore IV access × 2; hourly monitoring; ICU admission post-op.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CONSERVATIVE management (selected — e.g., desire fertility) — leave placenta in situ + methotrexate + close follow-up; high risk of hemorrhage / infection / hysterectomy later.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Counseling — future fertility lost (hysterectomy); psychological support.", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("MASSIVE HEMORRHAGE — most catastrophic; transfusion + IR embolization + hysterectomy.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("URETERAL INJURY — common in percreta with bladder involvement; urology consultation.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MATERNAL MORTALITY — ~5-7% historically; reducing with planned multidisciplinary management at experienced centers.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PRETERM DELIVERY — neonatal morbidity from prematurity (RDS, IVH, NEC).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PSYCHOLOGICAL — loss of fertility, prolonged hospitalization, NICU baby; counseling + support.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("FUTURE PREGNANCY — none possible after hysterectomy; counsel adoption / surrogacy options.", citationIDs: ["specialty_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum StillbirthSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "stillbirth",
        title: "Stillbirth (intrauterine fetal demise, IUFD)",
        subtitle: "Fetal death ≥20 weeks · induction or D&E delivery · workup for cause · BEREAVEMENT central · subsequent pregnancy planning",
        nclexTags: psychR23,
        definition: AttributedProse(
            "Fetal death at ≥20 weeks gestation (US definition) or weight ≥350 g (CDC). Affects ~1 in 175 US pregnancies (5.7 per 1,000); higher in racial / ethnic minorities. Causes include placental dysfunction, congenital anomalies, infection, cord events, hypertensive disorders, diabetes — but ~25-50% remain unexplained per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — placental insufficiency (FGR-related), fetal anomalies / chromosomal, infection (chorioamnionitis, maternal infection — CMV, parvovirus, listeria, syphilis), umbilical cord accidents, hypertensive disorders, diabetes / GDM, autoimmune / antiphospholipid syndrome, placental abruption, multifetal complications.",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("DECREASED / ABSENT FETAL MOVEMENT — most common patient-reported.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Absent FHR on Doppler; ultrasound confirms (no cardiac activity, no movement).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Antepartum or intrapartum (intrapartum less common with modern monitoring).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Risk factors — advanced maternal age, smoking, obesity, multiparity, prior stillbirth, multifetal, FGR, hypertensive disorders, diabetes, antiphospholipid antibody, lupus, smoking, substance use, low SES, racial / ethnic disparity.", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Ultrasound — no cardiac activity (definitive); confirm with second observer / second machine for sensitive emotional confirmation.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Workup for cause — autopsy (gold standard), placental pathology, fetal karyotype / chromosomal microarray, antiphospholipid antibodies, CBC, comprehensive metabolic panel, A1c, TSH, parvovirus IgM, syphilis, indirect Coombs, KB stain, drug screen.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Fetal MRI — alternative to autopsy if family declines.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Fetal photographs + footprints + handprints + locks of hair — bereavement memory-making.", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("EMOTIONAL support — break news compassionately, allow time, repeat as needed.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Mode + timing of delivery — patient-centered shared decision; expectant management vs induction vs D&E.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Workup for cause — counsel + offer (some families decline; respect).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Bereavement coordinator + chaplaincy + perinatal loss services.", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("DELIVERY — induction (mifepristone + misoprostol; oxytocin) for ≥20 weeks; D&E for selected <24 weeks; cesarean for obstetric indications only per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MIFEPRISTONE 200 mg PO 24-48h before misoprostol — improves induction efficiency.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PAIN MANAGEMENT — IV / epidural; full attention to comfort; presence + continuity.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("BEREAVEMENT memory-making — photos, footprints / handprints, lock of hair, blanket, certificate; offer time with baby; respect family wishes.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("LACTATION suppression counseling — cabergoline 1 mg single dose OR supportive (snug bra, cold compresses, no expression).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ANTIBODY screen + Rh prophylaxis if Rh-negative.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("VTE prophylaxis postpartum — increased risk after stillbirth.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PSYCHOLOGICAL care — perinatal grief specialist; mental health screening + referral; antidepressants if needed; partner / family support.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("SUBSEQUENT pregnancy — counsel; preconception planning + monitoring; modify modifiable risk factors; close fetal surveillance in next pregnancy.", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("MENTAL HEALTH — depression + anxiety + PTSD + complicated grief; screen at 2 weeks + 6 weeks + 6 months + 1 year postpartum per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("RECURRENT stillbirth — risk increased ~5-10×; preconception consultation + close monitoring.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ANTIPHOSPHOLIPID SYNDROME — workup; treatment with aspirin + LMWH in subsequent pregnancy.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("RACIAL / ETHNIC DISPARITY — Black women 2-3× higher stillbirth rate; address SDOH + bias in care.", citationIDs: ["cdc_dx_round23"]),
            AttributedBullet("FAMILY SUPPORT — partner grief often overlooked; sibling grief in younger children; bereavement resources for all.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("STAFF SECONDARY TRAUMA — debriefing, peer support; healthcare worker bereavement.", citationIDs: ["specialty_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ShoulderDystociaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "shoulder-dystocia",
        title: "Shoulder dystocia",
        subtitle: "Anterior shoulder impacted on pubic symphysis · OB EMERGENCY · McRoberts + suprapubic pressure first · brachial plexus + asphyxia risk",
        nclexTags: obEmergencyR23,
        definition: AttributedProse(
            "Obstetric emergency — failure of anterior shoulder to deliver after head despite gentle traction; requires additional maneuvers. Affects ~0.6-1.4% of vaginal deliveries; risks include neonatal brachial plexus injury (Erb's palsy), clavicle fracture, asphyxia, maternal hemorrhage / perineal trauma per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "Anterior shoulder impacts above maternal pubic symphysis after head delivery. Risk factors — fetal macrosomia (>4500 g), maternal diabetes (especially GDM with macrosomia), prior shoulder dystocia, post-dates, prolonged 2nd stage, instrumented delivery, obesity, excessive maternal weight gain, advanced maternal age. ~50% no risk factors.",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("\"TURTLE SIGN\" — fetal head retracts against perineum after delivery (head emerges then pulls back).", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Failure of restitution + external rotation of head.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Failure of anterior shoulder to descend with gentle downward traction.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Most occur in normal-sized infants WITHOUT classic risk factors — maintain readiness universally.", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL DIAGNOSIS at delivery — turtle sign + failure of routine delivery techniques.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Time stamp — when head delivers, when shoulder delivers; documentation essential per ACOG guidelines.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Risk stratify post-event — fetal weight, maternal characteristics, maneuvers needed, time to delivery, neonatal exam.", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("Recognize EARLY — turtle sign + failure of gentle traction.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CALL FOR HELP — additional staff, anesthesia, neonatology, additional providers.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("DOCUMENT timing of head + shoulder delivery; maneuvers attempted in order; team members; outcome.", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("HELPERR mnemonic — Help, Episiotomy (if appropriate), Legs (McRoberts), Pressure (suprapubic), Enter (Rubin), Rotational (Wood's screw), Remove (posterior arm) per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("McROBERTS MANEUVER — flatten lumbar lordosis by hyperflexing maternal hips against abdomen; resolves ~40% per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("SUPRAPUBIC PRESSURE — assistant applies downward + lateral pressure ABOVE PUBIC SYMPHYSIS (not fundal — worsens) toward fetal back; combined with McRoberts resolves >80%.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("EPISIOTOMY — adjunctive; provides space for internal maneuvers; not always necessary.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("RUBIN II — pressure on posterior aspect of anterior shoulder to adduct + rotate to oblique.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("WOOD'S CORKSCREW — clockwise rotation of posterior shoulder 180° to anterior position.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("DELIVERY OF POSTERIOR ARM — most successful single maneuver after McRoberts + SPP fail; ~70-80% per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("GASKIN MANEUVER (all-fours position) — patient on hands + knees; gravity assists; useful when standard maneuvers fail.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("LAST RESORTS — Zavanelli (push head back + emergent cesarean), symphysiotomy, abdominal rescue.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Minimize cumulative time to delivery — fetal asphyxia risk increases >5-7 minutes.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Postnatal neonatal exam — brachial plexus, clavicle / humerus, Apgars, cord gases.", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("BRACHIAL PLEXUS INJURY (Erb's palsy ~50% of cases C5-C6; Klumpke's C8-T1 less common) — most resolve spontaneously by 12 months; persistent → neuro / surgical eval.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CLAVICLE / HUMERUS FRACTURE — common; usually heal well without intervention.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("HYPOXIC-ISCHEMIC ENCEPHALOPATHY — prolonged shoulder dystocia (>5-7 min); cord gases for documentation; therapeutic hypothermia if criteria met.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MATERNAL — postpartum hemorrhage from uterine atony / cervical / vaginal lacerations; perineal injury; diastasis pubis.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("LITIGATION risk — meticulous documentation of maneuvers + timing + team members essential per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("RECURRENCE in subsequent pregnancy — modest increase; counsel; consider planned cesarean for severe prior dystocia.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("STAFF DEBRIEFING — review event, learn, address emotional impact.", citationIDs: ["specialty_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum UmbilicalCordProlapseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "umbilical-cord-prolapse",
        title: "Umbilical cord prolapse",
        subtitle: "OB EMERGENCY · cord precedes / alongside fetal part · KNEE-CHEST + manual elevation + emergent cesarean · seconds count",
        nclexTags: obEmergencyR23,
        definition: AttributedProse(
            "Umbilical cord descends past presenting part during ROM (overt — visible at vulva or palpated alongside presenting part) or before delivery (occult — cord beside / behind presenting part). Causes acute fetal compromise from cord compression; demands emergent delivery (typically cesarean). Incidence ~0.1-0.6% of deliveries per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "Cord compressed between presenting part + maternal pelvis → vasoconstriction → reduced fetal oxygen / blood flow → bradycardia → hypoxic-ischemic injury / death within minutes if not relieved.",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("Visible cord at vulva (overt) OR palpable cord during cervical exam (often after ROM).", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("ABRUPT FETAL BRADYCARDIA / variable decelerations after ROM or cervical exam — major clue for occult prolapse.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Risk factors — non-cephalic presentation (breech > transverse > footling), preterm, polyhydramnios, multiparity, multiple gestation, low birth weight, ROM with non-engaged head, internal version, uterine anomalies, long cord.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Hospital-acquired vs community-acquired prolapse — different outcome trajectories; hospital prolapse typically better outcomes due to rapid response.", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — visible cord, palpable cord, or sudden FHR deceleration after ROM.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Cervical exam — confirm prolapse + assess dilation + station + presenting part.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Document time of recognition + maternal interventions + time to delivery + neonatal status.", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("RECOGNIZE — sudden bradycardia after ROM; cervical exam IMMEDIATELY.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CALL CODE / RAPID RESPONSE — OB, anesthesia, neonatology, OR ready.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("FETAL station + dilation + viability + fetal heart rate.", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("ELEVATE PRESENTING PART manually — examiner inserts hand into vagina + lifts presenting part off cord; KEEP HAND IN PLACE during transport per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MATERNAL POSITIONING — KNEE-CHEST OR Trendelenburg with extreme hip elevation; gravity assists in moving fetus off cord.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("FILL BLADDER — 500-700 mL via Foley to elevate presenting part if delay anticipated (transport).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("EMERGENT CESAREAN — within minutes; \"crash\" / Code Pink delivery; aim decision-to-delivery <30 min, ideally <10 min.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("VAGINAL DELIVERY — only if fully dilated + presenting part station +2 or below + delivery achievable rapidly (operative vaginal); rare scenario.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("KEEP CORD WARM + MOIST — minimize handling; avoid vasoconstriction from exposure.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("AVOID stopping CONTRACTIONS via terbutaline — controversial; some advocate; controversial benefit + delays cesarean.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Continuous FHR + maternal vital signs during transport.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Postnatal — neonatal resuscitation team present; cord gases; HIE evaluation if criteria.", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("HYPOXIC-ISCHEMIC ENCEPHALOPATHY (HIE) — proportional to duration of compromise; therapeutic hypothermia within 6 hrs improves neuro outcome.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("FETAL DEATH — within minutes if cord severely compressed; outcomes much worse for community-acquired prolapse.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CEREBRAL PALSY — risk increases with duration of cord compromise.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MATERNAL — emergent cesarean complications; psychological trauma; debrief.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("LITIGATION — meticulous documentation of recognition, maneuvers, decision time, delivery time, team members.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PREVENTION — avoid amniotomy in non-engaged heads; counsel out-of-hospital provider awareness.", citationIDs: ["specialty_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum UterineRuptureSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "uterine-rupture",
        title: "Uterine rupture",
        subtitle: "Catastrophic disruption of uterine wall · prior cesarean (TOLAC) main risk · fetal heart rate change first sign · emergent cesarean",
        nclexTags: obEmergencyR23,
        definition: AttributedProse(
            "Disruption of uterine wall — complete (through all layers) or incomplete (peritoneum intact). True uterine rupture is obstetric emergency — fetal extrusion + maternal hemorrhage. Most occur in patients attempting trial of labor after cesarean (TOLAC); also unscarred uterus from trauma, hyperstimulation, congenital anomaly, prior surgery per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "Disruption typically at site of prior uterine scar (low transverse cesarean — risk ~0.5-0.9%; classic vertical cesarean — much higher). Unscarred uterus rupture rare (~1 in 8,000-15,000) — usually grand multiparity, oxytocin / misoprostol hyperstimulation, trauma, uterine anomaly.",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("FETAL HEART RATE abnormalities — most common + earliest sign (variable / late decelerations / bradycardia / loss of variability) per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CONSTANT severe abdominal pain (\"tearing\" sensation) often DURING contraction — historically classic.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("LOSS of station + recession of presenting part.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Maternal hypotension + tachycardia + signs of intra-abdominal hemorrhage.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Sudden cessation of contractions; abnormal contour of abdomen (loss of fundus / extruded fetal parts palpable).", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Vaginal bleeding may be modest despite severe blood loss (intra-abdominal).", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Risk factors — TOLAC (especially classical scar, prior rupture, ≥2 prior cesareans, high-dose oxytocin), trauma, hyperstimulation, fetal macrosomia, abnormal lie, congenital anomalies.", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — abnormal FHR + maternal symptoms.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CONFIRMED at LAPAROTOMY — visualized rupture site, bleeding, fetal extrusion.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Ultrasound — for pre-labor evaluation; not diagnostic during acute event.", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("FHR + maternal vitals + abdominal exam in ANY TOLAC patient — at every cervical exam.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Abnormal FHR after ROM / oxytocin in TOLAC = consider rupture until proven otherwise.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Activate massive transfusion + emergency response.", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("EMERGENT CESAREAN / LAPAROTOMY — within minutes per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("STOP OXYTOCIN immediately if running.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MASSIVE TRANSFUSION PROTOCOL — pRBC + FFP + platelets + cryoprecipitate; tranexamic acid 1 g IV.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("UTERINE REPAIR vs HYSTERECTOMY — depends on extent of rupture, hemodynamic stability, future fertility wishes; hysterectomy often necessary.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("BLADDER + URETER assessment — adjacent organ injury common.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("VASOPRESSORS for hemodynamic support; ICU admission post-op.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Neonatal resuscitation — high risk hypoxic-ischemic injury; cord gases.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Counsel — future pregnancies very high recurrence risk; planned cesarean if uterus repaired.", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("MATERNAL DEATH — high mortality without rapid intervention.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("FETAL DEATH / HIE — high if delivery delayed; therapeutic hypothermia consideration.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("HYSTERECTOMY — common (loss of fertility); psychological + family planning impact.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("BLADDER / URETER INJURY — urology consult intraoperatively.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("FUTURE PREGNANCY — recurrence ~6% if repaired (vs 0.5% in primary); planned cesarean at 36-37 weeks; counsel.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PSYCHOLOGICAL — trauma + loss of pregnancy + potential loss of fertility; counseling.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("TOLAC counseling — informed consent must include rupture risk; institutional capability for emergent cesarean within 30 min essential per primary source.", citationIDs: ["specialty_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum HydatidiformMoleSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hydatidiform-mole",
        title: "Hydatidiform mole + gestational trophoblastic disease (GTD)",
        subtitle: "Abnormal trophoblastic proliferation · complete vs partial · D&C + monitor β-hCG · choriocarcinoma risk · contraception × 1 year",
        nclexTags: obSafetyR23,
        definition: AttributedProse(
            "Spectrum of trophoblastic proliferative disorders — hydatidiform mole (complete + partial — benign but pre-malignant), invasive mole, choriocarcinoma, placental site trophoblastic tumor (PSTT), epithelioid trophoblastic tumor. Affects ~1 in 1000 pregnancies per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "COMPLETE MOLE — paternal-only chromosomes (46,XX or 46,XY); empty ovum fertilized by sperm; no fetal tissue; high pre-malignant potential (~15-20% develop persistent GTD). PARTIAL MOLE — triploid (69,XXY); fetus + placenta both abnormal; lower malignancy potential (~1-5%). Both proliferate trophoblastic tissue → high β-hCG.",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("Vaginal bleeding (most common, 90%) — first trimester typically; \"prune juice\" or grape-like vesicles.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Uterus larger than dates (~50% complete mole, less common partial).", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Severe nausea / vomiting (high β-hCG); hyperemesis.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("EARLY preeclampsia (<20 weeks gestation — pathognomonic for mole); HTN + proteinuria.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Hyperthyroidism from β-hCG cross-reactivity with TSH receptor (10% complete mole).", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Theca lutein cysts (large bilateral ovarian cysts from β-hCG stimulation).", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Risk factors — extremes of maternal age (<20 + >35), prior molar pregnancy, Asian + Hispanic ethnicity (somewhat higher), low socioeconomic / nutritional status.", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Ultrasound — \"snowstorm\" appearance (complete mole — vesicular pattern); fetal parts present in partial mole; theca lutein cysts on ovaries.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("β-hCG — abnormally elevated (>100,000 mIU/mL common in complete mole).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Histopathology after D&C — definitive diagnosis; complete vs partial mole determined by cytogenetics + histology.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CXR — pulmonary metastases workup if persistent disease / choriocarcinoma suspected.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CBC, CMP, coag, TSH, baseline labs.", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — preeclampsia, hyperthyroidism complications.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("β-hCG trend; baseline CXR for metastases.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Ovarian status — theca lutein cysts; usually regress after evacuation.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Patient education — diagnosis, treatment, contraception, follow-up.", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("D&C (suction curettage) — first-line; with oxytocin available for hemorrhage; pathology confirms diagnosis per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("HYSTERECTOMY — option for women not desiring future fertility (lower risk of persistent GTD vs D&C alone).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Rh-NEGATIVE patients — give RhoGAM after evacuation.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("β-hCG MONITORING — weekly until 3 consecutive negatives, then monthly × 6 months (complete) / 3 months (partial); detects persistent GTD per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CONTRACEPTION × 6-12 months after β-hCG normalizes — reliable contraception (oral / IUD / barrier); prevents confusion of pregnancy vs disease per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PERSISTENT GTD or CHORIOCARCINOMA — methotrexate (single-agent) or actinomycin-D for low-risk; multi-agent (EMACO) for high-risk; >90% cure rate even metastatic per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Refer to gynecologic oncology for persistent / malignant GTD.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Counsel — future pregnancy outcomes typically normal; ~1-2% recurrence risk; first ultrasound 6-8 weeks of next pregnancy.", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("PERSISTENT GTD — plateau / rise in β-hCG; ~15-20% complete moles, 1-5% partial; methotrexate / EMACO highly effective.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CHORIOCARCINOMA — aggressive malignancy; vaginal bleeding + hemoptysis (lung mets) + neuro symptoms (CNS mets); >90% cure with chemo even high-risk.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("HEMORRHAGE during D&C — be prepared with uterotonics, blood products, hysterectomy capability.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PULMONARY EMBOLI / METASTASES — small share of patients; CXR baseline.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("HYPERTHYROIDISM CRISIS — pre-D&C high β-hCG; β-blockers, anti-thyroid meds; usually resolves after evacuation.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PSYCHOLOGICAL impact — pregnancy loss + cancer-like diagnosis + delayed pregnancy planning; counseling + support resources.", citationIDs: ["specialty_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum RecurrentPregnancyLossSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "recurrent-pregnancy-loss",
        title: "Recurrent pregnancy loss (RPL)",
        subtitle: "≥2 consecutive losses · workup APL syndrome / uterine / endo · ASA + LMWH for APS · 60-70% subsequent live birth",
        nclexTags: obSafetyR23,
        definition: AttributedProse(
            "≥2 consecutive clinically recognized pregnancy losses (per ASRM 2020 — was ≥3 historically). Affects ~1-5% of women trying to conceive. ~50% have identifiable cause; ~50% unexplained; subsequent live birth rate 60-70% per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — genetic / chromosomal abnormalities (most common ~50% identified), antiphospholipid antibody syndrome (10-15%), anatomic uterine factors (septate, fibroid, adhesions), endocrine (PCOS, thyroid, prolactin, diabetes, luteal phase), thrombophilia, environmental (smoking, alcohol), age (>35 increased aneuploidy), male factor (rare).",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("≥2 consecutive losses (clinically recognized — biochemical or clinical / ultrasound documented).", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Most losses occur first trimester (chromosomal); later losses suggest different etiology.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Patient + partner emotional + psychological distress significant.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Risk factors — advanced maternal age (>35 doubles risk; >40 triples), prior pregnancy loss, smoking, alcohol, obesity, DM, autoimmune disease.", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Workup after 2 consecutive losses (not waiting for 3) per ASRM 2020.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CHROMOSOMAL — karyotype both partners; chromosomal microarray on products of conception (POC) when available.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ANTIPHOSPHOLIPID — lupus anticoagulant + anti-cardiolipin IgG/IgM + anti-β2-glycoprotein-I IgG/IgM; positive tests on 2 separate occasions ≥12 weeks apart.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("UTERINE — sonohysterography or hysterosalpingography or 3D ultrasound or MRI for septate, fibroids, adhesions.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ENDOCRINE — TSH (subclinical hypothyroidism debated); HbA1c if diabetic; PCOS workup; prolactin.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("INHERITED THROMBOPHILIA — Factor V Leiden, prothrombin G20210A, antithrombin, protein C/S — controversial; routine testing not recommended unless personal / family history of VTE.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("LIFESTYLE — smoking, alcohol, BMI; counsel + modify before next pregnancy.", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("Comprehensive workup at 2nd consecutive loss.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Psychological + emotional assessment + grief support.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Partner involvement in workup + decision-making.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Modifiable risk factor optimization preconception.", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("ANTIPHOSPHOLIPID SYNDROME — aspirin 81 mg + LMWH (prophylactic or therapeutic) throughout pregnancy + 6 weeks postpartum per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CHROMOSOMAL — preimplantation genetic testing (PGT) with IVF for translocation carriers.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("UTERINE SEPTUM — hysteroscopic resection if symptomatic.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("UTERINE FIBROIDS — myomectomy if cavity-distorting; controversial otherwise.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("INTRAUTERINE ADHESIONS (Asherman) — hysteroscopic lysis.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ENDOCRINE — thyroid replacement, glycemic optimization, weight management; treat PCOS.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("LIFESTYLE — smoking cessation + alcohol abstinence + caffeine moderation + healthy weight + folic acid 400-800 mcg.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("UNEXPLAINED RPL — supportive care; close monitoring of next pregnancy; tender loving care (TLC) effective.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PSYCHOLOGICAL support throughout — perinatal grief counseling; support groups.", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("ANTIPHOSPHOLIPID SYNDROME — also increases stroke + DVT risk; long-term anticoagulation may be needed beyond pregnancy.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PROGESTERONE supplementation — not routinely recommended (PROMISE trial); does not improve live birth in unexplained RPL.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("INHERITED THROMBOPHILIA — does not appear to cause RPL alone (controversial); LMWH not routinely indicated unless personal VTE history.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("TLC + close monitoring — ultrasounds q1-2 weeks first trimester improves outcomes in unexplained RPL.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MENTAL HEALTH — depression + anxiety + complicated grief + relationship stress; counsel + screen + refer.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Subsequent live birth rate 60-70% even after 3 losses with treatment; counsel hopefully but realistically.", citationIDs: ["specialty_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum IUGRSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "iugr",
        title: "Intrauterine growth restriction (IUGR / FGR)",
        subtitle: "EFW <10th percentile · symmetric vs asymmetric · placental insufficiency most common · serial Doppler + delivery timing",
        nclexTags: obSafetyR23,
        definition: AttributedProse(
            "Failure of fetus to reach genetically determined growth potential. Defined by estimated fetal weight (EFW) <10th percentile for gestational age (some use <3rd, or <10th + abnormal Doppler / oligohydramnios). Major cause of perinatal morbidity / mortality. ~5-10% of pregnancies per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "PLACENTAL INSUFFICIENCY (most common) — abnormal trophoblastic invasion → reduced uteroplacental perfusion → reduced nutrient + oxygen delivery → asymmetric IUGR (head-sparing). MATERNAL — HTN, preeclampsia, smoking, alcohol, drugs, malnutrition, autoimmune, antiphospholipid. FETAL — chromosomal anomalies, structural anomalies, infection (TORCH), multifetal — symmetric IUGR (whole body proportional).",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("ANTENATAL — small fundal height, EFW <10th percentile on serial growth scans.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Symmetric IUGR (~20-30%) — whole body proportional small; early onset (≤20 weeks); congenital / chromosomal / infection.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Asymmetric IUGR (~70-80%) — head-sparing, abdomen + extremities small; late onset; placental insufficiency; head circumference normal until severe.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Oligohydramnios (AFI <5 cm or DVP <2 cm) — common with placental insufficiency.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Risk factors — chronic HTN, preeclampsia, T1/2 DM with vasculopathy, prior IUGR, multifetal, smoking, alcohol / drugs, autoimmune, congenital anomalies, infections.", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Ultrasound — EFW <10th percentile for gestational age; abdominal circumference <10th particularly important.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("UMBILICAL ARTERY DOPPLER — assesses placental resistance; absent / reversed end-diastolic flow = severe.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MIDDLE CEREBRAL ARTERY DOPPLER — \"brain-sparing\" — increased cerebral flow.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("DUCTUS VENOSUS DOPPLER — abnormal a-wave indicates severe; pre-terminal.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("AMNIOTIC FLUID INDEX (AFI) — oligohydramnios common.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("BIOPHYSICAL PROFILE (BPP) — fetal well-being; ≤6 = concerning.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Fetal anomaly screen — anatomic ultrasound, screen TORCH, karyotype if early onset / structural anomalies.", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("Serial growth scans every 3-4 weeks once IUGR identified.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Doppler studies + AFI weekly to twice-weekly per severity.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Modifiable risk factors — smoking, alcohol, drugs, BP control.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Identify cause — placental vs maternal vs fetal.", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("MFM REFERRAL — comprehensive workup + management; tertiary care for severe.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MATERNAL OPTIMIZATION — BP control (labetalol / methyldopa / nifedipine), glycemic control, smoking cessation, treat infections.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ASPIRIN 81-162 mg/day — for high-risk pregnancies (prior IUGR, HTN, autoimmune); start 12-16 weeks.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("BED REST — limited evidence; not routinely recommended.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Serial fetal surveillance — twice-weekly NST + AFI for severe IUGR; weekly for mild-moderate.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CORTICOSTEROIDS for fetal lung maturity if delivery anticipated <34 weeks (single course betamethasone IM 12 mg q24h × 2).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("DELIVERY TIMING — depends on severity, gestational age, Doppler findings; balance prematurity vs in-utero compromise; planned at 37-38 weeks for stable IUGR; earlier for absent/reversed end-diastolic flow per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MAGNESIUM SULFATE for fetal neuroprotection if <32 weeks.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Postnatal — neonatal team available; cord gases; assessment for hypoglycemia, polycythemia, hypothermia.", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("STILLBIRTH risk — 4-8× higher than appropriate-for-gestational-age fetuses; close surveillance.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PRETERM DELIVERY — for severe IUGR; balance prematurity risks.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PERINATAL MORTALITY 5-10× higher.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("LONG-TERM — lower IQ, neurodevelopmental delays (especially symmetric IUGR), cardiometabolic risks (Barker hypothesis — adult HTN, diabetes, obesity).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("RECURRENCE — increased risk in subsequent pregnancies; preconception counseling + early aspirin.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MATERNAL — preeclampsia common in same pregnancy; surveillance.", citationIDs: ["specialty_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PostpartumCardiomyopathySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "postpartum-cardiomyopathy",
        title: "Peripartum cardiomyopathy (PPCM)",
        subtitle: "HF in last month pregnancy or 5 months postpartum · LVEF <45% · GDMT + bromocriptine adjunct · 50-70% recover · contraception",
        nclexTags: obSafetyR23,
        definition: AttributedProse(
            "Idiopathic systolic heart failure with LVEF <45% in last month of pregnancy OR within 5 months postpartum, in absence of identifiable cause + prior cardiac dysfunction. Affects ~1 in 1000-4000 US pregnancies; higher in Black women + certain regions. Recovery rate 50-70% within 6-12 months per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — cleaved 16 kDa fragment of prolactin (anti-angiogenic), vascular dysfunction, hemodynamic stress of pregnancy, inflammation, oxidative stress, autoimmune, viral infection. Genetic predisposition (TTN, MYH7 mutations). Final common pathway — LV dilation + reduced systolic function.",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("HEART FAILURE symptoms — dyspnea, orthopnea, paroxysmal nocturnal dyspnea, fatigue, edema, palpitations, decreased exercise tolerance.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Often masked by normal pregnancy symptoms (dyspnea, edema) — high index of suspicion needed.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Severe — pulmonary edema, cardiogenic shock, arrhythmia, embolism, sudden death.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Risk factors — Black race / African ancestry, advanced maternal age, multiparity, multifetal, preeclampsia / HTN, gestational diabetes, smoking, low SES, regional (Haiti, Nigeria higher).", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECHOCARDIOGRAM — LVEF <45% in last month pregnancy OR within 5 months postpartum without prior cardiac history per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("BNP / NT-proBNP — elevated (BNP often >100 pg/mL in PPCM, much higher than normal pregnancy).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Troponin — usually normal; elevated suggests myocarditis / ischemic cause.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ECG — sinus tachycardia common; LBBB, LVH, atrial fibrillation, T wave changes possible.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Cardiac MRI — selected; assesses myocardial fibrosis + viability.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Rule out — preeclampsia / cardiac MRI for myocarditis / aortic dissection / PE.", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("Hemodynamic stability — vital signs, oxygen saturation, perfusion.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Volume status — pulmonary edema, edema, weight.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Multidisciplinary — MFM, cardiology, anesthesia, neonatology.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Future pregnancy counseling — high recurrence risk if LV not normalized.", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("STANDARD HF GDMT — adapted for pregnancy / lactation per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("DURING PREGNANCY — labetalol or metoprolol (β-blocker preferred), hydralazine + nitrates (afterload), digoxin (rate control / inotropy), loop diuretics for congestion (caution oligohydramnios); AVOID ACE inhibitors / ARBs / ARNI / SGLT2i (teratogenic) per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("POSTPARTUM — ACE inhibitor / ARB / ARNI, β-blocker (preferred carvedilol), MRA (spironolactone / eplerenone), loop diuretic, SGLT2 inhibitor — full GDMT.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("BROMOCRIPTINE — investigational adjunct (suppresses prolactin); 2.5 mg PO BID × 2 weeks then 2.5 mg/day × 6 weeks; some evidence improves recovery; controversial; combined with antibreast cancer rate; coordinate with HF specialist per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ANTICOAGULATION — high VTE risk; prophylactic LMWH; therapeutic if LVEF <35% + atrial fibrillation / known thrombus.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("DELIVERY — vaginal preferred unless OB indication; epidural for hemodynamic stability; close monitoring; cardiac anesthesia.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("LACTATION — bromocriptine suppresses; some recommend formula feeding to allow bromocriptine + reduce metabolic demand; controversial per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("SERIAL ECHO — at 2 weeks, 6 weeks, 6 months, 12 months postpartum.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ICD / advanced HF therapy — for persistent severe LV dysfunction.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("FUTURE PREGNANCY counseling — strongly discouraged if persistent LV dysfunction (recurrence + worsening + maternal mortality high); reliable contraception (avoid estrogens with HF).", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("CARDIOGENIC SHOCK — IABP, ECMO, mechanical support; LVAD bridge to recovery / transplant.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ARRHYTHMIA — atrial fibrillation, ventricular tachycardia; sudden cardiac death risk.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("THROMBOEMBOLISM — VTE prophylaxis + therapeutic if low EF / Afib.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("RECURRENCE — 30-50% risk in subsequent pregnancy; much higher mortality if LV not recovered fully.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("INCOMPLETE RECOVERY — 30-50% have persistent LV dysfunction; ongoing HF management.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PSYCHOLOGICAL — postpartum depression intensified by chronic illness; counseling + support.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("RACIAL DISPARITY — Black women higher incidence + worse outcomes; address SDOH + bias in care.", citationIDs: ["cdc_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum VitaminB12DeficiencySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "vitamin-b12-deficiency",
        title: "Vitamin B12 deficiency",
        subtitle: "Macrocytic anemia + neuro symptoms · pernicious anemia / vegan / malabsorption / metformin · oral high-dose effective most",
        nclexTags: hemR23,
        definition: AttributedProse(
            "Cobalamin deficiency causing megaloblastic anemia + neurologic dysfunction. Causes — pernicious anemia (autoimmune intrinsic factor deficiency), atrophic gastritis, gastrectomy / bariatric surgery, terminal ileum disease, strict vegan diet (>1 year), prolonged PPI / metformin / colchicine. Affects ~6-15% of elderly per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "B12 cofactor for methylmalonyl-CoA mutase + methionine synthase → DNA synthesis (megaloblastic anemia from impaired RBC maturation), homocysteine → methionine, fatty acid synthesis (myelin maintenance). Deficiency → ineffective hematopoiesis + demyelination → progressive neurologic damage (irreversible if delayed).",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("HEMATOLOGIC — macrocytic anemia (MCV >100), pancytopenia in severe; hypersegmented neutrophils.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("NEUROLOGIC — paresthesias (fingertips + toes), peripheral neuropathy, ataxia, decreased proprioception / vibration, hyperreflexia (subacute combined degeneration of dorsal + lateral columns).", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("PSYCHIATRIC — cognitive impairment, dementia (sometimes reversible), depression, psychosis, irritability.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("OTHER — glossitis (smooth red \"beefy\" tongue), angular cheilitis, weight loss, anorexia.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Risk factors — pernicious anemia (autoimmune; family history of autoimmune disease), strict vegan, prior gastrectomy / bariatric / Crohn's terminal ileum disease, long-term PPI / H2 blocker / metformin / colchicine, age >65.", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum B12 <200 pg/mL — diagnostic; 200-400 pg/mL borderline (check MMA + homocysteine).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("METHYLMALONIC ACID + HOMOCYSTEINE — both elevated in true B12 deficiency; sensitive markers for borderline B12.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CBC — macrocytosis (MCV >100), anemia (Hb low), low reticulocyte count, hypersegmented neutrophils on peripheral smear.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PERNICIOUS ANEMIA workup — anti-intrinsic factor antibodies (specific), anti-parietal cell antibodies (less specific, more sensitive); serum gastrin (elevated); endoscopy + biopsy for atrophic gastritis if needed.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Folate level — concurrent deficiency common; check both before treating either (folate corrects anemia but not B12 neuro damage).", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify cause — autoimmune (pernicious), dietary (vegan), malabsorption, medication-induced.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Severity — anemia + neurologic involvement determines urgency.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Concurrent autoimmune (thyroid, T1DM) screening if pernicious anemia.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Cognitive assessment + neurologic exam baseline.", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("ORAL HIGH-DOSE B12 — 1000-2000 mcg/day cyanocobalamin PO; effective in most including pernicious anemia (1-2% absorbed via passive diffusion despite IF deficiency) per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("INTRAMUSCULAR B12 — for severe / neurologic / NPO / refractory; 1000 mcg IM daily × 1 week → weekly × 4 weeks → monthly lifelong.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("INTRANASAL B12 — 500 mcg weekly maintenance.", citationIDs: ["openfda_round23"]),
            AttributedBullet("CHECK + REPLETE B12 BEFORE OR WITH FOLATE — folate alone corrects anemia but not B12 neuro damage; permanent if delayed per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PERNICIOUS ANEMIA — lifelong replacement; screen + monitor for autoimmune comorbidities (Hashimoto, T1DM); counsel + family screening (autoimmune cluster).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MONITOR — Hb / MCV (normalize 2-3 months); reticulocytes (peak 5-10 days post-treatment); B12 + MMA / homocysteine; neurologic improvement; cognitive function.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("DIETARY counseling — meat / fish / dairy / fortified foods for non-pernicious causes.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("METFORMIN users — annual B12 monitoring + supplementation if low.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Bariatric surgery patients — lifelong B12 supplementation post-RYGB / sleeve.", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("IRREVERSIBLE NEUROLOGIC DAMAGE — proportional to duration before treatment; subacute combined degeneration may not fully reverse.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("HYPOKALEMIA at start of treatment — rapid restoration of erythropoiesis consumes K+; replete prophylactically in severe.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CONCURRENT AUTOIMMUNE DISEASE — Hashimoto, T1DM, vitiligo, celiac; screen.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("GASTRIC CANCER — increased risk in pernicious anemia / atrophic gastritis; surveillance endoscopy; symptomatic eval.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("DEMENTIA from B12 deficiency may be partially reversible — early treatment important; counsel realistic expectations.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("FOLATE + B12 deficiency together — common in alcoholism, malnutrition; treat both.", citationIDs: ["specialty_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PostpartumEndometritisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "postpartum-endometritis",
        title: "Postpartum endometritis (puerperal sepsis)",
        subtitle: "Polymicrobial uterine infection · fever + foul lochia + tender uterus · IV abx · cesarean = 10× risk · maternal sepsis #1 cause death globally",
        nclexTags: obSafetyR23,
        definition: AttributedProse(
            "Polymicrobial bacterial infection of endometrium / myometrium / parametrium typically days 1-10 postpartum. Major source of maternal morbidity globally; #1 cause of maternal death from infection. Risk varies — 1-3% vaginal delivery, 5-15% cesarean delivery, up to 30% cesarean after labor (without prophylactic abx) per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "Ascending infection — vaginal flora → uterus during labor / delivery → endometrial invasion. Polymicrobial — anaerobes (Bacteroides, Peptostreptococcus), aerobes (Streptococcus, E. coli, GBS, Enterococcus), Mycoplasma, Ureaplasma. Cesarean is greatest risk factor; prolonged labor, ROM, instrumentation, maternal diabetes, GBS colonization, low SES contribute.",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("FEVER >38°C/100.4°F on 2 occasions ≥6 hrs apart, occurring ≥24 hrs after delivery (CDC definition for endometritis).", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("FOUL-SMELLING / purulent lochia.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("UTERINE TENDERNESS on palpation; subinvolution.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Maternal tachycardia, malaise, abdominal pain, chills.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Risk factors — cesarean delivery (especially after labor / ROM), prolonged ROM (>24h), prolonged labor, multiple cervical exams, manual removal of placenta, retained products, GBS colonization, DM, obesity, low SES, lack of prenatal care.", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis — fever + uterine tenderness + foul lochia after excluding other sources (UTI, pneumonia, SSI).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("WORKUP — CBC (leukocytosis with left shift), blood + endometrial cultures (if not improving), urinalysis, lochia exam.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Imaging (US / CT) — for retained products, abscess, pelvic vein thrombosis if not responding.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Differentiate — UTI, pneumonia, mastitis, surgical site infection (cesarean), septic pelvic vein thrombophlebitis, drug fever.", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs + lochia + uterine exam q4h.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Sepsis screen — qSOFA / SOFA score; lactate; concerning for severe / septic shock → MEWS / MEOWS.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Wound exam (cesarean / perineum / episiotomy).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Breastfeeding — counsel + plan for medication compatibility.", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("IV BROAD-SPECTRUM ANTIBIOTICS — clindamycin 900 mg q8h + gentamicin 5 mg/kg q24h IV (gold standard); ampicillin-sulbactam IV alternative per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("CONTINUE IV abx until afebrile + asymptomatic ≥48 hrs; oral abx generally NOT needed after IV completion per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PROPHYLAXIS — single-dose cefazolin within 60 min before cesarean incision reduces endometritis ~75% per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ADJUNCT azithromycin 500 mg IV at cesarean — additional reduction in endometritis (CSection trial).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("RETAINED PRODUCTS — manual removal / suction curettage if suspected.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PELVIC ABSCESS — drainage (IR / surgical) + extended IV abx.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("SEPTIC SHOCK / sepsis — surviving sepsis bundle: 30 mL/kg crystalloid, abx within 1 hr, vasopressors for MAP ≥65, source control.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("SEPTIC PELVIC VEIN THROMBOPHLEBITIS — refractory fever despite abx; consider; anticoagulation × 7-10 days.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Breastfeeding-compatible abx — clindamycin, gentamicin OK; avoid metronidazole single-dose (theoretical interruption).", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("MATERNAL SEPSIS / SEPTIC SHOCK — leading cause of maternal mortality; MTP, IV abx within 1 hr, surviving sepsis bundle, ICU.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PELVIC ABSCESS — refractory fever; CT imaging; drainage + abx.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("SEPTIC PELVIC THROMBOPHLEBITIS — refractory fever despite abx; anticoagulation.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("UTERINE NECROSIS — rare; refractory; may require hysterectomy.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("RECURRENCE / persistence — retained products, pelvic abscess, septic thrombophlebitis, immunocompromise.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PSYCHOLOGICAL — long admission, NICU separation, post-traumatic stress, postpartum depression; counsel + support.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("FUTURE PREGNANCY — slight recurrence risk; treat any infection promptly; obtain history of prior endometritis.", citationIDs: ["specialty_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum IntrahepaticCholestasisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "intrahepatic-cholestasis-of-pregnancy",
        title: "Intrahepatic cholestasis of pregnancy (ICP)",
        subtitle: "Pruritus + elevated bile acids 3rd tri · stillbirth risk · UDCA + delivery 36-37 wks · resolves postpartum",
        nclexTags: obSafetyR23,
        definition: AttributedProse(
            "Pregnancy-specific liver disorder characterized by pruritus + elevated serum bile acids in 2nd-3rd trimester (most often 3rd). Affects ~0.3-2% of pregnancies (higher in some ethnic groups — South American, Scandinavian). Major concern is fetal demise risk with elevated bile acids ≥40 µmol/L per primary source.",
            citationIDs: ["specialty_dx_round23", "openrn_dx_round23"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — genetic predisposition (ABCB4, ABCB11 mutations) + hormonal (estrogen, progesterone) + environmental → impaired bile flow + cholestasis → elevated serum bile acids. Bile acids cross placenta + may cause fetal cardiac arrhythmia + meconium passage + stillbirth.",
            citationIDs: ["specialty_dx_round23"]
        ),
        presentation: [
            AttributedBullet("PRURITUS — intense, often worse at night; especially PALMS + SOLES; no rash typically (excoriations from scratching common).", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Onset usually 2nd-3rd trimester (28-36 weeks); occasionally earlier.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Mild jaundice (10-20%); dark urine; fatigue.", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Right upper quadrant discomfort (occasional).", citationIDs: ["openrn_dx_round23"]),
            AttributedBullet("Risk factors — South American (Chile, Bolivia), Scandinavian, multiparity, prior ICP (~50% recurrence), multifetal, prior liver disease, family history, IVF.", citationIDs: ["specialty_dx_round23"])
        ],
        diagnosticCriteria: [
            AttributedBullet("SERUM BILE ACIDS — diagnostic; elevated total bile acids (TBA) ≥10 µmol/L; severity stratified — mild 10-39, moderate 40-99, SEVERE ≥100 µmol/L.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("LFTs — elevated AST + ALT (~2-10× ULN), GGT often normal (distinguishing from other liver diseases).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Bilirubin — usually mildly elevated.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Coagulation — vitamin K malabsorption can prolong PT; check INR.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Rule out — viral hepatitis, autoimmune hepatitis, gallstones, fatty liver of pregnancy, HELLP, primary biliary cholangitis.", citationIDs: ["specialty_dx_round23"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity stratification by bile acid level — guides delivery timing.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Pruritus severity + maternal QOL (sleep deprivation common).", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Antenatal fetal surveillance — twice-weekly NST; many recommend BPP.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Counsel — ICP usually resolves postpartum; ~50% recurrence in next pregnancy.", citationIDs: ["specialty_dx_round23"])
        ],
        commonInterventions: [
            AttributedBullet("URSODEOXYCHOLIC ACID (UDCA) — 10-15 mg/kg/day PO divided BID; mainstay of treatment; reduces pruritus + bile acids; some evidence improves fetal outcomes per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ANTIHISTAMINES (hydroxyzine, diphenhydramine) — for pruritus relief; sedating helpful at night.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("VITAMIN K — supplement if PT prolonged; PPH risk.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("DELIVERY TIMING — 36-37 weeks for moderate (TBA 40-100); 34-36 weeks for severe (TBA ≥100); 38 weeks for mild (<40); shared decision per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("BETAMETHASONE — fetal lung maturity if delivery anticipated <34 weeks.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ANTENATAL FETAL SURVEILLANCE — twice-weekly NST + AFI; some institutions also BPP; awareness this surveillance does NOT reliably predict stillbirth.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MAGNESIUM SULFATE for fetal neuroprotection if <32 weeks.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("INTRAPARTUM continuous FHR monitoring; meconium common; pediatric team available.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("Postpartum — UDCA usually discontinued; symptoms + labs normalize 2-6 weeks.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("LACTATION — UDCA generally compatible.", citationIDs: ["specialty_dx_round23"])
        ],
        watchFor: [
            AttributedBullet("STILLBIRTH RISK — increases significantly with bile acids ≥40 µmol/L; markedly elevated ≥100 µmol/L; reason for early delivery per primary source.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("PRETERM BIRTH — both spontaneous + iatrogenic; counsel + corticosteroids if appropriate.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("MECONIUM PASSAGE / FETAL DISTRESS — common; intrapartum monitoring + pediatric team.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("POSTPARTUM HEMORRHAGE — vitamin K deficiency from cholestasis; supplement if PT prolonged.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("RECURRENT in next pregnancy ~50%; counsel; early surveillance + UDCA prophylaxis discussion.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("LONG-TERM — slightly increased risk of hepatobiliary disease, autoimmune disease later in life; ongoing primary care follow-up.", citationIDs: ["specialty_dx_round23"]),
            AttributedBullet("ESTROGEN-CONTAINING CONTRACEPTIVES — may trigger recurrence; consider progestin-only / non-hormonal.", citationIDs: ["specialty_dx_round23"])
        ],
        citations: [openrnDxR23, cdcDxR23, specialtyDxR23],
        lastSourceFidelityReview: "2026-05-12"
    )
}
