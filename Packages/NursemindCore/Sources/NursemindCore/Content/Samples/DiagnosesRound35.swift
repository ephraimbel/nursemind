import Foundation

// Curator-model diagnoses (round 35 — Safe & Effective Care: abuse recognition + reporting · trauma-informed care · mandatory reporting).

private let openrnDxR35 = CitationSource(
    id: "openrn_dx_round35",
    shortName: "Open RN Mental Health + Maternal-Child Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingmhcc/",
    lastRetrieved: "2026-05-13"
)
private let cdcDxR35 = CitationSource(
    id: "cdc_dx_round35",
    shortName: "CDC + ACF + DOJ + HHS concept citations",
    publisher: "CDC · ACF · DOJ · HHS",
    license: .publicDomain,
    url: "https://www.cdc.gov/violenceprevention/",
    lastRetrieved: "2026-05-13"
)
private let specialtyDxR35 = CitationSource(
    id: "specialty_dx_round35",
    shortName: "AAP + AMA + AAFP + Polaris Project + IAFN fact citations",
    publisher: "AAP · AMA · AAFP · Polaris · IAFN",
    license: .factCitationOnly,
    url: "https://www.aap.org/",
    lastRetrieved: "2026-05-13"
)

private let abuseTagsR35 = NCLEXTags(
    category: .psychosocialIntegrity,
    subcategory: .psychosocialIntegrity,
    priorityConcept: .safety
)
private let pedsAbuseTagsR35 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .safetyAndInfectionControl,
    priorityConcept: .safety
)

