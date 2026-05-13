import Foundation

// Curator-model maternity / OB diagnosis entries (v1.5 expansion).
// Sources: Open RN Maternal-Newborn Nursing (CC BY 4.0), OpenStax Maternal-Newborn
// Nursing (CC BY 4.0 display restriction), CDC reproductive-health guidance (public
// domain), ACOG / AWHONN / SMFM / CMQCC concept citations only.

private let openrnMatNew = CitationSource(
    id: "openrn_matnew",
    shortName: "Open RN Maternal-Newborn Nursing",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/maternal/?s=preeclampsia+gestational+postpartum",
    lastRetrieved: "2026-05-04"
)
private let openstaxMatNew = CitationSource(
    id: "openstax_matnew",
    shortName: "OpenStax Maternal-Newborn Nursing",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/maternal-newborn-nursing",
    lastRetrieved: "2026-05-04"
)
private let cdcRepro = CitationSource(
    id: "cdc_repro",
    shortName: "CDC Reproductive Health and Pregnancy guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/reproductivehealth/",
    lastRetrieved: "2026-05-04"
)
private let acogConcept = CitationSource(
    id: "acog_concept",
    shortName: "ACOG Practice Bulletins (concept citation only — text not reproduced)",
    publisher: "American College of Obstetricians and Gynecologists",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-05-04"
)
private let cmqccConcept = CitationSource(
    id: "cmqcc_concept",
    shortName: "CMQCC OB Hemorrhage / Hypertension toolkits (concept citation)",
    publisher: "California Maternal Quality Care Collaborative",
    license: .factCitationOnly,
    url: "https://www.cmqcc.org/resources-toolkits",
    lastRetrieved: "2026-05-04"
)

private let perfusionMatTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let healthMatTags = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .perfusion)
private let psychMatTags = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .mood)

// MARK: - Preeclampsia