public enum ChildAbusePhysicalSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "child-abuse-physical",
        title: "Child physical abuse",
        subtitle: "Non-accidental trauma · pattern injuries + sentinel injuries · MANDATORY REPORTING (all states · no exceptions) · multidisciplinary forensic + child protective services",
        nclexTags: pedsAbuseTagsR35,
        definition: AttributedProse(
            "Child physical abuse — non-accidental injury inflicted on a child by a caregiver; 4 main categories — physical, sexual, emotional, neglect. Prevalence — ~1 in 7 US children experience abuse/neglect annually; ~1,800 fatalities/year. Recognition is the nurse's first responsibility; MANDATORY REPORTING in all 50 states for healthcare workers regardless of professional license — failure to report is criminal offense. \"It is better to report a suspicion that proves unfounded than to fail to report a real case\" per primary source.",
            citationIDs: ["specialty_dx_round35"]
        ),
        pathophysiology: AttributedProse(
            "Caregiver-inflicted physical force → tissue injury patterns inconsistent with stated mechanism, developmental stage, or accidental causation. Risk amplifiers — parental substance use, mental illness, history of own abuse, social isolation, financial stress, intimate partner violence in home, unrelated male partner in home (\"boyfriend syndrome\"), child with disability or chronic illness, premature infant, multiples. Sentinel injuries in pre-mobile infants (any bruise in baby <4 months) predict future severe abuse if undetected.",
            citationIDs: ["specialty_dx_round35"]
        ),
        presentation: [
            AttributedBullet("PATTERN injuries — belt marks (loop, buckle), hand prints, immersion burns (stocking/glove distribution, sharp demarcation, sparing of flexion creases), cigarette burns (circular full-thickness), bite marks (paired arc).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("SENTINEL injuries — bruise or oral injury in pre-mobile infant (<4 months); torn frenulum (forced feeding); any subdural in infant without major trauma history.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("BRUISES in TEN-4 distribution (Torso, Ears, Neck in child ≤4 years OR any bruise in infant ≤4 months); multiple stages of healing.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("FRACTURES — classic metaphyseal lesion (corner/bucket-handle), posterior rib fractures (squeezing mechanism), spiral fracture of femur in non-ambulatory child, multiple fractures in different healing stages, skull fracture with intracranial injury.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("HISTORICAL red flags — history inconsistent with injury, history changes with retelling, developmental implausibility (\"baby rolled off bed\" before rolling age), delay in seeking care, blame on sibling/pet, prior \"accidents\".", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("BEHAVIORAL — frozen watchfulness, hypervigilance, indiscriminate affection-seeking, regression, sleep disturbance, school problems, aggressive play.", citationIDs: ["openrn_dx_round35"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Skeletal survey for any child <2 years with suspicious injury — AAP recommendation; full series (skull, chest, abdomen, spine, extremities).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Head imaging — CT for acute symptoms; MRI for occult injury; ophthalmology exam for retinal hemorrhages.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Coagulation studies + CBC — rule out bleeding disorder mimics in bruising; bone profile + vitamin D for fracture mimics.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Photograph injuries — with consent + ruler + identification + date; serial documentation.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Multidisciplinary child abuse pediatrics consultation (board-certified subspecialty) when available — improves diagnostic accuracy + advocacy.", citationIDs: ["specialty_dx_round35"])
        ],
        priorityAssessments: [
            AttributedBullet("Safety of child immediately — admission OR foster placement OR safe relative; do NOT discharge to suspected abuser.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Siblings + other children in home — they are at risk; assess + report.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Caregiver presentation — affect, history consistency, response to child, willingness to leave child for exam.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Trauma-informed approach — child has experienced trauma; minimize re-traumatization; child life specialist + chaplaincy + social work.", citationIDs: ["openrn_dx_round35"])
        ],
        commonInterventions: [
            AttributedBullet("MANDATORY REPORTING — call child protective services (CPS) + law enforcement IMMEDIATELY upon suspicion (not proof); ALL healthcare workers mandated reporters; failure to report is criminal; identity of reporter protected.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Do NOT confront caregiver about abuse — risk to child + interference with investigation.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Admit child for safety + workup if any uncertainty; involve multidisciplinary team.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Forensic evidence collection per institutional protocol + chain of custody.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Trauma-informed care — predictable + safe environment; child life + play therapy; minimize repeat exams + interviews.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("Document objectively — verbatim quotes + body diagrams + photographs; avoid judgmental language; chronology + witnesses.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Long-term — counseling + advocacy + foster care coordination + court testimony preparation.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("Nurse self-care — emotionally heavy work; institutional support + counseling + peer debriefing.", citationIDs: ["openrn_dx_round35"])
        ],
        watchFor: [
            AttributedBullet("Sentinel injury missed → recurrent escalating abuse → fatal outcome; report ANY suspicion.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Bleeding disorder + osteogenesis imperfecta + nutritional deficiencies mimics — rule out but do not delay reporting.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Munchausen by proxy (FDIA) — caregiver falsifies/induces illness; subtle + dangerous.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Adolescents — bruising on lower legs/extremities from play often accidental; correlate with development.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("CULTURAL practices — cupping, coining, moxibustion can leave marks; distinguish from abuse via history + cultural competence.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("Legal — court testimony likely; preserve documentation; institutional risk management + legal counsel.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Confidentiality limits — HIPAA permits disclosure for mandatory reporting + child protection.", citationIDs: ["specialty_dx_round35"])
        ],
        citations: [openrnDxR35, cdcDxR35, specialtyDxR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ElderAbuseNeglectSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "elder-abuse-neglect",
        title: "Elder abuse + neglect",
        subtitle: "Physical, sexual, emotional, financial, neglect, abandonment · Adult Protective Services · screening tools · mandatory reporting in most states",
        nclexTags: abuseTagsR35,
        definition: AttributedProse(
            "Elder abuse — intentional act or failure to act by caregiver or other person that causes harm to an older adult (≥60 years). Types — physical, sexual, emotional/psychological, financial exploitation, neglect (passive or active), abandonment, self-neglect. Prevalence — 1 in 10 community-dwelling older adults; estimated 5 million US victims/year; significantly under-reported (~1 in 14 cases). Mandatory reporting laws in 44 states for healthcare workers; varies by state and circumstance per primary source.",
            citationIDs: ["specialty_dx_round35"]
        ),
        pathophysiology: AttributedProse(
            "Vulnerability factors — cognitive impairment (dementia × 2-3 increased risk), functional dependency, isolation, low income, prior abuse history. Perpetrator factors — caregiver burden, substance use, mental illness, financial dependence on victim, history of abusive behavior, family caregiver (most common). Self-neglect — increasing among growing elderly population; cognitive impairment + isolation + lack of support contribute.",
            citationIDs: ["specialty_dx_round35"]
        ),
        presentation: [
            AttributedBullet("PHYSICAL — unexplained bruises, fractures (especially of varying ages), restraint marks, burns, pressure injuries, dehydration, malnutrition, poor hygiene, soiled clothing.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("SEXUAL — genital injury, STI in non-sexually-active older adult, unexplained bleeding, fear of being alone with caregiver.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("EMOTIONAL — withdrawal, depression, agitation, anxiety, fear of caregiver, low self-esteem, suicidal ideation.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("FINANCIAL — unexplained transactions, missing belongings, sudden changes in will/power of attorney, caregiver isolating from family, unpaid bills despite resources.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("NEGLECT — pressure injuries, malnutrition, dehydration, medication mismanagement, poor hygiene, lack of needed assistive devices.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("BEHAVIORAL — caregiver dominating interaction, refusing to leave room, hostility, inconsistent histories; older adult passive, fearful, avoiding eye contact.", citationIDs: ["openrn_dx_round35"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Screening tools — Elder Abuse Suspicion Index (EASI), Hwalek-Sengstock Elder Abuse Screening Test (H-S/EAST), AMA tool; routine screening in primary care + ED.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Interview SEPARATELY from caregiver — alone in safe environment; assess capacity + autonomy.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Comprehensive physical exam — skin, head-to-toe, genital + perineal, neuro assessment, cognitive assessment (MoCA, MMSE).", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("Imaging — skeletal injuries, head CT for trauma; correlate with history.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Document — verbatim quotes + body diagrams + photographs (with consent) + chronology.", citationIDs: ["specialty_dx_round35"])
        ],
        priorityAssessments: [
            AttributedBullet("CAPACITY — decision-making capacity may be intact or impaired; impacts intervention pathway.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("IMMEDIATE SAFETY — admit, emergency placement, safety plan with consent (if capacity intact).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Lethality risk — escalating injury pattern, weapons in home, isolation, prior threats.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Caregiver burden + support needs — caregiver respite, education, mental health support may prevent further abuse if relationship can be repaired.", citationIDs: ["openrn_dx_round35"])
        ],
        commonInterventions: [
            AttributedBullet("MANDATORY REPORTING — to Adult Protective Services (APS) per state law; many states mandate; some have voluntary reporting only; document rationale either way.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("APS investigates + offers services + court-ordered guardianship if needed; do NOT remove against capable adult's wishes (autonomy primary).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Safety planning — patient-centered if capacity intact; emergency contacts; safe person + place; documents (copies of IDs + accounts).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Interview separately from caregiver; trauma-informed + empowering language.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("Address self-neglect — capacity assessment + APS + community resources + home health.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Multidisciplinary team — social work + geriatrics + APS + law enforcement + legal services + family medicine.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Caregiver respite + support if abuse stems from burden; community resources + Alzheimer's Association + Area Agency on Aging.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("Document objectively + comprehensively for legal + protective services.", citationIDs: ["specialty_dx_round35"])
        ],
        watchFor: [
            AttributedBullet("Capacity-related autonomy conflicts — capable elder may refuse intervention; respect autonomy + document + provide resources.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Cognitive impairment → harder to identify abuse + harder to intervene; surrogate decision-maker + guardianship.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Polypharmacy + medication mismanagement vs intentional misuse; medication reconciliation.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Pressure injuries, malnutrition, dehydration may be late presentations of unrecognized neglect.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("Financial abuse particularly subtle — banks + Adult Protective Services + financial institutions partnership.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Cultural considerations — family caregiving expectations + immigration status + cultural sensitivity.", citationIDs: ["openrn_dx_round35"])
        ],
        citations: [openrnDxR35, cdcDxR35, specialtyDxR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IntimatePartnerViolenceSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "intimate-partner-violence",
        title: "Intimate partner violence (IPV)",
        subtitle: "Physical, sexual, psychological, coercive control · screening (HITS, AAS) · lethality assessment · safety planning · trauma-informed care · multidisciplinary advocacy",
        nclexTags: abuseTagsR35,
        definition: AttributedProse(
            "Intimate partner violence (IPV) — physical violence, sexual violence, stalking, or psychological aggression by a current or former intimate partner. Affects ~1 in 4 women + 1 in 9 men in their lifetime; cuts across all demographics. LGBTQ+ individuals + pregnant women + women of color disproportionately affected. Pregnancy is a high-risk period — homicide is leading cause of pregnancy-related death in some studies. Routine screening recommended in primary care, ED, OB/GYN, mental health per primary source.",
            citationIDs: ["specialty_dx_round35"]
        ),
        pathophysiology: AttributedProse(
            "Cycle of violence (Walker) — tension building → acute battering → honeymoon/reconciliation → repeat with escalating severity + frequency. Coercive control — pattern of behaviors restricting victim autonomy (isolation, financial control, threats, surveillance, sexual coercion); often precedes + accompanies physical violence. Risk factors — substance use, mental illness, prior abuse history, weapons access, pregnancy + postpartum, separation/leaving relationship (highest lethality risk).",
            citationIDs: ["specialty_dx_round35"]
        ),
        presentation: [
            AttributedBullet("PHYSICAL — injuries to face/neck/breasts/abdomen (defensive injuries common), multiple injuries of varying ages, injuries inconsistent with stated mechanism, head trauma + strangulation injuries.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("STRANGULATION — particularly lethal; subtle external signs but severe internal injury; loss of consciousness, voice changes, dysphagia, neurological symptoms; 7-fold increase in subsequent homicide risk.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("SEXUAL — STI, unintended pregnancy, vaginal/anal injuries.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("PSYCHOLOGICAL — depression, anxiety, PTSD, suicidal ideation, sleep disturbance, eating disorders, somatization (chronic pain, headaches, GI complaints).", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("BEHAVIORAL — partner answering questions, controlling appointments, delayed care, frequent ED visits with vague complaints, missed appointments.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("PREGNANCY — delayed prenatal care, history of miscarriage/preterm labor, placental abruption, low birth weight; assess at every visit.", citationIDs: ["specialty_dx_round35"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Screening tools — HITS (Hurt, Insulted, Threatened, Scream), AAS (Abuse Assessment Screen — pregnancy), WAST (Women Abuse Screening Tool); USPSTF B-grade recommendation for routine screening of women of childbearing age.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("INTERVIEW PRIVATELY — patient alone (without partner, family); culturally sensitive language; \"Because violence is so common in many people's lives, I now ask every patient about it...\".", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("LETHALITY ASSESSMENT — Danger Assessment (Campbell), strangulation history, weapons access, escalating violence, separation, threats to kill, pregnancy, recent loss of job, substance use; HIGH risk = imminent danger.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Strangulation evaluation — even subtle history → comprehensive workup (CT angiography neck, neurologic exam, voice/swallow evaluation).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Forensic evidence collection if recent assault + patient consents; SANE-trained nurses preferred.", citationIDs: ["specialty_dx_round35"])
        ],
        priorityAssessments: [
            AttributedBullet("Immediate safety — \"Are you safe to go home?\"; assess access to weapons + perpetrator's location.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Children in home — abused women's children often abused or witness violence; assess + report if child abuse suspected.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Suicide + homicide risk — both elevated; safety planning.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Pregnancy — disclosure of abuse during pregnancy + reproductive coercion.", citationIDs: ["specialty_dx_round35"])
        ],
        commonInterventions: [
            AttributedBullet("VALIDATE + EMPATHIZE — \"You don't deserve this.\" \"It's not your fault.\" \"Your safety is my priority.\"; non-judgmental.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("AUTONOMY — most decisions are the patient's; leaving is dangerous + complex; respect choice + provide resources.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("SAFETY PLANNING — emergency contacts, safe place, important documents (IDs, financial), packed bag, cell phone, code words with friends.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Resources — National Domestic Violence Hotline (1-800-799-7233), local domestic violence shelters + advocacy, legal aid + protective orders.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Reporting — generally NOT mandatory for IPV between competent adults (varies by state for injury reporting from weapons); respect autonomy; offer to help connect with services.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Children — mandatory child abuse reporting if children affected (witnessing IPV is itself a form of child abuse in some states).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Healthcare needs — medical treatment of injuries + emergency contraception + STI prophylaxis + mental health referral.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Documentation — verbatim quotes + photographs (with consent) + body diagrams; objective + non-judgmental; future legal admissibility.", citationIDs: ["specialty_dx_round35"])
        ],
        watchFor: [
            AttributedBullet("Highest lethality at + after separation — safety planning critical during separation period.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Strangulation history → high risk of subsequent homicide; trauma-informed evaluation + follow-up.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Pregnancy — increases lethality + complications; abuse often starts/escalates in pregnancy.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("LGBTQ+ + immigrant + disabled victims — additional barriers; specialized services needed.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Reproductive coercion — birth control sabotage, pregnancy coercion; address contraception privately.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Nurse secondary trauma — emotionally demanding; institutional support + counseling.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("Vicarious traumatization + countertransference — recognize + seek support.", citationIDs: ["openrn_dx_round35"])
        ],
        citations: [openrnDxR35, cdcDxR35, specialtyDxR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AbusiveHeadTraumaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "abusive-head-trauma",
        title: "Abusive head trauma (AHT) / shaken baby syndrome",
        subtitle: "Inflicted infant brain injury · classic triad: subdural hemorrhage + retinal hemorrhages + encephalopathy · skeletal survey · mandatory reporting · neuroprotection",
        nclexTags: pedsAbuseTagsR35,
        definition: AttributedProse(
            "Abusive head trauma (AHT) — inflicted traumatic brain injury in infants/toddlers from shaking, impact, or both; leading cause of death from child abuse. Peak incidence 2-4 months; often triggered by inconsolable crying. Classic CONSTELLATION (not diagnostic alone) — subdural hematoma + retinal hemorrhages + encephalopathy in infant <2 years without major trauma history. Skull fractures, rib fractures (posterior), metaphyseal fractures suggest concurrent inflicted injury. Mortality ~25%; long-term morbidity (cerebral palsy, seizures, cognitive disability, blindness) in survivors per primary source.",
            citationIDs: ["specialty_dx_round35"]
        ),
        pathophysiology: AttributedProse(
            "Shaking + impact → acceleration-deceleration forces tear bridging veins → subdural hemorrhage; rotational forces shear axons → diffuse axonal injury; retinal hemorrhages from vitreoretinal traction + venous congestion. Brain edema + secondary injury (hypoxia, hypoperfusion, increased ICP) compounds damage. Infant skull + neck biomechanics make them particularly vulnerable. Caregiver perpetrator (typically father, mother's boyfriend, or babysitter); inconsolable crying common trigger.",
            citationIDs: ["specialty_dx_round35"]
        ),
        presentation: [
            AttributedBullet("Range from mild — irritability, vomiting, poor feeding — to severe — seizures, apnea, unresponsiveness.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Initial misdiagnosis common — viral illness, colic, gastroenteritis, sepsis — delayed recognition.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Vomiting + altered mental status + lethargy + bulging fontanelle + seizures + apnea.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("History inconsistencies — no/minimal trauma history, history changes, developmental implausibility, delayed care-seeking, blame on sibling.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Concomitant injuries — bruising (pre-mobile = sentinel), oral injuries (torn frenulum), patterned bruising, multiple stages of healing.", citationIDs: ["specialty_dx_round35"])
        ],
        diagnosticCriteria: [
            AttributedBullet("EMERGENT head CT — subdural hemorrhage (interhemispheric, posterior, mixed densities suggest different ages), parenchymal injury, edema, herniation.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("MRI brain — comprehensive injury characterization + parenchymal extent; better than CT for axonal injury + small bleeds + dating.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Ophthalmology — dilated funduscopic exam by ophthalmologist; retinal hemorrhages (multilayered, extensive, to ora serrata) — present in 80% of AHT, virtually pathognomonic when severe + bilateral.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Skeletal survey — full series for occult fractures (classic metaphyseal lesions, posterior rib fractures, skull fractures, multiple healing stages).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Workup mimics — coagulopathy (CBC, PT/PTT, von Willebrand), metabolic (vitamin D, calcium, phosphorus), genetic (osteogenesis imperfecta), accidental trauma.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Child abuse pediatrics consultation — board-certified subspecialty improves diagnosis + decreases unnecessary intervention.", citationIDs: ["specialty_dx_round35"])
        ],
        priorityAssessments: [
            AttributedBullet("Airway + breathing + circulation; intubation for severe encephalopathy or seizures.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Neuroprotection — head of bed 30°, normothermia, normocarbia, avoid hypotension + hypoxia.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("ICP monitoring + neurosurgical evaluation for large subdural + herniation; sometimes craniotomy.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Siblings in home — at risk; assess + protect; CPS for siblings.", citationIDs: ["specialty_dx_round35"])
        ],
        commonInterventions: [
            AttributedBullet("PICU admission + neuroprotection + ICP management + seizure control.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("MANDATORY REPORTING — CPS + law enforcement IMMEDIATELY; do not delay for workup completion.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Multidisciplinary — pediatric intensive care + neurology + neurosurgery + ophthalmology + child abuse pediatrics + social work + ethics if end-of-life decisions needed.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Skeletal survey + workup of mimics before discharge.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Document objectively — history + exam + imaging + interventions; verbatim caregiver statements + chronology.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Long-term — neurology + rehabilitation + early intervention (PT/OT/speech + special education) + family support + protective custody/foster placement.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("PREVENTION — \"Period of Purple Crying\" education + Shaken Baby Prevention programs (e.g., Dias Hospital model) shown to reduce incidence by 47%.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Caregiver education on infant crying + safe coping strategies + when to seek help; integrate with discharge teaching for ALL newborns.", citationIDs: ["specialty_dx_round35"])
        ],
        watchFor: [
            AttributedBullet("Mortality ~25%; severe disability + cerebral palsy + seizures + cognitive impairment + blindness in survivors.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Coagulation + bleeding disorders + accidental trauma + osteogenesis imperfecta + birth-related subdural — workup mimics.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Recurrent injury if undetected — sentinel injuries predict future severe abuse.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Caregiver detection — usually father, mother's boyfriend, babysitter (~80%); mother less commonly perpetrator; correlate.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Legal — testimony + civil + criminal cases; documentation paramount.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("PERIOD OF PURPLE CRYING (Period of crying Peak at 2 months Unexpected Resists soothing Pain-like face Long lasting Evening) — normal infant crying patterns + safe coping.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Nurse + team grief + secondary trauma — institutional support.", citationIDs: ["openrn_dx_round35"])
        ],
        citations: [openrnDxR35, cdcDxR35, specialtyDxR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HumanTraffickingSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "human-trafficking-victim",
        title: "Human trafficking — victim recognition + response",
        subtitle: "Sex + labor trafficking · adult + minor (minor sex trafficking = automatic by federal law) · trauma-informed care · resources (NHTRC) · multidisciplinary response",
        nclexTags: abuseTagsR35,
        definition: AttributedProse(
            "Human trafficking — use of force, fraud, or coercion to compel a person into commercial sex, labor, or services against their will. Federal Trafficking Victims Protection Act (TVPA) defines + protects victims. For MINORS, any commercial sex act is automatically sex trafficking (no force/fraud/coercion required). Healthcare workers often encounter victims — up to 88% of trafficking victims report contact with healthcare during exploitation. Recognition + trauma-informed response can be lifesaving per primary source.",
            citationIDs: ["specialty_dx_round35"]
        ),
        pathophysiology: AttributedProse(
            "Trauma-bonding (Stockholm-syndrome-like dynamics) + fear + dependency + isolation + threats keep victims in exploitation. Vulnerabilities — prior trauma (child abuse, sexual abuse), foster care system, homelessness, LGBTQ+ youth (40% of homeless youth + disproportionately trafficked), substance use, mental illness, undocumented status, poverty. Traffickers may be strangers, intimate partners, family members. Victims often do not self-identify due to trauma + fear + dependency + identification with trafficker.",
            citationIDs: ["specialty_dx_round35"]
        ),
        presentation: [
            AttributedBullet("Physical — injuries (often hidden), STIs, multiple unintended pregnancies/abortions, malnutrition, dental neglect, skin infections, signs of drug use (intentional or coerced).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Tattoos/branding — name of trafficker, identification marks; ask about meaning.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Mental health — depression, anxiety, PTSD, suicidality, dissociation, substance use, self-harm.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("Behavioral — fear/anxiety/submissiveness, deference to accompanying person, inability to answer simple questions, rehearsed answers, inconsistent stories, won't make eye contact.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Controlling companion — speaks for patient, refuses to leave, hostile to staff, controls money/documents/phone.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Document control — no ID, ID in someone else's name, fake ID, third party holds documents.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Minor with adult \"boyfriend\" significantly older.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Working conditions — long hours, no pay, no breaks, lives at workplace, multiple people in single room.", citationIDs: ["specialty_dx_round35"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Screening tools — HTRA (Human Trafficking Resource Assessment), Polaris Project red flags; train all clinical staff in recognition.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("INTERVIEW PRIVATELY — separate patient from accompanying person (\"hospital protocol\" excuse); trained interpreter NOT family member.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Trauma-informed questions — \"Are you free to come and go as you please?\" \"Has anyone hurt you or threatened your family?\" \"Are you forced to do work you don't want to?\".", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Medical evaluation — comprehensive, head-to-toe; STI/HIV/pregnancy testing; mental health assessment; substance use.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Forensic evidence with consent + SANE if recent assault.", citationIDs: ["specialty_dx_round35"])
        ],
        priorityAssessments: [
            AttributedBullet("Immediate safety — does patient want to leave situation NOW? Plan accordingly.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Capacity + autonomy — adult victims may not be ready to leave; respect choice + provide resources; pediatric victims have automatic protections.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Children involved + reproductive history.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Trafficker's location + access + violence potential.", citationIDs: ["specialty_dx_round35"])
        ],
        commonInterventions: [
            AttributedBullet("National Human Trafficking Hotline — 1-888-373-7888 OR text \"BeFree\" to 233733; 24/7 multilingual; connects to local resources + emergency response.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Trauma-informed care — non-judgmental, patient-pace, validate experiences, build trust over time.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("MINOR trafficking — automatic CPS + law enforcement reporting; no force/fraud/coercion required for federal definition.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Adult trafficking — generally NOT mandatory reporting (varies by state); respect autonomy; provide resources + connect with services.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Safe disposition — verify safety + plan; do NOT discharge with suspected trafficker.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Multidisciplinary response — trafficking-specific resources, social work, advocates, law enforcement, FBI Human Trafficking Task Force, NGOs (Polaris, Coalition Against Trafficking).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Documentation — comprehensive + objective + verbatim quotes + chronology + chain of custody.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Long-term — survivor advocacy + trauma therapy + immigration support (T visa for victims) + housing + employment.", citationIDs: ["specialty_dx_round35"])
        ],
        watchFor: [
            AttributedBullet("Trafficker presence in hospital — security awareness; safety protocols; do not confront.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Patient may return to trafficker — common cycle; do not judge; maintain non-judgmental support + resources.", citationIDs: ["openrn_dx_round35"]),
            AttributedBullet("Substance use comorbidity — coerced or coping; specialized treatment.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Mental health — complex PTSD + dissociation + substance use; specialized trauma therapy.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Immigration status — T visa available for trafficking victims regardless of cooperation with law enforcement; address fear of deportation.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("LGBTQ+, immigrant, racial minority victims — additional vulnerabilities + barriers to leaving + accessing help.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Nurse + staff secondary trauma — emotionally demanding; institutional support.", citationIDs: ["openrn_dx_round35"])
        ],
        citations: [openrnDxR35, cdcDxR35, specialtyDxR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FDIASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "factitious-disorder-imposed-on-another",
        title: "Factitious disorder imposed on another (FDIA) / Munchausen by proxy",
        subtitle: "Caregiver fabricates/induces illness in dependent · medical child abuse · subtle + dangerous · multidisciplinary investigation · separation often required",
        nclexTags: pedsAbuseTagsR35,
        definition: AttributedProse(
            "Factitious disorder imposed on another (FDIA, DSM-5; historically Munchausen syndrome by proxy) — form of child abuse where caregiver fabricates, exaggerates, or induces illness/injury in a dependent (most commonly child; can be elderly + disabled adults). Driver is psychological gain — sympathy, attention, sick role — NOT material gain (distinct from malingering). Mortality 9-31% in childhood FDIA; sibling mortality elevated. Particularly insidious — perpetrator (typically mother) presents as caring, knowledgeable, cooperative parent; medical staff often unsuspecting + complicit until pattern recognized per primary source.",
            citationIDs: ["specialty_dx_round35"]
        ),
        pathophysiology: AttributedProse(
            "Perpetrator psychology — personality disorder, childhood abuse history, medical knowledge (often healthcare worker background), pathologic need for attention via sick role projected onto victim. Mechanisms — fabricating symptoms, manipulating test results, withholding food + medication, administering poisons + medications, smothering, injecting contaminants. Victim is dependent + cannot escape; physical + psychological damage compounds over time. Sibling deaths may be unrecognized FDIA.",
            citationIDs: ["specialty_dx_round35"]
        ),
        presentation: [
            AttributedBullet("Recurrent unusual + inconsistent symptoms not matching diagnostic findings.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Symptoms resolve when caregiver absent; recur when present.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Multiple opinions + hospital admissions + procedures + diagnostic workup; rare disease diagnoses; treatment failures.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Caregiver — highly knowledgeable, eager for invasive testing + procedures, refuses discharge, presents as model parent, often medical/nursing background.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Sibling history — siblings with similar unusual illness, sibling deaths, multiple specialists.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Common fabricated/induced — apnea, seizures, GI bleeding, severe diarrhea, vomiting, fevers, rash, infection (intentional contamination of IV lines).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Caregiver inconsistencies on collateral history vs other family + records.", citationIDs: ["specialty_dx_round35"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL SUSPICION — symptoms resolve when caregiver absent; multidisciplinary review of records (chronology of symptoms + presentations + procedures + admissions).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Video monitoring — covert hospital surveillance with court order/legal counsel; controversial but sometimes definitive.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Toxicology + drug screens — broad-spectrum looking for substances (insulin, opioids, ipecac, laxatives, salt).", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Lab patterns — falsified urine/blood specimens (substance not from patient); insulin/C-peptide ratio (exogenous insulin); unexplained electrolyte abnormalities.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Comparison of caregiver-reported symptoms vs nursing observations + objective findings.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Child abuse pediatrics consultation + multidisciplinary review (legal, ethics, social work, psychiatry).", citationIDs: ["specialty_dx_round35"])
        ],
        priorityAssessments: [
            AttributedBullet("Immediate safety of child — separation from caregiver during workup; supervised visitation only.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Siblings safety — same caregiver + same risk; protect.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Don't tip off caregiver — could escalate behavior + endanger child; multidisciplinary planning before action.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Documentation paramount — verbatim + chronologic; will be challenged.", citationIDs: ["specialty_dx_round35"])
        ],
        commonInterventions: [
            AttributedBullet("MANDATORY REPORTING — child abuse + immediate CPS + law enforcement involvement.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Separation of child from caregiver — supervised visitation or no contact during investigation; foster placement.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Multidisciplinary investigation — child abuse pediatrics + forensic + law enforcement + legal + risk management + ethics + psychiatry.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Sibling assessment + protection if FDIA pattern with siblings.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Comprehensive documentation — symptom chronology + caregiver behavior + tests + nursing observations.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Caregiver mental health treatment — psychiatric evaluation + therapy; perpetrator rarely admits + treatment outcomes poor; criminal prosecution common.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Victim long-term — significant psychological harm + medical PTSD + somatic symptom disorder + identification with sick role; specialized trauma therapy.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Avoid unnecessary medical interventions while perpetration suspected — iatrogenic harm common from extensive workup.", citationIDs: ["specialty_dx_round35"])
        ],
        watchFor: [
            AttributedBullet("Mortality 9-31% in FDIA; lethal escalation common if undetected.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Iatrogenic harm from unnecessary medical procedures + medications during workup.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Family + community disbelief — perpetrators are convincing + portray as devoted parent; healthcare workers initially complicit.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Legal challenges — perpetrators often deny + are well-resourced; comprehensive documentation + expert testimony critical.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Sibling deaths — investigate prior sibling histories carefully; serial FDIA documented.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Long-term victim outcomes — psychiatric morbidity + identification with sick role + medical PTSD + somatization persists into adulthood.", citationIDs: ["specialty_dx_round35"]),
            AttributedBullet("Nurse + team — moral injury from being deceived/complicit; institutional support + debriefing.", citationIDs: ["openrn_dx_round35"])
        ],
        citations: [openrnDxR35, cdcDxR35, specialtyDxR35],
        lastSourceFidelityReview: "2026-05-13"
    )
}