public enum PreeclampsiaDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "preeclampsia",
        title: "Preeclampsia",
        subtitle: "New-onset hypertension + proteinuria/end-organ damage after 20 weeks",
        nclexTags: perfusionMatTags,
        definition: AttributedProse(
            "Pregnancy-specific multisystem disorder characterized by new-onset hypertension (≥140/90 on two occasions ≥4 hours apart) plus proteinuria OR new-onset end-organ dysfunction after 20 weeks gestation in a previously normotensive person. 'Severe features' upgrade severity and management urgency.",
            citationIDs: ["openrn_matnew", "acog_concept"]
        ),
        pathophysiology: AttributedProse(
            "Abnormal placental implantation → impaired spiral artery remodeling → placental ischemia → release of antiangiogenic factors (sFlt-1, soluble endoglin) → maternal endothelial dysfunction → vasospasm, capillary leak, and end-organ injury (kidney, liver, brain, placenta).",
            citationIDs: ["openrn_matnew", "openstax_matnew"]
        ),
        presentation: [
            AttributedBullet("Headache (especially persistent or unusual).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Visual changes — blurred vision, scotomata, photophobia.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Right upper quadrant or epigastric pain (hepatic capsule stretch).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Sudden weight gain (>2 lb/week) or facial/hand edema.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Hyperreflexia, clonus.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Decreased fetal movement; oligohydramnios; fetal growth restriction.", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Hypertension: SBP ≥140 OR DBP ≥90 on two occasions ≥4 hr apart after 20 weeks.", citationIDs: ["acog_concept", "openrn_matnew"]),
            AttributedBullet("PLUS proteinuria: ≥300 mg/24-hr urine OR protein/creatinine ratio ≥0.3 OR dipstick ≥1+.", citationIDs: ["acog_concept"]),
            AttributedBullet("OR (in absence of proteinuria) new-onset: thrombocytopenia (<100K), creatinine >1.1 (or 2× baseline), AST/ALT 2× upper normal, pulmonary edema, OR new-onset cerebral/visual symptoms.", citationIDs: ["acog_concept"]),
            AttributedBullet("SEVERE FEATURES: SBP ≥160 OR DBP ≥110, thrombocytopenia <100K, AST/ALT 2×, severe RUQ pain, creatinine >1.1, pulmonary edema, new cerebral/visual symptoms.", citationIDs: ["acog_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("BP every 1–4 hr (every 15 min during severe-range BP control).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Neuro: headache, visual changes, hyperreflexia (DTRs), clonus, level of consciousness.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Lung sounds — pulmonary edema can develop rapidly.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Strict I&O — oliguria <30 mL/hr is a severe feature.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Daily weights; assess for edema (face, hands, sacral).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Labs: CBC, platelets, AST/ALT, LDH, creatinine, uric acid; trend per protocol.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Continuous fetal monitoring; assess fetal movement.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("Definitive treatment is DELIVERY — timing balances maternal and fetal risk; severe features at ≥34 weeks generally → delivery.", citationIDs: ["acog_concept"]),
            AttributedBullet("ACUTE severe-range BP (≥160/110): IV labetalol, hydralazine, or oral immediate-release nifedipine within 30–60 minutes per protocol; recheck q15 min.", citationIDs: ["acog_concept", "cmqcc_concept"]),
            AttributedBullet("Magnesium sulfate IV for SEIZURE PROPHYLAXIS — 4–6 g loading over 20 min, then 1–2 g/hr maintenance; continue 24 hr postpartum.", citationIDs: ["acog_concept", "openrn_matnew"]),
            AttributedBullet("Antenatal corticosteroids (betamethasone) for fetal lung maturation if 24–34 weeks.", citationIDs: ["acog_concept"]),
            AttributedBullet("Quiet, low-stimulation environment; seizure precautions (padded side rails, suction, oxygen at bedside).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Fluid restriction (typically <125 mL/hr total) — avoid pulmonary edema.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Postpartum monitoring 24–72 hr — risk of seizure, stroke, pulmonary edema persists.", citationIDs: ["openrn_matnew"])
        ],
        watchFor: [
            AttributedBullet("ECLAMPSIA — generalized seizure on background of preeclampsia; obstetric emergency.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("HELLP syndrome — Hemolysis, Elevated Liver enzymes, Low Platelets; severe variant.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Magnesium toxicity — loss of DTRs, RR <12, SpO2 drop, urine output <30 mL/hr; STOP infusion, give IV calcium gluconate 1 g.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Stroke (hemorrhagic from severe HTN) is a leading cause of maternal mortality in preeclampsia.", citationIDs: ["cmqcc_concept"]),
            AttributedBullet("Placental abruption.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("DIC, AKI, hepatic rupture in severe disease.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept, cmqccConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Eclampsia

public enum EclampsiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "eclampsia",
        title: "Eclampsia",
        subtitle: "Generalized seizure in patient with preeclampsia · obstetric emergency",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation),
        definition: AttributedProse(
            "Generalized tonic-clonic seizure or coma in a pregnant or postpartum patient with preeclampsia, with no other identifiable cause. Most occur antepartum or within 48 hours postpartum, but can occur up to 6 weeks after delivery.",
            citationIDs: ["openrn_matnew", "acog_concept"]
        ),
        pathophysiology: AttributedProse(
            "Severe preeclampsia → cerebral vasospasm, vasogenic edema, hypertensive encephalopathy → seizure. Posterior reversible encephalopathy syndrome (PRES) is often demonstrable on imaging.",
            citationIDs: ["openrn_matnew"]
        ),
        presentation: [
            AttributedBullet("Generalized tonic-clonic seizure; may be witnessed without warning.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Premonitory: severe headache, visual changes, hyperreflexia, RUQ pain, agitation.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Postictal confusion; possible coma.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Maternal hypoxia and acidosis; fetal bradycardia / non-reassuring tracing during seizure.", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Preeclampsia + new-onset generalized seizure with no other cause (history, imaging if needed).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Differentiate from epilepsy, intracranial hemorrhage, infection, metabolic derangement.", citationIDs: ["openrn_matnew"])
        ],
        priorityAssessments: [
            AttributedBullet("ABCs — protect airway, position lateral, suction, oxygen.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Continuous BP, SpO2, cardiac monitor.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Continuous fetal monitoring once mother stable.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("DTRs and clonus during magnesium therapy.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("MAGNESIUM SULFATE — 4–6 g IV loading over 20 min, then 2 g/hr maintenance; first-line for seizure cessation and prophylaxis. Continue 24 hours postpartum.", citationIDs: ["acog_concept", "openrn_matnew"]),
            AttributedBullet("Recurrent seizure on magnesium: additional 2 g IV bolus over 5 min OR benzodiazepine (lorazepam 2–4 mg IV).", citationIDs: ["acog_concept"]),
            AttributedBullet("BP control to <160/110 — IV labetalol, hydralazine, or nifedipine.", citationIDs: ["acog_concept"]),
            AttributedBullet("Position lateral; pad rails; oxygen 8–10 L via NRB; suction available.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Plan for delivery once mother stabilized — eclampsia is delivery indication regardless of gestational age.", citationIDs: ["acog_concept", "openrn_matnew"])
        ],
        watchFor: [
            AttributedBullet("Magnesium toxicity (loss of DTRs, RR <12, oliguria) — calcium gluconate 1 g IV reversal.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Aspiration during/after seizure.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Placental abruption from intense uterine contraction during seizure.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Intracranial hemorrhage from severe-range BP — leading cause of eclampsia mortality.", citationIDs: ["cmqcc_concept"]),
            AttributedBullet("Postpartum eclampsia — can occur up to 6 weeks postpartum; educate on warning signs.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, acogConcept, cmqccConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - HELLP

public enum HELLPSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hellp-syndrome",
        title: "HELLP Syndrome",
        subtitle: "Hemolysis · Elevated Liver enzymes · Low Platelets",
        nclexTags: perfusionMatTags,
        definition: AttributedProse(
            "Severe variant of preeclampsia characterized by Hemolysis, Elevated Liver enzymes, and Low Platelets. Can occur with or without severe-range hypertension. High maternal/perinatal morbidity and mortality.",
            citationIDs: ["openrn_matnew", "acog_concept"]
        ),
        pathophysiology: AttributedProse(
            "Microangiopathic hemolytic anemia from endothelial damage in maternal small vessels; hepatic sinusoidal obstruction → periportal necrosis and elevated transaminases; platelet consumption from endothelial activation. May progress to hepatic hematoma or rupture.",
            citationIDs: ["openrn_matnew"]
        ),
        presentation: [
            AttributedBullet("Right upper quadrant or epigastric pain (often the presenting symptom).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Nausea, vomiting, malaise — often misdiagnosed as gastroenteritis or viral illness.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Headache, visual changes.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Hypertension may be absent or only mild — HELLP is NOT defined by BP.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Mucosal bleeding, easy bruising, IV-site oozing if thrombocytopenia advanced.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Jaundice in advanced disease.", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HEMOLYSIS: schistocytes on smear, LDH >600, total bilirubin ≥1.2, OR low haptoglobin.", citationIDs: ["acog_concept"]),
            AttributedBullet("ELEVATED LIVER ENZYMES: AST OR ALT ≥2× upper limit normal.", citationIDs: ["acog_concept"]),
            AttributedBullet("LOW PLATELETS: <100,000/μL.", citationIDs: ["acog_concept"]),
            AttributedBullet("Class 1 (severe): platelets ≤50K. Class 2: 50–100K. Class 3: 100–150K (partial).", citationIDs: ["openrn_matnew"])
        ],
        priorityAssessments: [
            AttributedBullet("Trend platelets, AST/ALT, LDH, bilirubin, haptoglobin every 4–6 hr.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Bleeding precautions; assess for petechiae, ecchymoses, mucosal bleeding.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("BP every 15–60 min; even normal-range BP can progress.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("RUQ palpation for tenderness and hepatic capsule tension; report any sudden severe pain (rupture).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Continuous fetal monitoring.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("DELIVERY is the definitive treatment regardless of gestational age once HELLP is diagnosed; cesarean often required.", citationIDs: ["acog_concept", "openrn_matnew"]),
            AttributedBullet("Magnesium sulfate seizure prophylaxis as in preeclampsia.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("BP control if severe-range.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Antenatal corticosteroids (betamethasone) for fetal lung maturity if 24–34 weeks.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Platelet transfusion for active bleeding or pre-cesarean if platelets <50K (per facility).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Avoid IM injections, NSAIDs.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("ICU-level care commonly required.", citationIDs: ["openrn_matnew"])
        ],
        watchFor: [
            AttributedBullet("HEPATIC HEMATOMA / RUPTURE — sudden severe RUQ or shoulder pain, hypotension, shock; surgical emergency.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("DIC.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Acute kidney injury, pulmonary edema.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Postpartum HELLP — can develop up to 7 days postpartum; symptoms may be missed at home.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, acogConcept, cmqccConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Postpartum Hemorrhage

public enum PostpartumHemorrhageDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "postpartum-hemorrhage",
        title: "Postpartum Hemorrhage (PPH)",
        subtitle: "≥1000 mL after delivery (any mode) or hemodynamic compromise",
        nclexTags: perfusionMatTags,
        definition: AttributedProse(
            "Cumulative blood loss of ≥1000 mL OR blood loss accompanied by signs/symptoms of hypovolemia within 24 hours of delivery (regardless of route — vaginal or cesarean). Leading cause of preventable maternal mortality worldwide. 'Late' PPH occurs from 24 hours to 12 weeks postpartum.",
            citationIDs: ["acog_concept", "openrn_matnew"]
        ),
        pathophysiology: AttributedProse(
            "Causes summarized by '4 Ts': TONE (uterine atony — 70–80% of cases), TRAUMA (laceration, hematoma, uterine inversion), TISSUE (retained placental fragments), THROMBIN (coagulopathy — including DIC, anticoagulant use, congenital).",
            citationIDs: ["openrn_matnew", "cmqcc_concept"]
        ),
        presentation: [
            AttributedBullet("Excessive vaginal bleeding (saturating peri-pad in <15 min, gushing, large clots).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Boggy uterus that does not firm with massage (atony — most common).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Tachycardia, hypotension, pallor, dizziness, anxiety, oliguria, altered mental status — late signs in pregnant patients (compensation).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Persistent bleeding with FIRM uterus → suspect laceration or retained tissue.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Concealed bleeding into hematoma — perineal/vaginal/retroperitoneal pain, hemodynamic deterioration without obvious external loss.", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Quantitative blood loss (QBL) ≥1000 mL within 24 hr OR hemodynamic compromise from blood loss.", citationIDs: ["acog_concept"]),
            AttributedBullet("Visual estimation chronically under-counts — use weighed pads, calibrated drapes.", citationIDs: ["cmqcc_concept"]),
            AttributedBullet("Stage 1: 500–999 mL · Stage 2: ≥1000 mL with vital sign changes · Stage 3: ≥1500 mL OR ≥2 units PRBCs given OR coagulopathy.", citationIDs: ["cmqcc_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Quantify blood loss continuously — weigh pads (1 g = 1 mL), graduated drape.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Vital signs every 5–15 min during active bleed.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Fundal assessment — boggy vs firm; midline vs deviated (full bladder).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Inspect perineum/vagina/cervix for lacerations.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Assess bladder — full bladder displaces uterus and impairs contraction; catheterize.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("CBC, coagulation panel, fibrinogen, type and crossmatch ≥2 units.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("FUNDAL MASSAGE — first-line for atony; bimanual compression if firm massage inadequate.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Empty bladder (straight cath or indwelling).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Two large-bore IVs; warmed crystalloid; type-specific or O-negative blood as needed.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("UTEROTONICS in stepwise order (per facility / CMQCC bundle): oxytocin (40 units in 1 L LR), then methylergonovine 0.2 mg IM (avoid in HTN), then carboprost (Hemabate) 250 mcg IM (avoid in asthma), then misoprostol 800–1000 mcg PR.", citationIDs: ["acog_concept", "openrn_matnew", "cmqcc_concept"]),
            AttributedBullet("Tranexamic acid (TXA) 1 g IV within 3 hours of onset of PPH (WOMAN trial).", citationIDs: ["acog_concept"]),
            AttributedBullet("Bakri balloon, uterine packing, B-Lynch suture, uterine artery embolization, hysterectomy as escalation.", citationIDs: ["acog_concept"]),
            AttributedBullet("Activate massive transfusion protocol (1:1:1 PRBC:FFP:platelets) for ongoing bleed.", citationIDs: ["cmqcc_concept"]),
            AttributedBullet("Replace fibrinogen with cryoprecipitate (target >200 mg/dL).", citationIDs: ["cmqcc_concept"])
        ],
        watchFor: [
            AttributedBullet("Hemorrhagic shock — early signs (tachycardia, narrowed pulse pressure) often subtle in young patients; act on trend.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("DIC — fibrinogen falls, oozing from IV sites, abnormal coagulation; cryoprecipitate, FFP.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Sheehan syndrome (pituitary infarction from severe hypotension) — postpartum hypopituitarism, lactation failure, amenorrhea.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Methylergonovine contraindicated in HTN/preeclampsia; carboprost in asthma; misoprostol fevers/chills common.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept, cmqccConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Placenta Previa

public enum PlacentaPreviaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "placenta-previa",
        title: "Placenta Previa",
        subtitle: "Placenta covers cervical os · painless bright-red bleeding",
        nclexTags: perfusionMatTags,
        definition: AttributedProse(
            "Placenta implants over or near the internal cervical os. Classified as complete (covers os) or marginal/low-lying. Diagnosed by ultrasound. Characterized by PAINLESS, bright-red vaginal bleeding in the second or third trimester.",
            citationIDs: ["openrn_matnew"]
        ),
        pathophysiology: AttributedProse(
            "Abnormal placental implantation in lower uterine segment. As lower segment thins and stretches in the third trimester, placental attachments tear → bleeding, often without preceding labor or trauma.",
            citationIDs: ["openrn_matnew"]
        ),
        presentation: [
            AttributedBullet("PAINLESS, bright-red vaginal bleeding (classic).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Bleeding episodes often in 2nd or 3rd trimester; first episode often resolves spontaneously.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Soft, non-tender uterus.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Fetal heart tones usually reassuring unless severe maternal hemorrhage.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Risk factors: prior cesarean, advanced maternal age, multiparity, smoking, prior previa, IVF.", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Transabdominal or transvaginal ultrasound (transvaginal is safe and more accurate).", citationIDs: ["acog_concept"]),
            AttributedBullet("DO NOT perform digital cervical exam — can cause catastrophic hemorrhage.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Often diagnosed incidentally on second-trimester anatomy ultrasound; many low-lying placentas resolve as uterus grows.", citationIDs: ["openrn_matnew"])
        ],
        priorityAssessments: [
            AttributedBullet("Quantify bleeding (pad weight); vital signs frequently.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Continuous fetal monitoring during active bleeding episode.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Type and screen on admission; type and crossmatch if bleeding active.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Assess uterine activity — contractions worsen bleeding.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Rh status — RhoGAM if Rh-negative and bleeding episode.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("NO digital cervical exam, NO sexual intercourse, NO vaginal anything until previa resolves or delivery.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Cesarean delivery is required for complete previa; planned at 36–37 weeks if stable.", citationIDs: ["acog_concept"]),
            AttributedBullet("Stable bleeding at <34 weeks: hospitalize, bed rest, betamethasone, possible tocolysis if contractions.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Severe ongoing bleeding or non-reassuring fetal status: emergent cesarean.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Two large-bore IVs, type and cross, blood available.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("RhoGAM if Rh-negative and any bleeding (even small amounts).", citationIDs: ["openrn_matnew"])
        ],
        watchFor: [
            AttributedBullet("Catastrophic hemorrhage with onset of labor or after digital exam — never do bimanual exam.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("PLACENTA ACCRETA SPECTRUM (accreta, increta, percreta) — much more common with previa + prior cesareans; massive PPH risk; multidisciplinary planning, possible hysterectomy.", citationIDs: ["acog_concept"]),
            AttributedBullet("Preterm delivery and complications.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Postpartum hemorrhage from poorly contractile lower segment.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Placental Abruption

public enum PlacentalAbruptionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "placental-abruption",
        title: "Placental Abruption",
        subtitle: "Premature separation of placenta · painful dark bleeding · DIC risk",
        nclexTags: perfusionMatTags,
        definition: AttributedProse(
            "Premature separation of a normally implanted placenta from the uterine wall after 20 weeks gestation. Spectrum from mild (small bleed) to catastrophic (complete separation with fetal demise and maternal DIC). Classic presentation: PAINFUL, dark-red vaginal bleeding with rigid, tender uterus.",
            citationIDs: ["openrn_matnew"]
        ),
        pathophysiology: AttributedProse(
            "Decidual hemorrhage → hematoma between placenta and uterine wall → progressive separation → loss of placental gas exchange. Concealed (retroplacental) bleeding into uterus may not appear vaginally. Released thromboplastin → DIC.",
            citationIDs: ["openrn_matnew"]
        ),
        presentation: [
            AttributedBullet("PAINFUL vaginal bleeding (dark red, often less than expected for severity — concealed).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Sudden, severe abdominal/back pain.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Rigid, tender, board-like uterus.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Frequent low-amplitude contractions or uterine tetany.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Non-reassuring fetal heart tones (late decelerations, bradycardia, loss of variability).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Hemodynamic compromise often DISPROPORTIONATE to visible bleeding (concealed).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Risk factors: hypertension/preeclampsia, cocaine/methamphetamine use, trauma (MVC, falls, IPV), smoking, prior abruption, multiparity, polyhydramnios with rapid amniotic decompression.", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL DIAGNOSIS — ultrasound is INSENSITIVE (only 25–50% detected; absence does not exclude).", citationIDs: ["acog_concept"]),
            AttributedBullet("CBC, fibrinogen, INR/PTT, type & cross, Kleihauer-Betke (fetal-maternal hemorrhage).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Falling fibrinogen <200 mg/dL is highly suggestive.", citationIDs: ["openrn_matnew"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous fetal monitoring; vital signs every 5–15 min.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Quantify bleeding, but recognize concealed bleeding can be massive.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Trend Hgb, fibrinogen, platelets, INR/PTT.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Assess for DIC — petechiae, ecchymoses, IV-site oozing.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("Two large-bore IVs; aggressive crystalloid, type-specific or O-negative blood.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Lateral position (left lateral) for venous return and uteroplacental flow.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Continuous oxygen via NRB.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Foley to monitor strict I&O.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("EMERGENT CESAREAN if non-reassuring fetal status, severe maternal compromise, or significant ongoing bleed.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Vaginal delivery may be appropriate if mild abruption, mother and fetus stable, labor progresses rapidly.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Treat DIC with FFP, cryoprecipitate, platelets per labs.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("RhoGAM if Rh-negative.", citationIDs: ["openrn_matnew"])
        ],
        watchFor: [
            AttributedBullet("DIC — develops rapidly (within hours); leading cause of maternal mortality from abruption.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Fetal demise.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Couvelaire uterus — extravasation of blood into myometrium; uterus appears purple/blue, may not contract well; post-delivery PPH risk.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Acute kidney injury from hypovolemia.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Sheehan syndrome.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Trauma history — screen for intimate partner violence; abruption can occur 24–48 hr after blunt trauma even if initial assessment normal.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Gestational Diabetes

public enum GestationalDiabetesSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "gestational-diabetes",
        title: "Gestational Diabetes Mellitus (GDM)",
        subtitle: "Glucose intolerance with onset/recognition during pregnancy",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .glucoseRegulation),
        definition: AttributedProse(
            "Carbohydrate intolerance of variable severity with onset or first recognition during pregnancy. Distinct from pre-gestational diabetes (T1DM or T2DM diagnosed prior to pregnancy). Resolves postpartum but increases lifetime maternal T2DM risk and offspring metabolic risk.",
            citationIDs: ["acog_concept", "openrn_matnew"]
        ),
        pathophysiology: AttributedProse(
            "Placental hormones (human placental lactogen, cortisol, progesterone) cause progressive insulin resistance after 20 weeks. In susceptible patients, pancreatic β-cells cannot meet increased insulin demand → hyperglycemia.",
            citationIDs: ["openrn_matnew"]
        ),
        presentation: [
            AttributedBullet("Often ASYMPTOMATIC — diagnosis by routine screening at 24–28 weeks.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Earlier screening at first prenatal visit if risk factors: BMI ≥30, prior GDM, prior macrosomic infant, family history, certain ethnicities (Hispanic, African American, Native American, Asian American, Pacific Islander), PCOS, age ≥35.", citationIDs: ["acog_concept"]),
            AttributedBullet("Polyuria, polydipsia, polyphagia (uncommon — usually subclinical).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Macrosomia, polyhydramnios on ultrasound.", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Two-step: 50 g 1-hr glucose challenge ≥130–140 (varies); if positive, 100 g 3-hr OGTT — diagnose if ≥2 abnormal values (Carpenter-Coustan: fasting ≥95, 1 hr ≥180, 2 hr ≥155, 3 hr ≥140).", citationIDs: ["acog_concept"]),
            AttributedBullet("One-step: 75 g 2-hr OGTT — diagnose if ≥1 abnormal value (fasting ≥92, 1 hr ≥180, 2 hr ≥153).", citationIDs: ["acog_concept"]),
            AttributedBullet("HbA1c not recommended for diagnosis during pregnancy.", citationIDs: ["acog_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Self-monitoring of blood glucose (SMBG) — fasting + 1- or 2-hr postprandial 4× daily.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Targets: fasting <95 mg/dL · 1-hr postprandial <140 · 2-hr postprandial <120.", citationIDs: ["acog_concept"]),
            AttributedBullet("Fetal surveillance — serial growth ultrasounds, antenatal testing (NST, BPP) starting 32–34 weeks.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Assess weight gain — appropriate per pre-pregnancy BMI.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("FIRST-LINE: medical nutrition therapy + activity; refer to dietitian.", citationIDs: ["acog_concept"]),
            AttributedBullet("Carbohydrate distribution: 3 meals + 2–3 snacks; 33–40% of total calories from complex carbs.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Daily moderate physical activity (e.g., brisk walking after meals).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("If targets not met in 1–2 weeks: pharmacotherapy. INSULIN is preferred (does not cross placenta).", citationIDs: ["acog_concept"]),
            AttributedBullet("Metformin or glyburide are alternatives (cross placenta to varying degrees; debated long-term effects).", citationIDs: ["acog_concept"]),
            AttributedBullet("Delivery timing — generally 39–40 weeks if well-controlled on diet; 39 weeks if on medication; earlier if poor control or fetal concerns.", citationIDs: ["acog_concept"]),
            AttributedBullet("Postpartum: stop medication, recheck 75 g 2-hr OGTT at 4–12 weeks; lifelong T2DM screening every 1–3 years.", citationIDs: ["acog_concept"])
        ],
        watchFor: [
            AttributedBullet("Macrosomia → shoulder dystocia, birth trauma, cesarean.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Neonatal hypoglycemia — fetal hyperinsulinemia continues briefly after cord clamp; check glucose hourly until stable.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Preeclampsia, polyhydramnios, preterm delivery, stillbirth (uncontrolled).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Maternal lifetime T2DM risk ~50%; cardiovascular risk increased.", citationIDs: ["acog_concept"]),
            AttributedBullet("Recurrence in subsequent pregnancies common.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Preterm Labor

public enum PretermLaborSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "preterm-labor",
        title: "Preterm Labor",
        subtitle: "Regular contractions + cervical change at 20 0/7 to 36 6/7 weeks",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        definition: AttributedProse(
            "Regular uterine contractions accompanied by cervical change (dilation, effacement) between 20 0/7 and 36 6/7 weeks gestation. Preterm birth (<37 weeks) is the leading cause of neonatal morbidity and mortality.",
            citationIDs: ["openrn_matnew", "acog_concept"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — infection/inflammation (subclinical chorioamnionitis), uterine overdistention (multiples, polyhydramnios), maternal stress, vascular disease (preeclampsia, abruption), cervical insufficiency. Final common pathway is activation of the parturition cascade.",
            citationIDs: ["openrn_matnew"]
        ),
        presentation: [
            AttributedBullet("Regular contractions (≥4–6 in 60 minutes) often painless or felt as menstrual-like cramps.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Pelvic pressure or back pain.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Increased vaginal discharge or vaginal bleeding/spotting.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Rupture of membranes (gush or trickle of fluid).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Cervical change on exam (dilation and/or effacement).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Risk factors: prior preterm birth (strongest), short cervix on ultrasound, multiple gestation, infection, smoking, substance use, low BMI, short interpregnancy interval.", citationIDs: ["acog_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Persistent contractions PLUS cervical change — both required for diagnosis.", citationIDs: ["acog_concept"]),
            AttributedBullet("Transvaginal cervical length <25 mm increases risk.", citationIDs: ["acog_concept"]),
            AttributedBullet("Fetal fibronectin (fFN) negative test has high negative predictive value (unlikely to deliver in 7–14 days).", citationIDs: ["acog_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous fetal monitoring and tocodynamometry.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Speculum exam (sterile) for ROM, cervical change, infection signs; AVOID digital exam if PPROM suspected.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Group B strep status and culture if not yet done.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("UA/culture, screen for bacterial vaginosis, STIs.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Assess hydration; dehydration can cause contractions (uterine irritability).", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("ANTENATAL CORTICOSTEROIDS: betamethasone 12 mg IM × 2 doses 24 hr apart (or dexamethasone 6 mg IM × 4 doses every 12 hr) for fetal lung maturation if 24 0/7 to 33 6/7 weeks (consider 34–36 6/7 weeks if delivery imminent and not previously given).", citationIDs: ["acog_concept"]),
            AttributedBullet("MAGNESIUM SULFATE for fetal neuroprotection if <32 weeks (reduces cerebral palsy risk).", citationIDs: ["acog_concept"]),
            AttributedBullet("TOCOLYSIS to delay delivery 48 hours (allow steroids to work, transfer to higher-acuity facility): nifedipine, indomethacin (<32 weeks only — closes ductus arteriosus), terbutaline (short-term).", citationIDs: ["acog_concept"]),
            AttributedBullet("AVOID tocolysis if: severe preeclampsia, abruption, chorioamnionitis, fetal demise, lethal anomaly, non-reassuring fetal status, advanced labor (cervix ≥4 cm).", citationIDs: ["acog_concept"]),
            AttributedBullet("GBS antibiotic prophylaxis if delivery is imminent (penicillin G first-line, cefazolin or clindamycin/vancomycin if penicillin allergy).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("IV hydration (small bolus); left lateral position.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Notify NICU team; transfer to facility with appropriate level of NICU.", citationIDs: ["openrn_matnew"])
        ],
        watchFor: [
            AttributedBullet("Magnesium toxicity — DTRs, RR, urine output; calcium gluconate antidote.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Tocolytic side effects: nifedipine (hypotension), terbutaline (tachycardia, hyperglycemia, pulmonary edema with prolonged use), indomethacin (oligohydramnios, premature DA closure).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Chorioamnionitis — fever, fundal tenderness, foul discharge, fetal tachycardia; broad-spectrum antibiotics + delivery.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Neonatal complications — RDS, IVH, NEC, sepsis, retinopathy of prematurity, long-term neurodevelopmental.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hyperemesis Gravidarum

public enum HyperemesisGravidarumSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hyperemesis-gravidarum",
        title: "Hyperemesis Gravidarum",
        subtitle: "Severe nausea and vomiting of pregnancy with weight loss and dehydration",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition),
        definition: AttributedProse(
            "Severe form of nausea and vomiting of pregnancy (NVP) characterized by persistent vomiting, weight loss >5% of pre-pregnancy weight, dehydration, and electrolyte/acid-base derangement. Distinguished from typical morning sickness by severity and physiologic impact.",
            citationIDs: ["openrn_matnew", "acog_concept"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — peak hCG levels (worst around 9–10 weeks; usually resolves by 16–20 weeks), estrogen, slowed gastric motility, genetic predisposition. Markedly elevated hCG in molar pregnancy or multiple gestation predicts higher risk.",
            citationIDs: ["openrn_matnew"]
        ),
        presentation: [
            AttributedBullet("Persistent vomiting (often unable to keep liquids down).", citationIDs: ["openrn_matnew"]),
            AttributedBullet(">5% pre-pregnancy weight loss.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Dehydration: dry mucous membranes, tachycardia, oliguria, ketonuria, elevated specific gravity.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Electrolyte derangement — hypokalemia, hypochloremic metabolic alkalosis from vomiting; hypoNa.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Ketones in urine.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Mild transaminase elevation, mild hyperthyroidism (hCG cross-reactivity with TSH receptor).", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — diagnosis of exclusion after ruling out other causes (gastroenteritis, hepatitis, pyelonephritis, biliary disease, appendicitis, DKA, molar pregnancy).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("UA, BMP, LFTs, TSH, lipase as indicated.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Pelvic ultrasound to confirm intrauterine pregnancy and rule out multiples / molar.", citationIDs: ["openrn_matnew"])
        ],
        priorityAssessments: [
            AttributedBullet("Hydration — vital signs, mucous membranes, skin turgor, urine output.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Daily weights.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Strict I&O including emesis quantification.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Electrolytes, urine ketones, fetal heart tones.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("IV fluids (LR or NS) for rehydration; thiamine supplementation BEFORE dextrose to prevent Wernicke encephalopathy.", citationIDs: ["openrn_matnew", "acog_concept"]),
            AttributedBullet("Replace potassium and other electrolytes per labs.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("ANTIEMETICS (stepwise): pyridoxine (B6) 10–25 mg PO q6–8h ± doxylamine 12.5 mg PO bedtime (Diclegis); add ondansetron 4–8 mg PO/IV q8h or promethazine 12.5–25 mg PO/PR/IV q4–6h; metoclopramide; methylprednisolone for refractory cases.", citationIDs: ["acog_concept"]),
            AttributedBullet("Small frequent meals; bland diet; avoid triggers (smells, fatty foods); ginger.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Severe / refractory: enteral feeding (NG/NJ tube) or rarely TPN.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Acupressure wristbands (Sea-Bands), psychological support, time off work.", citationIDs: ["openrn_matnew"])
        ],
        watchFor: [
            AttributedBullet("Wernicke encephalopathy from thiamine deficiency — irreversible if missed; ALWAYS give thiamine before glucose-containing IVF.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Mallory-Weiss tear from forceful vomiting — hematemesis.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Esophageal rupture, pneumothorax — rare but possible.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Acute kidney injury, electrolyte derangement leading to arrhythmia.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Maternal psychological distress, depression — screen and support.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - PROM / PPROM

public enum PROMSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "prom-pprom",
        title: "Premature Rupture of Membranes (PROM / PPROM)",
        subtitle: "Membranes rupture before labor onset · before 37 weeks = PPROM",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection),
        definition: AttributedProse(
            "Rupture of fetal membranes before the onset of labor. PROM = at term (≥37 weeks); PPROM = preterm (<37 weeks). PPROM is associated with chorioamnionitis, preterm delivery, cord prolapse, and neonatal sepsis.",
            citationIDs: ["openrn_matnew"]
        ),
        pathophysiology: AttributedProse(
            "Loss of membrane integrity from infection (most common in PPROM), inflammation, prior PROM, smoking, polyhydramnios, multiple gestation, cervical insufficiency, abruption, or trauma.",
            citationIDs: ["openrn_matnew"]
        ),
        presentation: [
            AttributedBullet("Sudden gush or persistent trickle of fluid from vagina.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Pooling of fluid in posterior vaginal fornix on speculum exam.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Differentiate from urine, vaginal discharge, semen.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Risk factors: prior PROM/PPROM, ascending infection, smoking, low BMI, vitamin C/copper deficiency.", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("STERILE SPECULUM exam: pooling, positive nitrazine test (turns blue — pH >6.5; amniotic fluid is alkaline, vaginal secretions acidic), positive ferning (microscopic crystallization).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Commercial assays (AmniSure, ROM Plus) for ambiguous cases.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("AVOID DIGITAL EXAM if PPROM suspected — increases infection risk and shortens latency.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Ultrasound — oligohydramnios supports diagnosis but does not exclude.", citationIDs: ["openrn_matnew"])
        ],
        priorityAssessments: [
            AttributedBullet("Confirm gestational age; assess fetal presentation, lie, station.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Continuous fetal monitoring and uterine activity.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Maternal vitals every 4 hr — fever, tachycardia suggest chorioamnionitis.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Assess fluid color (clear vs meconium, blood-tinged), odor (foul = infection).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Daily CBC, monitor for fetal tachycardia and uterine tenderness.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("GBS culture, UA/culture.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("Term PROM: induction of labor (oxytocin) generally preferred over expectant management — reduces chorioamnionitis.", citationIDs: ["acog_concept"]),
            AttributedBullet("PPROM 34–36 6/7 weeks: deliver vs expectant management individualized.", citationIDs: ["acog_concept"]),
            AttributedBullet("PPROM <34 weeks: expectant management with antibiotics (ampicillin + erythromycin or azithromycin × 7 days), antenatal corticosteroids, magnesium for neuroprotection if <32 weeks.", citationIDs: ["acog_concept"]),
            AttributedBullet("GBS prophylaxis if positive or unknown and labor.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Avoid digital exam unless delivery imminent.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Bed rest controversial; pelvic rest.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Educate to monitor for fever, foul discharge, decreased fetal movement, contractions, bleeding.", citationIDs: ["openrn_matnew"])
        ],
        watchFor: [
            AttributedBullet("CHORIOAMNIONITIS — fever, tachycardia, foul discharge, uterine tenderness, fetal tachycardia → broad-spectrum antibiotics + delivery regardless of gestational age.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("CORD PROLAPSE — fetal heart deceleration immediately after ROM, especially with non-engaged presenting part; manual elevation of presenting part, knee-chest or Trendelenburg position, emergent cesarean.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Placental abruption.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Preterm delivery and complications.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Neonatal sepsis, pulmonary hypoplasia (with prolonged severe oligohydramnios).", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Chorioamnionitis

public enum ChorioamnionitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "chorioamnionitis",
        title: "Chorioamnionitis (Intraamniotic Infection)",
        subtitle: "Intrapartum or PPROM-related infection of membranes/fetus",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection),
        definition: AttributedProse(
            "Acute inflammation/infection of the chorion, amnion, and amniotic fluid, typically from ascending bacterial infection. Strongly associated with PROM/PPROM, prolonged labor, multiple cervical exams, GBS colonization.",
            citationIDs: ["openrn_matnew"]
        ),
        pathophysiology: AttributedProse(
            "Polymicrobial — typically GBS, E. coli, anaerobes from vaginal flora ascending after membrane rupture or invasive procedures. Can cause fetal infection (sepsis, pneumonia), neonatal CNS injury, and maternal sepsis.",
            citationIDs: ["openrn_matnew"]
        ),
        presentation: [
            AttributedBullet("Maternal fever ≥39.0°C OR 38.0–38.9°C plus another sign.", citationIDs: ["openrn_matnew", "acog_concept"]),
            AttributedBullet("Maternal tachycardia >100.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Fetal tachycardia >160 (often the FIRST sign).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Fundal/uterine tenderness.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Foul-smelling or purulent amniotic fluid.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Maternal leukocytosis >15K (in absence of steroids).", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ACOG: maternal fever ≥39.0°C alone OR 38.0–38.9°C + ≥1 (fetal tachycardia, maternal WBC >15K, purulent cervical discharge).", citationIDs: ["acog_concept"]),
            AttributedBullet("Amniocentesis (rare in active labor) — Gram stain, glucose <15, WBC, culture for confirmation in atypical cases.", citationIDs: ["openrn_matnew"])
        ],
        priorityAssessments: [
            AttributedBullet("Maternal vitals every 1 hr; fetal monitoring continuous.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Assess for sepsis criteria (MEWS, qSOFA).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Quantify fluid character (foul, purulent).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Notify pediatrics/NICU for delivery preparation.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("BROAD-SPECTRUM ANTIBIOTICS — ampicillin 2 g IV q6h + gentamicin 2 mg/kg IV load then 1.5 mg/kg q8h (or 5 mg/kg daily). Add clindamycin or metronidazole post-delivery if cesarean for anaerobic coverage.", citationIDs: ["acog_concept"]),
            AttributedBullet("DELIVERY — chorioamnionitis is delivery indication; do NOT delay for steroids if mature; expedite labor with oxytocin if appropriate.", citationIDs: ["acog_concept"]),
            AttributedBullet("Antipyretic for maternal fever (acetaminophen).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Hydration, oxygen, position changes for non-reassuring fetal tracing.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Pediatric/NICU at delivery — assess and treat neonate.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Continue antibiotics postpartum until afebrile 24–48 hr.", citationIDs: ["acog_concept"])
        ],
        watchFor: [
            AttributedBullet("Maternal sepsis, septic shock — leading obstetric ICU admission.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Postpartum endometritis.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Postpartum hemorrhage from atony (infected uterus contracts poorly).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Neonatal sepsis, pneumonia, meningitis, long-term neurodevelopmental effects.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Cesarean wound infection, abscess, septic pelvic thrombophlebitis.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Postpartum Depression

public enum PostpartumDepressionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "postpartum-depression",
        title: "Postpartum Depression (PPD)",
        subtitle: "Major depressive episode with peripartum onset · screen all patients",
        nclexTags: psychMatTags,
        definition: AttributedProse(
            "Major depressive episode with onset during pregnancy or within 4 weeks postpartum (DSM-5; clinically up to 12 months). Distinct from 'baby blues' (transient, peaks day 4–5, resolves by 2 weeks) and from postpartum psychosis (rare, severe, psychiatric emergency).",
            citationIDs: ["openrn_matnew", "acog_concept"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — abrupt postpartum hormone shifts (estrogen, progesterone, thyroid), sleep deprivation, psychosocial stressors, prior history of depression/anxiety, lack of support, breastfeeding difficulties, traumatic birth, NICU admission.",
            citationIDs: ["openrn_matnew"]
        ),
        presentation: [
            AttributedBullet("Persistent sad, empty, hopeless mood.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Anhedonia.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Sleep disturbance (beyond newborn-related), appetite change, fatigue.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Difficulty bonding with infant; intrusive thoughts about harming infant or self (do not assume act-on intent — but assess).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Excessive worry, irritability, guilt, feelings of inadequacy as a parent.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Tearfulness; difficulty concentrating.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Suicidal ideation.", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DSM-5 major depressive episode + peripartum onset specifier.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Edinburgh Postnatal Depression Scale (EPDS) — most validated screening tool; score ≥10 warrants further evaluation, ≥13 strongly suggestive of depression, item 10 (self-harm) requires immediate assessment.", citationIDs: ["acog_concept"]),
            AttributedBullet("PHQ-9 also commonly used.", citationIDs: ["acog_concept"]),
            AttributedBullet("Routine screening at least once during pregnancy and at postpartum visits (ACOG, USPSTF).", citationIDs: ["acog_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("EPDS or PHQ-9 every postpartum visit through first year.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Suicide risk assessment with any positive screen — direct, non-judgmental questioning.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Assess infant safety — intrusive thoughts about harming infant warrant immediate psych evaluation.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Screen for thyroid dysfunction (postpartum thyroiditis can mimic depression).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Assess support system — partner, family, community resources.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("Psychotherapy — CBT, interpersonal therapy first-line for mild-moderate.", citationIDs: ["acog_concept"]),
            AttributedBullet("Pharmacotherapy — SSRIs (sertraline often first-line; lactation-compatible); zuranolone (FDA-approved 2023, PO 14-day course); brexanolone (IV).", citationIDs: ["acog_concept"]),
            AttributedBullet("Combination therapy for moderate-severe disease.", citationIDs: ["acog_concept"]),
            AttributedBullet("Refer to perinatal mental health specialist when available.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Sleep hygiene, partner/support involvement, postpartum doula.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Breastfeeding support — difficulties exacerbate; lactation consultation.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Suicide safety planning; remove means of self-harm; emergency contact (988 Suicide & Crisis Lifeline).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Hospitalize for active suicidal ideation, psychosis, or inability to care for self/infant.", citationIDs: ["openrn_matnew"])
        ],
        watchFor: [
            AttributedBullet("POSTPARTUM PSYCHOSIS — onset typically days 1–4 postpartum; hallucinations, delusions (often involving infant), bizarre behavior; psychiatric EMERGENCY with high risk of infanticide and suicide; immediate hospitalization.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Maternal suicide is a leading cause of perinatal mortality.", citationIDs: ["acog_concept"]),
            AttributedBullet("Untreated PPD impacts infant attachment, cognitive and emotional development.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Recurrence risk in subsequent pregnancies — proactive screening and prophylactic treatment may be appropriate.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Partner postpartum depression — affects 8–10% of fathers/partners; screen as well.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ectopic Pregnancy

public enum EctopicPregnancySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ectopic-pregnancy",
        title: "Ectopic Pregnancy",
        subtitle: "Implantation outside uterine cavity · ruptured ectopic = surgical emergency",
        nclexTags: perfusionMatTags,
        definition: AttributedProse(
            "Implantation of a fertilized ovum outside the uterine cavity. Most common site is fallopian tube (~95%). Cannot result in viable pregnancy. Ruptured ectopic causes hemoperitoneum and is a leading cause of first-trimester maternal death.",
            citationIDs: ["openrn_matnew", "acog_concept"]
        ),
        pathophysiology: AttributedProse(
            "Damaged or scarred fallopian tube (prior salpingitis from PID/Chlamydia, prior ectopic, tubal surgery, IVF) impairs ovum transport → implantation in tube. Trophoblastic invasion erodes tubal wall → tubal rupture and hemoperitoneum.",
            citationIDs: ["openrn_matnew"]
        ),
        presentation: [
            AttributedBullet("Classic triad: amenorrhea + abdominal pain + vaginal bleeding (only ~50% have all three).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Pelvic or unilateral lower abdominal pain.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Light vaginal bleeding/spotting.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Positive pregnancy test.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("RUPTURED: severe abdominal pain, shoulder pain (referred from diaphragmatic blood irritation — Kehr sign), syncope, hypotension, peritoneal signs, hemodynamic shock.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Risk factors: prior ectopic (10× risk), prior PID, tubal surgery, IUD in place (rare but if pregnancy occurs, more likely ectopic), IVF, smoking.", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Quantitative β-hCG — typically lower than expected for gestational age and rises slowly (<53% in 48 hr) or plateaus.", citationIDs: ["acog_concept"]),
            AttributedBullet("Transvaginal ultrasound — discriminatory zone: at hCG ≥3500, intrauterine pregnancy should be visible; absence with positive hCG suggests ectopic or non-viable.", citationIDs: ["acog_concept"]),
            AttributedBullet("Adnexal mass or free fluid in cul-de-sac on ultrasound supports ectopic.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Heterotopic pregnancy (intrauterine + ectopic concurrently) is rare but increased with IVF.", citationIDs: ["openrn_matnew"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs frequently — hemodynamic instability is rupture until proven otherwise.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Pain assessment, location, severity, radiation.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Abdominal exam — peritoneal signs (rebound, guarding).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("CBC, type and screen, β-hCG, BMP.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Rh status — RhoGAM if Rh-negative.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("HEMODYNAMICALLY UNSTABLE / RUPTURED: emergency surgery (laparoscopic salpingectomy or salpingostomy); two large-bore IVs, blood products.", citationIDs: ["acog_concept"]),
            AttributedBullet("STABLE, small (<3.5 cm), no fetal cardiac activity, hCG <5000: medical management with single-dose methotrexate IM 50 mg/m² with serial hCG follow-up (day 4 and 7 — 15% drop expected).", citationIDs: ["acog_concept"]),
            AttributedBullet("Avoid NSAIDs, alcohol, folic acid, sun exposure during methotrexate therapy.", citationIDs: ["acog_concept"]),
            AttributedBullet("Counsel: any ectopic increases recurrence risk in future pregnancies; early hCG and ultrasound in next pregnancy.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Emotional support — pregnancy loss; offer counseling.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("RhoGAM if Rh-negative.", citationIDs: ["openrn_matnew"])
        ],
        watchFor: [
            AttributedBullet("RUPTURE — sudden severe pain, syncope, hemodynamic collapse; OR EMERGENCY.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Methotrexate failure — rising or plateauing hCG after treatment; surgery.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Future fertility implications and recurrence risk (~10–20%).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Persistent ectopic after salpingostomy — incomplete removal of trophoblastic tissue; trend hCG postoperatively.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Spontaneous Abortion (Miscarriage)

public enum SpontaneousAbortionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "spontaneous-abortion",
        title: "Spontaneous Abortion (Miscarriage)",
        subtitle: "Pregnancy loss before 20 weeks · types: threatened, inevitable, incomplete, complete, missed",
        nclexTags: perfusionMatTags,
        definition: AttributedProse(
            "Pregnancy loss before 20 weeks gestation (definition varies by source; some use 24 weeks). Occurs in approximately 10–20% of clinically recognized pregnancies; many more occur before recognition. Most common cause is chromosomal abnormality.",
            citationIDs: ["openrn_matnew", "acog_concept"]
        ),
        pathophysiology: AttributedProse(
            "Most first-trimester losses due to chromosomal abnormalities (50–60%). Other causes: maternal medical conditions (uncontrolled diabetes, thyroid disease, antiphospholipid syndrome), uterine anomalies, infections, environmental exposures. Recurrent loss (≥2–3) warrants workup.",
            citationIDs: ["openrn_matnew"]
        ),
        presentation: [
            AttributedBullet("Vaginal bleeding (any in early pregnancy warrants evaluation).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Cramping, low abdominal/pelvic pain.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Loss of pregnancy symptoms (nausea, breast tenderness).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Passage of tissue.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("TYPES: Threatened (bleeding, closed cervix, viable); Inevitable (open cervix, products not yet passed); Incomplete (some products passed); Complete (all products passed); Missed (fetal demise without bleeding/passage); Septic (infection in retained products).", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Quantitative β-hCG — falling or plateauing in non-viable.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Transvaginal ultrasound — assess for fetal cardiac activity, gestational sac viability.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Sterile speculum — assess cervix open vs closed; visualize tissue if any.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("CBC, type and screen.", citationIDs: ["openrn_matnew"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs, bleeding quantification (saturated peri-pad in <1 hr is excessive).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Pain assessment.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Emotional state — pregnancy loss is grief; assess support, coping.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Rh status.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("Threatened — pelvic rest, follow-up; majority of viable pregnancies continue.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Inevitable/incomplete/missed — three options: expectant management (allow natural completion over weeks), medical management (misoprostol), or surgical (D&C, manual vacuum aspiration). Patient choice is appropriate when stable.", citationIDs: ["acog_concept"]),
            AttributedBullet("Heavy bleeding or hemodynamic instability — IV fluids, surgical management, possibly transfusion.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Septic abortion — IV antibiotics + urgent uterine evacuation.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("RhoGAM if Rh-negative (300 mcg IM within 72 hours).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Pain management — NSAIDs (after Rh assessment), opioids if severe.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Emotional support — acknowledge grief; offer counseling, support groups; don't minimize.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Address mistaken beliefs — most miscarriages are NOT caused by anything the patient did.", citationIDs: ["openrn_matnew"])
        ],
        watchFor: [
            AttributedBullet("Hemorrhagic shock from massive bleeding (rare; more common in later losses or molar).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Infection (septic abortion) — fever, foul discharge, severe pain.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Retained products of conception → ongoing bleeding, infection.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Recurrent pregnancy loss (≥2–3) — workup for thrombophilia, thyroid, uterine anomaly, parental karyotype.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Significant emotional/psychological impact — depression, anxiety, complicated grief; screen.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Subsequent pregnancy — most patients have successful pregnancy after a single loss; emotional support remains important.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Group B Streptococcus

public enum GroupBStrepSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "group-b-strep",
        title: "Group B Streptococcus (GBS) in Pregnancy",
        subtitle: "Universal screen 36 0/7 – 37 6/7 weeks · IAP for positive or unknown",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .infection),
        definition: AttributedProse(
            "Streptococcus agalactiae colonization of the vagina/rectum, present in 10–30% of pregnant patients. Vertical transmission to neonate during delivery causes neonatal early-onset GBS sepsis (the leading cause of neonatal bacterial infection in the U.S. before universal screening).",
            citationIDs: ["cdc_repro", "openrn_matnew"]
        ),
        pathophysiology: AttributedProse(
            "Maternal colonization without symptoms; ascending infection during labor or transmission during vaginal birth → neonatal pneumonia, sepsis, meningitis. Intrapartum antibiotic prophylaxis (IAP) markedly reduces neonatal disease.",
            citationIDs: ["cdc_repro"]
        ),
        presentation: [
            AttributedBullet("Maternal colonization is ASYMPTOMATIC.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("UTI or chorioamnionitis from GBS may occur.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Neonatal early-onset GBS (within 7 days; usually 24 hr): sepsis, pneumonia, meningitis — respiratory distress, temperature instability, lethargy, poor feeding.", citationIDs: ["openrn_matnew"])
        ],
        diagnosticCriteria: [
            AttributedBullet("UNIVERSAL SCREENING — vaginal-rectal culture at 36 0/7 to 37 6/7 weeks gestation; results valid for 5 weeks.", citationIDs: ["acog_concept"]),
            AttributedBullet("GBS bacteriuria at any concentration during current pregnancy = treat and IAP at delivery; no need to repeat culture.", citationIDs: ["acog_concept"]),
            AttributedBullet("Prior infant with invasive GBS disease = IAP regardless of current screen.", citationIDs: ["acog_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Verify GBS status on admission for labor; if unknown, treat empirically per risk factors.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Allergy history — affects choice of antibiotic.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Time first dose to delivery — at least 4 hours before delivery for optimal protection.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Notify pediatrics/nursery of GBS status and adequacy of prophylaxis.", citationIDs: ["openrn_matnew"])
        ],
        commonInterventions: [
            AttributedBullet("INTRAPARTUM ANTIBIOTIC PROPHYLAXIS (IAP) for: positive GBS culture, unknown status with risk factors (preterm <37 wk, ROM ≥18 hr, intrapartum fever), GBS bacteriuria current pregnancy, prior GBS-affected infant.", citationIDs: ["acog_concept", "cdc_repro"]),
            AttributedBullet("FIRST-LINE: Penicillin G 5 million units IV loading then 2.5–3 million units IV q4h until delivery.", citationIDs: ["acog_concept"]),
            AttributedBullet("Alternative if low-risk penicillin allergy (rash only): Cefazolin 2 g IV load, then 1 g IV q8h.", citationIDs: ["acog_concept"]),
            AttributedBullet("If high-risk penicillin allergy AND GBS susceptible: Clindamycin 900 mg IV q8h.", citationIDs: ["acog_concept"]),
            AttributedBullet("If high-risk allergy AND GBS resistant or unknown susceptibility: Vancomycin 20 mg/kg IV q8h (max 2 g/dose).", citationIDs: ["acog_concept"]),
            AttributedBullet("Adequate IAP = ≥1 dose of recommended antibiotic given ≥4 hours before delivery.", citationIDs: ["acog_concept"]),
            AttributedBullet("Cesarean BEFORE labor with intact membranes does NOT require IAP regardless of GBS status.", citationIDs: ["acog_concept"])
        ],
        watchFor: [
            AttributedBullet("Inadequate IAP (<4 hours before delivery, missed doses) → enhanced neonatal observation and possible neonatal antibiotics per pediatric protocol.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Anaphylaxis to penicillin — clarify allergy history carefully (true IgE-mediated vs intolerance/rash).", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Late-onset GBS (7 days–3 months) is not prevented by IAP — counsel parents on signs of neonatal infection.", citationIDs: ["openrn_matnew"]),
            AttributedBullet("Maternal GBS UTI symptoms outside of pregnancy don't usually require treatment in non-pregnant adults.", citationIDs: ["openrn_matnew"])
        ],
        citations: [openrnMatNew, openstaxMatNew, acogConcept, cdcRepro],
        lastSourceFidelityReview: "2026-05-04"
    )
}
